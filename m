Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAE0C47DDB
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 07:21:10 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.10662.1706253669311457443
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 23:21:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UnS5mqDL;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2906bd9f2ebso56078a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 23:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706253668; x=1706858468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GU4oPxMREdbpu597xnUfFR05E17phgclqDMGvVH+iLs=;
        b=UnS5mqDL2irstvoa1i59Jo+CQ6MZm0J/VeeISAAXmyKJzt2p9A7iukuKofu91UquVe
         hZ8ae9U6nQSc0QJcMpHgQ+T0VNSAnryaGNhHArHvNtqQtxSIs3qL9sID0YIHOCA83WkV
         HpX/uWtw9lTh5HYjmKDM2JoDr6IWwjCZDdKaTSNV3CHqUUO+ZP7z4vZG2vDDREXiFORB
         k2tijdjZqFl6KoT2chUybUBYObDcxzXwOvaj2W9R8R8goqpU+bBw/a4tFoPWvzjdxuxL
         7HMzoPdwvo6AYqPpY+C/TISrlISuWQmnHovyKpaIoZzoH0fN0iF5Ag8AG95qINGdyL0N
         cBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706253668; x=1706858468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GU4oPxMREdbpu597xnUfFR05E17phgclqDMGvVH+iLs=;
        b=LUo8BtzU7Yujx6fnA27G4qNdtwkc95IsEbbb6eiQTKRigp6wB/ykztslKmF32BPfOB
         4H/w/4pK2E34AcrYyyipWcy2tLgoCE/69xas4IbBJQ+WCIj0JJwmheNjKoVpRRf+V9JW
         CeHob+D94jz/oza12Ba9UkTzFFpkLvv3x1I/D2w8jDEylQ9pXF0yTZQJ0pY1S5Q+huuM
         8eabgA2CnEetqQv+v6GzhK/bJNXHwrssOZjChl6PanpoLMtoGLqk26j+jPJ06G6nBCbH
         NrVlDlAcHLdE6IOoooVjmdKrXc6UrR/ld16b5wvqqcw19eq5x5N3Z31vv35Fj1v4Yfyj
         EUxw==
X-Gm-Message-State: AOJu0YzNUOuBQo95n7GErT47ZcLgyEyz56G5lvoHbPsInYfpjnH2d1Io
	l15xS5ZECSkLEDkCTZBtI2her9OCsU4vynqp0vSiNV6dp0LrPeNU21T+JjKbnV8=
X-Google-Smtp-Source: AGHT+IGvrSIY+lalvMi/gi3990q75oznHdbUHtcjYy8cAbwn8V3xiCiH8SJqRK7+qUtXTzZ5+kDPUg==
X-Received: by 2002:a17:90a:ae07:b0:28f:f249:3c4a with SMTP id t7-20020a17090aae0700b0028ff2493c4amr689973pjq.19.1706253668049;
        Thu, 25 Jan 2024 23:21:08 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c13b])
        by smtp.gmail.com with ESMTPSA id ok14-20020a17090b1d4e00b0028bf79ad453sm603020pjb.21.2024.01.25.23.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 23:21:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] elfutils: Fix build with gcc trunk
Date: Thu, 25 Jan 2024 23:21:05 -0800
Message-ID: <20240126072105.2826308-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 07:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194346

Fixes a build issue seen with latest gcc trunk.

Fixes
| ../../elfutils-0.189/tests/elfstrmerge.c: In function 'main':
| ../../elfutils-0.189/tests/elfstrmerge.c:450:32: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
|   450 |   newscnbufs = calloc (sizeof (void *), newshnums);
|       |                                ^~~~
| ../../elfutils-0.189/tests/elfstrmerge.c:450:32: note: earlier argument should specify number of elements, later size of each element
| cc1: all warnings being treated as errors

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../elfutils/elfutils_0.189.bb                |  1 +
 ...against-upcoming-gcc-14-Werror-callo.patch | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-tests-fix-build-against-upcoming-gcc-14-Werror-callo.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.189.bb b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
index e9b432e4e99..076ba473580 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.189.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
            file://0001-Add-helper-function-for-basename.patch \
+           file://0001-tests-fix-build-against-upcoming-gcc-14-Werror-callo.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0001-tests-fix-build-against-upcoming-gcc-14-Werror-callo.patch b/meta/recipes-devtools/elfutils/files/0001-tests-fix-build-against-upcoming-gcc-14-Werror-callo.patch
new file mode 100644
index 00000000000..5e0c7e97664
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-tests-fix-build-against-upcoming-gcc-14-Werror-callo.patch
@@ -0,0 +1,39 @@
+From 901c6a8c78c3c4eee244b9d5298cbd7b9aa713d1 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Thu, 21 Dec 2023 09:23:30 +0000
+Subject: [PATCH] tests: fix build against upcoming `gcc-14`
+ (`-Werror=calloc-transposed-args`)
+
+`gcc-14` added a new `-Wcalloc-transposed-args` warning recently. It
+detected minor infelicity in `calloc()` API usage in `elfutils`:
+
+    elfstrmerge.c: In function 'main':
+    elfstrmerge.c:450:32: error:
+      'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
+      450 |   newscnbufs = calloc (sizeof (void *), newshnums);
+          |                                ^~~~
+    elfstrmerge.c:450:32: note: earlier argument should specify number of elements, later size of each element
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=ae580d48278b9924da7503886b37be34378e1b04]
+Signed-off-by: Sergei Trofimovich <slyich@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/elfstrmerge.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/elfstrmerge.c b/tests/elfstrmerge.c
+index 56350bb..4eb58bb 100644
+--- a/tests/elfstrmerge.c
++++ b/tests/elfstrmerge.c
+@@ -447,7 +447,7 @@ main (int argc, char **argv)
+     }
+ 
+   newshnums = shdrnum - 1;
+-  newscnbufs = calloc (sizeof (void *), newshnums);
++  newscnbufs = calloc (newshnums, sizeof (void *));
+   if (newscnbufs == NULL)
+     fail_errno ("Couldn't allocate memory for new section buffers", NULL);
+ 
+-- 
+2.43.0
+
-- 
2.43.0


