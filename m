Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.9634.1605627379456851254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:36:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: D4kTqt/1W4B1Sjm/PXtAwRWi7xNyxA7/iN1SshkVAyuqAjNB3C+z7fbQvsjDig2vA1jy8TeZBC
 oLT581QeASFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158719991"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="158719991"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:27 -0800
IronPort-SDR: 9G1iqU/e5dLZbZs9yEkWQ1pbjWyCshwXBGTyMsHXqSiq7gCCzSXbMV/vvJMvwBoOWPMpxj3YTu
 SzxoC7LOz1sg==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="400802968"
Received: from sbinisma-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.40.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:26 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 09/19] oeqa/core/context: expose results as variable
Date: Tue, 17 Nov 2020 23:35:58 +0800
Message-Id: <ba41688f7f0cb44293321df6c69fe47ac1804d63.1605626675.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605626675.git.anuj.mittal@intel.com>
References: <cover.1605626675.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Konrad Weihmann <kweihmann@outlook.com>

register an unittest handler for testresults and expose it as
variable result.
With this even partial results from an interrupted test suite run
can be made available

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a97ae47525157871b6c098ffc352293e365a4335)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/core/context.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 7d3fa3b84a..84b43a93e1 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -31,6 +31,9 @@ class OETestContext(object):
         self._registry = {}
         self._registry['cases'] = collections.OrderedDict()
 
+        self.results = unittest.TestResult()
+        unittest.registerResult(self.results)
+
     def _read_modules_from_manifest(self, manifest):
         if not os.path.exists(manifest):
             raise OEQAMissingManifest("Manifest does not exist on %s" % manifest)
-- 
2.28.0

