Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD910D609AF
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 15:28:16 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25273.1765898886760511645
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 07:28:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UuuIacTI;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5AFC5C19D35;
	Tue, 16 Dec 2025 15:27:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CDBA86071C;
	Tue, 16 Dec 2025 15:28:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C412119A8D1E;
	Tue, 16 Dec 2025 16:28:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765898883; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=X9+WdakTlc01Is48zihABeeERcz0XRyEKYCPGwSp7BA=;
	b=UuuIacTIlNmJyTGerKGfmvP0X/NPGPIm5Tnu1QZSCLYV4zY4Qz3JukHKmM6bZAOcMqaqNq
	IlXPRu88q+0qL35jgtv2pGoiqOJmAj56BLIhA/AEoKUhj1hNDOlLyTw4J0nGKAB/ziahrL
	HpYDaGnrgNhdOwqNo9DADZcSSBsUmI2QnwEzbPm3F40mhwUfWP32cph8/i7ISNyPOORT+p
	+22lYVkd+DG4oxT/6XlunwnbOQtGtCEz1mg5OhEHia4l18Or6mCYsAQABqLVyZTHLGj0EZ
	U/2WR+BKiLXpt8L8TANyVGFNFKtYhBMXVOSibGj7AUIZTF8PB08U8LdxfAnF5g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 16:28:02 +0100
Message-Id: <DEZQWR3VBHRW.1RWK27DMLCU4M@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <pierre-loup.gosse@smile.fr>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 1/2] u-boot: make initial environment
 binary image
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251121084918.875151-1-pierre-loup.gosse@smile.fr>
 <DEZQQUV9KIWU.1W2BBBFVV4DBJ@bootlin.com>
In-Reply-To: <DEZQQUV9KIWU.1W2BBBFVV4DBJ@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 15:28:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227970

On Tue Dec 16, 2025 at 4:20 PM CET, Mathieu Dubois-Briand wrote:
> On Fri Nov 21, 2025 at 9:49 AM CET, Pierre-loup GOSSE via lists.openembed=
ded.org wrote:
>> From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>>
>> Build the U-Boot initial environment binary image if
>> UBOOT_INITIAL_ENV_BINARY is set to "1". The environment partition size
>> (in bytes, hexadecimal or decimal) must be defined using
>> UBOOT_INITIAL_ENV_BINARY_SIZE.
>>
>> If U-Boot environment redundancy is enabled,
>> UBOOT_INITIAL_ENV_BINARY_REDUND must be set to "1".
>>
>> The resulting binary can be flashed using WIC at the environment offset,
>> overriding any existing environment if present, for example:
>>
>>   part --source rawcopy --sourceparams=3D"file=3Du-boot-initial-env-sd.b=
in" --ondisk sda --no-table --offset 4096
>>
>> Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>> ---
>> Note: Once merged, a patch with the new variables will be submitted to t=
he
>>       documentation mailing list.
>>
>> changes in v2:
>> - fix uboot_deploy_config (builddir was missing)
>>
>> no changes in v3
>> ---
>
> Hi Pierre-loup,
>
> After the last comments I took your series for testing, but got the
> following error during selftest:
>
> 2025-12-16 11:06:28,209 - oe-selftest - INFO - uboot.UBootTest.test_uboot=
_initial_env_binary (subunit.RemotedTestCase)
> 2025-12-16 11:06:28,210 - oe-selftest - INFO -  ... FAIL
> ...
> 2025-12-16 11:06:05,623 - oe-selftest - INFO - testtools.testresult.real.=
_StringException: Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/opene=
mbedded-core/meta/lib/oeqa/selftest/cases/uboot.py", line 152, in test_uboo=
t_config_initial_env_binary
>     self.assertExists(uboot_initial_env_binary_path)
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/opene=
mbedded-core/meta/lib/oeqa/selftest/case.py", line 251, in assertExists
>     raise self.failureException(msg)
> AssertionError: '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/bui=
ld-st-1145752/tmp/work/qemux86_64-poky-linux/u-boot/2025.10/deploy-u-boot/u=
-boot-initial-env-test.bin' does not exist
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2838
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2732
>
> Can you have a look at this issue?
>
> Thanks,
> Mathieu

OK, it looks like the issue is somewhere between my keyboard and my
chair. Forget this issue for now...

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


