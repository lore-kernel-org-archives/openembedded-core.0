Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0034D2E9C7
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:35 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.82432.1731403535222004954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Fx+d5E9Z;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403534; x=1762939534;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iczyHlSgjvpfgcRTdJvF2DnWPnBzuL7QprErK79QEH0=;
  b=Fx+d5E9ZQIgXCjIlZAQwoN7A/2zfJAmcZEBCgNiW4UAdshv/z25yMVGJ
   F2RJ0Bdj3HR9eoDIxNsGvV5HJClsQYTm16/EEH1+vcmYqLPq+nHBlhJ0u
   CN66AAC9YeKIsU20W6DCIbF2pAbBv1g2F7KcO0qasGr9oN1CbRMP8Ohz1
   mpUPYrYEE8ia1eU795n1oAVdZaF6H+toQ66BGCZcBD/oylj0MSx3MI3xs
   yrx5rXZUH5mTHZmedjAxuttk3IMVsgjJ/4WfKPr7fYFglXZsXWUMOCdgX
   9ivm4KQaukMOZjo7vJHqBjW/Df49/ol8X+AL/yW3XM54Ly0SqvYGAYNPu
   Q==;
X-CSE-ConnectionGUID: ZI0CJp74QAS4I27ALj4KmQ==
X-CSE-MsgGUID: UOE3nYOnRcSLjRLouBr2Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="182315541"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="182315541"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:32 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E39B9E3E17
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 82F1EF31BE
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A5CE20079545
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BD3FF1A000A;
	Tue, 12 Nov 2024 17:25:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 27/47] numactl: upgrade 2.0.18 -> 2.0.19
Date: Tue, 12 Nov 2024 17:24:23 +0800
Message-Id: <1731403483-21399-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--8.203600-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytCdYTAgut6WHv3
	EJJrdBuxUZoQAWo6HNnLDtpbQ6ee2fNeiPBzLCvMi82UiskMqcw2nLo2hN48Ib8r2YKZauYGULf
	C3mZUjoTBV4b4vif9P0c+YfLo55UjDDw2a573DPcD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpienmD2BglYMvlrXbWjt8FBDsKXyzHgcEbguwtqyXlE6GOEENgsUAuYn12F
	qkuKWsgqicOtRqTyLKAMuqetGVethtouMvD9sV53QfwsVk0UbtuRXh7bFKB7jIZ0ZHXTVdq6912
	uTjl8UXAleE65OA0THhQ51lvwqJvYDttQUGqHZU=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207014

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix fallback for set_mempolicy_home_node syscall
- Add -w and --weighted-interleave for weighted interleave mode
- Fix the using of the uninitialized value
- Fix RESOURCE_LEAK in show()
- Add documentation for weighted interleave
- Don't fail build when set_mempolicy_home_node syscall is unknown
- eliminate hard-coded tables
- Update numactl.c (green-br)
- fix nodemask allocation size for get_mempolicy
- Save and restore errno when probing for SET_PREFERRED_MANY
- Make numa_available respect EPERM
- Fix unitialized variables
- more unitialized variables
- Replace fgrep with grep -F to fix warning
- Set version number back again
- Increase version number to 2.0.19
- Regenerate configure for new version

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../numactl/{numactl_git.bb => numactl_2.0.19.bb}              | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/numactl/{numactl_git.bb => numactl_2.0.19.bb} (96%)

diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_2.0.19.bb
similarity index 96%
rename from meta/recipes-support/numactl/numactl_git.bb
rename to meta/recipes-support/numactl/numactl_2.0.19.bb
index 6c853f1966..62f3020fef 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_2.0.19.bb
@@ -10,8 +10,7 @@ inherit autotools-brokensep ptest
 
 LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=9f34c3af4ed6f3f5df0da5f3c0835a43"
 
-SRCREV = "3871b1c42fc71bceadafd745d2eff5dddfc2d67e"
-PV = "2.0.18"
+SRCREV = "3bc85e37d5a30da6790cb7e8bb488bb8f679170f"
 
 SRC_URI = "git://github.com/numactl/numactl;branch=master;protocol=https \
            file://Fix-the-test-output-format.patch \
-- 
2.34.1


