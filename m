Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id E79DC6C6F9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 14:55:05 +0000 (UTC)
Received: by wgv5 with SMTP id 5so11515182wgv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 07:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=WhvzJu8W6uuOZltW8d+AQkPs2sxnZQDuRTjVwbeoMa0=;
	b=QR9opZNwSlappiD5QvEl69gdvti5g3xkywCE/o3vuv1Y5zoRqNPCa6qMc4LuH2wS9T
	pL6ptsfSA7826pZEWH1FQEH+7boPkw+Vh5fDDB8kaLqs/XJk8wuIcyeSZ7aKguQBSsik
	v2gEMJf1OcwdwT7hJKBxUrvi7mGv52xpcWHjrgPzusdmNefxXd/1Y7fbrCVY1uX5gAR4
	miSWMr391tA5KnrEvQkzpU6kY/MpHUt6d5zs207y2aLXeFjvB5rIgCOk18HsGgtM8+jA
	pFk8StUpy+C5e2+maTZJeyzP0AnU6TnWsm8fv/mKwKxmFUQ1ZhMASLX6dSqN1n8/tNsw
	xnlQ==
X-Received: by 10.180.101.138 with SMTP id fg10mr42420035wib.46.1433343306312; 
	Wed, 03 Jun 2015 07:55:06 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id q2sm1446054wjz.15.2015.06.03.07.55.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jun 2015 07:55:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 3 Jun 2015 16:55:20 +0200
To: Moritz Blume <moritz.blume@bmw-carit.de>
Message-ID: <20150603145520.GB2380@jama>
References: <1433339853-29869-1-git-send-email-moritz.blume@bmw-carit.de>
	<1433339853-29869-2-git-send-email-moritz.blume@bmw-carit.de>
MIME-Version: 1.0
In-Reply-To: <1433339853-29869-2-git-send-email-moritz.blume@bmw-carit.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] cmake: Upgrade 2.8.12.2 -> 3.2.2
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
X-List-Received-Date: Wed, 03 Jun 2015 14:55:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2015 at 03:57:33PM +0200, Moritz Blume wrote:
> Patches "qt4-fail-silent.patch" and "support-oe-qt4-tools-names.patch"
> were adapted in order to fit to CMake 3.2.2 (refer to the commit
> message in the respective patch for details).
> Patch "cmake-2.8.11.2-FindFreetype.patch" was dropped since it was
> rejected upstream and its functionality otherwise implemented in the
> meantime.
>=20
> The "Ugly hack" in cmake.inc is removed since these things belong
> to QT related recipes, not CMake.

