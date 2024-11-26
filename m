Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402EFD59D90
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 01:30:28 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.36000.1732584617971786418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 17:30:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OKKjmBc4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1732584620; x=1764120620;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=yxlLyMqJcZ5VZNKt1TkUkoza+I1Y7QU750SPQ4KoPK4=;
  b=OKKjmBc4daGOJCH5DOTEWFH/qNDmVZ7RMWF4A5jjrinWTxRs9BZM3W3g
   nJr37ZfCJkDHQqz0oSJpi6SsnaVzle4eaEZxo7TSepek1Sp2ihhHkwMmc
   F2b8Y3BMTo6FRokxT5u2mHc/a29qOpFxk2gytjhz/4ixsMo6vt1k2pVUg
   Y/FRcy2obVYcY8rdo2Wzm1YTKI9ApkPyvSWUES7brxUpm3O0qoCy9cSuR
   RNhbuxuS1RVcLk9ti5AAjB3XxO7HLzQCGoFBFyHTudeJMFk1r0TRQvNmV
   UN6/7KJn+Plz8mKIij+aiaavtjVAzqpnEt8HT2BtNh3L5u44E1CIOiVte
   g==;
X-CSE-ConnectionGUID: TObzNdr7ReSzcQvRq6irfg==
X-CSE-MsgGUID: rYeA/rUYQhCD3p568wes/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="180811759"
X-IronPort-AV: E=Sophos;i="6.12,184,1728918000"; 
   d="scan'208";a="180811759"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:30:19 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7284DD5015
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 059EDD416A
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 87EBC2007B73D
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:15 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 35ED21A006C;
	Tue, 26 Nov 2024 09:30:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/16] llvm: upgrade 19.1.3 -> 19.1.4
Date: Tue, 26 Nov 2024 09:29:52 +0800
Message-Id: <1732584602-4785-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
References: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28820.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28820.003
X-TMASE-Result: 10-0.335800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2s0FJKIRy8cWmzQB0xBvE+l6nHbeBu5LnnTlIO7ZQZ97742hLbi424DHqx
	sBjV0bTaESVL06fzYO9wU8VHXGipCHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7ijy
	mBN6Wz1pd4DxwOj7mWGgTOzH8ImlbYtFXSZB+bWSlk4n+6bR9NSZxc3N/3JXoLSy91g1fW7VQNd
	0duAfuM3yxTB/eirx6CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 01:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207812

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/llvm/{llvm_19.1.3.bb => llvm_19.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/llvm/{llvm_19.1.3.bb => llvm_19.1.4.bb} (98%)

diff --git a/meta/recipes-devtools/llvm/llvm_19.1.3.bb b/meta/recipes-devtools/llvm/llvm_19.1.4.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_19.1.3.bb
rename to meta/recipes-devtools/llvm/llvm_19.1.4.bb
index fcbc7428cf..6e47a3f542 100644
--- a/meta/recipes-devtools/llvm/llvm_19.1.3.bb
+++ b/meta/recipes-devtools/llvm/llvm_19.1.4.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "324d483ff0b714c8ce7819a1b679dd9e4706cf91c6caf7336dc4ac0c1d3bf636"
+SRC_URI[sha256sum] = "3aa2d2d2c7553164ad5c6f3b932b31816e422635e18620c9349a7da95b98d811"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


