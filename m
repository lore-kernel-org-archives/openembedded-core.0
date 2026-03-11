Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA22FD0624
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 06:35:36 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14971.1773210926847040786
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 23:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hJ43N14O;
 spf=pass (domain: mvista.com, ip: 209.85.216.46, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso6837952a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 23:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773210926; x=1773815726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OYud9KV6t/bSrbgQnLf6oJO9nI1VvtRty2NffFobVm4=;
        b=hJ43N14On2oN9DopMy2XKNuVIgIPbhmDnIocpE+o8NxMvY9mJ7qtXLnGJUTLMmmsTA
         /W2KC5XCLO+pfdpSfdFmXP/itgfd6+Ldd/tlvMv4r1Gl1wN/jqoiJH0Hq+3Ylq5C7LRk
         8jsUOVB1UNQt9ztN/79qiUcNas66G1QUmAWgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773210926; x=1773815726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYud9KV6t/bSrbgQnLf6oJO9nI1VvtRty2NffFobVm4=;
        b=Htwxotzv5GdImxbYsDIB8zFKgHZZzb8UrOYsUmX8CmyMu6mrTUDiEH+AdXUYiRKIVZ
         lFLv3Z5/Qmp9AeM71q0PZ4Rm1QUhH8IzP4yo/1XNGqenbhbmkbDoBfN1Pr+XF75UnA6N
         O9Fmbd3yjPNOi2kDw0BV1axtTAF/qk4dPf84w3aaBi66WUVqOPYjECOMstOij/DESVTA
         D0nkIIsLuppggkNi99v44/mtl8ojOpzgVzCegjhWy3G/L/xsDsQ59da3ilDXTRuRCW5K
         65bgiVwqC7lrIxUYH6X9o6j+GUVwg/dyafw0bEOLkRc/l7o8kApx8v2Z5ykm+tfYJQT2
         avTg==
X-Gm-Message-State: AOJu0YwOOCjWJhkngQ7moM98HgqoUTytkdUo9kTVCR96ntjsWC2N/kZj
	I8wDEDZAkAVAuspCehiblfPaQ3Wg40kCTtE21NgutertxzVaOTRYHSHNei339W0oPSaVddl6Pwq
	uLr3F
X-Gm-Gg: ATEYQzzoMPds74YUCpXwlIOMwNG2qoVO5RqLDX1YRku2qo+Cu3S1Ait/EOAWdVF4Q9E
	87GPmsmnjanFE/4KHIAgbiLo6UwtVeeoM+89O+sZ6zhzl0rXWdRmq4CnSpduSVW8AE2S8rowP/3
	LZWe0H2U+3awob6zjpcL4ErCuGRDaJ2ut0ZvGQ2+PgVCCRb1tnI9nTdxAk/h577ActIXne9+wKA
	X10plHjUEp3r7SwB47DKXDMQ5WuK8cg500qT6r1TAYPZHH9f2Rx9RVEbsC6qeFajJ0gVWXcrQiK
	0ImD46Y66f0QqaGsvI9Q9U+O+7CGiYUHaPAd/II3cQ/TQAq+7vTqWKPO5LfeZ5lzcViVteOlTc6
	veP3zR1PNwugigGYoTKz8m7jvghQdgbzVwY+cNp8olsnU0ShFcoKRpPn3Srq8ZyhUVHiRHoLOAL
	XvVBrz3bj7MSkXTIYuC7kIqXevHGyn1I5DXnQn
X-Received: by 2002:a17:90b:28c8:b0:359:8d70:c4e2 with SMTP id 98e67ed59e1d1-35a011d4b70mr1542537a91.11.1773210925560;
        Tue, 10 Mar 2026 23:35:25 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2406:7400:54:1b6c:ff43:847e:b957:7946])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359ffe77311sm1425029a91.11.2026.03.10.23.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 23:35:24 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch] python3-pip: Fix CVE-2026-1703
Date: Wed, 11 Mar 2026 12:05:13 +0530
Message-ID: <20260311063513.37817-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 06:35:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232839

Pick patch according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-1703
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-1703
[3] https://github.com/pypa/pip/pull/13777

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python/python3-pip/CVE-2026-1703.patch    | 37 +++++++++++++++++++
 .../python/python3-pip_24.0.bb                |  4 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
new file mode 100644
index 0000000000..1470b7c541
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
@@ -0,0 +1,37 @@
+From 4c651b70d60ed91b13663bcda9b3ed41748d0124 Mon Sep 17 00:00:00 2001
+From: Seth Michael Larson <seth@python.org>
+Date: Fri, 30 Jan 2026 09:49:11 -0600
+Subject: [PATCH] Use os.path.commonpath() instead of commonprefix()
+
+Upstream-Status: Backport [https://github.com/pypa/pip/commit/4c651b70d60ed91b13663bcda9b3ed41748d0124]
+CVE: CVE-2026-1703
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ news/+1ee322a1.bugfix.rst            | 1 +
+ src/pip/_internal/utils/unpacking.py | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+ create mode 100644 news/+1ee322a1.bugfix.rst
+
+diff --git a/news/+1ee322a1.bugfix.rst b/news/+1ee322a1.bugfix.rst
+new file mode 100644
+index 0000000..edb1b32
+--- /dev/null
++++ b/news/+1ee322a1.bugfix.rst
+@@ -0,0 +1 @@
++Use a path-segment prefix comparison, not char-by-char.
+diff --git a/src/pip/_internal/utils/unpacking.py b/src/pip/_internal/utils/unpacking.py
+index 78b5c13..0b26525 100644
+--- a/src/pip/_internal/utils/unpacking.py
++++ b/src/pip/_internal/utils/unpacking.py
+@@ -81,7 +81,7 @@ def is_within_directory(directory: str, target: str) -> bool:
+     abs_directory = os.path.abspath(directory)
+     abs_target = os.path.abspath(target)
+ 
+-    prefix = os.path.commonprefix([abs_directory, abs_target])
++    prefix = os.path.commonpath([abs_directory, abs_target])
+     return prefix == abs_directory
+ 
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/recipes-devtools/python/python3-pip_24.0.bb
index be4a29500a..12a5e1cc3c 100644
--- a/meta/recipes-devtools/python/python3-pip_24.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
@@ -31,7 +31,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI += "file://no_shebang_mangling.patch"
+SRC_URI += "file://no_shebang_mangling.patch \
+            file://CVE-2026-1703.patch \
+           "
 
 SRC_URI[sha256sum] = "ea9bd1a847e8c5774a5777bb398c19e80bcd4e2aa16a4b301b718fe6f593aba2"
 
-- 
2.43.0


