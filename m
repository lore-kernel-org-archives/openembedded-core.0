Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6D3C30658
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 15:08:49 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.175559.1719328123214143802
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 08:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=n0tiulmP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BB632000D;
	Tue, 25 Jun 2024 15:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719328121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iorxxGux0RXkaXg0pndcDcq+40uiCgIiRBAdAdMlqSE=;
	b=n0tiulmPbUb7+ofKmS/8mkocFZXM7GAK2E486gJLgT5VYEqjq8sRbUPaWH85xOT683jmoP
	OTull4fSsXtaaq0ksStX2DsCwQH+5WQ0EEFpxB9Pz0L015WPEVfT2Lfw5nnDgu+mgUNVpj
	xF+teXt09XohELUYWJliZiShqEhzCmI8OLePPCRKCblNWjzSTEKC/wMANzFwMpbnLIIZwY
	QG/KLQ8tYZx2wgv5xY2wayag0F+RgcVRvKinnCzXglU7GW+FwOKjP4eUi2ju9b8oMFg1kz
	CoZUIpnAHpkyQKZoSx0T6unsGpCWW2iau1Ui81aG44lBvhl8QCr04iqYUCUTUQ==
Date: Tue, 25 Jun 2024 17:08:41 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v4 00/10] Add SPDX 3.0 support
Message-ID: <20240625150841a60a57d2@mail.local>
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
 <20240624193151.1645802-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624193151.1645802-1-JPEWhacker@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 15:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201138

Hello,

I believe this is the cause of the following failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4986/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4989/steps/13/logs/stdio

I'm not sure why they don't have any diffoscope output.

On 24/06/2024 13:10:50-0600, Joshua Watt wrote:
> This patch series add support for SPDX 3.0 and sets it as the default.
> Currently it is not possible to have SPDX 2.2 and SPDX 3.0 enabled at
> the same time
> 
> v2: Added tests and addressed feedback
> v3: Fixed several oe-selftest and build failures
> v4: Fixed silly typo mistake in staging.bbclass
> 
> Joshua Watt (10):
>   classes-recipe/image: Add image file manifest
>   classes-recipe/baremetal-image: Add image file manifest
>   classes/create-spdx-3.0: Add classes
>   classes-global/staging: Exclude do_create_spdx from automatic sysroot
>     extension
>   binutils-cross-testsuite: Rename to binutils-testsuite
>   classes-recipe/image_types: Add SPDX_IMAGE_PURPOSE to images
>   selftest: spdx: Add SPDX 3.0 test cases
>   classes-recipe: nospdx: Add class
>   classes/spdx-common: Move SPDX_SUPPLIER
>   Switch default spdx version to 3.0
> 
>  meta/classes-global/mirrors.bbclass           |    2 +-
>  meta/classes-global/staging.bbclass           |    9 +-
>  meta/classes-recipe/baremetal-image.bbclass   |   30 +-
>  meta/classes-recipe/image.bbclass             |   58 +
>  meta/classes-recipe/image_types.bbclass       |    2 +
>  meta/classes-recipe/image_types_wic.bbclass   |    1 +
>  meta/classes-recipe/nospdx.bbclass            |   13 +
>  meta/classes-recipe/packagegroup.bbclass      |    2 +
>  meta/classes/create-spdx-2.2.bbclass          |    8 +
>  meta/classes/create-spdx-3.0.bbclass          | 1179 ++++
>  meta/classes/create-spdx-image-3.0.bbclass    |  224 +
>  meta/classes/create-spdx.bbclass              |    2 +-
>  meta/classes/spdx-common.bbclass              |   13 +-
>  meta/conf/distro/include/maintainers.inc      |    2 +-
>  meta/lib/oe/sbom30.py                         | 1122 +++
>  meta/lib/oe/spdx30.py                         | 5996 +++++++++++++++++
>  meta/lib/oeqa/selftest/cases/binutils.py      |    2 +-
>  meta/lib/oeqa/selftest/cases/spdx.py          |  119 +-
>  meta/recipes-core/meta/build-sysroots.bb      |    5 +-
>  meta/recipes-core/meta/meta-world-pkgdata.bb  |    3 +-
>  ...ite_2.42.bb => binutils-testsuite_2.42.bb} |    3 +
>  21 files changed, 8765 insertions(+), 30 deletions(-)
>  create mode 100644 meta/classes-recipe/nospdx.bbclass
>  create mode 100644 meta/classes/create-spdx-3.0.bbclass
>  create mode 100644 meta/classes/create-spdx-image-3.0.bbclass
>  create mode 100644 meta/lib/oe/sbom30.py
>  create mode 100644 meta/lib/oe/spdx30.py
>  rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.42.bb => binutils-testsuite_2.42.bb} (95%)
> 
> -- 
> 2.43.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201102): https://lists.openembedded.org/g/openembedded-core/message/201102
> Mute This Topic: https://lists.openembedded.org/mt/106856868/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

