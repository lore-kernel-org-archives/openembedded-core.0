Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A9DC71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 17:41:27 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.2019.1750268479702750852
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 10:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E647vsN6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 714841FD33;
	Wed, 18 Jun 2025 17:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750268477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eaSco/FhmbjEB90s/6qOwMB6Wnf/BDzHCS21PSbaDDE=;
	b=E647vsN6FZ49iOgcG3lI1z2B0tPhtLv+ETTxoZrJ8SsSXbrQQBM2nm69z2G1hHMdnLDnYK
	XkcTLIE6xFjn6pHeMNcICG4FPjkLRuF0Wmi/xeNTjRkF3OSlyY3TRcH5ugej2+3VVtj5Jk
	yD/Oq1UrHE8utd3x3GyiIJhkII8gIBz1PuBzCwood8q9Do1EJeDBUQ4NecL7goX5e+Diju
	6elhuxXuBApYb6kIPbPB0SHxJd92IctImiW+qc01BDBFDPMwyi1CwWzWRroHuSA2OKuIAy
	yjgIOlt8zdxjulNmYsD2fAdG322N4iYwQr1JNxKijI+tgZhoS1UPDhwBAt36bg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 19:41:16 +0200
Message-Id: <DAPUE5VR0AZ4.3S2SL3DVXRBWB@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dmitry.baryshkov@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5 2/8] default-providers: fix GLVND providers
 to be selected at runtime
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250618140526.1431757-1-dmitry.baryshkov@oss.qualcomm.com>
 <20250618140526.1431757-2-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250618140526.1431757-2-dmitry.baryshkov@oss.qualcomm.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdefvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtgfeuvdfghfegtdehvdegvefhkeegheeikeelfeefffetheeitdduudeludduleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegrieeimeefudektdemfegtudeimegrjedvheemudehhegtmeeludgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemfegtudeimegrjedvheemudehhegtmeeludgrpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepughmihhtrhihrdgsrghrhihshhhkohhvsehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtt
 hhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 17:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219029

On Wed Jun 18, 2025 at 4:05 PM CEST, Dmitry Baryshkov via lists.openembedde=
d.org wrote:
> The virtual-{libegl,libglx}-icd names are RPROVIDES, not PROVIDES,
> because they are a runtime dependency of libglvnd. Make
> default-providers follow that and specify PREFERRED_RPROVIDER instead of
> PREFERRED_PROVIDER for those names.
>
> Fixes: 9d3b4c9bc403 ("mesa: sort out PROVIDES for the glvnd case")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Hi Dmitry,

Thanks for the new version.

I got the following error on the autobuilder:

2025-06-18 15:00:07,705 - oe-selftest - INFO - distrodata.Distrodata.test_m=
aintainers (subunit.RemotedTestCase)
2025-06-18 15:00:07,706 - oe-selftest - INFO -  ... FAIL
...
AssertionError:
Unable to find recipes for the following entries in maintainers.inc:
libglvnd

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1795

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


