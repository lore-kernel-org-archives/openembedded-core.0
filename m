Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC960C369C4
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 16:04:25 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.23377.1744819461808774479
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 09:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HoGALFUs;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-72bceb93f2fso498366a34.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 09:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744819461; x=1745424261; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lY5nwerggrIbnsArRtRRhrvUb1y3/uzC3CnLg0VaDFM=;
        b=HoGALFUsCOGx5nLzis9KtDk+EeW03g4zwKlj7rLXm2lOLYAGWWwiQQoXF8etfJ/Y5O
         zdaVVl06kGUSVLsfc2n5innQOGtmd2m+Q+BXm5EqY23yN+PA0LJbnr6Yzmv4KuvhTcaJ
         ooH5NTDCPUBmUmMRMKfF+FglCOlsvdVeOxnArtXVh7b4WlobEVFP9EMQrjybIXDVswLP
         yl35RNmQW4VwKY+9mGK7kZGaBgBqmgVI/Jrs6yw0nL2gUjn4VLX9l3VqnXnk1TI8QFkp
         VIvCpBMHUTpaUv+ga0reI4QMpTvtg5zFGFSkGTpbwmleuiKqjDWHiQfutJshzpG4UyEG
         Xa3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819461; x=1745424261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lY5nwerggrIbnsArRtRRhrvUb1y3/uzC3CnLg0VaDFM=;
        b=UfwWOPbqkre+BCc+SMtn94QyBgnVnWkStZnf41Mytz9uyA91si9RNiWRKkFJqkfvuv
         kOVehoSYgMyYvTdTLMHg/I7bbgfpLarlDwHnQxk/lKjsAaAqDtQKwcOKLyn7ueGXPx4E
         Rf8Bz/WLfCSq8T5urwpUeaNRH2ThGPo/wMn3eehJsLWtOHR2tW0NeLH5+TrZRudUjVmA
         sfTg236VR8NWcmI0bT8KXhvh60k4Le+jBy/lspgK0px+RLD3rMoMNijaYCV5l0EOweid
         07sP+/3b+j1ucH8hgcS2xqyBq7fx1vWA4X3bLm0AiTmPaFl9ex8Eps9KKSVeG5HgPkX5
         lJmw==
X-Gm-Message-State: AOJu0YyAh4kVyRsBvMednrT5K4Se/hL6+lKRwmF2iiASESuKXFi0gpW+
	G0TMN2/Lng9YWGWhlDWhhJScHOyIDO4UIhrxBAmJwzeGdtsTZv34DJwqPx5bc33zOS7j0cvedI2
	eSCXgjt/5M9vqnZ1vk8lXxaHYKlk=
X-Gm-Gg: ASbGncvSvStH9BVFSNI7aAu+jfpiKb2EonQwBGUNLJhHtDnZ5KcUBvYtuc8slV+Vq8c
	WepKTJSG3svZ6RPb9rqNwqBh4XpAwf8Hnmkd0WZczkRXmXKYU+2ho93KdsV/8iSV2hdtFGlwWlm
	Ft6omdImJIiecjRHbTqGOL
X-Google-Smtp-Source: AGHT+IHIIMivKDuLN1XJsw8YGBxt3woLnQmVfBIRfeAK9GAJls2NpigE/PPla5KzvN7yf43QnwuzabcuKjeuBvVXVVQ=
X-Received: by 2002:a05:6808:11cf:b0:3f9:e54c:bd98 with SMTP id
 5614622812f47-400b7ec46d4mr56085b6e.4.1744819460721; Wed, 16 Apr 2025
 09:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250416155929.2630778-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250416155929.2630778-1-dmitry.baryshkov@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Apr 2025 09:03:54 -0700
X-Gm-Features: ATxdqUGZikA9L566tr7D6uROuLNjFPvEUYdr5zQtYbH3cwLASMpKyKr4sxeuY50
Message-ID: <CAMKF1srC8E62aV5Vg6C2rhysmEvPcx1C1gQvRekWr2Fnmsv60Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] llvm: import build fix from meta-clang
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 16:04:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214998

On Wed, Apr 16, 2025 at 8:59=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Import a fix from meta-clang, which allows packages using LLVM to find
> tools from the native sysroot.
>

