Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.4719.1610608380457082999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 23:13:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: kamel.bouhara@bootlin.com)
X-Originating-IP: 78.193.40.249
Received: from localhost (unknown [78.193.40.249])
	(Authenticated sender: kamel.bouhara@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D7AFBFF80A;
	Thu, 14 Jan 2021 07:12:57 +0000 (UTC)
From: "Kamel Bouhara" <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH 2/2] recipetool: create: only add npmsw url if required
Date: Thu, 14 Jan 2021 08:12:35 +0100
Message-Id: <20210114071235.2210763-3-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114071235.2210763-1-kamel.bouhara@bootlin.com>
References: <20210114071235.2210763-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before adding a npmsw fetcher to a recipe we
should first check if the generated shrinkwrap file
contains dependencies.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
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
2.11.0

