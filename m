Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1910671C7E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 15:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 63C7718428
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:13:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id TgLt-lCWkfOi
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:13:11 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 0131A183BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:13:10 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFD161E086
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:13:10 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D521B1E083
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:13:10 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:13:10 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id C16251794
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:13:10 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v2KFDAhM023440
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:13:10 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v2KFDAds023438
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Mar 2017 16:13:10 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 16:13:08 +0100
Message-Id: <20170320151308.23291-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] gpgme: Avoid requiring a host C++ compiler with C++11 support
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
X-List-Received-Date: Mon, 20 Mar 2017 15:13:12 -0000

Building the C++ bindings for native requires a host C++ compiler with
C++11 support. Since these bindings are currently not needed, we can
disable them and thus avoid increasing the requirement for the host C++
compiler.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-support/gpgme/gpgme_1.8.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.8.0.bb b/meta/recipes-support/gpgme/gpgme_1.8.0.bb
index d3e7880a47..2756ef815d 100644
--- a/meta/recipes-support/gpgme/gpgme_1.8.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.8.0.bb
@@ -34,7 +34,11 @@ PACKAGECONFIG[python3] = ",,python3 swig-native,"
 # Supported: "cl cpp python python2 python3 qt"
 # python says 'search and find python2 or python3'
 
-LANGUAGES ?= "cpp"
+# Building the C++ bindings for native requires a C++ compiler with C++11
+# support. Since these bindings are currently not needed, we can disable them.
+DEFAULT_LANGUAGES = ""
+DEFAULT_LANGUAGES_class-target = "cpp"
+LANGUAGES ?= "${DEFAULT_LANGUAGES}"
 LANGUAGES .= "${@bb.utils.contains('PACKAGECONFIG', 'python2', ' python2', '', d)}"
 LANGUAGES .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', ' python3', '', d)}"
 
-- 
2.12.0


