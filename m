Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F1DCAC58E
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 05:24:34 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.25490.1757913866279876862
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 22:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cKJdxAhI;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-72ce9790ab3so25731087b3.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 22:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757913865; x=1758518665; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOrQyopBuptv3nMm/9dFIUueXUYt7jgOR5//XeHXleU=;
        b=cKJdxAhI679wJFzwCV8EGEIRFXHzCuH9t+cHyqz/qtLdeduySBLIwNc3tMHxebaGDc
         oXKnWaMiF3PrQ8EC68kYsQEdD9Yfx9uTeEDm7QViSPYMIpAlVR+Jhc3/3HT/x7GFZ+QL
         VBvds30Ih4m+nWk63Ij/HPHJ/5zi6Mm9BouNY3dM3coEPjgV6ZT9jkCyX/DQxSrNtL1t
         BzZxjO4NvGCPLlIgr3r1I8168ZReRSw2WOxyBLaTAkiRh3qIwZjJq2CgtL0UBmxmyRJD
         j0V+XBcVsrOlOcLykf/6baEg4MMDfGWWuzJEuLqErTp7f17CoVt4YUm0UyNqMQZY+USp
         17SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757913865; x=1758518665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOrQyopBuptv3nMm/9dFIUueXUYt7jgOR5//XeHXleU=;
        b=QO6D0Zn+om8tQ8Euk25D/pbZAF2bkrxLwn1Xun9U7NB8DNHx51+QUjy/H6WZH7uiiz
         wD8ZkgbmZ7cfAhq7ZQrpZ4yMQM2iivMRZ5G/2ERB574+oFpQiPSuqfMBtTdnr/t+7jnd
         JfblRVftyWs5ekzlwkRnEm54xlecwfthl/+dGzVXwGdZHOwpvcuvGqpmwgbZnhzEhgof
         b8ien07t4X89/w6tB++c7gMDf2e4gPzElve5cZpRMJW1HfCbxDs2YISgxvhFGtV/+PSP
         G4suN9PceMbOTbUJkFrVz7/c3tUFZivRGmdt9FlqoAC0F21fkFJMKNbmOqaQdcBBpfel
         OicA==
X-Gm-Message-State: AOJu0Yx0kEeWAYO5cqu3mnzr2uX1AGPCi0I1/y8w9KnqASlfaIzdLjUa
	EeePztvkDD7xt9l7JSJprsmSjNpwDobMEhB6PVHK1BqPA34RdcKCmGt1lv6MGUIyxBcm1qhMBFs
	jF8KD97dG8woPNMgxPGQPs+9YNOyEIGg=
X-Gm-Gg: ASbGncuCalj0A6QEw2YQaqXT9OMWWYPfkhreLc58jZesYuzNJ7/s0hIRpap2qx0UIfH
	aCsSnSKmt7yK+p+U12kyNSXOHvoSDCxTMEMrWWtDZtdr6XByqW00psyuXJOXbjNGR5CVpJXwpSX
	m2bS2XqolR3ORf2WayGPB0M7LydTgiLu4JVIo9eb5Too//vpH3xqqi6kMuzmIBhYBx0FYC8Mml3
	0Y0FPSig1D6Dq4WlGJ/5YuhV02+ivWWA+7Tu2IspaA7+8zDV/aCQxqG9J+5tchZhBbiOpIyXqKc
	Rg6zf79CsoA+I9iuxhqJzQAx5+CrpPolRBwT3iNsrmQV9o0B+3z5sw35NQ==
X-Google-Smtp-Source: AGHT+IGG2LmLKKm1APm2tcQISdMJR5zFVGd2IJbbFWMZvaU3J7WwWE37YXJP87QaIXc9HX+SouowrWQq9pyqBoSf7NE=
X-Received: by 2002:a05:690c:5505:10b0:733:2646:cc1a with SMTP id
 00721157ae682-7332646d926mr32897297b3.44.1757913865194; Sun, 14 Sep 2025
 22:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250914133258.2625735-1-ross.burton@arm.com>
