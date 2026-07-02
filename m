Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE56C43327
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 08:36:54 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64961.1782981410086648079
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 01:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=te08i7pM;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DBFFAC4FED4;
	Thu,  2 Jul 2026 08:36:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 825255FF03;
	Thu,  2 Jul 2026 08:36:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C64AC104C960E;
	Thu,  2 Jul 2026 10:36:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782981407; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=09E5t2lqnKeG/3jRKIsBoctnUcM31cmAjWrWPJiV9Sw=;
	b=te08i7pMkdcXThp5O4Abm3wAYYeTPoj/kGPgGlq33jcuOb6xdAReFDWOnklO813TZnV3Za
	kakjtQ9DmMSv3xTYuuzW2NIqHzcE1n7HIeD/IuXO9Z+Us6dhyLEn9w9ZEXCQFnDzlLR/AZ
	vZIHdIo6q8JM36ZD98rpJQxaorwVGcjCQnt3pHnrxTjD+rm1SvjVHxjmK2QVDVHZWhUIGw
	t9U5+yBYC6aVZvjbBI2c2AwssmOPnxz/3NabIIQirpR/c0vUBbLVXUh5l71PVrwuubGOW8
	rCkIXlYg2okn0OQhBaxc+FrPSMH5kPa6vZsIYarE2JCIdxqjhPAnkoNH63WG8w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 10:36:44 +0200
Message-Id: <DJNY5PFZT70X.2O5P68RPD0PJU@bootlin.com>
Subject: Re: [PATCH v3 0/3] systemd: update to 261 and be compatible with
 rhel8
Cc: <qi.chen@windriver.com>, <alex.kanavin@gmail.com>,
 <richard.purdie@linuxfoundation.org>, <Ross.Burton@arm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260630115028.4001775-1-daniel.turull@ericsson.com>
In-Reply-To: <20260630115028.4001775-1-daniel.turull@ericsson.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 08:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240024

On Tue Jun 30, 2026 at 1:50 PM CEST, daniel.turull wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> systemd increases the dependency on the host kernel,
> which breaks builds with rhel 8
>
> This series add native patches in the systemd tools
> to make it work.
>
> v2:
>  - re-add tag verification in SRC_URI
> v3:
>  - rebase on top of Ross Burton meson patches. if not needed keep v2
>  - re-tested
>  See https://patchwork.yoctoproject.org/project/oe-core/patch/20260629141=
559.1305873-1-ross.burton@arm.com/
>
> Tested on rhel8.10 with testsuite systemd on qemux86-64

Hi Daniel,

Thanks for the new version.

I just note we have some intermittent failure. So far I only saw that on
debian11 workers, so maybe it is related to the host distro.

ERROR: systemd-hwdb-native-261-r0 do_compile: Execution of '/srv/pokybuild/=
yocto-worker/meta-virt/build/build/tmp/work/x86_64-linux/systemd-hwdb-nativ=
e/261/temp/run.do_compile.3747249' failed with exit code 1
...
| ../sources/systemd-hwdb-261/src/libc/mount.c: In function =E2=80=98mount_=
setattr_shim=E2=80=99:
| ../sources/systemd-hwdb-261/src/libc/libc-shim.h:71:32: error: =E2=80=98_=
_NR_mount_setattr=E2=80=99 undeclared (first use in this function); did you=
 mean =E2=80=98mount_setattr=E2=80=99?
|    71 |                 return syscall(__NR_##func, _SHIM_NAME(__VA_ARGS_=
_));                                \
|       |                                ^~~~~
| ../sources/systemd-hwdb-261/src/libc/mount.c:35:1: note: in expansion of =
macro =E2=80=98DEFINE_SYSCALL_SHIM=E2=80=99
|    35 | DEFINE_SYSCALL_SHIM(mount_setattr, int,
|       | ^~~~~~~~~~~~~~~~~~~
| ../sources/systemd-hwdb-261/src/libc/libc-shim.h:71:32: note: each undecl=
ared identifier is reported only once for each function it appears in
|    71 |                 return syscall(__NR_##func, _SHIM_NAME(__VA_ARGS_=
_));                                \
|       |                                ^~~~~
| ../sources/systemd-hwdb-261/src/libc/mount.c:35:1: note: in expansion of =
macro =E2=80=98DEFINE_SYSCALL_SHIM=E2=80=99
|    35 | DEFINE_SYSCALL_SHIM(mount_setattr, int,
|       | ^~~~~~~~~~~~~~~~~~~
| ../sources/systemd-hwdb-261/src/libc/libc-shim.h:72:9: error: control rea=
ches end of non-void function [-Werror=3Dreturn-type]
|    72 |         }
|       |         ^
| ../sources/systemd-hwdb-261/src/libc/mount.c:35:1: note: in expansion of =
macro =E2=80=98DEFINE_SYSCALL_SHIM=E2=80=99
|    35 | DEFINE_SYSCALL_SHIM(mount_setattr, int,
|       | ^~~~~~~~~~~~~~~~~~~
| cc1: some warnings being treated as errors

https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/3878
https://autobuilder.yoctoproject.org/valkyrie/#/builders/93/builds/4029

I don't have more details right now, so I just want to note this so it
is known before we merge the series.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


