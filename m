Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id AEBED71BEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 14:10:43 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 4so2944933wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 07:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S1wYFn5GNAuO9FQZA2GEmJpQqUOobO7xpIzVLZ9kh4g=;
	b=kNtPI9uu898ppDY17LVzg9ye0V9gq4cExTeuLAptSxwHWMUId+jeAUNjHd0rZVpcaT
	4fTT1ViA8RififMvSb9FGVfNygXG97JYRTT//Vx7cCltNGacwfHh74HJ3pGLzfbWpGrj
	H46lCc0tguvEWdRf/pzv9XUOljSFErkbPkGw8IoA0fKWnQizWd8zW6ZV072TNearN/yG
	3egKh809EdWq1OB8FqWvpaa2F9KOu+o/haVMmtSOYh+DPENlpgdsyszcykp8HJowr5Yj
	2Q4ylBcRG9wjfR1KwWcRAC/4czr3GELvB0+4dnZRJJv0Rmit9gA9CjDrFTgGSm2cKQXP
	Y7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=S1wYFn5GNAuO9FQZA2GEmJpQqUOobO7xpIzVLZ9kh4g=;
	b=E6AmLo5FPKCQPreVuQrWnj0LVJG03f6KxtJcWNrb2S+91iUR4JvOEpxUJVd5kR41VI
	F1vQVxy9sxD9WD+5DJ7eSAuLixd40624iPBSjlny0K4nsylueHmoO/x9W5ZbNUqcwAUb
	o2QcZXDMfG6bb+WuJZyrOYQvNRSa7qCLhd+I69w8EcydccnySHR4kQ+HBfDQZlrZ+5Eb
	1N9fZeb3/rTs4P5Gmfb+lUGNKxci673qsAIHew7n0e8ahDQAfwxMF4AL5u34yXreHGkq
	3coRjXVR7uOK0PPfJLcW86Haz/Yzq++gW/RCK+aAE0DE3iCJbKtcJ229EcyNA5vIaiKW
	QEbg==
X-Gm-Message-State: APjAAAXQxkyzRBOB4gQd/kJ+pmz+cv10jrfcA3vhYs+KMepKQWMkiJh0
	NCgAd+SbVPsuyBid23APwQ4ruHNmUos=
X-Google-Smtp-Source: APXvYqyeBBbTjZnDKjuM06zWlJ6HNQ1VI/IzbHwM2uRnjzodrxCN9rxSKP1BqbM3hEAZ6BOKHPSJ4A==
X-Received: by 2002:a1c:a00a:: with SMTP id j10mr3361461wme.15.1555596643831; 
	Thu, 18 Apr 2019 07:10:43 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58])
	by smtp.gmail.com with ESMTPSA id i2sm2874666wmg.47.2019.04.18.07.10.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Apr 2019 07:10:33 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2019 16:08:42 +0200
Message-Id: <20190418140842.2953-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [PATCH] kernel-module-split.bbclass: support CONFIG_MODULE_COMPRESS=y
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
X-List-Received-Date: Thu, 18 Apr 2019 14:10:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In case, kernel config enables compressed modules, support of
splitting via split_kernel_module_packages won't find any module.
So, first expand module pattern regex to recognize compressed
modules and then objcopy on temporary extacted to extract module
information.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/classes/kernel-module-split.bbclass | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index e8d3eb5105..221022b7bc 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
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


