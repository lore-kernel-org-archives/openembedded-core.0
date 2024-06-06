Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAEFC25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 10:46:42 +0000 (UTC)
Subject: Re: [PATCH 1/1] archiver.bbclass: Improve work-shared checking
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: =?UTF-8?B?U3R1dHRnYXJ0LCBCYWRlbi1Xw7xydHRlbWJlcmcsIERF?= (194.39.218.19)
X-Originating-Platform: Windows Chrome 125
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 06 Jun 2024 03:46:38 -0700
References: <2bbc5a56-36e3-47a9-b891-565735c90d73@windriver.com>
In-Reply-To: <2bbc5a56-36e3-47a9-b891-565735c90d73@windriver.com>
Message-ID: <8404.1717670798520210610@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 10:46:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200391

It seems to me i found, when it can not work well.
I use linux-fslc recipe from meta-freescale which redefining somewhy source=
 directory in linux-imx.inc file.

https://github.com/Freescale/meta-freescale/blob/master/recipes-kernel/linu=
x/linux-imx.inc#L22
S =3D "${WORKDIR}/git"

In kernel.bbclass it is the default S =3D "${STAGING_KERNEL_DIR}" value. Th=
is patch should work well only if the linux-kernel recipe use the default s=
ource dir as STAGING_KERNEL_DIR. If any other BSP provider company uses for=
 example S =3D "${WORKDIR}/git", their linux-kernel recipe build/compiling =
will be failed in case of use archiver class.

