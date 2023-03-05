Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF48C6FA9E
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 08:05:25 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.5183.1678003524353679131
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Mar 2023 00:05:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qb7ICd3a;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678003522; i=@fujitsu.com;
	bh=N7OrTK9B6D71EbyOY3oFsW1e0F3Mi3LgYDGmK37IirA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qb7ICd3aDha4gEl0d3BE+ZKIQDoAuIyzFvDUA+Mvh+Rw/BXFlKeyJpQrsEAb11i+6
	 PmRJ9jj0qLyVJGEYH7c8xm3biTe8ySz4fJS9yOyKjquWoyEcBi+H1GSoykpWGpO8CW
	 at9J4DnaQmgL2groVgbGeMun+1XOoOgdYERK9zIBQKUj13T8zSe/l9DDYkWurZMY6r
	 ZudU4FaU+oArecXcIA4sxNbJxDIMbUZiB+aiTM34GUAvzKAtMCkfdnxqZIAHa9YjVg
	 xNJx2tfzlzqM1xmjSFelsyjh8koYY9Ucx/sgDxOeQAEAqId9yr/DLvVfGidC0KuFvr
	 ynW/6mf3aLdvA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8OxWdfJlyX
  FYMp0Zos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPZ4QaWghtcFWuuzmBrYNzP2cXIxSEkcJ9R
  YuuVHlYI5zKTxN2tz1i6GDmBnD2MEpsvBYPYbAJSEjfu/2frYuTgEBHQk7j6TxQkzCygIvHid
  w87iC0sYC2x5VwXmM0CFD+wppkZxOYVcJJYdeEgE4gtIaAgMeXhe7A4p4CzxIo5L1khVjlJXF
  97mx2iXlDi5MwnLBDzJSQOvnjBDNGrKDH7cjMLhF0p0frhF5StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjaXFqUVlqka6JXlJRZnpGSW5iZo5eYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5yTope
  XmrJJkZg4KYUs77dwfi/96/eIUZJDiYlUd7AX8wpQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4n
  7qxpAgJFqWmp1akZeYAowgmLcHBoyTC+9ATKM1bXJCYW5yZDpE6xagoJc67xRsoIQCSyCjNg2
  uDRe4lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8Th5AU3gy80rgpr8CWswEtFjjNAPI4pJ
  EhJRUA9NMn4c8lpL7v7L9LLlUWbXUp/1cxizTqQ9fXgsIZfMJaly8te7L3wfhfRlTXZ/n98zL
  c5Y0vXzfb9OXyTycVj7l/YYnby7JnTTlX9oGPjYNw1fe/1PvM29sePVYxeYGx1pXCZYyoZsbe
  dcfXu61MT2v93J33erJdu5dphtvLJ1/OFe/Med+3hWvh7eNtFyfZVUXu3x5U1bSc/kly8Wjn7
  c8m9fwpW+PWnWnXOZ2/YPXeb5GbJF58EwxM4g/xH5yWYxxI2fl7XmLfOwf3y3sOr9T+BeTisi
  iutwf/GsST/c4aH/s/FuZPl1klvu8f5XR7YW7bjezHdlT/3XTetvuKz233y695nhq6599179X
  PN6gxFKckWioxVxUnAgArSupwlcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-591.messagelabs.com!1678003521!188472!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16060 invoked from network); 5 Mar 2023 08:05:22 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-23.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Mar 2023 08:05:22 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id A97537B
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:05:21 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 9DA6E73
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:05:21 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 5 Mar 2023 08:05:20 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] harfbuzz: upgrade 7.0.1 -> 7.1.0
Date: Sun, 5 Mar 2023 16:04:58 +0800
Message-ID: <1678003500-30452-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678003500-30452-1-git-send-email-wangmy@fujitsu.com>
References: <1678003500-30452-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 08:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178030

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- New experimental hb_shape_justify() API that uses font variations to expand
  or shrink the text to a given advance.
- Various build and bug fixes.
- New API:+hb_font_set_variation()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_7.0.1.bb => harfbuzz_7.1.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_7.0.1.bb => harfbuzz_7.1.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_7.0.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb
index 55421ebcbe..4406e15df4 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "2cf4d3d8f225007511990a36a34195f0d6562ca56df0a8b0885b382837948199"
+SRC_URI[sha256sum] = "f135a61cd464c9ed6bc9823764c188f276c3850a8dc904628de2a87966b7077b"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
 
-- 
2.34.1


