Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.7663.1614918143328449753
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 1XeVHE0AMMgtxYGGLoD7eJCH5B/05NLCpYk2F9ls9yQZzYC+ISEyBaSWh+G0pm49jeXf1UQ3Za
 oGiuChBB97rg==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187670913"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187670913"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:14 -0800
IronPort-SDR: WP3aoFT0yS3S6LfYSW4Xt9gn9mffmUmw+Z31XWHfFwehGiQWXrc2TrY98Qvf7C9OSqOFJj0yVW
 wkqTXchzjkbQ==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128812"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:12 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 11/52] cve-check.bbclass: add layer to cve log
Date: Fri,  5 Mar 2021 12:20:47 +0800
Message-Id: <4fd15597499a69fe690934afc3aa5a89322228dd.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: akuster <akuster808@gmail.com>

Lets include whcih layer a package belongs to and
add it to the cve logs

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 00d965bb42dc427749a4c3985af56ceffff80457)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/cve-check.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index ed86403b6b..061af7a276 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -335,6 +335,9 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
     """
 
     cve_file = d.getVar("CVE_CHECK_LOG")
+    fdir_name  = d.getVar("FILE_DIRNAME")
+    layer = fdir_name.split("/")[-3]
+
     nvd_link = "https://web.nvd.nist.gov/view/vuln/detail?vulnId="
     write_string = ""
     unpatched_cves = []
@@ -344,6 +347,7 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
         is_patched = cve in patched
         if is_patched and (d.getVar("CVE_CHECK_REPORT_PATCHED") != "1"):
             continue
+        write_string += "LAYER: %s\n" % layer
         write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
         write_string += "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDPE"), d.getVar("PV"))
         write_string += "CVE: %s\n" % cve
-- 
2.29.2

