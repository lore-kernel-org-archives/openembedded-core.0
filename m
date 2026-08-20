Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C524FC5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 05:45:25 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.768.1787204719798640289
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 22:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dpfNg4Id;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3058; q=dns/txt;
  s=iport01; t=1787204719; x=1788414319;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DxBNqvxLtXxRbA4lN6wmtfG+4Ax9TfxtHjrxmqA5DXQ=;
  b=dpfNg4IdpBA81xmXyJzVhK5NwdneAIp6mwY4ZIRg25X76814qKC/nHQn
   hOVK1Jf55lE19WsssXpFTkMS72hZUgCHceoBuj58dYZi3N2w927rjSIH2
   snaTUNtqiDRSJfygV5+z5it+0KaGYxF2lgtmGHllglljtNr9/Um0vq8Ok
   8Do/LWlACFpHdyinX3t8Clz88BGNQ0ewGg75j1N9Va7Cypc6tqUcOtU3k
   xrhLTKw2TKVIhqr5p1u46Tu4vwilkSWUusyq/bwJM51BRLiY4iA2qrLZW
   cEKy7pmtJqFp8Fxp0fULDvnt8vaJKa0dEkQwFOckbkTpatj+4mUfAnNAL
   A==;
X-CSE-ConnectionGUID: Tr4BWGpKRU+ib3vtIQ67GA==
X-CSE-MsgGUID: vWoqG1k1TiWhvy4czUzZBw==
X-IPAS-Result: =?us-ascii?q?A0CUAwBXk4Zq/5EQJK1ahTB0XkNJlV5sA6AZDwEBAQ9ED?=
 =?us-ascii?q?QQBAYQ/RgKNawImOBMBAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Th?=
 =?us-ascii?q?k8NhlsCAQMnCwEYAS0QIDErKxmDAgGCdAMRBsIrgXkzgQGDKAExAwEB3E4BC?=
 =?us-ascii?q?xQBgTiFP4gidQGEfCcbG4FygRWDaYJhAgKBJRABhm0EgiJ6EpNKSIEeA1ksA?=
 =?us-ascii?q?VUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIQ3Ixk2fIEJXoErKmEBE?=
 =?us-ascii?q?heBCYIKAoJwggYCAUlFDgkXCxgNSBEsNxQZBD5uB45RIIFPfIEOCyABT4Epl?=
 =?us-ascii?q?CQKkXyBNZ9aCiiDdowhlToaM4VbpRGZCI4KllCEaYF/JYFZcBWDIglKGQ+OL?=
 =?us-ascii?q?QEVg2CEWMdhJzICOwEBBwIHDgMLgWiQAAEngVYBAQ?=
IronPort-Data: A9a23:CBYd+6752zG9ESOWgPcmeQxRtA7GchMFZxGqfqrLsTDasY5as4F+v
 mIaWD/TPvjYMDejetl3boiw9B9Qu8LWnIUxT1Bp+SgwZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajJNuvrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eAZdE0NlYGUJ0y
 L8ZImsTcjG62b2Z6efuIgVsrpxLwMjDNYcbvDRkiDreF/tjGcCFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0An1lQ/UPrSmM+khXT7ejxJoXqepLE85C7YywkZPL3FYIOJJILaHpsP9qqej
 nz5+H3WWxJDCN2gySSUrnm+u/39tzyuDer+E5X9rJaGmma7w2UPCBwbSB23vPO+i1X7UcheI
 koY0iApqrQ29UrtRd74NzWkoXvCuQQYWtxfO+497hqQzqnTpQ2eAwAsVD9KaNU8uIkuWCYm1
 1Khm9LvGCxht6CTRXuB97CS6zSoNkA9KncPYyIBRwYJ79Tv5Yo0lB/nStd4DLXzicX4Hzz1y
 T2GoCUywbIJgqY2O76T9FTDhXeo45POVANwvlWRVWO+5QQ/b4mgD2C11WXmAT97BN7xZjG8U
 LIswaByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:bzqbr6Fh6CCfwfq2pLqEyseALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AGY1hPmr3Z4A/LXeWb1MFx5PmUfw/Llfi42/zGXL?=
 =?us-ascii?q?7CGwyVqG0cAHP14oxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A+uChGA7jxfgksHzWXA/CaySbxox23KO3JxkOyKk?=
 =?us-ascii?q?HhMmaJHB7KQqPvh6oF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="814668362"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 05:45:18 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id AA0EC18000200;
	Thu, 20 Aug 2026 05:45:18 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 49A04CCD9B2; Wed, 19 Aug 2026 22:45:18 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 2/2] python3-pyasn1: upgrade 0.6.3 -> 0.6.4
Date: Wed, 19 Aug 2026 22:45:13 -0700
Message-Id: <20260820054513.1485187-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260820054513.1485187-1-dkelaiya@cisco.com>
References: <20260820054513.1485187-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 05:45:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243802

From: Tim Orling <tim.orling@konsulko.com>

Upstream release notes:
https://github.com/pyasn1/pyasn1/blob/main/CHANGES.rst#revision-064-released-08-07-2026

Revision 0.6.4, released 08-07-2026
* CVE-2026-59885 (GHSA-8ppf-4f7h-5ppj): Fixed quadratic time complexity
  in the OBJECT IDENTIFIER and RELATIVE-OID decoders. A small crafted
  substrate encoding many arcs could consume excessive CPU. Arcs are now
  accumulated in linear time; decoded values are unchanged (thanks for
  reporting, tynus2)
* CVE-2026-59884 (GHSA-m4p7-r5rc-7g4j): Limited BER long-form tag IDs to
  20 octets (140 bits), matching the OID arc limit introduced in 0.6.2.
  Unbounded tag IDs allowed a crafted substrate to consume excessive CPU
  and memory; longer tag IDs are now rejected with PyAsn1Error. Also fixed
  Tag and TagSet repr() failing on huge tag (thanks for reporting,
  mikeappsec) IDs due to the integer-to-string conversion limit (Python
  3.11+)
* CVE-2026-59886 (GHSA-hm4w-wwcw-mr6r): Fixed excessive memory and CPU
  consumption in Real.__float__() for values with large base-10 exponents.
  Conversion no longer materializes huge intermediate integers; values too
  large to represent as a Python float raise OverflowError promptly, and
  prettyPrint() renders them as '<overflow>' as before. Also fixed base-10
  mantissa normalization to use exact integer arithmetic; mantissas larger
  than 2**53 could previously lose precision through float division (thanks
  for reporting, gvozdila)
* Pinned PyPI publish GitHub Action to an immutable commit

For full comparison of changes, see:
https://github.com/pyasn1/pyasn1/compare/v0.6.3...v0.6.4

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3654efbe3e732b0ae0f44e4c71c2473e719f83ef)
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python/{python3-pyasn1_0.6.3.bb => python3-pyasn1_0.6.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyasn1_0.6.3.bb => python3-pyasn1_0.6.4.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.4.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
rename to meta/recipes-devtools/python/python3-pyasn1_0.6.4.bb
index 60b38c57c5..086a21ffe8 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[sha256sum] = "697a8ecd6d98891189184ca1fa05d1bb00e2f84b5977c481452050549c8a72cf"
+SRC_URI[sha256sum] = "9c447d8431c947fe4c8febc4ed9e760bc29011a5b01e5c74b67025bd9fb8ce81"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.35.6


