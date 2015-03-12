Return-Path: <fabrice.coulon@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id F178773899
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 14:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 85584181E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 15:37:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 1-p5W+sNwL+9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 15:37:12 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id D578B181CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 15:37:12 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id BE01610CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 15:37:12 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id B291CB9D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 15:37:12 +0100 (CET)
Received: from lnxfabrice2.se.axis.com (lnxfabrice2.se.axis.com [10.92.161.3])
	by seth.se.axis.com (Postfix) with ESMTP id AEEAB3E049;
	Thu, 12 Mar 2015 15:37:12 +0100 (CET)
Received: by lnxfabrice2.se.axis.com (Postfix, from userid 9523)
	id BF4F2800A09; Thu, 12 Mar 2015 15:37:05 +0100 (CET)
From: Fabrice Coulon <fabrice.coulon@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2015 15:36:55 +0100
Message-Id: <1426171015-4412-1-git-send-email-fabrice.coulon@axis.com>
X-Mailer: git-send-email 1.9.1
Cc: Fabrice Coulon <fabrice@axis.com>
Subject: [PATCH] meta/lib/oe/package.py: fix files ownership in packages
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
X-List-Received-Date: Thu, 12 Mar 2015 14:37:14 -0000

This fix solves the problem with the ownership of files in packages.
The do_install task was producing correct and expected output but when
the files were being put in, e.g. a rpm package, the ownership could
be different than that in the do_install task.

[YOCTO #7428]

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Fabrice Coulon <fabrice.coulon@axis.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 7c728fc..8bc56c6 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -31,7 +31,7 @@ def runstrip(arg):
         extraflags = "--remove-section=.comment --remove-section=.note"
 
     # Use mv to break hardlinks
-    stripcmd = "'%s' %s '%s' -o '%s.tmp' && mv '%s.tmp' '%s'" % (strip, extraflags, file, file, file, file)
+    stripcmd = "'%s' %s '%s' -o '%s.tmp' && chown --reference='%s' '%s.tmp' && mv '%s.tmp' '%s'" % (strip, extraflags, file, file, file, file, file, file)
     bb.debug(1, "runstrip: %s" % stripcmd)
 
     ret = subprocess.call(stripcmd, shell=True)
-- 
1.9.1


