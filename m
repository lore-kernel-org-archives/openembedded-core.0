Return-Path: <vz@mleia.com>
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	by mail.openembedded.org (Postfix) with ESMTP id E6AA977156
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Aug 2016 01:52:31 +0000 (UTC)
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 9AFD5433EC5;
	Sat,  6 Aug 2016 02:43:31 +0100 (BST)
From: Vladimir Zapolskiy <vz@mleia.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Aug 2016 04:43:29 +0300
Message-Id: <1470447809-12186-3-git-send-email-vz@mleia.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1470447809-12186-1-git-send-email-vz@mleia.com>
References: <1470447809-12186-1-git-send-email-vz@mleia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20160806_024331_657550_79A8DF6B 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message. 
Subject: [PATCH 2/2] package: correct subprocess.Popen.communicate() return values
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
 meta/classes/package.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d6204cf..c592ce1 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1557,19 +1557,19 @@ python package_do_shlibs() {
         if file.endswith('.dylib') or file.endswith('.so'):
             rpath = []
             p = sub.Popen([d.expand("${HOST_PREFIX}otool"), '-l', file],stdout=sub.PIPE,stderr=sub.PIPE)
-            err, out = p.communicate()
-            # If returned successfully, process stderr for results
+            out, err = p.communicate()
+            # If returned successfully, process stdout for results
             if p.returncode == 0:
-                for l in err.split("\n"):
+                for l in out.split("\n"):
                     l = l.strip()
                     if l.startswith('path '):
                         rpath.append(l.split()[1])
 
         p = sub.Popen([d.expand("${HOST_PREFIX}otool"), '-L', file],stdout=sub.PIPE,stderr=sub.PIPE)
-        err, out = p.communicate()
-        # If returned successfully, process stderr for results
+        out, err = p.communicate()
+        # If returned successfully, process stdout for results
         if p.returncode == 0:
-            for l in err.split("\n"):
+            for l in out.split("\n"):
                 l = l.strip()
                 if not l or l.endswith(":"):
                     continue
-- 
2.8.1


