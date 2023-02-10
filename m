Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF7AC636D4
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 06:42:53 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.8292.1676011363664622361
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 22:42:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ukkpt5HE;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id j25so4053380wrc.4
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 22:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3XW09C4hp34AsYvgJNq1oVuLxfd8UV7A1g8vd9dhps=;
        b=Ukkpt5HEOnaFFLURoB03pA0XeXw/DAZ5Wj67aTtIOTE3m/DFf8QZg6SlDkWhjQy0rW
         kiob9nP+PZa25On2l6SUDqEUT1KxzFkw6Vxnzhyv8HI9JTZ4x7Th7xl8lt48kA/P9O2k
         s4mRDf0bDrxJ7N3y33VSusVvsiNVbbZqJ7WPNOnO94Twpp7ojiFC4Iju2FuQlGvSW7RU
         A+hD9vsOGHKEiowdnJEgn2Jk4EcCDIcrwAAQ4vPVRYxak24eP33+i7u+JrJ27xBKnUIi
         1euekjuwVTLj7EReaicqjByI4b1eUFwPH4BsPZn/VKNSEm4ySOgLp9CC2Fxp05uJ/e+8
         D5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3XW09C4hp34AsYvgJNq1oVuLxfd8UV7A1g8vd9dhps=;
        b=PRBQ/q4QMJ0udl4Dilo0Wkk/rHTZHivfR9Us8enYhBnQ6rO6VrTm1q4woi+w5ToRiO
         v17v9i5RdOF+xFF19MamBTyJ3AOVktkrrXe6UTDoMugOzp6oTSHepNeBfFb20lmnjfZn
         bMb2BhTs6UTZmyMjzwqcNZowmc9BUyAYQYr6wLid1Zu26uiHLI2WDG+rB+a48nWfG9op
         cYhBTD/m0x6RIdNilW3Kb30z9kMOeMgOs3260xsgmorsYXwkZEaltbTB9i7KxkCxOyvQ
         z/OZAfftAEEGlXlJN9wZWowtdGdY1BWrb4CHPbAL6CNvVs0BiEB7yoprW1c6g1fqghT5
         0F5w==
X-Gm-Message-State: AO0yUKUoCqxbZwY4vwE/3E48HE76Qw30aRUY4VdO6lY/9Hu+FJRWFFJi
	vj1pGV6+259yXkoHbLXxFBjAnYCDkUc=
X-Google-Smtp-Source: AK7set+3rjEWEoxK4Yf+kd37fr9eTVzXD3Bxk6vR9VPUUBER6WiX85lzry7ZeVTAfqCpvQzJnS+xCQ==
X-Received: by 2002:a5d:4a42:0:b0:2c4:68e:7391 with SMTP id v2-20020a5d4a42000000b002c4068e7391mr7192377wrs.21.1676011361921;
        Thu, 09 Feb 2023 22:42:41 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id y15-20020adfee0f000000b002c3efca57e1sm2896993wrn.110.2023.02.09.22.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 22:42:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/8] go: update 1.19.4 -> 1.20
Date: Fri, 10 Feb 2023 07:42:12 +0100
Message-Id: <20230210064216.4123807-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230210064216.4123807-1-alex@linutronix.de>
References: <20230210064216.4123807-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 06:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176979

