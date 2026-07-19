Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA03C44512
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 22:15:39 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.416.1784499330659159400
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 15:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bYLThiEo;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so72966505e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 15:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784499329; x=1785104129; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OZ3CgaxNydYTi5Xd1+0HR3rt3IBqemQDV+hKdTr9LE4=;
        b=bYLThiEohXlp+MpzIYG+8umDVL2AI3l4//+vGPqNa946dQ4aVICkHf+Z4jr+eqqAEn
         o5rfHGr2ebVHzzdlFqQbAZBO+YTCPM2d9ZUUO7SidghUcPH5DuOG/qDPZzbCRBdaYrHs
         rgnIlw7SYdBldjqV2eRFouIVYFWRPEDHVM7Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784499329; x=1785104129;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZ3CgaxNydYTi5Xd1+0HR3rt3IBqemQDV+hKdTr9LE4=;
        b=mA3/4t4d2x40BhzR59TPePdK4ySMK29PBxSwLb/esjAkLv8ZhIhXOVsUMQZLpjZKt+
         VrBvFwlk2/s+tTHPaBypFORZW7+foeMZsAxQ31PZuwxgxl3PAdnBVVDUQrGlgf+BvYJI
         dzIW5dXf2dbtIkyqesn/D9ekNa30XSJ8KBH+MDR5yrMJoNZeR1JDI/3gtOZ1CqbB2vtl
         zfsOv3p0qibu+NtMYyTMqCyxtGNuXo239jL9IJhT2Dq1spk/IdnoRhZk65XbntGaJWgp
         W2IAYE/HfEQ8Grg1qs7RsHmSNX5pnbEQLnniBvRnh7C1/r8CWT6REHtnWelz1teaeseG
         YCgQ==
X-Forwarded-Encrypted: i=1; AHgh+RpW+B3tHGfLl6sm9TGD5tz1fNznFuIkfUyKe0teFgjPoMSvqXaKBCbAbGNSSdg9hFk6gDq1LYdWnmp8rkhZ1B8LEQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwbGeODNx+v8EOHtldOkGT6ZdyVADVAlyKEF5TvalwhrZ7XIyV6
	T1FlVXd5KbeOgZOM/xIdpZfjX59bMWm+sLlJkV/VsFJs3CFZ2s801oP9xiXHj/yOxSU=
X-Gm-Gg: AfdE7cllGDR8CInaErWIGAPzqZZv0UVULqPwXcD7hjDRn6NEI5feqhPrys1L2Vs/ooR
	Zz6lKqqsfUTzu44wihF83zhoRh2TGiOSd7KUF65cUS7bQYzWk26emTGEtCY9E0+1PrrdbFVoeSq
	OCHbBsirYNfOBsYdl63+nXj/lGczA5l5HLHwq6ZM8mP6P7cfbsf/rbsB1tZBQ9mt0G1MQepzs6h
	Ldfu36N5nGJ48rYkc5YECTCRR6Oq7Su63e0FGDCytvNSHvmANDsoZ/wTGn00+UYrTnr+NvWfBik
	nNu4ixeJ2kS7ZR4x0K/DGoussjJfrI0DKEbuNg45+wcq2bT7UceiKwk8dBjc/G6hI1n+0y2W/S9
	fbBH+YfKcNri+DYfGnig4ioG2+SJYqIgZgHv1mDW4nufE2FommykTiyh3kqKjtjjOCIuHwJ5SQI
	H5FNaNE9sbbyyWlWF4I7PxzPAmF5DKunUZcjeTWPIw5lPetAHkmj5TnX3OqVltWqMmZAE=
X-Received: by 2002:a05:600c:350f:b0:493:e365:ace9 with SMTP id 5b1f17b1804b1-4954a3db7e8mr124831555e9.11.1784499328936;
        Sun, 19 Jul 2026 15:15:28 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm237288215e9.3.2026.07.19.15.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 15:15:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 00:15:28 +0200
Message-Id: <DK2W7U194RBL.10J1D4A3IAQPV@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] extrausers: Terminate
 set_user_group post-process command
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Anis Chali" <anis.chali@ro-main.com>
To: <chalianis1@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260713152937.200292-1-chalianis1@gmail.com>
In-Reply-To: <20260713152937.200292-1-chalianis1@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 22:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241305

On Mon Jul 13, 2026 at 5:29 PM CEST, chalianis1 via lists.openembedded.org =
wrote:
> From: Anis Chali <anis.chali@ro-main.com>
>
> Add the missing command separator to prevent the command from being
> concatenated with subsequent ROOTFS_POSTPROCESS_COMMAND entries.
>
> Signed-off-by: Anis Chali <chalianis1@gmail.com>
> ---
>  meta/classes/extrausers.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bb=
class
> index c825c06df9..94576b8872 100644
> --- a/meta/classes/extrausers.bbclass
> +++ b/meta/classes/extrausers.bbclass
> @@ -23,7 +23,7 @@ inherit useradd_base
>  PACKAGE_INSTALL:append =3D " ${@['', 'base-passwd shadow'][bool(d.getVar=
('EXTRA_USERS_PARAMS'))]}"
> =20
>  # Image level user / group settings
> -ROOTFS_POSTPROCESS_COMMAND:append =3D " set_user_group"
> +ROOTFS_POSTPROCESS_COMMAND:append =3D " set_user_group;"
> =20
>  # Image level user / group settings
>  set_user_group () {

Hello,

ROOTFS_POSTPROCESS_COMMAND is not a shell command delimited by ';' but a
space separated list of bitbake recipes functions. So the
ROOTFS_POSTPROCESS_COMMAND:append =3D " ..." is correct here. If you have
concatenation problem, they are likely caused by the next function not
ensuring the space separation.

Also, FYI, we have a master-first policy, to accept this patch, similar
patches would have been sent to master and wrynose.

Regards,
--=20
Yoann Congal
Smile ECS


