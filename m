Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC594C43327
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 09:55:19 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65864.1782986111331874753
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 02:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0EK7fvNZ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0F95F1A0DE1;
	Thu,  2 Jul 2026 09:55:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D6D4D5FF03;
	Thu,  2 Jul 2026 09:55:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3B2C104C9616;
	Thu,  2 Jul 2026 11:54:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782986104; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RE9dAAw0yMKQilziYhRonEL1KmN1wQyNxciIYUbdGTE=;
	b=0EK7fvNZDVaETVfyS42mmbb6V/IFEGgnHQ1E/wp5T0vX1dWFk/eva10/jPyzxCa3OxBxel
	ZHeZgsRU6+bBu0a9h8TZYfMnXchqD7qARhb6DyP7P2BNfP68Hfu/82MAU3B/NT5buycWfO
	CKBxSjMDuPOxKoqxQ7N5eerpFI7aP6dpVNCvpEAjRrr6Lv7dpeEmK3Vd914lbLCHWV0QVu
	Nj+wkRRgmovKOEb6vPLKVrCYVOkgbHZyBbgmQvWTDG+NJnnBWb+WxzL+rpo2yFy5fuvVqr
	XHQFmUlLIFfZ8/zshVwnoQX7l4tGVkQ9SzPR/pA4tmf63S3fgF9zBiciORjKMA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 11:54:56 +0200
Message-Id: <DJNZTL96C89O.1S6YFZXO1KCJI@bootlin.com>
Cc: "qi.chen@windriver.com" <qi.chen@windriver.com>,
 "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
 "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, "Ross.Burton@arm.com"
 <Ross.Burton@arm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Daniel Turull" <daniel.turull@ericsson.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 0/3] systemd: update to 261 and be compatible with
 rhel8
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260630115028.4001775-1-daniel.turull@ericsson.com>
 <DJNY5PFZT70X.2O5P68RPD0PJU@bootlin.com>
 <afbb3cf90ff55c3b4e693b8a28a6903b7f34f946.camel@ericsson.com>
In-Reply-To: <afbb3cf90ff55c3b4e693b8a28a6903b7f34f946.camel@ericsson.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 09:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240030

On Thu Jul 2, 2026 at 10:58 AM CEST, Daniel Turull wrote:
> On Thu, 2026-07-02 at 10:36 +0200, Mathieu Dubois-Briand wrote:
>>=20
>> Hi Daniel,
>>=20
>> Thanks for the new version.
>>=20
>> I just note we have some intermittent failure. So far I only saw that
>> on
>> debian11 workers, so maybe it is related to the host distro.
>>=20
>> ERROR: systemd-hwdb-native-261-r0 do_compile: Execution of
>> '/srv/pokybuild/yocto-worker/meta-virt/build/build/tmp/work/x86_64-
>> linux/systemd-hwdb-native/261/temp/run.do_compile.3747249' failed
>> with exit code 1
>> ...
>> > ../sources/systemd-hwdb-261/src/libc/mount.c: In function
>> > =E2=80=98mount_setattr_shim=E2=80=99:
>> > ../sources/systemd-hwdb-261/src/libc/libc-shim.h:71:32: error:
>> > =E2=80=98__NR_mount_setattr=E2=80=99 undeclared (first use in this fun=
ction); did
>> > you mean =E2=80=98mount_setattr=E2=80=99?
>> > =C2=A0=C2=A0=C2=A0 71 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return syscall(__NR_##f=
unc,
>> > _SHIM_NAME(__VA_ARGS__));=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ^~~~~
>> > ../sources/systemd-hwdb-261/src/libc/mount.c:35:1: note: in
>> > expansion of macro =E2=80=98DEFINE_SYSCALL_SHIM=E2=80=99
>> > =C2=A0=C2=A0=C2=A0 35 | DEFINE_SYSCALL_SHIM(mount_setattr, int,
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^~~~~~~~~~~~~~~~~~~
>> > ../sources/systemd-hwdb-261/src/libc/libc-shim.h:71:32: note: each
>> > undeclared identifier is reported only once for each function it
>> > appears in
>> > =C2=A0=C2=A0=C2=A0 71 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return syscall(__NR_##f=
unc,
>> > _SHIM_NAME(__VA_ARGS__));=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ^~~~~
>> > ../sources/systemd-hwdb-261/src/libc/mount.c:35:1: note: in
>> > expansion of macro =E2=80=98DEFINE_SYSCALL_SHIM=E2=80=99
>> > =C2=A0=C2=A0=C2=A0 35 | DEFINE_SYSCALL_SHIM(mount_setattr, int,
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^~~~~~~~~~~~~~~~~~~
>> > ../sources/systemd-hwdb-261/src/libc/libc-shim.h:72:9: error:
>> > control reaches end of non-void function [-Werror=3Dreturn-type]
>> > =C2=A0=C2=A0=C2=A0 72 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ^
>> > ../sources/systemd-hwdb-261/src/libc/mount.c:35:1: note: in
>> > expansion of macro =E2=80=98DEFINE_SYSCALL_SHIM=E2=80=99
>> > =C2=A0=C2=A0=C2=A0 35 | DEFINE_SYSCALL_SHIM(mount_setattr, int,
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^~~~~~~~~~~~~~~~~~~
>> > cc1: some warnings being treated as errors
>>=20
>>=20
>>=20
>
> did v2 work? I saw it was in master-next.
>
> The only difference between v3 and v2 is the meson wrapper and it
> should not affect.
>
> Daniel

I suspect we had the same issue with v2, we just have been a bit
(un)lucky as it never ran on a Debian 11 worker.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


