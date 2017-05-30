Return-Path: <daniel@lublin.se>
Received: from eltanin.uberspace.de (eltanin.uberspace.de [185.26.156.28])
	by mail.openembedded.org (Postfix) with ESMTP id E7D317814B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 14:40:49 +0000 (UTC)
Received: (qmail 32680 invoked from network); 30 May 2017 14:40:48 -0000
Received: from localhost (HELO ot.localdomain) (127.0.0.1)
	by eltanin.uberspace.de with SMTP; 30 May 2017 14:40:48 -0000
Received: by ot.localdomain (Postfix, from userid 1000)
	id DC87383D66; Tue, 30 May 2017 16:40:46 +0200 (CEST)
From: Daniel Lublin <daniel@lublin.se>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 May 2017 16:40:43 +0200
Message-Id: <2c1e2d8665b76fcc438deeab9f98df1e15fd8053.1496155243.git.daniel@lublin.se>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH] devtool: deploy-target: Don't use find -exec
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
X-List-Received-Date: Tue, 30 May 2017 14:40:50 -0000

find may be provided by busybox, which might be compiled without support
for -exec.

Signed-off-by: Daniel Lublin <daniel@lublin.se>
---
 scripts/lib/devtool/deploy.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index b3730ae833..af367d2985 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -119,7 +119,10 @@ def _prepare_remote_script(deploy, verbose=False, dryrun=False, undeployall=Fals
         # Put any preserved files back
         lines.append('if [ -d $preservedir ] ; then')
         lines.append('    cd $preservedir')
-        lines.append('    find . -type f -exec mv {} /{} \;')
+        lines.append('    find . -type f | while read file')
+        lines.append('    do')
+        lines.append('        mv $file /$file')
+        lines.append('    done')
         lines.append('    cd /')
         lines.append('    rm -rf $preservedir')
         lines.append('fi')
-- 
2.13.0


