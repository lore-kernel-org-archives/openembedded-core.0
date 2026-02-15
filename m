Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83499E63F09
	for <webhook@archiver.kernel.org>; Sun, 15 Feb 2026 18:03:16 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3231.1771178594527427099
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 10:03:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XvYR+NGL;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F15A34E40E04
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 18:03:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B019B606CD;
	Sun, 15 Feb 2026 18:03:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56B58102F1D19;
	Sun, 15 Feb 2026 19:03:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771178591; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HJ9rri54V/p2LCHaBfzEcutSux/QQxwpplxH/QWLWs8=;
	b=XvYR+NGLdnSwUJLThcHETEdm5cTpOIGV0WnrbbXEFsWHRR+mVLLCuNw10NQCmA+NNKNhqw
	masNTED/LZrKlGvZANXkG+D9zfF2ApjRGgAJo+K2CS3ulYw9D6wzF/1nI1Ji4WIFv/6iev
	tSC4WxyYczx2YEyD5hbB377642aJ435A1dpXJHq9N/Ogw0htEvM0gPLD/Rn0mWftuw42q4
	WBVbq095PaXZ00ONvuX0qfPshZkxKc2/l6k+Tvhwoa6ybuxD2fhGTSLC1cXABCeQdPEspp
	XdaA0o6Zd25uuibULqomn2qIpmTxjTPE7QRg2n/CVyzsmXBGBO5TG088VEzmSg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 19:03:09 +0100
Message-Id: <DGFQER9GYWDA.3RGOGX1RCZDP8@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <colinmca242@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 0/4] Disable OpenSSL and
 Python3-cryptography legacy features by default
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260211184917.1045939-1-colinmca242@gmail.com>
 <20260213230130.757732-1-colinmca242@gmail.com>
 <DGFOPZGGFAZ6.ARG5LGAT1PG1@bootlin.com>
In-Reply-To: <DGFOPZGGFAZ6.ARG5LGAT1PG1@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 18:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231168

On Sun Feb 15, 2026 at 5:43 PM CET, Mathieu Dubois-Briand wrote:
> On Sat Feb 14, 2026 at 12:01 AM CET, Colin McAllister via lists.openembed=
ded.org wrote:
>> TLS 1.0 and 1.1 have been deprecated by the IETF since 2021, and
>> OpenSSL's legacy module contains deprecated and unmaintained components.
>> This series disables legacy support by default in both OpenSSL and
>> python3-cryptography, requiring users to explicitly opt-in if needed.
>>
>> The first two patches add packageconfig options to control legacy TLS
>> protocol support and the legacy OpenSSL module. The final patch aligns
>> python3-cryptography with the new OpenSSL defaults.
>>
>> Note that the TLS 1.0/1.1 changes replace the existing "no-tls1" and
>> "no-tls1_1" packageconfig options with affirmative "tls1" and "tls1_1"
>> options that are disabled by default. While less disruptive to enable
>> the "no-*" options by default, using affirmative options provides
>> consistency with the new "legacy" option and is clearer than having
>> default-enabled "no-*" options.
>>
>
> Hi Colin,
>
> Thanks for the new version.
>
> I believe we have a new error:
>
> ERROR: core-image-sato-1.0-r0 do_rootfs: Could not invoke dnf. Command '/=
srv/pokybuild/yocto-worker/multilib/build/build/tmp/work/qemux86_64-poky-li=
nux/core-image-sato/1.0/recipe-sysroot-native/usr/bin/dnf -v --rpmverbosity=
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
> ...
> Error: Transaction test error:
>   file /etc/ssl/openssl.cnf conflicts between attempted installs of lib32=
-openssl-conf-3.5.5-r0.x86 and openssl-conf-3.5.5-r0.x86_64_v3
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/3170
>
> Can you have a look at the issue?
>
> Thanks,
> Mathieu

My bad, the issue probably comes from another patch. This series is
probably good.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


