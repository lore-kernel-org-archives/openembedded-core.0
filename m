Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9C5C433EF
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 10:47:29 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web08.9373.1634381248716898881
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Oct 2021 03:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 9A77F1BF203;
	Sat, 16 Oct 2021 10:47:25 +0000 (UTC)
Date: Sat, 16 Oct 2021 12:47:25 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: openembedded-core@lists.openembedded.org, Abdellatif.ElKhlifi@arm.com,
	Walter Schweizer <walter.schweizer@siemens.com>
Subject: Re: [OE-core][PATCH v3 2/2] kernel-fitimage: use correct kernel image
Message-ID: <YWqtvXw2atDZgpP5@piout.net>
References: <20211005202256.54023-1-andrej.valek@siemens.com>
 <20211013120639.58668-2-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013120639.58668-2-andrej.valek@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Oct 2021 10:47:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157013

Hello Andrej,

On 13/10/2021 14:06:39+0200, Andrej Valek wrote:
> Even if initramfs_bundle_path was used, a wrong compression was reflected
> in output its template file. Use linux.bin as universal kernel image.
> The linux.bin file covers both cases.
> 
> Use linux.bin as a replacement for zImage in selftest. We know,
> that zImage is a compressed one, so get the compression type.
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Walter Schweizer <walter.schweizer@siemens.com>
> ---
>  meta/classes/kernel-fitimage.bbclass     | 17 +----------------
>  meta/lib/oeqa/selftest/cases/fitimage.py |  8 +++-----

This still caused issues on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2710/steps/15/logs/stdio

2021-10-15 17:23:26,867 - oe-selftest - INFO - fitimage.FitImageTests.test_initramfs_bundle (subunit.RemotedTestCase)
2021-10-15 17:23:26,868 - oe-selftest - INFO -  ... FAIL
Stderr:
2021-10-15 14:30:44,854 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-7047/conf/local.conf
2021-10-15 14:30:44,854 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2021-10-15 17:23:26,868 - oe-selftest - INFO - 10: 3/13 391/444 (6177.79s) (fitimage.FitImageTests.test_initramfs_bundle)
2021-10-15 17:23:26,868 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/fitimage.py", line 801, in test_initramfs_bundle
    self.assertTrue(test_passed == True,"kernel node does not match expectation")
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.9/unittest/case.py", line 682, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : kernel node does not match expectation


https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/2686/steps/14/logs/stdio

2021-10-15 15:51:53,829 - oe-selftest - INFO - fitimage.FitImageTests.test_initramfs_bundle (subunit.RemotedTestCase)
2021-10-15 15:51:53,830 - oe-selftest - INFO -  ... FAIL
2021-10-15 15:51:53,830 - oe-selftest - INFO - 10: 3/13 339/444 (525.77s) (fitimage.FitImageTests.test_initramfs_bundle)
2021-10-15 15:51:53,830 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/fitimage.py", line 801, in test_initramfs_bundle
    self.assertTrue(test_passed == True,"kernel node does not match expectation")
  File "/usr/lib/python3.7/unittest/case.py", line 692, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : kernel node does not match expectation



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

