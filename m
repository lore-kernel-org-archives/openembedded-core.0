Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D665C5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 10:07:50 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.8950.1709028469011519239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 02:07:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ie2Sn2uv;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4129e8bc6c8so22506065e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 02:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709028467; x=1709633267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X4Q9CZKt9sGOPuoqUXni7dYibdWVmU178lzsiXBfm1k=;
        b=Ie2Sn2uvdxbPVKDhORGOiReRGgd6bjR769dFO2r5BRC69heFGIag/8wDVmVIOAaSqb
         9ayXsMLwzOMI54PlszyLvmXDhMAaIxor5My68E5IIdU+wD2BT9eaXWZbrxPAYm2NnsVb
         X2ruY4sAS9tYl/yW6Okw7xFdW3qwqJw0q6QyiV1XauEwFjSkTFvkeyR2jG5pIZkulLMn
         h4KmibwbSbT0uN9c9GU/eJ6Uv6u6/36ywrgxpAH5ZzAKdL1ttFn8ZSH0vHj2QZ26VQav
         I+QDhOY8NyEugmvsGrLCjhXP/V0WhXW/WVb3FB4Vj/hRa6oVLHTRnFdXrlZEo/joHRb2
         VIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709028467; x=1709633267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4Q9CZKt9sGOPuoqUXni7dYibdWVmU178lzsiXBfm1k=;
        b=HMMeDS74PGSMvUrRq9TADdEt03DfaiN/s1mFJA6YQIvQU/eZG3wBdFRcY8aZ9vWuPm
         5jeo/8mZ6pXTvOxyx/3oOdFiYc4BcXDNETwRJ8stm0AfrrDfDRCXSMg3tS+/PLOYayG+
         MBbiJO/cF/vqDAw7DoQrArBVjm95BVI2mN1txfl7XCA2o30Qw5STnKT0y5nij09DFhC3
         Unj50BTG8aNyMUxeXRitlSGmuWRFkZ7si2xhMk7o6BJ/phWoTwqx2H0yT+aR67HpFVNy
         PNdid5XAbG4lma5CEhlDwXji5XAEwLHu89X5yZe1g+mAULmHj3GxIRJX/Lvp+f6Lt1wz
         fNeA==
X-Gm-Message-State: AOJu0Yw3ef0+nkXQ9bGqpFL51ODB+nzUf2HSZ+7NlFCFaua4WTRvQFQh
	aJz3Fe0x3QRT8hIBLY691xePNEbSyWivFKerf1ftbfgJ2OriRTmcf79L11z2
X-Google-Smtp-Source: AGHT+IEN+4lfIQiUCwFw5j5xYfMumqYnzfsLgy4+JyDnj9ggGYLK0gMcMjIkDQcEMXZX0dxEqh39mg==
X-Received: by 2002:adf:f486:0:b0:33d:3089:a840 with SMTP id l6-20020adff486000000b0033d3089a840mr6655004wro.49.1709028466550;
        Tue, 27 Feb 2024 02:07:46 -0800 (PST)
Received: from toster.lan (bl23-106-114.dsl.telepac.pt. [144.64.106.114])
        by smtp.gmail.com with ESMTPSA id n17-20020a5d4211000000b0033d97bd5ddasm10857918wrq.85.2024.02.27.02.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 02:07:46 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [RFC OE-core][PATCH 1/3] go: rework patch to avoid identation
Date: Tue, 27 Feb 2024 10:07:07 +0000
Message-ID: <20240227100709.1154-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 10:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196250

It's more hard to read but easy to rebase, no functional changes

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 ...dist-separate-host-and-target-builds.patch | 136 +++++-------------
 1 file changed, 35 insertions(+), 101 deletions(-)

diff --git a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
index 29598449da..aa2df58995 100644
--- a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
+++ b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
@@ -3,8 +3,6 @@ From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:18:12 +0430
 Subject: [PATCH 5/9] cmd/dist: separate host and target builds
 
