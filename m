Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87DDDC433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 09:41:06 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.9550.1633945265070762457
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m+jXcEPJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id g25so7624041wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ACqGLFYVoYOMljrCycpRGSxowTIuSkP3a+HeNoKElWg=;
        b=m+jXcEPJNooFFqxsg5QI2T759WEaQaT9DVAllWTu8vxJvqsxUAgug+vqoHpZqY30wd
         wPaFNMWnZLZia5eMn+g5mbgd2Pp4TJc7Bu021qffqoeQUEioKdSvfEO0JPE0CkM7tKry
         u4x0zaOvRAajp9Op8VfDz//PCg+r3lZcnzPdYMD5TNtqwDrBquEZp1c7KOOdmijJNMzF
         Nq1SFH51/kzXvxwTAFYnVcuy1PyfKtsnkXehmhtqLcivxhNd9QtTg0K2nZC75ROzNGC3
         lKLZrQC5XzzaCO5VRsa/cW+CqXV9FLU39LSPFkqByVzKrXLx8Tx3dhOgG48G0JhSt/1C
         xIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ACqGLFYVoYOMljrCycpRGSxowTIuSkP3a+HeNoKElWg=;
        b=5AE9ILghuwG3QUVyzHMFnYbCTxRPW6d4IKSA9EBlz6jwc9SsIDlP6kfd6N3uCFkiIx
         KQI+YPGzLdwWsnVw76LVw3FrQARFigjV09AKF5izep5c5FDdaGSjhL4Yil1OTe2qXyce
         VXMmmpZVg1hSMWZIGDP9ilhqJpAADtFMuoD3ReWirOu2yCSp0xGcmSYmwMUCnfxVhoNa
         mO7LrCKpRjwa96e63oyeGcVrRaBVwGMryIbEV7ZSyU+DoqaLw3IVyXW8UA2VuyIsmHh+
         QlruyUaBjZTkf7sL8R18SykkD9UNNW0Z9Di5a3Fa/CyLYLoTfbpcDY2yC4zTN8rLExKi
         kHMA==
X-Gm-Message-State: AOAM530bRuOQizJJmM6CjjgDyzLOJmXQwQQqyDJGnt4qUii39ddiHKxL
	cVbag9ZzmVnmf0m3Q2X4ympr3ANjBNg=
X-Google-Smtp-Source: 
 ABdhPJzuPEgj9PXCYEu3EqDHRWW1Dvz2Y4etPaNF4OxaFLkYcOSssGyvZuxBPA2HGhjOpBYEOwGMIA==
X-Received: by 2002:a1c:7ed7:: with SMTP id
 z206mr19904511wmc.69.1633945263434;
        Mon, 11 Oct 2021 02:41:03 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k17sm7180758wrc.93.2021.10.11.02.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 02:41:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/25] qemu: install qmp module without hardcoding the python
 version in oeqa scripts
Date: Mon, 11 Oct 2021 11:40:35 +0200
Message-Id: <20211011094059.4184654-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 09:41:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156814

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/utils/qemurunner.py                      | 2 +-
 meta/recipes-devtools/qemu/qemu-system-native_6.1.0.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index d961a9a2183..03971480825 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -183,7 +183,7 @@ class QemuRunner:
         # then add in the site-packages path components and add that
         # to the python sys.path so qmp.py can be found.
         python_path = os.path.dirname(os.path.dirname(self.logfile))
-        python_path += "/recipe-sysroot-native/usr/lib/python3.9/site-packages"
+        python_path += "/recipe-sysroot-native/usr/lib/qemu-python"
         sys.path.append(python_path)
         importlib.invalidate_caches()
         try:
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_6.1.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_6.1.0.bb
index b47ffd52627..b544ab4e817 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_6.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_6.1.0.bb
@@ -28,5 +28,5 @@ do_install:append() {
     rm -rf ${D}${includedir}/qemu-plugin.h
 
     # Install qmp.py to be used with testimage
-    install -D ${S}/python/qemu/qmp/__init__.py ${D}${PYTHON_SITEPACKAGES_DIR}/qmp.py
+    install -D ${S}/python/qemu/qmp/__init__.py ${D}${libdir}/qemu-python/qmp.py
 }
-- 
2.20.1


