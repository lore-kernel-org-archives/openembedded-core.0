Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E72BC48286
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 20:51:43 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.6880.1706820699123976040
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 12:51:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=miuv/MJE;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-214410e969cso1173105fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 12:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706820698; x=1707425498; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=683VHsmZsy4BnPLNOUT0poY64bo2DoYK6Wr3e5zaSMs=;
        b=miuv/MJE0I5gZgSP4C28h2NNqLq4/2mRxgV47Y9flljWW6nejFhByASe/s+WHFVNNk
         JWtukJgl74KLl1qv3ZDG18BvWVfTbgQZqeehzJ5Og7JL2E8HX+P9vzQjZdML3QSV/WtI
         rDlgnxe+vbQfyviRywOX2FM0topwgwt8xZwoZ2n3dL0YU8Ms0boi5W2krexQR7sXrbq+
         gc5QnLuNZ4PxzxFZvoK+WFeLW+cSDYJbYlPyPewLEzJVnulCq9ohOIdx1DWix0U0GjTX
         QgFrsxTyEIvQwWOkzaMuZrdjrYnIrfVYjph/nbeeM4LK+769qSKiTE62IP7vGfrapvdX
         NNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706820698; x=1707425498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=683VHsmZsy4BnPLNOUT0poY64bo2DoYK6Wr3e5zaSMs=;
        b=eWqz1/qa8ePSZJwRjZ1pASxFhRTl1wj+fOFIQmvKG0FexIG5qudxYXtUKyV9onb/P/
         SAZVBC25jL11RD7Q9z7ibpVaigNXESnC00D4lWP6nI9dObigR1r4+LtaUPhQTPxhpjU4
         KrwS4kHqnb/pinegxdD7MA5NRShLxpBbHyqRlhvu1jOPdjUZ4mVkisrauKck4Xb3Nb35
         Nj9N8xKv6gyX3sUk+i+uDPALLkSpMHy7j3/cmvNiiJCRa5//hMVuAMRIOjSorqzsV/cU
         QtEcEkebZIoQuw1ApghRdFNHGrTvIwLYPytw8x8hXlmL8vVSCejtuSibYUlAe8CXBeYW
         8MQw==
X-Gm-Message-State: AOJu0YwnMfU+aQv/zBujF6gPFjYHS6puDWEcTAbxG4eZMv4HhzzHw4s6
	9PVVbx2Tm4pGVlA75CiE9+ow5sHul8lm+eMyNTtMnx0NUxVoSqfyBWf4oITtmeWu34oCauvqXbJ
	LDQsn69v9uWr0OWZLk9f3vXKJWwM=
X-Google-Smtp-Source: AGHT+IEhCZLy0VrfnB4db1o+Qhu77YhYA0o3EOyw6/AObktmcyY+LemyurMaAQr4A3ai1wcf8YypsC9HK71qRosKhJo=
X-Received: by 2002:a05:6870:d1ca:b0:218:9e25:22f8 with SMTP id
 b10-20020a056870d1ca00b002189e2522f8mr85443oac.13.1706820698406; Thu, 01 Feb
 2024 12:51:38 -0800 (PST)
MIME-Version: 1.0
References: <1706820353-6967-1-git-send-email-mark.hatle@kernel.crashing.org>
In-Reply-To: <1706820353-6967-1-git-send-email-mark.hatle@kernel.crashing.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Feb 2024 12:51:12 -0800
Message-ID: <CAMKF1somBHQaOEev7hT1AoBwtGxX9=4j0YwZfLWL5fD0L6aGOA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Updates for ARM tunings
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org, mark.hatle@amd.com, 
	jon.mason@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 20:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194752

this series looks ok to me on top of master-next.

On Thu, Feb 1, 2024 at 12:47=E2=80=AFPM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
> From: Mark Hatle <mark.hatle@amd.com>
>
> cortexa78 missing seems to be an oversight.  It (according to wikipedia) =
is a
> successor to the cortexa77 which already exists.  This was created by
> copying the cortexa77 and changing it to be a78.  A test system was build=
 to
> verify no obvious issues with the toolchain.
>
> The remaining three changes are related.  I've got a need for a cortex-r5=
 and
> cortex-r52 that enables the hard-float calling convention (this might als=
o
> be useful to others with other cortex-r and maybe even cortex-m processor=
s,
> but I'm not in a position to know this outside of my specific need.)
>
> tune-cortexr5 simply adds an hf variant that adds the callconvention-hard=
.
> Since there is no armv7r-vfp3d16 w/ this, the package_arch list is more
> limited then the regular r5.
>
> tune-cortexr52 requires the change to feature-arm-vfp to allow the settin=
g
> when 'simd' is enabled (since we don't specify vfp or neon).  Otherwise
> this follows the same convention as the r5 change.
>
> v2:
> Rebase cortex-a78 tune based on current master-next branch.  THis address=
es
> Khem's comment.
>
> Mark Hatle (4):
>   tune-cortexa78.inc: Add cortexa78 tune, based on cortexa77
>   feature-arm-vfp.inc: Allow hard-float on newer simd targets
>   tune-cortexr5: Add hard-float variant
>   tune-cortexr52: Add hard-float variant
>
>  .../include/arm/armv7r/tune-cortexr5.inc        |  5 +++++
>  .../include/arm/armv8-2a/tune-cortexa78.inc     | 17 +++++++++++++++++
>  .../include/arm/armv8r/tune-cortexr52.inc       |  5 +++++
>  .../machine/include/arm/feature-arm-vfp.inc     |  3 ++-
>  4 files changed, 29 insertions(+), 1 deletion(-)
>  create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa78=
.inc
>
> --
> 2.34.1
>

