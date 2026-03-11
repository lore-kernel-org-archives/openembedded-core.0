Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9DEBFCC9B1
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 06:03:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14277.1773209033939477498
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 23:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JmTJr+qB;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E2627C41581
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 06:04:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEF1F60004;
	Wed, 11 Mar 2026 06:03:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 28CB610369B30;
	Wed, 11 Mar 2026 07:03:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773209015; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RYvbKazKm8UBMKGcr0ba2a9IjXSle9RZHkId22k1ddY=;
	b=JmTJr+qBcLww6leZJ9f8pZ7q6V62+6mPgzOrOACKHaLx6kwBZ5rjtdyQYac9irEtGZj8Cm
	NmJVutp5KLJHOSPYvGhEWTvsJrHIbA9Mo9/AnpJe30/hd5IypL0mwwzCkt1fa6lSQ7udXJ
	RcDEriglXJmBtfbnSoVBk9F1uo2dyyuAF9vKQCtmNejmv9WMd88c3sRn2Lap7nbLo0njHR
	RQ2NS/XKwJRp8F7hY8ABRpeJBr6fu0TmQERjIcec1clBtNjpV6nM77/Sv5nkfrwxEcZDm6
	4edJZj9boqnAyvgGKqLJk+elMuRR3y+ejraI4TCyo0FdmbQHUQZ8TVbDLK7uiQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 07:03:30 +0100
Message-Id: <DGZQ4TTU05M0.3UH0ADSIVMSTT@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <peng.zhang1.cn@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH v2] groff: upgrade 1.23.0 -> 1.24.0
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260309150842.3379241-1-peng.zhang1.cn@windriver.com>
In-Reply-To: <20260309150842.3379241-1-peng.zhang1.cn@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 06:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232837

On Mon Mar 9, 2026 at 4:08 PM CET, Peng (Paul) (CN) via lists.openembedded.=
org Zhang wrote:
> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>
> Upgrade to latest revision of 1.24.0.
> - Drop patches included in this release.
> - Add patch to fix test-groff not found in cross-compilation.
> - Add patch to use SOURCE_DATE_EPOCH in gropdf for reproducible PDF gener=
ation.
> - COPYING, LICENSES: Refresh GPLv3 text.
>
> Release Note:[https://lists.gnu.org/r/groff/2026-02/msg00149.html]
>
> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>

Hi,

Thanks for the new version. It looks a bit better, reproducibility test
passed at least once, but we still have failures in some builds. It
seems to be a similar one:

AssertionError: The following deb packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/groff-doc_1.24.0-r0_amd64.deb
The following rpm packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/groff-doc-1.24.0-r0.x86_64_v3.rpm

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3554

Diffoscope output:
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260310-jxtz43x1/=
packages/diff-html/

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


