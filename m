Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7EBD65C73
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 15:53:48 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18240.1765986819695610223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 07:53:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IAPjPvbM;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B789B1A228B;
	Wed, 17 Dec 2025 15:53:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7FBC76072F;
	Wed, 17 Dec 2025 15:53:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B01B2102F0AD5;
	Wed, 17 Dec 2025 16:53:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765986812; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jeuvBByD937hzcNHYIqf9sNM/1FRSoIW4EQfbFadIu8=;
	b=IAPjPvbMCFKHNkUenFdOIudhGtQ73J1IMwSdh6KrIhfPjWt5u9DAmc7LiqqCtVv46kUevV
	KD1vq7EarA0tlNyenCwltYxRtoP2xn9lKNIa29R+yQzs/HSyww8Me8lhpPahyNCh5kbeSz
	lSf5JCbJnlhk14s1axCEMrFzvQmMvhw39gAHrkas/dF337lpUt3GkOSf7UhVsozgoJdTGD
	qrLaR9wwlNurfMSO9I8cSCBIJ0Hgcm+flH6I+8lPuh97YnJtxahHWOcasMt4cYURakS81s
	Qzk/u4lNuMAv+M5mXo4z+A8dWgqf7nijidjyrRl/fLXQJ31xzs0oVqiUy6Znew==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 16:53:28 +0100
Message-Id: <DF0M2RWXSXQ6.3W1LYE5JBZQC1@bootlin.com>
Subject: Re: [oe-core][PATCHv11 0/6] Display manager proposal for x11 and
 wayland
Cc: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
 <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <rs@ti.com>, <richard.purdie@linuxfoundation.org>, <alex@linutronix.de>,
 <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251216203803.3870049-1-rs@ti.com>
In-Reply-To: <20251216203803.3870049-1-rs@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228064

On Tue Dec 16, 2025 at 9:37 PM CET, Randolph Sapp via lists.openembedded.or=
g wrote:
> From: Randolph Sapp <rs@ti.com>
>
> Hello maintainers, I wanted to wait for the latest tag to get cut before
> bringing this back up, but here it is. This version addresses most of the
> concerns I've seen regarding this series and adds on a little more functi=
onality
> considering we now allow for proper session selection.
>
> This led me into a bit of a dive into the desktop-entry-spec [1] and asso=
ciated
> validator [2] that I wouldn't mind some opinions on as well if people are
> curious about that.
>
> Legacy details follow:
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
3].
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
> [1] https://gitlab.freedesktop.org/xdg/xdg-specs/-/merge_requests/110
> [2] https://gitlab.freedesktop.org/xdg/desktop-file-utils/-/merge_request=
s/28
> [3] https://github.com/tvrzna/emptty

Hi Randolph,

Thanks for the new version.

It look like this is breaking the xorg.XorgTest.test_xorg_running runtime
test:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemuarm64-alt/build/layers/openembedded=
-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemuarm64-alt/build/layers/openembedded=
-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemuarm64-alt/build/layers/openembedded=
-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemuarm64-alt/build/layers/openembedded=
-core/meta/lib/oeqa/runtime/cases/xorg.py", line 31, in test_xorg_running
    self.assertEqual(status, 0, msg=3Dmsg)
AssertionError: 1 !=3D 0 : Xorg does not appear to be running   PID USER   =
    VSZ STAT COMMAND
...
RESULTS - xorg.XorgTest.test_xorg_running: FAILED (1.97s)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2849
https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2838
https://autobuilder.yoctoproject.org/valkyrie/#/builders/67/builds/2898
https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/2856

Can you have a look at this issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


