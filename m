Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0B8F27730D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 12:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZeIQ006852; Wed, 1 Jun 2016 13:35:54 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pkbEQ4PexKV0; Wed,  1 Jun 2016 13:35:54 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZpeo006874
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Jun 2016 13:35:52 +0100
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1b85NH-0000kQ-8k; Wed, 01 Jun 2016 13:35:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2016 13:35:24 +0100
Message-Id: <1464784540-2786-6-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 06/22] classes/lib: Update xrange -> range for python3
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
X-List-Received-Date: Wed, 01 Jun 2016 12:35:56 -0000

xrange() no longer exists in python 3, use range()

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass                | 2 +-
 meta/lib/oe/recipeutils.py                  | 4 ++--
 meta/recipes-core/meta/uninative-tarball.bb | 2 +-
 meta/recipes-rt/rt-tests/files/rt_bmark.py  | 2 +-
 scripts/lib/devtool/standard.py             | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index a0f82be..30f2b50 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -187,7 +187,7 @@ def sysroot_checkhashes(covered, tasknames, fnids, fns, d, invalidtasks = None):
     problems = set()
     configurefnids = set()
     if not invalidtasks:
-        invalidtasks = xrange(len(tasknames))
+        invalidtasks = range(len(tasknames))
     for task in invalidtasks:
         if tasknames[task] == "do_configure" and task not in covered:
             configurefnids.add(fnids[task])
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 146fe83..632184f 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -568,14 +568,14 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
                     raise Exception('Invalid extralines value passed')
 
     def popline(varname):
-        for i in xrange(0, len(bbappendlines)):
+        for i in range(0, len(bbappendlines)):
             if bbappendlines[i][0] == varname:
                 line = bbappendlines.pop(i)
                 return line
         return None
 
     def appendline(varname, op, value):
-        for i in xrange(0, len(bbappendlines)):
+        for i in range(0, len(bbappendlines)):
             item = bbappendlines[i]
             if item[0] == varname:
                 bbappendlines[i] = (item[0], item[1], item[2] + ' ' + value)
diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index a983e42..fb147a1 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -50,7 +50,7 @@ fakeroot tar_sdk() {
 	DEST="./${SDK_ARCH}-${SDK_OS}"
 	mv sysroots/${SDK_SYS} $DEST
 	rm sysroots -rf
-	patchelf --set-interpreter ${@''.join('a' for n in xrange(1024))} $DEST/usr/bin/patchelf
+	patchelf --set-interpreter ${@''.join('a' for n in range(1024))} $DEST/usr/bin/patchelf
 	mv $DEST/usr/bin/patchelf $DEST/usr/bin/patchelf-uninative
 	tar ${SDKTAROPTS} -c -j --file=${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
 }
diff --git a/meta/recipes-rt/rt-tests/files/rt_bmark.py b/meta/recipes-rt/rt-tests/files/rt_bmark.py
index e2280e4..0e2b105 100755
--- a/meta/recipes-rt/rt-tests/files/rt_bmark.py
+++ b/meta/recipes-rt/rt-tests/files/rt_bmark.py
@@ -324,7 +324,7 @@ def run_cyclictest_suite():
         t = time.time()
         max_list = []
 
-        for i in xrange(0, suite_size):
+        for i in range(0, suite_size):
                 tmp_min, tmp_avg, tmp_max = run_cyclictest_once()
 
                 msg = "%2d/%2d:" % (i+1, suite_size)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 18847cf..d6186b9 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -837,7 +837,7 @@ def _get_patchset_revs(args, srctree, recipe_path):
         stdout, _ = bb.process.run('git rev-list --reverse %s..HEAD' %
                                    initial_rev, cwd=srctree)
         newcommits = stdout.split()
-        for i in xrange(min(len(commits), len(newcommits))):
+        for i in range(min(len(commits), len(newcommits))):
             if newcommits[i] == commits[i]:
                 update_rev = commits[i]
 
@@ -863,7 +863,7 @@ def _remove_file_entries(srcuri, filelist):
     entries = []
     for fname in filelist:
         basename = os.path.basename(fname)
-        for i in xrange(len(srcuri)):
+        for i in range(len(srcuri)):
             if (srcuri[i].startswith('file://') and
                     os.path.basename(srcuri[i].split(';')[0]) == basename):
                 entries.append(srcuri[i])
-- 
2.5.0


