Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091BFC4451C
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:51:23 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43511.1784710249527520045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=n++NKoK7;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4891C4E40EC4
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:50:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F3E096038B;
	Wed, 22 Jul 2026 08:50:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CCB511BD3A22;
	Wed, 22 Jul 2026 10:50:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784710246; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LjM/FyZLJT/tlhF7mVnqt/CPIDXmhibaMpxa6rEYHbk=;
	b=n++NKoK7Yoi35sOyskhgF6M4GrSqPFLlgXPlpBn7ljNKIRuPTl1ArgU2UJ03a7zzbDQLlt
	JjdxcKjfWqF0OXTO9kRKjNyYEMMdHeEWFtaTLxWu0P39kSlrFdO/syFGAk1vHBrN9/MDdK
	5Ui9y9qzpxBqa/u4WVegvm9UZGEc8Ju3lFEg6EwieU3QtAG/5yINpvhLLUEJS4uFHpRYSW
	I/eqaINys+wUob/wbveRHjOQgPa4dVax9CZfarBXoN2h4MIXj3abT6EqFzz175lLcJECnz
	96TTO6EHT+hhDzDgmvK/atQUhSXKll49HfUBzhu1+fYOndAM6pFXvEiqxNDaaw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Jul 2026 10:50:44 +0200
Message-Id: <DK4YZBUAHQEO.1HIVARCMLRE2Z@bootlin.com>
Subject: Re: [OE-core] [PATCH] perl: upgrade 5.42.2 -> 5.44.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260721134339.16175-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20260721134339.16175-1-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:51:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241628

On Tue Jul 21, 2026 at 3:43 PM CEST, Jaipaul Cheernam wrote:
> Drop patches already included in this release:
> - CVE-2026-8376-01.patch (upstream commit e842efdafe7c)
> - CVE-2026-8376-02.patch (upstream commit 5e7f119eb2bb)
> - determinism.patch (Encode::Byte sort fix)
>
> Add perlcross patches to support perl 5.44.0:
> - Add patchset symlinks directory for perl5-5.44.0
> - Add configure checks for d_getentropy, i_stdckdint, i_sysrandom
>
> Changes: https://perldoc.perl.org/5.44.0/perldelta
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for the upgrade.

It looks like some ptests are failing:

Failed ptests:
{'perl': ['ext/POSIX/t/time', 'perl']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4089
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4073

Ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20260722-36/testresults/qemux86-6=
4-ptest/core-image-ptest-perl/
https://valkyrie.yocto.io/pub/non-release/20260722-36/testresults/qemuarm64=
-ptest/core-image-ptest-perl/

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


