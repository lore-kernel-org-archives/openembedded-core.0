Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob06.registeredsite.com (atl4mhob06.registeredsite.com
	[209.17.115.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8F48071C9A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 08:39:30 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.211])
	by atl4mhob06.registeredsite.com (8.14.4/8.14.4) with ESMTP id
	v8I8dUVq007353
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 04:39:30 -0400
Received: (qmail 19597 invoked by uid 0); 18 Sep 2017 08:39:30 -0000
X-TCPREMOTEIP: 37.74.225.130
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@37.74.225.130)
	by 0 with ESMTPA; 18 Sep 2017 08:39:30 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Sep 2017 10:39:25 +0200
Message-Id: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH 1/2] base-files: profile: Do not assume that the 'command' command exists
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
X-List-Received-Date: Mon, 18 Sep 2017 08:39:31 -0000

The "command" shell command appears to be a bashism, the standard
busybox shell doesn't implement it.

This avoids the following error when logging in to a host that does
not have the 'command' command:

    -sh: command: not found

It also simplifies the code and reduces the number of forks.

Fixes: e77cdb761169e404556487ac650dc562000da406
Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/recipes-core/base-files/base-files/profile | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index ceaf15f..b5b533c 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -22,14 +22,12 @@ if [ -d /etc/profile.d ]; then
 	unset i
 fi
 
-if command -v resize >/dev/null && command -v tty >/dev/null; then
-	# Make sure we are on a serial console (i.e. the device used starts with
-	# /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher which
-	# tries do use ssh
-	case $(tty) in
-		/dev/tty[A-z]*) resize >/dev/null;;
-	esac
-fi
+# Make sure we are on a serial console (i.e. the device used starts with
+# /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher which
+# tries do use ssh
+case $(tty 2>/dev/null) in
+	/dev/tty[A-z]*) resize >/dev/null;;
+esac
 
 export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
 
-- 
1.9.1


