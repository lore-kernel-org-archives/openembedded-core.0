Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F843C3DA4D
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:29 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.10234.1720604659026825604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=A2Sxi5+G;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604663; x=1752140663;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uj7VJLZWQL1DMRC54zE2kOMASmEhpJOxceI+qcJ/spc=;
  b=A2Sxi5+GkWhWawEl1F+i1peK5I9pHrTjt26NJpYO8GD26aUYh5S83V7w
   6aUtJUr5tchYD8fR8oO7MunykeLRVo2vKRnMHWiX8O3JepdzfkbkBAkIi
   6kTljxLOoFBbhijR+OuuAtm/eaws4QtvUAhanPTTbYtHAgciXSoSYEWAn
   wRFrH2IcmrpGxY+nYgZgc0wNmqmpsXow099c0azK0fhhkGgq3kedswzXR
   82LeId8/jb9Z2SbR0zRo81mm4V3jjLZmkdsR74sFn+kO89sheMt7xljDO
   iqN0YNbF0opnc9ow75PirEAxyNcNlVq2suUBO7eBVh62oJpjYFZLVjWLe
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="153920558"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="153920558"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:22 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 46AE4D4250
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 81324D8AF0
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 247172005018E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C9A621A0002;
	Wed, 10 Jul 2024 17:44:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 28/30] repo: upgrade 2.45 -> 2.46
Date: Wed, 10 Jul 2024 17:43:52 +0800
Message-Id: <1720604634-23406-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10-3.626500-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yUIIxwDaU5mr5MBc083IM4S/XSsQNWtCeMLc
	MUuTFJzBOuzeNmOGKnMepF/1UoQ4Xk4GO5MhEQotI0cHLI6lhgI3sWND7MxSHsH0F6hf9KOr+Hv
	2UJ08905cCZaPgys8h1D5qQ9cbR/8AC3fg4wTRx6/mux8PsfamTFcf92WG8u/4+xf2pXdquS08x
	m4BP7XLNQXmVwOufIdFdZad/YvSoJaQiLka9EcSmoP/44lroeD1cuIRwt/4MjAuQ0xDMaXkH4qt
	YI9sRE/KqrQ7lLcMnwGFBbDeVn4hdSBbju08IcwngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIcSqb
	xBgG0w7bxzD3alB3UsRoYdDUBCP4q5kOPkcarmZ0wqz13GMpPdcQ3Qai1gq3KhaKaLuyFkSKVgW
	GHcJ2RhLUvNZ2fxDBNzPkIQwb6uWCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201722

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- project: ignore more curl failure modes
- logging: Fix log formatting with colored output
- upload: add a --topic option for setting topic explicitly
- sync: Abort rebase in progress if force-checkout is set
- ssh: Set git protocol version 2 on SSH ControlMaster
- upload: drop check for uncommitted local changes
- git: raise hard version to 1.9.1
- release: update-hooks: helper for automatically syncing hooks
- gitc: delete a few more dead references
- man: regenerate man pages
- Remove platform_utils.realpath
- Fix drive mounted directory on Windows
- git_command: unify soft/hard versions with requirements.json

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.45.bb => repo_2.46.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.45.bb => repo_2.46.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.45.bb b/meta/recipes-devtools/repo/repo_2.46.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.45.bb
rename to meta/recipes-devtools/repo/repo_2.46.bb
index dd12373e3a..147b09ce85 100644
--- a/meta/recipes-devtools/repo/repo_2.45.bb
+++ b/meta/recipes-devtools/repo/repo_2.46.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            "
-SRCREV = "73356f1d5ccbebf5a33e5e9aa1ba06c5f5437fed"
+SRCREV = "0444ddf78e3026056ee3786119e595909c039ff2"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.34.1


