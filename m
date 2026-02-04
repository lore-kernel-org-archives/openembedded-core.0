Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82692E9D41F
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 17:29:44 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.460.1770226178607282835
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 09:29:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=P3hTeAmI;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-432d2c96215so101918f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 09:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770226177; x=1770830977; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtI+qA5HCgziVLOpTD9GC+5r6kpl+m0+dr44F3AUkFQ=;
        b=P3hTeAmIW+fFgR/KqGw2WcbUwJriFLgnKaCbdOuJfnYBfwT7yO8w34VWiddQLnHcZx
         DRj5QPuf2+pBs8MLsxn+0mJCAOfafH9xpStqPthKX+N9iu1Byxuag/WSO11b+lm8ByG2
         WsyZXFmBG7l7uJOkFF5l7zc+t9tXE0799M8C0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770226177; x=1770830977;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KtI+qA5HCgziVLOpTD9GC+5r6kpl+m0+dr44F3AUkFQ=;
        b=OpGrGLLW8eqoHYjg36EywWaOAKTwF2tVFP+d8sWvA9//I4GYZ2rfl+9Qyeln4fiFh7
         dw/OLXjpiHdjuJ0Dsx35XH+KwkECZ/k4Pjf2v9VfFfDMo5zLlOuphArktSGHR4cVHGFT
         RXe/BcqcqNYpsZNmZ/VO2BnuJlNro0JGIOYV99+NSu+/D/XVhMo+OmzU9F01I+DBa5GF
         Qjz9qa+C2uhlCDDOGvWfblCYYwVR2JgupCDvLIsQX/+HodamNXegYRM/lLB9SCvo1341
         nVymUXv+GvhGk+w++cBLY8K8FmUAYyW8fmyn8YgzXJXzLsdU0AOpuQ7Auaohjjgi1h7x
         /u2w==
X-Forwarded-Encrypted: i=1; AJvYcCViGplKh8SIXwTQ1nlhg8YD2hcqlgcZQWIT6fu0FAOdIn7Qd9PL9SLuyra3FtpAADeruqhDIeFQseu5eOLmFWOIrA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx5IwmL5ytin6oS8if/zOpdvMmQwY/neidT28QoZegEYswFgmyv
	VHH3XFDadJNjbQ57620g2Y/VhIIpTUqYAy54PzIOsZPSUcHEXL048H0RfMJGOaaWb4Q=
X-Gm-Gg: AZuq6aItIbR1KWlzJ9NAqdWRm1LRho2lugmZNgpDo1CjGt8AfIqBUOIfP7CWSUh6CUu
	NpLakwQwpwOaBFZh/jReg7i79iyP9Ojw6oenvXryvrTTw8l2kRtGxbTOZVR8btncT6GE8H+qgiU
	FCP1qPtag/CAM8e9zRZmtoaWsCctctgPYaoJjIoaAcvSUJvCA9681TKU5ZHZ/n6/5tocOeU1DM/
	Fs0+vvOODPcWuSwAzlKKbiBJvBGIbMbaitdXFXRhLytwoIA7KMWojNO6BYoI6yxn9n7NRjUh9u5
	+OwSPXgIC9qFn8uxwirFjZ0GpT9Uv3QwKPYfLzKpRGC/Ryc/Ibjn1mYW32g9fONFX5SpM7G92DO
	+OECWgDd0YjakbhB3CoNmeZFlXoIuE0PwVSocBDfqtFiTLGr9fI7NCYiDWXemr77yUleNbPkT5a
	xzGa1S+TJ6irbKbuN4C8yXiLQ9OQNOQItgbdV/+uQcSCR+T27T/fmvBKf3z3cBUWmJoAbZokHwY
	M8=
X-Received: by 2002:a5d:5f45:0:b0:430:f437:5a6d with SMTP id ffacd0b85a97d-43617e405bdmr5633627f8f.22.1770226176950;
        Wed, 04 Feb 2026 09:29:36 -0800 (PST)
Received: from localhost (2a01cb001331aa0002b8d20d4b496413.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:2b8:d20d:4b49:6413])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e250b2sm8699049f8f.8.2026.02.04.09.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:29:36 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 18:29:36 +0100
Message-Id: <DG6CT2K57CNL.3DJCTHMJC8YS7@smile.fr>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "hprajapati@mvista.com"
 <hprajapati@mvista.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] openssl: fix CVE-2025-15467
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260130054350.300667-1-hprajapati@mvista.com>
 <DG6BYJEIPLBK.2FSCSMFX8XMR2@smile.fr>
 <AS1PR10MB56972FCF587B6954B626995EFD98A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56972FCF587B6954B626995EFD98A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 17:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230556

On Wed Feb 4, 2026 at 6:11 PM CET, Peter Marko wrote:
> Whinlatter should take openssl upgrade instead of patches.
> https://lists.openembedded.org/g/openembedded-core/message/230229
> It is now merged to master so that blocked is gone and it can be taken.
>
> Peter

Yes. Thanks Peter.

I'll will take that patch for the next whinlatter cycle and, then, taking
those scarthgap openssl backports.


> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Yoann Congal via lists.openembedded.org
> Sent: Wednesday, February 4, 2026 17:50
> To: hprajapati@mvista.com; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [scarthgap][PATCH] openssl: fix CVE-2025-15467
>
> On Fri Jan 30, 2026 at 6:43 AM CET, Hitendra Prajapati via lists.openembe=
dded.org wrote:
>> Upstream-Status: Backport from https://github.com/openssl/openssl/commit=
/ce39170276daec87f55c39dad1f629b56344429e && https://github.com/openssl/ope=
nssl/commit/cdccf8f2ef17ae020bd69360c43a39306b89c381 && https://github.com/=
openssl/openssl/commit/e0666f72294691a808443970b654412a6d92fa0f
>>
>> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
>> ---
>>  .../openssl/openssl/CVE-2025-15467-01.patch   |  40 ++++++
>>  .../openssl/openssl/CVE-2025-15467-02.patch   |  65 +++++++++
>>  .../openssl/openssl/CVE-2025-15467-03.patch   | 128 ++++++++++++++++++
>>  .../openssl/openssl_3.2.6.bb                  |   3 +
>>  4 files changed, 236 insertions(+)
>>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-1=
5467-01.patch
>>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-1=
5467-02.patch
>>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-1=
5467-03.patch
>
> Hello,
>
> Thanks for the patch.
>
> As far as I can tell, CVE-2025-15467 does also impact whinlatter. Can you
> send a fix there (either by then backport or maybe an upgrade?)
>
> Thanks!


--=20
Yoann Congal
Smile ECS


