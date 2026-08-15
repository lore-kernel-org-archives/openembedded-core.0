Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47024C5AD5A
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 16:14:42 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11531.1786810474413269965
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2026 09:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=I91/+aQ1;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 84EEA4E41246
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 16:14:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 48893604AA;
	Sat, 15 Aug 2026 16:14:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 765E711C4F5C8;
	Sat, 15 Aug 2026 18:14:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786810467; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z5eoYNdLSRy3rHw/JQpOtjuoUHICE9oMqCukCNutIyM=;
	b=I91/+aQ1GXbcCsqNAddTBgaGDddXs0FLpxOoLGrI4G11mtkACNqCv2wauoZaNv2kdPYfMz
	sZBlTbS9h7okmqqewRnPTsEcICmfs0TOjR7pk+e328n0rz/+XWlhj0Ypa3/4fEwVCaL+cE
	arHU8ePqGCpPONi3pT+J3Blq9fumGlHL05YcMzCy+yKLVDPK/9FPhG1MU++7Fo5s5ghcyV
	zMbS0Tlio6A6DvdoVmBUjWqDg66eFfYTdn7pZi3A9kR8H6j7xKTELhg2jnJvZBUQyQ84Rn
	im6cad4ObheUeng9zx7AhziaEkFgHicGMEad1XfxEtwLKKRVTLFU6WDm3D9o0w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Aug 2026 18:14:27 +0200
Message-Id: <DKPNG4NBJKCG.O5K89WEL6F3D@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 6/7] u-boot-tools: fix build with OpenSSL 4.0
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
 <20260814051829.35088-7-jaipaul.cheernam@est.tech>
In-Reply-To: <20260814051829.35088-7-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 16:14:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243496

On Fri Aug 14, 2026 at 7:18 AM CEST, Jaipaul Cheernam wrote:
> OpenSSL 4.0 removed the ENGINE API entirely. u-boot-tools uses
> ENGINE_get_id, ENGINE_load_public_key, ENGINE_finish, ENGINE_free
> in lib/rsa/rsa-sign.c which causes link failures.
>
> Backport the Provider API support patch from upstream u-boot which
> adds OpenSSL Provider support while maintaining backward compatibility
> with older OpenSSL versions that still have ENGINE.
>
> Upstream-Status: Backport [https://github.com/u-boot/u-boot/pull/918]
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

I know this is just an RFC, but I tried a build on the autobuilder: it
looks like more changes are needed to fix u-boot builds. Maybe only for
riscv64 platforms:

ERROR: u-boot-1_2026.07-r0 do_compile: Execution of '/srv/pokybuild/yocto-w=
orker/qemuriscv64/build/build/tmp/work/qemuriscv64-poky-linux/u-boot/2026.0=
7/temp/run.do_compile.3905853' failed with exit code 1
...
| rsa-sign.c:(.text+0xb): undefined reference to `ENGINE_load_builtin_engin=
es'
| /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:=
 rsa-sign.c:(.text+0x13): undefined reference to `ENGINE_by_id'
| /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:=
 rsa-sign.c:(.text+0x27): undefined reference to `ENGINE_init'
| /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:=
 rsa-sign.c:(.text+0x33): undefined reference to `ENGINE_set_default_RSA'
| /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:=
 rsa-sign.c:(.text+0x58): undefined reference to `ENGINE_ctrl_cmd_string'
| /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:=
 rsa-sign.c:(.text+0x8f): undefined reference to `ENGINE_free'
| /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:=
 rsa-sign.c:(.text+0xbf): undefined reference to `ENGINE_finish'
| /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:=
 tools/generated/lib/rsa/rsa-sign.o: in function `rsa_engine_get_priv_key':
| rsa-sign.c:(.text+0x274): undefined reference to `ENGINE_get_id'
...
| collect2: error: ld returned 1 exit status
...


https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/2124
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2173

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


