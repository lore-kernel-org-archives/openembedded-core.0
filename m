Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F45377ED2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 15:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 7906B18217
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ye7Ip2sS94Fx
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:05 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 4A073181DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:05 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39E891E099
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:05 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F32A1E097
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:05 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:05 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 23813217C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:05 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v3SF142x012824
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 17:01:04 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v3SF14uw012823
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Apr 2017 17:01:04 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Apr 2017 17:01:01 +0200
Message-Id: <0df3034bfb111a8ce6f4028491ddce6265d73108.1493391620.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1493391620.git.pkj@axis.com>
References: <cover.1493391620.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 1/2] bitbake.conf: Add HOSTTOOLS_DIR for ${TMPDIR}/hosttools
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

The path to where to install and find the tools copied from the host
environment is already used in a couple of places. This warrants it to
get its own variable.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/base.bbclass | 4 ++--
 meta/conf/bitbake.conf    | 3 +++
 meta/conf/layer.conf      | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e29821f199..d95afb7b9b 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -239,8 +239,8 @@ python base_eventhandler() {
         oe.utils.features_backfill("DISTRO_FEATURES", e.data)
         oe.utils.features_backfill("MACHINE_FEATURES", e.data)
         # Works with the line in layer.conf which changes PATH to point here
-        setup_hosttools_dir(d.expand('${TMPDIR}/hosttools'), 'HOSTTOOLS', d)
-        setup_hosttools_dir(d.expand('${TMPDIR}/hosttools'), 'HOSTTOOLS_NONFATAL', d, fatal=False)
+        setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS', d)
+        setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS_NONFATAL', d, fatal=False)
 
     if isinstance(e, bb.event.BuildStarted):
         localdata = bb.data.createCopy(e.data)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 227babd1b2..ba8099270c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -452,6 +452,9 @@ export PATH
 # Build utility info.
 ##################################################################
 
+# Directory where host tools are copied
+HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
+
 # Tools needed to run builds with OE-Core
 HOSTTOOLS += " \
     [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp cp cpio \
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 739d82ea56..fc165021c5 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -60,4 +60,4 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
 "
 
 # We need to keep bitbake tools in PATH
-PATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}:${TMPDIR}/hosttools"
+PATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}:${HOSTTOOLS_DIR}"
-- 
2.12.0


