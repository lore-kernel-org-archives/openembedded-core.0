Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ULE5T-0007Lt-Gj
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 15:46:07 +0100
Received: by mail-pa0-f43.google.com with SMTP id hz11so1558469pad.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2013 07:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=LkGS5UawgOwtzYgsiqZ7OQce7+NUKP9Qi+Om/G9fOuA=;
	b=Sw1nal1CTWEmHG+1xVCAZUpckcMW2ysCF4zkz2qDRinHRMFf9YCojBXg1Ow+wJcfPs
	wwdoKON4xMXjLVW2mx1ig/QqNrpxSo+EtNBDYwPN85Umcqd928SbBDVVM1XcmVzE9vDh
	ehae1qiBBkDmr6RLDlQDMbkfCqQFn64K/wnYixYw9zV7nkK8+/61moLc7YMIHkIzFuTU
	FXQsxzy5a6vBxBkmv7oLSEKdJFE63J9f9fACRqplgmuDpd6m/Ut0z24FzjpJczZpllY2
	FDjJoAPyDhPoUi7yVUryLsuu33ZHtQsaspBkMMoE/Tf5uUPozML6ZTH0Cnogqw2O7EPx
	YaWw==
X-Received: by 10.68.194.8 with SMTP id hs8mr35422477pbc.44.1364480931982;
	Thu, 28 Mar 2013 07:28:51 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id in5sm25755658pbc.20.2013.03.28.07.28.49
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 07:28:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Mar 2013 15:28:41 +0100
Message-Id: <1364480921-19234-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH] update-rc.d, systemd: redirect also stderr from type
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Mar 2013 14:46:08 -0000

* different shells different behavior?
  bash prints 'type: update-rc.d: not found' on stderr
  busybox's sh on stdout
---
 meta/classes/systemd.bbclass     | 4 ++--
 meta/classes/update-rc.d.bbclass | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 42fa554..69eeb9e 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -27,7 +27,7 @@ if [ -n "$D" ]; then
     OPTS="--root=$D"
 fi
 
-if type systemctl >/dev/null; then
+if type systemctl >/dev/null 2>/dev/null; then
 	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
 
 	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
@@ -37,7 +37,7 @@ fi
 }
 
 systemd_prerm() {
-if type systemctl >/dev/null; then
+if type systemctl >/dev/null 2>/dev/null; then
 	if [ -z "$D" ]; then
 		systemctl stop ${SYSTEMD_SERVICE}
 	fi
diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 9f1e28a..0c2b94a 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -18,7 +18,7 @@ if test "x$D" != "x"; then
 else
 	OPT="-s"
 fi
-if type update-rc.d >/dev/null; then
+if type update-rc.d >/dev/null 2>/dev/null; then
 	update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
 fi
 }
@@ -35,7 +35,7 @@ if test "$D" != ""; then
 else
 	OPT=""
 fi
-if type update-rc.d >/dev/null; then
+if type update-rc.d >/dev/null 2>/dev/null; then
 	update-rc.d $OPT ${INITSCRIPT_NAME} remove
 fi
 }
-- 
1.8.1.5



