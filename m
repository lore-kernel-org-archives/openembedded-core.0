Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.36652.1629797241349420473
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 02:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G9of4+ae;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: samuli.piippo@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id b9so7492146plx.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 02:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x4eMmZ9B71geYpHY61aiFOBFyfkHp/A9zPw4o+9faEg=;
        b=G9of4+aeHVq25uTwO0kDed3h1kDxL90obssNZ9xbE6c+WskNzZCgkQIppPW4L4FKNZ
         QnWw31W74brgf4ibqzhIjfQoKPhTrBZkOLcjZLqFLL2O7wqoxEOY+H9QJiD9q0PZgKlA
         GeNi2yDdzb3Di1g7dQyG0rVPM2Wjb+F80orA4A0PKhW+tZ8L006qS/yGkLEvVcn6X5Ig
         bEESr9HAVrrl/VIqmsynfdWyAgcKLjoj+4yB+ChNrIc84QkJfaHmaWVvv63VeCBmoFkG
         ueA6EilwnsbWvi1NL6lLKJPL29m6ZBfF0ffh9Z/nkOWckv/vAzefOhXqlIpzM6vpAxyd
         NYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x4eMmZ9B71geYpHY61aiFOBFyfkHp/A9zPw4o+9faEg=;
        b=mhIyf1c4de36yLSN6yh1mGtGlBOxzea6g8xPSu3o3W9bqxGmEtjcE7M4HIlvt8EP43
         0ljMWVQGloEHW0sZd8jRquGd5S9tjlmjegEeGWdjINxK8SBJctqIoNFqYV30f3062g4O
         rf2jsYGpQ0r8aO5Ru5WAjuFiWApkEqzbZNe5LG6YawpwH3VuhLLk5c2YkfDbOPBsBd91
         sxgPE6RVIH2UdYzKXEHtXSD0wgNKXTgSoE4dkfl0LfYcLDgwGUV93iVDD7WCWu9Tfsok
         JG6Psv/MTCe671wbD+K7rVl+HIbnmMHfY9RyG0zUXEkSYNHNGQ0G0hfSLOYrCA/Xpeql
         OOmQ==
X-Gm-Message-State: AOAM53079VVKE9WLxEtJ9aqcKtMizS54YXjGIm0VdaSLFNSpNQw3Cttr
	1m9nzwxJsPaRzf5sS5CrjcIr7wpLknsecTDpbnk=
X-Google-Smtp-Source: ABdhPJx/VW5AAi8e2T0k1PaYJUCSsRyEvjOcfSxWDbHS/d4scZ/DKxNzoM+j7qYqGPymRdZnlanyg8ANU/zarExgLUA=
X-Received: by 2002:a17:90a:a104:: with SMTP id s4mr3366308pjp.184.1629797240784;
 Tue, 24 Aug 2021 02:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <1629454029-8279-1-git-send-email-purushottamchoudhary29@gmail.com>
In-Reply-To: <1629454029-8279-1-git-send-email-purushottamchoudhary29@gmail.com>
From: "Samuli Piippo" <samuli.piippo@gmail.com>
Date: Tue, 24 Aug 2021 12:27:09 +0300
Message-ID: <CABXoSoWHBQ+Z_m+p_okxwAQ9OnKN1E-7jUVn8a3wsVgSgT+a1w@mail.gmail.com>
Subject: Re: [OE-core] [poky][master][PATCH] assimp: added patch to fix hardcoded non-existing paths in CMake modules
To: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, sakoman@gmail.com, 
	nisha.parrakat@kpit.com, Mikko.Rapeli@bmw.de
Content-Type: multipart/alternative; boundary="00000000000097cd3305ca4abddb"

--00000000000097cd3305ca4abddb
Content-Type: text/plain; charset="UTF-8"

Looks like this commit breaks something in the cmake files.

When using assimp from another recipe (Qt3D), it will try to use the
library from host path:

/usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(69):
 set(sharedLibraryName libassimp.so.5 )
/usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(71):
 set_target_properties(assimp::assimp PROPERTIES IMPORTED_SONAME_RELEASE
libassimp.so.5 IMPORTED_LOCATION_RELEASE /usr/lib/libassimp.so.5 )

Whereas, before the patch, it was correctly using it from the sysroot:

/usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(69):
 set(sharedLibraryName libassimp.so.5 )
/usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(71):
 set_target_properties(assimp::assimp PROPERTIES IMPORTED_SONAME_RELEASE
libassimp.so.5 IMPORTED_LOCATION_RELEASE
/home/qt/work/build/build/tmp/work/core2-32-poky-linux/qt3d/6.3.0-r0/recipe-sysroot/usr/lib/libassimp.so.5
)
/usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(75):  list(APPEND
_IMPORT_CHECK_TARGETS assimp::assimp )
/usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(76):  list(APPEND
_IMPORT_CHECK_FILES_FOR_assimp::assimp
/home/qt/work/build/build/tmp/work/core2-32-poky-linux/qt3d/6.3.0-r0/recipe-sysroot/usr/lib/libassimp.so.5
)

Probably explains why the IMPORT_CHECK_TARGETS had to be removed.



On Fri, 20 Aug 2021 at 13:07, Purushottam Choudhary <
purushottamchoudhary29@gmail.com> wrote:

