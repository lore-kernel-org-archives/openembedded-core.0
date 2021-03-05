Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.7721.1614918147301253292
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: eQBZVI82UBczrcpgwCz6CbnGa4WTnioa8s8amjSaZiYFbeBD7MHYRVp+dZqhBhT+ZBLcR3nwER
 nKx9Nxh+lO5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187670964"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187670964"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:23 -0800
IronPort-SDR: +k/W7kyRqm0jkKcLeFWm/vO7kseLd2C/I/rJXiIocEayiAc/ql/GyLo8SVcoJYuJs1IOXbxq0Z
 SrwlqEK8gkTQ==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128861"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:22 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 18/52] oe/recipeutils: Fix copying patches when BBLAYERS entries are not normalised
Date: Fri,  5 Mar 2021 12:20:54 +0800
Message-Id: <91e73241da31c2958add0585989adea3d57e1bd4.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

`devtool` uses `copy_recipe_files` for the upgrade operation when
creating the new, workspace recipe. Before handling the copy operations,
the function checks the entry in `SRC_URI` against `FILE` while in turn
uses absolute paths. When BBLAYERS contains entries that are not
normalised, this check will fail resulting in having the recipe in the
workspace without the initial patches.

Signef-off-by: Robert Drab <robert.drab@huawei.com>
Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 777fc24ab2c332954b56dac28cd9b3032808828c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index ef69ef207f..407d168894 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -409,7 +409,7 @@ def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True, all_variants=F
                 fetch.download()
             for pth in fetch.localpaths():
                 if pth not in localpaths:
-                    localpaths.append(pth)
+                    localpaths.append(os.path.abspath(pth))
             uri_values.append(srcuri)
 
     fetch_urls(d)
-- 
2.29.2

