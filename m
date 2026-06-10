Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B76CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 12:55:26 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19803.1781096124107332968
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 05:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DxEEwzs0;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 493154E42DFB;
	Wed, 10 Jun 2026 12:55:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CD7D5FFC9;
	Wed, 10 Jun 2026 12:55:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 119E3106B90C5;
	Wed, 10 Jun 2026 14:55:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781096121; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z7As++QAbSexgbNQwEfrfyGBPO/M/SU03c1OdNsrvNI=;
	b=DxEEwzs09K9vFmnbHhCB3clKTWYctFaTQnkj6adCYmamVPCcxcaapwB/CArcjIZa/NpuDo
	YtxtiNoLPGuXFYika13zkRaeIsCdyKfyEt4dWPS87K+Ya67fSOBH91CQ/nkdKXdOxp6Jer
	AdbVBT7iufFKU01xPjx9Fk+nUqdnDW5mz8QxT9tpUexdTh7jracOn3mnFPicVBzKSGg3zr
	TkoJtC2LRLR0vOY0wBGriMOZIcfRm/AhT5L8pNNqTEEOqshjTGSuoMmDCstzzKFV+2aHUi
	QR17CUqjsDGjqYBXJ5egZTX8VKr+Ru3NgoBgzP9OxijtPpacYnuIBpE6DT0hZQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 14:55:18 +0200
Message-Id: <DJ5DVPB75QO4.F4OPEQNML7BM@bootlin.com>
To: <Shilong.Jiao@eng.windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "Jiao, Shilong"
 <Shilong.Jiao@windriver.com>
Subject: Re: [OE-core] [PATCH] python3-six: Add ptest support
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260609014110.3859502-1-Shilong.Jiao@windriver.com>
 <DJ4E5OTQSRTG.JX0ANFWCLECZ@bootlin.com>
 <18B75E544A0EA1A3.61226@lists.openembedded.org>
 <SN7PR11MB66786F424595B04D017F6116801D2@SN7PR11MB6678.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB66786F424595B04D017F6116801D2@SN7PR11MB6678.namprd11.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 12:55:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238357

On Tue Jun 9, 2026 at 12:09 PM CEST, Shilong via lists.openembedded.org Jia=
o wrote:
> Hi,
>
> Quick update on my investigation:
>
> I've tested these failing cases locally in my build environment, and
> interestingly all 8 tests pass:
> - test_lazy: PASS
> - test_move_items[html_entities]: PASS
> - test_move_items[html_parser]: PASS
> - test_move_items[BaseHTTPServer]: PASS
> - test_move_items[CGIHTTPServer]: PASS
> - test_move_items[SimpleHTTPServer]: PASS
> - test_move_items[xmlrpc_client]: PASS
> - test_move_items[xmlrpc_server]: PASS
>
> This suggests the failures might be specific to the autobuilder environme=
nt
> or related to test execution order. The test_lazy failure in particular
> looks like it could be caused by html.parser already being imported when
> the test runs.
>
> Could you help me access the detailed error messages from the autobuilder
> logs? This would help me understand the actual failure mode and create an
> appropriate fix.
>
> Thanks,
> Shilong Jiao
> ________________________________

Hi,

The autobuilder configuration is described in the "Write config" step of
the build.

I did reproduce this issue locally with following layers:
BBLAYERS ?=3D " \
  .../openembedded-core/meta \
  .../meta-yocto/meta-poky \
  .../meta-yocto/meta-yocto-bsp \
  .../openembedded-core/meta-selftest \
  "

And following lines in my local.conf:
SDKMACHINE =3D "x86_64"
PACKAGE_CLASSES =3D "package_rpm package_deb package_ipk"
INHERIT +=3D 'image-buildinfo'
IMAGE_BUILDINFO_VARS:append =3D ' IMAGE_BASENAME IMAGE_NAME'
TEST_SUITES =3D 'ping ssh ptest'
SANITY_TESTED_DISTROS =3D ''
OEQA_TESTDISPLAY =3D ':1'
OE_FRAGMENTS +=3D 'core/yocto-autobuilder/autobuilder core/yocto-autobuilde=
r/autobuilder-resource-constraints'
EXTRA_IMAGE_FEATURES ?=3D 'allow-empty-password empty-root-password allow-r=
oot-login'
OE_FRAGMENTS +=3D 'machine/qemux86-64 distro/poky'

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