> assimp CMake modules were adding non-existing paths to its CMake modules
> breaking builds for users of assimp. Remove the hardcoded paths with
> an upstream patch with small tweaks.
>
> Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
> ---
>  ...-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch |  68 ------
>  ...ove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch |  32 +++
>  .../assimp/use-GNUInstallDirs-where-possible.patch | 257
> +++++++++++++++++++++
>  meta/recipes-graphics/vulkan/assimp_5.0.1.bb       |   3 +-
>  4 files changed, 291 insertions(+), 69 deletions(-)
>  delete mode 100644
> meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch
>  create mode 100644
> meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
>  create mode 100644
> meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible.patch
>
> diff --git
> a/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch
> b/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch
> deleted file mode 100644
> index 34c5bfa..0000000
> ---
> a/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -From 58f576d6f240b08957a402960cdf06c74201ac7b Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Thu, 12 Dec 2019 22:16:15 -0800
> -Subject: [PATCH] Use ASSIMP_LIB_INSTALL_DIR to search library
> -
> -Use ASSIMP_LIB_INSTALL_DIR rather than hardcoded /lib to search library
> -
> -Upstream-Status: Inappropriate [oe specific]
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> -
> ----
> - assimpTargets-release.cmake.in | 16 ++++++++--------
> - 1 file changed, 8 insertions(+), 8 deletions(-)
> -
> -diff --git a/assimpTargets-release.cmake.in b/
> assimpTargets-release.cmake.in
> -index f3db8f1..b8a066a 100644
> ---- a/assimpTargets-release.cmake.in
> -+++ b/assimpTargets-release.cmake.in
> -@@ -42,11 +42,11 @@ if(MSVC)
> -     # Import target "assimp::assimp" for configuration "Release"
> -     set_property(TARGET assimp::assimp APPEND PROPERTY
> IMPORTED_CONFIGURATIONS RELEASE)
> -     set_target_properties(assimp::assimp PROPERTIES
> --      IMPORTED_IMPLIB_RELEASE
> "${_IMPORT_PREFIX}/lib/${importLibraryName}"
> -+      IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@
> /${importLibraryName}"
> -       IMPORTED_LOCATION_RELEASE
> "${_IMPORT_PREFIX}/bin/${sharedLibraryName}"
> -     )
> -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/lib/${importLibraryName}")
> -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${importLibraryName}")
> -     list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/bin/${sharedLibraryName}" )
> -   else()
> -     set(staticLibraryName
> "assimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> -@@ -54,10 +54,10 @@ if(MSVC)
> -     # Import target "assimp::assimp" for configuration "Release"
> -     set_property(TARGET assimp::assimp APPEND PROPERTY
> IMPORTED_CONFIGURATIONS RELEASE)
> -     set_target_properties(assimp::assimp PROPERTIES
> --      IMPORTED_LOCATION_RELEASE
> "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> -+      IMPORTED_LOCATION_RELEASE
> "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}"
> -     )
> -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/lib/${staticLibraryName}")
> -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}")
> -   endif()
> -
> - else()
> -@@ -70,17 +70,17 @@ else()
> -     endif()
> -     set_target_properties(assimp::assimp PROPERTIES
> -       IMPORTED_SONAME_RELEASE "${sharedLibraryName}"
> --      IMPORTED_LOCATION_RELEASE
> "${_IMPORT_PREFIX}/lib/${sharedLibraryName}"
> -+      IMPORTED_LOCATION_RELEASE
> "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${sharedLibraryName}"
> -     )
> -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/lib/${sharedLibraryName}" )
> -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${sharedLibraryName}" )
> -   else()
> -     set(staticLibraryName
> "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> -     set_target_properties(assimp::assimp PROPERTIES
> --      IMPORTED_LOCATION_RELEASE
> "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> -+      IMPORTED_LOCATION_RELEASE
> "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}"
> -     )
> -     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/lib/${staticLibraryName}" )
> -+    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}" )
> -   endif()
> - endif()
> -
> diff --git
> a/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
> b/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
> new file mode 100644
> index 0000000..1078148
> --- /dev/null
> +++
> b/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
> @@ -0,0 +1,32 @@
> +From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +Date: Fri, 13 Aug 2021 16:42:48 +0530
> +Subject: [PATCH] assimp: remove shared lib from _IMPORT_CHECK_TARGETS
> +
> +In the target assimp::assimp shared library verification removed
> +as it is giving configuration error when used by 3rd part component to
> +configure itself using assimp::assimp target
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +---
> + assimpTargets-release.cmake.in | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/assimpTargets-release.cmake.in b/
> assimpTargets-release.cmake.in
> +index cd2fac7e0..52edc7990 100644
> +--- a/assimpTargets-release.cmake.in
> ++++ b/assimpTargets-release.cmake.in
> +@@ -72,8 +72,8 @@ else()
> +       IMPORTED_SONAME_RELEASE "${sharedLibraryName}"
> +       IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@
> /${sharedLibraryName}"
> +     )
> +-    list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> ++    #list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> ++    #list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> +   else()
> +     set(staticLibraryName
> "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> +     set_target_properties(assimp::assimp PROPERTIES
> +--
> +2.17.1
> diff --git
> a/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible.patch
> b/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible.patch
> new file mode 100644
> index 0000000..e4f5b9c
> --- /dev/null
> +++
> b/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible.patch
> @@ -0,0 +1,257 @@
> +From cbf94fd62ff831879d10f99aa7766d391ae8a9b7 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Victor=20Matar=C3=A9?= <matare@fh-aachen.de>
> +Date: Tue, 31 Mar 2020 21:30:07 +0200
> +Subject: [PATCH] use GNUInstallDirs where possible
> +
> +Emulate the CMAKE_INSTALL_FULL_* variables on non-Unix systems and
> +disable redefining FHS-mandated install locations via user-editable
> +ASSIMP_*_INSTALL_DIR variables. Instead, if it REALLY proves necessary,
> +Unix users can edit the advanced, canonical CMAKE_INSTALL_* variables.
> +---
> + CMakeLists.txt                 | 36 ++++++++++++++++++++++------------
> + assimp.pc.in                   |  6 ++----
> + assimpTargets-debug.cmake.in   | 20 +++++++++----------
> + assimpTargets-release.cmake.in | 18 ++++++++---------
> + assimpTargets.cmake.in         | 15 +-------------
> + 5 files changed, 45 insertions(+), 50 deletions(-)
> +
> +Upstream-Status: Backport
> +Comment: Additionally remove setting of ASSIMP_LIBRARY_DIRS,
> ASSIMP_INCLUDE_DIRS
> +         and INTERFACE_INCLUDE_DIRECTORIES as default cross compile paths
> are enough
> +         and setting them manually adds non-existing paths to CMake
> modules
> +
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index dcafb649f5..c23c0df33e 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -230,11 +230,6 @@ SET(LIBASSIMP-DEV_COMPONENT
> "libassimp${ASSIMP_VERSION_MAJOR}.${ASSIMP_VERSION_M
> + SET(CPACK_COMPONENTS_ALL assimp-bin ${LIBASSIMP_COMPONENT}
> ${LIBASSIMP-DEV_COMPONENT} assimp-dev)
> + SET(ASSIMP_LIBRARY_SUFFIX "" CACHE STRING "Suffix to append to library
> names")
> +
> +-IF( UNIX )
> +-  # Use GNUInstallDirs for Unix predefined directories
> +-  INCLUDE(GNUInstallDirs)
> +-ENDIF( UNIX )
> +-
> + # Grouped compiler settings
> + IF ((CMAKE_C_COMPILER_ID MATCHES "GNU") AND NOT CMAKE_COMPILER_IS_MINGW)
> +   IF(NOT HUNTER_ENABLED)
> +@@ -329,14 +324,6 @@ IF ( CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR )
> +   SET( CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_HOME_DIRECTORY}/bin" )
> + ENDIF ( CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR )
> +
> +-# Cache these to allow the user to override them manually.
> +-SET( ASSIMP_LIB_INSTALL_DIR "lib" CACHE STRING
> +-  "Path the built library files are installed to." )
> +-SET( ASSIMP_INCLUDE_INSTALL_DIR "include" CACHE STRING
> +-  "Path the header files are installed to." )
> +-SET( ASSIMP_BIN_INSTALL_DIR "bin" CACHE STRING
> +-  "Path the tool executables are installed to." )
> +-
> + get_cmake_property(is_multi_config GENERATOR_IS_MULTI_CONFIG)
> +
> + IF (INJECT_DEBUG_POSTFIX AND (is_multi_config OR CMAKE_BUILD_TYPE
> STREQUAL "Debug"))
> +@@ -391,6 +378,29 @@ IF(HUNTER_ENABLED)
> +   )
> + ELSE(HUNTER_ENABLED)
> +   # cmake configuration files
> ++
> ++  IF( UNIX )
> ++    # Use GNUInstallDirs for Unix predefined directories
> ++    INCLUDE(GNUInstallDirs)
> ++
> ++    SET( ASSIMP_LIB_INSTALL_DIR ${CMAKE_INSTALL_LIBDIR})
> ++    SET( ASSIMP_INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_INCLUDEDIR})
> ++    SET( ASSIMP_BIN_INSTALL_DIR ${CMAKE_INSTALL_BINDIR})
> ++  ELSE( UNIX )
> ++    # Cache these to allow the user to override them on non-Unix
> platforms
> ++    SET( ASSIMP_LIB_INSTALL_DIR "lib" CACHE STRING
> ++      "Path the built library files are installed to." )
> ++    SET( ASSIMP_INCLUDE_INSTALL_DIR "include" CACHE STRING
> ++      "Path the header files are installed to." )
> ++    SET( ASSIMP_BIN_INSTALL_DIR "bin" CACHE STRING
> ++      "Path the tool executables are installed to." )
> ++
> ++    SET(CMAKE_INSTALL_FULL_INCLUDEDIR
> ${CMAKE_INSTALL_PREFIX}/${ASSIMP_INCLUDE_INSTALL_DIR})
> ++    SET(CMAKE_INSTALL_FULL_LIBDIR
> ${CMAKE_INSTALL_PREFIX}/${ASSIMP_LIB_INSTALL_DIR})
> ++    SET(CMAKE_INSTALL_FULL_BINDIR
> ${CMAKE_INSTALL_PREFIX}/${ASSIMP_BIN_INSTALL_DIR})
> ++  ENDIF( UNIX )
> ++
> ++
> +   CONFIGURE_FILE("${CMAKE_CURRENT_SOURCE_DIR}/assimp-config.cmake.in"
>        "${CMAKE_CURRENT_BINARY_DIR}/assimp-config.cmake" @ONLY IMMEDIATE)
> +   CONFIGURE_FILE("${CMAKE_CURRENT_SOURCE_DIR}/assimpTargets.cmake.in"
>        "${CMAKE_CURRENT_BINARY_DIR}/assimpTargets.cmake" @ONLY IMMEDIATE)
> +   IF (is_multi_config)
> +diff --git a/assimp.pc.in b/assimp.pc.in
> +index c659e19f2c..555a3a1d3b 100644
> +--- a/assimp.pc.in
> ++++ b/assimp.pc.in
> +@@ -1,7 +1,5 @@
> +-prefix=@CMAKE_INSTALL_PREFIX@
> +-exec_prefix=@CMAKE_INSTALL_PREFIX@/
> +-libdir=@CMAKE_INSTALL_PREFIX@/@ASSIMP_LIB_INSTALL_DIR@
> +-includedir=@CMAKE_INSTALL_PREFIX@
> /../include/@ASSIMP_INCLUDE_INSTALL_DIR@
> ++libdir=@CMAKE_INSTALL_FULL_LIBDIR@
> ++includedir=@CMAKE_INSTALL_FULL_INCLUDEDIR@
> +
> + Name: @CMAKE_PROJECT_NAME@
> + Description: Import various well-known 3D model formats in an uniform
> manner.
> +diff --git a/assimpTargets-debug.cmake.in b/assimpTargets-debug.cmake.in
> +index 1ebe2a6081..f5034c9349 100644
> +--- a/assimpTargets-debug.cmake.in
> ++++ b/assimpTargets-debug.cmake.in
> +@@ -42,22 +42,22 @@ if(MSVC)
> +     # Import target "assimp::assimp" for configuration "Debug"
> +     set_property(TARGET assimp::assimp APPEND PROPERTY
> IMPORTED_CONFIGURATIONS DEBUG)
> +     set_target_properties(assimp::assimp PROPERTIES
> +-      IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/${importLibraryName}"
> +-      IMPORTED_LOCATION_DEBUG
> "${_IMPORT_PREFIX}/bin/${sharedLibraryName}"
> ++      IMPORTED_IMPLIB_DEBUG "@CMAKE_INSTALL_FULL_LIBDIR@
> /${importLibraryName}"
> ++      IMPORTED_LOCATION_DEBUG "@CMAKE_INSTALL_FULL_BINDIR@
> /${sharedLibraryName}"
> +     )
> +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/lib/${importLibraryName}")
> +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/bin/${sharedLibraryName}" )
> ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_LIBDIR@/${importLibraryName}")
> ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_BINDIR@/${sharedLibraryName}" )
> +   else()
> +     set(staticLibraryName
> "assimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_DEBUG_POSTFIX
> @@CMAKE_STATIC_LIBRARY_SUFFIX@")
> +
> +     # Import target "assimp::assimp" for configuration "Debug"
> +     set_property(TARGET assimp::assimp APPEND PROPERTY
> IMPORTED_CONFIGURATIONS DEBUG)
> +     set_target_properties(assimp::assimp PROPERTIES
> +-      IMPORTED_LOCATION_DEBUG
> "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> ++      IMPORTED_LOCATION_DEBUG "@CMAKE_INSTALL_FULL_LIBDIR@
> /${staticLibraryName}"
> +     )
> +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/lib/${staticLibraryName}")
> ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}")
> +   endif()
> +
> + else()
> +@@ -66,17 +66,17 @@ else()
> +     set(sharedLibraryName
> "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_DEBUG_POSTFIX
> @@CMAKE_SHARED_LIBRARY_SUFFIX@.@ASSIMP_VERSION_MAJOR@")
> +     set_target_properties(assimp::assimp PROPERTIES
> +       IMPORTED_SONAME_DEBUG "${sharedLibraryName}"
> +-      IMPORTED_LOCATION_DEBUG
> "${_IMPORT_PREFIX}/lib/${sharedLibraryName}"
> ++      IMPORTED_LOCATION_DEBUG "@CMAKE_INSTALL_FULL_LIBDIR@
> /${sharedLibraryName}"
> +     )
> +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/lib/${sharedLibraryName}" )
> ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> +   else()
> +     set(staticLibraryName
> "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_DEBUG_POSTFIX
> @@CMAKE_STATIC_LIBRARY_SUFFIX@")
> +     set_target_properties(assimp::assimp PROPERTIES
> +-      IMPORTED_LOCATION_DEBUG
> "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> ++      IMPORTED_LOCATION_DEBUG "@CMAKE_INSTALL_FULL_LIBDIR@
> /${staticLibraryName}"
> +     )
> +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/lib/${staticLibraryName}" )
> ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}" )
> +   endif()
> + endif()
> +
> +diff --git a/assimpTargets-release.cmake.in b/
> assimpTargets-release.cmake.in
> +index f3db8f12cd..a416e8899b 100644
> +--- a/assimpTargets-release.cmake.in
> ++++ b/assimpTargets-release.cmake.in
> +@@ -42,12 +42,12 @@ if(MSVC)
> +     # Import target "assimp::assimp" for configuration "Release"
> +     set_property(TARGET assimp::assimp APPEND PROPERTY
> IMPORTED_CONFIGURATIONS RELEASE)
> +     set_target_properties(assimp::assimp PROPERTIES
> +-      IMPORTED_IMPLIB_RELEASE
> "${_IMPORT_PREFIX}/lib/${importLibraryName}"
> +-      IMPORTED_LOCATION_RELEASE
> "${_IMPORT_PREFIX}/bin/${sharedLibraryName}"
> ++      IMPORTED_IMPLIB_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@
> /${importLibraryName}"
> ++      IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_BINDIR@
> /${sharedLibraryName}"
> +     )
> +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/lib/${importLibraryName}")
> +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/bin/${sharedLibraryName}" )
> ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_LIBDIR@/${importLibraryName}")
> ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_BINDIR@/${sharedLibraryName}" )
> +   else()
> +     set(staticLibraryName
> "assimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> +
> +@@ -57,7 +57,7 @@ if(MSVC)
> +       IMPORTED_LOCATION_RELEASE
> "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> +     )
> +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/lib/${staticLibraryName}")
> ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}")
> +   endif()
> +
> + else()
> +@@ -70,17 +70,17 @@ else()
> +     endif()
> +     set_target_properties(assimp::assimp PROPERTIES
> +       IMPORTED_SONAME_RELEASE "${sharedLibraryName}"
> +-      IMPORTED_LOCATION_RELEASE
> "${_IMPORT_PREFIX}/lib/${sharedLibraryName}"
> ++      IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@
> /${sharedLibraryName}"
> +     )
> +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/lib/${sharedLibraryName}" )
> ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> +   else()
> +     set(staticLibraryName
> "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> +     set_target_properties(assimp::assimp PROPERTIES
> +-      IMPORTED_LOCATION_RELEASE
> "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> ++      IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@
> /${staticLibraryName}"
> +     )
> +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "${_IMPORT_PREFIX}/lib/${staticLibraryName}" )
> ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp
> "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}" )
> +   endif()
> + endif()
> +
> +@@ -91,8 +91,6 @@ get_filename_component(ASSIMP_ROOT_DIR
> "@CMAKE_INSTALL_PREFIX@" REALPATH)
> +
> + set( ASSIMP_CXX_FLAGS ) # dynamically linked library
> + set( ASSIMP_LINK_FLAGS "" )
> +-set( ASSIMP_LIBRARY_DIRS "${ASSIMP_ROOT_DIR}/@ASSIMP_LIB_INSTALL_DIR@")
> +-set( ASSIMP_INCLUDE_DIRS "${ASSIMP_ROOT_DIR}/@ASSIMP_INCLUDE_INSTALL_DIR@
> ")
> + if(ASSIMP_BUILD_SHARED_LIBS)
> +   set( ASSIMP_LIBRARIES ${sharedLibraryName})
> + else()
> +
> +diff --git a/assimpTargets.cmake.in b/assimpTargets.cmake.in
> +index ab1a8d2c7b..ef90c834a6 100644
> +--- a/assimpTargets.cmake.in
> ++++ b/assimpTargets.cmake.in
> +@@ -40,16 +40,6 @@ unset(_targetsDefined)
> + unset(_targetsNotDefined)
> + unset(_expectedTargets)
> +
> +-
> +-# Compute the installation prefix relative to this file.
> +-get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_FILE}" PATH)
> +-get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
> +-get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
> +-get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
> +-if(_IMPORT_PREFIX STREQUAL "/")
> +-  set(_IMPORT_PREFIX "")
> +-endif()
> +-
> + # Create imported target assimp::assimp
> + if(@BUILD_SHARED_LIBS@)
> +   add_library(assimp::assimp SHARED IMPORTED)
> +@@ -60,7 +50,7 @@ endif()
> + set_target_properties(assimp::assimp PROPERTIES
> +   COMPATIBLE_INTERFACE_STRING "assimp_MAJOR_VERSION"
> +   INTERFACE_assimp_MAJOR_VERSION "1"
> +-  INTERFACE_INCLUDE_DIRECTORIES
> "${_IMPORT_PREFIX}/include;${_IMPORT_PREFIX}/include"
> ++  #INTERFACE_INCLUDE_DIRECTORIES "@CMAKE_INSTALL_FULL_INCLUDEDIR@"
> +   #INTERFACE_LINK_LIBRARIES
> "TxtUtils::TxtUtils;MealyMachine::MealyMachine"
> + )
> +
> +@@ -75,9 +65,6 @@ foreach(f ${CONFIG_FILES})
> +   include(${f})
> + endforeach()
> +
> +-# Cleanup temporary variables.
> +-set(_IMPORT_PREFIX)
> +-
> + # Loop over all imported files and verify that they actually exist
> + foreach(target ${_IMPORT_CHECK_TARGETS} )
> +   foreach(file ${_IMPORT_CHECK_FILES_FOR_${target}} )
> +
> diff --git a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> index 4eb0cef..89c555f 100644
> --- a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> +++ b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> @@ -10,7 +10,8 @@ DEPENDS = "zlib"
>
>  SRC_URI = "git://github.com/assimp/assimp.git;branch=assimp_5.0_release \
>
> file://0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch \
> -           file://0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch
> \
> +           file://use-GNUInstallDirs-where-possible.patch \
> +
>  file://0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch \
>             "
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
>
> --
> 2.7.4
>
>
> 
>
>

