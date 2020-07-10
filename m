Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.7217.1594373056927911776
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 02:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 06A9ODOw026258
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 02:24:16 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Fri, 10 Jul 2020 02:24:06 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V4] dpkg: change SRC_URI to take dpkg from git
Date: Fri, 10 Jul 2020 17:21:07 +0800
Message-ID: <20200710092107.1150497-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CANNYZj_5-Sd-zww=bL8=_sDSL8P19iPB59w=+6c-tyCwBVY3rQ@mail.gmail.com>
References: <CANNYZj_5-Sd-zww=bL8=_sDSL8P19iPB59w=+6c-tyCwBVY3rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

tar.xz on original URL have been removed, switch to use git

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc       | 14 +++++++++++++-
 meta/recipes-devtools/dpkg/dpkg_1.20.0.bb |  7 ++++---
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 1c3c585d79..04fe85c4a8 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -7,7 +7,7 @@ DEPENDS_class-native = "bzip2-replacement-native zlib-native virtual/update-alte
 RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} perl"
 RDEPENDS_${PN}_class-native = ""
 
-UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/dpkg/"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 inherit autotools gettext perlnative pkgconfig perl-version update-alternatives
 
@@ -30,6 +30,18 @@ EXTRA_OECONF_append_class-target = " --disable-update-alternatives DEB_HOST_ARCH
 PACKAGECONFIG = "liblzma"
 PACKAGECONFIG[liblzma] = "--with-liblzma,--without-liblzma, xz"
 
+
+#autotools.bbclass default AUTOTOOLS_AUXDIR is ${S}, we need to under ${S}/build-aux
+AUTOTOOLS_AUXDIR = "${S}/build-aux"
+
+do_configure_prepend () {
+        mkdir -p ${AUTOTOOLS_AUXDIR}
+        # autotools_do_configure updates po/Makefile.in.in, we also need
+        # update dselect/po and scripts/po
+        cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/dselect/po/
+        cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/scripts/po/
+}
+
 do_install_append () {
 	if [ "${PN}" = "dpkg-native" ]; then
 		# update-alternatives doesn't have an offline mode
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.20.0.bb b/meta/recipes-devtools/dpkg/dpkg_1.20.0.bb
index c98a9e58e2..334294e6f8 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.20.0.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.20.0.bb
@@ -1,7 +1,7 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz \
+SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https \
            file://noman.patch \
            file://remove-tar-no-timestamp.patch \
            file://arch_pm.patch \
@@ -18,5 +18,6 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz \
 
 SRC_URI_append_class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRC_URI[md5sum] = "f88f077236a3ff3decae3b25c989893d"
-SRC_URI[sha256sum] = "b633cc2b0e030efb61e11029d8a3fb1123f719864c9992da2e52b471c96d0900"
+SRCREV = "314ac02663c5bd1a82b34745150bf13a39a549a3"
+
+S = "${WORKDIR}/git"
-- 
2.17.1

