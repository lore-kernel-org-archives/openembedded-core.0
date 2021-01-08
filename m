Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.3749.1610079532734030116
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:18:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: n3Ygfq+VLLQAbOdQHcyNh2PUb08asRuP+VdwXKnecuaZoCv3sUkggWiPTiP2R4JOAJA+mzsTw+
 UMO4kr53s2Rg==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613747"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613747"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:57 -0800
IronPort-SDR: TSoh4JraGnB7MEt/7GghzI65xMB3D3v1wQ51dGz0jghGqk+2kKXbKPb3BVLPSVWuBqJY2UIwUY
 mDTA5U5VlzgQ==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209509"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:56 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 29/30] wic: Pass canonicalized paths in PSEUDO_IGNORE_PATHS
Date: Fri,  8 Jan 2021 12:18:11 +0800
Message-Id: <9aec2fdda1235f069cbb365634a3f0fcfc846682.1610079279.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
References: <cover.1610079278.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 55618cbd58d6784a82e773f323723be6f722232f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/wic/partition.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index ebe250b00d..286c7867cb 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -207,11 +207,21 @@ class Partition():
 
         p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" % native_sysroot)
         if (pseudo_dir):
+            # Canonicalize the ignore paths. This corresponds to
+            # calling oe.path.canonicalize(), which is used in bitbake.conf.
+            ignore_paths = [rootfs] + (get_bitbake_var("PSEUDO_IGNORE_PATHS") or "").split(",")
+            canonical_paths = []
+            for path in ignore_paths:
+                if "$" not in path:
+                    trailing_slash = path.endswith("/") and "/" or ""
+                    canonical_paths.append(os.path.realpath(path) + trailing_slash)
+            ignore_paths = ",".join(canonical_paths)
+
             pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
             pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % pseudo_dir
             pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
             pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
-            pseudo += "export PSEUDO_IGNORE_PATHS=%s;" % (rootfs + "," + (get_bitbake_var("PSEUDO_IGNORE_PATHS") or ""))
+            pseudo += "export PSEUDO_IGNORE_PATHS=%s;" % ignore_paths
             pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
         else:
             pseudo = None
-- 
2.29.2

