Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA789C87FCC
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 03:11:56 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.26564.1753845108144301955
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 20:11:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MbyiKIee;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753845108; x=1785381108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sK5geDHhz8/9pe+lEhCKXn1M/BPmT/RG0eN1WyHX4nA=;
  b=MbyiKIeeFa128lmW02EGkFMiHXtyKuZptFtaWm7I2rqI+jbWeASfiHNx
   q7MpIVqWSB5B+c4AHaY3BJWcCBqYPfOYXrCOfsa32iVQkCUnr8yNDWKCp
   bjT9urxOT66h5p36fvgvcVKFM8xIqXj50I1km5vwl4i4lcPB++pnbO6y7
   wh0m9SDqFWXAFwLT7Pg6ftbQIGnOxAFyrNQVD3VmUsN6cvo9Tqzq7/mVD
   2lqFyToYoA1oSnCLdr1jJCArRhCUOPObuGcXHDmggxe7crVgLOnw9JIEm
   LYJPFseXZp5C4kbM7eY37B+1wtsBjYDBibdChwVSzOgeZFX+GFbuFM94+
   Q==;
X-CSE-ConnectionGUID: 53OCS1AhRsSn0WLWDk0srQ==
X-CSE-MsgGUID: E+m0aNu/RG62gNu8ipiF6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="186791094"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="186791094"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 12:11:46 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 6C81342A30F
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 03:11:46 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 3B879C01EEE
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 03:11:45 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2E92E1A0073;
	Wed, 30 Jul 2025 11:11:42 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Ross Burton <ross.burton@arm.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	openembedded-core@lists.openembedded.org,
	Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH v2 2/2] oeqa/runtime/ltp: Drop ipc that is moved into syscalls in new version
Date: Wed, 30 Jul 2025 11:11:20 +0800
Message-ID: <20250730031121.382-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730031121.382-1-liuyd.fnst@fujitsu.com>
References: <20250730031121.382-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 03:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221095

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


