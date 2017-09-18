Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob04.registeredsite.com (atl4mhob04.registeredsite.com
	[209.17.115.42])
	by mail.openembedded.org (Postfix) with ESMTP id B38D878282
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 14:07:20 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.205])
	by atl4mhob04.registeredsite.com (8.14.4/8.14.4) with ESMTP id
	v8IE7IcR029421
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 10:07:18 -0400
Received: (qmail 1232 invoked by uid 0); 18 Sep 2017 14:07:18 -0000
X-TCPREMOTEIP: 37.74.225.130
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@37.74.225.130)
	by 0 with ESMTPA; 18 Sep 2017 14:07:18 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Sep 2017 16:07:14 +0200
Message-Id: <1505743634-13500-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
	<CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
In-Reply-To: <CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>, peter.kjellerstedt@axis.com
Subject: [PATCH] base-files: profile: Get rid of "resize"
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
X-List-Received-Date: Mon, 18 Sep 2017 14:07:20 -0000

The "resize" command actually outputs shell commands to be executed, for
example:

$ resize
COLUMNS=102;
LINES=27;
export COLUMNS LINES;

The output of "resize" is being discarded to /dev/null so the call has no
effect whatsoever, and does not change the environment (it cannot change the
environment of its parent). Remove the call and hence solve the messages
about shells missing "command" or "tty" or "resize".

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/recipes-core/base-files/base-files/profile | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index a062028..cfd0d69 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -20,15 +20,6 @@ if [ -d /etc/profile.d ]; then
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
-
 export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
 
 umask 022
-- 
1.9.1


