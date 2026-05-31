Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA6CCD6E51
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 07:50:40 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3148.1780213835308169528
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2026 00:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Jkqttip7;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 266811A3761;
	Sun, 31 May 2026 07:50:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E5CA5604EC;
	Sun, 31 May 2026 07:50:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D60EF10888CC7;
	Sun, 31 May 2026 09:50:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780213832; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PB47MOGK52YfvkpU+lGpseV8tbQT0sqVB86psorf/x0=;
	b=Jkqttip7/T+DcCoycV5t87+NU4B8qF+Tr7U3KTA/JBKz8ng0Z1SfktnecKRaIBoVvG72ct
	KvyNDQcjWhx1GLWZzycnW45DP3e2hQISScwI2NuxTmvPWWQxMG+5uWoIf6uTW7OKCSh7Ft
	JTCifbsDFjjeZvGepiQfWdsicD0jMKK9HjGzzQ4BTs7GWkLJhqb4iv3SDPpoA6fR+R1tZm
	sKYcckxokAcvDneSLOyNnwrroveZNuokLd35P5c90GwjDFDCJGhRKJ+ieQmbNy30bIzbSz
	qOhDexmxv4lEhqD1eZX0kK3Rlhh9joJ3G8zpC3QcEv1ZdvmDP7OhpGt/U9krDQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 31 May 2026 09:50:28 +0200
Message-Id: <DIWP4UN9BAPG.2ZJQOV9OKH447@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.95.0 -> 1.96.0
Cc: <Sundeep.Kokkonda@windriver.com>, <Deepesh.Varatharajan@windriver.com>,
 <Randy.Macleod@windriver.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260529130241.387818-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260529130241.387818-1-Deepesh.Varatharajan@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 07:50:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237792

On Fri May 29, 2026 at 3:02 PM CEST, Deepesh via lists.openembedded.org Var=
atharajan wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Rust Changes:
> https://github.com/rust-lang/rust/releases/tag/1.96.0
>
> Cargo Changes:
> https://doc.rust-lang.org/nightly/cargo/CHANGELOG.html#cargo-196-2026-05-=
28
>
> Drop merged patches:
> 0001-Update-call-llvm-intrinsics-test.patch
> 0001-Fix-multiple-option-or-permutations-test-for-big-end.patch
>
> Updated patches:
> rust-oe-selftest.patch
>
> New patch:
> 0003-explicit-tail-calls-disable-two-tests.patch
> Backport two commits that disable two failing tests on LoongArch.

Hi Deepesh,

Thanks for the upgrade.

It looks like the build is sometimes failing (ARM 32 bits?):

oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/pokybu=
ild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linu=
x-gnueabi/core-image-sato/1.0/testimage-sdk/environment-setup-cortexa8hf-ne=
on-poky-linux-gnueabi > /dev/null; cd /srv/pokybuild/yocto-worker/beaglebon=
e/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato/=
1.0/testimage-sdk//hello; cargo add zstd;' returned non-zero exit status 10=
1.
Standard Output:     Updating crates.io index
error: process didn't exit successfully: `rustc -vV` (exit status: 1)
--- stdout
rustc 1.96.0 (ac68faa20 2026-05-25) (built from a source tarball)
binary: rustc
commit-hash: ac68faa20c58cbccd01ee7208bf3b6e93a7d7f96
commit-date: 2026-05-25
host: x86_64-pokysdk-linux-gnu
release: 1.96.0

--- stderr
error: error loading target specification: `llvm_floatabi` is unused on x86=
-64

https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/3839
https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/3853
https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/3806
https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/3659

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


