Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.27183.1630958794144404319
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Sep 2021 13:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JSU5vNmH;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id bk29so7871167qkb.8
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Sep 2021 13:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v+wB7o5GfGMXtBvO2BIYnr3geMlpsQAEjwzRrljtmfc=;
        b=JSU5vNmHqvZ/LQBMDhf52AJT6bc3BKfLsk1mYM0g+V+pu8ZbBJsRUhClKkD4mTRte0
         oRiCNyb9WnFi8jzSZLOA9OnAZbCg5xwkVmf5f3zDsJJ1MJig/ImbXMDshgueF2NzJbM6
         +QmDZG7cGgZQ4ToCY5FwTSEkxh5r/OONqeg6XgP4ZEdLdkE0oVtYM48dgJHWJ5QZVlkH
         A0azfyxMjzqihejD7QkeouHWi5qqCWzi6gusZe0XjD09U5Akr+vG21WAgOotcBWhyoLg
         xFqzDmeF/bLmUU2GDaSA2WhFpSCujeUPbDwLR8t2glq6/0BZmVi2bjPy5SaNIMvHEyBx
         Wbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v+wB7o5GfGMXtBvO2BIYnr3geMlpsQAEjwzRrljtmfc=;
        b=MFEgACAmvYS+ENkmVi8C1/8cIKSMsCE1yZ0pJGxy149bwa9r1C0HmKPnLsM1gdx6wn
         9MVZROq8Nx4v9SIO0FbBR3P9XLb6gUy7ISfHxM5FKPsflUBR7daOCdPd0f6PEEQuaY0k
         rUUy7YsA0g/J3W+ELmGQ1GzE68UDw6SS7vMynRimMtPS/O8EBgTHdrB+r4gPWjk712LY
         ETEIFVCP1M6AYRorBSKt70vv2RyY6z6YEPPgZc/mnLMrCeDtOw+57Kx2r13Ribw9AkzR
         apqyEKO2MQuEeBIiwd0jnD8aDKmRio3gsb7Wlj08r+Xr2bd7Wmhq0qUwW/gkjF0Cishf
         t2lg==
X-Gm-Message-State: AOAM533kYg6GBDKaIA0IU7V5AynfqYLOwVI/IJeMcIENDLQeKf/eCv5E
	YpetqGlyeu+ybGKSrBSxf29T1+QximEW1h1ZMbY=
X-Google-Smtp-Source: ABdhPJw9jXR5mFlI0RtjV/WEsWWO/7oM3xCKWN2lNahBGWKunwcf9ZcfRFhw3LHYAXbfPi/O4XRAvzXv3P6yyng8qks=
X-Received: by 2002:a05:620a:248f:: with SMTP id i15mr12768096qkn.128.1630958793049;
 Mon, 06 Sep 2021 13:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210906125127.6603-1-purushottamchoudhary29@gmail.com>
In-Reply-To: <20210906125127.6603-1-purushottamchoudhary29@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 6 Sep 2021 13:06:06 -0700
Message-ID: <CAMKF1sqRTKv=8ukYEgwDrKFPb921L6awa-68tFCUqAEZ+H+tfg@mail.gmail.com>
Subject: Re: [OE-core] [poky][master][PATCH] assimp: Fix path for _IMPORT_CHECK_FILES_FOR_assimp
To: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Anuj Mittal <anuj.mittal@intel.com>, Mikko Rapeli <Mikko.Rapeli@bmw.de>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 6, 2021 at 5:51 AM Purushottam Choudhary
<purushottamchoudhary29@gmail.com> wrote:
>
> Fix path for _IMPORT_CHECK_FILES_FOR_assimp
> As it is giving configuration error during validation of path
> when used by 3rd party component to configure itself
> using assimp::assimp target.
> Compute the installation prefix relative to file.
>
> Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
> ---
>  ...h-for-_IMPORT_CHECK_FILES_FOR_assimp.patch | 93 +++++++++++++++++++
>  ...hared-lib-from-_IMPORT_CHECK_TARGETS.patch | 32 -------
>  meta/recipes-graphics/vulkan/assimp_5.0.1.bb  |  2 +-
>  3 files changed, 94 insertions(+), 33 deletions(-)
>  create mode 100644 meta/recipes-graphics/vulkan/assimp/0001-Fix-path-for-_IMPORT_CHECK_FILES_FOR_assimp.patch
>  delete mode 100644 meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
>
> diff --git a/meta/recipes-graphics/vulkan/assimp/0001-Fix-path-for-_IMPORT_CHECK_FILES_FOR_assimp.patch b/meta/recipes-graphics/vulkan/assimp/0001-Fix-path-for-_IMPORT_CHECK_FILES_FOR_assimp.patch
> new file mode 100644
> index 0000000000..11f1da6f3b
> --- /dev/null
> +++ b/meta/recipes-graphics/vulkan/assimp/0001-Fix-path-for-_IMPORT_CHECK_FILES_FOR_assimp.patch
> @@ -0,0 +1,93 @@
> +From 330914fed75cde09f48553cae92bed89925d98d8 Mon Sep 17 00:00:00 2001
> +From: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
> +Date: Mon, 6 Sep 2021 16:30:38 +0530
> +Subject: [PATCH] Fix path for _IMPORT_CHECK_FILES_FOR_assimp
> +
> +Fix path for _IMPORT_CHECK_FILES_FOR_assimp
> +As it is giving configuration error during validation of path
> +when used by 3rd party component to configure itself
> +using assimp::assimp target.
> +Compute the installation prefix relative to file.
> +
> +Upstream-Status: Inappropriate [oe specific]

