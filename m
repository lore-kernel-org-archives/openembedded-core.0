Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.3749.1610079532734030116
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:18:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: /nHMOClUcgQ4vDFHqupK94hU/a4o+Hm91yrihULP8WRexCsZPUWuMsktRBTrnsRc8PtBti8YUz
 z+64hrfggJDg==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613737"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613737"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:54 -0800
IronPort-SDR: qkaHQX9rFqiZhdMoZGBVUSeafRdlBt8hHxir0PWIyCHDos1l64HV3UbadFpF/MbCAaqPE61muV
 Zspc3MkGmeAw==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209502"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:54 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 27/30] lib/oe/path: Add canonicalize()
Date: Fri,  8 Jan 2021 12:18:09 +0800
Message-Id: <5c9931e0ffcb1663f529289f2e03c549fdb3c4da.1610079279.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
References: <cover.1610079278.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

oe.path.canonicalize() is used to canonicalize paths (i.e., remove
symbolic links and "..", and make them absolute). It takes a string
with paths separated by commas, and returns the canonicalized path in
the same format.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 282b19c0e27488ec119f00fb2542ffdc1af54e2a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/path.py | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 082972457b..c8d8ad05b9 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -320,3 +320,24 @@ def which_wild(pathname, path=None, mode=os.F_OK, *, reverse=False, candidates=F
 
     return files
 
+def canonicalize(paths, sep=','):
+    """Given a string with paths (separated by commas by default), expand
+    each path using os.path.realpath() and return the resulting paths as a
+    string (separated using the same separator a the original string).
+    """
+    # Ignore paths containing "$" as they are assumed to be unexpanded bitbake
+    # variables. Normally they would be ignored, e.g., when passing the paths
+    # through the shell they would expand to empty strings. However, when they
+    # are passed through os.path.realpath(), it will cause them to be prefixed
+    # with the absolute path to the current directory and thus not be empty
+    # anymore.
+    #
+    # Also maintain trailing slashes, as the paths may actually be used as
+    # prefixes in sting compares later on, where the slashes then are important.
+    canonical_paths = []
+    for path in (paths or '').split(sep):
+        if '$' not in path:
+            trailing_slash = path.endswith('/') and '/' or ''
+            canonical_paths.append(os.path.realpath(path) + trailing_slash)
+
+    return sep.join(canonical_paths)
-- 
2.29.2

