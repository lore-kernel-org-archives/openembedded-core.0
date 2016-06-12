Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9BFCA6014F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 22:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5CMvvEq016150 for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 23:57:57 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9v3wZ1BVgvb3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 23:57:57 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5CMvrAN016147
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 23:57:54 +0100
Message-ID: <1465772273.13979.194.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 23:57:53 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] staging: Add BB_SETSCENE_VERIFY_FUNCTION2 for bitbake runqueue changes
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
X-List-Received-Date: Sun, 12 Jun 2016 22:58:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We're about to rewrite the data structures in taskdata/runqueue in bitbake
and we 'leaked' knowledge about those structures to this single function.

Add a 'v2' function definition for use with the newer bitbake, the older 
one can remain for compatibility for a while, then be removed. The function
is comparatively simple and rarely changes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 30f2b50..a0b09a0 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -181,6 +181,19 @@ python sysroot_cleansstate () {
 do_configure[prefuncs] += "sysroot_cleansstate"
 
 
+BB_SETSCENE_VERIFY_FUNCTION2 = "sysroot_checkhashes2"
+
+def sysroot_checkhashes2(covered, tasknames, fns, d, invalidtasks):
+    problems = set()
+    configurefns = set()
+    for tid in invalidtasks:
+        if tasknames[tid] == "do_configure" and tid not in covered:
+            configurefns.add(fns[tid])
+    for tid in covered:
+        if tasknames[tid] == "do_populate_sysroot" and fns[tid] in configurefns:
+            problems.add(tid)
+    return problems
+
 BB_SETSCENE_VERIFY_FUNCTION = "sysroot_checkhashes"
 
 def sysroot_checkhashes(covered, tasknames, fnids, fns, d, invalidtasks = None):



