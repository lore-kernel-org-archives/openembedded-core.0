Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1115FC5B572
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 14:20:19 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55477.1786458008839530502
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 07:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mnnKkGbT;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DD7171A1563;
	Tue, 11 Aug 2026 14:20:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A97306033C;
	Tue, 11 Aug 2026 14:20:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F003C11C48CBA;
	Tue, 11 Aug 2026 16:19:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786458002; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oPMvcz0uXkN40q8AelKPoih5q0FwgEW88maSQmp23QE=;
	b=mnnKkGbTkTmqErKMocHAEDlO8V7qL3+BQgTZ7gQ/CgbGDrjYaK8+MmJtVFbPfCamnoqCbi
	r1YLLcG3zsqWLK3+ZxFFwCTydkDdgggKkdKGXDb0S1GqRndHrfjq995mORfwYW91i4n1nM
	l4hIePIVgcK/IkffxM27MHaGM7KVJEQ0cTCkaM7bQ34dW7C3XLeC1LC/SpK/7qamRHYaHl
	Fn/OCI9DUShPZIDA6T3//3tUTpbnG57JQXRDklp9rxz32TgKqEfqy7a6L9QSURInqrODJB
	DMUR+47m23MHxNQ7PFyw+agZmDCyKhPCAYBNc1hPm6Np1Qn7Bb266NSgGTfOPA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 16:19:58 +0200
Message-Id: <DKM6IAUNZOOF.11QH0FJ6NRSQ2@bootlin.com>
Subject: Re: [PATCH v13 09/10] rpm: Fix pkgconfig() Provides missing in
 cross-built RPMs
Cc: <alex.kanavin@gmail.com>, <mattware@cisco.com>, <esparlin@cisco.com>,
 <peter.marko@siemens.com>, <randy.macleod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Sumanth Gavini" <sumanth.gavini@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260810045250.3903576-1-sumanth.gavini@windriver.com>
 <20260810045250.3903576-10-sumanth.gavini@windriver.com>
In-Reply-To: <20260810045250.3903576-10-sumanth.gavini@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 14:20:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243205

On Mon Aug 10, 2026 at 6:52 AM CEST, Sumanth Gavini wrote:
> * Added 0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch
>   - rpm 6's internal dependency generator runs pkgconfigdeps.sh during
>     rpmbuild, but OE's cross-build environment exports PKG_CONFIG_SYSROOT=
_DIR
>     which causes pkg-config --print-provides to silently fail on .pc file=
s
>     in the package buildroot.
>
>     Unset cross-compilation PKG_CONFIG_* variables in pkgconfigdeps.sh so
>     that pkgconfig() Provides/Requires are correctly generated.
>
>     Without this fix, do_rootfs fails with errors like:
>     nothing provides pkgconfig(ogg) needed by flac-dev
>
> Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
> ---

Hi Sumanth,

Thanks for the new version.

This looks better, at least for the dnf install errors. Yet we still
have errors when reusing sstate-cache, as recipes generating pkgconfig
should be rebuilt, but their signatures did not change:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4377

I made some horrible hack in my branch to change the PR of many
recipes, and the build now succeeds. I only tested one configuration,
but we can expect similar results on the other ones.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4386

So, depending on how you address Ross comment, you might need to make
sure recipes signature is going to change.

We also had some selftest errors: I will investigate a bit further and
come back to you.
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4525

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


