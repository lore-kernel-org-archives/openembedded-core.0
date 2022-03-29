Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A060C433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 23:39:59 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.1124.1648597197831217273
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 16:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oWFguH2X;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id s11so17241133pfu.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 16:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u90XsfL4tZFbYMtGbxUUnBat7UqlSoju4KM5Ff/DjAQ=;
        b=oWFguH2XXYhT453pHTpop4b4tf5oZcIIs0PNVIJvRSrd0NdQTjgtl/H3wUx65RD32+
         IJcIxul0cI74EPiiZradLjLzG2r8rd+S0tUSerzoBDQ2UInnEenv0G8mWVJIBCiA3F74
         fnngO0GVQKcoP2+IVLzjgS7iOFsXwJF+uVYvBhLwQL9EebjaqZgvci201yOJlR/W6C2A
         u4V69F11dL9tlulLxEiDTR/dW7lK8x/lm/H6Cu8BJm4eK6F64ZFg4gwg9HgUcyTxnq1N
         +O4GHw74vp5V20MsRPSrXw/EYh0GGxtLGh+ABZ67q65s1KWQferY5F22h8eFFbViJvCe
         bihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u90XsfL4tZFbYMtGbxUUnBat7UqlSoju4KM5Ff/DjAQ=;
        b=UGoAK5/GWrk4HUrZVa/eEC9stRPVGgHeTvjyoema6p8CIWR1+xnEN0jZBtB+1aIkej
         nv9H0deXXEndBI9ENbQ22qrguOUdhbIk28jVQM7VsGnDIB6SgrzaWrQ9F0Iob28sDROn
         NkEPxtvVtT3rmSZdYiFF/0JxATSZmDs28UcutYJuI5NoxEgT+gnb1Ag3lPHR5tYuvKBf
         9WRRAuUJqy18NMMdQNMupmY6FguOAFRRqCP/+a+v6+Gdv3qHpmAWjdJTUL5EfqbZ7I4A
         nPxpZ6Q2mP1Zjgs0ftGQz4GWK8YS7aceUtcZmCZkkFEnCaDTiOoGP7OT+9i4AXoDwDbO
         4xhg==
X-Gm-Message-State: AOAM5316uw9t6uWIPdEiTZgt8FgLjLSIFclB4S64KfSPzcZ4lkXdJjfa
	bO1CUtakJFOv1XhxG1Mw0sFkegDwpUk=
X-Google-Smtp-Source: 
 ABdhPJy2y+juL+7tqPhzc3ENDvWatZxRXxHXv+6g0IXQ/ta4+5+FPqdBgSZX5Awd8eUEkhK3GPHwlg==
X-Received: by 2002:a62:684:0:b0:4f7:803:d1b0 with SMTP id
 126-20020a620684000000b004f70803d1b0mr30161618pfg.10.1648597197056;
        Tue, 29 Mar 2022 16:39:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 x14-20020aa784ce000000b004fa79973c94sm20010387pfn.165.2022.03.29.16.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 16:39:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 2/4] go: Drop GOBUILDMODE
Date: Tue, 29 Mar 2022 16:39:51 -0700
Message-Id: <20220329233953.3039842-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329233953.3039842-1-raj.khem@gmail.com>
References: <20220329233953.3039842-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 23:39:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163759

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


