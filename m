Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD40CA1013
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 15:58:20 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.357.1757001493300876268
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 08:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fN44knIq;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5D0D74E40BAE
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Sep 2025 15:58:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1EA4E606C4;
	Thu,  4 Sep 2025 15:58:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25E811C22D6B1;
	Thu,  4 Sep 2025 17:58:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757001490; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DXwaIe31TT/rzn9uOvysYUqct9eSV45ZfnCkuKauW04=;
	b=fN44knIqX/Wmrh+uXO0Wty7SndvFd8L9PX1+M3dbS6LzDQXNhFk/2tFN02hcFD/gYTWLqw
	pUvz+iOZ5Nqr+6pzQYNofYLms6mkGDolqU2ITnZWXHwCw6cHUjM19biznvhYgpOvrDguOU
	LvJBi19p835GooSN2BakCsPD/vRtA1b2Wh/CzdJk6bprVmTPkWzl5n4QumwZFTjKF8Gkdv
	WSKecqsVGgqKl5pWmPdf9llQShYKrqshORCXwA/Ct2qPA5VZcIFQJcApOxmaVrS6V0gvK8
	LGh8AKnL23lDsuAfqwn90wAz45DhGV0tPgp/wxPW7epiBFdrSPJvNfgTcUvklQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Sep 2025 17:58:07 +0200
Message-Id: <DCK51OC59LCA.XXERUU1OP7Y@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/1] wic: updated fstab does not preserve
 metadata of the original file
Cc: <hongxu.jia@windriver.com>, <trevor.woerner@linaro.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dani.barra25@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250902190555.7929-1-dani.barra25@gmail.com>
In-Reply-To: <20250902190555.7929-1-dani.barra25@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 15:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222962

On Tue Sep 2, 2025 at 9:05 PM CEST, dani.barra25 via lists.openembedded.org=
 wrote:
> From: Daniel Andrade <dani.barra25@gmail.com>
>
> Using `install` in the rootfs plugin forces fstab to be replaced entirely=
, meaning that even its Inodes will change, leading xattrs and SELinux cont=
ext stored by pseudo not to be applied.
> The fix just uses `cp` without preserving attributes from the temporary f=
stab since none of them are needed, just the content.
> Same thing happens with the predefined mechanisms for ext4 and msdos. Usi=
ng debugfs there is no way to replace contents while maintaining metadata, =
so the approach taken on the path was to remove the different fstab logic f=
or those fstypes and also use the same modified cp command. Reviewing the b=
uilds I did it seems to work for all of the fstypes.
>
> Another problem is that the timestamp applied to fstab is not the same as=
 every other file. It seems like the `SOURCE_DATE_EPOCH` variable goes to t=
he fallback timestamp (`SOURCE_DATE_EPOCH_FALLBACK`).
> Since you are using that variable everywhere, it is not the same value as=
 ` REPRODUCIBLE_TIMESTAMP_ROOTFS` under `poky/meta/conf/bitbake.conf` that =
is applied in every other file.
>
> Daniel Andrade (1):
>   wic: Content of the temporary updated fstab should be copied into the
>     original not replacing it entirely.
>
>  meta/conf/bitbake.conf                   |  4 +++-
>  scripts/lib/wic/partition.py             | 15 +--------------
>  scripts/lib/wic/plugins/source/rootfs.py |  4 ++--
>  3 files changed, 6 insertions(+), 17 deletions(-)

Hi Daniel,

Thanks for your patch.

It looks like it is breaking a test:

2025-09-04 15:28:11,112 - oe-selftest - INFO - wic.Wic.test_no_fstab_update=
 (subunit.RemotedTestCase)
2025-09-04 15:28:11,113 - oe-selftest - INFO -  ... FAIL
...
2025-09-04 15:28:11,114 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/selftest/cases/wic.py", line 859, in test_no_fstab_update
    self.assertEqual(bf_fstab_md5sum, part_fstab_md5sum[1])
  File "/usr/lib/python3.12/unittest/case.py", line 885, in assertEqual
    assertion_func(first, second, msg=3Dmsg)
  File "/usr/lib/python3.12/unittest/case.py", line 1251, in assertMultiLin=
eEqual
    self.fail(self._formatMessage(msg, standardMsg))
  File "/usr/lib/python3.12/unittest/case.py", line 715, in fail
    raise self.failureException(msg)
AssertionError: 'af3c087d6c9131735c8d1f270a226892' !=3D '9edb8255abd217fdb2=
0e118833afb856'
- af3c087d6c9131735c8d1f270a226892
+ 9edb8255abd217fdb20e118833afb856

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2412
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2268

Can you fix it please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


