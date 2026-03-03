Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78C7EC0495
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:10:27 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14983.1772532623273180060
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:10:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pvJ/Sw0c;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532623; x=1804068623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TfXPmGsyHXNED/spa/RrS3cemb+ABUitBOewFQ2BmXM=;
  b=pvJ/Sw0cdbJlWBjiW6lI+TuEy/wApKBfpQA1FDDFFRWRPySNgSq6li1a
   qaPV0cJDhpFz9nFDImy8KQdv+orF0GODW3BMVOKUpTYEJ+e8FIhjbKJL+
   vgsPs4AD9PD96WsVmpMtXhbAk7jWPzy+bFEGEN/NVsq3S93h2JBS4f5s6
   O/MytwNDtHtXQyYyIlltHK8Q80b3j+s8MzkG6i6EBzH+mpJVyuOX/N/rF
   hw3FQe675+ffkxTNPsNBhfs8CGnsFnP9kyrqbcW4MuivMe2n9fMXxZTuK
   YCd+zqqlwfoRW0h5+qpTRIPLXaw7zsLgeygGFHnXQNn+W8D30/krxmae0
   w==;
X-CSE-ConnectionGUID: 6GvbK6snTz2VhlML77HCgg==
X-CSE-MsgGUID: pfswE/ryS2KE3R0yvgvvlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="220364455"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="220364455"
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id C95572B98
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:21 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 86F5AC0022C
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id C62F81001CE9;
	Tue,  3 Mar 2026 10:10:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/23] ttyrun: upgrade 2.40.0 -> 2.41.0
Date: Tue,  3 Mar 2026 18:09:26 +0800
Message-ID: <20260303100929.1624-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260303100929.1624-1-wangmy@fujitsu.com>
References: <20260303100929.1624-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232297

From: Wang Mingyu <wangmy@fujitsu.com>

Changes of existing tools:
------------------------------
- chreipl: Make --bootparms work for ECKD re-IPL
- cpacfstats: Add 'unauthorized' state to CPU-MF counters
- cpictl: Detect RHCOS using VARIANT_ID
- hsci: Automatically set appropriate MTU for HSCI
- libutil: Add util_readlink() and util_readlinkat() helpers
- libutil: Add util_startswith() to util_str
- libutil: Add utility parsing functions
- lschp: Add support for structured output (--format)
- lsreipl: Suppress 'clear' output if not supported
- pvimg: Add '--format text' support to 'pvimg info'
- pvimg: Add '--print-schema ' option to 'pvimg info'
- pvimg: Add '--show-secrets' flag to 'pvimg info'
- pvimg: Provide improved JSON output to 'pvimg info --format json'
- pvinfo: Improve User experience on non-SE enabled systems
- zipl/ngdump: Ensure ext4 file system is used on dump partition
- zkey: Add support for integrity protected disks using HMAC keys

Bug Fixes:
-------------
- cpumf/pai: Handle different size of perf_event_attr
- lscss: Fix memory leak
- zipl: Fix dump job on tape devices

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ttyrun/{ttyrun_2.40.0.bb => ttyrun_2.41.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.40.0.bb => ttyrun_2.41.0.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.40.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.41.0.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.40.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.41.0.bb
index 974b0a8aa0..59dfab7122 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.40.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.41.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "aca6704cfa27434452580369b4bc8a024bd0edee"
+SRCREV = "5e07b30bdf67623e7a6d3850e26208b642d416d7"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.43.0


