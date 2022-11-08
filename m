Return-Path: <ezhilarasanx.s@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F014EC4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 08:51:58 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.5718.1667897509159772177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 00:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=lTdX/hw1;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: ezhilarasanx.s@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667897509; x=1699433509;
  h=from:to:subject:date:message-id;
  bh=EmpYepONhV3kjr5hK4tqnSQR0I/2NiXLw11M6fSJuPI=;
  b=lTdX/hw1gfXA2Fhh5KpAXufl5yOQtHdgDzfQz9/DCSeFgJh3eusBNrsr
   VNKqjGSldMlizbiHFkkJS8S8vOSr06LVKvdiPLc2gluZMh3A8AGfgnpDP
   /Smnx8X4ZXHRHvcw3NNCkvI6hfpwkqG0JR/lVAn2rVyypTaxX3pegOgry
   T5h3743WRdlrg61LcTHrbF4BYqfzly/jKwl2JTWCFvYx5uqMmh4ctJfGg
   Rr2JNUAh2SgZ6TPKKER8H/Yq97mqnAakXcZtgUHX2uyDbPAFt0SMlLaSb
   pq5ETXi/hn4bHQ3CSY77I34LhKuY6gN5YOJ11O7rNJuxvp0s9TMxNPdv0
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="308264807"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="308264807"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 00:51:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="699843786"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="699843786"
Received: from inlubt0314.iind.intel.com ([10.67.198.223])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 00:51:20 -0800
From: Ezhilarasan <ezhilarasanx.s@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pixman: backport fix for CVE-2022-44638
Date: Tue,  8 Nov 2022 14:21:09 +0530
Message-Id: <20221108085109.3851-1-ezhilarasanx.s@intel.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 08:51:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172954

Reference to upstream patch:
https://gitlab.freedesktop.org/pixman/pixman/-/commit/a1f88e842e0216a5b4df1ab023caebe33c101395

Signed-off-by: Ravula AdhityaX Siddartha <adhityax.siddartha.ravula@intel.com>
---
 .../xorg-lib/pixman/CVE-2022-44638.patch      | 37 +++++++++++++++++++
 .../xorg-lib/pixman_0.40.0.bb                 |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch

diff --git a/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch b/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
new file mode 100644
index 0000000000..ab5acaf2ee
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
@@ -0,0 +1,37 @@
+From a1f88e842e0216a5b4df1ab023caebe33c101395 Mon Sep 17 00:00:00 2001
+From: Matt Turner <mattst88@gmail.com>
+Date: Wed, 2 Nov 2022 12:07:32 -0400
+Subject: [PATCH] Avoid integer overflow leading to out-of-bounds write
+
+Upstream-Status: Backport
+CVE: CVE-2022-44638
+
+Reference to upstream patch:
+https://gitlab.freedesktop.org/pixman/pixman/-/commit/a1f88e842e0216a5b4df1ab023caebe33c101395
+
+Signed-off-by: Ravula AdhityaX Siddartha <adhityax.siddartha.ravula@intel.com>
+
+Thanks to Maddie Stone and Google's Project Zero for discovering this
+issue, providing a proof-of-concept, and a great analysis.
+
+Closes: https://gitlab.freedesktop.org/pixman/pixman/-/issues/63
+---
+ pixman/pixman-trap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pixman/pixman-trap.c b/pixman/pixman-trap.c
+index 91766fd..7560405 100644
+--- a/pixman/pixman-trap.c
++++ b/pixman/pixman-trap.c
+@@ -74,7 +74,7 @@ pixman_sample_floor_y (pixman_fixed_t y,
+ 
+     if (f < Y_FRAC_FIRST (n))
+     {
+-	if (pixman_fixed_to_int (i) == 0x8000)
++	if (pixman_fixed_to_int (i) == 0xffff8000)
+ 	{
+ 	    f = 0; /* saturate */
+ 	}
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
index ccfe277746..c56733eefd 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
@@ -9,6 +9,7 @@ DEPENDS = "zlib"
 
 SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.gz \
            file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
+           file://CVE-2022-44638.patch \
            "
 SRC_URI[md5sum] = "73858c0862dd9896fb5f62ae267084a4"
 SRC_URI[sha256sum] = "6d200dec3740d9ec4ec8d1180e25779c00bc749f94278c8b9021f5534db223fc"
-- 
2.17.1


