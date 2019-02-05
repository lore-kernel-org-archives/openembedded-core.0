Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail.openembedded.org (Postfix) with ESMTP id BB9BF7C0BF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 02:32:52 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id p6so1705679eds.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 18:32:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uDC9ZT8CF5knnGYQG3gGV93PSels9TRWzaix50s2Xtk=;
	b=RJnPFGzBkuw/YHcbyo9hndRWaKj+fg1+c+I46HgRjY/lDD6ZjVz7EeumuEg1Vjp/GS
	f+tfWqPkwpmnvnsdHcdmZC2PtZHaSYYBk3H/f1oml2UvgQeP2DbQyF++hH+zszvFiLPB
	YbyXU8FSNa4oRZsPIGb1ay9uKavmei9qw7xE6zsHfjzFLj8WmYwg42VEZ4BTy33m7RTD
	yw9EA13UlHMn5EtQ1QvcALb7c4wy+GPQ2sONLTDFMhnZqPt5G6PhvBw2m027DJhA4DzZ
	RpgWdhKFe+nGQS0ULOfuYoczn7b/jf/yxfgOtTxJwqfMgIp8lDeEukQrP2wj0DXcZedm
	ifRA==
X-Gm-Message-State: AHQUAubs2QSRhJzy+K0gvaMGVf/jz4B0E34pRYqOHKxuKgCiBwgPudgn
	6EtfMKWdwHA1nIJI0sqQSz+DqTHE
X-Google-Smtp-Source: AHgI3IbJNB6nHqGID/i/b1/7KViVhqic8Xbp+cvQuOkcqcJQpe0rbP5TE0na8YGosozPrpfA0SU2sg==
X-Received: by 2002:a17:906:e0d6:: with SMTP id
	gl22mr1681454ejb.239.1549333972827; 
	Mon, 04 Feb 2019 18:32:52 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	d7-v6sm2703682ejd.13.2019.02.04.18.32.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 18:32:52 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 02:32:35 +0000
Message-Id: <20190205023241.29707-8-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205023241.29707-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190205023241.29707-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v6 07/13] util-linux: one package per binary (pt 2: base_bindir)
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
X-List-Received-Date: Tue, 05 Feb 2019 02:32:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Similar to the previous patch.

Existing packages (and current dependency by main package):
* mount <- RRECOMMENDS
* umount <- RDEPENDS
* mountpoint <- RRECOMMENDS
* getopt
* su <- RDEPENDS

New packages:
* dmesg
* kill
* more

To avoid breaking existing users, all the new packages
are added to the main package as RRECOMMENDS_${PN}, so
they are pulled into existing images etc.

The existing RDEPENDS_${PN} will need some further
clean-up in the future, as it appears a bit random which
packages the main package depends on vs. recommends.
Existing packages that aren't in RDEPENDS / RRECOMMENDS
haven't been added to RRECOMMENDS for that reason.

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
v5: * reduce duplication in util_linux_binpackages() using
      a for loop
v3: * convert to PACKAGE_PREPROCESS_FUNCS rather than using
      apply_update_alternative_renames_prepend
v2: * Fix handling of escape characters in regexs and hence fix python
      Deprecation warnings which will be problematic in python 3.8.
    * use PN for package name prefix, not BPN
---
 meta/recipes-core/util-linux/util-linux.inc | 32 +++++++--------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index a250db94aa..4359a1c3fb 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -29,16 +29,16 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz
            "
 
 PACKAGES =+ "util-linux-blkdiscard util-linux-sfdisk \
-             util-linux-swaponoff util-linux-umount \
-             util-linux-mount util-linux-readprofile util-linux-uuidd \
+             util-linux-swaponoff \
+             util-linux-readprofile util-linux-uuidd \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck.cramfs \
              util-linux-mkfs util-linux-mcookie util-linux-rfkill \
              util-linux-lsblk util-linux-mkfs.cramfs \
-             util-linux-partx util-linux-mountpoint \
-             util-linux-findfs util-linux-getopt util-linux-prlimit \
+             util-linux-partx \
+             util-linux-findfs util-linux-prlimit \
              util-linux-ionice util-linux-unshare"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pylibmount', '', d)}"
