Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BC8C47092
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:42 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.23798.1648998856641585349
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 08:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iP4XvYtA;
 spf=temperror, err=temporary DNS error (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id k23so11702055ejd.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 08:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0nnTMaj8JzDn1Ip5YsVRn27yLUL/YlNdpb4DKJihIOc=;
        b=iP4XvYtAVibFu1Ny7RgT2w4eY5COpsxixVLJrwt3ANmKAmEMybYmGBHfgnRrWMeybE
         DlM3ps1Ui1nkpIQ1iT8KYFL4M9trnJFbCrkPwGXtrdhGiCL+MLgT/ADqvTK9gutssTCv
         8Adoj6hMu0U4uF3lQ22vQJ2eEcMDyc24TumzpcWfPtBKypm73Qm48t22/nXfxAqi7CK2
         kn/gEjMr1MC2TuxiLcy290fa+AUzEYvkWW2OiGeWODS2fdSU+7j9atMbdYXyHzdCveoo
         QPBqFNWYR/nxA6Vn0sycJpyEfrCNsLUwf3WQmO1TMpC1EpUpGxvvrDYrA0CHWDGPaWfE
         6njA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0nnTMaj8JzDn1Ip5YsVRn27yLUL/YlNdpb4DKJihIOc=;
        b=Sz00RunXc5vn6JV6qP9KZ2JLuAXGhuW7XovJeIKq3bIOG6YnazkAsarsTr2pO0LzRZ
         n4u7RvNB9yMLwIiyHCQTDiZJ7wFLIlFcDIHABfgKhh7/RcNXHy7g39obJLZc+BbTE/HA
         1a93ejFFhcqr2SCGrMk5nUuPQ5QYg2asbfMGJxv9Y7UxOxAl+Z75LztRQr0oBQA6bwK1
         ffN8ea61UhfB7B8VJM5FctkPs3/0veWxmTmeUuji0YE+MspKgt77NlbtpSbVLzUpN35H
         TqLuf/mwPNyCd0ckZ+CYFGAdcnAlBffFONxGyKB9N1bYskQ69r8dZG3pLm1X0i9E6aeB
         73Dg==
X-Gm-Message-State: AOAM533y0h/2dlA5O0J+6QYokWW5ADw943etqGCeEdvUXRyOiyBA3ddx
	hPZ1Vg0c2KJmhrGr+1WyqIsxWmvmcTQ=
X-Google-Smtp-Source: 
 ABdhPJwJkHMTTDAbpDiRK8kEsdRV6AvHUgdoeB7gS+nGUYBa6jIDNtvo9aQhrrsCDQtn/+6F0VTTVg==
X-Received: by 2002:a17:907:3e1c:b0:6e4:e1b3:5384 with SMTP id
 hp28-20020a1709073e1c00b006e4e1b35384mr7351280ejc.700.1648998854817;
        Sun, 03 Apr 2022 08:14:14 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 rh26-20020a17090720fa00b006e0da7ef847sm3334708ejb.13.2022.04.03.08.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 08:14:14 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [dunfell][PATCH] boost-native: fix build on recent host distros
Date: Sun,  3 Apr 2022 17:14:09 +0200
Message-Id: <20220403151409.2664838-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163960

The same build error as reported with Solaris occurred on a Fedora 35
machine. The problem is already fixed upstream.
Related PR:
 https://github.com/boostorg/thread/pull/297
Related commit:
 https://github.com/boostorg/thread/commit/e54f7e39606b807b8f9fc84fbd58cafeabea6562

Since the patch only deals with a build warning, it seems safe to apply
it always not just for native builds.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/recipes-support/boost/boost_1.72.0.bb    |  1 +
 ...-elide-a-warning-that-caused-Solaris.patch | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-support/boost/files/0001-Revert-change-to-elide-a-warning-that-caused-Solaris.patch

diff --git a/meta/recipes-support/boost/boost_1.72.0.bb b/meta/recipes-support/boost/boost_1.72.0.bb
index df1cc16937..23595da930 100644
--- a/meta/recipes-support/boost/boost_1.72.0.bb
+++ b/meta/recipes-support/boost/boost_1.72.0.bb
@@ -9,4 +9,5 @@ SRC_URI += " \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
            file://0001-revert-cease-dependence-on-range.patch \
            file://0001-added-typedef-executor_type.patch \
+           file://0001-Revert-change-to-elide-a-warning-that-caused-Solaris.patch \
            "
diff --git a/meta/recipes-support/boost/files/0001-Revert-change-to-elide-a-warning-that-caused-Solaris.patch b/meta/recipes-support/boost/files/0001-Revert-change-to-elide-a-warning-that-caused-Solaris.patch
new file mode 100644
index 0000000000..97111ce2f8
--- /dev/null
+++ b/meta/recipes-support/boost/files/0001-Revert-change-to-elide-a-warning-that-caused-Solaris.patch
@@ -0,0 +1,26 @@
+From 019dd7cea49659e45e12d2b44480c133372ab401 Mon Sep 17 00:00:00 2001
+From: Rob Boehne <robb@datalogics.com>
+Date: Wed, 20 Nov 2019 11:25:20 -0600
+Subject: [PATCH] Revert change to elide a warning that caused Solaris builds
+ to fail.
+
+---
+ boost/thread/pthread/thread_data.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/boost/thread/pthread/thread_data.hpp b/boost/thread/pthread/thread_data.hpp
+index aefbeb43c..bc9b1367a 100644
+--- a/boost/thread/pthread/thread_data.hpp
++++ b/boost/thread/pthread/thread_data.hpp
+@@ -57,7 +57,7 @@ namespace boost
+ #else
+           std::size_t page_size = ::sysconf( _SC_PAGESIZE);
+ #endif
+-#if PTHREAD_STACK_MIN > 0
++#ifdef PTHREAD_STACK_MIN
+           if (size<PTHREAD_STACK_MIN) size=PTHREAD_STACK_MIN;
+ #endif
+           size = ((size+page_size-1)/page_size)*page_size;
+-- 
+2.35.1
+
-- 
2.35.1


