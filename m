Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A12E778A8B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 18:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 0BDDF1831E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 96s4ayla1DjB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:03 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 01BD418595
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:02 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CFA9C1A064
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:01 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C41061A05C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:01 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:01 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id B83932A3F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:01 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w6JIJn3N007514
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:19:49 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w6JIJnXA007513
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2018 20:19:49 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2018 20:19:40 +0200
Message-Id: <ddef6ea7b6fa3c67f97b8318d2c4a01f1c4b3887.1532024250.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1532024250.git.pkj@axis.com>
References: <cover.1532024250.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 3/3] base-files: profile: Avoid using "command" to determine if programs exist
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
X-List-Received-Date: Thu, 19 Jul 2018 18:20:04 -0000

Since the existence of "command" in itself is not guaranteed, using it
to determine if other executables exist is moot. Instead just run the
executables and let the shell determine if they exist. By piping stderr
to /dev/null we avoid unnecessary warnings in case they do not exist.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/base-files/base-files/profile | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index a062028226..e14cb2d878 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -20,14 +20,16 @@ if [ -d /etc/profile.d ]; then
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
+# /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher which tries do
+# use ssh
+case $(tty 2>/dev/null) in
+	# The first invocation of resize verifies that it exists, the second
+	# does the actual resizing. This is due to that resize uses stderr to
+	# determine the size of the tty, which does not work if it is redirected
+	# to /dev/null.
+	/dev/tty[A-z]*) resize >/dev/null 2>&1 && resize >/dev/null;;
+esac
 
 export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
 
-- 
2.12.0


