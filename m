Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B82BEA8134
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 15:46:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22595.1770738386159930836
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 07:46:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ASNNd8dQ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 35A6D4E40BFF;
	Tue, 10 Feb 2026 15:46:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B37C606BD;
	Tue, 10 Feb 2026 15:46:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBE5C10B91FB6;
	Tue, 10 Feb 2026 16:46:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770738383; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GffjBaMnTyOPeMGr8+lphyxgFpDf5OgN3Wy6fPFh//g=;
	b=ASNNd8dQvJgbgS9ryPvH7jzfKXPyECSxqIATMhbJhZd1ixE2rSF/GrYkcfzMG4/6VaVKJb
	pX1jsQmRxZ1aQVfMjZ/EiwFkg62GB96oEARinjWh4GUumo8bjH1FOYWOzfVl3sOKyt+EqY
	fFLIXCpGyw++VYrP+tFtVE7QGTLFvTclMmsRwMC9BUbQcSmHXORsJ/cKJa3hmr8Aszyg9u
	c149cLcSHq8MRvoTm85FSn3DWFZtphWN1Uo6orbn+A0BGgyb0wTQdYHIT3vIi1hwHmPQJ1
	2VcpS0SQZ4uh71cNWrAXm3yNgoyXSl4KogvhdaRjQD8B5sea0EuPzAUFORQ3VA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 16:46:20 +0100
Message-Id: <DGBED9UTZVK0.2P2KE59AW872@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] shadow: upgrade from 4.18.0 to 4.19.3
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260210044850.2866022-1-Qi.Chen@windriver.com>
In-Reply-To: <20260210044850.2866022-1-Qi.Chen@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 15:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230913

On Tue Feb 10, 2026 at 5:48 AM CET, Chen Qi via lists.openembedded.org wrot=
e:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> The major changes in 4.19.x:
> https://github.com/shadow-maint/shadow/releases/tag/4.19.0
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---

Hi Chen,

Thanks for the upgrade.

It looks like this version fails to compile. Given the error and the
fact that it builds on some machines, maybe it is linked with the host
gcc version?

ERROR: shadow-native-4.19.3-r0 do_compile: Execution of '/srv/pokybuild/yoc=
to-worker/musl-qemux86/build/build/tmp/work/x86_64-linux/shadow-native/4.19=
.3/temp/run.do_compile.674478' failed with exit code 1
...
| ../../sources/shadow-4.19.3/lib/sssd.h:14:18: error: parameter name omitt=
ed
|    14 | sssd_flush_cache(int)
|       |                  ^~~

https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3175

So yes, we have a static inline function that takes one parameter but
does not use it. And the compiler is not happy as it is not named.

Can you have a look at that? Maybe there is already a fix upstream or
one could be submitted.

Thanks,
Mathieu


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


