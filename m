Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F90C54FB3
	for <webhook@archiver.kernel.org>; Sun, 25 May 2025 15:41:55 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.11442.1748187712107824939
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 May 2025 08:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=chMyCq5J;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7360438D0;
	Sun, 25 May 2025 15:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748187710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xmjTOR3Bzwl8bwQflQ+dNMejvYRUeB0Evi2kpcewj0Q=;
	b=chMyCq5JyVHNsbSnGjb2HZnkMt6Bzvbm0LqYF9d/QUrUtTQKrt/UxfL1l88x/0IhBt3uI2
	iu2fn12DxUZc4F1Cx1PnVXTUZh8PFWB4Q660TvY5D/0guYOffXyuSrrFG2gnbbfSNPdK80
	SjXY41m2OqOrM+89mN3Xi2Q543c6wt9YVOTO8xdWxbm/TzNbhCbNxKANbxE1qqgxjBoljX
	QS0UsUlqJcN2PUN9ZJRWqPWciMQp1mxZBY+q/MfGbtChngacGNjyYQemBvaOMmH5XnsxnJ
	0YMu/Jm7kuPtV/L6tId0jYxU/tYiYFzUG8W7zAxPKXRJd0oiNtXSmvu/XyX2OQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 May 2025 17:41:51 +0200
Message-Id: <DA5CTNMVP3RK.LB01EWGV6S6C@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <mac@mcrowe.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] kernel-fitimage: Cope with
 FIT_CONF_DEFAULT_DTB being empty
Cc: "Jack Mitchell" <jack@embed.me.uk>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250523122045.3097055-1-mac@mcrowe.com>
In-Reply-To: <20250523122045.3097055-1-mac@mcrowe.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduhedttdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffhvffuvefofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeutddvtdfhieefleeghfdvjeekleetkeeiiefgfeevjeeiheeuhfefvddtkeelnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegrieeimeefudektdemvdejsgdvmegtrgehmeehkegrtdemtgdukegtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemvdejsgdvmegtrgehmeehkegrtdemtgdukegtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepmhgrtgesmhgtrhhofigvrdgtohhmpdhrtghpthhtohepo
 hhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepjhgrtghksegvmhgsvggurdhmvgdruhhk
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 May 2025 15:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217248

On Fri May 23, 2025 at 2:20 PM CEST, Mike Crowe via lists.openembedded.org =
wrote:
> From: Mike Crowe <mac@mcrowe.com>
>
> Quote both sides of the comparison of ${FIT_CONF_DEFAULT_DTB} and $DTB
> consistently to avoid parse errors if either side is empty.
>
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> Reviewed-by: Jack Mitchell <jack@embed.me.uk>
> ---

Hi Mike,

Thanks for your patch.

Just a note: this patch is conflicting with the "FIT image improvements"
series:
https://lists.openembedded.org/g/openembedded-core/message/217192

As this series is most likely going to be merged soon, can you rewrite
your patch on top of it?

Thanks!

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


