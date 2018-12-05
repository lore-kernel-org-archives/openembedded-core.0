Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B3B57459B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 13:01:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wB5D1vJV026400
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Dec 2018 05:01:57 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 5 Dec 2018 05:01:57 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Dec 2018 08:00:56 -0500
Message-ID: <aeb2fcc5e1fc063752d4451555fc170a39ccb8c1.1544014163.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.19.0.rc2
In-Reply-To: <cover.1544014163.git.kai.kang@windriver.com>
References: <cover.1544014163.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] packages: respect PACKAGE_NO_GCONV
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
X-List-Received-Date: Wed, 05 Dec 2018 13:01:56 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

PACKAGE_NO_GCONV is set in libc-package.bbclass if not all of
'libc-charsets libc-locale-code libc-locales' included in
DISTRO_FEATURES. And then no packages glibc-gconv-* glibc-charmap-* and
glibc-localedata-* is created. Update recipes and conf file which depend
on these packages to check required distro features.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/conf/distro/include/tclibc-glibc.inc     | 2 +-
 meta/recipes-core/glib-2.0/glib.inc           | 4 +++-
 meta/recipes-core/libxml/libxml2_2.9.8.bb     | 4 +++-
 meta/recipes-devtools/mtools/mtools_4.0.19.bb | 4 +++-
 4 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
index 8d1076440f..abe619aaac 100644
--- a/meta/conf/distro/include/tclibc-glibc.inc
+++ b/meta/conf/distro/include/tclibc-glibc.inc
@@ -32,7 +32,7 @@ LIBC_LOCALE_DEPENDENCIES = "\
 	glibc-gconv-iso8859-15"
 
 def get_libc_locales_dependencies(d):
-    if 'libc-locales' in (d.getVar('DISTRO_FEATURES') or '').split() :
+    if bb.utils.contains('DISTRO_FEATURES', 'libc-charsets libc-locale-code libc-locales', True, False, d):
         return d.getVar('LIBC_LOCALE_DEPENDENCIES') or ''
     else:
         return ''
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index e8215da583..a868b6df23 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -29,7 +29,9 @@ PACKAGES += "${PN}-codegen ${PN}-utils"
 
 LEAD_SONAME = "libglib-2.0.*"
 
-inherit autotools gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages
+inherit autotools gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages distro_features_check
+
+REQUIRED_DISTRO_FEATURES_libc-glibc = "${@'libc-charsets libc-locale-code libc-locales' if bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d) else ''}"
 
 S = "${WORKDIR}/glib-${PV}"
 
diff --git a/meta/recipes-core/libxml/libxml2_2.9.8.bb b/meta/recipes-core/libxml/libxml2_2.9.8.bb
index 740bf56a5a..0e2461154b 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.8.bb
@@ -38,10 +38,12 @@ PACKAGECONFIG ??= "python \
 PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python3"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
-inherit autotools pkgconfig binconfig-disabled ptest
+inherit autotools pkgconfig binconfig-disabled ptest distro_features_check
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
 
+REQUIRED_DISTRO_FEATURES_libc-glibc = "${@'libc-charsets libc-locale-code libc-locales' if bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d) else ''}"
+
 RDEPENDS_${PN}-ptest += "make ${@bb.utils.contains('PACKAGECONFIG', 'python', 'libgcc python3-core python3-logging python3-shell  python3-stringold python3-threading python3-unittest ${PN}-python', '', d)}"
 
 RDEPENDS_${PN}-python += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-core', '', d)}"
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.19.bb b/meta/recipes-devtools/mtools/mtools_4.0.19.bb
index 09742773e0..9972762b4e 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.19.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.19.bb
@@ -37,7 +37,9 @@ SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
 
 SRC_URI_append_class-native = " file://disable-hardcoded-configs.patch"
 
-inherit autotools texinfo
+inherit autotools texinfo distro_features_check
+
+REQUIRED_DISTRO_FEATURES_libc-glibc = "libc-charsets libc-locale-code libc-locales"
 
 EXTRA_OECONF = "--without-x"
 
-- 
2.19.0.rc2


