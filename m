Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id E41AB605F1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 10:27:17 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id E96D2A96; Tue,  7 Apr 2015 12:22:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (ti0091a430-0778.bb.online.no [88.89.40.20])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 878DC2C0;
	Tue,  7 Apr 2015 12:22:27 +0200 (CEST)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Apr 2015 12:21:58 +0200
Message-Id: <1428402119-31945-1-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.1.0
Subject: [wic][PATCH 1/2] wic: rawcopy: ensure comparison is done on int
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
X-List-Received-Date: Tue, 07 Apr 2015 10:27:18 -0000

The size comparison may fail because it is done on strings rather than
integers.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 scripts/lib/wic/plugins/source/rawcopy.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index cf6236a04f91..ba7fda787ed7 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -77,7 +77,7 @@ class RawCopyPlugin(SourcePlugin):
         out = exec_cmd(du_cmd)
         filesize = out.split()[0]
 
-        if filesize > part.size:
+        if int(filesize) > int(part.size):
             part.size = filesize
 
         part.source_file = dst
-- 
2.1.0


