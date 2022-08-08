Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B6D3C28B2C
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:42:56 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.22273.1659940970423681302
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HrXYhi0D;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id o22so10049462edc.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=66RKgqX8bCLqw+AVroMphhsFSzHAzxS/+9IX2EpgXbM=;
        b=HrXYhi0DMGMMpG6WrsnMsmtOzbT0PZ6g5jX551nrFD89/vJGNMFfHujR4f4C9CtkIF
         rl4SEHUBoZ5UbQNOs3rEdo4Nz0b5yct921oG6/v2gmsMY8PgmyqzCrmPKSaE4VbaKvgd
         4JMYtC8bCwLUAdD2wFuo4dC1tj66BC5DidB8Bu5GBiLG8XYKdO3us6vT8Q0pJpCLdR32
         TKI9o29ji/ONyx4yT/TSXIuYQME7aNf+nEKCR60xBumQOIzL4hS/P7oOGXfrSyMSgq20
         uit7l+DJDeNKp9nCq85oU0FKJTVhZ2yjYU3t6Ct/kyIwBMvYrYABJaRMl0dFBVINJ+JM
         zC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=66RKgqX8bCLqw+AVroMphhsFSzHAzxS/+9IX2EpgXbM=;
        b=bRJJXWro1pLAMuKw22BMHCuylbCetzAxRNRHOdgibzA4wvamz3UlI1ARQniv4UkuDy
         I3IhH/yKGzPwtCgcFedMlYoh0/FWq1m5rKK55WyQiuA+X0Rb4nvXJLCkCUvXxyLQvvdF
         rsWiulZDYPc59DGaFOpoGB8VxQxVzNiijiDLlZuujepAF0ZyNjr3wBU53K7rcILxAJeo
         Xp2FMqAyluXmLLnALvM3+QrG8r+hI0lRb+RCOw2MIucHVJvLzh+BqfRIJdzTxd+sQBBG
         sGFtpEYdv93pWsf0n+k4PnpYPHNOm6MY2l2c00eh/7LqK7WBjdWWG0jmWQ0OH8h0jLz3
         OyJw==
X-Gm-Message-State: ACgBeo1LNwjKpjOsp25IXrSEVqkysrp4OQouSlLBPSxQ7wkIknIb3hP0
	cJ7cQ0ATps32O2X0ErfeLg037aN0feU=
X-Google-Smtp-Source: 
 AA6agR5bA6Wr/gPDxHDweRnozYRxZtAVMCZC5nC65jpxdOUosRFtJa/qMuetAqaHZIu61yyIlGrTcA==
X-Received: by 2002:a05:6402:1d54:b0:43d:280c:f25b with SMTP id
 dz20-20020a0564021d5400b0043d280cf25bmr16912959edb.379.1659940968846;
        Sun, 07 Aug 2022 23:42:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:42:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 08/44] patchelf: update 0.14.5 -> 0.15.0
Date: Mon,  8 Aug 2022 08:42:01 +0200
Message-Id: <20220808064237.3975347-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:42:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169032

Drop handle-read-only-files.patch: read only files should
be handled by making them writeable explicitly. See
the upstream discussion:
https://github.com/NixOS/patchelf/pull/89

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../patchelf/handle-read-only-files.patch     | 65 -------------------
 ...{patchelf_0.14.5.bb => patchelf_0.15.0.bb} |  6 +-
 2 files changed, 2 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
 rename meta/recipes-devtools/patchelf/{patchelf_0.14.5.bb => patchelf_0.15.0.bb} (79%)

diff --git a/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch b/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
deleted file mode 100644
index b755a263a4..0000000000
--- a/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 682fb48c137b687477008b68863c2a0b73ed47d1 Mon Sep 17 00:00:00 2001
-From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Fri, 9 Sep 2016 16:00:42 -0300
-Subject: [PATCH] handle read-only files
-
-Patch from:
-https://github.com/darealshinji/patchelf/commit/40e66392bc4b96e9b4eda496827d26348a503509
-
-Upstream-Status: Denied [https://github.com/NixOS/patchelf/pull/89]
-
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
-
----
- src/patchelf.cc | 16 +++++++++++++++-
- 1 file changed, 15 insertions(+), 1 deletion(-)
-
-Index: git/src/patchelf.cc
-===================================================================
---- git.orig/src/patchelf.cc
-+++ git/src/patchelf.cc
-@@ -534,9 +534,19 @@ void ElfFile<ElfFileParamNames>::sortShd
- 
- static void writeFile(const std::string & fileName, const FileContents & contents)
- {
-+    struct stat st;
-+    int fd;
-+
-     debug("writing %s\n", fileName.c_str());
- 
--    int fd = open(fileName.c_str(), O_CREAT | O_TRUNC | O_WRONLY, 0777);
-+    if (stat(fileName.c_str(), &st) != 0)
-+        error("stat");
-+
-+    if (chmod(fileName.c_str(), 0600) != 0)
-+        error("chmod");
-+
-+    fd = open(fileName.c_str(), O_CREAT | O_TRUNC | O_WRONLY, 0777);
-+
-     if (fd == -1)
-         error("open");
- 
-@@ -551,8 +561,6 @@ static void writeFile(const std::string
-         bytesWritten += portion;
-     }
- 
--    if (close(fd) >= 0)
--        return;
-     /*
-      * Just ignore EINTR; a retry loop is the wrong thing to do.
-      *
-@@ -561,9 +569,11 @@ static void writeFile(const std::string
-      * http://utcc.utoronto.ca/~cks/space/blog/unix/CloseEINTR
-      * https://sites.google.com/site/michaelsafyan/software-engineering/checkforeintrwheninvokingclosethinkagain
-      */
--    if (errno == EINTR)
--        return;
--    error("close");
-+    if ((close(fd) < 0) && errno != EINTR)
-+        error("close");
-+
-+    if (chmod(fileName.c_str(), st.st_mode) != 0)
-+        error("chmod");
- }
- 
- 
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.14.5.bb b/meta/recipes-devtools/patchelf/patchelf_0.15.0.bb
similarity index 79%
rename from meta/recipes-devtools/patchelf/patchelf_0.14.5.bb
rename to meta/recipes-devtools/patchelf/patchelf_0.15.0.bb
index 0fa2c00f1d..26abde2ed5 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.14.5.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.15.0.bb
@@ -4,10 +4,8 @@ HOMEPAGE = "https://github.com/NixOS/patchelf"
 
 LICENSE = "GPL-3.0-only"
 
-SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
-           file://handle-read-only-files.patch \
-           "
-SRCREV = "a35054504293f9ff64539850d1ed0bfd2f5399f2"
+SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master"
+SRCREV = "49008002562355b0e35075cbc1c42c645ff04e28"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


