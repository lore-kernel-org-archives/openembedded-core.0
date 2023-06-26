Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD19EB64DA
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 06:19:32 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.2019.1687760362584398157
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 23:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ab3wpSyd;
 spf=pass (domain: mvista.com, ip: 209.85.210.171, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-666e5f0d60bso1185823b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 23:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1687760362; x=1690352362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vp2AaqyX0biFCk4a242Xad/DZnQW12houkGm0S8Bykc=;
        b=ab3wpSydMeFfNKL78SGsJy9euBTknawtk7L7eG67rJPdB8JkG24jLjJrEKdz6unaW+
         2FtFXtZAWa9DiD8BMc9hcQmOy9HKn5S57J0zIXeP8z44IDjZoI+2d22GhK4M78HcgcJa
         6UM74goMDBL+CjWMhcf6PVMzT+CTwX1rMQLLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687760362; x=1690352362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vp2AaqyX0biFCk4a242Xad/DZnQW12houkGm0S8Bykc=;
        b=fPrm69Dc5xc1Wxaq9N/Dzq29SK/GxCQSvvhu4lvzDqnqhroycuMlohw8LBwFxHtlSl
         yD+Zri+Wavt8fQlHWIeDN/H0VkpWuzg87EnJwLhGj9KF7zGywTjjpyFmzrS8/+Lgdvi7
         ES8XtSvyvWLwtLbxMpnzYexo2sXdJMrDfbVvQFVLP4Vg/6x8u4PMplFNq3xvMSiUMhyo
         k1uRaU1vARgl9iFkqndNkXQobDV9WaManw9hrVHyxtkci4yA2CGQVs1gpdByfgVtPx+o
         GRMvE5GIio+rbjQ2JXprq3Xb+W2r3y6qYOGi83rsI/ULc2BCGBtXTYC2X6pzX3wXJC7C
         gnfg==
X-Gm-Message-State: AC+VfDz7xi2RrXg0+bO2+XqbkNRKYKvKJMNvRGV/Gisz/XnIjGEIUL8Q
	ng5gzMjegqCUPqXklU8TgMY/S/Tmu5FpqQiewxI=
X-Google-Smtp-Source: ACHHUZ5tQC4ZjKmDHFee8Dle/tIO8sFvtPmOt8Dtjt2dGBOzNV+8F35gE9A+b5kWP7ilxud082g0Cw==
X-Received: by 2002:a05:6a20:4313:b0:11e:e940:441e with SMTP id h19-20020a056a20431300b0011ee940441emr20460882pzk.25.1687760361679;
        Sun, 25 Jun 2023 23:19:21 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.143])
        by smtp.gmail.com with ESMTPSA id t16-20020aa79390000000b00643889e30c2sm3085797pfe.180.2023.06.25.23.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 23:19:21 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Mon, 26 Jun 2023 11:49:16 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] libcap: CVE-2023-2602 Memory Leak on pthread_create() Error
Date: Mon, 26 Jun 2023 11:49:14 +0530
Message-Id: <20230626061914.44931-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 06:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183405

Upstream-Status: Backport from https://git.kernel.org/pub/scm/libs/libcap/libcap.git/patch/?id=bc6b36682f188020ee4770fae1d41bde5b2c97bb

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libcap/files/CVE-2023-2602.patch          | 45 +++++++++++++++++++
 meta/recipes-support/libcap/libcap_2.66.bb    |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-support/libcap/files/CVE-2023-2602.patch

diff --git a/meta/recipes-support/libcap/files/CVE-2023-2602.patch b/meta/recipes-support/libcap/files/CVE-2023-2602.patch
new file mode 100644
index 0000000000..1ad5aeb826
--- /dev/null
+++ b/meta/recipes-support/libcap/files/CVE-2023-2602.patch
@@ -0,0 +1,45 @@
+From bc6b36682f188020ee4770fae1d41bde5b2c97bb Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Wed, 3 May 2023 19:18:36 -0700
+Subject: Correct the check of pthread_create()'s return value.
+
+This function returns a positive number (errno) on error, so the code
+wasn't previously freeing some memory in this situation.
+
+Discussion:
+
+  https://stackoverflow.com/a/3581020/14760867
+
+Credit for finding this bug in libpsx goes to David Gstir of
+X41 D-Sec GmbH (https://x41-dsec.de/) who performed a security
+audit of the libcap source code in April of 2023. The audit
+was sponsored by the Open Source Technology Improvement Fund
+(https://ostif.org/).
+
+Audit ref: LCAP-CR-23-01 (CVE-2023-2602)
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/libcap/libcap.git/patch/?id=bc6b36682f188020ee4770fae1d41bde5b2c97bb]
+CVE: CVE-2023-2602
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ psx/psx.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/psx/psx.c b/psx/psx.c
+index d9c0485..65eb2aa 100644
+--- a/psx/psx.c
++++ b/psx/psx.c
+@@ -516,7 +516,7 @@ int __wrap_pthread_create(pthread_t *thread, const pthread_attr_t *attr,
+     pthread_sigmask(SIG_BLOCK, &sigbit, NULL);
+ 
+     int ret = __real_pthread_create(thread, attr, _psx_start_fn, starter);
+-    if (ret == -1) {
++    if (ret > 0) {
+ 	psx_new_state(_PSX_CREATE, _PSX_IDLE);
+ 	memset(starter, 0, sizeof(*starter));
+ 	free(starter);
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libcap/libcap_2.66.bb b/meta/recipes-support/libcap/libcap_2.66.bb
index c50e9d8cc7..d3189fb105 100644
--- a/meta/recipes-support/libcap/libcap_2.66.bb
+++ b/meta/recipes-support/libcap/libcap_2.66.bb
@@ -16,6 +16,7 @@ DEPENDS = "hostperl-runtime-native gperf-native"
 SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz \
            file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch \
            file://0002-tests-do-not-run-target-executables.patch \
+           file://CVE-2023-2602.patch \
            "
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
-- 
2.25.1


