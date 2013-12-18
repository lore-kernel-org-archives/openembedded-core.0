Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 06E4F60D04
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 11:30:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBIBUBIn031552 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 11:30:11 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8XlRofZQd6yM
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 11:30:11 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBIBU7IV031537
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 11:30:09 GMT
Message-ID: <1387366203.6402.34.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Dec 2013 11:30:03 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] externalsrc: Use deltask API
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
X-List-Received-Date: Wed, 18 Dec 2013 11:30:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Now we have deltask API, stop poking around bitbake internal variables.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index c759289..53c71cb 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -26,21 +26,6 @@
 
 SRCTREECOVEREDTASKS ?= "do_patch do_unpack do_fetch"
 
-def remove_tasks(tasks, deltasks, d):
-    for task in tasks:
-        deps = d.getVarFlag(task, "deps")
-        for preptask in deltasks:
-            if preptask in deps:
-                deps.remove(preptask)
-        d.setVarFlag(task, "deps", deps)
-    # Poking around bitbake internal variables is evil but there appears to be no better way :(
-    tasklist = d.getVar('__BBTASKS') or []
-    for task in deltasks:
-        d.delVarFlag(task, "task")
-        if task in tasklist:
-            tasklist.remove(task)
-    d.setVar('__BBTASKS', tasklist)
-
 python () {
     externalsrc = d.getVar('EXTERNALSRC', True)
     if externalsrc:
@@ -53,16 +38,16 @@ python () {
         d.setVar('SRC_URI', '')
 
         tasks = filter(lambda k: d.getVarFlag(k, "task"), d.keys())
-        covered = d.getVar("SRCTREECOVEREDTASKS", True).split()
 
         for task in tasks:
             if task.endswith("_setscene"):
                 # sstate is never going to work for external source trees, disable it
-                covered.append(task)
+                bb.build.deltask(task, d)
             else:
                 # Since configure will likely touch ${S}, ensure only we lock so one task has access at a time
                 d.appendVarFlag(task, "lockfiles", "${S}/singletask.lock")
 
-        remove_tasks(tasks, covered, d)
+        for task in covered:
+            bb.build.deltask(task, d)
 }
 



