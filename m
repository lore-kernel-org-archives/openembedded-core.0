Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
	[209.85.219.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1A1D97BFB9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 12:56:50 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id s17so2324710ybp.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 04:56:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dv/B91HKm6HwS/rWbX/EQYssneVfCby6tmEeNPYoAkE=;
	b=HF7cPVj2z9L0nX5nwkXNc3AsFXsiRRsfc8OQCFj6Bod2mnW0KyFPAQZdav09Gq3auh
	tSLC9SOY+zJdA22YGaq1popuEs8i5l6kH4G1CuPLkjfWBtxAlGeYmh+ec8E8Tg05au0r
	qk908wbVeNiq87j0s4rcEFX+hP6rUqTeRTZU/6rHMzbBOvRtNNqvt2mVzDv9KytKdtBi
	8/buejV11Ii6rnRwkc3kce9SqJGrnIRCDnM3Y7Ja4bx+3Eox9rnXyFgdmGD/0qcIpl/y
	oBaq3P2MUfYcQ8NOIwiy3ZKgII1oSvLi1b0jXkWhYMG3pSH72Hk82Eo//AvuMTCPyccL
	PPRA==
X-Gm-Message-State: AJcUukfPrEUtCRnvIjn3ZkGtzqYswujwgZWYAkXdbljLd7/HOiYOg4+P
	Yla9u2f8y4z/SBI9yTLMhAC8AuSR
X-Google-Smtp-Source: ALg8bN7yIL/JO08hz9A3sCyIYHjJ5A33mu2cbhAWGxWRp3bKw9mod9/8vqAG8KGSwWwz0vIoNi8JAA==
X-Received: by 2002:a25:b42:: with SMTP id 63mr16237805ybl.32.1547470611762;
	Mon, 14 Jan 2019 04:56:51 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	h145sm115143ywc.72.2019.01.14.04.56.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 04:56:51 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 12:56:30 +0000
Message-Id: <20190114125632.4780-11-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190114125632.4780-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 10/12] util-linux: one package per binary (pt 3: sbindir)
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
X-List-Received-Date: Mon, 14 Jan 2019 12:56:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Similar to the previous patch.

Existing packages (and current dependency by main package):
* blkdiscard <- RRECOMMENDS
* findfs
* fsck.cramfs
* mkfs <- RRECOMMENDS
* mkfs.cramfs
* partx
* readprofile <- RRECOMMENDS
* rfkill
* runuser <- RDEPENDS
* sfdisk <- RRECOMMENDS
* uuidd

New packages:
* too many to list

To avoid breaking existing users, all the new packages
are added to the main package as RRECOMMENDS_${PN}, so
they are pulled into existing images etc.

The existing RDEPENDS_${PN} will need some further
clean-up in the future, as it appears a bit random which
packages the main package depends on vs. recommends.

Nevertheless, all existing packages have been added to
RRECOMMENDS this time, even if they weren't in RDEPENDS /
RRECOMMENDS before.

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 39 +++++++--------------
 1 file changed, 13 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 3d97be8c30..deb000c52f 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -28,17 +28,13 @@ MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz \
            "
 
-PACKAGES =+ "util-linux-blkdiscard util-linux-sfdisk \
-             util-linux-swaponoff \
-             util-linux-readprofile util-linux-uuidd \
-             util-linux-uuidgen util-linux-lscpu util-linux-fsck.cramfs \
-             util-linux-mkfs util-linux-mcookie util-linux-rfkill \
-             util-linux-lsblk util-linux-mkfs.cramfs \
-             util-linux-partx \
-             util-linux-findfs util-linux-prlimit \
+PACKAGES =+ "util-linux-swaponoff \
+             util-linux-uuidgen util-linux-lscpu \
+             util-linux-mcookie \
+             util-linux-lsblk \
+             util-linux-prlimit \
              util-linux-ionice util-linux-unshare"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pylibmount', '', d)}"
