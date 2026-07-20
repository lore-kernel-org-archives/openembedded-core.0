Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D84C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:36 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2889.1784568212582325799
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0MHaZY00;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4955484387cso11946155e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568211; x=1785173011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DvDt2ob8KOS81MJnpZKizThYjAR1r+YK0bL1FmpSsJA=;
        b=0MHaZY004lI6+0ktfZGrll8mDc2z+NSrpu1Fl6nq69MXrVIksSilassqLfd0+UeZoU
         zyP9KRVVaQ9vkVpwBJ5jL8K7xuivzdqpXnZ0hOXuRZw3inoDNZFzHm0qszPft/kSHT9l
         fmQdU8Kwam/C171AcKyuf51KXnrVjmQ90SMSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568211; x=1785173011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DvDt2ob8KOS81MJnpZKizThYjAR1r+YK0bL1FmpSsJA=;
        b=jXwzGOtUI1gYL1ZRViTsEk3hmW9GukmJWtGIIcrYuwrlo2dA5T2ZLGX0RdaCz+6h8w
         5/OgiPPQKaGEwaqAIGA0Rf8661CrYWZzzUwDGOwEE81afSw8LjgfvzDZtzmOOL7Cm3g3
         1YWIhWTnzGLtQMjNKqmI/R7Okinwy2RT+gDXPGbPrqA4ZqSdbklfFJtmWtq5VmPpD2wu
         dCk1YmcU6xYDngycHs2wFFGDZHkmqDw++RA6ABTFllY/73tDFUxnQJ+TdMvDXaGZMN+S
         FzT/69ICX2OU/2xBNzHdUdmG7ZUgSp5leTmk2vTHqrc64GsRjgscypqJUDGc2HKXKAD/
         fgKg==
X-Gm-Message-State: AOJu0Yx2QlDjoCFZUCeYRBQioiORx7T2ieIT91EKXG4LKDSeNXE7qxRA
	6gecOXH+K10wgVnv1FRJjs/41cAF2C6ZP2qbFyP7lVIIOKJh5dqwYqs4MFS54sVuyyD5toMrjAW
	JXVuEo/k=
X-Gm-Gg: AfdE7cmAafhXFyjtGLAUG17gT06AGZWQgC9EBlj4EgN3XbWzPOETj5Bx32u4lUZlpFV
	us2xzBeiUSlctKAJ8QAhTtpSzy4dtmw/V+juVBmBElVzVV4kJhUgmr8K8+5437pkXPnXJEZzG5o
	IDwLPOHXfPgIH02JsaNw9YDzH93hJiRxzZUxly5WLgftjJ+EZBf2SsGsGaFOXy0ECqJGokWDZeS
	kFyHb8K1sTJNFYtsYaGWDtkV0zKkNh4YHbjlSDFHF+BUyNol2Ut/rf//GuOG3Z48HvHpCxu7Ka+
	9Fy0KUr1U34nSMwuwlkn5xgqIizI+l/X87AVBpiKaWauVDCpBj4tvcPM6pVAKkrwq5Ty6qQAC7q
	dGW/t1IbbU7vZXJRs9i2IXVq92GxEVdgME5pjNVfsoZ3Vb5/WrI6/dLsTHUipJkTQdAUQNa/JKf
	/XS6V9JAGADMzOuUPGeG1I2iUsDkuIlTcatL8mUapfl8xaqR5NXKdx87xRf6f0VaWuKCqVAvnt1
	KuEZ49w
X-Received: by 2002:a05:600c:b8d:b0:493:a613:56b2 with SMTP id 5b1f17b1804b1-4954a3d0d5fmr177688545e9.8.1784568210695;
        Mon, 20 Jul 2026 10:23:30 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/33] python3: Simplify ptest exclusion list
Date: Mon, 20 Jul 2026 19:22:39 +0200
Message-ID: <649b6848ccd4aa3842b2b42b03058511e4f07ce3.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241440

From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Makes the exclusion list a bit more readable, avoiding very long sed
expression lines.

[Kris Gavvala]:
this commit was modified to fit scarthgap. the original commit expects
to skip test_timerfd_TFD_TIMER_ABSTIME, test_date_locale2 and test_null_dlsym.
These tests were not being skipped on scarthgap so were removed from the
backport.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
(cherry picked from commit d9a44e7390d7c8f2c2b73572825a6f8ceeb729ac)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3_3.12.13.bb | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes-devtools/python/python3_3.12.13.bb
index 06dbc8e892d..b31dd3d743c 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -256,8 +256,19 @@ do_install:append:class-nativesdk () {
     create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
 }
 
-do_install_ptest:append:class-target:libc-musl () {
-    sed -i -e 's|SKIPPED_TESTS=|SKIPPED_TESTS="-x test__locale -x test_c_locale_coercion -x test_locale -x test_os test_re -x test__xxsubinterpreters -x test_threading"|' ${D}${PTEST_PATH}/run-ptest
+
+SKIPPED_TESTS:append:class-target:libc-musl = " \
+    -x test__locale \
+    -x test_c_locale_coercion \
+    -x test_locale \
+    -x test_os test_re \
+    -x test__xxsubinterpreters \
+    -x test_threading \
+"
+
+
+do_install_ptest:append () {
+    sed -i -e "s|SKIPPED_TESTS=|SKIPPED_TESTS=\"${SKIPPED_TESTS}\"|" ${D}${PTEST_PATH}/run-ptest
 }
 
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " provide_target_config_script"

