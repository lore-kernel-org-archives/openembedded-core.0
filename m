Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028E8CCFA1A
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 08:47:15 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8817.1762937227928245936
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 00:47:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SFOF6XV+;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D2E441A1A08
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 08:47:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A85D16070B;
	Wed, 12 Nov 2025 08:47:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3866A10371974;
	Wed, 12 Nov 2025 09:47:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762937225; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9PUPhHg8j//75BNAGPAEuCd45sEd+d5NHDUokz/hLb0=;
	b=SFOF6XV+bnbOH4E/4zzlGqT0m7XDlbYpT+CToUCOBWDJzwa5jNiSXLOUB7C9NIX0K95edq
	u6e9RO8PHE72HLidV63EQPrN6UkA9zflCqnXOc4HcrN3gv9gLDqY6SC61HvMuJgWCjNVXx
	sfy1LfV1ZKG8wU4WNPxy/oheebwLsIQAFkSkIy07HFsnqsM4eUXXejXoJmmAty3VCo81FA
	42UUTIHat7SUwVF/SGxfmzxbYl4M3AlP5XB9UrU1Wrr58QeJy7UkmZAXjeS4c9GpKY7otJ
	e7t6bioI5dPHC6mWE9vxoH6m6Q9wYaPGydcPpsyriYFjdji/9YmT2RIO5sX2WA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Nov 2025 09:47:03 +0100
Message-Id: <DE6L37WPAY21.AEIA9STGZ028@bootlin.com>
Subject: Re: [OE-core] [PATCH] libdnf: upgrade 0.74.0 -> 0.75.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251111075719.1676-1-wangmy@fujitsu.com>
In-Reply-To: <20251111075719.1676-1-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 08:47:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226198

On Tue Nov 11, 2025 at 8:57 AM CET, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> optional-check.patch
> removed since it's included in 0.75.0
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for the update.

It look like the new version is not building against musl:

ERROR: libdnf-0.75.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-work=
er/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.=
75.0/temp/run.do_compile.3947092' failed with exit code 1
...
| /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v=
3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-repo.cpp:9=
71:50: error: 'FNM_EXTMATCH' was not declared in this scope; did you mean '=
FNM_NOMATCH'?
|   971 |             if (fnmatch(repo_id_pattern, repoId, FNM_EXTMATCH) !=
=3D 0) {
|       |                                                  ^~~~~~~~~~~~
|       |                                                  FNM_NOMATCH

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/2766
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2731
https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/1451

Can you have a look at this?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


