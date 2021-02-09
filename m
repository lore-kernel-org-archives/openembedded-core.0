Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.12270.1612885959329511791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:52:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: mbZF3lL/UfujNfwwyQsNifkyo6DYMPVh4MH8hpI5lYM5xi5qVjjU3PuyBxvsYif3rjPiuduUY/
 Wug3zXJhNzcg==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="245968572"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="245968572"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:38 -0800
IronPort-SDR: wQ8szfbk0TRcDWEyr0QhX8gKvPVjISvoKiMfurxBVJlNiVdboSWgCBP3F05PdrvJhjFQI3jhvD
 TsnsnGxvaJ5A==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215414"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:37 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 02/35] npm.bbclass: make shrinkwrap file optional
Date: Tue,  9 Feb 2021 23:51:47 +0800
Message-Id: <2c17be47120d388cffafe8213a4b8a92d537805c.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kamel Bouhara <kamel.bouhara@bootlin.com>

Some packages don't have shrinkwrap file which
means no npmsw uri is provided in the recipe.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 47760b0d7d66b2b68ee197d359f0b7b17374d742)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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

