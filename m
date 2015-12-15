Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CF7C773195
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 16:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBFGedoF004917 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 16:40:39 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id A3Wy2vjhyusG
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 16:40:39 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBFGeaVJ004914
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 16:40:37 GMT
Message-ID: <1450197636.13505.74.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Dec 2015 16:40:36 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] license: Fix BB_TASKDEPDATA references
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
X-List-Received-Date: Tue, 15 Dec 2015 16:40:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We shouldn't try and expand what is a python dict object 
and we don't want it to influence the task hashes, task 
dependencies are already accounted for.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index be1e0e7..6651d55 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -192,7 +192,7 @@ def get_deployed_dependencies(d):
     # usually in this var and not listed in rootfs.
     # At last, get the dependencies from boot classes because
     # it might contain the bootloader.
-    taskdata = d.getVar("BB_TASKDEPDATA", True)
+    taskdata = d.getVar("BB_TASKDEPDATA", False)
     depends = list(set([dep[0] for dep
                     in taskdata.itervalues()
                     if not dep[0].endswith("-native")]))
@@ -228,6 +228,7 @@ def get_deployed_dependencies(d):
                 break
 
     return deploy
+get_deployed_dependencies[vardepsexclude] = "BB_TASKDEPDATA"
 
 def get_boot_dependencies(d):
     """
@@ -236,7 +237,7 @@ def get_boot_dependencies(d):
 
     depends = []
     boot_depends_string = ""
-    taskdepdata = d.getVar("BB_TASKDEPDATA", True)
+    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
     # Only bootimg and bootdirectdisk include the depends flag
     boot_tasks = ["do_bootimg", "do_bootdirectdisk",]
 
@@ -264,6 +265,7 @@ def get_boot_dependencies(d):
                         depends.append(taskdep[0])
                         break
     return depends
+get_boot_dependencies[vardepsexclude] = "BB_TASKDEPDATA"
 
 def get_deployed_files(man_file):
     """