-Upstream-Status: Inappropriate [OE specific]
-
 Change the dist tool to allow for OE-style cross-
 and cross-canadian builds:
 
@@ -33,13 +31,20 @@ Adapted to Go 1.13 from patches originally submitted to
 the meta/recipes-devtools/go tree by
 Matt Madison <matt@madison.systems>.
 
+Rework the patch to avoid identation, it's more hard to read
+but easy to rebase.
+Jose Quaresma <jose.quaresma@foundries.io>
+
+Upstream-Status: Inappropriate [OE specific]
+
 Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
 ---
- src/cmd/dist/build.go | 152 +++++++++++++++++++++++++++++++-----------
- 1 file changed, 113 insertions(+), 39 deletions(-)
+ src/cmd/dist/build.go | 76 ++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 75 insertions(+), 1 deletion(-)
 
 diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
-index 5d31718..1c7f308 100644
+index 5d3171856a..d0ba54c072 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
 @@ -44,6 +44,7 @@ var (
@@ -119,17 +124,14 @@ index 5d31718..1c7f308 100644
  		xprintf("\n")
  	}
  
--	gogcflags = os.Getenv("GO_GCFLAGS") // we were using $BOOT_GO_GCFLAGS until now
--	setNoOpt()
--	goldflags = os.Getenv("GO_LDFLAGS") // we were using $BOOT_GO_LDFLAGS until now
 +	// For split host/target cross/cross-canadian builds, we don't
 +	// want to be setting these flags until after we have compiled
 +	// the toolchain that runs on the build host.
 +	if !crossBuild {
-+		gogcflags = os.Getenv("GO_GCFLAGS") // we were using $BOOT_GO_GCFLAGS until now
-+		setNoOpt()
-+		goldflags = os.Getenv("GO_LDFLAGS") // we were using $BOOT_GO_LDFLAGS until now
-+	}
+ 	gogcflags = os.Getenv("GO_GCFLAGS") // we were using $BOOT_GO_GCFLAGS until now
+ 	setNoOpt()
+ 	goldflags = os.Getenv("GO_LDFLAGS") // we were using $BOOT_GO_LDFLAGS until now
++}
  	goBootstrap := pathf("%s/go_bootstrap", tooldir)
  	cmdGo := pathf("%s/go", gorootBin)
  	if debug {
@@ -137,25 +139,27 @@ index 5d31718..1c7f308 100644
  		xprintf("\n")
  	}
  	xprintf("Building Go toolchain2 using go_bootstrap and Go toolchain1.\n")