In-Reply-To: <20250914133258.2625735-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Sep 2025 22:23:59 -0700
X-Gm-Features: Ac12FXxw9f1sMKuVfNJcS7ZdpPrtSjH_UBhjdgQ4vwq5Vm-VZC8AfPWHdFEQpno
Message-ID: <CAMKF1sonXyyzKUeSDeYjZXieBxmYsUNBaawDsk45QDmn-=JawA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/6] clang: improve opt-viewer PACKAGECONFIG
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 05:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223374

On Sun, Sep 14, 2025 at 6:33=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> Instead of patching the python module detection, we can use the hidden
> option LLVM_TOOL_OPT_VIEWER_BUILD.

How are these hidden options materialized ? it will be good to
describe that because there is no description of
LLVM_HAVE_OPT_VIEWER_BUILD
anywhere in llvm sources.

>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...-users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch | 70 -------------------
>  meta/recipes-devtools/clang/clang_git.bb      |  2 +-
>  meta/recipes-devtools/clang/common.inc        |  1 -
>  3 files changed, 1 insertion(+), 72 deletions(-)
>  delete mode 100644 meta/recipes-devtools/clang/clang/0041-opt-viewer-All=
ow-users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch
>
> diff --git a/meta/recipes-devtools/clang/clang/0041-opt-viewer-Allow-user=
s-to-set-LLVM_HAVE_OPT_VIEWER_M.patch b/meta/recipes-devtools/clang/clang/0=
041-opt-viewer-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_M.patch
> deleted file mode 100644
> index 4dc01f6e640..00000000000
> --- a/meta/recipes-devtools/clang/clang/0041-opt-viewer-Allow-users-to-se=
t-LLVM_HAVE_OPT_VIEWER_M.patch
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -From 93a51605fccf0f99868f8bae212a08823d01b03a Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 2 Aug 2025 17:58:20 -0700
> -Subject: [PATCH] [opt-viewer] Allow users to set LLVM_HAVE_OPT_VIEWER_MO=
DULES
> - manually from the CMake
> -
> -Check right before setting LLVM_HAVE_OPT_VIEWER_MODULES
> -so that if the user specifies the variable on the commandline
> -it takes precedence. If not, fall back to the old logic
> -
> -Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/15=
1845]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - llvm/CMakeLists.txt                     |  2 ++
> - llvm/cmake/config-ix.cmake              | 13 ++++++++++---
> - llvm/include/llvm/Config/config.h.cmake |  3 +++
> - 3 files changed, 15 insertions(+), 3 deletions(-)
> -
> -diff --git a/llvm/CMakeLists.txt b/llvm/CMakeLists.txt
> -index cb945b578e46..e4ed9eca6014 100644
> ---- a/llvm/CMakeLists.txt
> -+++ b/llvm/CMakeLists.txt
> -@@ -7,6 +7,8 @@ set(LLVM_COMMON_CMAKE_UTILS ${CMAKE_CURRENT_SOURCE_DIR}/=
../cmake)
> - include(${LLVM_COMMON_CMAKE_UTILS}/Modules/CMakePolicy.cmake
> -   NO_POLICY_SCOPE)
> -
> -+option(LLVM_HAVE_OPT_VIEWER_MODULES "Enable opt-viewer modules support"=
 ON)
