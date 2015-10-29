Return-Path: <mcrowe@brightsign.biz>
X-Greylist: delayed 902 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 29 Oct 2015 12:43:51 UTC
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id BCA2E755F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 12:43:50 +0000 (UTC)
Received: from [86.30.112.98] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 631605692; Thu, 29 Oct 2015 08:28:48 -0400
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1ZrmJk-0006B7-0O; Thu, 29 Oct 2015 12:28:32 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1ZrmJj-0001YW-Va; Thu, 29 Oct 2015 12:28:31 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Oct 2015 12:28:21 +0000
Message-Id: <1446121701-5848-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] allarch: Force TARGET_*FLAGS variable values
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
X-List-Received-Date: Thu, 29 Oct 2015 12:43:52 -0000

TARGET_CPPFLAGS, TARGET_CFLAGS, TARGET_CPPFLAGS and TARGET_LDFLAGS may
differ between MACHINEs. Since they are exported they affect task hashes
even if unused which leads to multiple variants of allarch packages
existing in sstate and bouncing in the sysroot when switching between
MACHINEs.

allarch packages shouldn't be using these variables anyway, so let's
ensure they have a fixed value in order to avoid this problem.

(Compare with 05a70ac30b37cab0952f1b9df501993a9dec70da and
14f4d016fef9d660da1e7e91aec4a0e807de59ab.)

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/allarch.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 2fea7c0..4af38d7 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -27,6 +27,10 @@ python () {
         d.setVar("PACKAGE_EXTRA_ARCHS", "")
         d.setVar("SDK_ARCH", "none")
         d.setVar("SDK_CC_ARCH", "none")
+        d.setVar("TARGET_CPPFLAGS", "none")
+        d.setVar("TARGET_CFLAGS", "none")
+        d.setVar("TARGET_CXXFLAGS", "none")
+        d.setVar("TARGET_LDFLAGS", "none")
 
         # Avoid this being unnecessarily different due to nuances of
         # the target machine that aren't important for "all" arch
-- 
2.1.4


