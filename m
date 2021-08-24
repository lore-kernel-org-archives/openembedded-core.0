Received: from esa1.hc324-48.eu.iphmx.com (esa1.hc324-48.eu.iphmx.com [207.54.68.119])
 by mx.groups.io with SMTP id smtpd.web08.38674.1629811018337957693
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 06:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=Eh+gl/pN;
 spf=pass (domain: bmw.de, ip: 207.54.68.119, mailfrom: prvs=8635361c3=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1629811018; x=1661347018;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qWjTgTdOSmhwlZNhN49sOB3QNpwCiVfSzsiGw1xYNXM=;
  b=Eh+gl/pNDi6lbg3On/Bs10xnN5DPkpZZyltCLm8mrFjuK+AfINHE8QkQ
   QQh42r1L2mOMBotfhNwdl/9qBdsGuDR1m78uGaveaXsBirDAC3QTWaoe3
   VKE19gS3oyw0eA4yO8PfYLGfPw8XBbxAbD2miF5Xft1+AS3XC0ot68BUI
   k=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa1.hc324-48.eu.iphmx.com with ESMTP/TLS; 24 Aug 2021 15:16:54 +0200
Received: from esabb5.muc ([160.50.100.47])  by esagw5.muc with ESMTP/TLS;
 24 Aug 2021 15:16:53 +0200
Received: from smucm33m.bmwgroup.net (HELO smucm33m.europe.bmw.corp) ([160.46.167.69])
 by esabb5.muc with ESMTP/TLS; 24 Aug 2021 15:16:53 +0200
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33m.europe.bmw.corp
 (160.46.167.69) with Microsoft SMTP Server (TLS;
 Tue, 24 Aug 2021 15:16:52 +0200
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.018; Tue,
 24 Aug 2021 15:16:52 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <samuli.piippo@gmail.com>
CC: <purushottamchoudhary29@gmail.com>,
	<openembedded-core@lists.openembedded.org>, <sakoman@gmail.com>,
	<nisha.parrakat@kpit.com>
Subject: Re: [OE-core] [poky][master][PATCH] assimp: added patch to fix hardcoded non-existing paths in CMake modules
Thread-Topic: [OE-core] [poky][master][PATCH] assimp: added patch to fix
 hardcoded non-existing paths in CMake modules
Thread-Index: AQHXlasw/W9oysFzBEabpiH9AatmqauCR46AgAAZxwCAACKNAIAAA9qA
Date: Tue, 24 Aug 2021 13:16:52 +0000
Message-ID: <YSTxQ1TFv3YN/Kja@korppu>
References: <1629454029-8279-1-git-send-email-purushottamchoudhary29@gmail.com>
 <CABXoSoWHBQ+Z_m+p_okxwAQ9OnKN1E-7jUVn8a3wsVgSgT+a1w@mail.gmail.com>
 <YSTRDNYs9UOCzagb@korppu>
 <CABXoSoXRwZsA4Axj+UO3hmVH7GD1T29SE8sAF7TeVgeouJV4Eg@mail.gmail.com>
In-Reply-To: <CABXoSoXRwZsA4Axj+UO3hmVH7GD1T29SE8sAF7TeVgeouJV4Eg@mail.gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CB39A78E481DDC4386592F3910FF1834@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 24, 2021 at 04:03:04PM +0300, Samuli Piippo wrote:
> assimpTargets-release.cmake has it hardcoded:
>=20
>     set_target_properties(assimp::assimp PROPERTIES
>       IMPORTED_IMPLIB_RELEASE "/usr/lib/${importLibraryName}"
>       IMPORTED_LOCATION_RELEASE "/usr/bin/${sharedLibraryName}"
>     )

Ok, I think this is the one we need to remove completely. The defaults
will work.

> before it used to be:
>=20
>     set_target_properties(assimp::assimp PROPERTIES
>       IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/${importLibraryName}=
"
>       IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/${sharedLibraryNam=
e}"

This doesn't work for us when some of the paths are different.

The defaults set in the generated CMake toolchain files will work.

Cheers,

-Mikko

>     )
>=20
>=20
> -samuli
>=20
> On Tue, 24 Aug 2021 at 13:59, <Mikko.Rapeli@bmw.de> wrote:
>=20
> > Hi,
> >
> > On Tue, Aug 24, 2021 at 12:27:09PM +0300, Samuli Piippo wrote:
> > > Looks like this commit breaks something in the cmake files.
> > >
> > > When using assimp from another recipe (Qt3D), it will try to use the
> > > library from host path:
> > >
> > > /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(69):
> > >  set(sharedLibraryName libassimp.so.5 )
> > > /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(71):
> > >  set_target_properties(assimp::assimp PROPERTIES IMPORTED_SONAME_RELE=
ASE
> > > libassimp.so.5 IMPORTED_LOCATION_RELEASE /usr/lib/libassimp.so.5 )
> >
> > Can you see where the /usr/lib search path comes from?
> >
> > To me, the assimp CMake files try to do way too much and should instead
> > rely
> > on default search paths and the cross compile toolchain file.
> >
> > Cheers,
> >
> > -Mikko
> >
> > > Whereas, before the patch, it was correctly using it from the sysroot=
:
> > >
> > > /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(69):
> > >  set(sharedLibraryName libassimp.so.5 )
> > > /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(71):
> > >  set_target_properties(assimp::assimp PROPERTIES IMPORTED_SONAME_RELE=
ASE
> > > libassimp.so.5 IMPORTED_LOCATION_RELEASE
> > >
> > /home/qt/work/build/build/tmp/work/core2-32-poky-linux/qt3d/6.3.0-r0/re=
cipe-sysroot/usr/lib/libassimp.so.5
> > > )
> > > /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(75):  list(APPE=
ND
> > > _IMPORT_CHECK_TARGETS assimp::assimp )
> > > /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(76):  list(APPE=
ND
> > > _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > >
> > /home/qt/work/build/build/tmp/work/core2-32-poky-linux/qt3d/6.3.0-r0/re=
cipe-sysroot/usr/lib/libassimp.so.5
> > > )
> > >
> > > Probably explains why the IMPORT_CHECK_TARGETS had to be removed.
> > >
> > >
> > >
> > > On Fri, 20 Aug 2021 at 13:07, Purushottam Choudhary <
> > > purushottamchoudhary29@gmail.com> wrote:
> > >
> > > > assimp CMake modules were adding non-existing paths to its CMake
> > modules
> > > > breaking builds for users of assimp. Remove the hardcoded paths wit=
h
> > > > an upstream patch with small tweaks.
> > > >
> > > > Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.=
com
> > >
> > > > ---
> > > >  ...-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch |  68 ------
> > > >  ...ove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch |  32 +++
> > > >  .../assimp/use-GNUInstallDirs-where-possible.patch | 257
> > > > +++++++++++++++++++++
> > > >  meta/recipes-graphics/vulkan/assimp_5.0.1.bb       |   3 +-
> > > >  4 files changed, 291 insertions(+), 69 deletions(-)
> > > >  delete mode 100644
> > > >
> > meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-to-=
search-library.patch
> > > >  create mode 100644
> > > >
> > meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-=
_IMPORT_CHECK_TARGETS.patch
> > > >  create mode 100644
> > > >
> > meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible.p=
atch
> > > >
> > > > diff --git
> > > >
> > a/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-t=
o-search-library.patch
> > > >
> > b/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-t=
o-search-library.patch
> > > > deleted file mode 100644
> > > > index 34c5bfa..0000000
> > > > ---
> > > >
> > a/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-t=
o-search-library.patch
> > > > +++ /dev/null
> > > > @@ -1,68 +0,0 @@
> > > > -From 58f576d6f240b08957a402960cdf06c74201ac7b Mon Sep 17 00:00:00 =
2001
> > > > -From: Hongxu Jia <hongxu.jia@windriver.com>
> > > > -Date: Thu, 12 Dec 2019 22:16:15 -0800
> > > > -Subject: [PATCH] Use ASSIMP_LIB_INSTALL_DIR to search library
> > > > -
> > > > -Use ASSIMP_LIB_INSTALL_DIR rather than hardcoded /lib to search
> > library
> > > > -
> > > > -Upstream-Status: Inappropriate [oe specific]
> > > > -
> > > > -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > > > -
> > > > ----
> > > > - assimpTargets-release.cmake.in | 16 ++++++++--------
> > > > - 1 file changed, 8 insertions(+), 8 deletions(-)
> > > > -
> > > > -diff --git a/assimpTargets-release.cmake.in b/
> > > > assimpTargets-release.cmake.in
> > > > -index f3db8f1..b8a066a 100644
> > > > ---- a/assimpTargets-release.cmake.in
> > > > -+++ b/assimpTargets-release.cmake.in
> > > > -@@ -42,11 +42,11 @@ if(MSVC)
> > > > -     # Import target "assimp::assimp" for configuration "Release"
> > > > -     set_property(TARGET assimp::assimp APPEND PROPERTY
> > > > IMPORTED_CONFIGURATIONS RELEASE)
> > > > -     set_target_properties(assimp::assimp PROPERTIES
> > > > --      IMPORTED_IMPLIB_RELEASE
> > > > "${_IMPORT_PREFIX}/lib/${importLibraryName}"
> > > > -+      IMPORTED_IMPLIB_RELEASE
> > "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@
> > > > /${importLibraryName}"
> > > > -       IMPORTED_LOCATION_RELEASE
> > > > "${_IMPORT_PREFIX}/bin/${sharedLibraryName}"
> > > > -     )
> > > > -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "${_IMPORT_PREFIX}/lib/${importLibraryName}")
> > > > -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${importLibraryName}")
> > > > -     list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "${_IMPORT_PREFIX}/bin/${sharedLibraryName}" )
> > > > -   else()
> > > > -     set(staticLibraryName
> > > > "assimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > > > -@@ -54,10 +54,10 @@ if(MSVC)
> > > > -     # Import target "assimp::assimp" for configuration "Release"
> > > > -     set_property(TARGET assimp::assimp APPEND PROPERTY
> > > > IMPORTED_CONFIGURATIONS RELEASE)
> > > > -     set_target_properties(assimp::assimp PROPERTIES
> > > > --      IMPORTED_LOCATION_RELEASE
> > > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> > > > -+      IMPORTED_LOCATION_RELEASE
> > > > "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}"
> > > > -     )
> > > > -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}")
> > > > -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}")
> > > > -   endif()
> > > > -
> > > > - else()
> > > > -@@ -70,17 +70,17 @@ else()
> > > > -     endif()
> > > > -     set_target_properties(assimp::assimp PROPERTIES
> > > > -       IMPORTED_SONAME_RELEASE "${sharedLibraryName}"
> > > > --      IMPORTED_LOCATION_RELEASE
> > > > "${_IMPORT_PREFIX}/lib/${sharedLibraryName}"
> > > > -+      IMPORTED_LOCATION_RELEASE
> > > > "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${sharedLibraryName}"
> > > > -     )
> > > > -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "${_IMPORT_PREFIX}/lib/${sharedLibraryName}" )
> > > > -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${sharedLibraryName}" )
> > > > -   else()
> > > > -     set(staticLibraryName
> > > > "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > > > -     set_target_properties(assimp::assimp PROPERTIES
> > > > --      IMPORTED_LOCATION_RELEASE
> > > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> > > > -+      IMPORTED_LOCATION_RELEASE
> > > > "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}"
> > > > -     )
> > > > -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}" )
> > > > -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}" )
> > > > -   endif()
> > > > - endif()
> > > > -
> > > > diff --git
> > > >
> > a/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-fro=
m-_IMPORT_CHECK_TARGETS.patch
> > > >
> > b/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-fro=
m-_IMPORT_CHECK_TARGETS.patch
> > > > new file mode 100644
> > > > index 0000000..1078148
> > > > --- /dev/null
> > > > +++
> > > >
> > b/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-fro=
m-_IMPORT_CHECK_TARGETS.patch
> > > > @@ -0,0 +1,32 @@
> > > > +From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > > > +Date: Fri, 13 Aug 2021 16:42:48 +0530
> > > > +Subject: [PATCH] assimp: remove shared lib from _IMPORT_CHECK_TARG=
ETS
> > > > +
> > > > +In the target assimp::assimp shared library verification removed
> > > > +as it is giving configuration error when used by 3rd part componen=
t to
> > > > +configure itself using assimp::assimp target
> > > > +
> > > > +Upstream-Status: Inappropriate [oe specific]
> > > > +
> > > > +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > > > +---
> > > > + assimpTargets-release.cmake.in | 4 ++--
> > > > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > > > +
> > > > +diff --git a/assimpTargets-release.cmake.in b/
> > > > assimpTargets-release.cmake.in
> > > > +index cd2fac7e0..52edc7990 100644
> > > > +--- a/assimpTargets-release.cmake.in
> > > > ++++ b/assimpTargets-release.cmake.in
> > > > +@@ -72,8 +72,8 @@ else()
> > > > +       IMPORTED_SONAME_RELEASE "${sharedLibraryName}"
> > > > +       IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@
> > > > /${sharedLibraryName}"
> > > > +     )
> > > > +-    list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> > > > ++    #list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > > ++    #list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> > > > +   else()
> > > > +     set(staticLibraryName
> > > > "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > > > +     set_target_properties(assimp::assimp PROPERTIES
> > > > +--
> > > > +2.17.1
> > > > diff --git
> > > >
> > a/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible=
.patch
> > > >
> > b/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible=
.patch
> > > > new file mode 100644
> > > > index 0000000..e4f5b9c
> > > > --- /dev/null
> > > > +++
> > > >
> > b/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible=
.patch
> > > > @@ -0,0 +1,257 @@
> > > > +From cbf94fd62ff831879d10f99aa7766d391ae8a9b7 Mon Sep 17 00:00:00 =
2001
> > > > +From: =3D?UTF-8?q?Victor=3D20Matar=3DC3=3DA9?=3D <matare@fh-aachen=
.de>
> > > > +Date: Tue, 31 Mar 2020 21:30:07 +0200
> > > > +Subject: [PATCH] use GNUInstallDirs where possible
> > > > +
> > > > +Emulate the CMAKE_INSTALL_FULL_* variables on non-Unix systems and
> > > > +disable redefining FHS-mandated install locations via user-editabl=
e
> > > > +ASSIMP_*_INSTALL_DIR variables. Instead, if it REALLY proves
> > necessary,
> > > > +Unix users can edit the advanced, canonical CMAKE_INSTALL_* variab=
les.
> > > > +---
> > > > + CMakeLists.txt                 | 36
> > ++++++++++++++++++++++------------
> > > > + assimp.pc.in                   |  6 ++----
> > > > + assimpTargets-debug.cmake.in   | 20 +++++++++----------
> > > > + assimpTargets-release.cmake.in | 18 ++++++++---------
> > > > + assimpTargets.cmake.in         | 15 +-------------
> > > > + 5 files changed, 45 insertions(+), 50 deletions(-)
> > > > +
> > > > +Upstream-Status: Backport
> > > > +Comment: Additionally remove setting of ASSIMP_LIBRARY_DIRS,
> > > > ASSIMP_INCLUDE_DIRS
> > > > +         and INTERFACE_INCLUDE_DIRECTORIES as default cross compil=
e
> > paths
> > > > are enough
> > > > +         and setting them manually adds non-existing paths to CMak=
e
> > > > modules
> > > > +
> > > > +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > > > +
> > > > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > > > +index dcafb649f5..c23c0df33e 100644
> > > > +--- a/CMakeLists.txt
> > > > ++++ b/CMakeLists.txt
> > > > +@@ -230,11 +230,6 @@ SET(LIBASSIMP-DEV_COMPONENT
> > > > "libassimp${ASSIMP_VERSION_MAJOR}.${ASSIMP_VERSION_M
> > > > + SET(CPACK_COMPONENTS_ALL assimp-bin ${LIBASSIMP_COMPONENT}
> > > > ${LIBASSIMP-DEV_COMPONENT} assimp-dev)
> > > > + SET(ASSIMP_LIBRARY_SUFFIX "" CACHE STRING "Suffix to append to
> > library
> > > > names")
> > > > +
> > > > +-IF( UNIX )
> > > > +-  # Use GNUInstallDirs for Unix predefined directories
> > > > +-  INCLUDE(GNUInstallDirs)
> > > > +-ENDIF( UNIX )
> > > > +-
> > > > + # Grouped compiler settings
> > > > + IF ((CMAKE_C_COMPILER_ID MATCHES "GNU") AND NOT
> > CMAKE_COMPILER_IS_MINGW)
> > > > +   IF(NOT HUNTER_ENABLED)
> > > > +@@ -329,14 +324,6 @@ IF ( CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_D=
IR )
> > > > +   SET( CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_HOME_DIRECTORY}/bi=
n" )
> > > > + ENDIF ( CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR )
> > > > +
> > > > +-# Cache these to allow the user to override them manually.
> > > > +-SET( ASSIMP_LIB_INSTALL_DIR "lib" CACHE STRING
> > > > +-  "Path the built library files are installed to." )
> > > > +-SET( ASSIMP_INCLUDE_INSTALL_DIR "include" CACHE STRING
> > > > +-  "Path the header files are installed to." )
> > > > +-SET( ASSIMP_BIN_INSTALL_DIR "bin" CACHE STRING
> > > > +-  "Path the tool executables are installed to." )
> > > > +-
> > > > + get_cmake_property(is_multi_config GENERATOR_IS_MULTI_CONFIG)
> > > > +
> > > > + IF (INJECT_DEBUG_POSTFIX AND (is_multi_config OR CMAKE_BUILD_TYPE
> > > > STREQUAL "Debug"))
> > > > +@@ -391,6 +378,29 @@ IF(HUNTER_ENABLED)
> > > > +   )
> > > > + ELSE(HUNTER_ENABLED)
> > > > +   # cmake configuration files
> > > > ++
> > > > ++  IF( UNIX )
> > > > ++    # Use GNUInstallDirs for Unix predefined directories
> > > > ++    INCLUDE(GNUInstallDirs)
> > > > ++
> > > > ++    SET( ASSIMP_LIB_INSTALL_DIR ${CMAKE_INSTALL_LIBDIR})
> > > > ++    SET( ASSIMP_INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_INCLUDEDIR})
> > > > ++    SET( ASSIMP_BIN_INSTALL_DIR ${CMAKE_INSTALL_BINDIR})
> > > > ++  ELSE( UNIX )
> > > > ++    # Cache these to allow the user to override them on non-Unix
> > > > platforms
> > > > ++    SET( ASSIMP_LIB_INSTALL_DIR "lib" CACHE STRING
> > > > ++      "Path the built library files are installed to." )
> > > > ++    SET( ASSIMP_INCLUDE_INSTALL_DIR "include" CACHE STRING
> > > > ++      "Path the header files are installed to." )
> > > > ++    SET( ASSIMP_BIN_INSTALL_DIR "bin" CACHE STRING
> > > > ++      "Path the tool executables are installed to." )
> > > > ++
> > > > ++    SET(CMAKE_INSTALL_FULL_INCLUDEDIR
> > > > ${CMAKE_INSTALL_PREFIX}/${ASSIMP_INCLUDE_INSTALL_DIR})
> > > > ++    SET(CMAKE_INSTALL_FULL_LIBDIR
> > > > ${CMAKE_INSTALL_PREFIX}/${ASSIMP_LIB_INSTALL_DIR})
> > > > ++    SET(CMAKE_INSTALL_FULL_BINDIR
> > > > ${CMAKE_INSTALL_PREFIX}/${ASSIMP_BIN_INSTALL_DIR})
> > > > ++  ENDIF( UNIX )
> > > > ++
> > > > ++
> > > > +   CONFIGURE_FILE("${CMAKE_CURRENT_SOURCE_DIR}/assimp-config.cmake=
.in
> > "
> > > >        "${CMAKE_CURRENT_BINARY_DIR}/assimp-config.cmake" @ONLY
> > IMMEDIATE)
> > > > +   CONFIGURE_FILE("${CMAKE_CURRENT_SOURCE_DIR}/assimpTargets.cmake=
.in
> > "
> > > >        "${CMAKE_CURRENT_BINARY_DIR}/assimpTargets.cmake" @ONLY
> > IMMEDIATE)
> > > > +   IF (is_multi_config)
> > > > +diff --git a/assimp.pc.in b/assimp.pc.in
> > > > +index c659e19f2c..555a3a1d3b 100644
> > > > +--- a/assimp.pc.in
> > > > ++++ b/assimp.pc.in
> > > > +@@ -1,7 +1,5 @@
> > > > +-prefix=3D@CMAKE_INSTALL_PREFIX@
> > > > +-exec_prefix=3D@CMAKE_INSTALL_PREFIX@/
> > > > +-libdir=3D@CMAKE_INSTALL_PREFIX@/@ASSIMP_LIB_INSTALL_DIR@
> > > > +-includedir=3D@CMAKE_INSTALL_PREFIX@
> > > > /../include/@ASSIMP_INCLUDE_INSTALL_DIR@
> > > > ++libdir=3D@CMAKE_INSTALL_FULL_LIBDIR@
> > > > ++includedir=3D@CMAKE_INSTALL_FULL_INCLUDEDIR@
> > > > +
> > > > + Name: @CMAKE_PROJECT_NAME@
> > > > + Description: Import various well-known 3D model formats in an uni=
form
> > > > manner.
> > > > +diff --git a/assimpTargets-debug.cmake.in b/
> > assimpTargets-debug.cmake.in
> > > > +index 1ebe2a6081..f5034c9349 100644
> > > > +--- a/assimpTargets-debug.cmake.in
> > > > ++++ b/assimpTargets-debug.cmake.in
> > > > +@@ -42,22 +42,22 @@ if(MSVC)
> > > > +     # Import target "assimp::assimp" for configuration "Debug"
> > > > +     set_property(TARGET assimp::assimp APPEND PROPERTY
> > > > IMPORTED_CONFIGURATIONS DEBUG)
> > > > +     set_target_properties(assimp::assimp PROPERTIES
> > > > +-      IMPORTED_IMPLIB_DEBUG
> > "${_IMPORT_PREFIX}/lib/${importLibraryName}"
> > > > +-      IMPORTED_LOCATION_DEBUG
> > > > "${_IMPORT_PREFIX}/bin/${sharedLibraryName}"
> > > > ++      IMPORTED_IMPLIB_DEBUG "@CMAKE_INSTALL_FULL_LIBDIR@
> > > > /${importLibraryName}"
> > > > ++      IMPORTED_LOCATION_DEBUG "@CMAKE_INSTALL_FULL_BINDIR@
> > > > /${sharedLibraryName}"
> > > > +     )
> > > > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "${_IMPORT_PREFIX}/lib/${importLibraryName}")
> > > > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "${_IMPORT_PREFIX}/bin/${sharedLibraryName}" )
> > > > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "@CMAKE_INSTALL_FULL_LIBDIR@/${importLibraryName}")
> > > > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "@CMAKE_INSTALL_FULL_BINDIR@/${sharedLibraryName}" )
> > > > +   else()
> > > > +     set(staticLibraryName
> > > > "assimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_DEBUG_POSTFIX
> > > > @@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > > > +
> > > > +     # Import target "assimp::assimp" for configuration "Debug"
> > > > +     set_property(TARGET assimp::assimp APPEND PROPERTY
> > > > IMPORTED_CONFIGURATIONS DEBUG)
> > > > +     set_target_properties(assimp::assimp PROPERTIES
> > > > +-      IMPORTED_LOCATION_DEBUG
> > > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> > > > ++      IMPORTED_LOCATION_DEBUG "@CMAKE_INSTALL_FULL_LIBDIR@
> > > > /${staticLibraryName}"
> > > > +     )
> > > > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}")
> > > > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}")
> > > > +   endif()
> > > > +
> > > > + else()
> > > > +@@ -66,17 +66,17 @@ else()
> > > > +     set(sharedLibraryName
> > > > "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_DEBUG_POSTFIX
> > > > @@CMAKE_SHARED_LIBRARY_SUFFIX@.@ASSIMP_VERSION_MAJOR@")
> > > > +     set_target_properties(assimp::assimp PROPERTIES
> > > > +       IMPORTED_SONAME_DEBUG "${sharedLibraryName}"
> > > > +-      IMPORTED_LOCATION_DEBUG
> > > > "${_IMPORT_PREFIX}/lib/${sharedLibraryName}"
> > > > ++      IMPORTED_LOCATION_DEBUG "@CMAKE_INSTALL_FULL_LIBDIR@
> > > > /${sharedLibraryName}"
> > > > +     )
> > > > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "${_IMPORT_PREFIX}/lib/${sharedLibraryName}" )
> > > > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> > > > +   else()
> > > > +     set(staticLibraryName
> > > > "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_DEBUG_POSTFIX
> > > > @@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > > > +     set_target_properties(assimp::assimp PROPERTIES
> > > > +-      IMPORTED_LOCATION_DEBUG
> > > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> > > > ++      IMPORTED_LOCATION_DEBUG "@CMAKE_INSTALL_FULL_LIBDIR@
> > > > /${staticLibraryName}"
> > > > +     )
> > > > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}" )
> > > > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}" )
> > > > +   endif()
> > > > + endif()
> > > > +
> > > > +diff --git a/assimpTargets-release.cmake.in b/
> > > > assimpTargets-release.cmake.in
> > > > +index f3db8f12cd..a416e8899b 100644
> > > > +--- a/assimpTargets-release.cmake.in
> > > > ++++ b/assimpTargets-release.cmake.in
> > > > +@@ -42,12 +42,12 @@ if(MSVC)
> > > > +     # Import target "assimp::assimp" for configuration "Release"
> > > > +     set_property(TARGET assimp::assimp APPEND PROPERTY
> > > > IMPORTED_CONFIGURATIONS RELEASE)
> > > > +     set_target_properties(assimp::assimp PROPERTIES
> > > > +-      IMPORTED_IMPLIB_RELEASE
> > > > "${_IMPORT_PREFIX}/lib/${importLibraryName}"
> > > > +-      IMPORTED_LOCATION_RELEASE
> > > > "${_IMPORT_PREFIX}/bin/${sharedLibraryName}"
> > > > ++      IMPORTED_IMPLIB_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@
> > > > /${importLibraryName}"
> > > > ++      IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_BINDIR@
> > > > /${sharedLibraryName}"
> > > > +     )
> > > > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "${_IMPORT_PREFIX}/lib/${importLibraryName}")
> > > > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "${_IMPORT_PREFIX}/bin/${sharedLibraryName}" )
> > > > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "@CMAKE_INSTALL_FULL_LIBDIR@/${importLibraryName}")
> > > > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "@CMAKE_INSTALL_FULL_BINDIR@/${sharedLibraryName}" )
> > > > +   else()
> > > > +     set(staticLibraryName
> > > > "assimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > > > +
> > > > +@@ -57,7 +57,7 @@ if(MSVC)
> > > > +       IMPORTED_LOCATION_RELEASE
> > > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> > > > +     )
> > > > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}")
> > > > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}")
> > > > +   endif()
> > > > +
> > > > + else()
> > > > +@@ -70,17 +70,17 @@ else()
> > > > +     endif()
> > > > +     set_target_properties(assimp::assimp PROPERTIES
> > > > +       IMPORTED_SONAME_RELEASE "${sharedLibraryName}"
> > > > +-      IMPORTED_LOCATION_RELEASE
> > > > "${_IMPORT_PREFIX}/lib/${sharedLibraryName}"
> > > > ++      IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@
> > > > /${sharedLibraryName}"
> > > > +     )
> > > > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "${_IMPORT_PREFIX}/lib/${sharedLibraryName}" )
> > > > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> > > > +   else()
> > > > +     set(staticLibraryName
> > > > "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > > > +     set_target_properties(assimp::assimp PROPERTIES
> > > > +-      IMPORTED_LOCATION_RELEASE
> > > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> > > > ++      IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@
> > > > /${staticLibraryName}"
> > > > +     )
> > > > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}" )
> > > > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > > "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}" )
> > > > +   endif()
> > > > + endif()
> > > > +
> > > > +@@ -91,8 +91,6 @@ get_filename_component(ASSIMP_ROOT_DIR
> > > > "@CMAKE_INSTALL_PREFIX@" REALPATH)
> > > > +
> > > > + set( ASSIMP_CXX_FLAGS ) # dynamically linked library
> > > > + set( ASSIMP_LINK_FLAGS "" )
> > > > +-set( ASSIMP_LIBRARY_DIRS "${ASSIMP_ROOT_DIR}/@ASSIMP_LIB_INSTALL_=
DIR@
> > ")
> > > > +-set( ASSIMP_INCLUDE_DIRS
> > "${ASSIMP_ROOT_DIR}/@ASSIMP_INCLUDE_INSTALL_DIR@
> > > > ")
> > > > + if(ASSIMP_BUILD_SHARED_LIBS)
> > > > +   set( ASSIMP_LIBRARIES ${sharedLibraryName})
> > > > + else()
> > > > +
> > > > +diff --git a/assimpTargets.cmake.in b/assimpTargets.cmake.in
> > > > +index ab1a8d2c7b..ef90c834a6 100644
> > > > +--- a/assimpTargets.cmake.in
> > > > ++++ b/assimpTargets.cmake.in
> > > > +@@ -40,16 +40,6 @@ unset(_targetsDefined)
> > > > + unset(_targetsNotDefined)
> > > > + unset(_expectedTargets)
> > > > +
> > > > +-
> > > > +-# Compute the installation prefix relative to this file.
> > > > +-get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_FILE}=
"
> > PATH)
> > > > +-get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
> > > > +-get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
> > > > +-get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
> > > > +-if(_IMPORT_PREFIX STREQUAL "/")
> > > > +-  set(_IMPORT_PREFIX "")
> > > > +-endif()
> > > > +-
> > > > + # Create imported target assimp::assimp
> > > > + if(@BUILD_SHARED_LIBS@)
> > > > +   add_library(assimp::assimp SHARED IMPORTED)
> > > > +@@ -60,7 +50,7 @@ endif()
> > > > + set_target_properties(assimp::assimp PROPERTIES
> > > > +   COMPATIBLE_INTERFACE_STRING "assimp_MAJOR_VERSION"
> > > > +   INTERFACE_assimp_MAJOR_VERSION "1"
> > > > +-  INTERFACE_INCLUDE_DIRECTORIES
> > > > "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
> > > > ++  #INTERFACE_INCLUDE_DIRECTORIES "@CMAKE_INSTALL_FULL_INCLUDEDIR@=
"
> > > > +   #INTERFACE_LINK_LIBRARIES
> > > > "TxtUtils::TxtUtils;MealyMachine::MealyMachine"
> > > > + )
> > > > +
> > > > +@@ -75,9 +65,6 @@ foreach(f ${CONFIG_FILES})
> > > > +   include(${f})
> > > > + endforeach()
> > > > +
> > > > +-# Cleanup temporary variables.
> > > > +-set(_IMPORT_PREFIX)
> > > > +-
> > > > + # Loop over all imported files and verify that they actually exis=
t
> > > > + foreach(target ${_IMPORT_CHECK_TARGETS} )
> > > > +   foreach(file ${_IMPORT_CHECK_FILES_FOR_${target}} )
> > > > +
> > > > diff --git a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> > > > b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> > > > index 4eb0cef..89c555f 100644
> > > > --- a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> > > > +++ b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> > > > @@ -10,7 +10,8 @@ DEPENDS =3D "zlib"
> > > >
> > > >  SRC_URI =3D "git://
> > github.com/assimp/assimp.git;branch=3Dassimp_5.0_release \
> > > >
> > > > file://0001-closes-https-github.com-assimp-assimp-issues-2733-up.pa=
tch
> > \
> > > > -
> >  file://0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch
> > > > \
> > > > +           file://use-GNUInstallDirs-where-possible.patch \
> > > > +
> > > >  file://0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.pa=
tch
> > \
> > > >             "
> > > >  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>(\d+(\.\d+)+))"
> > > >
> > > > --
> > > > 2.7.4
> > > >
> > > >
> > > >
> > > >
> > > >
> >
> > >
> > >=20
> > >
> >
