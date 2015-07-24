Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id E01FC761D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 15:04:26 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so32957591wib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 08:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0JlJNn6/Pt3/H5wPiUUlbE2hXyJHL6fLFyexmt2PHck=;
	b=VkDZLQcsXH5HSwU/qvKMFMqc6iiz2Z2eCcTHKMiYIdzwaoP4fGEXr2GtCiaONQQUT3
	YiCc1+2hllj61QwFNGZVYWa8GAe6WPDDCxEW/rM1HgL/wF/Av4SWoUC1nZMnlzUh72dX
	JqhDfk0t1pcmXmxKFp/CHp8IjSC+BKjT7NLv2JtNbuklnmg3SfzYA2vbwmmU+YkVy0en
	AI0ct/UD2KafB0AhZJg3/n6DxKFnaKZbp/Ulr/PqmxEtVZsX900+CwGL8YTXSjHUy3Od
	CEG0nTCnFkYVLaHRoSwGgngMcRSMcbUaM+uhGXWKPJqmLQj0KuayBzZG121bMic/iFzH
	YGlg==
X-Gm-Message-State: ALoCoQlfRb4WcuZS2awmCAg52bpjzhF18im1rTsuKuV8WO6AfoJdOEDtCEIAyObr5pKBvsrfJle9
X-Received: by 10.181.25.234 with SMTP id it10mr7999188wid.41.1437750266076;
	Fri, 24 Jul 2015 08:04:26 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m4sm13051742wjb.37.2015.07.24.08.04.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Jul 2015 08:04:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jul 2015 15:58:31 +0100
Message-Id: <1437749911-28963-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] sudo: upgrade to 1.8.14p3
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
X-List-Received-Date: Fri, 24 Jul 2015 15:04:29 -0000

The licence checksum is modified according to the change of doc/LICENCE.
In specific, file://lib/util/reallocarray.c is added to LIC_FILES_CHECKSUM.

Fix out of tree builds, and explicitly enable/disable tmpfiles.d support based
on the systemd DISTRO_FEATURE to avoid non-deterministic packaging.

Based on a patch by Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/sudo/sudo.inc                |  3 ++-
 ...rrect-path-to-init.d-and-tmpfiles.d-files.patch | 31 ++++++++++++++++++++++
 .../sudo/{sudo_1.8.13.bb => sudo_1.8.14p3.bb}      | 13 ++++++---
 3 files changed, 42 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/sudo/sudo/0001-Use-correct-path-to-init.d-and-tmpfiles.d-files.patch
 rename meta/recipes-extended/sudo/{sudo_1.8.13.bb => sudo_1.8.14p3.bb} (61%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index cdee6bb..a25876b 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,8 +4,9 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=346ce81ebf0f7f89fd379b40b6a4233b \
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=c16e542408abda013d672be8eb88d174 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=cfe41112f96c19a074934d128f45c693 \
+                    file://lib/util/reallocarray.c;beginline=3;endline=16;md5=85b0905b795d4d58bf2e00635649eec6 \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
                     file://lib/util/getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
                     file://lib/util/glob.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
diff --git a/meta/recipes-extended/sudo/sudo/0001-Use-correct-path-to-init.d-and-tmpfiles.d-files.patch b/meta/recipes-extended/sudo/sudo/0001-Use-correct-path-to-init.d-and-tmpfiles.d-files.patch
new file mode 100644
index 0000000..2418689
--- /dev/null
+++ b/meta/recipes-extended/sudo/sudo/0001-Use-correct-path-to-init.d-and-tmpfiles.d-files.patch
@@ -0,0 +1,31 @@
+The makefile uses top_srcdir to find files that were created by configure, when
+it should use top_builddir.
+
+Upstream-Status: Submitted (http://bugzilla.sudo.ws/show_bug.cgi?id=708)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+---
+ src/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile.in b/src/Makefile.in
+index f009e10..7acfb2d 100644
+--- a/src/Makefile.in
++++ b/src/Makefile.in
+@@ -165,11 +165,11 @@ install-dirs:
+ 
+ install-rc: install-dirs
+ 	if [ -n "$(INIT_SCRIPT)" ]; then \
+-	    $(INSTALL) $(INSTALL_OWNER) -m 0755 $(top_srcdir)/init.d/$(INIT_SCRIPT) $(DESTDIR)$(INIT_DIR)/sudo; \
++	    $(INSTALL) $(INSTALL_OWNER) -m 0755 $(top_builddir)/init.d/$(INIT_SCRIPT) $(DESTDIR)$(INIT_DIR)/sudo; \
+ 	    rm -f $(DESTDIR)$(RC_LINK); \
+ 	    ln -s $(INIT_DIR)/sudo $(DESTDIR)$(RC_LINK); \
+ 	elif test -n "$(tmpfiles_d)"; then \
+-	    $(INSTALL) $(INSTALL_OWNER) -m 0644 $(top_srcdir)/init.d/sudo.conf $(DESTDIR)$(tmpfiles_d)/sudo.conf; \
++	    $(INSTALL) $(INSTALL_OWNER) -m 0644 $(top_builddir)/init.d/sudo.conf $(DESTDIR)$(tmpfiles_d)/sudo.conf; \
+ 	fi
+ 
+ install-binaries: install-dirs $(PROGS)
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/sudo/sudo_1.8.13.bb b/meta/recipes-extended/sudo/sudo_1.8.14p3.bb
similarity index 61%
rename from meta/recipes-extended/sudo/sudo_1.8.13.bb
rename to meta/recipes-extended/sudo/sudo_1.8.14p3.bb
index 4494170..ea37aaf 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.13.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.14p3.bb
@@ -2,17 +2,21 @@ require sudo.inc
 
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
-          "
+           file://0001-Use-correct-path-to-init.d-and-tmpfiles.d-files.patch \
+           "
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "f61577ec330ad1bd504c0e2eec6ea2d8"
-SRC_URI[sha256sum] = "e374e5edf2c11c00d6916a9f51cb0ad15e51c7b028370fa15169b07e61e05a25"
+SRC_URI[md5sum] = "93dbd1e47c136179ff1b01494c1c0e75"
+SRC_URI[sha256sum] = "a8a697cbb113859058944850d098464618254804cf97961dee926429f00a1237"
 
 DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
 
-EXTRA_OECONF += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)}"
+EXTRA_OECONF += " \
+             ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
+             ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-tmpfiles.d=${libdir}/tmpfiles.d', '--disable-tmpfiles.d', d)} \
+             "
 
 do_install_append () {
 	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
@@ -26,4 +30,5 @@ do_install_append () {
 	rmdir -p --ignore-fail-on-non-empty ${D}${localstatedir}/run/sudo
 }
 
+FILES_${PN} += "${libdir}/tmpfiles.d"
 FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/*.la"
-- 
2.1.4


