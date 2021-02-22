Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.36963.1614009640008517381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:00:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 6RZGCojIHWRPzp/BiGYMEbwbXJHPpdsZ4b+z3YX4KBW5s+iEUVYapB3sHNrxVy0OF9gvncRSUC
 Uyt9wu0l4zbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="181049279"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="181049279"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:00:43 -0800
IronPort-SDR: 8dcuCa2et8zuCw9k5cZQTIsRLmCqHQypWYuLtwnmFe4wQugMGHIgSH1/CS3Xoq5fF6Zg2nLjMF
 TILHKqTWceBQ==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430301813"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:00:42 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 03/30] oe-pkgdata-util: Check if environment script is initialized
Date: Tue, 23 Feb 2021 00:00:06 +0800
Message-Id: <6cc45e917e371d572cbacf05f1a46af9e833d0cb.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dorinda <dorindabassey@gmail.com>

Tinfoil doesn't behave well if environment is not initialized, this check ensures a proper error log if environment is not initialized.

[YOCTO #12096]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e88073e16f1b4cfd0f97c81a988640a84adad674)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/oe-pkgdata-util | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 93220e3617..75dd23efa3 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -598,6 +598,9 @@ def main():
             logger.error("Unable to find bitbake by searching parent directory of this script or PATH")
             sys.exit(1)
         logger.debug('Found bitbake path: %s' % bitbakepath)
+        if not os.environ.get('BUILDDIR', ''):
+            logger.error("This script can only be run after initialising the build environment (e.g. by using oe-init-build-env)")
+            sys.exit(1)
         tinfoil = tinfoil_init()
         try:
             args.pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR')
-- 
2.29.2

