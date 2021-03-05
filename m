Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.7663.1614918143328449753
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ZU2uI4oulPjMnPgmWalhXZL50pts4RHsP099vKXaCtK4ahBnKiCd8rXnUqZyCABDRmqHA61sIJ
 KLqBEgdYqYBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187670918"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187670918"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:15 -0800
IronPort-SDR: AZukKDEHWjuP/c8pLgQxt8f+K2uy/vPJNlDgUdMbYx+P01n92qAbGgU4IC7SS8ka7xqPH7eLAl
 t47b+TdiYruw==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128830"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:14 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 12/52] cve-check: add include/exclude layers
Date: Fri,  5 Mar 2021 12:20:48 +0800
Message-Id: <10d75c88921df40b8a476f8eccf2f4b664e2df2d.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: akuster <akuster808@gmail.com>

There are times when exluding or including a layer
may be desired. This provide the framwork for that via
two variables. The default is all layers in bblayers.

CVE_CHECK_LAYER_INCLUDELIST
CVE_CHECK_LAYER_EXCLUDELIST

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5fdde65ef58b4c1048839e4f9462b34bab36fc22)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/cve-check.bbclass | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 061af7a276..112ee3379d 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -53,6 +53,13 @@ CVE_CHECK_PN_WHITELIST ?= ""
 #
 CVE_CHECK_WHITELIST ?= ""
 
+# Layers to be excluded
+CVE_CHECK_LAYER_EXCLUDELIST ??= ""
+
+# Layers to be included 
+CVE_CHECK_LAYER_INCLUDELIST ??= ""
+
+
 # set to "alphabetical" for version using single alphabetical character as increament release
 CVE_VERSION_SUFFIX ??= ""
 
@@ -334,10 +341,20 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
     CVE manifest if enabled.
     """
 
+
     cve_file = d.getVar("CVE_CHECK_LOG")
     fdir_name  = d.getVar("FILE_DIRNAME")
     layer = fdir_name.split("/")[-3]
 
+    include_layers = d.getVar("CVE_CHECK_LAYER_INCLUDELIST").split()
+    exclude_layers = d.getVar("CVE_CHECK_LAYER_EXCLUDELIST").split()
+
+    if exclude_layers and layer in exclude_layers:
+        return
+
+    if include_layers and layer not in include_layers:
+        return
+
     nvd_link = "https://web.nvd.nist.gov/view/vuln/detail?vulnId="
     write_string = ""
     unpatched_cves = []
-- 
2.29.2

