Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBBD8C3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 11:26:29 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.72406.1744111583259573076
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 04:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BaOVz5A/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D15E543D43;
	Tue,  8 Apr 2025 11:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744111581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rzgREW8gU4qDRnTj+r8z/5waaSbF4tlRMOzXWFh82qE=;
	b=BaOVz5A/KhOkbdsewWG7+/IWGfn9h2IdBvbFtSdh4PQpCuY3KJDcsKPjX1NPi4tlWHb8/R
	Hs9CgyUoWvXnVNWKmab+PZjOVZukQRq6CHh9tHPUcqxzI3dYGzpMvnX92Sv+SF7yA6p2jA
	EEP6hSzECaGkk+/mwvlAUOueGu9VvYp3uhQ5Z+RaWSAEJCMtm6h3KfGgT50DvCPJwUBILe
	jnWKbIXy1W97qczyy5u8/sHC6+ViFrO1j+KqcYw3V+KQpw4I2l5T+G6Ljg3R4YmI+QoPJI
	oSxPbG1vKqqVgZzJV0+ewk5HCigMF036hGRiqu7m52ngpBxHzKXICn9m4feorA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Apr 2025 13:26:21 +0200
Message-Id: <D917YFGEAQ3W.14RJYH3FLAVO6@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 00/11] systemd based initrd and modular
 kernel support
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Mikko Rapeli" <mikko.rapeli@linaro.org>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <D908T3Q0WX31.XYGZX5NGTRL7@bootlin.com> <Z_OIeeFp_hWMjTkJ@nuoska>
 <D90A1HIWOZYV.25J0FOK1DMUDK@bootlin.com> <Z_OZ24jicgPP2HaP@nuoska>
 <D90BBNJUDNA5.3UQXSK0K43FNK@bootlin.com>
 <18340261181AE46F.21691@lists.openembedded.org> <Z_OzVyWUGja6dkMe@nuoska>
In-Reply-To: <Z_OzVyWUGja6dkMe@nuoska>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddvleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffleelgfevkeefgeehjeeiudetudekffekuddvvedvtdeggfffffevfefgvddunecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepmhhikhhkohdrrhgrphgvlhhisehlihhnrghrohdrohhrghdprhgtphhtthhop
 ehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 11:26:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214535

On Mon Apr 7, 2025 at 1:13 PM CEST, Mikko Rapeli wrote:
> Hi,
>
> On Mon, Apr 07, 2025 at 01:26:06PM +0300, Mikko Rapeli via lists.openembe=
dded.org wrote:
> Sent this out as "oeqa wic.py: clean image build dir before rebuild in te=
st_permissions()"
> separately. I think this test failure is unrelated to the changes but rel=
ated to the
> way tests are executed. I think tests behave different depending if sstat=
e has the
> image recipe output or not.
>
> Cheers,
>
> -Mikko

Ok, it seems this patch indeed fixes the oe-selftest on the autobuilder:
I had some successful builds this morning on a separate branch. Not sure
about what is really the link between the error we saw locally and the
one on the autobuilder.

I will pick both this series and the said patch in my -next branch later
today.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


