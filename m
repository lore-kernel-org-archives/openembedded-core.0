Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 92E8F77D0E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 10:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v3BA5363029215; 
	Tue, 11 Apr 2017 11:05:04 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KxhtOa_XvkmM; Tue, 11 Apr 2017 11:05:04 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3B9xQpg028488
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 11 Apr 2017 10:59:27 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cxsa6-0006Nb-LX; Tue, 11 Apr 2017 10:59:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 10:59:25 +0100
Message-Id: <1491904765-24485-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] staging: Fix sysroot problem with populate_sysroot dependencies on do_fetch
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
X-List-Received-Date: Tue, 11 Apr 2017 10:05:06 -0000

Dependencies on svn:// urls were failing as the cleandirs on do_fetch was destroying
any sysroot setup by the extend_recipe_sysroot function.

Add code so that if the task do_fetch, we move the cleandirs to a separate function before
the extend_recipe_sysroot prefunc else we'd wipe out the sysroot we just created.

This allows fetcher do_populate_sysroot dependencies to work correctly again.

I did try various other approaches and a seperate function with cleandirs was the
cleanest way to add this without code duplication or too much complexity.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 27fcd1e..8bdb437 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -639,7 +639,12 @@ python do_prepare_recipe_sysroot () {
 addtask do_prepare_recipe_sysroot before do_configure after do_fetch
 
 # Clean out the recipe specific sysroots before do_fetch
-do_fetch[cleandirs] += "${RECIPE_SYSROOT} ${RECIPE_SYSROOT_NATIVE}"
+# (use a prefunc so we can order before extend_recipe_sysroot if it gets added)
+python clean_recipe_sysroot() {
+    return
+}
+clean_recipe_sysroot[cleandirs] += "${RECIPE_SYSROOT} ${RECIPE_SYSROOT_NATIVE}"
+do_fetch[prefuncs] += "clean_recipe_sysroot"
 
 python staging_taskhandler() {
     bbtasks = e.tasklist
-- 
2.7.4


