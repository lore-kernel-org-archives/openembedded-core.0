Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE85CD4851
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 15:16:14 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78347.1778598967085124619
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 08:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1Wkcnv1c;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C1B5D4E42C83;
	Tue, 12 May 2026 15:16:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 83C3560646;
	Tue, 12 May 2026 15:16:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6D3C11AF88D0;
	Tue, 12 May 2026 17:16:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778598964; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kOSLmm/qoTRSbJox/sN+yTXj2eWWkhT8Pmi5ba534Ao=;
	b=1Wkcnv1cs3b/2pmYbp3CPEeNFcSuu3h3bv07TbUfeGmwM5Xopo3pw8B1USmovr614BAdYP
	WrRfye7BGSIwmVY0t7P+dMtp91oobKxApVyno/mdLUIXSSlP58yuTkc8mMLlDWo1SdsKK/
	3+M/BzGLGzSQRkdUG/gA1aTwZjVwGNIbtcbiYrd4GH/UxMNhX+iMXelwNt31FSGxVybbJ+
	vTWQfXhf0GqlNE8TaCVr/CBF5QUXQyauEDBjp2z+otoYVcnSRi4IFcfGMrCf1tPQ7ju1w3
	wNU7f6NL/wjTg4+HmYCxiKSyjGA4eN0jwSs1sIvrAE7dvqXHHkfH2CFRPMcjfQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 17:16:02 +0200
Message-Id: <DIGSPNC40V0B.325NZ64GRFWZL@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v3] libffi: add ptest support
Cc: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260508102405.16791-1-pratik.farkase@est.tech>
 <20260508113653.21478-1-pratik.farkase@est.tech>
 <DIFMGYW1190K.3MKM3KN0DWQMB@bootlin.com>
 <GV2P189MB3005B33FD42B8B07EF9ECC76FE382@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM> <DIFUGDKJKE7Y.SDTF3FXFC43W@bootlin.com> <GV2P189MB3005EFC4E16B3BD9CA42F3C6FE392@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <GV2P189MB3005EFC4E16B3BD9CA42F3C6FE392@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 15:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236889

On Tue May 12, 2026 at 10:30 AM CEST, Pratik Farkase wrote:
> Hi Mathieu,
>
> I tested v3 on qemux86-64 against current master and was unable to
> reproduce the glib-2.0 locale or multilib symlinks failures.
>
> Could you share the steps or configuration you used to reproduce the
> these two issues? That would help me investigate further.
>
> Best Regards,
> Pratik
>

Hi Pratik,

Regarding the multilib one, I just managed to reproduce it locally:

Using tag oecore/autobuilder.yoctoproject.org/valkyrie/a-full-3808 from
poky-ci-archive git:
https://git.yoctoproject.org/poky-ci-archive/tag/?h=3Doecore/autobuilder.yo=
ctoproject.org/valkyrie/a-full-3808

Default local.conf template, with these lines added:
PACKAGE_CLASSES =3D "package_rpm package_deb package_ipk"
OE_FRAGMENTS +=3D 'core/yocto-autobuilder/multilib-x86-lib64'
SANITY_TESTED_DISTROS =3D ''
OEQA_TESTDISPLAY =3D ':1'
OE_FRAGMENTS +=3D 'core/yocto-autobuilder/autobuilder core/yocto-autobuilde=
r/autobuilder-resource-constraints'
EXTRA_IMAGE_FEATURES ?=3D 'allow-empty-password empty-root-password allow-r=
oot-login'
OE_FRAGMENTS +=3D 'machine/qemux86 distro/poky'

Then:
bitbake lib64-core-image-sato-sdk
...
ERROR: lib64-core-image-sato-sdk-1.0-r0 do_rootfs: Could not invoke dnf. Co=
mmand '...' returned 1:
...
Running transaction check
Transaction check succeeded.
Running transaction test
Error: Transaction test error:
  file /usr/bin/g++ conflicts between attempted installs of lib64-g++-symli=
nks-15.2.0-r0.x86_64 and g++-symlinks-15.2.0-r0.core2_32
  file /usr/bin/cpp conflicts between attempted installs of cpp-symlinks-15=
.2.0-r0.core2_32 and lib64-cpp-symlinks-15.2.0-r0.x86_64
  file /usr/bin/gcc conflicts between attempted installs of lib64-gcc-symli=
nks-15.2.0-r0.x86_64 and gcc-symlinks-15.2.0-r0.core2_32

I will try to reproduce the selftest failures.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


