Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.654.1588083657668704383
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 07:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R/TxqxrY;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id d17so24871981wrg.11
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2020 07:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VBX6p8fmQk9m5GB2u876OQt6cOdFxF89AVAyMyiusXk=;
        b=R/TxqxrYHUUNHDSz41qf14iJ/3b0KOseXdjAOoCUCJDBXz/kYhu5u8soQnMGw2iBE+
         gN5BOqF15rSHK+e1/jZaVa/7pytEfwIxc4PtpgO18JuMh9sQEZO9Sxn8sYAVGkrsRhbH
         5wow96MWLiPT0AdylQexCwddP0exJLC4O+cl74pjVgzQX7BvGHXipMFKQyPypTXjwkpn
         xdt5yRECB397hPRWLhW4aLd4KOvvT924bhT4bzgmAzuRTdmTCe+TyBV3M0ZVnY9KMMNE
         EVLoStxmQfOjKk7EzTN+7a38GwNgKHhbKiedx6MIXHFWTrA7kSM/34xoevqMkG/ETmma
         EQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VBX6p8fmQk9m5GB2u876OQt6cOdFxF89AVAyMyiusXk=;
        b=WuOE/OdvPZvVeeTHOLtyaGzeqy3Nn2WImoO7+vXb/RgMn6zvkeG3BK7RZWpe+IehLl
         FiDphON3hCzKKxoZRPhyNJWg2hjthy8rAeUMiKRspI1qLG1NfSRDO2eYP/cEWMNctRJ3
         qMb3OSG/dMuvzv6gAPYBaFAoqutKvL7ieQj8DbUsNv9ggHRwzcc0x+yCRwY/GzeDqv7b
         BEwWWwvRraf0goyx4YPDfTx69hKhRVOT8h45+/bAQLM0TA/AAn/0it3uUq9yvrZPEctG
         E2NKxI/2AkwPncbzAo0ybMhtVtl9+CB5DzujXksDprl8eDWm/kIMjoYqhmbcxEaMZ+ps
         fXQg==
X-Gm-Message-State: AGi0PuZ40NxBs/lxXuRAK3busgfKr1NFBtS5+U7IyQFZWjZe4LSBwPVr
	NJCYgi/DrDS6X8tOpce8g1gTo5Tu
X-Google-Smtp-Source: APiQypKksHwQq617toWswBM/ttlFsLek9lOAbdy/7Lyyplfv+V1+zmOlvSYuYYi5FWsU2ivPcl9A4A==
X-Received: by 2002:adf:f004:: with SMTP id j4mr32904954wro.123.1588083655936;
        Tue, 28 Apr 2020 07:20:55 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id g69sm3739478wmg.17.2020.04.28.07.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 07:20:55 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] dnf: add a patch for base-files installation failures
Date: Tue, 28 Apr 2020 16:20:28 +0200
Message-Id: <20200428142028.28813-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-dnf-write-the-log-lock-to-root.patch | 29 +++++++++++++++++++
 meta/recipes-devtools/dnf/dnf_4.2.21.bb       |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch

diff --git a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
new file mode 100644
index 0000000000..21b50dee01
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
@@ -0,0 +1,29 @@
+From 5e07c16a506b19cbb107d5e99fca41d679b23b9a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 28 Apr 2020 15:55:00 +0200
+Subject: [PATCH] dnf: write the log lock to root
+
+Writing it to /var/log appears to be racing with installation
+of base-files, and if lock is created first, base-files
+will refuse to install (due to the target directory
+already existing, and base-files creating it as a symlink).
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ dnf/logging.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dnf/logging.py b/dnf/logging.py
+index bd660470..a9d808b1 100644
+--- a/dnf/logging.py
++++ b/dnf/logging.py
+@@ -94,7 +94,7 @@ class MultiprocessRotatingFileHandler(logging.handlers.RotatingFileHandler):
+     def __init__(self, filename, mode='a', maxBytes=0, backupCount=0, encoding=None, delay=False):
+         super(MultiprocessRotatingFileHandler, self).__init__(
+             filename, mode, maxBytes, backupCount, encoding, delay)
+-        self.rotate_lock = dnf.lock.build_log_lock("/var/log/", True)
++        self.rotate_lock = dnf.lock.build_log_lock("/", True)
+ 
+     def emit(self, record):
+         while True:
diff --git a/meta/recipes-devtools/dnf/dnf_4.2.21.bb b/meta/recipes-devtools/dnf/dnf_4.2.21.bb
index 8f7757b72f..44dab1d8a6 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.21.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.21.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0030-Run-python-scripts-using-env.patch \
            file://0001-set-python-path-for-completion_helper.patch \
+           file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
 SRCREV = "864c381baabf024c299dca75abfda96139b8f583"
-- 
2.26.1

