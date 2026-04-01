Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB7E10FCAF0
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 22:07:37 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3432.1775081256701048312
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 15:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lcWOw+Vm;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cf7683a28so151407f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 15:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775081255; x=1775686055; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zps5JzMDGAJW3GMouhcSBa4T+3Dg1Qv4aPByrlHbcT0=;
        b=lcWOw+VmuVlqcvo79iZDCgdMLW1Cyp6drsBb2g+gaBmfdK/z3Z0qwDm71YrnQqwZ6E
         BYeAUjxfK2nDTtffjEkgheBHSl0PlYe6QNXl8sLgnLkaw1EU1vWp+GcNP/vhlcCy2Q7x
         VYVwvjtu2RW15E3+sBM5XFGp3E4Uc4oHVLRKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775081255; x=1775686055;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zps5JzMDGAJW3GMouhcSBa4T+3Dg1Qv4aPByrlHbcT0=;
        b=mFcxmMRTyBKApRCy2tskhBKSOd6pKshsNw84iLKYOT4XZ739ToyxGpThLK5ksinGUe
         NV4ihrmOEuXH6wFP77wYcD7nCmnNxIfQSK/Wn/Cshg7/U8c82MSBgzFjGfvclXgA8QPf
         TN0F0Iyr9Mj9066DDORHNm0b8H43FVUduH5sjZOSRYsOPOQf1zMqNGt94Ze+0t4TaeNj
         Fr6nnmDbK2Ik4IjVpE0LobnLVkOWeosb8DzRgqLBMz8D9J4iqAeiAhGJikXDAWb/V5e2
         a4oUL5RRPYQcXjEzh63wrLpjzFf6iq0BV/I2EEkn//6HAtYFBZwvXdZoev1kC6s92Udx
         uqbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH03FkP5oiBUDs6CgQeUeZHBpS/NVPLz3nrSKtk1yV1RJBbsYtioR7ItwSBSY+6HiIzrBaLwsETdfdD1hZ6pG7bA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyVs1SELlwRc8+Opzm7KOy6r1OtRhCPeWgdb36NY9mvQO5s6suE
	AU5zmDwOMD7i9Mlp62hftMEBVn7ueb97LaZMO2Q7FxNGFWKZkpNlMWVAac0X8AjpsFc=
X-Gm-Gg: ATEYQzyWYV5gDxYqzF6zju6cMy53gaZSS+RmB5DZjTmDW1PQ085mZFgtVsarJF3JntP
	aEH8n2sfLFtSf8yoo7vgZBAzCDXJ9uMKSTdhIolz3nxl5vqcdM+6E+izpdmbuti3Q9LijjY1F0n
	6t2EL0kco2HMX0yKaUbGkGfQ9POnkMobJQJhBcwXCzofuBCAR9tF/YQSmfyy4E7XlOOq4YLoyQM
	IgG+bIxnC/S83Jc1Xf8qDxN3TxkROjzuOvNW98IG72ACwSesRGurR2my68aw4rU0xRkmPXpresk
	uW+uX/yzXX/A/P28CtrPROOUGd7RJP+49D1pCAYdUtaTIN5ivFTcU+UtWnjgTgxuoaCQmuJl3y1
	nPUZngNCaB24i0YJ31u0u6dwwqNOs0Lq/1cfwCIt/x7s3GJbs5gmTQA4V/F7tVIhZsragddREuV
	5jBS16KK8mDP3l2uIkEFbA6XseK6uNcUoJJ860coY4wt9WxPdF9mcnOblEO66uYP0qX5teIeOzB
	7na3nSbUZdes0M=
X-Received: by 2002:a05:6000:1786:b0:43c:f4df:923b with SMTP id ffacd0b85a97d-43d150fb1bbmr10220600f8f.50.1775081254824;
        Wed, 01 Apr 2026 15:07:34 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a71f7sm3520091f8f.1.2026.04.01.15.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 15:07:34 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 00:07:33 +0200
Message-Id: <DHI5SEGAUPG3.2IOU3KPLZ0G1B@smile.fr>
Subject: Re: [OE-core][whinlatter][PATCH] binutils: mark CVE-2025-69650 and
 CVE-2025-69651 as disputed
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260331113358.154901-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260331113358.154901-1-adarsh.jagadish.kamini@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 22:07:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234465

On Tue Mar 31, 2026 at 1:33 PM CEST, Adarsh Jagadish Kamini via lists.opene=
mbedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Both CVEs are disputed by third parties. The observed behavior
> (double free / invalid pointer free in readelf) only occurred in
> pre-release code and did not affect any tagged version [1][2].
>
> CVE_STATUS[CVE-2025-69650] =3D "disputed: observed behavior only in pre-r=
elease code, does not affect any tagged version"
> CVE_STATUS[CVE-2025-69651] =3D "disputed: observed behavior only in pre-r=
elease code, does not affect any tagged version"
>
> [1] https://www.cve.org/CVERecord?id=3DCVE-2025-69650
> [2] https://www.cve.org/CVERecord?id=3DCVE-2025-69651
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
Hello,

As far as I can tell this patch is also needed for master where those 2
CVEs apply. Can you send this to master please?

Otherwise, the patch looks good.

Regards,

>  meta/recipes-devtools/binutils/binutils-2.45.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/reci=
pes-devtools/binutils/binutils-2.45.inc
> index 16a63cabc5..5cd4d185ac 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.45.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
> @@ -20,6 +20,8 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(=
\d_?)*)"
> =20
>  CVE_STATUS[CVE-2025-7545] =3D "cpe-stable-backport: fix available in use=
d git hash"
>  CVE_STATUS[CVE-2025-7546] =3D "cpe-stable-backport: fix available in use=
d git hash"
> +CVE_STATUS[CVE-2025-69650] =3D "disputed: observed behavior only in pre-=
release code, does not affect any tagged version"
> +CVE_STATUS[CVE-2025-69651] =3D "disputed: observed behavior only in pre-=
release code, does not affect any tagged version"
> =20
>  SRCREV ?=3D "2f028c6bb163a045db95439fb92e1dcbc919413c"
>  BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binutils-gdb.git;branch=
=3D${SRCBRANCH};protocol=3Dhttps"


--=20
Yoann Congal
Smile ECS


