Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92918C001DE
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 07:08:38 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.5816.1690355314993741227
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 00:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=LmgGRzkL;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b8b2886364so33936925ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 00:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690355314; x=1690960114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kDF0XxqVCIJL+1//Uh1A5aEu8lDJ2oOOvHSr6+3LzZs=;
        b=LmgGRzkLPxEFSUV1t4Hb+pBjWadQRfvazpAfL3D4fWe0Rnt7qGl22rPXs8Jeq7CqRj
         xNjtE6xUcJbolfEWuwWyf3FXCm6kXJdUJPmoZ13CPBH+mFz/xf51tiKuYvmivOScF88m
         QtalkZoMY0lhJoMnpgkt2zkH2frJ7jnlLMlPxF2bdDwqNS3PsnG5YEubHPYakQrf+H3q
         BfmeThB73c2WyB7RNnI04Na811IEK6cDLE+fm2uIv3CWJl1c/fisR8xXd3C0ZnbtNqb2
         KGF/ovelJ7IpkoEi0G9Y4a7lZR6MFhDugKZaDpGmKL9JQoFHDUO2YL7VGyuI4BOC8gs4
         COtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690355314; x=1690960114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDF0XxqVCIJL+1//Uh1A5aEu8lDJ2oOOvHSr6+3LzZs=;
        b=Z63OqAwX+SYv2WLbMvwCQaCcASD/fpfdAxjKuzTxECKpWh9gtivy/rW8qsjJo1Hi97
         5r/zQCSk4Pa2+ntU5INn8ytoZ8TDxTReSyce50E2y2ROF2UQe9Unesgd0b24n3jsNDqL
         899rwG/9CL5R0HT5CL0+z6BmjD2JlalteU//CUFuJjxxL5WEru0za6GPK0Xl1XOIWe3I
         D1NKZpkm5OCjgCp8qD43U3jtNsehEzkmxlYyCcxq1/NXvnsL3TlpFeij1ymqrt3kWI8d
         gKfS2h9b/0mqMlhMSz+oVfRMvef68RfP1Bo/+HVuLVN388oFqGBiid7GEyOi9gkiXQbR
         FfSA==
X-Gm-Message-State: ABy/qLad8Br1hUtjAly0TEMliM9yWytctfrgZyaBRnq3oXIyLNgbXPUX
	zmU66/M3FsFW82rrGAeX3c+U1XmNIEuvaQ==
X-Google-Smtp-Source: APBJJlGQfUWKEaS136isQxNBnd+pPfszChwu2i77pKBIa+Z3WhdRsWLv39hF55LETQK6B3nlNFSudw==
X-Received: by 2002:a17:902:e314:b0:1bb:8cb6:2403 with SMTP id q20-20020a170902e31400b001bb8cb62403mr971613plc.20.1690355313896;
        Wed, 26 Jul 2023 00:08:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:6180::6adc])
        by smtp.gmail.com with ESMTPSA id d6-20020a170902cec600b001bb24cb9a40sm12294624plg.39.2023.07.26.00.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 00:08:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] nfs-utils: Fix host path contamination building locktest
Date: Wed, 26 Jul 2023 00:08:30 -0700
Message-ID: <20230726070830.1678078-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 07:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184866

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix build on ppc32

 ...t-Makefile.am-Do-not-use-build-flags.patch | 36 +++++++++++++
 ...locktest-Use-intmax_t-to-print-off_t.patch | 53 +++++++++++++++++++
 .../nfs-utils/nfs-utils_2.6.3.bb              |  2 +
 3 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-tools-locktest-Use-intmax_t-to-print-off_t.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch
new file mode 100644
index 00000000000..351407ddcd4
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch
@@ -0,0 +1,36 @@
+From 9efa7a0d37665d9bb0f46d2407883a5ab42c2b84 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 24 Jul 2023 20:39:16 -0700
+Subject: [PATCH] locktest: Makefile.am: Do not use build flags
+
+Using CFLAGS_FOR_BUILD etc. here means it is using wrong flags
+when thse flags are speficied different than target flags which
+is common when cross-building. It can pass wrong paths to linker
+and it would find incompatible libraries during link since they
+are from host system and target maybe not same as build host.
+
+Fixes subtle errors like
+| aarch64-yoe-linux-ld.lld: error: /mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nfs-utils/2.6.3-r0/recipe-sysroot-native/usr/lib/libsqlite3.so is incompatible with elf64-littleaarch64
+
+Upstream-Status: Submitted [https://marc.info/?l=linux-nfs&m=169025681008001&w=2]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/locktest/Makefile.am | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/tools/locktest/Makefile.am b/tools/locktest/Makefile.am
+index e8914655..2fd36971 100644
+--- a/tools/locktest/Makefile.am
++++ b/tools/locktest/Makefile.am
+@@ -2,8 +2,5 @@
+ 
+ noinst_PROGRAMS = testlk
+ testlk_SOURCES = testlk.c
+-testlk_CFLAGS=$(CFLAGS_FOR_BUILD)
+-testlk_CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
+-testlk_LDFLAGS=$(LDFLAGS_FOR_BUILD)
+ 
+ MAINTAINERCLEANFILES = Makefile.in
+-- 
+2.41.0
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-tools-locktest-Use-intmax_t-to-print-off_t.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-tools-locktest-Use-intmax_t-to-print-off_t.patch
new file mode 100644
index 00000000000..7d903e04bc1
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-tools-locktest-Use-intmax_t-to-print-off_t.patch
@@ -0,0 +1,53 @@
+From e2e9251dbeb452f5382179023d8ae18b511167a1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 25 Jul 2023 23:47:08 -0700
+Subject: [PATCH] tools/locktest: Use intmax_t to print off_t
+
+off_t could be 64bit on 32bit architectures which means using %z printf
+modifier is not enough to print it and compiler will complain about
+format mismatch
+
+Fixes
+| testlk.c:84:66: error: format '%zd' expects argument of type 'signed size_t', but argument 4 has type '__off64_t' {aka 'long long int'} [-Werror=format=]
+|    84 |                         printf("%s: conflicting lock by %d on (%zd;%zd)\n",
+|       |                                                                ~~^
+|       |                                                                  |
+|       |                                                                  int
+|       |                                                                %lld
+|    85 |                                 fname, fl.l_pid, fl.l_start, fl.l_len);
+|       |                                                  ~~~~~~~~~~
+|       |                                                    |
+|       |                                                    __off64_t {aka long long int}
+
+Upstream-Status: Submitted [https://marc.info/?l=linux-nfs&m=169035457128067&w=2]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/locktest/testlk.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/tools/locktest/testlk.c b/tools/locktest/testlk.c
+index ea51f788..9d4c88c4 100644
+--- a/tools/locktest/testlk.c
++++ b/tools/locktest/testlk.c
+@@ -2,6 +2,7 @@
+ #include <config.h>
+ #endif
+ 
++#include <stdint.h>
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <unistd.h>
+@@ -81,8 +82,8 @@ main(int argc, char **argv)
+ 		if (fl.l_type == F_UNLCK) {
+ 			printf("%s: no conflicting lock\n", fname);
+ 		} else {
+-			printf("%s: conflicting lock by %d on (%zd;%zd)\n",
+-				fname, fl.l_pid, fl.l_start, fl.l_len);
++			printf("%s: conflicting lock by %d on (%jd;%jd)\n",
++				fname, fl.l_pid, (intmax_t)fl.l_start, (intmax_t)fl.l_len);
+ 		}
+ 		return 0;
+ 	}
+-- 
+2.41.0
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
index 44542857897..e703395cc4f 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
@@ -31,6 +31,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://clang-warnings.patch \
            file://0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch \
+	   file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
+	   file://0001-tools-locktest-Use-intmax_t-to-print-off_t.patch \
            "
 SRC_URI[sha256sum] = "38d89e853a71d3c560ff026af3d969d75e24f782ff68324e76261fe0344459e1"
 
-- 
2.41.0


