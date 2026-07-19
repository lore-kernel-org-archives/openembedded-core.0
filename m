Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DF4C4450A
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 15:10:35 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6893.1784473830038580669
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 08:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=F8j8V2Zg;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f71156e1aso261877f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 08:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784473828; x=1785078628; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SyCHeghMFIsfAJN+mL8bMJ3v6i2a8MTieGtB3bgnbEY=;
        b=F8j8V2ZgvjwN+vqPfuwc/RNcUojOteSlJf1z9fHU/D5qFT4qiDSfwr6A5N/kr9ACdT
         lKhBaVpVa3FOXSvuPrsoY1LeDhDFW+hxEiQQLtjxwYSBajX9TGXCdEUiZ6ODj3Pr5CYj
         lGeEkIRMbwnM4HnSosUx0pt2ZmW6mUFoJTgJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784473828; x=1785078628;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SyCHeghMFIsfAJN+mL8bMJ3v6i2a8MTieGtB3bgnbEY=;
        b=ACAhHe0jte2Dp/ZhIEdcs0PMMHUMneXc6gSqMPDwpevINmi3vr95x73vz0FvEYJMr6
         0YbPClRNifDmWYIlbbfkVflhQ4DjI4Gel5pSiooSw5I4vHJwTMA3ItN65WgyhcyUgH56
         BegG+SbeVgZcnTtz7fBEVyWC2PN33xTiE/7s6QoqeYrcNR3SF9m2scyVr956NZL56wT4
         tWwoqJAfpHaPIp2Ta37T4rUqyk32TGkGZZUSp4cLvnh4un5l0as8ghOR9ERezzInkMQ0
         1U0FTTeKSI01CmJ1VUhpXZZrEYQSzhroYwSK6bFysDiz5Wf9SYKEj9R6aR8gDQl5Izs+
         TOBA==
X-Forwarded-Encrypted: i=1; AHgh+RpPbzuDTzPbvfmH8jNF+ueABfrkatzmaFBtNvJVxbK2lO/rJ4qVEoaHFBN1hDMiLUok4kqyGDyJI9nZ/p5op9iW2g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyfOW8+a07wo81d3iOfVx19QU4GScGk43zsUH3YWBuHwCgSCiQ5
	vqTTp1uF4Zm5T/owkyvj6P3bPR4kYzvLfUguQ9o1JLcWtqurvubt78oDOWI9NpIHwpk=
X-Gm-Gg: AfdE7cnj+Nvo4jMLNBeos6AYavqtYYjeqrPuEc3loOGDUxrUZluyTGnepMrf+uKtugq
	YZymWqgCBO/TsP2+gHsChfPLGqtlhlFx7YmeL2dr/qKdIa7RIfF/pq1240uRFOlfXGhakHTtSCT
	oauFKcTo+iYFUb+yr3T8oFExfdMFGaw/ynAxA+a2U18ERM5m8KsgdW+DSSHdw4C1qJXbNlrNsey
	bu2F8MZ/l4FlyrGap8l1NGBzfNEbsUEP62kAMwSbjzt5BuuQ3KFie15ymv6r6yIqrUtdSdoegwW
	JAaeafw2JcfE5wD754OQ+HOiG41ZW2GaNKw7qOkmBP6K1Yt1DN4h05L6zipq4r9FGx4Hn1nyjSD
	uSAyzoG8xsZ2lt1uZLKddWfcf4mUw6Dv+foZCw/dGLMbU417vXuG5Oxmtr2Xh3G+Y1UdQFi/dA1
	NL6SCv9oDIea6zvaGNAtgslzslQWci9ZDcbFaF9WfIyc8eVoZBvnGDdzDUhcfzuQEiKkE=
X-Received: by 2002:a05:6000:41f6:b0:47f:3657:7a50 with SMTP id ffacd0b85a97d-47f62306305mr11920239f8f.22.1784473828251;
        Sun, 19 Jul 2026 08:10:28 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7c69sm22854970f8f.17.2026.07.19.08.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 08:10:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 17:10:27 +0200
Message-Id: <DK2N6F9IW3ZG.1J43QNDS99AWQ@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <hprajapati@mvista.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] gnutls: fix for CVE-2026-42011
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260625125532.185380-1-hprajapati@mvista.com>
 <DJL1BNT9KYBU.18COZC5THH1NW@smile.fr>
In-Reply-To: <DJL1BNT9KYBU.18COZC5THH1NW@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 15:10:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241289

On Mon Jun 29, 2026 at 12:27 AM CEST, Yoann Congal wrote:
> On Thu Jun 25, 2026 at 2:55 PM CEST, Hitendra Prajapati via lists.openemb=
edded.org wrote:
>> Pick patch from [1] & [2] also mentioned at Debian report in [3]
>>
>> [1] https://gitlab.com/gnutls/gnutls/-/commit/1dead2faec6320aaba321eb56f=
20d442df192b83
>> [2] https://gitlab.com/gnutls/gnutls/-/commit/24713b8c63137ce0665b495d22=
ccce4f5ce05c84
>> [3] https://security-tracker.debian.org/tracker/CVE-2026-42011
>> [4] https://gitlab.com/gnutls/gnutls/-/work_items/1824
>>
>> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
>> ---
>
> As far as I know, this fix is also needed on wrynose:
> CVE-2026-42011 is fixed in 3.8.13 per Debian Security Tracker but wrynose=
 has 3.8.12.
>
> Can you send a fix for wrynose so I can take this one for scarthgap?
>
> Thanks!

Here the current state of this series: Hold pending an equivalent merge on =
wrynose.
v1 series received here:
[OE-core] [wrynose] [PATCH 1/6] curl: ignore CVE-2026-4873
https://lore.kernel.org/all/20260629131453.1077612-1-adongare@cisco.com/
but had reviews and no v2.

Regards,
--=20
Yoann Congal
Smile ECS


