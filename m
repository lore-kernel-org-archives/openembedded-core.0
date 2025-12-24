Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6305E7544D
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:56:20 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.118208.1766570178516384051
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:56:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=urHBsAYh;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 770914E41D84;
	Wed, 24 Dec 2025 09:56:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 36B676073D;
	Wed, 24 Dec 2025 09:56:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ECC0210AB0A1F;
	Wed, 24 Dec 2025 10:56:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766570175; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0QL/uj1ukDfMFTMwgLIEaz8URHBuQqQEAQqZctVZoJc=;
	b=urHBsAYhwo8lxkjmkQRFnwG3qL0+Rsbcik9c0W3Sd5XUk7l1Qe3byVvRyjbwMb7pZtQWQr
	+YbyVmwR0rMJvKCLlhJpEtotSGRlFbJlZralpj2Dx7MRReyCWLBRs4raW8GVAdvJzRaSmW
	xxVk/5Zmpf46z5xCCu6wmrJwI68qlcBHJUC4QOM8r+BBQSTgqtPBo6dFVZWcqKF2smvhpL
	5g4F1Ygpj+6aUM0P1pTn+1UvQkEofy1gcbhbUR2KCgwTZ1vjhWRwNCl2/xQB0ZiNu7k48I
	G7KK7vrLz0MVr68CC5ADnvODlu0XrbfKmxJ9GdRRFZpwYK6a2QqvK7gRHU1Yuw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Dec 2025 10:56:13 +0100
Message-Id: <DF6CV1ZJB2L9.38TR07LJFMU8U@bootlin.com>
Subject: Re: [OE-core] [PATCH 097/114] strace: upgrade 6.17 -> 6.18
Cc: "Alexander Kanavin" <alex@linutronix.de>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <alex.kanavin@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
 <20251222200739.2278706-97-alex.kanavin@gmail.com>
In-Reply-To: <20251222200739.2278706-97-alex.kanavin@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 09:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228527

On Mon Dec 22, 2025 at 9:07 PM CET, Alexander Kanavin via lists.openembedde=
d.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>
> Add a patch to skip tests with newly appeared failures.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---

Hi Alexander,

Thanks for your patches.

It did work well a first, but then the bpf patch got merged separately
[1] and now we have some clash between patches applied by the recipe:

ERROR: strace-6.18-r0 do_patch: Applying patch '0001-tests-skip-bpf-tests.p=
atch' on target directory '/srv/pokybuild/yocto-worker/genericx86-64/build/=
build/tmp/work/core2-64-poky-linux/strace/6.18/sources/strace-6.18'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/genericx86-64/build/b=
uild/tmp/work/core2-64-poky-linux/strace/6.18/recipe-sysroot-native/etc/qui=
ltrc push', 0, 'stdout: Applying patch 0001-tests-skip-bpf-tests.patch
patching file tests/bpf-v.gen.test
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file tests/bpf-v.gen.test
patching file tests/bpf.gen.test
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file tests/bpf.gen.test
Patch 0001-tests-skip-bpf-tests.patch does not apply (enforce with -f)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/2924

Do you mind to refresh the patch?

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D640b43073dc=
5b185781e2789860af6a07560bcef

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


