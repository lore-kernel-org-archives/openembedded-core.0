Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1A5C5CFEE
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 09:11:28 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3993.1786525884564067882
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 02:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=O6hvFV+p;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4AE7B4E411D1;
	Wed, 12 Aug 2026 09:11:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F00C6045E;
	Wed, 12 Aug 2026 09:11:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D705F11C4CA62;
	Wed, 12 Aug 2026 11:11:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786525877; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3W5WJkUkxYO6aOZlfF//1pYUkpOyBV4lKXd9W8aYpiI=;
	b=O6hvFV+pupq/px6KdbnV+rRTTTAp5cxRVBQNmu575CVAiSotB1+JP6xFjziBNMQemiHanL
	psZfDp70aHuzr2G8Wj1t3oM5eccXT5OXuqpBj1VZppDtXVbraGUWdzu/FtPgnsrEuKzLCx
	TKHLvOKtpVFhQNUUgY9u3fg7xqg2mmDlha0Ijvn6jZQPWVcPiXRecTnJnIMEChXhLL2jpa
	AbqRAA6T861BtE6LWK3OYjnLx0TE+xfBPiwCyVKf3X0/lqq48kdL/M+pcdrXg/4hZkIE9o
	eBZYRidvCDVeVuR8t1T8e0t28HmxhoGU0tkVlzKdkQZDQGI8Ag1kgECDkxq11w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Aug 2026 11:11:16 +0200
Message-Id: <DKMUKHF4QT1Y.1GT8GMSZB2SWY@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 4/4] python3-dtc: fix build with swig 4.5.0
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
 <20260811135200.18942-1-jaipaul.cheernam@est.tech>
 <20260811135200.18942-5-jaipaul.cheernam@est.tech>
In-Reply-To: <20260811135200.18942-5-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 09:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243267

On Tue Aug 11, 2026 at 3:52 PM CEST, Jaipaul Cheernam wrote:
> SWIG 4.5.0 removed Python 2 compatibility macros (PyInt_*, PyString_*)
> from its runtime. Backport the upstream fix to replace them with
> Python 3 equivalents.
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for the new version.

I suspect this is the source of some selftest fails:

2026-08-12 06:27:00,896 - oe-selftest - INFO - fitimage.UBootFitImageTests.=
test_sign_uboot_kernel_individual (subunit.RemotedTestCase)
2026-08-12 06:27:00,896 - oe-selftest - INFO -  ... FAIL
...
ERROR: u-boot-1_2026.07-r0 do_compile: oe_runmake failed
ERROR: u-boot-1_2026.07-r0 do_compile: Execution of '/srv/pokybuild/yocto-w=
orker/oe-selftest-debian/build/build-st-3408129/tmp/work/qemux86_64-poky-li=
nux/u-boot/2026.07/temp/run.do_compile.180130' failed with exit code 1
...
| ImportError: /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-s=
t-3408129/tmp/work/qemux86_64-poky-linux/u-boot/2026.07/build/scripts/dtc/p=
ylibfdt/_libfdt.so: undefined symbol: PyInt_AsLong
| make[1]: *** [/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-=
st-3408129/tmp/work/qemux86_64-poky-linux/u-boot/2026.07/sources/u-boot-202=
6.07/Makefile:1395: .binman_stamp] Error 1
| make: Leaving directory '/srv/pokybuild/yocto-worker/oe-selftest-debian/b=
uild/build-st-3408129/tmp/work/qemux86_64-poky-linux/u-boot/2026.07/sources=
/u-boot-2026.07'
| make: *** [Makefile:189: __sub-make] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
NOTE: recipe u-boot-1_2026.07-r0: task do_compile: Failed
ERROR: Task (/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/op=
enembedded-core/meta/recipes-bsp/u-boot/u-boot_2026.07.bb:do_compile) faile=
d with exit code '1'

And other fails:

2026-08-12 06:25:29,098 - oe-selftest - INFO - fitimage.UBootFitImageTests.=
test_sign_uboot_fit_image_without_spl (subunit.RemotedTestCase)
2026-08-12 06:25:29,124 - oe-selftest - INFO -  ... FAIL
...
2026-08-12 06:28:15,880 - oe-selftest - INFO - fitimage.UBootFitImageTests.=
test_uboot_fit_image (subunit.RemotedTestCase)
2026-08-12 06:28:15,881 - oe-selftest - INFO -  ... FAIL
...
2026-08-12 08:27:05,250 - oe-selftest - INFO - uboot.UBootTest.test_uboot_c=
onfig_initial_env_binary (subunit.RemotedTestCase)
2026-08-12 08:27:05,263 - oe-selftest - INFO -  ... FAIL
...
2026-08-12 08:28:04,129 - oe-selftest - INFO - uboot.UBootTest.test_uboot_i=
nitial_env_binary (subunit.RemotedTestCase)
2026-08-12 08:28:04,141 - oe-selftest - INFO -  ... FAIL


Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


