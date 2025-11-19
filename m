Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEF1CF58C1
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 17:41:20 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13136.1763574078371149089
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 09:41:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ec42Y4cT;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E8A501A1BC3
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 17:41:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B832C60699;
	Wed, 19 Nov 2025 17:41:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB1661037173A;
	Wed, 19 Nov 2025 18:41:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763574075; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TwPRBSHuGSP+xAFH8PVQaSWEjOPhJSs07SjECxFgn98=;
	b=ec42Y4cTB1IhAoatBLC9pHM4LWLF255QzFKL8fFQlAgPK6ABFBmRq2c1zjI8I5DlsjsCCM
	nmqpaeLxGzrZFprx7YrRQs75EJzTe3tMqEhwr/F7l3yjxv1YAQySuH8H/d94m0MgGchOok
	+YGpwgUH8NP5PwTpjp+H7HMV92lM36+1Hj/el9eoCa8lTAayFFSj/smTvLM1XYedWn4+Vg
	6ENzQZL5ARa4KabwjfjKL05Fn1V4PGhIR+HiShhcU/oAFlVpYESDOF/6SjL5xilGRTUMRX
	YoZMQK0MMCk0GdXZ/DKo9espXzcGp53BtWf8Lj5Bne5RpJpa/jrtfm5/IEvS5g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 18:41:13 +0100
Message-Id: <DECUU0K7IT03.3ERKMFJR5CVH2@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 2/2] oe-selftest: uboot: add test for
 building U-Boot initial env binary
Cc: "Ross Burton" <ross.burton@arm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <pierre-loup.gosse@smile.fr>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251117161239.1227164-1-pierre-loup.gosse@smile.fr>
 <20251117161239.1227164-2-pierre-loup.gosse@smile.fr>
In-Reply-To: <20251117161239.1227164-2-pierre-loup.gosse@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 17:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226575

On Mon Nov 17, 2025 at 5:12 PM CET, Pierre-loup GOSSE via lists.openembedde=
d.org wrote:
> From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>
> This adds two new selftest cases `test_uboot_initial_env_binary` and
> `test_uboot_config_initial_env_binary` to verify the build of the U-Boot
> initial env binary with the mkimage tool.
>
> Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> Cc: Ross Burton <ross.burton@arm.com>
> ---

Hi Pierre-Loup,

Thanks for your patch.

It looks like this is failing when building on ARM machines:

2025-11-19 10:13:26,832 - oe-selftest - INFO - uboot.UBootTest.test_uboot_c=
onfig_initial_env_binary (subunit.RemotedTestCase)
2025-11-19 10:13:26,836 - oe-selftest - INFO -  ... FAIL
...
ERROR: u-boot-1_2025.10-r0 do_compile: oe_runmake failed
ERROR: u-boot-1_2025.10-r0 do_compile: Execution of '/srv/pokybuild/yocto-w=
orker/oe-selftest-armhost/build/build-st-3996856/tmp/work/qemuarm64-poky-li=
nux/u-boot/2025.10/temp/run.do_compile.1762173' failed with exit code 1
...
|   aarch64-poky-linux-gcc  --sysroot=3D/srv/pokybuild/yocto-worker/oe-self=
test-armhost/build/build-st-3996856/tmp/work/qemuarm64-poky-linux/u-boot/20=
25.10/recipe-sysroot  -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/oe-se=
lftest-armhost/build/build-st-3996856/tmp/work/qemuarm64-poky-linux/u-boot/=
2025.10/sources/u-boot-2025.10=3D/usr/src/debug/u-boot/2025.10  -ffile-pref=
ix-map=3D/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-399=
6856/tmp/work/qemuarm64-poky-linux/u-boot/2025.10/build=3D/usr/src/debug/u-=
boot/2025.10  -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/oe-selftest-a=
rmhost/build/build-st-3996856/tmp/work/qemuarm64-poky-linux/u-boot/2025.10/=
recipe-sysroot=3D  -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/oe-selft=
est-armhost/build/build-st-3996856/tmp/work/qemuarm64-poky-linux/u-boot/202=
5.10/recipe-sysroot-native=3D  -E -Wall -Werror=3Dstrict-prototypes -Wno-tr=
igraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Di=
mplicit-function-declaration -Werror=3Dimplicit-int -Wno-format-security -s=
td=3Dgnu11  -ffreestanding -fno-builtin -fno-delete-null-pointer-checks -Wn=
o-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-int-in-boo=
l-context -Wno-address-of-packed-member -O2 -fno-stack-protector -fno-delet=
e-null-pointer-checks -Wno-zero-length-bounds -Wno-array-bounds -Wno-string=
op-overflow -Wno-maybe-uninitialized -fmacro-prefix-map=3D/srv/pokybuild/yo=
cto-worker/oe-selftest-armhost/build/build-st-3996856/tmp/work/qemuarm64-po=
ky-linux/u-boot/2025.10/sources/u-boot-2025.10/=3D -gdwarf-4 -fstack-usage =
-Wno-format-nonliteral -Wno-address-of-packed-member -Wno-unused-but-set-va=
riable -Wno-unused-but-set-variable -Werror=3Ddate-time -Wno-packed-not-ali=
gned -Wno-pointer-sign -Wno-stringop-truncation -fno-strict-overflow -D__KE=
RNEL__ -D__UBOOT__ -fomit-frame-pointer  -fno-toplevel-reorder -fno-dwarf2-=
cfi-asm -fpic -fno-common -march=3Dcore2 -m64 -D__x86_64__ -fdata-sections =
-ffunction-sections -fvisibility=3Dhidden -pipe -Iinclude  -I/srv/pokybuild=
/yocto-worker/oe-selftest-armhost/build/build-st-3996856/tmp/work/qemuarm64=
-poky-linux/u-boot/2025.10/sources/u-boot-2025.10/include -I/srv/pokybuild/=
yocto-worker/oe-selftest-armhost/build/build-st-3996856/tmp/work/qemuarm64-=
poky-linux/u-boot/2025.10/sources/u-boot-2025.10/arch/x86/include -include =
/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3996856/tmp/=
work/qemuarm64-poky-linux/u-boot/2025.10/sources/u-boot-2025.10/include/lin=
ux/kconfig.h -nostdinc -isystem /srv/pokybuild/yocto-worker/oe-selftest-arm=
host/build/build-st-3996856/tmp/work/qemuarm64-poky-linux/u-boot/2025.10/re=
cipe-sysroot-native/usr/bin/aarch64-poky-linux/../../lib/aarch64-poky-linux=
/gcc/aarch64-poky-linux/15.2.0/include -DCONFIG_XPL_BUILD -DCONFIG_SPL_BUIL=
D -DDO_DEPS_ONLY -dM include/config.h > spl/u-boot.cfg.tmp && { grep 'defin=
e CONFIG_' spl/u-boot.cfg.tmp | sed '/define CONFIG_IS_ENABLED(/d;/define C=
ONFIG_IF_ENABLED_INT(/d;/define CONFIG_VAL(/d;' > spl/u-boot.cfg; rm spl/u-=
boot.cfg.tmp; } || { rm spl/u-boot.cfg.tmp; false; }
| aarch64-poky-linux-gcc: error: unrecognized command-line option '-m64'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2854

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


