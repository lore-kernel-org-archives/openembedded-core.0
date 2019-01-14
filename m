Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f41.google.com (mail-yw1-f41.google.com
	[209.85.161.41])
	by mail.openembedded.org (Postfix) with ESMTP id F36EB7BFEE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 12:56:52 +0000 (UTC)
Received: by mail-yw1-f41.google.com with SMTP id d190so8528938ywd.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 04:56:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5PmJh3QiVvt23H7dR22noRZ/d3o7xpEBOoUAj6VnmlI=;
	b=K8aX5lHknpLQtF72wne5Wm7UeV5+iiyGwsRlWEMXS5dsf/Nw6bgFrBqYNJ6+AFAiBI
	1bzRaZLwMgOVHIoAJwEdiiVPQOxzwfnLvvSpIluSF+idUejDq0KgvU7/T1D8hgeYFYIc
	vqYnPdxWOq7PQLnT7y+EhWMswInIBG9y1EzNCdjPRjh37FZtJqtkX1ehB9jAAzKGLtyx
	fqJMHvqpgZ909vy6ldvNoPQMua8nHPDeRhOlsochUTKCNRD9o9hj8hZM6IWWH6Hxlzmt
	DKbUJvW/qnM/cfCsYy41YaNmN7wtSWaMmAurs4mMqSp2C6q21LIh4JPkfviyfBzGH/TA
	dAAQ==
X-Gm-Message-State: AJcUukeQ6WQdmAt76YiscGry1RwpKfngykEl0+N71QEbPd/wF9mnoS74
	8tm3IJ6n4Ma9aIo1LGN3ToRgsQK4
X-Google-Smtp-Source: ALg8bN7SRYCwYOfAJbZZtjl3tq/G6x44oYzq3OWd77qduRiuTinYLG7sdkwRRg2No3dvAqA1Xa06lQ==
X-Received: by 2002:a0d:e4c5:: with SMTP id
	n188mr23549619ywe.349.1547470613019; 
	Mon, 14 Jan 2019 04:56:53 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	h145sm115143ywc.72.2019.01.14.04.56.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 04:56:52 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 12:56:31 +0000
Message-Id: <20190114125632.4780-12-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190114125632.4780-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 11/12] util-linux: one package per binary (pt 4: bindir)
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
X-List-Received-Date: Mon, 14 Jan 2019 12:56:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Similar to the previous patch.

Existing packages (and current dependency by main package):
* ionice <- RRECOMMENDS
* lsblk <- RDEPENDS
* lscpu
* mcookie
* prlimit <- RRECOMMENDS
* unshare
* uuidgen

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

Unfortunately, we need to add explicit ALTERNATIVE_LINK_NAME[]
for a few cases, as previously they were implied using
defaults by being specified in ALTERNATIVE_${PN}. We can't
easily automate that using do_split_packages(), so we
simply add them explicitly.

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 41 +++++++++------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index deb000c52f..e25ff17098 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -28,12 +28,7 @@ MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz \
            "
 
