Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC9DC54E58
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:40 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.10806.1710313778251336825
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iklJKKFN;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313778; x=1741849778;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=V5kMUH10ThsaXTfaBxi+MAubH3PAkRgyUePtd5Uow7w=;
  b=iklJKKFNZe1Bz1eMagq5xNmPwdVl44GJ4my4jWZy/xlxpdKobaMjbmWs
   LZjG70NGw6mSC8FrlKq9oyQVx2yLwpmqux7FmNX0Emq5GTAA9bRo4ynf5
   ZhtLQKhD8z4YSkn30u9eDVyr+or+4jKOvwyMUzf0XMlZwNMEriS6w5rxl
   OL4OuyF+YEP4DfQ3gg+iiQzBX3mx84QVICv0HqOPtPCuP3eTUfbfFv8Am
   5WfdrPed118ZgRib4AcY/v8ipAGxwJp6SzDJWw4+peeSN6Wu3eZwAUh4g
   uu/8TpAjPoa0mNfyIoKIWlM75h/8dQ4KuNWdOYoU3ye+f8bmvT/MsQXzI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="131486902"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="131486902"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:36 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3059FE6009
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6EE50D1EED
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 07E6720097CD1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A8E831A006B;
	Wed, 13 Mar 2024 15:09:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 30/36] repo: upgrade 2.42 -> 2.44
Date: Wed, 13 Mar 2024 15:08:28 +0800
Message-Id: <1710313714-12541-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10-2.618400-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yfx0ykrbAxjCRzUPAqhCjtiO7PyvQAVVyiFL
	Sh+QCTPZIvrftAIhWmLy9zcRSkKatYgrKnsJ1GRgOwpfLMeBwRuC7C2rJeUToeh+xVJZnrh8lIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzTn5oXlYVa0HQaW
	WmSFa05GXLkTlsJmGTnt475TCUbf0GArFUiZeswUGpRWd/1A7SdY30h1Jg7tiZSX5l4cyVahFcr
	5u8RM9KiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197032

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.42.bb => repo_2.44.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.42.bb => repo_2.44.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.42.bb b/meta/recipes-devtools/repo/repo_2.44.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.42.bb
rename to meta/recipes-devtools/repo/repo_2.44.bb
index 9bb5000fab..875897851a 100644
--- a/meta/recipes-devtools/repo/repo_2.42.bb
+++ b/meta/recipes-devtools/repo/repo_2.44.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            "
-SRCREV = "5554572f02537b8646139d59ab520e59e1d5f7b3"
+SRCREV = "fff1d2d74c2078b62cc9c2561330e41a842dc197"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.34.1


