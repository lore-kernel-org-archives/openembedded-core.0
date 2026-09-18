Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3D1C982DA
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 12:36:01 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10033.1789734957991942706
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 05:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=y04WYB66;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so9488135e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 05:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789734956; x=1790339756; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9TkT5mb5Y/r2TYftL+QvrcW5yDbGGweg/MsQh2Qssfs=;
        b=y04WYB66dBVDyUH6L+wYb4T1m2oQxilUFfCXVI0tczdb+fOi4WTshj+69FxeUBnNeQ
         eyxVsWgjgsygcToZNpITw9Xfp5cm2fWRKJV+8RDkiAk2TuOlLdIKHHJr2YQjnX+3oMEH
         CdYD0OKaBprfEHxFJw4ld818FYP8Rnc+FWs3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734956; x=1790339756;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9TkT5mb5Y/r2TYftL+QvrcW5yDbGGweg/MsQh2Qssfs=;
        b=H2vyfWv9WoyKyBiA8h6t1nro/WDSGesmh5goXQf06znPKEvgqZAc9d4Dvg/8W4mPj3
         94BCGHFnImjUIFc4JpBvlMqd1gnkiDO/UeZ/iDWMdpnjI6wEuLfZkddQd25uvvyFppEz
         6sGtkRwN80O5M7wptSHk/9iaL2LTcht0zg6pTgFdnSxpBDY1b6xOCZDhTSM7xQ3FggUX
         GAZ7SJwmGTgJ+cnpQQuR3SRJsPBVtxqOQOMv2fllO74x6xQZbO4mkpBI8ptGRsOt3BRk
         KppK+krKzgZU/4MxLQo7mdo69U+PkwcnoRGIvAzm/9cGsnN+JuuVnIRj2L6jhf04VCtE
         bqQA==
X-Forwarded-Encrypted: i=1; AKwUvBzf2Uhuwk22+SNWa+7mxhXaCmvC4FPb76ADqP+lRYSelV7qkeN9DLpaGfhahOIc94zwdLQ2ilZeISCPG3zPZ6dFbg==@lists.openembedded.org
X-Gm-Message-State: AFuF++mFVTTRBWkI1/cnD6lJVB7puOsc7v3FkTQQgIRo2LKdbs3QNdyf
	1S5cL5aqBmoRoJJbKEADLpCpouAa2KMZE8tJoKL46SzpFBT4ItDYAhftmf+p8j1gMYQ=
X-Gm-Gg: AYBFou27C6szZb1T9HfllbrsRj5XWEHid1QR+S0/68Jj57Cahn938KEMXaxzgECfUtw
	Gb7lVrjgC8f3/4AUMbyH/2+UlE5yNJHcJI0wKTcs2NqQQADoimUVEsZaz7KLP7iF8eVQvaTQU65
	ktw92g0fLuIOPRiF8FxYi4W9MbqH3mOPW+WBka3dhL1FKI0IduHIaPLA0aClPsP8RArbLRQEQ+F
	eTXYQbITy/zI/ldPF5ZmeGWUJe9hpWmZ5GNITHXH0BnNVHdaRB/evH/j5ArA2+OO0d0arxNTpfS
	gF6IpOs7Ih6b/KFnOvBUOK5Dps2cncwaXZIOBfOxW4KR34esMuUwt4J0KG0bNWRTgJN3O0St3Ye
	KSaZL1sMlLhEAwPQhC/c5eiJMXpXZtYupfAIldd7vLsfORUYo5qMf4cCfv7TORlQyccQyRZRgxP
	78YV103/h+A9R8YAokeq3Eu7dWUHyirDa/U0gjxqmDoc7hORMbqKknbiKFHrYSVTdsrVVrRMacw
	FGT4HiOf/7ZtyWR3WINV18T2KN2iOWpri2ebDPzZslB2nqocHnZv2LlTYt4S5c=
X-Received: by 2002:a05:600c:3ba0:b0:49e:73d3:78ab with SMTP id 5b1f17b1804b1-49fc55adc12mr36723535e9.0.1789734956007;
        Fri, 18 Sep 2026 05:35:56 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7d8cee0sm48225185e9.15.2026.09.18.05.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 05:35:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 14:35:55 +0200
Message-Id: <DLIG3BZPRJ4C.32VDD64KCMMC3@smile.fr>
Subject: Re: [OE-core][PATCH v1] core-image-ptest: raise ptest timeout for
 openssl
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <pratik.farkase@ericsson.com>
To: <pratik.farkase@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260918102921.20511-1-pratik.farkase@est.tech>
In-Reply-To: <20260918102921.20511-1-pratik.farkase@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 12:36:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246216

On Fri Sep 18, 2026 at 12:29 PM CEST, Pratik Farkase via lists.openembedded=
.org wrote:
> The openssl ptest suite passes but its total runtime can exceed the
> default 450s ptest-runner timeout on loaded autobuilder workers
> (observed DURATION 566s on qemux86-64-musl), so ptest-runner kills the
> run with "Timeout!" and it is reported as a failure even though no
> individual test failed.
>
> [YOCTO #16430]
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---
>  meta/recipes-core/images/core-image-ptest.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-=
core/images/core-image-ptest.bb
> index 22bb23c0e7..f61399abe5 100644
> --- a/meta/recipes-core/images/core-image-ptest.bb
> +++ b/meta/recipes-core/images/core-image-ptest.bb
> @@ -11,6 +11,10 @@ HOMEPAGE =3D "https://www.yoctoproject.org/"
>  PTESTS =3D "${PTESTS_SLOW} ${PTESTS_FAST}"
>  PTEST_RUNNER_TIMEOUT:virtclass-mcextend-python3-cffi =3D "600"
>  PTEST_RUNNER_TIMEOUT:virtclass-mcextend-go =3D "4800"
> +PTEST_RUNNER_TIMEOUT:virtclass-mcextend-openssl =3D "700"
> =20
>  IMAGE_INSTALL:append =3D " ${MCNAME}-ptest openssh"
> =20

Hello,

Thanks for looking at my bugs :)

FYI, the patchtest issue:
  FAIL: test mbox format: Series has malformed diff lines.
  Create the series again using git-format-patch and ensure it applies usin=
g git am (test_mbox.TestMbox.test_mbox_format)
is caused by "@@ -11,6 +11,10 @@":
                           ^
This means the chunck is expected to be 10 lines long after the patch (I
think 7 should work here but - please - regenerate the patch from git,
it will compute that.

On the patch content itself, we don't usualy increase timeout without a
good reason like high AB-INT frequency, analysis to show that this is
the right solution.

In this case, if you want to look at this bug, I think you should try to
determine what happened. For exemple, which test triggered the timeout?
Is this test prone to load related issues? Is there a related issue
upstream? a fix? ...
If you don't want to look at this, I'm fine with waiting to see if how
opften it reproduces (if ever).

Regards,
--=20
Yoann Congal
Smile ECS


