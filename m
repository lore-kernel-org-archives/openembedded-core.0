Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91811C77B6E
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 02:30:05 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.121139.1680661801667223232
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 19:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=YGKf/cQz;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id x15so32527081pjk.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 19:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680661801; x=1683253801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZFNn9zUf3+CMx6K4CnTpey3mTQBXhfJ1cykNz34n+A=;
        b=YGKf/cQzA0Cwl1ekC7KJ7O3Fq1wD9wWy9SpGFE1pNZVf7vS3HbHLBeM5zyUpeycisa
         NncHBKll1ZgRmO4cm+7tgEMyF0k7Pc2WtrNzCbewUJfV8dBTb0GAbN4MV7wY6Ez10syd
         /2a12i7TDA1gjnr7vWCt8EykTg6bBbzNhtlNFIUn1Xwx8XmR+AFfAHWu499vjOyT96Lb
         i+kMWA8910B9A+g0xaMVgxh698hSfcmf8nvNIumv2VGIFLdLWFZceKO28hht/cEFUYUR
         mesS6Gz1CVy9itxpwBWb70STP74itLvVtHUhVfYictZuKH19om1QWWQLIA8EumOEm5y4
         PDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680661801; x=1683253801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZFNn9zUf3+CMx6K4CnTpey3mTQBXhfJ1cykNz34n+A=;
        b=FFwLTxRQOOI/ju01PCL8vQS5oPCuB4HFXUK6L6yvRf7beWeqp+bh+C58V5hQzvaT43
         lkwhBQ2pfnRrVkMLiQOK8PQB/R33qzC7ccpjtN5cer57Tlb6iOBO8ZCit4FU6DS2EV/d
         EdbS7fE2r+7qD/loh200VICqGU2kAa/PQsOascnVRFR/g7DiXULr7lJY8G2cMm4jHS+k
         inVeAeYQy3xFT8EFv16SMJxn+g7bIJY0GcfWJ320SXfPFeaC9HAVox4K5AiLHOMeEbKL
         yp9Jw2d2iRlPijT0/GZGUTgC16DzRC3R8gi4pU/GOBjxN12qQfyM/EKdDkjdpaViIua6
         5jLQ==
X-Gm-Message-State: AAQBX9eabVXOqbdkii9JYB9qoHxcnlIeSUalSJtmKyKLP/nRPrezB4Op
	/R3otbOwrkbtb1J4+2c2H7Ffvi90EuWScWJipI4=
X-Google-Smtp-Source: AKy350aw+e2ZSLxhIMAQujH8DuQeBgtYzD83lfRUybnYBTDzTyRs7YZzK61BQwg12hCiWZO2QPt2Cw==
X-Received: by 2002:a17:90a:d583:b0:234:d42:1628 with SMTP id v3-20020a17090ad58300b002340d421628mr5088706pju.10.1680661800692;
        Tue, 04 Apr 2023 19:30:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id a17-20020a170902ee9100b001a24cded097sm8937702pld.236.2023.04.04.19.29.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 19:30:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/6] patchelf: replace a rejected patch with an equivalent uninative.bbclass tweak
Date: Tue,  4 Apr 2023 16:29:32 -1000
Message-Id: <163e2d5defebab262a5ec6fa9885deedace538f2.1680661617.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680661617.git.steve@sakoman.com>
References: <cover.1680661617.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 02:30:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179717

From: Alexander Kanavin <alex.kanavin@gmail.com>

This was the original reason to add the patch:
https://git.openembedded.org/openembedded-core/commit/?id=18efcbcb896239c64fedd009ce57f3f0c668cbc0

and this is the upstream discussion which suggests handling
read-only files explicitly outside of patchelf:
https://github.com/NixOS/patchelf/pull/89

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/uninative.bbclass                |  2 +
 .../patchelf/handle-read-only-files.patch     | 65 -------------------
 .../patchelf/patchelf_0.14.5.bb               |  1 -
 3 files changed, 2 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 6a9e862bcd..7f0591d49a 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -167,5 +167,7 @@ python uninative_changeinterp () {
             if not elf.isDynamic():
                 continue
 
+            os.chmod(f, s[stat.ST_MODE] | stat.S_IWUSR)
             subprocess.check_output(("patchelf-uninative", "--set-interpreter", d.getVar("UNINATIVE_LOADER"), f), stderr=subprocess.STDOUT)
+            os.chmod(f, s[stat.ST_MODE])
 }
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
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.14.5.bb b/meta/recipes-devtools/patchelf/patchelf_0.14.5.bb
index 0fa2c00f1d..82c7e807ac 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.14.5.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.14.5.bb
@@ -5,7 +5,6 @@ HOMEPAGE = "https://github.com/NixOS/patchelf"
 LICENSE = "GPL-3.0-only"
 
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
-           file://handle-read-only-files.patch \
            "
 SRCREV = "a35054504293f9ff64539850d1ed0bfd2f5399f2"
 
-- 
2.34.1


