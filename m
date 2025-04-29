Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61CFC369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 08:26:55 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.13355.1745915213248679681
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 01:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KkRBWZAQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F61643ADE;
	Tue, 29 Apr 2025 08:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745915211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Iik/HYBZsJDus4vH9M35Mx8vMHkbp/b8z11jpGoGddE=;
	b=KkRBWZAQ5cNnfBo58qKvZ7j8yEVqB//VWQDjpgAqzPKnos9DCxGMIyU6M5QLvRBh6v6Tss
	TzQ1ZYrmmW9BC1edDuna1ijmGaoS24SIB4+znhmm8sGDq3XLbviMQlqUqxvxl522WVtbof
	zdBVCILMZkR3jysegClzHBCvhcL3mlACERu+crR87gpWi/TbwSPTPGmP6Eqr9QZOTVI2TX
	7VHSRdewWZY7ZzcT1hUItFfwIkvdWHpOc1usckwpfLtQVGvEZKQN57h6MJHAxwTksRX7+H
	qpZvszIciGj/ck5UOhlg7zU5Xc4VZEtcYQI8bscoWVbL8I03dJD3XodV7QMdOg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 10:26:50 +0200
Message-Id: <D9IZAF7J22FY.1LI1D3I7FHLM8@bootlin.com>
Cc: <Shivaprasad.Moodalappa@windriver.com>, <Sundeep.Kokkonda@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Deepesh Varatharajan" <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] rust: restore unit tests that were marked as
 ignored
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250423112604.3718426-1-Deepesh.Varatharajan@windriver.com>
 <D9ES53X06ZYS.O2YBSMHAGNG2@bootlin.com>
 <95f7995e-90d2-4399-b141-6f5dfee3ae47@windriver.com>
In-Reply-To: <95f7995e-90d2-4399-b141-6f5dfee3ae47@windriver.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeffeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegleeiheegieevheetieeigfehtedtheegvdehvdettefgfeeihfetleefteeuhfenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeguvggvphgvshhhrdhvrghrrghthhgrrhgrjhgrnhesfihinhgurhhivhgvr
 hdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopefuhhhivhgrphhrrghsrggurdfoohhouggrlhgrphhprgesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopefuuhhnuggvvghprdfmohhkkhhonhgurgesfihinhgurhhivhgvrhdrtghomh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 08:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215653

On Tue Apr 29, 2025 at 6:23 AM CEST, Deepesh Varatharajan wrote:
> Hi Mathew,
>
> I attempted to reproduce this failure locally on two different servers=20
> using qemuarm as the machine,
> but I was unable to replicate the issue. Additionally, I observed that=20
> the failing unit test had not been
> previously ignored and it was not part of the unit tests I re-enabled=20
> for execution. Do you think I should
> investigate with any additional configurations?
>

Hi Deepesh,

I was able to reproduce it locally with
https://web.git.yoctoproject.org/poky-ci-archive/tag/?h=3Dautobuilder.yocto=
project.org/valkyrie/a-full-1453
and following commands

. oe-init-build-env
echo 'MACHINE =3D "qemuarm"' >> conf/local.conf
echo 'SANITY_TESTED_DISTROS =3D ""' >> conf/local.conf
oe-selftest -r rust.RustSelfTestSystemEmulated.test_rust

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


