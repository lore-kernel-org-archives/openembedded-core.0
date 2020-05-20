Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web11.7250.1589952397800167108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 22:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WixvCuoo;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id q24so734133pjd.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 22:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lb/MI8k1hck6O8bu3auhINRxH+Gxj2q0XO0gUIEYCkM=;
        b=WixvCuooqtan4KEFcqPtwiBGsLsxQsw5vpuK4A70Zd0l8s+r9E0HH9LRiEqG2SqgPZ
         K6r6LTSFaNFcaQ32tCTF59GjAQGQ0yFb4Xad3wQ+IXqIHpvVSEiegfjjZtTWhSlCYiZb
         D73IIQQqtE0OR8ktYENlyrd4sOtV31PyU2LP0wN23TokQUTCXD9TS7JxjWMAwLhDoIW3
         eBzkwWBv2J1H6p6sI0LMeBILKXHXDB1wRHpIzzWudjeY+j3F6EgZaAPQu9lqMJ3d+K+D
         6LTAMo6W5gkfJlwQNRBcNyG99ajTmHiMPrWczjIGkfDJ7jYkbczUZXlRkxXFBb1qTsDf
         KZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lb/MI8k1hck6O8bu3auhINRxH+Gxj2q0XO0gUIEYCkM=;
        b=lO/OVVFPYzCf1W7/YVPavsulXf/eueijeFsX8q2EnwUOQmLjA/Wa/Jqf+w8AkO3i9J
         kGorKYWhqokxP/zvwgH02Y0wEZWYC5odqh1uSGA/ZU4e47IpPU9SlGIFJzhyLdCgDaJS
         6Fam7KWG2mNiLbVA2lyuFce9Cp6AVXVSfpXk7t56fIXd7b7qEk8Wi3VF6yKPEDKHUsBG
         CQMYlQAO/fORh7VFXEgdwLukwDEifXmiuqx5sGQTZwEIJg8+c0WB7toonMJELLjxGjKY
         cUjP5nErrs/5gR530I1Uvy42+1bnRgMzSjE5GNygLETgOHlJX5FBdKcimTt7pvd5n7n0
         fgvg==
X-Gm-Message-State: AOAM530E1hFfjswWf8B8vc4wY1uZPX55TGSup1Hl3JHHy5TgmMjItpBD
	5l0tZs4mttRCFlUO4+zwCu0LY8JbaEA=
X-Google-Smtp-Source: ABdhPJxSXnGSlFzv/urlZZc2ACRxs4s4SR9Yx8bsZSlLHPJy5H+I8SzBY031wIPYr2LWLlqbOu4C+Q==
X-Received: by 2002:a17:90a:bf08:: with SMTP id c8mr3356111pjs.13.1589952396882;
        Tue, 19 May 2020 22:26:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id a2sm874269pgh.57.2020.05.19.22.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 22:26:36 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Petr Vorel <petr.vorel@gmail.com>,
	=?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
Subject: [PATCH] ltp: Fix format security warnings with gcc10
Date: Tue, 19 May 2020 22:26:34 -0700
Message-Id: <20200520052634.3291199-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Petr Vorel <petr.vorel@gmail.com>
Cc: Daniel Díaz <daniel.diaz@linaro.org>
---
 ...1-ptrace01-Fix-missing-format-string.patch | 32 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20200515.bb     |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-ptrace01-Fix-missing-format-string.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-ptrace01-Fix-missing-format-string.patch b/meta/recipes-extended/ltp/ltp/0001-ptrace01-Fix-missing-format-string.patch
new file mode 100644
index 0000000000..d3785546c9
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-ptrace01-Fix-missing-format-string.patch
@@ -0,0 +1,32 @@
+From adb9587466a493fdd9d4410f1b8b130ebca06daa Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 19 May 2020 22:21:23 -0700
+Subject: [PATCH] ptrace01: Fix missing format string
+
+Fixes
+| ptrace01.c:89:2: error: format string is not a string literal
+(potentially insecure) [-Werror,-Wformat-security]
+|         tst_res(TINFO, tc->message);
+|         ^              ~~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/kernel/syscalls/ptrace/ptrace01.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/syscalls/ptrace/ptrace01.c b/testcases/kernel/syscalls/ptrace/ptrace01.c
+index 87a99e4150..9071bbabaf 100644
+--- a/testcases/kernel/syscalls/ptrace/ptrace01.c
++++ b/testcases/kernel/syscalls/ptrace/ptrace01.c
+@@ -86,7 +86,7 @@ static void run(unsigned int i)
+ 
+ 	got_signal = 0;
+ 
+-	tst_res(TINFO, tc->message);
++	tst_res(TINFO, "%s", tc->message);
+ 
+ 	if (tc->handler == 1) {
+ 		parent_act.sa_handler = parent_handler;
+-- 
+2.26.2
+
diff --git a/meta/recipes-extended/ltp/ltp_20200515.bb b/meta/recipes-extended/ltp/ltp_20200515.bb
index 37bad53766..e82f6b33a1 100644
--- a/meta/recipes-extended/ltp/ltp_20200515.bb
+++ b/meta/recipes-extended/ltp/ltp_20200515.bb
@@ -34,6 +34,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0004-guard-mallocopt-with-__GLIBC__.patch \
            file://0007-Fix-test_proc_kill-hanging.patch \
            file://0001-Add-more-musl-exclusions.patch \
+           file://0001-ptrace01-Fix-missing-format-string.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.26.2

