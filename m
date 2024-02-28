Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB58C5478C
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 18:30:47 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.4486.1709145039324132204
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 10:30:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cPcJcmev;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d094bc2244so252091fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 10:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709145037; x=1709749837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X4Q9CZKt9sGOPuoqUXni7dYibdWVmU178lzsiXBfm1k=;
        b=cPcJcmevkQeS9WM3AdyVBsEaohcRQkuI5ZZwKHo6AqD/mR4A5NWyTblCGytB2O5O3Q
         3vgDVzlEH+yc4MML4LfekPvRJNZFOn170aMEu0yKTDCrwDtnIJ2gW4Ji7WENArvs8/Hm
         AHewwVlxxxs9tsARwp6twyrv2GYEhorbQr6K8hxVOjJNoYDB1n5LHARMEmfj30dsBOzo
         fl++hcrYq6oQNIV8K7fLBMd9ecaRqxSAgr7ZEkHZaa+ITFO86VIIoXNvdl2NgS1SVHCi
         e5crajUJ9E+0xpVJOVJBodWVw7+lOtcbaGFJGKEsNjpTDe9o/bPzufy29JSzoT9UMP3S
         W9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709145037; x=1709749837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4Q9CZKt9sGOPuoqUXni7dYibdWVmU178lzsiXBfm1k=;
        b=pA2dbSPqt8ZfFdKCciV09pY4y9BPbldGl6w1toLBpYx95IR7gZdg8rdLUzsXvP+ZaD
         42RzynMGYNmSKm6VlImGea5cotfwhyoZ9BW7yzFm1W908xbCwWbGDmZwnuHmUfFd84uw
         KO7/eMeie3r9JZBDdez58KHfilBpmhdbE4iNgmb7403hddq09k7rV7fzOlCAZ+yM5+2O
         GSfm7WMHkvQO1x8+H2Rrw7gcLDKQ/hyJgGbnSiD2pdB6MNcXEafLLU2k4th2QwV8IJ1i
         iZ9/3O5ogANQNhkeIYuU96EfVLrLdK3WfDqiv+FlqI+aNy6RfzXkp7iCeFyrkT3CXptq
         6/9Q==
X-Gm-Message-State: AOJu0YwA0cld1cBgb975vp2/XKGAkS5OmyKRZCGMhVxrltI6+vRXUlkT
	zaBeYJYdcmO/z3/hhxuC82rm9SFEpcdo3d6gVqcXzxFQkGILVFNqkDanigoG
X-Google-Smtp-Source: AGHT+IHzFNhgzdK7vngYbALe41xo7AD9FkRkNo3qVUfbq+ZvZpXMlRG394Z5FW2d8PD/Q/Z39qTSFw==
X-Received: by 2002:a2e:6e19:0:b0:2d2:e2d6:3d2e with SMTP id j25-20020a2e6e19000000b002d2e2d63d2emr825858ljc.6.1709145036870;
        Wed, 28 Feb 2024 10:30:36 -0800 (PST)
Received: from toster.lan (bl23-106-114.dsl.telepac.pt. [144.64.106.114])
        by smtp.gmail.com with ESMTPSA id bn21-20020a056000061500b0033e033898c5sm2005454wrb.20.2024.02.28.10.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 10:30:36 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [RFC OE-core][PATCH v2 1/7] go: rework patch to avoid identation
Date: Wed, 28 Feb 2024 18:30:05 +0000
Message-ID: <20240228183011.1495807-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 18:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196400

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


