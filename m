Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.38476.1629810197093735925
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 06:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aHGfyjtl;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: samuli.piippo@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id m4so1158808pll.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 06:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L+wfOVJQT7C3yJHmLt+aBdJ/+3/m2xZ/kKrmCNmgbdQ=;
        b=aHGfyjtlu6stUEjDBBQR9y/Sk5z4xONXXHTtXf4ABLX2Zp4wCqt3pm3oNElJ8dP9bD
         /3kSGqhUGXjSdax6VgUqQxmu16rooanQ2+fPptp+YxUQIyUUXbGejN9AyfVLgpdy99SS
         VPAoY4KbzOWDLmgHKxUWFF+uoHlKDcHJVzUSbSVgmfscMNeDQacFbedCK9IsyCRp5DaZ
         cvzySMiEX9VgNuaaD295rjFnY1Q3jl3cALOSHyuj8fP+1htqlMsRM/0ai0Jtc9aP+Wt9
         Ddq/+4zBzR0dBr38ZPjLa7XBAJho1NtRRwW71m3l809sRxPVqjD71L6TvR2mcXUgOZKp
         lfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L+wfOVJQT7C3yJHmLt+aBdJ/+3/m2xZ/kKrmCNmgbdQ=;
        b=HCSBRDQ2k6OSK1hJkBhVl65/oB1NgT9QpiU+vDluhYSWO74/7zYRODAnSW+cdWLK+z
         rxYXD7KVNB8mvV0RW81GQOmYa/INWBgnys4lQvJ/5TFK/+k760igbXrKCly9fCnM0uAS
         +uxUUC8heGIPKOXFHYjzZU4z8pBC+aRQtxw9DyXRR8Y4MWW6F4LkFkq48SDZWoW43dId
         WRboRTB+8/d02Yo2yF9ZQoctNgRnQDDmDb6IcnWuqk5W5T/GjKfG5GTPSDsJ/Q2ePvl7
         F0UfNZ4oYZ+k9PyGgm3krAmxGwBIa+Rlr4e4qw/GN0KSxq+xp2Ij2WtmZSGTH2h7zGrM
         Y3yg==
X-Gm-Message-State: AOAM533x5mMifB9xYwpvZ0y012MBtalrtVocYqJLGnGz4+K9sG82kCVi
	pVfTGUxv6zeV6zFG4qGwdTToReBysvcaUaTudIM=
X-Google-Smtp-Source: ABdhPJzAOaNDuZ5Lul6bG/AM8/agFEsXwWLIfhL1hgiCY+7pTl/ffu/LstcNMJwzH1R4JmuqBYDaiQmkzvt8U+jtxZM=
X-Received: by 2002:a17:90a:116:: with SMTP id b22mr4401975pjb.108.1629810196245;
 Tue, 24 Aug 2021 06:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <1629454029-8279-1-git-send-email-purushottamchoudhary29@gmail.com>
 <CABXoSoWHBQ+Z_m+p_okxwAQ9OnKN1E-7jUVn8a3wsVgSgT+a1w@mail.gmail.com> <YSTRDNYs9UOCzagb@korppu>
In-Reply-To: <YSTRDNYs9UOCzagb@korppu>
From: "Samuli Piippo" <samuli.piippo@gmail.com>
Date: Tue, 24 Aug 2021 16:03:04 +0300
Message-ID: <CABXoSoXRwZsA4Axj+UO3hmVH7GD1T29SE8sAF7TeVgeouJV4Eg@mail.gmail.com>
Subject: Re: [OE-core] [poky][master][PATCH] assimp: added patch to fix hardcoded non-existing paths in CMake modules
To: Mikko.Rapeli@bmw.de
Cc: purushottamchoudhary29@gmail.com, 
	OE-core <openembedded-core@lists.openembedded.org>, sakoman@gmail.com, 
	nisha.parrakat@kpit.com
Content-Type: multipart/alternative; boundary="000000000000cc801f05ca4dc1b1"

--000000000000cc801f05ca4dc1b1
Content-Type: text/plain; charset="UTF-8"

assimpTargets-release.cmake has it hardcoded:

    set_target_properties(assimp::assimp PROPERTIES
      IMPORTED_IMPLIB_RELEASE "/usr/lib/${importLibraryName}"
      IMPORTED_LOCATION_RELEASE "/usr/bin/${sharedLibraryName}"
    )

before it used to be:

    set_target_properties(assimp::assimp PROPERTIES
      IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/${importLibraryName}"
      IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/${sharedLibraryName}"
    )


-samuli

On Tue, 24 Aug 2021 at 13:59, <Mikko.Rapeli@bmw.de> wrote:

