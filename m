Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0856C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 16:40:31 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.612.1750783226087336839
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 09:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=p7cTvu1r;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d38b84984dso101520385a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 09:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750783224; x=1751388024; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ADw7Fq3xAYaYna53U7zvQgczKUuYICCs/UxNQmcjiks=;
        b=p7cTvu1rw5M+PQ9Lh3fvuZ2VDDwK9JIXpPqJPr2N6ZaUX9Z2eMIwQ7WeplcCAXX6Ac
         h1dR/LtISY/RDRfKs3eUOweYaEfHdWGvLCAKSOESUCckgDbYIq4zA8fl4EE6gvBh9U2b
         OAtX2G/HxZ95O4nos6TAIK1Y9Xemi/hv1S/H08IcWGMHZ21f+qsRBO/kTzpTgQTQqk7a
         EUBCLvNvw2VezIepB/yzRGfW7VDPwmwBSrwh8Fpu1BC8yWZ8HTU+8+GBX/5tkZWDR1le
         Wwh/L3TloCe2RecRQ2gyX4UQC9cQxfaPC9hADAzt7BQY7aE9xOUPWndrFBewesiujI1/
         kbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750783224; x=1751388024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ADw7Fq3xAYaYna53U7zvQgczKUuYICCs/UxNQmcjiks=;
        b=imnGYloxjputx+GRwNApf/65mDwG+K2Dg6Jwg0um8ZlBjYfr0S6tfv87Ld9LMdBWrd
         C0or8gISikeKtjWnGjB3Rd6fq6dzyaFhfxKGQ1OdbEOrUSpUO01QOmmclbEomEozr0oX
         iQ8HVIMl9j/4WNYxfwkWvJkPMVtSJMleRk0SEHbH8NkexxgMIP0NSjR9yAWYkk0rzNuQ
         6xwwQtPDIpLy0uH3MYzDnBZp15+0raXx7iJv07MLbR4Lc6a0TELQGq3B5i0vYXLClRVK
         1XZhS9nXNB9GbFHVr0AS7lPfsjEpOpKpgyhMv7pkWTUT1tP/zFoBHjQqf103GxHdiKYX
         63jQ==
X-Gm-Message-State: AOJu0YxGFI5Ooc+IAnK1xPyiAHWU0Q6wQ6qruaPF/rQYg/qgNM+FqiF5
	C34KKzc6zXLYMAGFfl/vh9h53RcYtmlubDohwWc3+D0fDrg31tyrvE5SGpmRmpKghWVn4v63jiX
	8ntOW
X-Gm-Gg: ASbGncsCQ3cPYFGbRohRXHmsaGl1cL3wW5yKAgr6k8Aswt1S+Jg2gFjfOQ+ejpVel+1
	rxcyHyCluiy7sN5spO2Qb+QM1bTeYgvMreQm4eGQD24P7qHi9d6df1KWVCPSDT0rvwNvyW+9Zlu
	7byEYWzVxCinOibLluT93bzEMtX4YV9g9Awkb80vANDvFGs5twAwoHh9Wk16x3+PWcZN16x6Jg9
	5MAlJNYG+4t0TkOXRjHRJ1gHJnEAwPs4I7Ln9tB6yyJATMS7er34YxW8uuCbIQ0wpLcn9vlZejA
	wui2865u6WAnaoDCXQDKEQ9JyGuxIWpTYIz5WpudXPt2sj9QZaZKG9Ms3rhnWuug59xfjwcfrI3
	l6n0lF2xxd3NHUanz1cWVIZXrL5qhUH8=
X-Google-Smtp-Source: AGHT+IGAyty9X9d/soXvRt+oZ6Seky7Luwmb6yXemcrFoOZZ8qB0bMzwXD7AohaXBSSPmJW2AbiX6A==
X-Received: by 2002:a05:620a:4610:b0:7ca:cd16:b433 with SMTP id af79cd13be357-7d3f993267cmr2561248285a.31.1750783223740;
        Tue, 24 Jun 2025 09:40:23 -0700 (PDT)
Received: from [192.168.40.101] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f999bfdasm524836985a.1.2025.06.24.09.40.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 09:40:23 -0700 (PDT)
Message-ID: <69af360c-ac06-4dd9-80f9-0426801f87ef@baylibre.com>
Date: Tue, 24 Jun 2025 12:40:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] python3-smartypants: upgrade 2.0.0 -> 2.0.2
To: openembedded-core@lists.openembedded.org
References: <184C0730C2A01763.23851@lists.openembedded.org>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <184C0730C2A01763.23851@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 16:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219275


