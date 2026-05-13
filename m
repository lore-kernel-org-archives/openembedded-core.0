Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B96CD4F21
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 05:33:23 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.981.1778650394834741024
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 22:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=krzPJGaT;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 999C4C5E175;
	Wed, 13 May 2026 05:34:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 26B7F606CE;
	Wed, 13 May 2026 05:33:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6BC6B11AF8D79;
	Wed, 13 May 2026 07:33:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778650391; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xgmQHgXf92ABBWHd3KV1Z0Q9hBDDp+FGilCO0pFK3jo=;
	b=krzPJGaTd9kKh2TTtGq2r26tZgcBYQ+2+gNXDvTK3iBqW/Lp/0NAiKBXJ32mvXqgM1gbK7
	VPJOSR1baYVgoIntrFkYvdQvegCNEZaWuw4Inf5XOgJWyhppV6AMzMAldq39weeec0KirC
	4mg9adp0NsrQX3AntQEKxHGjtn7l5U5x3eAvJIvbChwwL4WCm6A0FwhmhH2POY+LOQ9EXP
	GL6bhCrWqEb4eOVoDz37NSwLxeXPgCOsi12dCWjC8Vr11S9xnt6WqikSli5Vu0L7YBw7A9
	GNKVTB7LLsdirHHBjk9zxU4R4KVwh7xNVj5d05meXChvMFLu1PQb2COt40Qt7w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 May 2026 07:33:09 +0200
Message-Id: <DIHAXWVL9CB6.2DT385U5BQUR8@bootlin.com>
Cc: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v3] libffi: add ptest support
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260508102405.16791-1-pratik.farkase@est.tech>
 <20260508113653.21478-1-pratik.farkase@est.tech>
 <DIFMGYW1190K.3MKM3KN0DWQMB@bootlin.com>
 <GV2P189MB3005B33FD42B8B07EF9ECC76FE382@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM> <DIFUGDKJKE7Y.SDTF3FXFC43W@bootlin.com> <GV2P189MB3005EFC4E16B3BD9CA42F3C6FE392@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM> <DIGSPNC40V0B.325NZ64GRFWZL@bootlin.com>
In-Reply-To: <DIGSPNC40V0B.325NZ64GRFWZL@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 05:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236928

On Tue May 12, 2026 at 5:16 PM CEST, Mathieu Dubois-Briand wrote:
> On Tue May 12, 2026 at 10:30 AM CEST, Pratik Farkase wrote:
>> Hi Mathieu,
>>
>> I tested v3 on qemux86-64 against current master and was unable to
>> reproduce the glib-2.0 locale or multilib symlinks failures.
>>
>> Could you share the steps or configuration you used to reproduce the
>> these two issues? That would help me investigate further.
>>
>> Best Regards,
>> Pratik
>>
>
> Hi Pratik,
>
> Regarding the multilib one, I just managed to reproduce it locally:
>
> Using tag oecore/autobuilder.yoctoproject.org/valkyrie/a-full-3808 from
> poky-ci-archive git:
> https://git.yoctoproject.org/poky-ci-archive/tag/?h=3Doecore/autobuilder.=
yoctoproject.org/valkyrie/a-full-3808
>
> Default local.conf template, with these lines added:
> PACKAGE_CLASSES =3D "package_rpm package_deb package_ipk"
> OE_FRAGMENTS +=3D 'core/yocto-autobuilder/multilib-x86-lib64'
> SANITY_TESTED_DISTROS =3D ''
> OEQA_TESTDISPLAY =3D ':1'
> OE_FRAGMENTS +=3D 'core/yocto-autobuilder/autobuilder core/yocto-autobuil=
der/autobuilder-resource-constraints'
> EXTRA_IMAGE_FEATURES ?=3D 'allow-empty-password empty-root-password allow=
-root-login'
> OE_FRAGMENTS +=3D 'machine/qemux86 distro/poky'
>
> Then:
> bitbake lib64-core-image-sato-sdk
> ...
> ERROR: lib64-core-image-sato-sdk-1.0-r0 do_rootfs: Could not invoke dnf. =
Command '...' returned 1:
> ...
> Running transaction check
> Transaction check succeeded.
> Running transaction test
> Error: Transaction test error:
>   file /usr/bin/g++ conflicts between attempted installs of lib64-g++-sym=
links-15.2.0-r0.x86_64 and g++-symlinks-15.2.0-r0.core2_32
>   file /usr/bin/cpp conflicts between attempted installs of cpp-symlinks-=
15.2.0-r0.core2_32 and lib64-cpp-symlinks-15.2.0-r0.x86_64
>   file /usr/bin/gcc conflicts between attempted installs of lib64-gcc-sym=
links-15.2.0-r0.x86_64 and gcc-symlinks-15.2.0-r0.core2_32
>
> I will try to reproduce the selftest failures.
>

I don't have the selftest issue locally. We can assume it is some sstate
pollution for now, we will go back to it later if it happens again.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


