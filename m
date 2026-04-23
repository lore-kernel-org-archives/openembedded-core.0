Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0889F94CBE
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 06:44:48 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14066.1776926677713003344
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 23:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=069Xiuqf;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A5C50C5EF06;
	Thu, 23 Apr 2026 06:45:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 646C860495;
	Thu, 23 Apr 2026 06:44:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A40C110460A06;
	Thu, 23 Apr 2026 08:44:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776926673; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3+MiHyJ//sZBZ29uw5AyIo7BlJ8ZlcZLri9zMzGrTvs=;
	b=069XiuqfLfr4efOCJXZh615ptiqWw46/6CRKz4YuYdfWKcb/5n4Ds2832OxJ1MiRHABs+a
	NW1Q+A7dKPoGI/cMR0eQeA779N/Mh6CjYSsucIc1lchWJ9Hbv9LuP9Alf3+mdH76fO/AcS
	dz+wjhnM0QswGr2VqEVW7j7ymO2F2jXsOo2eAWR/bbZNR1qTENIqcSH48e9ael91NSzhhX
	GPaX5aZVJ6yuyuehIqXdh0rF8bl/LmtD/CE+8E17HUXUgI2oCyvgjnD5KIRzhRBmXUPlVU
	II6urN1PJZOjcLkB/guoPAnY7W7UaPxCPiyA1OdXYtuEMmxs8Kn4cRpftP87zw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Apr 2026 08:44:31 +0200
Message-Id: <DI0BXNU5HAFH.348GL3QVI6JL3@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 3/3] oe-selftest: add test for useradd with
 only USERADD_DEPENDS
Cc: <Ross.Burton@arm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <zizuzacker@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260420163940.182918-1-zizuzacker@gmail.com>
 <20260420163940.182918-4-zizuzacker@gmail.com>
In-Reply-To: <20260420163940.182918-4-zizuzacker@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 06:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235741

On Mon Apr 20, 2026 at 6:39 PM CEST, Zk47T via lists.openembedded.org wrote=
:
> Add a test case to verify that a recipe inheriting useradd with only
> USERADD_DEPENDS set (and no USERADD_PACKAGES) parses and builds
> successfully. This validates the fix in useradd.bbclass for
> [YOCTO #15863].
>
> Signed-off-by: Nguyen Minh Tien <zizuzacker@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/usergrouptests.py | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/usergrouptests.py b/meta/lib/oe=
qa/selftest/cases/usergrouptests.py
> index 3c59b0f290..69025a59aa 100644
> --- a/meta/lib/oeqa/selftest/cases/usergrouptests.py
> +++ b/meta/lib/oeqa/selftest/cases/usergrouptests.py
> @@ -55,3 +55,9 @@ class UserGroupTests(OESelftestTestCase):
>          self.write_config("USERADD_GID_TABLES +=3D \"files/static-group\=
"")
>          self.logger.info("Rebuild with other staticids")
>          self.assertTrue(bitbake(' core-image-minimal'))
> +
> +    def test_useradd_depends_only(self):
> +        # Test that a recipe inheriting useradd with only USERADD_DEPEND=
S
> +        # (and no USERADD_PACKAGES) parses and builds successfully. [YOC=
TO #15863]
> +        self.logger.info("Building usegroup-deponly to test USERADD_DEPE=
NDS only")
> +        self.assertTrue(bitbake(' usegroup-deponly'))


Hi,

Thanks for adding tests.

Yet, it looks like this test is always failing. I had the issue both on
the autobuilder and locally:

2026-04-22 13:30:16,318 - oe-selftest - INFO - usergrouptests.UserGroupTest=
s.test_useradd_depends_only (subunit.RemotedTestCase)
2026-04-22 13:30:16,332 - oe-selftest - INFO -  ... FAIL
...
ERROR: usegroup-deponly-1.0-r0 do_unpack: S should be set relative to UNPAC=
KDIR, e.g. replace WORKDIR with UNPACKDIR in "S =3D ${WORKDIR}/sources"
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/oe-selftes=
t-debian/build/build-st-409425/tmp/work/all-poky-linux/usegroup-deponly/1.0=
/temp/log.do_unpack.2060861
NOTE: recipe usegroup-deponly-1.0-r0: task do_unpack: Failed
ERROR: Task (/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-=
409425/meta-selftest/recipes-test/selftest-users/usegroup-deponly.bb:do_unp=
ack) failed with exit code '1'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3719
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3606

So I believe the issue does not code from the test, but from the recipe
itself.

Can you have a look at the issue?

Thanks,
Mathieu


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


