Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3CFB577ECA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 15:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 8DEF01820D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ymktZ7K8fQkk
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:05 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 7698F181DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:05 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 661201E099
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:05 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5AFF61E097
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:05 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:05 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 4F4C5217C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:05 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v3SF15m9012828
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:05 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v3SF15iM012827
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Apr 2017 17:01:05 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Apr 2017 17:01:02 +0200
Message-Id: <8a430c9f93f00eed399175287be30cfcd0326cab.1493391620.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1493391620.git.pkj@axis.com>
References: <cover.1493391620.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/2] sstate.bbclass, staging.bbclass: Handle HOSTTOOLS_DIR when restoring state
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
X-List-Received-Date: Fri, 28 Apr 2017 15:01:07 -0000

Paths to host tools that have been copied to ${HOSTTOOLS_DIR} may end
up in the sstate cache. They thus need to be corrected when restoring
from the sstate cache.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/sstate.bbclass                         | 2 +-
 meta/classes/staging.bbclass                        | 2 +-
 meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index e50a38597d..ddc442cdf9 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -54,7 +54,7 @@ SSTATEPOSTCREATEFUNCS = ""
 SSTATEPREINSTFUNCS = ""
 SSTATEPOSTUNPACKFUNCS = "sstate_hardcode_path_unpack"
 SSTATEPOSTINSTFUNCS = ""
-EXTRA_STAGING_FIXMES ?= ""
+EXTRA_STAGING_FIXMES ?= "HOSTTOOLS_DIR"
 SSTATECLEANFUNCS = ""
 
 # Check whether sstate exists for tasks that support sstate and are in the
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 8bdb437a1f..4015dd754c 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -249,7 +249,7 @@ def staging_processfixme(fixme, target, recipesysroot, recipesysrootnative, d):
     if not fixme:
         return
     cmd = "sed -e 's:^[^/]*/:%s/:g' %s | xargs sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIRHOST:%s:g'" % (target, " ".join(fixme), recipesysroot, recipesysrootnative)
-    for fixmevar in ['PKGDATA_DIR']:
+    for fixmevar in ['HOSTTOOLS_DIR', 'PKGDATA_DIR']:
         fixme_path = d.getVar(fixmevar)
         cmd += " -e 's:FIXME_%s:%s:g'" % (fixmevar, fixme_path)
     bb.note(cmd)
diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
index 17a99a4afb..44d013f29d 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -9,7 +9,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 # We need the following for the sstate code to process the wrapper
 SSTATE_SCAN_FILES += "depmodwrapper"
-EXTRA_STAGING_FIXMES = "PKGDATA_DIR"
+EXTRA_STAGING_FIXMES += "PKGDATA_DIR"
 
 do_populate_sysroot[depends] = ""
 
-- 
2.12.0


