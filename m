Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC11BCF58C2
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:54 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.9331.1727246993041360587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZKJ8SYOS;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246994; x=1758782994;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Kt2Du1jJ7HtEzKPsTly+mVKTeL0fMS/vAKBxQ1IqB84=;
  b=ZKJ8SYOSuHC3k9ElK1zQGrs1HhUdbwDQLKpdEqtEjhn7ypuJ6bGJA2hB
   ACTdlL62Y3FnhL0vgJ5aX30ZfNE42hpJW6Z82eP4ZbXd3K+8SylyFDOSn
   /WCUFj10NeKqNmu0VZBny8cTxMZwioGN2BvQPM0mXkGiBV8Qv+xbnDfZr
   aB8G4mHMHn/loihle+kQpC1OxLfXBpnwOxvUQl8+P5nX3uzNGX1XzhX6V
   0B+W/Cwmf2GKJVjtVOdaaA3UIKEJnt9XV9xbJ4FKQC5J+DH/53z8DGZPA
   oiAj2VU7FQ92xqKz9SaQjeDyyWcAP6OOEcou39Dxs3imvBSFgv/Xuirc0
   Q==;
X-CSE-ConnectionGUID: EM9ycV+VSNCEVbTqBBqWvw==
X-CSE-MsgGUID: sxEr2oySRs6CowyTDt1CAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="174772500"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="174772500"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:51 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B48FBD8016
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:48 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E5DB5BF3DD
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D108401E0
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 28EE31A01E9;
	Wed, 25 Sep 2024 14:49:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 39/47] repo: upgrade 2.46 -> 2.47
Date: Wed, 25 Sep 2024 14:49:12 +0800
Message-Id: <1727246960-20665-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--6.809200-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mriK5qg1cmsr/+Aw16GgqpO2fL
	aLX/IdTi1slu7TFeAHmHbls60xcCCnt0O08qMkK1xvp0tuDMx3mBs03RHrzjM0e5P5IY8LZqYxq
	mcULrxea6j20H9xO4Px6nlH/P8z5HTgY7kyERCi3wgrvJFY9E0TeXamXCCu1YIPUd1fKoOcS/wF
	PtlPt4GaE7LBRkh+1t5p98cjyQCaIdj9vNGYhpkbnHu4BcYSmtmJAMgmwOyledAuliTV06Ynsyd
	zL9f2FL4vM1YF6AJbbieYV7J8ae4wtuKBGekqUpI/NGWt0UYPCykqsFA/66zXxFoa79iKC+CwJ3
	CCuwb4WnJS1vNeqnbRM3tVf09E8l
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204935

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- sync: include TARGET_RELEASE when constructing smart sync target.
- color: fix have_fg not re assign to true
- tox.ini: Make the lint and format environments run black for all code
- tox.ini, constraints.txt: Lock the version of black to <24
- project: run fetch --refetch onacould not parse commit
- Add a --rebase option to sync command
- sync: Fix git command for aborting rebase being called incorrectly.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.46.bb => repo_2.47.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.46.bb => repo_2.47.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.46.bb b/meta/recipes-devtools/repo/repo_2.47.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.46.bb
rename to meta/recipes-devtools/repo/repo_2.47.bb
index 147b09ce85..adebea1c8e 100644
--- a/meta/recipes-devtools/repo/repo_2.46.bb
+++ b/meta/recipes-devtools/repo/repo_2.47.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            "
-SRCREV = "0444ddf78e3026056ee3786119e595909c039ff2"
+SRCREV = "1e19f7dd61923b8835d9c6e1a7e560575dafaf1e"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.34.1


