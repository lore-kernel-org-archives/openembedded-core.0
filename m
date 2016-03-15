Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E35871957
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 17:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 07D5E18122
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id OrJyj0e+G-HL
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:14 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 2170118131
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:14 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 0A36414E2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:14 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id F304414BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:13 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id F19D3106C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:13 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u2FHhDTV014458
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:13 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u2FHhDYO014457
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2016 18:43:13 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2016 18:43:09 +0100
Message-Id: <46123929a25e4db39a633017dcad1c82944a4dd2.1458063686.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1458063686.git.pkj@axis.com>
References: <cover.1458063686.git.pkj@axis.com>
In-Reply-To: <cover.1458063686.git.pkj@axis.com>
References: <cover.1458063686.git.pkj@axis.com>
Subject: [PATCH 4/6] oe-buildenv-internal: Add paths to $PATH individually
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
X-List-Received-Date: Tue, 15 Mar 2016 17:43:18 -0000

Instead of assuming that the path to the scripts directory always is
in $PATH directly before the bitbake directory, treat them as separate
paths and add them individually to $PATH.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/oe-buildenv-internal | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 457763b..cf33c49 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -95,9 +95,14 @@ if ! (test -d "$BITBAKEDIR"); then
 fi
 
 # Make sure our paths are at the beginning of $PATH
-NEWPATHS="${OEROOT}/scripts:$BITBAKEDIR/bin:"
-PATH=$NEWPATHS$(echo $PATH | sed -e "s|:$NEWPATHS|:|g" -e "s|^$NEWPATHS||")
-unset BITBAKEDIR NEWPATHS
+for newpath in "$BITBAKEDIR/bin" "$OEROOT/scripts"; do
+    # Remove any existences of $newpath from $PATH
+    PATH=$(echo $PATH | sed -re "s#:$newpath(:|$)#\1#g" -e "s#^$newpath:##")
+
+    # Add $newpath to $PATH
+    PATH="$newpath:$PATH"
+done
+unset BITBAKEDIR newpath
 
 # Used by the runqemu script
 export BUILDDIR
-- 
2.1.0


