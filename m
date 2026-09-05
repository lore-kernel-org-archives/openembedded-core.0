Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED13C624DB
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 07:35:51 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3936.1788593744349266323
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 00:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ME/7GhCW;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0AC004E41530;
	Sat,  5 Sep 2026 07:35:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D268C60580;
	Sat,  5 Sep 2026 07:35:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D13011C78705;
	Sat,  5 Sep 2026 09:35:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788593737; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=H0sWveND1j7ulDiSVPb3H3Lrj80tjdFCdKMTeVgyHsY=;
	b=ME/7GhCWYYhiywtDm6Y8euWYRgsxD01DfeetVV0/VffJ/LFDtyNB/BR5y5aO+2ebSU7c3q
	mikVHUaoYucmzR1+l1Yh0pO2P7ZkgaZfLqqjuoSM2w9Ca7z+c/1lFfy+BMwjAcv/wjYlrH
	Bmmh4o32x2uzFCNQcsTtSFpQ2+c+XqMcRbdNj86QC6yVUMk1vIdoEPO02XtyEiOu09hYxo
	JWwZV75n3u0QdxOfnKil5FU1lb2WhknmZ/T5ywyGhXsa2S/UTnYAAnnBTPqr66zhPUUt2e
	IIum600Ah13Ql+burGyB8aLyJ5TnMgiDpr1Z6Xu+8BYV9uJWqRN+c2hFUncWOQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 05 Sep 2026 09:35:34 +0200
Message-Id: <DL77KAH9S0QQ.L9V8Q8N6PTVY@bootlin.com>
Subject: Re: [OE-core] [PATCHv8] boost: Add support for building boost-asio
 as a shared library
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <gustali@axis.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260904100208.3052527-1-gustali@axis.com>
In-Reply-To: <20260904100208.3052527-1-gustali@axis.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 07:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245144

On Fri Sep 4, 2026 at 12:02 PM CEST, Gustav Lindberg via lists.openembedded=
.org wrote:
> This is needed to build boost asio as a shared library rather than a
> header-only library, which is needed to save memory.
>
> This can be enabled by adding `PACKAGECONFIG:append =3D " asio-shared"` t=
o
> `boost_%.bbappend`.
>
> Signed-off-by: Gustav Lindberg <gustali@axis.com>
> ---

Hi Gustav,

It looks like this is not working as expected:

ERROR: boost-1.92.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worke=
r/genericx86-64/build/build/tmp/work/core2-64-poky-linux/boost/1.92.0/temp/=
run.do_compile.1669567' failed with exit code 1
...
| notice: Searching '.' for project-config configuration file 'project-conf=
ig.jam'.
| notice: Loading project-config configuration file 'project-config.jam' fr=
om '.'.
| error: wrong library name 'asio' in the --with-<library> option.
| WARNING: exit code 1 from a shell command.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4599

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


