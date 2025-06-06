Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2453EC5B549
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 08:02:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.28786.1749196927666390407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 01:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ItHR55SC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54D0D442AD;
	Fri,  6 Jun 2025 08:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749196925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kbxmR2rI/du7I6AxefnV9kS+icWCJStOliMpso8HOYs=;
	b=ItHR55SCCedZAWVXcW+XLawZnZ6zGY4+xh9eoAfvakeZsuAKmgHVKbbcdaUK5oMS3V9qpx
	Iy4MuZtIU+aVRRWpLIJqSh5s0EFag6UsidSo63wiUPo19FjR0bMdFuDdjTp3xljW6uvC+j
	48gVBpHgfQq7hWqpQbi8G2pGdX1r+hvQbSlS7PXxoYkvEgoaM3QErnEn8aQFO9DSS6hK/l
	qxRXcpoeiTxvdfLiOUwN8ha+3VlARScLLaV1/0W61etuex/bIMF5oCAZXiVPfnfbTe8lh3
	SYPSoMDsKscjprSkt7vZV35ADRJc3bdFV9fwgVeQQYmm9Bwadz9bJLLCTH1/Jw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Jun 2025 10:02:04 +0200
Message-Id: <DAFAK5RG00NC.29AFZ7K01KRC@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/1] kernel-module-split: fix conf file
 generation when KERNEL_SPLIT_MODULES=0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dixitparmar19@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250605131235.366013-1-dixitparmar19@gmail.com>
In-Reply-To: <20250605131235.366013-1-dixitparmar19@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehffellefgveekfeegheejiedutedukeffkeduvdevvddtgefgffffveefgfdvudenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopeguihigihhtphgrrhhmrghrudelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 08:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218117

On Thu Jun 5, 2025 at 3:12 PM CEST, Dixit Parmar via lists.openembedded.org=
 wrote:
> KERNEL_MODULE_AUTOLOAD defines the list of the kernel modules to be autol=
oaded
> on boot. kernel-module-split.bbclass generates the required modules.load.=
d and
> conf files for each kernel module. This conf files inturn read by system =
service
> to perform module loading and configuration. When a kernel module is adde=
d to
> KERNEL_MODULE_AUTOLOAD the conf files must be generated in all cases.
> When KERNEL_SPLIT_MODULES=3D0 modprobe and autoload conf files are not
> getting generated for the kernel modules.
> To fix that enhanced the class implementation by separating out conf
> file handling mechanism in two functions, generate_conf_files() and
> frob_metadata(). generate_conf_files() handles no-split case where as
> frob_metadata() keeps handling the existing case for spliting the modules=
.
> Splitted common handling/generation of conf files stuff in to handle_conf=
_files()
> function which gets invoked by both frob_metadata() and generate_conf_fil=
es()
> on top of the scenario specific handling done in respective functions.
> This implementation covers generation of the conf files for in-tree kerne=
l
> modules as well as standalone kernel module built as seperate package/rec=
ipe.
>
> [YOCTO #15145]
>
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
>
> ---

Hi Dixit,

I have some conflicts while trying to apply this on master branch. Do
you confirm this is targeting master?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


