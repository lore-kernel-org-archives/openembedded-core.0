Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ABB0C54EE9
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 03:02:50 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.2013.1663124569032001000
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 20:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BEERy5BN;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-127dca21a7dso37426907fac.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 20:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=WCxFKyGf8LybP+GqZvyBLLU45/eVwokyQwzg2FOOqSg=;
        b=BEERy5BNHoZfJYU3m65QbVrH4ItgQ4Ui4hxWEfX2HSKfE6//RTIykBnZZinSSaSLGx
         id+xAISwSIThDlyJKmiSuVh0ARiOiI8Y7m0EEMbqHdXRtGRFztenQW/vuvPAKH7WP5Wb
         2RAoD1A0ehT57oxX6K+4D65BO+MTzHBIkjMZUM/76Omva1IDneVmK3rl6m3yL3j6OPrg
         eLsSQglLGY5M509U5jrpeqOZdC+3hW6LyPmvmpMXvV9HvSAaiLsB2Xv1YPv3919zrChT
         Je+KA/GOEPq0PnTIBXNiJHxQdZPgAXh4NuCeHg6PGEd3h4hOaUmZOEwA8rmHoSlvUOTN
         deWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=WCxFKyGf8LybP+GqZvyBLLU45/eVwokyQwzg2FOOqSg=;
        b=7kwfrKhiCcMAhVLeqdRHvv2NOa4F9TEZVZPnU/tEpb1R3in1l3uqlF1fXL7jt+ITeX
         sCVWf8hzFb+VmwQOE/5ahUiUaVBz4O6t3whWYL3DAqgfOvST4Xpjmun41wX/zImuhqL4
         tzZ1LrOkyVx+FqLD3mVMP6OtXmjhIogIoVnuC0v/HrXPxUYkxjESVrIKDQHKRnnFZbLh
         qeb4EUbxVFTqXT/q7dCn0tWN/x5rYoeiDfutjWPZ4wXIkq+10Unr56jF44JHP+JLNjyL
         blEVdqCGWdnVhRBQdAP6g9/hKGUqSV/1Vh/EG/vEqLBBWdljG8Jbm+7G87ORzPl9z52n
         POfw==
X-Gm-Message-State: ACgBeo3BJ8ET3HmUvXg6ccQhLHpFLnzSBWDcRyEQPPho+8YbytqrqUBf
	ECeXA4MwNItfNIUx+8yEkzeDEI5JOeqFHx732G4=
X-Google-Smtp-Source: 
 AA6agR4JODmC5UqZZCkDEfnUZ/QBfGR/1b/+RUMZIxYuIbAvzfXlbeN9zIBlQ7Wc380WCmxc3Lo6ZvZuLgkFaialojE=
X-Received: by 2002:a05:6808:17a6:b0:344:eaa9:24e8 with SMTP id
 bg38-20020a05680817a600b00344eaa924e8mr966544oib.55.1663124568018; Tue, 13
 Sep 2022 20:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220908214554.1117287-1-raj.khem@gmail.com>
 <99ce1274-dcd0-8392-fc88-9f1122870049@windriver.com>
In-Reply-To: <99ce1274-dcd0-8392-fc88-9f1122870049@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Sep 2022 20:02:22 -0700
Message-ID: 
 <CAMKF1so_7GfQBYtTu8V4c5K=wnjq64HR=AYHhjSa7Uc7KkX7_w@mail.gmail.com>
Subject: Re: [PATCH v3] webkitgtk: Fix build on 32bit arm
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 03:02:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170628

