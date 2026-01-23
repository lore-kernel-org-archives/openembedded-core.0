Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66CFED6CFD2
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 05:22:55 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61512.1769145771568196873
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 21:22:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MRsSW68V;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769145772; x=1800681772;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=UVKqeQwjOrh4ZNKaOYqMX5hdrTLnSP13kgskJOJbVBg=;
  b=MRsSW68VQQ0w7i3fzlq7zBexwHtDemvxL0vCFG2vsxtUZwpfnIxCRUCU
   53LA4gzEMGYlHyeV68sDyXbuo9O8TBTbdiD1qEJNFm4Qw/A6BDeAmMd32
   l7qd8ZH2Y/nWLdZVsHtss6/MKE2sO6SP7cbxfmJhypeAP8VcwwpKRgWPT
   EQBw+RgTacJUZOG11NfvLGGh01UqpY8yBhtD1B0EUiNJLPIn1JA1lyIr8
   X5lcU2atn5EvtSqXd139Vy3FJdMOsQI1OjYsAlE7LDoKmppWabL6uiV9q
   rmaPrrejjQGinLQyW0KU3eN00QsVHSN+cxzl0+L8DDBVYkDvafiWZPFB5
   A==;
X-CSE-ConnectionGUID: +a6Al7OCTeSidhYPwq8JGQ==
X-CSE-MsgGUID: nABPKH2DQbK1bGhMawyhdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="226820933"
X-IronPort-AV: E=Sophos;i="6.21,247,1763391600"; 
   d="scan'208";a="226820933"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 14:22:50 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id CA1CE1C1737A
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:49 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 8524914042E3
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:49 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 51C801401F26
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:47 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/5] python3-toposort: Add new recipe 
Date: Fri, 23 Jan 2026 13:22:32 +0800
Message-ID: <20260123052234.970-4-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123052234.970-1-liuyd.fnst@fujitsu.com>
References: <20260123052234.970-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229863

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


