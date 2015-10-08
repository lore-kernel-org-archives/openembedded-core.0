Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E3AB460232
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 13:16:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t98DH0E8020862
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Oct 2015 06:17:00 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 8 Oct 2015 06:17:00 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Oct 2015 06:16:53 -0700
Message-ID: <e24694ec19142b36f5e455f67f9e6ac4cf4bb42a.1444310101.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1444310101.git.liezhi.yang@windriver.com>
References: <cover.1444310101.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] insane.bbclass: make package_qa_walk() can print all the messages
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
X-List-Received-Date: Thu, 08 Oct 2015 13:17:00 -0000
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
index 61db3e1..e3a8cd7 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -749,8 +749,15 @@ def package_qa_check_staged(path,d):
 
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
@@ -766,9 +773,17 @@ def package_qa_walk(path, warnfuncs, errorfuncs, skip, package, d):
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
@@ -1094,8 +1109,7 @@ python do_package_qa () {
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


