Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12270.1612885959329511791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: HNz1F36QYdiD11gc2oeAFjH94co+9HXSZW1pG/mv8+9fvqhIjdpN7DI67ptWd9LAff48Nr3bj3
 6Ty/oY5B07Vw==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="245968629"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="245968629"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:54 -0800
IronPort-SDR: OVcnXC6qcG/sPSCjhvdFcB+UNRSW8+K79NzbXduIp9lLcKO2FHhqKtsfB5Qy6u9Tr2B0KQNR0j
 U8SBQ4hHbt/A==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215463"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:53 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 12/35] sanity.bbclass: Check if PSEUDO_IGNORE_PATHS and paths under pseudo control overlap
Date: Tue,  9 Feb 2021 23:51:57 +0800
Message-Id: <79368ef09e9eddfea8bcc39ca2b35f64b401fb35.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dorinda <dorindabassey@gmail.com>

Added a sanity check for when PSEUDO_IGNORE_PATHS and paths under pseudo control overlap to avoid random failures generated.

[YOCTO #14193]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6e4bd8cabcdedf4b52345ef5eb421f71d0f19b1d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/sanity.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 16275b2ea5..01c5434f0d 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -710,6 +710,16 @@ def check_sanity_version_change(status, d):
         if i and workdir.startswith(i):
             status.addresult("You are building in a path included in PSEUDO_IGNORE_PATHS " + str(i) + " please locate the build outside this path.\n")
 
+    # Check if PSEUDO_IGNORE_PATHS and and paths under pseudo control overlap
+    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS', expand=True).split(",")
+    pseudo_control_dir = "${D},${PKGD},${PKGDEST},${IMAGEROOTFS},${SDK_OUTPUT}"
+    pseudocontroldir = d.expand(pseudo_control_dir).split(",")
+    for i in pseudoignorepaths:
+        for j in pseudocontroldir:
+            if i and j:
+                if j.startswith(i):
+                    status.addresult("A path included in PSEUDO_IGNORE_PATHS " + str(i) + " and the path " + str(j) + " overlap and this will break pseudo permission and ownership tracking. Please set the path " + str(j) + " to a different directory which does not overlap with pseudo controlled directories. \n")
+
     # Some third-party software apparently relies on chmod etc. being suid root (!!)
     import stat
     suid_check_bins = "chown chmod mknod".split()
-- 
2.29.2

