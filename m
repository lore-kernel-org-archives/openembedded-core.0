Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28564C63797
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 05:25:57 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.134765.1673760356157880332
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 21:25:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=C1AygaHh;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673760354; i=@fujitsu.com;
	bh=k9ktfmigzSo4/5zIkaM1j50K/W7yiWICJQLCLkqs6X8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=C1AygaHheo0IR3RRUGN6KljzGtV/EsHNU1LJR6G+WIURmi5rfNBp1NslZaaJ+UhKN
	 kLh3bJFWyZojlqUSzTRAl8C3EzullvGUZsPMtEdjTcJhBqyGvz3DPIcd3i86rVBEje
	 fcNPcRgLphIiC5Tf6nojJAKsJzcpNdxfn+6NG3JbkEvpbWMc7oomM9drLRXW8d/w94
	 wtqrZy79UEu9y7JDRshR3A0RLHUdy3h+xvu7ZJeCYfsn3yhRKxe07nXvlpJCWllN/l
	 7Me+GU1jmsMaZQrxj3pqFsK2YctPwm1js/XdyL/QJuUfRTBHkwSPq/txgWJr93q/pZ
	 pvH5LR4kEK2mA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRWlGSWpSXmKPExsViZ8OxWTex73C
  yQcM1FYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePHTrOCibwVW+7eZmtgfM/dxcjJISTwgFFi
  /vrcLkYuIPsyk8TCNyvZIZy9jBJHXq9kAaliE5CSuHH/P1sXIweHiICexNV/oiBhZgEViRe/e
  9hBbGEBJ4l9i54wgpSwCKhK7LugARLmFXCUOLPlB9gUCQEFiSkP3zNDxAUlTs58wgIxRkLi4I
  sXzBA1ihKzLzdD1VdKtH74BWWrSVw9t4l5AiP/LCTts5C0L2BkWsVoWpxaVJZapGuml1SUmZ5
  RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KXl1qyiREYhCnF7AU7GGcu+6N3
  iFGSg0lJlDfy26FkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8GxoPJwsJFqWmp1akZeYAIwImL
  cHBoyTCq90BlOYtLkjMLc5Mh0idYlSUEud90QOUEABJZJTmwbXBovASo6yUMC8jAwODEE9Bal
  FuZgmq/CtGcQ5GJWHepyBTeDLzSuCmvwJazAS0OKT+IMjikkSElFQDk+ODybWhi7k4Td8t7Pg
  kx33UvOSXXPE+ZaXdskr7lnw1U1dVnLW5Ke7I3kWfde45SL0wP7G4y0vB7ubie08K9eYtiwzS
  kH3ffChZ7ZtrRdyt5tX6xxc6mR9c/Ic9b1brSt/Fz95cllt4au/VJ3014sr79q36fUBbL7H/8
  mX7d/N62f6yse1ntuDOPVxQvSUr7MxzkXOxTzPsko4uUsqa+plpprtE5AxFrqayG6sXMDC90I
  g6fCpg0p61YUezZtg9XxOlFy2/vSZ9a1NIyfxG74c7s2efVFV5W1AoE/jgxw/Pb6t8RRPlZrs
  E+kaVZzJoVlxf9qrz2JVrlnaneu8v/3pt1sfX5iKzurT++fQeiFdiKc5INNRiLipOBAAPhO4o
  PQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-587.messagelabs.com!1673760353!233771!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31631 invoked from network); 15 Jan 2023 05:25:53 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-21.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jan 2023 05:25:53 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 3EE6E142
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:25:53 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 3346973
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:25:53 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 15 Jan 2023 05:25:51 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-packaging: upgrade 22.0 -> 23.0
Date: Sun, 15 Jan 2023 13:25:37 +0800
Message-ID: <1673760341-2623-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175877

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Allow "extra" to be None in the marker environment (:issue:'650')
 Refactor tags._generic_api to use EXT_SUFFIX (:issue:'607')
 Correctly handle trailing whitespace on URL requirements (:issue:'642')
 Fix typing for specifiers.BaseSpecifier.filter() (:issue:'643')
 Use stable Python 3.11 in tests (:issue:'641')
 Correctly handle non-normalised specifiers in requirements (:issue:'634')
 Move to src/ layout (:issue:'626')
 Remove __about__ file, in favour of keeping constants in __init__ (:issue:'626')

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-packaging_22.0.bb => python3-packaging_23.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_22.0.bb => python3-packaging_23.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-packaging_22.0.bb b/meta/recipes-devtools/python/python3-packaging_23.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-packaging_22.0.bb
rename to meta/recipes-devtools/python/python3-packaging_23.0.bb
index 22f066416b..7b69c880c1 100644
--- a/meta/recipes-devtools/python/python3-packaging_22.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_23.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "2198ec20bd4c017b8f9717e00f0c8714076fc2fd93816750ab48e2c41de2cfd3"
+SRC_URI[sha256sum] = "b6ad297f8907de0fa2fe1ccbd26fdaf387f5f47c7275fedf8cce89f99446cf97"
 
 inherit pypi python_flit_core
 
-- 
2.25.1


