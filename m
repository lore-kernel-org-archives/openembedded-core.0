Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C78CD4F39
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 05:34:37 +0000 (UTC)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4076.1778736873991346003
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 22:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kB4gYWrW;
 spf=pass (domain: mvista.com, ip: 74.125.82.50, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-132830d8281so1046195c88.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 22:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1778736873; x=1779341673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yvnc+TGCXyMTQz8t8dTR12CJikvAGLh6gySd7wMcdIE=;
        b=kB4gYWrW6OY2oJ4skqJs2xi4nqPiXgKhaVpu9DOMfSDi7cPJbZLU3IqvFciIsybcty
         N6kE4vNoLCj/snVLpsB3SCn64Kaa77A47PrV1h6d0SCgyH+NTSyxvJNTzvrnnO9iqE5v
         YAtEwRbrYMVcDgR7b7fJGzW1FMFvdcWcMsYdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778736873; x=1779341673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yvnc+TGCXyMTQz8t8dTR12CJikvAGLh6gySd7wMcdIE=;
        b=XZZS1eqc1R2wxyT6uDXz63F+5QCNTlBHAd2y5IFyjmX1kmGHZg6N5+vNhorZXyPQbw
         6uUk0yZN5dgnv5CYxuEAcm+2ygoC1cz/euXSmkH1zyYrqnfDSQJzs0iu2gCjChv3kTQw
         FfZi8UDnIJd57ftwV+8DiXa7F7WxamseVeN+YvVbjFpfDLjrUZK1QuoqJg9A/bRuFqzH
         A3g3PGe/5WlFsr+cNLAWmecD/E6Y1AegDETWnqY2S7Fg+iq6katVP9Pgtev7Ba9Ald5g
         CEzsnPlUQHFKAHractwOVgEiEOxPZe8PNRkjIsSW/BFW5P9ZBFpgpDbwWilvR4GGep8K
         b4Jw==
X-Gm-Message-State: AOJu0YyXLp2KjxKk49iQCMaZErXBn6Bu/wLrnezW9f0IHJsZkPh5Remv
	vGwObk/ZjORmQE++fYQbNGp24dCyfLLxXpoJkuoSYQsi1Nm05orrqMsjC2RGiP1E5cajSsk+7F5
	qnCa+PRs=
X-Gm-Gg: Acq92OFXNOcWaQKn+UdEPJ9xzr7XGEgCAVXxuX3gN1EQAHDU9HEdeKQ2BeVBJ2gf2TR
	0y2TlU05TqCfRirGwI6F2R1B+opTQWUaIuWwhChcKz4Sdt8nUlTuj+xUbm8v1ypAO/W8ptjszsw
	U6tRSis1VUmQgz7h+o4clLFKis0rnUFVDGXUr8CXlGC/txiWnfbJa74qFvLvRuqHhTYk4O9ykL+
	XPYlBZSRWC06GLoV9/jPevFkYF7NOE2IMRWTodKyBWvYpCBAlCwQVd8uSnNmvU+2ebCOF11Wd0X
	pEgXx7u9sZ/gVHkPcC9BU44s/3Ygb5cYkjdkfQF8yx/zslxwndJxA8Pt6IkQ9vY5ULxl4jNz0ye
	v/jo4VRJiVWEKjbArzf8XrSCaWpLZ1A4zrYsoTYghLuDYRGW0sW1WvrFOIxnBV2cRWMxsO/gyG/
	PH16qkXlZam0n+ni38dT8pBKMjAcosj6Bj0ZQ5
X-Received: by 2002:a05:7022:2511:b0:12d:c730:c7f with SMTP id a92af1059eb24-13436ba66f7mr3647342c88.33.1778736872738;
        Wed, 13 May 2026 22:34:32 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ed3sm2740003c88.1.2026.05.13.22.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 22:34:32 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] libexif: fix for CVE-2026-32775
Date: Thu, 14 May 2026 11:04:25 +0530
Message-ID: <20260514053425.307187-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 05:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237016

Pick patch from [1] also mentioned at NVD report in [2]

[1] https://github.com/libexif/libexif/commit/7df372e9d31d7c993a22b913c813a5f7ec4f3692
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-32775
[3] https://security-tracker.debian.org/tracker/CVE-2026-32775

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libexif/libexif/CVE-2026-32775.patch      | 86 +++++++++++++++++++
 .../recipes-support/libexif/libexif_0.6.24.bb |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-support/libexif/libexif/CVE-2026-32775.patch

