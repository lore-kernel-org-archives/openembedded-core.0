Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C460E607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 15:17:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6BFHfIT026276
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 08:17:41 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Jul 2016 08:17:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jul 2016 08:17:35 -0700
Message-ID: <42ee3f8f988695651b60263947805187c482a186.1468249600.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1468249600.git.liezhi.yang@windriver.com>
References: <cover.1468249600.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] packagefeed-stability.bbclass: minor fixes
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
X-List-Received-Date: Mon, 11 Jul 2016 15:17:42 -0000
Content-Type: text/plain

* fix for python3
  iteritems() -> items()

* Return immediately for native and cross.
* Remove the usage of __BBDELTASKS, there is no such var in bitbake.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/packagefeed-stability.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/packagefeed-stability.bbclass b/meta/classes/packagefeed-stability.bbclass
index b5207d9..808a18f 100644
--- a/meta/classes/packagefeed-stability.bbclass
+++ b/meta/classes/packagefeed-stability.bbclass
@@ -25,6 +25,8 @@
 # package files so they will definitely be copied the next time.
 
 python() {
+    if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d):
+        return
     # Package backend agnostic intercept
     # This assumes that the package_write task is called package_write_<pkgtype>
     # and that the directory in which packages should be written is
@@ -49,7 +51,7 @@ python() {
 
             d.appendVarFlag('do_build', 'recrdeptask', ' ' + pkgcomparefunc)
 
-            if d.getVarFlag(pkgwritefunc, 'noexec', True) or (not d.getVarFlag(pkgwritefunc, 'task', True)) or pkgwritefunc in (d.getVar('__BBDELTASKS', True) or []):
+            if d.getVarFlag(pkgwritefunc, 'noexec', True) or not d.getVarFlag(pkgwritefunc, 'task', True):
                 # Packaging is disabled for this recipe, we shouldn't do anything
                 continue
 
@@ -118,7 +120,7 @@ def package_compare_impl(pkgtype, d):
     # Prepare a list of the runtime package names for packages that were
     # actually produced
     rpkglist = []
-    for pkg, rpkg in rpkgnames.iteritems():
+    for pkg, rpkg in rpkgnames.items():
         if os.path.exists(os.path.join(pkgdatadir, 'runtime', pkg + '.packaged')):
             rpkglist.append((rpkg, pkg))
     rpkglist.sort(key=lambda x: len(x[0]), reverse=True)
@@ -187,7 +189,7 @@ def package_compare_impl(pkgtype, d):
             if not rdeps:
                 continue
             rdepvers = bb.utils.explode_dep_versions2(rdeps)
-            for rdep, versions in rdepvers.iteritems():
+            for rdep, versions in rdepvers.items():
                 dep = rpkgdict.get(rdep, None)
                 for version in versions:
                     if version and version.startswith('= '):
-- 
2.9.0


