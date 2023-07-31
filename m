Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD44C04A94
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 19:10:20 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.963.1690830610962082572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 12:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=VjPmjzap;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99c0cb7285fso243942066b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 12:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690830609; x=1691435409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JQ9jKYHB3FfEYH5Fi1r0cN2Fnr7tPugfwacTLvdKn9M=;
        b=VjPmjzapIQ3Mo1yxQJXu8jWVm0zRKDKgs2yL6yHA9ivVamLuanq45EvNFFhJ8I6NjT
         tszagnXmfMqEOQDkcY6Vta/wQGVcz2nXIJPZqJXJx1zHMuoJLZaemmwNyXAOjRq0QDRv
         XZ3hlt8GmBsO8TenR65nnGlxenbf0Piy8XseOrBMdvr/4tYdWjM1EoT+MQTMtlVioHDb
         PwnaZdfOb56T7IkAdMwnINcM04v/X7tjIPI6luDJHJ8BRLnbCNiEjWJDRgUjIW/81a56
         69ViNMQYeekNti6bCkAgrYHR85vJdvgNnvjr133Rj9JBnXvLw/QtAY7PlQrX6qvTtlh1
         1LZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690830609; x=1691435409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JQ9jKYHB3FfEYH5Fi1r0cN2Fnr7tPugfwacTLvdKn9M=;
        b=jRgGIPEWfp2My534dqzeyez//LQvN80cgjunFuXs9vJsvJswowUC2AdewoWnp9mYBk
         rRqylUfaRR6hjeZpDXRbf3fMd7BDa3T5/xGqHM6KEh2O+FCwFEkyVt5TTauXFTrRZOT0
         QN4r7LuZ8ra12+bnEfe/DOb1sz3KK3A/cPYr0Zu5BnhUudu42KAY7Bw4nbo5voAgRv3h
         VU9P1ynI2L5HOTrBBd1LUAHgsblt1lqBU/gWMCo1xbm4YVDvCdXh/wKFzgK8ueIQXKs5
         Smd6QkOLW/ZgLgRHGc3LT4Mi5GY+OIurHxbJykfkSrtw2qVvIrwG9EQY8iE1Gy86kbWT
         AIuw==
X-Gm-Message-State: ABy/qLa6CxtQcu+Jk5CBAEFrgTrmaFHRlXdWv/VhTXkUtKkxiLo7/XI3
	4pzhVVpNzib7rT6EhAKcyuYiMIG8VG8=
X-Google-Smtp-Source: APBJJlGVNkqaiJCPn8Q57XOfXDAqXs2hCjWbfGLOP/AnsQ97mvQxbTzohFddRImQMhDbuOXIjHrW4w==
X-Received: by 2002:a17:906:32d4:b0:97e:56d5:b885 with SMTP id k20-20020a17090632d400b0097e56d5b885mr506758ejk.60.1690830608837;
        Mon, 31 Jul 2023 12:10:08 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id rk21-20020a170907215500b00992ea405a79sm6482041ejb.166.2023.07.31.12.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 12:10:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] patchelf: add 3 fixes to optimize and fix uninative
Date: Mon, 31 Jul 2023 21:10:05 +0200
Message-ID: <20230731191005.3466888-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 19:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185164

* uninative-3.10 and 4.0 doesn't work on e.g. ubuntu-18.04, because patchelf-uninative
  makes the binaries unusable and e.g. mkfs.ext4 segfaults in loader, see:
  https://github.com/NixOS/patchelf/issues/492

* mke2fs.real, mkfs.ext2.real, mkfs.ext3.real, mkfs.ext4.real are indentical
  binary with multiple hardlinks and we end calling patchelf-uninative 4
  times even when the interpreter is already set correctly from the build

  The issue was reported upstream with mkfs.ext4.real as possible reproducer:
  https://github.com/NixOS/patchelf/issues/492#issuecomment-1602862272

  To fix uninative we need to first release new uninative tarball and
  then upgrade it in master, mickledore, kirkstone, dunfell

