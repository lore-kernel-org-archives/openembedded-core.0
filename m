Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C31C46CD2
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 06:09:03 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.16378.1703225339461881195
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 22:08:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WcNNDx8o;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: mail2szahir@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3bb8977162aso262499b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 22:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703225338; x=1703830138; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6BWOxo0/0+wwkj2NDnAuUv2wreBb7zbLxyLUPuA2ic=;
        b=WcNNDx8o8MLUuLs8xQNtYHj4HsxHxvCeW8/45r1I/Hubp+j9zp6Nz7kHx6avSO0D+x
         ZY76ufkzoFTw6DGs3ALR1C8Ul1ltQ0pUryjL33f+JaKlOag1OFG4F9d2LN1mj/3YVaSv
         1ozIk6aySk6l3W622xF3jKYGDwhpests5tb65RAzncMDZLF79Fo0nUb66Mx3c7Sr9JWY
         mW5DTUaefhQQipqZBP6qHI3BvMYKRUf8FdDyf/g6jrOOObAJPYPuQELG+E1HLyCHbYJU
         Zd0WWrzIns3W/ZRjmNor6yhpHmin5DthDfG5k+WhPe09bjvIzBjK68DRvmE0MK2DNeLE
         0btw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703225338; x=1703830138;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6BWOxo0/0+wwkj2NDnAuUv2wreBb7zbLxyLUPuA2ic=;
        b=Xj2cUbpp7DRFFi9pE8VQdj/xyMYcdXnWe3WwpslWej9VltvdD99el69UKf9KeJCOVZ
         DibdkBduZW96yW/O2za/HRtlocivQL5UBbc5jbDqd7lB85mbkGgS3yB8e3L3foIgU5s3
         2lJMFH9HHcaPrh0Ga29VU3PnVT+FWYHS6HBWlwBpKh8xnLGQ3ohnfWapI/j2CRxM3rGi
         wpQSyrgE/FCJp6dxHcWE+goNZgQ1sCO6is5YRYWpgwE1fOgQ6LrdVcTjScdxRuzpRyEQ
         il8N5k99THztYUiKQ/u1jxMgqd6tPn1ho5NAP5oSfKVXywWUBGx936gSU45JJK0wZNsp
         cJOw==
X-Gm-Message-State: AOJu0YzbEXirCkPw/i92rU+QEGPak0UtSknkCZKJtwCR55KR+XA3UJFj
	rZPWhiSWlwvLmN+P8MEmTCtKpSQvUwg=
X-Google-Smtp-Source: AGHT+IF7E9dew6473BjprXxuVitfj/X4T/3w2csi8I4JePx5++nbECqN+0ibW/7A5f7rkerqePX4eA==
X-Received: by 2002:a05:6358:789:b0:173:6a2:4f60 with SMTP id n9-20020a056358078900b0017306a24f60mr749870rwj.42.1703225338331;
        Thu, 21 Dec 2023 22:08:58 -0800 (PST)
Received: from localhost.localdomain ([49.43.251.132])
        by smtp.gmail.com with ESMTPSA id 19-20020aa79253000000b006c3069547bfsm2591207pfp.79.2023.12.21.22.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 22:08:57 -0800 (PST)
From: aszh07 <mail2szahir@gmail.com>
To: openembedded-core@lists.openembedded.org,
	mail2szahir@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Zahir Hussain <zahir.basha@kpit.com>
Subject: [OE-core][kirkstone][PATCH] alsa-lib: Enabling ptest for alsa-lib component
Date: Fri, 22 Dec 2023 11:36:02 +0530
Message-Id: <20231222060602.11124-1-mail2szahir@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 06:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192859

From: Zahir Hussain <zahir.basha@kpit.com>

This change adds ptest for alsa-lib.

1) Adding CFLAGS change for include the header file path for resolving
 below compilation issue;
        In file included from ../../../alsa-lib-1.2.1.2/test/lsb/config.c:4:
        ../../../alsa-lib-1.2.1.2/test/lsb/test.h:5:10: fatal error:
        alsa/asoundlib.h: No such file or directory
        5 | #include <alsa/asoundlib.h>

2) Removed the test suite execution 'make' call using 'sed' command.

3) Compiled the test directory source code using "oe_runmake check" command.

4) Copied all the required binaries into PTEST path using do_install_ptest()
 function.

Signed-off-by: aszh07 <mail2szahir@gmail.com>
Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../alsa/alsa-lib_1.2.6.1.bb                  | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 5c6a30635f..1a91880321 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -5,6 +5,7 @@
 #
 PTESTS_FAST = "\
     acl-ptest \
+    alsa-lib-ptest \
     apr-ptest \
     apr-util-ptest \
     attr-ptest \
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb
index ca6bedae97..3794f31baf 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb
@@ -42,3 +42,22 @@ RREPLACES:alsa-conf = "alsa-conf-base"
 RCONFLICTS:alsa-conf = "alsa-conf-base"
 
 BBCLASSEXTEND = "native nativesdk"
+
+EXTRA_OEMAKE:append = " AM_CPPFLAGS=-I${S}/include"
+
+do_compile:append() {
+        sed -i 's/^.*$(MAKE) $(AM_MAKEFLAGS) check-TESTS.*$/ /' ${S}/test/lsb/Makefile.in
+        oe_runmake check
+}
+
+do_install_ptest:append() {
+    for f in control client_event_filter namehint
+    do
+        install -m 0755 "${B}/test/.libs/$f" "${D}${PTEST_PATH}";
+    done
+
+    for f in config midi_event
+    do
+        install -m 0755 "${B}/test/lsb/.libs/$f" "${D}${PTEST_PATH}";
+    done
+}
-- 
2.17.1


