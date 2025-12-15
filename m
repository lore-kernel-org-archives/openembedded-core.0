Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1BBD41D74
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 11:40:54 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46450.1765798851752570524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 03:40:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jFEIj014;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A63F14E41C10
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 11:40:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 623AF60664;
	Mon, 15 Dec 2025 11:40:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4076F11941ED4;
	Mon, 15 Dec 2025 12:40:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765798846; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ALIdyLr1+lFFk7a/aoqF6JGfY8UivRU2bVWtKTwJaQ8=;
	b=jFEIj014JnW5p7rpdMEOXGo45qEFQkwaE2gW8yTi1lZIFWLHiIGS9oejfPgQdJ139nDjRz
	VLki8lycDsiqKrhrZ4xFMiUqoDH0z/vFyCGCZ6bBNYmRFkJO1DfZM2Fx4juUR0ewSM6lYF
	qCrfEiy8MuAhUIF5Xy2XCIoUsoCJEiYegh13dS6iB17yaKSJXNJrN7AH2gFPIOTbIdhItQ
	oeauFTv1N9SAdo6+HQaqFVEnTGiffwq1NmmYhZlXJHlAySwwZRXM2VLmJDw4cygamOX48G
	YJlSQe7+VDMzhNE2s4eC3WWkdLM9n5DtF93/uNLUzNdGg0iBO30BbThwvkJ/Ew==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Dec 2025 12:40:44 +0100
Message-Id: <DEYRG6G9250G.1YBL10C4NJOA3@bootlin.com>
Subject: Re: [OE-core] [PATCH] initramfs-framework: rdepend on mountpoint
 command
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <erik.schumacher@iris-sensing.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <d3c53664d86c0cc854a92f9b5dc17059ef7e3596.camel@iris-sensing.com>
In-Reply-To: <d3c53664d86c0cc854a92f9b5dc17059ef7e3596.camel@iris-sensing.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 11:40:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227730

On Fri Dec 12, 2025 at 1:18 PM CET, Erik Schumacher via lists.openembedded.=
org wrote:
> The scripts of the framework base package and the rootfs module script,
> both depend on the mountpoint command being available, which was
> previously not the case. This led to boot failures when trying to boot
> any rootfs with the core-image-initramfs-boot initrd:
>
> /init: eval: line 16: mountpoint: not found
>
> This change adds the correct RDEPENDS for the base-package with a note
> that the rootfs-module also depends on it.
>
> Signed-off-by: Erik Schumacher <erik.schumacher@iris-sensing.com>
> ---

Hi Erik,

Thanks for your patch.

It looks like test_sstate_allarch_samesigs selftest is not happy with
it:

2025-12-12 20:04:30,268 - oe-selftest - INFO - FAIL: sstatetests.SStateHash=
SameSigs2.test_sstate_allarch_samesigs (subunit.RemotedTestCase)
2025-12-12 20:04:30,268 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2025-12-12 20:04:30,269 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/sstatetests.py", line 469, in test_=
sstate_allarch_samesigs
    self.sstate_common_samesigs(configA, configB, allarch=3DTrue)
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/sstatetests.py", line 206, in sstat=
e_common_samesigs
    self.assertEqual(files1, files2)
  File "/usr/lib/python3.11/unittest/case.py", line 873, in assertEqual
    assertion_func(first, second, msg=3Dmsg)
  File "/usr/lib/python3.11/unittest/case.py", line 1172, in assertDictEqua=
l
    self.fail(self._formatMessage(msg, standardMsg))
  File "/usr/lib/python3.11/unittest/case.py", line 703, in fail
    raise self.failureException(msg)
AssertionError: {'nat[288907 chars]a': '5a33f309254c400149bac668b24712ae47b=
6f23e8[23676 chars]227'} !=3D {'nat[288907 chars]a': '6886ab9a3ed9d12360fec=
5c00278339454f9b165f[23676 chars]227'}
  {'adwaita-icon-theme/do_collect_spdx_deps': 'a9b207cbd8fc530325dd6ac6ed13=
26c598ba5d388cb0487def95f8f57e429276',
   'adwaita-icon-theme/do_compile': '65c25400fef52b15166f6c3182a8e869f6bb83=
bbe612313108241128bcaeddb1',
   'adwaita-icon-theme/do_configure': '9876c62c2d670de1ec2c083743eaaecfb58e=
b6b5c073a49cfa4c54fc15f295fa',
   'adwaita-icon-theme/do_create_package_spdx': 'c81242a6feb654b56831559319=
94f10cfaed5e4b509178b661522ccd5ce4c46e',
   'adwaita-icon-theme/do_create_spdx': 'aa9d785474f0a70486bfc5898b741b9a94=
5e7dc7a851bbb3cc3efc848fd3ebf4',
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2827
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2720
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2964

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


