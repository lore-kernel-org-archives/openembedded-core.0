Return-Path: <tobias.henkel@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 2A0806D8C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 08:34:03 +0000 (UTC)
Received: from duffman.bmw-carit.intra (duffman.bmw-carit.intra
	[192.168.101.67])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: tobias.henkel)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id EAEBA4032E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 08:05:21 +0100 (CET)
From: Tobias Henkel <tobias.henkel@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2013 09:34:03 +0100
Message-Id: <1384245243-20247-10-git-send-email-tobias.henkel@oss.bmw-carit.de>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1384245243-20247-1-git-send-email-tobias.henkel@oss.bmw-carit.de>
References: <1384245243-20247-1-git-send-email-tobias.henkel@oss.bmw-carit.de>
Subject: [PATCH 9/9] icecc: Fix race condition when packaging toolchain
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
X-List-Received-Date: Tue, 12 Nov 2013 08:34:04 -0000

From: Tobias Henkel <tobias.henkel@bmw-carit.de>

In the current implementation there can be a race condition while
creating the toolchain archive causing the build to break.

This is fixed by locking the toolchain archiving step using flock.

Signed-off-by: Tobias Henkel <tobias.henkel@bmw-carit.de>
---
 meta/classes/icecc.bbclass | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index e3b05ac..970c557 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -202,6 +202,21 @@ def icc_get_and_check_tool(bb, d, tool):
     else:
         return t
 
+wait_for_file() {
+    local TIME_ELAPSED=0
+    local FILE_TO_TEST=$1
+    local TIMEOUT=$2
+    until [ -f "$FILE_TO_TEST" ]
+    do
+        TIME_ELAPSED=`expr $TIME_ELAPSED + 1`
+        if [ $TIME_ELAPSED -gt $TIMEOUT ]
+        then
+            return 1
+        fi
+        sleep 1
+    done
+}
+
 def set_icecc_env():
     # dummy python version of set_icecc_env
     return
@@ -247,10 +262,22 @@ set_icecc_env() {
         ICECC_AS="`which as`"
     fi
 
-    if [ ! -r "${ICECC_VERSION}" ]
+    if [ ! -f "${ICECC_VERSION}.done" ]
     then
         mkdir -p "`dirname "${ICECC_VERSION}"`"
-        ${ICECC_ENV_EXEC} "${ICECC_CC}" "${ICECC_CXX}" "${ICECC_AS}" "${ICECC_VERSION}"
+
+        # the ICECC_VERSION generation step must be locked by a mutex
+        # in order to prevent race conditions
+        if flock -n "${ICECC_VERSION}.lock" \
+            ${ICECC_ENV_EXEC} "${ICECC_CC}" "${ICECC_CXX}" "${ICECC_AS}" "${ICECC_VERSION}"
+        then
+            touch "${ICECC_VERSION}.done"
+        elif [ ! wait_for_file "${ICECC_VERSION}.done" 30 ]
+        then
+            # locking failed so wait for ${ICECC_VERSION}.done to appear
+            bbwarn "Timeout waiting for ${ICECC_VERSION}.done"
+            return
+        fi
     fi
 
     export ICECC_VERSION ICECC_CC ICECC_CXX
-- 
1.8.3.1


