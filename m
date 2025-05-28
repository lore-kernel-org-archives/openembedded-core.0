Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B5FC5AD49
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 12:33:37 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.14448.1748435616975145617
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 05:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NDgsBlfX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE31B4398A;
	Wed, 28 May 2025 12:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748435615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=leVSH/25v0KJoYLasnqubWJpbb+siZ9xzh9ehzo/fU8=;
	b=NDgsBlfXjlJLNRAx9cHHEhtzJ7PGriPyKRXXs1Qlsf7SOkIMeeqfX+WLHeipnoZe9aY9fK
	dxPmLUHb49SxdPzip3qwFCQdb4r66u4oy9QAtcY1qWRUVJSJgkE4aS0nurCE4XmDBwJp9O
	BI5VTILA90dculpD6QaXKj9aX8vrhwjht5Df8rU+V50GFRk3dNS1SLQXnZFchaMD2F0/Sc
	Chj6ksIFkk5L2q4xugZIsnHv5LgkmNd7JiExj+BZtiiU6xyeWfnljCLdvCQD2JX44oy91q
	+DuoeRv93OYnsMbE9A+pbJp2NRfiwyq8lyC7lm9N6yIEdtU3sPQszhOaCfecfw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 May 2025 14:33:34 +0200
Message-Id: <DA7SP4NN2WXR.1NUSV0GI05ZO5@bootlin.com>
Subject: Re: [OE-core] [PATCH] systemd.bbclass: fix postinst for real
 systemd-systemctl-native
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Patrick Williams" <patrick@stwcx.xyz>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250528035625.1262266-1-patrick@stwcx.xyz>
In-Reply-To: <20250528035625.1262266-1-patrick@stwcx.xyz>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfedvjeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffvdelfefhffekuedvtefhgfegtdfhvefggeetfefhhefgfeeflefhteduvdekffenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmegttdgsvgemsgelrgekmegvheelvdemiegrfehfnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemtgdtsggvmegslegrkeemvgehledvmeeirgeffhdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehprghtrhhitghksehsthiftgigrdighiiipdhrtghpt
 hhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 12:33:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217343

On Wed May 28, 2025 at 5:56 AM CEST, Patrick Williams wrote:
> The commit 7a580800db39 switched from a small Python implementation
> of `systemctl` to using the real systemctl executable from the
> systemd package.  In the systemd.bbclass, systemd-systemctl-native
> is used to default-enable services, based on the SYSTEMD_SERVICES
> variable, but this was only done if `systemctl` can be executed
> without error.  The problem is that the real systemctl executable
> treats a zero argument call as if `systemctl list-units` were ran.
> This cannot be done when cross-compiling and yields:
>
> ```
>     Failed to connect to system scope bus via local transport: Operation
>     not permitted (consider using --machine=3D<user>@.host --user to
>     connect to bus of other user)
> ```
>
> The end result is that the `systemd_postinst` effectively turns into
> a silent no-op and services are not correctly enabled.
>
> Switch the systemd.bbclass to use `systemctl --help` instead, which
> does not require any dbus access to be functional.
>
> Fixes: 7a580800db39 ("systemd: Build the systemctl executable")
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---

Hi Patrick,

Thanks for your patch.

It looks like this is breaking postinstall in some configurations, with
the following error:

ERROR: core-image-sato-1.0-r0 do_rootfs: Postinstall scriptlets of ['bluez5=
', 'ofono', 'connman', 'xserver-nodm-init', 'avahi-daemon', 'rpcbind', 'run=
-postinsts'] have failed. If the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget:${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/1704

Looking at the build, I believe following configuration should be enough
to reproduce on core-image-sato or even core-image-minimal.

INIT_MANAGER =3D 'systemd'
DISTRO_FEATURES_BACKFILL_CONSIDERED:remove =3D 'sysvinit'
TEST_SUITES:append =3D ' systemd'

Can you have a look at the source of this issue please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


