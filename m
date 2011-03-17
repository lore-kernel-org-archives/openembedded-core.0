Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q0Fwf-000264-Mr
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 17:21:05 +0100
Received: by gxk3 with SMTP id 3so458811gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=IewdjPQcC2HOpV/lSex3bE9GbnA2Brj7p5DetHYeEHY=;
	b=nYa6PEcj97gpaBlupdNKkP/yWiQZKbZpJ9RdmsUWfz7hgE0MIlW2iRYOFMwUEK3VEy
	ACwY+Ir/MYjQ0I7Dm9OmVfQFS8Wi1hUyu2TddQgfkGJR60ez+GtBePROSnIqt2KFlAP9
	VqtNvVEwCUxaNRKjTCCOpKfDfvpCwvR21vj74=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=r42UB8Cd+zRuAY8KrVHwASh2gBuc7v9PYVYoWyHhtoo8+G7Uf9ZNfFz532gjXLfMwT
	v/p2M48EU8oSwhDKp8OAuRC4Er/wfRmfgg5Up14h6HrRYyQcsij8PQDekAS03/W6pseV
	35YoQuA7MX2Ev16nKIT7+PYJ5J0iNb4b8AHwQ=
Received: by 10.90.200.17 with SMTP id x17mr1612agf.206.1300378759704;
	Thu, 17 Mar 2011 09:19:19 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id u79sm1277609yhn.5.2011.03.17.09.19.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 09:19:19 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2011 09:19:01 -0700
Message-Id: <453417063679cb59c426f1d9191719c9445883e3.1300378596.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 03/12] oe.path: sync up with current OE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Mar 2011 16:21:05 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/lib/oe/path.py |   21 ++++++++++++++-------
 1 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 08ddbf2..8eaa3c5 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -1,9 +1,12 @@
+import bb
+import errno
+import glob
+import os
 import shutil
 import subprocess
 
 def join(*paths):
     """Like os.path.join but doesn't treat absolute RHS specially"""
-    import os.path
     return os.path.normpath("/".join(paths))
 
 def relative(src, dest):
@@ -18,7 +21,6 @@ def relative(src, dest):
     >>> relative("/tmp", "/tmp/foo/bar")
     foo/bar
     """
-    import os.path
 
     if hasattr(os.path, "relpath"):
         return os.path.relpath(dest, src)
@@ -57,21 +59,19 @@ def copytree(src, dst):
     check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
 
-def remove(path):
+def remove(path, recurse=True):
     """Equivalent to rm -f or rm -rf"""
-    import os, errno, shutil, glob
     for name in glob.glob(path):
         try:
             os.unlink(name)
         except OSError, exc:
-            if exc.errno == errno.EISDIR:
-                shutil.rmtree(path)
+            if recurse and exc.errno == errno.EISDIR:
+                shutil.rmtree(name)
             elif exc.errno != errno.ENOENT:
                 raise
 
 def symlink(source, destination, force=False):
     """Create a symbolic link"""
-    import os, errno
     try:
         if force:
             remove(destination)
@@ -121,3 +121,10 @@ def check_output(*popenargs, **kwargs):
         raise CalledProcessError(retcode, cmd, output=output)
     return output
 
+def find(dir, **walkoptions):
+    """ Given a directory, recurses into that directory,
+    returning all files as absolute paths. """
+
+    for root, dirs, files in os.walk(dir, **walkoptions):
+        for file in files:
+            yield os.path.join(root, file)
-- 
1.7.2.3



