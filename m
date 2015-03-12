Return-Path: <fabrice.coulon@axis.com>
X-Greylist: delayed 556 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 12 Mar 2015 08:07:20 UTC
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 33FE573B4F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 08:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 4F3C62E501
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 08:58:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id zdaai6ojjAqW
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 08:58:03 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id A440C2E4AC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 08:58:03 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 82AEE15EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 08:58:03 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 766D015EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 08:58:03 +0100 (CET)
Received: from lnxfabrice2.se.axis.com (lnxfabrice2.se.axis.com [10.92.161.3])
	by seth.se.axis.com (Postfix) with ESMTP id 7186C3E049;
	Thu, 12 Mar 2015 08:58:03 +0100 (CET)
Received: by lnxfabrice2.se.axis.com (Postfix, from userid 9523)
	id AFF69800259; Thu, 12 Mar 2015 08:57:56 +0100 (CET)
From: Fabrice Coulon <fabrice.coulon@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2015 08:57:24 +0100
Message-Id: <1426147044-31359-1-git-send-email-fabrice.coulon@axis.com>
X-Mailer: git-send-email 1.9.1
Cc: Fabrice Coulon <fabrice@axis.com>
Subject: [PATCH] meta/lib/oe/package.py: Fix for bug 7428
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
X-List-Received-Date: Thu, 12 Mar 2015 08:07:21 -0000

This fix solves the problem with the ownership of files in packages.
The do_install task was producing correct and expected output but when
the files were being put in, e.g. a rpm package, the ownership could
be different than that in the do_install task.

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


