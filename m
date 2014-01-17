Return-Path: <jplum@devonit.com>
Received: from mx1.devonhealth.com (unknown [8.20.30.154])
	by mail.openembedded.org (Postfix) with ESMTP id 3E3C96AE73
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 15:45:39 +0000 (UTC)
Received: from emfserver.devonintlgroup.com (10.0.7.48) by mx1.devonhealth.com
	(10.0.20.154) with Microsoft SMTP Server id 8.3.327.1;
	Fri, 17 Jan 2014 10:43:12 -0500
Received: from [10.0.2.7] by emfserver.devonintlgroup.com over TLS secured
	channel with ESMTP (Devon Health Services, Inc Email Firewall SMTP Relay
	(Email Firewall v6.5)); Fri, 17 Jan 2014 10:45:27 -0500
X-Server-Uuid: 6CB55748-6642-4D3C-9211-397BC4E7A815
Received: from whse-mobile.Development.com (10.0.15.115) by
	boddingtons.devonintlgroup.com (10.0.2.15) with Microsoft SMTP Server (
	TLS) id 8.3.327.1; Fri, 17 Jan 2014 10:45:27 -0500
From: Jason Plum <jplum@devonit.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jan 2014 10:45:35 -0500
Message-ID: <1389973536-9479-1-git-send-email-jplum@devonit.com>
X-Mailer: git-send-email 1.8.5.2
MIME-Version: 1.0
X-WSS-ID: 7EC78F9D2B8407077-01-01
Subject: [Patch v2] lib/oe: copyhardlinktree - detect mount points
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
X-List-Received-Date: Fri, 17 Jan 2014 15:45:39 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


    lib/oe: copyhardlinktree - detect mount points
    Add function getmount to detect the mount point of the path, as
    os.stat(path).st_dev in copyhardlinktree fails in lxc containers
    to detect different paths as separate mounted filesystems
    (cp -l failure)

    Signed-off-by: Jason Plum <jplum@devonit.com>

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 1310e38..f1905c3 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -90,7 +90,7 @@ def copyhardlinktree(src, dst):
     if os.path.isdir(src) and not len(os.listdir(src)):
         return

-    if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
+    if (getmount(src) ==  getmount(dst)):
         # Need to copy directories only with tar first since cp will error if tw
         # writers try and create a directory at the same time
         cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p --files-from -
@@ -259,3 +259,12 @@ def realpath(file, root, use_physdir = True, loop_cnt = 100,
         raise

     return file
+
+def getmount(path):
+    """ Returns the mount point of the path, using realpath """
+    path = realpath(path)
+    while path != os.path.sep:
+        if os.path.ismount(path):
+            return path
+        path = os.path.abspath(os.path.join(path, os.pardir))
+    return path


