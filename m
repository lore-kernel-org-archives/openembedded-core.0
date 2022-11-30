Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9204BC352A1
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 11:40:43 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.8808.1669808435018291578
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 03:40:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eEVS/Tfk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id f18so4567094wrj.5
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 03:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yyUCTTFwu0CqsdHr/GxI3/8SoL2aZd5m+HpWQZpOO/A=;
        b=eEVS/TfkCiak74BKFQc9ol7aTX+QyN+6BcIzw8toOFeloBi0jgEXnHkclyWnnGZ9ky
         NucHbJ+qccHMnrLIetC7dtQtP3Aio31GELWY9vg9o1Chom4erhZaxh8ni/rFecvk5Dg0
         PTIxxpI6XnDaXxzmVdfevjb7ILWJ6B+1i8hKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yyUCTTFwu0CqsdHr/GxI3/8SoL2aZd5m+HpWQZpOO/A=;
        b=xerbtjg+hOpWv0xEjqA2PwweTzkBNsXserBHdhJWkSJMZIn1+wXw4cnVbBUqG3fENm
         kO8L8OoVQbEBuSAppDX2yVmz/umBPcST1EkzD8XhSaxZQ4Eshzaycq5ckO7znu8OMFya
         rZAXm9b7NkDxDeJf81gcz551kt22vwSHVCAMzewBK32NGaTWEujVi8TYBp192I0jHZsS
         nuVtSklQ4B8wFtpT4Ue9MX0MLfVC14gp1WjGxaslO3s6LtAF0pRA7UAYbCGyBi0BvVc1
         3zQV6x+7qNfp3jPumNL2l5Qp3Ie9d/8wBGsr+iYkYcjus4jrVVVOo6tXsIheT0RFKEc8
         rKaA==
X-Gm-Message-State: ANoB5plRgsWzvDfYeHDgVptHqO3c1tmImHssXBsDd4FjCZSa3A62rFH5
	26qAUVnUQoqxoHk15/I5lDLrGg==
X-Google-Smtp-Source: AA0mqf6++BaQCHwmE1lnb0MepX5DqhJFUghnaFLqYIJK8qC4mw0LiuFoUGQS9lHUmsvRYf6rupzWlg==
X-Received: by 2002:adf:ee8a:0:b0:242:2d:c679 with SMTP id b10-20020adfee8a000000b00242002dc679mr17699312wro.369.1669808433183;
        Wed, 30 Nov 2022 03:40:33 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d673:1517:32d1:98? ([2001:8b0:aba:5f3c:d673:1517:32d1:98])
        by smtp.gmail.com with ESMTPSA id w6-20020a5d6806000000b0022e36c1113fsm1251706wru.13.2022.11.30.03.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 03:40:32 -0800 (PST)
Message-ID: <17e9291975095d514ca0a06f09c1c5d30909113e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [yocto] Y2038 proposal
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexandre.belloni@bootlin.com, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-architecture
	 <openembedded-architecture@lists.openembedded.org>, Yocto-mailing-list
	 <yocto@lists.yoctoproject.org>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2022 11:40:30 +0000
In-Reply-To: <Y4c4UBryAjx5t2gl@mail.local>
References: <0b6801d90409$885d6860$99183920$@gmail.com>
	 <CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
	 <Y4c4UBryAjx5t2gl@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 11:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174002

On Wed, 2022-11-30 at 12:02 +0100, Alexandre Belloni via
lists.openembedded.org wrote:
> On 30/11/2022 09:07:50+0100, Alexander Kanavin wrote:
> > On Tue, 29 Nov 2022 at 16:45, Stephen Jolley <sjolley.yp.pm@gmail.com> =
wrote:
> > > We=E2=80=99d welcome a proposal/series on how to move forward with th=
e Y2038 work for 32 bit platforms.
> >=20
> > I have the following proposal:
> >=20
> > 1. A branch is made where:
> > a. "-D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64" is enabled globally.
> > b. qemu is always started with "-rtc base=3D2040-01-01", simulating
> > Y2038 actually occurring.
> > c. an additional runtime test verifies that both RTC clock and system
> > clock report 2040.
> >=20
> > 2. This branch is run through a-full on the autobuilder. Any uncovered
> > issues are filed as bugs.
> >=20
>=20
> I ran a-full with "-D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64" last week,=
 it
> didn't go too well gcc-sanitizer and pulseaudio being the main offenders
> but buildtools needs to be investigated.

What is the potential issue with builtools?

> > 3. Once *all* of the bugs are addressed, repeat point 2.
> >=20
> > 4. Once there are no more open bugs, 1a is merged into master.
> >=20
> > Any fatal flaws in the plan?
> >=20
> > It's not hard to see that Y2038 problem is real and serious, e.g. on
> > qemux86 core-image-full-cmdline built from master:
> >=20
> > root@qemux86:~# ls /
> > bin  boot  dev    etc  home  lib    lost+found  media  mnt    proc
> > run  sbin  sys  tmp  usr    var
> > root@qemux86:~# date -s "2040-01-01"
> > Sun Jan  1 00:00:00 UTC 2040
> > root@qemux86:~# ls /
> > bin  boot  dev    etc  home  lib    lost+found  media  mnt    proc
> > run  sbin  sys  tmp  usr    var
> > root@qemux86:~# ls /
> > -sh: ls: command not found
> >=20
> > On qemux86_64 the same sequence works as expected, of course.
> >=20
>=20
> The main issue with the plan is that we are not running tests on 32
> qemu anymore.

To be clear, we don't run ptests on 32 bit targets, only on qemux86-64
and qemuarm64 where we have KVM available. We do run image, sdk and
eSDK tests on our supported qemu targets, 32 and 64 bit.

Cheers,

Richard

