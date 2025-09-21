Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4102ECAC59A
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 12:25:31 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.28075.1758457524143463132
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Sep 2025 05:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uPgI/8Z5;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 548871A0F44;
	Sun, 21 Sep 2025 12:25:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2960B60634;
	Sun, 21 Sep 2025 12:25:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3BC3C102F16EB;
	Sun, 21 Sep 2025 14:25:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758457521; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z4l02Uoo3bcBp7KSG3d4LWql1fLol5E/PfyvFphpyMU=;
	b=uPgI/8Z5hPniaMUmJO5+Nau3m65TJn6ULCtNqV+xz9C9im8yyDNNchA8+Mv1uJkqNar/z+
	JkBdhlLHDqw2/k7srr1ybRAwzAiNCBNq41IRyGL5GlLaUARbRm+Us9sd/CMCIGtWPoLnpL
	+onk9HW3JOcjifiOmz3PGDSZiUOQCiLox5sJjFTzIJdA6VdKeYBZ/hBqAtA+xlvUj0x5Tf
	OCGMAfD/TRZkcnZYJhWvS4nvWr/UQls6L6FQl43/CaX8l6G5UsELlFM/dzRwjNZWNyCYzp
	7ANg+tnD0gHdSLpcl/EjxqwrMq6pBlo5biW5o5+9kv6tLd9klZn2IZfI882gYA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 21 Sep 2025 14:25:08 +0200
Message-Id: <DCYH5V5GB1LB.1KAPRIVKZGTWO@bootlin.com>
Subject: Re: [oe-core][PATCHv9 0/6] Display manager proposal for x11 and
 wayland
Cc: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <rs@ti.com>, <richard.purdie@linuxfoundation.org>,
 <ross.burton@arm.com>, <alex@linutronix.de>, <otavio@ossystems.com.br>,
 <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
 <denis@denix.org>, <reatmon@ti.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250918214903.341452-1-rs@ti.com>
In-Reply-To: <20250918214903.341452-1-rs@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 12:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223794

On Thu Sep 18, 2025 at 11:48 PM CEST, rs wrote:
> From: Randolph Sapp <rs@ti.com>
>
> We've recently run into some issues with weston-init attempting to start =
Weston
> prior to all drm devices being registered. There's not really a good, scr=
iptable
> mechanism to listen in to device registration events that works with the
> existing weston-init package. Well, at least one that doesn't involve pol=
ling
> files or introducing more dependency on the init system being used.
>
> I also see there is also a lot of scripting around starting X11,
> xserver-nodm-init, that (from my limited review) should experience the sa=
me
> issue.
>
> I'd like to introduce the following display manager for oe-core, emptty [=
1].
> This display manager is, as described upstream, a "Dead simple CLI Displa=
y
> Manager on TTY". It supports both x11 and wayland sessions, with togglabl=
e build
> parameters to completely remove x11 and pam dependencies. It's licensed M=
IT,
> which shouldn't be an issue for any users. (It is written in Go, if you h=
ave
> opinions about that.)
>
> With this, both weston-init and the xserver-nodm-init packages can be re-=
tuned
> to leverage this display manager and simply add a user and emptty config =
for an
> autologin session. This can resolve the current behavior across init syst=
ems
> without additional scripting, and move some development out of this layer=
.
>
> This lists myself as a maintainer of emptty as well as xserver-nodm-init =
and
> xuser-account since these are currently unassigned and I've reworked them
> significantly here.
>
> Sorry for the delay on this series. I found a few bugs in emptty that I w=
anted
> to address before submitting this officially.
>

Hi Randolph,

Thanks for your patch.

I took this series, but it looks like we have a build issue, maybe only
with altcfg distro:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/lib/oeqa/core/de=
corator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/lib/oeqa/core/de=
corator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/lib/oeqa/core/de=
corator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86-alt/build/meta/lib/oeqa/runtime=
/cases/xorg.py", line 31, in test_xorg_running
    self.assertEqual(status, 0, msg=3Dmsg)
AssertionError: 1 !=3D 0 : Xorg does not appear to be running   PID USER   =
    VSZ STAT COMMAND
...
2025/09/21 11:59:34 Closing PAM auth
2025/09/21 11:59:34 Failure setting user credentials
2025/09/21 11:59:34 Authentication failure
...
RESULTS - xorg.XorgTest.test_xorg_running: FAILED (1.41s)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2402
https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2407

Can you have a look at it please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


