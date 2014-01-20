Return-Path: <jplum@devonit.com>
Received: from mx1.devonhealth.com (unknown [8.20.30.154])
	by mail.openembedded.org (Postfix) with ESMTP id EAB586B678
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 19:23:09 +0000 (UTC)
Received: from emfserver.devonintlgroup.com (10.0.7.48) by mx1.devonhealth.com
	(10.0.20.154) with Microsoft SMTP Server id 8.3.327.1;
	Mon, 20 Jan 2014 14:23:05 -0500
Received: from [10.0.2.7] by emfserver.devonintlgroup.com over TLS secured
	channel with ESMTP (Devon Health Services, Inc Email Firewall SMTP Relay
	(Email Firewall v6.5)); Mon, 20 Jan 2014 14:23:04 -0500
X-Server-Uuid: 6CB55748-6642-4D3C-9211-397BC4E7A815
Received: from whse-beast.Development.com (10.0.15.96) by
	boddingtons.devonintlgroup.com (10.0.2.15) with Microsoft SMTP Server (
	TLS) id 8.3.327.1; Mon, 20 Jan 2014 14:23:03 -0500
From: Jason Plum <jplum@devonit.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jan 2014 14:22:58 -0500
Message-ID: <1390245778-9252-1-git-send-email-jplum@devonit.com>
X-Mailer: git-send-email 1.8.5.3
MIME-Version: 1.0
X-WSS-ID: 7EC3A8122B8410941-01-01
Subject: [PATCH v3] meta/oe/lib/path.py - check mount points, not device
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
X-List-Received-Date: Mon, 20 Jan 2014 19:23:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Signed-off-by: Jason Plum <jplum@devonit.com>
---
 meta/lib/oe/path.py | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 46783f8..dab20fc 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -90,7 +90,7 @@ def copyhardlinktree(src, dst):
     if os.path.isdir(src) and not len(os.listdir(src)):
         return	
 
-    if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
+    if (getmount(src) ==  getmount(dst)):
         # Need to copy directories only with tar first since cp will error if two 
         # writers try and create a directory at the same time
         cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p --files-from - --no-recursion | tar -xf - -C %s' % (src, src, dst)
@@ -257,3 +257,14 @@ def realpath(file, root, use_physdir = True, loop_cnt = 100, assume_dir = False)
         raise
 
     return file
+
+def getmount(path):
+    """ getmount takes a path parameter, uses os.path.realpath with os.path.abspath to
+    handle symlink resolution, and returns the path to the mount point of the input path
+    """
+    path = os.path.realpath(os.path.abspath(path))
+    while path != os.path.sep:
+        if os.path.ismount(path):
+            return path
+        path = os.path.abspath(os.path.join(path, os.pardir))
+    return path
\ No newline at end of file
-- 
1.8.5.3



