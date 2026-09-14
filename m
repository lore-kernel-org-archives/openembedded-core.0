Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C20C88E75
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 13:59:26 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20892.1789394365250703207
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 06:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=j6d7nv7K;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49d05d51553so28356945e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 06:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789394363; x=1789999163; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wsu35VwDBFpmPhlztY5rSfXTrKBSu7M6n4lV0v0FKLE=;
        b=j6d7nv7KGH8txEUGx5ZzH+rYqmhPiv3M5B4urqTIuP+kd7YZL/4+g3j3As9W7cJeOX
         g8t6VKymP6fjXSF/X2gJetWfTjXtYk8mFQO43LJI4XXW04ZR1Z217dygFIQTToADhUPx
         E7ecfwcEy0D4YnHf8Ufs4UWaYHInK9yKvxyx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394363; x=1789999163;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wsu35VwDBFpmPhlztY5rSfXTrKBSu7M6n4lV0v0FKLE=;
        b=BnulQHwIPplR9S8xq54qXAbZTDYyxZa31o7/uykSBtLaAQ9BTzUrxB7i0K7g6zUlkb
         DlnJtczQ9F5wz8MULkZ6q2uytArAdHtA6jgECBjYsoJhC/U2U8huPh/vAD8z2qt00LCs
         RFwBvOyJ0my6dklTGjY+11vzxDsgAB3a0PuePUhDeUK1pHfkPkuAEnySLKzrreuCrgnW
         KKtfj2QNhTI8XXemeQw21BuZfpn29miX6mfT1kyxFQZTcfDNJaVfHd/knOTY9KjgG67l
         aXamQRhbm77H7tFZGyeQluY22e6A2QsbAT5zKEKJQst1lVs9vWjasg3BBEm/WBvwRHEx
         6/og==
X-Forwarded-Encrypted: i=1; AKwUvBy67CbKfHcU2NX2ap0i4fByImFulk7KGaPEb1uhflimHQTBVaaB0gZOKDcoqcM26egvn1LIuC6INZVrEX5OK8Kebw==@lists.openembedded.org
X-Gm-Message-State: AFuF++nr6S+TvXUuQhv8OLhuUs2N4TugSWm9/PhPnSinCw5hlFJgc2zN
	31VQEHZV8YUvL9QhErXaVgza+/FzgholOc8EEERiXZSC9UYGIx43cniqxO2deFBuCug=
X-Gm-Gg: AYBFou11HlAz+PJdA+mOLeuWO19zTkdegy+TlsvUQidQuQP64ROpEsbsKaKtJL348X7
	y4GOicNiAmPSL2qkW1ndgGEr1T7IM3zbjyzkMOEvlD2sDjUiAKsBfr4il32+MVOhaxAUckfO84v
	vKy3AIW3hzd8llVindf4qL660G3ema60SmL/+4rrDt4DTUaVSsv/Nz0sDnoMIKW74R7v7ruJT/Q
	O8nQvGc0SG8TUFiL1ZrdMFIweo0/WE3AZDvAA5OP2YV7kN7zYlxm6VgGvrTxXlRXoVGvJCbbM36
	7DJ8pNalC2P0T8YvYkSfy0/WZ2aRz2UBT1ntQ0fHciGBtka6ue69mDDOzELkpkWyx6tOVFe5Nw9
	OHizWMafJXOWbgsHi6p0ee9s0gPymI6FyUm6od44lWIT5QVODbGQFaJxyISNRvUCbZqZBiK81ec
	WbvUFYFNN8cK6tfUwgGwjdTw6PYsDpZqjOehFUM+1UGsAo2l33aQlMUvoOaFfRexn9RSUGxr1pE
	oRY3Zao7MWLJCUneeUlIF/RKTxA4POJWe0dGOKnfeP0kMJkFEF9c8gmpk2rt36KQ9g3wb4yOg==
X-Received: by 2002:a05:600c:34d0:b0:49d:1f10:8b9f with SMTP id 5b1f17b1804b1-49e7a63a711mr35009715e9.7.1789394363416;
        Mon, 14 Sep 2026 06:59:23 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6a06cfb8sm244846295e9.5.2026.09.14.06.59.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 06:59:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 15:59:22 +0200
