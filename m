Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F33C36001
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:42:20 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.7374.1742420538610249111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 14:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cEIXYriu;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2254e0b4b79so869435ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 14:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742420538; x=1743025338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e1//C5f+cDIyqp/SSDe+JcoDCw4ACDBF8//yc/IKcaw=;
        b=cEIXYriuuWePSaGr/d/VQNdQdf2UhycnvaZPUXw1QtCiYa2vTo3ExguCIPI1semUp0
         33wJukaYAYPbttHnv6+429YH0gOyGbOLWXjnv9BQz2jT6pOSBn0OousIhy8GARhGH3DT
         reIbcS/j6tXmedrx86+vg8vTdY7bdAC81u22tQ0L/O8rIJ581po1OfjqNHxEayG5o9nv
         DdXf09WHxm3RMb7n7s0ZUlm071f0Fg3am+1BeLF0nnef2oOah5y2N1Gw39+/JPwjJHeF
         bShK/yOs7W84fi1SpiuwS3E9hAHB6H63xAP2aSFsiaFE1jXpMdTtxqZuxAPQZBiA6oT5
         Kgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742420538; x=1743025338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1//C5f+cDIyqp/SSDe+JcoDCw4ACDBF8//yc/IKcaw=;
        b=ijKxIBmZvajocm+r7RNVpkwQLbFa12AXTNCRUtxHCwz3vowEiaTYpTeglUjhsVuEbb
         pxIpIdFMgcCtSCUPzHSmTnrxFF/gNP6wDToFS3WPB+OafQWiAXfe7pzSd/6HE2Dexv3v
         5QvNPf+rdUFShcc0tAvKRVCwrE9qjU99/CvJGehnxUO35wHIJsFCegJog3NNZEcf/Hpe
         keGI/yYLEdITanrC3Bu7fcku7YKy5rmVDHhLDlbbP/HbZfiK0Dy1cxHltjLhDJB0w8g4
         xSbXGeHRUCBZcIrtc09OccsqyP+QPLRwgvKjioSI/Qp3pgrJnD76o8D1fGR/t7RbvAcJ
         1UTA==
X-Gm-Message-State: AOJu0YwwrsuhWZWT19o0hRZ3nyUJ4KA0KS7IBilUuJf5m6PXih+BL2lO
	x5axcDlboEcm/X75UYs6m56LmPm2fMzOIhaeGOuMsSSa4nw+CGK9lPERF+3c
X-Gm-Gg: ASbGncuFUWm0SVK6XpilqmztyuPw1nukkqFIS48ngrVkFNP85bkXX9CYTfk/OPzRsC3
	EUk87bhg7vzSEpObWOo9i5beouEB0atIySRv7Q32yFb95/N6VLcAZuJjkCyMssyywd6enahFOOM
	NnOoaTr0TglNhWN+QVWdv2/fqLqfnXs+3w3IbkaZ5lDunaRKzEVmm0Zy2fQHrMQdlx1GteNZOLo
	5RoqmWkf84rn0QgXGTR9bT2IyX3/WsZXgmZ4l/uoKeZiPb63cqyXwfIhNt6h7fkWwBloP/Ibhdc
	qNibHjf25CH97C9GoUwZmhyZfGbErHZPxgsc
X-Google-Smtp-Source: AGHT+IFSr2S+WplLCiTxPV5WT8f2oVqOzOJGUjSlK7LJJzbCLNa1U2VKfj0k9bItq5IMFP7pK7wT1Q==
X-Received: by 2002:a05:6a00:4b13:b0:736:4704:d5da with SMTP id d2e1a72fcca58-7377aa5debbmr1259945b3a.22.1742420537710;
        Wed, 19 Mar 2025 14:42:17 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73766322e03sm3604964b3a.99.2025.03.19.14.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:42:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 1/9] readline: Fixed build with GCC-15
Date: Wed, 19 Mar 2025 14:42:04 -0700
Message-ID: <20250319214213.2505249-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 21:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213356

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ages-that-are-not-compatible-with-C2.patch | 29 +++++++++++++++++++
 meta/recipes-core/readline/readline_8.2.13.bb |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/readline/readline/0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch

diff --git a/meta/recipes-core/readline/readline/0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch b/meta/recipes-core/readline/readline/0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch
new file mode 100644
index 00000000000..3bb4d539601
--- /dev/null
+++ b/meta/recipes-core/readline/readline/0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch
@@ -0,0 +1,29 @@
+From 9459ee899a291c55f08341df63e9a1b9b7af200a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 16 Mar 2025 12:48:46 -0700
+Subject: [PATCH] Add fix for packages that are not compatible with C23
+
+Fixes builds with GCC-15
+Sourced from Fedora: https://src.fedoraproject.org/rpms/readline/c/c47eb813afb942128253213ad5b8221770557e48?branch=rawhide
+
+Help getting packages like bluez5 building
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-readline/2025-03/msg00001.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ rlstdc.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rlstdc.h b/rlstdc.h
+index 2aaa30b..a7a0ef3 100644
+--- a/rlstdc.h
++++ b/rlstdc.h
+@@ -44,7 +44,7 @@
+ 
+ /* Moved from config.h.in because readline.h:rl_message depends on these
+    defines. */
+-#if defined (__STDC__) && defined (HAVE_STDARG_H)
++#if defined (__STDC__)
+ #  define PREFER_STDARG
+ #  define USE_VARARGS
+ #else
diff --git a/meta/recipes-core/readline/readline_8.2.13.bb b/meta/recipes-core/readline/readline_8.2.13.bb
index 78b988365a6..19b5cb6f583 100644
--- a/meta/recipes-core/readline/readline_8.2.13.bb
+++ b/meta/recipes-core/readline/readline_8.2.13.bb
@@ -1,5 +1,7 @@
 require readline.inc
 
-SRC_URI += "  file://norpath.patch"
+SRC_URI += "file://norpath.patch \
+            file://0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch \
+            "
 
 SRC_URI[archive.sha256sum] = "0e5be4d2937e8bd9b7cd60d46721ce79f88a33415dd68c2d738fb5924638f656"

