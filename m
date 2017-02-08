Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E5EB871DA3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 23:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v18NYaNW000364; Wed, 8 Feb 2017 23:34:37 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AXnbuTh4X31h; Wed,  8 Feb 2017 23:34:37 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v18NYYEE000343
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Feb 2017 23:34:35 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cbbkw-0006QQ-FV; Wed, 08 Feb 2017 23:34:34 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 23:34:26 +0000
Message-Id: <1486596869-24628-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486596869-24628-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1486596869-24628-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/7] lib/oe/path: Add replace_absolute_symlinks function
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
X-List-Received-Date: Wed, 08 Feb 2017 23:34:39 -0000

We need a function to walk a directory and replace absolute symlinks with
relative ones. Add such a function to the path module of lib/oe.

It does this relative to the directory being walked for files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/path.py | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index d468540..a2a50c5 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -50,6 +50,27 @@ def make_relative_symlink(path):
     os.remove(path)
     os.symlink(base, path)
 
+def replace_absolute_symlinks(basedir, d):
+    """
+    Walk basedir looking for absolute symlinks and replacing them with relative ones.
+    The absolute links are assumed to be relative to basedir
+    (compared to make_relative_symlink above which tries to compute common ancestors
+    using pattern matching instead)
+    """
+    for walkroot, dirs, files in os.walk(basedir):
+        for file in files + dirs:
+            path = os.path.join(walkroot, file)
+            if not os.path.islink(path):
+                continue
+            link = os.readlink(path)
+            if not os.path.isabs(link):
+                continue
+            walkdir = os.path.dirname(path.rpartition(basedir)[2])
+            base = os.path.relpath(link, walkdir)
+            bb.debug(2, "Replacing absolute path %s with relative path %s" % (link, base))
+            os.remove(path)
+            os.symlink(base, path)
+
 def format_display(path, metadata):
     """ Prepare a path for display to the user. """
     rel = relative(metadata.getVar("TOPDIR"), path)
-- 
2.7.4