No longer package go-runtime-staticdev into sdk packagegroup,
as go-runtime 1.20 doesn't build the static bits anymore
(possibly can be enabled via build config, if proven necessary).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../packagegroup-go-sdk-target.bb             |  1 -
 meta/recipes-devtools/go/go-1.19.4.inc        | 18 -------
 meta/recipes-devtools/go/go-1.20.inc          | 18 +++++++
 ...ive_1.19.4.bb => go-binary-native_1.20.bb} |  6 +--
 ...an_1.19.4.bb => go-cross-canadian_1.20.bb} |  0
 .../{go-cross_1.19.4.bb => go-cross_1.20.bb}  |  0
 ...crosssdk_1.19.4.bb => go-crosssdk_1.20.bb} |  0
 ...{go-native_1.19.4.bb => go-native_1.20.bb} |  0
 ...o-runtime_1.19.4.bb => go-runtime_1.20.bb} |  0
 ...ent-based-hash-generation-less-pedan.patch | 52 ++++++++++---------
 ...OLDIR-to-be-overridden-in-the-envir.patch} | 35 +++++++------
 ...-ld-add-soname-to-shareable-objects.patch} | 16 +++---
 ...e-CC-when-building-dist-and-go_boot.patch} | 17 +++---
 ...ist-separate-host-and-target-builds.patch} | 52 +++++++++----------
 ...-go-make-GOROOT-precious-by-default.patch} | 29 +++++++----
 ...ot-write-linker-flags-into-buildids.patch} | 13 +++--
 ...dgo.go-do-not-hardcode-host-compile.patch} | 15 ++++--
 ...ild-paths-on-staticly-linked-arches.patch} | 16 +++---
 .../go/{go_1.19.4.bb => go_1.20.bb}           |  0
 20 files changed, 160 insertions(+), 130 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-1.19.4.inc
 create mode 100644 meta/recipes-devtools/go/go-1.20.inc
 rename meta/recipes-devtools/go/{go-binary-native_1.19.4.bb => go-binary-native_1.20.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.19.4.bb => go-cross-canadian_1.20.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.19.4.bb => go-cross_1.20.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.19.4.bb => go-crosssdk_1.20.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.19.4.bb => go-native_1.20.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.19.4.bb => go-runtime_1.20.bb} (100%)
 rename meta/recipes-devtools/go/go/{0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch => 0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch} (59%)
 rename meta/recipes-devtools/go/go/{0004-ld-add-soname-to-shareable-objects.patch => 0003-ld-add-soname-to-shareable-objects.patch} (80%)
 rename meta/recipes-devtools/go/go/{0005-make.bash-override-CC-when-building-dist-and-go_boot.patch => 0004-make.bash-override-CC-when-building-dist-and-go_boot.patch} (79%)
 rename meta/recipes-devtools/go/go/{0006-cmd-dist-separate-host-and-target-builds.patch => 0005-cmd-dist-separate-host-and-target-builds.patch} (89%)
 rename meta/recipes-devtools/go/go/{0007-cmd-go-make-GOROOT-precious-by-default.patch => 0006-cmd-go-make-GOROOT-precious-by-default.patch} (75%)
 rename meta/recipes-devtools/go/go/{0001-exec.go-do-not-write-linker-flags-into-buildids.patch => 0007-exec.go-do-not-write-linker-flags-into-buildids.patch} (70%)
 rename meta/recipes-devtools/go/go/{0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch => 0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch} (79%)
 rename meta/recipes-devtools/go/go/{filter-build-paths.patch => 0009-go-Filter-build-paths-on-staticly-linked-arches.patch} (85%)
 rename meta/recipes-devtools/go/{go_1.19.4.bb => go_1.20.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 9236f8bf37..76e30aa002 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -23,7 +23,7 @@ GDBVERSION ?= "12.%"
 GLIBCVERSION ?= "2.37"
 LINUXLIBCVERSION ?= "6.1%"
 QEMUVERSION ?= "7.2%"
-GOVERSION ?= "1.19%"
+GOVERSION ?= "1.20%"
 LLVMVERSION ?= "15.%"
 RUSTVERSION ?= "1.67%"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
index 61629d273c..c03918acc8 100644
--- a/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
@@ -6,7 +6,6 @@ RDEPENDS:${PN} = " \
     go \
     go-runtime \
     go-runtime-dev \
-    go-runtime-staticdev \
 "
 
 COMPATIBLE_HOST = "^(?!riscv32).*"
diff --git a/meta/recipes-devtools/go/go-1.19.4.inc b/meta/recipes-devtools/go/go-1.19.4.inc
deleted file mode 100644
index 49349ba6ec..0000000000
--- a/meta/recipes-devtools/go/go-1.19.4.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-require go-common.inc
-
-FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go:"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
-
-SRC_URI += "\
-    file://0001-cmd-go-make-content-based-hash-generation-less-pedan.patch \
-    file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch \
-    file://0004-ld-add-soname-to-shareable-objects.patch \
-    file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
-    file://0006-cmd-dist-separate-host-and-target-builds.patch \
-    file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
-    file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
-    file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
-    file://filter-build-paths.patch \
-"
-SRC_URI[main.sha256sum] = "eda74db4ac494800a3e66ee784e495bfbb9b8e535df924a8b01b1a8028b7f368"
diff --git a/meta/recipes-devtools/go/go-1.20.inc b/meta/recipes-devtools/go/go-1.20.inc
new file mode 100644
index 0000000000..139f8d1f3c
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.20.inc
@@ -0,0 +1,18 @@
+require go-common.inc
+
+FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go:"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
+
+SRC_URI += "\
+    file://0001-cmd-go-make-content-based-hash-generation-less-pedan.patch \
+    file://0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch \
+    file://0003-ld-add-soname-to-shareable-objects.patch \
+    file://0004-make.bash-override-CC-when-building-dist-and-go_boot.patch \
+    file://0005-cmd-dist-separate-host-and-target-builds.patch \
+    file://0006-cmd-go-make-GOROOT-precious-by-default.patch \
+    file://0007-exec.go-do-not-write-linker-flags-into-buildids.patch \
+    file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
+    file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
+"
+SRC_URI[main.sha256sum] = "3a29ff0421beaf6329292b8a46311c9fbf06c800077ceddef5fb7f8d5b1ace33"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.19.4.bb b/meta/recipes-devtools/go/go-binary-native_1.20.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.19.4.bb
rename to meta/recipes-devtools/go/go-binary-native_1.20.bb
index 8dc8bdf8e2..ee6b84c4f5 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.19.4.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "c9c08f783325c4cf840a94333159cc937f05f75d36a8b307951d5bd959cf2ab8"
-SRC_URI[go_linux_arm64.sha256sum] = "9df122d6baf6f2275270306b92af3b09d7973fb1259257e284dba33c0db14f1b"
-SRC_URI[go_linux_ppc64le.sha256sum] = "fbc6c7d1d169bbdc82223d861d2fadc6add01c126533d3efbba3fdca9b362035"
+SRC_URI[go_linux_amd64.sha256sum] = "5a9ebcc65c1cce56e0d2dc616aff4c4cedcfbda8cc6f0288cc08cda3b18dcbf1"
+SRC_URI[go_linux_arm64.sha256sum] = "17700b6e5108e2a2c3b1a43cd865d3f9c66b7f1c5f0cec26d3672cc131cc0994"
+SRC_URI[go_linux_ppc64le.sha256sum] = "bccbf89c83e0aab2911e57217159bf0fc49bb07c6eebd2c23ae30af18fc5368b"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.19.4.bb b/meta/recipes-devtools/go/go-cross-canadian_1.20.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.19.4.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.20.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.19.4.bb b/meta/recipes-devtools/go/go-cross_1.20.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.19.4.bb
rename to meta/recipes-devtools/go/go-cross_1.20.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.19.4.bb b/meta/recipes-devtools/go/go-crosssdk_1.20.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.19.4.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.20.bb
diff --git a/meta/recipes-devtools/go/go-native_1.19.4.bb b/meta/recipes-devtools/go/go-native_1.20.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.19.4.bb
rename to meta/recipes-devtools/go/go-native_1.20.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.19.4.bb b/meta/recipes-devtools/go/go-runtime_1.20.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.19.4.bb
rename to meta/recipes-devtools/go/go-runtime_1.20.bb
diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
index 43be5cd2e8..56487e34e3 100644
--- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -1,7 +1,7 @@
-From fb22e586871cc6be0b7041e86d2daceee06ea568 Mon Sep 17 00:00:00 2001
+From 10766ca6f4007b96e3f6bf4fb496e5df74397eb9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 28 Mar 2022 10:59:03 -0700
-Subject: [PATCH] cmd/go: make content-based hash generation less pedantic
+Subject: [PATCH 1/9] cmd/go: make content-based hash generation less pedantic
 
 Go 1.10's build tool now uses content-based hashes to
 determine when something should be built or re-built.
@@ -25,19 +25,18 @@ Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Alex Kube <alexander.j.kube@gmail.com>
 Signed-off-by: Matt Madison <matt@madison.systems>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  src/cmd/go/internal/envcmd/env.go |  2 +-
- src/cmd/go/internal/work/exec.go  | 42 ++++++++++++++++++++++++-------
- 2 files changed, 34 insertions(+), 10 deletions(-)
+ src/cmd/go/internal/work/exec.go  | 44 ++++++++++++++++++++++++-------
+ 2 files changed, 36 insertions(+), 10 deletions(-)
 
 diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
-index 81ee859..2db3898 100644
+index 66ef5ce..fb7448a 100644
 --- a/src/cmd/go/internal/envcmd/env.go
 +++ b/src/cmd/go/internal/envcmd/env.go
-@@ -176,7 +176,7 @@ func ExtraEnvVars() []cfg.EnvVar {
- func ExtraEnvVarsCostly() []cfg.EnvVar {
- 	b := work.NewBuilder("")
+@@ -183,7 +183,7 @@ func ExtraEnvVarsCostly() []cfg.EnvVar {
+ 		}
+ 	}()
  
 -	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{})
 +	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{}, false)
