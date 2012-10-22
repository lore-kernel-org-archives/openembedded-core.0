Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TQJsc-00004t-OO
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 17:25:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9MFC1R9026051
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 08:12:02 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Mon, 22 Oct 2012 08:12:01 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Oct 2012 10:20:36 -0500
Message-ID: <d83b7ccccf4d89ae955c0b98865554c2554e7bc7.1350918262.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1350918262.git.mark.hatle@windriver.com>
References: <cover.1350918262.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/4] multilib - crosssdk: Stop building multilib for crosssdk packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2012 15:25:27 -0000
Content-Type: text/plain

Crosssdk packages are not actually multilib packages, so treat them
the same as other nativesdk packages in the multilib, base, and
classextend components.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/base.bbclass     |    8 ++++----
 meta/classes/multilib.bbclass |    4 ++--
 meta/lib/oe/classextend.py    |    4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 12a30c9..783b64d 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -183,7 +183,7 @@ def preferred_ml_updates(d):
             providers.append(v)
 
     for pkg, reason in blacklists.items():
-        if pkg.endswith("-native") or pkg.startswith("nativesdk-") or 'cross-canadian' in pkg:
+        if pkg.endswith(("-native", "-crosssdk")) or pkg.startswith("nativesdk-") or 'cross-canadian' in pkg:
             continue
         for p in prefixes:
             newpkg = p + "-" + pkg
@@ -193,7 +193,7 @@ def preferred_ml_updates(d):
     for v in versions:
         val = d.getVar(v, False)
         pkg = v.replace("PREFERRED_VERSION_", "")
-        if pkg.endswith("-native") or pkg.startswith("nativesdk-"):
+        if pkg.endswith(("-native", "-crosssdk")) or pkg.startswith("nativesdk-"):
             continue
         if 'cross-canadian' in pkg:
             for p in prefixes:
@@ -214,7 +214,7 @@ def preferred_ml_updates(d):
     for prov in providers:
         val = d.getVar(prov, False)
         pkg = prov.replace("PREFERRED_PROVIDER_", "")
-        if pkg.endswith("-native") or pkg.startswith("nativesdk-"):
+        if pkg.endswith(("-native", "-crosssdk")) or pkg.startswith("nativesdk-"):
             continue
         if 'cross-canadian' in pkg:
             for p in prefixes:
@@ -253,7 +253,7 @@ def preferred_ml_updates(d):
     mp = (d.getVar("MULTI_PROVIDER_WHITELIST", True) or "").split()
     extramp = []
     for p in mp:
-        if p.endswith("-native") or p.startswith("nativesdk-") or 'cross-canadian' in p:
+        if p.endswith(("-native", "-crosssdk")) or p.startswith("nativesdk-") or 'cross-canadian' in p:
             continue
         virt = ""
         if p.startswith("virtual/"):
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index de6e59e..c249925 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -28,7 +28,7 @@ python multilib_virtclass_handler () {
     if bb.data.inherits_class('native', e.data):
         raise bb.parse.SkipPackage("We can't extend native recipes")
 
-    if bb.data.inherits_class('nativesdk', e.data):
+    if bb.data.inherits_class('nativesdk', e.data) or bb.data.inherits_class('crosssdk', e.data):
         raise bb.parse.SkipPackage("We can't extend nativesdk recipes")
 
     save_var_name=e.data.getVar("MULTILIB_SAVE_VARNAME", True) or ""
@@ -101,7 +101,7 @@ python do_package_qa_multilib() {
         for i in values:
             if i.startswith('virtual/'):
                 i = i[len('virtual/'):]
-            if (not i.startswith('kernel-module')) and (not i.startswith(mlprefix)) and (not 'cross-canadian' in i):
+            if (not i.startswith('kernel-module')) and (not i.startswith(mlprefix)) and (not 'cross-canadian' in i) and (not i.startswith("nativesdk-")):
                 candidates.append(i)
         if len(candidates) > 0:
             bb.warn("Multilib QA Issue: %s package %s - suspicious values '%s' in %s" 
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index c982fb7..c46332c 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -50,7 +50,7 @@ class ClassExtender(object):
         return newdata
 
     def map_depends(self, dep):
-        if dep.endswith(("-native", "-native-runtime")) or ('nativesdk-' in dep) or ('cross-canadian' in dep):
+        if dep.endswith(("-native", "-native-runtime", "-crosssdk")) or ('nativesdk-' in dep) or ('cross-canadian' in dep):
             return dep
         else:
             return self.extend_name(dep)
@@ -93,7 +93,7 @@ class ClassExtender(object):
 
 class NativesdkClassExtender(ClassExtender):
     def map_depends(self, dep):
-        if dep.endswith(("-native", "-native-runtime", "-cross")) or ('nativesdk-' in dep):
+        if dep.endswith(("-native", "-native-runtime", "-cross", "-crosssdk")) or ('nativesdk-' in dep):
             return dep
         elif dep.endswith(("-gcc-intermediate", "-gcc-initial", "-gcc", "-g++")):
             return dep + "-crosssdk"
-- 
1.7.3.4



