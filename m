Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.29432.1618218515903981471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 02:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Ex70ZstWuewNR39Fgk6Dnz2Gm+3KI7Zzpxscmp99/zeQzLlV1k7yQJMCZ/gxO+c4KGvaDq1JUp
 B2VA2RW8UHLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="255467958"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="255467958"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:58 -0700
IronPort-SDR: gCjqx33dUz0sJN+MP12f2WejrPInGH7lLpXWdfsr7ZOy9vy5Gi/cfQB6/m2+06ULcUvdsT8mAq
 FHG4ykCOftpg==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="531809162"
Received: from pchuang-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.174.143])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:57 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 16/18] buildhistory: add missing vardepsexcludes
Date: Mon, 12 Apr 2021 17:08:24 +0800
Message-Id: <2b7d4a7a1deb6c2565410a65be0368f6e8bb3efb.1618210563.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618210563.git.anuj.mittal@intel.com>
References: <cover.1618210563.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christopher Larson <kergoth@gmail.com>

For POPULATE_SDK_POST_TARGET_COMMAND, POPULATE_SDK_POST_HOST_COMMAND, and SDK_POSTPROCESS_COMMAND, the appropriate entries were added to vardepvalueexclude, but we want them in vardepsexclude as well.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 554b17e0bbe5190e4b03121f2ed06f4845012a71)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/buildhistory.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 3a6780da34..726f17a946 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -674,13 +674,16 @@ IMAGE_POSTPROCESS_COMMAND[vardepsexclude] += "buildhistory_get_imageinfo"
 POPULATE_SDK_POST_TARGET_COMMAND_append = " buildhistory_list_installed_sdk_target;"
 POPULATE_SDK_POST_TARGET_COMMAND_append = " buildhistory_get_sdk_installed_target;"
 POPULATE_SDK_POST_TARGET_COMMAND[vardepvalueexclude] .= "| buildhistory_list_installed_sdk_target;| buildhistory_get_sdk_installed_target;"
+POPULATE_SDK_POST_TARGET_COMMAND[vardepsexclude] += "buildhistory_list_installed_sdk_target buildhistory_get_sdk_installed_target"
 
 POPULATE_SDK_POST_HOST_COMMAND_append = " buildhistory_list_installed_sdk_host;"
 POPULATE_SDK_POST_HOST_COMMAND_append = " buildhistory_get_sdk_installed_host;"
 POPULATE_SDK_POST_HOST_COMMAND[vardepvalueexclude] .= "| buildhistory_list_installed_sdk_host;| buildhistory_get_sdk_installed_host;"
+POPULATE_SDK_POST_HOST_COMMAND[vardepsexclude] += "buildhistory_list_installed_sdk_host buildhistory_get_sdk_installed_host"
 
 SDK_POSTPROCESS_COMMAND_append = " buildhistory_get_sdkinfo ; buildhistory_get_extra_sdkinfo; "
 SDK_POSTPROCESS_COMMAND[vardepvalueexclude] .= "| buildhistory_get_sdkinfo ; buildhistory_get_extra_sdkinfo; "
+SDK_POSTPROCESS_COMMAND[vardepsexclude] += "buildhistory_get_sdkinfo buildhistory_get_extra_sdkinfo"
 
 python buildhistory_write_sigs() {
     if not "task" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
-- 
2.30.2