I am working on getting the clang merge into core. Perhaps it will be
good to do this along with that.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ...gure-for-packages-using-find_package.patch | 117 ++++++++++++++++++
>  meta/recipes-devtools/llvm/llvm_20.1.2.bb     |   1 +
>  2 files changed, 118 insertions(+)
>  create mode 100644 meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-config=
ure-for-packages-using-find_package.patch
>
> diff --git a/meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-for=
-packages-using-find_package.patch b/meta/recipes-devtools/llvm/llvm/0014-c=
make-Fix-configure-for-packages-using-find_package.patch
> new file mode 100644
> index 000000000000..94c056ab8e0a
> --- /dev/null
> +++ b/meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-for-packag=
es-using-find_package.patch
> @@ -0,0 +1,117 @@
> +From 93141cee493022d9f39dbd1f5f0bb0a1110ac829 Mon Sep 17 00:00:00 2001
> +From: Ovidiu Panait <ovidiu.panait@windriver.com>
> +Date: Fri, 31 Jan 2020 10:56:11 +0200
> +Subject: [PATCH] cmake: Fix configure for packages using find_package()
> +
> +Currently, when a package (i.e. bcc [https://github.com/iovisor/bcc.git]=
)
> +that depends on LLVM/Clang tries to run cmake find_package() during
> +do_configure, it will fail with a similar error:
> +
> +|   The imported target "llvm-tblgen" references the file
> +|      ".../recipe-sysroot/usr/bin/llvm-tblgen"
> +|
> +|   but this file does not exist.  Possible reasons include:
> +|   * The file was deleted, renamed, or moved to another location.
> +|   * An install or uninstall procedure did not complete successfully.
> +|   * The installation package was faulty and contained
> +|      ".../recipe-sysroot/usr/lib/cmake/LLVMExports.cmake"
> +|   but not all the files it references.
> +
> +This is due to the fact that currently the cmake scripts look for target
> +binaries in sysroot. Work around this by not exporting the target binari=
es in
> +Exports-* cmake files.
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> +---
> + clang/cmake/modules/AddClang.cmake | 2 --
> + llvm/cmake/modules/AddLLVM.cmake   | 9 ++-------
> + llvm/cmake/modules/TableGen.cmake  | 6 ------
> + 3 files changed, 2 insertions(+), 15 deletions(-)
> +
> +diff --git a/clang/cmake/modules/AddClang.cmake b/clang/cmake/modules/Ad=
dClang.cmake
> +index cdc8bd5cd503..5faa9117a30f 100644
> +--- a/clang/cmake/modules/AddClang.cmake
> ++++ b/clang/cmake/modules/AddClang.cmake
> +@@ -182,7 +182,6 @@ macro(add_clang_tool name)
> +     if (CLANG_BUILD_TOOLS)
> +       get_target_export_arg(${name} Clang export_to_clangtargets)
> +       install(TARGETS ${name}
> +-        ${export_to_clangtargets}
> +         RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
> +         COMPONENT ${name})
> +
> +@@ -191,7 +190,6 @@ macro(add_clang_tool name)
> +                                  DEPENDS ${name}
> +                                  COMPONENT ${name})
> +       endif()
> +-      set_property(GLOBAL APPEND PROPERTY CLANG_EXPORTS ${name})
> +     endif()
> +   endif()
> +   set_target_properties(${name} PROPERTIES XCODE_GENERATE_SCHEME ON)
> +diff --git a/llvm/cmake/modules/AddLLVM.cmake b/llvm/cmake/modules/AddLL=
VM.cmake
> +index d3e9377c8d2f..fe22d6f2b35a 100644
> +--- a/llvm/cmake/modules/AddLLVM.cmake
> ++++ b/llvm/cmake/modules/AddLLVM.cmake
> +@@ -1492,7 +1492,6 @@ macro(llvm_add_tool project name)
> +       if( LLVM_BUILD_TOOLS )
> +         get_target_export_arg(${name} ${project} export_to_llvmexports)
> +         install(TARGETS ${name}
> +-                ${export_to_llvmexports}
> +                 RUNTIME DESTINATION ${${project}_TOOLS_INSTALL_DIR}
> +                 COMPONENT ${name})
> +
> +@@ -1503,10 +1502,8 @@ macro(llvm_add_tool project name)
> +         endif()
> +       endif()
> +     endif()
> +-    if( LLVM_BUILD_TOOLS )
> +-      string(TOUPPER "${project}" project_upper)
> +-      set_property(GLOBAL APPEND PROPERTY ${project_upper}_EXPORTS ${na=
me})
> +-    endif()
> ++    string(TOUPPER "${project}" project_upper)
> ++    set_target_properties(${name} PROPERTIES FOLDER "Tools")
> +   endif()
> +   get_subproject_title(subproject_title)
> +   set_target_properties(${name} PROPERTIES FOLDER "${subproject_title}/=
Tools")
> +@@ -1556,7 +1553,6 @@ macro(add_llvm_utility name)
> +     if (LLVM_INSTALL_UTILS AND LLVM_BUILD_UTILS)
> +       get_target_export_arg(${name} LLVM export_to_llvmexports)
> +       install(TARGETS ${name}
> +-              ${export_to_llvmexports}
> +               RUNTIME DESTINATION ${LLVM_UTILS_INSTALL_DIR}
> +               COMPONENT ${name})
> +
> +@@ -1565,7 +1561,6 @@ macro(add_llvm_utility name)
> +                                  DEPENDS ${name}
> +                                  COMPONENT ${name})
> +       endif()
> +-      set_property(GLOBAL APPEND PROPERTY LLVM_EXPORTS ${name})
> +     elseif(LLVM_BUILD_UTILS)
> +       set_property(GLOBAL APPEND PROPERTY LLVM_EXPORTS_BUILDTREE_ONLY $=
{name})
> +     endif()
> +diff --git a/llvm/cmake/modules/TableGen.cmake b/llvm/cmake/modules/Tabl=
eGen.cmake
> +index ffcc718b4777..a76f28e74b86 100644
> +--- a/llvm/cmake/modules/TableGen.cmake
> ++++ b/llvm/cmake/modules/TableGen.cmake
> +@@ -232,12 +232,7 @@ macro(add_tablegen target project)
> +
> +   if (ADD_TABLEGEN_DESTINATION AND NOT LLVM_INSTALL_TOOLCHAIN_ONLY AND
> +       (LLVM_BUILD_UTILS OR ${target} IN_LIST LLVM_DISTRIBUTION_COMPONEN=
TS))
> +-    set(export_arg)
> +-    if(ADD_TABLEGEN_EXPORT)
> +-      get_target_export_arg(${target} ${ADD_TABLEGEN_EXPORT} export_arg=
)
> +-    endif()
> +     install(TARGETS ${target}
> +-            ${export_arg}
> +             COMPONENT ${target}
> +             RUNTIME DESTINATION "${ADD_TABLEGEN_DESTINATION}")
> +     if(NOT LLVM_ENABLE_IDE)
> +@@ -248,6 +243,5 @@ macro(add_tablegen target project)
> +   endif()
> +   if(ADD_TABLEGEN_EXPORT)
> +     string(TOUPPER ${ADD_TABLEGEN_EXPORT} export_upper)
> +-    set_property(GLOBAL APPEND PROPERTY ${export_upper}_EXPORTS ${targe=
t})
> +   endif()
> + endmacro()
> diff --git a/meta/recipes-devtools/llvm/llvm_20.1.2.bb b/meta/recipes-dev=
tools/llvm/llvm_20.1.2.bb
> index b51ab703a136..4b24d28364cd 100644
> --- a/meta/recipes-devtools/llvm/llvm_20.1.2.bb
> +++ b/meta/recipes-devtools/llvm/llvm_20.1.2.bb
> @@ -39,6 +39,7 @@ SRC_URI_SPIRV:append:class-native =3D " \
>  SRC_URI =3D "https://github.com/llvm/llvm-project/releases/download/llvm=
org-${PV}/llvm-project-${PV}.src.tar.xz \
>             file://0007-llvm-allow-env-override-of-exe-path.patch \
>             file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as=
-we.patch \
> +           file://0014-cmake-Fix-configure-for-packages-using-find_packa=
ge.patch \
>             ${@bb.utils.contains('PACKAGECONFIG', 'spirv-llvm-translator'=
, '${SRC_URI_SPIRV}', '', d)} \
>             file://llvm-config \
>             "
> --
> 2.39.5
>

