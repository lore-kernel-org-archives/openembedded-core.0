Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF24C001DE
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 20:26:51 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.2897.1690835203420188669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 13:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=p8s5dDPQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6b9ec15e014so4507455a34.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 13:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690835202; x=1691440002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DPBqoedMe725DbxMZLK6zFiG40w1N5J7QMSwzoMHTns=;
        b=p8s5dDPQDuUEGxthsy7fWXdz8ZhBOEQv34gZFbCot7Rr1NFea9HLKBTiJZAFCVPQtE
         aRnOVHuNSe7gQcXktnOVRucnMi2PeCTUyvly+quLktrPnBr9v1kPOgQaDPP52e90tqg1
         /K2Cx6rHLwKErjyt+GRutIpo7UiVNVnRFpZZDpzfERnfYvHa2iTeDz1hhhU/SNQqQ2Y+
         AiCBNmfW76K9iULp3bTdlp6d5yG0XEsY6RDUxeUzul3iVOgFCsigbEhHs6I22oDDOGJY
         WSNF/WgPfr9YmNU8jtuYreG2lP+LVyKlFN3xV4Qh32AXeIYUDSPy1+Cw/+srSTY3z7Ef
         UXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690835202; x=1691440002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPBqoedMe725DbxMZLK6zFiG40w1N5J7QMSwzoMHTns=;
        b=YT9g9IMeVQUZWSiDupqp0DsEKsaZlfobZj6W9QbWXkT5YXAw/JiXd7TIZo5RhU81sW
         PivyUDKerz5fnjkZjVXBypvoZ8nG3ZybIJI7SXmvJfdra12KNOBlvStnzW1/0Ys5Mksl
         PqXQD0fPFix+ncduQUXdPLNvaRsbjv8iSTroqAn5VGJVwRj7VyWsYvh8qA55H3M/Y5WP
         a0BdkgV09iCzFtrLcs9qiIYNJ58Kx5PqHKohPAlNPelGUtCppCbWtfk5GmMoeW1YPwpZ
         CQIU6lpSnmOnP2oB5vuOrJLMl2BerV/IyD0wReL+h+34HUIRWZJbUCxKR9begSt1XOWZ
         Jc+A==
X-Gm-Message-State: ABy/qLbjEJjbmA5PhUC0sRYSCZfPLclJ8kTMM2qGESZEboHqK+sbv+tx
	rm5rjv26OYUo7BLuf+x8nw5ZbcjTP0o=
X-Google-Smtp-Source: APBJJlFmJx3RPrXtsFv5JDR8RBy8tQY/5VOZSBFncQ/4J0FRHGQ8BLj495l5/BYZgt3c3G6L6H4+jw==
X-Received: by 2002:a05:6870:538c:b0:1bb:8842:7b5c with SMTP id h12-20020a056870538c00b001bb88427b5cmr12677245oan.43.1690835202052;
        Mon, 31 Jul 2023 13:26:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::65c])
        by smtp.gmail.com with ESMTPSA id 1-20020a4a0d01000000b0056082ad01desm4687078oob.14.2023.07.31.13.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 13:26:41 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] patchelf: Fix e2fsprogs ELF corruption
Date: Mon, 31 Jul 2023 14:26:38 -0600
Message-Id: <20230731202638.2291210-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 20:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185169

Patchelf has a nasty bug where calling --set-interpreter repeatedly
on the same program will eventually corrupt the program headers in a way
that causes a segmentation fault when the loader attempts to load the
program. In most cases, we don't reach this limit, but for recipes that
make multiple links to the same program with different names (e.g.
e2fsprogs-native), this limit can be reached, corrupting the program.

This doesn't fix the underlying issue as it is complicated, but instead
prevents the interpreter program from being re-written if it hasn't
changed (which is for the best anyway as each call would make the
program larger).

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 ...thing-if-interpreter-has-not-changed.patch | 38 +++++++++++++++++++
 .../patchelf/patchelf_0.18.0.bb               |  4 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/0001-Do-nothing-if-interpreter-has-not-changed.patch

diff --git a/meta/recipes-devtools/patchelf/patchelf/0001-Do-nothing-if-interpreter-has-not-changed.patch b/meta/recipes-devtools/patchelf/patchelf/0001-Do-nothing-if-interpreter-has-not-changed.patch
new file mode 100644
index 00000000000..0183d212259
--- /dev/null
+++ b/meta/recipes-devtools/patchelf/patchelf/0001-Do-nothing-if-interpreter-has-not-changed.patch
@@ -0,0 +1,38 @@
+From 09d182d9dfde5d68c4481edfa1bb77453b111380 Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Mon, 31 Jul 2023 13:15:27 -0600
+Subject: [PATCH] Do nothing if interpreter has not changed
+
+If there is not change to the interpreter, don't make any modifications
+to the file. This is more efficient than requiring programs to check
+before changing, and also prevents thrashing of the ELF file, since
+changing the interpreter repeatedly will keep growing the ELF file each
+time, even if it's the same value.
+
+This is particularly helpful where the same binary is symlinked or
+hardlinked with multiple names and has patchelf run on it.
+
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+Upstream-Status: Submitted [https://github.com/NixOS/patchelf/pull/512]
+---
+ src/patchelf.cc | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/patchelf.cc b/src/patchelf.cc
+index 82b4b46..bc40026 100644
+--- a/src/patchelf.cc
++++ b/src/patchelf.cc
+@@ -1454,6 +1454,10 @@ void ElfFile<ElfFileParamNames>::modifySoname(sonameMode op, const std::string &
+ template<ElfFileParams>
+ void ElfFile<ElfFileParamNames>::setInterpreter(const std::string & newInterpreter)
+ {
++    if (getInterpreter() == newInterpreter) {
++        return;
++    }
++
+     std::string & section = replaceSection(".interp", newInterpreter.size() + 1);
+     setSubstr(section, 0, newInterpreter + '\0');
+     changed = true;
+-- 
+2.33.0
+
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb b/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb
index e8bc2ff83dd..3aec0030cf4 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.18.0.bb
@@ -4,7 +4,9 @@ HOMEPAGE = "https://github.com/NixOS/patchelf"
 
 LICENSE = "GPL-3.0-only"
 
-SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master"
+SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
+           file://0001-Do-nothing-if-interpreter-has-not-changed.patch \
+           "
 SRCREV = "99c24238981b7b1084313aca8f5c493bb46f302c"
 
 S = "${WORKDIR}/git"
-- 
2.33.0


