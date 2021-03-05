Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.7721.1614918147301253292
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: LKPHfxHaA3jh9Vix82ZUAawjGszqvEP1k90nX3ExPxOyDYu4JkIL3gVSvGuAHO2Bt+MYtvHizK
 m2pF/AuVCIig==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187670939"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187670939"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:20 -0800
IronPort-SDR: DGiFK2Pdh0UMOTmHZ4yugsDR4kSbFLCGE7Kde9ZCuwL35FvJ0XGvcAfyarCInh8CbwqxzHb7PR
 iU6bqDpdQfgQ==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128850"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:18 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 15/52] npm.bbclass: avoid building target nodejs for native npm recipes
Date: Fri,  5 Mar 2021 12:20:51 +0800
Message-Id: <f528e8f1b1966e0d6cb540e3c5f193721e71370a.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yoann Congal <yoann.congal@smile.fr>

The current recipe unconditionally RDEPENDS on nodejs (the target one).
When building on the "-native recipe" of "BBCLASSEXTEND native" recipe,
the target nodejs is unnecessarily built.

This patch fixes this by only RDEPENDS on nodejs when building for the target.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 92a9a86df9e3bcffb13d2f8b5dcbe7822170f734)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/npm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 79f55febcc..55a6985fb0 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -20,7 +20,7 @@
 inherit python3native
 
 DEPENDS_prepend = "nodejs-native "
-RDEPENDS_${PN}_prepend = "nodejs "
+RDEPENDS_${PN}_append_class-target = " nodejs"
 
 NPM_INSTALL_DEV ?= "0"
 
-- 
2.29.2

