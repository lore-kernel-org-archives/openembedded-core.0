Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4541CC87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 09:07:41 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.20817.1754471258766233901
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 02:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mm/fhEmL;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-7077a1563b5so61138766d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 02:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754471258; x=1755076058; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4zZxVp4+3hkei/MwCEcvf0VczMLMzfjhCp0LCrxkJ7Q=;
        b=Mm/fhEmL4JOMYLeHC1iQUaDRx49JZuB7thlfOmY14G4ew/+Vq9g4GbwFFO+YQeo80H
         VAB6hwXzmzH2toJVz/DO54wjzUKlP5rJqLSc5uh/Ze3JHFUnf50Ju49QZsD82RuUaQQP
         NFMGIudvOm00wPeM00doOaIP+K9W0+H4jUtvSOaWhDvo1rNV/DUPUuEnsiq76qr8iqLt
         Pi2vC62EmggR+cJRtlmHcwdW5ZEmmxEzbjyeOjH6pE5oG4Tc8t83hJXO0S2fzmoacdER
         xtIBaHWQvABoXj5hxjx5BR6nfIlCW6rJ2oWG07+KZuYcNo628+M0eH9jFMVZc9gGjeI2
         U5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754471258; x=1755076058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4zZxVp4+3hkei/MwCEcvf0VczMLMzfjhCp0LCrxkJ7Q=;
        b=Y0JwO45DrUOZRfSZKYqN/nANktC2hNAePlKXdp0abMlFObPZoMOWN62jIEuaPK/4+k
         E40z+LUzHoqSqKYMyrVxAxzk82cNGB4n0gSRsZZOpyHob/34GUgZxsPwAxpcowRBFeE7
         0FaM7ug+IMcTWL3mZ4cTxndEPRM14y6bFcavmiLnphfcGcPSNueJ8LZd0T41EcC4KwXK
         mkBQBO+jXjprU2kUP7TS3steSjw9EPDzgskBRTQmvjxxzbFQI2ZQSIeG0BDClOjLzY6E
         bd58+MtoQeVZIfJp9o509djFrJKAIsaKknSRfBlkoiPhjWg0bNbZAw2dyPBNyY/U6HF2
         phfQ==
X-Gm-Message-State: AOJu0Yy5L6Vd/O4P3P4pxjwhplHLlSmVRlqqjsXdX8D6Y3nwQnMO6pP4
	N6Tmj3njNSBCSksK7xCYDIdn7xMph3I1slYrW/D3EK8P4O2wJVHKFX8bhB0wov0CvK3672UiAFL
	f/FgNrRfdrQLEIjsyU65RyG2u18/9QZM=
X-Gm-Gg: ASbGncu9ErnPs2IH/Ytk5etgG4c64Uyu3unODIQG5lu1wBXstRc+S9gXyjVLYTDrMJY
	hzV3vqjutPCRsxjbWrEv6av7Uc40Bg9OyGY/+PPXJb87qWRZ8ldlt+sesp2z0zZ9nV4LEUha2A/
	NunYswwXpK2HoCn8uDHh4uIBjJPSVcHDyEdds4BVmgbtRLd28TC1GqqT8zMlO5p2xRJHbb2tjtS
	CAZ7GLS7jRwi4gMS2P2BAmBPj+YbrrMpLHjsXzdlQ==
X-Google-Smtp-Source: AGHT+IFrKmTYp16q6ePssu6Qkr/bZkKDqPELXMxMgCKpYPFgtT0rfpM5xdWI8meeUtvAFJ31iVnvIrIweM3Y5W00JIw=
X-Received: by 2002:a05:6214:2586:b0:704:f7d8:edfe with SMTP id
 6a1803df08f44-7097969e480mr25113566d6.51.1754471257540; Wed, 06 Aug 2025
 02:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250806083929.747-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20250806083929.747-1-liuyd.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Aug 2025 11:07:26 +0200
X-Gm-Features: Ac12FXyfos0cXEap7AhkOuLL-VFOUN6W3tEmvAJYZapxs50HHlt5z_9Zg_VLZ0g
Message-ID: <CANNYZj_Tws5Pd6mJhXWfsJuJ2gPYWzs3kDG19YWgvOM2jSJPHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/9] vulkan-headers: upgrade 1.4.313 -> 1.4.321
To: liuyd.fnst@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 09:07:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221512

The patches are numbered 1 to 9, but I only see six patches?

It's also preferred to update vulkan items as a single patch to
preserve bisectability.

Alex

On Wed, 6 Aug 2025 at 10:56, Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=fujitsu.com@lists.openembedded.org>
wrote:
>
> Changelog:
> https://github.com/KhronosGroup/Vulkan-Headers/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  ...{vulkan-headers_1.4.313.0.bb => vulkan-headers_1.4.321.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/vulkan/{vulkan-headers_1.4.313.0.bb => vulkan-headers_1.4.321.0.bb} (95%)
>
> diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb
> similarity index 95%
> rename from meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb
> rename to meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb
> index 1136e4795a..b3413b0e6b 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb
> @@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 & MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
>  SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
>
> -SRCREV = "409c16be502e39fe70dd6fe2d9ad4842ef2c9a53"
> +SRCREV = "2cd90f9d20df57eac214c148f3aed885372ddcfe"
>
>  inherit cmake
>
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221507): https://lists.openembedded.org/g/openembedded-core/message/221507
> Mute This Topic: https://lists.openembedded.org/mt/114562930/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

