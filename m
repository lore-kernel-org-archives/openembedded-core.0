Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DF66E731AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 02:15:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0F2Flxh028156
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 18:15:47 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 14 Jan 2016 18:15:47 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jan 2016 18:15:46 -0800
Message-ID: <542ae24027e42b3a3c037341ecdc99eb77e412d8.1452824092.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452824092.git.liezhi.yang@windriver.com>
References: <cover.1452824092.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] insane.bbclass: make package_qa_walk() can print all the messages
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
X-List-Received-Date: Fri, 15 Jan 2016 02:15:48 -0000
Content-Type: text/plain

* If more than one files have the same QA issue, package_qa_walk() can
  only print the last one, others are overrided, for example:
  messages["host-user-contaminated"] = "foo1"
  messages["host-user-contaminated"] = "foo2"
  Only foo2 will be printed, this patch fixes the issue.

* Remove unused parameter "path" from package_qa_walk()
  The path is a useless parameter in package_qa_walk() since it has been
  redined inside.

[YOCTO #8436]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass |   20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index bf6a598..bb58f79 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -753,8 +753,15 @@ def package_qa_check_staged(path,d):
 
     return sane
 
+# Merge src dict's content into dest
+def package_qa_merge_dict(dest, src):
+    if len(dest) == len(src) and dest != src:
+        for w in src:
+            if dest[w] != src[w]:
+                dest[w] = src[w] + '\n' + dest[w]
+
 # Walk over all files in a directory and call func
-def package_qa_walk(path, warnfuncs, errorfuncs, skip, package, d):
+def package_qa_walk(warnfuncs, errorfuncs, skip, package, d):
     import oe.qa
 
     #if this will throw an exception, then fix the dict above
@@ -770,9 +777,17 @@ def package_qa_walk(path, warnfuncs, errorfuncs, skip, package, d):
             except:
                 elf = None
             for func in warnfuncs:
+                warnings_orig = warnings.copy()
                 func(path, package, d, elf, warnings)
+                # warnings[foo] = "foo1" might be overrided by
+                # warnings [foo] = "foo2", check and merge.
+                package_qa_merge_dict(warnings, warnings_orig)
             for func in errorfuncs:
+                errors_orig = errors.copy()
                 func(path, package, d, elf, errors)
+                # errors[foo] = "foo1" might be overrided by
+                # errors [foo] = "foo2", check and merge.
+                package_qa_merge_dict(errors, errors_orig)
 
     for w in warnings:
         package_qa_handle_error(w, warnings[w], d)
@@ -1098,8 +1113,7 @@ python do_package_qa () {
             package_qa_handle_error("pkgname",
                     "%s doesn't match the [a-z0-9.+-]+ regex" % package, d)
 
-        path = "%s/%s" % (pkgdest, package)
-        if not package_qa_walk(path, warnchecks, errorchecks, skip, package, d):
+        if not package_qa_walk(warnchecks, errorchecks, skip, package, d):
             walk_sane  = False
         if not package_qa_check_rdepends(package, pkgdest, skip, taskdeps, packages, d):
             rdepends_sane = False
-- 
1.7.9.5


