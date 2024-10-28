Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94959D33989
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 14:10:01 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.52612.1730124595181776183
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 07:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lejo0XME;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C5B840004;
	Mon, 28 Oct 2024 14:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730124593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eV9T8MBdqzsBftzI/lE9JehGNyW2nixIAzOS9P7bXdQ=;
	b=lejo0XME51RZiP/R/FkAINd9k68k/qZkZ5K9USYkFRdBCDxkOiYfobLnpkd4dCf6Vfu0DU
	fMAZFmXOhMA/jusQY9gysCq1wDYQhgC6qhsgs06K8vhdp06RHQx/T25IuPSaQdT64bKBUO
	wlsox6B2odrSmI2WyJl8PKcwlJTD4H0HAZPy1DhFUNqKHFReAef9XSaDUoPEa09vBGHP0r
	SuRv/aY5iDE1SKaW8Qk+cyzzhnDFzFCWuEtnbtqOvLRHKHU9FHx2yWHTkqzQEHFy6Vsk6y
	WBoTCfWl4Ix+tTZpxVx6eaz6dR1wYn+AYejtgD2/31OG/z9EAzSpNj+3Se0MAw==
Date: Mon, 28 Oct 2024 15:09:51 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] swig: update 4.2.1 -> 4.3.0
Message-ID: <Zx-bL-Eir-qb_gE9@bootlin-mathieu>
Mail-Followup-To: Markus Volk <f_l_k@t-online.de>,
	openembedded-core@lists.openembedded.org
References: <20241026070941.309659-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241026070941.309659-1-f_l_k@t-online.de>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 14:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206448

On Sat, Oct 26, 2024 at 09:09:41AM +0200, Markus Volk wrote:
> - refresh patch
> 
> SWIG-4.3.0 summary:
> - Add experimental support for C as a target language.
> - MzScheme/Racket is deprecated and planned for removal in SWIG-4.4.
> - The distributed Windows binary is now a 64-bit executable.
> - Add some missing use of move semantics for performance improvements.
> - Enhanced handling of namespaces when using the nspace feature.
> - STL wrapper enhancements for std::unique_ptr, std::string_view,
>   std::filesystem.
> - Various enum and enum class wrapping improvements.
> - Other C++ handling improvements around templates, friends, C++11
>   trailing return types and C++17 fold expressions.
> - Many parser improvements for both C and C++, especially expressions.
> - Improvements to handling of string and character literals.
> - Minor preprocessor fixes.
> - Python: Stricter stable ABI conformance, add support for python-3.13.
> - C#: Add support for converting Doxygen comments into XML C# comments.
> - Various other target language specific enhancements and updates for
>   Java, Javascript, Lua, MzScheme, Ocaml, Octave, Perl, Python, R, Ruby.
> 

Hi,

I suspect this patch is responsible of some failures we observe on the
autobuilder:

/srv/pokybuild/yocto-worker/meta-virt/build/build/tmp/work/x86_64-linux/python3-dtc-native/1.7.0/git/pylibfdt/libfdt_wrap.c:5598:17:
error: too few arguments to function ‘SWIG_Python_AppendOutput’
     resultobj = SWIG_Python_AppendOutput(resultobj, val);

https://valkyrie.yoctoproject.org/#/builders/89/builds/300/steps/16/logs/stdio
https://valkyrie.yoctoproject.org/#/builders/6/builds/328/steps/11/logs/stdio

Can you please have a look at this failure ?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
httpse//bootlin.com

