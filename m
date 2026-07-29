Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B4F3C53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 04:56:30 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4545.1785300979850831167
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 21:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=g8Ocn36Z;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 746A24E40FD1
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 04:56:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 401016039A;
	Wed, 29 Jul 2026 04:56:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ECA4611C14901;
	Wed, 29 Jul 2026 06:56:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785300976; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Gd/br78NwFFH5VFkw9Yej581KOc7aZBHI264DnelZaE=;
	b=g8Ocn36ZqAJT9lyAFy5LYDHzIfb2ldM9Sw16Hgwuy0NCcjAIeKetl2CbvTcsrB7DM8ei3k
	KWI12V/5Aa4KoZ8hPvSB5iwk1DQ8S6mtZ05AanPavzT0g3yoDi+kFHMGRjzEb8fIYujZF5
	e8L0eqpO6BbnR2OP7O4m9/62Ay/DD/YLpk88mBhmcRzPb883lzgu/m1P9+KxAG01Vhldy0
	yijY/xwgr9FYg+4f9mB/45tayjZQXNYRL0Y+JVG/08a89H8TP8ZDX51qy5i9s6YYpdl0Av
	Q45wRATc4MeRxCkjNaXZ87e2hatOin4VqAWdxeJYElLYMPCN/ZjLq+iDo7gomQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jul 2026 06:56:13 +0200
Message-Id: <DKASDKR2N2G5.1R4ZYL1X4YO0C@bootlin.com>
Subject: Re: [OE-core] [PATCH] glibc: Upgrade to 2.44 release
Cc: "Khem Raj" <khem.raj@oss.qualcomm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260728072602.3269425-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20260728072602.3269425-1-khem.raj@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 04:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242231

On Tue Jul 28, 2026 at 9:26 AM CEST, Khem Raj via lists.openembedded.org wr=
ote:
> Release highlights [1]:
>
> * System-wide tunables can be applied using /etc/tunables.conf and
>   running ldconfig.
> * New glibc.elf.thp tunable to map read-only segments with Transparent
>   Huge Pages; THP page size in malloc is now capped to MAX_THP_PAGESIZE.
> * Additional correctly rounded math functions (cosh, sinh, tanh) imported
>   from the CORE-MATH project.
> * Static PIE is now supported for arm-*-linux-gnueabi.
> * On AArch64, all GCS operations are locked after enabling GCS with an
>   ENFORCED or OVERRIDE policy, and more SVE/AdvSIMD special cases are
>   vectorized.
> * On RISC-V, vector extension optimized variants of memcmp, memcpy,
>   memmove, strcmp, strcpy, strlen and others have been added.
> * On PowerPC, memchr optimized for Power10 has been re-added.
> * Support for LoongArch32 has been added.
> * Pre-built ld.so.cache files can be installed with ldconfig.
> * New locale hrx_BR (Hunsrik as spoken in Brazil).
>
> Upstream changes affecting compatibility:
>
> * The --enable-memory-tagging configure option, and the AArch64 specific
>   functionality it gated, have been removed. Drop the corresponding
>   memory-tagging PACKAGECONFIG, it would now be an unrecognized option.
> * The --enable-static-nss configure option has been removed, it was not
>   used here.
> * The s390-linux-gnu (31bit) configuration is no longer supported.
>
> Recipe metadata changes:
>
> * Change 0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-SDK.pat=
ch,
>   it is adjusted for open_path() now sizing its candidate
>   path buffer via dl_scratch_buffer instead of alloca. The pre-pass that
>   computes the real max_dirnamelen is kept ahead of that allocation, so
>   print_search_path()'s new buffer precondition stays satisfied too.
> * Drop 0023-CVE-2026-5450.patch and CVE_STATUS_STABLE_BACKPORTS, already
>   in 2.44
> * Drop the PR/HASHEQUIV_HASH_VERSION bump as its comment instructs.
>
> Tested on qemux86-64
>
> [1] https://sourceware.org/pipermail/libc-alpha/2026-July/179159.html
>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---

Hi Khem,

Thanks for the upgrade. I can see two failures here: I believe the first
one is expected, but not the second one.

So first, buildtools builder is failing with:
ERROR: Failed to spawn fakeroot worker to run /srv/pokybuild/yocto-worker/b=
uildtools/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-hea=
ders/linux-libc-headers_6.18.bb:do_install: [Errno 32] Broken pipe

https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/4256
I believe this is just because we need to rebuild uninative on glibc
upgrade.


The second issue is a ptest failure:
Failed ptests:
{'m4': 'START: ptest-runner\n'
...
       'EAGAIN =3D=3D EWOULDBLOCK =3D=3D 11\n'
       'ENOTSUP =3D=3D EOPNOTSUPP =3D=3D 95\n'
       'PASS: test-errno-h\n'
       'PASS: test-error.sh\n'
       'test-execute-main: test-execute-child subprocess failed: No such fi=
le '
       'or directory\n'
       'Timeout! System state:\n'
       'Collected system state:\n'
       '+ dmesg\n'
...
       'ERROR: Exited from signal Killed (9)\n'
       'DURATION: 451\n'}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4138
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4123
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2009
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4128

Can you have a look at that last issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


