Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2945EC77B78
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 02:10:47 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.9580.1683079841172691390
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 19:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=fBmRgXs7;
 spf=pass (domain: mvista.com, ip: 209.85.215.177, mailfrom: vkumbhar@mvista.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-517c01edaaaso3057752a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 19:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1683079840; x=1685671840;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=943cWB0cUidY2jDPFJnpk/x3j7gbL5eF/1YU51f3g8Y=;
        b=fBmRgXs7gyj/Drp+BZaqURRLrSQ/83CVwGwKniGpsQ2/KuwLCpD3zzLpvBpgbDLnYJ
         OAzyNTgWO+qI6HRXvTCfbCgBsqfCHs41bD+q+OqhM7a0G35S8nAHW6XRJG9TtXckhyTe
         xOM/ZqwWx3m9q0kxfwCpO59MYAQfCtwkJUClQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683079840; x=1685671840;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=943cWB0cUidY2jDPFJnpk/x3j7gbL5eF/1YU51f3g8Y=;
        b=TVAPWdGZFMTGWRUpH6BVEjU6iDPpe2EimrsCUPI3AjAc7NLo7zsbCLJxC2kMQDFZ8m
         yXSvAHq0ZFvaKRIRXd9PPNwWN+90OF3W//l0SphIzN70g/pOejTfzF9exAgBEmmRqzOm
         CuLx/0fwPPB1inP5ONhj0B8d3y5nkVea2Cbvy22j1yFLR6NqGicgH9oPuA/CRwjYKKL+
         grWNBvINEq4RhT7bjeEBa5GPz6txZvTNSk2YcecfHvcSGVg+zwCDneVMiWsNahBIYZ9Q
         oRX/tD3PMPzoVse61OHwt1JMiJ+kTlbCIjvJuZawPTMZO4axpWIgqejc1hn50j9c2Ycs
         UcfA==
X-Gm-Message-State: AC+VfDx6H1XuIqDS3jBQXcS/pCBcjKdGRn25oOvc/1GYFgQtcEQcZ0zX
	88PiDRdl0TYV4XenFsJG3i8S/mH4V1+Jggr5Eaw=
X-Google-Smtp-Source: ACHHUZ5MQCHNiQpjr995akMUHb+/UZ99VzPbOpxGD+ENDsV85f6PgrWXNDw+Iq6Gxu5GYB+Pi6WNog==
X-Received: by 2002:a17:902:bb86:b0:1a9:433e:41e7 with SMTP id m6-20020a170902bb8600b001a9433e41e7mr535030pls.43.1683079840067;
        Tue, 02 May 2023 19:10:40 -0700 (PDT)
Received: from localhost.localdomain ([116.75.30.40])
        by smtp.googlemail.com with ESMTPSA id h6-20020a170902f54600b001ab0083c6c9sm3512604plf.261.2023.05.02.19.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 19:10:39 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH] freetype: fix CVE-2023-2004 integer overflowin in tt_hvadvance_adjust() in src/truetype/ttgxvar.c
Date: Wed,  3 May 2023 07:40:24 +0530
Message-Id: <20230503021024.4809-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 02:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180782

Fix An integer overflow vulnerability was discovered in Freetype in tt_hvadvance_adjust() function in src/truetype/ttgxvar.c

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../freetype/freetype/CVE-2023-2004.patch     | 40 +++++++++++++++++++
 .../freetype/freetype_2.10.1.bb               |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2023-2004.patch

diff --git a/meta/recipes-graphics/freetype/freetype/CVE-2023-2004.patch b/meta/recipes-graphics/freetype/freetype/CVE-2023-2004.patch
new file mode 100644
index 0000000000..800d77579e
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/CVE-2023-2004.patch
@@ -0,0 +1,40 @@
+From e6fda039ad638866b7a6a5d046f03278ba1b7611 Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Mon, 14 Nov 2022 19:18:19 +0100
+Subject: [PATCH] * src/truetype/ttgxvar.c (tt_hvadvance_adjust): Integer
+ overflow.
+
+Reported as
+
+  https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=50462
+
+Upstream-Status: Backport [https://github.com/freetype/freetype/commit/e6fda039ad638866b7a6a5d046f03278ba1b7611]
+CVE: CVE-2023-2004
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/truetype/ttgxvar.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/truetype/ttgxvar.c b/src/truetype/ttgxvar.c
+index 78d87dc..258d701 100644
+--- a/src/truetype/ttgxvar.c
++++ b/src/truetype/ttgxvar.c
+@@ -43,6 +43,7 @@
+ #include FT_INTERNAL_DEBUG_H
+ #include FT_CONFIG_CONFIG_H
+ #include FT_INTERNAL_STREAM_H
++#include <freetype/internal/ftcalc.h>
+ #include FT_INTERNAL_SFNT_H
+ #include FT_TRUETYPE_TAGS_H
+ #include FT_TRUETYPE_IDS_H
+@@ -1065,7 +1066,7 @@
+                 delta == 1 ? "" : "s",
+                 vertical ? "VVAR" : "HVAR" ));
+
+-    *avalue += delta;
++    *avalue = ADD_INT( *avalue, delta );
+
+   Exit:
+     return error;
+--
+2.17.1
diff --git a/meta/recipes-graphics/freetype/freetype_2.10.1.bb b/meta/recipes-graphics/freetype/freetype_2.10.1.bb
index 72001c529a..6af744b981 100644
--- a/meta/recipes-graphics/freetype/freetype_2.10.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.10.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
            file://CVE-2022-27404.patch \
            file://CVE-2022-27405.patch \
            file://CVE-2022-27406.patch \
+           file://CVE-2023-2004.patch \
           "
 SRC_URI[md5sum] = "bd42e75127f8431923679480efb5ba8f"
 SRC_URI[sha256sum] = "16dbfa488a21fe827dc27eaf708f42f7aa3bb997d745d31a19781628c36ba26f"
-- 
2.17.1


