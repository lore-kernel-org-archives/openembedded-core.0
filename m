Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD17F1075290
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 09:57:14 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7581.1773914229016527247
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 02:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tX0/vYNV;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 56D1C1A2EF4
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 09:57:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22E625FDEB;
	Thu, 19 Mar 2026 09:57:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D0BEA10450943;
	Thu, 19 Mar 2026 10:57:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773914226; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BZwUfJtr4yfHXbbDl8fYkazVOIKyNK98RRJS5uQ8TDk=;
	b=tX0/vYNVB6Wklr8/Kz2G+QXJ/x/qIuJqiaKFZYOotZDjlXTzXqulPMBxzqHoUSukGvCDsD
	BU7LPL3QKKoGuL/B9fLXRy3F2VQEjRmMjELRU48eCmpbVIQwNuFazpq0jn9wbOM9irNx/K
	csFMzIVUiCv49dWGgqSYfxxPCZstws3YfG+sNuNJsfN7xkoPl5HuJqj52QOrcmy6c/5Qjj
	M6GeaQRhyK/BGCNLttcx09w7GR6OINbVyUkDhB+tugD/2uhkiaLMKiTyw99XbtSZ4IoPvg
	lKj0oGhA5DJ8OhwUuMbDDdHwaknccbGzwby4CiUTGscwoYENtxvADtvqgojshQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: richard.purdie@linuxfoundation.org,
 Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com,
 peter.marko@siemens.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com,
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com,
 thomas.petazzoni@bootlin.com
Subject: 
 Re: [OE-core] [PATCH RFC 0/2] sbom-cve-check: Download CVE DB using BitBake
 fetcher
Date: Thu, 19 Mar 2026 10:57:03 +0100
Message-ID: <2053841.taCxCBeP46@brobin-bootlin>
In-Reply-To: 
 <CAApg2=T6f1yQ8qQFF+V3K+0yhpZWscDUqO+pXA2MK0jik3C4Yw@mail.gmail.com>
References: 
 <20260309-add-sbom-cve-check-p2b-v1-0-09165cddfcf1@bootlin.com>
 <64a1484a196d4e9c603ec6dda598c6a8c4b91606.camel@linuxfoundation.org>
 <CAApg2=T6f1yQ8qQFF+V3K+0yhpZWscDUqO+pXA2MK0jik3C4Yw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 09:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233474

Hello Marta,

On Thursday, March 19, 2026 at 8:29=E2=80=AFAM, Marta Rybczynska wrote:
> Fetching the complete git repos has a number of problems. Why not use
> release
> tarballs like those in  https://github.com/CVEProject/cvelistV5/releases ?
> Fkie feeds also have them
> https://github.com/fkie-cad/nvd-json-data-feeds/releases

sbom-cve-check is not compatible with the tarball release of FKIE. The
CVE database is not in the same format.
=46or cvelistV5, the shallow git clone is globally the same speed and same
size that the release zip file.

Why fetching git repo has problem? I only see advantages. The update is
quick. We can easily know with which version the analysis was done:
This is the git version.

> CVE versions of those repositories are good for manual analysis, but a
> simple
> check does not need all of that.

I don't understand your point.

> Also, I'm worried about the size explosion with additional databases that
> will be
> needed in the 1-2 years time period. I also wouldn't assume all of them
> will have
> git mirrors.

The git shallow clone of the git repository is the same size that the
tarball, which is logical. I don't understand your point.

> For an analysis I think it would be better to integrate sources in a
> database,
> but not a relational one (like it was done with sqlite). An object databa=
se
> corresponds
> better to what the data contains.

sbom-cve-check was not designed like that. We did not want to take this
approach which generates a lot of limitation.

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