> Hi,
>
> On Tue, Aug 24, 2021 at 12:27:09PM +0300, Samuli Piippo wrote:
> > Looks like this commit breaks something in the cmake files.
> >
> > When using assimp from another recipe (Qt3D), it will try to use the
> > library from host path:
> >
> > /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(69):
> >  set(sharedLibraryName libassimp.so.5 )
> > /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(71):
> >  set_target_properties(assimp::assimp PROPERTIES IMPORTED_SONAME_RELEASE
> > libassimp.so.5 IMPORTED_LOCATION_RELEASE /usr/lib/libassimp.so.5 )
>
> Can you see where the /usr/lib search path comes from?
>
> To me, the assimp CMake files try to do way too much and should instead
> rely
> on default search paths and the cross compile toolchain file.
>
> Cheers,
>
> -Mikko
>
> > Whereas, before the patch, it was correctly using it from the sysroot:
> >
> > /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(69):
> >  set(sharedLibraryName libassimp.so.5 )
> > /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(71):
> >  set_target_properties(assimp::assimp PROPERTIES IMPORTED_SONAME_RELEASE
> > libassimp.so.5 IMPORTED_LOCATION_RELEASE
> >
> /home/qt/work/build/build/tmp/work/core2-32-poky-linux/qt3d/6.3.0-r0/recipe-sysroot/usr/lib/libassimp.so.5
> > )
> > /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(75):  list(APPEND
> > _IMPORT_CHECK_TARGETS assimp::assimp )
> > /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(76):  list(APPEND
> > _IMPORT_CHECK_FILES_FOR_assimp::assimp
> >
> /home/qt/work/build/build/tmp/work/core2-32-poky-linux/qt3d/6.3.0-r0/recipe-sysroot/usr/lib/libassimp.so.5
> > )
> >
> > Probably explains why the IMPORT_CHECK_TARGETS had to be removed.
> >
> >
> >
> > On Fri, 20 Aug 2021 at 13:07, Purushottam Choudhary <
> > purushottamchoudhary29@gmail.com> wrote:
> >
> > > assimp CMake modules were adding non-existing paths to its CMake
> modules
> > > breaking builds for users of assimp. Remove the hardcoded paths with
> > > an upstream patch with small tweaks.
> > >
> > > Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com
> >
> > > ---
> > >  ...-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch |  68 ------
> > >  ...ove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch |  32 +++
> > >  .../assimp/use-GNUInstallDirs-where-possible.patch | 257
> > > +++++++++++++++++++++
> > >  meta/recipes-graphics/vulkan/assimp_5.0.1.bb       |   3 +-
> > >  4 files changed, 291 insertions(+), 69 deletions(-)
> > >  delete mode 100644
> > >
> meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch
> > >  create mode 100644
> > >
> meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
> > >  create mode 100644
> > >
> meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible.patch
> > >
> > > diff --git
> > >
> a/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch
> > >
> b/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch
> > > deleted file mode 100644
> > > index 34c5bfa..0000000
> > > ---
> > >
> a/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch
> > > +++ /dev/null
> > > @@ -1,68 +0,0 @@
> > > -From 58f576d6f240b08957a402960cdf06c74201ac7b Mon Sep 17 00:00:00 2001
> > > -From: Hongxu Jia <hongxu.jia@windriver.com>
> > > -Date: Thu, 12 Dec 2019 22:16:15 -0800
> > > -Subject: [PATCH] Use ASSIMP_LIB_INSTALL_DIR to search library
> > > -
> > > -Use ASSIMP_LIB_INSTALL_DIR rather than hardcoded /lib to search
> library
> > > -
> > > -Upstream-Status: Inappropriate [oe specific]
> > > -
> > > -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > > -
> > > ----
> > > - assimpTargets-release.cmake.in | 16 ++++++++--------
> > > - 1 file changed, 8 insertions(+), 8 deletions(-)
> > > -
> > > -diff --git a/assimpTargets-release.cmake.in b/
> > > assimpTargets-release.cmake.in
> > > -index f3db8f1..b8a066a 100644
> > > ---- a/assimpTargets-release.cmake.in
> > > -+++ b/assimpTargets-release.cmake.in
> > > -@@ -42,11 +42,11 @@ if(MSVC)
> > > -     # Import target "assimp::assimp" for configuration "Release"
> > > -     set_property(TARGET assimp::assimp APPEND PROPERTY
> > > IMPORTED_CONFIGURATIONS RELEASE)
> > > -     set_target_properties(assimp::assimp PROPERTIES
> > > --      IMPORTED_IMPLIB_RELEASE
> > > "${_IMPORT_PREFIX}/lib/${importLibraryName}"
> > > -+      IMPORTED_IMPLIB_RELEASE
> "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@
> > > /${importLibraryName}"
> > > -       IMPORTED_LOCATION_RELEASE
> > > "${_IMPORT_PREFIX}/bin/${sharedLibraryName}"
> > > -     )
> > > -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "${_IMPORT_PREFIX}/lib/${importLibraryName}")
> > > -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${importLibraryName}")
> > > -     list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "${_IMPORT_PREFIX}/bin/${sharedLibraryName}" )
> > > -   else()
> > > -     set(staticLibraryName
> > > "assimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > > -@@ -54,10 +54,10 @@ if(MSVC)
> > > -     # Import target "assimp::assimp" for configuration "Release"
> > > -     set_property(TARGET assimp::assimp APPEND PROPERTY
> > > IMPORTED_CONFIGURATIONS RELEASE)
> > > -     set_target_properties(assimp::assimp PROPERTIES
> > > --      IMPORTED_LOCATION_RELEASE
> > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> > > -+      IMPORTED_LOCATION_RELEASE
> > > "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}"
> > > -     )
> > > -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}")
> > > -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}")
> > > -   endif()
> > > -
> > > - else()
> > > -@@ -70,17 +70,17 @@ else()
> > > -     endif()
> > > -     set_target_properties(assimp::assimp PROPERTIES
> > > -       IMPORTED_SONAME_RELEASE "${sharedLibraryName}"
> > > --      IMPORTED_LOCATION_RELEASE
> > > "${_IMPORT_PREFIX}/lib/${sharedLibraryName}"
> > > -+      IMPORTED_LOCATION_RELEASE
> > > "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${sharedLibraryName}"
> > > -     )
> > > -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "${_IMPORT_PREFIX}/lib/${sharedLibraryName}" )
> > > -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${sharedLibraryName}" )
> > > -   else()
> > > -     set(staticLibraryName
> > > "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > > -     set_target_properties(assimp::assimp PROPERTIES
> > > --      IMPORTED_LOCATION_RELEASE
> > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> > > -+      IMPORTED_LOCATION_RELEASE
> > > "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}"
> > > -     )
> > > -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}" )
> > > -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}" )
> > > -   endif()
> > > - endif()
> > > -
> > > diff --git
> > >
> a/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
> > >
> b/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
> > > new file mode 100644
> > > index 0000000..1078148
> > > --- /dev/null
> > > +++
> > >
> b/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
> > > @@ -0,0 +1,32 @@
> > > +From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > > +Date: Fri, 13 Aug 2021 16:42:48 +0530
> > > +Subject: [PATCH] assimp: remove shared lib from _IMPORT_CHECK_TARGETS
> > > +
> > > +In the target assimp::assimp shared library verification removed
> > > +as it is giving configuration error when used by 3rd part component to
> > > +configure itself using assimp::assimp target
> > > +
> > > +Upstream-Status: Inappropriate [oe specific]
> > > +
> > > +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > > +---
> > > + assimpTargets-release.cmake.in | 4 ++--
> > > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > > +
> > > +diff --git a/assimpTargets-release.cmake.in b/
> > > assimpTargets-release.cmake.in
> > > +index cd2fac7e0..52edc7990 100644
> > > +--- a/assimpTargets-release.cmake.in
> > > ++++ b/assimpTargets-release.cmake.in
> > > +@@ -72,8 +72,8 @@ else()
> > > +       IMPORTED_SONAME_RELEASE "${sharedLibraryName}"
> > > +       IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@
> > > /${sharedLibraryName}"
> > > +     )
> > > +-    list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> > > ++    #list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > ++    #list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> > > +   else()
> > > +     set(staticLibraryName
> > > "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > > +     set_target_properties(assimp::assimp PROPERTIES
> > > +--
> > > +2.17.1
> > > diff --git
> > >
> a/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible.patch
> > >
> b/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible.patch
> > > new file mode 100644
> > > index 0000000..e4f5b9c
> > > --- /dev/null
> > > +++
> > >
> b/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible.patch
> > > @@ -0,0 +1,257 @@
> > > +From cbf94fd62ff831879d10f99aa7766d391ae8a9b7 Mon Sep 17 00:00:00 2001
> > > +From: =?UTF-8?q?Victor=20Matar=C3=A9?= <matare@fh-aachen.de>
> > > +Date: Tue, 31 Mar 2020 21:30:07 +0200
> > > +Subject: [PATCH] use GNUInstallDirs where possible
> > > +
> > > +Emulate the CMAKE_INSTALL_FULL_* variables on non-Unix systems and
> > > +disable redefining FHS-mandated install locations via user-editable
> > > +ASSIMP_*_INSTALL_DIR variables. Instead, if it REALLY proves
> necessary,
> > > +Unix users can edit the advanced, canonical CMAKE_INSTALL_* variables.
> > > +---
> > > + CMakeLists.txt                 | 36
> ++++++++++++++++++++++------------
> > > + assimp.pc.in                   |  6 ++----
> > > + assimpTargets-debug.cmake.in   | 20 +++++++++----------
> > > + assimpTargets-release.cmake.in | 18 ++++++++---------
> > > + assimpTargets.cmake.in         | 15 +-------------
> > > + 5 files changed, 45 insertions(+), 50 deletions(-)
> > > +
> > > +Upstream-Status: Backport
> > > +Comment: Additionally remove setting of ASSIMP_LIBRARY_DIRS,
> > > ASSIMP_INCLUDE_DIRS
> > > +         and INTERFACE_INCLUDE_DIRECTORIES as default cross compile
> paths
> > > are enough
> > > +         and setting them manually adds non-existing paths to CMake
> > > modules
> > > +
> > > +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > > +
> > > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > > +index dcafb649f5..c23c0df33e 100644
> > > +--- a/CMakeLists.txt
> > > ++++ b/CMakeLists.txt
> > > +@@ -230,11 +230,6 @@ SET(LIBASSIMP-DEV_COMPONENT
> > > "libassimp${ASSIMP_VERSION_MAJOR}.${ASSIMP_VERSION_M
> > > + SET(CPACK_COMPONENTS_ALL assimp-bin ${LIBASSIMP_COMPONENT}
> > > ${LIBASSIMP-DEV_COMPONENT} assimp-dev)
> > > + SET(ASSIMP_LIBRARY_SUFFIX "" CACHE STRING "Suffix to append to
> library
> > > names")
> > > +
> > > +-IF( UNIX )
> > > +-  # Use GNUInstallDirs for Unix predefined directories
> > > +-  INCLUDE(GNUInstallDirs)
> > > +-ENDIF( UNIX )
> > > +-
> > > + # Grouped compiler settings
> > > + IF ((CMAKE_C_COMPILER_ID MATCHES "GNU") AND NOT
> CMAKE_COMPILER_IS_MINGW)
> > > +   IF(NOT HUNTER_ENABLED)
> > > +@@ -329,14 +324,6 @@ IF ( CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR )
> > > +   SET( CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_HOME_DIRECTORY}/bin" )
> > > + ENDIF ( CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR )
> > > +
> > > +-# Cache these to allow the user to override them manually.
> > > +-SET( ASSIMP_LIB_INSTALL_DIR "lib" CACHE STRING
> > > +-  "Path the built library files are installed to." )
> > > +-SET( ASSIMP_INCLUDE_INSTALL_DIR "include" CACHE STRING
> > > +-  "Path the header files are installed to." )
> > > +-SET( ASSIMP_BIN_INSTALL_DIR "bin" CACHE STRING
> > > +-  "Path the tool executables are installed to." )
> > > +-
> > > + get_cmake_property(is_multi_config GENERATOR_IS_MULTI_CONFIG)
> > > +
> > > + IF (INJECT_DEBUG_POSTFIX AND (is_multi_config OR CMAKE_BUILD_TYPE
> > > STREQUAL "Debug"))
> > > +@@ -391,6 +378,29 @@ IF(HUNTER_ENABLED)
> > > +   )
> > > + ELSE(HUNTER_ENABLED)
> > > +   # cmake configuration files
> > > ++
> > > ++  IF( UNIX )
> > > ++    # Use GNUInstallDirs for Unix predefined directories
> > > ++    INCLUDE(GNUInstallDirs)
> > > ++
> > > ++    SET( ASSIMP_LIB_INSTALL_DIR ${CMAKE_INSTALL_LIBDIR})
> > > ++    SET( ASSIMP_INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_INCLUDEDIR})
> > > ++    SET( ASSIMP_BIN_INSTALL_DIR ${CMAKE_INSTALL_BINDIR})
> > > ++  ELSE( UNIX )
> > > ++    # Cache these to allow the user to override them on non-Unix
> > > platforms
> > > ++    SET( ASSIMP_LIB_INSTALL_DIR "lib" CACHE STRING
> > > ++      "Path the built library files are installed to." )
> > > ++    SET( ASSIMP_INCLUDE_INSTALL_DIR "include" CACHE STRING
> > > ++      "Path the header files are installed to." )
> > > ++    SET( ASSIMP_BIN_INSTALL_DIR "bin" CACHE STRING
> > > ++      "Path the tool executables are installed to." )
> > > ++
> > > ++    SET(CMAKE_INSTALL_FULL_INCLUDEDIR
> > > ${CMAKE_INSTALL_PREFIX}/${ASSIMP_INCLUDE_INSTALL_DIR})
> > > ++    SET(CMAKE_INSTALL_FULL_LIBDIR
> > > ${CMAKE_INSTALL_PREFIX}/${ASSIMP_LIB_INSTALL_DIR})
> > > ++    SET(CMAKE_INSTALL_FULL_BINDIR
> > > ${CMAKE_INSTALL_PREFIX}/${ASSIMP_BIN_INSTALL_DIR})
> > > ++  ENDIF( UNIX )
> > > ++
> > > ++
> > > +   CONFIGURE_FILE("${CMAKE_CURRENT_SOURCE_DIR}/assimp-config.cmake.in
> "
> > >        "${CMAKE_CURRENT_BINARY_DIR}/assimp-config.cmake" @ONLY
> IMMEDIATE)
> > > +   CONFIGURE_FILE("${CMAKE_CURRENT_SOURCE_DIR}/assimpTargets.cmake.in
> "
> > >        "${CMAKE_CURRENT_BINARY_DIR}/assimpTargets.cmake" @ONLY
> IMMEDIATE)
> > > +   IF (is_multi_config)
> > > +diff --git a/assimp.pc.in b/assimp.pc.in
> > > +index c659e19f2c..555a3a1d3b 100644
> > > +--- a/assimp.pc.in
> > > ++++ b/assimp.pc.in
> > > +@@ -1,7 +1,5 @@
> > > +-prefix=@CMAKE_INSTALL_PREFIX@
> > > +-exec_prefix=@CMAKE_INSTALL_PREFIX@/
> > > +-libdir=@CMAKE_INSTALL_PREFIX@/@ASSIMP_LIB_INSTALL_DIR@
> > > +-includedir=@CMAKE_INSTALL_PREFIX@
> > > /../include/@ASSIMP_INCLUDE_INSTALL_DIR@
> > > ++libdir=@CMAKE_INSTALL_FULL_LIBDIR@
> > > ++includedir=@CMAKE_INSTALL_FULL_INCLUDEDIR@
> > > +
> > > + Name: @CMAKE_PROJECT_NAME@
> > > + Description: Import various well-known 3D model formats in an uniform
> > > manner.
> > > +diff --git a/assimpTargets-debug.cmake.in b/
> assimpTargets-debug.cmake.in
> > > +index 1ebe2a6081..f5034c9349 100644
> > > +--- a/assimpTargets-debug.cmake.in
> > > ++++ b/assimpTargets-debug.cmake.in
> > > +@@ -42,22 +42,22 @@ if(MSVC)
> > > +     # Import target "assimp::assimp" for configuration "Debug"
> > > +     set_property(TARGET assimp::assimp APPEND PROPERTY
> > > IMPORTED_CONFIGURATIONS DEBUG)
> > > +     set_target_properties(assimp::assimp PROPERTIES
> > > +-      IMPORTED_IMPLIB_DEBUG
> "${_IMPORT_PREFIX}/lib/${importLibraryName}"
> > > +-      IMPORTED_LOCATION_DEBUG
> > > "${_IMPORT_PREFIX}/bin/${sharedLibraryName}"
> > > ++      IMPORTED_IMPLIB_DEBUG "@CMAKE_INSTALL_FULL_LIBDIR@
> > > /${importLibraryName}"
> > > ++      IMPORTED_LOCATION_DEBUG "@CMAKE_INSTALL_FULL_BINDIR@
> > > /${sharedLibraryName}"
> > > +     )
> > > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "${_IMPORT_PREFIX}/lib/${importLibraryName}")
> > > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "${_IMPORT_PREFIX}/bin/${sharedLibraryName}" )
> > > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "@CMAKE_INSTALL_FULL_LIBDIR@/${importLibraryName}")
> > > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "@CMAKE_INSTALL_FULL_BINDIR@/${sharedLibraryName}" )
> > > +   else()
> > > +     set(staticLibraryName
> > > "assimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_DEBUG_POSTFIX
> > > @@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > > +
> > > +     # Import target "assimp::assimp" for configuration "Debug"
> > > +     set_property(TARGET assimp::assimp APPEND PROPERTY
> > > IMPORTED_CONFIGURATIONS DEBUG)
> > > +     set_target_properties(assimp::assimp PROPERTIES
> > > +-      IMPORTED_LOCATION_DEBUG
> > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> > > ++      IMPORTED_LOCATION_DEBUG "@CMAKE_INSTALL_FULL_LIBDIR@
> > > /${staticLibraryName}"
> > > +     )
> > > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}")
> > > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}")
> > > +   endif()
> > > +
> > > + else()
> > > +@@ -66,17 +66,17 @@ else()
> > > +     set(sharedLibraryName
> > > "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_DEBUG_POSTFIX
> > > @@CMAKE_SHARED_LIBRARY_SUFFIX@.@ASSIMP_VERSION_MAJOR@")
> > > +     set_target_properties(assimp::assimp PROPERTIES
> > > +       IMPORTED_SONAME_DEBUG "${sharedLibraryName}"
> > > +-      IMPORTED_LOCATION_DEBUG
> > > "${_IMPORT_PREFIX}/lib/${sharedLibraryName}"
> > > ++      IMPORTED_LOCATION_DEBUG "@CMAKE_INSTALL_FULL_LIBDIR@
> > > /${sharedLibraryName}"
> > > +     )
> > > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "${_IMPORT_PREFIX}/lib/${sharedLibraryName}" )
> > > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> > > +   else()
> > > +     set(staticLibraryName
> > > "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_DEBUG_POSTFIX
> > > @@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > > +     set_target_properties(assimp::assimp PROPERTIES
> > > +-      IMPORTED_LOCATION_DEBUG
> > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> > > ++      IMPORTED_LOCATION_DEBUG "@CMAKE_INSTALL_FULL_LIBDIR@
> > > /${staticLibraryName}"
> > > +     )
> > > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}" )
> > > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}" )
> > > +   endif()
> > > + endif()
> > > +
> > > +diff --git a/assimpTargets-release.cmake.in b/
> > > assimpTargets-release.cmake.in
> > > +index f3db8f12cd..a416e8899b 100644
> > > +--- a/assimpTargets-release.cmake.in
> > > ++++ b/assimpTargets-release.cmake.in
> > > +@@ -42,12 +42,12 @@ if(MSVC)
> > > +     # Import target "assimp::assimp" for configuration "Release"
> > > +     set_property(TARGET assimp::assimp APPEND PROPERTY
> > > IMPORTED_CONFIGURATIONS RELEASE)
> > > +     set_target_properties(assimp::assimp PROPERTIES
> > > +-      IMPORTED_IMPLIB_RELEASE
> > > "${_IMPORT_PREFIX}/lib/${importLibraryName}"
> > > +-      IMPORTED_LOCATION_RELEASE
> > > "${_IMPORT_PREFIX}/bin/${sharedLibraryName}"
> > > ++      IMPORTED_IMPLIB_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@
> > > /${importLibraryName}"
> > > ++      IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_BINDIR@
> > > /${sharedLibraryName}"
> > > +     )
> > > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "${_IMPORT_PREFIX}/lib/${importLibraryName}")
> > > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "${_IMPORT_PREFIX}/bin/${sharedLibraryName}" )
> > > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "@CMAKE_INSTALL_FULL_LIBDIR@/${importLibraryName}")
> > > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "@CMAKE_INSTALL_FULL_BINDIR@/${sharedLibraryName}" )
> > > +   else()
> > > +     set(staticLibraryName
> > > "assimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > > +
> > > +@@ -57,7 +57,7 @@ if(MSVC)
> > > +       IMPORTED_LOCATION_RELEASE
> > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> > > +     )
> > > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}")
> > > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}")
> > > +   endif()
> > > +
> > > + else()
> > > +@@ -70,17 +70,17 @@ else()
> > > +     endif()
> > > +     set_target_properties(assimp::assimp PROPERTIES
> > > +       IMPORTED_SONAME_RELEASE "${sharedLibraryName}"
> > > +-      IMPORTED_LOCATION_RELEASE
> > > "${_IMPORT_PREFIX}/lib/${sharedLibraryName}"
> > > ++      IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@
> > > /${sharedLibraryName}"
> > > +     )
> > > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "${_IMPORT_PREFIX}/lib/${sharedLibraryName}" )
> > > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> > > +   else()
> > > +     set(staticLibraryName
> > > "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> > > +     set_target_properties(assimp::assimp PROPERTIES
> > > +-      IMPORTED_LOCATION_RELEASE
> > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> > > ++      IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@
> > > /${staticLibraryName}"
> > > +     )
> > > +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> > > +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "${_IMPORT_PREFIX}/lib/${staticLibraryName}" )
> > > ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> > > "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}" )
> > > +   endif()
> > > + endif()
> > > +
> > > +@@ -91,8 +91,6 @@ get_filename_component(ASSIMP_ROOT_DIR
> > > "@CMAKE_INSTALL_PREFIX@" REALPATH)
> > > +
> > > + set( ASSIMP_CXX_FLAGS ) # dynamically linked library
> > > + set( ASSIMP_LINK_FLAGS "" )
> > > +-set( ASSIMP_LIBRARY_DIRS "${ASSIMP_ROOT_DIR}/@ASSIMP_LIB_INSTALL_DIR@
> ")
> > > +-set( ASSIMP_INCLUDE_DIRS
> "${ASSIMP_ROOT_DIR}/@ASSIMP_INCLUDE_INSTALL_DIR@
> > > ")
> > > + if(ASSIMP_BUILD_SHARED_LIBS)
> > > +   set( ASSIMP_LIBRARIES ${sharedLibraryName})
> > > + else()
> > > +
> > > +diff --git a/assimpTargets.cmake.in b/assimpTargets.cmake.in
> > > +index ab1a8d2c7b..ef90c834a6 100644
> > > +--- a/assimpTargets.cmake.in
> > > ++++ b/assimpTargets.cmake.in
> > > +@@ -40,16 +40,6 @@ unset(_targetsDefined)
> > > + unset(_targetsNotDefined)
> > > + unset(_expectedTargets)
> > > +
> > > +-
> > > +-# Compute the installation prefix relative to this file.
> > > +-get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_FILE}"
> PATH)
> > > +-get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
> > > +-get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
> > > +-get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
> > > +-if(_IMPORT_PREFIX STREQUAL "/")
> > > +-  set(_IMPORT_PREFIX "")
> > > +-endif()
> > > +-
> > > + # Create imported target assimp::assimp
> > > + if(@BUILD_SHARED_LIBS@)
> > > +   add_library(assimp::assimp SHARED IMPORTED)
> > > +@@ -60,7 +50,7 @@ endif()
> > > + set_target_properties(assimp::assimp PROPERTIES
> > > +   COMPATIBLE_INTERFACE_STRING "assimp_MAJOR_VERSION"
> > > +   INTERFACE_assimp_MAJOR_VERSION "1"
> > > +-  INTERFACE_INCLUDE_DIRECTORIES
> > > "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
> > > ++  #INTERFACE_INCLUDE_DIRECTORIES "@CMAKE_INSTALL_FULL_INCLUDEDIR@"
> > > +   #INTERFACE_LINK_LIBRARIES
> > > "TxtUtils::TxtUtils;MealyMachine::MealyMachine"
> > > + )
> > > +
> > > +@@ -75,9 +65,6 @@ foreach(f ${CONFIG_FILES})
> > > +   include(${f})
> > > + endforeach()
> > > +
> > > +-# Cleanup temporary variables.
> > > +-set(_IMPORT_PREFIX)
> > > +-
> > > + # Loop over all imported files and verify that they actually exist
> > > + foreach(target ${_IMPORT_CHECK_TARGETS} )
> > > +   foreach(file ${_IMPORT_CHECK_FILES_FOR_${target}} )
> > > +
> > > diff --git a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> > > b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> > > index 4eb0cef..89c555f 100644
> > > --- a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> > > +++ b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> > > @@ -10,7 +10,8 @@ DEPENDS = "zlib"
> > >
> > >  SRC_URI = "git://
> github.com/assimp/assimp.git;branch=assimp_5.0_release \
> > >
> > > file://0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch
> \
> > > -
>  file://0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch
> > > \
> > > +           file://use-GNUInstallDirs-where-possible.patch \
> > > +
> > >  file://0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
> \
> > >             "
> > >  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
> > >
> > > --
> > > 2.7.4
> > >
> > >
> > >
> > >
> > >
>
> >
> > 
> >
>

