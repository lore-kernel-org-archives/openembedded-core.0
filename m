Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1DFEC1114
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 17:04:57 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40129.1771866290172961323
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 09:04:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=URH4/0bo;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4833115090dso43843805e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 09:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771866288; x=1772471088; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5Vx8FoZaqGTT8bfytWzWQihPdXisJUCMC9JbGAUQdE=;
        b=URH4/0bonbhaRovJ/FI5yUERPz8UPyUdiP8KIy2geFhrCkO+FvLCiiIQqR1YWt1nc5
         qaUNjL17nipq8tjXYBiIKolnBFg3iCYOi3go/XdlYXc4E2q6tGLQBk8MnLcKf8XqncXd
         3kg0h1lxBcqePjR0/wTHKDY6umIbt+3bFGIlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771866288; x=1772471088;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g5Vx8FoZaqGTT8bfytWzWQihPdXisJUCMC9JbGAUQdE=;
        b=d2e1otNCX2hwbgfqALF6WNCVowHCvAAzR1NoXT5xaXKx96maiXjfwy7KnWD4OY7akd
         nJ+5tD64QE/Rj4FsmVcrs5CVWGmUrQAFX+iVZC4FstZ4wF0f5HtbRH5l3DURLRBDJATV
         bLpvn+dT5esSxjkmHKghGlWthHUe8hOQEKwST9zv6dcO116vuM53cwmvQ28VUbeT9kuQ
         Cbt6Cg4IramK2Pj8bgStuwlIOHOl93LjWUM7Yiv0Jhsr4Wez/iFRUKOjvNoK9aZ02Nf9
         4krSUIYkITnG1GeSL7I+02QbW3Vvs9b9Q/y3mcdtrHhXb1nH4iXChZvXpVqB4zJyDrjb
         Ujiw==
X-Forwarded-Encrypted: i=1; AJvYcCVGScxRJJrWMW1rCTSA7DqcedyOkINp6NvVQkaXrj2fAP/KyBs30DRQdf2YXD9skgDqDhfJNgv+T0fFdxP2lxM3YA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyvyNvkhYh1slqED/D8RnTA+BQ0j/tbWNuaaA3gTJLgbWQu44ij
	LA1qkEWcgMd+OS9Mjnj4ayK0Jwoxpeu6yEYsYMVS7U3BiWZRD3UaDC2owGecSGQx50w=
X-Gm-Gg: AZuq6aIII18zNd/2NXXQ1gOGiNPYK8Hh/lz4M5WlSuf6Ynu3Kemi8VmgNUeGCNCN0Cp
	lNbW2X3+OHalAJZ7SQ/aUyt3a99oI9bPc8GvF4+qgCl0IJsGbvGCymHbgwQdW6yP8L+zCnOAZiA
	wKmuvKwK1v78tUAg4461PQtKFSWsjF72Vue6pPXoGKOXiwrbTnionSbpFqpKA0An+ciktpA6w7W
	WoJrk1FFbvmqjOreHPtKfA5l++i8knd10eReo8rn4bCMigqPwnKxBisIwecodC5HMrr7aA8qiJ6
	BqZbjugn4jVPv8DTyN8BJAndAABHfxgrTe/1Vj5tOE4PCwtnIVh5X27UMupPYR2b1G4GYQL+32U
	MZ9QJVOe3LdZ8jYRqqj06rEXTBtx4FRgChShgbeqf8N0j5tANSdSZjSx4MsWAsOIIr6sQfE57Mg
	owJGzFjCCh4DzGsrp8dezkRrIQUKjlvUNzcqVSp3ZhZv77x7mLw2bOgLCRyWYlJ/mFiIhOeBe4H
	N/Cue4/Gb+v5J1L
X-Received: by 2002:a05:600c:4e02:b0:482:ef72:5781 with SMTP id 5b1f17b1804b1-483a95f5843mr162725665e9.25.1771866288263;
        Mon, 23 Feb 2026 09:04:48 -0800 (PST)
Received: from localhost (2a01cb001331aa00f13df544104db802.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:f13d:f544:104d:b802])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b81986cdsm1437095e9.0.2026.02.23.09.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 09:04:47 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 18:04:47 +0100
Message-Id: <DGMI6FDG7CU2.1A5CLEIO7VN88@smile.fr>
Subject: Re: [OE-core] [kirkstone][PATCH] ffmpeg: ignore CVE-2025-25469
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <colin.mcallister@garmin.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260223165403.799551-1-colin.mcallister@garmin.com>
In-Reply-To: <20260223165403.799551-1-colin.mcallister@garmin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 17:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231684

On Mon Feb 23, 2026 at 5:54 PM CET, Colin McAllister via lists.openembedded=
.org wrote:
> Missing free introduced by commit d38fc25 and fixed by commit d5873be.
> The first version tag that contains both commits is in n8.0, so no
> ffmpeg release is vulnerable.
>
> Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
> Change-Id: I91f0aaad8ddcfaa2acac541470aebc9abe88b0d4
Hello,

This was already sent: https://lore.kernel.org/openembedded-core/2026022018=
3454.16315-1-peter.marko@siemens.com/

I'm reviewing the kirkstone patches now, I will send this soon.

And, by the way, please remove the "Change-Id:" line. I guess it's a
by-product of you internal review tool?

Thanks!
> ---
>  meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_5.0.3.bb
> index d64b97e787..eb21cde89a 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
> @@ -105,6 +105,11 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-3341"
>  # bugfix: https://github.com/FFmpeg/FFmpeg/commit/28c83584e8f3cd747c1476=
a74cc2841d3d1fa7f3
>  CVE_CHECK_IGNORE +=3D "CVE-2023-6603"
> =20
> +# Vulnerable code not present in any release
> +# introduced: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/d38fc25519=
cf12a9212dadcba1258fc176ffbade
> +# bugfix: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/d5873be583ada9=
e1fb887e2fe8dcfd4b12e0efcd
> +CVE_CHECK_IGNORE +=3D "CVE-2025-25469"
> +
>  # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/s=
how_bug.cgi?id=3D7717
>  ARM_INSTRUCTION_SET:armv4 =3D "arm"
>  ARM_INSTRUCTION_SET:armv5 =3D "arm"


--=20
Yoann Congal
Smile ECS