Message-Id: <DLF3D1TQYEH3.1WL2709WMDGWC@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Richard Purdie" <richard.purdie@linuxfoundation.org>, "Benjamin Robin"
 <benjamin.robin@bootlin.com>, "Ross Burton" <ross.burton@arm.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "Paul Barker"
 <paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [wrynose][RFC PATCH 00/11] sbom-cve-check update
X-Mailer: aerc 0.20.0
References: <20260808105147.42294-1-peter.marko@siemens.com>
 <2edd57716d5a827ffe58d9001323098a045be7a6.camel@pbarker.dev>
 <AS8PR10MB50733F9D2630FC2F6FD62694FDBD2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB50733F9D2630FC2F6FD62694FDBD2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 13:59:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245782

On Sat Sep 12, 2026 at 4:40 PM CEST, Peter Marko wrote:
> Hello Paul,
>
> Since this was accepted within TSC, can this be picked to wrynose now?
> Or do I have to resend this series without RFC prefix?

Hello,

I will take the series into review like this.
No need to resend.

Thanks!

>
> Thanks,
>   Peter
>
>> -----Original Message-----
>> From: Paul Barker <paul@pbarker.dev>
>> Sent: Thursday, August 13, 2026 1:46 PM
>> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
>> openembedded-core@lists.openembedded.org
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>; Benjamin Robin
>> <benjamin.robin@bootlin.com>; Yoann Congal <yoann.congal@smile.fr>; Ross
>> Burton <ross.burton@arm.com>
>> Subject: Re: [wrynose][RFC PATCH 00/11] sbom-cve-check update
>>=20
>> On Sat, 2026-08-08 at 12:51 +0200, Peter Marko wrote:
>> > This series updates sbom-cve-check tooling in wrynose to current maste=
r.
>> > Unfortunately it shows that having cve-check tooling in upstream
>> > components violates LTS patch acceptance policies.
>> >
>> > In this case the most visible is python3-shacl2code (1.0.1 -> 1.1.0),
>> > but also sbom-cve-check-update-nvd-native introduces new features
>> > (which is actually the reason why this upgrade is wanted).
>> > For now this should not be a big issue as all the dependencies are ver=
y
>> > new and used exclusively in cve-check, however by time they may be use=
d
>> > in other recipes or tooling, too.
>> >
>> > So I am sending this series as RFC to discuss future of CVE checking o=
n
>> > LTS branches.
>> > * should we go with this series as is (possibly updating policy text)?
>> > * or are we stuck with old code for next 3.5 years?
>> > * or separate the tooling to meta-sbom-cve-check which would only have
>> >   master branch to service all currently supported releases?
>> > * or create mixins layer (to be also used by AB cve-metrics jobs)?
>> > * or are there some other suggestions how to rework this series?
>> >
>> > My preference would be to have cve-check aligned for all supported
>> > releases (even scarthgap), so I would welcome opinions and discussion
>> > on this topic.
>> >
>> > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > Cc: Benjamin Robin <benjamin.robin@bootlin.com>
>> > Cc: Yoann Congal <yoann.congal@smile.fr>
>> > Cc: Paul Barker <paul@pbarker.dev>
>> > Cc: Ross Burton <ross.burton@arm.com>
>>=20
>> Hi Peter,
>>=20
>> The TSC has discussed this series and is happy for sbom-cve-check to be
>> updated on wrynose. It's in line with the expectations we had when
>> wrynose was released, and the upstream maintainer is involved.
>>=20
>> For scarthgap it's a different question. That still has the
>> cve-check.bbclass implementation instead of sbom-cve-check, this would
>> be whole new framework rather than a set of updates. I wonder if this
>> can be handled via an LTS mixin layer instead of a backport in OE-core?
>>=20
>> Best regards,
>>=20
>> --
>> Paul Barker


--=20
Yoann Congal
Smile ECS


