Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FE8D609AB
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 15:20:36 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25065.1765898428154979040
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 07:20:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VdK0nG20;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E22A24E41C2C;
	Tue, 16 Dec 2025 15:20:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7F276071C;
	Tue, 16 Dec 2025 15:20:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B55E4119A8E48;
	Tue, 16 Dec 2025 16:20:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765898421; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AXrKTbmzUpsydbMc+XwxSTtOMT4OeuWsT0LE0bxLGyY=;
	b=VdK0nG20TwQEnGVCIVyjmZk2P7NC7WmPGiByqVTdj/INpaf1k3r2q+kfAVBRIcQwfQFs3L
	ixEqA4gCxitkwhAhnkkNVactQ0dSjDaVQZJGKSCNa9JnbHLk1jHun/cPGzS401YXxjPvhz
	fuTfmyMS2T/WDtzSM+5+URLf6aUwkRYCpNIwa4FlWoIiPo7or64isnCC6Yu+r1Aqpbwl4Z
	NS4zZuzmIN40vJi2suc3qJjV+usqQtNWKZQrAxXhGSTfj6X4j/N6QT7bsrPsPVejXwUvgs
	IMfR5mMl+s2Jk11XwPEIlBEIm3yIiJ4yCOFAme4cXXxMQFboW5BeHaLkZGsqqw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 16:20:20 +0100
Message-Id: <DEZQQUV9KIWU.1W2BBBFVV4DBJ@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <pierre-loup.gosse@smile.fr>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 1/2] u-boot: make initial environment
 binary image
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251121084918.875151-1-pierre-loup.gosse@smile.fr>
In-Reply-To: <20251121084918.875151-1-pierre-loup.gosse@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 15:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227967

On Fri Nov 21, 2025 at 9:49 AM CET, Pierre-loup GOSSE via lists.openembedde=
d.org wrote:
> From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>
> Build the U-Boot initial environment binary image if
> UBOOT_INITIAL_ENV_BINARY is set to "1". The environment partition size
> (in bytes, hexadecimal or decimal) must be defined using
> UBOOT_INITIAL_ENV_BINARY_SIZE.
>
> If U-Boot environment redundancy is enabled,
> UBOOT_INITIAL_ENV_BINARY_REDUND must be set to "1".
>
> The resulting binary can be flashed using WIC at the environment offset,
> overriding any existing environment if present, for example:
>
>   part --source rawcopy --sourceparams=3D"file=3Du-boot-initial-env-sd.bi=
n" --ondisk sda --no-table --offset 4096
>
> Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> ---
> Note: Once merged, a patch with the new variables will be submitted to th=
e
>       documentation mailing list.
>
> changes in v2:
> - fix uboot_deploy_config (builddir was missing)
>
> no changes in v3
> ---

Hi Pierre-loup,

After the last comments I took your series for testing, but got the
following error during selftest:

2025-12-16 11:06:28,209 - oe-selftest - INFO - uboot.UBootTest.test_uboot_i=
nitial_env_binary (subunit.RemotedTestCase)
2025-12-16 11:06:28,210 - oe-selftest - INFO -  ... FAIL
...
2025-12-16 11:06:05,623 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/uboot.py", line 152, in test_uboot_=
config_initial_env_binary
    self.assertExists(uboot_initial_env_binary_path)
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/case.py", line 251, in assertExists
    raise self.failureException(msg)
AssertionError: '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build=
-st-1145752/tmp/work/qemux86_64-poky-linux/u-boot/2025.10/deploy-u-boot/u-b=
oot-initial-env-test.bin' does not exist

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2838
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2732

Can you have a look at this issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


