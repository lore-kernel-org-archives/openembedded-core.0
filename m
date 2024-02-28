Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A61C54E56
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 18:30:47 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.4369.1709145043320409538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 10:30:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d96qUK3Y;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33d6f1f17e5so46721f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 10:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709145041; x=1709749841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Quzhaf8KMK2YCLvOA1doJPwslC0NrV1n8yOHcshEnYM=;
        b=d96qUK3YrmAtV/S/kVnuo48l7bgh50D4VIaaWnCc/9McU5q/j3PQWU6QRpZySze4l2
         Os5BV3ENRAENDsUDIm6quvN2Lo/g9kDjrS+eOOsGmRDbxQjJbNJLHH0TUSKHOYObTUnu
         CsBQqeze96KTMxDDfoI/DHmTJbFz+YQrIODx7o/eBS3aLP3Oz+/YHeHAveXjePc8NHzp
         yKGaEV+0vuTRpWKuC8H0AhUPTWyFO3OzZpoEODbK+MtS7QoOzFDTOpifg6AAxTwPnn26
         yvcxNPJA0gjRXt2o95L8SY05mS3YAFIaeI7i2t3wNL9He/AsDIqK+2yMNRjv5k99yBLu
         uaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709145041; x=1709749841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Quzhaf8KMK2YCLvOA1doJPwslC0NrV1n8yOHcshEnYM=;
        b=C0s1Nbf4lif0sZg5qZPwjWhAOG+8Yqnhr3AbRYGOyCMeXTm2/0dv0jre1tgVP/musj
         bhWxkgphudxz8z6do3t568GFq9MsjLi2c6XhmB3RXscJp+z2gn8gmt1NLwldDIPKfjY/
         HFL6L6Q5s3fJoC3HTw1GuUXB4A69MokfjogD+cbnV5ywV9LIeJPZ4EiwP70ODM+VdxHr
         pXprEjEMxqCaz0fSJii8AcGZ0c1w7txyHqCEhOPt+Bz/zfNwOEo+WM+Jkai2xahulEvd
         4f7Akmhon7nYL3S/Q0Wb2+v43q7bVpYPQJ3cBzybZ9tNbAL4XBtiaPvrr8bUungBy/HD
         u/Ug==
X-Gm-Message-State: AOJu0YzrZ9yG+DrOrHI4b3RKw5TAmXtD6AW6QsqBniPSJEqiBY/5E305
	muqHzfeJSeVPfonEj4Spz149M6X/lEMesrbxbCkxayotXXvWI4By7/O5Bst+
X-Google-Smtp-Source: AGHT+IH88vxVEmV37fTKJ16HbOh8bwsYXb0B9LEAKUZFea6g7Kh+08piRYa2Rsb1xkx2rBD5bT5iXQ==
X-Received: by 2002:a05:6000:194a:b0:33d:f3c4:6002 with SMTP id e10-20020a056000194a00b0033df3c46002mr277317wry.1.1709145041457;
        Wed, 28 Feb 2024 10:30:41 -0800 (PST)
Received: from toster.lan (bl23-106-114.dsl.telepac.pt. [144.64.106.114])
        by smtp.gmail.com with ESMTPSA id bn21-20020a056000061500b0033e033898c5sm2005454wrb.20.2024.02.28.10.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 10:30:41 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [RFC OE-core][PATCH v2 6/7] go: upgrade 1.21.5 -> 1.21.7
Date: Wed, 28 Feb 2024 18:30:10 +0000
Message-ID: <20240228183011.1495807-6-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240228183011.1495807-1-jose.quaresma@foundries.io>
References: <20240228183011.1495807-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 18:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196406

Upgrade to latest 1.21.x release [1]:

