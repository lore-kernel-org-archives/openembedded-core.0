Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93B6C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:42:16 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.2638.1740526934535293545
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:42:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I4YkGz+P;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f3ac22948so3203705f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 15:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740526933; x=1741131733; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GCsaEOepIJPEJff7s239I5sPze+WkL+HDgFfSQhBj5g=;
        b=I4YkGz+PrU1Kppu7FQ4AM0AaNKoCj27cEvmrqliNcQLRfwhfd7mtbgGgdJVPe43khZ
         q8lNcl19W5JT5a21lM4BnAaizTZZBNnwd8044lA/ZQ9T+ZUZDdqN64DQJA97YkUVyNL4
         qH1Nxo3BaRpCegGPnYlzXG3vNr7Z3kRYnWKPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740526933; x=1741131733;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GCsaEOepIJPEJff7s239I5sPze+WkL+HDgFfSQhBj5g=;
        b=oHyBSs514wAClbicRtozrVp3M7KL+LAVG+tipji8LSCmfNzqtzWlnuh0yhY7SAJdos
         V/NfEQafnQqUf92+y8AWcmvvVVj0WB/Zi5w9j9Fz8kw9eHwWv6nG7/PzmR2G+yHcxMy6
         yo7SfVBiyHuCyT/zQ3LJMSSNhEDOpFhUmLbTxA4aDm7F2MQGFdt3GaVZWzqbS0yo1pAk
         RQKGTgrDX6GCyMR4XPX/OS4KPXL8q+hqTDQEG51tDR1gxdPccjNWMZdlbNML43DRLKHk
         eog0kEg7YfutkstRjdavWtTnJCuPJIGBReMPLhJhAppIiJBO9Wl4g6EklAkF93+ujzLe
         EBtA==
X-Forwarded-Encrypted: i=1; AJvYcCXCQ39N8LD1X1g9F3dhOjlJ1b92g9yDg0iuyuzT1TgUgX/C6d9NsZxduBswNDYhb9LQlxHOA/LSG9n2UutOSB4fOw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwccL7gUydPpZld/X5R8GBuqcrbPbuAXMCINf80RiH3cLryA7AN
	TgMCGy4YQaUM1nIb7yCD9SqvcZMh4hLugBbjzRxKNh8yzHanmNfjYsEzBiLZakw=
X-Gm-Gg: ASbGncsAckQmVFU0HJDZT+9sj2vij1vrjtA9px62EKllMoJ5dH+m8fIl+usKQ62lf0e
	Lti5/WlT3TGhKKx3Kl48Ra9NYcJoUoOl1POGjrMEl5/rq5YKsHk071Q0bv0xf592trV4oyAV5R+
	s1ypaBzaijoDD83asJm//WjDZ2ah1oBkOY8OnVqR2SpR9uteKu7k1xZ8fGLwhYCamepMCeS1Ehd
	KGl6FllWEN0WXnsmpn9MZiG87gkj+x8fNvG/xJfDQd1vdXkdtlCjpLEfDok0AWP8OGrCwsRvyGu
	68ihnqXmJA3kWYAwfhoe+Jj/66MbbXElKTkxSHg6NqavEnVoxSfCjeRLUYuoB6kqY+oLlMkes/8
	zyOy7ao0095J3n+E=
X-Google-Smtp-Source: AGHT+IE6UiE1q7X1yTtAZdkj1z/aASqkAZbMLWcfJCPXFX3f+lYDsINAXbMo/riI1DPbcJs0k50aRw==
X-Received: by 2002:a5d:588b:0:b0:38c:5dcb:312e with SMTP id ffacd0b85a97d-390cc3aff06mr4369030f8f.0.1740526932797;
        Tue, 25 Feb 2025 15:42:12 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:22f0:312b:471e:e7f1? ([2001:8b0:aba:5f3c:22f0:312b:471e:e7f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba543f94sm2734225e9.26.2025.02.25.15.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 15:42:10 -0800 (PST)
Message-ID: <11af77e0e16064cb97ab14593d5a931e38694275.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] psplash: fix typo in psplash-systemd.service
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Cc: Jon Mason <Jon.Mason@arm.com>, Ross Burton <ross.burton@arm.com>
Date: Tue, 25 Feb 2025 23:42:10 +0000
In-Reply-To: <20250220082517.2065822-1-mikko.rapeli@linaro.org>
References: <20250220082517.2065822-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 23:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211937

Hi Mikko,

On Thu, 2025-02-20 at 10:25 +0200, Mikko Rapeli via lists.openembedded.org =
wrote:
> systemd ignores the typo and continues but startup fails later due to
> missing fifo file. Fixes:
>=20
> systemd[1]: /usr/lib/systemd/system/psplash-systemd.service:8: Unknown ke=
y 'ConditionFileExists' in section [Unit], ignoring.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0meta/recipes-core/psplash/files/psplash-systemd.service | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/psplash/files/psplash-systemd.service b/me=
ta/recipes-core/psplash/files/psplash-systemd.service
> index f9aaa2db3d..b618be1ba6 100644
> --- a/meta/recipes-core/psplash/files/psplash-systemd.service
> +++ b/meta/recipes-core/psplash/files/psplash-systemd.service
> @@ -5,7 +5,7 @@ After=3Dpsplash-start@fb0.service
> =C2=A0Requires=3Dpsplash-start@fb0.service
> =C2=A0RequiresMountsFor=3D/run
> =C2=A0ConditionFileIsExecutable=3D/usr/bin/psplash
> -ConditionFileExists=3D/run/psplash_fifo
> +ConditionPathExists=3D/run/psplash_fifo
> =C2=A0
> =C2=A0[Service]
> =C2=A0ExecStart=3D/usr/bin/psplash-systemd

With the systemctl patch dropped, it exposed another psplash failure in
meta-arm again in my last master-next build:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/1036

So I'm not sure the previous issues were fully resolved :/

Cheers,

Richard



