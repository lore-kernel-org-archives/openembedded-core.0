Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7FDFA0C5E
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 08:48:55 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40280.1776415732595640393
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 01:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bTfOuQgV;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C34D64E42A22
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 08:48:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A6E460497
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 08:48:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 174E21046087D;
	Fri, 17 Apr 2026 10:48:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776415726; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RpdJ/cNRL5AmR1ptitufvdHB0hyfYKl81wZE8vJZ8oo=;
	b=bTfOuQgVFoQNUkEo+pyGrl1SlYOQC7TFxF21XlCVU5VuE6HbEUj2tiPGegA8mYTStX3kPT
	OFKQRMeTyj8A68beyrLHuzP1L2PzYMbrVAzeajpf76TrDL5xbyiJHWtJYrhuTt9RlUHRr+
	VrD1eX2qVKepTR2E6zc/1qoRYfwuC1DUGOiHdPfSrHOhb74rIVfk8KcY2Li01dFlN+TEcK
	lTIoib2aRktW6hkWrctpzmTb6tCi7EZr0mnNMf/K+rM63Aq9AN1CytG1V8o1oAwLw+nIzk
	iiKqIg/JqkcRwiB+YWuqNYWNAO7Gmqbx62BCeN2oIEmwpIP1W0xPKNeiHpo9JA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 17 Apr 2026 10:48:23 +0200
Subject: [PATCH 2/2] python3: Simplify ptest exclusion list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-mathieu-python3-ptest-v1-2-9b5ec044a1b8@bootlin.com>
References: <20260417-mathieu-python3-ptest-v1-0-9b5ec044a1b8@bootlin.com>
In-Reply-To: <20260417-mathieu-python3-ptest-v1-0-9b5ec044a1b8@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776415716; l=2166;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=gv96dgzPMNSPJuTpYhAwXC8+NMjJOlFbatsEEXgCKG4=;
 b=uNZZ+YDH//ZT/4WdEcj98br0rkNv63YEFcxmHQCuhnO6yq9C6eqzWq5c5MpWL0MXIhnVu0BmL
 5TzlK2dlOwcCSM3bK9/CGFKeVOuFVWH1HeKw7eBAHRzwmO412FGEdrY
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 08:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235495

Makes the exclusion list a bit more readable, avoiding very long sed
expression lines.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-devtools/python/python3_3.14.4.bb | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.14.4.bb b/meta/recipes-devtools/python/python3_3.14.4.bb
index a5f7cbc66f05..9f958532cba2 100644
--- a/meta/recipes-devtools/python/python3_3.14.4.bb
+++ b/meta/recipes-devtools/python/python3_3.14.4.bb
@@ -251,12 +251,21 @@ do_install:append:class-nativesdk () {
     create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
 }
 
-do_install_ptest:append () {
-    sed -i -e 's|SKIPPED_TESTS=|SKIPPED_TESTS="--ignore test.test_os.test_os.TimerfdTests.test_timerfd_TFD_TIMER_ABSTIME"|' ${D}${PTEST_PATH}/run-ptest
-}
+SKIPPED_TESTS = "--ignore test.test_os.test_os.TimerfdTests.test_timerfd_TFD_TIMER_ABSTIME"
+SKIPPED_TESTS:append:class-target:libc-musl = " \
+    -x test__locale \
+    -x test_c_locale_coercion \
+    -x test_locale \
+    -x test_os test_re \
+    -x test__xxsubinterpreters \
+    -x test_threading \
+    --ignore test.test_strptime.StrptimeTests.test_date_locale2 \
+    --ignore test.test_ctypes.test_dlerror.TestNullDlsym.test_null_dlsym \
+"
 
-do_install_ptest:append:class-target:libc-musl () {
-    sed -i -e 's|SKIPPED_TESTS=|SKIPPED_TESTS="-x test__locale -x test_c_locale_coercion -x test_locale -x test_os test_re -x test__xxsubinterpreters -x test_threading --ignore test.test_strptime.StrptimeTests.test_date_locale2 --ignore test.test_ctypes.test_dlerror.TestNullDlsym.test_null_dlsym --ignore test.test_os.test_os.TimerfdTests.test_timerfd_TFD_TIMER_ABSTIME"|' ${D}${PTEST_PATH}/run-ptest
+
+do_install_ptest:append () {
+    sed -i -e "s|SKIPPED_TESTS=|SKIPPED_TESTS=\"${SKIPPED_TESTS}\"|" ${D}${PTEST_PATH}/run-ptest
 }
 
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " provide_target_config_script"

-- 
2.47.3


