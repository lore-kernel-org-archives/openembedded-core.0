Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5FEC433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 18:07:12 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.3.1648490831813663948
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 11:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bddRPY2/;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id b130so11401534pga.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 11:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u90XsfL4tZFbYMtGbxUUnBat7UqlSoju4KM5Ff/DjAQ=;
        b=bddRPY2/1okmksHUb7U25fwHPuDfR36QLIeUlkrdMFSQ8jGcRtPgIxKNMreYh7pILJ
         LUI/N7fqqE3NLkJxaiPPC7ODVWfCI3JGmhoKcwxhTOAFewbsDDk9Yx+2i+86+HKizYwt
         pEveEa7Rq/zBnXzESHQtvT3VYm0HghoAN2RWvYs8YPHc1oT7ln5T/NBGF+3g6RFA9eTC
         gbpifSB4Zgk0jxvbFru4V+CnYIHPh73dTBtWLL+wkv+PQqJsFT16oqJw7YDR8xN8GDAp
         K5P3cuYPCYKxDgapl2YjR5oMp/72n9t4h+WLiiYx3VpPx0Af8MpWpd2UOrNPah/onewM
         82oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u90XsfL4tZFbYMtGbxUUnBat7UqlSoju4KM5Ff/DjAQ=;
        b=JzlG0MHKQaRyvr55qf7TIuvv0gxG0plsaPAN7O2XyeBBJBtInkyKRpep/S3GnF+xt6
         acA1TPIYhIA0xWW7FoQj++8k878zM0s9zxwP+W4YJ4ZvQ3E93JP9YBv9ShrPTm6jgieo
         Ww8CuIyN5HP3ndw1Ovt636MmyfHr5rHonmluP11L79LEoQNLS0JPCBn0Mq9Oz+G3vFpf
         le6VsBuqyoqRF47REf/OrZ07BQpRFjgWqIMfwb6pQaznQ1vXLqmwuuu0rokNeJWE/JCR
         S+552xAtu5uoFTuDeVSO8VWb4GOQpQlcdZq2oJbTicFn+IIVBlGodZ+MFpse1e/pPL/a
         KkuQ==
X-Gm-Message-State: AOAM531yHgOHRvIV9+ZNofy77oAFfUi6cMgI9cmF/s8j8eZn3N6MjzTK
	iblO6s9MmfWh97BLz+H8pYr8COJpj5M=
X-Google-Smtp-Source: 
 ABdhPJy8C6NAklqTUk+37rjGGk7TcNoBSlnABp19+K3cUI33/ewN+dmcHQTvBMWtvCuY2X5afyM6tg==
X-Received: by 2002:a63:b51:0:b0:381:6a51:9481 with SMTP id
 a17-20020a630b51000000b003816a519481mr11070091pgl.582.1648490831113;
        Mon, 28 Mar 2022 11:07:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 nu16-20020a17090b1b1000b001c77c6a391csm174982pjb.26.2022.03.28.11.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 11:07:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/4] go: Drop GOBUILDMODE
Date: Mon, 28 Mar 2022 11:07:05 -0700
Message-Id: <20220328180707.3565916-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328180707.3565916-1-raj.khem@gmail.com>
References: <20220328180707.3565916-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 18:07:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163717

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
index 99ce70b346a..54e241af10c 100644
--- a/meta/recipes-devtools/go/go-1.18.inc
+++ b/meta/recipes-devtools/go/go-1.18.inc
@@ -11,7 +11,6 @@ SRC_URI += "\
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


