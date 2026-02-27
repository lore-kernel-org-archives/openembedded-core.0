Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091E2FEFB49
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 12:34:42 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.94688.1772195675670951008
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 04:34:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1gdj7Wqp;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3AB65C406A7;
	Fri, 27 Feb 2026 12:34:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E88A5FE46;
	Fri, 27 Feb 2026 12:34:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CDD310369412;
	Fri, 27 Feb 2026 13:34:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772195672; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6tKDgxZr2heCiXLO4pg7bc6l4FvkBryh45FFDU6YVRE=;
	b=1gdj7WqpNHItvQPzxXb1/J9/VCApV4Kvu0yZS00BHBNF2ndl3whcGUyRpAfAz+SU7CLk61
	4SF+yZw4Vp7GG2U+/16ZW5ZJDCT1R136Z3kBfiuq81QA1A5+SSqfn3NsIZM7JBaMMzgO9R
	Lj+jfl/Df/cvlhzdSjjDHLPoUbzbcLC4mQd7YIxCXHsle5diFblKkkLkgn1n3IwOd7Bb+y
	SBkgVliSnlPSGXfguKgd+3IHyZyNBMKJWBfjQthpSaU8wpVawYmlARqYBO8nMWxhdGZYNG
	KS+Voqvq/r2rZWZrA1q6xc76Av60t0hDDF2rp7WwLV+5QS6Ec0Bar0M8v1cLwA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 13:34:29 +0100
Message-Id: <DGPQXND8Q03F.3UJGBM37U09HA@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] binutils: Upgrade to 2.46 release
Cc: <Sundeep.Kokkonda@windriver.com>, <Deepesh.Varatharajan@windriver.com>,
 <Randy.MacLeod@windriver.com>, <Hemanth.KumarMD@windriver.com>,
 <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260225114339.215291-1-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260225114339.215291-1-Hemanth.KumarMD@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 12:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232096

On Wed Feb 25, 2026 at 12:43 PM CET, Hemanth Kumar M D via lists.openembedd=
ed.org wrote:
> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>
> New Features:
> Support for new instructions added to AMD, ARM and RISC-V architectures.
> Support for version 3 of the SFrame standard.
> The readelf program can now display the contents of Global Offset Tables.
> Improved linker tagging support.
>
> Detailed release notes are here [1]
>
> [1] https://lists.gnu.org/archive/html/info-gnu/2026-02/msg00006.html
>

Hi Bruce,

I just want to note that this patch, if merged, will break the xen build
with meta-virt. I believe only the qemuarm64 MACHINE is affected.

ERROR: xen-4.21.0+stable-r0 do_compile: Execution of '/srv/pokybuild/yocto-=
worker/meta-virt/build/build/tmp/work/cortexa57-poky-linux/xen/4.21.0+stabl=
e/temp/run.do_compile.2652887' failed with exit code 1
...
| Assembler messages:
| {standard input}:474: Error: unknown or missing system register name at o=
perand 1 -- `msr TEECR32_EL1,x0'
| {standard input}:480: Error: unknown or missing system register name at o=
perand 1 -- `msr TEEHBR32_EL1,x0'
| {standard input}:488: Error: unknown or missing system register name at o=
perand 2 -- `mrs x0,TEECR32_EL1'
| {standard input}:494: Error: unknown or missing system register name at o=
perand 2 -- `mrs x0,TEEHBR32_EL1'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/3098

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


