Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B5DCA5FE6
	for <webhook@archiver.kernel.org>; Sun,  4 Oct 2026 07:31:33 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19705.1791099087026170665
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 00:31:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jNY3gG67;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d8239so7871325e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 00:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791099085; x=1791703885; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IDG5RMmpbRpdvkjhn64ZuEwGBqjvG8yDjmrHzotoYGk=;
        b=jNY3gG67R/pRBMja5unF7dljNXNB1EXzTjPoyG8Q9UlRzzYMzveE26Z7ev4UcknD2J
         xomOF79VWjZQJ9jZpgXJoKdPHBEj5/0nkwt7fdCGDMYPBFB14VbRCmEEheQm7YsBNLFZ
         SRIJiUlMrnQnKQ/1VtF0gbf+PxmrTPCwFrkgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791099085; x=1791703885;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IDG5RMmpbRpdvkjhn64ZuEwGBqjvG8yDjmrHzotoYGk=;
        b=u63YuBLLTPhiygyH7FgDg9xE8sxFgyG/+XiImzrPFK+HqULO2HjoXn1m/MgXRaQHo4
         A2sTo3SoV+nW1yGGw5WdRZTobBXdPShglgSFwA5NX478u5On+rBLvwehlGKGmOCJAW0X
         CjdDiH4qTrrOY3TW+UPSDAXSOIOcwanFbpOU/Qvhns5VWrDO98GXDebMrD7BzXInLelp
         rxg15Nkqz9sWsqDAHoX+QIxXkouwVhkpBGLGIQaGVbpjsWxyocsQzeH9HNdEFal1sKHZ
         dTFZIQq1XeQwKI9BP4uy/0kJzhv4wQUXYry8xvwgC+/Fq6eYgFGZT0Lexh1q3wYLXK+W
         2otg==
X-Forwarded-Encrypted: i=1; AKwUvByK6bzNICFjfRxGV+iIKGHqhF13TyLYvjk9d6Lft+lrxHQTcpW2VJwL9l9UQUoBCaPy9mMTR1Dro9GkJa/OqUKxbg==@lists.openembedded.org
X-Gm-Message-State: AFuF++l3WNk4QV4CHPaAj0IPMFm0qLybgUt/k/lZP5ohtG6+xEykqwd9
	weQbGM/RCaZ8T9Wu7yP3yxc7eRSItHQQj5i6DfHRIRMfW7ATr54uTZ3aVGFCHXbtdIo=
X-Gm-Gg: AYBFou2o0EBq3Hy5gPI4R3GM7md5gZDxaCqMCNDy7z4yj/+67deQTtdFNntt6KbvYqJ
	EGdRFbCa8ZptvxPpA1Vk+RRWM5ipkuKEf+xnIcnfDILaepWqPY8vMH49WosgWdw2Mdp2ttMyJaC
	9hxRiCgEpkyWS6EJUuzf8/48g3e6IGhFwYBuYNOjOwK4lYuy0FvrwLQpt+j/YfgPMAeZLWuiO6U
	zS2fEYr6UpTCTCTjSDtJweykdlrJvi3KS/hdnWpa2LNbUmBH03KcI4jmWUTTX+7CL9N04n8BP0O
	z5/7NbXY1q/88Ro3E+mTmSXKOD4S0VhM4NAbD/gd9pNJxQ9kxt/E+EBGJS75kG8ISLP2jjUDuCa
	BBd/tEqHkv18+FDVj9BvxPAYxZxf/LqJTQYOrAwovwZj+9SHiQfklWJbvfdQgjK4hruKA3IhbSH
	djX0AFsk80oih3duKN8q2ZPBTIHlzYP3Q14CzOjw+X6DJ0byM+LmvPVvs1tFjfXit5fE2HKoT8z
	OplXgil04Z4Lr8JJxaZfwwmgkzNf5bW5ADZYuxiiAOKJirI1JOyV6Yc/t869g==
X-Received: by 2002:a05:600c:8716:b0:4a0:108:3b48 with SMTP id 5b1f17b1804b1-4a0275670ecmr136040365e9.7.1791099085209;
        Sun, 04 Oct 2026 00:31:25 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027727cecsm240802145e9.9.2026.10.04.00.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 00:31:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 04 Oct 2026 09:31:24 +0200
Message-Id: <DLVVMW89P2VR.3URHAQSDYGZM1@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] systemd: patch CVE-2026-4105
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261003194926.1818550-1-peter.marko@siemens.com>
In-Reply-To: <20261003194926.1818550-1-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 07:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247194

On Sat Oct 3, 2026 at 9:49 PM CEST, Peter Marko via lists.openembedded.org =
wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Pick patch per [1].
>
> machine-varlink.c is not yet present in v255, so drop that hunk.
> Same resolution is also done by Debian in [2] for v252.
>
> [1] https://security-tracker.debian.org/tracker/CVE-2026-4105
> [2] https://sources.debian.org/src/systemd/252.39-1~deb12u2/debian/patche=
s/CVE-2026-4105.patch
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-core/images/core-image-ptest.bb  |  2 +-
>  .../systemd/systemd/CVE-2026-4105.patch       | 32 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_255.22.bb   |  1 +
>  3 files changed, 34 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-4105.patch

Hello Peter,

> diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-=
core/images/core-image-ptest.bb
> index 72081f938de..024c69e9fda 100644
> --- a/meta/recipes-core/images/core-image-ptest.bb
> +++ b/meta/recipes-core/images/core-image-ptest.bb
> @@ -36,7 +36,7 @@ QB_MEM:virtclass-mcextend-python3-cryptography =3D "-m =
5100"
>  TEST_SUITES =3D "ping ssh parselogs ptest"
> =20
>  # Sadly at the moment the full set of ptests is not robust enough and sp=
oradically fails in random places
> -PTEST_EXPECT_FAILURE =3D "1"
> +#PTEST_EXPECT_FAILURE =3D "1"
   ^
I don't think you meant to add this hunk to this patch.

Regards,
--=20
Yoann Congal
Smile ECS


