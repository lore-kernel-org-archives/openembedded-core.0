Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7838.1614918147367914867
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: JLGylUzq/YukM/vz6itg7TPoATOZRO6c6jYY4jh/aFqARmNIyRdWdjUOxxxrAmxmVyXz0TdMGG
 ozhBLCFT2AmA==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187670955"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187670955"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:21 -0800
IronPort-SDR: HkP4g/iP/MOMonN3E0SAkro1ge1saQTxQjZ0zrDURY3AcF4Bah4OiU7PYoMy6DNe3+NT359T6T
 7QW40IoKPXPw==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128858"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:20 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 17/52] package_rpm: Enable use_source_date_epoch_as_buildtime in package_rpm class
Date: Fri,  5 Mar 2021 12:20:53 +0800
Message-Id: <cdec52821dae48ef4d31acc1f96da1e993cc6fb0.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jan-Simon Möller <jsmoeller@linuxfoundation.org>

Adding --define 'use_source_date_epoch_as_buildtime 1' to rpmbuild
ensure that the rpm header does have a consistent BUILDTIME tag.

This allows the rpms to be built reproducibly.

Signed-off-by: Jan-Simon Möller <jsmoeller@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f16721df6b3d0d3e681d9a1b3393417bd62b6275)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/package_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 53b4700cdd..89b4c6bbfc 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -687,6 +687,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_binary_payload w6T.xzdio'"
     cmd = cmd + " --define '_source_payload w6T.xzdio'"
     cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
+    cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
     if perfiledeps:
         cmd = cmd + " --define '__find_requires " + outdepends + "'"
-- 
2.29.2

