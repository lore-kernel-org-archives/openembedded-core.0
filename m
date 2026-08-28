Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F249C61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 13:24:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.313.1787923447763158054
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 06:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Jhjmwzwd;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3C5491A189F;
	Fri, 28 Aug 2026 13:05:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0396260537;
	Fri, 28 Aug 2026 13:05:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 84CF211C7810C;
	Fri, 28 Aug 2026 15:05:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787922324; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hyEHaFqk85Dg2YhY4zXDD/+j91AJNSJum2wU8U61Jno=;
	b=JhjmwzwdC7j5BulK3d5W98a6QmXTxDi3wLL9YoQcjNbn/PQEsyqUVye3eqQYC2fvICOcmS
	ISCp3JjZfP3E9Hen3VhgdCIzeZ2UwTgt+xFPqtMdzMq9yHjF4GMb7qLa0byu8RTbk44OQV
	pU1G4NpBoBr/5iRwuoRQhzlAn0E+1iV/x3bj7ScuMj74+yj0Hre256aj6OWZSywNgwGZkf
	0A0/39qVjhTh5wuItR3AkDcKdFk2oYhbOPXTCR8t4RZLmq+J696pC7CVVIIjLkY2eLYA5Y
	EhM2MwptYL2ZXhbrhrSD8wZUH15dro48hl0ROppv1OAmAouNdHUyxXuKASdUbg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Aug 2026 15:05:22 +0200
Message-Id: <DL0LKFQTHSYI.3HB4477WXT14Y@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] initramfs-framework: support LABEL with
 root-only udev trigger
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wenwfu@qti.qualcomm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260826092522.1618546-1-wenwfu@qti.qualcomm.com>
 <20260827151144.3046231-1-wenwfu@qti.qualcomm.com>
In-Reply-To: <20260827151144.3046231-1-wenwfu@qti.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 13:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244540

On Thu Aug 27, 2026 at 5:11 PM CEST, Wenwen Fu via lists.openembedded.org w=
rote:
> Filesystem labels are not available in kernel uevents. Add
> util-linux-findfs to initramfs-module-udev and use findfs to resolve
> root=3DLABEL=3D to a device. Read the kernel-provided PARTUUID from sysfs
> and trigger only that partition, falling back to a full trigger if the
> label cannot be resolved safely. Keeping findfs out of the BusyBox
> defconfig avoids increasing BusyBox for unrelated users.
>
> Tested with bitbake -p and by generating the
> core-image-minimal-initramfs dependency graph.
>
> AI-Generated: OpenAI Codex
> Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
> ---
> Changes in v2:
> - Keep findfs out of the default BusyBox configuration.
> - Add util-linux-findfs as an initramfs-module-udev runtime dependency.
> ---

Hi,

Thanks for the new version, but it looks like this is now breaking the
sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs selftest:

2026-08-28 11:52:19,276 - oe-selftest - INFO - 11: 37/71 648/764 (178.91s) =
(0 failed) (sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs)
2026-08-28 11:52:19,277 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/sstatetests.py", line 474, in test_=
sstate_allarch_samesigs
    self.sstate_common_samesigs(configA, configB, allarch=3DTrue)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/sstatetests.py", line 207, in sstat=
e_common_samesigs
    self.assertEqual(files1, files2)
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/buildtools/sys=
roots/x86_64-pokysdk-linux/usr/lib/python3.13/unittest/case.py", line 907, =
in assertEqual
    assertion_func(first, second, msg=3Dmsg)
    ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/buildtools/sys=
roots/x86_64-pokysdk-linux/usr/lib/python3.13/unittest/case.py", line 1206,=
 in assertDictEqual
    self.fail(self._formatMessage(msg, standardMsg))
    ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/buildtools/sys=
roots/x86_64-pokysdk-linux/usr/lib/python3.13/unittest/case.py", line 732, =
in fail
    raise self.failureException(msg)
AssertionError: {'nat[225943 chars]k/do_create_package_spdx': '89409e9454be=
d0d549[78392 chars]4bc'} !=3D {'nat[225943 chars]k/do_recipe_qa': '164b683a=
a2faabba13f23d8003ac[78392 chars]4bc'}
...
-  'initramfs-framework/do_create_package_spdx': '89409e9454bed0d5494c8686b=
6418dc7fdd8c7c0d0e97dd87dd3e8342b621da4',
+  'initramfs-framework/do_create_package_spdx': 'c7ab0c1500e7106e8265cef8b=
d1fe05be652789acf69432215a7e172408676b7',
...
-  'initramfs-framework/do_package_qa': 'b6819a7ecf80c6bf03ff749c968ce24754=
dd7a07d05fd0fc2fcc9a53efd87bfb',
-  'initramfs-framework/do_package_write_rpm': '5a3cc5880fa17990df784774101=
4ff9188f80d91e48d789665ff82b1016028f1',
+  'initramfs-framework/do_package_qa': '9b79d0a3fb13d27058711597b04fe0d62f=
4cd54f250db04408ceb02e35d09a12',
+  'initramfs-framework/do_package_write_rpm': '937c8f39225bc46d8d8abaa38ba=
17af2b428b690ecb5f4a7706a711824a52af2',
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4693
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4737
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4514

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


