Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.519.1611588684380865257
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 07:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: kamel.bouhara@bootlin.com)
X-Originating-IP: 78.193.40.249
Received: from localhost (unknown [78.193.40.249])
	(Authenticated sender: kamel.bouhara@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C276020015;
	Mon, 25 Jan 2021 15:31:20 +0000 (UTC)
From: "Kamel Bouhara" <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH v2 1/2] npm.bbclass: make shrinkwrap file optional
Date: Mon, 25 Jan 2021 16:31:16 +0100
Message-Id: <20210125153117.2338640-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some packages don't have shrinkwrap file which
means no npmsw uri is provided in the recipe.

[YOCTO #13901]

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 meta/classes/npm.bbclass | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 068032a1e5..d3dd1a9ab8 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -130,11 +130,17 @@ python npm_do_configure() {
     cached_manifest.pop("dependencies", None)
     cached_manifest.pop("devDependencies", None)

-    with open(orig_shrinkwrap_file, "r") as f:
-        orig_shrinkwrap = json.load(f)
+    has_shrinkwrap_file = True

-    cached_shrinkwrap = copy.deepcopy(orig_shrinkwrap)
-    cached_shrinkwrap.pop("dependencies", None)
+    try:
+        with open(orig_shrinkwrap_file, "r") as f:
+            orig_shrinkwrap = json.load(f)
+    except IOError:
+        has_shrinkwrap_file = False
+
+    if has_shrinkwrap_file:
+       cached_shrinkwrap = copy.deepcopy(orig_shrinkwrap)
+       cached_shrinkwrap.pop("dependencies", None)

     # Manage the dependencies
     progress = OutOfProgressHandler(d, r"^(\d+)/(\d+)$")
@@ -165,8 +171,10 @@ python npm_do_configure() {
             progress.write("%d/%d" % (progress_done, progress_total))

     dev = bb.utils.to_boolean(d.getVar("NPM_INSTALL_DEV"), False)
-    foreach_dependencies(orig_shrinkwrap, _count_dependency, dev)
-    foreach_dependencies(orig_shrinkwrap, _cache_dependency, dev)
+
+    if has_shrinkwrap_file:
+        foreach_dependencies(orig_shrinkwrap, _count_dependency, dev)
+        foreach_dependencies(orig_shrinkwrap, _cache_dependency, dev)

     # Configure the main package
     with tempfile.TemporaryDirectory() as tmpdir:
@@ -181,16 +189,19 @@ python npm_do_configure() {
                 cached_manifest[depkey] = {}
             cached_manifest[depkey][name] = version

-    _update_manifest("dependencies")
+    if has_shrinkwrap_file:
+        _update_manifest("dependencies")

     if dev:
-        _update_manifest("devDependencies")
+        if has_shrinkwrap_file:
+            _update_manifest("devDependencies")

     with open(cached_manifest_file, "w") as f:
         json.dump(cached_manifest, f, indent=2)

-    with open(cached_shrinkwrap_file, "w") as f:
-        json.dump(cached_shrinkwrap, f, indent=2)
+    if has_shrinkwrap_file:
+        with open(cached_shrinkwrap_file, "w") as f:
+            json.dump(cached_shrinkwrap, f, indent=2)
 }

 python npm_do_compile() {
--
2.29.2

