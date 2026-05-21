Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E657FCD5BAC
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 09:00:23 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32308.1779354018950224353
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 02:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dhmmb3gj;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso43537605e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 02:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779354017; x=1779958817; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTLu/HoT7PAOpo+iNhdZmTYlsrRYpHDPRstV1qULlNI=;
        b=dhmmb3gj7Fc92kNNaPUlype+fQNTYP55gW8XIdN1H+1bau++lBbsAbMFhZCjGRfgN5
         P6QSbhO+VMRN9aw0w6/saWzG3qRXFJv25gx8ReNimNJerziy2JKLkbfU92LkFwuzVbfM
         cIZVqcbhNH2YdaVQX7Uoh9kaNOKl6dJmZKE3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779354017; x=1779958817;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zTLu/HoT7PAOpo+iNhdZmTYlsrRYpHDPRstV1qULlNI=;
        b=BOzJXlBsGDOwaFJu1UdtMIlPZCbE/Kg/I2sskiYB+wCBCUekDzl4DWw4S13+32RWTy
         hWzPrhKtTcQFtLdYtxxvhFFeAViWbql4avXWQmlRebCN8fxysAM4dvMgYPVjdkALQPak
         jvCeg2g/h+1p3vb6LwIbyC385P3V21pht40lvq0VuAsPKhVX1MKYZeE6LA1WvIpbyhrm
         hVCDpZ27y2n29z/HBknJ1Lsi/ViNWlRAp1zbDuSAoOvT5ceh3wQo5aw2Ki6A5kVE6Adx
         4JMjerkhIhOx8Fxh9tjWh2omMzm4koDPyd/GaY4qM7M4sqOrBPRjyg45W41W53yEAUyr
         4quQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vxEBwYXbu5k9DUbygItqexpEbnuEGQgijLva2o9u1Tleqd/SVqoqJc6dkGeAAhVWQL6kCqAgb/X7WsgY+SMmUtw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzfrRvnUsi6Iu03Jn4MT2rLQlvoQKGPlEWQqxvstKvalgEHC/6O
	tSdRSOw2R8G23n7w86c2lMEMmNbtYnEtyyKTbU9U1nY5rKQMxUXir9zcFUo9CkAb+7zjdwmE+yH
	/919C
X-Gm-Gg: Acq92OEN62qMktsFeA3ZtR/VZWTBhLqor9onxog8pgJfTifKx5X4tzXHr9DD5Gtp5Vs
	PalmUq0HL6AUNxPjePeK1Rihn9oCuldOBe5SIQhNincpz0Yw9VM4ZY01XQsoCZCZIk1oo7Hs+Hd
	UKBrr4pPnz2Y0IeHgZ7JrFFJYORyheUm+1WVo6Y4rPJ1xJNtOdQvc09aqwFD+cuZbLFApwKbSRn
	trEYorOGYDqKsSvOHnAHcJjCw8fUE4qcthPC1tV1fR/+RxGhV+I8ANH3hIsN8YiQSeO8I5tbHEg
	VNVEvC8ybhbODAGdlR+fZzwfS631ISwobpxlu40bjVU+q+GsPN7QD9hM0BNeQimAR6OrQcTsCuQ
	Yrq9L4I2eOec9qOO8g1hLVlXbge/qpctqasUuQpZ++zdDb3mgjnXLPozwvW+p8re+jP7K4tCUWc
	9FdpqEanqzNyZt3lXDSHoC21VSz2isHQ7ENK3iX3SITZDbbaVgZmX29iXrRwcVK1D3HX4OUppV8
	kXA1rc1O330PQ/eR84Jg1ExQQ==
X-Received: by 2002:a05:600c:c086:b0:48f:dfe3:dae4 with SMTP id 5b1f17b1804b1-4903606b808mr20909905e9.13.1779354016885;
        Thu, 21 May 2026 02:00:16 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d52c8bsm55422345e9.8.2026.05.21.02.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:00:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 May 2026 11:00:16 +0200
Message-Id: <DIO8CUB3VD1U.39NH95XC3C83@smile.fr>
To: <changqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-selftest][PATCH] meta-selftest/files: add
 postfix/vmail/postgrop to static-passwd/-group
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260513072651.2235181-1-changqing.li@windriver.com>
In-Reply-To: <20260513072651.2235181-1-changqing.li@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 09:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237483

On Wed May 13, 2026 at 9:26 AM CEST, Changqing Li via lists.openembedded.or=
g wrote:
> Package postfix-bin create postfix/vmail, and group
> postfix/vmail/postgrop, add them in static-passwd/-group to fix the
> failure as below:
> 2026-05-13 15:16:49,656 - oe-selftest - INFO -       ERROR: Nothing PROVI=
DES 'postfix'
> 2026-05-13 15:16:49,656 - oe-selftest - INFO -       postfix was skipped:=
 Recipe postfix, package postfix-bin: system username "postfix" does not ha=
ve a static ID defined. Add postfix to one of these files: /build-st/meta-s=
elftest/files/static-passwd
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---

Hello,

Postfix is a meta-openembedded/meta-networking recipe and postfix has
already a static id defined in
https://git.openembedded.org/meta-openembedded/tree/meta-networking/files/s=
tatic-passwd-meta-networking#n4

You may use this file by adding
  USERADD_GID_TABLES:append =3D ' files/static-group-meta-networking'
  USERADD_UID_TABLES:append =3D ' files/static-passwd-meta-networking'
to your configuration

(This is what AB does: https://git.yoctoproject.org/yocto-autobuilder-helpe=
r/tree/config.json#n396)

>  meta-selftest/files/static-group  | 3 +++
>  meta-selftest/files/static-passwd | 2 ++
>  2 files changed, 5 insertions(+)
>
> diff --git a/meta-selftest/files/static-group b/meta-selftest/files/stati=
c-group
> index 6a9ece20a8..914d387ee1 100644
> --- a/meta-selftest/files/static-group
> +++ b/meta-selftest/files/static-group
> @@ -31,4 +31,7 @@ audio:x:532:
>  empower:x:533:
>  cmake-example:x:534:
>  meson-example:x:535:
> +postfix:x:536:
> +vmail:x:537:
> +postgrop:x:538:
>  nogroup:x:65534:
> diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/stat=
ic-passwd
> index 98017c8153..3a75aea754 100644
> --- a/meta-selftest/files/static-passwd
> +++ b/meta-selftest/files/static-passwd
> @@ -21,3 +21,5 @@ ptest:x:529:529::/:/bin/nologin
>  xuser:x:530:530::/:/bin/nologin
>  cmake-example:x:534:534::/var/lib/cmake-example:/bin/false
>  meson-example:x:535:535::/var/lib/meson-example:/bin/false
> +postfix:x:536:536::/:/bin/nologin
> +vmail:x:537:537::/:/bin/nologin


--=20
Yoann Congal
Smile ECS


