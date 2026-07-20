Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7216CC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 07:42:11 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4052.1784533323399834036
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 00:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=X6s+AIDo;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954aff6088so16458935e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 00:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784533322; x=1785138122; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WP8YSSaZW25nFTnBLGRzcTqs3WLLsCcuDoGQFBIQ0J8=;
        b=X6s+AIDog3XqIstIp7d8Z/9CAYC1qnIXlN0rPkbbdcdlCfJO69rPe6v1qmPPfHG2+h
         6FC7TRET3bbTxhHgZ1POyL5qxWpwi4UfMTMu/o5a9C1uL8VFWuizrF3R8/e66HhiLq6F
         BFlTGq3eEhmSHMEPK4k+K8oG8HmaduEbl8jWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784533322; x=1785138122;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WP8YSSaZW25nFTnBLGRzcTqs3WLLsCcuDoGQFBIQ0J8=;
        b=UUrvydUycncCncpGcfYdFkEL9UW3lVDd/CbGfLtr5Nrn1Xp9KRjk4gagwXXOkEkTi3
         r7fwu5ArPVMK2ZlRdMfc7vNPkERcAKhRXlsNV5xbJlUOdygmbu5rfqCn+7xdhiVWGTCV
         KmKPUV30SADwuYZPjWVqPU8RCk5D1n+EEjCJ8LAMAUTLPxG6+1sawUozhA/zKtVY1Jqc
         QhjeRFQy8Nd+yBYOsr99LTQz8FrP/+YBf2WY0ZVc8HBZSmG7ZggWK+QVXYu6FsQDR/HA
         7lDgCUA/LAgxwNIX8hZx4fHQgaxcTkGae6GKhLmLDT82qEspr2bObX/63TT4WpGnPHqb
         d05w==
X-Forwarded-Encrypted: i=1; AHgh+RojQfaPlcyYkrk11jUh67b4Aw4Q0k7Oq6zX/kOK9tuTV+mf6+PgO+AIQTgnWAhiG+uV74JsWt36AUPK+7KNhrbZFA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxzxaU4Eq6SaIJYXb/xaKqOCcoK/X0s5FdGku4dYz0yrc21qkrN
	TEqNDScoNYL4M6R7n96fF62RJs398q8kHOF11LOiWCvbxqP11CSEky64XzGJWcjPoHE=
X-Gm-Gg: AfdE7ckcy1yKXgFvc4/uh6WJRzI7OfZh5sB69MvuoBy+gqx7ETAoLR1NZuEWJ0m8WYl
	Kzrusubw9+e/+i/kbm7sAmdY+Lkqqp4wdCVRC8zOqhs+kq5DqzkztYLeAxZlXD7LbCbrSICC75V
	aZAZaXOzpEAD69JArTt/LrmlxbUMH3EN1t9nT+pblPGSRslY6lO8p+nzOGifaYnjLYwR0FGPVdC
	laLPpYJrvindD8LC7DXeTAhnv3m6mjL2C9cH8yapftxJGSCDI3DPuaQqMWYQj/bhNGWYhsIn1Qs
	NN2nzwnYUrjLhtNnuH3YmOnahGfFR5ppYm6O1rk9K0M2GKSjAX5oPvwOEfIOgF37XFWsesdsz9N
	TLIFx16gbKB/zPxhfup65nNt57DXtQioNpVEsAhAQi3sNbv/bw5jHBUnMVmMKlbE5v0ZbUH/yam
	aYjm8XpUGRlJJJcjAtYtmLe4xtSGDPpd9q0A/UVmrcSVtC2bj9g6cPFwpIw/wpZQ==
X-Received: by 2002:a05:600c:6989:b0:495:5d34:e62c with SMTP id 5b1f17b1804b1-4955d34e948mr43977965e9.10.1784533321621;
        Mon, 20 Jul 2026 00:42:01 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b074csm278749685e9.6.2026.07.20.00.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 00:42:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 09:42:00 +0200
Message-Id: <DK389LU04I4G.31P6ADX1HYSAW@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] extrausers: Terminate
 set_user_group post-process command
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Anis Chali" <anis.chali@ro-main.com>, "chalianis1@gmail.com"
 <chalianis1@gmail.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260713152937.200292-1-chalianis1@gmail.com>
 <DK2W7U194RBL.10J1D4A3IAQPV@smile.fr>
 <YT3PR01MB962678A052EB43C1B344DA62DAC42@YT3PR01MB9626.CANPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <YT3PR01MB962678A052EB43C1B344DA62DAC42@YT3PR01MB9626.CANPRD01.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 07:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241332

On Mon Jul 20, 2026 at 1:59 AM CEST, Anis Chali wrote:
> Hello,
>
> You are right but there is  something weired, this variable is ';'
> delimited in many layers like meta-security, meta-virtualization,
> meta-oe... but in poky the delimiter is a space as specified in the
> doc, I will double check to fix things in my side like adding space
> before my command or even reparse the command.
>
> Thank's.
>
> Anis C.

";" works as a separator but only because there is this compatibility
code: https://git.openembedded.org/openembedded-core/tree/meta/lib/oe/utils=
.py#n270
New code shouldn't use ";".

Regards,
> ________________________________
> From: Yoann Congal <yoann.congal@smile.fr>
> Sent: Monday, July 20, 2026 12:15 AM
> To: chalianis1@gmail.com <chalianis1@gmail.com>; openembedded-core@lists.=
openembedded.org <openembedded-core@lists.openembedded.org>
> Cc: Anis Chali <anis.chali@ro-main.com>
> Subject: Re: [OE-core] [scarthgap][PATCH] extrausers: Terminate set_user_=
group post-process command
>
> [You don't often get email from yoann.congal@smile.fr. Learn why this is =
important at https://aka.ms/LearnAboutSenderIdentification ]
>
> On Mon Jul 13, 2026 at 5:29 PM CEST, chalianis1 via lists.openembedded.or=
g wrote:
>> From: Anis Chali <anis.chali@ro-main.com>
>>
>> Add the missing command separator to prevent the command from being
>> concatenated with subsequent ROOTFS_POSTPROCESS_COMMAND entries.
>>
>> Signed-off-by: Anis Chali <chalianis1@gmail.com>
>> ---
>>  meta/classes/extrausers.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.b=
bclass
>> index c825c06df9..94576b8872 100644
>> --- a/meta/classes/extrausers.bbclass
>> +++ b/meta/classes/extrausers.bbclass
>> @@ -23,7 +23,7 @@ inherit useradd_base
>>  PACKAGE_INSTALL:append =3D " ${@['', 'base-passwd shadow'][bool(d.getVa=
r('EXTRA_USERS_PARAMS'))]}"
>>
>>  # Image level user / group settings
>> -ROOTFS_POSTPROCESS_COMMAND:append =3D " set_user_group"
>> +ROOTFS_POSTPROCESS_COMMAND:append =3D " set_user_group;"
>>
>>  # Image level user / group settings
>>  set_user_group () {
>
> Hello,
>
> ROOTFS_POSTPROCESS_COMMAND is not a shell command delimited by ';' but a
> space separated list of bitbake recipes functions. So the
> ROOTFS_POSTPROCESS_COMMAND:append =3D " ..." is correct here. If you have
> concatenation problem, they are likely caused by the next function not
> ensuring the space separation.
>
> Also, FYI, we have a master-first policy, to accept this patch, similar
> patches would have been sent to master and wrynose.
>
> Regards,
> --
> Yoann Congal
> Smile ECS


--=20
Yoann Congal
Smile ECS


