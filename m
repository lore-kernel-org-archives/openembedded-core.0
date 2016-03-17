Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A011A6067D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 11:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id D492C1816C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id M7sKyvRMo9mZ
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:17 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 214CC18183
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:17 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 0B0C61426
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:17 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 08FD61413
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:17 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 076E91080
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:17 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u2HBEHg7026177
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:17 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u2HBEGrg026176
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2016 12:14:16 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 12:14:13 +0100
Message-Id: <b73830241203674b7d5cd445749b61511cda051f.1458213205.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1458213205.git.pkj@axis.com>
References: <cover.1458213205.git.pkj@axis.com>
In-Reply-To: <cover.1458213205.git.pkj@axis.com>
References: <cover.1458213205.git.pkj@axis.com>
Subject: [PATCHv2 6/7] oe-buildenv-internal: Add variables individually to BB_ENV_EXTRAWHITE
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
X-List-Received-Date: Thu, 17 Mar 2016 11:14:18 -0000

Instead of adding all variables to BB_ENV_EXTRAWHITE as one, treat
them separately and add them one by one as needed.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/oe-buildenv-internal | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 85f82f1..354501e 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -108,13 +108,29 @@ unset BITBAKEDIR newpath
 export BUILDDIR
 export PATH
 
-BB_ENV_EXTRAWHITE_OE="MACHINE DISTRO TCMODE TCLIBC HTTP_PROXY http_proxy \
+add_extrawhite() {
+    # If the current shell is zsh, then temporarily set it to emulate sh in this
+    # function so that the for and case statements below work as expected.
+    [ -z "$ZSH_NAME" ] || emulate -L sh
+
+    local extrawhite="MACHINE DISTRO TCMODE TCLIBC HTTP_PROXY http_proxy \
 HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy FTPS_PROXY ftps_proxy ALL_PROXY \
 all_proxy NO_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY \
 SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE GIT_PROXY_COMMAND \
 SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR"
 
-echo "$BB_ENV_EXTRAWHITE" | grep -q "${BB_ENV_EXTRAWHITE_OE}"
-if [ $? != 0 ]; then
-     export BB_ENV_EXTRAWHITE="${BB_ENV_EXTRAWHITE_OE} $BB_ENV_EXTRAWHITE"
-fi
+    local var
+    for var in $extrawhite; do
+        case " $BB_ENV_EXTRAWHITE " in
+            *[[:blank:]]$var[[:blank:]]*)
+                ;;
+            *)
+                BB_ENV_EXTRAWHITE="${BB_ENV_EXTRAWHITE:+$BB_ENV_EXTRAWHITE }$var"
+                ;;
+        esac
+    done
+}
+
+add_extrawhite
+unset -f add_extrawhite
+export BB_ENV_EXTRAWHITE
-- 
2.1.0


