Received: from esa7.hc324-48.eu.iphmx.com (esa7.hc324-48.eu.iphmx.com [207.54.71.126])
 by mx.groups.io with SMTP id smtpd.web08.37265.1629802770321582826
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 03:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=pQusSWNm;
 spf=pass (domain: bmw.de, ip: 207.54.71.126, mailfrom: prvs=8635361c3=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1629802770; x=1661338770;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qVN3MLJzfN/BtwBRQNsow77tUi/cmbRQurFVyTo5jIc=;
  b=pQusSWNmqIYD60ojXaK6v7J8JaRSiqsnxF5IKoasrKlKhb0UBWTxegD+
   errAk2zl1aHDTS6oNEtbssFaNG14x0c+hEPrtahi2chBdLAxYikCJBvJT
   JzX/MNv7B6zszpfwLF7viRJYnAlMpDuyb0ASMGACH3Yw30jUgx/3z1Ntb
   M=;
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa7.hc324-48.eu.iphmx.com with ESMTP/TLS; 24 Aug 2021 12:59:26 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw1.muc with ESMTP/TLS;
 24 Aug 2021 12:59:26 +0200
Received: from smucm33j.bmwgroup.net (HELO smucm33j.europe.bmw.corp) ([160.46.167.66])
 by esabb2.muc with ESMTP/TLS; 24 Aug 2021 12:59:25 +0200
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33j.europe.bmw.corp
 (160.46.167.66) with Microsoft SMTP Server (TLS;
 Tue, 24 Aug 2021 12:59:25 +0200
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.018; Tue,
 24 Aug 2021 12:59:25 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <samuli.piippo@gmail.com>
CC: <purushottamchoudhary29@gmail.com>,
	<openembedded-core@lists.openembedded.org>, <sakoman@gmail.com>,
	<nisha.parrakat@kpit.com>
Subject: Re: [OE-core] [poky][master][PATCH] assimp: added patch to fix hardcoded non-existing paths in CMake modules
Thread-Topic: [OE-core] [poky][master][PATCH] assimp: added patch to fix
 hardcoded non-existing paths in CMake modules
Thread-Index: AQHXlasw/W9oysFzBEabpiH9AatmqauCR46AgAAZxwA=
Date: Tue, 24 Aug 2021 10:59:25 +0000
Message-ID: <YSTRDNYs9UOCzagb@korppu>
References: <1629454029-8279-1-git-send-email-purushottamchoudhary29@gmail.com>
 <CABXoSoWHBQ+Z_m+p_okxwAQ9OnKN1E-7jUVn8a3wsVgSgT+a1w@mail.gmail.com>
In-Reply-To: <CABXoSoWHBQ+Z_m+p_okxwAQ9OnKN1E-7jUVn8a3wsVgSgT+a1w@mail.gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3EC1DA09DFE0E7439BE742CAE507DDFC@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 24, 2021 at 12:27:09PM +0300, Samuli Piippo wrote:
> Looks like this commit breaks something in the cmake files.
>=20
> When using assimp from another recipe (Qt3D), it will try to use the
> library from host path:
>=20
> /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(69):
>  set(sharedLibraryName libassimp.so.5 )
> /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(71):
>  set_target_properties(assimp::assimp PROPERTIES IMPORTED_SONAME_RELEASE
> libassimp.so.5 IMPORTED_LOCATION_RELEASE /usr/lib/libassimp.so.5 )

Can you see where the /usr/lib search path comes from?

To me, the assimp CMake files try to do way too much and should instead rel=
y
on default search paths and the cross compile toolchain file.

Cheers,

-Mikko

> Whereas, before the patch, it was correctly using it from the sysroot:
>=20
> /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(69):
>  set(sharedLibraryName libassimp.so.5 )
> /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(71):
>  set_target_properties(assimp::assimp PROPERTIES IMPORTED_SONAME_RELEASE
> libassimp.so.5 IMPORTED_LOCATION_RELEASE
> /home/qt/work/build/build/tmp/work/core2-32-poky-linux/qt3d/6.3.0-r0/reci=
pe-sysroot/usr/lib/libassimp.so.5
> )
> /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(75):  list(APPEND
> _IMPORT_CHECK_TARGETS assimp::assimp )
> /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(76):  list(APPEND
> _IMPORT_CHECK_FILES_FOR_assimp::assimp
> /home/qt/work/build/build/tmp/work/core2-32-poky-linux/qt3d/6.3.0-r0/reci=
pe-sysroot/usr/lib/libassimp.so.5
> )
>=20
> Probably explains why the IMPORT_CHECK_TARGETS had to be removed.
>=20
>=20
>=20
> On Fri, 20 Aug 2021 at 13:07, Purushottam Choudhary <
> purushottamchoudhary29@gmail.com> wrote:
>=20
> > assimp CMake modules were adding non-existing paths to its CMake module=
s
> > breaking builds for users of assimp. Remove the hardcoded paths with
> > an upstream patch with small tweaks.
> >
> > Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
> > ---
> >  ...-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch |  68 ------
> >  ...ove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch |  32 +++
> >  .../assimp/use-GNUInstallDirs-where-possible.patch | 257
> > +++++++++++++++++++++
> >  meta/recipes-graphics/vulkan/assimp_5.0.1.bb       |   3 +-
> >  4 files changed, 291 insertions(+), 69 deletions(-)
> >  delete mode 100644
> > meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-to-=
search-library.patch
> >  create mode 100644
> > meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-=
_IMPORT_CHECK_TARGETS.patch
> >  create mode 100644
> > meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible.p=
atch
> >
> > diff --git
> > a/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-t=
o-search-library.patch
> > b/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-t=
o-search-library.patch
> > deleted file mode 100644
> > index 34c5bfa..0000000
> > ---
> > a/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-t=
o-search-library.patch
> > +++ /dev/null
> > @@ -1,68 +0,0 @@
> > -From 58f576d6f240b08957a402960cdf06c74201ac7b Mon Sep 17 00:00:00 2001
> > -From: Hongxu Jia <hongxu.jia@windriver.com>
> > -Date: Thu, 12 Dec 2019 22:16:15 -0800
> > -Subject: [PATCH] Use ASSIMP_LIB_INSTALL_DIR to search library
> > -
> > -Use ASSIMP_LIB_INSTALL_DIR rather than hardcoded /lib to search librar=
y
> > -
> > -Upstream-Status: Inappropriate [oe specific]
> > -
> > -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > -
> > ----
> > - assimpTargets-release.cmake.in | 16 ++++++++--------
> > - 1 file changed, 8 insertions(+), 8 deletions(-)
> > -
> > -diff --git a/assimpTargets-release.cmake.in b/
> > assimpTargets-release.cmake.in
> > -index f3db8f1..b8a066a 100644
> > ---- a/assimpTargets-release.cmake.in
> > -+++ b/assimpTargets-release.cmake.in
> > -@@ -42,11 +42,11 @@ if(MSVC)
> > -     # Import target "assimp::assimp" for configuration "Release"
> > -     set_property(TARGET assimp::assimp APPEND PROPERTY
> > IMPORTED_CONFIGURATIONS RELEASE)
> > -     set_target_properties(assimp::assimp PROPERTIES
> > --      IMPORTED_IMPLIB_RELEASE
> > "${_IMPORT_PREFIX}/lib/${importLibraryName}"
> > -+      IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_=
DIR@
> > /${importLibraryName}"
> > -       IMPORTED_LOCATION_RELEASE
> > "${_IMPORT_PREFIX}/bin/${sharedLibraryName}"
> > -     )
> > -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "${_IMPORT_PREFIX}/lib/${importLibraryName}")
> > -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${importLibraryName}")
> > -     list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "${_IMPORT_PREFIX}/bin/${sharedLibraryName}" )
> > -   else()
> > -     set(staticLibraryName
> > "assimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > -@@ -54,10 +54,10 @@ if(MSVC)
> > -     # Import target "assimp::assimp" for configuration "Release"
> > -     set_property(TARGET assimp::assimp APPEND PROPERTY
> > IMPORTED_CONFIGURATIONS RELEASE)
> > -     set_target_properties(assimp::assimp PROPERTIES
> > --      IMPORTED_LOCATION_RELEASE
> > "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> > -+      IMPORTED_LOCATION_RELEASE
> > "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}"
> > -     )
> > -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "${_IMPORT_PREFIX}/lib/${staticLibraryName}")
> > -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}")
> > -   endif()
> > -
> > - else()
> > -@@ -70,17 +70,17 @@ else()
> > -     endif()
> > -     set_target_properties(assimp::assimp PROPERTIES
> > -       IMPORTED_SONAME_RELEASE "${sharedLibraryName}"
> > --      IMPORTED_LOCATION_RELEASE
> > "${_IMPORT_PREFIX}/lib/${sharedLibraryName}"
> > -+      IMPORTED_LOCATION_RELEASE
> > "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${sharedLibraryName}"
> > -     )
> > -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "${_IMPORT_PREFIX}/lib/${sharedLibraryName}" )
> > -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${sharedLibraryName}" )
> > -   else()
> > -     set(staticLibraryName
> > "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > -     set_target_properties(assimp::assimp PROPERTIES
> > --      IMPORTED_LOCATION_RELEASE
> > "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> > -+      IMPORTED_LOCATION_RELEASE
> > "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}"
> > -     )
> > -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "${_IMPORT_PREFIX}/lib/${staticLibraryName}" )
> > -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}" )
> > -   endif()
> > - endif()
> > -
> > diff --git
> > a/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-fro=
m-_IMPORT_CHECK_TARGETS.patch
> > b/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-fro=
m-_IMPORT_CHECK_TARGETS.patch
> > new file mode 100644
> > index 0000000..1078148
> > --- /dev/null
> > +++
> > b/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-fro=
m-_IMPORT_CHECK_TARGETS.patch
> > @@ -0,0 +1,32 @@
> > +From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > +Date: Fri, 13 Aug 2021 16:42:48 +0530
> > +Subject: [PATCH] assimp: remove shared lib from _IMPORT_CHECK_TARGETS
> > +
> > +In the target assimp::assimp shared library verification removed
> > +as it is giving configuration error when used by 3rd part component to
> > +configure itself using assimp::assimp target
> > +
> > +Upstream-Status: Inappropriate [oe specific]
> > +
> > +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > +---
> > + assimpTargets-release.cmake.in | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/assimpTargets-release.cmake.in b/
> > assimpTargets-release.cmake.in
> > +index cd2fac7e0..52edc7990 100644
> > +--- a/assimpTargets-release.cmake.in
> > ++++ b/assimpTargets-release.cmake.in
> > +@@ -72,8 +72,8 @@ else()
> > +       IMPORTED_SONAME_RELEASE "${sharedLibraryName}"
> > +       IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@
> > /${sharedLibraryName}"
> > +     )
> > +-    list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> > ++    #list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > ++    #list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> > +   else()
> > +     set(staticLibraryName
> > "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > +     set_target_properties(assimp::assimp PROPERTIES
> > +--
> > +2.17.1
> > diff --git
> > a/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible=
.patch
> > b/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible=
.patch
> > new file mode 100644
> > index 0000000..e4f5b9c
> > --- /dev/null
> > +++
> > b/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible=
.patch
> > @@ -0,0 +1,257 @@
> > +From cbf94fd62ff831879d10f99aa7766d391ae8a9b7 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Victor=3D20Matar=3DC3=3DA9?=3D <matare@fh-aachen.de>
> > +Date: Tue, 31 Mar 2020 21:30:07 +0200
> > +Subject: [PATCH] use GNUInstallDirs where possible
> > +
> > +Emulate the CMAKE_INSTALL_FULL_* variables on non-Unix systems and
> > +disable redefining FHS-mandated install locations via user-editable
> > +ASSIMP_*_INSTALL_DIR variables. Instead, if it REALLY proves necessary=
,
> > +Unix users can edit the advanced, canonical CMAKE_INSTALL_* variables.
> > +---
> > + CMakeLists.txt                 | 36 ++++++++++++++++++++++-----------=
-
> > + assimp.pc.in                   |  6 ++----
> > + assimpTargets-debug.cmake.in   | 20 +++++++++----------
> > + assimpTargets-release.cmake.in | 18 ++++++++---------
> > + assimpTargets.cmake.in         | 15 +-------------
> > + 5 files changed, 45 insertions(+), 50 deletions(-)
> > +
> > +Upstream-Status: Backport
> > +Comment: Additionally remove setting of ASSIMP_LIBRARY_DIRS,
> > ASSIMP_INCLUDE_DIRS
> > +         and INTERFACE_INCLUDE_DIRECTORIES as default cross compile pa=
ths
> > are enough
> > +         and setting them manually adds non-existing paths to CMake
> > modules
> > +
> > +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index dcafb649f5..c23c0df33e 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -230,11 +230,6 @@ SET(LIBASSIMP-DEV_COMPONENT
> > "libassimp${ASSIMP_VERSION_MAJOR}.${ASSIMP_VERSION_M
> > + SET(CPACK_COMPONENTS_ALL assimp-bin ${LIBASSIMP_COMPONENT}
> > ${LIBASSIMP-DEV_COMPONENT} assimp-dev)
> > + SET(ASSIMP_LIBRARY_SUFFIX "" CACHE STRING "Suffix to append to librar=
y
> > names")
> > +
> > +-IF( UNIX )
> > +-  # Use GNUInstallDirs for Unix predefined directories
> > +-  INCLUDE(GNUInstallDirs)
> > +-ENDIF( UNIX )
> > +-
> > + # Grouped compiler settings
> > + IF ((CMAKE_C_COMPILER_ID MATCHES "GNU") AND NOT CMAKE_COMPILER_IS_MIN=
GW)
> > +   IF(NOT HUNTER_ENABLED)
> > +@@ -329,14 +324,6 @@ IF ( CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR )
> > +   SET( CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_HOME_DIRECTORY}/bin" )
> > + ENDIF ( CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR )
> > +
> > +-# Cache these to allow the user to override them manually.
> > +-SET( ASSIMP_LIB_INSTALL_DIR "lib" CACHE STRING
> > +-  "Path the built library files are installed to." )
> > +-SET( ASSIMP_INCLUDE_INSTALL_DIR "include" CACHE STRING
> > +-  "Path the header files are installed to." )
> > +-SET( ASSIMP_BIN_INSTALL_DIR "bin" CACHE STRING
> > +-  "Path the tool executables are installed to." )
> > +-
> > + get_cmake_property(is_multi_config GENERATOR_IS_MULTI_CONFIG)
> > +
> > + IF (INJECT_DEBUG_POSTFIX AND (is_multi_config OR CMAKE_BUILD_TYPE
> > STREQUAL "Debug"))
> > +@@ -391,6 +378,29 @@ IF(HUNTER_ENABLED)
> > +   )
> > + ELSE(HUNTER_ENABLED)
> > +   # cmake configuration files
> > ++
> > ++  IF( UNIX )
> > ++    # Use GNUInstallDirs for Unix predefined directories
> > ++    INCLUDE(GNUInstallDirs)
> > ++
> > ++    SET( ASSIMP_LIB_INSTALL_DIR ${CMAKE_INSTALL_LIBDIR})
> > ++    SET( ASSIMP_INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_INCLUDEDIR})
> > ++    SET( ASSIMP_BIN_INSTALL_DIR ${CMAKE_INSTALL_BINDIR})
> > ++  ELSE( UNIX )
> > ++    # Cache these to allow the user to override them on non-Unix
> > platforms
> > ++    SET( ASSIMP_LIB_INSTALL_DIR "lib" CACHE STRING
> > ++      "Path the built library files are installed to." )
> > ++    SET( ASSIMP_INCLUDE_INSTALL_DIR "include" CACHE STRING
> > ++      "Path the header files are installed to." )
> > ++    SET( ASSIMP_BIN_INSTALL_DIR "bin" CACHE STRING
> > ++      "Path the tool executables are installed to." )
> > ++
> > ++    SET(CMAKE_INSTALL_FULL_INCLUDEDIR
> > ${CMAKE_INSTALL_PREFIX}/${ASSIMP_INCLUDE_INSTALL_DIR})
> > ++    SET(CMAKE_INSTALL_FULL_LIBDIR
> > ${CMAKE_INSTALL_PREFIX}/${ASSIMP_LIB_INSTALL_DIR})
> > ++    SET(CMAKE_INSTALL_FULL_BINDIR
> > ${CMAKE_INSTALL_PREFIX}/${ASSIMP_BIN_INSTALL_DIR})
> > ++  ENDIF( UNIX )
> > ++
> > ++
> > +   CONFIGURE_FILE("${CMAKE_CURRENT_SOURCE_DIR}/assimp-config.cmake.in"
> >        "${CMAKE_CURRENT_BINARY_DIR}/assimp-config.cmake" @ONLY IMMEDIAT=
E)
> > +   CONFIGURE_FILE("${CMAKE_CURRENT_SOURCE_DIR}/assimpTargets.cmake.in"
> >        "${CMAKE_CURRENT_BINARY_DIR}/assimpTargets.cmake" @ONLY IMMEDIAT=
E)
> > +   IF (is_multi_config)
> > +diff --git a/assimp.pc.in b/assimp.pc.in
> > +index c659e19f2c..555a3a1d3b 100644
> > +--- a/assimp.pc.in
> > ++++ b/assimp.pc.in
> > +@@ -1,7 +1,5 @@
> > +-prefix=3D@CMAKE_INSTALL_PREFIX@
> > +-exec_prefix=3D@CMAKE_INSTALL_PREFIX@/
> > +-libdir=3D@CMAKE_INSTALL_PREFIX@/@ASSIMP_LIB_INSTALL_DIR@
> > +-includedir=3D@CMAKE_INSTALL_PREFIX@
> > /../include/@ASSIMP_INCLUDE_INSTALL_DIR@
> > ++libdir=3D@CMAKE_INSTALL_FULL_LIBDIR@
> > ++includedir=3D@CMAKE_INSTALL_FULL_INCLUDEDIR@
> > +
> > + Name: @CMAKE_PROJECT_NAME@
> > + Description: Import various well-known 3D model formats in an uniform
> > manner.
> > +diff --git a/assimpTargets-debug.cmake.in b/assimpTargets-debug.cmake.=
in
> > +index 1ebe2a6081..f5034c9349 100644
> > +--- a/assimpTargets-debug.cmake.in
> > ++++ b/assimpTargets-debug.cmake.in
> > +@@ -42,22 +42,22 @@ if(MSVC)
> > +     # Import target "assimp::assimp" for configuration "Debug"
> > +     set_property(TARGET assimp::assimp APPEND PROPERTY
> > IMPORTED_CONFIGURATIONS DEBUG)
> > +     set_target_properties(assimp::assimp PROPERTIES
> > +-      IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/${importLibraryNam=
e}"
> > +-      IMPORTED_LOCATION_DEBUG
> > "${_IMPORT_PREFIX}/bin/${sharedLibraryName}"
> > ++      IMPORTED_IMPLIB_DEBUG "@CMAKE_INSTALL_FULL_LIBDIR@
> > /${importLibraryName}"
> > ++      IMPORTED_LOCATION_DEBUG "@CMAKE_INSTALL_FULL_BINDIR@
> > /${sharedLibraryName}"
> > +     )
> > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "${_IMPORT_PREFIX}/lib/${importLibraryName}")
> > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "${_IMPORT_PREFIX}/bin/${sharedLibraryName}" )
> > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "@CMAKE_INSTALL_FULL_LIBDIR@/${importLibraryName}")
> > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "@CMAKE_INSTALL_FULL_BINDIR@/${sharedLibraryName}" )
> > +   else()
> > +     set(staticLibraryName
> > "assimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_DEBUG_POSTFIX
> > @@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > +
> > +     # Import target "assimp::assimp" for configuration "Debug"
> > +     set_property(TARGET assimp::assimp APPEND PROPERTY
> > IMPORTED_CONFIGURATIONS DEBUG)
> > +     set_target_properties(assimp::assimp PROPERTIES
> > +-      IMPORTED_LOCATION_DEBUG
> > "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> > ++      IMPORTED_LOCATION_DEBUG "@CMAKE_INSTALL_FULL_LIBDIR@
> > /${staticLibraryName}"
> > +     )
> > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "${_IMPORT_PREFIX}/lib/${staticLibraryName}")
> > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}")
> > +   endif()
> > +
> > + else()
> > +@@ -66,17 +66,17 @@ else()
> > +     set(sharedLibraryName
> > "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_DEBUG_POSTFIX
> > @@CMAKE_SHARED_LIBRARY_SUFFIX@.@ASSIMP_VERSION_MAJOR@")
> > +     set_target_properties(assimp::assimp PROPERTIES
> > +       IMPORTED_SONAME_DEBUG "${sharedLibraryName}"
> > +-      IMPORTED_LOCATION_DEBUG
> > "${_IMPORT_PREFIX}/lib/${sharedLibraryName}"
> > ++      IMPORTED_LOCATION_DEBUG "@CMAKE_INSTALL_FULL_LIBDIR@
> > /${sharedLibraryName}"
> > +     )
> > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "${_IMPORT_PREFIX}/lib/${sharedLibraryName}" )
> > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> > +   else()
> > +     set(staticLibraryName
> > "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_DEBUG_POSTFIX
> > @@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > +     set_target_properties(assimp::assimp PROPERTIES
> > +-      IMPORTED_LOCATION_DEBUG
> > "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> > ++      IMPORTED_LOCATION_DEBUG "@CMAKE_INSTALL_FULL_LIBDIR@
> > /${staticLibraryName}"
> > +     )
> > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "${_IMPORT_PREFIX}/lib/${staticLibraryName}" )
> > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}" )
> > +   endif()
> > + endif()
> > +
> > +diff --git a/assimpTargets-release.cmake.in b/
> > assimpTargets-release.cmake.in
> > +index f3db8f12cd..a416e8899b 100644
> > +--- a/assimpTargets-release.cmake.in
> > ++++ b/assimpTargets-release.cmake.in
> > +@@ -42,12 +42,12 @@ if(MSVC)
> > +     # Import target "assimp::assimp" for configuration "Release"
> > +     set_property(TARGET assimp::assimp APPEND PROPERTY
> > IMPORTED_CONFIGURATIONS RELEASE)
> > +     set_target_properties(assimp::assimp PROPERTIES
> > +-      IMPORTED_IMPLIB_RELEASE
> > "${_IMPORT_PREFIX}/lib/${importLibraryName}"
> > +-      IMPORTED_LOCATION_RELEASE
> > "${_IMPORT_PREFIX}/bin/${sharedLibraryName}"
> > ++      IMPORTED_IMPLIB_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@
> > /${importLibraryName}"
> > ++      IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_BINDIR@
> > /${sharedLibraryName}"
> > +     )
> > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "${_IMPORT_PREFIX}/lib/${importLibraryName}")
> > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "${_IMPORT_PREFIX}/bin/${sharedLibraryName}" )
> > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "@CMAKE_INSTALL_FULL_LIBDIR@/${importLibraryName}")
> > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "@CMAKE_INSTALL_FULL_BINDIR@/${sharedLibraryName}" )
> > +   else()
> > +     set(staticLibraryName
> > "assimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > +
> > +@@ -57,7 +57,7 @@ if(MSVC)
> > +       IMPORTED_LOCATION_RELEASE
> > "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> > +     )
> > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "${_IMPORT_PREFIX}/lib/${staticLibraryName}")
> > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}")
> > +   endif()
> > +
> > + else()
> > +@@ -70,17 +70,17 @@ else()
> > +     endif()
> > +     set_target_properties(assimp::assimp PROPERTIES
> > +       IMPORTED_SONAME_RELEASE "${sharedLibraryName}"
> > +-      IMPORTED_LOCATION_RELEASE
> > "${_IMPORT_PREFIX}/lib/${sharedLibraryName}"
> > ++      IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@
> > /${sharedLibraryName}"
> > +     )
> > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "${_IMPORT_PREFIX}/lib/${sharedLibraryName}" )
> > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> > +   else()
> > +     set(staticLibraryName
> > "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > +     set_target_properties(assimp::assimp PROPERTIES
> > +-      IMPORTED_LOCATION_RELEASE
> > "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> > ++      IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@
> > /${staticLibraryName}"
> > +     )
> > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "${_IMPORT_PREFIX}/lib/${staticLibraryName}" )
> > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}" )
> > +   endif()
> > + endif()
> > +
> > +@@ -91,8 +91,6 @@ get_filename_component(ASSIMP_ROOT_DIR
> > "@CMAKE_INSTALL_PREFIX@" REALPATH)
> > +
> > + set( ASSIMP_CXX_FLAGS ) # dynamically linked library
> > + set( ASSIMP_LINK_FLAGS "" )
> > +-set( ASSIMP_LIBRARY_DIRS "${ASSIMP_ROOT_DIR}/@ASSIMP_LIB_INSTALL_DIR@=
")
> > +-set( ASSIMP_INCLUDE_DIRS "${ASSIMP_ROOT_DIR}/@ASSIMP_INCLUDE_INSTALL_=
DIR@
> > ")
> > + if(ASSIMP_BUILD_SHARED_LIBS)
> > +   set( ASSIMP_LIBRARIES ${sharedLibraryName})
> > + else()
> > +
> > +diff --git a/assimpTargets.cmake.in b/assimpTargets.cmake.in
> > +index ab1a8d2c7b..ef90c834a6 100644
> > +--- a/assimpTargets.cmake.in
> > ++++ b/assimpTargets.cmake.in
> > +@@ -40,16 +40,6 @@ unset(_targetsDefined)
> > + unset(_targetsNotDefined)
> > + unset(_expectedTargets)
> > +
> > +-
> > +-# Compute the installation prefix relative to this file.
> > +-get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_FILE}" PA=
TH)
> > +-get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
> > +-get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
> > +-get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
> > +-if(_IMPORT_PREFIX STREQUAL "/")
> > +-  set(_IMPORT_PREFIX "")
> > +-endif()
> > +-
> > + # Create imported target assimp::assimp
> > + if(@BUILD_SHARED_LIBS@)
> > +   add_library(assimp::assimp SHARED IMPORTED)
> > +@@ -60,7 +50,7 @@ endif()
> > + set_target_properties(assimp::assimp PROPERTIES
> > +   COMPATIBLE_INTERFACE_STRING "assimp_MAJOR_VERSION"
> > +   INTERFACE_assimp_MAJOR_VERSION "1"
> > +-  INTERFACE_INCLUDE_DIRECTORIES
> > "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
> > ++  #INTERFACE_INCLUDE_DIRECTORIES "@CMAKE_INSTALL_FULL_INCLUDEDIR@"
> > +   #INTERFACE_LINK_LIBRARIES
> > "TxtUtils::TxtUtils;MealyMachine::MealyMachine"
> > + )
> > +
> > +@@ -75,9 +65,6 @@ foreach(f ${CONFIG_FILES})
> > +   include(${f})
> > + endforeach()
> > +
> > +-# Cleanup temporary variables.
> > +-set(_IMPORT_PREFIX)
> > +-
> > + # Loop over all imported files and verify that they actually exist
> > + foreach(target ${_IMPORT_CHECK_TARGETS} )
> > +   foreach(file ${_IMPORT_CHECK_FILES_FOR_${target}} )
> > +
> > diff --git a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> > b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> > index 4eb0cef..89c555f 100644
> > --- a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> > +++ b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> > @@ -10,7 +10,8 @@ DEPENDS =3D "zlib"
> >
> >  SRC_URI =3D "git://github.com/assimp/assimp.git;branch=3Dassimp_5.0_re=
lease \
> >
> > file://0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch =
\
> > -           file://0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.pa=
tch
> > \
> > +           file://use-GNUInstallDirs-where-possible.patch \
> > +
> >  file://0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch =
\
> >             "
> >  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>(\d+(\.\d+)+))"
> >
> > --
> > 2.7.4
> >
> >
> >=20
> >
> >

>=20
>=20
>=20
