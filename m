Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E57CCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 11:49:17 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.4415.1761738551370016465
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 04:49:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mwdo7yXW;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EA068C0B887
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 11:48:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3528A606E8;
	Wed, 29 Oct 2025 11:49:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3643102F2510;
	Wed, 29 Oct 2025 12:49:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761738548; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=s7tHnDn5DPERM7KYQIR7EWcxsu4raOLSS46flHj4TsE=;
	b=mwdo7yXWqYi03c17iSH8Pn8kTrHV0MphqJe4oeL3usUtnhdFEOwf6ZwWKDK8U0saxyh/rQ
	rJfW193RVu600tmGZUBWstsGT3zJNvmBC/RCKEs/JzLCVJp7/O7upj+M1Q1+HSYunvixhp
	BfwCiq3Wbh7RUPeiag2CCe3h3PL4Tx8EyG3XnMr3NInWlTwz/1voc9vkQHJ152rkdCvzDs
	Y31514AIm/XBPBWMp1Fga9pcOSfRcDXFPxGs+JJbe4QYHKrx3a7LuXPTgcQrNzRZI9DHh+
	dYwAlf9jURkXGVL1KTrggzdF1iK4E0g9JccSBx00M7RfaGSFsrhrqS4ItUhWpQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Oct 2025 12:49:07 +0100
Message-Id: <DDUS6ZLHP1TA.1RO2V3WLOWZXW@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5] libxslt: add ptest support
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251023153459.49699-1-pratik.farkase@est.tech>
 <20251025132107.9296-1-pratik.farkase@est.tech>
 <DDSVFR6HJY5J.9F1TJMJY0ZQ0@bootlin.com>
 <GV2P189MB3005ADB18D1B5A8674AABA72FEFDA@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <GV2P189MB3005ADB18D1B5A8674AABA72FEFDA@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 11:49:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225448

On Tue Oct 28, 2025 at 10:05 PM CET, Pratik Farkase wrote:
> Hi Mathieu,
>
> I looked at both the Ptest logs you sent and seems like more tests are fa=
iling in the autobuilder than in my local QEMU test setup. The failures app=
ear to be byte-level differences (e.g., =E2=80=9C230 bytes vs 275 bytes=E2=
=80=9D for bug-147) rather than functional errors.
>
> https://valkyrie.yocto.io/pub/non-release/20251026-107/testresults/qemux8=
6-64-ptest/core-image-ptest-libxslt/
>
> For both qemuarm64 and qemux86-64 machines my local ptest-runner has the =
following output :
>

Yes, it looks like a bit intermittent. I launched another run both locally
and on the autobuilder, and the result is different: it is closer to
yours.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2550
https://valkyrie.yocto.io/pub/non-release/20251029-63/testresults/qemux86-6=
4-ptest/core-image-ptest-libxslt/

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


