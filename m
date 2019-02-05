Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45])
	by mail.openembedded.org (Postfix) with ESMTP id DB6617C0F7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 02:32:55 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id b3so1700601ede.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 18:32:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=H4yoAyRvfuvRwjJ5543b5NR+mJpQzDxg4n3R0XSCWKo=;
	b=b3XoZ3uTyDoz3/PaK4X69Z3/80xMtm3c+hrivVE4GXhco/SvfX9HHJU7kRm8Lmnryv
	8426n5ALYxdZePUxP9RnREXwxSTBu0NHvTg+BIZoMAXVOIxsGctJiHeQ+b27JOE2CaNg
	KQ+Ls9kCOsz9Z9BBDOS48zKUDSVSKJAL8v2VA8B9Yw8VJjxJBxaoGFWdKhnE6b1A4IYq
	eCOuIv1Pt8M1vvPIO/cm4ICPnTFxSpcAMZNbXMAPjvv9Dn58mXcU/fKl1wLWryVXc1lQ
	dbVefq5UsaUX/19A3Zrcl+aMrO+DvBHZu50QrQdY5G6JWkumDSGhnz7gshH/sBBhxiuO
	LqCg==
X-Gm-Message-State: AHQUAubZwD/gPkF1aU8FbeLRK5pn8VWEqPr3CdxJXhA7vUzeAZe+u5aV
	aHUu5fQRiBlyMU8+mUoPLqAkWjEt
X-Google-Smtp-Source: AHgI3IY5pEziJPlsDX5Kw2vuHRGLRtZrG+0wmh+bnyxuqnboNRbez7pdeZVUFiHC50iIvCjUuN2e3g==
X-Received: by 2002:a17:906:7252:: with SMTP id
	n18-v6mr1702453ejk.192.1549333976307; 
	Mon, 04 Feb 2019 18:32:56 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	d7-v6sm2703682ejd.13.2019.02.04.18.32.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 18:32:55 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 02:32:38 +0000
Message-Id: <20190205023241.29707-11-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205023241.29707-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190205023241.29707-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v6 10/13] util-linux: simplify meta-package RDEPENDS / RRECOMMENDS
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
X-List-Received-Date: Tue, 05 Feb 2019 02:32:56 -0000
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
v6: * make sure to walk each bindir only once, to better
      support nativesdk and usrmerge builds
v5: * reduce duplication in util_linux_binpackages() using
      a for loop
v3: update commit message

other fix
---
 meta/recipes-core/util-linux/util-linux.inc | 26 +++++----------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 5bc179e50b..5e40698644 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -33,35 +33,27 @@ PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pyl
 
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
+    bindirs = sorted(list(set(d.expand("${base_sbindir} ${base_bindir} ${sbindir} ${bindir}").split())))
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
-        root = d.expand(root)
+    for root in bindirs:
         for walkroot, dirs, files in os.walk(dvar + root):
             for f in files:
                 file = os.path.join(walkroot, f)
@@ -133,12 +125,6 @@ FILES_util-linux-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so
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


