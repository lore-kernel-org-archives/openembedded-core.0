Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43729C77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 08:04:51 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.48705.1681718687308656439
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 01:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gaaMFRA1;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681718685; i=@fujitsu.com;
	bh=mEswQPQbbdjxtW+MA28RKQ3/TNrjsvp6JF0NzItGAHU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=gaaMFRA1vStNQC9dfsz9HreJgyNnYa29/a/LhoO9lUuCFup//KkRC/LxvdWQD8Hbc
	 eTP1CYXpRoGUSQ07VKcLuvOSoGrbWLy4lhk6HJeP4wf3udItkxuNqcg3eR71UrzBqQ
	 yQ3e0K82yxz8XpgfzD29VMVV9fB8eKwCzwAmGWRhFKgieddhPAVkmuDsQC107+V3jm
	 giU5miszoOZiV9kENn1D3mlENoXOUpQOyegrb3zzsCc1+MQCSRuLL2kbcMz8Q30NqK
	 rz1QfGcOvgpFWw4lgmLdgI/p8wZlLlW56dFaededsIqh4Oo0sWMxVQOX6sRUVhPwp1
	 Gfc19DO8TQmUQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8MxSXfuX5s
  Ug/m/GC3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oz/f3wLXnNUrPt8mqmB8TN7FyMXh5DAY0aJ
  hQ+PMEM415kk+qYuZ4Fw9jJKTDi7j62LkZODTUBK4sb9/0A2B4eIgJ7E1X+iIGFmARWJF7972
  EFsYQEribdbGsDKWQRUJT4vmcoIYvMKOEnMvnKDCcSWEFCQmPLwPTNEXFDi5MwnLBBzJCQOvn
  jBDFGjKDH7cjMLhF0p0frhF5StJnH13CbmCYz8s5C0z0LSvoCRaRWjWXFqUVlqka6hgV5SUWZ
  6RkluYmaOXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5qySZGYCimFDMm72C82vdX
  7xCjJAeTkijvi1TrFCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvC9/2qQICRalpqdWpGXmAOMCJ
  i3BwaMkwmv8DCjNW1yQmFucmQ6ROsWoy3H1ypW9zEIsefl5qVLivK//ABUJgBRllObBjYDF6C
  VGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrzswIgX4snMK4Hb9AroCCagI+SUwI4oSURISTU
  wxTZ2ehc3O5c5Whx48HD5c4+LivIJa8zUDHRcV9yOmzCte2avo0FDvrT1oTcy5QpZLdPrGE82
  L36gF/z6wfKjqQVTXvdc2fy14YPP0xVTfu/XtwqzDPBYv+uatmb/dMnHTtfP2KzyZNS7dDnbg
  6c5caGBjeqMz9MNKt7c8NRTt9Ker95+pkNlqrJcorVDQpKif9miJe9jbp4+8GfPPoVOOfOPje
  3rFkiz/EtJa114qHOXy+o7E/o2Pe2f81Zh7d6m1w93fa+8o3T4ffWET2/b5F5aqZ5rzymsXP3
  dbOG0BN4pKawcd84KnAju0IqqDuC88uXtqm0h10+1mxRnFv1/vZnhCFuo9fakH/IZD3TFlFiK
  MxINtZiLihMB6qKSP0wDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-587.messagelabs.com!1681718684!363502!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29445 invoked from network); 17 Apr 2023 08:04:45 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 08:04:45 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9AA3B100348
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:04:44 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8DA82100346
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:04:44 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 09:04:43 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libgit2: upgrade 1.6.3 -> 1.6.4
Date: Mon, 17 Apr 2023 16:04:27 +0800
Message-ID: <1681718671-19418-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 08:04:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180146

From: Wang Mingyu <wangmy@fujitsu.com>

Bug fixes
=========
    config: return GIT_ENOTFOUND for missing programdata 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgit2/{libgit2_1.6.3.bb => libgit2_1.6.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgit2/{libgit2_1.6.3.bb => libgit2_1.6.4.bb} (92%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.6.3.bb b/meta/recipes-support/libgit2/libgit2_1.6.4.bb
similarity index 92%
rename from meta/recipes-support/libgit2/libgit2_1.6.3.bb
rename to meta/recipes-support/libgit2/libgit2_1.6.4.bb
index cab7d7a20a..ffe00d8653 100644
--- a/meta/recipes-support/libgit2/libgit2_1.6.3.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.6.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5bdf47bbc9a39dc6ce076d59e322dc17"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.6;protocol=https"
-SRCREV = "c058aa87dce4c67a3b86b3349beebd64b7bedcd3"
+SRCREV = "e6325351ceee58cf56f58bdce61b38907805544f"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


