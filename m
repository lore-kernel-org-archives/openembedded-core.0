Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8B02A75772
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 02:35:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8I2ZAVZ008230
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Sep 2015 19:35:10 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 17 Sep 2015 19:35:09 -0700
Message-ID: <55FB785C.3000708@windriver.com>
Date: Fri, 18 Sep 2015 10:35:08 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1442475786.git.liezhi.yang@windriver.com>
	<449d22e4acbad6a99a1a7372181c815e528a579f.1442475786.git.liezhi.yang@windriver.com>
	<CAJTo0Lb=Osg5hn1vvgXKCRn6RFhJZngP=iAeLJB=ADBdGHnHRQ@mail.gmail.com>
In-Reply-To: <CAJTo0Lb=Osg5hn1vvgXKCRn6RFhJZngP=iAeLJB=ADBdGHnHRQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] meta: fix build with gettext 0.16.1
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
X-List-Received-Date: Fri, 18 Sep 2015 02:35:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/17/2015 10:32 PM, Burton, Ross wrote:
>
> On 17 September 2015 at 08:46, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     -DEPENDS = "gtk+ dbus-glib intltool-native"
>     +DEPENDS = "gtk+ dbus-glib intltool-native gettext-native"
>
>
> Shouldn't this be "inherit gettext"?

Thanks, updated in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/low_version


commit 7fab77e612b616c57fa474334a2415477828fe58
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Thu Sep 17 00:39:35 2015 -0700

     meta: fix build with gettext 0.16.1

     The gettext 0.16.1 doesn't install any m4 files to sysroot, please see
     the following commit:

       commit 9e10db5bdfe77c0ef2aff2f1cf89958b62c294a1
       Author: Christopher Larson <kergoth@gmail.com>
       Date:   Mon Mar 17 18:10:54 2014 +0000

           gettext-0.16.1: kill target m4 macros from sysroot

     This is aim for using gettext-native's macros(gettext-native-0.19.4),
     but when we set:
       PREFERRED_VERSION_gettext = "0.16.1"
     And build the recipes like pcmanfm, we would get errors when
     do_configure:

     configure:5164: error: possibly undefined macro: AM_NLS

     This is because autotools_copy_aclocals doesn't copy the native macros
     for target unless they're direct dependencies.

     inherit gettext will fix the problem.

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb 
b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index f5575d2..d647874 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/connectivity/connman-gnome.git \

  S = "${WORKDIR}/git"

-inherit autotools-brokensep gtk-icon-cache pkgconfig
+inherit autotools-brokensep gtk-icon-cache pkgconfig gettext

  RDEPENDS_${PN} = "connman"

diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb 
b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index c30454c..140589b 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -31,7 +31,7 @@ CFLAGS_prepend = "-DHAVE_ANIMATION "

  RDEPENDS_${PN}-dev = ""

