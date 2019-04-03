Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD087D231
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 13:18:31 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id h18so8226438wml.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 06:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sbn4BKRWS4htYcIzYxmFD8jmqR5CO+doOupc5oJi7nM=;
	b=Rp3n7fsteYzsTuaJuiuwRFsXXJmtWS0j2pGpHwCNybvPP2wiWxofv1ccLr6Ejtd9oo
	R2TogA3xI2s8JC7Y0Q0JcdJl96sXMCWpbFuX4UnKs+sO1R9Ha+UtUr0ynJGzCB5WUsg9
	LCVIcyoS9lIdhSVQR5hdYdWW3iGbGYAFAssDjQQakoxfMJATF33Y4m9h0oKHuXGlDMIr
	FCcBgKsJ06c5JvNq/bBanmF0Fe/GfzmmcztXlgUxeJGNno+axZoGdCt8nnqhNC82MMtI
	EKMgKdlkdH5rpGXyP3SZlkvyb+8It52hCidY6Tax1FFJ6xxEkBUN41o4l/P+R/jVgf1G
	D25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=sbn4BKRWS4htYcIzYxmFD8jmqR5CO+doOupc5oJi7nM=;
	b=ZX/Y1ivs/SMP7vG5cQBKy9hL6Mf+DQErs6yELir5ZanqMjdRWv34VQbPohqjWJDyvg
	mD6O/24o3gdFvgJfj69mL1/SaDekkZ0qZ6w8ptAMyiiDPGXN7ZSXcpYUlMjldDzqe5mi
	eL4I3jBidj4NXQQ2631tuTjjrYnR6kVlHunutS7Mr42ruxXJPDWlmJLjIttkvjEhlrnY
	KnBQZVV2sO3yqjO+wlfYocHql0VbhAMMg0D9WgnuJW73n7CaLMalUybW3pUT9kjeruBX
	mnKDL6J2OMhhbc+j7ZMevZVxUHbwMWar4eDk1Tz6QGk0cM5m4oRT5ndMOwfi8Xb53nxW
	IbSg==
X-Gm-Message-State: APjAAAX5HTkROoLiquA88jd2k3D9ZoXvbIX7MrO6e0mLP04mRRs7M3ah
	GPIQiBJnoUiAVMzDoltOKm5NVMACzIc=
X-Google-Smtp-Source: APXvYqzA7hQq9khCJjW8bef7gCNdJzhaG5GObrM1Ot+xjQH37oQtuME0q4EJrH0NhlY3YiJrlWHB3g==
X-Received: by 2002:a1c:ac07:: with SMTP id v7mr8104wme.49.1554297511512;
	Wed, 03 Apr 2019 06:18:31 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	192sm15623313wme.13.2019.04.03.06.18.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 06:18:30 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2019 15:18:22 +0200
Message-Id: <20190403131822.19503-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [PATCH] support CONFIG_MODULE_COMPRESS=y
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2019 13:18:31 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

In case, kernel config enables compressed modules, support of
splitting via split_kernel_module_packages won't find any module.
So, first expand module pattern regex to recognize compressed
modules and then objcopy on temporary extacted to extract module
information.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/classes/kernel-module-split.bbclass | 36 +++++++++++++++++-------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index e8d3eb5105..61819dca99 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -1,31 +1,31 @@
 pkg_postinst_modules () {
 if [ -z "$D" ]; then
-	depmod -a ${KERNEL_VERSION}
+        depmod -a ${KERNEL_VERSION}
 else
-	# image.bbclass will call depmodwrapper after everything is installed,
-	# no need to do it here as well
-	:
+        # image.bbclass will call depmodwrapper after everything is installed,
+        # no need to do it here as well
+        :
 fi
 }
 
 pkg_postrm_modules () {
 if [ -z "$D" ]; then
-	depmod -a ${KERNEL_VERSION}
+        depmod -a ${KERNEL_VERSION}
 else
-	depmodwrapper -a -b $D ${KERNEL_VERSION}
+        depmodwrapper -a -b $D ${KERNEL_VERSION}
 fi
 }
 
 autoload_postinst_fragment() {
 if [ x"$D" = "x" ]; then
-	modprobe %s || true
+        modprobe %s || true
 fi
 }
 
 PACKAGE_WRITE_DEPS += "kmod-native depmodwrapper-cross"
 
 do_install_append() {
-	install -d ${D}${sysconfdir}/modules-load.d/ ${D}${sysconfdir}/modprobe.d/
+        install -d ${D}${sysconfdir}/modules-load.d/ ${D}${sysconfdir}/modprobe.d/
 }
 
 PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
@@ -44,9 +44,23 @@ python split_kernel_module_packages () {
     def extract_modinfo(file):
         import tempfile, subprocess
         tempfile.tempdir = d.getVar("WORKDIR")
+        compressed = re.match( r'.*\.([xg])z$', file)
         tf = tempfile.mkstemp()
         tmpfile = tf[1]
-        cmd = "%sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("HOST_PREFIX") or "", file, tmpfile)
+        if compressed:
+            tmpkofile = tmpfile + ".ko"
+            if compressed.group(1) == 'g':
+                cmd = "gunzip -dc %s > %s" % (file, tmpkofile)
+                subprocess.check_call(cmd, shell=True)
+            elif compressed.group(1) == 'x':
+                cmd = "xz -dc %s > %s" % (file, tmpkofile)
+                subprocess.check_call(cmd, shell=True)
+            else:
+                msg = "Cannot decompress '%s'" % file
+                raise msg
+            cmd = "%sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("HOST_PREFIX") or "", tmpkofile, tmpfile)
+        else:
+            cmd = "%sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("HOST_PREFIX") or "", file, tmpfile)
         subprocess.check_call(cmd, shell=True)
         # errors='replace': Some old kernel versions contain invalid utf-8 characters in mod descriptions (like 0xf6, 'ö')
         f = open(tmpfile, errors='replace')
@@ -54,6 +68,8 @@ python split_kernel_module_packages () {
         f.close()
         os.close(tf[0])
         os.unlink(tmpfile)
+        if compressed:
+            os.unlink(tmpkofile)
         vals = {}
         for i in l:
             m = modinfoexp.match(i)
@@ -133,7 +149,7 @@ python split_kernel_module_packages () {
     kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME") or "kernel"
     kernel_version = d.getVar("KERNEL_VERSION")
 
-    module_regex = r'^(.*)\.k?o$'
+    module_regex = r'^(.*)\.k?o(?:\.[xg]z)?$'
 
     module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
     module_pattern_suffix = d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
-- 
2.17.1


