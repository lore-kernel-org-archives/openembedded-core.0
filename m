Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 12EE077E1B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 12:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id DEC8D2E2C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:24:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id UMP59ybTxPzZ
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:23:59 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 42F592E5A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:23:59 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 327F31E081
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:23:59 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 27CF01E083
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:23:59 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:23:59 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 1C7C73206
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:23:59 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v3DCNxJq013628
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:23:59 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v3DCNxEQ013627
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Apr 2017 14:23:59 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Apr 2017 14:23:57 +0200
Message-Id: <376f2a8be2bdd923d633fbcacaaa93bda3da06b4.1492086158.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1492086158.git.pkj@axis.com>
References: <cover.1492086158.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 1/1] base-files: profile: Avoid using "command" to determine if programs exist
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
X-List-Received-Date: Thu, 13 Apr 2017 12:24:00 -0000

Since the existence of "command" in itself is not guaranteed, using it
to determine if other executables exist is mote. Instead just run the
executables and let the shell determine if they exist. By piping stderr
to /dev/null we avoid unnecessary warnings in case they do not exist.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/base-files/base-files/profile | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index ceaf15f799..e05c8840db 100644
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
+# /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher which tries do
+# use ssh
+case $(tty 2>/dev/null) in
+	/dev/tty[A-z]*) resize >/dev/null 2>&1;;
+esac
 
 export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
 
-- 
2.12.0


