Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8D0497C28A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Feb 2019 10:06:06 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id b3so10767216ede.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 02:06:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=19K1mvHSx6O9VwgUCjaw2fmEoF9JY9XkqQAX0/AYmKc=;
	b=eZAEs2ZOoJ0JTdrtBBrb7FnHMSaDDda0tcx5wDnpJBX62KAitGgZSn40Jr3n+2T4h8
	3THE8HFxuPCRAlFe9H2/UPj3fyg10pzsbAImawyvjePFEGy5ts3SO/e2AlF555Mu8I7b
	0mNjALQX2v+jQ0flJY61kigmW2BcSFpuNkSNmZymhgls/voTBBOmYZHLd+xmoIs4p+pj
	pdbzIoWFTNqJA9HaosqMjSj/Mys7b/uukRkqJnj18fjfaS1+pH6bR6c5M/VoHdO6IJ01
	y/hpY2C12T1ASCz3jqBTC0M+qJf4krVZCe2Xo5ytq2RKq9MFJ4cn8QwCgYv5/3g7SMJ9
	rdZw==
X-Gm-Message-State: AJcUukcGH+QQ4o/mHjvWQmTwvFuGvJFe7f1uMQdYWXbOmn5lskFxabxE
	xGt7YIpjd0sYRYeFFgDadPv9x+3+
X-Google-Smtp-Source: ALg8bN6KbkM/Mxe6vrIQ8mNWaznu+e5wahvb6XzgFMnl8mpLxtVdMlI1PegWJUg/hmSetgkC/GVi1w==
X-Received: by 2002:a17:906:4d1a:: with SMTP id
	r26mr45034490eju.32.1549274766833; 
	Mon, 04 Feb 2019 02:06:06 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	p36sm4102358edc.78.2019.02.04.02.06.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 02:06:05 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 10:05:49 +0000
Message-Id: <20190204100552.25880-9-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190204100552.25880-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190204100552.25880-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v5 08/11] util-linux: simplify meta-package RDEPENDS / RRECOMMENDS
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
X-List-Received-Date: Mon, 04 Feb 2019 10:06:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

The util-linux meta-package now simply RRECOMMENDS all
subpackages created. There is no distinction between what
it previously recommended or depended on for existing
packages.

This is to streamline the dependencies and to make things
less surprising.
It also stops the -dev package from depending on non-existing
packages like util-linux-losetup-dev etc.

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
v5: * reduce duplication in util_linux_binpackages() using
      a for loop
v3: update commit message
---
 meta/recipes-core/util-linux/util-linux.inc | 25 +++++----------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index cd1450f2c7..2577d0b1ae 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -33,34 +33,27 @@ PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pyl
 
 python util_linux_binpackages () {
     def pkg_hook(f, pkg, file_regex, output_pattern, modulename):
+        pn = d.getVar('PN')
+        d.appendVar('RRECOMMENDS_%s' % pn, ' %s' % pkg)
+
         if d.getVar('ALTERNATIVE_' + pkg):
             return
         if d.getVarFlag('ALTERNATIVE_LINK_NAME', modulename):
             d.setVar('ALTERNATIVE_' + pkg, modulename)
 
-    def pkg_hook_with_recommends(f, pkg, file_regex, output_pattern, modulename):
-        pn = d.getVar('PN')
-        d.appendVar('RRECOMMENDS_%s' % pn, ' %s' % pkg)
-        pkg_hook(f, pkg, file_regex, output_pattern, modulename)
-
-    for dir in [ '${base_sbindir}', '${base_bindir}' ]:
+    bindirs = [ '${base_sbindir}', '${base_bindir}', '${sbindir}', '${bindir}' ]
+    for dir in bindirs:
         do_split_packages(d, root=dir,
                           file_regex=r'(.*)', output_pattern='${PN}-%s',
                           description='${PN} %s',
                           hook=pkg_hook, extra_depends='', prepend=True)
 
-    for dir in [ '${sbindir}', '${bindir}' ]:
-        do_split_packages(d, root=dir,
-                          file_regex=r'(.*)', output_pattern='${PN}-%s',
-                          description='${PN} %s',
-                          hook=pkg_hook_with_recommends, extra_depends='', prepend=True)
-
     # There are some symlinks for some binaries which we have ignored
     # above. Add them to the package owning the binary they are
     # pointing to
     extras = {}
     dvar = d.getVar('PKGD')
-    for root in [ '${base_sbindir}', '${base_bindir}', '${sbindir}', '${bindir}' ]:
+    for root in bindirs:
         root = d.expand(root)
         for walkroot, dirs, files in os.walk(dvar + root):
             for f in files:
@@ -126,12 +119,6 @@ FILES_util-linux-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so
 RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
 RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 
-RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin util-linux-lsblk"
-RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
-
-RRECOMMENDS_${PN} += "${PN}-blockdev ${PN}-cfdisk ${PN}-ctrlaltdel ${PN}-fdisk ${PN}-mkswap ${PN}-nologin ${PN}-pivot-root ${PN}-switch-root"
-RRECOMMENDS_${PN} += "${PN}-dmesg ${PN}-kill ${PN}-more ${PN}-mount ${PN}-mountpoint"
-
 RRECOMMENDS_${PN}_class-native = ""
 RRECOMMENDS_${PN}_class-nativesdk = ""
 RDEPENDS_${PN}_class-native = ""
-- 
2.20.1