-inherit gnomebase
+inherit gnomebase gettext
  GNOME_COMPRESS_TYPE="bz2"

  python populate_packages_prepend() {
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb 
b/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
index cebc83b..0c9263b 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "libsecret is a library for storing and retrieving 
passwords and other
  LICENSE = "LGPLv2.1"
  LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"

-inherit gnomebase gtk-doc
+inherit gnomebase gtk-doc gettext

  DEPENDS = "glib-2.0 libgcrypt"

diff --git a/meta/recipes-graphics/xorg-app/xwininfo_1.1.3.bb 
b/meta/recipes-graphics/xorg-app/xwininfo_1.1.3.bb
index 7a45241..b78439e 100644
--- a/meta/recipes-graphics/xorg-app/xwininfo_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-app/xwininfo_1.1.3.bb
@@ -9,6 +9,8 @@ and a number of other items."
  LIC_FILES_CHKSUM = "file://COPYING;md5=78976cd3115f6faf615accc4e094d90e"
  DEPENDS += "libxext libxmu"

+inherit gettext
+
  PE = "0"

  SRC_URI[md5sum] = "b777bafb674555e48fd8437618270931"
diff --git a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb 
b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
index f715149..d74afb6 100644
--- a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
+++ b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
@@ -19,7 +19,7 @@ PR = "r2"

  SRC_URI_append_poky = " file://owl-menu.patch;apply=yes "

-inherit autotools pkgconfig distro_features_check
+inherit autotools pkgconfig distro_features_check gettext

  EXTRA_OECONF = " --enable-chooser --disable-emacs --disable-print"

diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb 
b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb
index 4467303..8b589ae 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb
@@ -23,7 +23,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.xz \
  SRC_URI[md5sum] = "c993402d407b0a3fc076f842ac1bc5c9"
  SRC_URI[sha256sum] = 
"cfa8d82fc63be147045174bef074807e1e32ce8c6bf4dbd8fad49e260bcf6380"

-inherit autotools pkgconfig distro_features_check
+inherit autotools pkgconfig distro_features_check gettext

  # The startup-notification requires x11 in DISTRO_FEATURES
  REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta/recipes-sato/puzzles/oh-puzzles_git.bb 
b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
index 36cd2cc..13e0b80 100644
--- a/meta/recipes-sato/puzzles/oh-puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
@@ -25,7 +25,7 @@ SRC_URI_append_poky = " 
file://oh-puzzles-owl-menu.patch;striplevel=0 "

  S = "${WORKDIR}/git"

-inherit autotools pkgconfig distro_features_check
+inherit autotools pkgconfig distro_features_check gettext

  bindir = "/usr/games"

diff --git a/meta/recipes-support/atk/at-spi2-core_2.16.0.bb 
b/meta/recipes-support/atk/at-spi2-core_2.16.0.bb
index 933cbe7..fb759b5 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.16.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.16.0.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = 
"1c0b77fb8ce81abbf1d80c0afee9858b3f9229f673b7881995fe0fc16b

  DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native"

-inherit autotools gtk-doc pkgconfig distro_features_check
+inherit autotools gtk-doc pkgconfig distro_features_check gettext
  # depends on virtual/libx11
  REQUIRED_DISTRO_FEATURES = "x11"

diff --git a/meta/recipes-support/libfm/libfm-extra_1.2.3.bb 
b/meta/recipes-support/libfm/libfm-extra_1.2.3.bb
index 46d2d62..1c7ccf7 100644
--- a/meta/recipes-support/libfm/libfm-extra_1.2.3.bb
+++ b/meta/recipes-support/libfm/libfm-extra_1.2.3.bb
@@ -20,6 +20,6 @@ EXTRA_OECONF = "--with-extra-only --with-gtk=no"

  PR = "r1"

-inherit autotools pkgconfig gtk-doc
+inherit autotools pkgconfig gtk-doc gettext

  do_configure[dirs] =+ "${S}/m4"
diff --git a/meta/recipes-support/libfm/libfm_1.2.3.bb 
b/meta/recipes-support/libfm/libfm_1.2.3.bb
index 629502f..f5be33b 100644
--- a/meta/recipes-support/libfm/libfm_1.2.3.bb
+++ b/meta/recipes-support/libfm/libfm_1.2.3.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = 
"c692f1624a4cbc8d1dd55f3b3f3369fbf5d26f63a916e2c295230b2344

  PR = "r1"

-inherit autotools pkgconfig gtk-doc
+inherit autotools pkgconfig gtk-doc gettext

  do_configure[dirs] =+ "${S}/m4"

diff --git a/meta/recipes-support/pinentry/pinentry_0.9.2.bb 
b/meta/recipes-support/pinentry/pinentry_0.9.2.bb
index c836ca4..cb01ad6 100644
--- a/meta/recipes-support/pinentry/pinentry_0.9.2.bb
+++ b/meta/recipes-support/pinentry/pinentry_0.9.2.bb
@@ -8,7 +8,7 @@ HOMEPAGE = 
"http://www.gnupg.org/related_software/pinentry/index.en.html"
  LICENSE = "GPLv2"
  LIC_FILES_CHKSUM = "file://COPYING;md5=cbbd794e2a0a289b9dfcc9f513d1996e"

-inherit autotools
+inherit autotools gettext

  SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2"


>
> Ross

