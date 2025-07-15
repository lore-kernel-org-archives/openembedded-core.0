Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE30C83F1D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:25:46 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.3278.1752567944638407562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 01:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bjZ6NBRv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE69F41C7D;
	Tue, 15 Jul 2025 08:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752567943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PhdLqUy1lUHJ+obpVW5iwW7RvBTEZNbR2Bj0gOyEp0o=;
	b=bjZ6NBRvEYANStEqf60sdMsRY4CIPmNoITiGMxdAPW46jc8CeT+yTJB8XPLD3oWI2pgjqN
	1W1sADA063OKJmJNf4+bWiFpeL2imMgaCupA7TYyC9dMjtwx7xxFgrtx0inbQ0i4Uf5oHI
	VqXGI0kNCo+geujGxJtKJagizNk3TZ/Ajpn880Pev214NxyTwuPxYo+RNwQ1xYp2LFg4Ck
	QUMKp/R4Zgnik/KUMXysRdawp+oRqZNNhoH51h8SAF/Pj0XE8oF8cAM1WcUQB8y8rHEQdn
	ZfiUkEHzUKm3PVukQOAbCmXr6GI7/Sjc73pbMuXylGYTL1Xrk0q05qNF0u3QYw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Jul 2025 10:25:41 +0200
Message-Id: <DBCHHHGNABHB.3CT26KMMAQ0TW@bootlin.com>
Subject: Re: [OE-core] [PATCH 3/3] lldb: add new recipe, split out of clang
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250711155136.2172651-1-ross.burton@arm.com>
 <20250711155136.2172651-3-ross.burton@arm.com>
In-Reply-To: <20250711155136.2172651-3-ross.burton@arm.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehgeefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteekvddtudetteetgeejueekhffgjefgffefffeuffejhfdvheejfeekfeduvddvnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdihohgtthhordhiohdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrtghomhdprhgtphhtt
 hhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220289

On Fri Jul 11, 2025 at 5:51 PM CEST, Ross Burton via lists.openembedded.org=
 wrote:
> LLDB takes a reasonable amount of time to compile, but also isn't an
> essential component of the LLVM suite.
>
> Instead of always building it when we build clang, split it out into a
> separate recipe.
>
> On my build machine where clang takes 21 minutes to build with lldb, it
> takes 19 minutes without lldb.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

I know you are already aware of this, but just to keep a trace, this is
failing reproducibility test on the autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2088
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250714-7q8vsabu/=
packages/diff-html/

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