-PACKAGES =+ "util-linux-swaponoff \
-             util-linux-uuidgen util-linux-lscpu \
-             util-linux-mcookie \
-             util-linux-lsblk \
-             util-linux-prlimit \
-             util-linux-ionice util-linux-unshare"
+PACKAGES =+ "util-linux-swaponoff"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pylibmount', '', d)}"
 
 python apply_update_alternative_renames_prepend () {
@@ -51,6 +46,7 @@ python apply_update_alternative_renames_prepend () {
     do_split_packages(d, root='${base_sbindir}', file_regex='(.*)', output_pattern='${BPN}-%s', description='util-linux %s', hook=pkg_hook, extra_depends='', prepend=True)
     do_split_packages(d, root='${base_bindir}', file_regex='(.*)', output_pattern='${BPN}-%s', description='util-linux %s', hook=pkg_hook, extra_depends='', prepend=True)
     do_split_packages(d, root='${sbindir}', file_regex='(.*)', output_pattern='${BPN}-%s', description='util-linux %s', hook=pkg_hook_with_recommends, extra_depends='', prepend=True)
+    do_split_packages(d, root='${bindir}', file_regex='(.*)', output_pattern='${BPN}-%s', description='util-linux %s', hook=pkg_hook_with_recommends, extra_depends='', prepend=True)
 }
 
 PACKAGES_DYNAMIC = "^util-linux-.*"
@@ -87,21 +83,15 @@ FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
 FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
 
-FILES_util-linux-mcookie = "${bindir}/mcookie"
-FILES_util-linux-uuidgen = "${bindir}/uuidgen"
-FILES_util-linux-prlimit = "${bindir}/prlimit"
-FILES_util-linux-ionice = "${bindir}/ionice.${BPN}"
+FILES_${PN}-last = "${bindir}/lastb"
 FILES_util-linux-runuser = "${sysconfdir}/pam.d/runuser*"
 FILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
 CONFFILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
-
 FILES_util-linux-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
                                ${PYTHON_SITEPACKAGES_DIR}/libmount/__init__.* \
                                ${PYTHON_SITEPACKAGES_DIR}/libmount/__pycache__/*"
-FILES_util-linux-lsblk = "${bindir}/lsblk"
-FILES_util-linux-lscpu = "${bindir}/lscpu"
 
-FILES_util-linux-unshare = "${bindir}/unshare.${BPN}"
+FILES_${PN}-setarch = "${bindir}/linux32 ${bindir}/linux64 ${bindir}/uname26"
 
 # Util-linux' blkid replaces the e2fsprogs one
 RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
@@ -110,7 +100,6 @@ RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin util-linux-lsblk"
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
 
-RRECOMMENDS_${PN} = "util-linux-prlimit util-linux-ionice"
 RRECOMMENDS_${PN} += "${PN}-blockdev ${PN}-cfdisk ${PN}-ctrlaltdel ${PN}-fdisk ${PN}-mkswap ${PN}-nologin ${PN}-pivot-root ${PN}-switch-root"
 RRECOMMENDS_${PN} += "${PN}-dmesg ${PN}-kill ${PN}-more ${PN}-mount ${PN}-mountpoint"
 
@@ -194,12 +183,6 @@ do_install_append_class-native () {
 
 ALTERNATIVE_PRIORITY = "80"
 
-ALTERNATIVE_${PN}  = " \
-    hexdump last lastb logger mesg renice wall \
-    setsid chrt flock utmpdump eject taskset fallocate \
-    nsenter cal rev \
-"
-
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
 ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
 ALTERNATIVE_LINK_NAME[more] = "${base_bindir}/more"
@@ -207,9 +190,23 @@ ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
 ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
 ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
 ALTERNATIVE_LINK_NAME[cal] = "${bindir}/cal"
+ALTERNATIVE_LINK_NAME[chrt] = "${bindir}/chrt"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
 ALTERNATIVE_LINK_NAME[fallocate] = "${bindir}/fallocate"
+ALTERNATIVE_LINK_NAME[flock] = "${bindir}/flock"
+ALTERNATIVE_LINK_NAME[hexdump] = "${bindir}/hexdump"
+ALTERNATIVE_${PN}-last = "last lastb"
+ALTERNATIVE_LINK_NAME[last] = "${bindir}/last"
+ALTERNATIVE_LINK_NAME[lastb] = "${bindir}/lastb"
+ALTERNATIVE_LINK_NAME[logger] = "${bindir}/logger"
+ALTERNATIVE_LINK_NAME[mesg] = "${bindir}/mesg"
+ALTERNATIVE_LINK_NAME[nsenter] = "${bindir}/nsenter"
+ALTERNATIVE_LINK_NAME[renice] = "${bindir}/renice"
 ALTERNATIVE_LINK_NAME[rev] = "${bindir}/rev"
+ALTERNATIVE_LINK_NAME[setsid] = "${bindir}/setsid"
+ALTERNATIVE_LINK_NAME[taskset] = "${bindir}/taskset"
+ALTERNATIVE_LINK_NAME[utmpdump] = "${bindir}/utmpdump"
+ALTERNATIVE_LINK_NAME[wall] = "${bindir}/wall"
 ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
 ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 
@@ -268,10 +265,8 @@ ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
 
 ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
 
-ALTERNATIVE_util-linux-unshare = "unshare"
 ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
 
-ALTERNATIVE_util-linux-ionice = "ionice"
 ALTERNATIVE_LINK_NAME[ionice] = "${bindir}/ionice"
 
 ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
-- 
2.20.1


