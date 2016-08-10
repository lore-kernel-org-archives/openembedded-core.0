Return-Path: <olof.johansson@axis.com>
X-Greylist: delayed 343 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 10 Aug 2016 07:44:27 UTC
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id E5B7D771F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 07:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 4E36C2E276
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 09:38:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id PqG+PFw8pjLM
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 09:38:43 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id C0B742E0C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 09:38:43 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id A1F511BF8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 09:38:43 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 961B51508
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 09:38:43 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by seth.se.axis.com (Postfix) with ESMTP id 92D1A3E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 09:38:43 +0200 (CEST)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id CCD099C09F; Wed, 10 Aug 2016 09:38:48 +0200 (CEST)
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Aug 2016 09:38:48 +0200
Message-Id: <1470814728-3908-1-git-send-email-olof.johansson@axis.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] sanity.bbclass: Only verify /bin/sh link if it's a link
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
X-List-Received-Date: Wed, 10 Aug 2016 07:44:30 -0000

If /bin/sh is a regular file (and not a symlink), we assume it's a
reasonable shell and allow it.

Signed-off-by: Olof Johansson <olof.johansson@axis.com>
---
 meta/classes/sanity.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 088dd2a..98345ce 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -932,10 +932,11 @@ def check_sanity_everybuild(status, d):
         with open(checkfile, "w") as f:
             f.write(tmpdir)
 
-    # Check /bin/sh links to dash or bash
-    real_sh = os.path.realpath('/bin/sh')
-    if not real_sh.endswith('/dash') and not real_sh.endswith('/bash'):
-        status.addresult("Error, /bin/sh links to %s, must be dash or bash\n" % real_sh)
+    # If /bin/sh is a symlink, check that it points to dash or bash
+    if os.path.islink('/bin/sh'):
+        real_sh = os.path.realpath('/bin/sh')
+        if not real_sh.endswith('/dash') and not real_sh.endswith('/bash'):
+            status.addresult("Error, /bin/sh links to %s, must be dash or bash\n" % real_sh)
 
 def check_sanity(sanity_data):
     class SanityStatus(object):
-- 
2.1.4