@@ -45,10 +44,10 @@ index 81ee859..2db3898 100644
  		// Should not happen - b.CFlags was given an empty package.
  		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index c88b315..a06455c 100644
+index d6fa847..7e4fcb3 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -213,6 +213,8 @@ func (b *Builder) Do(ctx context.Context, root *Action) {
+@@ -223,6 +223,8 @@ func (b *Builder) Do(ctx context.Context, root *Action) {
  	writeActionGraph()
  }
  
@@ -57,7 +56,7 @@ index c88b315..a06455c 100644
  // buildActionID computes the action ID for a build action.
  func (b *Builder) buildActionID(a *Action) cache.ActionID {
  	p := a.Package
-@@ -234,7 +236,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -244,7 +246,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  		if p.Module != nil {
  			fmt.Fprintf(h, "module %s@%s\n", p.Module.Path, p.Module.Version)
  		}
@@ -66,7 +65,7 @@ index c88b315..a06455c 100644
  		// The Go compiler always hides the exact value of $GOROOT
  		// when building things in GOROOT.
  		//
-@@ -266,9 +268,9 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -276,9 +278,9 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  	}
  	if len(p.CgoFiles)+len(p.SwigFiles)+len(p.SwigCXXFiles) > 0 {
  		fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
@@ -78,14 +77,14 @@ index c88b315..a06455c 100644
  		fmt.Fprintf(h, "CC=%q %q %q %q\n", ccExe, cppflags, cflags, ldflags)
  		// Include the C compiler tool ID so that if the C
  		// compiler changes we rebuild the package.
-@@ -281,14 +283,14 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
- 			}
+@@ -286,14 +288,14 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+ 			fmt.Fprintf(h, "CC ID=%q\n", ccID)
  		}
  		if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
 -			cxxExe := b.cxxExe()
 +			cxxExe := filterCompilerFlags(b.cxxExe(), true)
  			fmt.Fprintf(h, "CXX=%q %q\n", cxxExe, cxxflags)
- 			if cxxID, err := b.gccToolID(cxxExe[0], "c++"); err == nil {
+ 			if cxxID, _, err := b.gccToolID(cxxExe[0], "c++"); err == nil {
  				fmt.Fprintf(h, "CXX ID=%q\n", cxxID)
  			}
  		}
@@ -93,9 +92,9 @@ index c88b315..a06455c 100644
 -			fcExe := b.fcExe()
 +			fcExe := filterCompilerFlags(b.fcExe(), true)
  			fmt.Fprintf(h, "FC=%q %q\n", fcExe, fflags)
