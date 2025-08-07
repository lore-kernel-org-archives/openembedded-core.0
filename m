Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 497F0C87FD2
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 07:02:08 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.45194.1754550123292665501
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 00:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iSZzoMju;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-71a4742d81aso6622827b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 00:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754550122; x=1755154922; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJtwmm2yCWUur5p0MgcFpY3hiCY9QyYoRJc1gkymRw8=;
        b=iSZzoMjuVdoJiGfpqLx8v2HhlLkq4CFGytYIfmh/ovUb9crpaBh295gWInY2EgEKcJ
         We5Dkq/Oqc2wCy5UDubFmgetg6Ufj7k1BwqGoQ93d9FrweLFoqX4QBG/MBqb3ks6v5rz
         aUfcsqL9r2+oVFikUhDviih8Mzb/hcmCih0nKWon/wVHtXlJZfnnq/iEiYLBMAkrUFg3
         5C7p7FnlnKopwET81oiE+kr38W3GXwnqfcaZ+ZAjlh/3GCufDu4eo3O9pSZHPX599iB6
         cxx+y8bBnOq7I3gr1ttezzrtKIwbha7res42Q81TJUAnVRgah+daMjNSv1LmqCEbw7uu
         +3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754550122; x=1755154922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJtwmm2yCWUur5p0MgcFpY3hiCY9QyYoRJc1gkymRw8=;
        b=qA9kO5IfRtCZN5cp7NlBMtEThdsqUsk4uHXi8cw2EZQYQW6h1OgcMtplzc6uWbO4n/
         3kdnkVHLYlX6UEYFxSxhwPD01CmvPaN1u6NXrOQwPfe+VzvIaMNwjV5uhaar3nYyWHnS
         gXvB+LNvzWwhPlx8r6QWWGGsxkW3Kz+PDhNvmt918HUenHUxosrmKCfzLdvXg9pTeZIR
         1EmawFQSimce1f7BFljloE0UQK25pTSuaiMWFlBziRkUGbsGg7zQhjp9ZvwZtFe26Hx7
         3Ny6AFlF/zMW8wcNLkVgKphE0C29F0FYsE4nO433vgjK4aMyJvgeVEsPlNTkornWZXp6
         nwCw==
X-Gm-Message-State: AOJu0YwPXlz0r77wWOYEHMP/SOjJ49qN1RF30yp7nN2BUETyY6Yqu/fm
	gQMqm6xAyOv0d3XeHsR31irNvAV+2VLmLrauQK+y6pSU2RNfVoPe3DjO+QTFSjRPtaf4U3WM7tX
	CJ932aGFeeTSfEKQszZUOfyGmY/cU+9kCZiwbAnjq+A==
X-Gm-Gg: ASbGncsdJMCjd2Bn/vx0Vts7w61pqxUDPpUTQusPydKNjE3sBLo66mJOUAI8i19uS18
	fJAACs/KuaNIGkIxzx1KSwN3EWkdGD6SCIlcYDstqx8Nf30DLrxfD5EOplEzWmTWLHAsRwEdzb7
	ddB6RBPCYAOBPlmBmB2NOe/W5uGiVyrVVWFH7JaAev/BOgjhQhvWigcGZ8Zra1Gz3+eseK3as3N
	gly0g==
X-Google-Smtp-Source: AGHT+IEQ3D5h4zcadzwIP6N5KY3f8fLy4w4Z2/p8+brDXd3uPdta1KCpngQ9AeUohQ3WLmfwDi4ik0jGYe2AzXc5Wwk=
X-Received: by 2002:a05:690c:9c07:b0:70e:923:2173 with SMTP id
 00721157ae682-71bcc6c04a0mr58169797b3.5.1754550122212; Thu, 07 Aug 2025
 00:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250803073541.2210769-1-skandigraun@gmail.com>
In-Reply-To: <20250803073541.2210769-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Aug 2025 00:01:35 -0700
X-Gm-Features: Ac12FXyzKnXnFtZ4ySZuKmvtnGIgC52Yr2tKpnV1LKR5kzgncLb5BWNsD6Gma2s
Message-ID: <CAMKF1sr2zYyuzewOE+miSNdfpE2haU4iAbybpzmxRvXtX6pGbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: upgrade 2.48.2 -> 2.48.5
To: skandigraun@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 07:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221558

