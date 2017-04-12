Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E91E477C3C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 18:59:24 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3CIxNJE013685
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 12 Apr 2017 19:59:24 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cyNUB-0000FB-C3; Wed, 12 Apr 2017 19:59:23 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 19:59:18 +0100
Message-Id: <1492023558-890-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] oe-selftest: Error if known problem variables are set
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
X-List-Received-Date: Wed, 12 Apr 2017 18:59:25 -0000

Setting SANITY_TESTED_DISTROS or PRSERV_HOST are known to break oe-selftest.
Rather than have the user experience this, refuse to execute unless the
environment is correct.

Ideally we'd try and unset these but that is a more invasive change and this
at least makes people aware of the problem.

[YOCTO #11292]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-selftest | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 58d3b1e..52366b1 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -146,6 +146,14 @@ def preflight_check():
         log.error("You have buildhistory enabled already and this isn't recommended for selftest, please disable it first.")
         return False
 
+    if get_bb_var("PRSERV_HOST"):
+        log.error("Please unset PRSERV_HOST in order to run oe-selftest")
+        return False
+
+    if get_bb_var("SANITY_TESTED_DISTROS"):
+        log.error("Please unset SANITY_TESTED_DISTROS in order to run oe-selftest")
+        return False
+
     log.info("Running bitbake -p")
     runCmd("bitbake -p")
 
-- 
2.7.4


