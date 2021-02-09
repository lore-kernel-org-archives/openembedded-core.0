Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.12468.1612885988361102987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:53:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: UpGhbqmDMM7ijiUcNDRUgLFwbNx9MCe0lQXQGrPV4+NE8LkYE1PWiTYHAztqybAUElCKx2USew
 W0VXkRxH8jmQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="266736008"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="266736008"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:12 -0800
IronPort-SDR: VUabStc6Se0ByAgFXj2+f9zSOCMm8UwG8nyphw4RE9+aLXCjWpBsxRlDrS8TdU7pRprw9P1nr3
 G0b18+gFgjjw==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215568"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:11 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 24/35] license_image.bbclass: Don't attempt to symlink to the same file
Date: Tue,  9 Feb 2021 23:52:09 +0800
Message-Id: <a378ec0fc2a07797310b4cd29f9f0cd88b042158.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mike Looijmans <mike.looijmans@topic.nl>

Sometimes (that is, in all my builds) the lic_manifest_dir and
lic_manifest_symlink_dir end up pointing to the same file, resulting
in an error like this:
  Exception: FileExistsError: [Errno 17] File exists: '/.../tmp-glibc/deploy/licenses/my-image-tdkz15' -> '/.../tmp-glibc/deploy/licenses/my-image-tdkz15'

First check to see if this is the case before attempting to create
the link.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 50f83fb542065eaf7a20ac07b63ae06441ada180)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/license_image.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 119c8dfc86..6f478ce22c 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -210,7 +210,8 @@ def license_deployed_manifest(d):
             os.unlink(lic_manifest_symlink_dir)
 
         # create the image dir symlink
-        os.symlink(lic_manifest_dir, lic_manifest_symlink_dir)
+        if lic_manifest_dir != lic_manifest_symlink_dir:
+            os.symlink(lic_manifest_dir, lic_manifest_symlink_dir)
 
 def get_deployed_dependencies(d):
     """
-- 
2.29.2

