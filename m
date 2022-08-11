Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483E7C3F6B0
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 19:58:21 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.2535.1660247897246539726
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 12:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jF71PdXC;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id gk3so35284346ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 12:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=FlvBb4qfT8GhoNLT2aYsFZMksW5VrnFAShCHxt5jQSg=;
        b=jF71PdXCCsaMPoUdtm6iHsKy7PF8pxHsyXxzDksQaeGpJ09PDqW0rbdE0/mkFScaSK
         ceS/Brdg+e9NaC5ZdY2UQ6q/UDjkQS/nFWR1e+O+Jrml4dvE8oSxScGaq7WznNMhWTh/
         mLgpijoAV89MqJ6iiH0DNP8pkQ200Sk//jgHSWf6/ER6kJgM7TYrkbShzL3JrMs0JQeX
         X5dyy8x3j54m4SVXjqWWgC1rhCkUrGyy5MofNWit23OjtQxKLt0UgV3GrjodJm9Pg4wZ
         rH7vUpttOt35HWgxu9eiOcULjn/rDL34TeYKnRAd50qZb0JgJxW0DSgSBaVBQjOhYdwX
         YeBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=FlvBb4qfT8GhoNLT2aYsFZMksW5VrnFAShCHxt5jQSg=;
        b=DvNV1URdTf8ppD4Hk8BSapF2TeKRilGhR97ueExRcaDCJYVc1w8NNal0aIpBj5C28t
         tUKMv+PrVhu8egnB6F7fs7IkWXFpzrWQCfCKSjFdUQSQKl5eV+E+g/0FGsFQEUPfuiRz
         qlYeUY2YtKccW3QYAxf+1AUq8GbJV0EZ/mfcMDoU1Lvi5nxL8zUzammekLMYWwoX+Xng
         CWxgrs+bdLQD2EO0xDK71t3jXKmeA77SLcmKNlVmo+PJ801EAyHmXxjXccUyaSLGlgNA
         xmAqcqZd/fLQJuQSnrv0VAZECIo2SefiGVF/1Q/pTGdN2Pd287Uy81JpS2IKO8Ag5JSx
         Mtdg==
X-Gm-Message-State: ACgBeo02URHtmQqliEk7uAHcdwprYOjQ0ZysXpfhr2w3kUfeeVJyI+fU
	76RnMm7qn6s0cwq76G3VQYg6FmcBacI=
X-Google-Smtp-Source: 
 AA6agR4I/MalY0P6F3GvkEs0LP3vN8/pg8QcmqJGqsyLdPo38pSiWYutXKB/qeKtOv2v1tSDAMO6cQ==
X-Received: by 2002:a17:907:2707:b0:730:af0b:3572 with SMTP id
 w7-20020a170907270700b00730af0b3572mr411067ejk.411.1660247895510;
        Thu, 11 Aug 2022 12:58:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 fu18-20020a170907b01200b007308bdef04bsm22010ejc.103.2022.08.11.12.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 12:58:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/7] patchelf: replace a rejected patch with an equivalent
 uninative.bbclass tweak
Date: Thu, 11 Aug 2022 21:58:05 +0200
Message-Id: <20220811195806.1571221-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811195806.1571221-1-alex@linutronix.de>
References: <20220811195806.1571221-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 19:58:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169268

This was the original reason to add the patch:
https://git.openembedded.org/openembedded-core/commit/?id=18efcbcb896239c64fedd009ce57f3f0c668cbc0

and this is the upstream discussion which suggests handling
read-only files explicitly outside of patchelf:
https://github.com/NixOS/patchelf/pull/89

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/uninative.bbclass                |  2 +
 .../patchelf/handle-read-only-files.patch     | 63 -------------------
 .../patchelf/patchelf_0.15.0.bb               |  1 -
 3 files changed, 2 insertions(+), 64 deletions(-)
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
index 76ad8d9d4d..0000000000
--- a/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 38b3d65f4a79d39ad9cdf841f2b3b29fd0c961ca Mon Sep 17 00:00:00 2001
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
----
- src/patchelf.cc | 18 +++++++++++++-----
- 1 file changed, 13 insertions(+), 5 deletions(-)
-
-diff --git a/src/patchelf.cc b/src/patchelf.cc
-index 49accae..fb6c7ed 100644
---- a/src/patchelf.cc
-+++ b/src/patchelf.cc
-@@ -378,8 +378,16 @@ void ElfFile<ElfFileParamNames>::sortShdrs()
- 
- static void writeFile(const std::string & fileName, const FileContents & contents)
- {
-+    struct stat st;
-+
-     debug("writing %s\n", fileName.c_str());
- 
-+    if (stat(fileName.c_str(), &st) != 0)
-+        error("stat");
-+
-+    if (chmod(fileName.c_str(), 0600) != 0)
-+        error("chmod");
-+
-     int fd = open(fileName.c_str(), O_CREAT | O_TRUNC | O_WRONLY | O_BINARY, 0777);
-     if (fd == -1)
-         error("open");
-@@ -395,8 +403,6 @@ static void writeFile(const std::string & fileName, const FileContents & content
-         bytesWritten += portion;
-     }
- 
--    if (close(fd) >= 0)
--        return;
-     /*
-      * Just ignore EINTR; a retry loop is the wrong thing to do.
-      *
-@@ -405,9 +411,11 @@ static void writeFile(const std::string & fileName, const FileContents & content
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
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.15.0.bb b/meta/recipes-devtools/patchelf/patchelf_0.15.0.bb
index 389a0a9f40..e07775f574 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.15.0.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.15.0.bb
@@ -5,7 +5,6 @@ HOMEPAGE = "https://github.com/NixOS/patchelf"
 LICENSE = "GPL-3.0-only"
 
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
-           file://handle-read-only-files.patch \
            "
 SRCREV = "49008002562355b0e35075cbc1c42c645ff04e28"
 
-- 
2.30.2