--00000000000097cd3305ca4abddb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Looks like this commit breaks something in the cmake =
files.</div><div><br></div><div>When using assimp from another recipe (Qt3D=
), it will try to use the library from host path:</div><div><br></div><div>=
<div>/usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(69): =C2=A0set(s=
haredLibraryName libassimp.so.5 )<br>/usr/lib/cmake/assimp-5.0/assimpTarget=
s-release.cmake(71):
 =C2=A0set_target_properties(assimp::assimp PROPERTIES=20
IMPORTED_SONAME_RELEASE libassimp.so.5 IMPORTED_LOCATION_RELEASE=20
/usr/lib/libassimp.so.5 )<br></div><div><br></div>Whereas, before the patch=
, it was correctly using it from the sysroot:</div><div><br></div><div>/usr=
/lib/cmake/assimp-5.0/assimpTargets-release.cmake(69): =C2=A0set(sharedLibr=
aryName libassimp.so.5 )<br>/usr/lib/cmake/assimp-5.0/assimpTargets-release=
.cmake(71): =C2=A0set_target_properties(assimp::assimp PROPERTIES IMPORTED_=
SONAME_RELEASE libassimp.so.5 IMPORTED_LOCATION_RELEASE /home/qt/work/build=
/build/tmp/work/core2-32-poky-linux/qt3d/6.3.0-r0/recipe-sysroot/usr/lib/li=
bassimp.so.5 )<br>/usr/lib/cmake/assimp-5.0/assimpTargets-release.cmake(75)=
: =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )<br>/usr/lib/cmak=
e/assimp-5.0/assimpTargets-release.cmake(76): =C2=A0list(APPEND _IMPORT_CHE=
CK_FILES_FOR_assimp::assimp /home/qt/work/build/build/tmp/work/core2-32-pok=
y-linux/qt3d/6.3.0-r0/recipe-sysroot/usr/lib/libassimp.so.5 )<br><br></div>=
<div>Probably explains why the IMPORT_CHECK_TARGETS had to be removed.<br><=
/div><div><br></div><div><br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Fri, 20 Aug 2021 at 13:07, Purushotta=
m Choudhary &lt;<a href=3D"mailto:purushottamchoudhary29@gmail.com">purusho=
ttamchoudhary29@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">assimp CMake modules were adding non-existing path=
s to its CMake modules<br>
breaking builds for users of assimp. Remove the hardcoded paths with<br>
an upstream patch with small tweaks.<br>
<br>
Signed-off-by: Purushottam Choudhary &lt;<a href=3D"mailto:purushottamchoud=
hary29@gmail.com" target=3D"_blank">purushottamchoudhary29@gmail.com</a>&gt=
;<br>
---<br>
=C2=A0...-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch |=C2=A0 68 ------<=
br>
=C2=A0...ove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch |=C2=A0 32 +++<br>
=C2=A0.../assimp/use-GNUInstallDirs-where-possible.patch | 257 ++++++++++++=
+++++++++<br>
=C2=A0meta/recipes-graphics/vulkan/<a href=3D"http://assimp_5.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">assimp_5.0.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A03 +-<br>
=C2=A04 files changed, 291 insertions(+), 69 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIM=
P_LIB_INSTALL_DIR-to-search-library.patch<br>
=C2=A0create mode 100644 meta/recipes-graphics/vulkan/assimp/0001-assimp-re=
move-shared-lib-from-_IMPORT_CHECK_TARGETS.patch<br>
=C2=A0create mode 100644 meta/recipes-graphics/vulkan/assimp/use-GNUInstall=
Dirs-where-possible.patch<br>
<br>
diff --git a/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTAL=
L_DIR-to-search-library.patch b/meta/recipes-graphics/vulkan/assimp/0001-Us=
e-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch<br>
deleted file mode 100644<br>
index 34c5bfa..0000000<br>
--- a/meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-t=
o-search-library.patch<br>
+++ /dev/null<br>
@@ -1,68 +0,0 @@<br>
-From 58f576d6f240b08957a402960cdf06c74201ac7b Mon Sep 17 00:00:00 2001<br>
-From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D=
"_blank">hongxu.jia@windriver.com</a>&gt;<br>
-Date: Thu, 12 Dec 2019 22:16:15 -0800<br>
-Subject: [PATCH] Use ASSIMP_LIB_INSTALL_DIR to search library<br>
-<br>
-Use ASSIMP_LIB_INSTALL_DIR rather than hardcoded /lib to search library<br=
>
-<br>
-Upstream-Status: Inappropriate [oe specific]<br>
-<br>
-Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" =
target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
-<br>
----<br>
- <a href=3D"http://assimpTargets-release.cmake.in" rel=3D"noreferrer" targ=
et=3D"_blank">assimpTargets-release.cmake.in</a> | 16 ++++++++--------<br>
- 1 file changed, 8 insertions(+), 8 deletions(-)<br>
-<br>
-diff --git a/<a href=3D"http://assimpTargets-release.cmake.in" rel=3D"nore=
ferrer" target=3D"_blank">assimpTargets-release.cmake.in</a> b/<a href=3D"h=
ttp://assimpTargets-release.cmake.in" rel=3D"noreferrer" target=3D"_blank">=
assimpTargets-release.cmake.in</a><br>
-index f3db8f1..b8a066a 100644<br>
---- a/<a href=3D"http://assimpTargets-release.cmake.in" rel=3D"noreferrer"=
 target=3D"_blank">assimpTargets-release.cmake.in</a><br>
