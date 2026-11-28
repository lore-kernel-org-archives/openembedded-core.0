Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3558.1795852798976629495
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2026 00:00:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kTL1E1qz;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9082A4E417D7
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 07:59:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 604BF604C0
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 07:59:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D19511E90D80;
	Sat, 28 Nov 2026 08:59:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795852795; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MZ676RqL773GwByNKSonYNJEss25buwslnOotO3XGOE=;
	b=kTL1E1qzTNlCJiBcmnzfe9n5/TyabKgNPjx+QCfL1RhK1SKQyU5l0zuzwmvS3vZKzdbJFU
	CTqxQYxMx9/VqXXoi0qpK51O0WhyxEQ7AHuXqu2BHDAMo+QqJx5DUvOAivbk7wgBxG2Hbj
	IFGn6JwiheOH0/wq71rXKCDOys7EJD9CHqIzqFb2/mpUwOzje3dH136HuTDHWwxmBzbBPU
	LrdGsylfep51pDJKl8uALTMcyOzPqaB+3tVYYV/TGr8DJk79+m5pw208A0s2w3nIZlUKsP
	v2JLIQV0ix91fs3jQ5GnyydsKIqgxztWxtwTHp88dEIPbjprQLIexgsNFDADLA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2026 08:59:53 +0100
Message-Id: <DN6OOO02WE44.VU0IH0EZ2QPY@bootlin.com>
To: <antonin.godard@bootlin.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] zstd: add bench, compress, dict, trace to
 PACKAGECONFIG
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261127-zstd-1-6-0-v2-1-37210d2fc042@bootlin.com>
In-Reply-To: <20261127-zstd-1-6-0-v2-1-37210d2fc042@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 08:00:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251483

On Fri Nov 27, 2026 at 11:25 AM CET, Antonin Godard via openembedded-core w=
rote:
> Add some PACKAGECONFIG knobs matching zstd's configuration knobs:
>
> - bench toggles the integrated benchmark module (now disabled by default)
> - compress toggles zstd compression support (enabled by default)
> - dict compiles zstd with support for the integrated dictionary builder
>   (now disabled by default)
> - trace can display a stack backtrace when execution
>   generates a runtime exception (now disabled by default)
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Changes in v2:
> - Patch 1/2 was merged.
> - Adjust PACKAGECONFIG options names and the ones enabled by default.
> - My mistake, but some options have to be passed in MOREFLAGS with Zstd,
>   so define it at the recipe-level and set it based on PACKAGECONFIG.
> - Link to v1: https://patch.msgid.link/20261125-zstd-1-6-0-v1-0-95f50c6b9=
de6@bootlin.com
> ---

Hi Antonin,

Thanks for the new version.

It looks like disabling features breaks the associated ptests:

Failed ptests:
{'zstd': ['dict-builder/empty-input.sh',
          'dict-builder/empty-input.sh.check_exit',
          'dict-builder/empty-input.sh.check_stderr',
          'dict-builder/no-inputs.sh',
          'dict-builder/no-inputs.sh.check_exit',
          'dict-builder/no-inputs.sh.check_stderr',
          'dict-builder/sample-count-overflow.sh',
          'dict-builder/sample-count-overflow.sh.check_exit',
          'basic/bench-decompress-multiple.sh',
          'basic/bench-decompress-multiple.sh.check_exit',
          'cli-tests']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1659
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/5024

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

