Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id 616DB7375A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2015 12:54:20 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id E944B498; Sun,  1 Mar 2015 13:54:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id B757F494;
	Sun,  1 Mar 2015 13:54:20 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Sun,  1 Mar 2015 13:54:16 +0100
Message-Id: <1425214456-12241-3-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1425214456-12241-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1425214456-12241-1-git-send-email-alexandre.belloni@free-electrons.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] wic: rawcopy: support skipping
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
X-List-Received-Date: Sun, 01 Mar 2015 12:54:26 -0000

Add support for skipping the beginning of a file with the rawcopy
plugin.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 scripts/lib/wic/plugins/source/rawcopy.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index b3b55fa022eb..cf6236a04f91 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -64,14 +64,21 @@ class RawCopyPlugin(SourcePlugin):
             return
 
         src = os.path.join(bootimg_dir, source_params['file'])
+        dst = src
+
+        if ('skip' in source_params):
+            dst = os.path.join(cr_workdir, source_params['file'])
+            dd_cmd = "dd if=%s of=%s ibs=%s skip=1 conv=notrunc" % \
+                    (src, dst, source_params['skip'])
+            exec_cmd(dd_cmd)
 
         # get the size in the right units for kickstart (kB)
-        du_cmd = "du -Lbks %s" % src
+        du_cmd = "du -Lbks %s" % dst
         out = exec_cmd(du_cmd)
         filesize = out.split()[0]
 
         if filesize > part.size:
             part.size = filesize
 
-        part.source_file = src
+        part.source_file = dst
 
-- 
2.1.0


