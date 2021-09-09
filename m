Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.2514.1631155861907537530
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 19:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.40.192.95])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1892p0te020589
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Sep 2021 21:51:01 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] reproducible_build: Honor BUILD_REPRODUCIBLE_BINARIES
Date: Wed,  8 Sep 2021 21:50:59 -0500
Message-Id: <20210909025100.119427-2-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210909025100.119427-1-mark.hatle@kernel.crashing.org>
References: <20210909025100.119427-1-mark.hatle@kernel.crashing.org>

From: Mark Hatle <mark.hatle@xilinx.com>

A variable BUILD_REPRODUCIBLE_BINARIES is set to '1' by default and was used
to control if the postfuncs were added.  However, it didn't actually disable
the reproducible_build (date) logic.  This resulted in the program falling
back to the default date.

This change fully honors the variable and disables the various pieces
that discover and configure the SOURCE_DATE_EPOCH if the value if not
set to '1'.

Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/reproducible_build.bbclass | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 378121903d..a9c117c3b9 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -47,7 +47,9 @@ TARGET_CC_ARCH:append:class-target = " -Wdate-time"
 # A SOURCE_DATE_EPOCH of '0' might be misinterpreted as no SDE
 export SOURCE_DATE_EPOCH_FALLBACK ??= "1302044400"
 
-SSTATETASKS += "do_deploy_source_date_epoch"
+# The following are preformed in the anonymous python function, only if
+# BUILD_REPRODUCIBLE_BINARIES == 1
+#SSTATETASKS += "do_deploy_source_date_epoch"
 
 do_deploy_source_date_epoch () {
     mkdir -p ${SDE_DEPLOYDIR}
@@ -73,8 +75,10 @@ python do_deploy_source_date_epoch_setscene () {
 
 do_deploy_source_date_epoch[dirs] = "${SDE_DEPLOYDIR}"
 do_deploy_source_date_epoch[sstate-plaindirs] = "${SDE_DEPLOYDIR}"
-addtask do_deploy_source_date_epoch_setscene
-addtask do_deploy_source_date_epoch before do_configure after do_patch
+# The following are preformed in the anonymous python function, only if
+# BUILD_REPRODUCIBLE_BINARIES == 1
+#addtask do_deploy_source_date_epoch_setscene
+#addtask do_deploy_source_date_epoch before do_configure after do_patch
 
 python create_source_date_epoch_stamp() {
     import oe.reproducible
@@ -123,5 +127,12 @@ BB_HASHBASE_WHITELIST += "SOURCE_DATE_EPOCH"
 
 python () {
     if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
+        # Generate the timestamp with create_source_date_epoch_stamp.
         d.appendVarFlag("do_unpack", "postfuncs", " create_source_date_epoch_stamp")
+        d.appendVar('SSTATETASKS', " do_deploy_source_date_epoch")
+        bb.build.addtask('do_deploy_source_date_epoch_setscene', None, None, d)
+        bb.build.addtask('do_deploy_source_date_epoch', 'do_configure', 'do_patch', d)
+    else:
+        # If this is set at all, the system components will attempt to use it
+        d.delVar('SOURCE_DATE_EPOCH')
 }
-- 
2.17.1

