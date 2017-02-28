Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B6D3A72FA8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 13:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id EA3EE181EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id gSb2tSqigXgQ
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:21 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 278131834A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:21 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 182841E141
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:21 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C4591E13E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:21 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:21 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 00E3F20E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:21 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v1SDZKGb019122
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:20 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v1SDZKgc019121
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2017 14:35:20 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2017 14:35:19 +0100
Message-Id: <277376781a86a2ca0ec81dd296a7db0f763da691.1488288835.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1488288835.git.pkj@axis.com>
References: <cover.1488288835.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 4/4] scripts/pkg-config: Add a dummy version that always fails
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
X-List-Received-Date: Tue, 28 Feb 2017 13:35:23 -0000

This is intended to catch missing dependencies on the real version.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/pkg-config | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100755 scripts/pkg-config

diff --git a/scripts/pkg-config b/scripts/pkg-config
new file mode 100755
index 0000000..c6376ec
--- /dev/null
+++ b/scripts/pkg-config
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+# This is a dummy version that always fails. It is intended to catch
+# missing dependencies on the real version.
+
+myname=${0##*/}
+
+echo "The correct version of $myname is not being used!" >&2
+echo "Make sure the recipe inherits 'pkgconfig'." >&2
+
+# Return something that will make the compiler barf. This is for when
+# pkg-config is used directly in a Makefile in a construct like:
+# CFLAGS += $(shell pkg-config --cflags glib-2.0)
+echo "The-correct-version-of-$myname-is-not-being-used"
+
+exit 1
-- 
2.9.0


