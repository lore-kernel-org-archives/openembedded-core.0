Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E90C433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 02:55:19 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.2687.1652756111699869984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 19:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CG8vcbxV;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652756109; i=@fujitsu.com;
	bh=zvHZiwDof0hnpGd/ZmPrU/dNTIBvl8y30stMjXnQEsg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CG8vcbxVvDRUFWAq13rJNZdUkuIehZLxSBu8sNvJ2cKjuvAM6r3kztWRC3CuA/NQv
	 Uu3yaFnz9VQc5d+wX/5H8/+URsRdQK7nEFvJXzAwbNLuoxThjWOAYcJ8on+mC+QMgy
	 9hdii29q802uFi8TTBxdiLp1EYE+hfBOPhCnb7dqD2lmw0YX0wRZR+MC583N5DrhQV
	 qWdg28lU3TJgQY7xDM5tElasGtscLdsYzCEWBo4y3/xlDKej0zW/hj3XRSLNfLwoCt
	 kmNC6Ww8hymKgHPYenLV0Nq3Ru2qYMK3HfGgSRu0qyjclzefuxKSVcCbvOlt7pNVcG
	 GG7+E5z+epZAg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8MxSbeHrzn
  JoPGbtcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnH+xD2WgsfsFZN2djE1MH5m62Lk4hASeMwo
  8f3CL1YI5zyTxINPb1i6GDmBnD2MEps+uILYbAJqEtNv3QAq4uAQEdCTuPpPFCTMLKAi8eJ3D
  zuILSxgI/Hp9wWwVhag+P1n25hAbF4BJ4mv88+ygdgSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy
  +YIWoUJWZfbmaBsCskZszYBtWrJnH13CbmCYz8s5C0z0LSvoCRaRWjXVJRZnpGSW5iZo6uoYG
  BrqGhqa65oa6hsbFeYpVuol5qqW5yal5JUSJQWi+xvFgvtbhYr7gyNzknRS8vtWQTIzA0U4rd
  W3cwXu77qXeIUZKDSUmUt4W1OUmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBG8zD1BOsCg1PbUiL
  TMHGCcwaQkOHiUR3sfcQGne4oLE3OLMdIjUKUZdjrsL9+5lFmLJy89LlRLnvc4IVCQAUpRRmg
  c3AhazlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ80bzAk3hycwrgdv0CugIJqAjRPQbQY4
  oSURISTUwTdtT0en9J9rjCcPLAOOU/qkXVOavrJ0dWlXFsenT3Z+Fdoz7qngXzrFTffDTNGnR
  LDPt+lPbwvar3ZJ01k1u8PHTn7jV0SVK4yP7/IlX7CdM5GPsPuN+c+3Vjc+OKxh1TLgr7Gau9
  Wij2/NXTxVC8iouXrq2eatl0pnbIZUPz1yt8z87l3WC0+YVKS5xz7MzVmis5tjoveTWRzEDkw
  mf5xxzE9iwiEsnsyGq2+/m5UjlSQfzMw6xzfnzPu/U9Lve0t+XN6+5u1e8qPpx37He6nNh522
  28aQWqRd21d/2KJqT8Wjb2jMlU94sa9wTxRIiEpExx/5U2jMJ2fkz/696s/ZSQdC0m438PzcV
  Tvlo+UeJpTgj0VCLuag4EQCUT/hJVAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-528.messagelabs.com!1652756108!43254!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24658 invoked from network); 17 May 2022 02:55:08 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 May 2022 02:55:08 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 81CDE1000EE
	for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 03:55:08 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7545710032A
	for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 03:55:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 17 May 2022 03:54:45 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] librepo: upgrade 1.14.2 -> 1.14.3
Date: Sat, 7 May 2022 10:37:00 +0800
Message-ID: <1651891020-16560-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 02:55:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165704

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../librepo/{librepo_1.14.2.bb => librepo_1.14.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.14.2.bb => librepo_1.14.3.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.14.2.bb b/meta/recipes-devtools/librepo/librepo_1.14.3.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.14.2.bb
rename to meta/recipes-devtools/librepo/librepo_1.14.3.bb
index 8dece946b4..2c8e592251 100644
--- a/meta/recipes-devtools/librepo/librepo_1.14.2.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.14.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;pr
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "3b9a8d17188ba602d139f79b6e61305030f21109"
+SRCREV = "8fc7950795282d9c7c50071f45973006de5594ab"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


