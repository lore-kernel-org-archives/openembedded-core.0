Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D53E9C5AE5B
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:12 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.607.1700498348310978668
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=P2PMn21k;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6c398717726so3779035b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498347; x=1701103147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oun6cxPsyO3QlxrANh0Mmz9gWFnoTUTWT1pXlaOodIU=;
        b=P2PMn21kDlyaQVSHVvsAEol3IQne1qNf5WSaUsrlsc9jU94uLsGTM0VpWAe+7K/yem
         XTtAsT82qrLQHg8Y9VJxGowe7b6TK3DFQQwhlUcbgyAcvtVUKSpF4uSXZczZXXEtBGHy
         YjbM63aeTdSofCIaTJQryVtemUjHFKlhbzvY0GpvyM2VWm6v3PBMToH5pOOnzIipERu2
         +H1ATWPSGB0JNq2oFvlNXKoWc/xdofs+nqG4WD7SLcATKFfavM4jUWgxTyPMPGgiStW2
         SVXFRfxCfRsPVJv/Aq6mFSmtf1oDcMkCzZ3Yq21P9OGHYbv4cbUDAhooN79KvG77O3KD
         uT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498347; x=1701103147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oun6cxPsyO3QlxrANh0Mmz9gWFnoTUTWT1pXlaOodIU=;
        b=xHjN0+4XYLwiaOy/IYCixiFV2Ev8SGnz8fH4CBp9I8/lSL6LKQU7fLScLOUeLeeVuK
         tsPt36HshvRKJAguX/foDVZbA4Sv7CSifctRvt9XldS9o/h4cnKl0lwr6Co2nWzMgIZH
         Zfzi+hWY9YPgbH3Zraa3p3tjhvCwYc3+HlaxhnRSBo9hlh0AWrugy/vIvmvN1ku7mr94
         C6+V5EGarUwYcgb3PHj1LoWjB/LSE3K+sYO8axqmtvIjwsc2Z/UKysadub+rkcOo9EQe
         qoP8UdGn8hVIngUcNgON2KQKejgLgdtZ6Nx5CvgaTP09EGLtDyH6YzMjn+RPUukGLkR7
         xNMQ==
X-Gm-Message-State: AOJu0Ywf4FFj5jVxGklsfZtYyNjeo84auFGc/upQ/A1Z2wmAqg6mbOhm
	TMP47HCDVzNmFISxlmk0zZYLI9lLJxadHKt0Cv7xyQ==
X-Google-Smtp-Source: AGHT+IGSaQGBEm+xTPEuEf5N5LVTH7tHbRZes/61X4VeZwq0KTZ+CaP2/HOGG1jSi9PfWKZYqUhi0g==
X-Received: by 2002:a05:6a00:f07:b0:6cb:b818:c7fc with SMTP id cr7-20020a056a000f0700b006cbb818c7fcmr1062172pfb.23.1700498347043;
        Mon, 20 Nov 2023 08:39:07 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 06/33] goarch: Move Go architecture mapping to a library
Date: Mon, 20 Nov 2023 06:38:20 -1000
Message-Id: <5e0267aeb7d9f575f270f6856a67ac62ce8a0f71.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190895

From: Joshua Watt <JPEWhacker@gmail.com>

Other spaces uses the Go architecture definitions as their own (for
example, container arches are defined to be Go arches). To make it
easier for other places to use this mapping, move the code that does the
translation of OpenEmbedded arches to Go arches to a library.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3e86f72fc2e1cc2e5ea4b4499722d736941167ce)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/goarch.bbclass | 29 +++----------------------
 meta/lib/oe/__init__.py            |  2 +-
 meta/lib/oe/go.py                  | 34 ++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 27 deletions(-)
 create mode 100644 meta/lib/oe/go.py

diff --git a/meta/classes-recipe/goarch.bbclass b/meta/classes-recipe/goarch.bbclass
index 5fb6051bde..1ebe03864f 100644
--- a/meta/classes-recipe/goarch.bbclass
+++ b/meta/classes-recipe/goarch.bbclass
@@ -68,33 +68,10 @@ SECURITY_NOPIE_CFLAGS ??= ""
 CCACHE_DISABLE ?= "1"
 
 def go_map_arch(a, d):
-    import re
-    if re.match('i.86', a):
-        return '386'
-    elif a == 'x86_64':
-        return 'amd64'
-    elif re.match('arm.*', a):
-        return 'arm'
-    elif re.match('aarch64.*', a):
-        return 'arm64'
-    elif re.match('mips64el.*', a):
-        return 'mips64le'
-    elif re.match('mips64.*', a):
-        return 'mips64'
-    elif a == 'mips':
-        return 'mips'
-    elif a == 'mipsel':
-        return 'mipsle'
-    elif re.match('p(pc|owerpc)(64le)', a):
-        return 'ppc64le'
-    elif re.match('p(pc|owerpc)(64)', a):
-        return 'ppc64'
-    elif a == 'riscv64':
-        return 'riscv64'
-    elif a == 'loongarch64':
-        return 'loong64'
-    else:
+    arch = oe.go.map_arch(a)
+    if not arch:
         raise bb.parse.SkipRecipe("Unsupported CPU architecture: %s" % a)
+    return arch
 
 def go_map_arm(a, d):
     if a.startswith("arm"):
diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
index da7cbab308..6eb536ad28 100644
--- a/meta/lib/oe/__init__.py
+++ b/meta/lib/oe/__init__.py
@@ -9,4 +9,4 @@ __path__ = extend_path(__path__, __name__)
 
 BBIMPORTS = ["data", "path", "utils", "types", "package", "packagedata", \
              "packagegroup", "sstatesig", "lsb", "cachedpath", "license", \
-             "qa", "reproducible", "rust", "buildcfg"]
+             "qa", "reproducible", "rust", "buildcfg", "go"]
diff --git a/meta/lib/oe/go.py b/meta/lib/oe/go.py
new file mode 100644
index 0000000000..dfd957d157
--- /dev/null
+++ b/meta/lib/oe/go.py
@@ -0,0 +1,34 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import re
+
+def map_arch(a):
+    if re.match('i.86', a):
+        return '386'
+    elif a == 'x86_64':
+        return 'amd64'
+    elif re.match('arm.*', a):
+        return 'arm'
+    elif re.match('aarch64.*', a):
+        return 'arm64'
+    elif re.match('mips64el.*', a):
+        return 'mips64le'
+    elif re.match('mips64.*', a):
+        return 'mips64'
+    elif a == 'mips':
+        return 'mips'
+    elif a == 'mipsel':
+        return 'mipsle'
+    elif re.match('p(pc|owerpc)(64le)', a):
+        return 'ppc64le'
+    elif re.match('p(pc|owerpc)(64)', a):
+        return 'ppc64'
+    elif a == 'riscv64':
+        return 'riscv64'
+    elif a == 'loongarch64':
+        return 'loong64'
+    return ''
-- 
2.34.1


