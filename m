Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2253AEB64DC
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:08 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.17359.1687961586694360919
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=GD+0WfkX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1b7ef3e74edso23651695ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961586; x=1690553586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loP5wWKD0zyTlNRt8BejD15MO3zSsVlgQKC+p/3HpNI=;
        b=GD+0WfkXgnrP343NxPkZMux9oG7sbrYP0FJgHYIBRMvV3qOm19U2vqHRd1HyjnH16N
         HuVVsU3pYGTSNgyW00vjmsvI4Csq9Wwvm1qpOplN4H6NyLPrjl5qfEX7ByRwcPYimysA
         DOako6cstCrjJ3t80MTbJaySthjjBgo7Z4ZboyZbWj/VTToa2wLRxeD79FHy/JiKHucr
         SO3+iWrg2DiKoAcGpX9kfubuMDLUFWD3yYf4kzBy8GeGz9yAIUH1m/VIZw5WuJeYwBHX
         CW21xSCwjxJ/17+TfgVraNba9Qj2Py7Xg3aVVCabQa8WlivH0e9O8I2adaAuY/COc4LA
         vpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961586; x=1690553586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loP5wWKD0zyTlNRt8BejD15MO3zSsVlgQKC+p/3HpNI=;
        b=k/aIXgmypFXwLCShMIo4+4AQem7I4P1wq5X6sSHSs2zWhV6+lFtPCwlpLluvnaYMFJ
         m2VI6JJDQmEQYRk0mBhs4YHht4W9kl2anKIuaib+zY3zHnEDhF2tHz6I7EIwKTdlUCCM
         dl8Y6UxXOL9Nfy89s/VYqNiOT+pCj8AGT9YdFrKXn1sWcCpczTaxEuaquBs2yz7AaK/r
         Nts35DG2opLIeV/IbdzRSnliTc1xW6L7cjQaunPdFN9SXlVevaxH+v4wA73v1jvXFryu
         OsQ4kfTV5SYQ5SA9pHls8P+syudM0SkxLegbJ/djXTOuH184r1ThDGmZmzSQOFrdt89u
         Zmeg==
X-Gm-Message-State: AC+VfDy3EbN5j7FO+8QLLFcjAL8Z1xPbIv9MXMCsmVAskX3AhzEoCBB6
	cxgYtG9Sk0hJhgPLIxxPE5ToL53Pm213hB5B4MXDwA==
X-Google-Smtp-Source: ACHHUZ6iJFRGA/uVKHf1TSYrh7JVPNyTXE0qoagVdokgOhdyygvYw+bJt+sj0caKH2sNVsSWBsG0qA==
X-Received: by 2002:a17:903:1112:b0:1ac:8475:87c5 with SMTP id n18-20020a170903111200b001ac847587c5mr9355501plh.56.1687961585709;
        Wed, 28 Jun 2023 07:13:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/29] libcap: CVE-2023-2602 Memory Leak on pthread_create() Error
Date: Wed, 28 Jun 2023 04:12:28 -1000
Message-Id: <7e4f3c51c0bac772bf56f69a3c065b2b2d095335.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183558

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://git.kernel.org/pub/scm/libs/libcap/libcap.git/patch/?id=bc6b36682f188020ee4770fae1d41bde5b2c97bb

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


