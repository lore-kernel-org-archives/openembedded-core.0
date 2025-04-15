Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76700C369B5
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 08:29:42 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.15234.1744705774103995816
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 01:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KlU7Z8NB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF8FA4320D;
	Tue, 15 Apr 2025 08:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744705772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5rjNryaX3iqHzxblDHP/xR1Vvcifl7FilbQVe4FcWUY=;
	b=KlU7Z8NBwFEYKBazp86F8L4BU+pk/tlhiDfAzAE4o5Z1L/sbaHIVhj3cLWx86bYGv3Bg/R
	M8ASxd8lVXSk+DYUhFQu33GG2gGdMyLzXNPtpuCLxL+UU2bSvG/C346oB3cDvENpmyjgML
	BT4MYYcK50+hzApWJFZ6v0YpM/guDuRx/C5dKw9J6pZfRWHkWpfZyHSkxeYGfrFr+qkvwN
	7deE4iKeGKR9hgCjiQCwhydENrmvWhfS0lhgzkNQ0UhFndJfNz+g/abAKHQQL6uW7ltHo8
	ZEI3eRDan4EQOJ8BA6mE9btwBMpe6wqXClCb0vuhfVmaaYreJLkr8fLdmyA9GA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Apr 2025 10:29:32 +0200
Message-Id: <D972KUZF4M3V.3B8DB0F842B44@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Tom Hochstein" <tom.hochstein@oss.nxp.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5 4/5] oeqa/sdk/meson: improve test to
 validate host/build target assignments
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250407211806.1782316-1-tom.hochstein@oss.nxp.com>
 <20250407211806.1782316-4-tom.hochstein@oss.nxp.com>
 <D91AQNC6UKX5.394WLWGGFWT4O@bootlin.com>
 <183460753CA35884.31078@lists.openembedded.org>
 <1834F816ACB44615.7383@lists.openembedded.org>
 <1834FEA34534143E.27206@lists.openembedded.org>
 <cdae0d74-ade9-4b2b-a0ab-45788cd8044f@oss.nxp.com>
 <18353B5DF2EF4BC1.27206@lists.openembedded.org>
 <D93QAMBHTAR4.1CIOF4WMRTVEQ@bootlin.com>
 <9de83915-c1d7-4b18-b76f-86cc5778c9be@oss.nxp.com>
In-Reply-To: <9de83915-c1d7-4b18-b76f-86cc5778c9be@oss.nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeftdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkefhfffgiedtheegffefjeeuuedvudehtdevieehgfevleffleffudektdeugfefnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehtohhmrdhhohgthhhsthgvihhnsehoshhsrdhngihprdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgto
 hhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 08:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214828

On Fri Apr 11, 2025 at 5:37 PM CEST, Tom Hochstein wrote:
>
> Thanks, Mathieu! I can reproduce it now.
>
> The key in your steps to reproduce is setting SDKMACHINE =3D "i686". So
> the SDK is built for i686, but the build machine is x86_64, so the test
> is not valid.
>
> How should it be fixed? Testing for the mismatch and raising SkipTest in
> MesonTest.setUp?
>
> Tom

I'm not really familiar with these tests to be honest, so I cannot
really help you on that. Sorry.


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


