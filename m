Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web12.2377.1631155861940754404
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 19:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.40.192.95])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1892p0tf020589
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Sep 2021 21:51:01 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] reproducible_build: Work with externalsrc
Date: Wed,  8 Sep 2021 21:51:00 -0500
Message-Id: <20210909025100.119427-3-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210909025100.119427-1-mark.hatle@kernel.crashing.org>
References: <20210909025100.119427-1-mark.hatle@kernel.crashing.org>

From: Mark Hatle <mark.hatle@xilinx.com>

Externalsrc removes do_fetch, do_unpack, and do_patch.  The system normally
discovers the correct reproducible date as a postfuncs on do_unpack, so this
date is never found, so it goes back to the default epoch.

Instead we can move the discovery function to a prefuncs on the epoch
deploy task.  This task will run before do_configure, and since the source
is already available can run anytime safely.

Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/reproducible_build.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index a9c117c3b9..ae0723ab21 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -128,7 +128,13 @@ BB_HASHBASE_WHITELIST += "SOURCE_DATE_EPOCH"
 python () {
     if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
         # Generate the timestamp with create_source_date_epoch_stamp.
-        d.appendVarFlag("do_unpack", "postfuncs", " create_source_date_epoch_stamp")
+        # In most cases this will be a postfuncs of do_unpack.
+        # If we're running in external source, add create_source_date_epoch_stamp
+        # to do_deploy_source_date_epoch instead because there is no do_unpack.
+        if d.getVar('EXTERNALSRC') and bb.data.inherits_class('externalsrc', d):
+            d.appendVarFlag('do_deploy_source_date_epoch', 'prefuncs', ' create_source_date_epoch_stamp')
+        else:
+            d.appendVarFlag("do_unpack", "postfuncs", " create_source_date_epoch_stamp")
         d.appendVar('SSTATETASKS', " do_deploy_source_date_epoch")
         bb.build.addtask('do_deploy_source_date_epoch_setscene', None, None, d)
         bb.build.addtask('do_deploy_source_date_epoch', 'do_configure', 'do_patch', d)
-- 
2.17.1

