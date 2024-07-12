Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FDDBC2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 09:04:11 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.3629.1720775048458976385
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 02:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HJKnJ+47;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ee920b0781so17224251fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 02:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720775047; x=1721379847; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BABNDKeJjnE2KM2jbgRh5OzdrIkaQOpXlzoHkLi0r9A=;
        b=HJKnJ+479I9OQCeCxVikTcjqmiQxH96JgKDrQZpaOWANmysjX+L8uz+uObOEYlbxGR
         L+GMoYFWeeXUXQpJQ7SKtAM394Yt9yXoZqbnDO4bj6nfU3UoJd5LfbGVSCNrNvqvKIxT
         0PV6szlgpl//uTlO5+ZGd0T/V9qF+K8vTIVp/dovIboZHJ8bRjGLX20WqOo/s/qJrHCu
         GaiGAZApzFdZfZI6SrDmNEdAV8lDm1C8DiT7qgdfUeaU1YPhygJiOZaSHbY75DoHRP5F
         PpE8EbShtDNh3FllT2IF1vW5NjDB24HE/YU448y6e26ybCb4i9uA2bCKODiuLFW0Riio
         yQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720775047; x=1721379847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BABNDKeJjnE2KM2jbgRh5OzdrIkaQOpXlzoHkLi0r9A=;
        b=gKkU2f9kFf+WbcepLGcLejqWToEuXJDVHoFx8FUTyFDFK5UrNdlq6egmtCZX6y5i9W
         Akj5qXF3jc6Tj7XKOAtYX652eo7QalYLGjwkR57hKhBjrAiMrpEegqwWZPRRN/Cnmka7
         AuyEWhJWuaG3vhdnPipysPCnS8vuCcvMVlHiD3FpvQT5LE8uvc3UApvTR+xaQzYz4dcA
         Co0qUJxX/eRnrAa6D3Sx2SxJt/FQZbwMXI9welcUGIa5S4CfiBuWpOTjETTkTakLEc6G
         sOwaw9JkTrUpi1hxm+vDXcDjYBGTf/kYqqpF5T272I2vkXq65ZG0P80K+4apFNdSfpKF
         5vqw==
X-Gm-Message-State: AOJu0YzmW+MLLeEtom8I7ef49vlkV6/4Zchgpdja6fctQaw92ioSp2If
	3xYTsPwb1WZv6FK/E5Vx8XP5OPtqSD6bQXz5XL1VVDU3sAqnT7cIXlsD+EcP+oZ6FIlFXZ9f+eP
	1U8QatFMHgSKqXW6IkTdRBhKj9p8=
X-Google-Smtp-Source: AGHT+IEp+r/u9UYQAWd8mO8GpBXKEXVMTxDTxNobbCM9IxO1rwlBef70aDP5bjenSMw2FCPRXpc+cmnMkme93zNWFwY=
X-Received: by 2002:a05:651c:200f:b0:2ee:8555:4742 with SMTP id
 38308e7fff4ca-2eeb30fe842mr61828841fa.27.1720775046207; Fri, 12 Jul 2024
 02:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240711234203.3841594-1-raj.khem@gmail.com> <20240711234203.3841594-2-raj.khem@gmail.com>
In-Reply-To: <20240711234203.3841594-2-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Jul 2024 11:03:54 +0200
Message-ID: <CANNYZj-G1MCyr7OZxB6AnqqrpVY-S2dpxzJYZsS16zCAj6ByNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] arch-arm64: Use neoverse-v1 ISA for Qemu usermode
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 09:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201813

I don't understand. Why setting an earlier CPU (that supports less
instructions) solves the problem of trying to execute unsupported
instructions? I think Arm folks should look at this.

Alex

On Fri, 12 Jul 2024 at 01:42, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
>
> With latest qemu several places where qemu-usermode is used e.g.
> nodejs, qtwebengine, chromium, the builds are failing form armv8a
> tuned machines (e.g. tegra) which is due to qemu crash ( SIGILL )
> encoutered when 'max' ISA is used ( which is default ), max seems
> to use neoverse-n2 equivalent features, which is evident that SIGILL
> also happens when using -cpu neoverse-v2, therefore explicitly select
> neoverse-v1 for ISA, which works and covers almost all (if not all)
> cpu tunes for armv8 we have.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/machine/include/arm/arch-arm64.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
> index 832d0000acb..9639911d33b 100644
> --- a/meta/conf/machine/include/arm/arch-arm64.inc
> +++ b/meta/conf/machine/include/arm/arch-arm64.inc
> @@ -42,3 +42,8 @@ TARGET_FPU = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TARGET_FPU_64}
>  # support these they're meaningless NOP instructions, so there's very little
>  # reason not to.
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', ' -mbranch-protection=standard', '', d)}"
> +
> +# Fix qemu-user crashes while building nodejs/chromium/qtwebengine, defaults ISA is max and it generate SIGILLs
> +# qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> +# Select the superset ISA
> +QEMU_EXTRAOPTIONS_armv8a = "-cpu neoverse-v1"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201796): https://lists.openembedded.org/g/openembedded-core/message/201796
> Mute This Topic: https://lists.openembedded.org/mt/107173682/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