-+++ b/<a href=3D"http://assimpTargets-release.cmake.in" rel=3D"noreferrer"=
 target=3D"_blank">assimpTargets-release.cmake.in</a><br>
-@@ -42,11 +42,11 @@ if(MSVC)<br>
-=C2=A0 =C2=A0 =C2=A0# Import target &quot;assimp::assimp&quot; for configu=
ration &quot;Release&quot;<br>
-=C2=A0 =C2=A0 =C2=A0set_property(TARGET assimp::assimp APPEND PROPERTY IMP=
ORTED_CONFIGURATIONS RELEASE)<br>
-=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERTIES<br>
--=C2=A0 =C2=A0 =C2=A0 IMPORTED_IMPLIB_RELEASE &quot;${_IMPORT_PREFIX}/lib/=
${importLibraryName}&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 IMPORTED_IMPLIB_RELEASE &quot;${_IMPORT_PREFIX}/@ASS=
IMP_LIB_INSTALL_DIR@/${importLibraryName}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0IMPORTED_LOCATION_RELEASE &quot;${_IMPORT_PREFI=
X}/bin/${sharedLibraryName}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0)<br>
-=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )<br>
--=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;${=
_IMPORT_PREFIX}/lib/${importLibraryName}&quot;)<br>
-+=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;${=
_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${importLibraryName}&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &qu=
ot;${_IMPORT_PREFIX}/bin/${sharedLibraryName}&quot; )<br>
-=C2=A0 =C2=A0else()<br>
-=C2=A0 =C2=A0 =C2=A0set(staticLibraryName &quot;assimp${ASSIMP_LIBRARY_SUF=
FIX}@CMAKE_STATIC_LIBRARY_SUFFIX@&quot;)<br>
-@@ -54,10 +54,10 @@ if(MSVC)<br>
-=C2=A0 =C2=A0 =C2=A0# Import target &quot;assimp::assimp&quot; for configu=
ration &quot;Release&quot;<br>
-=C2=A0 =C2=A0 =C2=A0set_property(TARGET assimp::assimp APPEND PROPERTY IMP=
ORTED_CONFIGURATIONS RELEASE)<br>
-=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERTIES<br>
--=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot;${_IMPORT_PREFIX}/li=
b/${staticLibraryName}&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot;${_IMPORT_PREFIX}/@A=
SSIMP_LIB_INSTALL_DIR@/${staticLibraryName}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0)<br>
-=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )<br>
--=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;${=
_IMPORT_PREFIX}/lib/${staticLibraryName}&quot;)<br>
-+=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;${=
_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}&quot;)<br>
-=C2=A0 =C2=A0endif()<br>
- <br>
- else()<br>
-@@ -70,17 +70,17 @@ else()<br>
-=C2=A0 =C2=A0 =C2=A0endif()<br>
-=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERTIES<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0IMPORTED_SONAME_RELEASE &quot;${sharedLibraryNa=
me}&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot;${_IMPORT_PREFIX}/li=
b/${sharedLibraryName}&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot;${_IMPORT_PREFIX}/@A=
SSIMP_LIB_INSTALL_DIR@/${sharedLibraryName}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0)<br>
-=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )<br>
--=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;${=
_IMPORT_PREFIX}/lib/${sharedLibraryName}&quot; )<br>
-+=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;${=
_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${sharedLibraryName}&quot; )<br>
-=C2=A0 =C2=A0else()<br>
-=C2=A0 =C2=A0 =C2=A0set(staticLibraryName &quot;libassimp${ASSIMP_LIBRARY_=
SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERTIES<br>
--=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot;${_IMPORT_PREFIX}/li=
b/${staticLibraryName}&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot;${_IMPORT_PREFIX}/@A=
SSIMP_LIB_INSTALL_DIR@/${staticLibraryName}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0)<br>
-=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )<br>
--=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;${=
_IMPORT_PREFIX}/lib/${staticLibraryName}&quot; )<br>
-+=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;${=
_IMPORT_PREFIX}/@ASSIMP_LIB_INSTALL_DIR@/${staticLibraryName}&quot; )<br>
-=C2=A0 =C2=A0endif()<br>
- endif()<br>
- <br>
diff --git a/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-=
lib-from-_IMPORT_CHECK_TARGETS.patch b/meta/recipes-graphics/vulkan/assimp/=
0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch<br>
new file mode 100644<br>
index 0000000..1078148<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-fro=
m-_IMPORT_CHECK_TARGETS.patch<br>
@@ -0,0 +1,32 @@<br>
+From: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@kpit.com" =
target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
+Date: Fri, 13 Aug 2021 16:42:48 +0530<br>
+Subject: [PATCH] assimp: remove shared lib from _IMPORT_CHECK_TARGETS<br>
+<br>
+In the target assimp::assimp shared library verification removed<br>
+as it is giving configuration error when used by 3rd part component to<br>
+configure itself using assimp::assimp target<br>
+<br>
+Upstream-Status: Inappropriate [oe specific]<br>
+<br>
+Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@k=
pit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://assimpTargets-release.cmake.in" rel=3D"noreferrer" targ=
et=3D"_blank">assimpTargets-release.cmake.in</a> | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/<a href=3D"http://assimpTargets-release.cmake.in" rel=3D"nore=
ferrer" target=3D"_blank">assimpTargets-release.cmake.in</a> b/<a href=3D"h=
ttp://assimpTargets-release.cmake.in" rel=3D"noreferrer" target=3D"_blank">=
assimpTargets-release.cmake.in</a><br>
+index cd2fac7e0..52edc7990 100644<br>
+--- a/<a href=3D"http://assimpTargets-release.cmake.in" rel=3D"noreferrer"=
 target=3D"_blank">assimpTargets-release.cmake.in</a><br>
