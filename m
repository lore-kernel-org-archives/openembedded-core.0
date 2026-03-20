Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 653D7108B8EB
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 10:13:57 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9454.1774001631637367490
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 03:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0CFh9IlF;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486fb112c09so3289695e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 03:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774001630; x=1774606430; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X00CXbZ/IfbcWLefSY86WcnvseoJr7XDjrw3gSx/LD8=;
        b=0CFh9IlFEAzOkOJIEypl4bbc46zENgXfV3I8vFL/z0LSnwiUAACmR9vOLJfLCFLa3M
         tUdM168YQ84TM1YY6FXfGKwtIm6bUIr9rfxIlk1RtNlUEkUS/+2DgOvoyPYhQkc8Rpak
         VuKAZuNQseaIr4bxXdRa7l+OpADfpwHWQ5uAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774001630; x=1774606430;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X00CXbZ/IfbcWLefSY86WcnvseoJr7XDjrw3gSx/LD8=;
        b=fh+dSqNuC8TKSNz+LrE/IBuS6EQeuLqmOm0H+y2dx+y02vBrCPZ4wc7iWDTjwea5tx
         foIy0RfREBk8kSnf4HLoYpBCn/kRCkajAggmegMvr7F5FY/FFi7ejBXfF21HVPN5EFse
         EEd6Eak0iJU9lGkrGAToK6JewK/tuT5h3X6pYDrQ7eAzy2SNX7y5gRWeEQ95f9w4ErRy
         UmN77BRSIkJtoQ6Q8rSypWdDywj+qMtcEJoKBaHDO+FmuH9kjnOWXd+Gkql7/q/rBR/m
         tm1oP672mcEvwYC8lzBKCzz/JGn0z+NjkfjTVoq5ITFUpO6UJ+00uvA9mMRVK/lWrfPv
         ZHaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4YttOjSq/vZiJ9OoXxKUcCqk74WVFM4/jSaM9pxhyezQ32Cme3DgLH3gAeBW2iOGhl+BQiyrZnMfZDjHQBL56Qg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyUaEgNyduTO3K5QUTImEu28cftpz1vuE+3Srxoz2l1cCURI3Fm
	r9dE3g/BCppk1sjR1kZliFaEsqfGzrAu5yFXHfepUl/BrjbpL7K0PwMEdcF7aosKSgyr0ewiSZ4
	bCT2o
X-Gm-Gg: ATEYQzzaHpBsT1BwsT0IEVL8JE4qgAvikvgV3lrCXuMfEu0OPWdn2IrLdafPel1n9/E
	TZ1WzdPtNxDtEULgfabCvX1/tD7UPdcxR3JiJW7scHw6XXuU15irjGVzhVxxJhQt8FeIg/hAxyQ
	RURwqrHbVw99Oyn488mzx0VlvZCpBdeqhXkPOPyDnWKRs8pShuk0ROdwVv3q1yPJ4+6bPSah8Em
	LQucWqDVF+s0IvOzIaokieMgmbVuiR2lLnqZrPYStf0af78GmWglVS9W1YoT/a6ZpqG815Y2//l
	StRv04H2wMtHBkmQNOgT/edq6RQnSPThDu8xwPoWSsh9qjtijsFlWz7cmlFXx3DUZ9APXNGetS2
	3aC5XrUk9KKm2D7wh5lyMayD61kvRyP+0IGhZ+WMtwtX7m6YyHVmmnP93v+wnTh3al2qN9kzyu5
	ErXZitesCERw3XyaSBG7COjAwodNkBF1ZMey3snuBRy2Cg+PESDC+xD5N+ik3IbRdZHXgvMXNnY
	yZuXDZT2avUcdc=
X-Received: by 2002:a05:600c:4e4a:b0:486:fdeb:fd96 with SMTP id 5b1f17b1804b1-486fee2dbeamr30297335e9.26.1774001629886;
        Fri, 20 Mar 2026 03:13:49 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe6d91fbsm50272325e9.3.2026.03.20.03.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 03:13:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 11:13:49 +0100
Message-Id: <DH7J3DSWUBXO.32LMINBEK4JC9@smile.fr>
Subject: Re: [OE-core][scarthgap 01/15] inetutils: patch CVE-2026-28372
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Paul Barker" <paul@pbarker.dev>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1773966414.git.yoann.congal@smile.fr>
 <ed976c159eab45e6ca1f8e1ba73c5872818e80d2.1773966414.git.yoann.congal@smile.fr> <e21ff2f9013d561713ae3d17c75f3e5a41ae4b30.camel@pbarker.dev>
In-Reply-To: <e21ff2f9013d561713ae3d17c75f3e5a41ae4b30.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 10:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233594

On Fri Mar 20, 2026 at 9:44 AM CET, Paul Barker wrote:
> On Fri, 2026-03-20 at 01:28 +0100, Yoann Congal via
> lists.openembedded.org wrote:
>> From: Peter Marko <peter.marko@siemens.com>
>>=20
>> Pick patch according to [1] (equivalent to patch from [2]).
>>=20
>> This CVE is needed if util-linux >=3D 2.40 is used which is not the case
>> in Yocto kirkstone, however it's always possible that users update
>> packages in their layers.
>
> s/kirkstone/scarthgap/

I updated my -nut branch and created a temporary
"stable/scarthgap-nut-review-2026W12" at its previous position to keep
the commits around during review.

Thanks!

>
> Otherwise, LGTM.
>
> Best regards,


--=20
Yoann Congal
Smile ECS


