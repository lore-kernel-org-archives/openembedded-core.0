Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40387C77B77
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 08:08:41 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.49397.1681718912439019818
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 01:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tj5RvtUM;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681718910; i=@fujitsu.com;
	bh=LuhVPktsoPVT4lElpVoMm4LWgSNxoDZOslQ6VFqQpsc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tj5RvtUMEo3yc+yi5sDh8pMfODCbr8I/QjTuHv75qnKpC4k9GOTsiWsgHqptKJbJ/
	 QSO8VZFwk6+cytAGvAI14RszuIEWNzeQ1beXSNexpdup5AxziOgZYNyFL31AltH3Sw
	 hAZ6JNiu9TJC7DLypHFsUUGQFdmF54J1916mQRQ1bC8BZGt9VuSSFqjA0qoaeiNmiN
	 kme8X28cU2ix6L9a1VtM6DwCFktrpBuK9MZutqUx+5faMy7n03Btq1EfnvmOl0+SY/
	 +v8bQOm1dZZL+WYeKBp4N/K9oSxt2t3NT3aiLKseTWrnFM3aVPltxdRq8qH/murHA5
	 N2yhY50k/lEfQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqFv7zyb
  F4OsqFos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPy3CNsBdN5Kr43rmdsYPzB1cXIxSEk8JhR
  4tbqbawQznUmiQfbjrNDOHsZJVY8X8jcxcjJwSYgJXHj/n+2LkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAq4SpxZMBLNZBFQlrt1+yAZi8wo4SXw/eI4JxJYQUJCY8vA92EhOAWeJB2/aWEBsIa
  CauYuuMEPUC0qcnPmEBWK+hMTBFy+YIXoVJWZfbmaBsCslWj/8grLVJK6e28Q8gVFwFpL2WUj
  aFzAyrWI0LU4tKkst0jXUSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM3ZRi5Yk7GFf0/tU7xCjJwaQkyvsi1TpFiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gTvy582KUKCRanpqRVpmTnAOIJJS3DwKInwGj8DSvMWFyTmFmemQ6ROMSpKifO+/gOUEABJZJ
  TmwbXBYvcSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFe9r9AU3gy80rgpr8CWswEtFhOCWx
  xSSJCSqqBaWbQgjuNTrvSah7avw2R6uVm//FH6NYSy0/Vlu6djbfXhgf1T0zI0vXblCd0wM0o
  9bTC1PTzSheiGLJtS+K9n/o4r/SxebIt6m82B2PDJYVv10yCthzO/v9d6ZR/UfHZy4nWace1/
  uTcS+noOnXwp11EzKHTM/bLSq2IFOVg+LG5mUOUcd75x7enJxhV3C7aW+szw+nvpwNib7gLV/
  VPDGjcwnWqO/FRwXGuoz3GbEcj5RebpD5893cJw96Xz3x+HNNUUFDRnVHNc2XW49v2q6V3azR
  FBexYmMsTcblLdsXJih8rjuu57W2exxDc38Npc43Z+5zslUmCS8pmv2/+pxbIYrv7If9+74iu
  ePX1SizFGYmGWsxFxYkAzXnATlgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-548.messagelabs.com!1681718908!300075!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17936 invoked from network); 17 Apr 2023 08:08:29 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 08:08:29 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C06541001A1
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:08:28 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B310D100194
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:08:28 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 09:08:27 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-dtschema: upgrade 2023.1 -> 2023.4
Date: Mon, 17 Apr 2023 16:07:54 +0800
Message-ID: <1681718877-19480-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681718877-19480-1-git-send-email-wangmy@fujitsu.com>
References: <1681718877-19480-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 08:08:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180153

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Schemas:
 - Add missing PCI descriptions and properties
 - Add I2C clock stretching property
 - Add 'firmware-name' property
 - Add UEFI chosen properties
 - Enable cache schema

Meta-schemas:
 - Improve checking non-patterns in patternProperties
 - Allow 'not' at top-level of schemas
 - Relax meta-schema checks on referenced schemas

Tools:
 - Handle examples with 'interrupt-controller' node

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dtschema_2023.1.bb => python3-dtschema_2023.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2023.1.bb => python3-dtschema_2023.4.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2023.1.bb b/meta/recipes-devtools/python/python3-dtschema_2023.4.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dtschema_2023.1.bb
rename to meta/recipes-devtools/python/python3-dtschema_2023.4.bb
index 74ca55cf04..f87563facd 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2023.1.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2023.4.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "8fc8c269e4c57e9d008af7b32cd33b77afd4ea1ac9552bcfa96b41b9e0c52586"
+SRC_URI[sha256sum] = "6daefb8f54403b4d82961b3346571200571747ab01950fd36c1f69950fa7a8cf"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
-- 
2.34.1


