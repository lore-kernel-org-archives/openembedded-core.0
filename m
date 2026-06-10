Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376E0CD98CC
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:49:52 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16344.1781084985432073872
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 02:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LGXbNKvK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781084990; x=1812620990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ddLFJ8kcYJQMo6/EgybZkoDXyEsDxGR/HAHjE0SKhro=;
  b=LGXbNKvKdSCgpeiuRlbL4fvyyFOb0kldBjn0kkewkclyNdEHV7uibkcC
   papoptLcYOLb8kjMSKptDvoh58+m+REj4WyUqajqKuspvKbDXf+u9csOA
   +JVHHQc2+POBonYCXPMzzQAMvfCh8ZqCF5f5q4n/F7xyDHa2CvNoNgrFl
   e+p4AfvhDcYeeP8jrNRhUnQLAvzTi0ONM2hJfp3Yn8qiAb86gt8RXaET3
   CdngO05Hzqsl+ukH+2tUpsPXUL6nMrH6DrzN91k0FS8ebTx7beU/UIB0f
   glwJfbQt4aX8SOTlMeZep8J04iqfZUcHI3XV1lietqPmORd9zvSZGaRGp
   A==;
X-CSE-ConnectionGUID: b36Kw4/tTz+KLy0H61d65Q==
X-CSE-MsgGUID: mClJ+vn+QRCuxEEi1tyUKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="243598899"
X-IronPort-AV: E=Sophos;i="6.24,197,1774278000"; 
   d="scan'208";a="243598899"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:49:50 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0EE5B42A309
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:49 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B1B4A1C1746A
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 976FF140027C;
	Wed, 10 Jun 2026 09:49:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/16] btrfs-tools: upgrade 6.19.1 -> 7.0
Date: Wed, 10 Jun 2026 17:49:19 +0800
Message-ID: <20260610094932.2264-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260610094932.2264-1-wangmy@fujitsu.com>
References: <20260610094932.2264-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238329

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- btrfstune: add ability to do offline conversion to the remap tree
  (experimental feature)
- mkfs: add hole detection when precalculating size for --rootdir
- fixes: recognize fs-verity tree items in various tools (check)
- enable PCLMUL implementation on Musl (previously using SSE 4.2 at best)
- help format changed to be in line with common packages like util-linux
- reject writes to filesystem during check/btrfstune in case there's pending
  state of device replace or balance
- other:
  build ARM64 static binaries (attached to GH release) backward compatibility level is 'archv8-a'
  CI updates
  documentation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../btrfs-tools/{btrfs-tools_6.19.1.bb => btrfs-tools_7.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.19.1.bb => btrfs-tools_7.0.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.0.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_7.0.bb
index dee1270fa0..72b5575703 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.19.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.0.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "fa79dbea32d39ac0ae41a88a079013c7ad2a8a58"
+SRCREV = "9c5987432906daebde23f9703c0f6f90c35fa9da"
 
 PACKAGECONFIG ??= " \
     programs \
-- 
2.43.0


