Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8237.1595926357616374658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: LzO/sVb0hleJ+k3aBgCZDHkpODYuCowDkHGaJHhH8M7XCTbdmVg+ZfRYTYK6H/qpn0n+KYeATZ
 1H/lXefx/QkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699663"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699663"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:52:46 -0700
IronPort-SDR: T5nic9NO+7cOCdog6cYYJVOmJV4xyvGw65EpUqR/lWFKGmhCpWmwttDs+R9owX/XGTPsI7VPfS
 rEqW2E6KPEfA==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245715"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:52:44 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 05/32] cve-check: Run it after do_fetch
Date: Tue, 28 Jul 2020 16:51:06 +0800
Message-Id: <4b65abc70e84187f666e2ea2ab4dcf6bf7216658.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Certain recipes e.g. bash readline ( from meta-gplv2 ) download patches instead of having them in
metadata, this could fail cve_check

ERROR: readline-5.2-r9 do_cve_check: File Not found: qemuarm/build/../downloads/readline52-001

This patch ensures that download is done before running CVE scan, even
though these will be external patches and may not contain CVE tags as it
expects, but it will fix the run failures as seen above

(From OE-Core rev: dbf143d79476e54e8da93101fc16eaedeec88362)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e406fcb6c609a0d2456d7da0d2406d2d9fa52dd2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 2a530a0489..556ac6e67f 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -65,7 +65,7 @@ python do_cve_check () {
 
 }
 
-addtask cve_check before do_build
+addtask cve_check before do_build after do_fetch
 do_cve_check[depends] = "cve-update-db-native:do_populate_cve_db"
 do_cve_check[nostamp] = "1"
 
-- 
2.25.4

