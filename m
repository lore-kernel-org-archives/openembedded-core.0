Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52CAD6D223
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 18:50:21 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.79044.1732733416319456097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 10:50:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oPt7RrAC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-724e7d5d5b2so101020b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 10:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732733415; x=1733338215; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CY0T1I6lYqMksIMQyUkKGu2Ghv1V9ibQI1n+7EC7h4M=;
        b=oPt7RrACGkmKoe9JG+YhVwhcuQPhPZqFoqz2p170BbMbFR9+wAbMwsKatWiDz1WOII
         C3CnTctnIr/sxy6nDpfn5pqMOQ1NqmmVT51MC0dNucuopF7xMi71o9fgMJzFKIcHJynx
         49rqfNQjRpVxF9dBlwoOzgmc4WU1XDu3iqjkJR1Kuy40mjxQW5dGgMSL0Nid4hgQDjU2
         DRVwPRs2TKnAmqIEVfyOJcBVOjDfg9yqoptZ1f7FX6//cWZnDag542QlvCZACNy5hPKP
         2vo1JjUBlhyWHkgy6ALOIrCCSY67GdsI0NViD+UG7UK1wUnbJ2g6c47km3KUrdpodIQJ
         JaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732733415; x=1733338215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CY0T1I6lYqMksIMQyUkKGu2Ghv1V9ibQI1n+7EC7h4M=;
        b=KX7r39hypl1B1EsDQ/KTVScuYP44LQmClF1H4wLuxVH5KryPEng6SOF1xt5NsacVB9
         kRRWmY4PEIu+GFjkW8h0fcOQzIr+sGQKyP/UxnIKmhYV4trEC0JORSWuhFZIar9Sgz82
         l9Uok1UeuTuTGO6M9kyZGi9KL8hlJlwDSuDd5dta7+LOZ2+nJGYO4OKA2FpbqaGJndVq
         EWhwlo1OW52jOOvlgpBbsE+WyWqgYJPnOYVO4JThR0NIPwoRsl96qd2n+NVhDwIWEzJl
         1GRdtRX4q1XV2uHRp09iaIx1CiWYSUotz4KYb7QeJFM6o+XZFmaLMRTlPHEMA78mtnoP
         br6A==
X-Gm-Message-State: AOJu0YwLS0JgM3aSI3W3i6R1SozLBo3L33h7XDBa9XpmpR3pddLNO3pu
	upthgDhMOQ4TQAtd0Ww3kMdIZ8vNFkV5hcMoEkql67Yn/r1jtI5u7Iq0zIEwkigPFCoIClbyXlI
	u
X-Gm-Gg: ASbGncsgol3at+ObMj3QiNm9E8XCy9k6eW710uYdjOPhuZt24drJjcIn3hGwcxzZTt3
	9b6XRKuk6ZNXWV0ROfW3Fd5R9xpkUiE+bicPNz99Tmk9ucc2siXkOJwetGN7I6lFI8KpNVquVy4
	UHHG0mGX0YowPE8yAXrXNQryBBcPz/uxJdP/UFVM8QPWGyr3OAfs910rQb4MLBlFq/HMPtRmMxc
	9E8B2r4U92GHsFa4siFA110no+McMHp0cGRjD0=
X-Google-Smtp-Source: AGHT+IE6+Ue8dzCNNg8d1LQak2mPIXm67OKVRzKYSG/yYCv/4Lulxikt6t/4AezUMRBZIFHGPeKdIw==
X-Received: by 2002:a05:6a00:c8b:b0:71e:744a:3fbc with SMTP id d2e1a72fcca58-725301411b9mr5461649b3a.21.1732733415498;
        Wed, 27 Nov 2024 10:50:15 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72522e0375asm3403519b3a.94.2024.11.27.10.50.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 10:50:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/14] coreutils: fix CVE-2024-0684
Date: Wed, 27 Nov 2024 10:49:56 -0800
Message-Id: <3d9a4cacd5f051134f190afcab2c71b3286cf9e5.1732733274.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732733274.git.steve@sakoman.com>
References: <cover.1732733274.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 18:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207945

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch with tweaks for the current version to fix
CVE-2024-0684.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...0001-split-do-not-shrink-hold-buffer.patch | 42 +++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.0.bb  |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/0001-split-do-not-shrink-hold-buffer.patch

diff --git a/meta/recipes-core/coreutils/coreutils/0001-split-do-not-shrink-hold-buffer.patch b/meta/recipes-core/coreutils/coreutils/0001-split-do-not-shrink-hold-buffer.patch
new file mode 100644
index 0000000000..3eab65dcf1
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/0001-split-do-not-shrink-hold-buffer.patch
@@ -0,0 +1,42 @@
+From 80dca40bbb36b7b1630bb5a43d62b3ff21b4e064 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 25 Nov 2024 23:43:49 -0800
+Subject: [PATCH] split: do not shrink hold buffer
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* src/split.c (line_bytes_split): Do not shrink hold buffer.
+If it’s large for this batch it’s likely to be large for the next
+batch, and for ‘split’ it’s not worth the complexity/CPU hassle to
+shrink it.  Do not assume hold_size can be bufsize.
+
+CVE: CVE-2024-0684
+
+Upstream-Status: Backport [c4c5ed8f4e9cd55a12966d4f520e3a13101637d9]
+
+The original patch is tweaked to fit the current version.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/split.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/split.c b/src/split.c
+index 4b1b144..e44e867 100644
+--- a/src/split.c
++++ b/src/split.c
+@@ -785,10 +785,7 @@ line_bytes_split (uintmax_t n_bytes, char *buf, size_t bufsize)
+             {
+               cwrite (n_out == 0, hold, n_hold);
+               n_out += n_hold;
+-              if (n_hold > bufsize)
+-                hold = xrealloc (hold, bufsize);
+               n_hold = 0;
+-              hold_size = bufsize;
+             }
+ 
+           /* Output to eol if present.  */
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb b/meta/recipes-core/coreutils/coreutils_9.0.bb
index 8a2fbeca32..1cce9192ec 100644
--- a/meta/recipes-core/coreutils/coreutils_9.0.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
            file://e8b56ebd536e82b15542a00c888109471936bfda.patch \
            file://run-ptest \
+           file://0001-split-do-not-shrink-hold-buffer.patch \
            "
 
 SRC_URI[sha256sum] = "ce30acdf4a41bc5bb30dd955e9eaa75fa216b4e3deb08889ed32433c7b3b97ce"
-- 
2.34.1


