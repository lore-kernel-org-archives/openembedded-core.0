Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 513F1CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 11:20:46 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.5912.1759404043188511938
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 04:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NKuEk+nq;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F0C8F1A1052;
	Thu,  2 Oct 2025 11:20:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6B956062C;
	Thu,  2 Oct 2025 11:20:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83A92102F1BB0;
	Thu,  2 Oct 2025 13:20:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759404040; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uFXXnT4fQimhk6zDbMHpiVMccI1H1d0UXsshQSIVvPM=;
	b=NKuEk+nqj81m+DMNk478ozNX90fWUUltnGNUvM24baN5nT7cW3lrjb5/2oZwUu2s8pJtKT
	hzuxesfhdHyup19XkLjN5NYSi3AGl+MTB/sQpBlRtB6ead9XDGobwvyNVvI18MTHck3I4F
	3XDexnssEtnQN+OPHNtjRHBBPJQi4rn9fsx7CY6obJy7nDsaa1wkzi6iMHrCDMlwMVLC3W
	MP0kpLW+pPQl7ADsqER/caEDqWGxkG12XJxlb7bfe1kGc0IQ7uDEVsV+T0hyUnvA61PFVC
	V5QRP6msa5GjYZYpcRZQ82Hn5xChVm2N+dQvOzaE8DxA7KGW0SGM6mV5p184Rw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 13:20:35 +0200
Message-Id: <DD7SOFNX7NVH.2H7W150BPF4GW@bootlin.com>
Subject: Re: [OE-core] [PATCH] sqlite3: upgrade 3.48.0 -> 3.50.4
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <anna-lena.marx@inovex.de>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251001152850.1342075-1-anna-lena.marx@inovex.de>
In-Reply-To: <20251001152850.1342075-1-anna-lena.marx@inovex.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 11:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224352

On Wed Oct 1, 2025 at 5:28 PM CEST, Anna-Lena Marx via lists.openembedded.o=
rg wrote:
> With the upgrade to 3.50.4, some configure options changed
> as the project switched from `autotools` to `autosetup`.
> The PACKAGECONFIG "dyn_ext" is not longer available.
> Besides, the default CONFIGUREOPTS "target", "exec_prefix"
> and "oldincludedir" became invalid.
>
> Changelog: https://sqlite.org/releaselog/3_50_4.html
>
> Signed-off-by: Anna-Lena Marx <anna-lena.marx@inovex.de>
> ---

Hi Anna-Lena,

Thanks for your patch.

> +INSANE_SKIP:${MLPREFIX}lib${BPN} =3D "useless-rpaths"

I believe this check is not allowed to be skipped. The yocto-check-layer
script is not happy about this line:

Parsing recipes...ERROR: /srv/pokybuild/yocto-worker/check-layer/build/meta=
/recipes-support/sqlite/sqlite3_3.50.4.bb: QA Issue: Package libsqlite3 is =
skipping required QA tests. [useless-rpaths]
ERROR: /srv/pokybuild/yocto-worker/check-layer/build/meta/recipes-support/s=
qlite/sqlite3_3.50.4.bb: Fatal QA errors were found, failing task.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/27/builds/2496

Can you fix this another way?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