++++ b/<a href=3D"http://assimpTargets-release.cmake.in" rel=3D"noreferrer"=
 target=3D"_blank">assimpTargets-release.cmake.in</a><br>
+@@ -72,8 +72,8 @@ else()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0IMPORTED_SONAME_RELEASE &quot;${sharedLibraryNa=
me}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0IMPORTED_LOCATION_RELEASE &quot;@CMAKE_INSTALL_=
FULL_LIBDIR@/${sharedLibraryName}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0)<br>
+-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )<br>
+-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;@C=
MAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}&quot; )<br>
++=C2=A0 =C2=A0 #list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )<br>
++=C2=A0 =C2=A0 #list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;@=
CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}&quot; )<br>
+=C2=A0 =C2=A0else()<br>
+=C2=A0 =C2=A0 =C2=A0set(staticLibraryName &quot;libassimp${ASSIMP_LIBRARY_=
SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERTIES<br>
+--<br>
+2.17.1<br>
diff --git a/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-p=
ossible.patch b/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-wher=
e-possible.patch<br>
new file mode 100644<br>
index 0000000..e4f5b9c<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible=
.patch<br>
@@ -0,0 +1,257 @@<br>
+From cbf94fd62ff831879d10f99aa7766d391ae8a9b7 Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Victor=3D20Matar=3DC3=3DA9?=3D &lt;<a href=3D"mailto:mat=
are@fh-aachen.de" target=3D"_blank">matare@fh-aachen.de</a>&gt;<br>
+Date: Tue, 31 Mar 2020 21:30:07 +0200<br>
+Subject: [PATCH] use GNUInstallDirs where possible<br>
+<br>
+Emulate the CMAKE_INSTALL_FULL_* variables on non-Unix systems and<br>
+disable redefining FHS-mandated install locations via user-editable<br>
+ASSIMP_*_INSTALL_DIR variables. Instead, if it REALLY proves necessary,<br=
>
+Unix users can edit the advanced, canonical CMAKE_INSTALL_* variables.<br>
+---<br>
+ CMakeLists.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 36 ++++++++++++++++++++++------------<br>
+ <a href=3D"http://assimp.pc.in" rel=3D"noreferrer" target=3D"_blank">assi=
mp.pc.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 6 ++----<br>
+ <a href=3D"http://assimpTargets-debug.cmake.in" rel=3D"noreferrer" target=
=3D"_blank">assimpTargets-debug.cmake.in</a>=C2=A0 =C2=A0| 20 +++++++++----=
------<br>
+ <a href=3D"http://assimpTargets-release.cmake.in" rel=3D"noreferrer" targ=
et=3D"_blank">assimpTargets-release.cmake.in</a> | 18 ++++++++---------<br>
+ <a href=3D"http://assimpTargets.cmake.in" rel=3D"noreferrer" target=3D"_b=
lank">assimpTargets.cmake.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +---=
----------<br>
+ 5 files changed, 45 insertions(+), 50 deletions(-)<br>
+<br>
+Upstream-Status: Backport<br>
+Comment: Additionally remove setting of ASSIMP_LIBRARY_DIRS, ASSIMP_INCLUD=
E_DIRS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and INTERFACE_INCLUDE_DIRECTORIES as def=
ault cross compile paths are enough<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and setting them manually adds non-exist=
ing paths to CMake modules<br>
+<br>
+Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@k=
pit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
+<br>
+diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
+index dcafb649f5..c23c0df33e 100644<br>
+--- a/CMakeLists.txt<br>
++++ b/CMakeLists.txt<br>
+@@ -230,11 +230,6 @@ SET(LIBASSIMP-DEV_COMPONENT &quot;libassimp${ASSIMP_V=
ERSION_MAJOR}.${ASSIMP_VERSION_M<br>
+ SET(CPACK_COMPONENTS_ALL assimp-bin ${LIBASSIMP_COMPONENT} ${LIBASSIMP-DE=
V_COMPONENT} assimp-dev)<br>
+ SET(ASSIMP_LIBRARY_SUFFIX &quot;&quot; CACHE STRING &quot;Suffix to appen=
d to library names&quot;)<br>
+ <br>
+-IF( UNIX )<br>
+-=C2=A0 # Use GNUInstallDirs for Unix predefined directories<br>
+-=C2=A0 INCLUDE(GNUInstallDirs)<br>
+-ENDIF( UNIX )<br>
+-<br>
+ # Grouped compiler settings<br>
+ IF ((CMAKE_C_COMPILER_ID MATCHES &quot;GNU&quot;) AND NOT CMAKE_COMPILER_=
IS_MINGW)<br>
+=C2=A0 =C2=A0IF(NOT HUNTER_ENABLED)<br>
+@@ -329,14 +324,6 @@ IF ( CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR )<br>
+=C2=A0 =C2=A0SET( CMAKE_RUNTIME_OUTPUT_DIRECTORY &quot;${CMAKE_HOME_DIRECT=
ORY}/bin&quot; )<br>
+ ENDIF ( CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR )<br>
+ <br>
+-# Cache these to allow the user to override them manually.<br>
+-SET( ASSIMP_LIB_INSTALL_DIR &quot;lib&quot; CACHE STRING<br>
+-=C2=A0 &quot;Path the built library files are installed to.&quot; )<br>
+-SET( ASSIMP_INCLUDE_INSTALL_DIR &quot;include&quot; CACHE STRING<br>
+-=C2=A0 &quot;Path the header files are installed to.&quot; )<br>
+-SET( ASSIMP_BIN_INSTALL_DIR &quot;bin&quot; CACHE STRING<br>
+-=C2=A0 &quot;Path the tool executables are installed to.&quot; )<br>
+-<br>
+ get_cmake_property(is_multi_config GENERATOR_IS_MULTI_CONFIG)<br>
+ <br>
+ IF (INJECT_DEBUG_POSTFIX AND (is_multi_config OR CMAKE_BUILD_TYPE STREQUA=
L &quot;Debug&quot;))<br>
+@@ -391,6 +378,29 @@ IF(HUNTER_ENABLED)<br>
+=C2=A0 =C2=A0)<br>
+ ELSE(HUNTER_ENABLED)<br>
+=C2=A0 =C2=A0# cmake configuration files<br>
++<br>
++=C2=A0 IF( UNIX )<br>
++=C2=A0 =C2=A0 # Use GNUInstallDirs for Unix predefined directories<br>
++=C2=A0 =C2=A0 INCLUDE(GNUInstallDirs)<br>
++<br>
++=C2=A0 =C2=A0 SET( ASSIMP_LIB_INSTALL_DIR ${CMAKE_INSTALL_LIBDIR})<br>
++=C2=A0 =C2=A0 SET( ASSIMP_INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_INCLUDEDIR}=
)<br>
++=C2=A0 =C2=A0 SET( ASSIMP_BIN_INSTALL_DIR ${CMAKE_INSTALL_BINDIR})<br>
++=C2=A0 ELSE( UNIX )<br>
++=C2=A0 =C2=A0 # Cache these to allow the user to override them on non-Uni=
x platforms<br>
++=C2=A0 =C2=A0 SET( ASSIMP_LIB_INSTALL_DIR &quot;lib&quot; CACHE STRING<br=
>
++=C2=A0 =C2=A0 =C2=A0 &quot;Path the built library files are installed to.=
&quot; )<br>
++=C2=A0 =C2=A0 SET( ASSIMP_INCLUDE_INSTALL_DIR &quot;include&quot; CACHE S=
TRING<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;Path the header files are installed to.&quot; =
)<br>
++=C2=A0 =C2=A0 SET( ASSIMP_BIN_INSTALL_DIR &quot;bin&quot; CACHE STRING<br=
>
++=C2=A0 =C2=A0 =C2=A0 &quot;Path the tool executables are installed to.&qu=
ot; )<br>
++<br>
++=C2=A0 =C2=A0 SET(CMAKE_INSTALL_FULL_INCLUDEDIR ${CMAKE_INSTALL_PREFIX}/$=
{ASSIMP_INCLUDE_INSTALL_DIR})<br>
++=C2=A0 =C2=A0 SET(CMAKE_INSTALL_FULL_LIBDIR ${CMAKE_INSTALL_PREFIX}/${ASS=
IMP_LIB_INSTALL_DIR})<br>
++=C2=A0 =C2=A0 SET(CMAKE_INSTALL_FULL_BINDIR ${CMAKE_INSTALL_PREFIX}/${ASS=
IMP_BIN_INSTALL_DIR})<br>
++=C2=A0 ENDIF( UNIX )<br>
++<br>
++<br>
+=C2=A0 =C2=A0CONFIGURE_FILE(&quot;${CMAKE_CURRENT_SOURCE_DIR}/<a href=3D"h=
ttp://assimp-config.cmake.in" rel=3D"noreferrer" target=3D"_blank">assimp-c=
onfig.cmake.in</a>&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${CMAKE_CUR=
RENT_BINARY_DIR}/assimp-config.cmake&quot; @ONLY IMMEDIATE)<br>
+=C2=A0 =C2=A0CONFIGURE_FILE(&quot;${CMAKE_CURRENT_SOURCE_DIR}/<a href=3D"h=
ttp://assimpTargets.cmake.in" rel=3D"noreferrer" target=3D"_blank">assimpTa=
rgets.cmake.in</a>&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${CMAKE_CUR=
RENT_BINARY_DIR}/assimpTargets.cmake&quot; @ONLY IMMEDIATE)<br>
+=C2=A0 =C2=A0IF (is_multi_config)<br>
+diff --git a/<a href=3D"http://assimp.pc.in" rel=3D"noreferrer" target=3D"=
_blank">assimp.pc.in</a> b/<a href=3D"http://assimp.pc.in" rel=3D"noreferre=
r" target=3D"_blank">assimp.pc.in</a><br>
+index c659e19f2c..555a3a1d3b 100644<br>
+--- a/<a href=3D"http://assimp.pc.in" rel=3D"noreferrer" target=3D"_blank"=
>assimp.pc.in</a><br>
++++ b/<a href=3D"http://assimp.pc.in" rel=3D"noreferrer" target=3D"_blank"=
>assimp.pc.in</a><br>
+@@ -1,7 +1,5 @@<br>
+-prefix=3D@CMAKE_INSTALL_PREFIX@<br>
+-exec_prefix=3D@CMAKE_INSTALL_PREFIX@/<br>
+-libdir=3D@CMAKE_INSTALL_PREFIX@/@ASSIMP_LIB_INSTALL_DIR@<br>
+-includedir=3D@CMAKE_INSTALL_PREFIX@/../include/@ASSIMP_INCLUDE_INSTALL_DI=
R@<br>
++libdir=3D@CMAKE_INSTALL_FULL_LIBDIR@<br>
++includedir=3D@CMAKE_INSTALL_FULL_INCLUDEDIR@<br>
+ <br>
+ Name: @CMAKE_PROJECT_NAME@<br>
+ Description: Import various well-known 3D model formats in an uniform man=
ner.<br>
+diff --git a/<a href=3D"http://assimpTargets-debug.cmake.in" rel=3D"norefe=
rrer" target=3D"_blank">assimpTargets-debug.cmake.in</a> b/<a href=3D"http:=
//assimpTargets-debug.cmake.in" rel=3D"noreferrer" target=3D"_blank">assimp=
Targets-debug.cmake.in</a><br>
+index 1ebe2a6081..f5034c9349 100644<br>
+--- a/<a href=3D"http://assimpTargets-debug.cmake.in" rel=3D"noreferrer" t=
arget=3D"_blank">assimpTargets-debug.cmake.in</a><br>
++++ b/<a href=3D"http://assimpTargets-debug.cmake.in" rel=3D"noreferrer" t=
arget=3D"_blank">assimpTargets-debug.cmake.in</a><br>
+@@ -42,22 +42,22 @@ if(MSVC)<br>
+=C2=A0 =C2=A0 =C2=A0# Import target &quot;assimp::assimp&quot; for configu=
ration &quot;Debug&quot;<br>
+=C2=A0 =C2=A0 =C2=A0set_property(TARGET assimp::assimp APPEND PROPERTY IMP=
ORTED_CONFIGURATIONS DEBUG)<br>
+=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERTIES<br>
+-=C2=A0 =C2=A0 =C2=A0 IMPORTED_IMPLIB_DEBUG &quot;${_IMPORT_PREFIX}/lib/${=
importLibraryName}&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG &quot;${_IMPORT_PREFIX}/bin/=
${sharedLibraryName}&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 IMPORTED_IMPLIB_DEBUG &quot;@CMAKE_INSTALL_FULL_LIBD=
IR@/${importLibraryName}&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG &quot;@CMAKE_INSTALL_FULL_BI=
NDIR@/${sharedLibraryName}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0)<br>
+=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )<br>
+-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;${=
_IMPORT_PREFIX}/lib/${importLibraryName}&quot;)<br>
+-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;${=
_IMPORT_PREFIX}/bin/${sharedLibraryName}&quot; )<br>
++=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;@C=
MAKE_INSTALL_FULL_LIBDIR@/${importLibraryName}&quot;)<br>
++=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;@C=
MAKE_INSTALL_FULL_BINDIR@/${sharedLibraryName}&quot; )<br>
+=C2=A0 =C2=A0else()<br>
+=C2=A0 =C2=A0 =C2=A0set(staticLibraryName &quot;assimp${ASSIMP_LIBRARY_SUF=
FIX}@CMAKE_DEBUG_POSTFIX@@CMAKE_STATIC_LIBRARY_SUFFIX@&quot;)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0# Import target &quot;assimp::assimp&quot; for configu=
ration &quot;Debug&quot;<br>
+=C2=A0 =C2=A0 =C2=A0set_property(TARGET assimp::assimp APPEND PROPERTY IMP=
ORTED_CONFIGURATIONS DEBUG)<br>
+=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERTIES<br>
+-=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG &quot;${_IMPORT_PREFIX}/lib/=
${staticLibraryName}&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG &quot;@CMAKE_INSTALL_FULL_LI=
BDIR@/${staticLibraryName}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0)<br>
+=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )<br>
+-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;${=
_IMPORT_PREFIX}/lib/${staticLibraryName}&quot;)<br>
++=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;@C=
MAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}&quot;)<br>
+=C2=A0 =C2=A0endif()<br>
+ <br>
+ else()<br>
+@@ -66,17 +66,17 @@ else()<br>
+=C2=A0 =C2=A0 =C2=A0set(sharedLibraryName &quot;libassimp${ASSIMP_LIBRARY_=
SUFFIX}@CMAKE_DEBUG_POSTFIX@@CMAKE_SHARED_LIBRARY_SUFFIX@.@ASSIMP_VERSION_M=
AJOR@&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERTIES<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0IMPORTED_SONAME_DEBUG &quot;${sharedLibraryName=
}&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG &quot;${_IMPORT_PREFIX}/lib/=
${sharedLibraryName}&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG &quot;@CMAKE_INSTALL_FULL_LI=
BDIR@/${sharedLibraryName}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0)<br>
+=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )<br>
+-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;${=
_IMPORT_PREFIX}/lib/${sharedLibraryName}&quot; )<br>
++=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;@C=
MAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}&quot; )<br>
+=C2=A0 =C2=A0else()<br>
+=C2=A0 =C2=A0 =C2=A0set(staticLibraryName &quot;libassimp${ASSIMP_LIBRARY_=
SUFFIX}@CMAKE_DEBUG_POSTFIX@@CMAKE_STATIC_LIBRARY_SUFFIX@&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERTIES<br>
+-=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG &quot;${_IMPORT_PREFIX}/lib/=
${staticLibraryName}&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_DEBUG &quot;@CMAKE_INSTALL_FULL_LI=
BDIR@/${staticLibraryName}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0)<br>
+=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )<br>
+-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;${=
_IMPORT_PREFIX}/lib/${staticLibraryName}&quot; )<br>
++=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;@C=
MAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}&quot; )<br>
+=C2=A0 =C2=A0endif()<br>
+ endif()<br>
+ <br>
+diff --git a/<a href=3D"http://assimpTargets-release.cmake.in" rel=3D"nore=
ferrer" target=3D"_blank">assimpTargets-release.cmake.in</a> b/<a href=3D"h=
ttp://assimpTargets-release.cmake.in" rel=3D"noreferrer" target=3D"_blank">=
assimpTargets-release.cmake.in</a><br>
+index f3db8f12cd..a416e8899b 100644<br>
+--- a/<a href=3D"http://assimpTargets-release.cmake.in" rel=3D"noreferrer"=
 target=3D"_blank">assimpTargets-release.cmake.in</a><br>
