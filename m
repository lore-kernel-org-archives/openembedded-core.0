Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UKAjN-0005rB-T8
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 17:59:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2PGflZ1025072
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 09:41:47 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 25 Mar 2013 09:41:46 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Mar 2013 12:19:53 -0500
Message-ID: <1364231993-31670-3-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1364231993-31670-1-git-send-email-mark.hatle@windriver.com>
References: <1364231993-31670-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/2 RFC] package.bbclass: Trigger a bb.error if split/strip fails
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Mar 2013 16:59:05 -0000
Content-Type: text/plain

[ YOCTO #4089 ]

If debugedit, objcopy calls fail, capture the error and return a
failure to the user.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package.bbclass | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 0702c92..3752bdc 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -254,14 +254,26 @@ def splitdebuginfo(file, debugfile, debugsrcdir, d):
 
     # We need to extract the debug src information here...
     if debugsrcdir:
-        subprocess.call("'%s' -b '%s' -d '%s' -i -l '%s' '%s'" % (debugedit, workparentdir, debugsrcdir, sourcefile, file), shell=True)
+        cmd = "'%s' -b '%s' -d '%s' -i -l '%s' '%s'" % (debugedit, workparentdir, debugsrcdir, sourcefile, file)
+        ret = subprocess.call(cmd, shell=True)
+        if ret != 0:
+            bb.error("debugedit failed: %s - %d" % (cmd, ret))
+            return ret
 
     bb.utils.mkdirhier(os.path.dirname(debugfile))
 
-    subprocess.call("'%s' --only-keep-debug '%s' '%s'" % (objcopy, file, debugfile), shell=True)
+    cmd = "'%s' --only-keep-debug '%s' '%s'" % (objcopy, file, debugfile)
+    ret = subprocess.call(cmd, shell=True)
+    if ret != 0:
+        bb.error("debugedit failed: %s - %d" % (cmd, ret))
+        return ret
 
     # Set the debuglink to have the view of the file path on the target
-    subprocess.call("'%s' --add-gnu-debuglink='%s' '%s'" % (objcopy, debugfile, file), shell=True)
+    cmd = "'%s' --add-gnu-debuglink='%s' '%s'" % (objcopy, debugfile, file)
+    ret = subprocess.call(cmd, shell=True)
+    if ret != 0:
+        bb.error("debugedit failed: %s - %d" % (cmd, ret))
+        return ret
 
     if newmode:
         os.chmod(file, origmode)
@@ -806,7 +818,9 @@ python split_and_strip_files () {
             bb.utils.mkdirhier(os.path.dirname(fpath))
             #bb.note("Split %s -> %s" % (file, fpath))
             # Only store off the hard link reference if we successfully split!
-            splitdebuginfo(file, fpath, debugsrcdir, d)
+            ret = splitdebuginfo(file, fpath, debugsrcdir, d)
+            if ret != 0:
+                return ret
 
         # Hardlink our debug symbols to the other hardlink copies
         for file in hardlinks:
@@ -878,6 +892,8 @@ python split_and_strip_files () {
     #
     # End of strip
     #
+
+    return 0
 }
 
 python populate_packages () {
-- 
1.8.1.2.545.g2f19ada



