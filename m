Return-Path: <daniel@lublin.se>
X-Greylist: delayed 401 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 30 May 2017 11:24:49 UTC
Received: from eltanin.uberspace.de (eltanin.uberspace.de [185.26.156.28])
	by mail.openembedded.org (Postfix) with ESMTP id 0351C780B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 11:24:49 +0000 (UTC)
Received: (qmail 15461 invoked from network); 30 May 2017 11:18:09 -0000
Received: from localhost (HELO ot.localdomain) (127.0.0.1)
	by eltanin.uberspace.de with SMTP; 30 May 2017 11:18:09 -0000
Received: by ot.localdomain (Postfix, from userid 1000)
	id 84B1483D66; Tue, 30 May 2017 13:18:06 +0200 (CEST)
From: Daniel Lublin <daniel@lublin.se>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 May 2017 13:17:59 +0200
Message-Id: <809a5f4b005795fd76e2f2b198852ae8a0072022.1496143079.git.daniel@lublin.se>
X-Mailer: git-send-email 2.13.0
Cc: Daniel Lublin <daniel@lublin.se>
Subject: [PATCH] devtool: deploy-target: Let script continue even if rm fails
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
X-List-Received-Date: Tue, 30 May 2017 11:24:51 -0000

The remote script is run with `set -e`, so doing rm without -f on a
$file that is already gone will exit the whole script, failing any
redeployment. Assume a use case where packages sometimes produces
certain test binaries stored on volatile media (tmpfs), and where the
system is occasionally rebooted.

Signed-off-by: Daniel Lublin <daniel@lublin.se>
---
 scripts/lib/devtool/deploy.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index b3730ae833..cdc7db0b29 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -64,7 +64,7 @@ def _prepare_remote_script(deploy, verbose=False, dryrun=False, undeployall=Fals
         lines.append('                rmdir $file > /dev/null 2>&1 || true')
         lines.append('            fi')
         lines.append('        else')
-        lines.append('            rm $file')
+        lines.append('            rm -f $file')
         lines.append('        fi')
     lines.append('    done')
     if not dryrun:
-- 
2.13.0


