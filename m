Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D603DEEC2AA
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 22:50:35 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7670.1771887030452660087
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 14:50:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uxyqp6iW;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-483487335c2so44866425e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 14:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771887029; x=1772491829; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcRtpbLKa0iPEd29OjMdsntd8VclZ+tCBH6u2RYRW18=;
        b=uxyqp6iWrfuDNR6ZHDRVK7HEZCIQ6awlmbqFw4UTw1jtcygABDmM52ApNkEjnz8ICE
         xserif+2lf0GN+z0mGYwcNgIAMx3of5Z07KGP+nqB6sRSSPbXMxQKKV8cvV2bw6XZ4lw
         lnaMPwkGNmo0+/kekbgobGvBJyEC2WuxfnlDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771887029; x=1772491829;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gcRtpbLKa0iPEd29OjMdsntd8VclZ+tCBH6u2RYRW18=;
        b=aekjkYJcAz/UyA4Vw6jisYVULqIrZLNLoUYCogafZvS/KT6houX12syfNa3usau3r2
         3Vc/l3J3ITyneglt04znhzc52dXErkwi3NWVk/+mb5Bwmrr2zkQBh8xAVOj/dUlhSAf7
         lAS30OPPVbbpjhLGK4TTef85H5wj/oCo2Bi0xj6eMQvOvqAvDriTuaZBh9vi0N+c7TgC
         ndrwK4j67JNxSDalDb9Bkgm2+k9v7KSfTBQoMEgmQbuSE7ZUV3h6j5r+D6dahfGbt19b
         6CbdauBgGMR0j1IqFH2hYFA2aS9Oz3O60ChWYsaUujPYATcDJaRu7q3h1CVtju/eIsba
         DUrw==
X-Forwarded-Encrypted: i=1; AJvYcCXN+4+ZngRjnT0Z1qStI8Zh72KZIOZf97/3wkjjAr8szN5v2WR+d75DRldQvkWtOY9KFfY9OljAs4DEFeb8B8tU7g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzoD6m+nDXVdbkfHtSBHlD0CPn+lYcOoPfwB3Sggtx2U+4w9MaA
	o9yjEDEQF0SCI878i3dTEKO02T2nQJ2IYj/u+MwPbRSka99qvw1x5ngGemrZul8PQXc=
X-Gm-Gg: AZuq6aL9Tm2zhj73QbJHDwmmCIwGUcbg58SEQCqlsq4YN6bRpOrY2XtR3NVw5dziPr9
	XVd0O8mdx7WdFHFOoHoYjjh4iG4qScOTAlu+IJHsbEvKwsTUTbiMEEQr6/mDlZ5SSm4uogl7Y9x
	aVPJ/TbQWqfMObC3KccE6RpAbWhgJr33WxNMBMrULgPUvOahIcpEjEFaK+Ru9hmd7HhnUwJ4J+e
	hBe6nFuDld2zNfP/C0qTtrNIJGSCDtyOp8WaXKRgx8OZfxLTVv8S4HTYoB4b7cg6a7ExO3/PbNN
	zEyM6DDrVd6Zk0LrQKChMj3pWjcJForZ7/08K4y5Zb6NMNJr9Q2gqrOCUeSImVctgh/dN7xAtX/
	CmxH4B1qt2Cdsny52vBSNXe9wzNM66X/POMVg3aN5Sl0tv/F8XBOUjDfh7if+tZwcFSJvt4TMqh
	+vECWlNUijaaNjeszSV2ch3aFHPWMwd1lJ60YyhMVRAJ3fC4KoukgqZd4BW+Od3adQx9mUWxi7Y
	wV1yXuXvFSB31OYnr6JGbzm1g==
X-Received: by 2002:a05:600c:c4ac:b0:483:7ce6:1efb with SMTP id 5b1f17b1804b1-483a95e252amr158049065e9.17.1771887028816;
        Mon, 23 Feb 2026 14:50:28 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9cab38dsm196637735e9.9.2026.02.23.14.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 14:50:28 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 23:50:27 +0100
Message-Id: <DGMPJ3BWJ6O1.3RS9M09ZOWHA0@smile.fr>
Subject: Re: [OE-core][kirkstone][PATCH] libpng: patch CVE-2026-25646
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <189524AD92992BAB.219417@lists.openembedded.org>
 <AS1PR10MB56979A3CF496D0DDF3C4EE68FD77A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56979A3CF496D0DDF3C4EE68FD77A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 22:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231716

On Mon Feb 23, 2026 at 6:58 PM CET, Peter Marko wrote:
>> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/reci=
pes-
>> multimedia/libpng/libpng_1.6.39.bb
>> index c4347a6715..448594e0d7 100644
>> --- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
>> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
>> @@ -24,6 +24,7 @@ SRC_URI =3D "\
>>             file://CVE-2025-66293-02.patch \
>>             file://CVE-2026-22695.patch \
>>             file://CVE-2026-22801.patch \
>
> Looking at the stable/kirkstone-nut branch, this patch was applied withou=
t the two above.
> So there needed to be conflict resolution, which is usually a no-go for a=
ccepting patches.
> I'm wondering if I should resend those 2 on top of the third (and revert =
patch order) or if all 3 patches can be re-applied in correct order.

Hello,

This -nut branch was not finished. I had the 2 other libpng patches
queued to review. But I admit the order was wrong. Sorry.

I've refreshed my local branch with your 3 libpng patches in order.

Thanks!

Regards,

>
> Peter
>
>> +           file://CVE-2026-25646.patch \
>>  "
>>=20
>>  SRC_URI[sha256sum] =3D
>> "1f4696ce70b4ee5f85f1e1623dc1229b210029fa4b7aee573df3e2ba7b036937"
--=20
Yoann Congal
Smile ECS


