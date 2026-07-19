Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1872C44512
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 09:06:39 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2412.1784451990550924339
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 02:06:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dNghsgl+;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so6634486f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 02:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784451989; x=1785056789; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=56FJnoVWSSSGEotmPpfJ2J3ISb2SQ3kptKtGNmG/jJs=;
        b=dNghsgl+a8VJAwqWz7nWY68e61/r7ciHOG6/H989oMWmro5uQCbSRYONtXVrOi9tRF
         PfwRSr5+5UqR4OhXb6aHo8JpZuVnrTieRUsQI/XJVkx7uKf+Nac7w35CQxEb3wjfGxDi
         EwsAXpH3+OXY2bebpr8YmcFrgoo6YnEAi0Xq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784451989; x=1785056789;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56FJnoVWSSSGEotmPpfJ2J3ISb2SQ3kptKtGNmG/jJs=;
        b=ZCuhNQzwFzbbLCyjA77/OY1e1G830e+oWMfQV448r24k0+x9ZbxICTzVFOTmf0QmEW
         FuWTNk7vgpGSpIStmGkS/9Rw6l3iEr6fry0pEgakYUI19YaZrvXYsms/2xbfYsNjqzV7
         FJZBAn5G6xE8dKaUQDT9plkeB6vztgMoEpuWLuQMerJoU02EGKJG4AFDaGKv5TC0p/2k
         ErdpqlJKjoxDtkkQ24BBLOIKcAruiubp9kRCiCkj2wvzN80PVePnu1iDjducXKoeQe4w
         X2xoPE4ms5nmAevPEE1uT3N2j8ScI0eqtd2nC55DHhF/021ddNKnkOnGs398J/ZA+GBI
         WqGg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/fU0pbIlFUBKBXHs1y01YBlNwtStWse4p2ztHTPmHBbR+nfRTJSpeEWfdq4bXxxuVp/vPI40C0nnnRXrQnTgXvw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxrJdxUaYPU/F9MWqDimvM/Y39+gVslizspEFu8ge053cwK6Y5Q
	iTpuPi1OQKWWClViBWu1pY61FRMtcqSFiAGvIi0WLlWmiZ2yv3RhH9B4Fh58caRXUTU=
X-Gm-Gg: AfdE7clp6zWNo0DDYjANSpXW9ddlzntEhSdntxeYpahhKeu7ZYuh+hK2E9b/iopmJaC
	Tn1BaQCswjBkvS8aJK9fGyQ4LrMuRqsUdk9BRG+nPVIHzujXr08jj3HyZ9nOPEt9ZwR85hU/1Qu
	+npZocDHw+I1a/uwfw7R5qgeEsTCUXY1SK03V2KcHgAjmnJ+G1OTDoIvZidi3pjgZFK9+Uw8S1R
	gN4NTPr3BdPmnJK+JwcPan4ztbbyUuslMe3oBDeBqU0f/9/Z3+kEu6Evrv4nAN1e3aXuC0GD2f1
	WS4psuV1WsoPksTTGF8k8thvyQRa/X3o8CHBkxhesTcpacS6a35TzIypsv3M2Cd7UOG2NRBwKHi
	xoDvcIdXIvweQ+SBi/u0MtTCuCmZ73Cq6veC5UsKSs6FrEaMkL46fyDvjmBTvenx4uSnORnzkXb
	S6skyqv+mnt2FQ4tF4w8AphfiohhI+UOvRBQ/5AapPcP2eIN2HGsLtZ6ln6g12WWJN+uKfWCfOt
	gCdMg==
X-Received: by 2002:a5d:64e1:0:b0:47f:6ed1:1fed with SMTP id ffacd0b85a97d-47f6ed1227bmr4936773f8f.15.1784451988669;
        Sun, 19 Jul 2026 02:06:28 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49ab8sm20322077f8f.5.2026.07.19.02.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 02:06:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 11:06:28 +0200
Message-Id: <DK2FFQBSC7HA.15XI81YMBOZY@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] binutils: Add CVE-2025-69646 to
 "CVE:" tag
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Sundeep.Kokkonda@windriver.com>
To: <paul@pbarker.dev>, <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260706090659.2543025-1-Harish.Sadineni@windriver.com>
 <d9b4dfb530a0898fd230ad6da09ee7bf90dd063a.camel@pbarker.dev>
In-Reply-To: <d9b4dfb530a0898fd230ad6da09ee7bf90dd063a.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 09:06:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241279

On Tue Jul 14, 2026 at 2:53 PM CEST, Paul Barker via lists.openembedded.org=
 wrote:
> On Mon, 2026-07-06 at 02:06 -0700, Harish.Sadineni@windriver.com wrote:
>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>=20
>> CVE-2025-69648 was marked as a duplicate of CVE-2025-69646. The
>> existing patch already fixes the issue associated with both CVEs.
>
> Hi Harish,
>
> Where was this marked as a duplicate? We need a link to some evidence of
> this, or at least a more thorough explanation.

Hello,

FYI, when reviewing this I took the fact that both NVD entries[0][1] point =
to the
same patch[2] as proof of duplication (albeit weak).

[0]: https://nvd.nist.gov/vuln/detail/CVE-2025-69648
[1]: https://nvd.nist.gov/vuln/detail/CVE-2025-69646
[2]: https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D598704a=
00cbac5e85c2bedd363357b5bf6fcee33

Regards,
--=20
Yoann Congal
Smile ECS


