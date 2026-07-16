Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A5BC44512
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 17:08:30 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49.1784221705905779274
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 10:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=J+xLyfoB;
 spf=pass (domain: smile.fr, ip: 209.85.208.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69a5ecbbfb2so5996986a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 10:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784221704; x=1784826504; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ISNUxurZR8LJn/NmDZc0WiYtUIu1Po+UNXVPNuuLwkk=;
        b=J+xLyfoBA/fCb/c2k3ynpJHD/7XvPZzn+SyZsGdJ+CXbq3Aj/DVhhOrgDd4e4AccTt
         MxY8JDYJiPwkAzzI7/jU01Mlc2nMVSpKsiebtTGPnsDf8tsB054HVvimDw1uW9kUWDhK
         TyDejLFXx1y0AvXtPJEdHCqJHMbzqfikW5reA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784221704; x=1784826504;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ISNUxurZR8LJn/NmDZc0WiYtUIu1Po+UNXVPNuuLwkk=;
        b=iH1GQAWEQGuZ7d38IHX5xC+tYi2kq/lQ9kSmUMToGxhPCuef1zKkJSNqLH2up9+kq6
         MxCdcPr4itpcGNYfJSNSwT3yCoJe39JBqSw6Js5Uojl2dHxYXX8ZtDY7zjkwdbl0Tvx9
         yc6zyFF+q5JftMZIZQpOOlh9J7C7RXA97io5OoCv4xiT5m0HvsDYr8Vkkfr6n7wWtcBp
         8Ka1k0cKQO3TzdWxbhSrH2Toznef5dBrfrM4n+Jfwt2nEc74jkUDBdTyZ+x94Yqx+HE/
         wE8Yl09bL2WPaKQMliuvbjstXpBZwLjWYCoee2wqGn20lGtNKZJrOzyVS5VbbhVWiHTw
         i77g==
X-Gm-Message-State: AOJu0YzqHI81yT4a9tzbO0B6EFqjvfVd7ZIGkk/qRNKmhnZnEhtzMcM1
	4pLQhgBTZrj8kSPNbbDVOR84xaqTEmCygKh4tXKikBynB6TE2+ZZQSMzA+vJD1uvz2U=
X-Gm-Gg: AfdE7cnf37zXuDPCW+my22Tf0OPQHoeTfk1/82p3L5PtQ0i9FtTwPQ4ph6L0x1F5W+e
	QQOg4IQDB9fd9XOUNJo8uzH7zFLLCGwualN8l+qkaZyAgiYzhLJmPSBSbllNEfrfzMPMNC0iZN+
	VZkMSxyCdXxF3953ecRJD+0Tt0abGtvG3gw8cWIENUd+kmpt20F6x8r2BybsuSkE9js+3Gxk4pg
	Wec/cj6oBvBx+q1eEHicNVkE6XPykIBAb6W3rw3wOjLVqZPmm+3c1NiEoffGyBDA/vPQi+Zlvr+
	EJOhEEAi+6eaKQick3ALtuNwLOWvT4E3fC4geFpqRhGod4fK7/8aNVLBYJMxRyReYnN1YGmUqYN
	tJu/zDbBSLKe3b9lbnUUzkfA5ZpvblSshYlQd0Jk+Noz6jTVUUCrzCwLAacjiTPcDaxywRgStYx
	PewkDPlSfPnppQBErXiRFtpdkD81oAuXjv8/EWQ4+71BXFWriW2ZAtVYA6D/iFGM1v
X-Received: by 2002:a17:907:787:b0:c12:b31:a1c1 with SMTP id a640c23a62f3a-c161e627235mr1123370766b.1.1784221703792;
        Thu, 16 Jul 2026 10:08:23 -0700 (PDT)
Received: from localhost (2a02-8440-751b-c5c5-5a66-aad1-e061-9e75.rev.sfr.net. [2a02:8440:751b:c5c5:5a66:aad1:e061:9e75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168749d7e8sm240999866b.54.2026.07.16.10.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:08:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 19:08:21 +0200
Message-Id: <DK05T1YBIVAY.6B2L4BKB3HAF@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH] lib/oe/patch: avoid duplicated "From:" in
 generated patches
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260710185207.3999639-2-yoann.congal@smile.fr>
 <CANNYZj8SEdTeTZDr5dyQfMxQ5cm_3CcXEc_5Vs22tYMP5Tb8Og@mail.gmail.com>
In-Reply-To: <CANNYZj8SEdTeTZDr5dyQfMxQ5cm_3CcXEc_5Vs22tYMP5Tb8Og@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 17:08:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241100

On Mon Jul 13, 2026 at 2:59 PM CEST, Alexander Kanavin wrote:
> On Fri, 10 Jul 2026 at 20:52, Yoann Congal via lists.openembedded.org
> <yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:
>> With this configuration, devtool generated patches look like:
>> |From 4457b9d7805551e6b35efa25f998b63901d4bf86 Mon Sep 17 00:00:00 2001
>> |From: Yoann Congal <yoann.congal@smile.fr>
>> |Subject: [PATCH] Add a new line
>> |
>> |From: Original Author <author@example.org>
>> |
>> |[rest of the patch]
>> Notice the duplicated "From:" header.
>>
>> To fix the double "From:" header, use the --no-from option for
>> git-format-patch to override this configuration and generate only one
>> "From: Original Author <...>" header.
>
> I don't understand. Why is the above problematic and why does it need fix=
ing?
>
> Alex

Hello Alex,

I really don't like this double "From:" header and I manually remove it
every time I (re)generate a patch with devtool.

I admit this is a matter of taste and that the problem only appears in
my configuration (it seems).

I won't mind is this patch is dropped, but, on the other hand it only
does force the default (--no-from)

Regards,
--=20
Yoann Congal
Smile ECS


