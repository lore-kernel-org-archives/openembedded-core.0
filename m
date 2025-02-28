Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB78CC282D1
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 15:53:39 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.19126.1740758017797776507
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 07:53:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hrmu47dl;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-390d98ae34dso1874472f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 07:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740758016; x=1741362816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZ/KMKoKXgID2+w9wSCxFZZ8awPHr5riBxMEJjcMdEk=;
        b=Hrmu47dl814aSxDW/jM2xGrDfpUIzwgkDdzhKF6huO7tBU29+5Q4yIRkE87QuPjP3f
         jMBL6+Undasye6eBVYxxVxnNnXZIOrFoNRfSZKWScGIACs8sjl97wz22SXqLLKSjR5Ob
         7K3RQECkc7QOSbjQkLMK1bo2yONcb1E7xi3cSIhrim6EGAl/kRki4MpuTu07Zawclukx
         SzpbSuFlzk47x/7fQV1RgDN8Ha8TeQ+3/1sts7tX1+sF/PXFcV4FVdal4CqToLFbmhGv
         M+MBtYE1F86x8ZOHiOz10CS6oVh485LEI02Ih6HhbSYSALuPZjFrhc7ByAb21PUSB8vY
         WnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740758016; x=1741362816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZ/KMKoKXgID2+w9wSCxFZZ8awPHr5riBxMEJjcMdEk=;
        b=KLauKjAA2drKS2GC2lTq63MDG15F7o0VZtZmRTqm6ZXKfYkLBwhNFaAHPF3Dq8UFdH
         1svwIRCIs8E7ouWqAV6kjAQwITDB3npozyb2nWQdBn1HuFAb/dGQoDv8mUc/RVclGEmu
         aStn+mUme7Rz+PzfBrwfdJC4uPxRn81v/UZzEey983AAy3Z8/vZ+CdU/Fcvy5UqXMXxZ
         TT+oFiEAhCanFV6TkxJtu5b0Z+bLDebo5vT2Dr4JLDRSv4njOWpV6Kns1eRLXzJlwa1m
         nS/z1B9EaHfuVFrZeRUq8YrCoaykiwgvlnlByMfpXIyiQR5oro47jFw/hU07Vt42Po+5
         iyuQ==
X-Gm-Message-State: AOJu0YzyZ2iZj7OcUJ8uiKKMUsk78eICPSde0FsKUyY1NEUN+dyyMfH+
	uuxJmKVBhysUFxyQw2E86kskteyRv/vbbWxtYu5TDoh5YekY4MSF1RfMQQ==
X-Gm-Gg: ASbGncud62xNp2HI6J6Gyd23vxKAHLDOxIqRpKWJA6Gv9n5D4V2C996X2pX9jMp08+t
	zCIOr0NJ/M/y8HtfUl9fcHdolp4YNRSwSBEGeVYYCjbaE1PMu1y1Mcq9fYKnKAIZTLdYatY+fLZ
	s7cSFWNk4/kiie/K5q3+Lw8hd1oCMBhUFgH2RKTqu1fKK14Tz7rZA/L5SzAmxoInv4l0e3JvF01
	/bNuQSyMfBBpvZ1bIg74uqydHb2f/1w1oSCGnAgLzhRMBd2WM3Xpa/0LGanaN3TDL5cQO9og5/N
	mSC5GuJueQNwhZm23Gd1jQ+WRhYTI7aiDUA=
X-Google-Smtp-Source: AGHT+IEwC7ictEPkiLF5xWhCcTRXeMyNygP9uO+v1Lyx6UMOyst0WjLSYRgeKkgboCl/IeQ5HpvAqw==
X-Received: by 2002:a05:6000:4182:b0:390:e521:4bc4 with SMTP id ffacd0b85a97d-390ec9bccf0mr3297443f8f.23.1740758015401;
        Fri, 28 Feb 2025 07:53:35 -0800 (PST)
