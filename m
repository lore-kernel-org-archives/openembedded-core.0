Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19E8C83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 09:33:42 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.8562.1753349614913188062
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 02:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AMGvsrOT;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753349615; x=1784885615;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sK5geDHhz8/9pe+lEhCKXn1M/BPmT/RG0eN1WyHX4nA=;
  b=AMGvsrOTJ6pd1D98pXjd3yd+7OboCUganNwoDx8RuJDcr/yPvFWW4zuf
   JnVHzvbFm7gxwGPdjH8n1j+Z5izDdezpARj2ZZDOYiN/SL3HuyTjz88IE
   Hqx55N/Dtf6Ff8N+TiqMGu3A/3vvMLUfO4+g5Yxic5UkGPDDQbruBAnJx
   hYGoGVpdmr7MWTPTEH8X6htf6Bpu0XToX6DK7PCbR1Wm/2VDjbHqyT5IR
   GuaghnP0IQI3OQApsFrKewBNHjjN5YNfoyDF4t5/HYebJRb5I3mKyL60i
   wSUlR2IY0Bp3wXQi8vma4YAZRZ8ptr9vrvMAZxFhnbfC1QUt1F/efyFGq
   g==;
X-CSE-ConnectionGUID: XVQDqasuQTCzl6cd2sKJOw==
X-CSE-MsgGUID: jVu5761uSvS3STSyqvqZAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="207223284"
X-IronPort-AV: E=Sophos;i="6.16,336,1744038000"; 
   d="scan'208";a="207223284"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 18:33:34 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 07C8A1C01683
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 09:33:33 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 7656D18001C3
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 09:33:32 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 56D081A0071;
	Thu, 24 Jul 2025 17:33:29 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH] oeqa/runtime/ltp: Drop ipc that is moved into syscalls in new version
Date: Thu, 24 Jul 2025 17:33:22 +0800
Message-ID: <20250724093322.988-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 09:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220830

ipc has been moved into syscalls
upstream commit: https://github.com/linux-test-project/ltp/commit/80fd2d673bc0fd8514190a061219c24933b6f03f

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/lib/oeqa/runtime/cases/ltp.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index e81360670c..0ffdbe23e4 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -57,7 +57,7 @@ class LtpTestBase(OERuntimeTestCase):
 
 class LtpTest(LtpTestBase):
 
-    ltp_groups = ["math", "syscalls", "dio", "mm", "ipc", "sched", "nptl", "pty", "containers", "controllers", "fcntl-locktests", "commands", "net.ipv6_lib", "input","fs_perms_simple", "cve", "crypto", "ima", "net.nfs", "net_stress.ipsec_icmp", "net.ipv6", "numa", "uevent", "ltp-aiodio.part1", "ltp-aiodio.part2", "ltp-aiodio.part3", "ltp-aiodio.part4"]
+    ltp_groups = ["math", "syscalls", "dio", "mm", "sched", "nptl", "pty", "containers", "controllers", "fcntl-locktests", "commands", "net.ipv6_lib", "input","fs_perms_simple", "cve", "crypto", "ima", "net.nfs", "net_stress.ipsec_icmp", "net.ipv6", "numa", "uevent", "ltp-aiodio.part1", "ltp-aiodio.part2", "ltp-aiodio.part3", "ltp-aiodio.part4"]
 
     ltp_fs = ["fs", "fs_bind"]
     # skip kernel cpuhotplug
-- 
2.43.0


