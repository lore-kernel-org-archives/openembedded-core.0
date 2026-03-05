Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8576F3093A
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 11:15:12 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42092.1772709309998799394
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 03:15:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cjvBAomj;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C5E4A1A2CDE;
	Thu,  5 Mar 2026 11:15:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9AE565FDEB;
	Thu,  5 Mar 2026 11:15:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B11F7103692C1;
	Thu,  5 Mar 2026 12:15:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772709307; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ekMoehfTS6DkKO9rzIQ8IgNFTFxDK9U4FsGukDmdh3M=;
	b=cjvBAomjZhqL6juIVV9M8NNNd7kwR91Fes1XWAe0XdyDdj3Ryv4UiG6Ug7irYfVNrPpRgt
	HG01JsovrgRihJxFTS98xH9fVhcCVgvreM+ib6ThFbztu26nPfurhASFOYAiiPlFWHz4Gv
	9WeDFpLBOdHOwla57oJQXFgqbHkCiHvEDshkuBD3i6732faiGo7REzLlCxarN35SRujaJb
	kqZLXO4SpZYCa5bfltzqJTCAOlSoSwUC2LHT6BEFor0PD0c6lhI2itcCkUz4Mcp3/BJnH6
	Rbt3/rIH0GeGYd64nH0zgEuz4avowzroi6TEIwHV8Rp4RPvjBsblBWWVGMZmqw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 12:15:05 +0100
Message-Id: <DGUT04JKG45O.52KWQ22NS2A1@bootlin.com>
To: <martin.jansa@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] license_image.bbclass: report all packages
 with incompatible license
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260303234247.8034-1-martin.jansa@gmail.com>
In-Reply-To: <20260303234247.8034-1-martin.jansa@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 11:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232480

On Wed Mar 4, 2026 at 12:42 AM CET, Martin Jansa via lists.openembedded.org=
 wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
>
> When multiple packages cannot be installed it shows only first one it
> finds, because of bb.fatal use. It might require many iterations to find
> all packages to avoid.
>
> e.g. with ptest enabled and GPL-3.0-or-later, GPL-3.0-only set as
> incompatible licenses you might get list like this for relatively small
> image:
>
> Some packages cannot be installed into the image because they have incomp=
atible licenses: bzip2-ptest (GPL-3.0-or-later), coreutils (GPL-3.0-or-late=
r), coreutils-stdbuf (GPL-3.0-or-later), diffutils (GPL-3.0-or-later), find=
utils (GPL-3.0-or-later), gawk (GPL-3.0-or-later), gnutls-openssl (GPL-3.0-=
or-later), gnutls-ptest (GPL-3.0-or-later), grep (GPL-3.0-only), make (GPL-=
3.0-only), mpfr (LGPL-3.0-or-later), python3-dbusmock (GPL-3.0-only), readl=
ine (GPL-3.0-or-later), sed (GPL-3.0-or-later)
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---

Hi Martin,

Thanks for your patch.

I believe this is making some selftests fail:

2026-03-05 09:01:35,428 - oe-selftest - INFO - incompatible_lic.Incompatibl=
eLicensePerImageTests.test_bash_and_license (subunit.RemotedTestCase)
2026-03-05 09:01:35,429 - oe-selftest - INFO -  ... FAIL
...
ERROR: core-image-minimal-1.0-r0 do_rootfs: QA Issue: The license listed So=
meLicense was not in the licenses collected for recipe bash [license-file-m=
issing]
ERROR: core-image-minimal-1.0-r0 do_rootfs: Some packages cannot be install=
ed into the image because they have incompatible licenses: bash (GPL-3.0-or=
-later)
...
2026-03-05 09:02:33,821 - oe-selftest - INFO - incompatible_lic.Incompatibl=
eLicensePerImageTests.test_bash_default (subunit.RemotedTestCase)
2026-03-05 09:02:33,821 - oe-selftest - INFO -  ... FAIL

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3225
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3336

Can you have a look at these?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


