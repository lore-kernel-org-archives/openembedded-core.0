Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A245271DAE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 06:46:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v196k4DL028894
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 8 Feb 2017 22:46:04 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Feb 2017 22:46:03 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 9 Feb 2017 01:45:41 -0500
Message-ID: <900af1e7ffa8ec78ea2da57bc6b7257811c06674.1486622007.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1486622006.git.hongxu.jia@windriver.com>
References: <cover.1486622006.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 08/13] gpgme: 1.6.0 -> 1.8.0
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
X-List-Received-Date: Thu, 09 Feb 2017 06:46:08 -0000
Content-Type: text/plain

- Drop gpgme.pc, it is duplicated with pkgconfig.patch

- Rebase pkgconfig.patch to 1.8.0

- Split cmake config to ${PN}-dev

- Update LIC_FILES_CHKSUM, because copytright year changed.

- The libgpgme-pthread is obsolete by upstream;

- Add package libgpgcpp;

TODO: Do not remove gpgme-pthread.pc from pkgconfig.patch,
      the upstream explains:
      git://git.gnupg.org/gpgme.git
      commit 09b64554328445e99a8cc78fc34ea49c2ea2e7f9
      ------------------------------
      libgpgme-pthread is removed but gpgme-config still supports
      --thread=pthread for compatibility with find scripts.
      ------------------------------

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/gpgme/gpgme/gpgme.pc          | 10 ------
 meta/recipes-support/gpgme/gpgme/pkgconfig.patch   | 42 +++++++++++++++-------
 .../gpgme/{gpgme_1.6.0.bb => gpgme_1.8.0.bb}       | 20 +++++------
 3 files changed, 38 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-support/gpgme/gpgme/gpgme.pc
 rename meta/recipes-support/gpgme/{gpgme_1.6.0.bb => gpgme_1.8.0.bb} (67%)

diff --git a/meta/recipes-support/gpgme/gpgme/gpgme.pc b/meta/recipes-support/gpgme/gpgme/gpgme.pc
deleted file mode 100644
index 30a4d56..0000000
--- a/meta/recipes-support/gpgme/gpgme/gpgme.pc
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=/usr
-libdir=${prefix}/lib
-includedir=${prefix}/include
-
-Name: gpgme
-Description: GNU Privacy Guard Made Easy
-Version: 1.4.3
-Requires:
-Libs: -L${libdir} -lgpgme -lassuan -lgpg-error
-Cflags: -I${includedir}
diff --git a/meta/recipes-support/gpgme/gpgme/pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/pkgconfig.patch
index e2f1f4f..341cabf 100644
--- a/meta/recipes-support/gpgme/gpgme/pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/pkgconfig.patch
@@ -4,37 +4,50 @@ simpler and less error prone when cross compiling.
 Upstream-Status: Denied [Upstream not interested in pkg-config support]
 RP 2015/4/17
 
+Rebase to 1.8.0
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac            |   1 +
+ src/Makefile.am         |   4 +-
+ src/gpgme-pthread.pc.in |  15 +++++++
+ src/gpgme.m4            | 114 ++++--------------------------------------------
+ src/gpgme.pc.in         |  15 +++++++
+ 5 files changed, 42 insertions(+), 107 deletions(-)
+ create mode 100644 src/gpgme-pthread.pc.in
+ create mode 100644 src/gpgme.pc.in
+
 diff --git a/configure.ac b/configure.ac
-index 298a22b..c778b61 100644
+index 0a67b48..e402dd3 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -622,6 +622,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
+@@ -875,6 +875,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
                  src/versioninfo.rc
                  src/gpgme.h)
  AC_CONFIG_FILES(src/gpgme-config, chmod +x src/gpgme-config)
 +AC_CONFIG_FILES(src/gpgme.pc src/gpgme-pthread.pc)
- AC_CONFIG_FILES([lang/Makefile lang/cl/Makefile lang/cl/gpgme.asd])
- AC_OUTPUT
- 
+ AC_CONFIG_FILES(lang/cpp/Makefile lang/cpp/src/Makefile)
+ AC_CONFIG_FILES(lang/cpp/src/GpgmeppConfig-w32.cmake.in)
+ AC_CONFIG_FILES(lang/cpp/src/GpgmeppConfig.cmake.in)
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 58922f9..40d0dca 100644
+index ce6f1d4..5f38fee 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -20,11 +20,13 @@
+@@ -19,12 +19,14 @@
+ ## Process this file with automake to produce Makefile.in
  
- # Note: moc_kdpipeiodevice should actually be a dependecy below.
  EXTRA_DIST = gpgme-config.in gpgme.m4 libgpgme.vers ChangeLog-2011 \
