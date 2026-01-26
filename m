Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667E2C88E6B
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 07:54:45 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14859.1769414076038895144
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 23:54:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aJDrhPkD;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 76E40C225BA
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 07:54:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E6C7F60717;
	Mon, 26 Jan 2026 07:54:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8AAC4119A83F1;
	Mon, 26 Jan 2026 08:54:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769414073; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9rOEV7Jx81mJHeFnVIeJqoji5E+9wuPBNW3ZB5trANM=;
	b=aJDrhPkDLdFPFyajgpl6RTi7xdeQLKb2/stCbQvkrWfe69DCBqnpvQzBocVl7zIsriyMbN
	b38FfqoZpMCwXcRKa09/nYfIQjSu6zoP3rP7GOZgXu3WYtMuawNjaB1E1MTQ03wm34N9ni
	2dxxiJwXB7Sp6eaIblpFN4lvMzuAgJknhw/murBlsBw8qarg2mQ4jpPzhx7RwC47HPFv4K
	rpIEqouqnYWBmlvOnl0E72aonhFJHTIq4TGqSSLQ2In5nBHeYe9Av2Svxsuvy1/8ytXpGY
	vcm3XPhzI2NZfsCgDrgs5v8VLU9U3FNbuYEn+0RkV/s8m6ZwreeEGw5CnXeFCQ==
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 08:54:27 +0100
Message-Id: <DFYCXSVMAPCN.R3OW6N5BF8ZJ@bootlin.com>
To: <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 00/16] Enable rust support for linux kernel
Cc: "MacLeod, Randy" <Randy.MacLeod@windriver.com>, "Kokkonda, Sundeep"
 <sundeep.kokkonda@windriver.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
 <843161.1768934499700757613@lists.openembedded.org>
 <DFUD78TMO2O0.1WB04Y9FC5LNH@bootlin.com>
 <ee399b5a-f8ca-453c-a451-c646766b61c8@windriver.com>
 <DFV6QL85IOND.261RTUSIWUPHO@bootlin.com>
In-Reply-To: <DFV6QL85IOND.261RTUSIWUPHO@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 07:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229969

Hi,

On Thu Jan 22, 2026 at 3:24 PM CET, Antonin Godard via lists.openembedded.o=
rg wrote:
[...]
>> Thanks for reporting this.
>> The error indicates that the linker is unable to locate libm.so.6 and=20
>> libmvec.so.6 in the recipe sysroot.
>> These libraries are normally provided by glibc, and this issue does not=
=20
>> appear to be caused by our patches, as we are not able to reproduce it=
=20
>> locally.
>> Could you please re-test the series once more to confirm?
>>
>> Thanks,
>> Harish
>
> Ok, thanks for testing again on your side. It may have been related to an=
other
> commit on my branch as I'm not facing the issues again. I'll re-add the s=
eries
> to my branch - sorry for the false alarm!

Sorry, but after starting an a-full run with your series again, I started
getting the same errors again:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3110

I've launched an a-full build with the same branches minus your series and =
I
don't see the errors anymore:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3115

You can compare the branches used for the two builds by comparing:

https://git.yoctoproject.org/poky-ci-archive/log/?h=3Doecore/autobuilder.yo=
ctoproject.org/valkyrie/a-full-3110
https://git.yoctoproject.org/poky-ci-archive/log/?h=3Dbitbake/autobuilder.y=
octoproject.org/valkyrie/a-full-3110
https://git.yoctoproject.org/poky-ci-archive/log/?h=3Dmeta-yocto/autobuilde=
r.yoctoproject.org/valkyrie/a-full-3110

vs.

https://git.yoctoproject.org/poky-ci-archive/log/?h=3Doecore/autobuilder.yo=
ctoproject.org/valkyrie/a-full-3115
https://git.yoctoproject.org/poky-ci-archive/log/?h=3Dbitbake/autobuilder.y=
octoproject.org/valkyrie/a-full-3115
https://git.yoctoproject.org/poky-ci-archive/log/?h=3Dmeta-yocto/autobuilde=
r.yoctoproject.org/valkyrie/a-full-3115

Maybe your build uses some shared state which is why your builds pass?

You can base off your test builds against my a-full-3110 branches above, th=
at
may help.

Regards,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


