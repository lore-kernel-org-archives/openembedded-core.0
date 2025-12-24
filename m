Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D355E7542B
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:12:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.117676.1766567532842546019
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:12:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Y2VAyKzE;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 82547C1A59E;
	Wed, 24 Dec 2025 09:11:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A6BA76073D;
	Wed, 24 Dec 2025 09:12:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 754D610AB1016;
	Wed, 24 Dec 2025 10:12:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766567530; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RP50s3YrzoyxG7kV7NDo2X5fIrLD4K4TIdxpgEdSVK8=;
	b=Y2VAyKzEXGYc1Mdr2niTI+iSk7CvLsLLovPKfvEnJfz26AJLXdUm6M2+KVNbAJ605u2cU/
	fGC9Be/TJEDnBuTKs9cIhbLeebaaDadbDELUBUC0Bz6VpcXSV2WHSeBvHfjfQjqd7gOidN
	005X84QI+51bo+veji/oPhf1oyh1W4J3xrjD6Jsjj2qasw3VsnAY35cUhny3goBAVRenXs
	us/z76YBwonTgA8ilHdDYE1MDpucP9LM+0NznblWmNlHQKRKOgmgGv2YMhoITJ2t0uGnbt
	pTNk3iTLeA3g8rXM/gTNQZx4CePln/AqVnFc5Hm/4YMVtbDZibo/AS96a4MEBg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Dec 2025 10:12:04 +0100
Message-Id: <DF6BX97B9AVC.XYGAZDNN5E39@bootlin.com>
Subject: Re: [OE-core] [PATCH V2] gdb: Upgrade 16.3 -> 17.1
Cc: <randy.macleod@windriver.com>, <raj.khem@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <sundeep.kokkonda@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251223094411.2919323-1-sundeep.kokkonda@windriver.com>
In-Reply-To: <20251223094411.2919323-1-sundeep.kokkonda@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 09:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228526

On Tue Dec 23, 2025 at 10:44 AM CET, Sundeep KOKKONDA via lists.openembedde=
d.org wrote:
> From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>
> GDB 17.1 includes the following changes and enhancements:
> https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dblob_plain=
;f=3Dgdb/NEWS;hb=3Dgdb-17.1-release
>
>  * x86-64 CET shadow stack support
>  * Debugging Linux programs that use AArch64 Guarded Control Stacks
>  * GDB record feature now supports rv64gc architectures
>  * 'info threads' command support for two new options '-stopped' and '-ru=
nning'
>     to limit the list of displayed threads.
>  * On Linux and FreeBSD, the addresses shown by the 'info sharedlibrary' =
command
>    are now for the full memory range allocated to the shared library.
>  * Linux checkpoints now work with multiple inferiors
>  * Improved linker namespace support
>  * Warnings and error messages now start with an emoji (warning sign,
>    or cross mark) if supported by the host charset. Configurable.
>  * Built-in support for TLS on Linux as backup when libthread_db is not
>    available. Supported on the x86_64, aarch64, ppc64, s390x, and riscv
>    architectures, when compiled with GLIBC or MUSL.
>  * New command "set riscv numeric-register-names" to display risc-v
>    registers using their numeric names instead of their ABI names.
>  * The Alpha target now supports target descriptions.
>  * Python API enhancements
>  * Support for Python versions older than 3.4 has been removed.
>
> Dropped 0009-Readline-8.3-alpha-release.patch
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> ---

Hi Sundeep,

Thanks for your patch.

It looks like this is breaking builds with musl:

ERROR: gdb-17.1-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/mu=
sl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/gdb/17.1/temp/=
run.do_compile.4040458' failed with exit code 1
...
| ../../sources/gdb-17.1/gdb/ser-unix.c: In function 'void set_custom_baudr=
ate_linux(int, int)':
| ../../sources/gdb-17.1/gdb/ser-unix.c:532:7: error: 'struct termios' has =
no member named 'c_ospeed'; did you mean '__c_ospeed'?
|   532 |   tio.c_ospeed =3D rate;
|       |       ^~~~~~~~
|       |       __c_ospeed

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/2974
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2939

Can you have a look at this?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


