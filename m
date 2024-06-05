Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40719C25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 21:06:48 +0000 (UTC)
Subject: Re: [PATCH 1/1] archiver.bbclass: Improve work-shared checking
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: =?UTF-8?B?U3R1dHRnYXJ0LCBCYWRlbi1Xw7xydHRlbWJlcmcsIERF?= (194.39.218.20)
X-Originating-Platform: Windows Chrome 125
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 05 Jun 2024 14:06:41 -0700
References: <7829286302c0e4a4bdcb351cbd295cb95387d7c1.1702307359.git.liezhi.yang@windriver.com>
In-Reply-To: <7829286302c0e4a4bdcb351cbd295cb95387d7c1.1702307359.git.liezhi.yang@windriver.com>
Message-ID: <24041.1717621460219935507@lists.openembedded.org>
X-Old-Date: Wed, 05 Jun 2024 14:04:20 -0700
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 21:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200381
Message-ID: <20240605210641.MUufaeWZJS9FyEqQorxi7F19ygZxbg24RB-Zla32-Fo@z>

Hi,

https://github.com/openembedded/openembedded-core/commit/5fbb4ca8da4f4f1ea4=
26275c45634802dcb5a575

This patch caused something terrible wrong behavior, because ".../work-shar=
ed/<MACHINE>/kernel-source/" directory is totally empty and the complete Li=
nux kernel source is missing if INHERIT +=3D "archiver" is used in local.co=
nf file. Please fix it and if there any workaround please send it because a=
t the moment without usage of INHERIT +=3D "archiver" Yocto scarthgap build=
 is working but with use it, all the time it failed to compile Linux kernel=
 because git symbolic folder which linked to kernel-source is totally empty=
 in this case in linux working directory.

I use the following settings when i try to making archives but it is failed=
 to fetch kernel source to kernel-source directory (it was fine to use in n=
anbield release before).

INHERIT +=3D "archiver"
ARCHIVER_MODE[src] =3D "patched"
ARCHIVER_MODE[compression] =3D "bz2"
ARCHIVER_MODE[mirror] =3D "combined"
COPYLEFT_RECIPE_TYPES =3D "target"
COPYLEFT_AVAILABLE_RECIPE_TYPES =3D "target"

# Don't filter the license
COPYLEFT_LICENSE_INCLUDE =3D ""
COPYLEFT_LICENSE_EXCLUDE =3D ""

# Deploy licenses
COPY_LIC_MANIFEST =3D "1"
COPY_LIC_DIRS =3D "1"
LICENSE_CREATE_PACKAGE =3D "1"