-PACKAGES =+ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser', '', d)}"
 
 python apply_update_alternative_renames_prepend () {
     def pkg_hook(f, pkg, file_regex, output_pattern, modulename):
@@ -47,8 +43,14 @@ python apply_update_alternative_renames_prepend () {
         if d.getVarFlag('ALTERNATIVE_LINK_NAME', modulename):
             d.setVar('ALTERNATIVE_' + pkg, modulename)
 
+    def pkg_hook_with_recommends(f, pkg, file_regex, output_pattern, modulename):
+        pn = d.getVar('PN')
+        d.appendVar('RRECOMMENDS_%s' % pn, ' %s' % pkg)
+        pkg_hook(f, pkg, file_regex, output_pattern, modulename)
+
     do_split_packages(d, root='${base_sbindir}', file_regex='(.*)', output_pattern='${BPN}-%s', description='util-linux %s', hook=pkg_hook, extra_depends='', prepend=True)
     do_split_packages(d, root='${base_bindir}', file_regex='(.*)', output_pattern='${BPN}-%s', description='util-linux %s', hook=pkg_hook, extra_depends='', prepend=True)
+    do_split_packages(d, root='${sbindir}', file_regex='(.*)', output_pattern='${BPN}-%s', description='util-linux %s', hook=pkg_hook_with_recommends, extra_depends='', prepend=True)
 }
 
 PACKAGES_DYNAMIC = "^util-linux-.*"
@@ -85,16 +87,8 @@ FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
 FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
 
-FILES_util-linux-blkdiscard = "${sbindir}/blkdiscard"
-FILES_util-linux-sfdisk = "${sbindir}/sfdisk"
 FILES_util-linux-mcookie = "${bindir}/mcookie"
-FILES_util-linux-readprofile = "${sbindir}/readprofile.${BPN}"
 FILES_util-linux-uuidgen = "${bindir}/uuidgen"
-FILES_util-linux-uuidd = "${sbindir}/uuidd"
-FILES_util-linux-rfkill = "${sbindir}/rfkill.${BPN}"
-FILES_util-linux-partx = "${sbindir}/partx"
-FILES_util-linux-findfs = "${sbindir}/findfs"
-FILES_util-linux-runuser = "${sbindir}/runuser"
 FILES_util-linux-prlimit = "${bindir}/prlimit"
 FILES_util-linux-ionice = "${bindir}/ionice.${BPN}"
 FILES_util-linux-runuser = "${sysconfdir}/pam.d/runuser*"
@@ -107,11 +101,6 @@ FILES_util-linux-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so
 FILES_util-linux-lsblk = "${bindir}/lsblk"
 FILES_util-linux-lscpu = "${bindir}/lscpu"
 
-FILES_util-linux-mkfs = "${sbindir}/mkfs"
-
-FILES_util-linux-fsck.cramfs = "${sbindir}/fsck.cramfs"
-FILES_util-linux-mkfs.cramfs = "${sbindir}/mkfs.cramfs"
-
 FILES_util-linux-unshare = "${bindir}/unshare.${BPN}"
 
 # Util-linux' blkid replaces the e2fsprogs one
@@ -121,7 +110,7 @@ RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin util-linux-lsblk"
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
 
-RRECOMMENDS_${PN} = "util-linux-blkdiscard util-linux-sfdisk util-linux-readprofile util-linux-mkfs util-linux-prlimit util-linux-ionice"
+RRECOMMENDS_${PN} = "util-linux-prlimit util-linux-ionice"
 RRECOMMENDS_${PN} += "${PN}-blockdev ${PN}-cfdisk ${PN}-ctrlaltdel ${PN}-fdisk ${PN}-mkswap ${PN}-nologin ${PN}-pivot-root ${PN}-switch-root"
 RRECOMMENDS_${PN} += "${PN}-dmesg ${PN}-kill ${PN}-more ${PN}-mount ${PN}-mountpoint"
 
@@ -208,7 +197,7 @@ ALTERNATIVE_PRIORITY = "80"
 ALTERNATIVE_${PN}  = " \
     hexdump last lastb logger mesg renice wall \
     setsid chrt flock utmpdump eject taskset fallocate \
-    fsfreeze nsenter cal rev \
+    nsenter cal rev \
 "
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
@@ -260,7 +249,6 @@ ALTERNATIVE_LINK_NAME[mount] = "${base_bindir}/mount"
 ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
 ALTERNATIVE_LINK_NAME[umount] = "${base_bindir}/umount"
 
-ALTERNATIVE_util-linux-readprofile = "readprofile"
 ALTERNATIVE_LINK_NAME[readprofile] = "${sbindir}/readprofile"
 
 ALTERNATIVE_LINK_NAME[losetup] = "${base_sbindir}/losetup"
@@ -272,7 +260,6 @@ ALTERNATIVE_LINK_NAME[fsck] = "${base_sbindir}/fsck"
 
 ALTERNATIVE_LINK_NAME[blkid] = "${base_sbindir}/blkid"
 
-ALTERNATIVE_util-linux-rfkill = "rfkill"
 ALTERNATIVE_LINK_NAME[rfkill] = "${sbindir}/rfkill"
 
 ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
-- 
2.20.1


