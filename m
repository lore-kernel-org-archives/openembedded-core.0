Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C081FD9E1F
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 23:16:04 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83471.1772147761558960136
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 15:16:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Q3I9gcuG;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43991064db8so1438719f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 15:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772147760; x=1772752560; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIPJ1L1voir8lzLttCt0+yN4IzLYDLTahRblFKC0vTk=;
        b=Q3I9gcuGjOzyJc4hsUCgXxcBUfSwZKkZ9aZiNc0QETZ1+tghDGq3b85TygRSBB7D/8
         CAP+CrVgUuSxJobAjQm9bSd4RZWKvh0dqz9362NdsG0II5T+98J0kOtdk9+ejs+OvzpM
         jawJS2xdGhc5Zsud5gY4UeHwL4yQPRlYft/BI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772147760; x=1772752560;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LIPJ1L1voir8lzLttCt0+yN4IzLYDLTahRblFKC0vTk=;
        b=Dr5tww1Num9g2E/SCItdkVO3bs761B2pJ6kNffeLjPdWJ7wXs5AzYxHs5HwELT+EK9
         Z93lXNLq4Z8wiOwncB6CyoWhUqsxi759WDOQhM02/yE69mbgaEmfnVkXw2IxMSIsXbAf
         6xlx2IT5vjFub2gOQeZ8tWggVUP8eXaeHBW/J6CkKXqLordrsu4Zf+z3dUSCiLfj6Oro
         UhxeQgTtzphvdwnGClvo+TS45VFhgRF71KP1kgf3FGISDj1GSuWp2V/98HeOCEF3vLPY
         RUWeiIqJiirg8j+OI7Tyd5Bwl+oHjA04lQJvR5Tu6hVDM5vShC6cvB1w3tqROi0t0Zbx
         e9Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUFeG7I6RQe7DPxU+tixRA7LpQW3XQrZ/S5C/DWh+RfAxdLddwV1oz7HqAGo6nUKk56Me4oHEHeKekXCBadeR+L4g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy4sx+B7uOEJ/C1xEXp5f97uru00exE4xBlGSAf7+5fe+p9LVEs
	baDRT+rhHPeXaTmdv8dYZKpUvEQjmB68cHz+5cQ3lC6x7fBCv1++SyF+MMkx3SQx8Mk=
X-Gm-Gg: ATEYQzxdtI1dxbu1y1pH15eXEcHstKyq/jBa51qscozKZvvtmhQ7u+Kia3k5Kqe1Tlb
	ki7IvlgWf/xe7IQ4OmR90E3wQzBVzcM05R5Eqh1Tm3q1f1KQlVefJyoRKyUm0x09KQcF74I9T2w
	rbPwQ3pOwOu+t84VKaBE/iLCWt0Xj4PXBy+xDB+R18Nt1+grqirWhcI49ThGmOpIjbvcYZ6uyRo
	hdwTcYNP/OCULelqJiWxV54LDcVNAhDkR7Qd8e+iSPdhKCdh5UMcv2kj95Tm5K0SXmQ7NT+XMqa
	DBECOglnDUS7ZI6R9RbPtNXNr8tzhYGdOaQLTxodBDmUssOITK+Vpgh0XSfoi6x0b39Q9cvQ67D
	n0B7uZ7sI/NfceG0KagAG/Mirew86B5zzdMsidRr07RdQbbl8Gvm+Brqzb2FCdlm6w4ByA7l0kR
	CGExhTHJ6X7FuS16OVuFSMDbWXpLvo4WHMH+mvIp8l/M015+j95smuE05KtXQqSXK4V4vQZld+V
	O3VeJ+8qtVaFaXw
X-Received: by 2002:a05:6000:2483:b0:436:1882:e90e with SMTP id ffacd0b85a97d-4399dddd06bmr1025288f8f.2.1772147759802;
        Thu, 26 Feb 2026 15:15:59 -0800 (PST)
Received: from localhost (2a01cb001331aa002c0b752a8b25831e.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:2c0b:752a:8b25:831e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c70e8dasm2253072f8f.9.2026.02.26.15.15.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 15:15:59 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 00:15:59 +0100
Message-Id: <DGP9Y9M5B8MI.30J74JKJ737D4@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] libseccomp: add diffutils to ptest
 RDEPENDS
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <git-patches@bmwtechworks.in>,
 <openembedded-core@lists.openembedded.org>, <nikhil.r@bmwtechworks.in>
X-Mailer: aerc 0.20.0
References: <20260225114032.44274-1-git-patches@bmwtechworks.in>
In-Reply-To: <20260225114032.44274-1-git-patches@bmwtechworks.in>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 23:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232069

Hello,

On Wed Feb 25, 2026 at 12:40 PM CET, Nikhil R via lists.openembedded.org wr=
ote:
> From: Nikhil R <nikhil.r@bmwtechworks.in>
>
> libseccomp ptest needs diff during test execution,
> add diffutils to the runtime ptest deps.

Are you sure that diff is needed? libseccomp ptests passes fine without
this patch:
https://valkyrie.yocto.io/pub/non-release/20260224-65/testresults/qemux86-6=
4-ptest/libseccomp.log
Is there a difference in configuration?

Also, on master, libseccomp ptest does not depend on diffutils[0]. If there=
 is
indeed a problem, it would have to be fixed on master first and,
then, whinlatter and scarthgap.

Regards,

[0]: https://git.openembedded.org/openembedded-core/tree/meta/recipes-suppo=
rt/libseccomp/libseccomp_2.6.0.bb?h=3Dmaster#n64

> Signed-off-by: Nikhil R <nikhil.r@bmwtechworks.in>
> ---
>  meta/recipes-support/libseccomp/libseccomp_2.5.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb b/meta/r=
ecipes-support/libseccomp/libseccomp_2.5.5.bb
> index 478e5f4289..dd253a7826 100644
> --- a/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb
> +++ b/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb
> @@ -59,4 +59,4 @@ FILES:${PN} =3D "${bindir} ${libdir}/${BPN}.so* ${PYTHO=
N_SITEPACKAGES_DIR}/"
>  FILES:${PN}-dbg +=3D "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/too=
ls/.debug"
> =20
>  RDEPENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'python', 'py=
thon3', '', d)}"
> -RDEPENDS:${PN}-ptest =3D "coreutils bash"
> +RDEPENDS:${PN}-ptest =3D "coreutils bash diffutils"


--=20
Yoann Congal
Smile ECS


