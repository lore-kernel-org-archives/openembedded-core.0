Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 738FF77AFE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 17:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2NHBATJ015477; Thu, 23 Mar 2017 17:11:10 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zy_JOp8ObZXA; Thu, 23 Mar 2017 17:11:10 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2NHB9pK015470
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 23 Mar 2017 17:11:10 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cr6GT-000296-9K; Thu, 23 Mar 2017 17:11:09 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 17:11:03 +0000
Message-Id: <1490289067-8206-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/5] staging: Drop BB_SETSCENE_VERIFY_FUNCTION since it was replaced
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
X-List-Received-Date: Thu, 23 Mar 2017 17:11:12 -0000

BB_SETSCENE_VERIFY_FUNCTION2 replaced BB_SETSCENE_VERIFY_FUNCTION
and due to our minimum bitbake requirements there is no point in
retaining the older version any more.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 0752009..df77408 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -194,21 +194,6 @@ def sysroot_checkhashes2(covered, tasknames, fns, d, invalidtasks):
             problems.add(tid)
     return problems
 
-BB_SETSCENE_VERIFY_FUNCTION = "sysroot_checkhashes"
-
-def sysroot_checkhashes(covered, tasknames, fnids, fns, d, invalidtasks = None):
-    problems = set()
-    configurefnids = set()
-    if not invalidtasks:
-        invalidtasks = range(len(tasknames))
-    for task in invalidtasks:
-        if tasknames[task] == "do_configure" and task not in covered:
-            configurefnids.add(fnids[task])
-    for task in covered:
-        if tasknames[task] == "do_populate_sysroot" and fnids[task] in configurefnids:
-            problems.add(task)
-    return problems
-
 python do_populate_sysroot () {
     bb.build.exec_func("sysroot_stage_all", d)
     bb.build.exec_func("sysroot_strip", d)
-- 
2.7.4


