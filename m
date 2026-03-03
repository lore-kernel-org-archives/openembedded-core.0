Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5939BEC048E
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:09:57 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14941.1772532590284588399
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:09:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Uj8jJN+l;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532588; x=1804068588;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BzniN1CEQlbm9RvVV/0dL6A/pz2hCFjUrzGyNsEBTDk=;
  b=Uj8jJN+lObOcOrDlUluGRtTSnnUYc48wCNJTqCOKlFh6kgjXXlPHo2ny
   /JUVzIcZpdUfDCvziXwTCbj1Lrg5vBpXSwOphfOeSksl3j+w18lsW/O4U
   /SjpGGC2u81TEgiTO0vZf0dQHhR2jKbHedSq4A2o2vnLtIsVoxbYlIoLv
   oRyEdd18A4cDYLuoTM9ykWr3AI8vMaXH/e2yAypHrXvcdtAU0vujYCYmf
   4YREf58d8uy/XcHjV/MX+6AvnmjbsKqI4nvVT+MBwtSpb16cuWFeaKdwC
   WcvhtNOXiLWeCkbF5Ic3iU+iF1kytHLyWpFPeMsVTeuLYhLGNr22yhyAB
   Q==;
X-CSE-ConnectionGUID: 8YjlZb24SUqxpYCI3AHEbA==
X-CSE-MsgGUID: qYEbVxN8SHSc7cZ5Sdnxkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="219676183"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="219676183"
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 645591C000BC
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:09:48 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0807C1C00165
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:09:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 5BC601001CE5;
	Tue,  3 Mar 2026 10:09:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/23] enchant2: upgrade 2.8.14 -> 2.8.15
Date: Tue,  3 Mar 2026 18:09:09 +0800
Message-ID: <20260303100929.1624-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260303100929.1624-1-wangmy@fujitsu.com>
References: <20260303100929.1624-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:09:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232280

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfix:
=========
- removing a word that happens to be at the end of a personal word list
  file has not worked since 2.7.0.
- the way that personal word lists are merged with the current
  session has been changed so that personal word list words now appear in
  suggestions with providers that support adding words to the current session
  (Aspell and Hunspell).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../enchant/{enchant2_2.8.14.bb => enchant2_2.8.15.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.14.bb => enchant2_2.8.15.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.14.bb b/meta/recipes-support/enchant/enchant2_2.8.15.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.14.bb
rename to meta/recipes-support/enchant/enchant2_2.8.15.bb
index 4f8f2cf7f8..bc1c5f7a67 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.14.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.15.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d04588769399ff7140fa214b9731e6fc6eda9bb2e75df9f67263717710bb4c4b"
+SRC_URI[sha256sum] = "d3fd9e4170bfb5110b0bda577fe764a38fb606b3c25d2f0c3840234521ff1252"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 
-- 
2.43.0


