Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7183.1616377301187997965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Z1K2DiIITYwrkFc7zcMcDj15vy6kglAlvL+a4TmFRPDOnCdrg+ok7k4OHpMYU7ZQXzG4leUlIa
 w2g/9rh3eErw==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190211688"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="190211688"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:42:06 -0700
IronPort-SDR: FzDftwryKHpnL/My8a70Gs0kM9IFfLUSPQvDLLufQd0P6BDuQYe/6rtluSkod90QuzDzn3k1cr
 X/bdZD37riVQ==
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="524295264"
Received: from myusoff-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.78.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:42:05 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 22/25] Revert "sstatesig.py: show an error instead of warning when sstate manifest isn't found"
Date: Mon, 22 Mar 2021 09:41:24 +0800
Message-Id: <97557ffca55f95b6fc0837fbf231131ddcea86e0.1616377115.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616377115.git.anuj.mittal@intel.com>
References: <cover.1616377115.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is causing problems. See:

https://lists.openembedded.org/g/openembedded-core/message/149374

This reverts commit da6b76bf6152b2a60c6a31756c287289c3559a74.
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 0d53132866..31a6140984 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -458,7 +458,7 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
         manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-%s-%s.%s" % (pkgarch, taskdata, taskname))
         if os.path.exists(manifest):
             return manifest, d2
-    bb.error("Manifest %s not found in %s (variant '%s')?" % (manifest, d2.expand(" ".join(pkgarchs)), variant))
+    bb.warn("Manifest %s not found in %s (variant '%s')?" % (manifest, d2.expand(" ".join(pkgarchs)), variant))
     return None, d2
 
 def OEOuthashBasic(path, sigfile, task, d):
-- 
2.30.2

