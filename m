Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60984F8DFF9
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 08:48:55 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40278.1776415727910438666
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 01:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aEj/yx/q;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 53CB14E42A22
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 08:48:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C23860497
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 08:48:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9DF661046097F;
	Fri, 17 Apr 2026 10:48:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776415721; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MaEgONEd4IKxCdVLP3EKl4b7nJ3GSSThGqvLkoqKHrY=;
	b=aEj/yx/qaTWpLLmZskfGKijo3RK+b8y04ezcThs/DJprzc/nh1O5CQUrGow8aZCDbMUim1
	3fhc6QAvB0fnkG2qXSFpHLThHKOYiqpmv6hif2FhkcYL968YMiRIGTL9rtiCO5Oeyo8sM4
	40Bvcki59RwbOuQBI1qdORK3oMB8VpABGD+Oq5bqR7hg8FYAlbkWMetB0JVT5so3nsvu9o
	RUUKfuYFXRC9op0zddGEAlLcjsp9ZV+2sunmX0Eh9yimalCuv447sQPtGgGowAmgRQEAvw
	Tv20GlfYOVusH/DDwL233OArrxXSEOlLO75OahlK9dbCAIA4SSxFhnvkjqdGBg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 17 Apr 2026 10:48:22 +0200
Subject: [PATCH 1/2] python3: exclude test_timerfd_TFD_TIMER_ABSTIME from
 ptest
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-mathieu-python3-ptest-v1-1-9b5ec044a1b8@bootlin.com>
References: <20260417-mathieu-python3-ptest-v1-0-9b5ec044a1b8@bootlin.com>
In-Reply-To: <20260417-mathieu-python3-ptest-v1-0-9b5ec044a1b8@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776415716; l=1909;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=8rrxnXzn9u56cAXvQCI9yoEuTkU8KPY/lqeR+8UG1fo=;
 b=oFp7CxCsTTXbrRp2D2Aqu+9Ca/R8ALEjNJ6Ftmwj4ONFH0pLMDWpXHlnek+MWXQcZgXEebMRY
 rFfIBN9KaaoB0qKczPVIkfwUQDr+pWfY8J39vG5n/a37/inygHXVPKq
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 08:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235494

This test tends to fail intermittently, probably when the qemu machine is
a bit too slow.

Fixes [YOCTO #15743]

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-devtools/python/python3_3.14.4.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.14.4.bb b/meta/recipes-devtools/python/python3_3.14.4.bb
index f48dbc699636..a5f7cbc66f05 100644
--- a/meta/recipes-devtools/python/python3_3.14.4.bb
+++ b/meta/recipes-devtools/python/python3_3.14.4.bb
@@ -251,8 +251,12 @@ do_install:append:class-nativesdk () {
     create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
 }
 
+do_install_ptest:append () {
+    sed -i -e 's|SKIPPED_TESTS=|SKIPPED_TESTS="--ignore test.test_os.test_os.TimerfdTests.test_timerfd_TFD_TIMER_ABSTIME"|' ${D}${PTEST_PATH}/run-ptest
+}
+
 do_install_ptest:append:class-target:libc-musl () {
-    sed -i -e 's|SKIPPED_TESTS=|SKIPPED_TESTS="-x test__locale -x test_c_locale_coercion -x test_locale -x test_os test_re -x test__xxsubinterpreters -x test_threading --ignore test.test_strptime.StrptimeTests.test_date_locale2 --ignore test.test_ctypes.test_dlerror.TestNullDlsym.test_null_dlsym"|' ${D}${PTEST_PATH}/run-ptest
+    sed -i -e 's|SKIPPED_TESTS=|SKIPPED_TESTS="-x test__locale -x test_c_locale_coercion -x test_locale -x test_os test_re -x test__xxsubinterpreters -x test_threading --ignore test.test_strptime.StrptimeTests.test_date_locale2 --ignore test.test_ctypes.test_dlerror.TestNullDlsym.test_null_dlsym --ignore test.test_os.test_os.TimerfdTests.test_timerfd_TFD_TIMER_ABSTIME"|' ${D}${PTEST_PATH}/run-ptest
 }
 
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " provide_target_config_script"

-- 
2.47.3


