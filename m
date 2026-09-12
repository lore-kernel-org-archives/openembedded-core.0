Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB0DC79FB6
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 12:18:42 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5519.1789215513700709075
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2026 05:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2YWc3OGT;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 72CF04E402B9;
	Sat, 12 Sep 2026 12:18:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 31C8160580;
	Sat, 12 Sep 2026 12:18:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B62FC11C78D5A;
	Sat, 12 Sep 2026 14:18:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789215510; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PXJ4KWQn78QNDyqmsbabxSUwnQimowjYrAOcmUehT/Q=;
	b=2YWc3OGTpPbkd5bZ6aQXZfQhZ710mC8CvWrzu0gMwOGlc5crsiTM7lv7PDQmzAr0i5Kez/
	//LRXo0V0Uw5v5hJ/1gDjfqjQDEzc8PwKU2se8uX3T8AbQ7iBaEYGwNTJbSZkBFZEiJaoq
	qi7YKlcnkGI/h9gs0F5FvLSiJOVOP7DF7/5a5mq2cZD5k4jyKqABD3O5kzdZAF1I/ZHUS+
	A/htMfbJXXC9SjxKc4DO8dUVbqSa8EE9gy6U044FevGhxIeP/FRfumv4u1X6IwoC8VS45A
	Uj9tJSVfa536setiM+oHqjTzpnp1tO7CMx1dhm9vTNfBeDrAIvIO9FNUB8p8Ng==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Sep 2026 14:18:27 +0200
Message-Id: <DLDBYP5W0AF2.280D6PM6XUF48@bootlin.com>
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>, "Khem Raj"
 <raj.khem@gmail.com>, "Richard Purdie" <richard.purdie@linuxfoundation.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <othacehe@gnu.org>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] lib/oe/package: Add strip keep-section
 support
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260911220138.32414-1-othacehe@gnu.org>
 <20260911220138.32414-2-othacehe@gnu.org>
In-Reply-To: <20260911220138.32414-2-othacehe@gnu.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 12:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245701

On Sat Sep 12, 2026 at 12:01 AM CEST, Mathieu Othacehe via lists.openembedd=
ed.org wrote:
> On 32-bit Arm, the .ARM.extab and .ARM.exidx unwinding sections do not
> always provide enough information to get a full backtrace on C++
> exceptions:
>
>   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D117941
>
> In addition to those unwinding sections, GCC also emits unwinding
> instructions in DWARF format under the .debug_frame section. By
> instructing 'strip' not to remove that section, libunwind can use it
> to produce a full backtrace, for example when an unhandled C++
> exception is thrown.
>
> Add a PACKAGE_KEEP_SECTIONS variable, listing space separated ELF
> section names that should be kept around instead of stripped, for
> example:
>
>   PACKAGE_KEEP_SECTIONS:pn-myrecipe =3D ".debug_frame"
>
> This variable is never applied to kernel modules, which are covered
> by CONFIG_UNWINDER_* instead.
>
> Add a oe-selftest case building core-image-minimal for qemuarm, and
> checking with readelf that busybox loses its .debug_frame section by
> default, but keeps it once PACKAGE_KEEP_SECTIONS is set.
>
> Signed-off-by: Mathieu Othacehe <othacehe@gnu.org>
> ---

Hi Mathieu,

Thanks for your patch.

It looks like the added test is failing on the autobuilder:

2026-09-12 09:19:34,528 - oe-selftest - INFO - package.PackageKeepSections.=
test_package_keep_sections (subunit.RemotedTestCase)
2026-09-12 09:19:34,529 - oe-selftest - INFO -  ... ERROR
...
2026-09-12 09:19:34,529 - oe-selftest - INFO - 5: 28/54 531/772 (122.95s) (=
0 failed) (package.PackageKeepSections.test_package_keep_sections)
2026-09-12 09:19:34,529 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/package.py", line 248, in test_pack=
age_keep_sections
    self.assertFalse(has_section(".debug_frame"),
                     ~~~~~~~~~~~^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/package.py", line 241, in has_secti=
on
    tar.extract("./usr/bin/busybox.nosuid", path=3Dunpackedfs)
    ~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/buildtools/sys=
roots/x86_64-pokysdk-linux/usr/lib/python3.13/tarfile.py", line 2365, in ex=
tract
    tarinfo =3D self._get_extract_tarinfo(member, filter_function, path)
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/buildtools/sys=
roots/x86_64-pokysdk-linux/usr/lib/python3.13/tarfile.py", line 2372, in _g=
et_extract_tarinfo
    tarinfo =3D self.getmember(member)
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/buildtools/sys=
roots/x86_64-pokysdk-linux/usr/lib/python3.13/tarfile.py", line 2041, in ge=
tmember
    raise KeyError("filename %r not found" % name)
KeyError: "filename './usr/bin/busybox.nosuid' not found"

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4649
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4842

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


