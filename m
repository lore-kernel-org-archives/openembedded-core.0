Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC98EF46435
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:30:19 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46607.1773653412911331244
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PwRbmdBo;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so39423015e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 02:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773653411; x=1774258211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+iUboOrmgL8lrU0Q1zx7gyjF9rrIv36WPtuap9bylnI=;
        b=PwRbmdBoKeU/wXVh6mmgnN/+clMz8HclIGjDli1xiHKVQ9wgCzuLPHMMoj9MXTnN9s
         g629oM1idJwpp3K36acjpNNEewDJtoLxD5TUi8EVrmQZzYANRVp0EiVVfqiiQdoukrWQ
         3Zqard4X4JONCHRtYgcZN0XTFft1k2QIcvQao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653411; x=1774258211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+iUboOrmgL8lrU0Q1zx7gyjF9rrIv36WPtuap9bylnI=;
        b=h3fU0xVo2GmSevhEfuH8Iz1ALUMCBXnnKHQXZdDmyltXjH7d846xfY79gsUXnb8OPZ
         aSepYGegZr9ZkiLCROrra3jex73I9jJNbTWGmJMUARs5R/2pRQaNprpCIWbAAv+k+nPS
         i7EpVpbT+oF0ekT8cj5MVRWCouPE39GkK4Hyl+eJweReTDHfsEs7Rs+/yus2jVSU/8P4
         9eATgkz2fwngj2Ttk6U7T12fStoYLzxJS1zNW7KIK1I7KgjKiMBHfIj/5znQYdlqroNy
         v6wzydNrWa1tmRyxuOs05Z+XLTVc8D43kPAzgW682eV63RUzoWhZ+J2ckWkudKcDjMWm
         gmaA==
X-Gm-Message-State: AOJu0YzqCMXXRs/c8bGWzXEGK827kI33HKmgceot93e6CviAy8bweHjs
	PVOztn5eWHrT40eCzMLuGr7UJUbafw51FojyMNvmTWY/Qbks6l/SykMgTSqGiOWzUm1tBnUmXOG
	DxOI0
X-Gm-Gg: ATEYQzyNQQ1wob/4gHU+itgrGdDTSzbvJHo5JMPR8wBPcB17nGgJjJtWoH8wgTo9UTA
	d64elb6ID/3P/HR9s2P3TWBujfrommwWYqAXUaVOZlzIXLwMhtBMygFtLkcs4Fn68Vi106g3vsT
	5XFmTJoWRqJO3aqYfmr2D7N6BnbKOTErOrhWCSzeL8xLRuk0x71/Y3rQJ7Y6HwrSJu20YT0WPSM
	PVnL1EUIi3oZ8LBw3ZBrggSRkb6HkuFlbU6tQU8UV8mpr3EClbuR1S1dtreUz8GfNbJiFZkhxOQ
	h98xzYf+wGevdRvgXqO2Bs1lXW9AdJEAbTNqiLjd8iCkf0f9UwkpRCpD+jgobFHFaitsDQODUnI
	JxKGTSijuNz+SG0FxNWaVQwo4kSwsq+eVF595X5qqftkIoxQVncitkn0D6XhnfCe4j/HQDsmPw8
	UZ3gdoxLbdT5YhoYjGchj80dEOQ6Qh0P7LLxTo6tFOeh97NkJIIQyA43yBWB/MQMrghKK6xVpxE
	Uih2Ijn/wG00D30HppDR23F04T8/FXOZA==
X-Received: by 2002:a05:600c:3588:b0:485:5d25:81a9 with SMTP id 5b1f17b1804b1-4855d258656mr168077095e9.14.1773653410778;
        Mon, 16 Mar 2026 02:30:10 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a732cesm91138265e9.12.2026.03.16.02.30.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:30:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/17] python3-pip: Fix CVE-2026-1703
Date: Mon, 16 Mar 2026 10:28:33 +0100
Message-ID: <63573d3d95a2ae38e4e562bb4c2eca379125462d.1773652940.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773652940.git.yoann.congal@smile.fr>
References: <cover.1773652940.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 09:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233236

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-1703
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-1703
[3] https://github.com/pypa/pip/pull/13777

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3-pip/CVE-2026-1703.patch    | 37 +++++++++++++++++++
 .../python/python3-pip_22.0.3.bb              |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
new file mode 100644
index 00000000000..7a9bc1c9afa
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
index 28eab9c3dea..e49be588390 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
@@ -38,6 +38,7 @@ SRC_URI += "file://0001-change-shebang-to-python3.patch \
             file://no_shebang_mangling.patch \
             file://reproducible.patch \
             file://CVE-2023-5752.patch \
+            file://CVE-2026-1703.patch \
            "
 
 SRC_URI[sha256sum] = "f29d589df8c8ab99c060e68ad294c4a9ed896624f6368c5349d70aa581b333d0"

