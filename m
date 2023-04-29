Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999E7C7618E
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 05:36:53 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.41267.1682746606567163343
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 22:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=H5BG9h0i;
 spf=pass (domain: mvista.com, ip: 209.85.216.46, mailfrom: vkumbhar@mvista.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-246fa478d45so672302a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 22:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1682746605; x=1685338605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tCEniSHIIJFgy82I80u3paQlBeCLtMCiWYINV1YuWN0=;
        b=H5BG9h0iDWOJsp/zRvewnojvN6e2yd2cXPjkM19HAFUxl2f1JiASruorqdBnrx66AU
         ax9hyTp/pPevxd4wapiCyb5RwGkfya9m7RlL0hjKf7OqHhfuPaxALD3emrvD0SznUIfQ
         d5nDc/bDgB61Tj2ormjj/7UWc8+LMLhhafbYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682746605; x=1685338605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCEniSHIIJFgy82I80u3paQlBeCLtMCiWYINV1YuWN0=;
        b=TO399HzDaBlW3hXN+fdY12NDnNt3eCCHmHsdpXOYvyNjN/SarUXiAuP/jWMJ9i0XJY
         xL32hwxoC+b1fP993cmvtXKWGCjYInTPrgH8LeLcpA9VyaGGA0mR4HCc3OG/6JoTtO9W
         recDTUDon3kSpK+cqvTrLF6NwfYYFkMXiTU55yHX1W09+dtUZqIuE/EfyMbjKv2rhuhd
         ZVb6tv5+fwp55lsIGqDI0dE09r/neitCGPyzuijz4AR6lf0YzaBhrNPsTSRK3rOjmujr
         JVoQMvjO+8YH9szEGPx/UWYllyNMsp29n22bOHS1EFhApNC06pQd5mhxFrN8WuQyxLB+
         XTLg==
X-Gm-Message-State: AC+VfDzojspFpmh8GTR/WGxnzNfpxfdOyS4kWWIxZ0W5Mf3dpzf+hc46
	ZbR7SWYQ/3DjCHBiN21N/Mlvq7VDuxOYX4pdED0=
X-Google-Smtp-Source: ACHHUZ7OE6J3cl0wd3tWjskfOudTqiDCla87LYvyvS0sGiKPg06CyNuORDLKfMb+amcQPHBlOngY4A==
X-Received: by 2002:a17:90a:d082:b0:23f:7d05:8762 with SMTP id k2-20020a17090ad08200b0023f7d058762mr7486872pju.23.1682746605604;
        Fri, 28 Apr 2023 22:36:45 -0700 (PDT)
Received: from vkumbhar-Latitude-3400.mvista.com ([116.74.155.26])
        by smtp.googlemail.com with ESMTPSA id gw13-20020a17090b0a4d00b002470b9503desm15619281pjb.55.2023.04.28.22.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 22:36:45 -0700 (PDT)
From: vkumbhar@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH] freetype: fix CVE-2023-2004 integer overflowin in tt_hvadvance_adjust() in src/truetype/ttgxvar.c
Date: Sat, 29 Apr 2023 11:06:24 +0530
Message-Id: <20230429053624.903987-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 05:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180540

From: Vivek Kumbhar <vkumbhar@mvista.com>

Fix An integer overflow vulnerability was discovered in Freetype in tt_hvadvance_adjust() function in src/truetype/ttgxvar.c

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../freetype/freetype/CVE-2023-2004.patch     | 41 +++++++++++++++++++
 .../freetype/freetype_2.11.1.bb               |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2023-2004.patch

diff --git a/meta/recipes-graphics/freetype/freetype/CVE-2023-2004.patch b/meta/recipes-graphics/freetype/freetype/CVE-2023-2004.patch
new file mode 100644
index 0000000000..f600309d3e
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/CVE-2023-2004.patch
@@ -0,0 +1,41 @@
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
+index 7f2db0c..8968111 100644
+--- a/src/truetype/ttgxvar.c
++++ b/src/truetype/ttgxvar.c
+@@ -42,6 +42,7 @@
+ #include <ft2build.h>
+ #include <freetype/internal/ftdebug.h>
+ #include FT_CONFIG_CONFIG_H
++#include <freetype/internal/ftcalc.h>
+ #include <freetype/internal/ftstream.h>
+ #include <freetype/internal/sfnt.h>
+ #include <freetype/tttags.h>
+@@ -1147,7 +1148,7 @@
+                 delta == 1 ? "" : "s",
+                 vertical ? "VVAR" : "HVAR" ));
+ 
+-    *avalue += delta;
++    *avalue = ADD_INT( *avalue, delta );
+ 
+   Exit:
+     return error;
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/freetype/freetype_2.11.1.bb b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
index d425e162bc..29f4d8dfb7 100644
--- a/meta/recipes-graphics/freetype/freetype_2.11.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.xz \
            file://CVE-2022-27404.patch \
            file://CVE-2022-27405.patch \
            file://CVE-2022-27406.patch \
+           file://CVE-2023-2004.patch \
            "
 SRC_URI[sha256sum] = "3333ae7cfda88429c97a7ae63b7d01ab398076c3b67182e960e5684050f2c5c8"
 
-- 
2.25.1