Please submit this patch to upstream assimp as well, its not a small
change to maintain over time.
perhaps upstream can suggest a solution that can be applied upstream
as well if not this one.

> +
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +Signed-off-by: Purushottam Choudhary <purushottam.choudhary@kpit.com>
> +---
> + assimpTargets-release.cmake.in | 10 +++++-----
> + assimpTargets.cmake.in         | 12 ++++++++++++
> + 2 files changed, 17 insertions(+), 5 deletions(-)
> +
> +diff --git a/assimpTargets-release.cmake.in b/assimpTargets-release.cmake.in
> +index a416e8899..cd91e1277 100644
> +--- a/assimpTargets-release.cmake.in
> ++++ b/assimpTargets-release.cmake.in
> +@@ -46,8 +46,8 @@ if(MSVC)
> +       IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_BINDIR@/${sharedLibraryName}"
> +     )
> +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "@CMAKE_INSTALL_FULL_LIBDIR@/${importLibraryName}")
> +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "@CMAKE_INSTALL_FULL_BINDIR@/${sharedLibraryName}" )
> ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/lib/${importLibraryName}")
> ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/bin/${sharedLibraryName}")
> +   else()
> +     set(staticLibraryName "assimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> +
> +@@ -57,7 +57,7 @@ if(MSVC)
> +       IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> +     )
> +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}")
> ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/lib/${staticLibraryName}")
> +   endif()
> +
> + else()
> +@@ -73,14 +73,14 @@ else()
> +       IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}"
> +     )
> +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/lib/${sharedLibraryName}" )
> +   else()
> +     set(staticLibraryName "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> +     set_target_properties(assimp::assimp PROPERTIES
> +       IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}"
> +     )
> +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}" )
> ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/lib/${staticLibraryName}" )
> +   endif()
> + endif()
> +
> +diff --git a/assimpTargets.cmake.in b/assimpTargets.cmake.in
> +index ef90c834a..140386660 100644
> +--- a/assimpTargets.cmake.in
> ++++ b/assimpTargets.cmake.in
> +@@ -40,6 +40,15 @@ unset(_targetsDefined)
> + unset(_targetsNotDefined)
> + unset(_expectedTargets)
> +
> ++# Compute the installation prefix relative to this file.
> ++get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_FILE}" PATH)
> ++get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
> ++get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
> ++get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
> ++if(_IMPORT_PREFIX STREQUAL "/")
> ++  set(_IMPORT_PREFIX "")
> ++endif()
> ++
> + # Create imported target assimp::assimp
> + if(@BUILD_SHARED_LIBS@)
> +   add_library(assimp::assimp SHARED IMPORTED)
> +@@ -65,6 +74,9 @@ foreach(f ${CONFIG_FILES})
> +   include(${f})
> + endforeach()
> +
> ++# Cleanup temporary variables.
> ++set(_IMPORT_PREFIX)
> ++
> + # Loop over all imported files and verify that they actually exist
> + foreach(target ${_IMPORT_CHECK_TARGETS} )
> +   foreach(file ${_IMPORT_CHECK_FILES_FOR_${target}} )
> +--
> +2.17.1
> diff --git a/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch b/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
> deleted file mode 100644
> index 1078148d6b..0000000000
> --- a/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> -Date: Fri, 13 Aug 2021 16:42:48 +0530
> -Subject: [PATCH] assimp: remove shared lib from _IMPORT_CHECK_TARGETS
> -
> -In the target assimp::assimp shared library verification removed
> -as it is giving configuration error when used by 3rd part component to
> -configure itself using assimp::assimp target
> -
> -Upstream-Status: Inappropriate [oe specific]
> -
> -Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> ----
> - assimpTargets-release.cmake.in | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/assimpTargets-release.cmake.in b/assimpTargets-release.cmake.in
> -index cd2fac7e0..52edc7990 100644
> ---- a/assimpTargets-release.cmake.in
> -+++ b/assimpTargets-release.cmake.in
> -@@ -72,8 +72,8 @@ else()
> -       IMPORTED_SONAME_RELEASE "${sharedLibraryName}"
> -       IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}"
> -     )
> --    list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> -+    #list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> -+    #list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> -   else()
> -     set(staticLibraryName "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> -     set_target_properties(assimp::assimp PROPERTIES
> ---
> -2.17.1
> diff --git a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> index 89c555f08e..3a1f850f64 100644
> --- a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> +++ b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> @@ -11,7 +11,7 @@ DEPENDS = "zlib"
>  SRC_URI = "git://github.com/assimp/assimp.git;branch=assimp_5.0_release \
>             file://0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch \
>             file://use-GNUInstallDirs-where-possible.patch \
> -           file://0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch \
> +           file://0001-Fix-path-for-_IMPORT_CHECK_FILES_FOR_assimp.patch \
>             "
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
>
> --
> 2.17.1
>
>
> 
>
