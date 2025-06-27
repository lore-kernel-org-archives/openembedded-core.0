Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B025C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 16:14:43 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.329.1751040880598733462
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 09:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OQ3vEpT6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4537fdec39fso373305e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 09:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751040879; x=1751645679; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oz2mY32vVIBv5hFPWK+COrp3MnA7gb/7C89gT3MJX9g=;
        b=OQ3vEpT6qp/0uakaeU8HwrNdt3VBXnV860O/kZLngXM7rlelSic/vYyR1LIhJc6PVA
         9UAcOoriWKF7XL3i7MpzRmfMCS4tdEJBj79Q/InNYy8YMiQmkZbLhYv143dfC/Ae0pxg
         0T2cTQvhgw4HpEL2SOIjXw+Isrs5VHdAYAyKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751040879; x=1751645679;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oz2mY32vVIBv5hFPWK+COrp3MnA7gb/7C89gT3MJX9g=;
        b=VZEnlt85rmwv5E3gd2ag1sES/H1pyQQXyF1QrI3+HWKdyN3VYR2D5lil7AjfUWq75n
         fYoTCjCXIjU/Zto+zOTV+QyZwZOrKhqoS/DTz4svp1t1BUE+PYoGHODiCzYho1Q+C24O
         dLt2u3SlfsoPMVlBUkS0wFpRVyD2CN34Qf35aTygdY5fjpvHh6oMYBxYEO6QMEUxfxOy
         Bs/5NX0gQPHLgQHS8b5932H+RT6Ws8jeaR1ASMGl4WVhFnlaG0bymujOWgsnn9gxf53P
         xx6Q2XIoFuMye+yAd58TD/560opA+gISXPZceEMHGgMKmQvOrXmvga4cNIADfskYIxnq
         +rZA==
X-Forwarded-Encrypted: i=1; AJvYcCVTEw1cRD7eJBEBW+wnLVGGrN7uzFN1KLCpQAzE8itRJX9jF7NlrGnWSNM1h9Lq4Ws7vdRGaD/G++4DrS/l4sEm8w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz8tBJpbX+/JIbarLi/DYlH7e2eACzCtdguqxkDpMj+DwKLhETR
	mpN/r49nktaHLk0C8JPRbtXCncZn/vjgrvHJhDGImigBSs228X2rXUb76+DspRTztOwQzAKAp5g
	7LCzv
X-Gm-Gg: ASbGnctQSvJKotMYs7WNlXEd3MQ8QK9l8S5We644PGmTkYRB0fEPGESgTkYvt3k7Euj
	MDHfImx7sVJ+20VwalU4RI9Ca1zDgMoqg5x3YsUrT/rEsfs6qbHdCzZiwARYjLGzf5Mu59M4T7N
	mlekdee2jzwNSbPccxTJ7dP8drMeoa/ru/kzRUozJKg8oMf4d1AahjWLkxR+dxuMcJMWPhhPDbE
	97LYZA2WSOgfeSEd7HNTRTjib9MBdWrBSyxw24OlW3/Cg5APSUKPHPqJJuL8MAR3vxq9Rfh/74z
	pg/WBszaHpGQDdveZwTNP3doRZTNIBcz2U9aXSThJYzRT7I+58mbs+P2Zg1KwJ0dK7hvBGZyhfY
	hNLxjgGHwTWw49SJtM4Orlqm7sfMZyXauOIwTEg3xCEf5ir4qRW0=
X-Google-Smtp-Source: AGHT+IH96GlqyRkQF9Tp2i19ddyb00R70U/WfXK2047QWPrwcGABmw7XRm+LMSZ7+WBTf+F2sM6tmQ==
X-Received: by 2002:a05:600c:c0c3:20b0:450:cd50:3c64 with SMTP id 5b1f17b1804b1-4538eea1cf7mr29878765e9.31.1751040878881;
        Fri, 27 Jun 2025 09:14:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cb92:f366:d434:96d6? ([2001:8b0:aba:5f3c:cb92:f366:d434:96d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538f2fec5fsm29073625e9.40.2025.06.27.09.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 09:14:38 -0700 (PDT)
Message-ID: <a21bbb6439ae16c362cc967e9daa5d9effa84431.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] local.conf.sample: drop MIPS/PPC, add RISC-V
 entries
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jun 2025 17:14:36 +0100
In-Reply-To: <35468b8f-96e3-ce30-2365-9d72342407f1@crashcourse.ca>
References: <35468b8f-96e3-ce30-2365-9d72342407f1@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 16:14:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219429

On Fri, 2025-06-27 at 11:50 -0400, Robert P. J. Day via
lists.openembedded.org wrote:
>=20
> 1) Drop MIPS and PPC lines since we should refer to only those arches
> =C2=A0=C2=A0 tested by the autobuilder.
> 2) Add entries for both 32-bit and 64-bit RISC-V machines.
>=20
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>=20
> ---
>=20
> diff --git a/meta/conf/templates/default/local.conf.sample
> b/meta/conf/templates/default/local.conf.sample
> index 3a9706c1d5..749bab9883 100644
> --- a/meta/conf/templates/default/local.conf.sample
> +++ b/meta/conf/templates/default/local.conf.sample
> @@ -21,11 +21,10 @@
> =C2=A0#
> =C2=A0#MACHINE ?=3D "qemuarm"
> =C2=A0#MACHINE ?=3D "qemuarm64"
> -#MACHINE ?=3D "qemumips"
> -#MACHINE ?=3D "qemumips64"
> -#MACHINE ?=3D "qemuppc"
> =C2=A0#MACHINE ?=3D "qemux86"
> =C2=A0#MACHINE ?=3D "qemux86-64"
> +#MACHINE ?=3D "qemuriscv32"
> +#MACHINE ?=3D "qemuriscv64"
> =C2=A0#
> =C2=A0# This sets the default machine to be qemux86-64 if no other machin=
e
> is selected:
> =C2=A0MACHINE ??=3D "qemux86-64"

Please only add qemuriscv64, the 32 bit version is in a different state
to the 64 bit one (as documented in the support matrix).

Cheers,

Richard

