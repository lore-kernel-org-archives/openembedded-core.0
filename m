Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EC8C25B0C
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:39:06 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.22424.1659940737994556843
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N9p7hPAj;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id z20so8155118edb.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=66RKgqX8bCLqw+AVroMphhsFSzHAzxS/+9IX2EpgXbM=;
        b=N9p7hPAjLtLwXErqBdEgpVhmj4swItxHMk3RGZ+u40Prc725EyjO7FTT2unny891vI
         LkKN2WOp9ms5aWBOLhrQDVbxkV5SnddnJryf7rtKwYAXCVDec2pZE/RAH+gQZfzNYrcN
         NjFDCQqWru42GSswPUq7wZnYIUqACsJ7Xy2/hdC6DN05UKupoSli45hhmy86F90Fx5Xm
         GG44/Pxvddh1BFRZRAactWJ8qt70sJMzIUuFg2Mon6QUejW+/wx91S/N+tkbMRq2wTqe
         ApfdFXD/2/nJgr0hP/mcVmLr56X+sUmnQ+Hay/MbUwZK5koUCuSYNur5Cr7kYGuTBEBb
         2nuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=66RKgqX8bCLqw+AVroMphhsFSzHAzxS/+9IX2EpgXbM=;
        b=K0s/PoPIfdnV5nPekPTktnFxwUh1nu+Ay7Q1VJFlQ5jQkmx7x40Y4D574DVU8/fv3p
         Uxqvb/TsXAHvtk9qoEopwYIl7kjV45Go1KrW6brLpA/H5xEzT2OiaLz8KKDJ6NjriPAl
         1A+QUCG7rdl3BTjKDui9fhXykt4qacE1BrsqgJ+89wCQJJHBra3tdjjFfb9nHYfY3IO7
         2KFfszmD3daF+nlC0FOAR3W4lE7LHnlX93aC3xGy5BwscDh1t+BMciNvtS8MHjwKZFMT
         s6NQRkOkkB+S2mkz0mqoPdDD4ia2Gz7Gu7NmIyp8sE16DnUoo04IxUBBM8odkjcmkhA8
         hETQ==
X-Gm-Message-State: ACgBeo00bxmHgEFkhZrNQsiyBvGm9QS757/9Gg8yht1WKghPC39edntn
	DMdbN5HlNL35Cjcyaa7nEOwOMdpNa64=
X-Google-Smtp-Source: 
 AA6agR5IrKCwhs6MC3KYaN+7LDt8dHDNE6f+aX5RpUAYKK0wKUBSwlfSwpENRjOxgw5BxDwYipTSZw==
X-Received: by 2002:a05:6402:5ca:b0:43b:6e01:482c with SMTP id
 n10-20020a05640205ca00b0043b6e01482cmr16984148edx.189.1659940736490;
        Sun, 07 Aug 2022 23:38:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 k22-20020aa7c056000000b0043ce5d4d2c3sm4092644edo.14.2022.08.07.23.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:38:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/45] patchelf: update 0.14.5 -> 0.15.0
Date: Mon,  8 Aug 2022 08:38:07 +0200
Message-Id: <20220808063843.3975130-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808063843.3975130-1-alex@linutronix.de>
References: <20220808063843.3975130-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:39:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169023

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


