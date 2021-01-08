Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3706.1610079500392423505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:18:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: HmGm9FbbbL2wf5Gd5YNfzW/yRYguk9pfN9O4oZxXgb12dii5xh9yZChE1bzBImdxu2v0McpF3P
 cWTGeB1rDf9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613666"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613666"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:33 -0800
IronPort-SDR: 32RRQtXki4GmSpQCMO5YiDTFpJe2Zc224vHW3uAi0txKbVGmBka7gdhM/qSSR58JZCcz26gbDP
 UOaBWlCGk+HA==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209426"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:32 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 11/30] man-db: Fix reproducibility issue
Date: Fri,  8 Jan 2021 12:17:53 +0800
Message-Id: <ba0797130d60d168ea85be4e5928492a73fa4e7b.1610079279.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
References: <cover.1610079278.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Executing a sequence like:

bitbake man-db
bitbake man-db -c clean
bitbake man-db -c package_write_deb -f

results in the ownership of files in the man-db package changing from "man/man"
to "6/12". This is due to base-passwd not being installed in the recipe
sysroot.

Add the missing dependency so even if a recipe "re-packages", the name
of the user/group is found and the packages are reproducible.

[YOCTO #14172]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 769f8be29a192fd4fa0c4752f851fa3728d71179)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/man-db/man-db_2.9.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/man-db/man-db_2.9.3.bb b/meta/recipes-extended/man-db/man-db_2.9.3.bb
index a28f77b750..e8da92bd19 100644
--- a/meta/recipes-extended/man-db/man-db_2.9.3.bb
+++ b/meta/recipes-extended/man-db/man-db_2.9.3.bb
@@ -11,6 +11,7 @@ SRC_URI[sha256sum] = "fa5aa11ab0692daf737e76947f45669225db310b2801a5911bceb7551c
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS_${PN} += "base-passwd"
+PACKAGE_WRITE_DEPS += "base-passwd"
 
 # | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939: undefined reference to `_nl_msg_cat_cntr'
 USE_NLS_libc-musl = "no"
-- 
2.29.2