Received: from toster.lan ([185.228.162.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e48445c5sm5564717f8f.78.2025.02.28.07.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 07:53:34 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [RFC OE-core][PATCH 3/4] go: upgrade 1.23.0 -> 1.23.6
Date: Fri, 28 Feb 2025 15:52:58 +0000
Message-ID: <20250228155301.1033479-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228155301.1033479-1-jose.quaresma@foundries.io>
References: <20250228155301.1033479-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 15:53:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212067

Upgrade to latest 1.23.x release [1]:

$ git --no-pager log --oneline go1.23.6...go1.23.0
a991f9c34d (tag: go1.23.6) [release-branch.go1.23] go1.23.6
6644ed63b1 [release-branch.go1.23] crypto/internal/fips140/nistec: make p256NegCond constant time on ppc64le
ab44565bcd [release-branch.go1.23] cmd/go/internal/modfetch: do not trust server to send all tags in shallow fetch
9cbbf5e0f4 [release-branch.go1.23] cmd/compile: fix write barrier coalescing
d04e3cbc92 (tag: go1.23.5) [release-branch.go1.23] go1.23.5
bb8230f805 [release-branch.go1.23] net/http: persist header stripping across repeated redirects
fdb8413fe5 [release-branch.go1.23] crypto/x509: properly check for IPv6 hosts in URIs
1dde0b4844 [release-branch.go1.23] runtime: hold traceAcquire across casgstatus in injectglist
3417000c69 [release-branch.go1.23] crypto/tls: fix Config.Time in tests using expired certificates
1576793c51 [release-branch.go1.23] net: don't use sendfile for irregular files; handle EOPNOTSUPP/ENOTSUP
59b7d40774 [release-branch.go1.23] runtime: update and restore g0 stack bounds at cgocallback
69c8cfe29b [release-branch.go1.23] cmd/compile/internal/importer: enable aliases
194de8fbfa (tag: go1.23.4) [release-branch.go1.23] go1.23.4
5164a865e3 [release-branch.go1.23] cmd/trace: also show end stack traces
25f042daec [release-branch.go1.23] runtime: reserve 4kB for system stack on windows-386
be062b7f61 [release-branch.go1.23] runtime: explicitly keep handle alive during getOrAddWeakHandle
d8adc6c4c7 [release-branch.go1.23] runtime: prevent weak->strong conversions during mark termination
847cb6f9ca [release-branch.go1.23] syscall: mark SyscallN as noescape
777f43ab27 [release-branch.go1.23]time: accept "+01" in TestLoadFixed on OpenBSD
3726f07c46 [release-branch.go1.23] cmd/compile: use a non-fragile test for "does f contain closure c?"
c390a1c22e (tag: go1.23.3) [release-branch.go1.23] go1.23.3
1207de4f6c [release-branch.go1.23] runtime: reduce syscall.SyscallX stack usage
a0d15cb9c8 [release-branch.go1.23] runtime: fix MutexProfile missing root frames
958f3a0309 [release-branch.go1.23] internal/poll: handle the special case of sendfile(2) sending the full chunk
6ba3a8a6ba [release-branch.go1.23] internal/poll: keep copying after successful Sendfile return on BSD
5472853843 [release-branch.go1.23] cmd/link: generate Mach-O UUID when -B flag is specified
cfe0ae0b70 [release-branch.go1.23] runtime: uphold goroutine profile invariants in coroswitch
58babf6e0b [release-branch.go1.23] runtime,time: use atomic.Int32 for isSending
8d79bf799b [release-branch.go1.23] runtime: don't frob isSending for tickers
35c010ad6d [release-branch.go1.23] runtime: fix GoroutineProfile stacks not getting null terminated
6495ce0495 [release-branch.go1.23] syscall: use SYS_EXIT_GROUP in CLONE_PIDFD feature check child
7fc8312673 [release-branch.go1.23] os: add clone(CLONE_PIDFD) check to pidfd feature check
cc16cdf48f [release-branch.go1.23] runtime: clear isSending bit earlier
9563300f6e [release-branch.go1.23] os: ignore SIGSYS in checkPidfd
f8080edefd [release-branch.go1.23] runtime: fix TestGdbAutotmpTypes on gdb version 15
ed07b321ae (tag: go1.23.2) [release-branch.go1.23] go1.23.2
3b2e846e11 [release-branch.go1.23] runtime: if stop/reset races with running timer, return correct result
fbddfae62f [release-branch.go1.23] cmd/compile: fix wrong esacpe analysis for rangefunc
c8c6f9abfb [release-branch.go1.23] syscall: on exec failure, close pidfd
a74951c5af [release-branch.go1.23] unique: don't retain uncloned input as key
e6598e7baa [release-branch.go1.23] os: dup pidfd if caller sets PidFD manually
82575f76b8 [release-branch.go1.23] internal/weak: shade pointer in weak-to-strong conversion
a886959aa2 [release-branch.go1.23] runtime: size maps.Clone destination bucket array safely
80ff7cd35a [release-branch.go1.23] cmd/cgo: correct padding required by alignment
69234ded30 (tag: go1.23.1) [release-branch.go1.23] go1.23.1
032ac075c2 [release-branch.go1.23] go/build/constraint: add parsing limits
fa8ff1a46d [release-branch.go1.23] encoding/gob: cover missed cases when checking ignore depth
53487e5477 [release-branch.go1.23] go/parser: track depth in nested element lists
3d1f1f27cf [release-branch.go1.23] cmd: vendor golang.org/x/telemetry@internal-branch.go1.23-vendor
6de5a7180c [release-branch.go1.23] database/sql: fix panic with concurrent Conn and Close
9625a7faae [release-branch.go1.23] go/types, types2: unalias tilde terms in underIs
9c939a1e60 [release-branch.go1.23] runtime: store bp on cgocallback as unsafe.Pointer
7afe17bbdb [release-branch.go1.23] go/types, types2: use max(fileVersion, go1.21) if fileVersion present
8002845759 [release-branch.go1.23] runtime: on AIX, fix call to _cgo_sys_thread_create in _rt0_ppc64_aix_lib
9166d2feec [release-branch.go1.23] go/types, types2: Named.cleanup must also handle *Alias types
76346b3543 [release-branch.go1.23] unique: use TypeFor instead of TypeOf to get type in Make
3c9340557c [release-branch.go1.23] os: use O_EXCL instead of O_TRUNC in CopyFS to disallow rewriting existing files does not exist
dbecb416d1 [release-branch.go1.23] os: fix Chtimes test flakes

[1] https://github.com/golang/go/compare/go1.23.0...go1.23.6

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-devtools/go/{go-1.23.0.inc => go-1.23.6.inc}   | 2 +-
 ...o-binary-native_1.23.0.bb => go-binary-native_1.23.6.bb} | 6 +++---
 ...cross-canadian_1.23.0.bb => go-cross-canadian_1.23.6.bb} | 0
 .../go/{go-cross_1.23.0.bb => go-cross_1.23.6.bb}           | 0
 .../go/{go-crosssdk_1.23.0.bb => go-crosssdk_1.23.6.bb}     | 0
 .../go/{go-runtime_1.23.0.bb => go-runtime_1.23.6.bb}       | 0
 meta/recipes-devtools/go/{go_1.23.0.bb => go_1.23.6.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.23.0.inc => go-1.23.6.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.23.0.bb => go-binary-native_1.23.6.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.23.0.bb => go-cross-canadian_1.23.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.23.0.bb => go-cross_1.23.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.23.0.bb => go-crosssdk_1.23.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.23.0.bb => go-runtime_1.23.6.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.23.0.bb => go_1.23.6.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.23.0.inc b/meta/recipes-devtools/go/go-1.23.6.inc
similarity index 90%
rename from meta/recipes-devtools/go/go-1.23.0.inc
rename to meta/recipes-devtools/go/go-1.23.6.inc
index 55e6174c67..b54fffc8b5 100644
--- a/meta/recipes-devtools/go/go-1.23.0.inc
+++ b/meta/recipes-devtools/go/go-1.23.6.inc
@@ -16,4 +16,4 @@ SRC_URI += "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://6d265b008e3d106b2706645e5a88cd8e2fb98953.patch \
 "
-SRC_URI[main.sha256sum] = "42b7a8e80d805daa03022ed3fde4321d4c3bf2c990a144165d01eeecd6f699c6"
+SRC_URI[main.sha256sum] = "039c5b04e65279daceee8a6f71e70bd05cf5b801782b6f77c6e19e2ed0511222"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.23.0.bb b/meta/recipes-devtools/go/go-binary-native_1.23.6.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.23.0.bb
rename to meta/recipes-devtools/go/go-binary-native_1.23.6.bb
index da27c1ae73..a29bf533ed 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.23.0.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.23.6.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "905a297f19ead44780548933e0ff1a1b86e8327bb459e92f9c0012569f76f5e3"
-SRC_URI[go_linux_arm64.sha256sum] = "62788056693009bcf7020eedc778cdd1781941c6145eab7688bd087bce0f8659"
-SRC_URI[go_linux_ppc64le.sha256sum] = "8b26e20d4d43a4d7641cddbdc0298d7ba3804d910a9e06cda7672970dbf2829d"
+SRC_URI[go_linux_amd64.sha256sum] = "9379441ea310de000f33a4dc767bd966e72ab2826270e038e78b2c53c2e7802d"
+SRC_URI[go_linux_arm64.sha256sum] = "561c780e8f4a8955d32bf72e46af0b5ee5e0debe1e4633df9a03781878219202"
+SRC_URI[go_linux_ppc64le.sha256sum] = "0f817201e83d78ddbfa27f5f78d9b72450b92cc21d5e045145efacd0d3244a99"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.23.0.bb b/meta/recipes-devtools/go/go-cross-canadian_1.23.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.23.0.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.23.6.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.23.0.bb b/meta/recipes-devtools/go/go-cross_1.23.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.23.0.bb
rename to meta/recipes-devtools/go/go-cross_1.23.6.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.23.0.bb b/meta/recipes-devtools/go/go-crosssdk_1.23.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.23.0.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.23.6.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.23.0.bb b/meta/recipes-devtools/go/go-runtime_1.23.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.23.0.bb
rename to meta/recipes-devtools/go/go-runtime_1.23.6.bb
diff --git a/meta/recipes-devtools/go/go_1.23.0.bb b/meta/recipes-devtools/go/go_1.23.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.23.0.bb
rename to meta/recipes-devtools/go/go_1.23.6.bb
-- 
2.48.1


