Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B9FF6776AD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 14:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2EEJkw2002050; Tue, 14 Mar 2017 14:19:46 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ata-NX7Q84YR; Tue, 14 Mar 2017 14:19:46 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2EEJfB9002041
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 14 Mar 2017 14:19:42 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cnnIb-0005QD-Il; Tue, 14 Mar 2017 14:19:41 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 14:19:40 +0000
Message-Id: <1489501180-20799-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489501180-20799-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1489501180-20799-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] package: Fix various rpmdeps relocation issues
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
X-List-Received-Date: Tue, 14 Mar 2017 14:19:49 -0000

There are several issues with rpmdeps after the rpm v5 -> v4 transition:
 * _rpmfc_magic_path  is an invalid option for rpm4
 * --rpmpopt is an invalid option for rpm4
 * we need to use the path to rpmrc since otherwise it poitns at the
   original build path
 * we need to set MAGIC in the environment so libmagic can find its
   files.

This patch addresses those and ensures rpmdeps works in relocated builds
from sstate (or with rm_work).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 5 +++--
 meta/lib/oe/package.py       | 7 +++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 48fef97..871263f 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1433,7 +1433,7 @@ if [ x"$D" = "x" ]; then
 fi
 }
 
-RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/rpmdeps --macros ${STAGING_LIBDIR_NATIVE}/rpm/macros --define '_rpmfc_magic_path ${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc' --rpmpopt ${STAGING_LIBDIR_NATIVE}/rpm/rpmpopt"
+RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/rpmdeps --rcfile ${STAGING_LIBDIR_NATIVE}/rpm/rpmrc  --macros ${STAGING_LIBDIR_NATIVE}/rpm/macros --define '_rpmconfigdir ${STAGING_LIBDIR_NATIVE}/rpm/'"
 
 # Collect perfile run-time dependency metadata
 # Output:
@@ -1450,6 +1450,7 @@ python package_do_filedeps() {
     pkgdest = d.getVar('PKGDEST')
     packages = d.getVar('PACKAGES')
     rpmdeps = d.getVar('RPMDEPS')
+    magic = d.expand("${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc")
 
     def chunks(files, n):
         return [files[i:i+n] for i in range(0, len(files), n)]
@@ -1461,7 +1462,7 @@ python package_do_filedeps() {
         if pkg.endswith('-dbg') or pkg.endswith('-doc') or pkg.find('-locale-') != -1 or pkg.find('-localedata-') != -1 or pkg.find('-gconv-') != -1 or pkg.find('-charmap-') != -1 or pkg.startswith('kernel-module-'):
             continue
         for files in chunks(pkgfiles[pkg], 100):
-            pkglist.append((pkg, files, rpmdeps, pkgdest))
+            pkglist.append((pkg, files, rpmdeps, pkgdest, magic))
 
     processed = oe.utils.multiprocess_exec( pkglist, oe.package.filedeprunner)
 
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 0ca41aa..52c5f16 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -57,7 +57,7 @@ def file_translate(file):
 def filedeprunner(arg):
     import re, subprocess, shlex
 
-    (pkg, pkgfiles, rpmdeps, pkgdest) = arg
+    (pkg, pkgfiles, rpmdeps, pkgdest, magic) = arg
     provides = {}
     requires = {}
 
@@ -90,8 +90,11 @@ def filedeprunner(arg):
 
         return provides, requires
 
+    env = os.environ.copy()
+    env["MAGIC"] = magic
+
     try:
-        dep_popen = subprocess.Popen(shlex.split(rpmdeps) + pkgfiles, stdout=subprocess.PIPE)
+        dep_popen = subprocess.Popen(shlex.split(rpmdeps) + pkgfiles, stdout=subprocess.PIPE, env=env)
         provides, requires = process_deps(dep_popen.stdout, pkg, pkgdest, provides, requires)
     except OSError as e:
         bb.error("rpmdeps: '%s' command failed, '%s'" % (shlex.split(rpmdeps) + pkgfiles, e))
-- 
2.7.4


