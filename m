Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59BBFA3742
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 20:16:39 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.2220.1666901789680926369
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 13:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=legxZTZK;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id r14so4765554edc.7
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaBG4RRou2/oP/a4omfMUZoav+QkGwMemZp1KWdihNw=;
        b=legxZTZKabgUJHJA6G/XOLAkU/Pko2iw0k+9vYuKi/hqqTfzfL/ZM9uj+mOyI4N5YB
         Uh7HwAnnTAbRucAdfiyW20ve+wgTuJ9p3mGkeCFTWAFvgBhvgRk3zuzO6ObKBsNcmbg4
         CAS0DSMj91262zoyhD6YMASMUGhwmmS3owiudaEo5RHw2Kdo5TWhAA6pbChFgoE/S0j7
         oqWnPWQMe/HPNTlKOcuG0mkFk/1vx1OSKQuS7V+hPMwV1YIj7x2NQSzrzusPQ1u/cYb+
         LbozhkHBqwenN7Z77jBiLNEtiZqsmlAFGIC5tLgEwBrVPdhZ1chWQ5Q9IYJMPA5nxZCx
         bTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaBG4RRou2/oP/a4omfMUZoav+QkGwMemZp1KWdihNw=;
        b=52rGBmAPxRD3tDUWe06GnaYwVh9ptuKe7AHmmE6o6oNZylihU53r/aVa42yERfNLy3
         SkQJfrpsj5xnykP0SrIGKbtgQ1PhlmQyHmEpRLkSgOJmcxKYnzL5Nzs1MqvuZ4pJItql
         FKjBgieFnSTTn8xhwmDnQxsrzxe5q9CqiGN4yDBY8dz6GqO2a4I/Ay/+1ERFuTLJsPta
         fq7yIJ3t9OKPrIOdRtDOZ5YXcuDnjD/EaonOC8D/muTSPQ+uM0IwwDINkPct1mw+ZJSl
         pWJjoVIm94U8Ek/gGcpH3p1nkJN/Qb2RtbRkWOzjQD8t38LM7Gr3zJXUYEiaOnL/Q8lG
         sqHg==
X-Gm-Message-State: ACrzQf2TvSLmPGsRHWv7dnw4xXMnZdTYCle9XupEWnuXAOBxZzmkCek/
	ozPejaQGSx9t9mdTUJqRAAYUuPnJ2QYmrQ==
X-Google-Smtp-Source: AMsMyM7fq1h2yatWk8s14glDJ0LXMqwwROqZPq9OT7MFLT7h4Qh1LweuGfHO+sHEgZDqjKEgyoEI9A==
X-Received: by 2002:a05:6402:548f:b0:457:ed40:5f58 with SMTP id fg15-20020a056402548f00b00457ed405f58mr47099575edb.408.1666901788201;
        Thu, 27 Oct 2022 13:16:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b0077b2b0563f4sm1267225ejc.173.2022.10.27.13.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 13:16:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/23] stress-ng: update 0.14.03 -> 0.14.06
