Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.29432.1618218515903981471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 02:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Q9kXJZoTn8VIDhYIvhBqoHu8rVPxqakompnbQFT077X76UU6RzjJQse7ou1H24c2VjPpFVU+d1
 80szgBVYXYFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="255467944"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="255467944"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:54 -0700
IronPort-SDR: oUFZMk/cweyVgfLO0hefjTPWC8YjqI0zzlVoLGHN8L7u1mFqAEnk+H+t7snhOUDJmq5cQw/CbL
 Eft0EhTm1BLQ==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="531809131"
Received: from pchuang-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.174.143])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:51 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 13/18] run-postinsts: do not remove postinsts directory.
Date: Mon, 12 Apr 2021 17:08:21 +0800
Message-Id: <214056938f8408c75b68002643789284eabd0389.1618210563.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618210563.git.anuj.mittal@intel.com>
References: <cover.1618210563.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Anton D. Kachalov" <gmouse@google.com>

When running on the systems having read-only rootfs backed by overlayfs,
removing the whole directory lead to create a special char device file
on the upperdir to reflect directory's removal. Once it is required to
upgrade the whole read-only image that might contain new postinsts scripts,
it will be impossible to run such scripts with a "deletion mark" file
on the overlayfs -- the whole directory will be marked as deleted regardless
new files in it.

Signed-off-by: Anton D. Kachalov <gmouse@google.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a27b62b225ffeecec47c249a0b86cc54d775add)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../run-postinsts/run-postinsts/run-postinsts          | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index f84a7e18c8..95dccb9cae 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -72,12 +72,12 @@ exec_postinst_scriptlets() {
 		else
 			echo "ERROR: postinst $i failed."
 			[ "$POSTINST_LOGGING" = "1" ] && eval echo "ERROR: postinst $i failed." $append_log
-			remove_pi_dir=0
+			remove_rcsd_link=0
 		fi
 	done
 }
 
-remove_pi_dir=1
+remove_rcsd_link=1
 if $pm_installed; then
 	case $pm in
 		"ipk")
@@ -92,9 +92,7 @@ else
 	exec_postinst_scriptlets
 fi
 
-# since all postinstalls executed successfully, remove the postinstalls directory
-# and the rcS.d link
-if [ $remove_pi_dir = 1 ]; then
-	rm -rf $pi_dir
+# since all postinstalls executed successfully, remove the rcS.d link
+if [ $remove_rcsd_link = 1 ]; then
 	remove_rcsd_link
 fi
-- 
2.30.2

