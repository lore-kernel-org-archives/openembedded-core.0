Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1SSAGG-00013V-C4
	for openembedded-core@openembedded.org; Wed, 09 May 2012 19:01:12 +0200
Received: (qmail 24594 invoked by uid 1003); 9 May 2012 16:44:24 -0000
Received: from unknown (HELO localhost.localdomain)
	(philip@balister.org@71.171.22.246)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	9 May 2012 16:44:24 -0000
From: Philip Balister <philip@balister.org>
To: openembedded-core@openembedded.org
Date: Wed,  9 May 2012 12:44:23 -0400
Message-Id: <1336581863-23833-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.3.4
Subject: Add option to oe-buildenv-internal script to change bitbake location.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2012 17:01:12 -0000

Having bitbake inside the oe-core is annoying to some people. This commit
adds a second option to the oe-init-build-env script.

Run like this:

. ./oe-init-build-env ../build ../bitbake

for example. Without the second option, the old behavior is preserved.

Signed-off-by: Philip Balister <philip@balister.org>
---
 scripts/oe-buildenv-internal |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 9de7b05..05c6cd8 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -54,7 +54,11 @@ else
 fi
 unset BDIR
 
-BITBAKEDIR="$OEROOT/bitbake$BBEXTRA/"
+if [ "x$2" = "x" ]; then
+    BITBAKEDIR="$OEROOT/bitbake$BBEXTRA/"
+else
+    BITBAKEDIR="$2"
+fi
 
 BITBAKEDIR=`readlink -f "$BITBAKEDIR"`
 BUILDDIR=`readlink -f "$BUILDDIR"`
-- 
1.7.3.4



