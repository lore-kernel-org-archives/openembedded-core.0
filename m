Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1317FC63797
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 05:26:17 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.134826.1673760364959868673
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 21:26:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TOy9bFCC;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673760367; i=@fujitsu.com;
	bh=paBSxF332/dBNjrDjv9TuzKlzbu+3xBkRcT4GC82Nmw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TOy9bFCCYs4aAbaQAocrE8+h36eQDMcnThNeHpILcem7jDzGr0iK93JGxS03kbnsc
	 S9/2Jv6WfYtuKcHEM5KCil2WOLKMMgmjbvDRNcuQCKbK5gDJQNMMH8scU/RaD5FNJQ
	 sPeZiQaevs1Myn0UpC6T+bO78rS5CQj0+uT1DWDDC1QlHwCw1TEqkDhFsJ3O10Qh2c
	 V3TLoY+8o+RmCJ9GLTDkj8oEgFZsuH5zvGviugtCwaidleicqkFpFyDcOC22OdbCMr
	 pTRljnueap7CmwMGPFuppMgnRjLGvGknVwl0bfXqR2CzLaMN4kIFzBAAdXuh/mYB18
	 2yTUXWIARsGxQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8MxSTev73C
  ywZp3zBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bX/tMsBc9kKvZ8eMXWwNgq0cXIxSEk8JhR
  4sGKhYxdjJxAznUmiacrDSESexklZm6dwgqSYBOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhAVeJues6wMpZBFQlZlycxwJi8wo4Sjx9tJoJxJYQUJCY8vA9M4jNKeAkcXj7J1aIvY
  4Ss6auY4eoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdKtH74BWWrSVw9t4l5AqPgLCTts5C
  0L2BkWsVoVpxaVJZapGuhl1SUmZ5RkpuYmaOXWKWbqJdaqpuXX1SSoWuol1herJdaXKxXXJmb
  nJOil5dasokRGLopxSnuOxiPL/ujd4hRkoNJSZQ38tuhZCG+pPyUyozE4oz4otKc1OJDjDIcH
  EoSvBsaDycLCRalpqdWpGXmAOMIJi3BwaMkwqvdAZTmLS5IzC3OTIdInWLU5fj45+JeZiGWvP
  y8VClx3hc9QEUCIEUZpXlwI2AxfYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO9TkCk8mXk
  lcJteAR3BBHRESP1BkCNKEhFSUg1M84NlmOTvqHSf872pJakb+VN9CsPzoCvnVh79njJjfVJs
  07s1tx57t7k0/z+/xn3jSmGxZxo6K7I3fF0d8me6/cP4Yy+fdhwrZNKdsjaNXfi09s6yP2E8v
  FWKZ1v2+iZfWZ/aZMa2MTXOJEm0Mb39h9ra+F9aSr/W/Az14zm8zDf0odA9V25th4ZbWbMnvX
  kdeNWRY/qs/RNYF54zmyVcKvJV1vTgWVENF6HHxp8a5xpP4z5wIOeaobvKKRG73Tc9lnuy9ie
  71u69uaDqoJGmtZLb7X/pVuqxigv+VKmVT1Q20um9ufKx9rnyJex3a3XOcpnp/N4m4CU7lWVP
  xPl79+1+eE+S1mleNzum82mAEktxRqKhFnNRcSIAVlxwY2QDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-745.messagelabs.com!1673760365!229485!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25176 invoked from network); 15 Jan 2023 05:26:05 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jan 2023 05:26:05 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7698A1000D2
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:26:05 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6AA1C1000C1
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:26:05 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 15 Jan 2023 05:26:03 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pygments: upgrade 2.13.0 -> 2.14.0
Date: Sun, 15 Jan 2023 13:25:39 +0800
Message-ID: <1673760341-2623-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673760341-2623-1-git-send-email-wangmy@fujitsu.com>
References: <1673760341-2623-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175879

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Added lexers:

  * Arturo (#2259)
  * GAP session (#2211)
  * Fift (#2249)
  * func (#2232)
  * Jsonnet (#2239)
  * Minecraft schema (#2276)
  * MIPS (#2228)
  * Phix (#2222)
  * Portugol (#2300)
  * TL-b (#2247)
  * World of Warcraft TOC format (#2244, #2245)
  * Wren (#2271)

- Updated lexers:

  * Abap: Update keywords (#2281)
  * Alloy: Update for Alloy 6 (#1963)
  * C family (C, C++ and many others):

    - Fix an issue where a chunk would be wrongly recognized as a function
      definition due to braces in comments (#2210)
    - Improve parantheses handling for function definitions (#2207, #2208)

  * C#: Fix number and operator recognition (#2256, #2257)
  * CSound: Updated builtins (#2268)
  * F#: Add ".fsx" file extension (#2282)
  * gas (GNU assembler): recognize braces as punctuation (#2230)
  * HTTP: Add 'CONNECT' keyword (#2242)
  * Inform 6: Fix lexing of properties and doubles (#2214)
  * INI: Allow comments that are not their own line (#2217, #2161)
  * Java properties: Fix issue with whitespace-delimited keys, support
    comments starting with '!' and escapes, no longer support undocumented
    ';' and '//' comments (#2241)
  * LilyPond: Improve heuristics, add "\maxima" duration (#2283)
  * LLVM: Add opaque pointer type (#2269)
  * Macaulay2: Update keywords (#2305)
  * Minecraft-related lexers (SNB and Minecraft function) moved to
    "pygments.lexers.minecraft" (#2276)
  * Nim: General improvements (#1970)
  * Nix: Fix single quotes inside indented strings (#2289)
  * Objective J: Fix catastrophic backtracking (#2225)
  * NASM: Add support for SSE/AVX/AVX-512 registers as well as 'rel'
    and 'abs' address operators (#2212)
  * Powershell:

    - Add "local:" keyword (#2254)
    - Allow continuations without markers (#2262, #2263)

  * Solidity: Add boolean operators (#2292)
  * Spice: Add "enum" keyword and fix a bug regarding binary,
    hexadecimal and octal number tokens (#2227)
  * YAML: Accept colons in key names (#2277)

- Fix 'make mapfiles' when Pygments is not installed in editable mode
  (#2223)

- Support more filetypes and compression types in 'autopygmentize' (#2219)
- Merge consecutive tokens in Autohotkey, Clay (#2248)
- Add ".nasm" as a recognized file type for NASM (#2280)
- Add "*Spec.hs" as a recognized file type for "HSpec" (#2308)
- Add "*.pyi" (for typing stub files) as a recognized file type for
  Python (#2331)
- The HTML lexer no longer emits empty spans for whitespace (#2304)
- Fix "IRCFormatter" inserting linenumbers incorrectly (#2270)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pygments_2.13.0.bb => python3-pygments_2.14.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.13.0.bb => python3-pygments_2.14.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.13.0.bb b/meta/recipes-devtools/python/python3-pygments_2.14.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pygments_2.13.0.bb
rename to meta/recipes-devtools/python/python3-pygments_2.14.0.bb
index 59706cc200..16769e9263 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.13.0.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.14.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
 inherit setuptools3
-SRC_URI[sha256sum] = "56a8508ae95f98e2b9bdf93a6be5ae3f7d8af858b43e02c5a2ff083726be40c1"
+SRC_URI[sha256sum] = "b3ed06a9e8ac9a9aae5a6f5dbe78a8a58655d17b43b93c078f094ddc476ae297"
 
 DEPENDS += "\
             ${PYTHON_PN} \
-- 
2.25.1


