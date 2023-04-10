Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C78ACC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:00:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.40627.1681117212725497057
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WK/BimRm;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117211; i=@fujitsu.com;
	bh=Hq1RyS5OvLcNaZUYpcFGH3DCuNWU64ebCewB3LsoWac=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WK/BimRmr6leAw+00EE/2nla5+k/pChp7puxAxdRfL2b8m8WOeZE8mUe7qgOeAcvC
	 oA8vvddLmUm9F8tGwtLqNtLRfGP5Iz+jnxgTow334WqiivTvneXvf48ASsFKZC9mMZ
	 Cb3h9XUduI5gaqvRhhr7TSY4ZQ4SsgoOw9ygDB4nIiIgnPPDdwc5BKbo57mUb6mB3s
	 Omydw5oMkw4Fth7TSH+/RCNdwc2W+3eVDBlTq1Xq+LPXGfIQvXdv7xTimqccAlBoaY
	 2FdEf6sOlMyLTO9ToIVqlRNQO4TBU2krYA/jq9A7TVA7lgZtzOiZzuLC3skg7qQ81H
	 +FxNDjGS74DJw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8OxWVfqgnG
  KwavDehZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aJk9/YCtZxV3zs62NtYOzk6mLk4hASeMAo
  0bp+GmMXIyeQc5lJom2ZJURiD6PE4xk/WEESbAJSEjfu/2frYuTgEBHQk7j6TxQkzCygIvHid
  w87iC0sYC7x488GMJtFQFXiwM4dYDavgJPE+m1TWUBsCQEFiSkP3zOD2JwCzhJbHu9lBRkpBF
  RzaYM5RLmgxMmZT1ggxktIHHzxghmiVVFi9uVmqDEVEo3TDzFB2GoSV89tYp7AKDgLSfssJO0
  LGJlWMZoVpxaVpRbpGhrrJRVlpmeU5CZm5uglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibn
  pOjlpZZsYgQGbkqxeusOxp99f/UOMUpyMCmJ8nZxGacI8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uA1OAuUEyxKTU+tSMvMAUYRTFqCg0dJhDfrPFCat7ggMbc4Mx0idYpRUUqclwMkIQCSyCjNg2
  uDRe4lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK82w4DTeHJzCuBm/4KaDET0GIuFwOQxSW
  JCCmpBqYL227Muv76+q4Gjv8TfGVOP7O4be8pYnL2NGP/M0PBO9rXm0N+7dJr/nDiku4CA0GO
  1/XpUbPvKb1bKviy4uBXawZHntIVOzeVMrD4vtxWwRWzgCes6vCcmc//XMkv5X23tur9x50MJ
  VbzxM9NUA75efPRoVb3q1H2vJb2yV+PrJ2zQIYr7rbVtYwZ5qobhPTNr00Jljou/7GncVfaC9
  UzHy3WX/p3Q+9J8fzVgaprUidN9J659kz8fYvW/U+7K2XX/b8WIsLkzsmoX33P5NHOPN7I7El
  n4mqbKw/8ETZ5u7ubL9zQe47ERPUcvuUuEj0XSyNmvX7e8tGjwbZXcJqC44/bj86GOK9OTkzv
  b5VQYinOSDTUYi4qTgQA25Yq5lcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-565.messagelabs.com!1681117210!290399!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17368 invoked from network); 10 Apr 2023 09:00:10 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-22.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:00:10 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 778D216C
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:00:10 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 69FDA159
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:00:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:00:09 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ccache: upgrade 4.7.4 -> 4.8
Date: Mon, 10 Apr 2023 16:59:33 +0800
Message-ID: <1681117175-24783-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681117175-24783-1-git-send-email-wangmy@fujitsu.com>
References: <1681117175-24783-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179855

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 bump: Upgrade to doctest 2.4.10
 chore: Update copyright years

Changelog:
https://ccache.dev/releasenotes.html#_ccache_4_8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ccache/{ccache_4.7.4.bb => ccache_4.8.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.7.4.bb => ccache_4.8.bb} (82%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.7.4.bb b/meta/recipes-devtools/ccache/ccache_4.8.bb
similarity index 82%
rename from meta/recipes-devtools/ccache/ccache_4.7.4.bb
rename to meta/recipes-devtools/ccache/ccache_4.8.bb
index 0419d07c4e..6cad0dd7c6 100644
--- a/meta/recipes-devtools/ccache/ccache_4.7.4.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.8.bb
@@ -7,14 +7,14 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=8fc2cae2bbabeb9236cacfa1c83a3dc5"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=43a02b74c9eb73a0b978ae5082f5f1b6"
 
 DEPENDS = "zstd"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-xxhash.h-Fix-build-with-gcc-12.patch \
            "
-SRC_URI[sha256sum] = "dc283906b73bd7c461178ca472a459e9d86b5523405035921bd8204e77620264"
+SRC_URI[sha256sum] = "ac4b01748fd59cfe07e070c34432b91bdd0fd8640e1e653a80b01d6a523186b0"
 
 inherit cmake github-releases
 
-- 
2.34.1


