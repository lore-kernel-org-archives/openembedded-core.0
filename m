Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B8CF6784F4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 07:33:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w047XdCU002661
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Jan 2018 23:33:39 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 3 Jan 2018 23:33:38 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Jan 2018 15:35:45 +0800
Message-ID: <519437989588d44d130890dce1285d796e3382ad.1515051241.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1515051241.git.Qi.Chen@windriver.com>
References: <cover.1515051241.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] coreutils: upgrade to 8.29
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
X-List-Received-Date: Thu, 04 Jan 2018 07:33:38 -0000
Content-Type: text/plain

* ls.c license checksum is changed, but the license remains the same.

* The new version provides native manual page support, there's no
  need to download extra manual page from gentoo site.

* man-decouple-manpages-from-build.patch is removed, as new version
  has manual page support in environment lacking of perl.

* hostname is explicitly enabled to keep the same with previous recipe's
  behaviour.

* ALTERNATIVE_XXX settings for lbracket.1 are removed as there's no such
  file.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../man-decouple-manpages-from-build.patch         | 27 ----------------------
 .../{coreutils_8.28.bb => coreutils_8.29.bb}       | 24 +++++--------------
 2 files changed, 6 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils/man-decouple-manpages-from-build.patch
 rename meta/recipes-core/coreutils/{coreutils_8.28.bb => coreutils_8.29.bb} (80%)

diff --git a/meta/recipes-core/coreutils/coreutils/man-decouple-manpages-from-build.patch b/meta/recipes-core/coreutils/coreutils/man-decouple-manpages-from-build.patch
deleted file mode 100644
index 3c896a1..0000000
--- a/meta/recipes-core/coreutils/coreutils/man-decouple-manpages-from-build.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From b4d258629f090066783c3b4c91b40f63b9d0a296 Mon Sep 17 00:00:00 2001
-From: Paul Gortmaker <paul.gortmaker@windriver.com>
-Date: Sun, 8 Feb 2015 16:51:57 -0500
-Subject: [PATCH] man: decouple manpages from build
-
-The use of "help2man" doesn't work at all for cross compile, in
-addition to the extra requirement of perl it adds.
-
-Just decouple the manpages from the build in order to pave the way for
-importing prebuilt manpages that can be used in a cross build situation.
-
-Upstream-Status: Inappropriate [upstream doesn't care about x-compile case.]
-Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
-
-diff --git a/Makefile.am b/Makefile.am
-index fb4af27..7576b2c 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -214,5 +214,4 @@ AM_CPPFLAGS = -Ilib -I$(top_srcdir)/lib -Isrc -I$(top_srcdir)/src
- include $(top_srcdir)/lib/local.mk
- include $(top_srcdir)/src/local.mk
- include $(top_srcdir)/doc/local.mk
--include $(top_srcdir)/man/local.mk
- include $(top_srcdir)/tests/local.mk
--- 
-2.2.2
-
diff --git a/meta/recipes-core/coreutils/coreutils_8.28.bb b/meta/recipes-core/coreutils/coreutils_8.29.bb
similarity index 80%
rename from meta/recipes-core/coreutils/coreutils_8.28.bb
rename to meta/recipes-core/coreutils/coreutils_8.29.bb
index 8a9e80c..bdb7a42 100644
--- a/meta/recipes-core/coreutils/coreutils_8.28.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.29.bb
@@ -6,15 +6,13 @@ HOMEPAGE = "http://www.gnu.org/software/coreutils/"
 BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
-                    file://src/ls.c;beginline=5;endline=16;md5=38b79785ca88537b75871782a2a3c6b8"
+                    file://src/ls.c;beginline=1;endline=15;md5=1c3f9411e1842a062ce5ce9210beee0e"
 DEPENDS = "gmp libcap"
 DEPENDS_class-native = ""
 
 inherit autotools gettext texinfo
 
-SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz;name=tarball \
-           http://distfiles.gentoo.org/distfiles/${BP}-man.tar.xz;name=manpages \
-           file://man-decouple-manpages-from-build.patch \
+SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://fix-selinux-flask.patch \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
@@ -24,13 +22,11 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz;name=tarball \
            file://0001-doc-fix-Up-field-of-realpath-usage-examples.patch \
           "
 
-SRC_URI[tarball.md5sum] = "e7cb20d0572cc40d9f47ede6454406d1"
-SRC_URI[tarball.sha256sum] = "1117b1a16039ddd84d51a9923948307cfa28c2cea03d1a2438742253df0a0c65"
-SRC_URI[manpages.md5sum] = "3a7c626aad1c9077f254e5c2553a2f60"
-SRC_URI[manpages.sha256sum] = "d72c3fa79ae328a4fd1107102e8946755aa2e908044e1efcf1e71ef206dca042"
+SRC_URI[md5sum] = "960cfe75a42c9907c71439f8eb436303"
+SRC_URI[sha256sum] = "92d0fa1c311cacefa89853bdb53c62f4110cdfda3820346b59cbd098f40f955e"
 
 EXTRA_OECONF_class-native = "--without-gmp"
-EXTRA_OECONF_class-target = "--enable-install-program=arch --libexecdir=${libdir}"
+EXTRA_OECONF_class-target = "--enable-install-program=arch,hostname --libexecdir=${libdir}"
 EXTRA_OECONF_class-nativesdk = "--enable-install-program=arch"
 
 # acl and xattr are not default features
@@ -95,20 +91,13 @@ do_install_append() {
 	# in update-alternatives to fail, therefore use lbracket - the name used
 	# for the actual source file.
 	mv ${D}${bindir}/[ ${D}${bindir}/lbracket.${BPN}
-
-	# prebuilt man pages
-	install -d ${D}/${mandir}/man1
-	install -t ${D}/${mandir}/man1 ${S}/man/*.1
-	# prebuilt man pages don't do a separate man page for [ vs test.
-	# see comment above r.e. sed and update-alternatives
-	cp -R --no-dereference --preserve=mode,links -v ${D}${mandir}/man1/test.1 ${D}${mandir}/man1/lbracket.1.${BPN}
 }
 
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "lbracket ${bindir_progs} ${base_bindir_progs} ${sbindir_progs} base64 mktemp df"
-ALTERNATIVE_${PN}-doc = "base64.1 mktemp.1 df.1 lbracket.1 groups.1 kill.1 uptime.1 stat.1  hostname.1"
+ALTERNATIVE_${PN}-doc = "base64.1 mktemp.1 df.1 groups.1 kill.1 uptime.1 stat.1  hostname.1"
 
 ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
 
@@ -126,7 +115,6 @@ ALTERNATIVE_LINK_NAME[df.1] = "${mandir}/man1/df.1"
 
 ALTERNATIVE_LINK_NAME[lbracket] = "${bindir}/["
 ALTERNATIVE_TARGET[lbracket] = "${bindir}/lbracket.${BPN}"
-ALTERNATIVE_LINK_NAME[lbracket.1] = "${mandir}/man1/lbracket.1"
 
 ALTERNATIVE_LINK_NAME[groups.1] = "${mandir}/man1/groups.1"
 ALTERNATIVE_LINK_NAME[uptime.1] = "${mandir}/man1/uptime.1"
-- 
1.9.1


