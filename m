Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A026E85381
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 16:47:53 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.89.1775234867254675070
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 09:47:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=icl7WyTi;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 25CF74E428CD
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Apr 2026 16:47:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE339603C1;
	Fri,  3 Apr 2026 16:47:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A75A410450104;
	Fri,  3 Apr 2026 18:47:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775234864; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bnhVMLvo/pUmdrmt/65pc5YUewxPpo0u0qO1/4Ar1bA=;
	b=icl7WyTiM+XxKvY8aCWanvBGwNS4l7HLqqb9welbmIRdbJbLgaZktPDOMsPpA1Na+FJo0c
	n6e3tjIcFgqiF0SXtWR2rvswpo1O0d0pq9/aAtl+pGBaPbpfeURRuQvpvf2StL7Z9WHGum
	Q5zxCxU1MJG0yLrvJ7njxiEEtdICoFaLZ06wglrDBatdYrw0eBrnGkb8jLa99+A6zw5E+E
	JiaTsbwTjE8hzg8wuuUKJ6BKOU/TCyGz5IHiiYGakOwcy7WopoLqBPvQLyLABSLN/Bnl0r
	5RmN0rOHPDhjxHrZ6b6pXJhYtw9cT7KiI8ouWFLHeSI4YwdCMOQYPeeUudigpg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 18:47:42 +0200
Message-Id: <DHJO8L8EC2Z9.1N02J4E6QUEGC@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] sanity: Require tar 1.35 or later on
 rhel9-alike distros
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260403-rhel9-tar-v1-1-b9c7fb64bbd9@pbarker.dev>
In-Reply-To: <20260403-rhel9-tar-v1-1-b9c7fb64bbd9@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 16:47:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234590

On Fri Apr 3, 2026 at 1:54 PM CEST, Paul Barker wrote:
> tar 1.34 (and possibly earlier versions) is unable to extract tarballs
> containing read-only files with xattrs. This was fixed upstream, but
> it's unlikely at this point that the fix will be backported to RHEL9
> related distros (CentOS Stream 9, AlmaLinux 9, Rocky Linux 9). The issue
> affects these distros specifically because they have selinux enabled by
> default and this uses xattrs.
>
> The specific failure we've seen is with the /usr/lib/udev/hwdb.bin file
> installed by the systemd recipe - this file is chmod 0444. This leads to
> the following error, typically during do_image_wic (shortened and split
> to make it readable):
>
>     subprocess.CalledProcessError: Command
>     'tar --xattrs --xattrs-include=3D'*' -cf - -S -C .../tmp/work/qemux86=
_64-poky-linux/core-image-minimal/1.0/rootfs -p . |
>     tar --xattrs --xattrs-include=3D'*' -xf - -C .../tmp/work/qemux86_64-=
poky-linux/core-image-minimal/1.0/tmp-wic/rootfs2'
>     returned non-zero exit status 2.
>
> That error message is likely to confuse users, and the fix is not
> obvious. So, error out if tar 1.34 or earlier is present on affected
> distros and recommend upgrading or using the buildtools tarball.
>
> Signed-off-by: Paul Barker <paul@pbarker.dev>

Hi Paul,

So now, this is failing on several workers. Aren't we using buildtools
on rocky9 / stream9?

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/3369
https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3536

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


