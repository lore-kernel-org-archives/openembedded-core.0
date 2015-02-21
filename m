Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id CF2866B0CB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 21:28:46 +0000 (UTC)
Received: from [99.240.204.5] (port=48344 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YPHbP-000249-1G for openembedded-core@lists.openembedded.org;
	Sat, 21 Feb 2015 16:28:43 -0500
Date: Sat, 21 Feb 2015 16:28:42 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1502211625160.32111@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [PATCH] Delete superfluous assignments, S = ${WORKDIR}/${BP}
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
X-List-Received-Date: Sat, 21 Feb 2015 21:28:48 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Given that bitbake.conf sets the default values:

BP = "${BPN}-${PV}"
S = "${WORKDIR}/${BP}"

there are a number of recipes that set the variable S completely
superfluously, so get rid of them.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  someone else feel free to sanity-check these.

diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index 0ce3b51..3f662c3 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -16,8 +16,6 @@ SRC_URI = "${GNU_MIRROR}/readline/${BPN}-${PV}.tar.gz;name=archive \
            file://config-dirent-symbols.patch \
            file://norpath.patch"

-S = "${WORKDIR}/${BPN}-${PV}"
-
 inherit autotools texinfo

 EXTRA_AUTORECONF += "--exclude=autoheader"
diff --git a/meta/recipes-core/readline/readline_5.2.bb b/meta/recipes-core/readline/readline_5.2.bb
index fe610e3..c1007a2 100644
--- a/meta/recipes-core/readline/readline_5.2.bb
+++ b/meta/recipes-core/readline/readline_5.2.bb
@@ -63,8 +63,6 @@ SRC_URI[patch13.sha256sum] = "0cc649516a5bdfa61c5e56937407570288b6972d75aa1bd060
 SRC_URI[patch14.md5sum]    = "a1be30e1c6f1099bb5fcef00a2631fb8"
 SRC_URI[patch14.sha256sum] = "6f1a68320d01522ca1ea5a737124ecc8739f3dcbfea2dee21e3ccf839a21a817"

-S = "${WORKDIR}/${BPN}-${PV}"
-
 inherit autotools

 EXTRA_AUTORECONF += "--exclude=autoheader"
diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index eb47dad..7df8efa 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -9,8 +9,6 @@ DEPENDS_class-native = "bzip2-replacement-native zlib-native virtual/update-alte
 RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} xz run-postinsts perl"
 RDEPENDS_${PN}_class-native = "xz-native"

