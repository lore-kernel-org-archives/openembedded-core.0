Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7C5CA5FBA
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 10:52:07 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10568.1790765521773151955
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 03:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=U9BiGBsa;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso48381425e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 03:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790765520; x=1791370320; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHfvFY0z0wphv9buT9AC/U8D0ipQ6n0DbjcqeA0Kxv0=;
        b=U9BiGBsaHopGqqrV9IA5I7dVWDp014cHG/sDoilYzfmeLFT54xBiMr29VDb0UcHAAw
         YEfnluDClZtFFTsLSv/XMQGIzYjnqTZEjgeb5czaeEhK4LOInK/DL+x92WP+yFElLBrb
         ywxJ+2T/36mmBtDuYoKNkmnUICwa60cO4cqJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765520; x=1791370320;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHfvFY0z0wphv9buT9AC/U8D0ipQ6n0DbjcqeA0Kxv0=;
        b=Uoz4KaFiTZHQpSuhsOnvtxCnl3tpTJQL+0klp6x/p4a8X1tlzeeanzzXsobXlaJZwN
         V6v//wtu/GKqLWTK/b11zJHWYonrg4EiOOjg8tsHrXhQE1SsEngWHDed08fWpIjgoWH1
         8xHjoy+z4ePLlR9gH9o1HIgnMPBnmu2wv3tdFX9mApD7KYesdC6MSoz+vFkRLzIQE0pc
         Yj2Zyr1k+bi5xQ4KsVoztP8pYdnGBD5J+LynXvOgPsGOeh8rS+/sKtgyYxT7GgGX82OD
         IuhECAYoJ12XrPDZsK82fuS9b+NSCoWtbXElK96qVlRVpXHt/5PFhlGB0ymCYntmimB8
         MMIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnPNHv8ZHdTNlrovbI21vCjgt6LVDriSfZXLr4B7c9/EoMXLxmfenmgOVdZkY+/uKq+WXPvCy6bcQ4tsgnbR1uYA==@lists.openembedded.org
X-Gm-Message-State: AFuF++lVdx5+vjGfVsreI5NmWMDHl8s8kJQy5a3B7NvTVBgS1WPQvJhA
	IC6QphtEEVjdbPYaEz0ERfZrbABVQ9HQPiil8dSVwTkZEjrj4TMhTBLZjT3RnWxsndmkkipGqHY
	EC9+XTjM=
X-Gm-Gg: AYBFou1L8e0H173CJzwqGE0N0GQ39yYHrkIdAzmD1dLQEa8vcw9MKxIPJBDiLZAq39k
	MBOa72sjEZyxktwm48pl4RhpuuLENP3XMP2BZHTLudn0ZeBZ39Wi9r2I/SsLj8NlocZAc1zsvu9
	nD/Kw8cIhcxeAtdC+cuQFMV2wt+ZdUTDk6p17mg3tx/G8YCvk/COYXPuXID7QD3oT34PrKKF+ZC
	B3K886rqAWmovEkpPw2gIxdbkYr9O8PbMBFe3Cl5/hRlk94ahQ9RQPFUkp2Aq4He+S5hG4K1en5
	JvRwon0qXXp8yJlb4lnyTNl0e79iSLaYIuh4/wZANnpd7hgE/arSaAAyThXdMWgg7sSAAmN0FIV
	EWCegQbpSt5P5LA8NzTsGNItWgrSwuWNEZlZ2UrUbiYnmapCJQFRpca0oCzJ/XJJ5nmZi+/Y/Jj
	Y7c50fkF6Sw3nGaL9T9PkYkoQKNsQlk4clIP3KbBmAPQ/VpE8GQ6/FETh5MMhOxDq31Cp56SzjB
	HG6Bp2MbfMckgpffaq9DSlQdCRltmkVQAx688SpNxXT33uKpyslUkGFtl4=
X-Received: by 2002:a05:600c:1c01:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4a01aff256fmr19374085e9.12.1790765520006;
        Wed, 30 Sep 2026 03:52:00 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01ca310dbsm1989695e9.0.2026.09.30.03.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:51:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 12:51:59 +0200
Message-Id: <DLSLEAJAX9WM.3I2JXBF45FC4U@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH v2] libaio: update SRC_URI
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <preeti.sachan@intel.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260915044458.2583011-1-preeti.sachan@intel.com>
In-Reply-To: <20260915044458.2583011-1-preeti.sachan@intel.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 10:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246954

On Tue Sep 15, 2026 at 6:43 AM CEST, preeti.sachan via lists.openembedded.o=
rg wrote:
> From: Ross Burton <ross.burton@arm.com>
>
> libaio has moved to Codeberg as pagure.io will be closed down shortly.
>
> Cherry picked commit 237c32e181cd47194c3877d220360d6e6fbb2af8 from master=
 branch.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Preeti Sachan <preeti.sachan@intel.com>
> ---
>  meta/recipes-extended/libaio/libaio_0.3.113.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/libaio/libaio_0.3.113.bb b/meta/recipe=
s-extended/libaio/libaio_0.3.113.bb
> index 2392fd5db2..1668f4069f 100644
> --- a/meta/recipes-extended/libaio/libaio_0.3.113.bb
> +++ b/meta/recipes-extended/libaio/libaio_0.3.113.bb
> @@ -5,7 +5,7 @@ HOMEPAGE =3D "http://lse.sourceforge.net/io/aio.html"
>  LICENSE =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c1cb29a1e3fd737b=
499"
> =20
> -SRC_URI =3D "git://pagure.io/libaio.git;protocol=3Dhttps;branch=3Dmaster=
 \
> +SRC_URI =3D "git://codeberg.org/jmoyer/libaio.git;protocol=3Dhttps;branc=
h=3Dmaster \

Hello,

In this case, the cherry-picked commit added the tag=3D parameter:
https://git.openembedded.org/openembedded-core/commit/?h=3Dwrynose&id=3D237=
c32e181cd47194c3877d220360d6e6fbb2af8

Is there a reason to remove it for wrynose? If not, I'd rather we keep
it.

Thanks!
--=20
Yoann Congal
Smile ECS


