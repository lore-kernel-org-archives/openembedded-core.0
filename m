Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C381C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:35:09 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.11493.1634657707840342043
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ESixkSWu;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id g2so12488379wme.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tw8x031pwAgudcD6aTOUncdViatR88W160SebGrAFCQ=;
        b=ESixkSWuvRMsmkfxJQxI3mqiCst2uIU80CSVUw0XhnrC7KwhfMAkCVH6LyumR/EJIA
         +CHEDET/9DlnQtwUxQA2HAd0ysOa34wqogF99d9fd802QVkt9QOwjmX40c9ZY4e35Fhu
         l0Z4tQGciCDwvhPEBHCXfdPnRix1cnvx1PYle3u0G+YVNxKoVykaB0ycnDiOXfmo9+Rd
         1nX87XAUnF2YLWQd2shC1FNKvPMHYoQ00M2hVmmSkOajhSeKaALLaGK0SvMGn1IiSRMF
         FKPJNIHwI5fBt6ky2iPDyRbu17OaetkDUD0bAm7mFwPVw7VAirf5rtuHKMKH25Oeveo5
         ttvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tw8x031pwAgudcD6aTOUncdViatR88W160SebGrAFCQ=;
        b=JQwTfDlU4b2a85OXDXiQ6592EjfRTZE0f8z3cp7mFGNICREP6Fe4BAj1Gh2El6hSVV
         yuCL9VNWsBxVGBhnLCeBv0r0uPtNMVCqj8VSB++8GnLuLTNXB7cV/FCl6mGIP0x57PoQ
         pyGKwl4/28T8MiocbHBUW6GlSigZyVgFnJOMd7MentwB+k41A/ieezpBN6r3Qz57StjC
         pRxTfoBWfn1T0SIn13vcE3MkNiW6o4VU4+dXV9nHcHJAv2l9F/bwgwh6A8neF3RAupqU
         LJA8Z5WxM22XYPsEMZXntxTl/0G222NRq3q3PWBUvm8J0aY3oc6T4g3MvRG2JMVHq7NN
         Ambg==
X-Gm-Message-State: AOAM533nsEHS9lTQG0eDzfy1rf6eosTjb6zcIEaeh/KQWyopte91abaw
	jOZhyQOK/kKjsWAIrqJqlcDVr5jUutA=
X-Google-Smtp-Source: 
 ABdhPJwwI3VkTLgI9SG5H6bFLyxcHECCWE8gfo/+x+RzvsRA3aal2GRT0BnB3S5XzpCANCWuAfucew==
X-Received: by 2002:adf:9d47:: with SMTP id o7mr45423720wre.50.1634657706488;
        Tue, 19 Oct 2021 08:35:06 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:35:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 60/65] libcap: upgrade 2.54 -> 2.59
Date: Tue, 19 Oct 2021 17:34:14 +0200
Message-Id: <20211019153419.3319802-60-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:35:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157179

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...dk-libcap-Raise-the-size-of-arrays-containing.patch |  6 ++----
 .../0002-tests-do-not-run-target-executables.patch     | 10 +++++-----
 .../libcap/{libcap_2.54.bb => libcap_2.59.bb}          |  2 +-
 3 files changed, 8 insertions(+), 10 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.54.bb => libcap_2.59.bb} (96%)

diff --git a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
index c7bf1a8b8c..6e43ba3366 100644
--- a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
+++ b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
@@ -1,4 +1,4 @@
-From 794cebc5732908636f22a1d9843fed3ae664899a Mon Sep 17 00:00:00 2001
+From 75843ed8238523776683a8660621d74c06597f11 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 14 Oct 2021 15:57:36 +0800
 Subject: [PATCH] nativesdk-libcap: Raise the size of arrays containing dl
@@ -14,6 +14,7 @@ the strings in a certain path.
 Upstream-Status: Inappropriate [SDK specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  libcap/execable.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -31,6 +32,3 @@ index 0bcc5d4..6e2a080 100644
      SHARED_LOADER ;
  
  static void __execable_parse_args(int *argc_p, char ***argv_p)
--- 
-2.27.0
-
diff --git a/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch b/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
index 0fe7295a5f..20346cf2fb 100644
--- a/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
+++ b/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
@@ -1,4 +1,4 @@
-From cc97f84469ee7b266977a20d9cfa63c52f821384 Mon Sep 17 00:00:00 2001
+From 10212b6d4e8843feffbeab5336342d97f3a46bb2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 20 Dec 2019 16:54:05 +0100
 Subject: [PATCH] tests: do not run target executables
@@ -11,20 +11,20 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/tests/Makefile b/tests/Makefile
-index d9ed248..2864f77 100644
+index ecb7d1b..8950c73 100644
 --- a/tests/Makefile
 +++ b/tests/Makefile
-@@ -63,13 +63,11 @@ endif
+@@ -61,13 +61,11 @@ endif
  
  # unprivileged
  run_psx_test: psx_test
 -	./psx_test
  
  psx_test: psx_test.c $(DEPS)
- 	$(CC) $(CFLAGS) $(CPPFLAGS) $< -o $@ $(LINKEXTRA) $(LIBPSXLIB) $(LDFLAGS)
+ 	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $< -o $@ $(LINKEXTRA) $(LIBPSXLIB)
  
  run_libcap_psx_test: libcap_psx_test
 -	./libcap_psx_test
  
  libcap_psx_test: libcap_psx_test.c $(DEPS)
- 	$(CC) $(CFLAGS) $(CPPFLAGS) $< -o $@ $(LINKEXTRA) $(LIBCAPLIB) $(LIBPSXLIB) $(LDFLAGS)
+ 	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $< -o $@ $(LINKEXTRA) $(LIBCAPLIB) $(LIBPSXLIB)
diff --git a/meta/recipes-support/libcap/libcap_2.54.bb b/meta/recipes-support/libcap/libcap_2.59.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.54.bb
rename to meta/recipes-support/libcap/libcap_2.59.bb
index fe29f05483..3d2592d962 100644
--- a/meta/recipes-support/libcap/libcap_2.54.bb
+++ b/meta/recipes-support/libcap/libcap_2.59.bb
@@ -16,7 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "5091b24247999fd7a5e62bd9ac8bc761cda29f9baa0d1a2ca6a46f13891b4f0f"
+SRC_URI[sha256sum] = "49f64ae40b113e53cbc161e22af7094e3bb4a0611fa33ef5a4257b011779f034"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.20.1


