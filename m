Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 138EEC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 12:12:07 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6747.1783512719417206489
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 05:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=c5el2eIh;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4BC8C1A0ED8;
	Wed,  8 Jul 2026 12:11:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20BF760337;
	Wed,  8 Jul 2026 12:11:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9EF7E11BC0017;
	Wed,  8 Jul 2026 14:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783512716; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QxCHHPNNpULgX7sqnIp5XiEqnUfl7uLfCw9534CPRos=;
	b=c5el2eIh72yfPid31bqaRup0V3f36k9Bd2JgnpTRdNjFiZnbEwlqyehHvWxOfUbTZ5Tkjp
	xnjpvGm5k/dnfYmnci636cxC+q4B6mN3mB0ANLOEfQ8ftmrJ/cZxgk/Y0pkb5G/K3KG4sb
	2O6sXbkxLsjhxftg0VaMkCOJ6EKAmGgJnfoYRyZz7RQ0/zNIBZge5juu7lr2Zb9dgj3yOQ
	OMhgxb+xjgtFZroRApcIfAX3gYjIck2l/pWzSQ8IUWuWDn10wjlLolnxDpDQTM7Len5rLr
	CJdxikb/JYx2phXl9EmSzdbG3ysBsbUxIhLmVUscxWh0g8ZBylIcQ+kFkcWbGg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 14:11:54 +0200
Message-Id: <DJT6HQ4N7EGR.2UDG8J0QL9AL4@bootlin.com>
Subject: Re: [OE-core] [PATCH] nasm: upgrade 3.01 -> 3.02
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260706135009.1818867-1-ross.burton@arm.com>
In-Reply-To: <20260706135009.1818867-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 12:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240481

On Mon Jul 6, 2026 at 3:50 PM CEST, Ross Burton via lists.openembedded.org =
wrote:
> Drop the backported C23 patch, and replace the debug-prefix-map patches
> with backports that are now merged upstream (thanks Joshua Watt).
>
> Out-of-tree builds work again, so switch back to autotools.
>
> Upstream release notes:
> - Fix build problems on C23 compilers using a pre-C23 version of <stdbool=
.h>.
> - The immediate form of the JMPE instruction (opcode 0F B8) has been
>   changed to an absolute address.
> - Various build fixes.
> - Corrections to assembling encodings.
> - Corrections to disassembling.
> - Whole bunch of minor fixes to operand sizes, operand size prefixes.
> - Add support for C2y-style \o escape sequences, braced escape
>   sequences, and as NASM extensions, decimal escape sequences (\d) and
>   control-character escape sequences (\^).
> - Fix generation of the short opcodes for ADD, OR, ADC, SBB, AND, SUB,
>   XOR, and CMP AL,imm8.
> - Fix truncation of the generated constant to 63 bits when invoking a
>   single-line macro when an argument is defined as =3D/b or =3D/ub.
> - Add an %env() preprocessor function as a more robust and flexible
>   alternative to the %! construct.
> - The maximum number of multi-line macro parameters is now a
>   configurable limit.
> - The --limi- options and %pragma limit now accept the keywords
>   default, maximum, and reset.
> - Fix parsing of seg:offs=E2=80=93style FAR pointers in EQU.
> - Fix the %clear preprocessor directive hanging when given parameters.
> - Fix a crash when -M directives were used in response files.
> - New listing option -Lc to include the contents of INCBIN files.
> - New listing option -Lt to include the output from every iteration of
>   TIMES and ALIGN directives.
> - The %pragma list options directive now support resetting options to
>   their command-line default.
> - New predefined macros __?LIST_OPTIONS?__ and
>   __?LIST_OPTIONS_DEFAULT?__ to query the active and command-line
>   default listing options.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

Sorry but it looks like this upgrade is breaking the reproducibility
test for ffmpeg:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4343
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260707-b241bpry/

It looks like libav built code differs. Can you have a look at this?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


