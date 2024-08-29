Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6D7C83F34
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 16:31:36 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.23976.1724949092048833617
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 09:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lBg5GDFT;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7141feed424so738564b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 09:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724949091; x=1725553891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3gsxo7cQK7q+D+8VmEWK1soxPozInF2koHryWeNe6cM=;
        b=lBg5GDFThWb6YCckLepwLaSPZ4rhmX4MvtEBp8XPK4MsbWFiY5x2CwX2H/nb/4gpY+
         7lCDQsG79s5BUH4U0mFO7xH5V3EpBVMewS+zXp6aZBSzhkemU3UKLDWwpTurqjFC6dnS
         Y2HHTdq5Ov0sWyRrhfOkSmkNwyvG2ucvyyDSXX4PocsyCjkgrQR2R1lxlcCyI9nZA9NA
         /QfxTm1LcNoclkeQZvXWeBjb7Z7P0n/Pl8ZkV412qcgpCoMI7Wg0v0icCbpvzwfL9kYk
         byvxk0xnXTbtFI6RSVWaOVPPIHcIzh7tr+oNEBR4To5klKET9QUyILLibXuP455AC1xs
         TCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724949091; x=1725553891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gsxo7cQK7q+D+8VmEWK1soxPozInF2koHryWeNe6cM=;
        b=kmmx0CgxCnkc+3gfLBVVUK5V81a4/VezU2iBZ99w6gatW3WT9E+h25DPMnSCMi1QAV
         doTOSiarla9vutwZNuhOy9eVI4tCpqlPFyoKq9xvpMNpKjZCPVXJK3FJj9KUHxTaETbs
         hrpr7ID91NJIaUbKEYclPTkhAgBq62nETxnT8J4R6uAfLqGBoWcK1v5MgwgKulLeXlWb
         Y8wqbuaJJDJKt/o7bulgiEBxut4mFs8HxHG8UJMJ714WUlk48zskERS10UNGVNCZwFYD
         i4Jm1JxQn5pt1L1iF73QRyGlXW9NSwCt23tmTy9ed6RhxgkMLjkwIar5hBpbBOgmULDw
         fAEw==
X-Gm-Message-State: AOJu0YxipkAoewqNfHo5UBaIff/vkRblsqVbXjy/ZgFIhS1X9dkg2nHW
	h5XZKBlse7IiQFT5Js0cnHA1BSf+DlAnfQKjWxTmsSJGqcTOEkcEA5kZ+WwP
X-Google-Smtp-Source: AGHT+IHvw/Zr+J67mD5ndmHW7sELH+RpJjwEokyXzFuNDwfZJfXh0Wvsc3ZM1ZxRIUfRw3xiX/6U7g==
X-Received: by 2002:a05:6a20:8887:b0:1cc:e7a2:2bf3 with SMTP id adf61e73a8af0-1cce7a22f05mr982004637.31.1724949090964;
        Thu, 29 Aug 2024 09:31:30 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e774c7asm1257643a12.34.2024.08.29.09.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 09:31:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] fmt: Include missing header <algorithm>
Date: Thu, 29 Aug 2024 09:31:28 -0700
Message-ID: <20240829163128.502025-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 16:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203937

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Include-algorithm-for-std-copy.patch | 29 +++++++++++++++++++
 meta/recipes-devtools/fmt/fmt_11.0.2.bb       |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/fmt/fmt/0001-Include-algorithm-for-std-copy.patch

diff --git a/meta/recipes-devtools/fmt/fmt/0001-Include-algorithm-for-std-copy.patch b/meta/recipes-devtools/fmt/fmt/0001-Include-algorithm-for-std-copy.patch
new file mode 100644
index 00000000000..0391de9a7a3
--- /dev/null
+++ b/meta/recipes-devtools/fmt/fmt/0001-Include-algorithm-for-std-copy.patch
@@ -0,0 +1,29 @@
+From 170d72330a2253eec4c1e37f6671f787df532782 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Aug 2024 09:19:29 -0700
+Subject: [PATCH] Include <algorithm> for std::copy
+
+Some headers like color.h are using std::copy API
+from C++ std library, but missing to include the
+right header [1]
+
+[1] https://en.cppreference.com/w/cpp/algorithm/copy
+
+Upstream-Status: Submitted [https://github.com/fmtlib/fmt/pull/4138]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/fmt/color.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/fmt/color.h b/include/fmt/color.h
+index 231d93c8..6130a2d0 100644
+--- a/include/fmt/color.h
++++ b/include/fmt/color.h
+@@ -8,6 +8,7 @@
+ #ifndef FMT_COLOR_H_
+ #define FMT_COLOR_H_
+ 
++#include <algorithm>                   // std::copy
+ #include "format.h"
+ 
+ FMT_BEGIN_NAMESPACE
diff --git a/meta/recipes-devtools/fmt/fmt_11.0.2.bb b/meta/recipes-devtools/fmt/fmt_11.0.2.bb
index 5a7041088cd..fdc2a7dd5fa 100644
--- a/meta/recipes-devtools/fmt/fmt_11.0.2.bb
+++ b/meta/recipes-devtools/fmt/fmt_11.0.2.bb
@@ -4,7 +4,9 @@ HOMEPAGE = "https://fmt.dev"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
 
-SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
+SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https \
+           file://0001-Include-algorithm-for-std-copy.patch \
+           "
 SRCREV = "0c9fce2ffefecfdce794e1859584e25877b7b592"
 
 S = "${WORKDIR}/git"

