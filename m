Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 88BCF71C8D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 16:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JGDC2G002522; Thu, 19 Jan 2017 16:13:13 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jbY_-3cQn6f7; Thu, 19 Jan 2017 16:13:13 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JGD6nr002508
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Jan 2017 16:13:07 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cUFKk-0000lS-AS; Thu, 19 Jan 2017 16:13:06 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 16:13:01 +0000
Message-Id: <1484842382-2821-10-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484842382-2821-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484842382-2821-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 10/11] oe-selftest: Error if the user has buildhistory enabled
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
X-List-Received-Date: Thu, 19 Jan 2017 16:13:15 -0000

buildhistory interfers with various tests so error if the user has it enabled,
hence avoiding time spent running the tests only for them to fail.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-selftest | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 120a6c2..124a8dd 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -134,6 +134,10 @@ def preflight_check():
         log.error("You don't seem to have the meta-selftest layer in BBLAYERS")
         return False
 
+    if "buildhistory.bbclass" in get_bb_var("BBINCLUDED"):
+        log.error("You have buildhistory enabled already and this isn't recommended for selftest, please disable it first.")
+        return False
+
     log.info("Running bitbake -p")
     runCmd("bitbake -p")
 
-- 
2.7.4