-S = "${WORKDIR}/${BPN}-${PV}"
-
 inherit autotools gettext perlnative pkgconfig systemd

 python () {
diff --git a/meta/recipes-devtools/gdb/gdb-7.8.1.inc b/meta/recipes-devtools/gdb/gdb-7.8.1.inc
index 6fa13bc..510ea18 100644
--- a/meta/recipes-devtools/gdb/gdb-7.8.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-7.8.1.inc
@@ -4,8 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
 		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"

-S = "${WORKDIR}/${BPN}-${PV}"
-
 SRC_URI[md5sum] = "997492cc3475c96f35ecc8775248c9b1"
 SRC_URI[sha256sum] = "d7a923d876ecfa1cec4c1c79c014c9d8e58783a25855a95cf260275f61990647"

diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb
index ef0019f..48a2f93 100644
--- a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb
+++ b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb
@@ -18,8 +18,6 @@ SRC_URI = "http://ymorin.is-a-geek.org/download/${BPN}/${BP}.tar.xz"
 SRC_URI[md5sum] = "b939280dcc83f8feabd87a1d5f9b00c2"
 SRC_URI[sha256sum] = "ea2615a62c74bea6ce3b38402f00c7513858f307f6ba7aa9fdbf0bbc12bcf407"

-S = "${WORKDIR}/${BPN}-${PV}"
-
 inherit autotools
 do_configure_prepend () {
 	mkdir -p scripts/.autostuff/m4
diff --git a/meta/recipes-devtools/opkg/opkg_0.2.4.bb b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
index 7b49d5e..c979d4d 100644
--- a/meta/recipes-devtools/opkg/opkg_0.2.4.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
@@ -19,8 +19,6 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://0001-opkg-key-Backport-improvements.patch \
 "

-S = "${WORKDIR}/${BPN}-${PV}"
-
 SRC_URI[md5sum] = "40ed2aee15abc8d550539449630091bd"
 SRC_URI[sha256sum] = "0f40c7e457d81edf9aedc07c778f4697111ab163a38ef95999faece015453086"

diff --git a/meta/recipes-extended/texinfo/texinfo_4.8.bb b/meta/recipes-extended/texinfo/texinfo_4.8.bb
index 6b36b97..13678e0 100644
--- a/meta/recipes-extended/texinfo/texinfo_4.8.bb
+++ b/meta/recipes-extended/texinfo/texinfo_4.8.bb
@@ -26,7 +26,6 @@ SRC_URI = "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
 SRC_URI[md5sum] = "4e9a1a591ed236003d0d4b008bf07eef"
 SRC_URI[sha256sum] = "1f3cdeebe65fdf510f55d765ab1031b54416aa5bc2635b6a54ef9bcb2367c917"

-S = "${WORKDIR}/${BP}"
 tex_texinfo = "texmf/tex/texinfo"

 inherit gettext autotools
diff --git a/meta/recipes-extended/texinfo/texinfo_5.2.bb b/meta/recipes-extended/texinfo/texinfo_5.2.bb
index d50a86e..8dbcaa1 100644
--- a/meta/recipes-extended/texinfo/texinfo_5.2.bb
+++ b/meta/recipes-extended/texinfo/texinfo_5.2.bb
@@ -40,7 +40,6 @@ SRC_URI = "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
 SRC_URI[md5sum] = "1b8f98b80a8e6c50422125e07522e8db"
 SRC_URI[sha256sum] = "6b8ca30e9b6f093b54fe04439e5545e564c63698a806a48065c0bba16994cf74"

-S = "${WORKDIR}/${BP}"
 tex_texinfo = "texmf/tex/texinfo"

 inherit gettext autotools
diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
index 59a04fa..3529cb2 100644
--- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
+++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
@@ -12,8 +12,6 @@ INC_PR = "r8"

 SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.bz2"

-S = "${WORKDIR}/${BPN}-${PV}"
-
 inherit autotools pkgconfig distro_features_check

 FILES_${PN} += " ${libdir}/X11/${BPN} ${datadir}/X11/app-defaults/"
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index 7a710dc..7ddd1c7 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -11,8 +11,6 @@ DEPENDS = "virtual/xserver xproto randrproto util-macros"

 SRC_URI = "${XORG_MIRROR}/individual/driver/${BPN}-${PV}.tar.bz2"

-S = "${WORKDIR}/${BPN}-${PV}"
-
 FILES_${PN} += " ${libdir}/xorg/modules/drivers/*.so"
 FILES_${PN}-dbg += " ${libdir}/xorg/modules/drivers/.debug"

diff --git a/meta/recipes-support/taglib/taglib_1.9.1.bb b/meta/recipes-support/taglib/taglib_1.9.1.bb
index 55e345f..746ed7e 100644
--- a/meta/recipes-support/taglib/taglib_1.9.1.bb
+++ b/meta/recipes-support/taglib/taglib_1.9.1.bb
@@ -12,8 +12,6 @@ SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 SRC_URI[md5sum] = "0d35df96822bbd564c5504cb3c2e4d86"
 SRC_URI[sha256sum] = "72d371cd1419a87ae200447a53bff2be219283071e80fd12337928cc967dc71a"

-S = "${WORKDIR}/${BP}"
-
 BINCONFIG = "${bindir}/taglib-config"

 inherit cmake pkgconfig binconfig-disabled

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

