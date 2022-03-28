Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D82C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 07:53:06 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.8418.1648453986398981063
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 00:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wlr0KP5w;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id c23so14135805plo.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 00:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vZ0XHFnz0+JESVy1fLRx3/vmd790dIznTp5i1zEaXO8=;
        b=Wlr0KP5w2vVRTch/gfHibqy0oqSbjeIQcaDL3XFbDXwTJGVvNGUYXnwpPwX+YOcnLd
         JTRTqWEFCROn36+W2bGOhfzaCkN+PFmAS6f+QkyhD8tlXKgTBL9zUSOERPrjk4YqQDyU
         ScuZp6ehVsxwD6+N1Ml15QzYUEpzEBl6N6XtcKC1c06I15XhfiqXia05c7wdUwZcU8b4
         E/DDLBI0m1LOEu/hzkKv1C7nrpNWntBijvrl8sz/yH+KL2Fm5M2wV5sSQppOwpDFZ6bL
         bJqydzLuKmRtpk2kkqH/RQwK7vTqOWXUMpCxkcLrPvaa87CAqFivi7ZUCSMngeLpIK+C
         9X9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vZ0XHFnz0+JESVy1fLRx3/vmd790dIznTp5i1zEaXO8=;
        b=NpHw1nPZUTUL+sVRkPZpsLgZj80WBYpIzABzEQUBt2C8yWndVYon/ZMDPauLIfX/r6
         zCxIA2DbGOMyW8JqrXoMHJWtSF0E9iGWkNzQPFZMXTskC6G10WFKom62oR1XGZjiGP8r
         dRxEVYLJm04cjHhjtP0XNYklH2mY9sGEtF8UaMwNRp5VD55drZFJzY4jRFvida0UuDIN
         a1pg1vLRrJvhMBA6Vn3hCyp2QADE7ozpyzwtcqgs4940ujTHkOD9dywBtsjNCa82gJ8N
         hwpxF6EEeiPEKhB15nS9a9daU8i91IhKTbgIMqC1M/yEVjHSe35FFvleK5tX5VjNNx0n
         NrmQ==
X-Gm-Message-State: AOAM5319gTROBR3y7iDNBhy5Tacpo8bvo0KsRj151ybJi+fXBRJb2y92
	hZJA3D043CszgmkrHcAxvVKuq4qAwQ4=
X-Google-Smtp-Source: 
 ABdhPJzW/UFpYoBoxeJlsaeQ9vdgqSPrDUIThQ+2HEZY+PTXnhNsy/ZRjHRM1UO98EKHD1YDxyCj5A==
X-Received: by 2002:a17:90a:4749:b0:1be:ea64:4348 with SMTP id
 y9-20020a17090a474900b001beea644348mr39649395pjg.231.1648453985347;
        Mon, 28 Mar 2022 00:53:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 y3-20020a056a00190300b004fa2411bb92sm15275081pfi.93.2022.03.28.00.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 00:53:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] go: Drop GOBUILDMODE
Date: Mon, 28 Mar 2022 00:53:01 -0700
Message-Id: <20220328075303.1519482-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 07:53:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163683

This is local invention which is no longer needed, pie-mode works good
now a days to build go for target

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-1.18.inc          |  1 -
 ...008-use-GOBUILDMODE-to-set-buildmode.patch | 42 -------------------
 meta/recipes-devtools/go/go_1.18.bb           |  1 -
 3 files changed, 44 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-1.18/0008-use-GOBUILDMODE-to-set-buildmode.patch

diff --git a/meta/recipes-devtools/go/go-1.18.inc b/meta/recipes-devtools/go/go-1.18.inc
index c8cc2796ea9..da61e93b1db 100644
--- a/meta/recipes-devtools/go/go-1.18.inc
+++ b/meta/recipes-devtools/go/go-1.18.inc
@@ -10,7 +10,6 @@ SRC_URI += "\
     file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
     file://0006-cmd-dist-separate-host-and-target-builds.patch \
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
-    file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
 "
diff --git a/meta/recipes-devtools/go/go-1.18/0008-use-GOBUILDMODE-to-set-buildmode.patch b/meta/recipes-devtools/go/go-1.18/0008-use-GOBUILDMODE-to-set-buildmode.patch
deleted file mode 100644
index 0ede623af97..00000000000
--- a/meta/recipes-devtools/go/go-1.18/0008-use-GOBUILDMODE-to-set-buildmode.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 971b5626339ce0c4d57f9721c9a81af566c5a044 Mon Sep 17 00:00:00 2001
-From: Alex Kube <alexander.j.kube@gmail.com>
-Date: Wed, 23 Oct 2019 21:19:26 +0430
-Subject: [PATCH 8/9] cmd/go: Use GOBUILDMODE to set buildmode
-
-Upstream-Status: Denied [upstream choose antoher solution: `17a256b
-cmd/go: -buildmode=pie for android/arm']
-
-While building go itself, the go build system does not support
-to set `-buildmode=pie' from environment.
-
-Add GOBUILDMODE to support it which make PIE executables the default
-build mode, as PIE executables are required as of Yocto
-
-Refers: https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI
-
-Adapted to Go 1.13 from patches originally submitted to
-the meta/recipes-devtools/go tree by
-Hongxu Jia <hongxu.jia@windriver.com>
-
-Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
----
- src/cmd/go/internal/work/build.go | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
---- a/src/cmd/go/internal/work/build.go
-+++ b/src/cmd/go/internal/work/build.go
-@@ -283,7 +283,13 @@ func AddBuildFlags(cmd *base.Command, ma
- 
- 	cmd.Flag.Var(&load.BuildAsmflags, "asmflags", "")
- 	cmd.Flag.Var(buildCompiler{}, "compiler", "")
--	cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", "default", "")
-+
-+	if bm := os.Getenv("GOBUILDMODE"); bm != "" {
-+		cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", bm, "")
-+	} else {
-+		cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", "default", "")
-+	}
-+
- 	cmd.Flag.Var(&load.BuildGcflags, "gcflags", "")
- 	cmd.Flag.Var(&load.BuildGccgoflags, "gccgoflags", "")
- 	if mask&OmitModFlag == 0 {
diff --git a/meta/recipes-devtools/go/go_1.18.bb b/meta/recipes-devtools/go/go_1.18.bb
index 34dc89bb0cc..a492d7e64a1 100644
--- a/meta/recipes-devtools/go/go_1.18.bb
+++ b/meta/recipes-devtools/go/go_1.18.bb
@@ -3,7 +3,6 @@ require go-target.inc
 
 inherit linuxloader
 
-export GOBUILDMODE=""
 export GO_LDSO = "${@get_linuxloader(d)}"
 export CC_FOR_TARGET = "gcc"
 export CXX_FOR_TARGET = "g++"
-- 
2.35.1


