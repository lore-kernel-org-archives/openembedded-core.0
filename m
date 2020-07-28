Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8237.1595926357616374658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 3sdI/K+eTrbq6Qv9bVAQGTCH31JDYvg9tXGxf5JtG3sSrPtVSaGnUBfq1tvqcb5fgVbJF1YJr+
 fuUZ6EvrFkgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699674"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699674"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:52:49 -0700
IronPort-SDR: PkLVOAPhySCEjp7A3fQa1HcgJLJRoM94dJiEtKIQY+a7D3YYeT+gmi31Q/alsVPCbtUmtxktKg
 GaeK2CjygQ3g==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245741"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:52:48 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 07/32] cve-check: include epoch in product version output
Date: Tue, 28 Jul 2020 16:51:08 +0800
Message-Id: <a8b69927485acbe504fcd75dc2cafc4c550cb66a.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ralph Siemsen <ralph.siemsen@linaro.org>

In the generated cve.log files, include the epoch in the product
version. This better matches how versions are displayed elsewhere,
in particular the bb.warn("Found unpatched CVE...") that appears
on the terminal when CVEs are found.

(From OE-Core rev: 99f6de1c74b581054c74c6b4598a5d47facc9964)

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
(cherry picked from commit e1c3c0b6e5b01304e2127f5058986697e82adf93)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 556ac6e67f..514897e8b8 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -301,7 +301,7 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
 
     for cve in sorted(cve_data):
         write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
-        write_string += "PACKAGE VERSION: %s\n" % d.getVar("PV")
+        write_string += "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDPE"), d.getVar("PV"))
         write_string += "CVE: %s\n" % cve
         if cve in whitelisted:
             write_string += "CVE STATUS: Whitelisted\n"
-- 
2.25.4

