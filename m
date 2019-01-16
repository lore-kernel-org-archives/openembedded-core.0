Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f50.google.com (mail-yw1-f50.google.com
	[209.85.161.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5DF747C03C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:01:07 +0000 (UTC)
Received: by mail-yw1-f50.google.com with SMTP id d190so2360294ywb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:01:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jjJOnPWchgRAhm/ypiVGheMby8n9NTndpq635ws9LXc=;
	b=HafCPNb0W/2bawjk/3bOJUCuC02FziePR39OJqkt/e9wyquRrU8AfxDmnO+z0Gkt7K
	xgHBhrxisEdNSfA/ZFlfx7Tl2qoXUtvUBMtOTk74xGw+RQ2XzyjFQCiUh387VjmS7z4O
	+hx6N3ieSK1/KFoeKzq10bD+kvnuh2/ShN6g530C6p7qQJaN6BsFPazvOWS5GPOA8mzQ
	htqdIFP8sGDpGEaGWxQgN0cXS8WHJPQvBfrAeRB5kd6aZKw62+kaaFaI6DAapGGRu9l1
	GCHn6ABKU1absW/KPpIfI6AELLbz1ucVdRiASv5Ze2lWLKUH4mJ+ZLakS+ktO9hJ9o+F
	8gVA==
X-Gm-Message-State: AJcUukfc4nHGhIEbWafTsBuQdPlEPVm5eYb5FMsnyheeuEozXDsIIt47
	TSwh28fRpvGdCXZuq8n5CqGvWkYj
X-Google-Smtp-Source: ALg8bN58ahdDUx2ra/+9t443zzUh3gxgVOj0c4pyqQhVNAAmPH63LaYEscsbtzRqdDyCZUtwLBSBvw==
X-Received: by 2002:a81:b718:: with SMTP id v24mr7157389ywh.126.1547640068096; 
	Wed, 16 Jan 2019 04:01:08 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	o124sm2169655ywe.75.2019.01.16.04.01.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jan 2019 04:01:07 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 12:00:45 +0000
Message-Id: <20190116120051.12182-10-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190116120051.12182-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190116120051.12182-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v3 09/15] util-linux: one package per binary (pt 2: base_bindir)
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
X-List-Received-Date: Wed, 16 Jan 2019 12:01:07 -0000
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
v3: * convert to PACKAGE_PREPROCESS_FUNCS rather than using
      apply_update_alternative_renames_prepend
v2: * Fix handling of escape characters in regexs and hence fix python
      Deprecation warnings which will be problematic in python 3.8.
    * use PN for package name prefix, not BPN
---
 meta/recipes-core/util-linux/util-linux.inc | 32 ++++++++-------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index a23fec69ea..36a22cf6d7 100644
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
@@ -51,6 +51,10 @@ python util_linux_binpackages () {
                       file_regex=r'(.*)', output_pattern='${PN}-%s',
                       description='${PN} %s',
                       hook=pkg_hook, extra_depends='', prepend=True)
+    do_split_packages(d, root='${base_bindir}',
+                      file_regex=r'(.*)', output_pattern='${PN}-%s',
+                      description='${PN} %s',
+                      hook=pkg_hook, extra_depends='', prepend=True)
 }
 
 # we must execute before update-alternatives PACKAGE_PREPROCESS_FUNCS
@@ -92,21 +96,18 @@ FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
 
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
@@ -120,8 +121,6 @@ FILES_util-linux-mkfs = "${sbindir}/mkfs"
 FILES_util-linux-fsck.cramfs = "${sbindir}/fsck.cramfs"
 FILES_util-linux-mkfs.cramfs = "${sbindir}/mkfs.cramfs"
 
-FILES_util-linux-mountpoint = "${base_bindir}/mountpoint.${BPN}"
-
 FILES_util-linux-unshare = "${bindir}/unshare.${BPN}"
 
 # Util-linux' blkid replaces the e2fsprogs one
@@ -131,8 +130,9 @@ RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin util-linux-lsblk"
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
 
-RRECOMMENDS_${PN} = "util-linux-blkdiscard util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs util-linux-mountpoint util-linux-prlimit util-linux-ionice"
+RRECOMMENDS_${PN} = "util-linux-blkdiscard util-linux-sfdisk util-linux-readprofile util-linux-mkfs util-linux-prlimit util-linux-ionice"
 RRECOMMENDS_${PN} += "${PN}-blockdev ${PN}-cfdisk ${PN}-ctrlaltdel ${PN}-fdisk ${PN}-mkswap ${PN}-nologin ${PN}-pivot-root ${PN}-switch-root"
+RRECOMMENDS_${PN} += "${PN}-dmesg ${PN}-kill ${PN}-more ${PN}-mount ${PN}-mountpoint"
 
 RRECOMMENDS_${PN}_class-native = ""
 RRECOMMENDS_${PN}_class-nativesdk = ""
@@ -215,7 +215,6 @@ do_install_append_class-native () {
 ALTERNATIVE_PRIORITY = "80"
 
 ALTERNATIVE_${PN}  = " \
-    dmesg kill more \
     hexdump last lastb logger mesg renice wall \
     setsid chrt flock utmpdump eject taskset fallocate \
     fsfreeze nsenter cal rev \
@@ -266,13 +265,8 @@ ALTERNATIVE_util-linux-agetty = "getty"
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
@@ -290,12 +284,10 @@ ALTERNATIVE_LINK_NAME[blkid] = "${base_sbindir}/blkid"
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


