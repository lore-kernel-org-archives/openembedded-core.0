Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id D86A96C5BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 20:42:02 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 187272201AA;
	Fri, 23 Nov 2018 09:42:02 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Nov 2018 09:41:56 +1300
Message-Id: <20181122204157.8261-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] reproducible: Refactor: Break out fixed_source_date_epoch() function
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
X-List-Received-Date: Thu, 22 Nov 2018 20:42:04 -0000

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/reproducible_build.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 0eb696ac78..a0fd4d656b 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -128,6 +128,10 @@ def get_source_date_epoch_from_youngest_file(d, sourcedir):
         bb.debug(1, "Newest file found: %s" % newest_file)
     return source_date_epoch
 
+def fixed_source_date_epoch():
+    bb.debug(1, "No tarball or git repo found to determine SOURCE_DATE_EPOCH")
+    return 0
+
 python do_create_source_date_epoch_stamp() {
     epochfile = d.getVar('SDE_FILE')
     if os.path.isfile(epochfile):
@@ -139,11 +143,8 @@ python do_create_source_date_epoch_stamp() {
         get_source_date_epoch_from_git(d, sourcedir) or
         get_source_date_epoch_from_known_files(d, sourcedir) or
         get_source_date_epoch_from_youngest_file(d, sourcedir) or
-        0       # Last resort
+        fixed_source_date_epoch()       # Last resort
     )
-    if source_date_epoch == 0:
-        # empty folder, not a single file ...
-        bb.debug(1, "No files found to determine SOURCE_DATE_EPOCH")
 
     bb.debug(1, "SOURCE_DATE_EPOCH: %d" % source_date_epoch)
     bb.utils.mkdirhier(d.getVar('SDE_DIR'))
-- 
2.17.1


