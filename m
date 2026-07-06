Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9ACDC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 10:37:36 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.148204.1783334250889008239
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 03:37:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gt4IoYSy;
 spf=pass (domain: smile.fr, ip: 209.85.208.179, mailfrom: yoann.congal@smile.fr)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39b293079d1so23918801fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 03:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783334249; x=1783939049; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUhXOqn0z8D58UEATslwT684I2GGdDzzKj/E9yBpiWc=;
        b=gt4IoYSyHY06yp0qX2rqNTVeMRimn3qOa8RGwd872WYwxqVlfTmZwSb22yTK94aR2f
         zNSC4PzfSGPhD6NesaYUZw7mykmgyx+WoUYVfLThicLy6vKLp4Nj3yyfHGwU3F/ifRsN
         lsMkbcUGBu4USDbLgXRjb6EEbKqQzaZ8d7yqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334249; x=1783939049;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jUhXOqn0z8D58UEATslwT684I2GGdDzzKj/E9yBpiWc=;
        b=UVpV2WfaVDtMVWerATs0ohGRxUpx6WX8hWTkg3MS16sk98Dv5DjIjNHsgnlwu8dHuT
         PdefrQsuipXhyqQnNYhB81uAlMzWWre331La5C7tyAJYvgQzZ6LyUgqn9UXBf3CtC6cf
         wmlgNyqnpMGN+jTrYl6Vmj16Qeu9QG1nguxg1jHd+0WDprvEpxUQolGuaYdsMuNUOSqq
         W6ZCjjOJkbRzwp2eop2wLbdDcS9XgqPokRJW0CR3OtfZcrLw+kjFcZLy+3pYtxKwr0QM
         bLvB3GzG5DzLlrOVmD5Pa3gMroo2ba1Dy9QC7UkIcRjF5CqhooWFJQm+kbRlTe4wc8/l
         BSXA==
X-Forwarded-Encrypted: i=1; AHgh+RpSYIOg1lJVzXBdLoU4+uxbI+vaEs8ZMlmHasvImaG1RWG0bNvHQkuAkuMgD7CohAm5DBRdnqmdIFLTKlzk+zwnKw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzdzbgo1CtbQfSYtpmMrybYhbMrfiMy6fllk0aAzxRn67wuxStN
	BjMM7CVmXefBuUKeL/uLf01M/pk2ucgWPt829Mbyu8KmC3FGy01vZnhOsqj1BN/ehBE=
X-Gm-Gg: AfdE7clAow6r6Ev9ocaZnYEjpj21cQkE4A/vI8jJOUl3xk0B3v5n1If6kW7a2wSD5rN
	jK3ZdSxUlAo6Ea2mQK9bj1rE8ebkRxKedb5F1prELykzPHCgRPtWDCrAlIsmFXJ1/Myxoxlp4Se
	TsDplgyiZE+sp4swyLiPUKuepqEAQ47JWKVSFRWBbMLlP6DDBzozFvuNCHMwUyxpEUsrHoI31tF
	vHa3mNuszyGMHZpDhmJIP/a9LBSZGXuoibcFwQPIjZrjsu3EY5jTNKnlo3HKF9+itVQfxZ5yy19
	vREjd7wFa4LaZQCd0Mo8k2e18zJXPeS2PqFH/PHUrEoibnPzHuiTzCA9TBTWNSVeLMldRmMeVxy
	jXvln1sTTVnfRAAaaPzzX/M7VXj9dhx/LQDmEP6GnNHcoS3ubd5DmJkzt+fqrefRbKvv1Ph0BGG
	cznnRnoI+NTQpabgU=
X-Received: by 2002:a05:651c:e15:b0:39b:224f:93a1 with SMTP id 38308e7fff4ca-39c60015dc6mr122391fa.38.1783334248823;
        Mon, 06 Jul 2026 03:37:28 -0700 (PDT)
Received: from localhost ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4adf5c82sm21399101fa.19.2026.07.06.03.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:37:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 12:37:27 +0200
Message-Id: <DJRF8BCY4XXV.2VZYPEYOAW7QR@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, "Song, Jiaying (CN)"
 <Jiaying.Song.CN@windriver.com>, "Wang, Jinfeng (CN)"
 <Jinfeng.Wang.CN@windriver.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH 09/12] python3-pyasn1: fix
 CVE-2026-30922
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
 <20260409061639.1688205-10-jinfeng.wang.cn@windriver.com>
 <DI17NNT0X7YI.3HOA397O2P5FL@smile.fr>
 <IA4PR11MB942062CFC3DECE261B819667B8362@IA4PR11MB9420.namprd11.prod.outlook.com> <DICTHBF30UIC.SLD2UTBGTJVU@smile.fr>
In-Reply-To: <DICTHBF30UIC.SLD2UTBGTJVU@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240239

On Fri May 8, 2026 at 1:01 AM CEST, Yoann Congal wrote:
> On Mon Apr 27, 2026 at 8:04 AM CEST, Jiaying (CN) Song wrote:
>> Hi Yoann,=20
>>
>> This patch is for scarthgap where pyasn1 is at 0.5.1. The 0.6.2 -> 0.6.3=
 upgrade would only apply to master. According to https://github.com/pyasn1=
/pyasn1/security/advisories/GHSA-jr27-m4p2-rc6r ,=20
>> all versions <=3D 0.6.2 are affected, so for scarthgap, this patch is st=
ill needed to fix the CVE.
>
> Yes, agreed but the trouble was that is was not fixed on master and,
> therefore, could not be fixed on scarthgap.
>
> Now the situation has changed, it is fixed on master by upgrading to
> 0.6.3 but wrynose is now vulnerable.
> Can you send a fix to wrynose? I can't merge a fix to scarthgap without
> one for wrynose.

Hello,

I will now drop this patch. If the above situation changes, please send
a new patch.

Regards,
--=20
Yoann Congal
Smile ECS


