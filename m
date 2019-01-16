Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f47.google.com (mail-yw1-f47.google.com
	[209.85.161.47])
	by mail.openembedded.org (Postfix) with ESMTP id 19E207C1BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:51:39 +0000 (UTC)
Received: by mail-yw1-f47.google.com with SMTP id g194so2402056ywe.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:51:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5zR7dhGzsR7Dw9ldM5KaFPPdQTSQhzApGS4Yg/4ylrQ=;
	b=BoW+zyfl2ADLqp/WuBWLjo3EVPNKuB3CHxyuGlLLX5mrUi/dxL6mLZjylrr9UsDB2C
	XprT6NugdXLbKV8IllbBgsaNS3sj1VVs0mN5VCLaF90RLuwZlFtbyXw1rL/seY3RjgzP
	YFfGx5qxnK/FiDskiSZUBAqWIIsnAAZvl3M3mSefeRbfu8lKFnSh2DihJLzqlpI6tCOQ
	ZUn/pfawWjqhi8h+5IQYgqEn701d8STq5ajSEzDck680OONKcnSyte615752qEPsmTRf
	uG4riMjroA/YDWlX3rZU6dhhQMJ7lQC5DSvJ4aWMz3X9itbhlGHWeR8unshQKq+IrbQw
	0DHA==
X-Gm-Message-State: AJcUukdR7zSmmA5bRPs1oNSXYooFf5QqEa7QFyI3KbvHX0vBVn5hcL+3
	J1Q03A3fvCrzdJ3CzIrx+B5mpECc
X-Google-Smtp-Source: ALg8bN5NsK4VBP1K4Qped9WJga0rw2lFTCApmdlrPFyW5HEhIK6U2LPc052qJLQ3AR/tX1tWVLDfpw==
X-Received: by 2002:a81:5d7:: with SMTP id 206mr7597364ywf.360.1547643100798; 
	Wed, 16 Jan 2019 04:51:40 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id y63sm6194558ywy.1.2019.01.16.04.51.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jan 2019 04:51:40 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 12:51:19 +0000
Message-Id: <20190116125124.20177-11-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190116125124.20177-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190116125124.20177-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v4 10/15] util-linux: one package per binary (pt 3: sbindir)
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
X-List-Received-Date: Wed, 16 Jan 2019 12:51:40 -0000
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
v3: * convert to PACKAGE_PREPROCESS_FUNCS rather than using
      apply_update_alternative_renames_prepend
v2: * Fix handling of escape characters in regexs and hence fix python
      Deprecation warnings which will be problematic in python 3.8.
    * use PN for package name prefix, not BPN
---
 meta/recipes-core/util-linux/util-linux.inc | 42 ++++++++-------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 36a22cf6d7..bab66f788e 100644
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
@@ -47,6 +43,11 @@ python util_linux_binpackages () {
         if d.getVarFlag('ALTERNATIVE_LINK_NAME', modulename):
             d.setVar('ALTERNATIVE_' + pkg, modulename)
 
+    def pkg_hook_with_recommends(f, pkg, file_regex, output_pattern, modulename):
+        pn = d.getVar('PN')
+        d.appendVar('RRECOMMENDS_%s' % pn, ' %s' % pkg)
+        pkg_hook(f, pkg, file_regex, output_pattern, modulename)
+
     do_split_packages(d, root='${base_sbindir}',
                       file_regex=r'(.*)', output_pattern='${PN}-%s',
                       description='${PN} %s',
@@ -55,6 +56,10 @@ python util_linux_binpackages () {
                       file_regex=r'(.*)', output_pattern='${PN}-%s',
                       description='${PN} %s',
                       hook=pkg_hook, extra_depends='', prepend=True)
+    do_split_packages(d, root='${sbindir}',
+                      file_regex=r'(.*)', output_pattern='${PN}-%s',
+                      description='${PN} %s',
+                      hook=pkg_hook_with_recommends, extra_depends='', prepend=True)
 }
 
 # we must execute before update-alternatives PACKAGE_PREPROCESS_FUNCS
@@ -94,16 +99,8 @@ FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
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
@@ -116,11 +113,6 @@ FILES_util-linux-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so
 FILES_util-linux-lsblk = "${bindir}/lsblk"
 FILES_util-linux-lscpu = "${bindir}/lscpu"
 
-FILES_util-linux-mkfs = "${sbindir}/mkfs"
-
-FILES_util-linux-fsck.cramfs = "${sbindir}/fsck.cramfs"
-FILES_util-linux-mkfs.cramfs = "${sbindir}/mkfs.cramfs"
-
 FILES_util-linux-unshare = "${bindir}/unshare.${BPN}"
 
 # Util-linux' blkid replaces the e2fsprogs one
@@ -130,7 +122,7 @@ RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin util-linux-lsblk"
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
 
-RRECOMMENDS_${PN} = "util-linux-blkdiscard util-linux-sfdisk util-linux-readprofile util-linux-mkfs util-linux-prlimit util-linux-ionice"
+RRECOMMENDS_${PN} = "util-linux-prlimit util-linux-ionice"
 RRECOMMENDS_${PN} += "${PN}-blockdev ${PN}-cfdisk ${PN}-ctrlaltdel ${PN}-fdisk ${PN}-mkswap ${PN}-nologin ${PN}-pivot-root ${PN}-switch-root"
 RRECOMMENDS_${PN} += "${PN}-dmesg ${PN}-kill ${PN}-more ${PN}-mount ${PN}-mountpoint"
 
@@ -217,7 +209,7 @@ ALTERNATIVE_PRIORITY = "80"
 ALTERNATIVE_${PN}  = " \
     hexdump last lastb logger mesg renice wall \
     setsid chrt flock utmpdump eject taskset fallocate \
-    fsfreeze nsenter cal rev \
+    nsenter cal rev \
 "
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
@@ -269,7 +261,6 @@ ALTERNATIVE_LINK_NAME[mount] = "${base_bindir}/mount"
 ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
 ALTERNATIVE_LINK_NAME[umount] = "${base_bindir}/umount"
 
-ALTERNATIVE_util-linux-readprofile = "readprofile"
 ALTERNATIVE_LINK_NAME[readprofile] = "${sbindir}/readprofile"
 
 ALTERNATIVE_LINK_NAME[losetup] = "${base_sbindir}/losetup"
@@ -281,7 +272,6 @@ ALTERNATIVE_LINK_NAME[fsck] = "${base_sbindir}/fsck"
 
 ALTERNATIVE_LINK_NAME[blkid] = "${base_sbindir}/blkid"
 
-ALTERNATIVE_util-linux-rfkill = "rfkill"
 ALTERNATIVE_LINK_NAME[rfkill] = "${sbindir}/rfkill"
 
 ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
-- 
2.20.1


