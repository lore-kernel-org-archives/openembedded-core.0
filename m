Return-Path: <vz@mleia.com>
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	by mail.openembedded.org (Postfix) with ESMTP id E5B0F731D2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Aug 2016 01:52:31 +0000 (UTC)
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 565EA432894;
	Sat,  6 Aug 2016 02:43:31 +0100 (BST)
From: Vladimir Zapolskiy <vz@mleia.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Aug 2016 04:43:28 +0300
Message-Id: <1470447809-12186-2-git-send-email-vz@mleia.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1470447809-12186-1-git-send-email-vz@mleia.com>
References: <1470447809-12186-1-git-send-email-vz@mleia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20160806_024331_375837_974F0245 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message. 
Subject: [PATCH 1/2] chrpath: correct subprocess.Popen.communicate() return values
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
X-List-Received-Date: Sat, 06 Aug 2016 01:52:33 -0000

This is a non-functional change, which intends to correct element
names of a tuple returned by Popen.communicate().

Both in python2 and python3 subprocess.Popen.communicate() method
returns a tuple (stdoutdata, stderrdata), thus old assignments and
collateral comments are incorrect from human's point of view, however
formally there is no error in the code.

The change is desired to have to avoid copy-paste errors in future.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 meta/classes/chrpath.bbclass | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index cdd7f27..72e8a12 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -5,17 +5,17 @@ def process_file_linux(cmd, fpath, rootdir, baseprefix, tmpdir, d):
     import subprocess as sub
 
     p = sub.Popen([cmd, '-l', fpath],stdout=sub.PIPE,stderr=sub.PIPE)
-    err, out = p.communicate()
-    # If returned successfully, process stderr for results
+    out, err = p.communicate()
+    # If returned successfully, process stdout for results
     if p.returncode != 0:
         return
 
-    err = err.decode('utf-8')
+    out = out.decode('utf-8')
 
     # Handle RUNPATH as well as RPATH
-    err = err.replace("RUNPATH=","RPATH=")
+    out = out.replace("RUNPATH=","RPATH=")
     # Throw away everything other than the rpath list
-    curr_rpath = err.partition("RPATH=")[2]
+    curr_rpath = out.partition("RPATH=")[2]
     #bb.note("Current rpath for %s is %s" % (fpath, curr_rpath.strip()))
     rpaths = curr_rpath.split(":")
     new_rpaths = []
@@ -46,11 +46,11 @@ def process_file_darwin(cmd, fpath, rootdir, baseprefix, tmpdir, d):
     import subprocess as sub
 
     p = sub.Popen([d.expand("${HOST_PREFIX}otool"), '-L', fpath],stdout=sub.PIPE,stderr=sub.PIPE)
-    err, out = p.communicate()
-    # If returned successfully, process stderr for results
+    out, err = p.communicate()
+    # If returned successfully, process stdout for results
     if p.returncode != 0:
         return
-    for l in err.split("\n"):
+    for l in out.split("\n"):
         if "(compatibility" not in l:
             continue
         rpath = l.partition("(compatibility")[0].strip()
@@ -59,7 +59,7 @@ def process_file_darwin(cmd, fpath, rootdir, baseprefix, tmpdir, d):
 
         newpath = "@loader_path/" + os.path.relpath(rpath, os.path.dirname(fpath.replace(rootdir, "/")))
         p = sub.Popen([d.expand("${HOST_PREFIX}install_name_tool"), '-change', rpath, newpath, fpath],stdout=sub.PIPE,stderr=sub.PIPE)
-        err, out = p.communicate()
+        out, err = p.communicate()
 
 def process_dir (rootdir, directory, d):
     import stat
-- 
2.8.1