* originally reported in:
  https://lists.openembedded.org/g/openembedded-core/message/182862
  with temporary work around (applicable locally without waiting for
  new uninative release):
  https://lists.openembedded.org/g/openembedded-core/message/183314

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-Set-interpreter-only-when-necessary.patch | 31 ++++++++++++++
 ...t-with-p_align-instead-of-pagesize-f.patch | 42 +++++++++++++++++++
 ...t-extensions-based-on-p_align-instea.patch | 32 ++++++++++++++
 .../patchelf/patchelf_0.18.0.bb               |  6 ++-
 4 files changed, 110 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/0001-Set-interpreter-only-when-necessary.patch
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/0002-align-startOffset-with-p_align-instead-of-pagesize-f.patch
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/0003-make-LOAD-segment-extensions-based-on-p_align-instea.patch

diff --git a/meta/recipes-devtools/patchelf/patchelf/0001-Set-interpreter-only-when-necessary.patch b/meta/recipes-devtools/patchelf/patchelf/0001-Set-interpreter-only-when-necessary.patch
new file mode 100644
index 0000000000..9a8216b3fe
--- /dev/null
+++ b/meta/recipes-devtools/patchelf/patchelf/0001-Set-interpreter-only-when-necessary.patch
@@ -0,0 +1,31 @@
+From f5df94952e87eaa390e5c845bc48fdb3dbc31cc2 Mon Sep 17 00:00:00 2001
+From: Yuta Hayama <hayama@lineo.co.jp>
+Date: Fri, 21 Jul 2023 10:47:02 +0900
+Subject: [PATCH] Set interpreter only when necessary
+
+If the given interpreter is already set, nothing needs to be done.
+As with modifySoname(), it skips unnecessary processing.
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+Upstream-Status: Submitted [https://github.com/NixOS/patchelf/pull/508]
+
+ src/patchelf.cc | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/patchelf.cc b/src/patchelf.cc
+index 86429c4..e562c49 100644
+--- a/src/patchelf.cc
++++ b/src/patchelf.cc
+@@ -1460,6 +1460,11 @@ void ElfFile<ElfFileParamNames>::modifySoname(sonameMode op, const std::string &
+ template<ElfFileParams>
+ void ElfFile<ElfFileParamNames>::setInterpreter(const std::string & newInterpreter)
+ {
++    if (getInterpreter() == newInterpreter) {
++        debug("given interpreter is already set\n");
++        return;
++    }
++
+     std::string & section = replaceSection(".interp", newInterpreter.size() + 1);
+     setSubstr(section, 0, newInterpreter + '\0');
+     changed = true;
diff --git a/meta/recipes-devtools/patchelf/patchelf/0002-align-startOffset-with-p_align-instead-of-pagesize-f.patch b/meta/recipes-devtools/patchelf/patchelf/0002-align-startOffset-with-p_align-instead-of-pagesize-f.patch
new file mode 100644
index 0000000000..7906f0f73b
--- /dev/null
+++ b/meta/recipes-devtools/patchelf/patchelf/0002-align-startOffset-with-p_align-instead-of-pagesize-f.patch
@@ -0,0 +1,42 @@
+From 1198329b922f3cdddc3e87a7c81d7730b646c088 Mon Sep 17 00:00:00 2001
+From: Yuta Hayama <hayama@lineo.co.jp>
+Date: Fri, 28 Jul 2023 16:22:31 +0900
+Subject: [PATCH] align startOffset with p_align instead of pagesize for
+ compatibility
+
+According to the ELF specification, the alignment of loadable process segments
+should satisfy (p_vaddr mod pagesize) == (p_offset mod pagesize). However,
+glibc earlier than 2.35 incorrectly requires that the LOAD segment be (p_vaddr
+mod p_align) == (p_offset mod p_align), and will output the error message
+"ELF load command address/offset not properly aligned" if this is not met.
+
+Since there are many systems that use glibc earlier than 2.35, it is preferable
+that newly added LOAD segments satisfy (p_vaddr mod p_align) == (p_offset mod
+p_align) for compatibility.
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+Upstream-Status: Submitted [https://github.com/NixOS/patchelf/pull/510]
+
+ src/patchelf.cc | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/src/patchelf.cc b/src/patchelf.cc
+index 82b4b46..6edb81a 100644
+--- a/src/patchelf.cc
++++ b/src/patchelf.cc
+@@ -843,7 +843,13 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
+         neededSpace += headerTableSpace;
+     debug("needed space is %d\n", neededSpace);
+ 
+-    Elf_Off startOffset = roundUp(fileContents->size(), getPageSize());
++    /* glibc earlier than 2.35 requires that the LOAD segment satisfies
++       (p_vaddr mod p_align) == (p_offset mod p_align).
++       The ELF specification requires that loadable process segments satisfy
++       (p_vaddr mod pagesize) == (p_offset mod pagesize), so glibc is probably
++       wrong, but here startOffset is calculated according to p_align for
++       compatibility. */
++    Elf_Off startOffset = roundUp(fileContents->size(), alignStartPage);
+ 
+     // In older version of binutils (2.30), readelf would check if the dynamic
+     // section segment is strictly smaller than the file (and not same size).
diff --git a/meta/recipes-devtools/patchelf/patchelf/0003-make-LOAD-segment-extensions-based-on-p_align-instea.patch b/meta/recipes-devtools/patchelf/patchelf/0003-make-LOAD-segment-extensions-based-on-p_align-instea.patch
new file mode 100644
index 0000000000..37eaf992d8
--- /dev/null
+++ b/meta/recipes-devtools/patchelf/patchelf/0003-make-LOAD-segment-extensions-based-on-p_align-instea.patch
@@ -0,0 +1,32 @@
+From 299ad5766921d593e11a42a8e4dec55b4b350876 Mon Sep 17 00:00:00 2001
+From: Yuta Hayama <hayama@lineo.co.jp>
+Date: Mon, 31 Jul 2023 11:58:49 +0900
+Subject: [PATCH] make LOAD segment extensions based on p_align instead of
+ pagesize
+
+Since the p_align of the LOAD segment is no longer pagesize, the actual p_align
+value is used to calculate for the LOAD segment extension.
+
+If calculated with pagesize, new LOAD segment may be added even though the
+existing LOAD segment can be extended.
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+Upstream-Status: Submitted [https://github.com/NixOS/patchelf/pull/510]
+
+ src/patchelf.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/patchelf.cc b/src/patchelf.cc
+index 6edb81a..86429c4 100644
+--- a/src/patchelf.cc
++++ b/src/patchelf.cc
+@@ -885,7 +885,7 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
+         rdi(lastSeg.p_type) == PT_LOAD &&
+         rdi(lastSeg.p_flags) == (PF_R | PF_W) &&
+         rdi(lastSeg.p_align) == alignStartPage) {
+-        auto segEnd = roundUp(rdi(lastSeg.p_offset) + rdi(lastSeg.p_memsz), getPageSize());
++        auto segEnd = roundUp(rdi(lastSeg.p_offset) + rdi(lastSeg.p_memsz), alignStartPage);
+         if (segEnd == startOffset) {
+             auto newSz = startOffset + neededSpace - rdi(lastSeg.p_offset);
+             wri(lastSeg.p_filesz, wri(lastSeg.p_memsz, newSz));
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb b/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb
index e8bc2ff83d..dece34240c 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb
@@ -4,7 +4,11 @@ HOMEPAGE = "https://github.com/NixOS/patchelf"
 
 LICENSE = "GPL-3.0-only"
 
-SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master"
+SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
+    file://0001-Set-interpreter-only-when-necessary.patch \
+    file://0002-align-startOffset-with-p_align-instead-of-pagesize-f.patch \
+    file://0003-make-LOAD-segment-extensions-based-on-p_align-instea.patch \
+"
 SRCREV = "99c24238981b7b1084313aca8f5c493bb46f302c"
 
 S = "${WORKDIR}/git"
-- 
2.41.0


