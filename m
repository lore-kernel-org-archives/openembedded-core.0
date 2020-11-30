Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.53727.1606698706457667213
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Nov 2020 17:11:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: bbQZt7SqwX1NDj1humFLL0/qdYxsoOk+OzHfq4SjwwLuLP4HFOGx3eZ/JgG25O6UhPYI6FLrpR
 JFI9lW2N+y8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="170004346"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="170004346"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:11:47 -0800
IronPort-SDR: BDXhIXe2X9kh4YnUdVGFUv/C5OgO4iq4O0gSWjpfcKNFRMh9A3YhLJiajKDdqxM3aIcMS71G9A
 xdQhAoyYv74g==
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="372302597"
Received: from ajraj-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.114.166])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:11:45 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 01/21] license_image.bbclass: use canonical name for license files
Date: Mon, 30 Nov 2020 09:11:16 +0800
Message-Id: <0fda54af52dfb57598ea9409113d33dacb786dc1.1606698421.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606698421.git.anuj.mittal@intel.com>
References: <cover.1606698421.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

When copying license files to the image rootfs, i.e to
/usr/share/common-licenses, a canonical name of a license should be
used, otherwise duplicated files end up in common-licenses directory.

For example, GPL-2.0 license according to conf/license.conf can be
referenced in recipes as GPL-2, GPLv2, and GPLv2.0. If a license name is
used directly, we end up with three files in the rootfs with the same
content. If a canonical name used instead, then each license gets copied
only once.

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 670fe71dd18ea675f35581db4a61fda137f8bf00)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/license_image.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 702e9f9c55..119c8dfc86 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -125,7 +125,6 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
 
                 licenses = os.listdir(pkg_license_dir)
                 for lic in licenses:
-                    rootfs_license = os.path.join(rootfs_license_dir, lic)
                     pkg_license = os.path.join(pkg_license_dir, lic)
                     pkg_rootfs_license = os.path.join(pkg_rootfs_license_dir, lic)
 
@@ -144,6 +143,8 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                                 bad_licenses) == False:
                             continue
 
+                        # Make sure we use only canonical name for the license file
+                        rootfs_license = os.path.join(rootfs_license_dir, "generic_%s" % generic_lic)
                         if not os.path.exists(rootfs_license):
                             oe.path.copyhardlink(pkg_license, rootfs_license)
 
-- 
2.28.0

