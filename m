Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E21CAC5B8
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 19:03:02 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.16729.1759690980252466061
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 12:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2oMVMBQ4;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DB719C0358B;
	Sun,  5 Oct 2025 19:02:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F2B606065F;
	Sun,  5 Oct 2025 19:02:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF82F102F1D0B;
	Sun,  5 Oct 2025 21:02:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759690976; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RwTSWw/idnmXXTvc5Mo5U8cIYqbcOnc0nkhe1fkzKDA=;
	b=2oMVMBQ4OWuYFBDkO7dll7Q1O1obEfkP0vzH9BvVoaoNA8WubINQVE3w6lHqB5H/HkaPBR
	IZ+lXY/n/85hesOpUlB47taW8Afo96ndguQYL9cK/WUveTCA1MY+JQweB3NunX+DMbu6LX
	wUsAtjnVZc4mSmUPbh/JiPcBtNp7jpNT9V/YutcQL6AKZi2jqVIuj+6cr/DfwWNNW4RPaz
	629C5DmVpXghCZSVoRjh+ey6XVXUUa5xRqdDt5/a0fTcqg10Zsn+b4N2i3fpDHSc5lMDu7
	jbl81BO821iaNRFbe3WYUgjOzCGj1SqWEEN9yXIEYJ+nI2+sTt+CvPR5aphoaA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 05 Oct 2025 21:02:52 +0200
Message-Id: <DDAME0P70H0A.3G3G7DPYEVKK3@bootlin.com>
Subject: Re: [PATCH v3] sqlite3: upgrade 3.48.0 -> 3.50.4
Cc: <denis@denix.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Anna-Lena Marx" <anna-lena.marx@inovex.de>, <alex.kanavin@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251001152850.1342075-1-anna-lena.marx@inovex.de>
 <20251002211744.3418535-1-anna-lena.marx@inovex.de>
In-Reply-To: <20251002211744.3418535-1-anna-lena.marx@inovex.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 19:03:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224440

On Thu Oct 2, 2025 at 11:17 PM CEST, Anna-Lena Marx wrote:
> With the upgrade to 3.50.4, some configure options changed
> as the project switched from `autotools` to `autosetup`.
> The PACKAGECONFIG "dyn_ext" is not longer available.
> Besides, the default CONFIGUREOPTS "target", "exec_prefix"
> and "oldincludedir" became invalid.
>
> Changelog: https://sqlite.org/releaselog/3_50_4.html
>
> Signed-off-by: Anna-Lena Marx <anna-lena.marx@inovex.de>
> ---

Hi Anna-Lena,

Thanks for the new version.

I can't explain why, but it looks like this is breaking the
imagefeatures.ImageFeatures.test_mandb test:

ERROR: core-image-minimal-1.0-r0 do_rootfs: Postinstall scriptlets of ['ker=
nel-6.16.9-yocto-standard'] have failed. If the intention is to defer them =
to first boot,
then please place them into pkg_postinst_ontarget:${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.
...
2025-10-05 14:14:59,584 - oe-selftest - INFO - imagefeatures.ImageFeatures.=
test_mandb (subunit.RemotedTestCase)
2025-10-05 14:14:59,586 - oe-selftest - INFO -  ... FAIL

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2478
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2391

I was not able to reproduce this locally, I will try to extract logs
from the autobuilder in the coming days to provide a bit more context.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


