Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518CEC6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 11:19:53 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.39792.1679483984813454681
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 04:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WBNTHkKd;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id o7so16629788wrg.5
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 04:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679483983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+5cil9mSOnrMy3NgM5JkXXMP9KITF8EFvrWmO27ad1g=;
        b=WBNTHkKdVK6KfG/fcXvbjvPEv7LvliK2xakowYLg2nh63k2IxvL3wfLRGDDbhP5IJA
         kQwQlbWgZJQSeRndF/nC8h7JeMI9PZylc2rtQrhYsxn3Xrm9maIfIMEQ5bRTvvDl/jy7
         g9uYc2AbQiOS/gf1LimY2FJFiawwX1DwoRjpAcnkA2e0MYZdNqo9HiYiDjIos4FXpPlO
         bnkH3//0AMZ3+8YomC/FMgxTtdnBs26LXWhpRB7p5IW0ffg8tRAq4z/RjqZgUBu+ELcm
         Xi5zs7NwVPHLiN9ajpO6XcFKScpSQs27pOEvqwrOMLFeyi6qInpi2F4D1BVq1pe31MW3
         T0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679483983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5cil9mSOnrMy3NgM5JkXXMP9KITF8EFvrWmO27ad1g=;
        b=rgDSFIqALqEfaQyd2/M5/dNx1NPZxudPISRgAVfHJqCtHB48CKqEmoZ1DmWHAM9ghv
         lRmfv9Iq3CYmSoom6HKN09hfOzSqf2c97kPSyPme6msKY5DlS00V/+3vB0O2v0clbI8o
         tntq31DetazJ936ou1cbotjXAXco1HLH7aeTCWjrUyKIpsZPVIw3DipPceaBXq9ABo0v
         ikTEnMyzeYF8Ds86Q9GkuDWtgwdsAJEdkG5FzAIN/V4lponS09WCU8M7NaoYI09Un8Fi
         NzG56vuGSDfQ2zNGo0h3qcSkOb7f/1AHlCpA6j13ls9osT+BThryv3QOFRh000btdXJs
         e1xQ==
X-Gm-Message-State: AO0yUKW6I4suS8+iT/r2rL9CK9BqYam2SK2GnRi7QbmsyaaBXUGNxeOw
	uguYK8ugsdGIIB1VSsy6pKseGyhtj8EGYw==
X-Google-Smtp-Source: AK7set/ki1CTqdfdb89BKyh8G41F/xLBkxEtORAaG63CPGkne4AwuPQKTWCaMWvwC1EDWp5qg2tWng==
X-Received: by 2002:adf:e846:0:b0:2c7:161e:702f with SMTP id d6-20020adfe846000000b002c7161e702fmr5000673wrn.47.1679483982968;
        Wed, 22 Mar 2023 04:19:42 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002cfe685bfd6sm13621424wrw.108.2023.03.22.04.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 04:19:42 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	volodymyr.khoroz@foundries.io,
	bruce.ashfield@gmail.com,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH] go: fix some linkshared regression introduced in go 1.20
Date: Wed, 22 Mar 2023 11:19:19 +0000
Message-Id: <20230322111919.2105600-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 11:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178920

Since go 1.20 some packages fails to link [1][2]
and only build staticaly with GO_LINKSHARED = ""

[1] https://lists.yoctoproject.org/g/meta-virtualization/topic/97182310
[2] https://github.com/golang/go/issues/58966

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-devtools/go/go-1.20.1.inc        |  1 +
 ...ompile-instantiated-generic-methods-.patch | 90 +++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/0010-cmd-compile-re-compile-instantiated-generic-methods-.patch

diff --git a/meta/recipes-devtools/go/go-1.20.1.inc b/meta/recipes-devtools/go/go-1.20.1.inc
index aa3e2dadf1..ffde7ed732 100644
--- a/meta/recipes-devtools/go/go-1.20.1.inc
+++ b/meta/recipes-devtools/go/go-1.20.1.inc
@@ -14,5 +14,6 @@ SRC_URI += "\
     file://0007-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
+    file://0010-cmd-compile-re-compile-instantiated-generic-methods-.patch \
 "
 SRC_URI[main.sha256sum] = "b5c1a3af52c385a6d1c76aed5361cf26459023980d0320de7658bae3915831a2"
