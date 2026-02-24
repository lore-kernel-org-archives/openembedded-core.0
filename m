Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F19ECEFB81B
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 09:10:38 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16357.1771924230308332409
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 01:10:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EP0wj6BT;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5DFF94E41081
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 09:10:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2CAFA5FD9D;
	Tue, 24 Feb 2026 09:10:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E219A10368F3A;
	Tue, 24 Feb 2026 10:10:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771924227; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HMY6ArlIKo/eujnvL9Ta02Mxce2Zp5arhNpVFP9myRE=;
	b=EP0wj6BTienQG2yjIoiChUgYNwHBckOAzgEr8oL/nCpmx1rx00sb43W2SxXUjJQPCOFf12
	fb6Tkd/XAGB8IK2OUqowmGmuq3EzAnGZMR0r+gC4qie5DBTO7IyQ3CIWg0nfJhk3waH4xW
	om6GrbCz98A2gE7RoLBByBywNcpPEvLLCg6iHcfCK0dOSO+CfmybB5zU77+bHkdfyUSCKM
	vwZ+K6nAo58rCp/Lcxgta6iakVYgpaN9HnVcrXD8+45/0g/QJphV+gIYcAVUoqTSnjqa+N
	Zp0/8o2TH1Dy1b9KGtbnDupqyLcTiCiFbk2EtlRMbfnX71Q49GrbRnJxHlqxSw==
From: Benjamin ROBIN <benjamin.robin@bootlin.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, kamel.bouhara@bootlin.com,
 mathieu.dubois-briand@bootlin.com, jeremie.dautheribes@bootlin.com,
 thomas.petazzoni@bootlin.com, antonin.godard@bootlin.com,
 pascal.eberhard@se.com
Subject: Re: [PATCH v2] meta: fix generation of kernel CONFIG_ in SPDX3
Date: Tue, 24 Feb 2026 10:10:25 +0100
Message-ID: <2030868.PYKUYFuaPT@brobin-bootlin>
In-Reply-To: 
 <CAJdd5GZqLc0ocXyMC9v4gV-DYBM4vA+RjQYVgnNyH7HH1QZDBg@mail.gmail.com>
References: 
 <20260216-fix-kernel-config-spdx-v2-1-62e65ec2176f@bootlin.com>
 <CAJdd5GZqLc0ocXyMC9v4gV-DYBM4vA+RjQYVgnNyH7HH1QZDBg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 09:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231751

On Monday, February 23, 2026 at 6:43=E2=80=AFPM, Joshua Watt wrote:
> I like this in general, but if you're going to bbappend, the `return`
> will mess with any other appends, so it needs to be avoided. Probably
> just put all the code under a
> `if bb.data.inherits_class("create-spdx-3.0", d):` instead

Indeed, thank you for your feedback.
My initial plan was to move all code inside a Python function named
create_kernel_config_spdx, and to call this function from=20
do_create_spdx:append().

Sadly, the generated code looks like this:
```
def do_create_spdx(d):
    import oe.spdx30_tasks
    oe.spdx30_tasks.create_spdx(d)
    create_kernel_config_spdx()

do_create_spdx(d)

def create_kernel_config_spdx(d):
    # Code of the function
```

This is not going to work, since the create_kernel_config_spdx() is declare=
d=20
after the call to do_create_spdx().

=46rom my point of view, there is a bug in bitbake code : The emit_func_pyt=
hon()=20
function  declared in lib/bb/data.py does not generate code in the right=20
order: The "write_func(func, o, True)" should be called at the end of=20
emit_func_python().
I am missing something, or is there any reason why emit_func_python() is=20
implemented that way?

Anyway I am preparing a v3, that solve this issue differently.

Best regards,
=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




