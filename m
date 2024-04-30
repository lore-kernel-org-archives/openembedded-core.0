Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8E2C41513
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:24:48 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.271.1714512283273060076
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 14:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WA3xRefe;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1eac92f7c74so50212725ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 14:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714512282; x=1715117082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=znnihjFe0ZvlbbQ8tEl6oecvcqzDSs37TFFGtAKdqJU=;
        b=WA3xRefeuHUhZWXmxgwY7LpFGI0M2AcD1qaPtDwSqBWiY9LTsizX1sRczRLEljFkhV
         HWqFaUmLmXcHwpGaAnQC3J12ZD4YVCPoN3rAHpB1qbYa15818Gsb22rqv4snzzmwlA6y
         wj0W108Rbon+I3sXQHwr4vkbfak+ClPBadfwKgm/cnRhuTdndnZMeYmSK5sabAc1fIwe
         Mh5vlseaoaXGUrXYgcmxYRpLGbfkCOTbZto1gBs80fvnuruJDvCYTpqO+Qfmdu0lfjM/
         inRTtGmMm8vGRKjfgNFeQBFjeDGMijxUiBHG630eoEhAHN9mW9ewGAjU5dFoFfX/9dDq
         1W7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714512282; x=1715117082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=znnihjFe0ZvlbbQ8tEl6oecvcqzDSs37TFFGtAKdqJU=;
        b=v0X0pBkAoIe6lqpl64tQK6X89o6J7t1oA974twOdWieQmepn/3JgVm2otIyycOx8jJ
         FzL67b5+DZbtruF6kjClFAPX5H/glJ0NSq1fzsxeK7bHBTj1n2ZxHsgI7zoS7gAsMf0N
         sISUfDPFhvK+RYi4h4sWQaAVrxKWXtDRN00kcDF2w/eLHJYj3pCtw6OrXixpoT3ZM9Io
         dgAaTv/bIq0zuMqYmKmOxlV333nAKCv6MuW5FFr2vmV0J7+JesFCdPEWSvM7EsWY0OpC
         L+0qBAy9B2iF+mjp7JG8KvvKXm+FHfwT/Ce17KJ0UxjvEqZ71ydTqeJb1QsxxGBx5dcr
         Cr2g==
X-Gm-Message-State: AOJu0YzrGuZFPFG8CAnpuWNkzDW9mL39wqYFJCej/wKZct38fGbdQNjt
	s+fiptTEJRNB80JVHF8UC38ZI2ZoYA1KiJj+a+9pYScgOX2pydQu9OqJVh8QDhPt1rbi/AqYj89
	RAhI=
X-Google-Smtp-Source: AGHT+IGBWZdfp/ZgFk75kbpmvDejx1e8rGPbY9ZqI49NNLOc2VrIsTk0wCIFG8dZrNbQZOzTT1jrLQ==
X-Received: by 2002:a17:902:e891:b0:1eb:fe3:3436 with SMTP id w17-20020a170902e89100b001eb0fe33436mr696092plg.52.1714512282516;
        Tue, 30 Apr 2024 14:24:42 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001ea9580e6a0sm11193133pls.20.2024.04.30.14.24.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 14:24:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/17] lttng-tools: upgrade 2.13.11 -> 2.13.13
Date: Tue, 30 Apr 2024 14:24:00 -0700
Message-Id: <5e870221afd5e65fb70809ebe88d65a6c5a686ec.1714511660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714511660.git.steve@sakoman.com>
References: <cover.1714511660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 21:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198779

From: Wang Mingyu <wangmy@fujitsu.com>

0001-tests-do-not-strip-a-helper-library.patch
refreshed for 2.13.13

Changelog:
===========
* Fix: consumerd: leak of tracing buffers on relayd connectivity issue
* Fix: consumerd: wrong timer mentioned in error logging
* Fix: consumerd: type confusion in lttng_consumer_send_error
* Fix: baddr-statedump: use $(LIBTOOL) --mode=execute
* Fix: relayd: live client not notified of inactive streams
* Fix: relayd: live: dispose of zombie viewer metadata stream
* tests: Fix typo in tests/regression/kernel/test_ns_contexts
* Fix: sessiond: freeze on channel creation on restart
* common: move utils_create_lock_file to its own file
* tests: tools/clear/test_ust wait for specific test app pid
* Fix: sessiond: crash when sending data_pending to an active session
* Tests: fix: list_triggers_cli: kallsyms contains prefixed symbols
* License: common: error_query: fix typo in SPDX specifier

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5d35200e089f0695cfb19b65dd9b56006aa3d4fc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-tests-do-not-strip-a-helper-library.patch       | 9 +++------
 .../{lttng-tools_2.13.11.bb => lttng-tools_2.13.13.bb}   | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.11.bb => lttng-tools_2.13.13.bb} (99%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
index 2d08b08879..2f95889c4b 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-helper-library.patch
@@ -1,4 +1,4 @@
-From ab238c213fac190972f55e73cf3e0bb1c7846eb8 Mon Sep 17 00:00:00 2001
+From 2237748af00467ad8250a7ccd944200f811db69a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 12 Dec 2019 16:52:07 +0100
 Subject: [PATCH] tests: do not strip a helper library
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am b/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
-index 03f5d5a..d12c343 100644
+index 836f13e..e19a554 100644
 --- a/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
 +++ b/tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
-@@ -12,7 +12,7 @@ userspace_probe_elf_binary_LDADD = libfoo.la
+@@ -14,7 +14,7 @@ userspace_probe_elf_binary_LDADD = libfoo.la
  libfoo.strip: libfoo.la
  	$(OBJCOPY) --strip-all .libs/libfoo.so
  
@@ -22,6 +22,3 @@ index 03f5d5a..d12c343 100644
  	@if [ x"$(srcdir)" != x"$(builddir)" ]; then \
  		for script in $(EXTRA_DIST); do \
  			cp -f $(srcdir)/$$script $(builddir); \
--- 
-2.17.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.13.bb
similarity index 99%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.13.bb
index f6abd9e11a..174dec036e 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.13.bb
@@ -41,7 +41,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch \
            "
 
-SRC_URI[sha256sum] = "ac5baeef9fa690936b1ca01ecd1742da762c2c08511ff1b4e923938d94d0f979"
+SRC_URI[sha256sum] = "ff5f4f00b081dac66092afe8e72b7c790670931cf1c1ee0deaa7f80fbc53883e"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.34.1


