Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBC8CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:59:09 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.215739.1697551148900156131
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 06:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YoVzRaEJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6c0b8f42409so3885747a34.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 06:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697551147; x=1698155947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pmci4+JgvV8b5OpIu5gIpYt7LeC7uKDynrHwTxkf8Xg=;
        b=YoVzRaEJ82AFOWJLjW8YfOED0MlufyrDAm/CtcGS9feSjuYSGGuYUuhSZfnb2Q8JRt
         qsuwkdNRYdqAm5wlX1ziwpUO4LHDEEht3DYt262GRQTi3CDh3lQCEReXRebKsc/eRZ+m
         29QqGff+UcPG6zOOlJBhvyjsJxIgpCwF4QQg//AVfVz7JovwYodrefXHcjeVMCAjfgm6
         weSjeJNYaH7vocTWtViksDLF4wXOqz5LgBZ5tLNAT2tDbmPvz/fFSCyQja6mm+5YsuUd
         B2UI46OlDD5sagWxIQnjWUXQUD5NFTUQbhU925jO47eCcERBHamGVYmt09rtRJ4wtBhg
         +yRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697551147; x=1698155947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pmci4+JgvV8b5OpIu5gIpYt7LeC7uKDynrHwTxkf8Xg=;
        b=wTbFzsoYLeOyTy9UTZSqp8MFDYGLR9ZaXAADIVMZ5d5UojwxwcUqA2HNGJbkFmH9am
         AcxZ6gX4uFBbFiitMoAWx57aGuRHNH4TKhSr2Z3Dn3E1t3Vsubi+dfTevW+BG7xh10qx
         kV1RCKNc/65m/6/0pTGNbjFqNDFMshClJC8OAmlwPlhg9CwdgUUp3L+kLu0ztyy6g6uQ
         +CAdSG89rIvqKr/J0HGdx/AoflUqpijQUYnvX7HQ/K90KlPPuULB448963n+n+3N8YSV
         0nB16Rih2j5jHNzHxXgQbrQUtNRGPuRuqwHi0+JCKozGaAoQzqNnl9V6T0D7yGB69VlG
         EdoA==
X-Gm-Message-State: AOJu0Yz27JVZtdVvRmOk1ta86xqHnlzuEyKH93JVCZ46VAHOvyG/4CHw
	/tkvsHpkVFUNE5PzF768dBqTVJzBwGM=
X-Google-Smtp-Source: AGHT+IHWHgQWDMtPIie5b+utD0c2udTodjeusyQwz3v1IRknVeOgjyAIfwG+OLivTRdbEjNaApV8qg==
X-Received: by 2002:a05:6870:c986:b0:1e9:9867:247 with SMTP id hi6-20020a056870c98600b001e998670247mr2719319oab.47.1697551147475;
        Tue, 17 Oct 2023 06:59:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::589])
        by smtp.gmail.com with ESMTPSA id ch25-20020a056871c41900b001e195682b2esm268762oac.58.2023.10.17.06.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:59:06 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] Move Go architecture mapping to a library
Date: Tue, 17 Oct 2023 07:59:02 -0600
Message-Id: <20231017135903.2411500-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 13:59:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189335

Other spaces uses the Go architecture definitions as their own (for
example, container arches are defined to be Go arches). To make it
easier for other places to use this mapping, move the code that does the
translation of OpenEmbedded arches to Go arches to a library.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
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