$ git --no-pager log --oneline go1.21.5..go1.21.7
f29208030a (tag: go1.21.7) [release-branch.go1.21] go1.21.7
2fdad8af6d [release-branch.go1.21] cmd/internal/obj/arm64: fix frame pointer restore in epilogue
01c93ad049 [release-branch.go1.21] cmd/go/internal/generate: call modload.InitWorkFile
db74bfba18 [release-branch.go1.21] Revert "crypto/internal/boring: upgrade module to fips-20220613" +1
916e6cddf1 [release-branch.go1.21] runtime: fix Pinner.Pin documentation
6552f3d4ac [release-branch.go1.21] cmd/go/internal/toolchain: apply the -modcacherw flag when downloading a module to determine what toolchain it needs
3960318b87 [release-branch.go1.21] crypto/x509: properly gate test on macos version
00f974eb1f [release-branch.go1.21] go/types, types2: don't lose position info of interface embeddings
2f91c16e68 [release-branch.go1.21] runtime: properly model rwmutex in lock ranking
2540b1436f [release-branch.go1.21] slices: explicitly discard results of some functions
7e34c4308f [release-branch.go1.21] runtime: clear g0 stack bounds in dropm
491c1e7e95 [release-branch.go1.21] runtime: allow update of system stack bounds on callback from C thread
caafb50c0d [release-branch.go1.21] runtime: don't print "unexpected SPWRITE" when printing traceback
cc85462b3d (tag: go1.21.6) [release-branch.go1.21] go1.21.6
d2cb140194 [release-branch.go1.21] crypto/tls: align FIPS-only mode with BoringSSL policy
368e2a9461 [release-branch.go1.21] crypto/internal/boring: upgrade module to fips-20220613
8c6078adfb [release-branch.go1.21] runtime: add race annotations in IncNonDefault
f6b203c828 [release-branch.go1.21] maps: fix aliasing problems with Clone
43818206dc [release-branch.go1.21] runtime: put ReadMemStats debug assertions behind a double-check mode
cf65d74bc5 [release-branch.go1.21] runtime: add the disablethp GODEBUG setting
ad1ec60a5b [release-branch.go1.21] runtime/pprof: fix generics function names
bbab863ada [release-branch.go1.21] os/signal: skip nohup tests on darwin builders
7dc67e8f29 [release-branch.go1.21] os/signal: remove go t.Run from TestNohup
9f8b3ac8c4 [release-branch.go1.21] cmd/compile: fix escape analysis of string min/max
8c840b10d0 [release-branch.go1.21] cmd/compile: fix memcombine pass for big endian, > 1 byte elements

