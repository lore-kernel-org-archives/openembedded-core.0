Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web08.2139.1626999573704100664
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 17:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="199041409"
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; 
   d="scan'208";a="199041409"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2021 17:19:32 -0700
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; 
   d="scan'208";a="577499412"
Received: from brfu-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.226.95])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2021 17:19:31 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Revert "Revert "libubootenv: inherit uboot-config""
Date: Fri, 23 Jul 2021 08:19:27 +0800
Message-Id: <20210723001927.42892-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit be1cf223bf9c514ee81820ded5b13318458c0daf.

The original change was added to resolve build errors [1] for MACHINE
values that don't have u-boot support. This recipe was, after that
change, skipped in world builds for those MACHINEs.

But we should be able to build libubootenv with or without u-boot
support [2] so the original solution to inherit uboot-config was not
perfect. But until we have a better solution, revert this so
builds don't fail for others.

[1] https://lists.openembedded.org/g/openembedded-core/message/153508
[2] https://lists.openembedded.org/g/openembedded-core/message/153614

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
index 6774290ea5..cb59dd3f1d 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
@@ -15,7 +15,7 @@ SRCREV = "ba7564f5006d09bec51058cf4f5ac90d4dc18b3c"
 
 S = "${WORKDIR}/git"
 
-inherit cmake lib_package
+inherit uboot-config cmake lib_package
 
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
 
-- 
2.31.1

