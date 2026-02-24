Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0D7E9B245
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 09:44:19 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16746.1771926253272931525
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 01:44:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YrBqf7wr;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A80CE4E4107E
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 09:44:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D89B5FD9D;
	Tue, 24 Feb 2026 09:44:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 326AA10368F17;
	Tue, 24 Feb 2026 10:44:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771926251; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mig6he7/FUA+ptPyz3Qq4HxFHjIVtmY73K1Z+05/oTI=;
	b=YrBqf7wrmA1fRd5JGpyBaeVQjIQKksjU92mgjH9No+mEdwEtj/ZYRlTw+CqodUQeNkO0uN
	Sa1y9gvGAGZD9qkeK09juH4haIhk0/SYefZgWvF9toRX+puQWrH3XwRXfdgf9mqWVCwyCC
	Aaz5ckKd0DxeJ26hIAbs7/6lXBi/U3c06VdsRzd3L2c64KTHbdkhwvyGsrVHA1SewuXgG7
	mSRMf8ZWtm/hxNjyZMNgOVchJyHqVdH3joSWwhep8Ja/7uQtENzQuB1mtXWvEkLRcuU1gE
	WFylMPZemPVj3gjqZ1SHHEQvdBE4VQSNUi6MvBahj/x2r5c4OeepMhUeMXvEow==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 10:44:08 +0100
Message-Id: <DGN3FKTFTU3F.11M037GAZMI07@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <SunilKumar.Dora@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V3] gdb: Upgrade 16.3 -> 17.1
Cc: <sunilkumar.dora@windriver.com>, <Sundeep.Kokkonda@windriver.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260223115033.18066-1-sunilkumar.dora@windriver.com>
In-Reply-To: <20260223115033.18066-1-sunilkumar.dora@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 09:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231754

On Mon Feb 23, 2026 at 12:50 PM CET, Sunil Kumar via lists.openembedded.org=
 Dora wrote:
> From: Sunil Dora <sunilkumar.dora@windriver.com>
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
> Added   0009-PR-gdb-33747-gdb-ser-unix-Avoid-musl-build-failure-w.patch
>
> Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> Co-authored-by: Sundeep Kokkonda <Sundeep.Kokkonda@windriver.com>
> ---

Hi Sunil,

Thanks for the new version.

It looks like we still have a musl issue, but specifically while
building for qemuarm64 machine:

ERROR: gdb-17.1-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/mu=
sl-qemuarm64/build/build/tmp/work/cortexa57-poky-linux-musl/gdb/17.1/temp/r=
un.do_compile.2065169' failed with exit code 1
...
| In file included from ../../sources/gdb-17.1/gdbserver/linux-aarch64-low.=
cc:42:
| ../../sources/gdb-17.1/gdbserver/../gdb/arch/aarch64-gcs-linux.h:35:8: er=
ror: redefinition of 'struct user_gcs'
|    35 | struct user_gcs
|       |        ^~~~~~~~
| In file included from ../../sources/gdb-17.1/gdbserver/linux-aarch64-low.=
cc:35:
| /srv/pokybuild/yocto-worker/musl-qemuarm64/build/build/tmp/work/cortexa57=
-poky-linux-musl/gdb/17.1/recipe-sysroot/usr/include/asm/ptrace.h:329:8: no=
te: previous definition of 'struct user_gcs'
|   329 | struct user_gcs {
|       |        ^~~~~~~~

https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/1970

Can you have a look at it?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


