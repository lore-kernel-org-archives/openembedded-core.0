Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.6884.1620370976483734079
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: +YJIF9swhYGyWSkr+atOM/2NjVSZFl/zStqFsmbiMfVIWmxLMRCrWctJiC3zgJo1A+6vHuEdZW
 PBnIPUGTyrhg==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794674"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794674"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:02:54 -0700
IronPort-SDR: K/KVrtj3e400CVJ791hH/idV+9jrmdJ6iTqHUIWKJ0cB547ozcXcdakTL0oTXPU+LARHKi2DSv
 pVptIoTIhYrA==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331541"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:02:53 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 02/31] license_image.bbclass: Fix symlink to generic license files
Date: Fri,  7 May 2021 15:02:14 +0800
Message-Id: <e24510fbb1439d56a278e2b5fc036d11a24e23df.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Reto Schneider <reto.schneider@husqvarnagroup.com>

Link to the canonical filename of a license as only this one exists.

Fixes commit 670fe71dd18ea675f35581db4a61fda137f8bf00
[license_image.bbclass: use canonical name for license files].

Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 64b1ba978e079c345e1f7fbd1bf44052fc3dd857)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/license_image.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index b9a0f2359b..73cebb4d55 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -144,12 +144,13 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                             continue
 
                         # Make sure we use only canonical name for the license file
-                        rootfs_license = os.path.join(rootfs_license_dir, "generic_%s" % generic_lic)
+                        generic_lic_file = "generic_%s" % generic_lic
+                        rootfs_license = os.path.join(rootfs_license_dir, generic_lic_file)
                         if not os.path.exists(rootfs_license):
                             oe.path.copyhardlink(pkg_license, rootfs_license)
 
                         if not os.path.exists(pkg_rootfs_license):
-                            os.symlink(os.path.join('..', lic), pkg_rootfs_license)
+                            os.symlink(os.path.join('..', generic_lic_file), pkg_rootfs_license)
                     else:
                         if (oe.license.license_ok(canonical_license(d,
                                 lic), bad_licenses) == False or
-- 
2.30.2

