Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762B7D5AE70
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:01:39 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2899.1765620090769147055
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:01:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bMSDbFwC;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-297d4ac44fbso9950955ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620090; x=1766224890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EOZg6skddjv8lzRGbd6WHhnm2X3PRF5ffVM1ZMCaG0=;
        b=bMSDbFwCHhQc2cPNAVGrI0o6qICneQ4KNEmvZKu1idMxJQ8+krC6aTErabWSpu7mlN
         oHyJOtBl7GlrPrtEnvL46KemTRqPAXmFbFejmzbfLOe0PH9Via3kky1gexWQdnv4yK/W
         QTNY09IZXcPhjdO9bE+g3xsJJZvrw3na9tNWyYxqVdvemS8hcalfDreawXoxhAPpRNUT
         JyKdohvlXHLQ94Gi/SkJk3AtpkIKvrbbybHGorpZ7d16yY/bjRV81uliaVjRW/H/veHx
         /pMDCTrNu/98ZcmS8SafRrd8ElI2r5m0Gq68JzOt8e0jp8FGofhANdvfOT4pw/X2YSDP
         3rQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620090; x=1766224890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3EOZg6skddjv8lzRGbd6WHhnm2X3PRF5ffVM1ZMCaG0=;
        b=M712JS/XHiLGhYgaA6XLy/ksZnsK85AI9ZRt4UiF8HgR1OSDMthmFwlw/FyA95wcor
         5santyiAZFaBrgYvWJ5gxC1A967YJXH4q1ieN/nJFjwgAldDr+iMdMoGfpdcONX2qdAS
         lIaC6/kXFBTcsLHt6v4/b+KHIy+AhVb3ai5CwueWfo/6BCpwooTzkqyBsbXm5qKJzDNl
         yAb2pmCMa8KuML+8wb8A7eobog6N7Tog91BT/jEBxjb26K3go/MFsgdgSSOGcASRt8Ge
         EEbe6fu2tbOqa7NlLOJiGv9p/XvbtzVprky1K/u+uN15vGa9D5MFYWje4fI5BChgjHgQ
         GHEg==
X-Gm-Message-State: AOJu0YxS20CfRlECIfyDXmRCqO0sA8/0uvMy8J33BkItN9LdTyWfckQz
	2n+NZmJmUbRPMjYr/uYNHx3+q6he3t43r9b6W83fPyZINo22yQecDc/8pC1+/lDd
X-Gm-Gg: AY/fxX72qZFn1eWP70IvIwAM3yFLQYieRa2pPWPDGmEvVEeS1E2dOq3AFFXQRWcyuMm
	QKAbAm0jRNfBzu20IME1P9b0DcCAkh6pgbK6FrfhI5CeA1Jb5ZCblQW8iEPUTGFpyIZs0008S+3
	wSV8WRC/nmMvw9c8lsvEemH/zCIet2zOfh/ZZbROClmWoL55VuFZ74o7zqe4OhZsGylfGqdGfDC
	bpf7L1m1kvSz+zUhUuE3IuO1ZRepRxDa6BqK4M+HJmXG21Xf2riwA+mAS53Epl7Pvi4CZ5rQpfX
	JjIiFREOdgbtglk8AHvsPgzz/73IRHASN5hy6Xo6NmWSwIsucdEg3PvOB956n7uRBXh5iAKMAXY
	L9lLW30sQErU/ka19ITFQkWhglr0MTdAoefiQR0Q71pzSx1MeC5r3PiCC0iKhZR92unyAaD6NSu
	ytlbZzJ2l6kC78Lnn9BX2zWwmv
X-Google-Smtp-Source: AGHT+IFrgiOVlSWCc4600Y7zqxAfpGQI0XfBoBsRpizkLCX7FSZxp+sodTF9/7qdIQ2bU6CRQoIL/A==
X-Received: by 2002:a17:903:2344:b0:262:f975:fcba with SMTP id d9443c01a7336-29f24d88dfemr41174575ad.9.1765620089905;
        Sat, 13 Dec 2025 02:01:29 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:01:29 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Hongxu Jia <hongxu.jia@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 40/67] vte: support reproducibility when debug build is enabled