- 			if fcID, err := b.gccToolID(fcExe[0], "f95"); err == nil {
+ 			if fcID, _, err := b.gccToolID(fcExe[0], "f95"); err == nil {
  				fmt.Fprintf(h, "FC ID=%q\n", fcID)
-@@ -305,7 +307,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -310,7 +312,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  		}
  	}
  	if p.Internal.BuildInfo != "" {
@@ -104,7 +103,7 @@ index c88b315..a06455c 100644
  	}
  
  	// Configuration specific to compiler toolchain.
-@@ -2705,8 +2707,25 @@ func envList(key, def string) []string {
+@@ -2970,8 +2972,25 @@ func envList(key, def string) []string {
  	return args
  }
  
@@ -128,11 +127,11 @@ index c88b315..a06455c 100644
  // CFlags returns the flags to use when invoking the C, C++ or Fortran compilers, or cgo.
 -func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, ldflags []string, err error) {
 +func (b *Builder) CFlags(p *load.Package, filtered bool) (cppflags, cflags, cxxflags, fflags, ldflags []string, err error) {
- 	defaults := "-g -O2"
- 
  	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
-@@ -2724,6 +2743,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
- 	if ldflags, err = buildFlags("LDFLAGS", defaults, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
+ 		return
+ 	}
+@@ -2987,6 +3006,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
+ 	if ldflags, err = buildFlags("LDFLAGS", defaultCFlags, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
  		return
  	}
 +	if filtered {
@@ -145,7 +144,7 @@ index c88b315..a06455c 100644
  
  	return
  }
-@@ -2739,7 +2765,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
+@@ -3002,7 +3028,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
  
  func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
  	p := a.Package
@@ -154,7 +153,7 @@ index c88b315..a06455c 100644
  	if err != nil {
  		return nil, nil, err
  	}
-@@ -3246,7 +3272,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
+@@ -3510,7 +3536,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
  
  // Run SWIG on one SWIG input file.
  func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
@@ -163,3 +162,6 @@ index c88b315..a06455c 100644
  	if err != nil {
  		return "", "", err
  	}
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/go/go/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
similarity index 59%
rename from meta/recipes-devtools/go/go/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
rename to meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
index 30068d8e74..6abd424733 100644
--- a/meta/recipes-devtools/go/go/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
+++ b/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
@@ -1,7 +1,8 @@
-From 7e0136a882757da0a374ab8592209586eced0e1c Mon Sep 17 00:00:00 2001
+From 5cca2fa5997292a87302bdc7e7ed3231371e98bd Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:15:37 +0430
-Subject: [PATCH] cmd/go: Allow GOTOOLDIR to be overridden in the environment
+Subject: [PATCH 2/9] cmd/go: Allow GOTOOLDIR to be overridden in the
+ environment
 
 to allow for split host/target build roots
 
@@ -12,14 +13,13 @@ Matt Madison <matt@madison.systems>.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
-
 ---
  src/cmd/dist/build.go          | 4 +++-
  src/cmd/go/internal/cfg/cfg.go | 6 +++++-
  2 files changed, 8 insertions(+), 2 deletions(-)
 
 diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
-index 7c44c4a..3024d0c 100644
+index c36a12e..5d31718 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
 @@ -264,7 +264,9 @@ func xinit() {
@@ -34,19 +34,22 @@ index 7c44c4a..3024d0c 100644
  
  // compilerEnv returns a map from "goos/goarch" to the
 diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cfg.go
-index c6ddfe5..605adb1 100644
+index 3257140..bb46253 100644
 --- a/src/cmd/go/internal/cfg/cfg.go
 +++ b/src/cmd/go/internal/cfg/cfg.go
-@@ -162,7 +162,11 @@ func SetGOROOT(goroot string) {
- 		// variables. This matches the initialization of ToolDir in
- 		// go/build, except for using BuildContext.GOROOT rather than
- 		// runtime.GOROOT.
--		build.ToolDir = filepath.Join(goroot, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
-+		if s := os.Getenv("GOTOOLDIR"); s != "" {
-+			build.ToolDir = filepath.Clean(s)
-+		} else {
-+			build.ToolDir = filepath.Join(goroot, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
-+		}
+@@ -229,7 +229,11 @@ func SetGOROOT(goroot string, isTestGo bool) {
+ 			// This matches the initialization of ToolDir in go/build, except for
+ 			// using ctxt.GOROOT and the installed GOOS and GOARCH rather than the
+ 			// GOROOT, GOOS, and GOARCH reported by the runtime package.
+-			build.ToolDir = filepath.Join(GOROOTpkg, "tool", installedGOOS+"_"+installedGOARCH)
++	   		if s := os.Getenv("GOTOOLDIR"); s != "" {
++				build.ToolDir = filepath.Clean(s)
++			} else {
++				build.ToolDir = filepath.Join(GOROOTpkg, "tool", installedGOOS+"_"+installedGOARCH)
++			}
+ 		}
  	}
  }
- 
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/go/go/0004-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
similarity index 80%
rename from meta/recipes-devtools/go/go/0004-ld-add-soname-to-shareable-objects.patch
rename to meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
index b700634910..2bc7d194bb 100644
--- a/meta/recipes-devtools/go/go/0004-ld-add-soname-to-shareable-objects.patch
+++ b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
@@ -1,7 +1,7 @@
-From 68867eae5d3a51f32b2a2e16374323338408781e Mon Sep 17 00:00:00 2001
+From c7536a820f713013ab1d4acef74a4c8bd970bf8f Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:16:32 +0430
-Subject: [PATCH] ld: add soname to shareable objects
+Subject: [PATCH 3/9] ld: add soname to shareable objects
 
 so that OE's shared library dependency handling
 can find them.
@@ -13,16 +13,15 @@ Matt Madison <matt@madison.systems>.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
-
 ---
  src/cmd/link/internal/ld/lib.go | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
-index 18910dd..b2e1d36 100644
+index c073017..e60d39a 100644
 --- a/src/cmd/link/internal/ld/lib.go
 +++ b/src/cmd/link/internal/ld/lib.go
-@@ -1459,6 +1459,7 @@ func (ctxt *Link) hostlink() {
+@@ -1491,6 +1491,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
@@ -30,7 +29,7 @@ index 18910dd..b2e1d36 100644
  			if ctxt.HeadType == objabi.Hwindows {
  				argv = addASLRargs(argv, *flagAslr)
  			} else {
-@@ -1474,6 +1475,7 @@ func (ctxt *Link) hostlink() {
+@@ -1506,6 +1507,7 @@ func (ctxt *Link) hostlink() {
  			argv = append(argv, "-Wl,-z,relro")
  		}
  		argv = append(argv, "-shared")
@@ -38,7 +37,7 @@ index 18910dd..b2e1d36 100644
  	case BuildModePlugin:
  		if ctxt.HeadType == objabi.Hdarwin {
  			argv = append(argv, "-dynamiclib")
-@@ -1482,6 +1484,7 @@ func (ctxt *Link) hostlink() {
+@@ -1514,6 +1516,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
@@ -46,3 +45,6 @@ index 18910dd..b2e1d36 100644
  		}
  	}
  
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/go/go/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
similarity index 79%
rename from meta/recipes-devtools/go/go/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
rename to meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
index 608f1eb5a0..85e42f7660 100644
--- a/meta/recipes-devtools/go/go/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
+++ b/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
@@ -1,7 +1,8 @@
-From 8f020921c464e95ded850950382115154448580a Mon Sep 17 00:00:00 2001
+From 31ff609cc3d3bfcc2f2257fda1dbaafaec31eb0b Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:17:16 +0430
-Subject: [PATCH] make.bash: override CC when building dist and go_bootstrap
+Subject: [PATCH 4/9] make.bash: override CC when building dist and
+ go_bootstrap
 
 for handling OE cross-canadian builds.
 
@@ -12,16 +13,15 @@ Matt Madison <matt@madison.systems>.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
-
 ---
  src/make.bash | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/make.bash b/src/make.bash
-index ab2ce19..37ec1fb 100755
+index c07f39b..6ca7242 100755
 --- a/src/make.bash
 +++ b/src/make.bash
-@@ -198,7 +198,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
+@@ -194,7 +194,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
  	exit 1
  fi
  rm -f cmd/dist/dist
@@ -30,12 +30,15 @@ index ab2ce19..37ec1fb 100755
  
  # -e doesn't propagate out of eval, so check success by hand.
  eval $(./cmd/dist/dist env -p || echo FAIL=true)
-@@ -223,7 +223,7 @@ fi
+@@ -219,7 +219,7 @@ fi
  # Run dist bootstrap to complete make.bash.
  # Bootstrap installs a proper cmd/dist, built with the new toolchain.
- # Throw ours, built with Go 1.4, away after bootstrap.
+ # Throw ours, built with the bootstrap toolchain, away after bootstrap.
 -./cmd/dist/dist bootstrap -a $vflag $GO_DISTFLAGS "$@"
 +CC="${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap -a $vflag $GO_DISTFLAGS "$@"
  rm -f ./cmd/dist/dist
  
  # DO NOT ADD ANY NEW CODE HERE.
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/go/go/0006-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
similarity index 89%
rename from meta/recipes-devtools/go/go/0006-cmd-dist-separate-host-and-target-builds.patch
rename to meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
index 2c864baa0e..29598449da 100644
--- a/meta/recipes-devtools/go/go/0006-cmd-dist-separate-host-and-target-builds.patch
+++ b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
@@ -1,7 +1,7 @@
-From ef5fddafdec78cab9963d21736e64d71ca520bcc Mon Sep 17 00:00:00 2001
+From 7a191e5191c8b813e929caedb3f3918bb08692a1 Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:18:12 +0430
-Subject: [PATCH] cmd/dist: separate host and target builds
+Subject: [PATCH 5/9] cmd/dist: separate host and target builds
 
 Upstream-Status: Inappropriate [OE specific]
 
@@ -34,16 +34,15 @@ the meta/recipes-devtools/go tree by
 Matt Madison <matt@madison.systems>.
 
 Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
-
 ---
- src/cmd/dist/build.go | 154 ++++++++++++++++++++++++++++++------------
- 1 file changed, 112 insertions(+), 42 deletions(-)
+ src/cmd/dist/build.go | 152 +++++++++++++++++++++++++++++++-----------
+ 1 file changed, 113 insertions(+), 39 deletions(-)
 
 diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
-index 3024d0c..45ebee0 100644
+index 5d31718..1c7f308 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
-@@ -45,6 +45,7 @@ var (
+@@ -44,6 +44,7 @@ var (
  	goexperiment     string
  	workdir          string
  	tooldir          string
@@ -52,9 +51,9 @@ index 3024d0c..45ebee0 100644
  	oldgoarch        string
  	exe              string
 @@ -55,6 +56,7 @@ var (
- 
  	rebuildall   bool
  	defaultclang bool
+ 	noOpt        bool
 +	crossBuild   bool
  
  	vflag int // verbosity
@@ -69,17 +68,17 @@ index 3024d0c..45ebee0 100644
  
  // compilerEnv returns a map from "goos/goarch" to the
 @@ -468,8 +472,10 @@ func setup() {
- 	p := pathf("%s/pkg/%s_%s", goroot, gohostos, gohostarch)
+ 	goosGoarch := pathf("%s/pkg/%s_%s", goroot, gohostos, gohostarch)
  	if rebuildall {
- 		xremoveall(p)
+ 		xremoveall(goosGoarch)
 +		xremoveall(build_tooldir)
  	}
- 	xmkdirall(p)
+ 	xmkdirall(goosGoarch)
 +	xmkdirall(build_tooldir)
- 
- 	if goos != gohostos || goarch != gohostarch {
- 		p := pathf("%s/pkg/%s_%s", goroot, goos, goarch)
-@@ -1248,17 +1254,35 @@ func cmdbootstrap() {
+ 	xatexit(func() {
+ 		if files := xreaddir(goosGoarch); len(files) == 0 {
+ 			xremove(goosGoarch)
+@@ -1276,17 +1282,35 @@ func cmdbootstrap() {
  
  	var noBanner, noClean bool
  	var debug bool
@@ -116,23 +115,25 @@ index 3024d0c..45ebee0 100644
  	// Set GOPATH to an internal directory. We shouldn't actually
  	// need to store files here, since the toolchain won't
  	// depend on modules outside of vendor directories, but if
-@@ -1326,8 +1350,13 @@ func cmdbootstrap() {
+@@ -1354,9 +1378,14 @@ func cmdbootstrap() {
  		xprintf("\n")
  	}
  
 -	gogcflags = os.Getenv("GO_GCFLAGS") // we were using $BOOT_GO_GCFLAGS until now
+-	setNoOpt()
 -	goldflags = os.Getenv("GO_LDFLAGS") // we were using $BOOT_GO_LDFLAGS until now
 +	// For split host/target cross/cross-canadian builds, we don't
 +	// want to be setting these flags until after we have compiled
 +	// the toolchain that runs on the build host.
 +	if !crossBuild {
 +		gogcflags = os.Getenv("GO_GCFLAGS") // we were using $BOOT_GO_GCFLAGS until now
++		setNoOpt()
 +		goldflags = os.Getenv("GO_LDFLAGS") // we were using $BOOT_GO_LDFLAGS until now
 +	}
  	goBootstrap := pathf("%s/go_bootstrap", tooldir)
  	cmdGo := pathf("%s/go", gorootBin)
  	if debug {
-@@ -1356,7 +1385,11 @@ func cmdbootstrap() {
+@@ -1385,7 +1414,11 @@ func cmdbootstrap() {
  		xprintf("\n")
  	}
  	xprintf("Building Go toolchain2 using go_bootstrap and Go toolchain1.\n")
@@ -144,10 +145,10 @@ index 3024d0c..45ebee0 100644
 +	}
  	// Now that cmd/go is in charge of the build process, enable GOEXPERIMENT.
  	os.Setenv("GOEXPERIMENT", goexperiment)
- 	goInstall(goBootstrap, append([]string{"-i"}, toolchain...)...)
-@@ -1395,50 +1428,84 @@ func cmdbootstrap() {
+ 	goInstall(goBootstrap, toolchain...)
+@@ -1421,46 +1454,84 @@ func cmdbootstrap() {
+ 		copyfile(pathf("%s/compile3", tooldir), pathf("%s/compile", tooldir), writeExec)
  	}
- 	checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
  
 -	if goos == oldgoos && goarch == oldgoarch {
 -		// Common case - not setting up for cross-compilation.
@@ -251,22 +252,18 @@ index 3024d0c..45ebee0 100644
 -		xprintf("Building packages and commands for target, %s/%s.\n", goos, goarch)
 -	}
 -	targets := []string{"std", "cmd"}
--	if goos == "js" && goarch == "wasm" {
--		// Skip the cmd tools for js/wasm. They're not usable.
--		targets = targets[:1]
--	}
 -	goInstall(goBootstrap, targets...)
+-	checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
 -	checkNotStale(goBootstrap, targets...)
 -	checkNotStale(cmdGo, targets...)
 -	if debug {
 -		run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
--		run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
 -		checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
 -		copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
  	}
  
  	// Check that there are no new files in $GOROOT/bin other than
-@@ -1455,8 +1522,11 @@ func cmdbootstrap() {
+@@ -1477,8 +1548,11 @@ func cmdbootstrap() {
  		}
  	}
  
@@ -280,3 +277,6 @@ index 3024d0c..45ebee0 100644
  
  	if goos == "android" {
  		// Make sure the exec wrapper will sync a fresh $GOROOT to the device.
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/go/go/0007-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
similarity index 75%
rename from meta/recipes-devtools/go/go/0007-cmd-go-make-GOROOT-precious-by-default.patch
rename to meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
index 534d431045..38b28b9877 100644
--- a/meta/recipes-devtools/go/go/0007-cmd-go-make-GOROOT-precious-by-default.patch
+++ b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
@@ -1,7 +1,7 @@
-From 9ba507e076c744f4d394418e4a849e68cd426a4a Mon Sep 17 00:00:00 2001
+From efab470498bb0a30ee2d00455a0c8c10459f6347 Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:18:56 +0430
-Subject: [PATCH 7/9] cmd/go: make GOROOT precious by default
+Subject: [PATCH 6/9] cmd/go: make GOROOT precious by default
 
 Upstream-Status: Inappropriate [OE specific]
 
@@ -27,9 +27,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  src/cmd/go/internal/work/exec.go   | 25 +++++++++++++++++++++++++
  3 files changed, 34 insertions(+)
 
+diff --git a/src/cmd/go/internal/work/action.go b/src/cmd/go/internal/work/action.go
+index 8beb134..68a8cfe 100644
 --- a/src/cmd/go/internal/work/action.go
 +++ b/src/cmd/go/internal/work/action.go
-@@ -673,6 +673,9 @@ func (b *Builder) addTransitiveLinkDeps(
+@@ -718,6 +718,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1 *Action, shlib string) {
  			if p1 == nil || p1.Shlib == "" || haveShlib[filepath.Base(p1.Shlib)] {
  				continue
  			}
@@ -39,9 +41,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  			haveShlib[filepath.Base(p1.Shlib)] = true
  			// TODO(rsc): The use of ModeInstall here is suspect, but if we only do ModeBuild,
  			// we'll end up building an overall library or executable that depends at runtime
+diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
+index 2f2860a..8cc6166 100644
 --- a/src/cmd/go/internal/work/build.go
 +++ b/src/cmd/go/internal/work/build.go
-@@ -197,6 +197,8 @@ See also: go install, go get, go clean.
+@@ -217,6 +217,8 @@ See also: go install, go get, go clean.
  
  const concurrentGCBackendCompilationEnabledByDefault = true
  
@@ -50,10 +54,10 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  func init() {
  	// break init cycle
  	CmdBuild.Run = runBuild
-@@ -209,6 +211,10 @@ func init() {
- 
- 	AddBuildFlags(CmdBuild, DefaultBuildFlags)
- 	AddBuildFlags(CmdInstall, DefaultBuildFlags)
+@@ -230,6 +232,10 @@ func init() {
+ 		AddCoverFlags(CmdBuild, nil)
+ 		AddCoverFlags(CmdInstall, nil)
+ 	}
 +
 +	if x := os.Getenv("GOROOT_OVERRIDE"); x != "" {
 +		goRootPrecious = false
@@ -61,9 +65,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  }
  
  // Note that flags consulted by other parts of the code
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index 7e4fcb3..d83b31b 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -535,6 +535,23 @@ func (b *Builder) build(ctx context.Cont
+@@ -527,6 +527,23 @@ func (b *Builder) build(ctx context.Context, a *Action) (err error) {
  		return errors.New("binary-only packages are no longer supported")
  	}
  
@@ -87,7 +93,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	if err := b.Mkdir(a.Objdir); err != nil {
  		return err
  	}
-@@ -1585,6 +1602,14 @@ func (b *Builder) linkShared(ctx context
+@@ -1624,6 +1641,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
  		return err
  	}
  
@@ -102,3 +108,6 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	if err := b.Mkdir(a.Objdir); err != nil {
  		return err
  	}
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/go/go/0001-exec.go-do-not-write-linker-flags-into-buildids.patch b/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch
similarity index 70%
rename from meta/recipes-devtools/go/go/0001-exec.go-do-not-write-linker-flags-into-buildids.patch
rename to meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch
index f117152f2a..a821cf02fc 100644
--- a/meta/recipes-devtools/go/go/0001-exec.go-do-not-write-linker-flags-into-buildids.patch
+++ b/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch
@@ -1,7 +1,7 @@
-From bdd69b55387f80c8df18d0af5008bf5e1a66be6a Mon Sep 17 00:00:00 2001
+From 0ba747e6a4b251a0d9eed0cfd8f8c491bb508040 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 23 Nov 2020 19:22:04 +0000
-Subject: [PATCH] exec.go: do not write linker flags into buildids
+Subject: [PATCH 7/9] exec.go: do not write linker flags into buildids
 
 The flags can contain build-specific paths, breaking reproducibility.
 
@@ -14,9 +14,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  src/cmd/go/internal/work/exec.go | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index d83b31b..a646fbb 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -1274,7 +1274,7 @@ func (b *Builder) linkActionID(a *Action
+@@ -1312,7 +1312,7 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
  	}
  
  	// Toolchain-dependent configuration, shared with b.linkSharedActionID.
@@ -25,7 +27,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  
  	// Input files.
  	for _, a1 := range a.Deps {
-@@ -1568,7 +1568,7 @@ func (b *Builder) linkSharedActionID(a *
+@@ -1607,7 +1607,7 @@ func (b *Builder) linkSharedActionID(a *Action) cache.ActionID {
  	fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
  
  	// Toolchain-dependent configuration, shared with b.linkActionID.
@@ -34,3 +36,6 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  
  	// Input files.
  	for _, a1 := range a.Deps {
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/go/go/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch b/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
similarity index 79%
rename from meta/recipes-devtools/go/go/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
rename to meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
index ef1cc6716a..fe830ce35c 100644
--- a/meta/recipes-devtools/go/go/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
+++ b/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
@@ -1,8 +1,8 @@
-From 2055a46b396e272616c0b2273903e02c3b49a2ff Mon Sep 17 00:00:00 2001
+From 1cbb416538a9c7c3fbedcb23f4d90d5c48becca8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 16:33:27 +0000
-Subject: [PATCH] src/cmd/dist/buildgo.go: do not hardcode host compilers into
- target binaries
+Subject: [PATCH 8/9] src/cmd/dist/buildgo.go: do not hardcode host compilers
+ into target binaries
 
 These come from $CC/$CXX on the build host and are not useful on targets;
 additionally as they contain host specific paths, this helps reproducibility.
@@ -13,9 +13,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  src/cmd/dist/buildgo.go | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
+diff --git a/src/cmd/dist/buildgo.go b/src/cmd/dist/buildgo.go
+index 29b0167..63a49f0 100644
 --- a/src/cmd/dist/buildgo.go
 +++ b/src/cmd/dist/buildgo.go
-@@ -34,8 +34,8 @@ func mkzdefaultcc(dir, file string) {
+@@ -33,8 +33,8 @@ func mkzdefaultcc(dir, file string) {
  		fmt.Fprintf(&buf, "package cfg\n")
  		fmt.Fprintln(&buf)
  		fmt.Fprintf(&buf, "const DefaultPkgConfig = `%s`\n", defaultpkgconfig)
@@ -26,7 +28,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  		writefile(buf.String(), file, writeSkipSame)
  		return
  	}
-@@ -46,8 +46,8 @@ func mkzdefaultcc(dir, file string) {
+@@ -45,8 +45,8 @@ func mkzdefaultcc(dir, file string) {
  	fmt.Fprintf(&buf, "package main\n")
  	fmt.Fprintln(&buf)
  	fmt.Fprintf(&buf, "const defaultPkgConfig = `%s`\n", defaultpkgconfig)
@@ -37,3 +39,6 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  	writefile(buf.String(), file, writeSkipSame)
  }
  
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/go/go/filter-build-paths.patch b/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
similarity index 85%
rename from meta/recipes-devtools/go/go/filter-build-paths.patch
rename to meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
index 280f911a21..705c922141 100644
--- a/meta/recipes-devtools/go/go/filter-build-paths.patch
+++ b/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
@@ -1,7 +1,7 @@
-From 3bdbce685c688a27eece36ccc8be9b50b4849498 Mon Sep 17 00:00:00 2001
+From 18011f72125bbea273d07ee5d792ac0ce6059572 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sat, 2 Jul 2022 23:08:13 +0100
-Subject: [PATCH] go: Filter build paths on staticly linked arches
+Subject: [PATCH 9/9] go: Filter build paths on staticly linked arches
 
 Filter out build time paths from ldflags and other flags variables when they're
 embedded in the go binary so that builds are reproducible regardless of build
@@ -11,16 +11,15 @@ on mips/ppc.
 Upstream-Status: Submitted [https://github.com/golang/go/pull/56410]
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
 ---
  src/cmd/go/internal/load/pkg.go | 15 +++++++++++++--
  1 file changed, 13 insertions(+), 2 deletions(-)
 
 diff --git a/src/cmd/go/internal/load/pkg.go b/src/cmd/go/internal/load/pkg.go
-index 046f508..353cbc4 100644
+index 56a4e5e..22edbdb 100644
 --- a/src/cmd/go/internal/load/pkg.go
 +++ b/src/cmd/go/internal/load/pkg.go
-@@ -2256,6 +2256,17 @@ func (p *Package) collectDeps() {
+@@ -2266,6 +2266,17 @@ func (p *Package) collectDeps() {
  // to their VCS information (vcsStatusError).
  var vcsStatusCache par.Cache
  
@@ -38,7 +37,7 @@ index 046f508..353cbc4 100644
  // setBuildInfo gathers build information, formats it as a string to be
  // embedded in the binary, then sets p.Internal.BuildInfo to that string.
  // setBuildInfo should only be called on a main package with no errors.
-@@ -2353,7 +2364,7 @@ func (p *Package) setBuildInfo(includeVCS bool) {
+@@ -2372,7 +2383,7 @@ func (p *Package) setBuildInfo(autoVCS bool) {
  	if gcflags := BuildGcflags.String(); gcflags != "" && cfg.BuildContext.Compiler == "gc" {
  		appendSetting("-gcflags", gcflags)
  	}
@@ -47,7 +46,7 @@ index 046f508..353cbc4 100644
  		// https://go.dev/issue/52372: only include ldflags if -trimpath is not set,
  		// since it can include system paths through various linker flags (notably
  		// -extar, -extld, and -extldflags).
-@@ -2392,7 +2403,7 @@ func (p *Package) setBuildInfo(includeVCS bool) {
+@@ -2418,7 +2429,7 @@ func (p *Package) setBuildInfo(autoVCS bool) {
  	// subset of flags that are known not to be paths?
  	if cfg.BuildContext.CgoEnabled && !cfg.BuildTrimpath {
  		for _, name := range []string{"CGO_CFLAGS", "CGO_CPPFLAGS", "CGO_CXXFLAGS", "CGO_LDFLAGS"} {
@@ -56,3 +55,6 @@ index 046f508..353cbc4 100644
  		}
  	}
  	appendSetting("GOARCH", cfg.BuildContext.GOARCH)
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/go/go_1.19.4.bb b/meta/recipes-devtools/go/go_1.20.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.19.4.bb
rename to meta/recipes-devtools/go/go_1.20.bb
-- 
2.30.2


