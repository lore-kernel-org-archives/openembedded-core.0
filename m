Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE8B1772BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 02:43:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAD2hAmB012245
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 18:43:10 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 12 Nov 2015 18:43:09 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Nov 2015 10:32:47 +0800
Message-ID: <34b5e01814824faf1ed39a94229a4a3da6462d54.1447379573.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1447379573.git.kai.kang@windriver.com>
References: <cover.1447379573.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] classextend.py: update filter to support multiple multilib items
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Nov 2015 02:43:11 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

If it is set with two or more mutliblib items, such as:

MULTILIBS = "multilib:lib32 multilib:lib64"

it expands some virtual providers wrongly:

| ERROR: Nothing PROVIDES 'virtual/lib32-lib64-libc'.

Update the filter that do not extend variables which already have
one of mulitlib prefixes.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/lib/oe/classextend.py | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index 5107ecd..6a6affb 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -15,10 +15,10 @@ class ClassExtender(object):
             name = name.replace("-" + self.extname, "")
         if name.startswith("virtual/"):
             subs = name.split("/", 1)[1]
-            if not subs.startswith(self.extname):
+            if not self.check_prefix(subs):
                 return "virtual/" + self.extname + "-" + subs
             return name
-        if not name.startswith(self.extname):
+        if not self.check_prefix(name):
             return self.extname + "-" + name
         return name
 
@@ -57,13 +57,6 @@ class ClassExtender(object):
         if dep.endswith(("-native", "-native-runtime")) or ('nativesdk-' in dep) or ('cross-canadian' in dep) or ('-crosssdk-' in dep):
             return dep
         else:
-            # Do not extend for that already have multilib prefix
-            var = self.d.getVar("MULTILIB_VARIANTS", True)
-            if var:
-                var = var.split()
-                for v in var:
-                    if dep.startswith(v):
-                        return dep
             return self.extend_name(dep)
 
     def map_depends_variable(self, varname, suffix = ""):
@@ -108,6 +101,16 @@ class ClassExtender(object):
             for subs in variables:
                 self.d.renameVar("%s_%s" % (subs, pkg_mapping[0]), "%s_%s" % (subs, pkg_mapping[1]))
 
+    def check_prefix(self, name):
+        ml_prefixes = (self.d.getVar("MULTILIB_VARIANTS", True) or "").split()
+        if self.extname in ml_prefixes:
+            for var in ml_prefixes:
+                if name.startswith(var):
+                    return True
+            return False
+        else:
+            return name.startswith(self.extname)
+
 class NativesdkClassExtender(ClassExtender):
     def map_depends(self, dep):
         if dep.startswith(self.extname):
-- 
2.6.1


