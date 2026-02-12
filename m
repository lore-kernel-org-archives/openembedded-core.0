Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0463EE369F
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 16:39:05 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49836.1770914342107153138
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 08:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PawGH9mU;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7C1A01A0E4B
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 16:39:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 44E58606B8;
	Thu, 12 Feb 2026 16:39:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49B4F103682C4;
	Thu, 12 Feb 2026 17:38:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770914339; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q5r+hEPINYYOwmf00cmZjxDwdZ4GLOXsRS8nmn9bo/s=;
	b=PawGH9mUPopPFqqWBY472juqsCAdwBeSYHxeU5V24NM92QS3KUXjV+E/Fh3k90a8Mbyf0M
	dm691lBFSzrvfexXRP5Mj89pXWfbEB43SaYUXzPw7neLZt7sPy4qYl/q0nwDJjgd9K1iWi
	RruOU7DiuK79H/HbwH24lHIvrTe9c3lPzIKIMH54+6tBrdkcxdEwjsqcj20s/4sYLzhIyi
	wsqnsJ3BN97xLm+NeOV+Di92RKYYw3GjHLVoPssORLofw4GmJFaTEn0vCjg0nA0INyiw5m
	SlumFWotb9/ywKyd9oD4KPPk6jdpV49zaOi2t5S9SR1RQ07d9uxqr+/nCaBFug==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Feb 2026 17:38:58 +0100
Message-Id: <DGD4QO4N38MH.11MGPG2TIVUHJ@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/3] Disable OpenSSL and Python3-cryptography
 legacy features by default
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <colinmca242@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260211184917.1045939-1-colinmca242@gmail.com>
In-Reply-To: <20260211184917.1045939-1-colinmca242@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 16:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231039

On Wed Feb 11, 2026 at 7:49 PM CET, Colin McAllister via lists.openembedded=
.org wrote:
> TLS 1.0 and 1.1 have been deprecated by the IETF since 2021, and
> OpenSSL's legacy module contains deprecated and unmaintained components.
> This series disables legacy support by default in both OpenSSL and
> python3-cryptography, requiring users to explicitly opt-in if needed.
>
> The first two patches add packageconfig options to control legacy TLS
> protocol support and the legacy OpenSSL module. The final patch aligns
> python3-cryptography with the new OpenSSL defaults.
>
> Note that the TLS 1.0/1.1 changes replace the existing "no-tls1" and
> "no-tls1_1" packageconfig options with affirmative "tls1" and "tls1_1"
> options that are disabled by default. While less disruptive to enable
> the "no-*" options by default, using affirmative options provides
> consistency with the new "legacy" option and is clearer than having
> default-enabled "no-*" options.
>
> Testing performed:
> * Verified both recipes build successfully with and without the new
>   options
> * Ran OpenSSL ptests with legacy enabled/disabled and TLS 1.0/1.1
>   disabled
> * Ran python3-cryptography ptests with legacy-openssl disabled
> * Confirmed ptests correctly skip tests for disabled legacy features
>
> Colin Pinnell McAllister (3):
>   openssl: Disable TLS 1.x by default
>   openssl: Add legacy packageconfig option
>   python3-cryptography: Disable legacy-openssl by default
>
>  meta/recipes-connectivity/openssl/openssl_3.5.5.bb | 14 +++++++++-----
>  .../python/python3-cryptography.bb                 |  2 +-
>  2 files changed, 10 insertions(+), 6 deletions(-)

Hi Colin,

Thanks for your patch.

It looks like we are having some ptest failing on the autobuilder:

Failed ptests:
{'python3': ['test_min_max_version', 'python3']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3075
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3030

Test logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20260212-56/testresults/qemux86-6=
4-ptest/core-image-ptest-python3/
https://valkyrie.yocto.io/pub/non-release/20260212-56/testresults/qemuarm64=
-ptest/core-image-ptest-python3/

Can you have a look at this error?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