--	     gpgme.h.in versioninfo.rc.in gpgme.def moc_kdpipeiodevice.cpp
-+	     gpgme.h.in versioninfo.rc.in gpgme.def moc_kdpipeiodevice.cpp gpgme.pc.in gpgme-pthread.pc.in
+-	     gpgme.h.in versioninfo.rc.in gpgme.def
++	     gpgme.h.in versioninfo.rc.in gpgme.def gpgme.pc.in gpgme-pthread.pc.in
  
  bin_SCRIPTS = gpgme-config
  m4datadir = $(datadir)/aclocal
  m4data_DATA = gpgme.m4
+ nodist_include_HEADERS = gpgme.h
 +pkgconfigdir = $(libdir)/pkgconfig
 +pkgconfig_DATA = gpgme.pc gpgme-pthread.pc
- nodist_include_HEADERS = gpgme.h
  
  bin_PROGRAMS = gpgme-tool
+ 
 diff --git a/src/gpgme-pthread.pc.in b/src/gpgme-pthread.pc.in
 new file mode 100644
 index 0000000..980a48e
@@ -51,9 +64,9 @@ index 0000000..980a48e
 +host=@GPGME_CONFIG_HOST@
 +
 +Name: gpgme
-+Description: GnuPG Made Easy (GPGME) is a C language library that allows to addsupport for cryptography to a program (threaded version)
++Description: GnuPG Made Easy (GPGME) is a C language library that allows to addsupport for cryptography to a program (deprecated)
 +Version: @VERSION@
-+Libs: -L${libdir} -lgpgme-pthread -lpthread
++Libs: -L${libdir} -lgpgme -lpthread
 +Cflags: -I${includedir}
 +Requires: libassuan gpg-error
 diff --git a/src/gpgme.m4 b/src/gpgme.m4
@@ -277,3 +290,6 @@ index 0000000..b69539f
 +Cflags: -I${includedir}
 +Requires: libassuan gpg-error
 \ No newline at end of file
+-- 
+2.8.1
+
diff --git a/meta/recipes-support/gpgme/gpgme_1.6.0.bb b/meta/recipes-support/gpgme/gpgme_1.8.0.bb
similarity index 67%
rename from meta/recipes-support/gpgme/gpgme_1.6.0.bb
rename to meta/recipes-support/gpgme/gpgme_1.8.0.bb
index a2d0587..b870069 100644
--- a/meta/recipes-support/gpgme/gpgme_1.6.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.8.0.bb
@@ -6,27 +6,29 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LESSER;md5=bbb461211a33b134d42ed5ee802b37ff \
-                    file://src/gpgme.h.in;endline=23;md5=5027eec93a996272a9a0a6a86cf35775 \
+                    file://src/gpgme.h.in;endline=23;md5=0f7059665c4b7897f4f4d0cb93aa9f98 \
                     file://src/engine.h;endline=22;md5=4b6d8ba313d9b564cc4d4cfb1640af9d"
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
-           file://gpgme.pc \
            file://pkgconfig.patch \
           "
 
-SRC_URI[md5sum] = "60d730d22e8065fd5de309e8b98e304b"
-SRC_URI[sha256sum] = "b09de4197ac280b102080e09eaec6211d081efff1963bf7821cf8f4f9916099d"
+SRC_URI[md5sum] = "722a4153904b9b5dc15485a22d29263b"
+SRC_URI[sha256sum] = "596097257c2ce22e747741f8ff3d7e24f6e26231fa198a41b2a072e62d1e5d33"
 
 DEPENDS = "libgpg-error libassuan"
+RDEPENDS_${PN}-cpp += "libstdc++"
 
 BINCONFIG = "${bindir}/gpgme-config"
 
 inherit autotools texinfo binconfig-disabled pkgconfig
 
-PACKAGES =+ "${PN}-pthread"
-FILES_${PN}-pthread = "${libdir}/libgpgme-pthread.so.*"
-FILES_${PN}-dev += "${datadir}/common-lisp/source/gpgme/*"
+PACKAGES =+ "${PN}-cpp"
+FILES_${PN}-cpp = "${libdir}/libgpgmepp.so.*"
+FILES_${PN}-dev += "${datadir}/common-lisp/source/gpgme/* \
+                    ${libdir}/cmake/* \
+"
 
 CFLAGS_append_libc-musl = " -D__error_t_defined "
 do_configure_prepend () {
@@ -35,7 +37,3 @@ do_configure_prepend () {
 	rm -f ${S}/m4/libassuan.m4
 }
 
-do_install_append () {
-        install -d ${D}${libdir}/pkgconfig
-        install -m 0644 ${WORKDIR}/gpgme.pc ${D}${libdir}/pkgconfig/
-}
-- 
2.8.1


