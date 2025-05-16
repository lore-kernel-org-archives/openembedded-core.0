Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FA9C3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 16:18:06 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.17474.1747412284775403812
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 09:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=n3PGzY/i;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D8C9439F6;
	Fri, 16 May 2025 16:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747412283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yEf6BDjN0DSOHRrZbbVJlho2RxqgNW6IbkAmKdZAeys=;
	b=n3PGzY/ixkzkj/jPBG47YM54KXawE+GQRUsr0j5xZ0nYf1ooko6EqLjih+uqB7yq9onz0B
	dGyOcqzRQ2mv4gmBFhLZjGfoG0Rc2QtD9efJZDET8bNaiPOX6MPUEzWfw9mwduhY/T668P
	6XUg3ekfCklCHkZaMxzBEQ99+qCvRL99xOdF3yT7iGYOG5nlYSOVARqTYfz5L2NFGtly3r
	NV1B9ooSMe7LxgfCr1bmjGnO9ntyAGMecmuvh+1zxQ/blSWsUQX7CwkQ+2ogO0BPIid4iT
	91AryyC5Ncx91tiJZxSmlq36vopS1q8gYKnqvpRlZe8WLGfVKg+U1sacbQU9Vg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 May 2025 18:18:01 +0200
Message-Id: <D9XPYFVP0CD4.358B3UWM5A4PI@bootlin.com>
Subject: Re: [oe-core][PATCHv4 1/5] libx11: create tmpfile dir for x11
 domain socket
Cc: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <rs@ti.com>, <richard.purdie@linuxfoundation.org>,
 <ross.burton@arm.com>, <alex@linutronix.de>, <otavio@ossystems.com.br>,
 <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
 <denis@denix.org>, <reatmon@ti.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250515214919.1404453-1-rs@ti.com>
 <20250515214919.1404453-2-rs@ti.com>
In-Reply-To: <20250515214919.1404453-2-rs@ti.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudefvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeeghfektedtfeegjeffvdfhudetledvfeffhfetkeffleefjefgieffudetjeevnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegrieeimeefudektdemkedvhegtmegsieekfeemfeegtdhfmeejieegtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemrgeiieemfedukedtmeekvdehtgemsgeikeefmeefgedtfhemjeeigedtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehrshesthhirdgtohhmpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhor
 hhgpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrtghomhdprhgtphhtthhopegrlhgvgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehothgrvhhiohesohhsshihshhtvghmshdrtghomhdrsghrpdhrtghpthhtohepkhgvgihinhdrhhgrohesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopegrfhgusehtihdrtghomhdprhgtphhtthhopeguvghthhgvrhhiughgvgesthhirdgtohhm
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 16:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216758

On Thu May 15, 2025 at 11:49 PM CEST, rs wrote:
> From: Randolph Sapp <rs@ti.com>
>
> Register a tmpfile.d or volatile directory entry for the x11 domain
> socket so this will always be created with the correct permissions.
>
> Currently some x11 related applications will create this directory if it
> doesn't already exist, but this is not true for everything. In addition,
> if the application in question isn't started as root, it's possible this
> directory can be owned by a non-root user. This isn't an issue by
> itself, but it can potentially lead to problems in a multi-user
> environment.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---

Hi Randolph,

Another build issue on various builders:

ERROR: libx11-1_1.8.12-r0 do_package: QA Issue: libx11: Files/directories w=
ere installed but not shipped in any package:
  /usr/lib/tmpfiles.d
  /usr/lib/tmpfiles.d/x11.conf
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install.
libx11: 2 installed and not shipped files. [installed-vs-shipped]
ERROR: libx11-1_1.8.12-r0 do_package: Fatal QA errors were found, failing t=
ask.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/93/builds/1631
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/1638
https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/1602
https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/1614

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


