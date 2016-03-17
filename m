Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 95CFF6FFD8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 11:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 2404D18183
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 8WIfqK3fZ7Ls
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:17 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 12DFA18180
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:17 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id F023F108C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:16 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id E52E9140F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:16 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id E39E31080
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:16 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u2HBEGF7026169
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:16 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u2HBEGVY026168
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2016 12:14:16 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 12:14:11 +0100
Message-Id: <deeb1003d6cab8584a7f9e3cb115577ef7965817.1458213205.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1458213205.git.pkj@axis.com>
References: <cover.1458213205.git.pkj@axis.com>
In-Reply-To: <cover.1458213205.git.pkj@axis.com>
References: <cover.1458213205.git.pkj@axis.com>
Subject: [PATCHv2 4/7] oe-init-build-env*: Make them actually return failures
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
X-List-Received-Date: Thu, 17 Mar 2016 11:14:19 -0000

If either of the internal scripts (oe-buildenv-internal and
oe-setup-builddir) failed, oe-init-build-env (and
oe-init-build-env-memres) would still return success.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 oe-init-build-env        | 10 +++++++---
 oe-init-build-env-memres | 10 +++++++---
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/oe-init-build-env b/oe-init-build-env
index 0b4df1b..5fe68d1 100755
--- a/oe-init-build-env
+++ b/oe-init-build-env
@@ -48,11 +48,15 @@ fi
 unset THIS_SCRIPT
 
 export OEROOT
-. $OEROOT/scripts/oe-buildenv-internal && \
-    TEMPLATECONF="$TEMPLATECONF" $OEROOT/scripts/oe-setup-builddir && \
-    [ -n "$BUILDDIR" ] && cd "$BUILDDIR"
+. $OEROOT/scripts/oe-buildenv-internal &&
+    TEMPLATECONF="$TEMPLATECONF" $OEROOT/scripts/oe-setup-builddir || {
+    unset OEROOT
+    return 1
+}
 unset OEROOT
 
+[ -z "$BUILDDIR" ] || cd "$BUILDDIR"
+
 # Shutdown any bitbake server if the BBSERVER variable is not set
 if [ -z "$BBSERVER" ] && [ -f bitbake.lock ]; then
     grep ":" bitbake.lock > /dev/null && BBSERVER=$(cat bitbake.lock) bitbake --status-only
diff --git a/oe-init-build-env-memres b/oe-init-build-env-memres
index 9d393f5..9e1425e 100755
--- a/oe-init-build-env-memres
+++ b/oe-init-build-env-memres
@@ -56,11 +56,15 @@ fi
 unset THIS_SCRIPT
 
 export OEROOT
-. $OEROOT/scripts/oe-buildenv-internal && \
-    TEMPLATECONF="$TEMPLATECONF" $OEROOT/scripts/oe-setup-builddir && \
-    [ -n "$BUILDDIR" ] && cd "$BUILDDIR"
+. $OEROOT/scripts/oe-buildenv-internal &&
+    TEMPLATECONF="$TEMPLATECONF" $OEROOT/scripts/oe-setup-builddir || {
+    unset OEROOT
+    return 1
+}
 unset OEROOT
 
+[ -z "$BUILDDIR" ] || cd "$BUILDDIR"
+
 res=1
 if [ -e bitbake.lock ] && grep : bitbake.lock > /dev/null; then
     BBSERVER=$(cat bitbake.lock) bitbake --status-only
-- 
2.1.0


