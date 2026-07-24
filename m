Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17F1C531C9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 05:24:12 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13411.1784870642678130174
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 22:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WEDXMTDW;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 42A594E40F21;
	Fri, 24 Jul 2026 05:24:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0083160393;
	Fri, 24 Jul 2026 05:24:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13C8211C1187F;
	Fri, 24 Jul 2026 07:23:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784870639; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CKfPj/w5o43FSCPACxE71cbzIzTjI1EXB763jsopkT4=;
	b=WEDXMTDWKM5sWED2OmZxjDZsveFx89aL8grF1P0RfpYwmh4XRFpi0DF7GiZls7ZoJs0uZl
	Fd/swrZ3kHBVNLtFSQ4ahFbSX/fsFU4spt2qgt8ulN7A7A4fwEdPUXCoUel6iWj9AkcnJL
	j/NYHYbWpErwZcif1PUjnF3OxcdZFR17m7k/gqimZe/8m6Lhi6H5w/hcJ7txeKckixcuB3
	fqX29+JgaC41YBg7iHXUNxEeXe7hg3TWs1Lnn2SSuuKuRecQM6+pAbYBcd1op8SmH8ALdp
	Z2BYPXJcGTDYQWrv6G94IosBqVmbfXeECcwq0gPl/SEWOssBLWJEGg6rdSKh6A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 07:23:55 +0200
Message-Id: <DK6JU22H9C8E.163NIRXGQ07HA@bootlin.com>
To: "Babanpreet Singh" <bbnpreetsingh@gmail.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] devtool: standard: guess srcrev update
 mode for gitsm:// recipes too
Cc: "Richard Purdie" <richard.purdie@linuxfoundation.org>, "Alexander
 Kanavin" <alex.kanavin@gmail.com>, "Chris Laplante"
 <chris.laplante@agilent.com>, "Peter Kjellerstedt" <pkj@axis.com>, "Adrian
 Freihofer" <adrian.freihofer@siemens.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <DK61MC7B9VH0.2408UF4LVISPP@bootlin.com>
 <20260723235227.7-1-bbnpreetsingh@gmail.com>
In-Reply-To: <20260723235227.7-1-bbnpreetsingh@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 05:24:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241889

On Fri Jul 24, 2026 at 1:52 AM CEST, Babanpreet Singh wrote:
> Hi Mathieu,
>
> Thanks for the report. I dug into the three failures on build 4355:
> one is a real regression in my patch (fixed in v2), the other two
> don't look caused by this series.
>
> 1) test_devtool_git_submodules: my fault. The test commits inside a
> submodule, so the parent HEAD stays on the upstream branch and v1
> guessed srcrev, which only rewrites the parent SRCREV and so
> silently dropped the submodule commit. v2 only guesses srcrev when
> 'git submodule status --recursive' shows every submodule in sync,
> keeping such trees in patch mode. The test fails here with v1 and
> passes with v2, matching the autobuilder.
>
> 2) test_devtool_modify_nested_gitsm fails during 'devtool modify'
> source extraction ("No url found for submodule path
> 'nested/repo-gitsm' in .gitmodules"), before the update-mode guesser
> (the only thing this series touches) can run.
>
> 3) test_devtool_finish_update_patch: sysdig-selftest has no gitsm://
> URIs, so the change is inert for it.
>
> Both 2) and 3) pass here on master with only this series applied.
> Build 4355 tested mathieu/master-next, and the nested-git destsuffix
> rework in that queue touches exactly the machinery both failures
> point at, so I suspect an interaction with that series. Happy to be
> corrected if they still fail without other devtool changes in the
> queue.
>
> v2 also adopts Richard's startswith-tuple suggestion.
>
> Thanks,
> Baban

Sorry, I came to the same conclusion this morning: I wrongfully assumed
that because this commit was responsible of the first fail, it was also
responsible of the two others. This is confirmed by tonight build, it
failed even without your commit.

Thanks for taking the time to investigate.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


