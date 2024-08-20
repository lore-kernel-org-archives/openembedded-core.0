Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25868C5472F
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:29 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.12721.1724136741420706868
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LJeahCb1;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136741; x=1755672741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=3mvcjSw/VsOhQCPOrQG5aZ1GD69alEKqPNVDOgayzLQ=;
  b=LJeahCb1Cd+S93eUVYMnjKP9YNa7wC0/rZSst0BqxBlCPXw6SU3BP7pa
   Qb4L+Q9jhDuFMTISctWm+imnnuuHeQZERK+RLo/wXKgHxY1vpgcY46eG5
   f4Ir6d0kixGMRjme3+ms8USADxQYdt+hYKeZMhwP3e/ELqAcR8q+SjhPU
   NtVbhhkrzND4cTO8hsJrWebnnnHiajNKdPCsHnWlWQ4Tepsut5qrDAZta
   yrd6phmEALFY/4nzfn3fZzSj1EHnpJqgB5g3JLlJsTpcOMNC2l9tZy+uO
   9WqJ4EeDVlDdjriWMrBiAGXH6TzzvRTVISGw80BK2fs9N/p1dhgiHH5Ti
   A==;
X-CSE-ConnectionGUID: A2QfrxSxSKK77/bv6ntEYA==
X-CSE-MsgGUID: nJtnxaP6SguPWlbHgEA66A==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="150076333"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="150076333"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:19 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C260DC2142
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 06355D4C3B
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 885D3216766
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 339101A000C;
	Tue, 20 Aug 2024 14:52:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/24] sysklogd: upgrade 2.6.0 -> 2.6.1
Date: Tue, 20 Aug 2024 14:51:40 +0800
Message-Id: <1724136703-20023-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.005
X-TMASE-Result: 10--0.158200-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrWQ3R4k5PTnCY5nVpihxiw4nO
	/I/i7S2A8wm/o9JjQSCzeBloshj2ejMH3wWOx57nA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYscG+qFF0DyyNyl1nd9CIt0URSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2i5u
	/VvsFaHbM3BtV5Fmv043810esKH95cG81WLHWzJ44H/9mE5BYBK76M/L3VAqU2DiUDp0S/+Gzuy
	D8i6/qyLMvs1oYgFuPHsNgTHUiMTfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203542

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Read '.conf' files from include directories sorted alphabetically
- Add extra linefeed to wall messages to ensure they are seen
- Issue #87: segfault on 'SIGTERM', regression from v2.6.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sysklogd/{sysklogd_2.6.0.bb => sysklogd_2.6.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.6.0.bb => sysklogd_2.6.1.bb} (97%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.6.0.bb b/meta/recipes-extended/sysklogd/sysklogd_2.6.1.bb
similarity index 97%
rename from meta/recipes-extended/sysklogd/sysklogd_2.6.0.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.6.1.bb
index ab0581ec8c..99454b8230 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.6.0.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.6.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https
            file://sysklogd \
            "
 
-SRCREV = "6b44b9822e8551114e1ed38c38c51b8e95188599"
+SRCREV = "c2bc519697aaa94f7b5e658a31ff55b9d54e7c8d"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


