Return-Path: <daniel@lublin.se>
Received: from eltanin.uberspace.de (eltanin.uberspace.de [185.26.156.28])
	by mail.openembedded.org (Postfix) with ESMTP id 591CE60103
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 06:02:27 +0000 (UTC)
Received: (qmail 1761 invoked from network); 31 May 2017 06:02:28 -0000
Received: from localhost (HELO ot.localdomain) (127.0.0.1)
	by eltanin.uberspace.de with SMTP; 31 May 2017 06:02:28 -0000
Received: by ot.localdomain (Postfix, from userid 1000)
	id 3A6DB83D66; Wed, 31 May 2017 08:02:25 +0200 (CEST)
From: Daniel Lublin <daniel@lublin.se>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2017 08:02:20 +0200
Message-Id: <307a54feb37d697e55a87c54a0504cf3dd4b8749.1496210540.git.daniel@lublin.se>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <809a5f4b005795fd76e2f2b198852ae8a0072022.1496143079.git.daniel@lublin.se>
References: <809a5f4b005795fd76e2f2b198852ae8a0072022.1496143079.git.daniel@lublin.se>
Subject: [PATCH v2] devtool: deploy-target: Don't use find -exec
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
X-List-Received-Date: Wed, 31 May 2017 06:02:30 -0000

find may be provided by busybox, which might be compiled without support
for -exec.

Signed-off-by: Daniel Lublin <daniel@lublin.se>
---
 scripts/lib/devtool/deploy.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index b3730ae833..d181135a9d 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -119,7 +119,11 @@ def _prepare_remote_script(deploy, verbose=False, dryrun=False, undeployall=Fals
         # Put any preserved files back
         lines.append('if [ -d $preservedir ] ; then')
         lines.append('    cd $preservedir')
-        lines.append('    find . -type f -exec mv {} /{} \;')
+        # find from busybox might not have -exec, so we don't use that
+        lines.append('    find . -type f | while read file')
+        lines.append('    do')
+        lines.append('        mv $file /$file')
+        lines.append('    done')
         lines.append('    cd /')
         lines.append('    rm -rf $preservedir')
         lines.append('fi')
-- 
2.13.0


