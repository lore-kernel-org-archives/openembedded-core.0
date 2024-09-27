Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69C8CDD1B0
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 13:29:34 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.68881.1727443769729486050
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 06:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2TAhdukg;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.172, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso1955585276.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 06:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727443769; x=1728048569; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCHaGxN6E/lmZ337SHp9HzwkkKzGWDehjy9dUi4ZelM=;
        b=2TAhdukgDnvOoqGaoi7kAW5s9vjaw6zRgpsCdgcsZ2xBE15v+kSxaswzjtvhQhgTLz
         4XVrByvwmWnpjM59QIPlq8OJ5vbt63SneEN6/ESrBOcbFHPhx2PtRq+QZnimTFrt8A9s
         U45CKJ4eM0Z9nckudGs0/7c/UxcMexvhLcHyD1NcTpXotThiXSwbt0k5NoTXJnN1FZQ8
         2BEczXRjgEVvHam5IuPK2O69U/6X5YSdvTgrkDdmPeOszB8jTWmDUrfGg2QvtAK0/KPL
         i1kYJlUsyISbPXGkDDdUKe7D0mthvz3y44g4ZeyP/BgqIJf09np6Cug6dFVn9t1CtmGj
         CBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727443769; x=1728048569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCHaGxN6E/lmZ337SHp9HzwkkKzGWDehjy9dUi4ZelM=;
        b=tI7hCyIyLkMT4ZxN9oKagyUkSNjH++G0g7T7bcOGQtic8nMYiLj/yMIfW6JZQ53i4F
         6PzqVjPue5ZvoX48Qm8X776JlNqUVK//q9B5dtsPpggpb4LBFreUVmLC+913WrBsHu/h
         W+U4iy3/PThblbbm9Ng2UktHNu7+3EMagInTbuk7rJ/Z8N1hqDAr7HktEKiBNXN9HUTK
         +H3v9zvEB6DG1aJvE3caK2JzVWpmMAbDhwJRhh1Nj7hzFCGEt9F/OiuAyC8/XSWOtBsw
         Gb3vEqogSUAGSKF3d+qrAfwVcqe1hV2ObpSEUTIsc0Edeu1RDIfbOz0f9PS4Ru76KQGN
         YYng==
X-Gm-Message-State: AOJu0Yy9fVJ/korW66cr5xdyRj7/TG5lWt4gO2WNVbMPvAV/SMHzE81T
	qnrv0SDTUbsfzi2DB1kYRYc31zF4L+1vKQsIgfwfhCbZztpCH7oEvSyzjhjAspSrn3NRrSuqR4b
	gPxnRmfCI6cEX2VI7zuuXsbbl1Bt+fYQ7UG/KDQ==
X-Google-Smtp-Source: AGHT+IHKrVrR3Aa7PxxDHRuTHZVvbvG1ck3Ob8pC7xHUgxgLiMA000Wz+nbKy0YKhA/toi1wCHAmFSDbQ3FwDiUfDvU=
X-Received: by 2002:a25:ac48:0:b0:e26:b55:69 with SMTP id 3f1490d57ef6-e260b5501dbmr480125276.23.1727443768755;
 Fri, 27 Sep 2024 06:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240927071256.46145-1-hprajapati@mvista.com>
In-Reply-To: <20240927071256.46145-1-hprajapati@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 27 Sep 2024 06:29:17 -0700
Message-ID: <CAOSpxdbeWv3iJoVLTyCiQUvyXxoJDv7VSLuSJzJ_jKP73drF9g@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCHv3] webkitgtk: upgrade 2.44.1 -> 2.44.3
To: hprajapati@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 13:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205024

On Fri, Sep 27, 2024 at 12:13=E2=80=AFAM Hitendra Prajapati via
lists.openembedded.org <hprajapati=3Dmvista.com@lists.openembedded.org>
wrote:
>
> Remove below patches which already fix in this upgraded version.
>
> 1. CVE-2024-40779.patch

Since the patch that adds this cve fix is still under review, it
doesn't make sense to add the fix and then remove it in the version
bump!

I'll drop the CVE-2024-40779 fix patch:
https://lists.openembedded.org/g/openembedded-core/message/204836

Please send a v4 for this version bump that takes this into consideration.

Thanks!

Steve

