Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BDEDECAAD3
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 02:23:57 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.90.1662431031779456794
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 19:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=gZ9B3+1G;
 spf=permerror, err=too many SPF records (domain: intel.com,
 ip: 134.134.136.20, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662431031; x=1693967031;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uRpokDtoQuVpnVedckNvLFC1XJEBUUZp7Z8clmDlipw=;
  b=gZ9B3+1GSbF1ddTpsLYBYcf97YUI1Mq7UlvgkyowiyonlvqFNsRaz4NC
   9IjfAW3cZdCxILiMLPPwGUIs+11ZXD5VQ96jT6oVc7PMz04B3y8jn3rDf
   MI0ra61VMCLByRfA9y8zjyh2UoRVT2pvkr0+jh8dE/hu1QCzAH6D13aGU
   0DSKnDrGEiFkvC/HIZd6QN22ketoEQxFC3k1L3C9VG4UKgTCrjAmn7M0s
   ajrGeGugDIqx/hLz9V6+44Cn2gnU++oF6xQt84IfUcITKrPwLuK17C84M
   25zX3qQvhX/GB23MXFvsS7M7U+Y7k0c4NDuSViYXKlfm5e2nUv/12TUjC
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="283480122"
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200";
   d="scan'208";a="283480122"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 19:23:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200";
   d="scan'208";a="682229438"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga004.fm.intel.com with ESMTP; 05 Sep 2022 19:23:50 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][kirkstone] sqlite: add CVE-2022-35737 patch to SRC_URI
Date: Tue,  6 Sep 2022 10:23:49 +0800
Message-Id: <20220906022349.44886-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 02:23:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170334

From: Chee Yang Lee <chee.yang.lee@intel.com>

SRC_URI include patch introduced in oe-core commit
fdc82b2314b580c0135c16b7278ebf8786311dec

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index d56a3a0209..628f630657 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -3,7 +3,9 @@ require sqlite3.inc
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
-SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+           file://0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch \
+"
 SRC_URI[sha256sum] = "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
 
 # -19242 is only an issue in specific development branch commits
-- 
2.36.1


