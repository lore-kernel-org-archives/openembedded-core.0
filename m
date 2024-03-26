Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F32CD11DD
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:35:23 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.7811.1711413319190679301
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JZQSF/Nm;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413319; x=1742949319;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eZmmU97NM1mfPpsGmENuG5R8l/h8Tq7RHpZdjtmwdgo=;
  b=JZQSF/NmaKpulu7GoDzygwyBps+VMH5Kgr+GL4mTdD3FxgeEHsYP5H5B
   pIe9c34L94hmIsnDAzJGNb/Ygo5dz7ncfXoIaO68jw1ws9J0n+qLVXu8W
   Swdhf2ZtEqAxczDKF50OzKYZjpQSDBWl79dTrTvv2Vg0l9j96oD/wazpZ
   R2asEpEUSGc2xRuVk8lTkJQHnFPXmBbDtowtOB6vo0tN8g6LKkBvYStNo
   J8w9zcojxSEgB8EmsNbk6K92MZwpKqdRzHU2BFDiV7u0Hp65YVUkWW1sG
   5bFhsk/Hkr7rbp7mQAMvG1jplMMBKPh3NPlfA8Pmw5cQTND64lf8X/R8x
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="155199929"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="155199929"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:35:17 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7561710A331
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:14 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B2ACBD5E8C
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 43342411BE
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E202D1A006A;
	Tue, 26 Mar 2024 08:35:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 04/34] createrepo-c: upgrade 1.0.4 -> 1.1.0
Date: Tue, 26 Mar 2024 08:34:22 +0800
Message-Id: <1711413292-3025-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--4.865400-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyMJxigKCCiS74P
	zhotrWQ4cPBVYs7ChqJ4heFNcNgJUJh5qFk2poYLA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnSdF2BUM0vdDytg73Zv02ZvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZKt9bzKoru9sUf9KdoLr1OZTpo8ylq8yvV5JhI7f288TV3e+
	6oS1xkaguOIXf3DBpkIjCMqQtqjVK3sJR/aDAA/RYVfOgp6t1pLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197494

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Add tests for RepositoryReader and RepositoryWriter
-Add a high-level repository writing API
-Add a high-level repository reading API
-Print where and when cr_hascontrollchars is true
-Build aarch64 python packages during releases
-build: Adapt to changes in Fedora packaging of bash-completion

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{createrepo-c_1.0.4.bb => createrepo-c_1.1.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.0.4.bb => createrepo-c_1.1.0.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.0.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.1.0.bb
index f498bcb655..1f97c99bde 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-include-rpm-rpmstring.h.patch \
            "
 
-SRCREV = "4ade5ea5c4c636f045f29a2d8d8a57241fc5d24e"
+SRCREV = "10a8a7af4f1de3f98a21a7d08fe3a46ef306d197"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


