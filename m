Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D10EB8FAF
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 04:09:49 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.1344.1693973383214757685
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 21:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QApWR3g4;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c0bae4da38so3941205ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 21:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693973382; x=1694578182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X2EaRsTaCnNr/7OE1FDV97AE/oofrMJOwWzPN3IvF2c=;
        b=QApWR3g40MqHPiQbdlOsE5/GhxCAa3ajd/S4fv+2WJTL4RnJ0sOdfjVDQ4SNM4tmbr
         vIKV2LDm/boQdXqIL9ETHylN+9d4cDH1JpngLMGv4pbwADljGytDoT4vXlNHV/hov2pB
         fiSpeJlMMZwuy6Q08aNe3yjJB8LaTwP3wkfyXx6G4UaAjUXKLIQF8ShYqU38POdsmHgE
         4jKdWdP1y/VbCkPvY0ZyRQ8IimFeym1rNJUQSSXiz7cU5WPkKAAYo+fTLbtVtGB+2U0f
         6EjKPp8awkyYPqiTeAjxvb0zCrClV/i8c17nshuOGXpqaVHHCA2loE2F53OkkuuEGveP
         I7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693973382; x=1694578182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2EaRsTaCnNr/7OE1FDV97AE/oofrMJOwWzPN3IvF2c=;
        b=VR/hdQiSKmFic2PjjfMVLqSl/y2h3XUsF4zvmQLunGOt0wbrMKf1aBPf8WGUYcvATZ
         IviWdTFK4cMoQuO8FkkTWv2MVSDotpaqfVfynSHsnSvqXSi+n7g2Q9KIj9gGNhfmn+5o
         VJPBvUfp9JPxGnVdFdWuM5xtcZXLHy0YXb4U1/gPCQ3NyUmaROnlHesoYmUF7LmYOz/b
         mkaNV2xN5BoDS8+28qBuu5niH1p3ouMa/QR7iVORZq4f0xlKGUQEgycGsnfwNie87Lsq
         sioWtZoRcaUw4z89RffsU2+AwPJTsWOGIkzrBX+b898BEFNo4nXTlzi4jae1NLwIEURV
         Fxsw==
X-Gm-Message-State: AOJu0YzztMtO2DP4EEYQfJusKV7L0bFomMEtZPVqomwEtrFTMyC2CrS1
	eR2Cdo6jndu+8+X1LBSErrFXC10rtJsc6Q==
X-Google-Smtp-Source: AGHT+IGMUnB92E5CJKfQs1MumFSd/HvDJJCKffk9W/qvdR2Rxhx8UOLvGlzCMiW23MJuwET7IMEvjw==
X-Received: by 2002:a17:902:d505:b0:1bc:7312:78e2 with SMTP id b5-20020a170902d50500b001bc731278e2mr19794103plg.5.1693973382202;
        Tue, 05 Sep 2023 21:09:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id q14-20020a170902788e00b001bc930d4517sm10123088pll.42.2023.09.05.21.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 21:09:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] apr: Fix ptests on musl
Date: Tue,  5 Sep 2023 21:09:39 -0700
Message-ID: <20230906040939.1386757-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 04:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187273

musl does not implement dlclose [1] the way apr tests it will always
fail, even though it is per posix. Therefore ignore the unload tests

[1] https://wiki.musl-libc.org/functional-differences-from-glibc.html#Unloading-libraries

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-testdso-Do-not-test-dlclone-on-musl.patch | 42 +++++++++++++++++++
 meta/recipes-support/apr/apr_1.7.4.bb         |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr/0001-testdso-Do-not-test-dlclone-on-musl.patch

diff --git a/meta/recipes-support/apr/apr/0001-testdso-Do-not-test-dlclone-on-musl.patch b/meta/recipes-support/apr/apr/0001-testdso-Do-not-test-dlclone-on-musl.patch
new file mode 100644
index 00000000000..eb17dab4a25
--- /dev/null
+++ b/meta/recipes-support/apr/apr/0001-testdso-Do-not-test-dlclone-on-musl.patch
@@ -0,0 +1,42 @@
+From 4b9243f46948c3c22b36c63694c41e9fdf90dfe9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 5 Sep 2023 17:25:45 -0700
+Subject: [PATCH] testdso: Do not test dlclone on musl
+
+Upstream-Status: Inappropriate [Musl specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/testdso.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/test/testdso.c b/test/testdso.c
+index 0d9f27b..54f166f 100644
+--- a/test/testdso.c
++++ b/test/testdso.c
+@@ -244,15 +244,22 @@ abts_suite *testdso(abts_suite *suite)
+     abts_run_test(suite, test_load_module, NULL);
+     abts_run_test(suite, test_dso_sym, NULL);
+     abts_run_test(suite, test_dso_sym_return_value, NULL);
++#if defined(__linux__) && !defined(__GLIBC__)
++    /* dlclose is a no-op on musl */
++#else
+     abts_run_test(suite, test_unload_module, NULL);
+-
++#endif
+ #ifdef LIB_NAME
+     apr_filepath_merge(&libname, NULL, LIB_NAME, 0, p);
+     
+     abts_run_test(suite, test_load_library, NULL);
+     abts_run_test(suite, test_dso_sym_library, NULL);
+     abts_run_test(suite, test_dso_sym_return_value_library, NULL);
++#if defined(__linux__) && !defined(__GLIBC__)
++    /* dlclose is a no-op on musl */
++#else
+     abts_run_test(suite, test_unload_library, NULL);
++#endif
+ #endif
+ 
+     abts_run_test(suite, test_load_notthere, NULL);
+-- 
+2.42.0
+
diff --git a/meta/recipes-support/apr/apr_1.7.4.bb b/meta/recipes-support/apr/apr_1.7.4.bb
index 5ac7f4b93f7..92948a82ddd 100644
--- a/meta/recipes-support/apr/apr_1.7.4.bb
+++ b/meta/recipes-support/apr/apr_1.7.4.bb
@@ -23,6 +23,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0001-Add-option-to-disable-timed-dependant-tests.patch \
            file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch \
            file://autoconf-2.73.patch \
+           file://0001-testdso-Do-not-test-dlclone-on-musl.patch \
            "
 
 SRC_URI[sha256sum] = "fc648de983f3a2a6c9e78dea1f180639bd2fad6c06d556d4367a701fe5c35577"
-- 
2.42.0