Not a blocking issue but Interestingly it fails build with
clang/qemuarm - https://errors.yoctoproject.org/Errors/Details/874909/

On Sun, Aug 3, 2025 at 12:35=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Changelog:
> 2.48.5:
> Fix several crashes.
>
> 2.48.4:
> Improve emoji font selection with USE_SKIA=3DON.
> Improve playback of multimedia streams from blob URLs.
> Fix the build with USE_SKIA_OPENTYPE_SVG=3DON and USE_SYSPROF_CAPTURE=3DO=
N.
> Fix the build on LoongArch with USE_SKIA=3DON.
> Fix crash when using a WebKitWebView widget in an offscreen window.
> Fix several crashes and rendering issues.
>
> 2.48.3:
> Fix a crash introduced by the new threaded rendering implementation using=
 Skia API.
> Improve rendering performance by recording layers once and replaying ever=
y dirty region in different worker threads.
> Fix a crash when setting WEBKIT_SKIA_GPU_PAINTING_THREADS=3D0.
> Fix a reference cycle in webkitmediastreamsrc preventing its disposal.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  ...1-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch | 2 +-
>  meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch        | 2 +-
>  .../webkit/{webkitgtk_2.48.2.bb =3D> webkitgtk_2.48.5.bb}         | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-sato/webkit/{webkitgtk_2.48.2.bb =3D> webkitgtk_2.48=
.5.bb} (98%)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable=
-to-control-macro-__PAS_ALWAYS_I.patch b/meta/recipes-sato/webkit/webkitgtk=
/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
> index 8376ee8472..f990384511 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-con=
trol-macro-__PAS_ALWAYS_I.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-con=
trol-macro-__PAS_ALWAYS_I.patch
> @@ -60,7 +60,7 @@ diff --git a/Source/cmake/WebKitCompilerFlags.cmake b/S=
ource/cmake/WebKitCompile
>  index f5ec0a55..dfd741e7 100644
>  --- a/Source/cmake/WebKitCompilerFlags.cmake
>  +++ b/Source/cmake/WebKitCompilerFlags.cmake
> -@@ -492,3 +492,10 @@ endif ()
> +@@ -503,3 +503,10 @@ endif ()
>
>   # FIXME: Enable pre-compiled headers for all ports <https://webkit.org/=
b/139438>
>   set(CMAKE_DISABLE_PRECOMPILE_HEADERS ON)
> diff --git a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch b/m=
eta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
> index 82d20758c2..4b0cf364d8 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
> @@ -24,7 +24,7 @@ diff --git a/Source/JavaScriptCore/llint/LowLevelInterp=
reter.cpp b/Source/JavaSc
>  index 76c46889..500be433 100644
>  --- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
>  +++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
> -@@ -334,8 +334,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void*=
 executableAddress, VM* vm,
> +@@ -336,8 +336,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void*=
 executableAddress, VM* vm,
>       UNUSED_VARIABLE(t2);
>       UNUSED_VARIABLE(t3);
>       UNUSED_VARIABLE(t5);
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.48.5.bb
> similarity index 98%
> rename from meta/recipes-sato/webkit/webkitgtk_2.48.2.bb
> rename to meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
> index 75a39558db..947996450d 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
> @@ -19,7 +19,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN}-=
${PV}.tar.xz \
>             file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-s=
how.patch \
>             file://fix-ftbfs-riscv64.patch \
>             "
> -SRC_URI[sha256sum] =3D "ec58f6dfc25d3b360388e192f865068d69aab09b4d7df021=
f90e314d2fa54f37"
> +SRC_URI[sha256sum] =3D "bb64ed9d1cfd58e8b5e89ccad71dd31adfed56336bad7695=
031ad0b668e1987c"
>
>  inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221406): https://lists.openembedded.org/g/openembedde=
d-core/message/221406
> Mute This Topic: https://lists.openembedded.org/mt/114511480/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

