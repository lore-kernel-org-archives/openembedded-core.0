Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web11.124723.1597971644235535165
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 18:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: scA7cDI7nEN31IjeGIx9QywdqSne1Hk5I8ETA1BX4/9RGl4Zp8F/eS7woMuW1COQLpHSIzzXQj
 upbjJJNh0fOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9719"; a="135495352"
X-IronPort-AV: E=Sophos;i="5.76,335,1592895600"; 
   d="scan'208";a="135495352"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2020 18:00:43 -0700
IronPort-SDR: xqQQmxrX6fAkLu0BaGNcNSlbey0a0Rh0uUgZ0pgzt9wk4rWopDu/ktspk7F+uByZVzdHLtvwGy
 XTjs75PcG85g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,335,1592895600"; 
   d="scan'208";a="337489603"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga007.jf.intel.com with ESMTP; 20 Aug 2020 18:00:42 -0700
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/oe/recipeutils.py: add support for BBFILES_DYNAMIC
Date: Fri, 21 Aug 2020 09:00:36 +0800
Message-Id: <1597971636-88378-1-git-send-email-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.7.4

Instead of relying on value of BBFILES from bitbake, devtool
parses the layer.conf because the layer might not be in bblayers.conf.
And it currently does not consider the value of BBFILES_DYNAMIC because
of which recipes, in paths defined by BBFILES_DYNAMIC, upgraded
using devtool end up in wrong location.

Include the code from bitbake to append values to BBFILES based on
what is in BBFILES_DYNAMIC too.

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 meta/lib/oe/recipeutils.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 36427eec91..ef69ef207f 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -563,6 +563,23 @@ def get_bbfile_path(d, destdir, extrapathhint=None):
     confdata = bb.cookerdata.parse_config_file(destlayerconf, confdata)
     pn = d.getVar('PN')
 
+    # Parse BBFILES_DYNAMIC and append to BBFILES
+    bbfiles_dynamic = (confdata.getVar('BBFILES_DYNAMIC') or "").split()
+    collections = (confdata.getVar('BBFILE_COLLECTIONS') or "").split()
+    invalid = []
+    for entry in bbfiles_dynamic:
+        parts = entry.split(":", 1)
+        if len(parts) != 2:
+            invalid.append(entry)
+            continue
+        l, f = parts
+        invert = l[0] == "!"
+        if invert:
+            l = l[1:]
+        if (l in collections and not invert) or (l not in collections and invert):
+            confdata.appendVar("BBFILES", " " + f)
+    if invalid:
+        return None
     bbfilespecs = (confdata.getVar('BBFILES') or '').split()
     if destdir == destlayerdir:
         for bbfilespec in bbfilespecs:
-- 
2.17.1

