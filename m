Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail.openembedded.org (Postfix) with ESMTP id BEF307C0BF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 02:32:54 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id h15so1674070edb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 18:32:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FuZu51jJT8k1zkIWAjdLyPaq1hZ913UjGFjPHuht0hc=;
	b=dMQqsMrFG+rJkBSVqRKe+obd3wC5WAtGvsv/NzYDVZSK48AZWzJZ7E43bjqDjSe2v5
	l14bs2a97OZeY2WEA0OWQHAPF8OVFX4N8ncMv5rvhY348/74CwQaAwX/sPzjEg25C5lK
	WBKoo0YMlkMHfnbP1nkY0DFF+yi/UcxtF7j7JPNsR9z12EKl93mJHCTRU19EGfwvObWT
	eoexXQj0o27Om1sNDyh4huUsB4QqYlGiJJHRazkR/CYUuY81eMCaNwhEk6D8npjgpW6W
	5WNzVC2uv7fV1rqCLYVc6S9z3OZQv8yBZZAy0DIq+VzsKeJFRJMMjwAwSSeUSyQo3kib
	vd/Q==
X-Gm-Message-State: AHQUAuZElF4K8pfB3RY1UG8Q1zbXy8K+ynP2XcXeCSu3WkiWCra6TMae
	m9eC+3YajqB+KGQMukLX5p2YivJk
X-Google-Smtp-Source: AHgI3Iar7jCn2U9p5+KJA65aWAhedM/4v88en/czs2gQImUE6RqC5MFdMa1apZdNSLlA+tnjgcHrCw==
X-Received: by 2002:a17:906:1686:: with SMTP id
	s6mr1647861ejd.209.1549333974989; 
	Mon, 04 Feb 2019 18:32:54 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	d7-v6sm2703682ejd.13.2019.02.04.18.32.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 18:32:54 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 02:32:37 +0000
Message-Id: <20190205023241.29707-10-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205023241.29707-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190205023241.29707-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v6 09/13] util-linux: one package per binary (pt 4: bindir)
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
X-List-Received-Date: Tue, 05 Feb 2019 02:32:55 -0000
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
v5: * reduce duplication in util_linux_binpackages() using
      a for loop
v3: * convert to PACKAGE_PREPROCESS_FUNCS rather than using
      apply_update_alternative_renames_prepend
v2: * Fix handling of escape characters in regexs and hence fix python
      Deprecation warnings which will be problematic in python 3.8.
    * use PN for package name prefix, not BPN
---
 meta/recipes-core/util-linux/util-linux.inc | 43 ++++++++-------------
 1 file changed, 17 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 3b0598b708..5bc179e50b 100644
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
 
 python util_linux_binpackages () {
@@ -54,7 +49,7 @@ python util_linux_binpackages () {
                           description='${PN} %s',
                           hook=pkg_hook, extra_depends='', prepend=True)
 
-    for dir in [ '${sbindir}' ]:
+    for dir in [ '${sbindir}', '${bindir}' ]:
         do_split_packages(d, root=dir,
                           file_regex=r'(.*)', output_pattern='${PN}-%s',
                           description='${PN} %s',
@@ -65,7 +60,7 @@ python util_linux_binpackages () {
     # pointing to
     extras = {}
     dvar = d.getVar('PKGD')
-    for root in [ '${base_sbindir}', '${base_bindir}', '${sbindir}' ]:
+    for root in [ '${base_sbindir}', '${base_bindir}', '${sbindir}', '${bindir}' ]:
         root = d.expand(root)
         for walkroot, dirs, files in os.walk(dvar + root):
             for f in files:
@@ -127,21 +122,12 @@ FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
 FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
 
-FILES_util-linux-mcookie = "${bindir}/mcookie"
-FILES_util-linux-uuidgen = "${bindir}/uuidgen"
-FILES_util-linux-prlimit = "${bindir}/prlimit"
-FILES_util-linux-ionice = "${bindir}/ionice.${BPN}"
 FILES_util-linux-runuser = "${sysconfdir}/pam.d/runuser*"
 FILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
 CONFFILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
-
 FILES_util-linux-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
                                ${PYTHON_SITEPACKAGES_DIR}/libmount/__init__.* \
                                ${PYTHON_SITEPACKAGES_DIR}/libmount/__pycache__/*"
-FILES_util-linux-lsblk = "${bindir}/lsblk"
-FILES_util-linux-lscpu = "${bindir}/lscpu"
-
-FILES_util-linux-unshare = "${bindir}/unshare.${BPN}"
 
 # Util-linux' blkid replaces the e2fsprogs one
 RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
@@ -150,7 +136,6 @@ RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin util-linux-lsblk"
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
 
-RRECOMMENDS_${PN} = "util-linux-prlimit util-linux-ionice"
 RRECOMMENDS_${PN} += "${PN}-blockdev ${PN}-cfdisk ${PN}-ctrlaltdel ${PN}-fdisk ${PN}-mkswap ${PN}-nologin ${PN}-pivot-root ${PN}-switch-root"
 RRECOMMENDS_${PN} += "${PN}-dmesg ${PN}-kill ${PN}-more ${PN}-mount ${PN}-mountpoint"
 
@@ -234,12 +219,6 @@ do_install_append_class-native () {
 
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
@@ -247,9 +226,23 @@ ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
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
 
@@ -308,10 +301,8 @@ ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
 
 ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
 
-ALTERNATIVE_util-linux-unshare = "unshare"
 ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
 
-ALTERNATIVE_util-linux-ionice = "ionice"
 ALTERNATIVE_LINK_NAME[ionice] = "${bindir}/ionice"
 
 ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
-- 
2.20.1


