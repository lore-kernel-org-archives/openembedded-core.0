Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3883C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 08:33:54 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26945.1785141226903790527
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 01:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EhPrEOZD;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 872784E40F92;
	Mon, 27 Jul 2026 08:33:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B5EB601BE;
	Mon, 27 Jul 2026 08:33:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D898811C12284;
	Mon, 27 Jul 2026 10:33:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785141220; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q60QqLOZ3MwnWb8SebEj951RwpJXBuvu+w51a8PijE8=;
	b=EhPrEOZDtxXNn6+GItGr4UJQQ3zM1MVilIi3sB3ERIZaQw/iNwG4U9Rgv4oMsQ1e1lZCM2
	QbhT577fwxpa+AVVeuUIUgE/PwByAAMziQSdL4Q30EXZNt2DAeaai3JgNw0CZgPjh130it
	IpRtwIjFKMamRdGFAgjk3qs+7vwMP6GhqLjk9qzMxsjTN7VI34sh1DaZJ5iaR4gl4clVE4
	nXFAZORI7f91quOiJfZmbQGXpvvXhJf2C56fxl9bTmOUzKxq9z4sHmtM01u09r7G1jwcDR
	ZYxn9+flKRm6+1soHV9uRVefur1yBy1Gt2dGQQ0E3KWrCWJbodlvpE3T32OVcQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 10:33:38 +0200
Message-Id: <DK97QYBOHP4D.29G0X20PRL3MF@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/3] kernel-fit-image: reintroduce option to
 replace kernel image
Cc: <oss@ew.tq-group.com>, <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260723124944.69070-1-nora.schiffer@ew.tq-group.com>
 <20260723124944.69070-3-nora.schiffer@ew.tq-group.com>
 <DK7O7LEQJGUL.2565TJL3V1PLS@bootlin.com>
 <69f7557723a0141ed957ffe24aba08cd3065f60f.camel@ew.tq-group.com>
In-Reply-To: <69f7557723a0141ed957ffe24aba08cd3065f60f.camel@ew.tq-group.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 08:33:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242062

On Mon Jul 27, 2026 at 10:03 AM CEST, Nora Schiffer wrote:
> On Sat, 2026-07-25 at 15:02 +0200, Mathieu Dubois-Briand wrote:
>> On Thu Jul 23, 2026 at 2:49 PM CEST, Nora Schiffer via lists.openembedde=
d.org wrote:
>> > A similar feature was added in commit 9c8ef2119949 ("kernel-fit-image:
>> > control kernel section with FIT_LINUX_BIN") and subsequently reverted =
in
>> > commit 6eae261b6f52 ("Revert "kernel-fit-image: control kernel section
>> > with FIT_LINUX_BIN"") due to its incomplete implementation and lack of
>> > tests. Reintroduce an improved version:
>> >=20
>> > - The FIT_LINUX_BIN variable (which had been left unused) is renamed t=
o
>> >   FIT_KERNEL_FILENAME. It can now actually be used to select a differe=
nt
>> >   file from DEPLOY_DIR_IMAGE. The file will be compressed using
>> >   FIT_KERNEL_COMP_ALG as part of the FIT image recipe, rather than tha=
n
>> >   letting the kernel recipe handle this through
>> >   kernel-fit-extra-artifacts.bbclass.
>> > - Alternatively, FIT_KERNEL_FILENAME_COMPRESSED can be used to select =
a
>> >   pre-compressed file from DEPLOY_DIR_IMAGE. In this case,
>> >   FIT_KERNEL_COMP_ALG only controls the "compression" field of the
>> >   generated FIT image.
>> > - To preserve backwards compatibility, FIT_KERNEL_FILENAME_COMPRESSED
>> >   defaults to "linux.bin". As a special case, the compression algorith=
m
>> >   will be read from "linux_comp" for linux.bin. This behavior is
>> >   considered deprecated and relying on it results in a warning.
>> > - Add tests.
>> >=20
>> > To resolve the new deprecation warning, it is usually sufficient to se=
t
>> > KERNEL_IMAGETYPE to the desired type ("Image" on many archs) and set
>> > FIT_KERNEL_FILENAME to the same value.
>> >=20
>> > Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
>> > ---
>>=20
>> Hi Nora,
>>=20
>> Thanks for your patch.
>>=20
>> It looks like the test_fit_image_kernel_filename selftest is failing on
>> arm hosts:
>
> Hi Mathieu,
>
> I believe I know how to fix this, but it is unclear to me what exact
> configuration is built here. Is there any way I can replicate the same
> autobuilder configuration, so I can run the tests myself before submittin=
g v2?
>
> Best,
> Nora
>

Hi Nora,

In addition to Yoann reply, keep in mind this is showing on arm host
machine and not on the x86 ones. So it might be a bit tricky to
reproduce.

If you fail to reproduce it locally but want to test some particular
change, please tell me, I can launch a build for that.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