--	os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
-+	if crossBuild {
++	if !crossBuild {
+ 	os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
++} else {
 +		os.Setenv("CC", defaultcc[""])
-+	} else {
-+		os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
 +	}
  	// Now that cmd/go is in charge of the build process, enable GOEXPERIMENT.
  	os.Setenv("GOEXPERIMENT", goexperiment)
  	goInstall(goBootstrap, toolchain...)
-@@ -1421,46 +1454,84 @@ func cmdbootstrap() {
+@@ -1421,6 +1454,7 @@ func cmdbootstrap() {
  		copyfile(pathf("%s/compile3", tooldir), pathf("%s/compile", tooldir), writeExec)
  	}
  
--	if goos == oldgoos && goarch == oldgoarch {
--		// Common case - not setting up for cross-compilation.
--		timelog("build", "toolchain")
--		if vflag > 0 {
--			xprintf("\n")
-+	if crossBuild {
++	if !crossBuild {
+ 	if goos == oldgoos && goarch == oldgoarch {
+ 		// Common case - not setting up for cross-compilation.
+ 		timelog("build", "toolchain")
+@@ -1462,6 +1496,42 @@ func cmdbootstrap() {
+ 		checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
+ 		copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
+ 	}
++} else {
 +		gogcflags = os.Getenv("GO_GCFLAGS")
 +		goldflags = os.Getenv("GO_LDFLAGS")
 +		tool_files, _ := filepath.Glob(pathf("%s/*", tooldir))
@@ -189,94 +193,24 @@ index 5d31718..1c7f308 100644
 +			goInstall(goBootstrap, toBuild...)
 +			checkNotStale(goBootstrap, toBuild...)
 +			// Skip cmdGo staleness checks here, since we can't run the target's cmdGo binary
- 		}
--		xprintf("Building packages and commands for %s/%s.\n", goos, goarch)
- 	} else {
--		// GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.
--		// Finish GOHOSTOS/GOHOSTARCH installation and then
--		// run GOOS/GOARCH installation.
--		timelog("build", "host toolchain")
--		if vflag > 0 {
--			xprintf("\n")
-+
-+		if goos == oldgoos && goarch == oldgoarch {
-+			// Common case - not setting up for cross-compilation.
-+			timelog("build", "toolchain")
-+			if vflag > 0 {
-+				xprintf("\n")
-+			}
-+			xprintf("Building packages and commands for %s/%s.\n", goos, goarch)
-+		} else {
-+			// GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.
-+			// Finish GOHOSTOS/GOHOSTARCH installation and then
-+			// run GOOS/GOARCH installation.
-+			timelog("build", "host toolchain")
-+			if vflag > 0 {
-+				xprintf("\n")
-+			}
-+			xprintf("Building packages and commands for host, %s/%s.\n", goos, goarch)
-+			goInstall(goBootstrap, "std", "cmd")
-+			checkNotStale(goBootstrap, "std", "cmd")
-+			checkNotStale(cmdGo, "std", "cmd")
-+
-+			timelog("build", "target toolchain")
-+			if vflag > 0 {
-+				xprintf("\n")
-+			}
-+			goos = oldgoos
-+			goarch = oldgoarch
-+			os.Setenv("GOOS", goos)
-+			os.Setenv("GOARCH", goarch)
-+			os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
-+			xprintf("Building packages and commands for target, %s/%s.\n", goos, goarch)
- 		}
--		xprintf("Building packages and commands for host, %s/%s.\n", goos, goarch)
- 		goInstall(goBootstrap, "std", "cmd")
- 		checkNotStale(goBootstrap, "std", "cmd")
- 		checkNotStale(cmdGo, "std", "cmd")
- 
--		timelog("build", "target toolchain")
--		if vflag > 0 {
--			xprintf("\n")
-+		if debug {
-+			run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
-+			run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
-+			checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
-+			copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
- 		}
--		goos = oldgoos
--		goarch = oldgoarch
--		os.Setenv("GOOS", goos)
--		os.Setenv("GOARCH", goarch)
--		os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
--		xprintf("Building packages and commands for target, %s/%s.\n", goos, goarch)
--	}
--	targets := []string{"std", "cmd"}
--	goInstall(goBootstrap, targets...)
--	checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
--	checkNotStale(goBootstrap, targets...)
--	checkNotStale(cmdGo, targets...)
--	if debug {
--		run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
--		checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
--		copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
- 	}
++		}
++	}
  
  	// Check that there are no new files in $GOROOT/bin other than
-@@ -1477,8 +1548,11 @@ func cmdbootstrap() {
+ 	// go and gofmt and $GOOS_$GOARCH (target bin when cross-compiling).
+@@ -1477,8 +1547,12 @@ func cmdbootstrap() {
  		}
  	}
  
--	// Remove go_bootstrap now that we're done.
--	xremove(pathf("%s/go_bootstrap", tooldir))
 +	// Except that for split host/target cross-builds, we need to
 +	// keep it.
 +	if !crossBuild {
-+		xremove(pathf("%s/go_bootstrap", tooldir))
-+	}
+ 	// Remove go_bootstrap now that we're done.
+ 	xremove(pathf("%s/go_bootstrap", tooldir))
++}
  
  	if goos == "android" {
  		// Make sure the exec wrapper will sync a fresh $GOROOT to the device.
 -- 
-2.30.2
+2.43.0
 
-- 
2.44.0


