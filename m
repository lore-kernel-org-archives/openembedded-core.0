Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0132EC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 19:45:46 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.158433.1783367135659248978
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 12:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0J4doC1R;
 spf=pass (domain: smile.fr, ip: 209.85.208.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69531108f25so6026755a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 12:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783367134; x=1783971934; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgY9hgvDpTnic+4XYNC4DmoDUxwfnfOXKhMczM1fYFQ=;
        b=0J4doC1Rh5aJ4hwtwKQWTKOp7hrTbaLgQ4vswYrvtMHowO44IfRuZaz6XVKwKMMIze
         Dphz29yiA72slM+JNxtvetl+8Em3x+kW45fuHKfZNufKFvHQ+vVTPedOMwB1eGGedC1R
         d/U2WLUVj7vOxK6VM97JBsEyPLI+m4eHh1kJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367134; x=1783971934;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QgY9hgvDpTnic+4XYNC4DmoDUxwfnfOXKhMczM1fYFQ=;
        b=Lv6S0OtR+72yFib3SuJs+KmHElyCSv6pnTJQ8SiRfiD3D8LB2DyqanCZdMXz01CvS6
         I86mKuaDtFRTdM5Lt01wrDT0SxKgYo3lMmoEkvyCXvXAUr4TV9/W+jfIrocFEnUolvso
         9iHwF2aEpcPPebYNNVUZkRZTHWkTwDj/Ow9mj4FMRCUsuKY4zAahLgCbjFlLjSsFelP/
         mq23EfEygQ9tgOTa5BFAIldNmtw2pUxpIa9QRt/3aBR60PM+hDh1oOV5hc6Lzh62PC/f
         VZKYyyUPPm321GVxWEWCB4PY4FJXcX6zOaLcHYNFO1BLxeUFCtZ6QlbRcwVXoAc9iMsv
         VFaw==
X-Gm-Message-State: AOJu0YyDKPbx5TIIUsC5VGPmNsOTy6cI2CnZyXgMNYNm3j8v1Ovj2k2z
	m/hH3f+K/utu5dXDptdQrfVheNHMCrQiNMkIT5VwRNDf3jPPX2en5KCT6TIhpOAwB3E=
X-Gm-Gg: AfdE7cnEq08gKlvJVK1P8+GGPcq3Ei+ZHXwvSOERjmu2XAFvyYYNh/Hete56O1f+4GW
	ld6B9gbSBlf0bcMtmn5g15hPkxr3McYS7WUwSAJHNm9CLegBJsA7QpH8Erp+NDccZ0Z4YDVKv9v
	X/QeZVcPKCLEMpNMDcjm0JQx3e4VbU3HbOLw+7KYYkDNT6pu/0D5lQxAtBfyPWrH+mhp9WmCf/K
	PoQgh/kpLXR0Cud2ADSN47dfe4+xsNSsvM5vzxu+Nf3LORhZqLRQSYDpbaieDRLuA4Tuz4XmN+h
	I6jFpzboNZ2EGJrRTIaofqyVxb9pBG4Ps2w13UTcRyw5c6c+FMPggB2aB40Rc50uCdUZ/2EG2cV
	788mKkwlemFuHX3Xu4BvjXnfWjeouVVGmdtxsL5A40nr9dcdKMhocE1dmMl/dUcR5pkq0vOX4PF
	0elBL01V1vK/zFlIc2DRAAxgoUNkuh+SXn+ZUkJzTcqsUfFcJ/dmmvv0WbmQf71fsqN8hZTQing
	A==
X-Received: by 2002:a17:906:558e:b0:c12:7606:4728 with SMTP id a640c23a62f3a-c15a6946a41mr78914766b.49.1783367133620;
        Mon, 06 Jul 2026 12:45:33 -0700 (PDT)
Received: from localhost (2a02-8440-7500-2d7f-7385-b6f0-0908-b614.rev.sfr.net. [2a02:8440:7500:2d7f:7385:b6f0:908:b614])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4b52sm806435466b.47.2026.07.06.12.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 12:45:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 21:45:31 +0200
Message-Id: <DJRQVY1HA0ZF.1Z5Q3YE3RY4KQ@smile.fr>
Subject: Re: [wrynose] Backport request: opensbi ELFFLAGS fix
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
To: "Gustavo Nihei" <gustavo.nihei@espressif.com>
X-Mailer: aerc 0.20.0
References: <PUZPR04MB5419066CE4B576BF812F3F23EBF12@PUZPR04MB5419.apcprd04.prod.outlook.com>
In-Reply-To: <PUZPR04MB5419066CE4B576BF812F3F23EBF12@PUZPR04MB5419.apcprd04.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 19:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240341

On Mon Jul 6, 2026 at 9:03 PM CEST, Gustavo Nihei wrote:
> Hi Yoann,
>
> Please consider backporting the following master commit to the wrynose st=
able branch:
>
>   9bf56df6decf3b0a07e5a0814f4ad2d6317568f9
>   "opensbi: don't override ELFFLAGS, silence ldflags QA for bare-metal EL=
Fs"
>   https://git.openembedded.org/openembedded-core/commit/?id=3D9bf56df6dec=
f3b0a07e5a0814f4ad2d6317568f9
>
> It fixes opensbi_1.8.1.bb clobbering OpenSBI's mandatory firmware link fl=
ags (notably -Wl,--gc-sections), which bloats the firmware and drops the M-=
mode hardening. wrynose ships the same opensbi_1.8.1.bb and the commit cher=
ry-picks cleanly.
>
> Target stable branch: wrynose

Hello,

I've added it to my review branch. Ping back or send a backport patch if
you do not see it in the next review series.

Regards,

>
> Thanks,
> Gustavo


--=20
Yoann Congal
Smile ECS


