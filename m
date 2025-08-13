Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE2D0CA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 10:15:00 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.97919.1755080098948246978
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 03:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=N2wlfj/k;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB7EA430D7;
	Wed, 13 Aug 2025 10:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755080097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F365sLbixYoEEDyVkgx/+PnKpCyqosVkeADqiIxXGRk=;
	b=N2wlfj/kIrEfJyQdfQZBbKL9Sic/wiU4EfdGwTRouW3rGcgQqnnyVWvcmuQ6fBXBDIWIfw
	2IWuL4r0elyDKvEBpjO/ZWRE8FY1G8rHgdP8EnD75EVGvkguWJgSO4IlOG6rUzx5KrqPdv
	CgXNxgE8xZwbSpUhrhISPAcuU1cDOTzjwD3W9wOHa+yY85TvthGZKeuS9YGfH66/Gd+zZt
	BrfZypZtEYbRiLJL28s/gdx1MpfQZ+rwq9XlozTcwZxgCfYKRywtcMd5RPzKQJq6ni6T5d
	BV1AhpOzVR47mJQ4Uio7cY3ACD4SWdmsy/K4YB84xtqbQzpO/s3kwh3yRX9Zjw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Aug 2025 12:14:56 +0200
Message-Id: <DC17YXMZE1EK.38MQXWDL5WLTI@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <peter.kjellerstedt@axis.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] systemd.bbclass: Make systemd_postinst run as
 intended
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250812211424.76559-1-pkj@axis.com>
 <DC17VPQRAFV5.XZL8KUA3Y7RK@bootlin.com>
In-Reply-To: <DC17VPQRAFV5.XZL8KUA3Y7RK@bootlin.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeejleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtgfeuvdfghfegtdehvdegvefhkeegheeikeelfeefffetheeitdduudeludduleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepphgvthgvrhdrkhhjvghllhgvrhhsthgvughtsegrgihishdrtghomhdprhgtphhtt
 hhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 10:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221801

On Wed Aug 13, 2025 at 12:10 PM CEST, Mathieu Dubois-Briand wrote:
> On Tue Aug 12, 2025 at 11:14 PM CEST, Peter Kjellerstedt via lists.openem=
bedded.org wrote:
>> After the switch from using a systemctl written in Python to using the
>> official version of systemctl from the systemd project, the
>> systemd_postinst function has effectively not been executed during the
>> rootfs creation. The reason is that systemctl provided by
>> systemctl-native fails if run without argument (as systemd_postinst
>> does):
>>
>>   Failed to connect to system scope bus via local transport: Operation
>>   not permitted (consider using --machine=3D<user>@.host --user to conne=
ct
>>   to bus of other user)
>>
>> This is not seen in the logs since stderr is sent to /dev/null, and the
>> only way to tell that there is a problem is because systemd services
>> that are expected to be enabled aren't running.
>>
>> The reason this has gone unnoticed is because systemd_handle_machine_id
>> in rootfs-postcommands.bbclass will call systemctl preset-all, which in
>> most cases will create the missing links to enable the systemd services.
>>
>> This change effectively reverts commit
>> a52e66762c0c51918b1ba3d4622759637b6e920a (systemd.bbclass: update
>> command to check systemctl available) and instead only runs systemctl
>> without arguments (to determine that it can communicate with systemd)
>> when executed on target.
>>
>> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> ---
>
> Hi Peter,
>
> It looks like this is breaking the build in some configurations:
>
> ERROR: core-image-sato-1.0-r0 do_rootfs: Postinstall scriptlets of ['blue=
z5', 'ofono', 'connman', 'xserver-nodm-init', 'avahi-daemon', 'rpcbind', 'r=
un-postinsts'] have failed. If the intention is to defer them to first boot=
,
> then please place them into pkg_postinst_ontarget:${PN} ().
> Deferring to first boot via 'exit 1' is no longer supported.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/2193
>
> Can you have a look at these errors please?
>
> Best regards,
> Mathieu

I just saw selftests are also failing for the same reason:

2025-08-13 08:15:22,377 - oe-selftest - INFO - overlayfs.OverlayFSTests.tes=
t_not_all_units_installed (subunit.RemotedTestCase)
2025-08-13 08:15:22,388 - oe-selftest - INFO -  ... FAIL
...
ERROR: core-image-minimal-1.0-r0 do_rootfs: Postinstall scriptlets of ['run=
-postinsts'] have failed. If the intention is to defer them to first boot,

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2141
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2069

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


