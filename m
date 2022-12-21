Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B75C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 21:21:06 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.30826.1671657658874497476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 13:20:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FEfi/PLD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F2B8DE0004;
	Wed, 21 Dec 2022 21:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671657656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qmfrfmlj8JvPyx2v9wO7Cdqp6nT0ElI8STLFFHuoTzw=;
	b=FEfi/PLDoQZozfgwaKwy6BVK7mrUL77E3+e3vAbli+HhIe8ATVT+ERS+4bh1YEB372TqVA
	kfD8Vb6S7EKiK3gVvSdO7S46lvKMPDGw85xg5t8beFRePGUeCQfBu4oGb3/n4uu65C4v9h
	2ZsZVm3G7Uf0FNU42Xlc5QMb+sEv4g3/LdvmM76HLo8skfVVMqEn3F9ftUvpRzTR7ALKYC
	qPYT9ysXef4mPLDrHb69/mSSuZCBZWV+K/W2/D9JNrbYf64r/W7tY59InQG1TstyK3mdNL
	OtADukkbJ+kK13jATB6fNSawtBzzxQ84qTLnG27S/LDq6vcQXcoNDMkcZ9333g==
Date: Wed, 21 Dec 2022 22:20:55 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-Core][PATCH v2 00/10] Add rust runtime tests
Message-ID: <Y6N4t46ZSA9ly0Tl@mail.local>
References: <20221221125306.13779-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221221125306.13779-1-alex.kiernan@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 21:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174951

Hello,

This is currently running on the AB and I got the following failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/6375/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/3985/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/6334/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/3960/steps/11/logs/stdio

On 21/12/2022 12:52:55+0000, Alex Kiernan wrote:
> 
> This series adds runtime tests for rust and cargo, merges (most of) the
> include files into the base recipes and fixes target cargo builds.
> 
> Also add SDK_TOOLCHAIN_LANGS for selection of target toolchains as part
> of packagegroup-core-sdk.
> 
> Changes in v2:
> - Drop rust.inc/rust.bb merge, not actually made use of in the change
>   set
> - Reorder so cargo test goes after build fixes
> 
> Alex Kiernan (10):
>   oeqa/runtime/rust: Add basic compile/run test
>   libstd-rs: Merge .inc into .bb
>   libstd-rs: Move source directory to library/test
>   rust-llvm: Merge .inc into .bb
>   rust-llvm: Update LLVM_VERSION to match embedded version
>   cargo: Merge .inc into .bb
>   cargo: Extend DEBUG_PREFIX_MAP to cover vendor
>   packagegroup-rust-sdk-target: Add Rust SDK target packagegroup
>   packagegroup-core-sdk: Add SDK toolchain language selection support
>   oeqa/runtime/rust: Add cargo test
> 
>  meta/lib/oeqa/files/test.rs                   |  2 +
>  meta/lib/oeqa/runtime/cases/rust.py           | 41 ++++++++++
>  .../packagegroups/packagegroup-core-sdk.bb    | 10 ++-
>  .../packagegroup-rust-sdk-target.bb           | 14 ++++
>  meta/recipes-devtools/cargo/cargo.inc         | 69 ----------------
>  meta/recipes-devtools/cargo/cargo_1.66.0.bb   | 73 ++++++++++++++++-
>  meta/recipes-devtools/rust/libstd-rs.inc      | 40 ---------
>  .../recipes-devtools/rust/libstd-rs_1.66.0.bb | 46 ++++++++++-
>  meta/recipes-devtools/rust/rust-llvm.inc      | 78 ------------------
>  .../recipes-devtools/rust/rust-llvm_1.66.0.bb | 82 ++++++++++++++++++-
>  10 files changed, 260 insertions(+), 195 deletions(-)
>  create mode 100644 meta/lib/oeqa/files/test.rs
>  create mode 100644 meta/recipes-core/packagegroups/packagegroup-rust-sdk-target.bb
>  delete mode 100644 meta/recipes-devtools/cargo/cargo.inc
>  delete mode 100644 meta/recipes-devtools/rust/libstd-rs.inc
>  delete mode 100644 meta/recipes-devtools/rust/rust-llvm.inc
> 
> -- 
> 2.39.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174906): https://lists.openembedded.org/g/openembedded-core/message/174906
> Mute This Topic: https://lists.openembedded.org/mt/95805431/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

