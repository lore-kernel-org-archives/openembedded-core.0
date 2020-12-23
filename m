Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.10343.1608736768391429647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: rCfxT390ezKkte1E+8/1vhRPQW4sRNPpdP7fuFfmmrcznhop4HTf5lOaLhSXDP1sDModRfd5Y9
 iZIm/oNoS4rA==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236149"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236149"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:39 -0800
IronPort-SDR: Qcda6BkM4phJq9LPIzW2KyYIEqrLTrEq8s7UQUg86iHjmnSckDBPAO4FubpVchdyRxFOHIC34D
 x4JDodt4lalA==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027746"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:38 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 33/35] archiver.bbclass: Fix --runall=deploy_archives for images
Date: Wed, 23 Dec 2020 23:18:43 +0800
Message-Id: <965dffec4d0579793e0dbc3d5de18fd4e49850c9.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
INHERIT += "archiver"
COPYLEFT_LICENSE_INCLUDE = "*"

$ bitbake core-image-minimal --runall=deploy_archives
[snip]
KeyError: '/path/to/meta/recipes-core/images/core-image-minimal.bb:do_ar_original'
[snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 59785a51110c450c7629218f6042f1d9d309618e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/archiver.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 598298ef6f..858507b343 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -590,6 +590,7 @@ addtask do_dumpdata
 addtask do_ar_recipe
 addtask do_deploy_archives
 do_build[recrdeptask] += "do_deploy_archives"
+do_rootfs[recrdeptask] += "do_deploy_archives"
 do_populate_sdk[recrdeptask] += "do_deploy_archives"
 
 python () {
-- 
2.29.2