--000000000000cc801f05ca4dc1b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>assimpTargets-release.cmake has it hardcoded:</div><d=
iv><br></div><div>=C2=A0 =C2=A0 set_target_properties(assimp::assimp PROPER=
TIES<br>=C2=A0 =C2=A0 =C2=A0 IMPORTED_IMPLIB_RELEASE &quot;/usr/lib/${impor=
tLibraryName}&quot;<br>=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot=
;/usr/bin/${sharedLibraryName}&quot;<br>=C2=A0 =C2=A0 )</div><div><br></div=
><div>before it used to be:</div><div><br></div><div>=C2=A0 =C2=A0 set_targ=
et_properties(assimp::assimp PROPERTIES<br>=C2=A0 =C2=A0 =C2=A0 IMPORTED_IM=
PLIB_RELEASE &quot;${_IMPORT_PREFIX}/lib/${importLibraryName}&quot;<br>=C2=
=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot;${_IMPORT_PREFIX}/bin/${s=
haredLibraryName}&quot;<br>=C2=A0 =C2=A0 )</div><div><br></div><div><br></d=
iv><div>-samuli<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, 24 Aug 2021 at 13:59, &lt;<a href=3D"mailt=
o:Mikko.Rapeli@bmw.de">Mikko.Rapeli@bmw.de</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Tue, Aug 24, 2021 at 12:27:09PM +0300, Samuli Piippo wrote:<br>
&gt; Looks like this commit breaks something in the cmake files.<br>
&gt; <br>
&gt; When using assimp from another recipe (Qt3D), it will try to use the<b=
r>
&gt; library from host path:<br>
&gt; <br>
&gt; /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(69):<br>
&gt;=C2=A0 set(sharedLibraryName libassimp.so.5 )<br>
&gt; /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(71):<br>
&gt;=C2=A0 set_target_properties(assimp::assimp PROPERTIES IMPORTED_SONAME_=
RELEASE<br>
&gt; libassimp.so.5 IMPORTED_LOCATION_RELEASE /usr/lib/libassimp.so.5 )<br>
<br>
Can you see where the /usr/lib search path comes from?<br>
<br>
To me, the assimp CMake files try to do way too much and should instead rel=
y<br>
on default search paths and the cross compile toolchain file.<br>
<br>
Cheers,<br>
<br>
-Mikko<br>
<br>
&gt; Whereas, before the patch, it was correctly using it from the sysroot:=
<br>
&gt; <br>
&gt; /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(69):<br>
&gt;=C2=A0 set(sharedLibraryName libassimp.so.5 )<br>
&gt; /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(71):<br>
&gt;=C2=A0 set_target_properties(assimp::assimp PROPERTIES IMPORTED_SONAME_=
RELEASE<br>
&gt; libassimp.so.5 IMPORTED_LOCATION_RELEASE<br>
&gt; /home/qt/work/build/build/tmp/work/core2-32-poky-linux/qt3d/6.3.0-r0/r=
ecipe-sysroot/usr/lib/libassimp.so.5<br>
&gt; )<br>
&gt; /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(75):=C2=A0 list(=
APPEND<br>
&gt; _IMPORT_CHECK_TARGETS assimp::assimp )<br>
&gt; /usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(76):=C2=A0 list(=
APPEND<br>
&gt; _IMPORT_CHECK_FILES_FOR_assimp::assimp<br>
&gt; /home/qt/work/build/build/tmp/work/core2-32-poky-linux/qt3d/6.3.0-r0/r=
ecipe-sysroot/usr/lib/libassimp.so.5<br>
&gt; )<br>
&gt; <br>
&gt; Probably explains why the IMPORT_CHECK_TARGETS had to be removed.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Fri, 20 Aug 2021 at 13:07, Purushottam Choudhary &lt;<br>
&gt; <a href=3D"mailto:purushottamchoudhary29@gmail.com" target=3D"_blank">=
purushottamchoudhary29@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; assimp CMake modules were adding non-existing paths to its CMake =
modules<br>
&gt; &gt; breaking builds for users of assimp. Remove the hardcoded paths w=
ith<br>
&gt; &gt; an upstream patch with small tweaks.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Purushottam Choudhary &lt;<a href=3D"mailto:purush=
ottamchoudhary29@gmail.com" target=3D"_blank">purushottamchoudhary29@gmail.=
com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ...-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch |=C2=A0 =
68 ------<br>
&gt; &gt;=C2=A0 ...ove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch |=C2=A0 =
32 +++<br>
&gt; &gt;=C2=A0 .../assimp/use-GNUInstallDirs-where-possible.patch | 257<br=
>
&gt; &gt; +++++++++++++++++++++<br>
&gt; &gt;=C2=A0 meta/recipes-graphics/vulkan/<a href=3D"http://assimp_5.0.1=
.bb" rel=3D"noreferrer" target=3D"_blank">assimp_5.0.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
&gt; &gt;=C2=A0 4 files changed, 291 insertions(+), 69 deletions(-)<br>
&gt; &gt;=C2=A0 delete mode 100644<br>
&gt; &gt; meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_D=
IR-to-search-library.patch<br>
&gt; &gt;=C2=A0 create mode 100644<br>
&gt; &gt; meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib=
-from-_IMPORT_CHECK_TARGETS.patch<br>
&gt; &gt;=C2=A0 create mode 100644<br>
&gt; &gt; meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-poss=
ible.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git<br>
&gt; &gt; a/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL=
_DIR-to-search-library.patch<br>
&gt; &gt; b/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL=
_DIR-to-search-library.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 34c5bfa..0000000<br>
&gt; &gt; ---<br>
&gt; &gt; a/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL=
_DIR-to-search-library.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,68 +0,0 @@<br>
&gt; &gt; -From 58f576d6f240b08957a402960cdf06c74201ac7b Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; -From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com"=
 target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt; &gt; -Date: Thu, 12 Dec 2019 22:16:15 -0800<br>
