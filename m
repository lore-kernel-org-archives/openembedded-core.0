Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.7664.1614918152863873241
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: dZcAyntIdTp6b2OvlRyajRK8fu+ZNFaE6nlUMvqsUkMagfahhLfb6ZZ7uJyNYsXlZBrTSNtYkM
 WzFiBJkJ6R6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671059"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671059"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:32 -0800
IronPort-SDR: 1VXuDyxSowaPSjPCism3V3+XxATDvCoUc9YNhx1EYRStXkLFnZtyB7GRYyfn6lcSLI/QhmY0tW
 ydpAzjAIJQOQ==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128932"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:31 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 25/52] rsync: Fix group name determinism issue
Date: Fri,  5 Mar 2021 12:21:01 +0800
Message-Id: <737e6c198d404cfeb6d9013f4376ca81163bf965.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

configure falls back to inspecting the host#s /etc/group for the
nobody/nogroup naming. Pass the correct value to configure to
ensure host differences don't sneak in.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e5f809068b32df32e506f3067cd6086195e03f12)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/rsync/rsync_3.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rsync/rsync_3.2.3.bb b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
index 08778ec908..e6a3a67881 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.3.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
@@ -39,7 +39,7 @@ PACKAGECONFIG[zstd] = "--enable-zstd,--disable-zstd,zstd"
 CACHED_CONFIGUREVARS += "rsync_cv_can_hardlink_special=yes rsync_cv_can_hardlink_symlink=yes"
 
 EXTRA_OEMAKE = 'STRIP=""'
-EXTRA_OECONF = "--disable-simd --disable-md2man --disable-asm"
+EXTRA_OECONF = "--disable-simd --disable-md2man --disable-asm --with-nobody-group=nogroup"
 
 # rsync 3.0 uses configure.sh instead of configure, and
 # makefile checks the existence of configure.sh
-- 
2.29.2