> -+
> - # Builds with custom install names and installation rpath setups may no=
t work
> - # in the build tree. Allow these cases to use CMake's default build tre=
e
> - # behavior by setting `LLVM_NO_INSTALL_NAME_DIR_FOR_BUILD_TREE` to do t=
his.
> -diff --git a/llvm/cmake/config-ix.cmake b/llvm/cmake/config-ix.cmake
> -index a8e4e5a63244..17af3dc1e93f 100644
> ---- a/llvm/cmake/config-ix.cmake
> -+++ b/llvm/cmake/config-ix.cmake
> -@@ -805,10 +805,17 @@ foreach(module ${PYTHON_MODULES})
> -   find_python_module(${module})
> - endforeach()
> -
> --if(PY_PYGMENTS_FOUND AND PY_PYGMENTS_LEXERS_C_CPP_FOUND AND PY_YAML_FOU=
ND)
> --  set (LLVM_HAVE_OPT_VIEWER_MODULES 1)
> -+if(NOT DEFINED LLVM_HAVE_OPT_VIEWER_MODULES)
> -+  if(PY_PYGMENTS_FOUND AND PY_PYGMENTS_LEXERS_C_CPP_FOUND AND PY_YAML_F=
OUND)
> -+    set (LLVM_HAVE_OPT_VIEWER_MODULES 1)
> -+  else()
> -+    set (LLVM_HAVE_OPT_VIEWER_MODULES 0)
> -+  endif()
> -+elseif(LLVM_HAVE_OPT_VIEWER_MODULES)
> -+  # Use the user-provided value
> -+  set(LLVM_HAVE_OPT_VIEWER_MODULES 1)
> - else()
> --  set (LLVM_HAVE_OPT_VIEWER_MODULES 0)
> -+  set(LLVM_HAVE_OPT_VIEWER_MODULES 0)
> - endif()
> -
> - function(llvm_get_host_prefixes_and_suffixes)
> -diff --git a/llvm/include/llvm/Config/config.h.cmake b/llvm/include/llvm=
/Config/config.h.cmake
> -index ce83de8e4cba..02cf6d2ec363 100644
> ---- a/llvm/include/llvm/Config/config.h.cmake
> -+++ b/llvm/include/llvm/Config/config.h.cmake
> -@@ -287,6 +287,9 @@
> - /* Define to a function implementing strdup */
> - #cmakedefine strdup ${strdup}
> -
> -+/* Define indicating opt-viewer modules */
> -+#cmakedefine LLVM_HAVE_OPT_VIEWER_MODULES
> -+
> - /* Whether GlobalISel rule coverage is being collected */
> - #cmakedefine01 LLVM_GISEL_COV_ENABLED
> -
> diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
> index 0009a95628d..f53ecbfe398 100644
> --- a/meta/recipes-devtools/clang/clang_git.bb
> +++ b/meta/recipes-devtools/clang/clang_git.bb
> @@ -59,7 +59,7 @@ PACKAGECONFIG[libedit] =3D "-DLLVM_ENABLE_LIBEDIT=3DON,=
-DLLVM_ENABLE_LIBEDIT=3DOFF,lib
>  PACKAGECONFIG[libomp] =3D "-DCLANG_DEFAULT_OPENMP_RUNTIME=3Dlibomp,,"
>  PACKAGECONFIG[lld] =3D "-DCLANG_DEFAULT_LINKER=3Dlld,,,"
>  PACKAGECONFIG[lto] =3D "-DLLVM_ENABLE_LTO=3DFull -DLLVM_BINUTILS_INCDIR=
=3D${STAGING_INCDIR},,binutils,"
> -PACKAGECONFIG[opt-viewer] =3D "-DLLVM_HAVE_OPT_VIEWER_MODULES=3DON,-DLLV=
M_HAVE_OPT_VIEWER_MODULES=3DOFF, \
> +PACKAGECONFIG[opt-viewer] =3D "-DLLVM_TOOL_OPT_VIEWER_BUILD=3DON,-DLLVM_=
TOOL_OPT_VIEWER_BUILD=3DOFF, \
>                               python3-pyyaml-native python3-pygments-nati=
ve python3-pyyaml python3-pygments, \
>                               python3-pyyaml python3-pygments,"
>  PACKAGECONFIG[pfm] =3D "-DLLVM_ENABLE_LIBPFM=3DON,-DLLVM_ENABLE_LIBPFM=
=3DOFF,libpfm,"
> diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtoo=
ls/clang/common.inc
> index 889847c3e11..ac86284fb20 100644
> --- a/meta/recipes-devtools/clang/common.inc
> +++ b/meta/recipes-devtools/clang/common.inc
> @@ -61,7 +61,6 @@ SRC_URI =3D "\
>      file://0038-Revert-libc-Remap-headers-in-the-debug-info-when-bui.pat=
ch \
>      file://0039-Prevent-revisiting-block-when-searching-for-noreturn.pat=
ch \
>      file://0040-Only-build-c-index-test-when-clang-tests-are-include.pat=
ch \
> -    file://0041-opt-viewer-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_M.pat=
ch \
>  "
>  # Fallback to no-PIE if not set
>  GCCPIE ??=3D ""
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223351): https://lists.openembedded.org/g/openembedde=
d-core/message/223351
> Mute This Topic: https://lists.openembedded.org/mt/115236806/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