&gt; &gt; -Subject: [PATCH] Use ASSIMP_LIB_INSTALL_DIR to search library<br=
>
&gt; &gt; -<br>
&gt; &gt; -Use ASSIMP_LIB_INSTALL_DIR rather than hardcoded /lib to search =
library<br>
&gt; &gt; -<br>
&gt; &gt; -Upstream-Status: Inappropriate [oe specific]<br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windr=
iver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt; &gt; -<br>
&gt; &gt; ----<br>
&gt; &gt; - <a href=3D"http://assimpTargets-release.cmake.in" rel=3D"norefe=
rrer" target=3D"_blank">assimpTargets-release.cmake.in</a> | 16 ++++++++---=
-----<br>
&gt; &gt; - 1 file changed, 8 insertions(+), 8 deletions(-)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/<a href=3D"http://assimpTargets-release.cmake.in" r=
el=3D"noreferrer" target=3D"_blank">assimpTargets-release.cmake.in</a> b/<b=
r>
&gt; &gt; <a href=3D"http://assimpTargets-release.cmake.in" rel=3D"noreferr=
er" target=3D"_blank">assimpTargets-release.cmake.in</a><br>
&gt; &gt; -index f3db8f1..b8a066a 100644<br>
&gt; &gt; ---- a/<a href=3D"http://assimpTargets-release.cmake.in" rel=3D"n=
oreferrer" target=3D"_blank">assimpTargets-release.cmake.in</a><br>
&gt; &gt; -+++ b/<a href=3D"http://assimpTargets-release.cmake.in" rel=3D"n=
oreferrer" target=3D"_blank">assimpTargets-release.cmake.in</a><br>
&gt; &gt; -@@ -42,11 +42,11 @@ if(MSVC)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# Import target &quot;assimp::assimp&quot; f=
or configuration &quot;Release&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0set_property(TARGET assimp::assimp APPEND PR=
OPERTY<br>
&gt; &gt; IMPORTED_CONFIGURATIONS RELEASE)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERT=
IES<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 IMPORTED_IMPLIB_RELEASE<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${importLibraryName}&quot;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 IMPORTED_IMPLIB_RELEASE &quot;${_IMPORT_PR=
EFIX}/@ASSIMP_LIB_INSTALL_DIR@<br>
&gt; &gt; /${importLibraryName}&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0IMPORTED_LOCATION_RELEASE<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/bin/${sharedLibraryName}&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::as=
simp )<br>
&gt; &gt; --=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${importLibraryName}&quot;)<br>
&gt; &gt; -+=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${importLibraryN=
ame}&quot;)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::=
assimp<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/bin/${sharedLibraryName}&quot; )<br>
&gt; &gt; -=C2=A0 =C2=A0else()<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0set(staticLibraryName<br>
&gt; &gt; &quot;assimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@=
&quot;)<br>
&gt; &gt; -@@ -54,10 +54,10 @@ if(MSVC)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0# Import target &quot;assimp::assimp&quot; f=
or configuration &quot;Release&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0set_property(TARGET assimp::assimp APPEND PR=
OPERTY<br>
&gt; &gt; IMPORTED_CONFIGURATIONS RELEASE)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERT=
IES<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${staticLibraryName}&quot;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryN=
ame}&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::as=
simp )<br>
&gt; &gt; --=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${staticLibraryName}&quot;)<br>
&gt; &gt; -+=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryN=
ame}&quot;)<br>
&gt; &gt; -=C2=A0 =C2=A0endif()<br>
&gt; &gt; -<br>
&gt; &gt; - else()<br>
&gt; &gt; -@@ -70,17 +70,17 @@ else()<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0endif()<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERT=
IES<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0IMPORTED_SONAME_RELEASE &quot;${share=
dLibraryName}&quot;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${sharedLibraryName}&quot;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${sharedLibraryN=
ame}&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::as=
simp )<br>
&gt; &gt; --=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${sharedLibraryName}&quot; )<br>
&gt; &gt; -+=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${sharedLibraryN=
ame}&quot; )<br>
&gt; &gt; -=C2=A0 =C2=A0else()<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0set(staticLibraryName<br>
&gt; &gt; &quot;libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFF=
IX@&quot;)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERT=
IES<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${staticLibraryName}&quot;<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryN=
ame}&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::as=
simp )<br>
&gt; &gt; --=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${staticLibraryName}&quot; )<br>
&gt; &gt; -+=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryN=
ame}&quot; )<br>
&gt; &gt; -=C2=A0 =C2=A0endif()<br>
&gt; &gt; - endif()<br>
&gt; &gt; -<br>
&gt; &gt; diff --git<br>
&gt; &gt; a/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-l=
ib-from-_IMPORT_CHECK_TARGETS.patch<br>
&gt; &gt; b/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-l=
ib-from-_IMPORT_CHECK_TARGETS.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..1078148<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++<br>
&gt; &gt; b/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-l=
ib-from-_IMPORT_CHECK_TARGETS.patch<br>
&gt; &gt; @@ -0,0 +1,32 @@<br>
&gt; &gt; +From: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@=
kpit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
&gt; &gt; +Date: Fri, 13 Aug 2021 16:42:48 +0530<br>
&gt; &gt; +Subject: [PATCH] assimp: remove shared lib from _IMPORT_CHECK_TA=
RGETS<br>
&gt; &gt; +<br>
&gt; &gt; +In the target assimp::assimp shared library verification removed=
<br>
&gt; &gt; +as it is giving configuration error when used by 3rd part compon=
ent to<br>
&gt; &gt; +configure itself using assimp::assimp target<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Inappropriate [oe specific]<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsin=
h.rathod@kpit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + <a href=3D"http://assimpTargets-release.cmake.in" rel=3D"norefe=
rrer" target=3D"_blank">assimpTargets-release.cmake.in</a> | 4 ++--<br>
&gt; &gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/<a href=3D"http://assimpTargets-release.cmake.in" r=
el=3D"noreferrer" target=3D"_blank">assimpTargets-release.cmake.in</a> b/<b=
r>
&gt; &gt; <a href=3D"http://assimpTargets-release.cmake.in" rel=3D"noreferr=
er" target=3D"_blank">assimpTargets-release.cmake.in</a><br>
&gt; &gt; +index cd2fac7e0..52edc7990 100644<br>
&gt; &gt; +--- a/<a href=3D"http://assimpTargets-release.cmake.in" rel=3D"n=
oreferrer" target=3D"_blank">assimpTargets-release.cmake.in</a><br>
&gt; &gt; ++++ b/<a href=3D"http://assimpTargets-release.cmake.in" rel=3D"n=
oreferrer" target=3D"_blank">assimpTargets-release.cmake.in</a><br>
&gt; &gt; +@@ -72,8 +72,8 @@ else()<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0IMPORTED_SONAME_RELEASE &quot;${share=
dLibraryName}&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0IMPORTED_LOCATION_RELEASE &quot;@CMAK=
E_INSTALL_FULL_LIBDIR@<br>
&gt; &gt; /${sharedLibraryName}&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0)<br>
&gt; &gt; +-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp =
)<br>
&gt; &gt; +-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}&quot; )<br=
>
&gt; &gt; ++=C2=A0 =C2=A0 #list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp=
 )<br>
