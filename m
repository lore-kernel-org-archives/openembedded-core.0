Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F3C9D7546A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Apr 2018 10:43:54 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w37Ahri5011333
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 7 Apr 2018 11:43:54 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1f4lK4-00087i-Vs; Sat, 07 Apr 2018 11:43:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Apr 2018 11:43:49 +0100
Message-Id: <1523097831-31184-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/3] Revert "python3: fix create_manifest to handle pycache folders"
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
X-List-Received-Date: Sat, 07 Apr 2018 10:43:55 -0000

Alejandro asked this be reverted as the patch causes more problems
than it solves.

This reverts commit 5d288d286e0adb221649d896c132a607ecddc490.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3/create_manifest3.py               |  5 +----
 .../python/python3/python3-manifest.json             | 20 +++++++++-----------
 2 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/meta/recipes-devtools/python/python3/create_manifest3.py
index 44f3454..2f944f9 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -189,10 +189,7 @@ for key in old_manifest:
         # Ignore folders, since we don't import those, difficult to handle multilib
         if isFolder(value):
             # Pass folders directly
-            if isCached(value):
-                new_manifest[key]['cached'].append(value)
-            else:
-                new_manifest[key]['files'].append(value)
+            new_manifest[key]['files'].append(value)
         # Ignore binaries, since we don't import those
         if '${bindir}' in value:
             # Pass it directly to the new manifest data structure
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 26fa613..2491f36 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -736,21 +736,21 @@
             "${libdir}/python3.5/__pycache__/poplib.*.pyc",
             "${libdir}/python3.5/__pycache__/smtplib.*.pyc",
             "${libdir}/python3.5/__pycache__/telnetlib.*.pyc",
-            "${libdir}/python3.5/__pycache__/uuid.*.pyc",
-            "${libdir}/python3.5/http/__pycache__",
-            "${libdir}/python3.5/urllib/__pycache__"
+            "${libdir}/python3.5/__pycache__/uuid.*.pyc"
         ],
         "files": [
             "${libdir}/python3.5/base64.py",
             "${libdir}/python3.5/ftplib.py",
             "${libdir}/python3.5/hmac.py",
             "${libdir}/python3.5/http",
+            "${libdir}/python3.5/http/__pycache__",
             "${libdir}/python3.5/mimetypes.py",
             "${libdir}/python3.5/nntplib.py",
             "${libdir}/python3.5/poplib.py",
             "${libdir}/python3.5/smtplib.py",
             "${libdir}/python3.5/telnetlib.py",
             "${libdir}/python3.5/urllib",
+            "${libdir}/python3.5/urllib/__pycache__",
             "${libdir}/python3.5/uuid.py"
         ],
         "rdepends": [
@@ -1091,12 +1091,11 @@
         "summary": "Python typing support"
     },
     "unittest": {
-        "cached": [
-            "${libdir}/python3.5/unittest/__pycache__"
-        ],
+        "cached": [],
         "files": [
             "${libdir}/python3.5/unittest",
-            "${libdir}/python3.5/unittest/"
+            "${libdir}/python3.5/unittest/",
+            "${libdir}/python3.5/unittest/__pycache__"
         ],
         "rdepends": [
             "core",
@@ -1136,11 +1135,10 @@
         "summary": "Python basic XML support"
     },
     "xmlrpc": {
-        "cached": [
-            "${libdir}/python3.5/xmlrpc/__pycache__"
-        ],
+        "cached": [],
         "files": [
-            "${libdir}/python3.5/xmlrpc"
+            "${libdir}/python3.5/xmlrpc",
+            "${libdir}/python3.5/xmlrpc/__pycache__"
         ],
         "rdepends": [
             "core",
-- 
2.7.4


