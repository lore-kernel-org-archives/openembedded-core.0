Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379B5EFD23F
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 19:04:25 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52934.1772046262581491744
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 11:04:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MQN+dg9P;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ab46931cf1so8487245ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 11:04:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772046262; cv=none;
        d=google.com; s=arc-20240605;
        b=eiON+wK1cLbRk8fligqLWiQwdGmvoSNTe7TzwtH64j9F4z31aIH6IPkrG3fxk5vQPI
         iwcZuivT2jnOLsRfBAogebtYp6i5gO4ghDK5hkpuWSyZi3C/iovqvSSY+KFtokWdpR/i
         xfODyFV5949xVr3usLLRsv456ij4SerrgI5RE2g2rAC5p/MyvCg52KjdG87dyKh3w25f
         qYtou1b9cxtBN/wSN8NLWRm+3/EW7xhmIlQMUDPke5v7exDYBHJXloZDjiIjSOiXR5v1
         yun23spFXUtK7N9LOsUpFBpm8mL9ruGCSvc2TECAiQ5RTUhyypO4zP0ouM8xWaLvwjwg
         SOcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7fNoppm3boMX5LeJwXeQNO/e5/Wdpjrm+9/EsaFYa7w=;
        fh=5bv8BPgw4MVSQZEFQVlQvVgxAorQ3pW+BmClllOR8O8=;
        b=YjidTPyCeXfkguq+CR6Gvfej6ayf+Ckzx0XCHGoh8eRZAuH55ERX5qTPlIzzI2rE+c
         pHFgBva9onfECvhYr60vYMKRdICWGbDy/tC7oPEXE95TgUUYgZa02+ib2NYHiXT5Gepp
         WN4choyuKdim86W0zqiS1q9e4XIwLtKyL6FlUP0d4jfeSFnIa8LWFtLV267Sgi2H4TxA
         6XMdvQebd9Ps3blxkdTQSbNX7OyYkUFoZ4gSQly8kc+InRjZ3Teupjpy8P229b3DVLFs
         F48QH0BJmqSgkTc2eE23FGwBCDp+CMGwb5aqcUJ1XrniwjxWxtRKsgZaH5BITSVx0y+b
         e0kw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772046262; x=1772651062; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fNoppm3boMX5LeJwXeQNO/e5/Wdpjrm+9/EsaFYa7w=;
        b=MQN+dg9PL3JNg3rEqklswbz3cRGy+f8yiKQ+6idy0WW3YZ410OUp9zYom1stxL/NUc
         7evmqpHoTS9IeLrQPI6gkZkaqVja4ZZh6n/+h2N8+pTWPnwcZ3ENu+J3URM+anex0G3K
         QMj2MB5wv+FX9W9wuPqvyY+OJZO0+hYA7FHFBV18tbTk8P0Yub2EznUQb01R4ZUJx5Fc
         Hu8PDEIT8IgwxMy/O9Nsxnl6oZPu4tsZv8pC6Z7HDyoFuwWwP6OUfTPEC5uOyz9VQ6C2
         /9pbAG/HJoY7pqCmEt3hiAO7QhyTERVnGqwpBlcF7OS3RbqucigTqCKBVgaBnmjLYg/n
         jhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772046262; x=1772651062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7fNoppm3boMX5LeJwXeQNO/e5/Wdpjrm+9/EsaFYa7w=;
        b=Ocrni8wvv64xJkrIK8vS4ptKyQ9jl9PLF7uLZfCu80pXR2sAkUDbf6VUrrGEoLuuyI
         MW7YJ+ht3rVV9oJTv9a0oLd/gD3UBycny4wgr4iC0pEwy4+XDSXim4FkMXACTowpcZSg
         hliCMigun3d5gQpfvr2EPtji9pxBdTSHJwNksv+j+79WrMb/xiBs1IqAEi/xCbSJ/qdh
         Yk3NEjWg45PVCjmX7nw5ZHIVlGDPWuZ1zkuurZuUWDiepqXvG2RUlOYa4NwO5DrSvC39
         AFHtqBWgUrEIf/QEbd8EvoQrDTZuH7N3A/bE1329IOq0/0mheR3mQEduzqlqxTcyHM2O
         oM9g==
