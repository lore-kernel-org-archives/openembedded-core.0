Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBEF5FED2E1
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 07:43:26 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16279.1773301403972982385
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 00:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fRvjoUK9;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6C18BC4159A
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 07:43:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD3F55FDEB;
	Thu, 12 Mar 2026 07:43:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 885281036865B;
	Thu, 12 Mar 2026 08:43:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773301401; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dlnpEdc9vUX8ER7aHD+BHbYG/IHHdhOr+VWk1upwzkk=;
	b=fRvjoUK9z75JqZUItTOb0Z5yVKhJ095fFBrpQmeeygqgEhch7310KVj7Zz9HBnnMaFKkvF
	GncNcsFDTgNc36y8Ucg9rL2DzFTdYCm1do4geHSRsD4DQu9WXqOc2o+sqQ5yujq+51AUK3
	JrU7PYWFOWMidFaumF2ytweyowzgc8nr7BSV8Q6HPXlY4Cmp7MvkrUoX1J/JBLau0yEYvV
	rZDabC6O0lZ6SplsBo/+Mw9T0qQEF2gJK5rLF2WTgED7fujdmcA9JmpLRf6rMcEWkTfNaO
	CgyTNUpgqMuXb2L0rXchhQEfjf3+k3OzWrN6usX/pdGD/rz+XLGkbeBwy0Wubw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 08:43:18 +0100
Message-Id: <DH0MVS45J75E.3OIX034VEUGS9@bootlin.com>
To: <viswanath.kraleti@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][meta][PATCH v2] uki.bbclass: make DTB packaging
 optional
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260311122507.2121997-1-viswanath.kraleti@oss.qualcomm.com>
In-Reply-To: <20260311122507.2121997-1-viswanath.kraleti@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 07:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232923

On Wed Mar 11, 2026 at 1:25 PM CET, Viswanath Kraleti via lists.openembedde=
d.org wrote:
> According to the Unified Kernel Image (UKI) specification [1], including
> a compiled device tree in the .dtb section of a UKI is optional. However,
> the current implementation always packages device trees listed in
> KERNEL_DEVICETREE into the UKI by default. This makes uki.bbclass
> unsuitable for systems that rely on firmware-provided DTBs and do not
> want a DTB embedded in the UKI.
>
> Fix this by introducing a new UKI_DEVICETREE variable to control device
> tree packaging. The .dtb section is now populated from UKI_DEVICETREE
> instead of KERNEL_DEVICETREE. Users who do not want DTBs included in the
> UKI can override UKI_DEVICETREE to an empty value from their recipes.
>
> Update the UKI selftests accordingly, as QEMU does not provide a device
> tree to embed.
>
> [1] https://uapi-group.org/specifications/specs/unified_kernel_image/
>
> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> ---

Hi Viswanath,

Thanks for the new version.

It looks like one of the selftest is still failing:

2026-03-11 20:52:20,986 - oe-selftest - INFO - wic.Wic2.test_efi_plugin_uni=
fied_kernel_image_qemu (subunit.RemotedTestCase)
2026-03-11 20:52:20,987 - oe-selftest - INFO -  ... FAIL
...
2026-03-11 20:52:20,987 - oe-selftest - INFO - 13: 48/73 559/681 (145.46s) =
(0 failed) (wic.Wic2.test_efi_plugin_unified_kernel_image_qemu)
2026-03-11 20:52:20,987 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/wic.py", line 1561, in test_efi_plu=
gin_unified_kernel_image_qemu
    bitbake('core-image-base ovmf')
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/utils/commands.py", line 236, in bitbake
    return runCmd(cmd, ignore_status, timeout, output_log=3Doutput_log, **o=
ptions)
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command 'bitbake  core-image-base ovmf' returned non-zero e=
xit status 1:
...
ERROR: core-image-base-1.0-r0 do_uki: ERROR: cannot find /srv/pokybuild/yoc=
to-worker/oe-selftest-debian/build/build-st-4172893/tmp/deploy/images/qemux=
86-64/${KERNEL_DEVICETREE}.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3383
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3273

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


