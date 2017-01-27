Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 01D8A77441
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 17:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0RHgEAa019778; Fri, 27 Jan 2017 17:42:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id emZvRuvmPY8u; Fri, 27 Jan 2017 17:42:14 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0RHg9BX019764
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 27 Jan 2017 17:42:10 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cXAXJ-0001We-OD; Fri, 27 Jan 2017 17:42:09 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 17:42:06 +0000
Message-Id: <1485538927-5797-6-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485538927-5797-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1485538927-5797-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 6/7] staging: Allow removal of stale sysroot objects
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
X-List-Received-Date: Fri, 27 Jan 2017 17:42:17 -0000

The main sysroot components of unreachable build targets will be removed by the core
code. This currently doesn't trigger a removal in the individual workdirs. This
adds in symlinking between the complete stamps and the component sysroot meaning
we can detect when someting was removed and hence remove it from the sysroot.

This fixes cases where DISTRO_FEATURES like systemd are changed amongst other
things and makes builds more robust against configuration changes.

If a dependency is rebuild, that is caught by checksum comparision code elsewhere
in this function as before.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 1b618fb..cc7767a 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -490,6 +490,18 @@ python extend_recipe_sysroot() {
     fixme['native'] = []
     postinsts = []
     multilibs = {}
+    manifests = {}
+
+    for f in os.listdir(depdir):
+        if not f.endswith(".complete"):
+            continue
+        f = depdir + "/" + f
+        if os.path.islink(f) and not os.path.exists(f):
+            bb.note("%s no longer exists, removing from sysroot" % f)
+            lnk = os.readlink(f.replace(".complete", ""))
+            sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
+            os.unlink(f)
+            os.unlink(f.replace(".complete", ""))
 
     for dep in configuredeps:
         c = setscenedeps[dep][0]
@@ -547,6 +559,7 @@ python extend_recipe_sysroot() {
             bb.warn("Manifest %s not found?" % manifest)
         else:
             with open(manifest, "r") as f, open(taskmanifest, 'w') as m:
+                manifests[dep] = manifest
                 for l in f:
                     l = l.strip()
                     if l.endswith("/"):
@@ -573,9 +586,9 @@ python extend_recipe_sysroot() {
     for p in postinsts:
         subprocess.check_output(p, shell=True)
 
-    for dep in configuredeps:
+    for dep in manifests:
         c = setscenedeps[dep][0]
-        open(depdir + "/" + c + ".complete", "w").close()
+        os.symlink(manifests[dep], depdir + "/" + c + ".complete")
 
     bb.utils.unlockfile(lock)
 }
-- 
2.7.4


