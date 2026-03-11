Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97DF7104C00F
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 11:01:18 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18529.1773226873348395041
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 04:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=g63Bvz3V;
 spf=pass (domain: mvista.com, ip: 209.85.216.47, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-359894e17b8so7342774a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 04:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773226872; x=1773831672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3f05gdZh3H3Lria0f8jwyWVCYNITNJptVZ94jxvJaEc=;
        b=g63Bvz3Vo2GDHXjiGt49pCk4vRI35mCzSJXghp10+mIwrmMPQH4UG8u4BIAZqTPUZx
         FbJPTkhzUn6vmM85+/SJ65vNwHHHQ7kvNxi0dKtrWu68A+MucuLircpWN4dNlUAtpbAI
         AM6Bg+60uOrLhy6mO26R+vp1PMhbmoOTzGPPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773226872; x=1773831672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3f05gdZh3H3Lria0f8jwyWVCYNITNJptVZ94jxvJaEc=;
        b=JJHebviWRCbcLlqygXUNrs1FE9xUeJ55DkH0MdPh4Xl7WdBZGwNeqP4HNhkcIRnzJH
         zA8LIrbw7gUbAizHlqVetjIQ3KDHnYx2Mxjj+8RAM5PayOUNshEaLmtGQtcc14BNB183
         YLHYtr+Ww/kD5KZTmsT9CpIRFjbT45TAJ5y7jrkY0bZkiUQseRaohygYcqv5v+HWZFcb
         K3URlnCHNqExRxIeaeaKsFauTlE30YdDV20SgldVxjVzpmMRlZ0CFSoSCp2Q1vy5s/dH
         bUD9tSKUJskhrV9m+K8adSVD3RSlqka1Ms9tecbfOEiwhfnh41CfLK7/VAZ5jM3twTka
         +B9g==
X-Gm-Message-State: AOJu0YwwFM9jWjoK9YII5RijDF9JYsd6RJVilYR6oIQE6dpqlPygczJy
	uVc+ZPU3OExeWdar2fEcQilueqOJFqmFC9MX/+g9NoJg4ujM1an1KmaYYLCelhp5pt72Cm2cNFu
	1Rmu3
X-Gm-Gg: ATEYQzwkciU0kv2Bi7aYjsDEGV+dhw03Ua19fR+gSWuM0cLPtgGm6zaMN5/ZsUVf0N7
	rXq6a8hrC+b5Y8NQZoNbPQAUeRW8QQ1bj+w6T0p7EvgochW/l4ahGvmtHuEtVXniEoJVUm7HlZa
	+yUv4Viq1QqvAYYgpKAD1s+SIs4KQdrd3nFYD9BzVIpaSbcZusDc22U9RRAICeYMW0Dh771GTUW
	HqXhHRpBAvYouYAk5hY3bfjKOqAk2hlZJKaxMqXey8CJKR4+9MQf9fBLaaF34uEKAW56C79GjtE
	l54aQrATFPEcFHGzDTIgg8/T+IHor4pPmXSUV83GA3t0cNq7bFnOoHLwOe49TzZAcZDlM1cXxPd
	FFYVNtQQ5P47Fjp6ptfpjTtd/0pO8uvzS/TkzCoqHOA5y2fCzqBl6xPQgGvGn0RGZVsx7eSTYIv
	UHIfgXtgEbFpHJLTDRe1qfU2f5MRVaKSbvnyxM
X-Received: by 2002:a17:90b:28c4:b0:359:409:49bf with SMTP id 98e67ed59e1d1-35a0129e642mr2041974a91.21.1773226872252;
        Wed, 11 Mar 2026 04:01:12 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:54:1b6c:8cf8:5b10:6a97:7a4f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359ffe77311sm2274372a91.11.2026.03.11.04.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 04:01:11 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] python3-pip: Fix CVE-2026-1703
Date: Wed, 11 Mar 2026 16:31:01 +0530
Message-Id: <20260311110101.1706045-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 11:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232866

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-1703
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-1703
[3] https://github.com/pypa/pip/pull/13777

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python/python3-pip/CVE-2026-1703.patch    | 37 +++++++++++++++++++
 .../python/python3-pip_22.0.3.bb              |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
new file mode 100644
index 0000000000..7a9bc1c9af
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
+index 5f63f97..3cebbf7 100644
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
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
index 28eab9c3de..e49be58839 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
@@ -38,6 +38,7 @@ SRC_URI += "file://0001-change-shebang-to-python3.patch \
             file://no_shebang_mangling.patch \
             file://reproducible.patch \
             file://CVE-2023-5752.patch \
+            file://CVE-2026-1703.patch \
            "
 
 SRC_URI[sha256sum] = "f29d589df8c8ab99c060e68ad294c4a9ed896624f6368c5349d70aa581b333d0"
-- 
2.25.1


