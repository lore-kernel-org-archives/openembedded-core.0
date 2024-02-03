Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B3FC4828F
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 00:57:48 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.8839.1706921863241908731
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 16:57:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DOfBef/9;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6de2f8d6fb9so1997537b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 16:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706921862; x=1707526662; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LQ9mHXkD2LoadXtbg5rQPVrre6T5OYei3yjuKgZdTs4=;
        b=DOfBef/9amJWt9BiTHxaK8hdvkRHDIG+/2EozsGLaKlqbIM5v/pPBB345dew838Adb
         kffJE8Ge58HOSPOvNKzvJMMtIbff3yA7ryxoUgGEQRFDxFqA0ZpIJS17duywnBkn25oK
         ur8DVWnItaWp+sVMPR95XXQice/tYq2ZzrIgnEVS623Urh+mN6bVbdmA1ULjMZ1/o0hl
         1O+/YyxT2O3IpzmwbwIVSsJLV+xzHMdoLOwC1hGpYpn6fO/OzTp7gf0H37gGgWG8jM3V
         HcalZM1JFU8CW65YPjd521wp5ciuHIegzYtQfPV0tjWJNXes61tqeGOJtVDoJXcMjHAZ
         eYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706921862; x=1707526662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQ9mHXkD2LoadXtbg5rQPVrre6T5OYei3yjuKgZdTs4=;
        b=w3JNqL8E93bNSP1x05BjDq9jqhPYIDxdk9WHov+/cnWKUTKKqO06zJYx3u99TboemG
         WZMu4/KEqMNHD7usOUPwN8YN/XdRYm6v9nxpkKaiCCuF0gcISLfOGFe3ykA6lV37M4kq
         gf3Ibx8oFxtCd09eVzzzWXbNS8Vg0iyrHIv1w7jGqSNohPP0IwXjYxG7Ja+FL25odFGB
         9pRXdFewX4cnVJj8FUTkXYDd0T48jzqyqpsdClGHHXDLKDf5JTp0+0dBGD7eo7kYCklI
         b0MFkM7SyPATiRdaouJ5CcjaeYdXHCUQDXaz31yXfW/EQiH1xMa5ukW/EIZphSv2OuZq
         NwdQ==
X-Gm-Message-State: AOJu0YyEZqupATIRnrDZ3sU0dVtKIxgouA1HFUNzUBtCSv5i7V7K1BRr
	FQf9v4mPHrl2sg64Z+RYubl/4k6TbA5UqW6pqrdkOU58/xTZDuPSnsQm1amXUOE=
X-Google-Smtp-Source: AGHT+IGGh93gtVp6IBGLFK74URb+Sr6lrJ6NItThs2KgLGWwG2krI89tgBV47ToCUScdm8C0HPHoKA==
X-Received: by 2002:a05:6a00:3cc9:b0:6dd:b12f:12ef with SMTP id ln9-20020a056a003cc900b006ddb12f12efmr9035809pfb.1.1706921862289;
        Fri, 02 Feb 2024 16:57:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f19a])
        by smtp.gmail.com with ESMTPSA id u3-20020a62ed03000000b006dddd685bbesm2257660pfh.122.2024.02.02.16.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 16:57:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] valgrind: Upgrade to 3.22
Date: Fri,  2 Feb 2024 16:57:39 -0800
Message-ID: <20240203005739.3960031-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 00:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194826

Changes are summarised in Release announcement [1]

[1] https://sourceforge.net/p/valgrind/mailman/message/50323635/

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...inux-seg_override.c-add-missing-incl.patch | 30 -------------------
 ...{valgrind_3.21.0.bb => valgrind_3.22.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 32 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.21.0.bb => valgrind_3.22.0.bb} (98%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
deleted file mode 100644
index 5e36c28523e..00000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 978d9ed7f857f2cdcd2a8632f3c2feb56b99c825 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 8 May 2023 11:56:35 +0200
-Subject: [PATCH] none/tests/x86-linux/seg_override.c: add missing include for
- musl builds
-
-Otherwise SYS_modify_ldt is undefined.
-
-Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=382034]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- none/tests/x86-linux/seg_override.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/none/tests/x86-linux/seg_override.c b/none/tests/x86-linux/seg_override.c
-index ca8fbfe..4ef4394 100644
---- a/none/tests/x86-linux/seg_override.c
-+++ b/none/tests/x86-linux/seg_override.c
-@@ -3,6 +3,10 @@
- #include <errno.h>
- #include <string.h>
- #include "../../../config.h"
-+#if defined(MUSL_LIBC)
-+#include <syscall.h>
-+#include <unistd.h>
-+#endif
- 
- 
- /* Stuff from Wine. */
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
similarity index 98%
rename from meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
index 67a197c5097..85b29ca54db 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
@@ -36,9 +36,8 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            file://0001-docs-Disable-manual-validation.patch \
-           file://0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch \
            "
-SRC_URI[sha256sum] = "10ce1618bb3e33fad16eb79552b0a3e1211762448a0d7fce11c8a6243b9ac971"
+SRC_URI[sha256sum] = "c811db5add2c5f729944caf47c4e7a65dcaabb9461e472b578765dd7bf6d2d4c"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
-- 
2.43.0


