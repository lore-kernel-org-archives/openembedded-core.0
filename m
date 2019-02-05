Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail.openembedded.org (Postfix) with ESMTP id 70AF27C0F4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 02:32:53 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id b14so1660864edt.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 18:32:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=s2ppx18DjcM6OiPwG0ZsimdyTYLDZsmQG4JpDiusnkE=;
	b=HqqSqXvKOb3z9kVOcg9wh1oOhze4sjZaMh6evBqAio+bMvZV4F6497ZyHJ88tHZpCo
	oNJTWOk0nDXkmFlKyJuvqvtZ2RraTD87h02VfSTsKcuDlML9YQMtaBbdHLxPLoJR590Q
	X/NGGBQyYIAbue4J33y4In5bFUR2wii9Tva2zChkxgy7c3tbGF1bdv1/F8Wk2oWNDSog
	aYyGKqtCcE9bCdtY4SGNyojiwLa9n/jrvubmbfp2b7T2VpJJaEv3KBH0UoNLjH9HrhbA
	/5f/C3KFfYemXpGlDxvG0w6OCB/ZqLduQv7bw49EyCuaKsY/upCicwn8Cuv/g/AdPDaA
	DvJA==
X-Gm-Message-State: AHQUAuYMcIRyeoQ3O2ayoD7SsM0yxWdzpZxHrYR7MkRcY0PNRb72+gDj
	KGdD7tUaabSqXAq/aeh6rxTAArao
X-Google-Smtp-Source: AHgI3IanFMzNexFllcBw5Tu0nBh8zRb3cakdyqGrN9HgMLYGiwKQMzTpxf2+nqF6xtJ1QxxCU7wK+g==
X-Received: by 2002:a50:ef18:: with SMTP id m24mr1917454eds.136.1549333973865; 
	Mon, 04 Feb 2019 18:32:53 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	d7-v6sm2703682ejd.13.2019.02.04.18.32.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 18:32:53 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 02:32:36 +0000
Message-Id: <20190205023241.29707-9-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205023241.29707-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190205023241.29707-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v6 08/13] util-linux: one package per binary (pt 3: sbindir)
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
v5: * reduce duplication in util_linux_binpackages() using
      a for loop
v3: * convert to PACKAGE_PREPROCESS_FUNCS rather than using
      apply_update_alternative_renames_prepend
v2: * Fix handling of escape characters in regexs and hence fix python
      Deprecation warnings which will be problematic in python 3.8.
    * use PN for package name prefix, not BPN
---
 meta/recipes-core/util-linux/util-linux.inc | 46 +++++++++------------
 1 file changed, 19 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 4359a1c3fb..3b0598b708 100644
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
 
 python util_linux_binpackages () {
     def pkg_hook(f, pkg, file_regex, output_pattern, modulename):
@@ -47,18 +43,29 @@ python util_linux_binpackages () {
         if d.getVarFlag('ALTERNATIVE_LINK_NAME', modulename):
             d.setVar('ALTERNATIVE_' + pkg, modulename)
 
+    def pkg_hook_with_recommends(f, pkg, file_regex, output_pattern, modulename):
+        pn = d.getVar('PN')
+        d.appendVar('RRECOMMENDS_%s' % pn, ' %s' % pkg)
+        pkg_hook(f, pkg, file_regex, output_pattern, modulename)
+
     for dir in [ '${base_sbindir}', '${base_bindir}' ]:
         do_split_packages(d, root=dir,
                           file_regex=r'(.*)', output_pattern='${PN}-%s',
                           description='${PN} %s',
                           hook=pkg_hook, extra_depends='', prepend=True)
 
+    for dir in [ '${sbindir}' ]:
+        do_split_packages(d, root=dir,
+                          file_regex=r'(.*)', output_pattern='${PN}-%s',
+                          description='${PN} %s',
+                          hook=pkg_hook_with_recommends, extra_depends='', prepend=True)
+
     # There are some symlinks for some binaries which we have ignored
     # above. Add them to the package owning the binary they are
     # pointing to
     extras = {}
     dvar = d.getVar('PKGD')
-    for root in [ '${base_sbindir}', '${base_bindir}' ]:
+    for root in [ '${base_sbindir}', '${base_bindir}', '${sbindir}' ]:
         root = d.expand(root)
         for walkroot, dirs, files in os.walk(dvar + root):
             for f in files:
@@ -120,16 +127,8 @@ FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
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
@@ -142,11 +141,6 @@ FILES_util-linux-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so
 FILES_util-linux-lsblk = "${bindir}/lsblk"
 FILES_util-linux-lscpu = "${bindir}/lscpu"
 
-FILES_util-linux-mkfs = "${sbindir}/mkfs"
-
-FILES_util-linux-fsck.cramfs = "${sbindir}/fsck.cramfs"
-FILES_util-linux-mkfs.cramfs = "${sbindir}/mkfs.cramfs"
-
 FILES_util-linux-unshare = "${bindir}/unshare.${BPN}"
 
 # Util-linux' blkid replaces the e2fsprogs one
@@ -156,7 +150,7 @@ RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin util-linux-lsblk"
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
 
-RRECOMMENDS_${PN} = "util-linux-blkdiscard util-linux-sfdisk util-linux-readprofile util-linux-mkfs util-linux-prlimit util-linux-ionice"
+RRECOMMENDS_${PN} = "util-linux-prlimit util-linux-ionice"
 RRECOMMENDS_${PN} += "${PN}-blockdev ${PN}-cfdisk ${PN}-ctrlaltdel ${PN}-fdisk ${PN}-mkswap ${PN}-nologin ${PN}-pivot-root ${PN}-switch-root"
 RRECOMMENDS_${PN} += "${PN}-dmesg ${PN}-kill ${PN}-more ${PN}-mount ${PN}-mountpoint"
 
@@ -243,7 +237,7 @@ ALTERNATIVE_PRIORITY = "80"
 ALTERNATIVE_${PN}  = " \
     hexdump last lastb logger mesg renice wall \
     setsid chrt flock utmpdump eject taskset fallocate \
-    fsfreeze nsenter cal rev \
+    nsenter cal rev \
 "
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
@@ -295,7 +289,6 @@ ALTERNATIVE_LINK_NAME[mount] = "${base_bindir}/mount"
 ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
 ALTERNATIVE_LINK_NAME[umount] = "${base_bindir}/umount"
 
-ALTERNATIVE_util-linux-readprofile = "readprofile"
 ALTERNATIVE_LINK_NAME[readprofile] = "${sbindir}/readprofile"
 
 ALTERNATIVE_LINK_NAME[losetup] = "${base_sbindir}/losetup"
@@ -307,7 +300,6 @@ ALTERNATIVE_LINK_NAME[fsck] = "${base_sbindir}/fsck"
 
 ALTERNATIVE_LINK_NAME[blkid] = "${base_sbindir}/blkid"
 
-ALTERNATIVE_util-linux-rfkill = "rfkill"
 ALTERNATIVE_LINK_NAME[rfkill] = "${sbindir}/rfkill"
 
 ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
-- 
2.20.1


