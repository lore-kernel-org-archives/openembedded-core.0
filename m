Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C769FEB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 07:33:57 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.2338.1689060833858283391
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 00:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Y0H2oVAi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C15C7E0009;
	Tue, 11 Jul 2023 07:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689060832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WzfPRxZe2jGg5TAcFirQA0+Ont75cSJEAUjK07t2GuE=;
	b=Y0H2oVAic39rUhfGCji/Iy+g3+rZkhJ9naklU2vr5w/4dKlrYznV1F/tew4P4H1BSRyeRc
	2o0FcYQA5Pi8kjzG12LGHsG6hclYmJWFCipO8paNDzWlOS3F+yvhzMy2co0xZXnZJVB/SH
	Tcag7SSH/PkcOdBX18Z/KU70P6rbXik6uqHUUygQaBgMaFcaCvESkYkUAWqfAqgTQPAwUs
	OQw/JylLXmCfPF98VoP1QmwLQLUfzTp2JZhuWm444RLNLfMbae7WacEBMOZS3NEjnn4DKL
	0jx4XMwgaGjN6IYlS2yRNO+qBpPN2eBHxXDOw/NCIzQO5I/F41P3sJywywAAwQ==
Date: Tue, 11 Jul 2023 09:33:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: alexander.sverdlin@siemens.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] rust-llvm: backport cstdint header fix for
 build with gcc-13
Message-ID: <20230711073351a9bccb83@mail.local>
References: <20230710093432.669209-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710093432.669209-1-alexander.sverdlin@siemens.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 07:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184119

On 10/07/2023 11:34:27+0200, A. Sverdlin via lists.openembedded.org wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> * needed for rust-llvm-native on hosts with gcc-13
> 
> Based on commit 3382759cb6c5 ("llvm: backport a fix for build with gcc-13")
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
>  ...-missing-cstdint-header-to-Signals.h.patch | 32 +++++++++++++++++++

Was this tested?

ERROR: rust-llvm-native-1.70.0-r0 do_patch: Applying patch '0004-Support-Add-missing-cstdint-header-to-Signals.h.patch' on target directory '/home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-1936052/tmp/work/x86_64-linux/rust-llvm-native/1.70.0-r0/rustc-1.70.0-src/src/llvm-project/llvm'

>  .../recipes-devtools/rust/rust-llvm_1.70.0.bb |  4 ++-
>  2 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/rust/rust-llvm/0004-Support-Add-missing-cstdint-header-to-Signals.h.patch
> 
> diff --git a/meta/recipes-devtools/rust/rust-llvm/0004-Support-Add-missing-cstdint-header-to-Signals.h.patch b/meta/recipes-devtools/rust/rust-llvm/0004-Support-Add-missing-cstdint-header-to-Signals.h.patch
> new file mode 100644
> index 0000000000..6ed23aa9c5
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/rust-llvm/0004-Support-Add-missing-cstdint-header-to-Signals.h.patch
> @@ -0,0 +1,32 @@
> +From a94bf34221fc4519bd8ec72560c2d363ffe2de4c Mon Sep 17 00:00:00 2001
> +From: Sergei Trofimovich <slyich@gmail.com>
> +Date: Mon, 23 May 2022 08:03:23 +0100
> +Subject: [PATCH] [Support] Add missing <cstdint> header to Signals.h
> +
> +Without the change llvm build fails on this week's gcc-13 snapshot as:
> +
> +    [  0%] Building CXX object lib/Support/CMakeFiles/LLVMSupport.dir/Signals.cpp.o
> +    In file included from llvm/lib/Support/Signals.cpp:14:
> +    llvm/include/llvm/Support/Signals.h:119:8: error: variable or field 'CleanupOnSignal' declared void
> +      119 |   void CleanupOnSignal(uintptr_t Context);
> +          |        ^~~~~~~~~~~~~~~
> +
> +Upstream-Status: Backport [llvmorg-15.0.0 ff1681ddb303223973653f7f5f3f3435b48a1983]
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> +---
> + llvm/include/llvm/Support/Signals.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/llvm/include/llvm/Support/Signals.h b/llvm/include/llvm/Support/Signals.h
> +index 44f5a750ff5c..937e0572d4a7 100644
> +--- a/llvm/include/llvm/Support/Signals.h
> ++++ b/llvm/include/llvm/Support/Signals.h
> +@@ -14,6 +14,7 @@
> + #ifndef LLVM_SUPPORT_SIGNALS_H
> + #define LLVM_SUPPORT_SIGNALS_H
> + 
> ++#include <cstdint>
> + #include <string>
> + 
> + namespace llvm {
> diff --git a/meta/recipes-devtools/rust/rust-llvm_1.70.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.70.0.bb
> index 09e4c65be3..1d2a200005 100644
> --- a/meta/recipes-devtools/rust/rust-llvm_1.70.0.bb
> +++ b/meta/recipes-devtools/rust/rust-llvm_1.70.0.bb
> @@ -10,7 +10,9 @@ require rust-source.inc
>  
>  SRC_URI += "file://0002-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
>              file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
> -	    file://0003-llvm-fix-include-benchmarks.patch;striplevel=2"
> +            file://0003-llvm-fix-include-benchmarks.patch;striplevel=2 \
> +            file://0004-Support-Add-missing-cstdint-header-to-Signals.h.patch;striplevel=2 \
> +"
>  
>  S = "${RUSTSRC}/src/llvm-project/llvm"
>  
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184062): https://lists.openembedded.org/g/openembedded-core/message/184062
> Mute This Topic: https://lists.openembedded.org/mt/100054573/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

