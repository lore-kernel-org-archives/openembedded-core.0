Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CB8C5321D
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:39 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.12725.1724136754234027356
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QwIOttDP;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136756; x=1755672756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aEVztpSSuWONJzHUTDz4wWGFauvwokMIrKbZf4IdtRE=;
  b=QwIOttDPVzoEqm/2Q9CHQ1Rl0bhSifj/cYilfThg5dweDDRR13Vwk06V
   IM4Hr0JCzNjNYNlz8t6kb8jQCwc3zvsbvAIEqUz3LAONxREagwLGxCuPq
   nFu+aay2oxo8GzwcNuVvdMjGUF5mgCcZLvHiK6GR71AcWOGagvbUqmC5A
   9W89dFqX1qULjOytvl5dcst0U85o9kZFQ/tbf8Pe0Ic6oGz15ESnZLjzF
   whZzNxH0nEwcJlElHGlo0fwf7I/HIPxZ9Z9gUK5Yq18bQoglKrsce4pW6
   QvPaYcY0RApHQF+K4o4FBwpuRT1vaIsAK1ACPMBB5iMj9GQKWoauZ28nL
   Q==;
X-CSE-ConnectionGUID: Dag/j/XoTEaiiNwxN7jzdQ==
X-CSE-MsgGUID: FQTqLBFjRQuuU+acALptoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="171062437"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="171062437"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:20 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A9303E8521
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:17 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E821C1036E
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 744C820086115
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1F57C1A000C;
	Tue, 20 Aug 2024 14:52:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/24] ttyrun: upgrade 2.33.1 -> 2.34.0
Date: Tue, 20 Aug 2024 14:51:42 +0800
Message-Id: <1724136703-20023-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.004
X-TMASE-Result: 10-2.330000-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUz7FUUjXG1jBGvINcfHqhfk6Qbi+9i6D7/E
	Sxz77lNO9xqSxL3LrENN+4sYCJShWhT0CagFsN1kKsurITpSv+NiMNd0z/HZU7t/YafNBu9cG9k
	6anidXWyF0sJFBWU49Ope9co8GDkGZWMJGq5h2T4ReM8i8p3vgEyQ5fRSh265YA3qL69rXq6RY0
	JyfRdA4hTauJ/t9TESukODB/hp/ikfE8yM4pjsDwtuKBGekqUpnH7sbImOEBSkGPSlPes5Rei5W
	g1IhrbdWTGPw33hOV/NPIiC65Yq/fJWVzpqvys/IiWUntVc6ev9tT7MRwljzNwXz0pN0tuaiJuR
	aEbeQuPsfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203546

From: Wang Mingyu <wangmy@fujitsu.com>

Changes of existing tools:
- ap_tools/ap-check: Add support for vfio-ap dynamic configuration
- dbginfo.sh: Update/Add additional DASD data collection
- dumpconf: Add new parameter 'SCP_DATA' for SCSI/NVMe/ECKD dump
  devices
- libutil: Make formatted meta-data configurable
- s390-tools: Replace 'which' with built-in 'command -v'
- zdump/dfi_elf: Support core dumps of vr-kernels

Bug Fixes:
- chzdev: Fix warning about failed ATTR writes by udev
- rust/pv: Try again if first CRL-URI is invalid
- rust/pvattest: Add short option for --arpk
- zdump: Fix 'zgetdump -i' ioctl error on s390 formatted dump file

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ttyrun/{ttyrun_2.33.1.bb => ttyrun_2.34.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.33.1.bb => ttyrun_2.34.0.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.33.1.bb b/meta/recipes-core/ttyrun/ttyrun_2.34.0.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.33.1.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.34.0.bb
index ccb7f9b268..7fbd48c83a 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.33.1.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.34.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
-SRCREV = "686262fdcdaed7903ca1720d7dd0b1f9f5621d7b"
+SRCREV = "4c922b105b4ccb85c51e7e48153d073742b88510"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.34.1


