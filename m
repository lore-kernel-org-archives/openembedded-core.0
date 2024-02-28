Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C4CC54E5A
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 18:30:47 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.4491.1709145042887758387
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 10:30:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=isGNsHzr;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33dcad9e3a2so48541f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 10:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709145041; x=1709749841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Itay1/W41jcSuhCUrz+voC8A7IFuhyOJ8ntTxgaSuBo=;
        b=isGNsHzr/xIJhmtYL9XeFr9R2SC1eNipblfGIqIpc8dXPWP34KMiXtJ0tXqFt/sYzJ
         qcb6UbfVWRmjEYNleod8QFtbTzKJSWpmy7aUwxgEKTDGwkXS2fxwwtBQJFNDax+rIotZ
         U+1cTBz0cAOkQ5XH/R07DO6lJQ7xwPvIlyM3tIOY3jbo9UnEyLHWB9AjCG4YFaBi8ecp
         TLxsu6aOEQ4HUtc2kG9muqg4VPu0yIuAuBX+5Vsr1De7OVh9cqIGH5oLbD4oBf0X2uUm
         huB0Zo7XWP54HMEllJE10QXNYbx4FPsTfLJ1IF2VrDVVKiRS9Fzlv4YiL2vrYcZD8h/3
         tW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709145041; x=1709749841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Itay1/W41jcSuhCUrz+voC8A7IFuhyOJ8ntTxgaSuBo=;
        b=ohggYbrNdam+8QgIyE9aEps6QiT+S26f/NBNbAwWKI4KI8Qnz+xNmUOVzo+C+0t3e7
         cdv6eQ4qp8KTHwfDoK7BCtewAOMzalWH0znmR0OPLqQFdlgbBWDNPrSBXY1lR1SptjtA
         edMbqsqqy/m+stZYCy0hFIA/kDVA69G7WcoDU33HgQzAd1YuCGrApA225WxKfvLITqMY
         UV716LdnN6wtfruiAA1qFIzAnNpRwnjanimX+EUGDRE53JafT8eayG+9JwTwdpNA27pI
         lH4QeJC/onBhnQ1937D1xptPJSsdi40lLStsgG/N6QMLfprdvAPzchW7KxrHzZCkPv4j
         P/0Q==
X-Gm-Message-State: AOJu0Yy0zD3bC8zoPNuH/eyubyQpZ8FHc00ukbrRtBvUC+hUdkbITrzv
	KFxsN6VunOMH9ud18IfsYuvSO2ggvUTIoxekrN88DL2bQz0B1N2qTtPoUyeB
X-Google-Smtp-Source: AGHT+IEpJuZ4wxc/SS1DoTZ6VjvPSR2tzYA87Bf38KiB8U36CbcOJ009M+8txYpkzgE7qrti5N+eIg==
X-Received: by 2002:a5d:564f:0:b0:33d:f30:5689 with SMTP id j15-20020a5d564f000000b0033d0f305689mr269490wrw.30.1709145040661;
        Wed, 28 Feb 2024 10:30:40 -0800 (PST)
Received: from toster.lan (bl23-106-114.dsl.telepac.pt. [144.64.106.114])
        by smtp.gmail.com with ESMTPSA id bn21-20020a056000061500b0033e033898c5sm2005454wrb.20.2024.02.28.10.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 10:30:40 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [RFC OE-core][PATCH v2 5/7] go: upgrade 1.21.0 -> 1.21.5
Date: Wed, 28 Feb 2024 18:30:09 +0000
Message-ID: <20240228183011.1495807-5-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240228183011.1495807-1-jose.quaresma@foundries.io>
References: <20240228183011.1495807-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 18:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196405

Upgrade to latest 1.21.x release [1]:

$ git --no-pager log --oneline go1.21.0..go1.21.5
6018ad99a4 (tag: go1.21.5) [release-branch.go1.21] go1.21.5
ec8c526e4b [release-branch.go1.21] net/http: limit chunked data overhead
f7a79cb5fc [release-branch.go1.21] cmd/compile: fix findIndVar so it does not match disjointed loop headers
3684d19c20 [release-branch.go1.21] runtime: call enableMetadataHugePages and its callees on the systemstack
9e43850a32 [release-branch.go1.21] crypto/rand,runtime: switch RtlGenRandom for ProcessPrng
8caf4bb3e7 [release-branch.go1.21] path/filepath: consider \\?\c: as a volume on Windows
23c943e529 [release-branch.go1.21] cmd/go/internal/vcs: error out if the requested repo does not support a secure protocol
4952f41180 [release-branch.go1.21] cmd/go: allow 'go mod download' to switch toolchains if called with explicit arguments
f26fa05522 [release-branch.go1.21] os: report IO_REPARSE_TAG_DEDUP files as regular in Stat and Lstat
8ae493b5b8 [release-branch.go1.21] internal/poll: add SPLICE_F_NONBLOCK flag for splice to avoid inconsistency with O_NONBLOCK
b9f245b8d3 [release-branch.go1.21] cmd/compile: ensure pointer arithmetic happens after the nil check
caacf3a09a [release-branch.go1.21] cmd/compile: handle constant pointer offsets in dead store elimination
1e91861f67 [release-branch.go1.21] syscall: copy rlimit.go's build constraint to rlimit_test.go
ed817f1c40 (tag: go1.21.4) [release-branch.go1.21] go1.21.4
9e933c189c [release-branch.go1.21] path/filepath: fix various issues in parsing Windows paths
434af8537e [release-branch.go1.21] net/http: pull http2 underflow fix from x/net/http2
7b04d81cbc [release-branch.go1.21] runtime/cgo: avoid taking the address of crosscall2 in code
f9a31cda3c [release-branch.go1.21] cmd/compile/internal/typecheck: fix closure field naming
64b6c48107 [release-branch.go1.21] go/types, types2: don't use generics
ef6993f327 [release-branch.go1.21] runtime: don't eagerly collapse hugepages
bae01521f3 [release-branch.go1.21] go/types, types2: don't implicitly modify an argument function's type
236c07c049 [release-branch.go1.21] cmd/link: split text sections for arm 32-bit
9465990e0e [release-branch.go1.21] all: tidy dependency versioning after release
883f062fc0 (tag: go1.21.3) [release-branch.go1.21] go1.21.3
24ae2d9272 [release-branch.go1.21] net/http: regenerate h2_bundle.go
26b5783b72 (tag: go1.21.2) [release-branch.go1.21] go1.21.2
2ddfc04d12 [release-branch.go1.21] cmd/compile: use absolute file name in isCgo check
a15ef1bb0f [release-branch.go1.21] cmd/compile: absorb InvertFlags into Noov comparisons
41d71a5afa [release-branch.go1.21] cmd/compile: reset memcombine correctly between basic blocks
0b6b0a275a [release-branch.go1.21] runtime: always lock OS thread in debugcall
cd671a1180 [release-branch.go1.21] runtime: increase g0 stack size in non-cgo case
fc57cc31a0 [release-branch.go1.21] cmd/link: suppress -bind_at_load deprecation warning for ld-prime
9bec49cf52 [release-branch.go1.21] cmd/link: disable DWARF by default in c-shared mode on darwin
3ef4f939c3 [release-branch.go1.21] cmd/link: force old Apple linker in plugin mode
556e9c36ba [release-branch.go1.21] cmd/link: avoid deadcode of global map vars for programs using plugins
b64dc5f499 [release-branch.go1.21] cmd/go: in TestScript/gotoolchain_path, remove the user's PATH
cd66ca0636 [release-branch.go1.21] runtime/metrics: fix /gc/scan/* metrics
d7a0626806 [release-branch.go1.21] runtime: ignore SPWrite on innermost traceback frame
2c1e5b05fe (tag: go1.21.1) [release-branch.go1.21] go1.21.1
bbd043ff0d [release-branch.go1.21] html/template: properly handle special tags within the script context
b0e1d3ea26 [release-branch.go1.21] html/template: support HTML-like comments in script contexts
d25a935574 [release-branch.go1.21] cmd/go: reject toolchain directives containing path separators
e3ba569c78 [release-branch.go1.21] net/http: revert "support streaming POST content in wasm"
8dc6ad1c61 [release-branch.go1.21] runtime: restore caller's frame pointer when recovering from panic
06df3292a8 [release-branch.go1.21] runtime: avoid MADV_HUGEPAGE for heap memory
b120517ffd [release-branch.go1.21] go/types, types2: remove order dependency in inference involving channels
0a9582163c [release-branch.go1.21] cmd/go: retry ETXTBSY errors when running test binaries
91a4e74b98 [release-branch.go1.21] crypto/tls: QUIC: fix panics when processing post-handshake messages
6385a6fb18 [release-branch.go1.21] cmd/go: find GOROOT using os.Executable when installed to GOROOT/bin/GOOS_GOARCH
2d07bb86f0 [release-branch.go1.21] encoding/xml: overriding by empty namespace when no new name declaration
745b81b6e6 [release-branch.go1.21] encoding/gob: prevent panic from index out of range in Decoder.typeString
13339c75b8 [release-branch.go1.21] runtime: fix maps.Clone bug when cloning a map mid-grow
2977709875 [release-branch.go1.21] context: fix synchronization in ExampleAfterFunc_cond
2d4746f37b [release-branch.go1.21] go/types, types2: disable interface inference for versions before Go 1.21
2b8026f025 [release-branch.go1.21] cmd/compile: in expandCalls, move all arg marshalling into call block
7c97cc7d97 [release-branch.go1.21] Revert "os: use handle based APIs to read directories on windows"
cb6ea94996 [release-branch.go1.21] Revert "cmd/compile: omit redundant sign/unsign extension on arm64"
45b98bfb79 [release-branch.go1.21] path/filepath: don't drop .. elements when cleaning invalid Windows paths
bac083a584 [release-branch.go1.21] cmd/link: don't mangle string symbol names
70aa116c4a [release-branch.go1.21] runtime/internal/wasitest: skip racy TCP echo test
31c5a236bc [release-branch.go1.21] runtime: mark traceEnabled and traceShuttingDown as no:split
25ec110e51 [release-branch.go1.21] cmd/compile: ensure empty blocks in write barriers are marked unpreemptible
6634ce2f41 [release-branch.go1.21] runtime: profiling on Darwin cannot use blocking reads
25c6dce188 [release-branch.go1.21] cmd/compile: make backingArrayPtrLen to return typecheck-ed nodes
4e34f2e81d [release-branch.go1.21] go/types, types2: don't panic during interface completion
d91843ff67 [release-branch.go1.21] go/types, types2: use correct parameter list when checking argument passing
7437db1085 [release-branch.go1.21] go/types, types2: use exact unification when comparing interface methods
ed527ecfb2 [release-branch.go1.21] cmd/api: rename api.go to main_test.go
b78e8cc145 [release-branch.go1.21] crypto/tls: add GODEBUG to control max RSA key size
3475e6af4c [release-branch.go1.21] cmd/go: fix missing case checking for empty slice
179821c9e1 [release-branch.go1.21] net/http: permit requests with invalid Host headers
9398951479 [release-branch.go1.21] cmd/distpack: include directory entries in tar files
75d8be5fb4 [release-branch.go1.21] cmd/go/internal/web: release the net token when an HTTP request fails due to CheckRedirect
1755d14559 [release-branch.go1.21] cmd/compile: fix missing init nodes for len(string([]byte)) optimization

[1] https://github.com/golang/go/compare/go1.21.0...go1.21.5

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-devtools/go/{go-1.21.0.inc => go-1.21.5.inc}   | 2 +-
 ...o-binary-native_1.21.0.bb => go-binary-native_1.21.5.bb} | 6 +++---
 ...cross-canadian_1.21.0.bb => go-cross-canadian_1.21.5.bb} | 0
 .../go/{go-cross_1.21.0.bb => go-cross_1.21.5.bb}           | 0
 .../go/{go-crosssdk_1.21.0.bb => go-crosssdk_1.21.5.bb}     | 0
 .../go/{go-native_1.21.0.bb => go-native_1.21.5.bb}         | 0
 .../go/{go-runtime_1.21.0.bb => go-runtime_1.21.5.bb}       | 0
 meta/recipes-devtools/go/{go_1.21.0.bb => go_1.21.5.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.21.0.inc => go-1.21.5.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.21.0.bb => go-binary-native_1.21.5.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.21.0.bb => go-cross-canadian_1.21.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.21.0.bb => go-cross_1.21.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.21.0.bb => go-crosssdk_1.21.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.21.0.bb => go-native_1.21.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.21.0.bb => go-runtime_1.21.5.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.21.0.bb => go_1.21.5.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.21.0.inc b/meta/recipes-devtools/go/go-1.21.5.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.21.0.inc
rename to meta/recipes-devtools/go/go-1.21.5.inc
index 2933793b8b..f009ea77c7 100644
--- a/meta/recipes-devtools/go/go-1.21.0.inc
+++ b/meta/recipes-devtools/go/go-1.21.5.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "818d46ede85682dd551ad378ef37a4d247006f12ec59b5b755601d2ce114369a"
+SRC_URI[main.sha256sum] = "285cbbdf4b6e6e62ed58f370f3f6d8c30825d6e56c5853c66d3c23bcdb09db19"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.21.0.bb b/meta/recipes-devtools/go/go-binary-native_1.21.5.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.21.0.bb
rename to meta/recipes-devtools/go/go-binary-native_1.21.5.bb
index 5d0427f56f..cc79a277ff 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.21.0.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.21.5.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "d0398903a16ba2232b389fb31032ddf57cac34efda306a0eebac34f0965a0742"
-SRC_URI[go_linux_arm64.sha256sum] = "f3d4548edf9b22f26bbd49720350bbfe59d75b7090a1a2bff1afad8214febaf3"
-SRC_URI[go_linux_ppc64le.sha256sum] = "e938ffc81d8ebe5efc179240960ba22da6a841ff05d5cab7ce2547112b14a47f"
+SRC_URI[go_linux_amd64.sha256sum] = "e2bc0b3e4b64111ec117295c088bde5f00eeed1567999ff77bc859d7df70078e"
+SRC_URI[go_linux_arm64.sha256sum] = "841cced7ecda9b2014f139f5bab5ae31785f35399f236b8b3e75dff2a2978d96"
+SRC_URI[go_linux_ppc64le.sha256sum] = "1f6dd06aa34f292f33c2c70ea9b4456e3a9e5cbd1d99968f3f463a4805b40ece"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.21.0.bb b/meta/recipes-devtools/go/go-cross-canadian_1.21.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.21.0.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.21.5.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.21.0.bb b/meta/recipes-devtools/go/go-cross_1.21.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.21.0.bb
rename to meta/recipes-devtools/go/go-cross_1.21.5.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.21.0.bb b/meta/recipes-devtools/go/go-crosssdk_1.21.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.21.0.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.21.5.bb
diff --git a/meta/recipes-devtools/go/go-native_1.21.0.bb b/meta/recipes-devtools/go/go-native_1.21.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.21.0.bb
rename to meta/recipes-devtools/go/go-native_1.21.5.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.21.0.bb b/meta/recipes-devtools/go/go-runtime_1.21.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.21.0.bb
rename to meta/recipes-devtools/go/go-runtime_1.21.5.bb
diff --git a/meta/recipes-devtools/go/go_1.21.0.bb b/meta/recipes-devtools/go/go_1.21.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.21.0.bb
rename to meta/recipes-devtools/go/go_1.21.5.bb
-- 
2.44.0