> 2. 0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  ...able-to-control-macro-__PAS_ALWAYS_I.patch |  6 +-
>  ...spection.cmake-prefix-variables-obta.patch |  2 +-
>  ...fic-declarations-in-FELighting.h-unn.patch | 44 ---------
>  ...d5e22213fdaca2a29ec3400c927d710a37a8.patch |  2 +-
>  .../webkit/webkitgtk/CVE-2024-40779.patch     | 92 -------------------
>  .../webkit/webkitgtk/no-musttail-arm.patch    |  6 +-
>  .../webkit/webkitgtk/reproducibility.patch    |  2 +-
>  .../webkit/webkitgtk/t6-not-declared.patch    | 12 +--
>  ...ebkitgtk_2.44.1.bb =3D> webkitgtk_2.44.3.bb} |  7 +-
>  9 files changed, 16 insertions(+), 157 deletions(-)
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Remove-ARM-sp=
ecific-declarations-in-FELighting.h-unn.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2024-40779.pat=
ch
>  rename meta/recipes-sato/webkit/{webkitgtk_2.44.1.bb =3D> webkitgtk_2.44=
.3.bb} (95%)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable=
-to-control-macro-__PAS_ALWAYS_I.patch b/meta/recipes-sato/webkit/webkitgtk=
/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
> index a819e22127..a19008a41f 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-con=
trol-macro-__PAS_ALWAYS_I.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-con=
trol-macro-__PAS_ALWAYS_I.patch
> @@ -1,4 +1,4 @@
> -From 575b848a3b3c14280679db80d0d518922c83d62a Mon Sep 17 00:00:00 2001
> +From 99a21305ae683a216e9299e5dbdd763190a8cfe3 Mon Sep 17 00:00:00 2001
>  From: Kai Kang <kai.kang@windriver.com>
>  Date: Fri, 11 Aug 2023 14:20:48 +0800
>  Subject: [PATCH] Add a variable to control macro
> @@ -57,10 +57,10 @@ index 5d5fb38c..a554f700 100644
>   #else
>   #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
>  diff --git a/Source/cmake/WebKitCompilerFlags.cmake b/Source/cmake/WebKi=
tCompilerFlags.cmake
> -index 9b2fecf9..7cdc2b6a 100644
> +index 0732785e..4879ec40 100644
>  --- a/Source/cmake/WebKitCompilerFlags.cmake
>  +++ b/Source/cmake/WebKitCompilerFlags.cmake
> -@@ -453,3 +453,10 @@ endif ()
> +@@ -452,3 +452,10 @@ endif ()
>
>   # FIXME: Enable pre-compiled headers for all ports <https://webkit.org/=
b/139438>
>   set(CMAKE_DISABLE_PRECOMPILE_HEADERS ON)
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospec=
tion.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk=
/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
> index 8e29ce17ed..dda20a7b25 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cm=
ake-prefix-variables-obta.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cm=
ake-prefix-variables-obta.patch
> @@ -1,4 +1,4 @@
> -From 6348f91c29e2350ad3fec5264aa57dd4994d4583 Mon Sep 17 00:00:00 2001
> +From d1f6a1b6a1298f6ef2f1677e9996aa60a002134a Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Tue, 27 Oct 2015 16:02:19 +0200
>  Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtain=
ed
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Remove-ARM-specific-=
declarations-in-FELighting.h-unn.patch b/meta/recipes-sato/webkit/webkitgtk=
/0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch
> deleted file mode 100644
> index 6ffe0a9454..0000000000
> --- a/meta/recipes-sato/webkit/webkitgtk/0001-Remove-ARM-specific-declara=
tions-in-FELighting.h-unn.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From dbd1a59b239b3902e717fdeb063883dbb0b06ee9 Mon Sep 17 00:00:00 2001
> -From: Adrian Perez de Castro <aperez@igalia.com>
> -Date: Sun, 26 May 2024 14:24:35 -0700
> -Subject: [PATCH 1/2] Remove ARM-specific declarations in FELighting.h un=
needed
> - after 272873@main
> -
> -Unreviewed build fix.
> -
> -* Source/WebCore/platform/graphics/filters/FELighting.h: Remove unneeded
> -  declarations for the getPowerCoefficients() and platformApplyNeon()
> -  functions, which are now defined elsewhere; and were causing a build
> -  failure due to usage of the protected LightingData type.
> -
> -Canonical link: https://commits.webkit.org/279334@main
> -
> -Backport this patch for fixing following compile error:
> -webkitgtk-2.44.1/Source/WebCore/platform/graphics/filters/FELighting.h:7=
3:41: error: 'LightingData' does not name a type
> -   73 |     inline void platformApplyNeon(const LightingData&, const Lig=
htSource::PaintingData&);
> -
> -Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/36d1b=
5d7c0ef9a733ee8055b1f35b1d24435d538]
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - Source/WebCore/platform/graphics/filters/FELighting.h | 5 -----
> - 1 file changed, 5 deletions(-)
> -
> -diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Sou=
rce/WebCore/platform/graphics/filters/FELighting.h
> -index 4efab920..dcd80b6f 100644
> ---- a/Source/WebCore/platform/graphics/filters/FELighting.h
> -+++ b/Source/WebCore/platform/graphics/filters/FELighting.h
> -@@ -68,11 +68,6 @@ protected:
> -
> -     std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const =
override;
> -
> --#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
> --    static int getPowerCoefficients(float exponent);
> --    inline void platformApplyNeon(const LightingData&, const LightSourc=
e::PaintingData&);
> --#endif
> --
> -     Color m_lightingColor;
> -     float m_surfaceScale;
> -     float m_diffuseConstant;
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec34=
00c927d710a37a8.patch b/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdac=
a2a29ec3400c927d710a37a8.patch
> index 76bcb3df99..0d8976c502 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec3400c927d=
710a37a8.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec3400c927d=
710a37a8.patch
> @@ -1,4 +1,4 @@
> -From 1523e00a2a76e285262c8aa3721b5d99f3f2d612 Mon Sep 17 00:00:00 2001
> +From 2ee948191de1c561b72ebf462605376cfb3ce7af Mon Sep 17 00:00:00 2001
>  From: Thomas Devoogdt <thomas.devoogdt@barco.com>
>  Date: Mon, 16 Jan 2023 17:03:30 +0100
>  Subject: [PATCH] REGRESSION(257865@main): B3Validate.cpp: fix
> diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2024-40779.patch b/me=
ta/recipes-sato/webkit/webkitgtk/CVE-2024-40779.patch
> deleted file mode 100644
> index 1a7e27dcb6..0000000000
> --- a/meta/recipes-sato/webkit/webkitgtk/CVE-2024-40779.patch
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -From 2fe5ae29a5f6434ef456afe9673a4f400ec63848 Mon Sep 17 00:00:00 2001
> -From: Jean-Yves Avenard <jya@apple.com>
> -Date: Fri, 14 Jun 2024 16:08:19 -0700
> -Subject: [PATCH] Cherry-pick 272448.1085@safari-7618.3.10-branch
> - (ff52ff7cb64e). https://bugs.webkit.org/show_bug.cgi?id=3D275431
> -
> -HeapBufferOverflow in computeSampleUsingLinearInterpolation
> -https://bugs.webkit.org/show_bug.cgi?id=3D275431
> -rdar://125617812
> -
> -Reviewed by Youenn Fablet.
> -
> -Add boundary check.
> -This is a copy of blink code for that same function.
> -https://source.chromium.org/chromium/chromium/src//main:third_party/blin=
k/renderer/modules/webaudio/audio_buffer_source_handler.cc;l=3D336-341
> -
> -* LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-crash-=
expected.txt: Added.
> -* LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-crash.=
html: Added.
> -* Source/WebCore/Modules/webaudio/AudioBufferSourceNode.cpp:
> -(WebCore::AudioBufferSourceNode::renderFromBuffer):
> -
> -Canonical link: https://commits.webkit.org/274313.347@webkitglib/2.44
> -
> -Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/2fe5a=
e29a5f6434ef456afe9673a4f400ec63848]
> -CVE: CVE-2024-40779
> -Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ----
> - ...er-sourcenode-resampler-crash-expected.txt |  1 +
> - ...udiobuffer-sourcenode-resampler-crash.html | 25 +++++++++++++++++++
> - .../webaudio/AudioBufferSourceNode.cpp        |  6 +++++
> - 3 files changed, 32 insertions(+)
> - create mode 100644 LayoutTests/webaudio/crashtest/audiobuffer-sourcenod=
e-resampler-crash-expected.txt
> - create mode 100644 LayoutTests/webaudio/crashtest/audiobuffer-sourcenod=
e-resampler-crash.html
> -
> -diff --git a/LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resam=
pler-crash-expected.txt b/LayoutTests/webaudio/crashtest/audiobuffer-source=
node-resampler-crash-expected.txt
> -new file mode 100644
> -index 00000000..654ddf7f
> ---- /dev/null
> -+++ b/LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-cr=
ash-expected.txt
> -@@ -0,0 +1 @@
> -+This test passes if it does not crash.
> -diff --git a/LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resam=
pler-crash.html b/LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-res=
ampler-crash.html
> -new file mode 100644
> -index 00000000..5fb2dd8c
> ---- /dev/null
> -+++ b/LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-cr=
ash.html
> -@@ -0,0 +1,25 @@
> -+<html>
> -+<head>
> -+    <script>
> -+        async function main() {
> -+            var ctx =3D new AudioContext();
> -+            var src =3D new AudioBufferSourceNode(ctx);
> -+            src.buffer =3D ctx.createBuffer(1, 8192, 44100);
> -+            src.start(undefined, 0.5);
> -+            src.playbackRate.value =3D -1;
> -+            src.connect(ctx.destination, 0, 0);
> -+            if (window.testRunner)
> -+                testRunner.notifyDone();
> -+        }
> -+    </script>
> -+</head>
> -+<body onload=3D"main()">
> -+    <p>This test passes if it does not crash.</p>
> -+    <script>
> -+    if (window.testRunner) {
> -+        testRunner.waitUntilDone();
> -+        testRunner.dumpAsText();
> -+    }
> -+    </script>
> -+</body>
> -+</html>
> -diff --git a/Source/WebCore/Modules/webaudio/AudioBufferSourceNode.cpp b=
/Source/WebCore/Modules/webaudio/AudioBufferSourceNode.cpp
> -index 42f2779e..7963fb9f 100644
> ---- a/Source/WebCore/Modules/webaudio/AudioBufferSourceNode.cpp
> -+++ b/Source/WebCore/Modules/webaudio/AudioBufferSourceNode.cpp
> -@@ -343,6 +343,12 @@ bool AudioBufferSourceNode::renderFromBuffer(AudioB=
us* bus, unsigned destination
> -             if (readIndex2 >=3D maxFrame)
> -                 readIndex2 =3D m_isLooping ? minFrame : readIndex;
> -
> -+            // Final sanity check on buffer access.
> -+            // FIXME: as an optimization, try to get rid of this inner-=
loop check and
> -+            // put assertions and guards before the loop.
> -+            if (readIndex >=3D bufferLength || readIndex2 >=3D bufferLe=
ngth)
> -+                break;
> -+
> -             // Linear interpolation.
> -             for (unsigned i =3D 0; i < numberOfChannels; ++i) {
> -                 float* destination =3D destinationChannels[i];
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch b/m=
eta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
> index 8ce37a01cc..793be48df2 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
> @@ -1,4 +1,4 @@
> -From a9c874f7418cefbe78f7cd26505ae495cb59bbcf Mon Sep 17 00:00:00 2001
> +From 31dca9601888f2a539dfb22693ffd62c22ee8912 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 12 Jan 2024 09:21:39 -0800
>  Subject: [PATCH] clang/arm: Do not use MUST_TAIL_CALL
> @@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/Source/WTF/wtf/Compiler.h b/Source/WTF/wtf/Compiler.h
> -index 0ea5cb76..c5480dbc 100644
> +index 449ca502..daac29d7 100644
>  --- a/Source/WTF/wtf/Compiler.h
>  +++ b/Source/WTF/wtf/Compiler.h
> -@@ -284,7 +284,7 @@
> +@@ -321,7 +321,7 @@
>   /* MUST_TAIL_CALL */
>
>   #if !defined(MUST_TAIL_CALL) && defined(__cplusplus) && defined(__has_c=
pp_attribute)
> diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/m=
eta/recipes-sato/webkit/webkitgtk/reproducibility.patch
> index 93a431a0b1..d614a1ee4f 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
> @@ -1,4 +1,4 @@
> -From d096b945113ddecaf33062296e20b6d5a007cab3 Mon Sep 17 00:00:00 2001
> +From cb5458b5d15aafa3543a47a33975609026d45d32 Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Mon, 3 Jan 2022 14:18:34 +0000
>  Subject: [PATCH] webkitgtk: Add reproducibility fix
> diff --git a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch b/m=
eta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
> index d4720e4f28..064925dace 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
> @@ -1,10 +1,9 @@
> -From 3d5373575695b293b8559155431d0079a6153aff Mon Sep 17 00:00:00 2001
> +From 36c092723ec6d4908039341c9d157db8ab1c0a59 Mon Sep 17 00:00:00 2001
>  From: Michael Catanzaro <mcatanzaro@redhat.com>
>  Date: Mon, 5 Feb 2024 11:00:49 -0600
> -Subject: [PATCH] =3D?UTF-8?q?[GTK]=3D20[2.42.5]=3D20LowLevelInterpreter.=
cpp:339:?=3D
> - =3D?UTF-8?q?21:=3D20error:=3D20=3DE2=3D80=3D98t6=3DE2=3D80=3D99=3D20was=
=3D20not=3D20declared=3D20in?=3D
> - =3D?UTF-8?q?=3D20this=3D20scope=3D20https://bugs.webkit.org/show=3D5Fbu=
g.cgi=3D3Fid?=3D
> - =3D?UTF-8?q?=3D3D268739?=3D
> +Subject: [PATCH] =3D?UTF-8?q?LowLevelInterpreter.cpp:339:21:=3D20error:=
=3D20?=3D
> + =3D?UTF-8?q?=3DE2=3D80=3D98t6=3DE2=3D80=3D99=3D20was=3D20not=3D20declar=
ed=3D20in=3D20this=3D20scope?=3D
> + =3D?UTF-8?q?=3D20https://bugs.webkit.org/show=3D5Fbug.cgi=3D3Fid=3D3D26=
8739?=3D
>  MIME-Version: 1.0
>  Content-Type: text/plain; charset=3DUTF-8
>  Content-Transfer-Encoding: 8bit
> @@ -22,7 +21,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
>   1 file changed, 2 deletions(-)
>
>  diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp b/Sourc=
e/JavaScriptCore/llint/LowLevelInterpreter.cpp
> -index 5064ead6cd2e7..9a2e2653b1219 100644
> +index 75cecbbd..b1020ea4 100644
>  --- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
>  +++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
>  @@ -336,8 +336,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void*=
 executableAddress, VM* vm,
> @@ -34,4 +33,3 @@ index 5064ead6cd2e7..9a2e2653b1219 100644
>
>       struct StackPointerScope {
>           StackPointerScope(CLoopStack& stack)
> -
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.44.3.bb
> similarity index 95%
> rename from meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
> rename to meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
> index 29f834ee9b..90fb7a1d42 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
> @@ -16,11 +16,8 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN}=
-${PV}.tar.xz \
>             file://no-musttail-arm.patch \
>             file://t6-not-declared.patch \
>             file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
> -           file://0001-Remove-ARM-specific-declarations-in-FELighting.h-=
unn.patch \
> -           file://0002-More-dynamicDowncast-adoption-in-platform-code.pa=
tch \
> -           file://CVE-2024-40779.patch \
>             "
> -SRC_URI[sha256sum] =3D "425b1459b0f04d0600c78d1abb5e7edfa3c060a420f8b231=
e9a6a2d5d29c5561"
> +SRC_URI[sha256sum] =3D "dc82d042ecaca981a4852357c06e5235743319cf10a94cd3=
6ad41b97883a0b54"
>
>  inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
>
> @@ -96,7 +93,7 @@ EXTRA_OECMAKE =3D " \
>
>  # Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size o=
f the
>  # debug symbols (4.3GB to 700M at time of writing)
> -DEBUG_FLAGS:append =3D "${@oe.utils.vartrue('DEBUG_BUILD', '', ' -g1', d=
)}"
> +DEBUG_LEVELFLAG =3D "-g1"
>
>  # Javascript JIT is not supported on ARC
>  EXTRA_OECMAKE:append:arc =3D " -DENABLE_JIT=3DOFF "
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205008): https://lists.openembedded.org/g/openembedde=
d-core/message/205008
> Mute This Topic: https://lists.openembedded.org/mt/108682400/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

