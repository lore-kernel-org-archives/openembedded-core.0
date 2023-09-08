Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46AFEE57CA
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 05:48:42 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.33298.1694152117253753730
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 22:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=NdYvSPzx;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-68cbbff84f6so2035176b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 22:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694152116; x=1694756916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DCSeB0j8cO3CnZeaasEkarhaQ2IJ0j4wr5X9i2qA7qQ=;
        b=NdYvSPzxqvsuloG+Y76VQyL5g8yB/wyhfQSDyiopwMSMAjVzJe/9G0PWvxj78KSNns
         00O/bacp04xcDM5MGt2Fv8hysBggt21c4BRe0c/iX1jJPc2AJJ5f6WUpweeCqcoN2UN4
         WCvhqcn6PVQz0vKY+5z9M0mWU02faLcqmW9Vshjk3wjUnwy+MCwXzOc2/4zBDu/HIt/D
         lO2u+gNDFOIfxirZW03f7v4gdwaYiqUrimjeYxtoHFqybpawSG20Ms8y9B54JoqVjl63
         I2Gjub74Y+BWSD/jCHqpTDglu7hPASP1nMZ4omN1SEHoka31qj7Fsprd4xFtbpWRoecw
         YZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694152116; x=1694756916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCSeB0j8cO3CnZeaasEkarhaQ2IJ0j4wr5X9i2qA7qQ=;
        b=lptTPG2S/V4Gcbok6TZ594CpEAvUdGlGtpErvZB9lH2OtWvWcKApFRmOymKdFDLj1I
         ARhNQh5fBkOvvHUDf2NO7oh+P9r1wMxoY4CRHQr6Fq3OLbWK6GNmCGtjrB6UIGyUFAda
         /r4k9/wrVQjrLuIxWHHdQ7Uk9sPsungcmBBActt099kc/kLsbFm1OphLjsCnUiXF/R97
         bz0hBcY3wRQYblYW+zgXL7ZirnEveGrIULFHOHZOu/Iw78vKFt/EH5+J/rcbpnTtSh7r
         zJL3S7An1VF1kQ+UYS2NEInLutpKFkhnOuh+ABPAUJE1T8JwgXfNbfgIiRZX7b3WEJoP
         sEkA==
X-Gm-Message-State: AOJu0Yyav+h89cRXA/wRL+GkSa8l5mL/LHiTbV1UuD4x1HBl/n6hWrvy
	QxAOsENju6hgSgp65LpmQoWE9OtGDH1ZxA==
X-Google-Smtp-Source: AGHT+IGr094a9dOXsaiJQFgll773xJpX1J94VFouEO+eE8Vwb94xvObe52s5TMfFnTP1cr1KSD8TzA==
X-Received: by 2002:a05:6a00:2995:b0:68e:38cf:9de8 with SMTP id cj21-20020a056a00299500b0068e38cf9de8mr5580164pfb.9.1694152116432;
        Thu, 07 Sep 2023 22:48:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::a05f])
        by smtp.gmail.com with ESMTPSA id o6-20020a639206000000b0056c3a4a3ca5sm476268pgd.36.2023.09.07.22.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 22:48:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] apr: Fix ptests on musl
Date: Thu,  7 Sep 2023 22:48:33 -0700
Message-ID: <20230908054833.725927-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 05:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187407

musl does not implement dlclose [1] the way apr tests it will always
fail, even though it is per posix. Backport a relevant fix

[1] https://wiki.musl-libc.org/functional-differences-from-glibc.html#Unloading-libraries

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use a different approach instead of disabling the test with a backport from upstream

 ...Check-for-NULL-handle-in-apr_dso_sym.patch | 37 +++++++++++++++++++
 meta/recipes-support/apr/apr_1.7.4.bb         |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr/0001-dso-Check-for-NULL-handle-in-apr_dso_sym.patch

diff --git a/meta/recipes-support/apr/apr/0001-dso-Check-for-NULL-handle-in-apr_dso_sym.patch b/meta/recipes-support/apr/apr/0001-dso-Check-for-NULL-handle-in-apr_dso_sym.patch
new file mode 100644
index 00000000000..8ba181b8877
--- /dev/null
+++ b/meta/recipes-support/apr/apr/0001-dso-Check-for-NULL-handle-in-apr_dso_sym.patch
@@ -0,0 +1,37 @@
+From a25be1aaa92a6d2e7f4cc3fdfbb92e5a10b63035 Mon Sep 17 00:00:00 2001
+From: Greg Beard <gmbeard@googlemail.com>
+Date: Sat, 25 Mar 2023 08:31:36 +0000
+Subject: [PATCH] dso: Check for NULL handle in apr_dso_sym
+
+Upstream-Status: Backport [https://github.com/apache/apr/pull/40/commits/0efce00093b1ba405d91c7f0eab9755c8527eead]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ dso/unix/dso.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/dso/unix/dso.c b/dso/unix/dso.c
+index fdd56f1..583d5de 100644
+--- a/dso/unix/dso.c
++++ b/dso/unix/dso.c
+@@ -173,6 +173,18 @@ APR_DECLARE(apr_status_t) apr_dso_sym(apr_dso_handle_sym_t *ressym,
+                                       apr_dso_handle_t *handle, 
+                                       const char *symname)
+ {
++    /* This is necessary for `testdso.c`. For some reason, musl
++     * builds fail the `test_unload_library` test if the below
++     * check isn't in place. `test_unload_library` unloads the
++     * library and then immediately calls this function. Maybe
++     * musl's `dlsym()` assumes the handle is never NULL and
++     * some UB is being invoked here...
++     */
++    if (handle->handle == NULL) {
++        handle->errormsg = "library not loaded";
++        return APR_ESYMNOTFOUND;
++    }
++
+ #if defined(DSO_USE_SHL)
+     void *symaddr = NULL;
+     int status;
+-- 
+2.42.0
+
diff --git a/meta/recipes-support/apr/apr_1.7.4.bb b/meta/recipes-support/apr/apr_1.7.4.bb
index 5ac7f4b93f7..d322629b66f 100644
--- a/meta/recipes-support/apr/apr_1.7.4.bb
+++ b/meta/recipes-support/apr/apr_1.7.4.bb
@@ -23,6 +23,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0001-Add-option-to-disable-timed-dependant-tests.patch \
            file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch \
            file://autoconf-2.73.patch \
+           file://0001-dso-Check-for-NULL-handle-in-apr_dso_sym.patch \
            "
 
 SRC_URI[sha256sum] = "fc648de983f3a2a6c9e78dea1f180639bd2fad6c06d556d4367a701fe5c35577"
-- 
2.42.0


