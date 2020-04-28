Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.220.1588082732231068638
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 07:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B4+Tawmk;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id r26so3032423wmh.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2020 07:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TyGAKd1xIf+iinLtcxivC5Vfd/b6nhKu5O+sWRA7fx8=;
        b=B4+TawmkeVoRxdCmhZJjlMdoIG+Zqnh+yN2ic7uF8n2BjMSwGbtj+YfninKvucpeq3
         QQCJ0uM7w9eMa51RVqz1zJk0hw6zwISybVxmQcfjlnC0szcf0knucl+MC5ETBFzDDQNs
         gjwoyXslWGlfeZgy1V5cdbmVqCHC8DIpLKcVd+EeJX8MYn2ln8PRXrE9aI3ORCFfUSLH
         YN425o0YDZA/lkJetNKl1bc2Ni43fpxynIM4alPX8rW3mhWB+8Sss4vYiIdcymA9AO7E
         JBrxdUI7XtTa6c2wSh09W7rqwqwgaOEs4Uz8PUfEzSgOFNAP6v8plzfU+scp0kGwFUAu
         uCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TyGAKd1xIf+iinLtcxivC5Vfd/b6nhKu5O+sWRA7fx8=;
        b=eH8x2LWDFh5WfvC1r908kOhiUxUvDXBr4fFkER57erM3AtNzVeROGL+0gudWJaMn52
         9llKhwkDEZjZ95ePgNL88foA8Gtci16eEmY0nelPFuz22xS5XP02zlUqAG0fo4TGr+Wr
         s2vaUlh11NUo86P/RrcvEDmIzdmt/vISUbyBPGkmmbLTrAvw3rGZAkVoZ0SeRXja3uF8
         54C0+iU+OwjlvlCnlGjpX0fiTXEEhw3KlvrIiA6+uWuqJYzmUc2svDib7rl1vbd8ErWG
         b6HYjioFP2onSsuRiaHnYa6Y/FENEb0b7RldkurWLy6xg2HhzryocLUEN9nXdKDoQlb5
         M6nA==
X-Gm-Message-State: AGi0Pub0cik10zMgXF4O2jnwUDMVEaKqISubCIl38MEidRgxe9XY2Sj/
	iwIpdHtcyQmDyORv3K21WqRCYez5
X-Google-Smtp-Source: APiQypIDHQ47DXTQyFPa1uIkXzMiB+MkJ0gXihLmj4dacBMKHxBytfGE65J9K+THw6hTdsonpLiMCw==
X-Received: by 2002:a7b:c4d0:: with SMTP id g16mr5185338wmk.154.1588082730395;
        Tue, 28 Apr 2020 07:05:30 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id l4sm25104857wrw.25.2020.04.28.07.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 07:05:29 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] dnf: add a patch for base-files installation failures
Date: Tue, 28 Apr 2020 16:04:59 +0200
Message-Id: <20200428140459.28337-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-dnf-write-the-log-lock-to-root.patch | 28 +++++++++++++++++++
 meta/recipes-devtools/dnf/dnf_4.2.21.bb       |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch

diff --git a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
new file mode 100644
index 0000000000..5d2869122b
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
@@ -0,0 +1,28 @@
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

