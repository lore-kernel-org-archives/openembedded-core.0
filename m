Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.29432.1618218515903981471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 02:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 5DQ+clbmDeT/h5ZmddQHjhMwttaBBukbnUcyXIn/Xbc/3NAXgL1yqwEySg1z3/u+qHII+5ZHe9
 hALgisFylh8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="255467960"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="255467960"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:59 -0700
IronPort-SDR: 2u9n5oJU5Ddl9jUPCXBIDHCL2/c278TwCVWV6sTXHRLzfm5PyEWrveF7xezmiq1POX4vQZd5Wx
 h80z5zsTpn2A==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="531809170"
Received: from pchuang-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.174.143])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:58 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 17/18] image,populate_sdk_base: move 'func' flag setting for sdk command vars
Date: Mon, 12 Apr 2021 17:08:25 +0800
Message-Id: <01f9a99f04f0c8c135e167832215f4c1919fdb55.1618210563.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618210563.git.anuj.mittal@intel.com>
References: <cover.1618210563.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christopher Larson <kergoth@gmail.com>

Setting the 'func' flag on the commands variables ensures that they are parsed
as shell, and therefore that the referenced commands contents are included in
checksums. Doing this only in image.bbclass means that this is missing in
recipes that are not images, but which inherit populate_sdk or populate_sdk_base
directly, so move it to the latter.

[YOCTO #13998]

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit edc28907ce19a7298059dd388933c58a9c6c28b9)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/image.bbclass             | 2 +-
 meta/classes/populate_sdk_base.bbclass | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 60b07de221..2f1d5cfb46 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -112,7 +112,7 @@ def rootfs_command_variables(d):
             'IMAGE_PREPROCESS_COMMAND','RPM_PREPROCESS_COMMANDS','RPM_POSTPROCESS_COMMANDS','DEB_PREPROCESS_COMMANDS','DEB_POSTPROCESS_COMMANDS']
 
 python () {
-    variables = rootfs_command_variables(d) + sdk_command_variables(d)
+    variables = rootfs_command_variables(d)
     for var in variables:
         if d.getVar(var, False):
             d.setVarFlag(var, 'func', '1')
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 942d3ec091..635b3a6b80 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -329,6 +329,13 @@ def sdk_variables(d):
 
 do_populate_sdk[vardeps] += "${@sdk_variables(d)}"
 
+python () {
+    variables = sdk_command_variables(d)
+    for var in variables:
+        if d.getVar(var, False):
+            d.setVarFlag(var, 'func', '1')
+}
+
 do_populate_sdk[file-checksums] += "${TOOLCHAIN_SHAR_REL_TMPL}:True \
                                     ${TOOLCHAIN_SHAR_EXT_TMPL}:True"
 
-- 
2.30.2

