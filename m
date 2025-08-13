Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C34AACA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 10:10:50 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.97862.1755079846849196109
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 03:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=j4+iFpqJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B022943A11;
	Wed, 13 Aug 2025 10:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755079845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/VII3yo+ZjavbO4JHH/H9q+DIWRFpiIKAGNj4vpdfhw=;
	b=j4+iFpqJjsU2s4RujSflkZ/u/gdqD9umeSWmoEuao2AhpfMFeRJ2GGPeQF0JtQGzqQjeaI
	szl2GunGLpPeEtSDdavI+IkyZjzu91TQQMf1cEb8m7OPx1bHljvW8eK0iRhh2OjPQPZceT
	QLz/3nEbAViyacTX2vCmQvAo6jD+YyF7WutaK5Y2MxyKsXgys2tKxTpTeXgSED9YZbxKpR
	Enq5RT7QxSY4K666w0/jNuKNePYZLnVbXwcyhQX2Olph01Hk87OFpMbiNFOSbDgd8N7I3q
	dHMnxVcS/jU/kUdbVkzQTE86AaVaJ8I9UjukGuGx62vW+scw1ui6tvDset7ifw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Aug 2025 12:10:44 +0200
Message-Id: <DC17VPQRAFV5.XZL8KUA3Y7RK@bootlin.com>
Subject: Re: [OE-core] [PATCH] systemd.bbclass: Make systemd_postinst run as
 intended
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <peter.kjellerstedt@axis.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250812211424.76559-1-pkj@axis.com>
In-Reply-To: <20250812211424.76559-1-pkj@axis.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeejleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepphgvthgvrhdrkhhjvghllhgvrhhsthgvughtsegrgihishdrtghomhdprhgtphhtt
 hhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 10:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221799

On Tue Aug 12, 2025 at 11:14 PM CEST, Peter Kjellerstedt via lists.openembe=
dded.org wrote:
> After the switch from using a systemctl written in Python to using the
> official version of systemctl from the systemd project, the
> systemd_postinst function has effectively not been executed during the
> rootfs creation. The reason is that systemctl provided by
> systemctl-native fails if run without argument (as systemd_postinst
> does):
>
>   Failed to connect to system scope bus via local transport: Operation
>   not permitted (consider using --machine=3D<user>@.host --user to connec=
t
>   to bus of other user)
>
> This is not seen in the logs since stderr is sent to /dev/null, and the
> only way to tell that there is a problem is because systemd services
> that are expected to be enabled aren't running.
>
> The reason this has gone unnoticed is because systemd_handle_machine_id
> in rootfs-postcommands.bbclass will call systemctl preset-all, which in
> most cases will create the missing links to enable the systemd services.
>
> This change effectively reverts commit
> a52e66762c0c51918b1ba3d4622759637b6e920a (systemd.bbclass: update
> command to check systemctl available) and instead only runs systemctl
> without arguments (to determine that it can communicate with systemd)
> when executed on target.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---

Hi Peter,

It looks like this is breaking the build in some configurations:

ERROR: core-image-sato-1.0-r0 do_rootfs: Postinstall scriptlets of ['bluez5=
', 'ofono', 'connman', 'xserver-nodm-init', 'avahi-daemon', 'rpcbind', 'run=
-postinsts'] have failed. If the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget:${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/2193

Can you have a look at these errors please?

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


