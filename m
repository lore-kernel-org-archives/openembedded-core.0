Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web10.11596.1588948026358511338
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2020 07:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OBafRQGr;
 spf=pass (domain: gmail.com, ip: 209.85.208.196, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f196.google.com with SMTP id a21so1866010ljb.9
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2020 07:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dCAHDvRDQthVxKD5bFDobSfUbMeaI1cgiyRbGvr9q9k=;
        b=OBafRQGrzI0QB5BFuHz+6tTDxMmri/uD1AtZl8DsOdsviv7uQ1k1aeqeZMa9uNVbD5
         CQXQ1lxFcvrq59DozxyL9o9p+e9txLKAg9NlRj5KlhDZ8k1t2/3vvmr+8Z4AuPxcqfX7
         keWooGLUhcKlMm2jVtPf0nxiDyH79V5dZiLijHMKI20il8VGdbYl5fKtyKPBBjJLJ7/y
         UwLcjKHICbdhdJE0mcu6PEnm28aKDUuFOE9YEg1x7dBw7nRefKdxRgRTOhnXCkKGh5sE
         5Gzy2w/Xq3SdGyO0t6ZaeM5qxq0cBz2WmApoRemJx1qGFDeTK6ffLcwPaX/muyqqWxyp
         2kfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dCAHDvRDQthVxKD5bFDobSfUbMeaI1cgiyRbGvr9q9k=;
        b=dVNzkSF0RnP5Wv01Pdfj8BJfgGNhJMHzUJCbb1T/yGH7Sfjz62/aCcBiOjk+Pf/eF1
         RDuCrjPPBN8/L66n45E42Baivgm+F8nCSQt4n/8vsF56Eze36fJlcEHkEdia8KZLmYFl
         YMmaODQ9XpctuMw0/Rk4+W4mrZ8/Ib8vubHx4857SuVPAFFqeowPE+cIL4BmwKa/6qv7
         Ev8ySFD9rW85OhDSmUxuE+Nhh4lHrYFGCEWhZ6yO4Nupn56foXK91Cei4Wx8s2Y75iEN
         RjsaDWyazOdARaTthnQrpCQGkHK4HKcOOtIzSm9p00oUzfGALS7IWBtJtOTe4zKxHaaw
         ZPdg==
X-Gm-Message-State: AOAM532VWCSC4uFfq4VabVXdIC6gr/wuwkKXH3SxsM5ygZ6NjtbLdY7c
	Ah/jUiMS60Dxiq9xcUVKiPeaiBM58Ak=
X-Google-Smtp-Source: ABdhPJw0ywgnx+Qk6TtTfijA6w6+7MAe589vodQul2DhTVgvAAG3MjHFY1nG4Jm4L+SQ4EOwcHuBag==
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr1949456ljo.167.1588948023805;
        Fri, 08 May 2020 07:27:03 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id a12sm1314158ljj.64.2020.05.08.07.27.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 07:27:03 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Fix enum typedef
Date: Fri,  8 May 2020 16:26:39 +0200
Message-Id: <20200508142639.2471013-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'pseudo_access_t' is a type, so use typedef.

Fixes building pseudo with gcc 10 where -fno-common is the default.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 .../0001-pseudo_ipc.h-Fix-enum-typedef.patch  | 31 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo_ipc.h-Fix-enum-typedef.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-pseudo_ipc.h-Fix-enum-typedef.patch b/meta/recipes-devtools/pseudo/files/0001-pseudo_ipc.h-Fix-enum-typedef.patch
new file mode 100644
index 0000000000..33d4ef3b2f
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-pseudo_ipc.h-Fix-enum-typedef.patch
@@ -0,0 +1,31 @@
+From a491aececfedf7313d29b80d626e0964fb533548 Mon Sep 17 00:00:00 2001
+From: Jacob Kroon <jacob.kroon@gmail.com>
+Date: Sun, 3 May 2020 06:24:03 +0200
+Subject: [PATCH] pseudo_ipc.h: Fix enum typedef
+
+'pseudo_access_t' is a type, so use typedef.
+
+Fixes building pseudo with gcc 10 where -fno-common is the default.
+
+Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
+Upstream-Status: Submitted [https://lists.openembedded.org/g/openembedded-core/message/137758]
+---
+ pseudo_ipc.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pseudo_ipc.h b/pseudo_ipc.h
+index caeae5c..d945257 100644
+--- a/pseudo_ipc.h
++++ b/pseudo_ipc.h
+@@ -29,7 +29,7 @@ typedef struct {
+ 	char path[];
+ } pseudo_msg_t;
+ 
+-enum {
++typedef enum {
+ 	PSA_EXEC = 1,
+ 	PSA_WRITE = (PSA_EXEC << 1),
+ 	PSA_READ = (PSA_WRITE << 1),
+-- 
+2.26.2
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index a3049c5e6c..324ae9071f 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
            file://0006-xattr-adjust-for-attr-2.4.48-release.patch \
            file://seccomp.patch \
            file://0001-pseudo-On-a-DB-fixup-remove-files-that-do-not-exist-.patch \
+           file://0001-pseudo_ipc.h-Fix-enum-typedef.patch \
            "
 
 SRCREV = "060058bb29f70b244e685b3c704eb0641b736f73"
-- 
2.26.2

