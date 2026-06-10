Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FF7CD98DD
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:55:31 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33649.1781132121955949160
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 15:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iIlMqDtq;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so185399f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781132120; x=1781736920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ch7g+P/1sinC6Qs3dn/T8ooMKHXrvre29E0ro3zdxe4=;
        b=iIlMqDtqzz4H8Lx6o6hOVKSbY1u1ZNUSFQXakgRSpnItwlj1fp95e5OQiRh6ZJcNfy
         XGRKoQovB/9csXNcpDIJxDr070M2rgr9b+tTDiLA1K982m1GJfgmy0JuZJSllyz7picr
         fOZMA5Bvs6dhFS5ZTkgb3+K5lEdx6u4qzJR4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132120; x=1781736920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ch7g+P/1sinC6Qs3dn/T8ooMKHXrvre29E0ro3zdxe4=;
        b=N/s+IgqeQdJU+WJH8tXdxM1/6qz/pVLEDXgr2b0ACmxR92ajqrHHEP43tPuiuJZKQL
         YWD18DEFzTj/DaRRtBYVoIax55q61W2eghEHIlEJ9oAOv9P91mrGCwc3xLI/JffDQHEf
         iTzH///7uoqTrLE1JYPtzPmNc1Rz2DQA3kFKuXsDGftwOiqAlrQfRWmSS+8J9BOBmQpy
         Sc3MT7DxLwGcfn60u3K7k72uMgfPsBsOODQs2tqkbT58IPqCBxqNUhLOZUESw5wLA9D/
         WDCsb+aFmJbhtaTXJWOew+wa699kR72bf3ZgNDvwAQWticZaJ8G9bKuw6FgqOfGl/xeN
         H5sQ==
X-Gm-Message-State: AOJu0Yzhs8PL/mEnFQSK5HTcNcuXriu6WKSTkhh+Xhpm5CW6G+Z0pK4B
	HnZhH9boZe0l782hM1W4eHw3PX7XPY7lWwv3OACLhIrv1P79pWNdQ5dnZAO1bxMMu5GCuZvUnQM
	G5P4l
X-Gm-Gg: Acq92OH+9gb05ekpL7KgTADax4vNtxqQEIHia75ELBZPrB439PNQiyYSNvKnMUU7kEt
	AUGiGTc21IJi9faTHOc6atuJkxypI057kq+uwGo0EVSpEeKzSF9HnpwOZ/GzGuHnAyc6dJxJIo/
	JFQ1qwtZ4ITtDhRffBzq/nrTZrxZBKLVyYj7FV3xjIYH094Dgn4UeHMJ/EWDVSkO6YMy0VIoDkq
	3SKOf8D0fCOumJhWYQrXQc+73F9emyuMCsXIbCIVI5wHUPGuMMSp1nJcNUJ55gDd7u+I6pGVzG3
	ce76XqiVPhkX10tTFPIokLtYLHNTDmgayimrFBC2fwaEbtxmgwHo3uEZ2YGfug2Og12BLyBDEt3
	C3gYrhB3Vig56ANMZjPESV7vAVqXPfQrtDdOyy8rmWq5cry1xbYfB9lIpgme/Wv8zazJi030dHE
	joaAWO4Qz1WSwwQWHq3V3aFH+wbDd/VMQZdj2zs+3L3ndSKS+iWXao7owZPZGv252bNUYUWeH3r
	gN52EQqCgBKthu+HzMXzJufsAauCGJs7Y9mQ50=
X-Received: by 2002:a05:6000:25ea:b0:44f:69f4:39b5 with SMTP id ffacd0b85a97d-46067c36927mr36519f8f.29.1781132120327;
        Wed, 10 Jun 2026 15:55:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm71599304f8f.19.2026.06.10.15.55.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:55:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 08/21] cups: fix CVE-2026-39314
Date: Thu, 11 Jun 2026 00:54:59 +0200
Message-ID: <de6debe9da24cda36f891f4c76f5afb66732791a.1781132051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781132051.git.yoann.congal@smile.fr>
References: <cover.1781132051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238404

From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>

In CUPS versions 2.4.16 and prior, an integer underflow
exists in _ppdCreateFromIPP() (cups/ppd-cache.c). A local
unprivileged user can supply a negative job-password-supported
IPP attribute. The bounds check only caps the upper bound,
so a negative value passes validation, is cast to size_t
(wrapping to ~2^64), and is used as the length argument to
memset() on a 33-byte stack buffer. This causes an immediate
SIGSEGV in the cupsd root process. Combined with systemd's
Restart=on-failure, an attacker can repeat the crash for
sustained denial of service.

Apply upstream fix to validate negative values and prevent
integer underflow in _ppdCreateFromIPP().

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2026-39314.patch            | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-39314.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 42107774e4e..a12965bb6e5 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -19,6 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-34979.patch \
            file://CVE-2026-34980.patch \
            file://CVE-2026-34990.patch \
+           file://CVE-2026-39314.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-39314.patch b/meta/recipes-extended/cups/cups/CVE-2026-39314.patch
new file mode 100644
index 00000000000..8d25a1c2e39
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-39314.patch
@@ -0,0 +1,47 @@
+From 928a86b1b794f738f0a3dc87561b2e054bff7ce4 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Sun, 5 Apr 2026 10:45:25 -0400
+Subject: [PATCH] Range check job-password-supported.
+
+OpenPrinting CUPS is an open source printing system for Linux and other
+Unix-like operating systems. In versions 2.4.16 and prior, an integer
+underflow vulnerability in _ppdCreateFromIPP() (cups/ppd-cache.c) allows
+any unprivileged local user to crash the cupsd root process by supplying
+a negative job-password-supported IPP attribute. The bounds check only
+caps the upper bound, so a negative value passes validation, is cast to
+size_t (wrapping to ~2^64), and is used as the length argument to
+memset() on a 33-byte stack buffer. This causes an immediate SIGSEGV in
+the cupsd root process. Combined with systemd's Restart=on-failure, an
+attacker can repeat the crash for sustained denial of service.
+
+CVE: CVE-2026-39314
+
+Upstream-Status: Backport [ https://github.com/OpenPrinting/cups/commit/928a86b1b794f738f0a3dc87561b2e054bff7ce4 ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+---
+ cups/ppd-cache.c | 4 ++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
+index f5386532ca..ef6caa28a7 100644
+--- a/cups/ppd-cache.c
++++ b/cups/ppd-cache.c
+@@ -1,7 +1,7 @@
+ /*
+  * PPD cache implementation for CUPS.
+  *
+- * Copyright © 2022-2025 by OpenPrinting.
++ * Copyright © 2022-2026 by OpenPrinting.
+  * Copyright © 2010-2021 by Apple Inc.
+  *
+  * Licensed under Apache License v2.0.  See the file "LICENSE" for more
+@@ -3530,7 +3530,7 @@ _ppdCreateFromIPP2(
+   * Password/PIN printing...
+   */
+ 
+-  if ((attr = ippFindAttribute(supported, "job-password-supported", IPP_TAG_INTEGER)) != NULL)
++  if ((attr = ippFindAttribute(supported, "job-password-supported", IPP_TAG_INTEGER)) != NULL && ippGetInteger(attr, 0) > 0)
+   {
+     char	pattern[33];		/* Password pattern */
+     int		maxlen = ippGetInteger(attr, 0);

