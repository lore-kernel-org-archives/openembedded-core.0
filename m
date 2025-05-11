Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D73C3ABCB
	for <webhook@archiver.kernel.org>; Sun, 11 May 2025 21:14:18 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.36479.1746998054406585828
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 May 2025 14:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L0slF27f;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-740b3a18e26so2936586b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 May 2025 14:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746998053; x=1747602853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iceIfFvsOtqMwrrEAvLo6ToXiTZ1eKmRrzbAkK85+Wc=;
        b=L0slF27fTkzblCSXwKsahuSkf5v27zTgKs4BeXYaGLwC5bNxvNy+DsRsqYX+429ywY
         5ce36/7LXr4E2uSiVtfi0gY4fTjkAs+W0ESBTmAwilnhX/g+vBDkhSWzrw6M0xF0STkM
         chjaHGpPc5Ug9ATnUXZJ26oxPLv69WkW8IB7R7a7O0w7qR7V6w717S5GL4v3zNu99F2f
         t9n7AqQ3KrAYDjkER6iho9aZQAToJKBCKfQd6O9kkduRQ2EM2yePvq1o5Ypu+t/K5vWU
         OAwaXUaqc+Wcqu7Ib3JirMn4/CYWPX5Urg8Bw57ZW8H82eyUHIHsZzP7vYIcuKBhvwTg
         GIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746998053; x=1747602853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iceIfFvsOtqMwrrEAvLo6ToXiTZ1eKmRrzbAkK85+Wc=;
        b=fzUdV3/BAaG6PgXowUhCbeyYm6VjTe75QRYqixc8buRkZzxPzNH3Jl2Uxuv5B5ngjz
         Hdbk9Tq/TBVXS/0bohtsU/7L7TxBAFDZK3xGFnVWmNht43ta3KFndK3l+6e27HDEANmJ
         piExPBVeqWghZR9eNSj2FYWFc18UiXNNXapYN2nyH/CWhC+QroDgKDBV9onOmMWqSIoW
         lTlpUG/Zvrhs6xXLLumzpXmvJhq+Yj9zb4rm+GOShouXfQZPM402sy3Bd00qVXkuRQsR
         XBMRlmKFS51zPuauixBQ6ToSb12HeohZGZk0Icev5ocvn9k0vOfeX3MgdZjOfK0NdJDc
         lm9g==
X-Gm-Message-State: AOJu0YyNJ5HvUjKx7IAYCkCmWFYiUpY8hOsOcGi55lnxO0eCAGiVTNlS
	y91rOl92vM9vArBBO6kOzVEdCogK/YmRryU1EjboTVCwkcZEGGMc/ehWc3t9
X-Gm-Gg: ASbGncvjA7GNFj3UpY7oNKiSKLwUScBz8+70tdWmcmAdioNuZdIXzUcnRCg+fs4Ypwb
	BELBH7tcD7/EZ/iazH1u1naLkz+vRmZeIe42pihdQH0S9yzQc78gNOpWTgaSIGwdXRUT/PSPY2M
	s2X8sm0gtAuEr407GLA0SsZrbuM2YUKgICTz2uTJvn6Zk2c0Mwp5xZ/HxOY139F9zEJTXg9U/Kq
	C2oJMgLCDQoIteoOfhEGqwp/dokDzoaEQTJAdBtov5lvRdGgi2NJgMnnTun3TR9ZbOvPj2LpFkl
	3q7Mo54qv8PFFi8v8mtj5g27IFtc/W75YzLzqhgnj4oDww+0gbzNVA==
X-Google-Smtp-Source: AGHT+IFvd5ZR3D7+350bKZSi7mRUS0K68lN67MyBuHAlNjtfq5esxzleQXEID024m8rnAya5B7TmVw==
X-Received: by 2002:a05:6a00:9286:b0:740:a023:5d60 with SMTP id d2e1a72fcca58-7423c032792mr16363235b3a.19.1746998053366;
        Sun, 11 May 2025 14:14:13 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::efc5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237736e4esm5017004b3a.67.2025.05.11.14.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 14:14:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] busybox: Skip a non-posix awk ptest on musl systems
Date: Sun, 11 May 2025 14:14:11 -0700
Message-ID: <20250511211411.1720365-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 May 2025 21:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216294

The test depends on BSD extension REG_STARTEND which
is not in POSIX, glibc does implement this extention so it
works on glibc systems. Therefore the patch to disable this test
is made musl specific

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...gsub-erroneous-word-start-match-test.patch | 29 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-busybox-Add-awk-gsub-erroneous-word-start-match-test.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-busybox-Add-awk-gsub-erroneous-word-start-match-test.patch b/meta/recipes-core/busybox/busybox/0001-busybox-Add-awk-gsub-erroneous-word-start-match-test.patch
new file mode 100644
index 00000000000..37af192fb08
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-busybox-Add-awk-gsub-erroneous-word-start-match-test.patch
@@ -0,0 +1,29 @@
+From d820b91e4bd8fde08b19a6e9aabf9624ab28b4d0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 11 May 2025 08:36:54 -0700
+Subject: [PATCH] busybox: Add awk gsub erroneous word start match test to know
+ fails on musl
+
+Musl does not implement this BSD extension REG_STARTEND and the test states
+that it will fail without this extention, therefore guard it with SKIP_KNOWN_BUGS
+so it can be ignored.
+
+Upstream-Status: Inappropriate [ Musl-specific ]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testsuite/awk.tests | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testsuite/awk.tests b/testsuite/awk.tests
+index be25f6696..a2deadccd 100755
+--- a/testsuite/awk.tests
++++ b/testsuite/awk.tests
+@@ -612,7 +612,7 @@ b
+ # Currently we use REG_STARTEND ("This flag is a BSD extension, not present in POSIX")
+ # to implement the code to handle this correctly, but if your libc has no REG_STARTEND,
+ # the alternative code mishandles this case.
+-testing 'awk gsub erroneous word start match' \
++test x"$SKIP_KNOWN_BUGS" = x"" && testing 'awk gsub erroneous word start match' \
+ 	"awk 'BEGIN { a=\"abc\"; gsub(/\<b*/,\"\",a); print a }'" \
+ 	'abc\n' \
+ 	'' ''
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
index c3131eb4531..5e1362f4b7c 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -54,6 +54,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0002-start-stop-daemon-fix-tests.patch \
            file://0003-start-stop-false.patch \
            "
-SRC_URI:append:libc-musl = " file://musl.cfg"
+SRC_URI:append:libc-musl = "\
+                            file://musl.cfg \
+                            file://0001-busybox-Add-awk-gsub-erroneous-word-start-match-test.patch"
 SRC_URI:append:x86-64 = " file://sha_accel.cfg"
 SRC_URI[tarball.sha256sum] = "3311dff32e746499f4df0d5df04d7eb396382d7e108bb9250e7b519b837043a4"

