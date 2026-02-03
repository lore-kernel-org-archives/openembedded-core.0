Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0ACE8782F
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 13:56:36 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16910.1770126991065453941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 05:56:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VPFEwo+V;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 04576C211FF;
	Tue,  3 Feb 2026 13:56:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5BD760728;
	Tue,  3 Feb 2026 13:56:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF11E119A88EE;
	Tue,  3 Feb 2026 14:56:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770126988; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ay4MRaoIthIVw7+tSdMXLsZ15EieB27yXs7ajOaT/uU=;
	b=VPFEwo+V7nQiwUgdz1FCc4olZdOQW0e7o7Wn88OQTh1c2aNaqRzCKVknINc8nseOe1ZKyX
	hdcRZ82XHi9DFhR8JoqaV6J8nFv5pIt4Y/6wUkJu7nxN6Uq/LW3OfDjseKNuJUeI3Svu2B
	0aY6AopVAU0/mGjDQxAwKrFc/glPUlKbP0o9vyoXv0u4nGOm1X0IHt8KR85f77dlDYKXhU
	5TzVEeTRXkIrbkhR/1HG8+cdZTSI8tewqTofandQSmb9TcQoj7zWhk3RdUMVZfMRQifS3d
	xgOqeUuOnaXceNxz5AY8f5RnewHeZ0wftTlpejA8+jqpBRL3TmU45LII1DnoAA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 14:56:25 +0100
Message-Id: <DG5DNB0A90R2.3TNBMJXIFZGJT@bootlin.com>
Subject: Re: [OE-core] [RFC][PATCH v2 0/9] standalone wic
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <twoerner@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260202170800.4172778-1-twoerner@gmail.com>
In-Reply-To: <20260202170800.4172778-1-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 13:56:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230452

On Mon Feb 2, 2026 at 6:07 PM CET, Trevor Woerner via lists.openembedded.or=
g wrote:
> This series of patches explores the possibility of splitting wic out
> from oe-core into its own standalone utility. The wic utility will
> continue to fall under The Yocto Project umbrella, but will no longer
> be integrated into the project as part of oe-core. The ultimate goal is
> to make wic a completely independent tool, hosted on PyPI, with its own
> tests, development roadmap, and releases.
>
> Some benefits include:
> - relieving the oe-core maintainers from having to review, understand,
>    merge, or reject wic patches
> - allow the tool to be used outside of The Yocto Project for generating
>   Linux images
> - provide more flexibility to explore other features, libraries,
>   mechanisms, etc
>
> The initial task of splitting wic out into its own repository was
> performed with the help of AI. It was checked, and subsequent work was
> done without AI.
>
> These changes have been tested with oe-selftest as follows:
> 	$ sudo .../layers/openembedded-core/scripts/runqemu-gen-tapdevs <my nume=
ric group id> 4
> 	$ oe-selftest -v -r wic
>
> On my machine my oe-selftest results for an unmodified oe-core give:
> 	successes=3D93, skipped=3D1, failures=3D0, errors=3D1
> with these patches I get:
> 	successes=3D91, skipped=3D1, failures=3D2, errors=3D0
>
> There are 2 tests that need to be fixed, but it would be great to get
> some feedback on this work, and to see what the AB thinks of it so far.
> I have also done some adhoc testing with meta-rockchip and
> meta-raspberrypi.
>
> Should this work eventually make its way to oe-core, it would need to
> be squashed into a single commit otherwise builds will break when only
> partially applied. They have been submitted here in this RFC series
> separately to make review easier.
>

Hi Trevor,

Thanks for this series. I ran it on the autobuilder, a few issues (maybe
just a single one actually), but most tests succeed.


So first, we have the wic tests, which try to invoke the wic tools
directly. These one entirely failed because wic was not found in the
path at all:

Running '. ./init-build-env; wic create directdisk -e core-image-sato -o ${=
BUILDDIR}/tmp/deploy/wic_images/qemux86/directdisk/core-image-sato/' with o=
utput to /srv/pokybuild/yocto-worker/wic/build/build/command-1-cmds.log in =
/srv/pokybuild/yocto-worker/wic/build/build
/bin/bash: line 1: wic: command not found

https://autobuilder.yoctoproject.org/valkyrie/#/builders/15/builds/3076

So I still have to look in depth at your patches, but I suspect, as the
tool is now in a separate git, it can no longer be used just by sourcing
the environment file.

In the context of the test, this is probably not really an issue, we can
just fix it to have wic tools. But thinking about users, this might be a
bigger issue as it does change a bit the flow if they want to use wic
directly.


The second issue is similar: one of the selftests fails as the wic
command was not found:

2026-02-03 09:54:38,418 - oe-selftest - INFO - systemd_boot.Systemdboot.tes=
t_efi_systemdboot_images_can_be_built (subunit.RemotedTestCase)
2026-02-03 09:54:38,419 - oe-selftest - INFO -  ... FAIL
...
AssertionError: Command 'wic cp /srv/pokybuild/yocto-worker/oe-selftest-arm=
host/build/build-st-1720620/tmp/deploy/images/genericx86-64/core-image-mini=
mal-genericx86-64.rootfs.wic:1/EFI/BOOT/bootx64.efi /srv/pokybuild/yocto-wo=
rker/oe-selftest-armhost/build/build-st-1720620/tmp/deploy/images/genericx8=
6-64/bootx64.efi -n /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/b=
uild-st-1720620/tmp/work/core2-64-poky-linux/wic-tools/1.0/recipe-sysroot-n=
ative' returned non-zero exit status 127:
/bin/sh: 1: wic: not found

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3260
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3136
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3034


And so far, that's all. So we might have other issues masked behind
this, but overall it looks pretty good in term of tests.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


