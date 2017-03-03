Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B251F7769A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 11:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v23BG8PS003829; Fri, 3 Mar 2017 11:16:08 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NO2jOC3HWIGW; Fri,  3 Mar 2017 11:16:08 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v23BG6Ko003813
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 3 Mar 2017 11:16:07 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cjlBu-0005bR-Np; Fri, 03 Mar 2017 11:16:06 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Mar 2017 11:16:01 +0000
Message-Id: <1488539763-21490-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488539763-21490-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1488539763-21490-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/4] testsdk: Drop lockfile usage
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
X-List-Received-Date: Fri, 03 Mar 2017 11:16:09 -0000

We should be able to test sdks in parallel. As far as I can tell, this
restriction crept in for no good reason, based on locks that testimage used
for the non-qemu case.

Therefore remove the lock and allow sdks to test in parallel.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testsdk.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index d566b43..29db5e8 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -14,8 +14,6 @@
 #
 # where "<image-name>" is an image like core-image-sato.
 
-TESTSDKLOCK = "${TMPDIR}/testsdk.lock"
-
 def testsdk_main(d):
     import os
     import subprocess
@@ -194,4 +192,4 @@ python do_testsdkext() {
 }
 addtask testsdkext
 do_testsdkext[nostamp] = "1"
-do_testsdkext[lockfiles] += "${TESTSDKEXTLOCK}"
+
-- 
2.7.4