Date: Thu, 27 Oct 2022 22:15:55 +0200
Message-Id: <20221027201611.3644334-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027201611.3644334-1-alex@linutronix.de>
References: <20221027201611.3644334-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 20:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172211

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...helper-remove-include-of-sys-mount.h.patch | 34 -------------------
 ...e-shim-remove-include-of-sys-mount.h.patch | 34 -------------------
 ...ess-ng_0.14.03.bb => stress-ng_0.14.06.bb} |  7 ++--
 3 files changed, 2 insertions(+), 73 deletions(-)
 delete mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-core-helper-remove-include-of-sys-mount.h.patch
 delete mode 100644 meta/recipes-extended/stress-ng/stress-ng/0002-core-shim-remove-include-of-sys-mount.h.patch
 rename meta/recipes-extended/stress-ng/{stress-ng_0.14.03.bb => stress-ng_0.14.06.bb} (77%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-core-helper-remove-include-of-sys-mount.h.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-core-helper-remove-include-of-sys-mount.h.patch
deleted file mode 100644
index 52b2e61bc1..0000000000
--- a/meta/recipes-extended/stress-ng/stress-ng/0001-core-helper-remove-include-of-sys-mount.h.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 627e5227783ff2a0c3b11adee57ef7f0684a367e Mon Sep 17 00:00:00 2001
-From: Colin Ian King <colin.i.king@gmail.com>
-Date: Mon, 1 Aug 2022 21:39:39 +0100
-Subject: [PATCH 1/2] core-helper: remove include of sys/mount.h
-
-This is not required in the shim core and it fixes a build issue
-with newer glibc 2.36
-
-Fixes: https://github.com/ColinIanKing/stress-ng/issues/216
-
-Upstream-Status: Backport [https://github.com/ColinIanKing/stress-ng/commit/69f4f4d629c5f4304b5388b6a7fa8616de23f50e]
-Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
----
- core-helper.c | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/core-helper.c b/core-helper.c
-index 6795410d..9e4533f2 100644
---- a/core-helper.c
-+++ b/core-helper.c
-@@ -39,10 +39,6 @@
- #include <sys/loadavg.h>
- #endif
- 
--#if defined(HAVE_SYS_MOUNT_H)
--#include <sys/mount.h>
--#endif
--
- #if defined(HAVE_SYS_PRCTL_H)
- #include <sys/prctl.h>
- #endif
--- 
-2.37.1
-
diff --git a/meta/recipes-extended/stress-ng/stress-ng/0002-core-shim-remove-include-of-sys-mount.h.patch b/meta/recipes-extended/stress-ng/stress-ng/0002-core-shim-remove-include-of-sys-mount.h.patch
deleted file mode 100644
index 5cb95f1f2b..0000000000
--- a/meta/recipes-extended/stress-ng/stress-ng/0002-core-shim-remove-include-of-sys-mount.h.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 0503ec88e9187c0152b7b2840a1ad5bfb022bbfe Mon Sep 17 00:00:00 2001
-From: Colin Ian King <colin.i.king@gmail.com>
-Date: Mon, 1 Aug 2022 21:28:49 +0100
-Subject: [PATCH 2/2] core-shim: remove include of sys/mount.h
-
-This is not required in the shim core and it fixes a build issue
-with newer glibc 2.36
-
-Fixes: https://github.com/ColinIanKing/stress-ng/issues/216
-
-Upstream-Status: Backport [https://github.com/ColinIanKing/stress-ng/commit/0c9a711f213b5734729ab0c5ed90669e9fd11ca2]
-Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
----
- core-shim.c | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/core-shim.c b/core-shim.c
-index 0343402a..324eba7d 100644
---- a/core-shim.c
-+++ b/core-shim.c
-@@ -52,10 +52,6 @@
- #include <asm/ldt.h>
- #endif
- 
--#if defined(HAVE_SYS_MOUNT_H)
--#include <sys/mount.h>
--#endif
--
- #if defined(HAVE_SYS_PRCTL_H)
- #include <sys/prctl.h>
- #endif
--- 
-2.37.1
-
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.14.03.bb b/meta/recipes-extended/stress-ng/stress-ng_0.14.06.bb
similarity index 77%
rename from meta/recipes-extended/stress-ng/stress-ng_0.14.03.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.14.06.bb
index 370662bbb3..359560b9e2 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.14.03.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.14.06.bb
@@ -5,11 +5,8 @@ HOMEPAGE = "https://github.com/ColinIanKing/stress-ng#readme"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
-           file://0001-core-helper-remove-include-of-sys-mount.h.patch \
-           file://0002-core-shim-remove-include-of-sys-mount.h.patch \
-"
-SRCREV = "346518caffe5302f9a6d36860459c297c6968aaa"
+SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master"
+SRCREV = "03493cb69e91c29718ff9f645514355cd99762c6"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native"
-- 
2.30.2


