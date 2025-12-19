Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61626D767C2
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 10:18:08 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14037.1766139479006223349
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 02:18:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yeIh1442;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 125211A22DF;
	Fri, 19 Dec 2025 10:17:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CA9376071D;
	Fri, 19 Dec 2025 10:17:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EEA18102F0BC7;
	Fri, 19 Dec 2025 11:17:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766139475; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bN+qO0J5VMQ05CmruBXfXJiczLoY6TEM+ymM5oZPMyc=;
	b=yeIh1442g+Qzmz1MvxG76W4DFGxdR/UCgQCCoem9AdN71EViPD/j37e+tEdPZn7tQWVyqq
	2CllCyV9DhpGKYLemvxHE5+hiQZkuSFO1IRzmgic8pPx4PtZBy4zENSUKndHb/Y4OFAuFd
	E9q4m+/qPByQR/V5P/P6/qsKsOj60ruJl85tgwVxUmkOHEU5a9VqNhcll6EWF+DnVIi518
	6MqWSxGqVmu7YaNrXvROJFwNK3Y5C6MSmfejI26iq5PzQM8AjYXxZFPDSKHHVkHXEJX2Fn
	PmVLXOKdhp3jTJDDCjKN7OFLOkPxwZukhGxLUmceD2nLqftv9ZRIcoGgzFt/2w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 11:17:47 +0100
Message-Id: <DF246UM8MWVP.1AE5NZSCNETPG@bootlin.com>
To: <rs@ti.com>, <richard.purdie@linuxfoundation.org>, <alex@linutronix.de>,
 <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
Subject: Re: [oe-core][PATCHv12 0/6] Display manager proposal for x11 and
 wayland
Cc: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
 <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251218191025.667701-2-rs@ti.com>
In-Reply-To: <20251218191025.667701-2-rs@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 10:18:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228206

On Thu Dec 18, 2025 at 8:10 PM CET, rs wrote:
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

Hi Randolph,

Thanks for the new version. It looks like it got better. Still, we got a
few issues on the autobuilder.

First, issue, probably because of nopasswdlogin group:

 NOTE: Resolving any missing task queue dependencies
2025-12-19 08:42:54,839 - oe-selftest - INFO -       ERROR: Nothing RPROVID=
ES 'xserver-nodm-init' (but /srv/pokybuild/yocto-worker/reproducible/build/=
layers/openembedded-core/meta/recipes-graphics/packagegroups/packagegroup-c=
ore-x11.bb RDEPENDS on or otherwise requires it)
2025-12-19 08:42:54,839 - oe-selftest - INFO -       xserver-nodm-init was =
skipped: Recipe xserver-nodm-init, package xserver-nodm-init: system groupn=
ame "nopasswdlogin" does not have a static ID defined. Add nopasswdlogin to=
 one of these files: /srv/pokybuild/yocto-worker/reproducible/build/build-s=
t/meta-selftest/files/static-group
2025-12-19 08:42:54,839 - oe-selftest - INFO -       NOTE: Runtime target '=
xserver-nodm-init' is unbuildable, removing...
2025-12-19 08:42:54,839 - oe-selftest - INFO -       Missing or unbuildable=
 dependency chain was: ['xserver-nodm-init']
2025-12-19 08:42:54,839 - oe-selftest - INFO -       ERROR: Nothing RPROVID=
ES 'packagegroup-core-x11-utils' (but /srv/pokybuild/yocto-worker/reproduci=
ble/build/layers/openembedded-core/meta/recipes-graphics/packagegroups/pack=
agegroup-core-x11.bb, /srv/pokybuild/yocto-worker/reproducible/build/layers=
/openembedded-core/meta/recipes-graphics/packagegroups/packagegroup-core-x1=
1-base.bb RDEPENDS on or otherwise requires it)
2025-12-19 08:42:54,840 - oe-selftest - INFO -       No eligible RPROVIDERs=
 exist for 'packagegroup-core-x11-utils'
2025-12-19 08:42:54,840 - oe-selftest - INFO -       NOTE: Runtime target '=
packagegroup-core-x11-utils' is unbuildable, removing...
2025-12-19 08:42:54,840 - oe-selftest - INFO -       Missing or unbuildable=
 dependency chain was: ['packagegroup-core-x11-utils']
2025-12-19 08:42:54,840 - oe-selftest - INFO -       NOTE: Runtime target '=
packagegroup-core-x11-base' is unbuildable, removing...
2025-12-19 08:42:54,840 - oe-selftest - INFO -       Missing or unbuildable=
 dependency chain was: ['packagegroup-core-x11-base', 'packagegroup-core-x1=
1-utils']
2025-12-19 08:42:54,840 - oe-selftest - INFO -       NOTE: Runtime target '=
core-image-sato' is unbuildable, removing...
2025-12-19 08:42:54,840 - oe-selftest - INFO -       Missing or unbuildable=
 dependency chain was: ['core-image-sato', 'packagegroup-core-x11-base', 'p=
ackagegroup-core-x11-utils']
2025-12-19 08:42:54,840 - oe-selftest - INFO -       ERROR: Nothing RPROVID=
ES 'packagegroup-core-x11' (but /srv/pokybuild/yocto-worker/reproducible/bu=
ild/layers/openembedded-core/meta/recipes-graphics/packagegroups/packagegro=
up-core-x11.bb RDEPENDS on or otherwise requires it)
2025-12-19 08:42:54,840 - oe-selftest - INFO -       No eligible RPROVIDERs=
 exist for 'packagegroup-core-x11'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3049

The second one is again on xorg.XorgTest.test_xorg_running:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qa-extras2/build/layers/openembedded-co=
re/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qa-extras2/build/layers/openembedded-co=
re/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qa-extras2/build/layers/openembedded-co=
re/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qa-extras2/build/layers/openembedded-co=
re/meta/lib/oeqa/runtime/cases/xorg.py", line 31, in test_xorg_running
    self.assertEqual(status, 0, msg=3Dmsg)
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^
AssertionError: 1 !=3D 0 : Xorg does not appear to be running   PID USER   =
    VSZ STAT COMMAND
...
RESULTS - xorg.XorgTest.test_xorg_running: FAILED (1.30s)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/2862

I had a look at the corresponding QEMU boot log, but there is no
error in there.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


