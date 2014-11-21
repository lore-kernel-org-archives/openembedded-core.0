Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 476807214D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 08:01:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAL814BC027620
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 21 Nov 2014 00:01:04 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 21 Nov 2014 00:01:03 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Fri, 21 Nov 2014 16:00:55 +0800
Message-ID: <afc25903282dbc635ec985a4421cd3f9cec44983.1416556713.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1416556713.git.hongxu.jia@windriver.com>
References: <cover.1416556713.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] package_manager.py: check the result of create_index
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
X-List-Received-Date: Fri, 21 Nov 2014 08:01:11 -0000
Content-Type: text/plain

While invoking create_index failed, there was no error output
and didn't break the build until the package installation.
...
|ERROR: run-postinsts not found in the base feeds (qemux86 i586 x86
noarch any all).
...

The reason is we used multiprocessing to execute create_index, and
did not check its invoking result.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/package_manager.py | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index e18e071..3c1e74f 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -16,11 +16,14 @@ def create_index(arg):
 
     try:
         bb.note("Executing '%s' ..." % index_cmd)
-        subprocess.check_output(index_cmd, stderr=subprocess.STDOUT, shell=True)
+        result = subprocess.check_output(index_cmd, stderr=subprocess.STDOUT, shell=True)
     except subprocess.CalledProcessError as e:
         return("Index creation command '%s' failed with return code %d:\n%s" %
                (e.cmd, e.returncode, e.output))
 
+    if result:
+        bb.note(result)
+
     return None
 
 
@@ -120,7 +123,10 @@ class RpmIndexer(Indexer):
             bb.note("There are no packages in %s" % self.deploy_dir)
             return
 
-        oe.utils.multiprocess_exec(index_cmds, create_index)
+        result = oe.utils.multiprocess_exec(index_cmds, create_index)
+        if result:
+            bb.fatal('%s' % ('\n'.join(result)))
+
 
 class OpkgIndexer(Indexer):
     def write_index(self):
@@ -156,7 +162,10 @@ class OpkgIndexer(Indexer):
             bb.note("There are no packages in %s!" % self.deploy_dir)
             return
 
-        oe.utils.multiprocess_exec(index_cmds, create_index)
+        result = oe.utils.multiprocess_exec(index_cmds, create_index)
+        if result:
+            bb.fatal('%s' % ('\n'.join(result)))
+
 
 
 class DpkgIndexer(Indexer):
@@ -200,7 +209,10 @@ class DpkgIndexer(Indexer):
             bb.note("There are no packages in %s" % self.deploy_dir)
             return
 
-        oe.utils.multiprocess_exec(index_cmds, create_index)
+        result = oe.utils.multiprocess_exec(index_cmds, create_index)
+        if result:
+            bb.fatal('%s' % ('\n'.join(result)))
+
 
 
 class PkgsList(object):
-- 
1.9.1


