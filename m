Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RSXCN-0000BL-DA for openembedded-core@lists.openembedded.org;
	Mon, 21 Nov 2011 17:58:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pALGpxw5009120
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 16:51:59 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08308-09 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 16:51:54 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pALGponp009114
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 16:51:51 GMT
Message-ID: <1321894315.18926.37.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Nov 2011 16:51:55 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] staging.bbclass: Add BB_SETSCENE_VERIFY_FUNCTION function
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
X-List-Received-Date: Mon, 21 Nov 2011 16:58:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Since we clean out do_populate_sysroot if do_configure runs, don't
allow do_populate_sysroot_setscene functions if we're going to
run do_configure.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 8318404..259a661 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -73,6 +73,21 @@ python sysroot_cleansstate () {
 }
 do_configure[prefuncs] += "sysroot_cleansstate"
 
+
+BB_SETSCENE_VERIFY_FUNCTION = "sysroot_checkhashes"
+
+def sysroot_checkhashes(covered, tasknames, fnids, fns, d):
+    problems = set()
+    configurefnids = set()
+    for task in xrange(len(tasknames)):
+        if tasknames[task] == "do_configure" and task not in covered:
+            configurefnids.add(fnids[task])
+    for task in covered:
+        if tasknames[task] == "do_populate_sysroot" and fnids[task] in configurefnids:
+            problems.add(task)
+            bb.error("sysroot task found %s" % fns[fnids[task]])
+    return problems
+
 python do_populate_sysroot () {
     #
     # if do_stage exists, we're legacy. In that case run the do_stage,