diff --git a/meta/recipes-support/libexif/libexif/CVE-2026-32775.patch b/meta/recipes-support/libexif/libexif/CVE-2026-32775.patch
new file mode 100644
index 0000000000..2493588443
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/CVE-2026-32775.patch
@@ -0,0 +1,86 @@
+From 7df372e9d31d7c993a22b913c813a5f7ec4f3692 Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Mon, 9 Mar 2026 10:02:53 +0100
+Subject: [PATCH] check maxlen to be at least 1
+
+maxlen-- on 0 will become a high value.
+
+Fixes https://github.com/libexif/libexif/issues/247
+
+CVE: CVE-2026-32775
+Upstream-Status: Backport from [https://github.com/libexif/libexif/commit/7df372e9d31d7c993a22b913c813a5f7ec4f3692]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libexif/apple/mnote-apple-entry.c     | 2 ++
+ libexif/canon/mnote-canon-entry.c     | 2 ++
+ libexif/fuji/mnote-fuji-entry.c       | 1 +
+ libexif/olympus/mnote-olympus-entry.c | 2 ++
+ libexif/pentax/mnote-pentax-entry.c   | 1 +
+ 5 files changed, 8 insertions(+)
+
+diff --git a/libexif/apple/mnote-apple-entry.c b/libexif/apple/mnote-apple-entry.c
+index 6740d8e..337e51b 100644
+--- a/libexif/apple/mnote-apple-entry.c
++++ b/libexif/apple/mnote-apple-entry.c
+@@ -43,6 +43,8 @@ mnote_apple_entry_get_value(MnoteAppleEntry *entry, char *v, unsigned int maxlen
+ 
+     if (!entry)
+         return NULL;
++    if (maxlen < 1)
++        return NULL;
+ 
+     memset(v, 0, maxlen);
+     maxlen--;
+diff --git a/libexif/canon/mnote-canon-entry.c b/libexif/canon/mnote-canon-entry.c
+index 52a7077..372fcdf 100644
+--- a/libexif/canon/mnote-canon-entry.c
++++ b/libexif/canon/mnote-canon-entry.c
+@@ -559,6 +559,8 @@ mnote_canon_entry_get_value (const MnoteCanonEntry *entry, unsigned int t, char
+ 
+ 	if (!entry) 
+ 		return NULL;
++	if (maxlen < 1)
++		return NULL;
+ 
+ 	data = entry->data;
+ 	size = entry->size;
+diff --git a/libexif/fuji/mnote-fuji-entry.c b/libexif/fuji/mnote-fuji-entry.c
+index add7086..dd33900 100644
+--- a/libexif/fuji/mnote-fuji-entry.c
++++ b/libexif/fuji/mnote-fuji-entry.c
+@@ -199,6 +199,7 @@ mnote_fuji_entry_get_value (MnoteFujiEntry *entry,
+ 	int i, j;
+ 
+ 	if (!entry) return (NULL);
++	if (maxlen < 1) return NULL;
+ 
+ 	memset (val, 0, maxlen);
+ 	maxlen--;
+diff --git a/libexif/olympus/mnote-olympus-entry.c b/libexif/olympus/mnote-olympus-entry.c
+index 679fb50..d5eb60e 100644
+--- a/libexif/olympus/mnote-olympus-entry.c
++++ b/libexif/olympus/mnote-olympus-entry.c
+@@ -284,6 +284,8 @@ mnote_olympus_entry_get_value (MnoteOlympusEntry *entry, char *v, unsigned int m
+ 
+ 	if (!entry)
+ 		return (NULL);
++	if (maxlen < 1)
++		return NULL;
+ 
+ 	memset (v, 0, maxlen);
+ 	maxlen--;
+diff --git a/libexif/pentax/mnote-pentax-entry.c b/libexif/pentax/mnote-pentax-entry.c
+index 32b537b..d3c96f8 100644
+--- a/libexif/pentax/mnote-pentax-entry.c
++++ b/libexif/pentax/mnote-pentax-entry.c
+@@ -315,6 +315,7 @@ mnote_pentax_entry_get_value (MnotePentaxEntry *entry,
+ 	int i = 0, j = 0;
+ 
+ 	if (!entry) return (NULL);
++	if (maxlen < 1) return (NULL);
+ 
+ 	memset (val, 0, maxlen);
+ 	maxlen--;
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/libexif/libexif_0.6.24.bb b/meta/recipes-support/libexif/libexif_0.6.24.bb
index b407ee52de..b3ee15a37f 100644
--- a/meta/recipes-support/libexif/libexif_0.6.24.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.24.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libexif-${PV}.tar.bz2 \
            file://0001-Add-serial-tests-config-needed-by-ptest.patch \
            file://run-ptest \
+           file://CVE-2026-32775.patch \
            "
 
 SRC_URI[sha256sum] = "d47564c433b733d83b6704c70477e0a4067811d184ec565258ac563d8223f6ae"
-- 
2.50.1


