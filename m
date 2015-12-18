Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C8B98608B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 13:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBIDo7nU008049 for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 13:50:07 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wymHnB9KNQg4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 13:50:07 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBIDo4rC008043
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 13:50:05 GMT
Message-ID: <1450446604.8461.43.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Dec 2015 13:50:04 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] buildstats-summary/toaster: Cope with removal of get_bn()
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
X-List-Received-Date: Fri, 18 Dec 2015 13:50:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The buildstats changes removed the no longer needed get_bn() function,
replace this with references to BUILDNAME.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/buildstats-summary.bbclass b/meta/classes/buildstats-summary.bbclass
index 05ead9f..d73350b 100644
--- a/meta/classes/buildstats-summary.bbclass
+++ b/meta/classes/buildstats-summary.bbclass
@@ -3,8 +3,7 @@ python buildstats_summary () {
     import collections
     import os.path
 
-    bn = get_bn(e)
-    bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
+    bsdir = e.data.expand("${BUILDSTATS_BASE}/${BUILDNAME}")
     if not os.path.exists(bsdir):
         return
 
diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 7af495e..4fb52a9 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -189,9 +189,7 @@ python toaster_collect_task_stats() {
         lock = bb.utils.lockfile(e.data.expand("${TOPDIR}/toaster.lock"), False, True)
 
         with open(os.path.join(e.data.getVar('BUILDSTATS_BASE', True), "toasterstatlist"), "a") as fout:
-            bn = get_bn(e)
-            bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
-            taskdir = os.path.join(bsdir, e.data.expand("${PF}"))
+            taskdir = e.data.expand("${BUILDSTATS_BASE}/${BUILDNAME}/${PF}")
             fout.write("%s::%s::%s::%s\n" % (e.taskfile, e.taskname, os.path.join(taskdir, e.task), e.data.expand("${PN}")))
 
         bb.utils.unlockfile(lock)



