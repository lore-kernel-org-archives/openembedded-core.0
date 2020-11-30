Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.53727.1606698706457667213
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Nov 2020 17:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 4w/ulDMWcW7yx9Xn9l+n/HkKtLt7dlGoKulkQ3zPN0sIuEOGcb8dtocOj6GRIEomxtw6QUJdzK
 KDhvA309nItQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="170004382"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="170004382"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:01 -0800
IronPort-SDR: dArxbzfm/WxXUu0yfKkYSY5Qhfq4AKu8R6M6k/5WdbBu6lmUVVMlKfsR+l02edMd6uQDsCS1UE
 3+DNI1LycnNg==
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="372302675"
Received: from ajraj-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.114.166])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:00 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 08/21] cve-check: show real PN/PV
Date: Mon, 30 Nov 2020 09:11:23 +0800
Message-Id: <62e07072bbeeebfead34bbdb04e75cff1c4ef1e1.1606698421.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606698421.git.anuj.mittal@intel.com>
References: <cover.1606698421.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

The output currently shows the remapped product and version fields,
which may not be the actual recipe name/version. As this report is about
recipes, use the real values.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 18827d7f40db4a4f92680bd59ca655cca373ad65)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/cve-check.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 25cefda92e..d843e7c4ac 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -208,6 +208,9 @@ def check_cves(d, patched_cves):
     """
     from distutils.version import LooseVersion
 
+    pn = d.getVar("PN")
+    real_pv = d.getVar("PV")
+
     cves_unpatched = []
     # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
     products = d.getVar("CVE_PRODUCT").split()
@@ -217,7 +220,7 @@ def check_cves(d, patched_cves):
     pv = d.getVar("CVE_VERSION").split("+git")[0]
 
     # If the recipe has been whitlisted we return empty lists
-    if d.getVar("PN") in d.getVar("CVE_CHECK_PN_WHITELIST").split():
+    if pn in d.getVar("CVE_CHECK_PN_WHITELIST").split():
         bb.note("Recipe has been whitelisted, skipping check")
         return ([], [], [])
 
@@ -286,12 +289,12 @@ def check_cves(d, patched_cves):
                         vulnerable = vulnerable_start or vulnerable_end
 
                 if vulnerable:
-                    bb.note("%s-%s is vulnerable to %s" % (product, pv, cve))
+                    bb.note("%s-%s is vulnerable to %s" % (pn, real_pv, cve))
                     cves_unpatched.append(cve)
                     break
 
             if not vulnerable:
-                bb.note("%s-%s is not vulnerable to %s" % (product, pv, cve))
+                bb.note("%s-%s is not vulnerable to %s" % (pn, real_pv, cve))
                 # TODO: not patched but not vulnerable
                 patched_cves.add(cve)
 
-- 
2.28.0