On Tue, Sep 13, 2022 at 7:25 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> Still failed on beaglebone-yocto:
>
> /build/tmp-glibc/work/cortexa8hf-neon-wrs-linux-gnueabi/webkitgtk/2.36.7-r0/webkitgtk-2.36.7/Source/W
> ebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:38:8: error:
> standard attributes in middle of decl-specifiers
>     38 | static alignas(16) short s_FELightingConstantsForNeon[] = {
>        |        ^~~~~~~
>

What is your -j value ? please give 4GB per core of memory for
webkitgtk to build.

> Thanks,
>
> On 9/9/22 05:45, Khem Raj wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Mingli Yu <mingli.yu@windriver.com>
> > ---
> > v2: Fix commit msg format
> > v3: Apply suggestion from https://github.com/WebKit/WebKit/pull/1233#discussion_r915217428
> >
> >   ...44e17d258106617b0e6d783d073b188a2548.patch | 296 ++++++++++++++++++
> >   meta/recipes-sato/webkit/webkitgtk_2.36.7.bb  |   1 +
> >   2 files changed, 297 insertions(+)
> >   create mode 100644 meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
> >
> > diff --git a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
> > new file mode 100644
> > index 0000000000..32f92f7ff5
> > --- /dev/null
> > +++ b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
> > @@ -0,0 +1,296 @@
> > +From 0d3344e17d258106617b0e6d783d073b188a2548 Mon Sep 17 00:00:00 2001
> > +From: Adrian Perez de Castro <aperez@igalia.com>
> > +Date: Thu, 2 Jun 2022 11:19:06 +0300
> > +Subject: [PATCH] [ARM][NEON] FELightningNEON.cpp fails to build, NEON fast
> > + path seems unused https://bugs.webkit.org/show_bug.cgi?id=241182
> > +
> > +Reviewed by NOBODY (OOPS!).
> > +
> > +Move the NEON fast path for the SVG lighting filter effects into
> > +FELightingSoftwareApplier, and arrange to actually use them by
> > +forwarding calls to applyPlatformGeneric() into applyPlatformNeon().
> > +
> > +Some changes were needed to adapt platformApplyNeon() to the current
> > +state of filters after r286140. This was not detected because the code
> > +bitrotted due to it being guarded with CPU(ARM_TRADITIONAL), which does
> > +not get used much these days: CPU(ARM_THUMB2) is more common. It should
> > +be possible to use the NEON fast paths also in Thumb mode, but that is
> > +left for a follow-up fix.
> > +
> > +* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:
> > +(WebCore::FELightingSoftwareApplier::platformApplyNeonWorker):
> > +(WebCore::FELightingSoftwareApplier::getPowerCoefficients):
> > +(WebCore::FELighting::platformApplyNeonWorker): Deleted.
> > +(WebCore::FELighting::getPowerCoefficients): Deleted.
> > +* Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h:
> > +(WebCore::FELightingSoftwareApplier::applyPlatformNeon):
> > +(WebCore::FELighting::platformApplyNeon): Deleted.
> > +* Source/WebCore/platform/graphics/filters/DistantLightSource.h:
> > +* Source/WebCore/platform/graphics/filters/FELighting.h:
> > +* Source/WebCore/platform/graphics/filters/PointLightSource.h:
> > +* Source/WebCore/platform/graphics/filters/SpotLightSource.h:
> > +* Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h:
> > +---
> > +Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/1233]
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > + .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
> > + .../graphics/cpu/arm/filters/FELightingNEON.h | 54 +++++++++----------
> > + .../graphics/filters/DistantLightSource.h     |  4 ++
> > + .../platform/graphics/filters/FELighting.h    |  7 ---
> > + .../graphics/filters/PointLightSource.h       |  4 ++
> > + .../graphics/filters/SpotLightSource.h        |  4 ++
> > + .../software/FELightingSoftwareApplier.h      | 16 ++++++
> > + 7 files changed, 57 insertions(+), 36 deletions(-)
> > +
> > +--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> > ++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
> > +@@ -49,7 +49,7 @@ short* feLightingConstantsForNeon()
> > +     return s_FELightingConstantsForNeon;
> > + }
> > +
> > +-void FELighting::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
> > ++void FELightingSoftwareApplier::platformApplyNeonWorker(FELightingPaintingDataForNeon* parameters)
> > + {
> > +     neonDrawLighting(parameters);
> > + }
> > +@@ -464,7 +464,7 @@ TOSTRING(neonDrawLighting) ":" NL
> > +     "b .lightStrengthCalculated" NL
> > + ); // NOLINT
> > +
> > +-int FELighting::getPowerCoefficients(float exponent)
> > ++int FELightingSoftwareApplier::getPowerCoefficients(float exponent)
> > + {
> > +     // Calling a powf function from the assembly code would require to save
> > +     // and reload a lot of NEON registers. Since the base is in range [0..1]
> > +--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> > ++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
> > +@@ -24,14 +24,15 @@
> > +  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> > +  */
> > +
> > +-#ifndef FELightingNEON_h
> > +-#define FELightingNEON_h
> > ++#pragma once
> > +
> > + #if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
> > +
> > +-#include "FELighting.h"
> > ++#include "FELightingSoftwareApplier.h"
> > ++#include "ImageBuffer.h"
> > + #include "PointLightSource.h"
> > + #include "SpotLightSource.h"
> > ++#include <wtf/ObjectIdentifier.h>
> > + #include <wtf/ParallelJobs.h>
> > +
> > + namespace WebCore {
> > +@@ -93,14 +94,14 @@ extern "C" {
> > + void neonDrawLighting(FELightingPaintingDataForNeon*);
> > + }
> > +
> > +-inline void FELighting::platformApplyNeon(const LightingData& data, const LightSource::PaintingData& paintingData)
> > ++inline void FELightingSoftwareApplier::applyPlatformNeon(const FELightingSoftwareApplier::LightingData& data, const LightSource::PaintingData& paintingData)
> > + {
> > +-    alignas(16) FELightingFloatArgumentsForNeon floatArguments;
> > +-    FELightingPaintingDataForNeon neonData = {
> > ++    WebCore::FELightingFloatArgumentsForNeon alignas(16) floatArguments;
> > ++    WebCore::FELightingPaintingDataForNeon neonData = {
> > +         data.pixels->data(),
> > +         1,
> > +-        data.widthDecreasedByOne - 1,
> > +-        data.heightDecreasedByOne - 1,
> > ++        data.width - 2,
> > ++        data.height - 2,
> > +         0,
> > +         0,
> > +         0,
> > +@@ -111,23 +112,23 @@ inline void FELighting::platformApplyNeo
> > +     // Set light source arguments.
> > +     floatArguments.constOne = 1;
> > +
> > +-    auto color = m_lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
> > ++    auto color = data.lightingColor.toColorTypeLossy<SRGBA<uint8_t>>().resolved();
> > +
> > +     floatArguments.colorRed = color.red;
> > +     floatArguments.colorGreen = color.green;
> > +     floatArguments.colorBlue = color.blue;
> > +     floatArguments.padding4 = 0;
> > +
> > +-    if (m_lightSource->type() == LS_POINT) {
> > ++    if (data.lightSource->type() == LS_POINT) {
> > +         neonData.flags |= FLAG_POINT_LIGHT;
> > +-        PointLightSource& pointLightSource = static_cast<PointLightSource&>(m_lightSource.get());
> > ++        const auto& pointLightSource = *static_cast<const PointLightSource*>(data.lightSource);
> > +         floatArguments.lightX = pointLightSource.position().x();
> > +         floatArguments.lightY = pointLightSource.position().y();
> > +         floatArguments.lightZ = pointLightSource.position().z();
> > +         floatArguments.padding2 = 0;
> > +-    } else if (m_lightSource->type() == LS_SPOT) {
> > ++    } else if (data.lightSource->type() == LS_SPOT) {
> > +         neonData.flags |= FLAG_SPOT_LIGHT;
> > +-        SpotLightSource& spotLightSource = static_cast<SpotLightSource&>(m_lightSource.get());
> > ++        const auto& spotLightSource = *static_cast<const SpotLightSource*>(data.lightSource);
> > +         floatArguments.lightX = spotLightSource.position().x();
> > +         floatArguments.lightY = spotLightSource.position().y();
> > +         floatArguments.lightZ = spotLightSource.position().z();
> > +@@ -145,7 +146,7 @@ inline void FELighting::platformApplyNeo
> > +         if (spotLightSource.specularExponent() == 1)
> > +             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
> > +     } else {
> > +-        ASSERT(m_lightSource->type() == LS_DISTANT);
> > ++        ASSERT(data.lightSource->type() == LS_DISTANT);
> > +         floatArguments.lightX = paintingData.initialLightingData.lightVector.x();
> > +         floatArguments.lightY = paintingData.initialLightingData.lightVector.y();
> > +         floatArguments.lightZ = paintingData.initialLightingData.lightVector.z();
> > +@@ -155,38 +156,39 @@ inline void FELighting::platformApplyNeo
> > +     // Set lighting arguments.
> > +     floatArguments.surfaceScale = data.surfaceScale;
> > +     floatArguments.minusSurfaceScaleDividedByFour = -data.surfaceScale / 4;
> > +-    if (m_lightingType == FELighting::DiffuseLighting)
> > +-        floatArguments.diffuseConstant = m_diffuseConstant;
> > ++    if (data.filterType == FilterEffect::Type::FEDiffuseLighting)
> > ++        floatArguments.diffuseConstant = data.diffuseConstant;
> > +     else {
> > +         neonData.flags |= FLAG_SPECULAR_LIGHT;
> > +-        floatArguments.diffuseConstant = m_specularConstant;
> > +-        neonData.specularExponent = getPowerCoefficients(m_specularExponent);
> > +-        if (m_specularExponent == 1)
> > ++        floatArguments.diffuseConstant = data.specularConstant;
> > ++        neonData.specularExponent = getPowerCoefficients(data.specularExponent);
> > ++        if (data.specularExponent == 1)
> > +             neonData.flags |= FLAG_SPECULAR_EXPONENT_IS_1;
> > +     }
> > +     if (floatArguments.diffuseConstant == 1)
> > +         neonData.flags |= FLAG_DIFFUSE_CONST_IS_1;
> > +
> > +-    int optimalThreadNumber = ((data.widthDecreasedByOne - 1) * (data.heightDecreasedByOne - 1)) / s_minimalRectDimension;
> > ++    static constexpr int minimalRectDimension = 100 * 100; // Empirical data limit for parallel jobs
> > ++    int optimalThreadNumber = ((data.width - 2) * (data.height - 2)) / minimalRectDimension;
> > +     if (optimalThreadNumber > 1) {
> > +         // Initialize parallel jobs
> > +-        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&WebCore::FELighting::platformApplyNeonWorker, optimalThreadNumber);
> > ++        ParallelJobs<FELightingPaintingDataForNeon> parallelJobs(&FELightingSoftwareApplier::platformApplyNeonWorker, optimalThreadNumber);
> > +
> > +         // Fill the parameter array
> > +         int job = parallelJobs.numberOfJobs();
> > +         if (job > 1) {
> > +             int yStart = 1;
> > +-            int yStep = (data.heightDecreasedByOne - 1) / job;
> > ++            int yStep = (data.height - 2) / job;
> > +             for (--job; job >= 0; --job) {
> > +                 FELightingPaintingDataForNeon& params = parallelJobs.parameter(job);
> > +                 params = neonData;
> > +                 params.yStart = yStart;
> > +-                params.pixels += (yStart - 1) * (data.widthDecreasedByOne + 1) * 4;
> > ++                params.pixels += (yStart - 1) * data.width * 4;
> > +                 if (job > 0) {
> > +                     params.absoluteHeight = yStep;
> > +                     yStart += yStep;
> > +                 } else
> > +-                    params.absoluteHeight = data.heightDecreasedByOne - yStart;
> > ++                    params.absoluteHeight = (data.height - 1) - yStart;
> > +             }
> > +             parallelJobs.execute();
> > +             return;
> > +@@ -199,5 +201,3 @@ inline void FELighting::platformApplyNeo
> > + } // namespace WebCore
> > +
> > + #endif // CPU(ARM_NEON) && COMPILER(GCC_COMPATIBLE)
> > +-
> > +-#endif // FELightingNEON_h
> > +--- a/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> > ++++ b/Source/WebCore/platform/graphics/filters/DistantLightSource.h
> > +@@ -25,6 +25,10 @@
> > + #include "LightSource.h"
> > + #include <wtf/Ref.h>
> > +
> > ++namespace WTF {
> > ++class TextStream;
> > ++} // namespace WTF
> > ++
> > + namespace WebCore {
> > +
> > + class DistantLightSource : public LightSource {
> > +--- a/Source/WebCore/platform/graphics/filters/FELighting.h
> > ++++ b/Source/WebCore/platform/graphics/filters/FELighting.h
> > +@@ -35,8 +35,6 @@
> > +
> > + namespace WebCore {
> > +
> > +-struct FELightingPaintingDataForNeon;
> > +-
> > + class FELighting : public FilterEffect {
> > + public:
> > +     const Color& lightingColor() const { return m_lightingColor; }
> > +@@ -67,11 +65,6 @@ protected:
> > +
> > +     std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const override;
> > +
> > +-#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
> > +-    static int getPowerCoefficients(float exponent);
> > +-    inline void platformApplyNeon(const LightingData&, const LightSource::PaintingData&);
> > +-#endif
> > +-
> > +     Color m_lightingColor;
> > +     float m_surfaceScale;
> > +     float m_diffuseConstant;
> > +--- a/Source/WebCore/platform/graphics/filters/PointLightSource.h
> > ++++ b/Source/WebCore/platform/graphics/filters/PointLightSource.h
> > +@@ -26,6 +26,10 @@
> > + #include "LightSource.h"
> > + #include <wtf/Ref.h>
> > +
> > ++namespace WTF {
> > ++class TextStream;
> > ++} // namespace WTF
> > ++
> > + namespace WebCore {
> > +
> > + class PointLightSource : public LightSource {
> > +--- a/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> > ++++ b/Source/WebCore/platform/graphics/filters/SpotLightSource.h
> > +@@ -26,6 +26,10 @@
> > + #include "LightSource.h"
> > + #include <wtf/Ref.h>
> > +
> > ++namespace WTF {
> > ++class TextStream;
> > ++} // namespace WTF
> > ++
> > + namespace WebCore {
> > +
> > + class SpotLightSource : public LightSource {
> > +--- a/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
> > ++++ b/Source/WebCore/platform/graphics/filters/software/FELightingSoftwareApplier.h
> > +@@ -36,6 +36,7 @@
> > + namespace WebCore {
> > +
> > + class FELighting;
> > ++struct FELightingPaintingDataForNeon;
> > +
> > + class FELightingSoftwareApplier final : public FilterEffectConcreteApplier<FELighting> {
> > +     WTF_MAKE_FAST_ALLOCATED;
> > +@@ -132,8 +133,23 @@ private:
> > +
> > +     static void applyPlatformGenericPaint(const LightingData&, const LightSource::PaintingData&, int startY, int endY);
> > +     static void applyPlatformGenericWorker(ApplyParameters*);
> > ++
> > ++#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
> > ++    static int getPowerCoefficients(float exponent);
> > ++    static void platformApplyNeonWorker(FELightingPaintingDataForNeon*);
> > ++    inline static void applyPlatformNeon(const LightingData&, const LightSource::PaintingData&);
> > ++
> > ++    inline static void applyPlatformGeneric(const LightingData& data, const LightSource::PaintingData& paintingData)
> > ++    {
> > ++        applyPlatformNeon(data, paintingData);
> > ++    }
> > ++#else
> > +     static void applyPlatformGeneric(const LightingData&, const LightSource::PaintingData&);
> > ++#endif
> > ++
> > +     static void applyPlatform(const LightingData&);
> > + };
> > +
> > + } // namespace WebCore
> > ++
> > ++#include "FELightingNEON.h"
> > diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
> > index 47e52e25da..76b119c9c7 100644
> > --- a/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
> > +++ b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
> > @@ -16,6 +16,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
> >              file://reproducibility.patch \
> >              file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
> >              file://fix-gstreamer-include-paths.patch \
> > +           file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
> >              "
> >   SRC_URI[sha256sum] = "0c260cf2b32f0481d017670dfed1b61e554967cd067195606c9f9eb5fe731743"
> >
> > --
> > 2.37.3
> >

