Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4B0CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 05:35:26 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.8158.1760420117469349524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 22:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Prhsyk7j;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B007F1A1359;
	Tue, 14 Oct 2025 05:35:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70055606EC;
	Tue, 14 Oct 2025 05:35:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6BFB102F2281;
	Tue, 14 Oct 2025 07:35:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760420114; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DDUWLWwbzP4qDFw8jzz2FwqynfN+ZZCMqqY+tKhV4cI=;
	b=Prhsyk7j4uM27hRhE9fP9k9OPQj4oQFHVyInoXTe6htbtHTey1ZNEuSIhfkZGVAXdiJGDh
	eEC7OgWaGHRypXTo3ldJR+LPuWRq/s7iKYxZBqBVoBGRWgGsThYfALi95OEu1mkyaf5QHF
	iHnHuWJphOmngZAIYeo016JJi5iswBy6NyFY55AxfnAWNluG8i+8cnLO3dYY0B5GK6H3tw
	Wes9lDyjt7K/uSAKzMmETHGPXi6uAszBO54fUkmmqy22UTwIY66CCvRKy1J/NLrYC/kwv7
	2QqkpIUkHI7/DDA4UQV6if8O6eZ0fYL0bMwUMlvsq4VFb1gFpevwHyUi8AMzkQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Oct 2025 07:35:09 +0200
Message-Id: <DDHSUHMG4NPM.1V6O1K0B4783Z@bootlin.com>
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <kavinaya@qti.qualcomm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v6] kernel-fit-image: allow extending
 compatible string property for DTBs
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251012162442.2087387-1-kavinaya@qti.qualcomm.com>
In-Reply-To: <20251012162442.2087387-1-kavinaya@qti.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 05:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224805

On Sun Oct 12, 2025 at 6:24 PM CEST, Kavinaya S via lists.openembedded.org =
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
> To address this, introduce a mechanism to extend the compatible string
> using a OE build variable:
> FIT_DTB_COMPATIBLE_EXTENSION[dtb_name] =3D "extension"
>
> This appends the extension to the first compatible string in the DTB,
> resulting in unique entries in the generated .its file. For example:
> FIT_DTB_COMPATIBLE_EXTENSION[qcs6490-rb3gen2-vision-mezzanine] =3D "visio=
n"
> FIT_DTB_COMPATIBLE_EXTENSION[qcs6490-rb3gen2-industrial-mezzanine] =3D "i=
ndustrial"
>
> Generates:
> compatible =3D "qcom,qcs6490-rb3gen2-vision", "qcom,qcm6490";
> compatible =3D "qcom,qcs6490-rb3gen2-industrial", "qcom,qcm6490";
>
> Suggested-By: Alexander Kanavin <alex.kanavin@gmail.com>
> Suggested-By: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
> ---

Hi Kavinaya,

We suspect this series is responsible for a break on Richard master-next
branch. This seems either a bit intermittent or a bad interaction with
something else, as I don't have a similar issue here. Still, dropping
the patch fixes the issue, so there is probably something bad in there.

ERROR: linux-yocto-6.16.9+git-r0 do_compile: Execution of '/srv/pokybuild/y=
octo-worker/oe-selftest-debian/build/build-st-1431372/tmp/work/qemux86_64-p=
oky-linux/linux-yocto/6.16.9+git/temp/run.do_compile.555534' failed with ex=
it code 1
...
| make[1]: *** No rule to make target 'am335x-bonegreen.dtb'.  Stop.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2530

Can you have a look at this error please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


