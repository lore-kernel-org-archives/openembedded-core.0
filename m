Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBAEC35274
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 01:20:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.779.1702948824302871286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 17:20:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Jrc7qMXg;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702948824; x=1734484824;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=HXeak1DUaGGaXnFxhgoQTMoyyQyu39a0F73/LSfDeUI=;
  b=Jrc7qMXgzqm/2QXS4Ys3/xHTlW38I9ioj+2bATvtupYAsM+1QEn3IIn+
   4NSb63k0yQnropkuiduSuMKOtmsvOigdaisr/70zzvUa4KkscdpK5Va73
   jnuFY5AafVEVrcaYammS/srN4y2OFa9WWiivPl4X+AsKn4kTqfzB5paWr
   lq043ui1rV+NhZjG/U5ymjkgHvlRb20LwMi7Pxf/EfArfoZMk9pNQtlil
   hEuZ817xyDlHIgmdylwBRvmPvR/zJUL0Cs+ceyv67Y1cyc1aQQFQq9jDi
   rXm3zsyiAb5KnRcivfvMSK3HHP9G7sTLm0oAh/LfI9hrpRi7eodSc3k5M
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="386009240"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="386009240"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 17:20:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="23989702"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.154.38])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 17:20:23 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] libusb1: fix upstream version check
Date: Tue, 19 Dec 2023 09:20:10 +0800
Message-ID: <20231219012010.9449-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218144724.7794-1-anuj.mittal@intel.com>
References: <20231218144724.7794-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 01:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192683

Fix regex to not match release candidates.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/libusb/libusb1_1.0.26.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.26.bb b/meta/recipes-support/libusb/libusb1_1.0.26.bb
index 122c3d48b4f..2af6fcdea79 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.26.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.26.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV}.tar.bz2 \
           "
 
 GITHUB_BASE_URI = "https://github.com/libusb/libusb/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 SRC_URI[sha256sum] = "12ce7a61fc9854d1d2a1ffe095f7b5fac19ddba095c259e6067a46500381b5a5"
 
-- 
2.43.0


