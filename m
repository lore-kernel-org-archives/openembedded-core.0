Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CBBC4451C
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 09:19:59 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2848.1784366389276374285
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 02:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Cgnz0YPb;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4720d22c94aso5835609f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 02:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784366387; x=1784971187; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/TtuEWAmQskbl3W8B8jPEpumg6UK6uIIcAENwYk6taA=;
        b=Cgnz0YPb2tspmJmMzmXEER6WKJDaWnPn6UEiw30I6NTLuYtD0QiX2SKF4+8pMBtGEG
         zBSYINAU5s8q85Vqlj7JWJ1DitE2Shx1UtHTuPJrkODouqzDuu7BBSSrjo6Zq3GPJ2Ki
         4FNsITdMp0LNmQJTN7OKQald0Go7Qhy5ii3nY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784366387; x=1784971187;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/TtuEWAmQskbl3W8B8jPEpumg6UK6uIIcAENwYk6taA=;
        b=F3aBo0/J/+iwjCnV0FornpovxzuiDQBMQwjeHNNYao9HOHEqoUddSKoqbZ9okIRYhW
         NkmYHJ4WtftIuKdjaobX3Qn89/FjsqfNx/0qL6thdhRE1mWAsXA4GuG7tsUhHpffuxwv
         /7niR2ilROG1VAR89eXuIPZBMTY0Qxzydzi/lzH5UDLN9xw15wgheZAG1bZuQ7Z3dUaz
         fH65WvN6eenEEJe74w1pYe/j0GOSLJebyai3xGcnxVsnAIo27PjQOKU0ZNViz8X5rRxD
         rDeP15JIpFf1Dji4OO/ROglr55Zv2Nt3c1ENirdnmoSm+Pk+grAztshvYTl1UMFyUKMs
         K2Eg==
X-Gm-Message-State: AOJu0Yy5D8Cg8bZUqwAkkHc2UsIP3sjy959Xt64TSYXEX2e+NaHg2jFk
	nU32xEKwbFBiV7IlQmgmsyZhBXPvajEjG2QE7nxB5Dx4BXIBil8z9V2NVISXXlclYbg=
X-Gm-Gg: AfdE7cmHCO10TnVwMJyub1RSwRgyZJuZX2z7MEYBFW62cb7ZsDdwYOxqMaZtplbT35m
	ICjkntaMlJG1L0eo1enUpo7sTOmNmqihf0ckgsH2WSMNGmNQY+bMlsDqMSVtVFrBgZA8Q8OJLbZ
	6kw4YxJA4wUfQgUALsYcvKrDBDNh9RgxVp6eK6J6xyJDdM4JnhJZNuNFODTTTvK7N/SWVZxCKxw
	FSfOhIjtWD/V5xzhi+EReY8PMu8YQQANgtyMz8+G2rR4WhHVBDUOyI9Q1Mbl4827CgaNySIpKW/
	Qsw5HgsTYbMjpxi7PhmaBANqQI40ACDzqUdbD1LsIXek3BNclXBt3ufLFxFLnm2ZdK1W70jEGyq
	IjxvXcfWq73m9fjfu0kaI52srZQw+h9m7bH3pzWYdz7XH6OHFbAiFCcWKwsFyzV3TuBGGCVyqHi
	z20XdvLUaLgrFyFN+fFsvVYILRdGtJdKZnhnXa0tLV00njGwW+fiJtuZpoEe6tM51MkFk=
X-Received: by 2002:a05:600c:4f13:b0:495:4fd5:570 with SMTP id 5b1f17b1804b1-4954fd506eemr31193705e9.4.1784366387494;
        Sat, 18 Jul 2026 02:19:47 -0700 (PDT)
Received: from localhost (2a01cb001331aa001444456ef7d84e9a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1444:456e:f7d8:4e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954834fd05sm129530625e9.0.2026.07.18.02.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2026 02:19:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Jul 2026 11:19:46 +0200
Message-Id: <DK1L3DOJNAUX.136YZMPFO6SY6@smile.fr>
Subject: Re: [OE-core] [PATCH] lib/oe/patch: avoid duplicated "From:" in
 generated patches
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260710185207.3999639-2-yoann.congal@smile.fr>
 <CANNYZj8SEdTeTZDr5dyQfMxQ5cm_3CcXEc_5Vs22tYMP5Tb8Og@mail.gmail.com>
 <DK05T1YBIVAY.6B2L4BKB3HAF@smile.fr>
 <CANNYZj_q-EHN+GxGT0--7BcnpYWptBT-8DC8Mi6CvGnXaMQfNg@mail.gmail.com>
 <DK08YDP0HG03.1YUY01SIYRENG@smile.fr>
 <CANNYZj9Ze5O-f8fNhhEFKNdgSHARgagvQHkHSyisPfid2gwO9Q@mail.gmail.com>
In-Reply-To: <CANNYZj9Ze5O-f8fNhhEFKNdgSHARgagvQHkHSyisPfid2gwO9Q@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 09:19:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241256

On Fri Jul 17, 2026 at 5:27 PM CEST, Alexander Kanavin wrote:
> On Thu, 16 Jul 2026 at 21:36, Yoann Congal <yoann.congal@smile.fr> wrote:
>>   # Config to avoid groups.io "From:" rewrites issues
>>   $ git config --global format.from true
>>   $ git config --global format.forceInBodyFrom true
>
> Thanks, I was going to say this should not be set globally, but only
> for repositories which explicitly use groups.io (e.g. oe-core). Then
> devtool managed repos in devtool workspace will not have this problem.
> But I see how this can be tedious to set in every bitbake-setup
> checkout, and it's for some users easier as a global setting.
>
> So the patch is right, but can you fold this additional discussion
> into the commit message?

Hello,

v2 sent with more context. I hope that'll be enough.

Thanks for the review :)

>
> Alex
--=20
Yoann Congal
Smile ECS


