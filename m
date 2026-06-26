Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C001CDE008
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 08:38:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31113.1782463135667880183
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 01:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Cnwnr8XM;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-492329c5514so2736155e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 01:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782463134; x=1783067934; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbW20AocAlr5g85vUTUP5s2H4YSaE8utn+MqX5EfGvM=;
        b=Cnwnr8XM3yrknPyxV9nNuc+UEofXtXyFWStbjFrAYm9sjaGL1A2o80o+v9p3ZPO/kh
         hulaGLMf/939Cfwqdta1kwhCt3JcRRaxAq6WHCnyt6DcgC5Xba5O07hgHf6qjekyguRi
         6uym3wVSMCFBdMYaetbn1O9vL8F22PxNksfqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782463134; x=1783067934;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GbW20AocAlr5g85vUTUP5s2H4YSaE8utn+MqX5EfGvM=;
        b=BMoMerG7TXTdgnWP6MbP2BnPVVVTp+z5YOmO2APRLzmmi0qB41xmhtTvMXMw7dD1fG
         xwdVFs2PUZkBOVodsuMh+rtJ70O6qsGyT7yMAnGv34umKkACVqqyV+WB3wQQxPUFPSzY
         KgbC5b6ssVQ92TyYhuWkPKmg7LEHs4wXv+2fEvhiJuKopcY67IuDaz9vaVfSgUS8Zz9z
         TI39tyvXATod0Pgp+umsosnZOZ17cuWvkLD6AqqoEoM4z0Y9BHsYHwDxuD0JviQq+Wep
         833Q2cKpcUgW7iohyA6fZumMZQNxIYDiOy9aJsZ4TFg4dlpvk8gBIWS7OJElW5XbLNmi
         g2ow==
X-Forwarded-Encrypted: i=1; AFNElJ/y4eXpZG2py67kup5ZmiISPj4Ld0FeZSA5LCcDMNRKOs2MTp3vDJK9JCsUjEs2lzApCY/vna9YmR0Co/gQ5ULysA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzKF8Subl7V2ASiBfsRYzpNKKOh4PUxE1XmhX/Fn1d6Ob7KMFl9
	dKY453bylFrDbGZcATp/+ml+qJO2GE47l+139iBxdZN9WokWJr2vrgYnWsGhVrv3FaE=
X-Gm-Gg: AfdE7ckT8UMIX2bncwv/MlIeXRNaiKBqaTDl8s41z7URA3B9f3YmPXDqWqwbPfVArct
	oIljCn4pz7BdxbhHr8dlfP7Zb32k6ezDthnmug6ncE1EWn3nCXhKVhFQ3KSyHtzWlecd/KMFs1T
	JUXpkxnnizkWNCVlIbry7xQ8RZMgmRkrkqjRD69x55Sf4L2qgvGteFLQYI6MeRfS4HZ22tp3x+8
	b/tVmij9uwUi8WfGVBU62KZ9K00ZR7PLujQx74MaD1v03AnPkhS92I1Q31n+yQTX9+RWwQuxPrm
	KE8TtAbz+pcj32O4cJ54AP1sgdEmq6f5CKl5ulHX/8M9vOyRkspY8xD9y3P8trMIsNUUDHU0T2U
	O8JyK7FhArGYJ55WEgaSzBARV/T7ejE/Y1p+RGO/awU8IoHofwnchw9lVEHLh1J1QDpnmg8jMuj
	+9Hc0Yoo8dFSLtIhAvQmQXwAM0Zaa6ZhYZzUcjJ3ogp+8uQluJXKactlKHYNLf/JbQ2DxaFp7nH
	jEcUA==
X-Received: by 2002:a05:600c:c493:b0:490:e180:2e0 with SMTP id 5b1f17b1804b1-492663d6dbamr74655385e9.3.1782463133774;
        Fri, 26 Jun 2026 01:38:53 -0700 (PDT)
Received: from localhost (2a01cb001331aa00dc663d106f146c8c.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:dc66:3d10:6f14:6c8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268f7670bsm60227715e9.0.2026.06.26.01.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 01:38:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jun 2026 10:38:53 +0200
Message-Id: <DJIUG2YB576E.2A3V5VHSARVBR@smile.fr>
Subject: Re: [OE-core][PATCH] python3: skiptest tracemalloc_track_race
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <Kris.Gavvala@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260624223336.1254487-1-kris.gavvala@windriver.com>
In-Reply-To: <20260624223336.1254487-1-kris.gavvala@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 08:38:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239616

On Thu Jun 25, 2026 at 12:33 AM CEST, Kris via lists.openembedded.org Gavva=
la wrote:
> In python3 ptests for whinlatter, tracemalloc_track_race fails with a seg=
fault.
> To avoid ptest failures for now, skip test_tracemalloc_track_race in ptes=
ts if using glibc or musl.
> Making the change on master to backport to whinlatter.
>
> Fixes [YOCTO #16182]
> Upstream Issue: https://github.com/python/cpython/issues/143143
>
> Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
> ---
>  meta/recipes-devtools/python/python3_3.14.6.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3_3.14.6.bb b/meta/recipe=
s-devtools/python/python3_3.14.6.bb
> index 291bde70f6..0fd1831b86 100644
> --- a/meta/recipes-devtools/python/python3_3.14.6.bb
> +++ b/meta/recipes-devtools/python/python3_3.14.6.bb
> @@ -320,6 +320,14 @@ SKIPPED_TESTS:append:libc-musl =3D " \
>      --ignore test.test_ctypes.test_dlerror.TestNullDlsym.test_null_dlsym=
 \
>  "
> =20
> +# Fails due to potential race condition so remove it for glibc and musl
> +# Bugzilla YP 16182 (test_tracemalloc)
> +SKIPPED_TESTS:append:libc-glibc =3D " \
> +    --ignore test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race =
\
> +"
> +SKIPPED_TESTS:append:libc-musl =3D " \
> +    --ignore test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race =
\
> +"

Hello,

I'm not sure we need to specify glibc and musl (do we support anything
else?). Most likely, we can unconditionnaly skip the test without
override.

Regards,

> =20
>  do_install_ptest:append () {
>      sed -i -e "s|SKIPPED_TESTS=3D|SKIPPED_TESTS=3D\"${SKIPPED_TESTS}\"|"=
 ${D}${PTEST_PATH}/run-ptest


--=20
Yoann Congal
Smile ECS


