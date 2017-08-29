Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id A2C5E78296
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 20:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id EE2492E306
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:36:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 2K8dkQhExwaN
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:36:27 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 4B0562E2DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:36:27 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 376941E094
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:36:27 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C41D1E096
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:36:27 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:36:27 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 20B47216B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:36:27 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v7TKaQsU031770
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:36:26 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v7TKaQ4p031758
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Aug 2017 22:36:26 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 22:36:25 +0200
Message-Id: <6f96908d0e85e40a344c7a3b9397e7ff55f1d2e8.1504038941.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1504038941.git.pkj@axis.com>
References: <cover.1504038941.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCHv2 1/1] sstate.bbclass: Do not cause build failures due to setscene errors
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
X-List-Received-Date: Tue, 29 Aug 2017 20:36:27 -0000

If a setscene task fails, the real task will be run instead. However,
in case the failed setscene task happened to log any errors, this will
still cause bitbake to return with an error code, even though
everything actually built ok. To avoid this, modify setscene to only
warn about errors.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/sstate.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 6af0d388bc..7d76ac141b 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -671,7 +671,7 @@ def pstaging_fetch(sstatefetch, sstatepkg, d):
         localdata.setVar('SRC_URI', srcuri)
         try:
             fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
-            fetcher.download()
+            fetcher.download(only_warn=True)
 
         except bb.fetch2.BBFetchException:
             break
@@ -680,7 +680,8 @@ def sstate_setscene(d):
     shared_state = sstate_state_fromvars(d)
     accelerate = sstate_installpkg(shared_state, d)
     if not accelerate:
-        bb.fatal("No suitable staging package found")
+        bb.warn("No suitable staging package found")
+        sys.exit(1)
 
 python sstate_task_prefunc () {
     shared_state = sstate_state_fromvars(d)
-- 
2.12.0


