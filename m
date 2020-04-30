Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.1491.1588269001207522675
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 10:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=a9XMUbVX;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1448; q=dns/txt; s=axis-central1;
  t=1588269001; x=1619805001;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ATKdJpE2w2SR3pKCpKk0A7BVD6Z08rFCrROqiu+9jlE=;
  b=a9XMUbVXHdlOcEZMbyhteV/atcFChvMZ5GvO32TNES/UDLCcS206oX8J
   WIdQQIT8tir8XzwCTipOs1lAjirp+HpzPsZ3nxNqSoTSvIudVjv1OWGWB
   ofzz1MM7IuUQrPv6tgX1cyZRFot+U9ocQkANwKHQO5daOjB3ohrhKxWAp
   CrZUlEoSG8Oej8mHgKTohSpTDPgR8G6aIas2/XMHJPjoavF0DxvTbiTNm
   aCwwNvIQ/I1haBYH7/pU7p22gDByNUHleM1PN0IP6JL2Ve3Gjgr5WRVfH
   8+G/5BWC1dmm2bKuYMqtYoSaRSAW35lT0hHgBYrRPNmJaGVTeIx6KQwTq
   Q==;
IronPort-SDR: o3YaKbpleBN+JmEobViMzCaCdhvIAMJui3DwcpxgL7w7eZJysNxxxYHP1zlg01X2JBfw45aI1d
 snEZ+RuhFdLecmKuS0jH1TvWqYlmZJLoUqnzmDMjoJBhxmP/JTcPIWwvWMQfHe/jWGJhVKB6Yl
 B26L+DzCY2BluYtpBA1vKgkfNOrqibsqmZoXe725FAI1Ikl5/su2VhO9K+jIaC8V5PUD4K2pd3
 EuC3Z0karUhqX9JHD/HhjeSh58iIdXYveB4KBZ4A/QL7+IUxjIJSWtoN6aHNg+GlgEnWcmgaaZ
 jso=
X-IronPort-AV: E=Sophos;i="5.73,336,1583190000"; 
   d="scan'208";a="8276533"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [master][dunfell][PATCH] sstate.bbclass: Do not fail if files cannot be touched
Date: Thu, 30 Apr 2020 19:49:55 +0200
Message-ID: <20200430174955.10464-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

It may be that a file is not allowed to be touched, e.g., if it is a
symbolic link into a global sstate cache served over NFS.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/sstate.bbclass | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index c73c3b42a7..aa9c30b4e1 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -690,7 +690,10 @@ def sstate_package(ss, d):
     if not os.path.exists(siginfo):
         bb.siggen.dump_this_task(siginfo, d)
     else:
-        os.utime(siginfo, None)
+        try:
+            os.utime(siginfo, None)
+        except PermissionError:
+            pass
 
     return
 
@@ -776,7 +779,7 @@ sstate_task_postfunc[dirs] = "${WORKDIR}"
 sstate_create_package () {
 	# Exit early if it already exists
 	if [ -e ${SSTATE_PKG} ]; then
-		touch ${SSTATE_PKG}
+		[ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
 		return
 	fi
 
@@ -810,7 +813,7 @@ sstate_create_package () {
 	else
 		rm $TFILE
 	fi
-	touch ${SSTATE_PKG}
+	[ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
 }
 
 python sstate_sign_package () {
@@ -1122,7 +1125,11 @@ python sstate_eventhandler() {
         if not os.path.exists(siginfo):
             bb.siggen.dump_this_task(siginfo, d)
         else:
-            os.utime(siginfo, None)
+            try:
+                os.utime(siginfo, None)
+            except PermissionError:
+                pass
+
 }
 
 SSTATE_PRUNE_OBSOLETEWORKDIR ?= "1"
-- 
2.21.1

