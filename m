Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC8DC71148
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 15:47:26 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.407.1749829644480445069
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 08:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CPYRqEh8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A7934425C;
	Fri, 13 Jun 2025 15:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749829642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I5bGXHeRkDkXXyRa03HjAQ6tJX7Ya5AkyoJ0tJYOxPI=;
	b=CPYRqEh8asUkw1OZmFvbCdPDNDjCyFdDZmAF5zQaj08/oW2hKskj+unewsifvNpIikhcuD
	M9TpyiT43nRvrGmn8fiqFEYSRocfKoy2dYPB6b1SU2acEgbxMVcvZy0sTcujAmf5uFfuWc
	2uWgw0yHBd3EaiUlkmO9+SjUR9sthBu3V/2HPJaKs4jydfDVzKw6fHEWTGyZzqhhljA1Ol
	Rv4Q0XvWDO8uPRBi6adFUxGjwVbYO59b0w88LHwpmb+6+COk0/cUrxJT855N79fb3zQwzF
	2Se87VGEf2Xw5sFwyBikVSC7gTHlrR/BfswkV2rvp9pAwnE6zQ0mhJHU36efvw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Jun 2025 17:47:18 +0200
Message-Id: <DALIU6I8BTOY.X92SR2CLRDOD@bootlin.com>
Subject: Re: [OE-core] [PATCH] ovmf: fix CVE-2024-38797
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <hongxu.jia@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <18488187B35E401C.461@lists.openembedded.org>
 <ef0d7c5d-d97f-4339-ac8b-28e7313159b8@windriver.com>
In-Reply-To: <ef0d7c5d-d97f-4339-ac8b-28e7313159b8@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeffheeggfeljeevfeejudejueetgfefhfdttdejuefgtedugedtudfhhfdthfefnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehhohhnghiguhdrjhhirgesvghnghdrfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopehophgvn
 hgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 15:47:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218615

On Fri Jun 13, 2025 at 7:02 AM CEST, hongxu via lists.openembedded.org wrot=
e:
> Also submitted to personal github to assure `git am --keep-cr' work
>
> https://github.com/hongxu-jia/openembedded-core/commit/c1d0bf8c7e17eee0a3=
dea96db18675af62ddfc1e
>
> //Hongxu
>

Thanks, this was useful!

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


