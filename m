Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67F8C61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 18:48:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29241.1787683708851360848
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 11:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gdkzHZTj;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 90CBF4E413B0
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 18:48:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E438604C4;
	Tue, 25 Aug 2026 18:48:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 100BB11C7A755;
	Tue, 25 Aug 2026 20:48:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787683701; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BTMo4+fd9QB+Pdcr2VrFmPWr/kmfqWAL6PEAb8Ymt7I=;
	b=gdkzHZTjChfLlmG6KdNXbQ+ib8pponpJbY0/Jdd4PvXtqv4e3nmla0UaP57eSNe/LFliK3
	/JWCwG17BD9YiRV5TynuCXkL8fnVyPx94ERtyfWbrQorh7aeKfipuoEO7D2ZYlS0re7vpi
	9A0YcSUu66uP1gCNdAiQN7chBurOWXslTyf48VBWzaK6BsewlmZ+Ijkm/Ofs49znapkZ6C
	dTLx5gjyogKKjFqtZSc+0Z4BFIAE+VnmQ7EWfi/ZaYgLORqx7JPUf4JgmPbSQNSpgwgO6x
	sK53K3Q/YxKsYWK/6XYOXb9JA0lfMVvnUH3ZFRPmqF3hzpcZ++8Rok/SlKW9Ag==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 20:48:20 +0200
Message-Id: <DKY8ZEFTEBOF.2QVJI76PJ4GKR@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <alhe@linux.microsoft.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] rust: Avoid passing host-specific
 information to crates Strict Version Hash
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260824235606.4035992-1-alhe@linux.microsoft.com>
In-Reply-To: <20260824235606.4035992-1-alhe@linux.microsoft.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 18:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244262

On Tue Aug 25, 2026 at 1:56 AM CEST, Alejandro Hernandez Samaniego via list=
s.openembedded.org wrote:
> rustc computes each crate's Strict Version Hash (SVH) using inputs that i=
nclude
> the *stage0/stage1 bootstrap compiler* fingerprint, which in turn depends=
 on the
> build host arch.
>
> This eventually may cause sstate matches across architectures for artifac=
ts that
> are actually different, causing autobuilder intermitent reproducibility i=
ssues.
>
> To avoid this, pass a fixed value instead of host-specific bits to the sp=
ecified
> hash.
>
> [YOCTO #15554]
>
> Assisted-by: AI - OpenAI
> Signed-off-by: Alejandro Hernandez <alhe@linux.microsoft.com>

Hi Alejandro,

This looks broken here:

ERROR: rust-native-1.97.1-r0 do_install: Execution of '/srv/pokybuild/yocto=
-worker/genericx86-64/build/build/tmp/work/x86_64-linux/rust-native/1.97.1/=
temp/run.do_install.2682640' failed with exit code 1
...
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/genericx86=
-64/build/build/tmp/work/x86_64-linux/rust-native/1.97.1/temp/log.do_instal=
l.2682640
...
|     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>    =
  ] 275/348: object, schemars, tracing-s=E2=80=A6
|    Compiling rustc_span v0.0.0 (/srv/pokybuild/yocto-worker/genericx86-64=
/build/build/tmp/work-shared/rust-source-1.97.1-r0/sources/rustc-1.97.1-src=
/compiler/rustc_span)
|     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>    =
  ] 276/348: object, schemars, tracing-s=E2=80=A6
| error: expected `;`, found `StableCrateId`
|    --> /rustc-dev/8bab26f4f68e0e26f0bb7960be334d5b520ea452/compiler/rustc=
_span/src/def_id.rs:200:59
|     |
| 200 |         hasher.write(b"

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4510

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


