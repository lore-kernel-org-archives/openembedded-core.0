Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12270.1612885959329511791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:52:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Hdqi0ah/ta+BTR/sTjKoR0cW4mDE6T9+mg+9zMZQkmQ9jBmxPA41X7cnQibxZQxBkYBnhmLdN/
 II3L65eatOEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="245968577"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="245968577"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:40 -0800
IronPort-SDR: sKNsS73p4bIYbPZg/TldlOx8qmMgk7ACYAYSfix3wSINkxBMJqQ0OvRkCLuFx8Ge81XEaSFobG
 78NjPrJPlVyw==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215420"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:39 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 03/35] recipetool: create: only add npmsw url if required
Date: Tue,  9 Feb 2021 23:51:48 +0800
Message-Id: <6bcd2e242ef85cf875a2ea1a7c208f8c30fbdffa.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kamel Bouhara <kamel.bouhara@bootlin.com>

Before adding a npmsw fetcher to a recipe we
should first check if the generated shrinkwrap file
contains dependencies.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ef153ad36d0299e83a03af8f207686d0d8a238b3)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/recipetool/create_npm.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 579b7ae48a..2bcae91dfa 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -204,6 +204,9 @@ class NpmRecipeHandler(RecipeHandler):
         self._run_npm_install(d, srctree, registry, dev)
         shrinkwrap_file = self._generate_shrinkwrap(d, srctree, dev)
 
+        with open(shrinkwrap_file, "r") as f:
+            shrinkwrap = json.load(f)
+
         if os.path.exists(lock_copy):
             bb.utils.movefile(lock_copy, lock_file)
 
@@ -226,7 +229,8 @@ class NpmRecipeHandler(RecipeHandler):
             value = origvalue.replace("version=" + data["version"], "version=${PV}")
             value = value.replace("version=latest", "version=${PV}")
             values = [line.strip() for line in value.strip('\n').splitlines()]
-            values.append(url_recipe)
+            if "dependencies" in shrinkwrap:
+                values.append(url_recipe)
             return values, None, 4, False
 
         (_, newlines) = bb.utils.edit_metadata(lines_before, ["SRC_URI"], _handle_srcuri)
-- 
2.29.2

