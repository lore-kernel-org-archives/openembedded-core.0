Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE9CC61DD5
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 08:28:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16536.1771662499454617018
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Feb 2026 00:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QApJsOVy;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5E8CE1A0D57
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 08:28:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 261915FB54;
	Sat, 21 Feb 2026 08:28:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91E3F10368C40;
	Sat, 21 Feb 2026 09:28:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771662496; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1Qe9GlIzzZnWmbEXdMJuqbaIcju3gwt0RVC1+p665Ng=;
	b=QApJsOVysPGgfCdzEc8rjQXPdS0MdjcRNEXGo5Tv91Jdd5A7ao+693w0rkSiQjq3EvcKaN
	DkYbktdjg3y2hAzQuowjH+otiQKQgHkhRXPBf10Ra8vYIYy+zYpxTbz9EdVL6Wu0b6EZzA
	hgEFd2Xh0Ma/G43oak43g3LjzC1t1efHXBn5Kt7Xf4chkmXLTWOVGeY1njAvc1PMm/QQNY
	utlGxjVLdbufGDmBy39Wsjrf28XKaSS46T9eN9IBS4SB5fIiVF0A+n+dufjFKpwsVaCFiI
	COB45aEItDuFwkWKwyV6BI6T83Dfl3XvjvBj6yrfRdTQE3KMcfTUmvdHu9UYJA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Feb 2026 09:28:14 +0100
Message-Id: <DGKHXU4JG1IL.1D7QRFJ1Q8BDW@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <viswanath.kraleti@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][meta][PATCH] uki.bbclass: make DTB packaging optional
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260219172220.3848330-1-viswanath.kraleti@oss.qualcomm.com>
In-Reply-To: <20260219172220.3848330-1-viswanath.kraleti@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 08:28:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231606

On Thu Feb 19, 2026 at 6:22 PM CET, Viswanath Kraleti via lists.openembedde=
d.org wrote:
> According to the Unified Kernel Image (UKI) specification [1], including
> a compiled device tree in the .dtb section of a UKI is optional. However,
> the current implementation always packages device trees listed in
> KERNEL_DEVICETREE into the UKI by default. This makes uki.bbclass
> unsuitable for systems that rely on firmware-provided DTBs and do not
> want a DTB embedded in the UKI.
>
> Fix this by introducing a new UKI_DEVICETREE variable to control device
> tree packaging. The dtb section is now populated from UKI_DEVICETREE
> instead of KERNEL_DEVICETREE. Users who do not want DTBs included in the
> UKI can override UKI_DEVICETREE to an empty value from their recipes.
>
> [1] https://uapi-group.org/specifications/specs/unified_kernel_image/
>
> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> ---

Hi Viswanath,

Thanks for your patch.

It looks like some selftests are failing:

2026-02-20 20:52:59,350 - oe-selftest - INFO - uki.UkiTest.test_uki_boot_sy=
stemd (subunit.RemotedTestCase)
2026-02-20 20:52:59,351 - oe-selftest - INFO -  ... FAIL
...
2026-02-20 20:45:12,725 - oe-selftest - INFO - Starting client DEBUGINFOD_U=
RLS=3Dhttp://192.168.7.1:56253/ debuginfod-find debuginfo /usr/bin/xz
[Fri Feb 20 20:45:12 2026] (3985778/3985789): 192.168.7.2:38846 UA:elfutils=
/0.194,Linux/x86_64,/ XFF: GET /buildid/672c74f9d1ea2e63d71dfb2d5c9a2e253ee=
550f5/debuginfo 200 258784 0+10ms
ERROR: When reparsing /tmp/selftest-fetchbs937nwy/test.bb:do_checkuri, the =
basehash value changed from 84b9e23a83a764e7a5d8a96ee523199e2b1c604f4280a45=
030e248de0ff52962 to 4123da244f465feffecb2b4fd2b132b64851981ec2fb70bf9445df=
8b0ea6a69e. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake test -cdo_checkuri -Snone
ERROR: Then:
ERROR: $ bitbake test -cdo_checkuri -Sprintdiff
...
2026-02-20 21:24:55,987 - oe-selftest - INFO - wic.Wic2.test_efi_plugin_uni=
fied_kernel_image_qemu (subunit.RemotedTestCase)
2026-02-20 21:24:55,988 - oe-selftest - INFO -  ... FAIL
...
2026-02-20 20:52:59,350 - oe-selftest - INFO - uki.UkiTest.test_uki_boot_sy=
stemd (subunit.RemotedTestCase)
2026-02-20 20:52:59,351 - oe-selftest - INFO -  ... FAIL

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


