Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F320DC6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:47:44 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.782.1663040862082628879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 20:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=lJ8mFDRS;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663040862; x=1694576862;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=GrhisqEdmPHX05/Gx1XVDPOsypDQmP9xyJoul5Eka7I=;
  b=lJ8mFDRSZmvzvTMRb1pyHQZtl+1AQUbCbbcdW9OzHVrL0UhLpqXGUD9Q
   JMV3zPv20dC7WRa7ohplSe4ahyTYyYyPQPe5YPQUbyyK/RkDVzbZLAS93
   nwFXU9wpwwO0A+Axm1Cfn5LmaXeSDgT4kP36tbofSRxMAoo35cfXMb+S2
   PvMnununhg4MAiq0Y6pbRFpZvkvgQVZSw4rxRjpGzE+B1RLtXSHFqcB6c
   RjdcNsStJRXtauxumhJ/IxLQDD1l5zh78gEWKfUeiHSg/LocTeskkdKkC
   Al9ZYZRQXRa64B34dnTYEM652ynCzTCETlLuXsQ61LhpzosAZOc19lIzo
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="384324360"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200";
   d="scan'208";a="384324360"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 20:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200";
   d="scan'208";a="567425892"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga003.jf.intel.com with ESMTP; 12 Sep 2022 20:47:41 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 2/3] gnutls: fix CVE-2021-4209
Date: Tue, 13 Sep 2022 11:47:38 +0800
Message-Id: <20220913034739.45165-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220913034739.45165-1-chee.yang.lee@intel.com>
References: <20220913034739.45165-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 03:47:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170558

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../gnutls/gnutls/CVE-2021-4209.patch         | 37 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb  |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2021-4209.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2021-4209.patch b/meta/recipes-support/gnutls/gnutls/CVE-2021-4209.patch
new file mode 100644
index 0000000000..0bcb55e573
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2021-4209.patch
@@ -0,0 +1,37 @@
+From 3db352734472d851318944db13be73da61300568 Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Wed, 22 Dec 2021 09:12:25 +0100
+Subject: [PATCH] wrap_nettle_hash_fast: avoid calling _update with zero-length
+ input
+
+As Nettle's hash update functions internally call memcpy, providing
+zero-length input may cause undefined behavior.
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+https://gitlab.com/gnutls/gnutls/-/commit/3db352734472d851318944db13be73da61300568
+Upstream-Status: Backport
+CVE: CVE-2021-4209
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ lib/nettle/mac.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/nettle/mac.c b/lib/nettle/mac.c
+index f9d4d7a8df..35e070fab0 100644
+--- a/lib/nettle/mac.c
++++ b/lib/nettle/mac.c
+@@ -788,7 +788,9 @@ static int wrap_nettle_hash_fast(gnutls_digest_algorithm_t algo,
+ 	if (ret < 0)
+ 		return gnutls_assert_val(ret);
+ 
+-	ctx.update(&ctx, text_size, text);
++	if (text_size > 0) {
++		ctx.update(&ctx, text_size, text);
++	}
+ 	ctx.digest(&ctx, ctx.length, digest);
+ 
+ 	return 0;
+-- 
+GitLab
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.14.bb b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
index e9af71c7bd..f1757871ce 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2021-20231.patch \
            file://CVE-2021-20232.patch \
            file://CVE-2022-2509.patch \
+           file://CVE-2021-4209.patch \
 "
 
 SRC_URI[sha256sum] = "5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63"
-- 
2.36.1


