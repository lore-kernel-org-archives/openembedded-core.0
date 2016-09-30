Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 851A670018
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 16:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8UGhbIL021806; Fri, 30 Sep 2016 17:43:38 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id s2zgldKbkk-f; Fri, 30 Sep 2016 17:43:38 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8UGhYte021789
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 30 Sep 2016 17:43:35 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1bq0uM-0007Ci-Db; Fri, 30 Sep 2016 17:43:34 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2016 17:43:23 +0100
Message-Id: <1475253808-27642-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475253808-27642-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1475253808-27642-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/7] allarch: Fixes to stop rebuilds when change multilibs
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
X-List-Received-Date: Fri, 30 Sep 2016 16:43:39 -0000

When changing multilibs, allarch recipes should not be rebuilding. This
adds enough variable exclusions to make this work properly. Future
regressions will be prevented with new testing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/allarch.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 208cde6..ddc2a85 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -17,6 +17,7 @@ python () {
 
         # Set these to a common set of values, we shouldn't be using them other that for WORKDIR directory
         # naming anyway
+        d.setVar("baselib", "lib")
         d.setVar("TARGET_ARCH", "allarch")
         d.setVar("TARGET_OS", "linux")
         d.setVar("TARGET_CC_ARCH", "none")
@@ -41,6 +42,10 @@ python () {
         d.setVar("EXCLUDE_FROM_SHLIBS", "1")
         d.setVar("INHIBIT_PACKAGE_DEBUG_SPLIT", "1")
         d.setVar("INHIBIT_PACKAGE_STRIP", "1")
+
+        # These multilib values shouldn't change allarch packages so exclude them
+        d.setVarFlag("emit_pkgdata", "vardepsexclude", "MULTILIB_VARIANTS")
+        d.setVarFlag("write_specfile", "vardepsexclude", "MULTILIBS")
     elif bb.data.inherits_class('packagegroup', d) and not bb.data.inherits_class('nativesdk', d):
         bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inherit packagegroup" % d.getVar("FILE", True))
 }
-- 
2.7.4


