Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.537.1611588685628889931
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 07:31:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: kamel.bouhara@bootlin.com)
X-Originating-IP: 78.193.40.249
Received: from localhost (unknown [78.193.40.249])
	(Authenticated sender: kamel.bouhara@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id EFB6F24000C;
	Mon, 25 Jan 2021 15:31:22 +0000 (UTC)
From: "Kamel Bouhara" <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH v2 2/2] recipetool: create: only add npmsw url if required
Date: Mon, 25 Jan 2021 16:31:17 +0100
Message-Id: <20210125153117.2338640-2-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125153117.2338640-1-kamel.bouhara@bootlin.com>
References: <20210125153117.2338640-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before adding a npmsw fetcher to a recipe we
should first check if the generated shrinkwrap file
contains dependencies.

[YOCTO #13901]

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
2.29.2

