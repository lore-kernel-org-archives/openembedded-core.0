Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7ABCE71C7E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 21:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 3FCF01822F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 23:13:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id e5Y0OXQn3jWA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 23:13:41 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id B203B18196
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 23:13:41 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A11581E09F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 23:13:41 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 965F71E09C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 23:13:41 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 23:13:41 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 8B1C22732
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 23:13:41 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v43LDfAS021767
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 May 2017 23:13:41 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v43LDfjB021766
	for openembedded-core@lists.openembedded.org;
	Wed, 3 May 2017 23:13:41 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 May 2017 23:13:39 +0200
Message-Id: <52538e812eddb8606cbf9cef2c7bb1f076e3c146.1493845632.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1493845632.git.pkj@axis.com>
References: <cover.1493845632.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/2] useradd.bbclass: Handle COMPONENTS_DIR when restoring state
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
X-List-Received-Date: Wed, 03 May 2017 21:13:41 -0000

The export of PSEUDO in useradd_sysroot() contains references to
${COMPONENTS_DIR}. These need to be handled when restoring
postinst-useradd-${PN} from the sstate cache.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/staging.bbclass | 2 +-
 meta/classes/useradd.bbclass | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 31cd625640..565638f48d 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -249,7 +249,7 @@ def staging_processfixme(fixme, target, recipesysroot, recipesysrootnative, d):
     if not fixme:
         return
     cmd = "sed -e 's:^[^/]*/:%s/:g' %s | xargs sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIRHOST:%s:g'" % (target, " ".join(fixme), recipesysroot, recipesysrootnative)
-    for fixmevar in ['HOSTTOOLS_DIR', 'PKGDATA_DIR']:
+    for fixmevar in ['COMPONENTS_DIR', 'HOSTTOOLS_DIR', 'PKGDATA_DIR']:
         fixme_path = d.getVar(fixmevar)
         cmd += " -e 's:FIXME_%s:%s:g'" % (fixmevar, fixme_path)
     bb.note(cmd)
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 4373677bd6..92e45ff9bc 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -132,6 +132,11 @@ useradd_sysroot () {
 	useradd_preinst
 }
 
+# The export of PSEUDO in useradd_sysroot() above contains references to
+# ${COMPONENTS_DIR}. These need to be handled when restoring
+# postinst-useradd-${PN} from the sstate cache.
+EXTRA_STAGING_FIXMES += "COMPONENTS_DIR"
+
 python useradd_sysroot_sstate () {
     task = d.getVar("BB_CURRENTTASK")
     if task == "package_setscene":
-- 
2.12.0


