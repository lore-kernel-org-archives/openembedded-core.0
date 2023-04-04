Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEC8C6FD1D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 15:15:42 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.104466.1680621332479286337
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 08:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=ZK3XEwHs;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id r29so33166817wra.13
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 08:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680621331; x=1683213331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aFjkfWDxwI/lxjDhST9spUZqX94ZD78gCybKWVWWitY=;
        b=ZK3XEwHs1XoWFc/VZ3DOl5MrLRK9zX+Sh3jBiuo+zGJNeHHSihKguZH88Yd/XXVnoi
         /7gG4OPvMHYHldjLlx5fFe2ZexDroUHdB1tnhXu0tmWOl5/1hdBunFRS0+sbOUGcOjBL
         wEypJbYqmPp9EOKd6DQ3tCgz6IJcdegI7qyYiWfwVHRZ87cmN9N7kD7StsD+Op1S/nnM
         N2/0Xx1DS0hWB2wDluwIvIrCzLhhdX4CUG9mErV3tmrVEKs6z0063oi6E60OiQhaIBm5
         PpEmWKOnc3aLHF4m/EnqXi4/oFseXcAo47JWcbxgbCEK0AJEXfTEVAgHThlgwCA15D8r
         zYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680621331; x=1683213331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aFjkfWDxwI/lxjDhST9spUZqX94ZD78gCybKWVWWitY=;
        b=Lg1Uoj3muC/EWl/vHmm9vWgenqbSzn+GVdUHRBONitPAzXFCG7Z9sVrGLy54FIBBiM
         1He86V0HZU0c8X0J3yTKt9Q7t0sKrPXm22H3z7GkVWHk6zj5D+ZBpYx1D8bhqPNq8rRE
         WTgx/x10gzn7KeCH8/LzG+d0cQtHMKEHOvtXG/Y8QpYOxQkZo+jQUdqYYKNoii+9DrR5
         Hpsh1JpvoZZbe/glrJUx9co9VwndaxFlAVmRwRPNZfuDHe1d7c7kCNhRF708adlch6p9
         qOkbBUr9Q44s2mPYB1iQ3vQayGXb/VMs5dhUIpU3ZvfB4JZjGVOEgdNq9b+V6fToD8uk
         PZzQ==
X-Gm-Message-State: AAQBX9cuN+xxK/hQl5AcZrRd2LR2oq3RwLC1fU4ZVYIWXkNOu4QYYtkN
	pOqkPwCwPNnS6wlsDWO5JK7PN7WF2Ro=
X-Google-Smtp-Source: AKy350bR6j0WwjbLwRd7TWsDBDQSK/6G3hy/hd5jGrNo201aY/HwwRIAS1kcY3DMZZ0tQNCyWMjEng==
X-Received: by 2002:adf:f691:0:b0:2d6:6af:4891 with SMTP id v17-20020adff691000000b002d606af4891mr2018691wrp.3.1680621330716;
        Tue, 04 Apr 2023 08:15:30 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id f7-20020adff8c7000000b002c5a1bd5280sm12474956wrq.95.2023.04.04.08.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 08:15:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 1/3] patchelf: replace a rejected patch with an equivalent uninative.bbclass tweak
Date: Tue,  4 Apr 2023 17:15:18 +0200
Message-Id: <20230404151520.2078894-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 15:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179696

From: Alexander Kanavin <alex.kanavin@gmail.com>

This was the original reason to add the patch:
https://git.openembedded.org/openembedded-core/commit/?id=18efcbcb896239c64fedd009ce57f3f0c668cbc0

and this is the upstream discussion which suggests handling
read-only files explicitly outside of patchelf:
https://github.com/NixOS/patchelf/pull/89

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
2.40.0


