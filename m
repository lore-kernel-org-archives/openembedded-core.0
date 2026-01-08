Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC06D185DB
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 11:32:01 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4492.1767871917338415835
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 03:31:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ML3gZ0yv;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5CA3B1A2702
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Jan 2026 11:31:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 24BD1606B6;
	Thu,  8 Jan 2026 11:31:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B8A23103C883E;
	Thu,  8 Jan 2026 12:31:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767871914; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=frNgLkei2b9vRlzulswzP6NQ2fDrelZv0qhPgcRj+9Y=;
	b=ML3gZ0yvy3hCIil5UEZFoWWIi+FzceEO2C/QwsvCXB7oXBwzQ+cFANm7mw/3tET2HcoxEq
	ywICsG/JuMFLbRCEsbAWgYYJ07Ypqs+Tg3mlIoX+esEpcCV9usuhcKAZx8T7HF6pbdwWQR
	gdVVc8OqJ6FG+mKZgkHdWEivAdgS+6tDZQe5S7rd1C+GBqS7lJgDZ9NauN/7j7ReGlzoDd
	GQdkpHN509tSmTHFOesjRPQzXmY9Fp6LW+/eGFDF4J2O8d4/PSBzCNRzsh69539e+gRIY/
	0iQe8nfIifsU8gAKEQTbj+JBEWvkY8w2XPJ8pOYa3U4401O2geoWoWAn+uYpHw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 12:31:53 +0100
Message-Id: <DFJ6AGZNL99N.VPY6DN6VPCWK@bootlin.com>
Subject: Re: [OE-core] [PATCH V2] qemurunner: Improve qmp module detection
 PKG_CONFIG_SYSROOT_DIR for qmp module path
Cc: "Alex Kanavin" <alex.kanavin@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <t.f.g.geelen@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260107202553.2965393-3-t.f.g.geelen@gmail.com>
In-Reply-To: <20260107202553.2965393-3-t.f.g.geelen@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 11:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229060

On Wed Jan 7, 2026 at 9:25 PM CET, Tom Geelen via lists.openembedded.org wr=
ote:
> Instead of using logfile to detect where qmp is located we can use PKG_CO=
NFIG_SYSROOT_DIR, passed via ENV to the launch function as this will point =
to the image recipe for which launch is called.
>
> Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
> ---

Hi Tom,

Thanks for your patch.

This is failing on the autobuilder, with the following error:

2026-01-08 10:20:15,532 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86-tc/build/layers/openembedded-co=
re/meta/lib/oeqa/utils/commands.py", line 390, in runqemu
    qemu.start(params=3Dqemuparams, ssh=3Dssh, runqemuparams=3Drunqemuparam=
s, launch_cmd=3Dlaunch_cmd, discard_writes=3Ddiscard_writes)
  File "/srv/pokybuild/yocto-worker/qemux86-tc/build/layers/openembedded-co=
re/meta/lib/oeqa/targetcontrol.py", line 179, in start
    raise RuntimeError("%s - FAILED to start qemu - check the task log and =
the boot log" % self.pn)
RuntimeError: core-image-minimal - FAILED to start qemu - check the task lo=
g and the boot log
...
DEBUG: Using kvm for runqemu
ERROR: qemurunner: qmp module missing, please ensure it's installed in /../=
recipe-sysroot-native/usr/lib/qemu-python (No module named 'qmp')

https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/2925
https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/2931
https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/2925
https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/2975

Can you have a look at these issues?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


