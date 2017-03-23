Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3DAE777B46
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 17:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2NHBCnf015484; Thu, 23 Mar 2017 17:11:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HHMqamrmvnSf; Thu, 23 Mar 2017 17:11:12 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2NHBA67015472
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 23 Mar 2017 17:11:11 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cr6GU-00029E-Aa; Thu, 23 Mar 2017 17:11:10 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 17:11:05 +0000
Message-Id: <1490289067-8206-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490289067-8206-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1490289067-8206-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/5] staging: Drop BB_SETSCENE_VERIFY_FUNCTION2
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

The original description for this was:
"""
Since we clean out do_populate_sysroot if do_configure runs, don't
allow do_populate_sysroot_setscene functions if we're going to
run do_configure.
"""

With RSS, we don't need to clean do_populate_sysroot any more. Since
we no longer do that, this function also has no purpose any longer
and can also be removed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 93d39c3..f7a1707 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -173,19 +173,6 @@ addtask populate_sysroot after do_install
 SYSROOT_PREPROCESS_FUNCS ?= ""
 SYSROOT_DESTDIR = "${WORKDIR}/sysroot-destdir"
 
-BB_SETSCENE_VERIFY_FUNCTION2 = "sysroot_checkhashes2"
-
-def sysroot_checkhashes2(covered, tasknames, fns, d, invalidtasks):
-    problems = set()
-    configurefns = set()
-    for tid in invalidtasks:
-        if tasknames[tid] == "do_configure" and tid not in covered:
-            configurefns.add(fns[tid])
-    for tid in covered:
-        if tasknames[tid] == "do_populate_sysroot" and fns[tid] in configurefns:
-            problems.add(tid)
-    return problems
-
 python do_populate_sysroot () {
     bb.build.exec_func("sysroot_stage_all", d)
     bb.build.exec_func("sysroot_strip", d)
-- 
2.7.4


