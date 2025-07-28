Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00192C87FCE
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 09:02:55 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.77390.1753693373897373339
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 02:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NRgSh8Ko;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-7074bad053aso3803026d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 02:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753693373; x=1754298173; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4HM3nrW3n95KTwhK7PMdvZETH0wHl8WE052bYd297Ag=;
        b=NRgSh8Ko3dAG46mY1urfxEXIapVyhKtfxfgZoXK44xEqM1uc14SLsMYq2WtTbcbSJS
         cJ97LKgIg6IE0vKCEucLQYwwTv/mUGg4np2her7THP1Df7Vt2/F0JlArR2+sInuSNS0l
         PvMpezvkL/JXYfjr2je+yESTig1Oex/5fRZCgiM1xoAcnRyws1ZpbGHEH6+Habk8JMLs
         yh3EMOzHOveDfC4De27eET4DKuxM5dXEn2nBtbsMDH9Nh8Lxfh0TMTMYJBgQ4x+0RTjf
         utRAYatwODWOFk2lWjkMCWgCxcQjHhcTX/T29L7oW7mbMS1BffzBybFWVhGiKT47Kvaf
         Dgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753693373; x=1754298173;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4HM3nrW3n95KTwhK7PMdvZETH0wHl8WE052bYd297Ag=;
        b=akkc8IDlP9i5DlZtSn47F3Bfhv7g54DYGdZsiYIVqLMHMCkkundsWbjnmxz+Z8Lzoo
         2Nm023D/iFl806otE5PfGpEGZaX6B+y9M10p8DG8KbCcaRbG6uRIG55HpM5EwLdO8E3H
         takH8urVKpd7FY5Xz5lcrjWtTpitF7e9mjJXpQhF3ldw4/CKDHFqzYsCNbdUoDqJYGzc
         9gXUkt5DLRWulDyJ/ay1nQPcMJiZoktRKEBgCYplG2uo7fdi0k8ddFKfYu/T5CR7EoVR
         oZdMyVEtNqapmZYfiryjK1CxJhv64vCNCu4eaTMj6Snrm4rLtj+0gpZm0YiGB2R2aZ1q
         DQpA==
X-Gm-Message-State: AOJu0YzzUFmmHoyh334f2Lkp4vPbCwBcnpFUH2x2gRqb08rBRcBbNktE
	gkRI5BuLuIZkEV0x3j6YyZyZG7LcpdtPrRjpsQlgfLWQK4Jnq+IVBbzUJsF1/2ZvqAiED5mwc7J
	LqPNv+RCIwX/JvQYAwBL1DiwHQRmp4eY=
X-Gm-Gg: ASbGnctErOnUc1Erj4ThSUtmneiEyP8aCgMyGjFe8nz6OJX4tvqPRwd8Q1UKPqiAx1c
	yLg/sSSizF3jEQK8SMGwiJ5x4JToVbI9nqyyyEAW4rV2G2HvC3JF7jTptgIKZ2ZSPB3KQeJa68C
	zzJGH9/bNgKnq3+Kav9KrfPd/0WCkGUL5dXHpFOhHL5w6imdQPA8WAa64vZO1Fz3kDJTBNlQP5n
	LRu3H6mIBo+ajOEf1zfpK1nz91CPknQTnpE4bmMbg==
X-Google-Smtp-Source: AGHT+IHaoj2cOlpuzmMNJUKIMOrNM1zd5UXqtzZIltdU/zKcwZ9fS6rspYv3esZAfcPa6/cCu/XwdI8+2xb1PSoap7c=
X-Received: by 2002:a05:6214:529b:b0:702:da74:d022 with SMTP id
 6a1803df08f44-707205d33b1mr162923646d6.35.1753693372578; Mon, 28 Jul 2025
 02:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250728032045.2783514-1-raj.khem@gmail.com>
In-Reply-To: <20250728032045.2783514-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Jul 2025 11:02:41 +0200
X-Gm-Features: Ac12FXwtVsbA9FWDPUPPfr0lxjmSnM939B-6Ep8o9-0cqJn8qr1ZKvHdJI5u4nc
Message-ID: <CANNYZj-KztVkyJc_3-cm5T=MtJasYoJkidku2J=7rA5BTysEqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] spirv-headers,spirv-tools: Upgrade to
 1.4.321.0 release
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 09:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220993

These need to be updated in lockstep with other vulkan items:
$ find . -name *1.4.3*
./meta/recipes-graphics/glslang/glslang_1.4.313.0.bb
./meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb
./meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb
./meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb
./meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb
./meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
./meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb
./meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb
./meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb

Alex

On Mon, 28 Jul 2025 at 05:20, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...{spirv-headers_1.4.313.0.bb => spirv-headers_1.4.321.0.bb} | 4 ++--
>  .../{spirv-tools_1.4.313.0.bb => spirv-tools_1.4.321.0.bb}    | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-graphics/spir/{spirv-headers_1.4.313.0.bb => spirv-headers_1.4.321.0.bb} (84%)
>  rename meta/recipes-graphics/spir/{spirv-tools_1.4.313.0.bb => spirv-tools_1.4.321.0.bb} (97%)
>
> diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
> similarity index 84%
> rename from meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb
> rename to meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
> index a551814689c..1da2e74f93b 100644
> --- a/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb
> +++ b/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
> @@ -2,9 +2,9 @@ SUMMARY = "Machine-readable files for the SPIR-V Registry"
>  SECTION = "graphics"
>  HOMEPAGE = "https://www.khronos.org/registry/spir-v"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d14ee3b13f42e9c9674acc5925c3d741"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a0dcaa512cc2dee95fe0fd791ee83a18"
>
> -SRCREV = "aa6cef192b8e693916eb713e7a9ccadf06062ceb"
> +SRCREV = "2a611a970fdbc41ac2e3e328802aed9985352dca"
>  SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
>  PE = "1"
>  # These recipes need to be updated in lockstep with each other:
> diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
> similarity index 97%
> rename from meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
> rename to meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
> index 4594a1a9426..319b25b7f43 100644
> --- a/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
> +++ b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
> @@ -7,7 +7,7 @@ SECTION = "graphics"
>  LICENSE  = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
> -SRCREV = "a62abcb402009b9ca5975e6167c09f237f630e0e"
> +SRCREV = "33e02568181e3312f49a3cf33df470bf96ef293a"
>  SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https \
>             "
>  PE = "1"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220984): https://lists.openembedded.org/g/openembedded-core/message/220984
> Mute This Topic: https://lists.openembedded.org/mt/114408564/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

