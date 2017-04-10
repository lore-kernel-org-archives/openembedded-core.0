Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F197677BD3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 19:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v3AJOTcM004736; 
	Mon, 10 Apr 2017 20:24:29 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vyFU2_rq45bU; Mon, 10 Apr 2017 20:24:29 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3AJAPvs003936
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 10 Apr 2017 20:10:26 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cxehl-0001H2-OV; Mon, 10 Apr 2017 20:10:25 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Apr 2017 20:10:24 +0100
Message-Id: <1491851424-4848-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491851424-4848-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1491851424-4848-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/3] staging: Fix sysroot problem with populate_sysroot dependencies on do_fetch
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
X-List-Received-Date: Mon, 10 Apr 2017 19:24:31 -0000

Dependencies on svn:// urls were failing as the cleandirs on do_fetch was destroying
any sysroot setup by the extend_recipe_sysroot function.

Add code so that if the task do_fetch, we move the cleandirs to the extend_recipe_sysroot
task else we'd wipe out the sysroot we just created.

This allows fetcher do_populate_sysroot dependencies to work correctly again.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 27fcd1e..c50abd0 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -647,6 +647,11 @@ python staging_taskhandler() {
         deps = d.getVarFlag(task, "depends")
         if deps and "populate_sysroot" in deps:
             d.appendVarFlag(task, "prefuncs", " extend_recipe_sysroot")
+        # If this is do_fetch, we need to move the cleandirs above to the extend_recipe_sysroot task
+        # else we'd wipe out the sysroot we just created.
+        if task == "do_fetch":
+            d.setVarFlag("extend_recipe_sysroot", "cleandirs", d.getVarFlag(task, "cleandirs"))
+            d.delVarFlag(task, "cleandirs")
 }
 staging_taskhandler[eventmask] = "bb.event.RecipeTaskPreProcess"
 addhandler staging_taskhandler
-- 
2.7.4


