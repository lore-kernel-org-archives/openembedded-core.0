Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B135E63F0A
	for <webhook@archiver.kernel.org>; Sun, 15 Feb 2026 18:05:06 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3273.1771178703575283782
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 10:05:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=dv6VGEDc;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E73644E40E04;
	Sun, 15 Feb 2026 18:05:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A63A0606CD;
	Sun, 15 Feb 2026 18:05:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B088E102F1D19;
	Sun, 15 Feb 2026 19:05:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771178701; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RNv0rvRZQ7CoLyuaQJDxWwf3NNsHolew0FQAk2iVXQw=;
	b=dv6VGEDcwYWDC9ARKsR89HdXtNaGPDX4xvhvoKc/Ni8YigrrXdG76grqsBNtejMCjyWukO
	JbWrq24srLekQKNmsNHYqi/s+MpMY5e/fcCazIbRcOvqcs2YxFv5aEi1IO//Jc/nMzmd3G
	y/lvu/bjS/Se+HigrxzDRUXj7wP1nMhfEKK+dL4REGEiaS5f4SPotL0KWykIj28IHHCT2x
	Th9Hja3rxiVS1A8LYox5028nsoEYRW3udT1vfNEicxylWpzHHjBaGHPdy+Hx0T/63bC+WY
	/ajN1cxfsIwZc+1kSyJJEbRNizpxO+4CerGU7o4R7ERhFSgEU3Sj5DlNiJzjog==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 19:05:00 +0100
Message-Id: <DGFQG62D8EOU.4RH3VF6ZLBGJ@bootlin.com>
Subject: Re: [OE-core] [PATCH] openssl: add support for config snippet
 includes
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jan Luebbe" <jlu@pengutronix.de>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260213174730.1197940-1-jlu@pengutronix.de>
In-Reply-To: <20260213174730.1197940-1-jlu@pengutronix.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 18:05:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231169

On Fri Feb 13, 2026 at 6:47 PM CET, Jan Luebbe wrote:
> This allows configuration (such as enabling providers) to be done by
> adding snippet files to /usr/lib/ssl-3/openssl.cnf.d or
> /etc/ssl/openssl.cnf.d instead of modifying a copy of the full
> configuration file. As new snippets can be added from separate recipes,
> targeted changes can be done in multiple layers.
>
> For example, the pkcs11-provider can be enabled by adding a pkcs11.cnf
> containing something like:
>   [default_sect]
>   activate =3D 1
>
>   [provider_sect]
>   pkcs11 =3D pkcs11_sect
>
>   [pkcs11_sect]
>   pkcs11-module-path =3D /usr/lib/libckteec.so.0
>   pkcs11-module-quirks =3D no-operation-state no-deinit
>   pkcs11-module-encode-provider-uri-to-pem =3D true
>   activate =3D 1
>
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> ---

Hi Jan,

Thanks for your patch.

It looks like this is failing on the autobuilder:

ERROR: core-image-sato-1.0-r0 do_rootfs: Could not invoke dnf. Command '/sr=
v/pokybuild/yocto-worker/multilib/build/build/tmp/work/qemux86_64-poky-linu=
x/core-image-sato/1.0/recipe-sysroot-native/usr/bin/dnf -v --rpmverbosity=
=3Dinfo -y -c /srv/pokybuild/yocto-worker/multilib/build/build/tmp/work/qem=
ux86_64-poky-linux/core-image-sato/1.0/rootfs/etc/dnf/dnf.conf --setopt=3Dr=
eposdir=3D/srv/pokybuild/yocto-worker/multilib/build/build/tmp/work/qemux86=
_64-poky-linux/core-image-sato/1.0/rootfs/etc/yum.repos.d --installroot=3D/=
srv/pokybuild/yocto-worker/multilib/build/build/tmp/work/qemux86_64-poky-li=
nux/core-image-sato/1.0/rootfs --setopt=3Dlogdir=3D/srv/pokybuild/yocto-wor=
ker/multilib/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0=
/temp --repofrompath=3Doe-repo,/srv/pokybuild/yocto-worker/multilib/build/b=
uild/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/oe-rootfs-repo --no=
gpgcheck install dnf packagegroup-base-extended packagegroup-core-boot pack=
agegroup-core-ssh-dropbear packagegroup-core-x11-base packagegroup-core-x11=
-sato pango-module-basic-fc psplash rpm run-postinsts lib32-connman-gnome l=
ib32-pango-module-basic-fc locale-base-c locale-base-en-us locale-base-en-g=
b' returned 1:
...
Error: Transaction test error:
  file /etc/ssl/openssl.cnf conflicts between attempted installs of lib32-o=
penssl-conf-3.5.5-r0.x86 and openssl-conf-3.5.5-r0.x86_64_v3

https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/3170

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