diff --git a/meta/recipes-devtools/go/go/0010-cmd-compile-re-compile-instantiated-generic-methods-.patch b/meta/recipes-devtools/go/go/0010-cmd-compile-re-compile-instantiated-generic-methods-.patch
new file mode 100644
index 0000000000..f9ac202421
--- /dev/null
+++ b/meta/recipes-devtools/go/go/0010-cmd-compile-re-compile-instantiated-generic-methods-.patch
@@ -0,0 +1,90 @@
+From 7a3bb16b43efba73674629eae4369f9004e37f22 Mon Sep 17 00:00:00 2001
+From: Cuong Manh Le <cuong.manhle.vn@gmail.com>
+Date: Sat, 18 Mar 2023 00:53:07 +0700
+Subject: [PATCH] cmd/compile: re-compile instantiated generic methods in
+ linkshared mode
+
+For G[T] that was seen and compiled in imported package, it is not added
+to typecheck.Target.Decls, prevent wasting compile time re-creating
+DUPOKS symbols. However, the linker do not support a type symbol
+referencing a method symbol across DSO boundary. That causes unreachable
+sym error when building under -linkshared mode.
+
+To fix it, always re-compile generic methods in linkshared mode.
+
+Fixes #58966
+
+Change-Id: I894b417cfe8234ae1fe809cc975889345df22cef
+Reviewed-on: https://go-review.googlesource.com/c/go/+/477375
+Run-TryBot: Cuong Manh Le <cuong.manhle.vn@gmail.com>
+Reviewed-by: Cherry Mui <cherryyz@google.com>
+Reviewed-by: Matthew Dempsky <mdempsky@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/bcd82125f85c7c552493e863fa1bb14e6c444557]
+
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
+---
+ misc/cgo/testshared/shared_test.go              |  7 ++++++-
+ misc/cgo/testshared/testdata/issue58966/main.go | 15 +++++++++++++++
+ src/cmd/compile/internal/noder/unified.go       |  6 +++++-
+ 3 files changed, 26 insertions(+), 2 deletions(-)
+ create mode 100644 misc/cgo/testshared/testdata/issue58966/main.go
+
+diff --git a/misc/cgo/testshared/shared_test.go b/misc/cgo/testshared/shared_test.go
+index b14fb1cb3a..03da8f9435 100644
+--- a/misc/cgo/testshared/shared_test.go
++++ b/misc/cgo/testshared/shared_test.go
+@@ -1112,8 +1112,13 @@ func TestStd(t *testing.T) {
+ 		t.Skip("skip in short mode")
+ 	}
+ 	t.Parallel()
++	tmpDir := t.TempDir()
+ 	// Use a temporary pkgdir to not interfere with other tests, and not write to GOROOT.
+ 	// Cannot use goCmd as it runs with cloned GOROOT which is incomplete.
+ 	runWithEnv(t, "building std", []string{"GOROOT=" + oldGOROOT},
+-		filepath.Join(oldGOROOT, "bin", "go"), "install", "-buildmode=shared", "-pkgdir="+t.TempDir(), "std")
++		filepath.Join(oldGOROOT, "bin", "go"), "install", "-buildmode=shared", "-pkgdir="+tmpDir, "std")
++
++	// Issue #58966.
++	runWithEnv(t, "testing issue #58966", []string{"GOROOT=" + oldGOROOT},
++		filepath.Join(oldGOROOT, "bin", "go"), "run", "-linkshared", "-pkgdir="+tmpDir, "./issue58966/main.go")
+ }
+diff --git a/misc/cgo/testshared/testdata/issue58966/main.go b/misc/cgo/testshared/testdata/issue58966/main.go
+new file mode 100644
+index 0000000000..2d923c3607
+--- /dev/null
++++ b/misc/cgo/testshared/testdata/issue58966/main.go
+@@ -0,0 +1,15 @@
++// Copyright 2023 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++package main
++
++import "crypto/elliptic"
++
++var curve elliptic.Curve
++
++func main() {
++	switch curve {
++	case elliptic.P224():
++	}
++}
+diff --git a/src/cmd/compile/internal/noder/unified.go b/src/cmd/compile/internal/noder/unified.go
+index ed97a09302..25136e6aad 100644
+--- a/src/cmd/compile/internal/noder/unified.go
++++ b/src/cmd/compile/internal/noder/unified.go
+@@ -158,7 +158,11 @@ func readBodies(target *ir.Package, duringInlining bool) {
+ 			// Instantiated generic function: add to Decls for typechecking
+ 			// and compilation.
+ 			if fn.OClosure == nil && len(pri.dict.targs) != 0 {
+-				if duringInlining {
++				// cmd/link does not support a type symbol referencing a method symbol
++				// across DSO boundary, so force re-compiling methods on a generic type
++				// even it was seen from imported package in linkshared mode, see #58966.
++				canSkipNonGenericMethod := !(base.Ctxt.Flag_linkshared && ir.IsMethod(fn))
++				if duringInlining && canSkipNonGenericMethod {
+ 					inlDecls = append(inlDecls, fn)
+ 				} else {
+ 					target.Decls = append(target.Decls, fn)
-- 
2.34.1


