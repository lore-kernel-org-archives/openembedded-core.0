Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F240CC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 15:48:20 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.354.1792079292383313063
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 08:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nsblRRmh;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so564589f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 08:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792079290; x=1792684090; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y1AWpW5lNua+hy198CnSIN0dVyYLvDILb6tEf9PQtgU=;
        b=nsblRRmhMVoy8QZmfwTME6iNEjVLYFYeMSPwWwnMIriU8yAopp1lBcriB75HuOtZJn
         tVau6R+75hLGe3+KwHNfj6kGEEo6JpV9kzBAQV/FQgi7inv1JiRGMxM7pa/O8mg7tESe
         QrM6H9GFXE2A+rVw6/7A2QvMufeBMcFlfGhS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079290; x=1792684090;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y1AWpW5lNua+hy198CnSIN0dVyYLvDILb6tEf9PQtgU=;
        b=Yf1UDfsAJhIBsEWqSrm8GnJ3OEo0b16cX3TAR4vDfHMlkThsfLj2Gb9bDeTy5kdp/B
         qADGSWZYyL2BELhP+33icmFdgJ7JLkMS8AVgA8T4r7qo9Z3Vyy3vgTIUBURuYWUMRyeO
         XYUdgBIrMxI5k1Wee0WIiaVdb0YCwHuxAmKGJZE/48dpLBKvI8heDEezkYw7Sjg5qtk3
         U5FRoiexfZ4gaLlHamxGAUKRTA8XoRNwJTCxuboffo4r3ZmT5Hoxw3aKcAB6NtyB7hVa
         WcObeCGnTWkEObm7xpVEOfneNkQNfdA3O0+PAev7lG8zisBKMgAtWvFKpasNjnC5r+vG
         Sfhw==
X-Gm-Message-State: AFq9FYI2lrhh4+zP5u0FERsOOTnPFJ6vhrD4aQJrEpqdh3Cq/Vb8Fs34
	tbLUy+xfjwyeGUrYU4N7oueSsYSMV8y+u3ZQVK9vvTZyE3eL648FVrkTsBVq/TMwmqg=
X-Gm-Gg: AYBFou3C8pLUr/Vvf5dfjX5IJU/CpzMvtOCxQ/qOrl0BK4trVjUf1ksNjPh4aQLxUI7
	W7uLm7q9p96Zpews4oF0UQ1XnkrjWF/GUB0J5dDo/Xe8oX3OdihFu+Y9Yyj0Kthb7BzKKqaLYy9
	o3WxKCC8bfjMEZAkibOCPDT8bBIlaLem06Az8ZZpGG+x7X0LonuRnyMPOfTrXVBmL/fgDgLWviG
	jFFAW0V/fhCf426GR0qBRJkGgBQZHVcSQI2iTyXA6VqegGzi2042LnZIJM9C8qzjf19Zr04LqkA
	1ViOpwlmtArqwwZaKlaVNsJROI50CYu4qDAyt3a34b7N6CR8aSQ5KY9EpNFZs73M1J1eBVE826p
	rNL755ptLiXgnaUWZBd52zuGRAvKqAT2UPIP94m7qVBXuJJfS4zs6gGIrLf7qUJQdzdcSx5QIae
	OhB4Y5Y+FvP9MEvQojNM0Qjre2Vxxo1bT1spKf4qNjBWNlCCjbhiHN98LI0/j9/wjt3h0qLIJkd
	LylUrMIgnKz8h+pHGRkMY33X34PZ0azeS5F8TceK2VBGJzm9UOYVNUXC8RQrA==
X-Received: by 2002:a05:6000:4694:b0:48d:e101:5707 with SMTP id ffacd0b85a97d-48de1015749mr14145915f8f.13.1792079290427;
        Thu, 15 Oct 2026 08:48:10 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bd733fsm19572621f8f.58.2026.10.15.08.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 08:48:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 17:48:08 +0200
Message-Id: <DM5J37X3OBGX.LF4NUVEN635T@smile.fr>
Subject: Re: Request for linux-yocto 6.18.54 upgrade on wrynose
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>
X-Mailer: aerc 0.20.0
References: <39eccd41-ee64-4500-b28e-6fb364089efa@est.tech>
In-Reply-To: <39eccd41-ee64-4500-b28e-6fb364089efa@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 15:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247889

On Thu Oct 15, 2026 at 2:12 PM CEST, Jaipaul Cheernam wrote:
> Hi Yoann,
>
> I encounter an issue with linux-yocto version 6.18.52 on wrynose with=20
> TUI disabled for perf.
>
> In short due to "e97bd4417010=C2=A0 "perf annotate: Fix build with=20
> NO_SLANG=3D1" commit.
>
> builtin-annotate.c:523: error: too few arguments to function
>
>  =C2=A0 'hist_entry__tui_annotate'; expected 4, have 3
>
>
> Kernel 6.18.54 already fixes this =E2=80=94 it just reverts that bad comm=
it:
>
> 8c3b2bf7f39c7=C2=A0 Revert "perf annotate: Fix build with NO_SLANG=3D1"
>
> But =C2=A0wrynose branch is still =C2=A0on **6.18.52**, which is the brok=
en one.
>
> May I know do we have plans to upgrade wrynose to 6.18.54 ?
>
> Here is 6.18.54 upgrade on master from Bruce.
>
> https://patchwork.yoctoproject.org/project/oe-core/patch/20260929154516.2=
507960-1-bruce.ashfield@gmail.com/

Hello,

I simply missed that backport. Thanks for the reminder, I've added it to
the next wrynose cycle. Expect it in the next 2 weeks.

Regards,
--=20
Yoann Congal
Smile ECS


