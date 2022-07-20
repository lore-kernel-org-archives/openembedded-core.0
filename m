Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25EE8CCA487
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:25 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web12.51539.1658306721244581034
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WmGybyQN;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id e15so22873118edj.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OHKpsz1jsX8ZbuBodHvpm2xBC6TX5OUZQCmlfDEGAaA=;
        b=WmGybyQN2v52oIJZQG4gHaCkY17zOQUmoZgCHTUA36cG3Fu+QOWPUURohQAPzSWxeO
         qusLx/gUgUKsoENS3gstBViRpO+gXni96gGye6h1vf9FwH6/1otH96OS0/sJpf9ojFQg
         9EasUW8WncRW3VU0eX/VsZrCFFw072hi6rQrOP8nsJF15Kj7wpMEl+GxK1lK5wjlc8mq
         WYTtPmAugd9o0gFY6ikCAQ2Ts6oO6UKIHnJOob0yAM5wpsxPtHsogvN17pgYutLFzRRC
         1YVOlcJTLLumsLlwKSd3ACJh3eJnA48MCT+QVNMKPC3CAZK1j3IPblNtPdjez3JNl+Ku
         wuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OHKpsz1jsX8ZbuBodHvpm2xBC6TX5OUZQCmlfDEGAaA=;
        b=3ZQT4GezspC3B0ZVmstZd+p8aA+3G+scMQEtCag0k5QlkHXaJZuJEsxMk8BNFAYxiK
         NkwkBFBLA3y0NCCGFO0Y/ppJwjzwLBWEKpz990Fut3fib2XFldSYQKCKyNWnCInCDmWM
         2hsRxUadTjXlY+gdZQ79b4GKIJjXy0leD1xZ9MCbzYu2s7itCbNrx0TPHXqYjaRHm5Vo
         qIqMELjraQEeZ4DYm2ER6dgf+X1GfnwMi6TSnaQJNQW5Z6OZoP2Mln/sGWWT7KDFW9E1
         dLArvwdBqvBbEXXQ7VK88bs3OBVIHKpbXX7QHuMQrABCaJCrnjwais4dRowWBadCMKKI
         wXtA==
X-Gm-Message-State: AJIora8tAZ1s8Q9IyRU2WOAnJyoqgFWn8x7Dy55ZUQ3i/5l+IL6HTL+Z
	7C9ox3wbO+0KkanfDeI/lCUkwQ3YDwQ=
X-Google-Smtp-Source: 
 AGRyM1sbGFaZKltMASM5wDvlLw+tmFHrt1D6sb+UlLukELsAl4wot19PpAVW2tBQth8WIbNOh6gkXw==
X-Received: by 2002:a05:6402:4011:b0:43a:84de:26b1 with SMTP id
 d17-20020a056402401100b0043a84de26b1mr48571523eda.402.1658306719804;
        Wed, 20 Jul 2022 01:45:19 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 31/51] libnl: upgrade 3.6.0 -> 3.7.0
Date: Wed, 20 Jul 2022 10:44:22 +0200
Message-Id: <20220720084442.2940187-31-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168325

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...97f8982544c4fcb403893bae6701230d5165.patch | 48 -------------------
 .../libnl/{libnl_3.6.0.bb => libnl_3.7.0.bb}  |  8 ++--
 2 files changed, 3 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-support/libnl/files/fa7f97f8982544c4fcb403893bae6701230d5165.patch
 rename meta/recipes-support/libnl/{libnl_3.6.0.bb => libnl_3.7.0.bb} (91%)

diff --git a/meta/recipes-support/libnl/files/fa7f97f8982544c4fcb403893bae6701230d5165.patch b/meta/recipes-support/libnl/files/fa7f97f8982544c4fcb403893bae6701230d5165.patch
deleted file mode 100644
index 02662c939e..0000000000
--- a/meta/recipes-support/libnl/files/fa7f97f8982544c4fcb403893bae6701230d5165.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From fa7f97f8982544c4fcb403893bae6701230d5165 Mon Sep 17 00:00:00 2001
-From: Thomas Haller <thaller@redhat.com>
-Date: Fri, 15 Apr 2022 13:29:49 +0200
-Subject: [PATCH] build: avoid building check-direct with --disable-static
-
-"check-direct" needs to statically link with the libraries, because
-it wants to test internal ABI, which is hidden in the share libraries.
-When configuring with "--disable-static", static libs are not build
-and the test tool cannot be build.
-
-Just skip the test in that case.
-
-https://github.com/thom311/libnl/issues/306
-Upstream-Status: Backport [https://github.com/thom311/libnl/commit/fa7f97f8982544c4fcb403893bae6701230d5165]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- Makefile.am  | 2 ++
- configure.ac | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index a6bcf553..2f5e0dfc 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -984,8 +984,10 @@ tests_check_all_LDADD = \
- 	$(NULL)
- 
- if WITH_CHECK
-+if ENABLE_STATIC
- check_programs += tests/check-direct
- endif
-+endif
- 
- tests_check_direct_SOURCES = \
- 	tests/check-direct.c \
-diff --git a/configure.ac b/configure.ac
-index 1f9ad0eb..0fd1cc0f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -107,6 +107,8 @@ else
-     AC_CHECK_LIB([pthread], [pthread_mutex_lock], [], AC_MSG_ERROR([libpthread is required]))
- fi
- 
-+AM_CONDITIONAL([ENABLE_STATIC], [test "$enable_static" != "no"])
-+
- AC_ARG_ENABLE([debug],
- 	AS_HELP_STRING([--disable-debug], [Do not include debugging statements]),
- 	[enable_debug="$enableval"], [enable_debug="yes"])
diff --git a/meta/recipes-support/libnl/libnl_3.6.0.bb b/meta/recipes-support/libnl/libnl_3.7.0.bb
similarity index 91%
rename from meta/recipes-support/libnl/libnl_3.6.0.bb
rename to meta/recipes-support/libnl/libnl_3.7.0.bb
index af3aa41040..ddcc83a039 100644
--- a/meta/recipes-support/libnl/libnl_3.6.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.7.0.bb
@@ -14,14 +14,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = " \
-           https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV').replace('.','_')}/${BP}.tar.gz \
+SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV').replace('.','_')}/${BP}.tar.gz \
            file://enable-serial-tests.patch \
            file://run-ptest \
-           file://fa7f97f8982544c4fcb403893bae6701230d5165.patch \
-          "
+           "
 
-SRC_URI[sha256sum] = "532155fd011e5a805bd67121b87a01c757e2bb24112ac17e69cb86013b970009"
+SRC_URI[sha256sum] = "9fe43ccbeeea72c653bdcf8c93332583135cda46a79507bfd0a483bb57f65939"
 
 
 UPSTREAM_CHECK_URI = "https://github.com/thom311/${BPN}/releases"
-- 
2.30.2