[1] https://github.com/golang/go/compare/go1.21.5...go1.21.7

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-devtools/go/{go-1.21.5.inc => go-1.21.7.inc} | 2 +-
 ...binary-native_1.21.5.bb => go-binary-native_1.21.7.bb} | 6 +++---
 ...oss-canadian_1.21.5.bb => go-cross-canadian_1.21.7.bb} | 0
 .../go/{go-cross_1.21.5.bb => go-cross_1.21.7.bb}         | 0
 .../go/{go-crosssdk_1.21.5.bb => go-crosssdk_1.21.7.bb}   | 0
 .../go/{go-native_1.21.5.bb => go-native_1.21.7.bb}       | 0
 .../go/{go-runtime_1.21.5.bb => go-runtime_1.21.7.bb}     | 0
 ...go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch | 2 +-
 .../go/go/0003-ld-add-soname-to-shareable-objects.patch   | 8 ++++----
 meta/recipes-devtools/go/{go_1.21.5.bb => go_1.21.7.bb}   | 0
 10 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/go/{go-1.21.5.inc => go-1.21.7.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.21.5.bb => go-binary-native_1.21.7.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.21.5.bb => go-cross-canadian_1.21.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.21.5.bb => go-cross_1.21.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.21.5.bb => go-crosssdk_1.21.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.21.5.bb => go-native_1.21.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.21.5.bb => go-runtime_1.21.7.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.21.5.bb => go_1.21.7.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.21.5.inc b/meta/recipes-devtools/go/go-1.21.7.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.21.5.inc
rename to meta/recipes-devtools/go/go-1.21.7.inc
index f009ea77c7..6de24e1e22 100644
--- a/meta/recipes-devtools/go/go-1.21.5.inc
+++ b/meta/recipes-devtools/go/go-1.21.7.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "285cbbdf4b6e6e62ed58f370f3f6d8c30825d6e56c5853c66d3c23bcdb09db19"
+SRC_URI[main.sha256sum] = "00197ab20f33813832bff62fd93cca1c42a08cc689a32a6672ca49591959bff6"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.21.5.bb b/meta/recipes-devtools/go/go-binary-native_1.21.7.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.21.5.bb
rename to meta/recipes-devtools/go/go-binary-native_1.21.7.bb
index cc79a277ff..d8826e20f1 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.21.5.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.21.7.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "e2bc0b3e4b64111ec117295c088bde5f00eeed1567999ff77bc859d7df70078e"
-SRC_URI[go_linux_arm64.sha256sum] = "841cced7ecda9b2014f139f5bab5ae31785f35399f236b8b3e75dff2a2978d96"
-SRC_URI[go_linux_ppc64le.sha256sum] = "1f6dd06aa34f292f33c2c70ea9b4456e3a9e5cbd1d99968f3f463a4805b40ece"
+SRC_URI[go_linux_amd64.sha256sum] = "13b76a9b2a26823e53062fa841b07087d48ae2ef2936445dc34c4ae03293702c"
+SRC_URI[go_linux_arm64.sha256sum] = "24744edcaeb827aafb76c67ebd406b5ae13291023b0ad9f061dd7a0e75b275ba"
+SRC_URI[go_linux_ppc64le.sha256sum] = "48a99ecce9b1e632870c29420088f61cf17a6f0c5bdb3cc821ff5c00e14b1a8a"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.21.5.bb b/meta/recipes-devtools/go/go-cross-canadian_1.21.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.21.5.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.21.7.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.21.5.bb b/meta/recipes-devtools/go/go-cross_1.21.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.21.5.bb
rename to meta/recipes-devtools/go/go-cross_1.21.7.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.21.5.bb b/meta/recipes-devtools/go/go-crosssdk_1.21.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.21.5.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.21.7.bb
diff --git a/meta/recipes-devtools/go/go-native_1.21.5.bb b/meta/recipes-devtools/go/go-native_1.21.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.21.5.bb
rename to meta/recipes-devtools/go/go-native_1.21.7.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.21.5.bb b/meta/recipes-devtools/go/go-runtime_1.21.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.21.5.bb
rename to meta/recipes-devtools/go/go-runtime_1.21.7.bb
diff --git a/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch b/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
index cf7ad02f86..6d1a02e6c0 100644
--- a/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
+++ b/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
@@ -35,7 +35,7 @@ index 8973a87..adc9fd2 100644
  	goversion := findgoversion()
  	isRelease = strings.HasPrefix(goversion, "release.") || strings.HasPrefix(goversion, "go")
 diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cfg.go
-index 8a82e55..1141fc2 100644
+index 8caa22a..0c322fb 100644
 --- a/src/cmd/go/internal/cfg/cfg.go
 +++ b/src/cmd/go/internal/cfg/cfg.go
 @@ -231,7 +231,11 @@ func SetGOROOT(goroot string, isTestGo bool) {
diff --git a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
index be4af096ce..d0cd8d244e 100644
--- a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
+++ b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
@@ -19,10 +19,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 3 insertions(+)
 
 diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
-index 91e2d51..e98b912 100644
+index 5e5d255..459e9dc 100644
 --- a/src/cmd/link/internal/ld/lib.go
 +++ b/src/cmd/link/internal/ld/lib.go
-@@ -1554,6 +1554,7 @@ func (ctxt *Link) hostlink() {
+@@ -1563,6 +1563,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
@@ -30,7 +30,7 @@ index 91e2d51..e98b912 100644
  			if ctxt.HeadType == objabi.Hwindows {
  				argv = addASLRargs(argv, *flagAslr)
  			} else {
-@@ -1569,6 +1570,7 @@ func (ctxt *Link) hostlink() {
+@@ -1578,6 +1579,7 @@ func (ctxt *Link) hostlink() {
  			argv = append(argv, "-Wl,-z,relro")
  		}
  		argv = append(argv, "-shared")
@@ -38,7 +38,7 @@ index 91e2d51..e98b912 100644
  	case BuildModePlugin:
  		if ctxt.HeadType == objabi.Hdarwin {
  			argv = append(argv, "-dynamiclib")
-@@ -1577,6 +1579,7 @@ func (ctxt *Link) hostlink() {
+@@ -1586,6 +1588,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
diff --git a/meta/recipes-devtools/go/go_1.21.5.bb b/meta/recipes-devtools/go/go_1.21.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.21.5.bb
rename to meta/recipes-devtools/go/go_1.21.7.bb
-- 
2.44.0


