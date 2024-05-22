Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A011C41513
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:15:19 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.5658.1716369312207495819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lOVb1Fsn;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369316; x=1747905316;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Iy7+2t51GrxyNmg+gXlzfT6ctGKWOEWyCvj2ybSFUlQ=;
  b=lOVb1Fsn+4VGiS+Xv+k5at6hC1wNdsHM/XTHXW9TMURrMrBxtq4BJEG2
   Dx6PFsg4YDG6PfpgAn9b62m6/9iEqdyH2avLJbPHkF2hBMHO6MJnx5RBH
   cZA5c4ZXZZFX6S7rQJzZV945QEHUw0JjNw8Ft66me/uk4AVj24XvY83xI
   wFupV38iBTep57D2hAP86ns/JS/NqVJJAMvxzw1i7o9gFpUl+WF45HKBA
   Bngai9z9EGUkADEngC3QI0lWzcLbWQQZLiy21oFTZ6UAi4iH8bOIrNVpL
   sgPLdDyMQ6HoosDewfMHZjaEsvlhHdkdHhN1WMdnKoNIYP6ktOsK0EUxj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="137912250"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="137912250"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:15 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7774DE8522
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B738DD0DA7
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4775020097E68
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E78C51A000B;
	Wed, 22 May 2024 17:15:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/42] dnf: upgrade 4.19.2 -> 4.20.0
Date: Wed, 22 May 2024 17:14:15 +0800
Message-Id: <1716369289-22526-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--0.837200-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrmZiw53dqSN/k6Qbi+9i6Dwm5
	8KT4o411I1teC26sNH1KC565Je+gktJ5dZ7DY0e4HWRJEfGP5nnao9CLy9z1sh5nMmVpEsbFty5
	ZpXHFBFwILxoCYZ47qepe9co8GDkGZWMJGq5h2T4ReM8i8p3vgFQQ0EgzIoPRu/K+y7G4DCGk86
	uMB98iNtXirfpLQ0TP5Jo9dv4z9SjIY6JevWs4vnV7tdtvoibaVeAZ5VSHdZ2bKItl61J/yfJvo
	cwUrWp7XWPmaFoiyJsnRE+fI6etkuLAYxqoePrqjTzEe/OUUAS6RepbVLijA2gcWm7RQjL3ELGi
	d7/H/gcxvVepwTMDjnf5Moh3koZ0JKkm9lZR9m5W2gTLm7iGr0u/kTKv9giuqwOHO1Fdn0Kb4tj
	0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199703

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Prepare man pages for switch to dnf5 as the default package manager
- Do not add user site-packages directory to sys.path
- Remove --duplicates and --oldinstallonly exit with 0 when nothing to remove
- repoquery: Fix loading filelists when -f is used
- Prepare for switch of dnf5 in Rawhide

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/dnf/{dnf_4.19.2.bb => dnf_4.20.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.19.2.bb => dnf_4.20.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.19.2.bb b/meta/recipes-devtools/dnf/dnf_4.20.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.19.2.bb
rename to meta/recipes-devtools/dnf/dnf_4.20.0.bb
index cc91dbe400..4757346cbf 100644
--- a/meta/recipes-devtools/dnf/dnf_4.19.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.20.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "9b2b2e8ddab99caba4bc8059cab4263163172e81"
+SRCREV = "e3cb438c0fd08c79676c0f3276aa7d75cd8557c6"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


