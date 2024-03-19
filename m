Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40469C54E60
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 10:48:59 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.12282.1710845330261222699
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 03:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FQP9KvWK;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5157af37806so617312e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 03:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710845328; x=1711450128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9UqUc8ZiH85KT6ofHHx0TqE4iM4JDtF2rvy/jpOtgNU=;
        b=FQP9KvWK8FfQ6RxQRQp+z8Cdn0/USMfBUAwJrLcldFLrh1PCJ1/INJ0vUEMebcVmfE
         IjpT5/WcuFFiKdHM0rwAKb481UvMZRa3YJItvSqt59OsHfwla36ZBv0NpEjVWBjgqXIF
         ulKF2F50y7dihYmoSk5V7KM0lg9uxUT+4dr/Rz0aV4A91uF8CCxjVKSdxPpXOwVmOqLN
         4c/MGZBkiwaYoCzj7dXz8drSxJdehLk/4NLZIxqD0bw6xDssctK7WANpZ85wcYS4DFSF
         gT/M4WsI0vFPcl1LqJqkPatDCtn+cqte4t+i46r5v/fbG8hOVKWW3bvyj3KM01JGnqp5
         e3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710845328; x=1711450128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9UqUc8ZiH85KT6ofHHx0TqE4iM4JDtF2rvy/jpOtgNU=;
        b=EUAObt8JOgbp9zQ8q5TW8ERhRmQhEyBRMteB5Iyrkk8penex4sq/ULwNv0BG8LI7PJ
         xcOJfLDUXz1Khhub+J9kGNvmjqfo1FRhv01kaUuJDz6ZWImbMgQlP5PQcxS1Yo4NdWtG
         cwWXR/3ZEDvq1w1H8M4T41T2E+O26olLwgngRSMEu9ujRVuHjNPczYwea0XFIdWvYmUj
         If/t3VdYlpxqRbrn6M9QW48alkj4g0wAU0zvG94WMLuMppSPX54z8ozozMFDktgDcjDm
         ADl4kUJ0O/r1gNJ4moNhWe6drGtfXqj79QKQkTs0Hxfv8RCZOAD/hU91jvyYWzx5PNJ+
         m0QA==
X-Gm-Message-State: AOJu0Yy45pgKQYfjzODqCCnRhVv0gK1fEmF1msSnMgFZIySHQ5rjyurW
	gE+szCgMFvmPnyj/WmOOHQAQaSPYxqI0gtYQY/NxSOI6rHJGBUOEg1XAtT6z4H0=
X-Google-Smtp-Source: AGHT+IFrXf8jZnnGEE0Pod/eFDHY2Q5UveLeE8jRSjdrq1ozdDRhixoeaiUFsr2STVXKSdTTGV7jIA==
X-Received: by 2002:a19:8c4d:0:b0:513:cc24:c464 with SMTP id i13-20020a198c4d000000b00513cc24c464mr10335419lfj.15.1710845327732;
        Tue, 19 Mar 2024 03:48:47 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id k16-20020a05600c1c9000b0041465c859d0sm1384746wms.39.2024.03.19.03.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 03:48:47 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] elfutils: fix unused variable BUFFER_SIZE
Date: Tue, 19 Mar 2024 10:48:30 +0000
Message-ID: <20240319104830.1685335-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 10:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197318

Fix build break with clang

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../elfutils/elfutils_0.191.bb                |  1 +
 ...iles-fix-unused-variable-BUFFER_SIZE.patch | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.191.bb b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
index c5c1542b05..c4d872430b 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.191.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
            file://0001-debuginfod-Remove-unused-variable.patch \
+           file://0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch b/meta/recipes-devtools/elfutils/files/0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch
new file mode 100644
index 0000000000..b6a553c296
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch
@@ -0,0 +1,36 @@
+From db51a55a8e3811d19265bf12d2ff715c6cf558b4 Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <jose.quaresma@foundries.io>
+Date: Tue, 19 Mar 2024 10:17:59 +0000
+Subject: [PATCH] srcfiles: fix unused variable BUFFER_SIZE
+
+The const variable BUFFER_SIZE is used only on the zip_files
+function witch is only available with LIBARCHIVE.
+
+| ../../elfutils-0.191/src/srcfiles.cxx:81:18: error: unused variable 'BUFFER_SIZE' [-Werror,-Wunused-const-variable]
+|    81 | constexpr size_t BUFFER_SIZE = 8192;
+|       |                  ^~~~~~~~~~~
+
+Upstream-Status: Submitted [https://sourceware.org/pipermail/elfutils-devel/2024q1/006919.html]
+
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
+---
+ src/srcfiles.cxx | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/srcfiles.cxx b/src/srcfiles.cxx
+index 892737cc..09d50f8d 100644
+--- a/src/srcfiles.cxx
++++ b/src/srcfiles.cxx
+@@ -78,7 +78,9 @@ ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
+ /* Bug report address.  */
+ ARGP_PROGRAM_BUG_ADDRESS_DEF = PACKAGE_BUGREPORT;
+ 
++#ifdef HAVE_LIBARCHIVE
+ constexpr size_t BUFFER_SIZE = 8192;
++#endif
+ 
+ /* Definitions of arguments for argp functions.  */
+ static const struct argp_option options[] =
+-- 
+2.44.0
+
-- 
2.44.0


