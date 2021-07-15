Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.1553.1626388136893196173
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 15:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cRK1vE6e;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id gp5-20020a17090adf05b0290175c085e7a5so442697pjb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 15:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fyz3TnQ4F6GzWSzhx0Drk09kEw82NTx/zsR47pOSHcE=;
        b=cRK1vE6eK5FFQwphog6Dv1x7kioN3YUY5UGq/Ep5w6QnPs7F9lC4UKpJWYa6TmlZe4
         7jPhuto82q1tWmKXFjponDKiwfvXnM41x3w6UXaXlEnq0qMZXQqK7SCzI9TV/FIT7gMc
         +oKDcyAKX9LDY5eyFauiEB5huQ8QqBLAmbw57gzGE3v/walfCCNQ4Lu24FoqzdH8G51c
         z4bS55ZoN5Q3ZFCSYECi+4YtFfLMtSBt0b7wjHOKLyj+MHS8Nx4jl/6d+cSwVGf5+Z33
         e8h0XQ/Ngwn6Xr33MfwvPeFPs2ftewxoeJQ14rjm3KbvPEPPWjrpQephGhZndJmiB4Es
         fZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fyz3TnQ4F6GzWSzhx0Drk09kEw82NTx/zsR47pOSHcE=;
        b=ua3WwFiYhiq350GPuOO5ww5DWOeUBEnRZ0ChPwu9CtwAPNX63Y3iZmv48IrGli1Mjf
         Z4xGK8r0F6QcYzP4aT+0IU0kF4ylB53vnM8Th+G9fAiQ/doPiWz9u2/O6LLcN1ytd6r1
         axkQuu6M3R1ifrnbrzZ03j65ZDrq8eUgcTR6g6aYIN/AjPKB3Y9o4jtE3GTJiwjOJzT6
         NlqX0pAenM1/z5tArKCN9EvTIo8Q+8BKFOKBQesiXWJ7fBJc1Bij77I57QyRBPseMLsc
         k0HhYmZDdw1iuz4Gc4kRpzD0b9NaRVuivbUc+8wKNO0smT7sDtQs7dqwtPwgUpQNkZJQ
         xkLw==
X-Gm-Message-State: AOAM530D5kwg3vxr3Ah5MTBrAYY3PtfB2Nn0xzHyby2ajkdGKZbY77WZ
	6PSpcrk7+f4/FRKMao4/rkWkUlpBxLawAQ==
X-Google-Smtp-Source: ABdhPJxMyINxTqYlCTyrve5TKi/zPHeIv+RQyJAZzvms2pPL8T9vtxLfcpkVurDorev+I6QogzWigw==
X-Received: by 2002:a17:902:6a84:b029:12b:53ab:4fed with SMTP id n4-20020a1709026a84b029012b53ab4fedmr5123815plk.57.1626388136140;
        Thu, 15 Jul 2021 15:28:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::5593])
        by smtp.gmail.com with ESMTPSA id c5sm7859602pfn.144.2021.07.15.15.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 15:28:55 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gpgme: Use glibc provided closefrom API when available
Date: Thu, 15 Jul 2021 15:28:52 -0700
Message-Id: <20210715222852.2041590-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

glibc 2.34+ has added this API new

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...se-closefrom-on-linux-and-glibc-2.34.patch | 24 +++++++++++++++++++
 meta/recipes-support/gpgme/gpgme_1.16.0.bb    |  3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch

diff --git a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
new file mode 100644
index 0000000000..1c46684c6d
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
@@ -0,0 +1,24 @@
+From adb1d4e5498a19e9d591ac8f42f9ddfdb23a1354 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 15 Jul 2021 12:33:13 -0700
+Subject: [PATCH] use closefrom() on linux and glibc 2.34+
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/posix-io.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/posix-io.c b/src/posix-io.c
+index e712ef2..ab8ded9 100644
+--- a/src/posix-io.c
++++ b/src/posix-io.c
+@@ -570,7 +570,7 @@ _gpgme_io_spawn (const char *path, char *const argv[], unsigned int flags,
+               if (fd_list[i].fd > fd)
+                 fd = fd_list[i].fd;
+             fd++;
+-#if defined(__sun) || defined(__FreeBSD__)
++#if defined(__sun) || defined(__FreeBSD__) || (defined(__GLIBC__) && __GNUC_PREREQ(2, 34))
+             closefrom (fd);
+             max_fds = fd;
+ #else /*!__sun */
diff --git a/meta/recipes-support/gpgme/gpgme_1.16.0.bb b/meta/recipes-support/gpgme/gpgme_1.16.0.bb
index da413c80a0..86dd69f0a1 100644
--- a/meta/recipes-support/gpgme/gpgme_1.16.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.16.0.bb
@@ -20,7 +20,8 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0006-fix-build-path-issue.patch \
            file://0007-python-Add-variables-to-tests.patch \
            file://0008-do-not-auto-check-var-PYTHON.patch \
-          "
+           file://0001-use-closefrom-on-linux-and-glibc-2.34.patch \
+           "
 
 SRC_URI[sha256sum] = "6c8cc4aedb10d5d4c905894ba1d850544619ee765606ac43df7405865de29ed0"
 
-- 
2.32.0

