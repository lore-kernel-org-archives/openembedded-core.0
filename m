Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.10233.1608736733177759099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: CR81Pi5XvxTcuSqC2agut58VurLVuklAIzHljTHS9WTXvEoJVFq6pCaInCemBcP1iGUaaL/2ky
 2Wte2gXE0N/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236085"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236085"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:21 -0800
IronPort-SDR: tho8Yfdg/jCSk8MHfs9VCnk3NcHDV4sMewGsNzTeaxe2yTUbvHEjI1Lf+ESwf06+7xwX7roizn
 jDHjDbld6neg==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027632"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:20 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 21/35] u-boot-tools: Fix reproducibility issue
Date: Wed, 23 Dec 2020 23:18:31 +0800
Message-Id: <92cfdf6cedb229ca792401bc63c0234e9b7eb33a.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If you build on a system with git < 2.14 from scratch (e.g. debian9), the
tree will be marked as "dirty" and the version will include "-dirty", leading
to a reproducibility problem. The issue is the inode count for Licnses/README
changing due to do_populate_lic hardlinking a copy of the file. We avoid
this by ensuring the index is updated with a "git diff" before the
u-boot machinery tries to determine the version.

build$ ../git/scripts/setlocalversion ../git
""
build$ ln ../git/
build$ ln ../git/README ../foo
build$ ../git/scripts/setlocalversion ../git
""-dirty

(i.e. creating a hardlink dirties the index)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a4de915af9e2c4d365527ad09286483b2ee904fc)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools.inc | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-bsp/u-boot/u-boot-tools.inc
index 8ae290acc6..4ed936a70d 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
@@ -23,6 +23,21 @@ SED_CONFIG_EFI_armeb = ''
 SED_CONFIG_EFI_aarch64 = ''
 
 do_compile () {
+	# Yes, this is crazy. If you build on a system with git < 2.14 from scratch, the tree will
+	# be marked as "dirty" and the version will include "-dirty", leading to a reproducibility problem.
+	# The issue is the inode count for Licnses/README changing due to do_populate_lic hardlinking a
+	# copy of the file. We avoid this by ensuring the index is updated with a "git diff" before the
+	# u-boot machinery tries to determine the version.
+	#
+	# build$ ../git/scripts/setlocalversion ../git
+	# ""
+	# build$ ln ../git/
+	# build$ ln ../git/README ../foo
+	# build$ ../git/scripts/setlocalversion ../git
+	# ""-dirty
+	# (i.e. creating a hardlink dirties the index)
+	cd ${S}; git diff; cd ${B}
+
 	oe_runmake -C ${S} sandbox_defconfig O=${B}
 
 	# Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
-- 
2.29.2

