Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4CB616B0EC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2013 23:13:06 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id c13so2081368eek.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2013 16:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Yj+2S48RWqmbwT2H+EXHrkmhO7Q+CRPsMFePZL+JYgg=;
	b=kQdpAQniBbG1mlJ4CWnyeIp3A7Rtc55A30SV8Mwyu+B+LV+No0JTt4ydAMqgH2Fc3l
	P5Kx34SvVJN2DSjgAVEaSFXgrDSP4u9G+5jGLNQGuqef3FVaScDgebql4bKBSV5Vn/pd
	sJ8VRdhyoFQZszEBePbN9jLNmdFY1rnxnYdI2HbdV4aMr+SEj7hbuZkFsejLD/TXKk8c
	tatggKsUeWf0bVN4iOaZW+CBDYfUGLUhzvjE+cHXxAV9hq+sY4KHw7mqwzv6p6/Vv4B5
	ubfmG8GyPhdxVMaoFa54oB9Wqw+CJ2jqNiTUdEJrH/tICUBTk/6/4MBsdh79xu4txA2I
	6G5Q==
X-Received: by 10.15.111.135 with SMTP id cj7mr18348224eeb.144.1373152386768; 
	Sat, 06 Jul 2013 16:13:06 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	o5sm27834275eef.5.2013.07.06.16.13.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 16:13:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Jul 2013 01:13:07 +0200
Message-Id: <1373152387-19393-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1373152387-19393-1-git-send-email-Martin.Jansa@gmail.com>
References: <1373152387-19393-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [RFC][PATCH 4/4] WIP: package.bbclass: add some pseudo-code to filter shlibs providers based on dependencies
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
X-List-Received-Date: Sat, 06 Jul 2013 23:13:06 -0000

* when library/binary in package foo created by recipe foo.bb is linked
  with library libabc.so provided by package libabc created by recipe libabc.bb
  doesn't record foo -> libabc dependency if recipe foo doesn't depend
  on libabc
* this should prevent non-deterministic shlibs providers when libabc
  metadata are changed or libabc doesn't exist anymore and foo package
  in sstate-cache still has libabc dependency. foo isn't rebuilt
  because it doesn't depend on libabc so stamps are still valid

[YOCTO #4628]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package.bbclass | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 3713fd3..72d5f43 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1354,6 +1354,25 @@ python package_do_shlibs() {
     # Take shared lock since we're only reading, not writing
     lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"))
 
+    # WIP: this is more like pseudo-code of what I would like to do if possible
+    # Should return list of packages created by recipes which have their do_package task
+    # in dependency_tree of pn.do_package
+    def get_packages_from_dependency_tree(pn):
+        deps = get_recipes_dependent_on_from_task(pn, "do_package", "do_package")
+        return get_package_list(deps)
+
+    # WIP: this is more like pseudo-code of what I would like to do if possible
+    # Walks dependency tree of pn.task and returns list of pn acumulated from pn.task_dep found there
+    def get_dependency_tree(pn, task, task_dep):
+        # this doesn't include transitive dependencies or check for 'task' name
+        deps = d.getVar('DEPENDS', True)
+        return deps
+
+    # WIP: this is more like pseudo-code of what I would like to do if possible
+    # Reads pkgdata and return list of packages created by pn
+    def get_package_list(pn_list):
+        return pn_list
+        
     def read_shlib_providers:
         list_re = re.compile('^(.*)\.list$')
         # Go from least to most specific since the last one found wins
@@ -1547,6 +1566,8 @@ python package_do_shlibs() {
         bb.debug(2, "calculating shlib requirements for %s" % pkg)
 
         deps = list()
+        pn = d.getVar('PN', True)
+        allowed_deps = get_packages_from_dependency_tree(pn)
         for n in needed[pkg]:
             if n in shlib_provider.keys():
                 (dep_pkg, ver_needed) = shlib_provider[n]
@@ -1556,6 +1577,10 @@ python package_do_shlibs() {
                 if dep_pkg == pkg:
                     continue
 
+                if dep_pkg not in allowed_deps:
+                    bb.warn("Skipping dependency on %s - shared library provider for %s, because %s doesn't have any dependency on it" % (dep_pkg, n, pn))
+                    continue
+
                 if ver_needed:
                     dep = "%s (>= %s)" % (dep_pkg, ver_needed)
                 else:
-- 
1.8.2.1


