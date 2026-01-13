Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A16D2F33D
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 16:04:13 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62752.1768320245012406218
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 08:04:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VuIkSRQt;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-430fbb6012bso6237543f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 08:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768320243; x=1768925043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bsGsNM5XtV07sLLE2GZjF3Y8OkCa9Spd2uMe5qPDz+E=;
        b=VuIkSRQt0H8MfYeqFFL/9HHJyKTYaJoRyRadxERFZThM45k5Ke9r/7cqFYf6Zjwhx5
         54nL21scg6/rLAuUtKbqbV+0NQKKmOzKKd+GNurHWpPM/tj3nKrMFY/lyz7Vej9yKy9n
         jeJNWVfeMuhDZEsaUP/wxDZbWbh4teT3wjwBaUFjqy4AqV5POEkkaBeJPUPp7/xihdAQ
         ItYv/OaSepeTwbEcFH7OO/skOH9+uwdujYIxvcBH+4sK8ozoQVXKvANZi5p9/a+ZnHWN
         FjWgnSvM2OrBHK4M7S3fRi0ETpWwVR6H/K4uvnNrrlZ1bLjZS5aktT2bqtwlC1vPlSfe
         QjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768320243; x=1768925043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsGsNM5XtV07sLLE2GZjF3Y8OkCa9Spd2uMe5qPDz+E=;
        b=OFZOWOWrZnY4qrEDU9T1eAmInHd0q9YDtQH8Nd/3EHL8WTOA3Pp3uh39j6nI2ORhNp
         isgUOCAsU9YA+4VHhqbNFtTEv3UlAcSd+cUnXtrmE4X8TTTupuQqprqd4kJca8SsY5o0
         O5k8rO/zDgyxOqzTt/YWUdORiozeg6ISfpupSvBa3Atuq1H8Td+4cM4HcrZKwSi4eCbF
         dJPtg07iqgLCNteFiMPSYLx/cudxOxtmKaa5riVgP8rgoy58ez84wqV9bQ6+F1qGwTgG
         6e86o7TTYF/1VSNFzDOOpc7CV9eiBwTK4y531pvtLNx2sD4EzByvdJu3e/IqY90YrY53
         6C/w==
X-Gm-Message-State: AOJu0YyIC3NyDoZ4jGYMbzBSKQJhHPnusIvEZ9U0IHcMNlJDTja3anDM
	SHvhchFKxeraUmQcI2uR6QRj07h8mZVi4zcCDraAsDADEbTlEL0BmmC54nIUZRh0
X-Gm-Gg: AY/fxX4nnjtZu8dTTSVyThFZ4GoYkqil+N5J18vYucaSRACvUiOGi1RqOMppqZm9E2L
	wraezY7BzbS8mlfr+bkWm/BaIPC9kSUb3HSqIRZATXYKWrTyaEG3kpmvlgZrre9XifnD5HRo1w0
	dTbWE+TgMlpL5iUtVBHCm/wFstuDw8kJ+Akvu/vA+gI+xXzpL+tyurYUSOWC2jXGN7Eg5gX95w2
	Vmr7ZMjAOIA1ocgFMo2lX2EwgRDm00Ko0Ke+ZxpA30GjmDk14qw01rTxWE2CIzbU66xwii+gp5P
	K8Xm3KSXmIr1MqMkbTBGVusyJA0dQkGMmsgEdGesLMOc/UbbtzytvB3Hfcbn/Wjr/hUSKyoezY9
	SRZ4W9wweNoZg9X10aoIUcSZH10m+Q+v1WJBzym7210sveGoMhi6A5KCfCG7ENuRfz3yOCCAZJ0
	HKsL5y5+zcvCSTYusXKoKhxqNgdjsvuUogYsZ2yK2Y41FUUBo=
X-Google-Smtp-Source: AGHT+IFA4ONMkaMPZ8eL5zpWkeTTkOm5tQk4XGLuOqh0qy+7Xg2tHiMfLd3JVBt0YARn6D+xGUU5jw==
X-Received: by 2002:a05:6000:1a8b:b0:430:f742:fbb9 with SMTP id ffacd0b85a97d-432c3775a58mr28445662f8f.23.1768320243121;
        Tue, 13 Jan 2026 08:04:03 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16ffsm46063967f8f.12.2026.01.13.08.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:04:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] libnl: skip a flaky route_1 ptest
Date: Tue, 13 Jan 2026 17:03:56 +0100
Message-ID: <20260113160356.2761010-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 16:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229277

From: Alexander Kanavin <alex@linutronix.de>

[YOCTO #16118]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ksuite-all-netns.c-skip-route_1-test.patch | 27 +++++++++++++++++++
 meta/recipes-support/libnl/libnl_3.12.0.bb    |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-support/libnl/files/0001-tests-cksuite-all-netns.c-skip-route_1-test.patch

diff --git a/meta/recipes-support/libnl/files/0001-tests-cksuite-all-netns.c-skip-route_1-test.patch b/meta/recipes-support/libnl/files/0001-tests-cksuite-all-netns.c-skip-route_1-test.patch
new file mode 100644
index 0000000000..81fdd0a042
--- /dev/null
+++ b/meta/recipes-support/libnl/files/0001-tests-cksuite-all-netns.c-skip-route_1-test.patch
@@ -0,0 +1,27 @@
+From 2b9a8ad1fa06cc15b301f18a16e4ad1d30a5d1f7 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 13 Jan 2026 16:55:41 +0100
+Subject: [PATCH] tests/cksuite-all-netns.c: skip route_1 test
+
+It was found to be unstable on arm64:
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=16118
+
+Upstream-Status: Inappropriate [issue reported at https://github.com/thom311/libnl/issues/450]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ tests/cksuite-all-netns.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/cksuite-all-netns.c b/tests/cksuite-all-netns.c
+index 4714db2..d5ca6a1 100644
+--- a/tests/cksuite-all-netns.c
++++ b/tests/cksuite-all-netns.c
+@@ -341,7 +341,7 @@ Suite *make_nl_netns_suite(void)
+ 				  nltst_netns_fixture_teardown);
+ 	tcase_add_test(tc, cache_and_clone);
+ 	tcase_add_loop_test(tc, test_create_iface, 0, 17);
+-	tcase_add_test(tc, route_1);
++	//tcase_add_test(tc, route_1);
+ 	suite_add_tcase(suite, tc);
+ 
+ 	return suite;
diff --git a/meta/recipes-support/libnl/libnl_3.12.0.bb b/meta/recipes-support/libnl/libnl_3.12.0.bb
index f28687e695..2b46fb69d9 100644
--- a/meta/recipes-support/libnl/libnl_3.12.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.12.0.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}${@d.getVar('PV').replace('.','_')}
            file://run-ptest \
            file://0002-tests-skip-various-tests-when-kernel-returns-EOPNOTS.patch \
            file://0001-tests-add-and-use-_nltst_skip_eopnotsupp-helper.patch \
+           file://0001-tests-cksuite-all-netns.c-skip-route_1-test.patch \
            "
 
 SRC_URI[sha256sum] = "fc51ca7196f1a3f5fdf6ffd3864b50f4f9c02333be28be4eeca057e103c0dd18"
-- 
2.47.3


