Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CC9CAC587
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 17:42:40 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.14153.1757871755586188888
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 10:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yECymZHt;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4B57AC6B39A
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 17:42:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5FE186063F;
	Sun, 14 Sep 2025 17:42:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D908102F29EC;
	Sun, 14 Sep 2025 19:42:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757871752; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VdLcx1zqZeLETCvg4XiLHp1mnE6NRwTYPOrVAK2Kk78=;
	b=yECymZHtFthkpRTtYfjY9NBfTnURTfyS/uwAlJyiXX9V6BFNJZ57L9MhktrRvElsF7LEZD
	JjydjDAyIFOIraArIkAmOETHEJfMbQTHCIdqc3Mffwe8qHu4GcxUx0OxwY2g0wmPjHK0TJ
	wgLNg1UcyFayNlB3ayXinOxHG1O0MLkWOJdtc03UqQwHglPh0UqZsmp7Ueg9LObvVf+ctw
	BoJzgHXAeCxwmsqsvvAAhCE4tvASJEuj2CObxZXayKU1CWh4tb1ztj+Oyc8M6Sa9vmQuPk
	UQWPzNLkRMVTtYJfBoCw5Kh8oXaoL3I+4wMtqAONo/ZlMfUyvgefLr77WjxR8w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Sep 2025 19:42:25 +0200
Message-Id: <DCSPIZJJ55W2.PI9LL2D5W0XX@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/6] clang: improve opt-viewer PACKAGECONFIG
Cc: "Michael Halstead" <mhalstead@linuxfoundation.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250912143038.3345369-1-ross.burton@arm.com>
In-Reply-To: <20250912143038.3345369-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 17:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223364

On Fri Sep 12, 2025 at 4:30 PM CEST, Ross Burton via lists.openembedded.org=
 wrote:
> Instead of patching the python module detection, we can use the hidden
> option LLVM_TOOL_OPT_VIEWER_BUILD.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

I took this series, but it resulted in a lot of OOM failures during the
reproducibility test build:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2484
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2485
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2487
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2489
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2486
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2488
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2491
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2493

Some of these do reports errors in ovmf_git.bb:do_deploy, I wonder if
this is somehow related.

Michael Halstead has some traces from the OOM killer, at least for one
occurrence. I will forward you the mail he sent about these, maybe there
is any useful data in there.

Also, one build completed (to a failure). Maybe just some luck in job
ordering, so it failed before it had the opportunity to crash. It
contains errors for both ovmf and ffmpeg builds:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2492

Also this same build does report some reproducibility issues on clang,
llvm and others:

http://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250914-qe46no4m/p=
ackages/diff-html/

So, I believe this might a bit difficult to debug, please tell me if I
can help you in any way.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


