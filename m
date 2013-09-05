Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 8989361862
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 15:17:39 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r85FUl6j018264 for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Sep 2013 16:30:47 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vZiICTAf5D8y
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 16:30:47 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r85FUgH7018255
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Sep 2013 16:30:43 +0100
Message-ID: <1378394247.32427.75.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 05 Sep 2013 16:17:27 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] devshell: Don't corrupt the fakeroot variables
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
X-List-Received-Date: Thu, 05 Sep 2013 15:17:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The devshell anonymous python fragment overwrites variables in the
datastore with their expanded versions. If this runs before the code
in allarch.bbclass which changes TARGET_OS, we can end up with different
directories in the fakeroot environment variables, some expanded with
the original TARGET_OS value.

The devshell code only needs to run before the task itself so we change
to trigger it to run at task execution time only using a flag.

[YOCTO #4795]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index a780118..92edb9e 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -3,6 +3,15 @@ inherit terminal
 DEVSHELL = "${SHELL}"
 
 python do_devshell () {
+    if d.getVarFlag("do_devshell", "manualfakeroot"):
+       d.prependVar("DEVSHELL", "pseudo ")
+       fakeenv = d.getVar("FAKEROOTENV", True).split()
+       for f in fakeenv:
+            k = f.split("=")
+            d.setVar(k[0], k[1])           
+            d.appendVar("OE_TERMINAL_EXPORTS", " " + k[0])
+       d.delVarFlag("do_devshell", "fakeroot")
+
     oe_terminal(d.getVar('DEVSHELL', True), 'OpenEmbedded Developer Shell', d)
 }
 
@@ -17,11 +26,8 @@ do_devshell[nostamp] = "1"
 # manually
 python () {
     if d.getVarFlag("do_devshell", "fakeroot"):
-       d.prependVar("DEVSHELL", "pseudo ")
-       fakeenv = d.getVar("FAKEROOTENV", True).split()
-       for f in fakeenv:
-            k = f.split("=")
-            d.setVar(k[0], k[1])           
-            d.appendVar("OE_TERMINAL_EXPORTS", " " + k[0])
+       # We need to signal our code that we want fakeroot however we
+       # can't manipulate the environment and variables here yet (see YOCTO #4795)
+       d.setVarFlag("do_devshell", "manualfakeroot", "1")
        d.delVarFlag("do_devshell", "fakeroot")
 } 



