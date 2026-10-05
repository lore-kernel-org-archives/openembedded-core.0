Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26ADACA5FCE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 09:06:53 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15975.1791191208947555795
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 02:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=g+/pqt/l;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48afe75f055so1236664f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 02:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791191207; x=1791796007; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q+s430nKPO0tFGZQC4Y4DqId3rGD/Qz4uaeK7sZonwc=;
        b=g+/pqt/lEEmFkNGseVkfI4B3bIsKWxJBNAPum1X+we1psRDrUoxT7Pt7Cq02IXUU2i
         R97aC4zivU/u0ac9g/b0g0zAohz3k+T2/Arx8DLEj6Zeq3wdU+HH0guyGNvb+vV8z1B4
         OdvZh/RYDlfomSymhF8sVrgjFPU3xDoqbJLxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791191207; x=1791796007;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+s430nKPO0tFGZQC4Y4DqId3rGD/Qz4uaeK7sZonwc=;
        b=dUEHX3P5FZq1mWiXees1tU20KNcALwBHM6kY2LodroLywVZTRZC6tr23kvOaITPeLU
         aQs3I0ZR+5izLy6ZNn9hXK7hHhte2O5DAaQxc6/ZgvyJzik0wKUAO1w/BDuP0vtG11rn
         6sQEAG/zLo7WW89l3KuJ+0p5eshpR3K7Cxqnyey7jXEObOJbQFuFXehgJekDk2lLSZ9U
         d6rhbyrEEdX1YaOmC5zeI1VaXHkTfcuULUe/PVXHIrPZ+XY5bJfIz6DfLQvqiI2lbVbS
         qC0PteG/AQMeCqLKudjwADp6U7aCAmO0/nCdme91WUw2v8/WCA5x8WJUdh9jUQb0kC5x
         Vnqw==
X-Forwarded-Encrypted: i=1; AKwUvBz+3k40QBsPlbAGKC2g26r+jaozmR8BCkbcw2CP44tFfxOwoB+2z7RxySr1/H7BDnyaohf4YYn4Rr/JMZAyJMwwIg==@lists.openembedded.org
X-Gm-Message-State: AFuF++lBVmQ0MfeFaanjLTnR6Eus9wKguKowcn7SFQjz42Jz/UQE7pjN
	mRQnI0+LkpGO9Ug3RwbV5YWnFA8g9ESRMPh4wx+U7TrBcgwLcz+Y4n869EzF+ofKsc4=
X-Gm-Gg: AYBFou3qY0lXSitk+MkHVlg9mF3A9IvCCZKMTyFPhbzIKItNDqzHaZAnkFECuwJB1cA
	ccITLGGitokeD0QIPk3g+lCIEaWk9imnYC2cvzpO1gYgBS1AkMk3x+/t5+gm2chRMy/jjIt2+fb
	zT3UsOje1yqtFaGU0LP9O5i/WInoMl+9t4K4Xp/CEvzhUZJJI3wa0PjOsIrZHy/btnejBAFVpFf
	3Z6EyaONPpn6pE7Vo/2k0n8dVAWgdKVjnCl9CvnL7U3RNneIYSpzrEOGqW8jTzhGzusWmCrS7Nh
	kxnHV4lTE2pwOoc9uOTPvqyLRR+DW2f0l4a8jlYd3bv+bJqnwSK4cXqrZjRO3Pwp4NK5gRL3UFE
	IDZatKJY2vlgzmArVwUJzFmWyCI7uUW9dijhAz97vFfa1k0ktjEthTe//RjyAFyP3cAK7nq2nc3
	AEheKF+w/vnsyJM2zFLiU+8g51U3bt97gla6Ag01nL6fCR/vQhdeY99oBGTBkM38Fj4+vfl20bX
	bRFOxSUzrPVrzX5mcVt99wc0bDsBUI5RkswVMhewWiGRisQsYLaswqW0z8=
X-Received: by 2002:a05:600c:3155:b0:4a0:168f:d962 with SMTP id 5b1f17b1804b1-4a1680b9cf4mr97336155e9.3.1791191206332;
        Mon, 05 Oct 2026 02:06:46 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394c937csm189521275e9.1.2026.10.05.02.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:06:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Oct 2026 11:06:37 +0200
Message-Id: <DLWSAC7YXK30.1G1YB5HCJTRHP@smile.fr>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
To: <mathieu.dubois-briand@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 22/24] libpcre2: upgrade 10.48 -> 10.49
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com> <20260930-mathieu-upgrades-2026-02-29-v1-22-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-22-102c38be04df@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 09:06:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247225

On Wed Sep 30, 2026 at 10:16 AM CEST, Mathieu Dubois-Briand via lists.opene=
mbedded.org wrote:
> Version 10.49 28-September-2026
> -------------------------------
>
> This is a security-only release, to address GHSA-r9hj-j2rw-4q3m.
>
> Compared to 10.48, this release has only a minimal code change to prevent=
 an
> out-of-bounds write with arbitrary data. An attacker-controlled regex pat=
tern
> is required, and applications are only affected if using the
> pcre2_jit_stack_create() and pcre2_jit_stack_assign() APIs to provide a g=
rowable
> JIT stack, and then matching against a pattern with unusually high JIT st=
ack
> usage, such as a large number of capturing groups.
>
> The implications of an out-of-bounds write could include arbitrary code
> execution.
>
> The issue is not a regression and affects releases 10.48 and earlier.
>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> ---
>  meta/recipes-support/libpcre/{libpcre2_10.48.bb =3D> libpcre2_10.49.bb} =
| 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/libpcre/libpcre2_10.48.bb b/meta/recipe=
s-support/libpcre/libpcre2_10.49.bb
> similarity index 96%
> rename from meta/recipes-support/libpcre/libpcre2_10.48.bb
> rename to meta/recipes-support/libpcre/libpcre2_10.49.bb
> index 56791171c238..5fa7c3db3b4c 100644
> --- a/meta/recipes-support/libpcre/libpcre2_10.48.bb
> +++ b/meta/recipes-support/libpcre/libpcre2_10.49.bb
> @@ -20,7 +20,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/pcre2-${PV}/pc=
re2-${PV}.tar.bz2 \
>  GITHUB_BASE_URI =3D "https://github.com/PCRE2Project/pcre2/releases"
>  UPSTREAM_CHECK_REGEX =3D "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
> =20
> -SRC_URI[sha256sum] =3D "b6c68fdf6f3ac31388b50aa89ff0fc49c00c987c16e7b514=
6491d12003f2c8ed"
> +SRC_URI[sha256sum] =3D "53c156e1ba416a20da8e65395daa132da0d80e76910424ca=
ca3fcdae7831d384"
> =20
>  CVE_PRODUCT =3D "pcre2"
> =20

Hello,

Shouldn't this patch have removed=20
meta/recipes-support/libpcre/libpcre2/testoutput3C ?

See: https://git.openembedded.org/openembedded-core/commit/?id=3D3c44700174=
9427b151dc2e6f08c790bac77b1c43

Regards,
--=20
Yoann Congal
Smile ECS


