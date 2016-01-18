Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8AADD608B7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 17:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0IHv724000438; Mon, 18 Jan 2016 17:57:07 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EenatdaPsyHu; Mon, 18 Jan 2016 17:57:07 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0IHv1MJ000434
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 18 Jan 2016 17:57:02 GMT
Message-ID: <1453139821.27999.78.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jan 2016 17:57:01 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: [PATCH] sstate: Add packagedata to list of tasks not to recurse
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
X-List-Received-Date: Mon, 18 Jan 2016 17:57:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If we "bitbake X -c packagedata" and the packagedata comes from sstate, we 
don't need any of the tasks dependencies. This is similar to the 
populate_lic case, we only care about the end result.

Therefore short circuit the dependencies so packagedata doesn't pull in
any other dependencies.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index d9adf01..7d65f4a 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -854,6 +854,10 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
     if taskdependees[task][1] == "do_populate_lic":
         return True
 
+    # We only need to trigger packagedata through direct dependencies
+    if taskdependees[task][1] == "do_packagedata":
+        return True
+
     for dep in taskdependees:
         bb.debug(2, "  considering dependency: %s" % (str(taskdependees[dep])))
         if task == dep:
-- 
cgit v0.10.2