X-Forwarded-Encrypted: i=1; AJvYcCW/rgggNuvhspevjN1QXBl4lWUo1a5RAPNSK8RtOR09QRAbukGOF6KLQwP4epYOeklUpaT07xRO9BKANDrMGB6Lcg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywhk/EC4DL9n3baoQ/zRnixIrizhNbPP3drwk2Cln64inqbfYDB
	bSdq5Nk3NouTW4VS3RGKQ43B45XhgG0TbwO2Oo+1AJswf1+pEQeoxNb/elGXn7IZXnNa89/5W3q
	UTV9qaVRja6+aYCxygSu+aay3aAPf+wY=
X-Gm-Gg: ATEYQzyCnNU3GXXDF7Xeh2tTDQ6ZSLGl0qwR/T25A9Y6BJtr+wB2BGjLffiXqt6PvTc
	wwMsEsCG90PZCyBx3dIP2gg1lp7Lrlg3XXiuafY9QRm7KF/GGkwd4DIDKxgV46z4FEMsUOfcZlS
	ix0ssdD7eKoe1Y4loCnkCUKQzultgSAW7pvRJ9Z4FalH5L5tiqeXkLCqQRd9T9rn9Kl8yjtI2El
	nNIp6s4HKI2+Wp891pubC+pVdsUEVUfybSjqj077sTmghWedENjUQeoH0uYJ2j7A5MiSBKM+TIS
	jx3b72D3
X-Received: by 2002:a17:90b:4b45:b0:356:26c5:aaa9 with SMTP id
 98e67ed59e1d1-359385bca0emr109302a91.2.1772046261843; Wed, 25 Feb 2026
 11:04:21 -0800 (PST)
MIME-Version: 1.0
References: <1e6175f982bbd141fcc156113aa6e798a3120bdc.camel@pbarker.dev>
In-Reply-To: <1e6175f982bbd141fcc156113aa6e798a3120bdc.camel@pbarker.dev>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 26 Feb 2026 08:04:10 +1300
X-Gm-Features: AaiRm518bPh4i0lWnYslSupkGjePVAg2ZfinOcD878Og-Lbl4bxX_2L-GqxataM
Message-ID: <CADySD0E453dOBSSqzZYFGHcPTvryx3OEP9TUEADcnraECrWEPw@mail.gmail.com>
Subject: Re: [OE-core] Recipes which should always be upgraded on stable branches
To: paul@pbarker.dev
Cc: Yoann Congal <yoann.congal@smile.fr>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"openembedded-architecture@lists.openembedded.org" <openembedded-architecture@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 19:04:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231974

On Thu, Feb 26, 2026 at 6:44=E2=80=AFAM Paul Barker via lists.openembedded.=
org
<paul=3Dpbarker.dev@lists.openembedded.org> wrote:
>
> Hi all,
>
> I've been briefly discussing stable branch update policy with Yoann.
> There's a few recipes in openembedded-core which I would like to propose
> that we always update to the latest version on LTS and stable branches.
> These are recipes typically providing data that is expected to change
> over time, with little or no code.
>
> You could say ca-certificates is already covered by the fact that
> security fixes are acceptable for example, but a clearer policy would be
> better.
>
> Any policy change will go to the TSC for approval, the goal here is to
> get some review and input so that a concrete proposal can be put
> forward.
>
> The recipes that come to my mind are:
>
> - ca-certificates: To allow access to HTTPS resources we need to keep
>   these up-to-date.
>
>     - Keeping this up-to-date is common practice in other distros.
>
> - tzdata: To stay up to date with timezone or daylight savings changes.
>
>     - Debian takes upgrades to this on stable branches
>       (see https://tracker.debian.org/pkg/tzdata).
>
> - mobile-broadband-provider-info: To stay up to date with provider
>   changes.
>
>     - The README file for this project says "The Package contains only
>       informational files so it's safe for distributions to grab updates
>       even during feature freeze and maintenance stages."
>
> What opinions do other folks have?

In favor of this.

> Are there any other recipes we should include in this list?

Also suggest to include wireless-regdb in the list.

> Best regards,
>
> --
> Paul Barker
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#231972): https://lists.openembedded.org/g/openembedde=
d-core/message/231972
> Mute This Topic: https://lists.openembedded.org/mt/117998482/3619737
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
kur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