++++ b/<a href=3D"http://assimpTargets-release.cmake.in" rel=3D"noreferrer"=
 target=3D"_blank">assimpTargets-release.cmake.in</a><br>
+@@ -42,12 +42,12 @@ if(MSVC)<br>
+=C2=A0 =C2=A0 =C2=A0# Import target &quot;assimp::assimp&quot; for configu=
ration &quot;Release&quot;<br>
+=C2=A0 =C2=A0 =C2=A0set_property(TARGET assimp::assimp APPEND PROPERTY IMP=
ORTED_CONFIGURATIONS RELEASE)<br>
+=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERTIES<br>
+-=C2=A0 =C2=A0 =C2=A0 IMPORTED_IMPLIB_RELEASE &quot;${_IMPORT_PREFIX}/lib/=
${importLibraryName}&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot;${_IMPORT_PREFIX}/bi=
n/${sharedLibraryName}&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 IMPORTED_IMPLIB_RELEASE &quot;@CMAKE_INSTALL_FULL_LI=
BDIR@/${importLibraryName}&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot;@CMAKE_INSTALL_FULL_=
BINDIR@/${sharedLibraryName}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0)<br>
+=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )<br>
+-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;${=
_IMPORT_PREFIX}/lib/${importLibraryName}&quot;)<br>
+-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;${=
_IMPORT_PREFIX}/bin/${sharedLibraryName}&quot; )<br>
++=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;@C=
MAKE_INSTALL_FULL_LIBDIR@/${importLibraryName}&quot;)<br>
++=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;@C=
MAKE_INSTALL_FULL_BINDIR@/${sharedLibraryName}&quot; )<br>
+=C2=A0 =C2=A0else()<br>
+=C2=A0 =C2=A0 =C2=A0set(staticLibraryName &quot;assimp${ASSIMP_LIBRARY_SUF=
FIX}@CMAKE_STATIC_LIBRARY_SUFFIX@&quot;)<br>
+ <br>
+@@ -57,7 +57,7 @@ if(MSVC)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0IMPORTED_LOCATION_RELEASE &quot;${_IMPORT_PREFI=
X}/lib/${staticLibraryName}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0)<br>
+=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )<br>
+-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;${=
_IMPORT_PREFIX}/lib/${staticLibraryName}&quot;)<br>
++=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;@C=
MAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}&quot;)<br>
+=C2=A0 =C2=A0endif()<br>
+ <br>
+ else()<br>
+@@ -70,17 +70,17 @@ else()<br>
+=C2=A0 =C2=A0 =C2=A0endif()<br>
+=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERTIES<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0IMPORTED_SONAME_RELEASE &quot;${sharedLibraryNa=
me}&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot;${_IMPORT_PREFIX}/li=
b/${sharedLibraryName}&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot;@CMAKE_INSTALL_FULL_=
LIBDIR@/${sharedLibraryName}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0)<br>
+=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )<br>
+-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;${=
_IMPORT_PREFIX}/lib/${sharedLibraryName}&quot; )<br>
++=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;@C=
MAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}&quot; )<br>
+=C2=A0 =C2=A0else()<br>
+=C2=A0 =C2=A0 =C2=A0set(staticLibraryName &quot;libassimp${ASSIMP_LIBRARY_=
SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0set_target_properties(assimp::assimp PROPERTIES<br>
+-=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot;${_IMPORT_PREFIX}/li=
b/${staticLibraryName}&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 IMPORTED_LOCATION_RELEASE &quot;@CMAKE_INSTALL_FULL_=
LIBDIR@/${staticLibraryName}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0)<br>
+=C2=A0 =C2=A0 =C2=A0list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )<br>
+-=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;${=
_IMPORT_PREFIX}/lib/${staticLibraryName}&quot; )<br>
++=C2=A0 =C2=A0 list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp &quot;@C=
MAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}&quot; )<br>
+=C2=A0 =C2=A0endif()<br>
+ endif()<br>
+<br>
+@@ -91,8 +91,6 @@ get_filename_component(ASSIMP_ROOT_DIR &quot;@CMAKE_INST=
ALL_PREFIX@&quot; REALPATH)<br>
+ <br>
+ set( ASSIMP_CXX_FLAGS ) # dynamically linked library<br>
+ set( ASSIMP_LINK_FLAGS &quot;&quot; )<br>
+-set( ASSIMP_LIBRARY_DIRS &quot;${ASSIMP_ROOT_DIR}/@ASSIMP_LIB_INSTALL_DIR=
@&quot;)<br>
+-set( ASSIMP_INCLUDE_DIRS &quot;${ASSIMP_ROOT_DIR}/@ASSIMP_INCLUDE_INSTALL=
_DIR@&quot;)<br>
+ if(ASSIMP_BUILD_SHARED_LIBS)<br>
+=C2=A0 =C2=A0set( ASSIMP_LIBRARIES ${sharedLibraryName})<br>
+ else()<br>
+ <br>
+diff --git a/<a href=3D"http://assimpTargets.cmake.in" rel=3D"noreferrer" =
target=3D"_blank">assimpTargets.cmake.in</a> b/<a href=3D"http://assimpTarg=
ets.cmake.in" rel=3D"noreferrer" target=3D"_blank">assimpTargets.cmake.in</=
a><br>
+index ab1a8d2c7b..ef90c834a6 100644<br>
+--- a/<a href=3D"http://assimpTargets.cmake.in" rel=3D"noreferrer" target=
=3D"_blank">assimpTargets.cmake.in</a><br>
++++ b/<a href=3D"http://assimpTargets.cmake.in" rel=3D"noreferrer" target=
=3D"_blank">assimpTargets.cmake.in</a><br>
+@@ -40,16 +40,6 @@ unset(_targetsDefined)<br>
+ unset(_targetsNotDefined)<br>
+ unset(_expectedTargets)<br>
+ <br>
+-<br>
+-# Compute the installation prefix relative to this file.<br>
+-get_filename_component(_IMPORT_PREFIX &quot;${CMAKE_CURRENT_LIST_FILE}&qu=
ot; PATH)<br>
+-get_filename_component(_IMPORT_PREFIX &quot;${_IMPORT_PREFIX}&quot; PATH)=
<br>
+-get_filename_component(_IMPORT_PREFIX &quot;${_IMPORT_PREFIX}&quot; PATH)=
<br>
+-get_filename_component(_IMPORT_PREFIX &quot;${_IMPORT_PREFIX}&quot; PATH)=
<br>
+-if(_IMPORT_PREFIX STREQUAL &quot;/&quot;)<br>
+-=C2=A0 set(_IMPORT_PREFIX &quot;&quot;)<br>
+-endif()<br>
+-<br>
+ # Create imported target assimp::assimp<br>
+ if(@BUILD_SHARED_LIBS@)<br>
+=C2=A0 =C2=A0add_library(assimp::assimp SHARED IMPORTED)<br>
+@@ -60,7 +50,7 @@ endif()<br>
+ set_target_properties(assimp::assimp PROPERTIES<br>
+=C2=A0 =C2=A0COMPATIBLE_INTERFACE_STRING &quot;assimp_MAJOR_VERSION&quot;<=
br>
+=C2=A0 =C2=A0INTERFACE_assimp_MAJOR_VERSION &quot;1&quot;<br>
+-=C2=A0 INTERFACE_INCLUDE_DIRECTORIES &quot;${_IMPORT_PREFIX}/include;${_I=
MPORT_PREFIX}/include&quot;<br>
++=C2=A0 #INTERFACE_INCLUDE_DIRECTORIES &quot;@CMAKE_INSTALL_FULL_INCLUDEDI=
R@&quot;<br>
+=C2=A0 =C2=A0#INTERFACE_LINK_LIBRARIES &quot;TxtUtils::TxtUtils;MealyMachi=
ne::MealyMachine&quot;<br>
+ )<br>
+ <br>
+@@ -75,9 +65,6 @@ foreach(f ${CONFIG_FILES})<br>
+=C2=A0 =C2=A0include(${f})<br>
+ endforeach()<br>
+ <br>
+-# Cleanup temporary variables.<br>
+-set(_IMPORT_PREFIX)<br>
+-<br>
+ # Loop over all imported files and verify that they actually exist<br>
+ foreach(target ${_IMPORT_CHECK_TARGETS} )<br>
+=C2=A0 =C2=A0foreach(file ${_IMPORT_CHECK_FILES_FOR_${target}} )<br>
+<br>
diff --git a/meta/recipes-graphics/vulkan/<a href=3D"http://assimp_5.0.1.bb=
" rel=3D"noreferrer" target=3D"_blank">assimp_5.0.1.bb</a> b/meta/recipes-g=
raphics/vulkan/<a href=3D"http://assimp_5.0.1.bb" rel=3D"noreferrer" target=
=3D"_blank">assimp_5.0.1.bb</a><br>
index 4eb0cef..89c555f 100644<br>
--- a/meta/recipes-graphics/vulkan/<a href=3D"http://assimp_5.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">assimp_5.0.1.bb</a><br>
+++ b/meta/recipes-graphics/vulkan/<a href=3D"http://assimp_5.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">assimp_5.0.1.bb</a><br>
@@ -10,7 +10,8 @@ DEPENDS =3D &quot;zlib&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/assimp/assimp.gi=
t;branch=3Dassimp_5.0_release" rel=3D"noreferrer" target=3D"_blank">github.=
com/assimp/assimp.git;branch=3Dassimp_5.0_release</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-closes-https-github.c=
om-assimp-assimp-issues-2733-up.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Use-ASSIMP_LIB_INSTAL=
L_DIR-to-search-library.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://use-GNUInstallDirs-where-p=
ossible.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-assimp-remove-shared-=
lib-from-_IMPORT_CHECK_TARGETS.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;(\d+(\.\d+)+))&q=
uot;<br>
<br>
-- <br>
2.7.4<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000097cd3305ca4abddb--
