Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDF4107637D
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 13:54:20 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13658.1775051654870390689
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 06:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=N3UQR1s1;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AC2534E4288D
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Apr 2026 13:54:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 623F0602BF;
	Wed,  1 Apr 2026 13:54:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D7C010450A06;
	Wed,  1 Apr 2026 15:54:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775051651; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=++/JyTDRTWK726/511+N1miKJTHA0fQ9RTRxl6euuMg=;
	b=N3UQR1s1X1K8vaex3Qxq09UDUzxxEfG6it8cojKfqEcjZsZjJOl4Z2ffHIrXA5derIxFUa
	2zMq9eOf3T1e948lVk2I34CXBEwoMCePTlVL/GQiGFkreHwRDVOXVmdUIBuq7hn/qEshwX
	1FkEHqcVWSsb9yPhPWxgIJgW0Lgi75uEdk/FDblQIn+S3r8zg3tuhNbG7OMF1HeAzwJfyY
	aU5CUt5tI5TEpE53/qpAXYSiZQ6CLz/bManUnob7rja+b1aZ8yc89CCoM13p1wB4ny1eSR
	9pdM6ngcgoBOqdneQGqIO/xTlJecQ5gW5ICPjg43uFKdrGMn9Ls+FEKBHneThQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 15:54:10 +0200
Message-Id: <DHHVAMTM0ULQ.3QO0VGCFBKNL4@bootlin.com>
Subject: Re: [OE-core] [PATCH v7 5/6] dnf: Upgrade to 5.4.0.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adam.duskett@amarulasolutions.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260330095849.119621-1-adam.duskett@amarulasolutions.com>
 <20260330095849.119621-5-adam.duskett@amarulasolutions.com>
In-Reply-To: <20260330095849.119621-5-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 13:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234350

On Mon Mar 30, 2026 at 11:58 AM CEST, Adam Duskett via lists.openembedded.o=
rg wrote:
> Completely rewritten in C++, there are several changes needed
> to facilitate moving from DNF4 to DNF5. Below are some significant
> items to note:
>
>     - The "-v/--verbose" cli option is removed. As such, remove the argum=
ent
>     everywhere it was called.[1]
>
>     - the rpmverbosity cli option is replaced with --setopt=3Drpmverbosit=
y
>
>     - Change gpgcheck to pkg_gpgcheck as this is what the documentation
>     recommends.[2]
>
>     - --nogpgcheck is now --no-gpgchecks
>
>     - --setopt=3Dprotect_running_kernel=3DFalse has to be set or else eve=
ry dnf
>     transaction complains that /boot/vmlinuz-${kernel_version} does not
>     exist in /var/log/dnf5.log. There is an open issue on github[3] to en=
able
>     the currently not-yet implemented `autocheck_running_kernel option`, =
but
>     it has been open for quite some time and the protect_running_kernel
>     option supresses the message.
>
>     - Move --skip-broken to after the install argument as the global
>       --skip-broken argument is removed.
>
>     - /var/cache/dnf is replaced with /var/cache/libdnf5
>
>     - Add `features +=3D 'PACKAGECONFIG:append:pn-rpm =3D " sequoia"\n'`
>           `features +=3D 'PACKAGECONFIG:append:pn-librepo =3D " sequoia"\=
n'`
>       to test_testimage_dnf as librepo currently does not work
>       with gpgme.
>
> While DNF5 has many config options, unfortunately, the majority
> of them depends on sdbus-c++, which is not included in OE-core.
> However, the package is included in meta-openembedded, so it's
> best to include the PACKAGECONFIG options in the recipe and
> leave them off by default.
>
> 1: https://github.com/rpm-software-management/dnf5/issues/464
> 2: https://dnf5.readthedocs.io/en/latest/dnf5.conf.5.html
> 3: https://github.com/rpm-software-management/dnf5/issues/1255
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---

Hi Adam,

Thanks for the new version.

I'm sorry, but we have some selftest failures now. :(

The test_incremental_image_generation one was bisected to this commit,
but I believe other failures have a similar source.

2026-04-01 09:45:42,563 - oe-selftest - INFO - imagefeatures.ImageFeatures.=
test_mandb (subunit.RemotedTestCase)
2026-04-01 09:45:42,569 - oe-selftest - INFO -  ... FAIL
...
2026-04-01 09:46:07,826 - oe-selftest - INFO - buildoptions.ImageOptionsTes=
ts.test_incremental_image_generation (subunit.RemotedTestCase)
2026-04-01 09:46:07,827 - oe-selftest - INFO -  ... FAIL
...
2026-04-01 10:00:20,138 - oe-selftest - INFO - oelib.utils.TestDefaultFeatu=
res.test_filter_default_features (subunit.RemotedTestCase)
2026-04-01 10:00:20,139 - oe-selftest - INFO -  ... FAIL
...
2026-04-01 10:04:17,834 - oe-selftest - INFO - runtime_test.Postinst.test_f=
ailing_postinst (subunit.RemotedTestCase)
2026-04-01 10:04:17,834 - oe-selftest - INFO -  ... FAIL
...
2026-04-01 10:30:17,066 - oe-selftest - INFO - runtime_test.TestImage.test_=
testimage_install (subunit.RemotedTestCase)
2026-04-01 10:30:17,066 - oe-selftest - INFO -  ... FAIL

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3456
Some other builds are still in progress but already show the same
errors:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3567
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3666

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


