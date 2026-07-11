Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B408AC43458
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 18:21:33 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1363.1783794089017940569
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 11:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iAJCMx3t;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F2357C2C665
	for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 18:21:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9FC0C60345;
	Sat, 11 Jul 2026 18:21:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C398A11BD0BC6;
	Sat, 11 Jul 2026 20:21:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783794085; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uWLeWmFe+5Y4BMGtvsmIgpoERPupjWahBn9CqQeLbwA=;
	b=iAJCMx3tHQhWCJI9UObxJfsMiBb1U3+W4rBiFdkWzvB8pKZHj1UFmkkfEQQTjysO6H9Wfd
	Ybg+sQAm/+RC7Qz80qqpVL7HPerUROub96gyxjzCWalbRNxYUAoUWoMnIJcaaLj25ZGOkQ
	7yGq3vbwFk2332tc0wTD+8mjzmWtC4z0XdruejGTGwJrlyg0gPW3N7tPe2hzY/NGFpzxG8
	VugIDeD7g+yFPKsNP7XWtZuVCzKtmd5kZ+4l6aAyEgVof7JNtDssE/MJUlZD4p0CFf+Ylg
	RY/17/++0VAJBZKGCaj10lHx/mpbhcrx+VejNCVO/kEih/TZvac71FAgwnxwVQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 11 Jul 2026 20:21:23 +0200
Message-Id: <DJVY88YLD7A6.280XMNFRJSUGE@bootlin.com>
Subject: Re: [OE-core] [PATCH] memory-control: add recipe and bbclass for
 cgroup v2 memory limiting
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Ishaan.Desai@ibm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260710170500.3863193-1-Ishaan.Desai@ibm.com>
In-Reply-To: <20260710170500.3863193-1-Ishaan.Desai@ibm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 18:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240721

On Fri Jul 10, 2026 at 7:05 PM CEST, Ishaan Desai via lists.openembedded.or=
g wrote:
> Adds a CLI tool and bbclass for applying per-service memory limits via
> systemd resource control and Linux cgroups v2.
>
> The memory-control command inspects MemoryMax and MemoryHigh settings
> for any running systemd service and lists all services with a drop-in
> applied.
>
> memory-control.bbclass allows any recipe to set a memory limit at build
> time by inheriting the class and setting MEMORY_LIMIT. Two OOM policies
> are available via MEMORY_OOM_POLICY: "reboot" (default) reboots on OOM,
> and "kill" terminates only the offending process.
>
> AI-Generated: Uses IBM Bob
>
> Signed-off-by: Ishaan Desai <Ishaan.Desai@ibm.com>
> ---

Hi Ishaan,

Thanks for your patch.

It looks like this is breaking builds on some platforms:

ERROR: Nothing RPROVIDES 'systemd' (but /srv/pokybuild/yocto-worker/no-x11/=
build/layers/openembedded-core/meta/recipes-support/memory-control/memory-c=
ontrol_1.0.bb RDEPENDS on or otherwise requires it)
systemd was skipped: using DISTRO 'poky', which is missing required DISTRO_=
FEATURES: 'usrmerge systemd'
NOTE: Runtime target 'systemd' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['systemd']
NOTE: Runtime target 'memory-control' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['memory-control', 'systemd']
ERROR: Nothing RPROVIDES 'memory-control-dev' (but /srv/pokybuild/yocto-wor=
ker/no-x11/build/layers/openembedded-core/meta/recipes-support/memory-contr=
ol/memory-control_1.0.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'memory-control-dev'
NOTE: Runtime target 'memory-control-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['memory-control-dev']


https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/4115
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/4141
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/7643378/raw_inlin=
e

Also, please add the corresponding entry in
meta/conf/distro/include/maintainers.inc.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


