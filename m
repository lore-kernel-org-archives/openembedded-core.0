Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D00C25B0E
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 19:58:21 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.2469.1660247896141551615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 12:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hqKkT4cX;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id uj29so35425712ejc.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 12:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=t58N1TRsB6M0QPM6L9khT86yxZOI/ON3Tkx3sW3pCVY=;
        b=hqKkT4cXfXmeSkQ9/CTC+gycxkmieaFiowOHr5d1tx4E74Gt9gb4C7j+aP7eeOf+6e
         VCu0jiHyRNYx4qur4PlNzOzE3Lx22CPqRCdNsiSYMxogxX7+PNQY/EHD1mBZMxB/XX9Z
         RhxEjFjALYUD9PLY1DLRfbQh9M0Ze6LQl++6GYD80j4Zuj344bNr/F/yqbleKjjoO3G2
         OTW/Meey/VTJ4Cwhn0v9v22dCXzPKWYLOdsZgd/rzBsHgubY+HA7P8V5GQ2ihVtq2iL7
         i3HnnVYuiXpzPo9AqFQR65QNUNmbbJPHkg7uc2KXFyfUAWboX7IMTTbjW/FoESd5V2Lc
         JroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=t58N1TRsB6M0QPM6L9khT86yxZOI/ON3Tkx3sW3pCVY=;
        b=vhueXed1XuRPAHOA5F5uzjSILgri2Yktq80W1u0tOO0lMyYcVa7DxWzcjZiIYUhpPQ
         iQP7KuZ5OqqWqtreredfUFhHvYsrT/kU0zgZRVihB5lbZN3c+fQyAgqsF1+f6YR/Klz0
         OHbJaLhcupvhFKOrFOxZCcKvHBLpzAeaImvK0deHWv6/mCOHeEvxqwOuPB2NlcFbsDCg
         cZ70UVzlUuqFGo8NVv1WGcmfSrJQe7TvVb1gDKNk+I0MJl5i6l4jkBPy0LnsZxcZ6/8C
         aIbXofAI/3tfudZTGOu6c2FNyR+1+jy7fbw8q30bhQeCVcIM+eKNlTkd2WlMjDytnA1w
         ZO7A==
X-Gm-Message-State: ACgBeo2tYdJ3Pltd0SaO2J3HkJKz790sVQZR578dXr5efTFzhV6xmDWY
	eeS3x7khdMm/okDb2UhqSm+P/ZoVmvE=
X-Google-Smtp-Source: 
 AA6agR6l8xzabEcG/lFEs6gVxTEN69bFSg0ZUO9kr8ZMcsS+Qosm9pXPgh29ps8gOU+eW8QjUZv4OA==
X-Received: by 2002:a17:907:72d5:b0:731:6512:ad with SMTP id
 du21-20020a17090772d500b00731651200admr399670ejc.739.1660247894741;
        Thu, 11 Aug 2022 12:58:14 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 fu18-20020a170907b01200b007308bdef04bsm22010ejc.103.2022.08.11.12.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 12:58:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/7] patchelf: update 0.14.5 -> 0.15.0
Date: Thu, 11 Aug 2022 21:58:04 +0200
Message-Id: <20220811195806.1571221-5-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/169267

Rebase handle-read-only-files.patch

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../patchelf/handle-read-only-files.patch     | 30 +++++++++----------
 ...{patchelf_0.14.5.bb => patchelf_0.15.0.bb} |  2 +-
 2 files changed, 15 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/patchelf/{patchelf_0.14.5.bb => patchelf_0.15.0.bb} (91%)

diff --git a/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch b/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
index b755a263a4..76ad8d9d4d 100644
--- a/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
+++ b/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
@@ -1,4 +1,4 @@
-From 682fb48c137b687477008b68863c2a0b73ed47d1 Mon Sep 17 00:00:00 2001
+From 38b3d65f4a79d39ad9cdf841f2b3b29fd0c961ca Mon Sep 17 00:00:00 2001
 From: Fabio Berton <fabio.berton@ossystems.com.br>
 Date: Fri, 9 Sep 2016 16:00:42 -0300
 Subject: [PATCH] handle read-only files
@@ -9,37 +9,32 @@ https://github.com/darealshinji/patchelf/commit/40e66392bc4b96e9b4eda496827d2634
 Upstream-Status: Denied [https://github.com/NixOS/patchelf/pull/89]
 
 Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
-
 ---
- src/patchelf.cc | 16 +++++++++++++++-
- 1 file changed, 15 insertions(+), 1 deletion(-)
+ src/patchelf.cc | 18 +++++++++++++-----
+ 1 file changed, 13 insertions(+), 5 deletions(-)
 
-Index: git/src/patchelf.cc
-===================================================================
---- git.orig/src/patchelf.cc
-+++ git/src/patchelf.cc
-@@ -534,9 +534,19 @@ void ElfFile<ElfFileParamNames>::sortShd
+diff --git a/src/patchelf.cc b/src/patchelf.cc
+index 49accae..fb6c7ed 100644
+--- a/src/patchelf.cc
++++ b/src/patchelf.cc
+@@ -378,8 +378,16 @@ void ElfFile<ElfFileParamNames>::sortShdrs()
  
  static void writeFile(const std::string & fileName, const FileContents & contents)
  {
 +    struct stat st;
-+    int fd;
 +
      debug("writing %s\n", fileName.c_str());
  
--    int fd = open(fileName.c_str(), O_CREAT | O_TRUNC | O_WRONLY, 0777);
 +    if (stat(fileName.c_str(), &st) != 0)
 +        error("stat");
 +
 +    if (chmod(fileName.c_str(), 0600) != 0)
 +        error("chmod");
 +
-+    fd = open(fileName.c_str(), O_CREAT | O_TRUNC | O_WRONLY, 0777);
-+
+     int fd = open(fileName.c_str(), O_CREAT | O_TRUNC | O_WRONLY | O_BINARY, 0777);
      if (fd == -1)
          error("open");
- 
-@@ -551,8 +561,6 @@ static void writeFile(const std::string
+@@ -395,8 +403,6 @@ static void writeFile(const std::string & fileName, const FileContents & content
          bytesWritten += portion;
      }
  
@@ -48,7 +43,7 @@ Index: git/src/patchelf.cc
      /*
       * Just ignore EINTR; a retry loop is the wrong thing to do.
       *
-@@ -561,9 +569,11 @@ static void writeFile(const std::string
+@@ -405,9 +411,11 @@ static void writeFile(const std::string & fileName, const FileContents & content
       * http://utcc.utoronto.ca/~cks/space/blog/unix/CloseEINTR
       * https://sites.google.com/site/michaelsafyan/software-engineering/checkforeintrwheninvokingclosethinkagain
       */
@@ -63,3 +58,6 @@ Index: git/src/patchelf.cc
  }
  
  
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.14.5.bb b/meta/recipes-devtools/patchelf/patchelf_0.15.0.bb
similarity index 91%
rename from meta/recipes-devtools/patchelf/patchelf_0.14.5.bb
rename to meta/recipes-devtools/patchelf/patchelf_0.15.0.bb
index 0fa2c00f1d..389a0a9f40 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.14.5.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.15.0.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-3.0-only"
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
            file://handle-read-only-files.patch \
            "
-SRCREV = "a35054504293f9ff64539850d1ed0bfd2f5399f2"
+SRCREV = "49008002562355b0e35075cbc1c42c645ff04e28"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


