Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C484C87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 08:58:24 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.17228.1754384294124676772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 01:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QARkPsyl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1703D43270;
	Tue,  5 Aug 2025 08:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754384292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z/ZVTn336aniih7oSaLOb7kYDbCVVSFP/fSJepvaHLo=;
	b=QARkPsylTGwJH8FNa2/azoWGTgtqoqgNfscDyaF2J50teSyxLDIT5zuse/dkRZZ8VKysI5
	YLweg0p6sMtIALrAjozDVtQYqVdQB9JXtClT6fq0pntJq1zK4hzb0Jqo7Jj5K6l0UwV0XC
	ppnqJBS89VkWm1CNTuqM7digfuF7bsICfbbvp5AeMCQpOgGQOwmHa+Mcp8CL9oiHv88+LJ
	ek0PWEcCnhwnUHdJm4E/8f1LUzsssSighwXNWEWxga0fnLuXDs8ezlvL5B82/9hZw7JHgP
	8zqVn2K/3yIxegY5q5sps4q0A3UdssCuAF+d5km8yRmDfJvgrAtS6206v/QwHA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Aug 2025 10:58:11 +0200
Message-Id: <DBUDBTBRAMSR.12Y29XQHJDSTZ@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 2/3] dbus: use the systemd class to handle
 the unit files
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250804195427.153551-1-ross.burton@arm.com>
 <20250804195427.153551-2-ross.burton@arm.com>
In-Reply-To: <20250804195427.153551-2-ross.burton@arm.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudegjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrtghomhdprhgtphhtthhopehophgvnhgvm
 hgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 08:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221465

On Mon Aug 4, 2025 at 9:54 PM CEST, Ross Burton via lists.openembedded.org =
wrote:
> Originally, the dbus recipe couldn't use the systemd class because there
> was a circular dependency between systemd and dbus.
>
> However, since systemd v209 in 2014[1] systemd hasn't needed libdbus, as
> it has it's own implementation of the client library. DBus does not use
> the systemd libraries, so there is no circular dependency.
>
> The dbus build was already was installing the service and socket files,
> so we are installing them again. Remove the installation of the units.
>
> Manually mask dbus-1.service by simply creating a symlink, instead of
> depending on systemctl and using an postinstall script.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
>
> [1] dbus: 718db96199 ("core: convert PID 1 to libsystemd-bus")
> ---

Hi Ross,

I suspect this patch is the source of this error:

ERROR: dbus-1.16.2-r0 do_install: Execution of '/srv/pokybuild/yocto-worker=
/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/dbus/1.16.2/=
temp/run.do_install.976229' failed with exit code 1
...
| ln: failed to create symbolic link '/srv/pokybuild/yocto-worker/musl-qemu=
x86-64/build/build/tmp/work/core2-64-poky-linux-musl/dbus/1.16.2/image/lib/=
systemd/system/dbus-1.service': No such file or directory

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/2216
https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/2177
https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/2139

Can you have a look, please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


