Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECD5CDB47F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 06:22:04 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5568.1782368517122510786
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 23:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tRdCh2o6;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 034B44E4088F
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 06:21:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BE0C960220;
	Thu, 25 Jun 2026 06:21:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 38C0D106C841A;
	Thu, 25 Jun 2026 08:21:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782368514; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d3TELNt4RXmy+Tm3KiM7v0EhkeoW1sBQU/PFOIIo/bM=;
	b=tRdCh2o6Hnt+9FHw166v17cbz2leQtCWh6KsJNvXzf8XSen3I9kK65fUphOK/MSvRP9EHe
	F0mv3Kz6rN7DwaQA3OoEZ2ogPh8VgfikAGvE9Y3TchNODwFYaa5w6LSaJT6VxKcjqJ6+06
	asaeBmmaY+QyAwF0B6t2pUsZW2YXel5pr4VnchTJF4bIuSkL1EnU/8TT4wv6kg5U9o1MM2
	i4ktuiJTZkot8EPhl/0LNAVCfsD7quYhnMsufvqWWW5lsSi+6Bb8Ar7uAB1dFP/7pWNuDX
	gJw7mqgbFOw3CFaQsYbo/9C4GiBDbtd87bcYhRgZ26py3Y1Nkg1JVg5L1MoTvg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Jun 2026 08:21:51 +0200
Message-Id: <DJHWWM8TMS7K.379LIVIK78742@bootlin.com>
Subject: Re: [OE-core][PATCH v3 0/8] Implement SPDX for deploy tasks
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <JPEWhacker@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260618165032.347436-1-JPEWhacker@gmail.com>
 <20260624141706.2164567-1-JPEWhacker@gmail.com>
In-Reply-To: <20260624141706.2164567-1-JPEWhacker@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 06:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239543

On Wed Jun 24, 2026 at 4:15 PM CEST, Joshua Watt via lists.openembedded.org=
 wrote:
> The SPDX use case for file system image has been well defined since SPDX
> was first implemented, however there has always been a desire to also
> express SPDX output for other non-image deliverables (primarily, those
> that have a do_deploy task or similar). These types of tasks cannot
> easily use the traditional method of having a separate SPDX task that
> runs to create their SPDX output as this causes lots of problems with
> the way dependencies are specified. Instead, it is desirable for these
> tasks to directly produce SPDX output that can be consumed by other
> tasks that depend on them.
>
> This patch series adds support for this. Any sstate task that starts
> with "do_deploy" can now be added to the SPDX_DEPLOY_TASKS list and it
> will run a postfunc to generate SPDX output that describes what is being
> deployed. For classical do_deploy tasks, this is setup to be easy by
> automatically capturing all the deployed output files in the SPDX data,
> but other tasks can be added as well.
>
> Finally, the do_create_image_spdx task is removed and replaced with a
> SPDX deploy postfunc using this new system. This means that any task
> that depends on do_image_complete will automatically also get the SPDX
> output for the image, simplifying the dependency handling.
>
> V2: Fixed SPDX documents missing at SBoM creation time when the
> documents were not a direct dependency of the SBoM, and were present in
> a sstate object. Previously, these sstate objects were not restored
> because they were "covered" by the later sstate tasks, but now they are
> restored if they are depended on by a task that creates SPDX output.
>
> V3: Fixed a bug where dependencies that are not in the taskhash could be
> missing when the final SBoM is created and added tests.
>

Hi Joshua,

Thanks for the new version.

We still have a failing selftest here:
2026-06-24 19:12:57,622 - oe-selftest - INFO - sstatetests.SStateHashSameSi=
gs3.test_sstate_sametune_samesigs (subunit.RemotedTestCase)
2026-06-24 19:12:57,624 - oe-selftest - INFO -  ... FAIL
...
2026-06-24 19:12:57,624 - oe-selftest - INFO - 4: 25/26 507/695 (312.34s) (=
0 failed) (sstatetests.SStateHashSameSigs3.test_sstate_sametune_samesigs)
2026-06-24 19:12:57,624 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/sstatetests.py", line 539, in test=
_sstate_sametune_samesigs
    self.assertCountEqual(files1, files2)
  File "/usr/lib/python3.12/unittest/case.py", line 1216, in assertCountEqu=
al
    self.fail(msg)
  File "/usr/lib/python3.12/unittest/case.py", line 715, in fail
    raise self.failureException(msg)
AssertionError: Element counts were not equal:
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-armhos=
t/build/build-st-719621/tmp-sstatesamehash/stamps/core2-32-poky-linux/wic-t=
ools/1.0.do_create_spdx.sigdata.85e2be6fe9ccda65abb33aacd4f946a084919518fc0=
ffc44e3e5698d1c2a98c7'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-armhos=
t/build/build-st-719621/tmp-sstatesamehash/stamps/core2-32-poky-linux/wic-t=
ools/1.0.do_compile.sigdata.fca66a6aef4d6bda698a57e8297346d610e2b3841dce7f1=
585dc33bc80d0592e'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-armhos=
t/build/build-st-719621/tmp-sstatesamehash/stamps/core2-32-poky-linux/wic-t=
ools/1.0.do_prepare_recipe_sysroot.sigdata.377ccf122b60bb2eff57f9c1dbbda056=
b8d3c687ab594cf2db80c3970706c170'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-armhos=
t/build/build-st-719621/tmp-sstatesamehash/stamps/core2-32-poky-linux/wic-t=
ools/1.0.do_configure.sigdata.2969439d8a538b9adc3ebf73eb457cce106dbbb1062cc=
66e9a64cf5a221306dc'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-armhos=
t/build/build-st-719621/tmp-sstatesamehash/stamps/core2-32-poky-linux/wic-t=
ools/1.0.do_populate_sysroot.sigdata.e8973cc6f00edf67eb1adebfdaa8487edaf137=
f61b7eec220911b7a1b9afb83c'
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4199
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4140
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3969

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


