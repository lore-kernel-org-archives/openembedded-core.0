Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F15FF60EC
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 08:26:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15499.1774945571316153603
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 01:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=eAlZoOe3;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1E79F4E42880
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 08:26:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA4BB6029D;
	Tue, 31 Mar 2026 08:26:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B1F610450EF5;
	Tue, 31 Mar 2026 10:26:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774945568; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LFbibYYyax0EN7r5q4ffSQn289vtM1sgHXP90Hrt9vY=;
	b=eAlZoOe345ZbdnTEIqOhvZR/JGzIiKyKOlYtHNDpaFoqGFvg4OFHz4F3ghLY74hDoPzpmM
	JFDZs2/z7gnVBQPhLPi4f4wtviQ9ewauyCMJOnOOcCMH/hSsW5UZnb22g/fbyy1g5jHpfy
	6w6ckn/XtJQVz1JhZSy8c5ZmUR3e+RJg2fDgUE7MAVdk7EGh2/fdb68I6T4XupJ+YVP4bV
	oMJ6YGcABhwFANEnBsV0B8tg/74FESnu7LlirHNlHLBEp0Jw37fIppmiy3oPxHeW727ohi
	wU+zjtQbzzy4JalDL9EVIVi0Gcy77jDS/+KUv6f1RvwBIa29tNMSoNrN2pZ1OQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 10:26:06 +0200
Message-Id: <DHGTOWJ0KD3W.3GQN9EX1KPGN@bootlin.com>
Subject: Re: [OE-core] [PATCH] busybox: do not build SUID binary without an
 applet
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <joerg.sommer@navimatix.de>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <820f2da115d925512984c0e8b3a133a51d8367d6.1774905987.git.joerg.sommer@navimatix.de>
In-Reply-To: <820f2da115d925512984c0e8b3a133a51d8367d6.1774905987.git.joerg.sommer@navimatix.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 08:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234271

On Mon Mar 30, 2026 at 11:26 PM CEST, J=C3=B6rg Sommer via lists.openembedd=
ed.org wrote:
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>
> If the merge of all config snippets leads to a SUID binary without any
> applets, do not build and install it to reduce the SUID binaries in the
> system.
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---

Hi J=C3=B6rg,

Thanks for your patch.

It looks like this is making tests fail, as some busybox applets are not
found in test images:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86-alt/build/layers/openembedded-c=
ore/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86-alt/build/layers/openembedded-c=
ore/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86-alt/build/layers/openembedded-c=
ore/meta/lib/oeqa/runtime/cases/ssh.py", line 36, in test_ssh
    self.fail("uname failed with \"%s\" (exit code %s)" % (output, status))
    ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AssertionError: uname failed with "sh: uname: not found" (exit code 127)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/3462
https://autobuilder.yoctoproject.org/valkyrie/#/builders/95/builds/3451
https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/3475

/bin/start_getty: line 9: readlink: not found
/bin/start_getty: line 20: /sbin/getty: not found
/bin/start_getty: line 9: readlink: not found

/bin/start_getty: line 20: /sbin/getty: not found
/bin/start_getty: line 20: /sbin/getty: not found
/bin/start_getty: line 9: readlink: not found
/bin/start_getty: line 20: /sbin/getty: not found
/bin/start_getty: line 9: /bin/start_getty: readlink: not foundline 9:
readlink: not found
/bin/start_getty: line 20: /sbin/getty: not found
/bin/start_getty: line 20: /sbin/getty: not found
/bin/start_getty: line 9: readlink: not found
/bin/start_getty: line 20: /sbin/getty: not found

INIT: Id "S0" respawning too fast: disabled for 5 minutes

/bin/start_getty: line 9: readlink: not found
/bin/start_getty: line 20: /sbin/getty: not found
/bin/start_getty: line 9: readlink: not found
/bin/start_getty: line 20: /sbin/getty: not found

https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/3461
https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/3461

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


