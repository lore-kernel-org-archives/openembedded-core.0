Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF13DE6748D
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 08:21:29 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76622.1766391688375000140
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 00:21:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=v83jtYMF;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2623A4E41D2E
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 08:21:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D6466606C1;
	Mon, 22 Dec 2025 08:21:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 288EE10371166;
	Mon, 22 Dec 2025 09:21:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766391681; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pksHIGwVy0hQyPSmaPcFC/H48EO5yzDYBQDOVNaQ0EU=;
	b=v83jtYMFqY5Ql3eQHZRRbsWSyfXXq8dAsatXpFgVg0Q4TqaZfIKrWC5HB/7pJtrKt7vZ04
	03htWRh+Bq0Lqnb3FDkZFxrKgzIWXD2j8cb6MWb9o2e+vE0PqCSzsc6oxgMbfLQOvNGf0/
	J/+pllqgufkC1RUUqXHXDkaLJXCaa0zNMOmdVjAD/nAj8X3VIqlORqnT1JK1rZCvrohvzg
	kKIWdBEQj4unXsffm7EpZne4EInqTFKtPX3+iXsXEJlLLwc8ceLhwot1MJnGiWoEQmlVXe
	WSN8PU8o5ZTXBQ2HKAC5WwBCmDUhKj3XgQfOpgUwgB1oI1rMVHM1BdwYm/LBlA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 09:21:18 +0100
Message-Id: <DF4LLAR0AM9L.1NMHO4TTMJ27O@bootlin.com>
Subject: Re: [OE-core] [PATCH] systemtap: upgrade 5.3 -> 5.4
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <victor.kamensky7@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251221072824.3981-1-victor.kamensky7@gmail.com>
In-Reply-To: <20251221072824.3981-1-victor.kamensky7@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 08:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228286

On Sun Dec 21, 2025 at 8:28 AM CET, Victor Kamensky via lists.openembedded.=
org wrote:
> * removed upstreamed patch
> * fixed patch fuzz issue
>
> Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
> ---

Hi Victor,

Thanks for your patch.

It look like the build is failing on various platforms:

ERROR: systemtap-5.4-r0 do_compile: Execution of '/srv/pokybuild/yocto-work=
er/qemux86/build/build/tmp/work/core2-32-poky-linux/systemtap/5.4/temp/run.=
do_compile.1003148' failed with exit code 1
...
| In file included from ../sources/systemtap-5.4/staptree.h:27,
|                  from ../sources/systemtap-5.4/elaborate.h:12,
|                  from ../sources/systemtap-5.4/elaborate.cxx:11:
| ../sources/systemtap-5.4/elaborate.cxx: In member function 'virtual void =
const_folder::visit_defined_op(defined_op*)':
| ../sources/systemtap-5.4/elaborate.cxx:5119:33: error: format '%ld' expec=
ts argument of type 'long int', but argument 2 has type 'int64_t' {aka 'lon=
g long int'} [-Werror=3Dformat=3D]
|  5119 |       session.print_warning (_F("Collapsing unresolved @define to=
 %ld [stapprobes]", value), e->tok);
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
| ../sources/systemtap-5.4/staputil.h:54:27: note: in definition of macro '=
_'
|    54 | #define _(string) gettext(string)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/2874
https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/2926
https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/2738
https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2867
https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2904
https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/2878

Can you have a look at this issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