-PACKAGES =+ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
+PACKAGES =+ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser', '', d)}"
 
 python util_linux_binpackages () {
     def pkg_hook(f, pkg, file_regex, output_pattern, modulename):
@@ -47,7 +47,7 @@ python util_linux_binpackages () {
         if d.getVarFlag('ALTERNATIVE_LINK_NAME', modulename):
             d.setVar('ALTERNATIVE_' + pkg, modulename)
 
-    for dir in [ '${base_sbindir}' ]:
+    for dir in [ '${base_sbindir}', '${base_bindir}' ]:
         do_split_packages(d, root=dir,
                           file_regex=r'(.*)', output_pattern='${PN}-%s',
                           description='${PN} %s',
@@ -58,7 +58,7 @@ python util_linux_binpackages () {
     # pointing to
     extras = {}
     dvar = d.getVar('PKGD')
-    for root in [ '${base_sbindir}' ]:
+    for root in [ '${base_sbindir}', '${base_bindir}' ]:
         root = d.expand(root)
         for walkroot, dirs, files in os.walk(dvar + root):
             for f in files:
@@ -122,21 +122,18 @@ FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
 
 FILES_util-linux-blkdiscard = "${sbindir}/blkdiscard"
 FILES_util-linux-sfdisk = "${sbindir}/sfdisk"
-FILES_util-linux-mount = "${base_bindir}/mount.${BPN}"
 FILES_util-linux-mcookie = "${bindir}/mcookie"
-FILES_util-linux-umount = "${base_bindir}/umount.${BPN}"
 FILES_util-linux-readprofile = "${sbindir}/readprofile.${BPN}"
 FILES_util-linux-uuidgen = "${bindir}/uuidgen"
 FILES_util-linux-uuidd = "${sbindir}/uuidd"
 FILES_util-linux-rfkill = "${sbindir}/rfkill.${BPN}"
 FILES_util-linux-partx = "${sbindir}/partx"
 FILES_util-linux-findfs = "${sbindir}/findfs"
-FILES_util-linux-getopt = "${base_bindir}/getopt.${BPN}"
 FILES_util-linux-runuser = "${sbindir}/runuser"
 FILES_util-linux-prlimit = "${bindir}/prlimit"
 FILES_util-linux-ionice = "${bindir}/ionice.${BPN}"
 FILES_util-linux-runuser = "${sysconfdir}/pam.d/runuser*"
-FILES_util-linux-su = "${base_bindir}/su.${BPN} ${sysconfdir}/pam.d/su-l"
+FILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
 CONFFILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
 
 FILES_util-linux-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
@@ -150,8 +147,6 @@ FILES_util-linux-mkfs = "${sbindir}/mkfs"
 FILES_util-linux-fsck.cramfs = "${sbindir}/fsck.cramfs"
 FILES_util-linux-mkfs.cramfs = "${sbindir}/mkfs.cramfs"
 
-FILES_util-linux-mountpoint = "${base_bindir}/mountpoint.${BPN}"
-
 FILES_util-linux-unshare = "${bindir}/unshare.${BPN}"
 
 # Util-linux' blkid replaces the e2fsprogs one
@@ -161,8 +156,9 @@ RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin util-linux-lsblk"
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
 
-RRECOMMENDS_${PN} = "util-linux-blkdiscard util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs util-linux-mountpoint util-linux-prlimit util-linux-ionice"
+RRECOMMENDS_${PN} = "util-linux-blkdiscard util-linux-sfdisk util-linux-readprofile util-linux-mkfs util-linux-prlimit util-linux-ionice"
 RRECOMMENDS_${PN} += "${PN}-blockdev ${PN}-cfdisk ${PN}-ctrlaltdel ${PN}-fdisk ${PN}-mkswap ${PN}-nologin ${PN}-pivot-root ${PN}-switch-root"
+RRECOMMENDS_${PN} += "${PN}-dmesg ${PN}-kill ${PN}-more ${PN}-mount ${PN}-mountpoint"
 
 RRECOMMENDS_${PN}_class-native = ""
 RRECOMMENDS_${PN}_class-nativesdk = ""
@@ -245,7 +241,6 @@ do_install_append_class-native () {
 ALTERNATIVE_PRIORITY = "80"
 
 ALTERNATIVE_${PN}  = " \
-    dmesg kill more \
     hexdump last lastb logger mesg renice wall \
     setsid chrt flock utmpdump eject taskset fallocate \
     fsfreeze nsenter cal rev \
@@ -296,13 +291,8 @@ ALTERNATIVE_util-linux-agetty = "getty"
 ALTERNATIVE_LINK_NAME[getty] = "${base_sbindir}/getty"
 ALTERNATIVE_TARGET[getty] = "${base_sbindir}/agetty"
 
-ALTERNATIVE_util-linux-mount = "mount"
 ALTERNATIVE_LINK_NAME[mount] = "${base_bindir}/mount"
-
-ALTERNATIVE_${PN}-su = "su"
 ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
-
-ALTERNATIVE_util-linux-umount = "umount"
 ALTERNATIVE_LINK_NAME[umount] = "${base_bindir}/umount"
 
 ALTERNATIVE_util-linux-readprofile = "readprofile"
@@ -320,12 +310,10 @@ ALTERNATIVE_LINK_NAME[blkid] = "${base_sbindir}/blkid"
 ALTERNATIVE_util-linux-rfkill = "rfkill"
 ALTERNATIVE_LINK_NAME[rfkill] = "${sbindir}/rfkill"
 
-ALTERNATIVE_util-linux-getopt = "getopt"
 ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
 
 ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
 
-ALTERNATIVE_util-linux-mountpoint = "mountpoint"
 ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
 
 ALTERNATIVE_util-linux-unshare = "unshare"
-- 
2.20.1


