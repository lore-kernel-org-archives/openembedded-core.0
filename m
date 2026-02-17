Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5CCE68151
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 09:13:35 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8463.1771319612927105001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 01:13:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Q8cl3OFS;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43638a33157so3847650f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 01:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771319611; x=1771924411; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DT3EP7ZxbAlTiPEWsVmjIAkVl753oeV56RtfL73ArfM=;
        b=Q8cl3OFSIHubc0NBbXZDDTcP6vWHl0dqMYX3e5YgAncvKRPE2Uwo7uiUKOimnVW8hj
         liY08X3L4TKxWymTVjvkKQF0CbFhor2FhP3l2PWTkyJk+2/7PxpDgjuZqiF0DnwPeTNR
         d6Ob0Mkx7m1cAfoeXx+8yBZrvkeCRemr3qh2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771319611; x=1771924411;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DT3EP7ZxbAlTiPEWsVmjIAkVl753oeV56RtfL73ArfM=;
        b=PoMG23GSfW7ujU/PiJz0SYnEQguOIBIlqY9DzOut1H9qMtblwi88BaP3L2HkGUNDgC
         9fBrfzOeugd8oB0bvlbJFGu4/PSGY7n6FqSc09e9FskLJyQbGxC6gFjg2QMaKSDOMYph
         vqsIZTefPb6OKmEyzXdntnpTKuns9liYIKmbojMFRVbirhr/NzbzUFns3M6nFQjw0mcs
         0cp9MNIKIOjqKgBLDbnHgQcsjU7UK9jfUETHevujMOwsaO1Kd4tb/RsYTv6kmRb2AlhN
         G4dycVeQe9GbJ22ZgMV/HSrBSIM75je5h9oixrUa04kCnXgBD+uw5kj8arVly+1iMOG0
         BpQw==
X-Forwarded-Encrypted: i=1; AJvYcCVqCD3rpcc4DI0JWez7OlRPRcRGYhyCRfnL+M6pf8AM4nOA5U42bNI7krJQG/Ndmqq6APxSRUStItqNqWetAlhRwg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyh9OkPSsJbc6fCfR5VtzqCUdZNDFm8pTptCwthR4XSOoDNXNEX
	SBgDnmkW8+nyICorB5dTSSaPrO5anMTUMlJ7SOVnFxgaceu80eQ5d+qfFGjHW27T5uAiX5q0k5B
	k5CkY
X-Gm-Gg: AZuq6aLGfIzx5P2b9CdRdLL3NR7nlaAMKDC7bKx3nVKKxDMpt87aRTe9wu5QZ5CVw/d
	BTEYY/3MRhtKhoId+6P9jXjVwEVfJ4NmLCvNYdpTT1NxZ8HHYiCDJVASTdq7bjnlpgzK/0h2t2T
	H1JqE0yohJnsCdgoqf7XU/DApCUbBayqdu0z7bbvqVJXwkP47OQ4hQofWsq3+vQ2t7ZzeZpcU8v
	ZYbfhg+rSYDMBoOLjgE5Dxdi+1Uo62uDkIgGV0bXvl/e4EeYl4sWnzwzupPz4Cfnhrej8dWKP2f
	6nw8w5WfOu3LfbxjWVgbZBDCVkEd/kkuUrHyglws96+eEf86Zz7Z8wLuk5Bm/1ylHeQruW8trjD
	TIKp/VgFB4q3wZj1PPNoM6lnhDDgUwNt38/4eZRre1I7LhPBhsPxKRb5N9AjXUUBGRTkagbhUgl
	2ejDJSbqP6lkbPKXvNGso0dTkWHd1m44ltDENS4pNldD3KJ2xCGfZIV7FROIcTxGcQKPm6W8V1y
	FAd+i9M+ts=
X-Received: by 2002:a5d:5f82:0:b0:431:3a5:d9c1 with SMTP id ffacd0b85a97d-4379791c1a0mr23434509f8f.30.1771319611101;
        Tue, 17 Feb 2026 01:13:31 -0800 (PST)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac800esm35233575f8f.27.2026.02.17.01.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:13:30 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 10:13:24 +0100
Message-Id: <DGH4E8RFJGEA.R2SUJPB21TR0@smile.fr>
To: <ukleinek@baylibre.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] busybox: Enable SELinux support if
 DISTRO_FEATURES contains 'selinux'
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Joe MacDonald" <joe.macdonald@siemens.com>, "Yi Zhao"
 <yi.zhao@windriver.com>
X-Mailer: aerc 0.20.0
References: <20260216164527.864396-1-u.kleine-koenig@baylibre.com>
In-Reply-To: <20260216164527.864396-1-u.kleine-koenig@baylibre.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 09:13:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231232

On Mon Feb 16, 2026 at 5:45 PM CET, "Uwe Kleine-K=C3=B6nig via lists.openem=
bedded.org wrote:
> If selinux is contained in DISTRO_FEATURES, enable CONFIG_SELINUX which
> needs a dependency on libselinux.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>
> this targets oe-core master, but it would be great if it could be
> backported to scarthgap which is what I'm currently using.

Hello,

Thank you for the patch. However, this is a new feature and would change
behavior for users of BusyBox and SELinux. Therefore, I cannot take this
patch for Scarthgap.

Regards,

>
> Best regards
> Uwe
>
>  meta/recipes-core/busybox/busybox.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/bu=
sybox/busybox.inc
> index c85117efc80f..355c01973848 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -4,6 +4,7 @@ HOMEPAGE =3D "https://www.busybox.net"
>  BUGTRACKER =3D "https://bugs.busybox.net/"
> =20
>  DEPENDS +=3D "kern-tools-native virtual/crypt"
> +DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libsel=
inux', '', d)}"
> =20
>  # bzip2 applet in busybox is based on lightly-modified bzip2-1.0.4 sourc=
e
>  # the GPL is version 2 only
> @@ -86,6 +87,7 @@ def features_to_busybox_settings(d):
>      busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv4', True, False=
, d), 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
>      busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv6', True, False=
, d), 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
>      busybox_cfg(bb.utils.contains_any('DISTRO_FEATURES', 'bluetooth wifi=
', True, False, d), 'CONFIG_RFKILL', cnf, rem)
> +    busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'selinux', True, Fa=
lse, d), 'CONFIG_SELINUX', cnf, rem)
>      return "\n".join(cnf), "\n".join(rem)
> =20
>  # X, Y =3D ${@features_to_busybox_settings(d)}
>
> base-commit: 2c20c05b324e5d6564c8554381019170839509bb


--=20
Yoann Congal
Smile ECS


