Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39A5C46CCD
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 14:47:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by mx.groups.io with SMTP id smtpd.web11.45511.1702910852353229137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 06:47:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=RzGfgaSW;
 spf=pass (domain: intel.com, ip: 198.175.65.11, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702910862; x=1734446862;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=6YtbxrNt9TXDT1mNyyBcHMawo1ke99rVlPhQPE/VDz0=;
  b=RzGfgaSWx0OZDtHoGdngip1VVWnGDKjbrtRUK1C1tXhR3s2TzkrEIRAQ
   K/Q+ejAWJ/gWWfzQ3O0bKc411ChrO9tWgUZ/pAmu+M8AL7d0HpVC/70kl
   IjGTDkjawVH7I7gV24ygLBrBXe7qWZtHhWwMvZqINjPctdWqg4qH3dv0n
   O86qVcOHRqGr/58RJRL7HnY+LbOikZ9pG1Ak8J6QHqgcIyzrthGTcZHc2
   5gzs3DwWYYnEGo/FLlbjrMBADovkPV0xncQq1CrqIPNexVV9/ujRkXpjk
   twe9/zsEh/K8haO3H7Jnts3Fzi8qhXGnw8jrb6Iyy1MFZBSvgYlnTK0JJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="2350892"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="2350892"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 06:47:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="23802923"
Received: from jsuah-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.240.31])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 06:47:42 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] libusb1: fix upstream version check
Date: Mon, 18 Dec 2023 22:47:23 +0800
Message-ID: <20231218144724.7794-8-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218144724.7794-1-anuj.mittal@intel.com>
References: <20231218144724.7794-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 14:47:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192653

Fix regex to not match release candidates.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/libusb/libusb1_1.0.26.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.26.bb b/meta/recipes-support/libusb/libusb1_1.0.26.bb
index 122c3d48b4f..1b93a80f3e7 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.26.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.26.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV}.tar.bz2 \
           "
 
 GITHUB_BASE_URI = "https://github.com/libusb/libusb/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)"
 
 SRC_URI[sha256sum] = "12ce7a61fc9854d1d2a1ffe095f7b5fac19ddba095c259e6067a46500381b5a5"
 
-- 
2.43.0


