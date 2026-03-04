Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BE9EFCE33
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:52:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24692.1772646769100875395
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:52:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fPHSQwg1;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E0EF2C143E5;
	Wed,  4 Mar 2026 17:53:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A6365FF5C;
	Wed,  4 Mar 2026 17:52:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2641E103694F8;
	Wed,  4 Mar 2026 18:52:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772646765; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ox0N5Kul642/xi6LwaAX43JE7U2d6gbEMicUBaYsrvw=;
	b=fPHSQwg12TkkKlrbhwB/Qfe8QeMRMYYFLgLgleyTZdDi8fiv+VtyKGdSv+erQwXbFUC9M+
	Lz7eu5dPdr/PxdIHCujifdoJS8jGbEIxElOHtERg9FbFC245rmzmilkRK/ZK1wRIuA46At
	lML4SYx3oowLUbNHeVJBBrb40EKVrytTJLJGwbXhD1hsn8k4OSlQMIV6K0rO3BKGGgO5DN
	AUNSHqSsJF96cd0xRaUhyonQmtLtRtsJ7vKmHx3JEQmcfrD4hdUZ2P9qx+b+2T730QQQ74
	NzdcHSeK//ybr/VKC1QDI+T1rPuk6iTWBu6vvbfnLFfNshedz+TbIH0Mj9XLgg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 18:52:42 +0100
Message-Id: <DGU6U0PB5R0J.2FMV5TJUWPZJV@bootlin.com>
Subject: Re: [OE-core] [PATCH v7 1/7] package_rpm.bbclass: Drop external
 dependency generator to support rpm 6
Cc: <alex.kanavin@gmail.com>, "Ross Burton" <ross.burton@arm.com>,
 <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <liezhi.yang@windriver.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <cover.1772367692.git.liezhi.yang@windriver.com>
 <8e2bf6e0befe331a0f834687317a3dcd2d735b92.1772367692.git.liezhi.yang@windriver.com> <2bbd3ebdc7f525fc5fdb5848ec6d80c70dbb9e22.camel@linuxfoundation.org> <86d3c351-16e9-44bd-8b38-b8c6ed75aa0a@windriver.com> <e4bed048-61eb-425a-a3bf-a3906145938d@windriver.com>
In-Reply-To: <e4bed048-61eb-425a-a3bf-a3906145938d@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:52:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232431

On Tue Mar 3, 2026 at 1:01 PM CET, Robert Yang via lists.openembedded.org w=
rote:
> I've updated it in the pull (patch 7). @Mathieu, would you please help to
> re-test it if RP has no objections on the external generator?
>
>    https://github.com/robertlinux/yocto rbt/rpm
>    https://github.com/robertlinux/yocto/tree/rbt/rpm
>
> for you to fetch changes up to f8fa3090196bae3e12ad76f12f101722d84ca20a:
>
>    rpm: 4.20.1 -> 6.0.1 (2026-03-03 11:29:07 +0000)
>
> ----------------------------------------------------------------
>
> Robert Yang (7):
>    package_rpm.bbclass: Drop external dependency generator to support rpm
>      6
>    package_rpm.bbclass: Define _lib and _libdir for rpmbuild
>    lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or
>      musl
>    glib/python3/acl: Add pkgconfig to RDEPENDS
>    lib/oe/package.py: Don't redirect stderr
>    target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
>    rpm: 4.20.1 -> 6.0.1
>
> // Robert

Hi Robert,

I did pick these commits.

We have some different errors now.

ERROR: core-image-sato-1.0-r0 do_rootfs: Could not invoke dnf. Command '/sr=
v/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/qemux86_64-poky-li=
nux/core-image-sato/1.0/recipe-sysroot-native/usr/bin/dnf -v --rpmverbosity=
=3Dinfo -y -c /srv/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/q=
emux86_64-poky-linux/core-image-sato/1.0/rootfs/etc/dnf/dnf.conf --setopt=
=3Dreposdir=3D/srv/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/q=
emux86_64-poky-linux/core-image-sato/1.0/rootfs/etc/yum.repos.d --installro=
ot=3D/srv/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/qemux86_64=
-poky-linux/core-image-sato/1.0/rootfs --setopt=3Dlogdir=3D/srv/pokybuild/y=
octo-worker/qa-extras2/build/build/tmp/work/qemux86_64-poky-linux/core-imag=
e-sato/1.0/temp --repofrompath=3Doe-repo,/srv/pokybuild/yocto-worker/qa-ext=
ras2/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/oe-root=
fs-repo --nogpgcheck install dnf packagegroup-base-extended packagegroup-co=
re-boot packagegroup-core-ssh-dropbear packagegroup-core-x11-base packagegr=
oup-core-x11-sato psplash rpm run-postinsts locale-base-c locale-base-en-us=
 locale-base-en-gb' returned 1:
...
++ tr -d '[:space:]'
/var/tmp/rpm-tmp.U4iaJX: line 98: tr: command not found
+ test x '!=3D' x
++ echo --system --home /var/lib/dbus --no-create-home --shell /bin/false -=
-user-group messagebus
++ tr -d '[:space:]'
/var/tmp/rpm-tmp.U4iaJX: line 114: tr: command not found
+ test x '!=3D' x
++ echo
++ tr -d '[:space:]'
/var/tmp/rpm-tmp.U4iaJX: line 130: tr: command not found
...

  Installing       : dbus-common-1.16.2-r0.x86_64_v3                    682=
/790Error: Cannot open file /srv/pokybuild/yocto-worker/qa-extras2/build/bu=
ild/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/oe-rootfs-repo/rpm/x=
86_64_v3/dbus-1-1.16.2-r0.x86_64_v3.rpm: [Errno 2] No such file or director=
y: '/srv/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/qemux86_64-=
poky-linux/core-image-sato/1.0/oe-rootfs-repo/rpm/x86_64_v3/dbus-1-1.16.2-r=
0.x86_64_v3.rpm'
TypeError: 'NoneType' object cannot be interpreted as an integer
FATAL ERROR: python callback ??? failed, aborting!

https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/3271
https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/3276

I'm a bit surprise by tr errors here, as it looks a bit unrelated. There
is a small probability it's related to something else in my branch, but
this series is clearly the best candidate. I will keep you updated if it
finally looks related to something else.

I also got some more traditional "nothing provides" errors:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/78/builds/3317
https://autobuilder.yoctoproject.org/valkyrie/#/builders/8/builds/3321

Can you have a look at these?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