&gt; &gt; ++=C2=A0 =C2=A0 #list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assi=
mp<br>
&gt; &gt; &quot;@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}&quot; )<br=
>
&gt; &gt; +=C2=A0 =C2=A0else()<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0set(staticLibraryName<br>
&gt; &gt; &quot;libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFF=
IX@&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERT=
IES<br>
&gt; &gt; +--<br>
&gt; &gt; +2.17.1<br>
&gt; &gt; diff --git<br>
&gt; &gt; a/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-po=
ssible.patch<br>
&gt; &gt; b/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-po=
ssible.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..e4f5b9c<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++<br>
&gt; &gt; b/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-po=
ssible.patch<br>
&gt; &gt; @@ -0,0 +1,257 @@<br>
&gt; &gt; +From cbf94fd62ff831879d10f99aa7766d391ae8a9b7 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: =3D?UTF-8?q?Victor=3D20Matar=3DC3=3DA9?=3D &lt;<a href=3D"=
mailto:matare@fh-aachen.de" target=3D"_blank">matare@fh-aachen.de</a>&gt;<b=
r>
&gt; &gt; +Date: Tue, 31 Mar 2020 21:30:07 +0200<br>
&gt; &gt; +Subject: [PATCH] use GNUInstallDirs where possible<br>
&gt; &gt; +<br>
&gt; &gt; +Emulate the CMAKE_INSTALL_FULL_* variables on non-Unix systems a=
nd<br>
&gt; &gt; +disable redefining FHS-mandated install locations via user-edita=
ble<br>
&gt; &gt; +ASSIMP_*_INSTALL_DIR variables. Instead, if it REALLY proves nec=
essary,<br>
&gt; &gt; +Unix users can edit the advanced, canonical CMAKE_INSTALL_* vari=
ables.<br>
&gt; &gt; +---<br>
&gt; &gt; + CMakeLists.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 36 ++++++++++++++++++++++------------<br>
&gt; &gt; + <a href=3D"http://assimp.pc.in" rel=3D"noreferrer" target=3D"_b=
lank">assimp.pc.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 6 ++----<br>
&gt; &gt; + <a href=3D"http://assimpTargets-debug.cmake.in" rel=3D"noreferr=
er" target=3D"_blank">assimpTargets-debug.cmake.in</a>=C2=A0 =C2=A0| 20 +++=
++++++----------<br>
&gt; &gt; + <a href=3D"http://assimpTargets-release.cmake.in" rel=3D"norefe=
rrer" target=3D"_blank">assimpTargets-release.cmake.in</a> | 18 ++++++++---=
------<br>
&gt; &gt; + <a href=3D"http://assimpTargets.cmake.in" rel=3D"noreferrer" ta=
rget=3D"_blank">assimpTargets.cmake.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 15 +-------------<br>
&gt; &gt; + 5 files changed, 45 insertions(+), 50 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Backport<br>
&gt; &gt; +Comment: Additionally remove setting of ASSIMP_LIBRARY_DIRS,<br>
&gt; &gt; ASSIMP_INCLUDE_DIRS<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and INTERFACE_INCLUDE_DIRECTOR=
IES as default cross compile paths<br>
&gt; &gt; are enough<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and setting them manually adds=
 non-existing paths to CMake<br>
&gt; &gt; modules<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsin=
h.rathod@kpit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
&gt; &gt; +index dcafb649f5..c23c0df33e 100644<br>
&gt; &gt; +--- a/CMakeLists.txt<br>
&gt; &gt; ++++ b/CMakeLists.txt<br>
&gt; &gt; +@@ -230,11 +230,6 @@ SET(LIBASSIMP-DEV_COMPONENT<br>
&gt; &gt; &quot;libassimp${ASSIMP_VERSION_MAJOR}.${ASSIMP_VERSION_M<br>
&gt; &gt; + SET(CPACK_COMPONENTS_ALL assimp-bin ${LIBASSIMP_COMPONENT}<br>
&gt; &gt; ${LIBASSIMP-DEV_COMPONENT} assimp-dev)<br>
&gt; &gt; + SET(ASSIMP_LIBRARY_SUFFIX &quot;&quot; CACHE STRING &quot;Suffi=
x to append to library<br>
&gt; &gt; names&quot;)<br>
&gt; &gt; +<br>
&gt; &gt; +-IF( UNIX )<br>
&gt; &gt; +-=C2=A0 # Use GNUInstallDirs for Unix predefined directories<br>
&gt; &gt; +-=C2=A0 INCLUDE(GNUInstallDirs)<br>
&gt; &gt; +-ENDIF( UNIX )<br>
&gt; &gt; +-<br>
&gt; &gt; + # Grouped compiler settings<br>
&gt; &gt; + IF ((CMAKE_C_COMPILER_ID MATCHES &quot;GNU&quot;) AND NOT CMAKE=
_COMPILER_IS_MINGW)<br>
&gt; &gt; +=C2=A0 =C2=A0IF(NOT HUNTER_ENABLED)<br>
&gt; &gt; +@@ -329,14 +324,6 @@ IF ( CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY=
_DIR )<br>
&gt; &gt; +=C2=A0 =C2=A0SET( CMAKE_RUNTIME_OUTPUT_DIRECTORY &quot;${CMAKE_H=
OME_DIRECTORY}/bin&quot; )<br>
&gt; &gt; + ENDIF ( CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR )<br>
&gt; &gt; +<br>
&gt; &gt; +-# Cache these to allow the user to override them manually.<br>
&gt; &gt; +-SET( ASSIMP_LIB_INSTALL_DIR &quot;lib&quot; CACHE STRING<br>
&gt; &gt; +-=C2=A0 &quot;Path the built library files are installed to.&quo=
t; )<br>
&gt; &gt; +-SET( ASSIMP_INCLUDE_INSTALL_DIR &quot;include&quot; CACHE STRIN=
G<br>
&gt; &gt; +-=C2=A0 &quot;Path the header files are installed to.&quot; )<br=
>
&gt; &gt; +-SET( ASSIMP_BIN_INSTALL_DIR &quot;bin&quot; CACHE STRING<br>
&gt; &gt; +-=C2=A0 &quot;Path the tool executables are installed to.&quot; =
)<br>
&gt; &gt; +-<br>
&gt; &gt; + get_cmake_property(is_multi_config GENERATOR_IS_MULTI_CONFIG)<b=
r>
&gt; &gt; +<br>
&gt; &gt; + IF (INJECT_DEBUG_POSTFIX AND (is_multi_config OR CMAKE_BUILD_TY=
PE<br>
&gt; &gt; STREQUAL &quot;Debug&quot;))<br>
&gt; &gt; +@@ -391,6 +378,29 @@ IF(HUNTER_ENABLED)<br>
&gt; &gt; +=C2=A0 =C2=A0)<br>
&gt; &gt; + ELSE(HUNTER_ENABLED)<br>
&gt; &gt; +=C2=A0 =C2=A0# cmake configuration files<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 IF( UNIX )<br>
&gt; &gt; ++=C2=A0 =C2=A0 # Use GNUInstallDirs for Unix predefined director=
ies<br>
&gt; &gt; ++=C2=A0 =C2=A0 INCLUDE(GNUInstallDirs)<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 SET( ASSIMP_LIB_INSTALL_DIR ${CMAKE_INSTALL_LIBDI=
R})<br>
&gt; &gt; ++=C2=A0 =C2=A0 SET( ASSIMP_INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_I=
NCLUDEDIR})<br>
&gt; &gt; ++=C2=A0 =C2=A0 SET( ASSIMP_BIN_INSTALL_DIR ${CMAKE_INSTALL_BINDI=
R})<br>
&gt; &gt; ++=C2=A0 ELSE( UNIX )<br>
&gt; &gt; ++=C2=A0 =C2=A0 # Cache these to allow the user to override them =
on non-Unix<br>
&gt; &gt; platforms<br>
&gt; &gt; ++=C2=A0 =C2=A0 SET( ASSIMP_LIB_INSTALL_DIR &quot;lib&quot; CACHE=
 STRING<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;Path the built library files are ins=
talled to.&quot; )<br>
&gt; &gt; ++=C2=A0 =C2=A0 SET( ASSIMP_INCLUDE_INSTALL_DIR &quot;include&quo=
t; CACHE STRING<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;Path the header files are installed =
to.&quot; )<br>
&gt; &gt; ++=C2=A0 =C2=A0 SET( ASSIMP_BIN_INSTALL_DIR &quot;bin&quot; CACHE=
 STRING<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;Path the tool executables are instal=
led to.&quot; )<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 SET(CMAKE_INSTALL_FULL_INCLUDEDIR<br>
&gt; &gt; ${CMAKE_INSTALL_PREFIX}/${ASSIMP_INCLUDE_INSTALL_DIR})<br>
&gt; &gt; ++=C2=A0 =C2=A0 SET(CMAKE_INSTALL_FULL_LIBDIR<br>
&gt; &gt; ${CMAKE_INSTALL_PREFIX}/${ASSIMP_LIB_INSTALL_DIR})<br>
&gt; &gt; ++=C2=A0 =C2=A0 SET(CMAKE_INSTALL_FULL_BINDIR<br>
&gt; &gt; ${CMAKE_INSTALL_PREFIX}/${ASSIMP_BIN_INSTALL_DIR})<br>
&gt; &gt; ++=C2=A0 ENDIF( UNIX )<br>
&gt; &gt; ++<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0CONFIGURE_FILE(&quot;${CMAKE_CURRENT_SOURCE_DIR}/<a=
 href=3D"http://assimp-config.cmake.in" rel=3D"noreferrer" target=3D"_blank=
">assimp-config.cmake.in</a>&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${CMAKE_CURRENT_BINARY_DIR}/assi=
mp-config.cmake&quot; @ONLY IMMEDIATE)<br>
&gt; &gt; +=C2=A0 =C2=A0CONFIGURE_FILE(&quot;${CMAKE_CURRENT_SOURCE_DIR}/<a=
 href=3D"http://assimpTargets.cmake.in" rel=3D"noreferrer" target=3D"_blank=
">assimpTargets.cmake.in</a>&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${CMAKE_CURRENT_BINARY_DIR}/assi=
mpTargets.cmake&quot; @ONLY IMMEDIATE)<br>
&gt; &gt; +=C2=A0 =C2=A0IF (is_multi_config)<br>
&gt; &gt; +diff --git a/<a href=3D"http://assimp.pc.in" rel=3D"noreferrer" =
target=3D"_blank">assimp.pc.in</a> b/<a href=3D"http://assimp.pc.in" rel=3D=
"noreferrer" target=3D"_blank">assimp.pc.in</a><br>
&gt; &gt; +index c659e19f2c..555a3a1d3b 100644<br>
&gt; &gt; +--- a/<a href=3D"http://assimp.pc.in" rel=3D"noreferrer" target=
=3D"_blank">assimp.pc.in</a><br>
&gt; &gt; ++++ b/<a href=3D"http://assimp.pc.in" rel=3D"noreferrer" target=
=3D"_blank">assimp.pc.in</a><br>
&gt; &gt; +@@ -1,7 +1,5 @@<br>
&gt; &gt; +-prefix=3D@CMAKE_INSTALL_PREFIX@<br>
&gt; &gt; +-exec_prefix=3D@CMAKE_INSTALL_PREFIX@/<br>
&gt; &gt; +-libdir=3D@CMAKE_INSTALL_PREFIX@/@ASSIMP_LIB_INSTALL_DIR@<br>
&gt; &gt; +-includedir=3D@CMAKE_INSTALL_PREFIX@<br>
&gt; &gt; /../include/@ASSIMP_INCLUDE_INSTALL_DIR@<br>
&gt; &gt; ++libdir=3D@CMAKE_INSTALL_FULL_LIBDIR@<br>
&gt; &gt; ++includedir=3D@CMAKE_INSTALL_FULL_INCLUDEDIR@<br>
&gt; &gt; +<br>
&gt; &gt; + Name: @CMAKE_PROJECT_NAME@<br>
&gt; &gt; + Description: Import various well-known 3D model formats in an u=
niform<br>
&gt; &gt; manner.<br>
&gt; &gt; +diff --git a/<a href=3D"http://assimpTargets-debug.cmake.in" rel=
=3D"noreferrer" target=3D"_blank">assimpTargets-debug.cmake.in</a> b/<a hre=
f=3D"http://assimpTargets-debug.cmake.in" rel=3D"noreferrer" target=3D"_bla=
nk">assimpTargets-debug.cmake.in</a><br>
&gt; &gt; +index 1ebe2a6081..f5034c9349 100644<br>
&gt; &gt; +--- a/<a href=3D"http://assimpTargets-debug.cmake.in" rel=3D"nor=
eferrer" target=3D"_blank">assimpTargets-debug.cmake.in</a><br>
&gt; &gt; ++++ b/<a href=3D"http://assimpTargets-debug.cmake.in" rel=3D"nor=
eferrer" target=3D"_blank">assimpTargets-debug.cmake.in</a><br>
&gt; &gt; +@@ -42,22 +42,22 @@ if(MSVC)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0# Import target &quot;assimp::assimp&quot; f=
or configuration &quot;Debug&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0set_property(TARGET assimp::assimp APPEND PR=
OPERTY<br>
&gt; &gt; IMPORTED_CONFIGURATIONS DEBUG)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERT=
IES<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 IMPORTED_IMPLIB_DEBUG &quot;${_IMPORT_PREF=
IX}/lib/${importLibraryName}&quot;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/bin/${sharedLibraryName}&quot;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 IMPORTED_IMPLIB_DEBUG &quot;@CMAKE_INSTALL=
_FULL_LIBDIR@<br>
&gt; &gt; /${importLibraryName}&quot;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG &quot;@CMAKE_INSTA=
LL_FULL_BINDIR@<br>
&gt; &gt; /${sharedLibraryName}&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::as=
simp )<br>
&gt; &gt; +-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${importLibraryName}&quot;)<br>
&gt; &gt; +-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/bin/${sharedLibraryName}&quot; )<br>
&gt; &gt; ++=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;@CMAKE_INSTALL_FULL_LIBDIR@/${importLibraryName}&quot;)<br>
&gt; &gt; ++=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;@CMAKE_INSTALL_FULL_BINDIR@/${sharedLibraryName}&quot; )<br=
>
&gt; &gt; +=C2=A0 =C2=A0else()<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0set(staticLibraryName<br>
&gt; &gt; &quot;assimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_DEBUG_POSTFIX<br>
&gt; &gt; @@CMAKE_STATIC_LIBRARY_SUFFIX@&quot;)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0# Import target &quot;assimp::assimp&quot; f=
or configuration &quot;Debug&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0set_property(TARGET assimp::assimp APPEND PR=
OPERTY<br>
&gt; &gt; IMPORTED_CONFIGURATIONS DEBUG)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERT=
IES<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${staticLibraryName}&quot;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG &quot;@CMAKE_INSTA=
LL_FULL_LIBDIR@<br>
&gt; &gt; /${staticLibraryName}&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::as=
simp )<br>
&gt; &gt; +-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${staticLibraryName}&quot;)<br>
&gt; &gt; ++=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0endif()<br>
&gt; &gt; +<br>
&gt; &gt; + else()<br>
&gt; &gt; +@@ -66,17 +66,17 @@ else()<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0set(sharedLibraryName<br>
&gt; &gt; &quot;libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_DEBUG_POSTFIX<br>
&gt; &gt; @@CMAKE_SHARED_LIBRARY_SUFFIX@.@ASSIMP_VERSION_MAJOR@&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERT=
IES<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0IMPORTED_SONAME_DEBUG &quot;${sharedL=
ibraryName}&quot;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${sharedLibraryName}&quot;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG &quot;@CMAKE_INSTA=
LL_FULL_LIBDIR@<br>
&gt; &gt; /${sharedLibraryName}&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::as=
simp )<br>
&gt; &gt; +-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${sharedLibraryName}&quot; )<br>
&gt; &gt; ++=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}&quot; )<br=
>
&gt; &gt; +=C2=A0 =C2=A0else()<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0set(staticLibraryName<br>
&gt; &gt; &quot;libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_DEBUG_POSTFIX<br>
&gt; &gt; @@CMAKE_STATIC_LIBRARY_SUFFIX@&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERT=
IES<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${staticLibraryName}&quot;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG &quot;@CMAKE_INSTA=
LL_FULL_LIBDIR@<br>
&gt; &gt; /${staticLibraryName}&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::as=
simp )<br>
&gt; &gt; +-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${staticLibraryName}&quot; )<br>
&gt; &gt; ++=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}&quot; )<br=
>
&gt; &gt; +=C2=A0 =C2=A0endif()<br>
&gt; &gt; + endif()<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/<a href=3D"http://assimpTargets-release.cmake.in" r=
el=3D"noreferrer" target=3D"_blank">assimpTargets-release.cmake.in</a> b/<b=
r>
&gt; &gt; <a href=3D"http://assimpTargets-release.cmake.in" rel=3D"noreferr=
er" target=3D"_blank">assimpTargets-release.cmake.in</a><br>
&gt; &gt; +index f3db8f12cd..a416e8899b 100644<br>
&gt; &gt; +--- a/<a href=3D"http://assimpTargets-release.cmake.in" rel=3D"n=
oreferrer" target=3D"_blank">assimpTargets-release.cmake.in</a><br>
&gt; &gt; ++++ b/<a href=3D"http://assimpTargets-release.cmake.in" rel=3D"n=
oreferrer" target=3D"_blank">assimpTargets-release.cmake.in</a><br>
&gt; &gt; +@@ -42,12 +42,12 @@ if(MSVC)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0# Import target &quot;assimp::assimp&quot; f=
or configuration &quot;Release&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0set_property(TARGET assimp::assimp APPEND PR=
OPERTY<br>
&gt; &gt; IMPORTED_CONFIGURATIONS RELEASE)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERT=
IES<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 IMPORTED_IMPLIB_RELEASE<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${importLibraryName}&quot;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/bin/${sharedLibraryName}&quot;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 IMPORTED_IMPLIB_RELEASE &quot;@CMAKE_INSTA=
LL_FULL_LIBDIR@<br>
&gt; &gt; /${importLibraryName}&quot;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot;@CMAKE_INS=
TALL_FULL_BINDIR@<br>
&gt; &gt; /${sharedLibraryName}&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::as=
simp )<br>
&gt; &gt; +-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${importLibraryName}&quot;)<br>
&gt; &gt; +-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/bin/${sharedLibraryName}&quot; )<br>
&gt; &gt; ++=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;@CMAKE_INSTALL_FULL_LIBDIR@/${importLibraryName}&quot;)<br>
&gt; &gt; ++=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;@CMAKE_INSTALL_FULL_BINDIR@/${sharedLibraryName}&quot; )<br=
>
&gt; &gt; +=C2=A0 =C2=A0else()<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0set(staticLibraryName<br>
&gt; &gt; &quot;assimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@=
&quot;)<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -57,7 +57,7 @@ if(MSVC)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0IMPORTED_LOCATION_RELEASE<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${staticLibraryName}&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::as=
simp )<br>
&gt; &gt; +-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${staticLibraryName}&quot;)<br>
&gt; &gt; ++=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0endif()<br>
&gt; &gt; +<br>
&gt; &gt; + else()<br>
&gt; &gt; +@@ -70,17 +70,17 @@ else()<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0endif()<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERT=
IES<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0IMPORTED_SONAME_RELEASE &quot;${share=
dLibraryName}&quot;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${sharedLibraryName}&quot;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot;@CMAKE_INS=
TALL_FULL_LIBDIR@<br>
&gt; &gt; /${sharedLibraryName}&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::as=
simp )<br>
&gt; &gt; +-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${sharedLibraryName}&quot; )<br>
&gt; &gt; ++=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}&quot; )<br=
>
&gt; &gt; +=C2=A0 =C2=A0else()<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0set(staticLibraryName<br>
&gt; &gt; &quot;libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFF=
IX@&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERT=
IES<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${staticLibraryName}&quot;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot;@CMAKE_INS=
TALL_FULL_LIBDIR@<br>
&gt; &gt; /${staticLibraryName}&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::as=
simp )<br>
&gt; &gt; +-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/lib/${staticLibraryName}&quot; )<br>
&gt; &gt; ++=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assim=
p<br>
&gt; &gt; &quot;@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}&quot; )<br=
>
&gt; &gt; +=C2=A0 =C2=A0endif()<br>
&gt; &gt; + endif()<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -91,8 +91,6 @@ get_filename_component(ASSIMP_ROOT_DIR<br>
&gt; &gt; &quot;@CMAKE_INSTALL_PREFIX@&quot; REALPATH)<br>
&gt; &gt; +<br>
&gt; &gt; + set( ASSIMP_CXX_FLAGS ) # dynamically linked library<br>
&gt; &gt; + set( ASSIMP_LINK_FLAGS &quot;&quot; )<br>
&gt; &gt; +-set( ASSIMP_LIBRARY_DIRS &quot;${ASSIMP_ROOT_DIR}/@ASSIMP_LIB_I=
NSTALL_DIR@&quot;)<br>
&gt; &gt; +-set( ASSIMP_INCLUDE_DIRS &quot;${ASSIMP_ROOT_DIR}/@ASSIMP_INCLU=
DE_INSTALL_DIR@<br>
&gt; &gt; &quot;)<br>
&gt; &gt; + if(ASSIMP_BUILD_SHARED_LIBS)<br>
&gt; &gt; +=C2=A0 =C2=A0set( ASSIMP_LIBRARIES ${sharedLibraryName})<br>
&gt; &gt; + else()<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/<a href=3D"http://assimpTargets.cmake.in" rel=3D"no=
referrer" target=3D"_blank">assimpTargets.cmake.in</a> b/<a href=3D"http://=
assimpTargets.cmake.in" rel=3D"noreferrer" target=3D"_blank">assimpTargets.=
cmake.in</a><br>
&gt; &gt; +index ab1a8d2c7b..ef90c834a6 100644<br>
&gt; &gt; +--- a/<a href=3D"http://assimpTargets.cmake.in" rel=3D"noreferre=
r" target=3D"_blank">assimpTargets.cmake.in</a><br>
&gt; &gt; ++++ b/<a href=3D"http://assimpTargets.cmake.in" rel=3D"noreferre=
r" target=3D"_blank">assimpTargets.cmake.in</a><br>
&gt; &gt; +@@ -40,16 +40,6 @@ unset(_targetsDefined)<br>
&gt; &gt; + unset(_targetsNotDefined)<br>
&gt; &gt; + unset(_expectedTargets)<br>
&gt; &gt; +<br>
&gt; &gt; +-<br>
&gt; &gt; +-# Compute the installation prefix relative to this file.<br>
&gt; &gt; +-get_filename_component(_IMPORT_PREFIX &quot;${CMAKE_CURRENT_LIS=
T_FILE}&quot; PATH)<br>
&gt; &gt; +-get_filename_component(_IMPORT_PREFIX &quot;${_IMPORT_PREFIX}&q=
uot; PATH)<br>
&gt; &gt; +-get_filename_component(_IMPORT_PREFIX &quot;${_IMPORT_PREFIX}&q=
uot; PATH)<br>
&gt; &gt; +-get_filename_component(_IMPORT_PREFIX &quot;${_IMPORT_PREFIX}&q=
uot; PATH)<br>
&gt; &gt; +-if(_IMPORT_PREFIX STREQUAL &quot;/&quot;)<br>
&gt; &gt; +-=C2=A0 set(_IMPORT_PREFIX &quot;&quot;)<br>
&gt; &gt; +-endif()<br>
&gt; &gt; +-<br>
&gt; &gt; + # Create imported target assimp::assimp<br>
&gt; &gt; + if(@BUILD_SHARED_LIBS@)<br>
&gt; &gt; +=C2=A0 =C2=A0add_library(assimp::assimp SHARED IMPORTED)<br>
&gt; &gt; +@@ -60,7 +50,7 @@ endif()<br>
&gt; &gt; + set_target_properties(assimp::assimp PROPERTIES<br>
&gt; &gt; +=C2=A0 =C2=A0COMPATIBLE_INTERFACE_STRING &quot;assimp_MAJOR_VERS=
ION&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0INTERFACE_assimp_MAJOR_VERSION &quot;1&quot;<br>
&gt; &gt; +-=C2=A0 INTERFACE_INCLUDE_DIRECTORIES<br>
&gt; &gt; &quot;${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include&quot;<b=
r>
&gt; &gt; ++=C2=A0 #INTERFACE_INCLUDE_DIRECTORIES &quot;@CMAKE_INSTALL_FULL=
_INCLUDEDIR@&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0#INTERFACE_LINK_LIBRARIES<br>
&gt; &gt; &quot;TxtUtils::TxtUtils;MealyMachine::MealyMachine&quot;<br>
&gt; &gt; + )<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -75,9 +65,6 @@ foreach(f ${CONFIG_FILES})<br>
&gt; &gt; +=C2=A0 =C2=A0include(${f})<br>
&gt; &gt; + endforeach()<br>
&gt; &gt; +<br>
&gt; &gt; +-# Cleanup temporary variables.<br>
&gt; &gt; +-set(_IMPORT_PREFIX)<br>
&gt; &gt; +-<br>
&gt; &gt; + # Loop over all imported files and verify that they actually ex=
ist<br>
&gt; &gt; + foreach(target ${_IMPORT_CHECK_TARGETS} )<br>
&gt; &gt; +=C2=A0 =C2=A0foreach(file ${_IMPORT_CHECK_FILES_FOR_${target}} )=
<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/meta/recipes-graphics/vulkan/<a href=3D"http://assim=
p_5.0.1.bb" rel=3D"noreferrer" target=3D"_blank">assimp_5.0.1.bb</a><br>
&gt; &gt; b/meta/recipes-graphics/vulkan/<a href=3D"http://assimp_5.0.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">assimp_5.0.1.bb</a><br>
&gt; &gt; index 4eb0cef..89c555f 100644<br>
&gt; &gt; --- a/meta/recipes-graphics/vulkan/<a href=3D"http://assimp_5.0.1=
.bb" rel=3D"noreferrer" target=3D"_blank">assimp_5.0.1.bb</a><br>
&gt; &gt; +++ b/meta/recipes-graphics/vulkan/<a href=3D"http://assimp_5.0.1=
.bb" rel=3D"noreferrer" target=3D"_blank">assimp_5.0.1.bb</a><br>
&gt; &gt; @@ -10,7 +10,8 @@ DEPENDS =3D &quot;zlib&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/assimp=
/assimp.git;branch=3Dassimp_5.0_release" rel=3D"noreferrer" target=3D"_blan=
k">github.com/assimp/assimp.git;branch=3Dassimp_5.0_release</a> \<br>
&gt; &gt;<br>
&gt; &gt; file://0001-closes-https-github.com-assimp-assimp-issues-2733-up.=
patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Use-ASSIMP_=
LIB_INSTALL_DIR-to-search-library.patch<br>
&gt; &gt; \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://use-GNUInstallDi=
rs-where-possible.patch \<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 file://0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TAR=
GETS.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt;=C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;(\d+(\=
.\d+)+))&quot;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.7.4<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div>

--000000000000cc801f05ca4dc1b1--