Date: Sat, 13 Dec 2025 15:29:04 +0530
Message-ID: <20251213095931.2571498-40-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227658

From: Hongxu Jia <hongxu.jia@windriver.com>

When debug build is enabled, there is a build path issue in source file
which caused build is not reproducible
...subprojects/simdutf/simdutf.h...
 1 /* auto-generated on 2025-03-17 16:13:41 -0400. Do not edit! */
 2 /* begin file include/simdutf.h */
 3 // /build-dir/vte-0.82.1/subprojects/simdutf/include/simdutf.h:1
 4 #ifndef SIMDUTF_H
...subprojects/simdutf/simdutf.h...

The source file is auto generated by python script amalgamate.py,
apply a fix to the script to use relative path to instead

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit adcec46bc3f95df865e098813af2d899c2d8ef73)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...rt-reproducibility-for-debug-sources.patch | 48 +++++++++++++++++++
 meta/recipes-support/vte/vte_0.82.1.bb        |  4 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/vte/vte/0001-support-reproducibility-for-debug-sources.patch

diff --git a/meta/recipes-support/vte/vte/0001-support-reproducibility-for-debug-sources.patch b/meta/recipes-support/vte/vte/0001-support-reproducibility-for-debug-sources.patch
new file mode 100644
index 0000000000..20e8f71c0e
--- /dev/null
+++ b/meta/recipes-support/vte/vte/0001-support-reproducibility-for-debug-sources.patch
@@ -0,0 +1,48 @@
+From 0959004adbe46f88d558d2ce61b496c662c196f5 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 3 Nov 2025 06:13:11 +0000
+Subject: [PATCH] support reproducibility for debug sources
+
+While option --debug-sources is used, the generated source file contains
+build path comments which caused the build is not reproducible [1]
+...subprojects/simdutf/simdutf.h...
+ 1 /* auto-generated on 2025-03-17 16:13:41 -0400. Do not edit! */
+ 2 /* begin file include/simdutf.h */
+ 3 // /build-dir/vte-0.82.1/subprojects/simdutf/include/simdutf.h:1
+ 4 #ifndef SIMDUTF_H
+...subprojects/simdutf/simdutf.h...
+
+After apply this commit, use relative path to instead
+...subprojects/simdutf/simdutf.h...
+ 1 /* auto-generated on 2025-03-17 16:13:41 -0400. Do not edit! */
+ 2 /* begin file include/simdutf.h */
+ 3 // include/simdutf.h:1
+ 4 #ifndef SIMDUTF_H
+...subprojects/simdutf/simdutf.h...
+
+[1] https://reproducible-builds.org/
+
+Upstream-Status: Submitted [https://github.com/simdutf/simdutf/pull/848]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ singleheader/amalgamate.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/singleheader/amalgamate.py b/singleheader/amalgamate.py
+index 190b2f6..75e0d78 100755
+--- a/singleheader/amalgamate.py
++++ b/singleheader/amalgamate.py
+@@ -385,7 +385,8 @@ def filter_features(file):
+                 current_features = None
+             elif enabled:
+                 if context.args.debug_sources and not prev_line.endswith('\\'):
+-                    yield f"// {file}:{lineno}"
++                    RELFILE = os.path.relpath(file, PROJECTPATH)
++                    yield f"// {RELFILE}:{lineno}"
+ 
+                 if line or (not line and prev_line):
+                     yield line
+-- 
+2.48.1
+
diff --git a/meta/recipes-support/vte/vte_0.82.1.bb b/meta/recipes-support/vte/vte_0.82.1.bb
index 4fa8115a20..b5d6f2fb62 100644
--- a/meta/recipes-support/vte/vte_0.82.1.bb
+++ b/meta/recipes-support/vte/vte_0.82.1.bb
@@ -17,7 +17,9 @@ GIR_MESON_OPTION = 'gir'
 GIDOCGEN_MESON_OPTION = "docs"
 inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala
 
-SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
+SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
+            file://0001-support-reproducibility-for-debug-sources.patch;patchdir=./subprojects/simdutf \
+"
 
 SRC_URI[archive.sha256sum] = "79376d70402d271e2d38424418e1aea72357934d272e321e3906b71706a78e3a"
 

