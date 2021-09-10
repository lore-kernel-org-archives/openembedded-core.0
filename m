Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web09.3392.1631237343218083434
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 18:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.40.192.95])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 18A1T1ee015338
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Sep 2021 20:29:02 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2 2/2] externalsrc: Work with reproducible_build
Date: Thu,  9 Sep 2021 20:29:01 -0500
Message-Id: <20210910012901.19993-3-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210910012901.19993-1-mark.hatle@kernel.crashing.org>
References: <20210910012901.19993-1-mark.hatle@kernel.crashing.org>

From: Mark Hatle <mark.hatle@xilinx.com>

Externalsrc removes do_fetch, do_unpack, and do_patch.  The system normally
discovers the correct reproducible date as a postfuncs of do_unpack, so this
date is never found, so it falls back to the default epoch.

Instead we can move the discovery function to a prefuncs on the epoch
deploy task.  This task will run before do_configure, and since the source
is already available can run safely at anytime.

Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/externalsrc.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 54b08adf62..34921b39a2 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -110,6 +110,16 @@ python () {
                 continue
             bb.build.deltask(task, d)
 
+        if bb.data.inherits_class('reproducible_build', d) and 'do_unpack' in d.getVar("SRCTREECOVEREDTASKS").split():
+            # The reproducible_build's create_source_date_epoch_stamp function must
+            # be run after the source is available and before the
+            # do_deploy_source_date_epoch task.  In the normal case, it's attached
+            # to do_unpack as a postfuncs, but since we removed do_unpack (above)
+            # we need to move the function elsewhere.  The easiest thing to do is
+            # move it into the prefuncs of the do_deploy_source_date_epoch task.
+            # This is safe, as externalsrc runs with the source is already unpacked.
+            d.prependVarFlag('do_deploy_source_date_epoch', 'prefuncs', 'create_source_date_epoch_stamp ')
+
         d.prependVarFlag('do_compile', 'prefuncs', "externalsrc_compile_prefunc ")
         d.prependVarFlag('do_configure', 'prefuncs', "externalsrc_configure_prefunc ")
 
-- 
2.17.1

