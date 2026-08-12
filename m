Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3116EC5CFDB
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 11:41:15 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6019.1786534867360104527
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 04:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AJV1Zw6w;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 079E14E411D6;
	Wed, 12 Aug 2026 11:41:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B45856045E;
	Wed, 12 Aug 2026 11:41:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 76B1111C4CDDE;
	Wed, 12 Aug 2026 13:40:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786534860; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TsBuevinepdAVaZ5zwTOkn6mvlHt57/noq43POs29vk=;
	b=AJV1Zw6w0Z9CM/cWXi3pytMOnuOZKZKlupNQxc84U+Dy5KDOTyildDsPprz9rsSANzvgky
	tBdJLh5qLbcRfWESpivYKfqF87pmhJydlL/OBL/Iobe5uhrbpbMn1VjGTASOSzv4+zF6gc
	qJgjWvRbkxvHVa31PG/WDsl25zOnlQtuCthv1sKxYyYACqS0qr1nqmMLVFiG2yNx8S9SDx
	gtBdokkN1AN2rX6kybtxyhGNuVZX+FOT5aJ4o0o5I4JhRg0hMqcUck+iJFovNDF2cPlYj7
	5+lsFIqD9EeDagFURMnWbPVpHBAMcgh5q5BDsUIY+PaQoUxCOC19SU3HR7RKTQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Aug 2026 13:40:55 +0200
Message-Id: <DKMXR2LKXWBZ.3C4RKC617CK0H@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Sumanth Gavini" <sumanth.gavini@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v13 09/10] rpm: Fix pkgconfig() Provides missing in
 cross-built RPMs
Cc: <alex.kanavin@gmail.com>, <mattware@cisco.com>, <esparlin@cisco.com>,
 <peter.marko@siemens.com>, <randy.macleod@windriver.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260810045250.3903576-1-sumanth.gavini@windriver.com>
 <20260810045250.3903576-10-sumanth.gavini@windriver.com>
 <DKM6IAUNZOOF.11QH0FJ6NRSQ2@bootlin.com>
In-Reply-To: <DKM6IAUNZOOF.11QH0FJ6NRSQ2@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 11:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243277

On Tue Aug 11, 2026 at 4:19 PM CEST, Mathieu Dubois-Briand wrote:
> On Mon Aug 10, 2026 at 6:52 AM CEST, Sumanth Gavini wrote:
>> * Added 0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch
>>   - rpm 6's internal dependency generator runs pkgconfigdeps.sh during
>>     rpmbuild, but OE's cross-build environment exports PKG_CONFIG_SYSROO=
T_DIR
>>     which causes pkg-config --print-provides to silently fail on .pc fil=
es
>>     in the package buildroot.
>>
>>     Unset cross-compilation PKG_CONFIG_* variables in pkgconfigdeps.sh s=
o
>>     that pkgconfig() Provides/Requires are correctly generated.
>>
>>     Without this fix, do_rootfs fails with errors like:
>>     nothing provides pkgconfig(ogg) needed by flac-dev
>>
>> Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
>> ---
>
> Hi Sumanth,
>
> Thanks for the new version.
>
> This looks better, at least for the dnf install errors. Yet we still
> have errors when reusing sstate-cache, as recipes generating pkgconfig
> should be rebuilt, but their signatures did not change:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4377
>
> I made some horrible hack in my branch to change the PR of many
> recipes, and the build now succeeds. I only tested one configuration,
> but we can expect similar results on the other ones.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4386
>
> So, depending on how you address Ross comment, you might need to make
> sure recipes signature is going to change.
>
> We also had some selftest errors: I will investigate a bit further and
> come back to you.
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4525
>
> Thanks,
> Mathieu

So, talking about failed selftests. We can see three failing tests on
the autobuilder:

2026-08-11 15:19:21,651 - oe-selftest - INFO - debuginfod.Debuginfod.test_d=
ebuginfod_qemu (subunit.RemotedTestCase)
2026-08-11 15:19:21,652 - oe-selftest - INFO -  ... FAIL
...
2026-08-11 16:53:01,397 - oe-selftest - INFO - sdk.SDKTests.test_sdk_manife=
sts (subunit.RemotedTestCase)
2026-08-11 16:53:01,401 - oe-selftest - INFO -  ... FAIL
...
2026-08-11 16:55:44,191 - oe-selftest - INFO - sdk.SDKTests.test_sdk_runqem=
u (subunit.RemotedTestCase)
2026-08-11 16:55:44,191 - oe-selftest - INFO -  ... FAIL

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4537

The first one is easy to reproduce locally. Basically, I have this in my
local.conf:
SDKMACHINE =3D "x86_64"
PACKAGE_CLASSES =3D "package_rpm package_deb package_ipk"
INHERIT +=3D 'image-buildinfo'
IMAGE_BUILDINFO_VARS:append =3D ' IMAGE_BASENAME IMAGE_NAME'
SANITY_TESTED_DISTROS =3D ''
OEQA_TESTDISPLAY =3D ':1'
EXTRA_IMAGE_FEATURES ?=3D 'allow-empty-password empty-root-password allow-r=
oot-login'
OE_FRAGMENTS +=3D 'distro/poky'

Then you can run:
oe-selftest -v -r debuginfod.Debuginfod.test_debuginfod_qemu

I was not able to reproduce the two other ones locally so far. It looks
like another pkgconfig issue. I suggest we focus on other issues right
now, hopefully the SDKTests failures will be gone with your next
changes.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


