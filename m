Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1370BE7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 23:57:26 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.116564.1733788632224844440
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 15:57:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OvwpzIAq;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733788636; x=1765324636;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ks3eFKN/O7/HUQl6wEV6IOZCwQ/f7NUksX+qfbSD0bY=;
  b=OvwpzIAqkg7pVt/3GNLoba8JMyGNUcDG9iegxUEjbKaOXe58aPFPO6+D
   zm8zC4xpo63lGhE4NYMINS3DWc8JYy0R4UVZ8ZUON/Eb8jZLcekGWhNiT
   CziZxWHp5bC95gGjZZ8dgsiptnTHLqdVdqjnVd2a9NvbJyCRnMpKw7XTe
   evTR4muNTrys/8qJHsCYHI8X3fxtxc7QmB1RbXeNazYP8CsQOt9N5thgq
   quwEMosqULCQpfNiGTSGLci3dPa983WvcVHyyNZCISdKzm7LLxqH6hyDD
   neDK/DFbcgwM1t4M29IPdf7V1tEhyQr75RJEDv4c767VkttN2OUL8Anvu
   A==;
X-CSE-ConnectionGUID: YRgYhZmpSFOulC/q1tCZkw==
X-CSE-MsgGUID: /JhbVcoKTcyLtaJZwbTrRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="162028210"
X-IronPort-AV: E=Sophos;i="6.12,220,1728918000"; 
   d="scan'208";a="162028210"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:57:14 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1162AD480C
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D270ED7480
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E25B4018B
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:05 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 07F1F1A000B;
	Tue, 10 Dec 2024 07:57:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 12/20] llvm: upgrade 19.1.4 -> 19.1.5
Date: Tue, 10 Dec 2024 07:56:44 +0800
Message-Id: <1733788612-20933-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
References: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28848.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28848.003
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
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 23:57:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208516

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-devtools/llvm/{llvm_19.1.4.bb => llvm_19.1.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/llvm/{llvm_19.1.4.bb => llvm_19.1.5.bb} (98%)

diff --git a/meta/recipes-devtools/llvm/llvm_19.1.4.bb b/meta/recipes-devtools/llvm/llvm_19.1.5.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_19.1.4.bb
rename to meta/recipes-devtools/llvm/llvm_19.1.5.bb
index 6e47a3f542..de534aa283 100644
--- a/meta/recipes-devtools/llvm/llvm_19.1.4.bb
+++ b/meta/recipes-devtools/llvm/llvm_19.1.5.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "3aa2d2d2c7553164ad5c6f3b932b31816e422635e18620c9349a7da95b98d811"
+SRC_URI[sha256sum] = "bd8445f554aae33d50d3212a15e993a667c0ad1b694ac1977f3463db3338e542"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