No, it's issue in CMake build trying to find Qt files, so it has to be
fixed in CMake build. This hack used to be part of meta-qt5 (which
provides these files which are causing CMake build to fail, but it was
moved to oe-core so that people don't need to adjust the cmake bbappends
when they are using different branches of oe-core and meta-qt5.

> Note that CMake 3 needs to have the full compiler path in the toolchain
> file (see cmake.bbclass).

Does it work correctly when sstate is reused on host with different
paths?

> Signed-off-by: Moritz Blume <moritz.blume@bmw-carit.de>
> ---
>  meta/classes/cmake.bbclass                         |  8 ++-
>  .../cmake/cmake-native_2.8.12.2.bb                 | 19 ------
>  meta/recipes-devtools/cmake/cmake-native_3.2.2.bb  | 19 ++++++
>  meta/recipes-devtools/cmake/cmake.inc              | 25 +-------
>  .../cmake/cmake/cmake-2.8.11.2-FindFreetype.patch  | 47 ---------------
>  .../cmake/cmake/qt4-fail-silent.patch              | 30 ++++++++--
>  .../cmake/cmake/support-oe-qt4-tools-names.patch   | 70 ++++++++++------=
------
>  meta/recipes-devtools/cmake/cmake_2.8.12.2.bb      | 52 ----------------
>  meta/recipes-devtools/cmake/cmake_3.2.2.bb         | 56 +++++++++++++++++
>  9 files changed, 140 insertions(+), 186 deletions(-)
>  delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
>  create mode 100644 meta/recipes-devtools/cmake/cmake-native_3.2.2.bb
>  delete mode 100644 meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-Find=
Freetype.patch
>  delete mode 100644 meta/recipes-devtools/cmake/cmake_2.8.12.2.bb
>  create mode 100644 meta/recipes-devtools/cmake/cmake_3.2.2.bb
>=20
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index 1ebb936..c97fd02 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -10,9 +10,11 @@ CCACHE =3D ""
>  # We want the staging and installing functions from autotools
>  inherit autotools
> =20
> -# C/C++ Compiler (without cpu arch/tune arguments)
> -OECMAKE_C_COMPILER ?=3D "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
> -OECMAKE_CXX_COMPILER ?=3D "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
> +# Full path to C/C++ Compiler (without cpu arch/tune arguments)
> +C_COMPILER =3D "$(echo ${CC} | sed 's/^\([^ ]*\).*/\1/')"
> +CXX_COMPILER =3D "$(echo ${CXX} | sed 's/^\([^ ]*\).*/\1/')"
> +OECMAKE_C_COMPILER ?=3D "$(which ${C_COMPILER})"
> +OECMAKE_CXX_COMPILER ?=3D "$(which ${CXX_COMPILER})"
>  OECMAKE_AR ?=3D "${AR}"
> =20
>  # Compiler flags
> diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb b/meta/=
recipes-devtools/cmake/cmake-native_2.8.12.2.bb
> deleted file mode 100644
> index e40dfdd..0000000
> --- a/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -require cmake.inc
> -inherit native
> -
> -# Using cmake's internal libarchive, so some dependencies are needed
> -DEPENDS +=3D "bzip2-native zlib-native"
> -
> -SRC_URI +=3D "\
> -    file://cmlibarchive-disable-ext2fs.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "17c6513483d23590cbce6957ec6d1e66"
> -SRC_URI[sha256sum] =3D "8c6574e9afabcb9fc66f463bb1f2f051958d86c85c37fccf=
067eb1a44a120e5e"
> -
> -# Disable ccmake since we don't depend on ncurses
> -CMAKE_EXTRACONF =3D "\
> -    -DBUILD_CursesDialog=3D0 \
> -    -DENABLE_ACL=3D0 -DHAVE_ACL_LIBACL_H=3D0 \
> -    -DHAVE_SYS_ACL_H=3D0 \
> -"
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.2.2.bb b/meta/rec=
ipes-devtools/cmake/cmake-native_3.2.2.bb
> new file mode 100644
> index 0000000..17e9e2c
> --- /dev/null
> +++ b/meta/recipes-devtools/cmake/cmake-native_3.2.2.bb
> @@ -0,0 +1,19 @@
> +require cmake.inc
> +inherit native
> +
> +# Using cmake's internal libarchive, so some dependencies are needed
> +DEPENDS +=3D "bzip2-native zlib-native"
> +
> +SRC_URI +=3D "\
> +    file://cmlibarchive-disable-ext2fs.patch \
> +"
> +
> +SRC_URI[md5sum] =3D "2da57308071ea98b10253a87d2419281"
> +SRC_URI[sha256sum] =3D "ade94e6e36038774565f2aed8866415443444fb7a362eb0e=
a5096e40d5407c78"
> +
> +# Disable ccmake since we don't depend on ncurses
> +CMAKE_EXTRACONF =3D "\
> +    -DBUILD_CursesDialog=3D0 \
> +    -DENABLE_ACL=3D0 -DHAVE_ACL_LIBACL_H=3D0 \
> +    -DHAVE_SYS_ACL_H=3D0 \
> +"
> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtool=
s/cmake/cmake.inc
> index 28b7f2d..226b12f 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -6,7 +6,7 @@ HOMEPAGE =3D "http://www.cmake.org/"
>  BUGTRACKER =3D "http://public.kitware.com/Bug/my_view_page.php"
>  SECTION =3D "console/utils"
>  LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D "file://Copyright.txt;md5=3Dbb2fa3a08736b842556f617=
1bb9e8ae1 \
> +LIC_FILES_CHKSUM =3D "file://Copyright.txt;md5=3D3ba5a6c34481652ce573e5c=
4e1d707e4 \
>                      file://Source/cmake.h;beginline=3D1;endline=3D10;md5=
=3D341736dae83c9e344b53eeb1bc7d7bc2"
> =20
>  CMAKE_MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
> @@ -14,35 +14,12 @@ CMAKE_MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV',1)=
=2Esplit('.')[0:2])}"
>  SRC_URI =3D "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${=
PV}.tar.gz \
>             file://support-oe-qt4-tools-names.patch \
>             file://qt4-fail-silent.patch \
> -           file://cmake-2.8.11.2-FindFreetype.patch \
>             "
> =20
>  PR =3D "r1"
> =20
>  inherit autotools
> =20
> -# Ugly hack to work around undefined OE_QMAKE_PATH_EXTERNAL_HOST_BINS va=
riable
> -# and possibly missing qmake binary (qtbase-native can be removed from s=
ysroot
> -# e.g. in order to upgrade it, even when there is target qtbase)
> -
> -# Fixes errors like this in cmake(-native).do_configure:
> -#| -- Performing Test run_pic_test - Success
> -#| CMake Error at tmp-eglibc/sysroots/qemuarm/usr/lib/cmake/Qt5Core/Qt5C=
oreConfig.cmake:27 (message):
> -#|   The imported target "Qt5::Core" references the file
> -#|
> -#|      "/qmake"
> -#|
> -#|   but this file does not exist.  Possible reasons include:
> -
> -do_configure_prepend() {
> -	sed -i 's/^find_package(Qt5Core QUIET)$/#find_package(Qt5Core QUIET)/g'=
 ${S}/Tests/RunCMake/CMakeLists.txt
> -	sed -i 's/^find_package(Qt5Core REQUIRED)/#find_package(Qt5Core REQUIRE=
D)/g' ${S}/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
> -	sed -i 's/^  find_package(Qt5Widgets REQUIRED)/#  find_package(Qt5Widge=
ts REQUIRED)/g' ${S}/Tests/QtAutomoc/CMakeLists.txt
> -	sed -i 's/^find_package(Qt5Core REQUIRED)/#find_package(Qt5Core REQUIRE=
D)/g' ${S}/Tests/Qt4And5Automoc/CMakeLists.txt
> -	sed -i 's/^  find_package(Qt5Widgets QUIET NO_MODULE)/#  find_package(Q=
t5Widgets QUIET NO_MODULE)/g' ${S}/Tests/CMakeLists.txt
> -	sed -i 's/^find_package(Qt5Widgets QUIET)/#find_package(Qt5Widgets QUIE=
T)/g' ${S}/Source/QtDialog/CMakeLists.txt
> -}
> -
>  # Extra flags to pass to cmake invoked by bootstrap
>  CMAKE_EXTRACONF =3D ""
> =20
> diff --git a/meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-FindFreetyp=
e.patch b/meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-FindFreetype.pat=
ch
> deleted file mode 100644
> index 1b523c0..0000000
> --- a/meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-FindFreetype.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From: Julian Ospald <hasufell@gentoo.org>
> -Date: Sun Dec  8 13:38:06 UTC 2013
> -Subject: fix check for freetype-2.5.1
> -
> -Upstream-Status: Submitted http://www.cmake.org/Bug/view.php?id=3D14601
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> -
> ---- old/Modules/FindFreetype.cmake
> -+++ new/Modules/FindFreetype.cmake
> -@@ -64,6 +64,19 @@
> -   PATH_SUFFIXES include/freetype2 include
> - )
> -=20
> -+if(NOT FREETYPE_INCLUDE_DIR_freetype2)
> -+  find_path(FREETYPE_INCLUDE_DIR_freetype2 config/ftheader.h
> -+    HINTS
> -+      ENV FREETYPE_DIR
> -+    PATHS
> -+      /usr/X11R6
> -+      /usr/local/X11R6
> -+      /usr/local/X11
> -+      /usr/freeware
> -+    PATH_SUFFIXES include/freetype2 include
> -+  )
> -+endif()
> -+
> - find_library(FREETYPE_LIBRARY
> -   NAMES freetype libfreetype freetype219
> -   HINTS
> -@@ -82,8 +95,14 @@
> - endif()
> - set(FREETYPE_LIBRARIES "${FREETYPE_LIBRARY}")
> -=20
> --if(FREETYPE_INCLUDE_DIR_freetype2 AND EXISTS "${FREETYPE_INCLUDE_DIR_fr=
eetype2}/freetype/freetype.h")
> --    file(STRINGS "${FREETYPE_INCLUDE_DIR_freetype2}/freetype/freetype.h=
" freetype_version_str
> -+if(EXISTS "${FREETYPE_INCLUDE_DIR_freetype2}/freetype/freetype.h")
> -+  set(FREETYPE_H "${FREETYPE_INCLUDE_DIR_freetype2}/freetype/freetype.h=
")
> -+elseif(EXISTS "${FREETYPE_INCLUDE_DIR_freetype2}/freetype.h")
> -+  set(FREETYPE_H "${FREETYPE_INCLUDE_DIR_freetype2}/freetype.h")
> -+endif()
> -+
> -+if(FREETYPE_INCLUDE_DIR_freetype2 AND FREETYPE_H)
> -+    file(STRINGS "${FREETYPE_H}" freetype_version_str
> -          REGEX "^#[\t ]*define[\t ]+FREETYPE_(MAJOR|MINOR|PATCH)[\t ]+[=
0-9]+$")
> -=20
> -     unset(FREETYPE_VERSION_STRING)
> diff --git a/meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch b/me=
ta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch
> index fd39f3f..80fc277 100644
> --- a/meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch
> +++ b/meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch
> @@ -13,10 +13,21 @@ Upstream-Status: Pending
> =20
>  Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> =20
> ---- cmake-2.8.11/Modules/FindQt4.cmake	2013-07-04 10:20:42.092848274 +01=
00
> -+++ cmake-2.8.11/Modules/FindQt4.cmake	2013-07-04 10:52:15.693380555 +01=
00
> -@@ -1025,21 +1025,22 @@
> -     set(_configs)
> +The patch was slightly adapted in order to match cmake 3.2.2:
> +Another set_property was introduced which had to be included
> +within the if(QT_QTCORE_FOUND) statement.
> +
> +Signed-off-by: Moritz Blume <moritz.blume@bmw-carit.de>
> +---
> + Modules/FindQt4.cmake | 39 ++++++++++++++++++++-------------------
> + 1 file changed, 20 insertions(+), 19 deletions(-)
> +
> +diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
> +index 6704769..9048e35 100644
> +--- a/Modules/FindQt4.cmake
> ++++ b/Modules/FindQt4.cmake
> +@@ -1000,25 +1000,26 @@ if (QT_QMAKE_EXECUTABLE AND
> +     endif()
>     endmacro()
>  =20
>  -
> @@ -28,6 +39,10 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.inte=
l.com>
>  -      "${QT_MKSPECS_DIR}/default"
>  -      ${QT_INCLUDE_DIR}
>  -  )
> +-  set_property(TARGET Qt4::QtCore APPEND PROPERTY
> +-    INTERFACE_COMPILE_DEFINITIONS
> +-      $<$<NOT:$<CONFIG:Debug>>:QT_NO_DEBUG>
> +-  )
>  -  set_property(TARGET Qt4::QtCore PROPERTY
>  -    INTERFACE_QT_MAJOR_VERSION 4
>  -  )
> @@ -43,6 +58,10 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.inte=
l.com>
>  +        "${QT_MKSPECS_DIR}/default"
>  +        ${QT_INCLUDE_DIR}
>  +    )
> ++    set_property(TARGET Qt4::QtCore APPEND PROPERTY
> ++      INTERFACE_COMPILE_DEFINITIONS
> ++        $<$<NOT:$<CONFIG:Debug>>:QT_NO_DEBUG>
> ++    )
>  +    set_property(TARGET Qt4::QtCore PROPERTY
>  +      INTERFACE_QT_MAJOR_VERSION 4
>  +    )
> @@ -53,3 +72,6 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel=
=2Ecom>
>  =20
>     foreach(QT_MODULE ${QT_MODULES})
>       _QT4_ADJUST_LIB_VARS(${QT_MODULE})
> +--=20
> +1.9.1
> +
> diff --git a/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names=
=2Epatch b/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.pat=
ch
> index 0e311f7..15cbca8 100644
> --- a/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
> +++ b/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
> @@ -11,11 +11,19 @@ Upstream-Status: Inappropriate [embedded specific]
> =20
>  Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> =20
> -Index: cmake-2.8.11/Modules/FindQt4.cmake
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- cmake-2.8.11.orig/Modules/FindQt4.cmake
> -+++ cmake-2.8.11/Modules/FindQt4.cmake
> -@@ -569,7 +569,7 @@ endfunction()
> +The patch was slightly adapted in order to match cmake 3.2.2:
> +Instead of find_program, _find_qt4_program is now used.
> +
> +Signed-off-by: Moritz Blume <moritz.blume@bmw-carit.de>
> +---
> + Modules/FindQt4.cmake | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
> +index 11091b5..6704769 100644
> +--- a/Modules/FindQt4.cmake
> ++++ b/Modules/FindQt4.cmake
> +@@ -522,7 +522,7 @@ endfunction()
>  =20
>   set(QT4_INSTALLED_VERSION_TOO_OLD FALSE)
>  =20
> @@ -23,36 +31,24 @@ Index: cmake-2.8.11/Modules/FindQt4.cmake
>  +set(_QT4_QMAKE_NAMES qmake qmake2 qmake4 qmake-qt4 qmake-mac)
>   _qt4_find_qmake("${_QT4_QMAKE_NAMES}" QT_QMAKE_EXECUTABLE QTVERSION)
>  =20
> - if (QT_QMAKE_EXECUTABLE AND QTVERSION)
> -@@ -1157,19 +1157,19 @@ if (QT_QMAKE_EXECUTABLE AND QTVERSION)
> -     )
> -=20
> -   find_program(QT_RCC_EXECUTABLE
> --    NAMES rcc
> -+    NAMES rcc4 rcc
> -     PATHS ${QT_BINARY_DIR}
> -     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
> -     )
> + if (QT_QMAKE_EXECUTABLE AND
> +@@ -1148,12 +1148,12 @@ if (QT_QMAKE_EXECUTABLE AND
> +   _find_qt4_program(QT_MOC_EXECUTABLE Qt4::moc moc-qt4 moc4 moc)
> +   _find_qt4_program(QT_UIC_EXECUTABLE Qt4::uic uic-qt4 uic4 uic)
> +   _find_qt4_program(QT_UIC3_EXECUTABLE Qt4::uic3 uic3)
> +-  _find_qt4_program(QT_RCC_EXECUTABLE Qt4::rcc rcc)
> +-  _find_qt4_program(QT_DBUSCPP2XML_EXECUTABLE Qt4::qdbuscpp2xml qdbuscp=
p2xml)
> +-  _find_qt4_program(QT_DBUSXML2CPP_EXECUTABLE Qt4::qdbusxml2cpp qdbusxm=
l2cpp)
> ++  _find_qt4_program(QT_RCC_EXECUTABLE Qt4::rcc rcc4 rcc)
> ++  _find_qt4_program(QT_DBUSCPP2XML_EXECUTABLE Qt4::qdbuscpp2xml qdbuscp=
p2xml4 qdbuscpp2xml)
> ++  _find_qt4_program(QT_DBUSXML2CPP_EXECUTABLE Qt4::qdbusxml2cpp qdbusxm=
l2cpp4 qdbusxml2cpp)
> +   _find_qt4_program(QT_LUPDATE_EXECUTABLE Qt4::lupdate lupdate-qt4 lupd=
ate4 lupdate)
> +   _find_qt4_program(QT_LRELEASE_EXECUTABLE Qt4::lrelease lrelease-qt4 l=
release4 lrelease)
> +-  _find_qt4_program(QT_QCOLLECTIONGENERATOR_EXECUTABLE Qt4::qcollection=
generator qcollectiongenerator-qt4 qcollectiongenerator)
> ++  _find_qt4_program(QT_QCOLLECTIONGENERATOR_EXECUTABLE Qt4::qcollection=
generator qcollectiongenerator-qt4 qcollectiongenerator qcollectiongenerato=
r4)
> +   _find_qt4_program(QT_DESIGNER_EXECUTABLE Qt4::designer designer-qt4 d=
esigner4 designer)
> +   _find_qt4_program(QT_LINGUIST_EXECUTABLE Qt4::linguist linguist-qt4 l=
inguist4 linguist)
>  =20
> -   find_program(QT_DBUSCPP2XML_EXECUTABLE
> --    NAMES qdbuscpp2xml
> -+    NAMES qdbuscpp2xml4 qdbuscpp2xml
> -     PATHS ${QT_BINARY_DIR}
> -     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
> -     )
> -=20
> -   find_program(QT_DBUSXML2CPP_EXECUTABLE
> --    NAMES qdbusxml2cpp
> -+    NAMES qdbusxml2cp4 qdbusxml2cpp
> -     PATHS ${QT_BINARY_DIR}
> -     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
> -     )
> -@@ -1187,7 +1187,7 @@ if (QT_QMAKE_EXECUTABLE AND QTVERSION)
> -     )
> -=20
> -   find_program(QT_QCOLLECTIONGENERATOR_EXECUTABLE
> --    NAMES qcollectiongenerator-qt4 qcollectiongenerator
> -+    NAMES qcollectiongenerator-qt4 qcollectiongenerator qcollectiongene=
rator4
> -     PATHS ${QT_BINARY_DIR}
> -     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH
> -     )
> +--=20
> +1.9.1
> +
> diff --git a/meta/recipes-devtools/cmake/cmake_2.8.12.2.bb b/meta/recipes=
-devtools/cmake/cmake_2.8.12.2.bb
> deleted file mode 100644
> index 66a6af6..0000000
> --- a/meta/recipes-devtools/cmake/cmake_2.8.12.2.bb
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -require cmake.inc
> -
> -inherit cmake
> -
> -DEPENDS +=3D "curl expat zlib libarchive"
> -
> -SRC_URI +=3D "file://dont-run-cross-binaries.patch"
> -
> -SRC_URI_append_class-nativesdk =3D " \
> -    file://OEToolchainConfig.cmake \
> -    file://environment.d-cmake.sh"
> -
> -SRC_URI[md5sum] =3D "17c6513483d23590cbce6957ec6d1e66"
> -SRC_URI[sha256sum] =3D "8c6574e9afabcb9fc66f463bb1f2f051958d86c85c37fccf=
067eb1a44a120e5e"
> -
> -# Strip ${prefix} from ${docdir}, set result into docdir_stripped
> -python () {
> -    prefix=3Dd.getVar("prefix", True)
> -    docdir=3Dd.getVar("docdir", True)
> -
> -    if not docdir.startswith(prefix):
> -        raise bb.build.FuncFailed('docdir must contain prefix as its pre=
fix')
> -
> -    docdir_stripped =3D docdir[len(prefix):]
> -    if len(docdir_stripped) > 0 and docdir_stripped[0] =3D=3D '/':
> -        docdir_stripped =3D docdir_stripped[1:]
> -
> -    d.setVar("docdir_stripped", docdir_stripped)
> -}
> -
> -EXTRA_OECMAKE=3D" \
> -    -DCMAKE_DOC_DIR=3D${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
> -    -DCMAKE_USE_SYSTEM_LIBRARIES=3D1 \
> -    -DKWSYS_CHAR_IS_SIGNED=3D1 \
> -    -DBUILD_CursesDialog=3D0 \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-DKWSYS_LFS_WO=
RKS=3D1', '-DKWSYS_LFS_DISABLE=3D1', d)} \
> -"
> -
> -do_install_append_class-nativesdk() {
> -    mkdir -p ${D}${datadir}/cmake
> -    install -m 644 ${WORKDIR}/OEToolchainConfig.cmake ${D}${datadir}/cma=
ke/
> -
> -    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
> -    install -m 644 ${WORKDIR}/environment.d-cmake.sh ${D}${SDKPATHNATIVE=
}/environment-setup.d/cmake.sh
> -}
> -
> -FILES_${PN}_append_class-nativesdk =3D " ${SDKPATHNATIVE}"
> -
> -FILES_${PN} +=3D "${datadir}/cmake-${CMAKE_MAJOR_VERSION}"
> -FILES_${PN}-doc +=3D "${docdir}/cmake-${CMAKE_MAJOR_VERSION}"
> -
> -BBCLASSEXTEND =3D "nativesdk"
> diff --git a/meta/recipes-devtools/cmake/cmake_3.2.2.bb b/meta/recipes-de=
vtools/cmake/cmake_3.2.2.bb
> new file mode 100644
> index 0000000..4765f6c
> --- /dev/null
> +++ b/meta/recipes-devtools/cmake/cmake_3.2.2.bb
> @@ -0,0 +1,56 @@
> +require cmake.inc
> +
> +inherit cmake
> +
> +DEPENDS +=3D "curl expat zlib libarchive xz ncurses bzip2"
> +
> +SRC_URI_append_class-nativesdk =3D " \
> +    file://OEToolchainConfig.cmake \
> +    file://environment.d-cmake.sh"
> +
> +SRC_URI[md5sum] =3D "2da57308071ea98b10253a87d2419281"
> +SRC_URI[sha256sum] =3D "ade94e6e36038774565f2aed8866415443444fb7a362eb0e=
a5096e40d5407c78"
> +
> +# Strip ${prefix} from ${docdir}, set result into docdir_stripped
> +python () {
> +    prefix=3Dd.getVar("prefix", True)
> +    docdir=3Dd.getVar("docdir", True)
> +
> +    if not docdir.startswith(prefix):
> +        raise bb.build.FuncFailed('docdir must contain prefix as its pre=
fix')
> +
> +    docdir_stripped =3D docdir[len(prefix):]
> +    if len(docdir_stripped) > 0 and docdir_stripped[0] =3D=3D '/':
> +        docdir_stripped =3D docdir_stripped[1:]
> +
> +    d.setVar("docdir_stripped", docdir_stripped)
> +}
> +
> +EXTRA_OECMAKE=3D" \
> +    -DCMAKE_DOC_DIR=3D${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
> +    -DCMAKE_USE_SYSTEM_LIBRARY_BZIP2=3D1 \
> +    -DCMAKE_USE_SYSTEM_LIBRARY_CURL=3D1 \
> +    -DCMAKE_USE_SYSTEM_LIBRARY_EXPAT=3D1 \
> +    -DCMAKE_USE_SYSTEM_LIBRARY_FORM=3D1 \
> +    -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=3D1 \
> +    -DCMAKE_USE_SYSTEM_LIBRARY_LIBLZMA=3D1 \
> +    -DCMAKE_USE_SYSTEM_LIBRARY_ZLIB=3D1 \
> +    -DKWSYS_CHAR_IS_SIGNED=3D1 \
> +    -DBUILD_CursesDialog=3D0 \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-DKWSYS_LFS_WO=
RKS=3D1', '-DKWSYS_LFS_DISABLE=3D1', d)} \
> +"
> +
> +do_install_append_class-nativesdk() {
> +    mkdir -p ${D}${datadir}/cmake
> +    install -m 644 ${WORKDIR}/OEToolchainConfig.cmake ${D}${datadir}/cma=
ke/
> +
> +    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
> +    install -m 644 ${WORKDIR}/environment.d-cmake.sh ${D}${SDKPATHNATIVE=
}/environment-setup.d/cmake.sh
> +}
> +
> +FILES_${PN}_append_class-nativesdk =3D " ${SDKPATHNATIVE}"
> +
> +FILES_${PN} +=3D "${datadir}/cmake-${CMAKE_MAJOR_VERSION}"
> +FILES_${PN}-doc +=3D "${docdir}/cmake-${CMAKE_MAJOR_VERSION}"
> +
> +BBCLASSEXTEND =3D "nativesdk"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

