Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4AAD32D7C
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:40:06 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.82948.1731404401802891252
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:40:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UGlUVrC7;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb6110c8faso48831831fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 01:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731404400; x=1732009200; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EIY5L54IK/ADd41auPYAUNStR226ZWOvdmVp5hyyHMM=;
        b=UGlUVrC7OcZL9LGd9/bsgFFMdb5ZHNY027VpbqEtGwr4WrWnciADUjO4HSRkNuzc8S
         +2DLUYmDqOUIYL0dvO4dfAsfBvQ3snbhTfGXgTDbmkpqr+ilgxMsr2hbPHzeDfGo3TWD
         p2UcUPEH06HOWwoDF9FuHvkb5/jfZhNt+BC+XZmnbGmAb2hKVEbw/coO39qCnDYKQNUt
         tEfgAnFWBey0Zogvj+sZU4D76mmyU5xnQW4hfq9Te2N1IX306l2CkAnTmW/4naD0tx19
         Ix9QB4dPBFqzClZQIqK2gvXHaCCr5FHvsRL0t2/UN0JoEqQcLELkkzicdvR+fp2qqSrw
         LG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731404400; x=1732009200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIY5L54IK/ADd41auPYAUNStR226ZWOvdmVp5hyyHMM=;
        b=wjV1+c6XeZsPkfQP45WCu2yZGINFMPr+U2r3xv/VMXh8GdYf7V3JKcuWaiw3sXPhAy
         WTsIbAWDGIxVEzVSf4hW49mJPq3dtMGK+Xh7nEoLdC2ivtwWwq+ALHFNAo6FYfAKD8mM
         z3pnC8uCN/6FgXNtJsfvIGiWSSBqBTR5rZyUXEKqryRSRorWQxqK4WP9ZeDZAWE1uQkb
         skAQzxEfAejZgKQZAEAeTV54f3eSTSliP4G2ucKrzTNH55r/H+aY4SmG/dSMaFXD177g
         Ol6Fkt9Xl3OlYUkVp2Mwcx8mCUWcIlb2PVxDSIG7621pf1W96rODHSGiW4X6yxVhp5h4
         g7qw==
X-Gm-Message-State: AOJu0YzwDDQsjJt/YHHUQxL7D8UarwDr1VzD47y2rIeOclHQR5HNjJBA
	fEeyAuZaY6C+Djvva0FUruANfkKWtdEc5BhD6f2siGEFa0vYwE83qla5LpfrjFFTFCDteyU0Gzu
	ZSIFp5HCh1NxNFWaR0h3FcwJk+kE=
X-Google-Smtp-Source: AGHT+IFrAMf0r8436AX/KlOjYjmJfrfv1brh87v6KrPbRnq2/X4antmq/DYTMX3LktDTuA13Nsn+OTzCTDb/14w3fZo=
X-Received: by 2002:a2e:a994:0:b0:2fb:60d8:744d with SMTP id
 38308e7fff4ca-2ff201b6f49mr77951471fa.19.1731404399576; Tue, 12 Nov 2024
 01:39:59 -0800 (PST)
MIME-Version: 1.0
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Nov 2024 10:39:48 +0100
Message-ID: <CANNYZj__2eakCyxuDz1J0HUDABNXzqOyN7-4689-2A6=A3hdAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/47] barebox-tools: upgrade 2024.09.0 -> 2024.10.0
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, wangmy@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:40:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207037

On Tue, 12 Nov 2024 at 10:25, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{barebox-tools_2024.09.0.bb => barebox-tools_2024.10.0.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-bsp/barebox/{barebox-tools_2024.09.0.bb => barebox-tools_2024.10.0.bb} (93%)
>
> diff --git a/meta/recipes-bsp/barebox/barebox-tools_2024.09.0.bb b/meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb
> similarity index 93%
> rename from meta/recipes-bsp/barebox/barebox-tools_2024.09.0.bb
> rename to meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb
> index 13a308b3da..386656f7ad 100644
> --- a/meta/recipes-bsp/barebox/barebox-tools_2024.09.0.bb
> +++ b/meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
>  DEPENDS = "bison-native flex-native libusb1"
>
>  SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
> -SRC_URI[sha256sum] = "4d4ea7e232aeba2b3cb9ccf0dbf8cd8e01c65b6c615f64c3bd0c4f24f23a47da"
> +SRC_URI[sha256sum] = "955b20bfa7358732d2c0c09ccfd4c1a69087b7e2c610b16dee7442d71a5af88d"

Main barebox recipe needs to be updated at the same time.

I think we need to put SRC_URI items into a shared .inc file,
otherwise people will easily forget about this, and update one recipe
but not the other.

Alex

