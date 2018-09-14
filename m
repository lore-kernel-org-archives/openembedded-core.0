Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 61D967997D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 02:58:39 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 8D426220374;
	Fri, 14 Sep 2018 14:58:37 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Sep 2018 14:58:16 +1200
Message-Id: <20180914025817.7315-6-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180914025817.7315-1-douglas.royds@taitradio.com>
References: <20180912012707.30046-1-douglas.royds@taitradio.com>
	<20180914025817.7315-1-douglas.royds@taitradio.com>
Subject: [PATCH v2 5/6] Reproducible: Don't enforce existence of ${S} dir
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
X-List-Received-Date: Fri, 14 Sep 2018 02:58:39 -0000

Unnecessary.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/reproducible_build.bbclass | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 42cb37b042..a81f249790 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -122,16 +122,12 @@ def get_source_date_epoch_from_youngest_file(d, sourcedir):
     return source_date_epoch
 
 python do_create_source_date_epoch_stamp() {
-    sourcedir = d.getVar('S')
-    if not os.path.isdir(sourcedir):
-        bb.warn("Unable to determine source_date_epoch! path:%s" % sourcedir)
-        return
-
     epochfile = d.getVar('SDE_FILE')
     if os.path.isfile(epochfile):
         bb.debug(1, " path: %s reusing __source_date_epoch.txt" % epochfile)
         return
 
+    sourcedir = d.getVar('S')
     source_date_epoch = (
         get_source_date_epoch_from_git(d, sourcedir) or
         get_source_date_epoch_from_known_files(d, sourcedir) or
-- 
2.17.1


