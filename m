Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5680ED3566A
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 03:54:14 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7878.1769658852841881489
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 19:54:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UHd7PpAb;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769658852; x=1801194852;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=UVKqeQwjOrh4ZNKaOYqMX5hdrTLnSP13kgskJOJbVBg=;
  b=UHd7PpAbgEEz+CCd2sJ1xgT/gJ12nIUy++qkL5/eggOqHK9FMIiwEMRe
   MqP1IGNkxCQ5WpVzT1iawQw5cUF0QeoEZ2B2ixa7WWeKFiPUQl5fsu+Il
   DiQ1ic84Ax98N3pd3vyfL5sPQm3atxpGC46XZVVuC4Ri0hhbsdNDaaiH7
   icYXamvbeJhqv+cDBnfNMFSkxbu9TtpsQlJkRRK90U6D/DE02N3zmnTzW
   uQ4rdDxboWFb0ZNdinwPXNFx6j0uU2ZMsNAaR22UdwIMBW88UwqnD6zgT
   sAGRWh1/Wnlu/yx/Rldi/zyfDmx0/Z5Cn3lrxG7A+Vxy8HrwhNUTd69YD
   Q==;
X-CSE-ConnectionGUID: YKrYuzDDTMyFu/dcZxPLjA==
X-CSE-MsgGUID: vcBDvUDqTh6sRi8f/KQAhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="206485111"
X-IronPort-AV: E=Sophos;i="6.21,260,1763391600"; 
   d="scan'208";a="206485111"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 12:54:11 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 3B23542A312
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:11 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id DC7D1C006CD
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:10 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 869B014076A6
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:08 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/6] python3-toposort: Add new recipe
Date: Thu, 29 Jan 2026 11:53:50 +0800
Message-ID: <20260129035353.8982-4-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129035353.8982-1-liuyd.fnst@fujitsu.com>
References: <20260129035353.8982-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230115

Add this new recipe for runtime dependence of hotdoc.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/recipes-devtools/python/python3-toposort_1.10.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-toposort_1.10.bb

diff --git a/meta/recipes-devtools/python/python3-toposort_1.10.bb b/meta/recipes-devtools/python/python3-toposort_1.10.bb
new file mode 100644
index 0000000000..ce903dcec3
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-toposort_1.10.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Implements a topological sort algorithm"
+HOMEPAGE = "https://gitlab.com/ericvsmith/toposort"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[sha256sum] = "bfbb479c53d0a696ea7402601f4e693c97b0367837c8898bc6471adfca37a6bd"
+
+inherit pypi python_setuptools_build_meta
+
+BBCLASSEXTEND = "native"
-- 
2.43.0


