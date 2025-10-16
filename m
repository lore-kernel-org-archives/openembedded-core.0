Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A65CCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 05:03:29 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.1214.1760590999652677816
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 22:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=g2Ytoaqt;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4DE104E410EA;
	Thu, 16 Oct 2025 05:03:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 131E1606D7;
	Thu, 16 Oct 2025 05:03:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E071D102F22DA;
	Thu, 16 Oct 2025 07:03:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760590997; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=P8URIgtS1Fdo3or1dFdjShxi+M0bSRKpmrOM4gUeAk0=;
	b=g2YtoaqtqoJcobjW/KnxnXL0D0ncNY+z89T/KL9Pt7V6EqfKcSiO5/oDz7zsL7l2x+EY+M
	dzJz9JbfjiVVUl5/NHakZVKiinYART7TXzu91ZNuQzipLMSBuJzdrdSojXsSVRagX8mT0P
	VqpPai0Pvnsy5b5pumAJa2kCrKXTnHu7AV1yFTdRYS1ldcWwYUXopPue7Dr4R423EJa1Dg
	lSu6Ria4FalAgJ/aDhTYdxkxioTVSZ0iXdeHqoHTX2Ek44kfRrdEvDIJlSyO2Cs0k6EJhe
	0W5OhFjG4Uui5TSI3icCsE5dIFKU9bjC4zTaq6ZTbs02utZrFidu5OcPDQz4MQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Oct 2025 07:03:12 +0200
Message-Id: <DDJHF42PN7TW.3M8KTUFHDD38C@bootlin.com>
Subject: Re: [OE-core] [PATCH v7] kernel-fit-image: allow overriding DTB
 compatible string
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <kavinaya@qti.qualcomm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251015080502.1704801-1-kavinaya@qti.qualcomm.com>
In-Reply-To: <20251015080502.1704801-1-kavinaya@qti.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 05:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224944

On Wed Oct 15, 2025 at 10:05 AM CEST, Kavinaya S via lists.openembedded.org=
 wrote:
> The Linux kernel allows multiple DTBs to share the same compatible string=
.
> For example:
> qcs6490-rb3gen2.dtb
> qcs6490-rb3gen2-vision-mezzanine.dtb
> qcs6490-rb3gen2-industrial-mezzanine.dtb
>
> All of these use the same base compatible string:
> compatible =3D "qcom,qcs6490-rb3gen2", "qcom,qcm6490";
>
> Since the latter two DTBs are overlays on top of the base DTB and do not
> modify platform properties, they retain the same compatible string.
>
> When these DTBs are bundled into a single fitImage, the bootloader cannot
> distinguish between them due to identical compatible strings.
>
> To address this, introduce a mechanism to override the compatible string
> using a BitBake variable:
> FIT_DTB_COMPATIBLE_OVERRIDE[<dtb_name>] =3D "<compatible_string>"
>
> This overrides the compatible string generated resulting in unique entrie=
s in the
> generated .its file. For example:
> FIT_DTB_COMPATIBLE_OVERRIDE[qcs6490-rb3gen2-vision-mezzanine] =3D "qcom,q=
cs6490-rb3gen2-vision"
> FIT_DTB_COMPATIBLE_OVERRIDE[qcs6490-rb3gen2-vision-mezzanine] =3D "qcom,q=
cs6490-rb3gen2-vision qcom,qcm6490"
>
> Results in:
>
> compatible =3D "qcom,qcs6490-rb3gen2-vision";
> compatible =3D "qcom,qcs6490-rb3gen2-vision", "qcom,qcm6490";
>
> Suggested-By: Alexander Kanavin <alex.kanavin@gmail.com>
> Suggested-By: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
> ---

Hi Kavinaya,

Thanks for the new version. However, I still got a similar issue:

ERROR: linux-yocto-6.16.9+git-r0 do_compile: Execution of '/srv/pokybuild/y=
octo-worker/oe-selftest-armhost/build/build-st-1723335/tmp/work/qemuarm64-p=
oky-linux/linux-yocto/6.16.9+git/temp/run.do_compile.365769' failed with ex=
it code 1
...
| make[2]: *** No rule to make target 'arch/arm64/boot/dts/am335x-bonegreen=
-ext.dtb'.  Stop.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2701
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2549
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2463

Can you have a look at this please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