On 2025-06-24 12:24, Trevor Gamblin via lists.openembedded.org wrote:
> Changelog (https://github.com/justinmayer/smartypants.py/blob/main/CHANGES.rst#releases-20-and-greater):
>
> Release 2.0.2 (2025-06-17)
>
> - Fix double closing quotes after an HTML block
> - Fix regular expressions and tests for Python 3.12+
> - Move documentation to ReadTheDocs
>
> Release 2.0.1 (2017-12-20)
>
> - use re.match instead of re.search to improve performance on large strings
>
> The patch '0001-Change-hash-bang-to-python3.patch' needed a refresh to
> apply on the latest version.
Forgot the License-Update line, will resend shortly.
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>   .../0001-Change-hash-bang-to-python3.patch    | 24 ++++++++++++-------
>   ..._2.0.0.bb => python3-smartypants_2.0.2.bb} |  4 ++--
>   2 files changed, 17 insertions(+), 11 deletions(-)
>   rename meta/recipes-devtools/python/{python3-smartypants_2.0.0.bb => python3-smartypants_2.0.2.bb} (67%)
>
> diff --git a/meta/recipes-devtools/python/python3-smartypants/0001-Change-hash-bang-to-python3.patch b/meta/recipes-devtools/python/python3-smartypants/0001-Change-hash-bang-to-python3.patch
> index aab16eaab4..63bd523cb7 100644
> --- a/meta/recipes-devtools/python/python3-smartypants/0001-Change-hash-bang-to-python3.patch
> +++ b/meta/recipes-devtools/python/python3-smartypants/0001-Change-hash-bang-to-python3.patch
> @@ -1,4 +1,4 @@
> -From e299bcb05405ff49450307bf3002c1fac14a866c Mon Sep 17 00:00:00 2001
> +From 7425e49166e6f16743ec9528697d06bc4103dc5e Mon Sep 17 00:00:00 2001
>   From: Tim Orling <tim.orling@konsulko.com>
>   Date: Sun, 20 Feb 2022 18:55:50 -0800
>   Subject: [PATCH] Change hash bang to python3
> @@ -9,6 +9,9 @@ Upstream-Status: Inappropriate [oe-core specific]
>   
>   Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>   
> +Update to apply on v2.0.2.
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>   ---
>    setup.py       | 2 +-
>    smartypants    | 2 +-
> @@ -16,32 +19,35 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>    3 files changed, 3 insertions(+), 3 deletions(-)
>   
>   diff --git a/setup.py b/setup.py
> -index ff1ea76..96a8b73 100755
> +index c183fc0..e10d757 100755
>   --- a/setup.py
>   +++ b/setup.py
>   @@ -1,4 +1,4 @@
>   -#!/usr/bin/env python
>   +#!/usr/bin/env python3
> - # Copyright (C) 2013, 2014 by Yu-Jie Lin
> + # Copyright (c) 2025–present Justin Mayer
>    # For detail license information, See COPYING
>    
>   diff --git a/smartypants b/smartypants
> -index 189adf5..0cca568 100755
> +index 1dabf7d..20c130e 100755
>   --- a/smartypants
>   +++ b/smartypants
>   @@ -1,4 +1,4 @@
>   -#!/usr/bin/env python
>   +#!/usr/bin/env python3
> - # Copyright (c) 2013, 2014 Yu-Jie Lin
> + # Copyright (c) 2025–present Justin Mayer
>    # Licensed under the BSD License, for detailed license information, see COPYING
>    
>   diff --git a/smartypants.py b/smartypants.py
> -index a70575b..e53bd87 100755
> +index 62c1472..a440d14 100755
>   --- a/smartypants.py
>   +++ b/smartypants.py
>   @@ -1,4 +1,4 @@
>   -#!/usr/bin/python
> -+#!/usr/bin/env python3
> - # -*- coding: utf-8 -*-
> ++#!/usr/bin/python3
> + # Copyright (c) 2025–present Justin Mayer
> + # Copyright (c) 2017 Leo Hemsted
>    # Copyright (c) 2013, 2014, 2016 Yu-Jie Lin
> - # Copyright (c) 2004, 2005, 2007, 2013 Chad Miller
> +--
> +2.49.0
> +
> diff --git a/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb b/meta/recipes-devtools/python/python3-smartypants_2.0.2.bb
> similarity index 67%
> rename from meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
> rename to meta/recipes-devtools/python/python3-smartypants_2.0.2.bb
> index 9bb07eab52..a439f8a880 100644
> --- a/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
> +++ b/meta/recipes-devtools/python/python3-smartypants_2.0.2.bb
> @@ -1,12 +1,12 @@
>   SUMMARY = "Translator of plain ASCII punctuation characters into 'smart' typographic punctuation HTML entities"
>   HOMEPAGE = "https://pythonhosted.org/smartypants/"
>   LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=977036977591ac666c728921ecc54c4f"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=ca325788d94ee694fef2a308c5073454"
>   
>   inherit pypi setuptools3
>   
>   PYPI_PACKAGE = "smartypants"
>   SRC_URI += "file://0001-Change-hash-bang-to-python3.patch"
> -SRC_URI[sha256sum] = "7812353a32022699a1aa8cd5626e01c94a946dcaeedaee2d0b382bae4c4cbf36"
> +SRC_URI[sha256sum] = "39d64ce1d7cc6964b698297bdf391bc12c3251b7f608e6e55d857cd7c5f800c6"
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219273): https://lists.openembedded.org/g/openembedded-core/message/219273
> Mute This Topic: https://lists.openembedded.org/mt/113810198/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

