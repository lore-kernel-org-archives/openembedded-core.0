Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E641CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:16:59 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.13214.1757495816399667851
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fVXQM3ly;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495816; x=1789031816;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EvXKm1+OZr1w7k4tYNFuVqc+/Qy6Mns9rXTM2VxgADQ=;
  b=fVXQM3lyRKr4wCMK8L6m4EQBf/ykpK3cn5sfpE5JsUSvl1LEi4uXJODk
   qUJw5M6fzqmIdwQlrg0MpbZto6txYKijcJ487PRkWXDQwKnzkALL3QWSv
   aDqrK6wqNS1bWhMfkLWF4NQk6c8Xc/wxqSYLZd5NQiyyKhUJqREr7K+GF
   G9eSSt8Q4TET8+33s6vV+uyrTz/U1+VbOtijQLNFFXYFos/NpyQ3dwWf7
   30k+LC2B98jLfpK9hRMnHkCOMaTw0q0BLga/4mmPxMPWUQyc2H93Txax3
   xgh5QOoRfxKuTc0EYFSikaDNiemlOQVHdZYxL/wtSWoPPVza4WXdIEYWN
   g==;
X-CSE-ConnectionGUID: tyj6hhROREqF7+QmNap0Qg==
X-CSE-MsgGUID: wAE/RuIaRseFgnh1L2QhJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="212499134"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="212499134"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:16:54 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 5F36A1C1C718
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:16:54 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 162EB1400355
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:16:54 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 90B4D180156E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:16:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B564C1A0071;
	Wed, 10 Sep 2025 17:16:49 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/40] acpica: upgrade 20240827 -> 20250807
Date: Wed, 10 Sep 2025 17:16:07 +0800
Message-ID: <20250910091646.998-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223152

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright updated to 2025

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../acpica/{acpica_20240827.bb => acpica_20250807.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20240827.bb => acpica_20250807.bb} (92%)

diff --git a/meta/recipes-extended/acpica/acpica_20240827.bb b/meta/recipes-extended/acpica/acpica_20250807.bb
similarity index 92%
rename from meta/recipes-extended/acpica/acpica_20240827.bb
rename to meta/recipes-extended/acpica/acpica_20250807.bb
index f9f9f9f687..f6ee3285a1 100644
--- a/meta/recipes-extended/acpica/acpica_20240827.bb
+++ b/meta/recipes-extended/acpica/acpica_20250807.bb
@@ -10,14 +10,14 @@ HOMEPAGE = "https://www.intel.com/content/www/us/en/developer/topic-technology/o
 SECTION = "console/tools"
 
 LICENSE = "Intel | BSD-3-Clause | GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=05eb845b15a27440410f456adc2ed082"
+LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=8566a414d226d05b68e41f30698f9624"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "m4-native flex-native bison-native"
 
-SRC_URI = "git://github.com/acpica/acpica;protocol=https;branch=master"
-SRCREV = "e80cbd7b52de20aa8c75bfba9845e9cb61f2e681"
+SRC_URI = "git://github.com/acpica/acpica;protocol=https;branch=master;tag=${PV}"
+SRCREV = "aa98db3bd149fc1f8d2a3017cb05b6b1982c3296"
 
 inherit update-alternatives
 
-- 
2.43.0


