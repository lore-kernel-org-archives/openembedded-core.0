Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09063C77B73
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 11:35:55 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.6412.1684928148685645567
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 04:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XdtmC12X;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 75044FF802;
	Wed, 24 May 2023 11:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684928146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0E4PTIpoinM+7Usy5CHBmySzNh5BGFjyoUFhFxWDssY=;
	b=XdtmC12XY06rQdOGcQnsq/5CMnqW7BTzVEK3u1pN8DXrFQorArI9HK7jjU6vVpE4AYow/m
	a/9SwSaGi8lZ1zUkFRGdBPVa6aO2sKYEPt5wtQRBfnjNF6/jFR405U43M1GpfISXJtzlTr
	rWjNBsnFYEekszZS2oIDhhTP/mOlgN9Bulk11OGrfcJVrDl4/T8kH6Peme7bmMbXWwZ8ME
	ojy/BMGH90RH41wD6eX9+17KwUwdEccorgMD/bpdvLhjkurVGxxBgpzXhciTptueQMgKLm
	J9QQiJzfluypu635weESzZWTstwS/3eCV/Y5h5V8d/gxDhTNAMtRXLpM5MD0ZQ==
Date: Wed, 24 May 2023 13:35:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] go: Upgrade 1.20.1 -> 1.20.4
Message-ID: <20230524113546fe1a8b38@mail.local>
References: <20230523161713.882622-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230523161713.882622-1-raj.khem@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 11:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181670

Hello,

I believe it causes:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/7146/steps/11/logs/stdio

WARNING: go-1.20.4-r0 do_package_qa: QA Issue: go: ELF binary /usr/lib/go/bin/go has relocations in .text
go: ELF binary /usr/lib/go/pkg/tool/linux_386/pprof has relocations in .text
go: ELF binary /usr/lib/go/pkg/tool/linux_386/trace has relocations in .text [textrel]

On 23/05/2023 09:17:13-0700, Khem Raj wrote:
> - Remove already upstreamed patches
> 
> - Brings a list of changes [1] [2] [3]
> 
> [1] https://github.com/golang/go/issues?q=milestone%3AGo1.20.2+label%3ACherryPickApproved
> [2] https://github.com/golang/go/issues?q=milestone%3AGo1.20.3+label%3ACherryPickApproved
> [3] https://github.com/golang/go/issues?q=milestone%3AGo1.20.4+label%3ACherryPickApproved
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../go/{go-1.20.1.inc => go-1.20.4.inc}       |   5 +-
>  ...e_1.20.1.bb => go-binary-native_1.20.4.bb} |   6 +-
>  ..._1.20.1.bb => go-cross-canadian_1.20.4.bb} |   0
>  ...{go-cross_1.20.1.bb => go-cross_1.20.4.bb} |   0
>  ...osssdk_1.20.1.bb => go-crosssdk_1.20.4.bb} |   0
>  ...o-native_1.20.1.bb => go-native_1.20.4.bb} |   0
>  ...runtime_1.20.1.bb => go-runtime_1.20.4.bb} |   0
>  ...ompile-instantiated-generic-methods-.patch |  90 --------
>  .../go/go/CVE-2023-24532.patch                | 208 ------------------
>  .../go/go/CVE-2023-24537.patch                |  89 --------
>  .../go/{go_1.20.1.bb => go_1.20.4.bb}         |   0
>  11 files changed, 4 insertions(+), 394 deletions(-)
>  rename meta/recipes-devtools/go/{go-1.20.1.inc => go-1.20.4.inc} (77%)
>  rename meta/recipes-devtools/go/{go-binary-native_1.20.1.bb => go-binary-native_1.20.4.bb} (78%)
>  rename meta/recipes-devtools/go/{go-cross-canadian_1.20.1.bb => go-cross-canadian_1.20.4.bb} (100%)
>  rename meta/recipes-devtools/go/{go-cross_1.20.1.bb => go-cross_1.20.4.bb} (100%)
>  rename meta/recipes-devtools/go/{go-crosssdk_1.20.1.bb => go-crosssdk_1.20.4.bb} (100%)
>  rename meta/recipes-devtools/go/{go-native_1.20.1.bb => go-native_1.20.4.bb} (100%)
>  rename meta/recipes-devtools/go/{go-runtime_1.20.1.bb => go-runtime_1.20.4.bb} (100%)
>  delete mode 100644 meta/recipes-devtools/go/go/0010-cmd-compile-re-compile-instantiated-generic-methods-.patch
>  delete mode 100644 meta/recipes-devtools/go/go/CVE-2023-24532.patch
>  delete mode 100644 meta/recipes-devtools/go/go/CVE-2023-24537.patch
>  rename meta/recipes-devtools/go/{go_1.20.1.bb => go_1.20.4.bb} (100%)
> 
> diff --git a/meta/recipes-devtools/go/go-1.20.1.inc b/meta/recipes-devtools/go/go-1.20.4.inc
> similarity index 77%
> rename from meta/recipes-devtools/go/go-1.20.1.inc
> rename to meta/recipes-devtools/go/go-1.20.4.inc
> index 179f0e29ebf..05bc168e0cd 100644
> --- a/meta/recipes-devtools/go/go-1.20.1.inc
> +++ b/meta/recipes-devtools/go/go-1.20.4.inc
> @@ -14,8 +14,5 @@ SRC_URI += "\
>      file://0007-exec.go-do-not-write-linker-flags-into-buildids.patch \
>      file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
>      file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
> -    file://0010-cmd-compile-re-compile-instantiated-generic-methods-.patch \
> -    file://CVE-2023-24532.patch \
> -    file://CVE-2023-24537.patch \
>  "
> -SRC_URI[main.sha256sum] = "b5c1a3af52c385a6d1c76aed5361cf26459023980d0320de7658bae3915831a2"
> +SRC_URI[main.sha256sum] = "9f34ace128764b7a3a4b238b805856cc1b2184304df9e5690825b0710f4202d6"
> diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.1.bb b/meta/recipes-devtools/go/go-binary-native_1.20.4.bb
> similarity index 78%
> rename from meta/recipes-devtools/go/go-binary-native_1.20.1.bb
> rename to meta/recipes-devtools/go/go-binary-native_1.20.4.bb
> index 239334552ae..87ce8a558fc 100644
> --- a/meta/recipes-devtools/go/go-binary-native_1.20.1.bb
> +++ b/meta/recipes-devtools/go/go-binary-native_1.20.4.bb
> @@ -9,9 +9,9 @@ PROVIDES = "go-native"
>  
>  # Checksums available at https://go.dev/dl/
>  SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
> -SRC_URI[go_linux_amd64.sha256sum] = "000a5b1fca4f75895f78befeb2eecf10bfff3c428597f3f1e69133b63b911b02"
> -SRC_URI[go_linux_arm64.sha256sum] = "5e5e2926733595e6f3c5b5ad1089afac11c1490351855e87849d0e7702b1ec2e"
> -SRC_URI[go_linux_ppc64le.sha256sum] = "85cfd4b89b48c94030783b6e9e619e35557862358b846064636361421d0b0c52"
> +SRC_URI[go_linux_amd64.sha256sum] = "698ef3243972a51ddb4028e4a1ac63dc6d60821bf18e59a807e051fee0a385bd"
> +SRC_URI[go_linux_arm64.sha256sum] = "105889992ee4b1d40c7c108555222ca70ae43fccb42e20fbf1eebb822f5e72c6"
> +SRC_URI[go_linux_ppc64le.sha256sum] = "8c6f44b96c2719c90eebabe2dd866f9c39538648f7897a212cac448587e9a408"
>  
>  UPSTREAM_CHECK_URI = "https://golang.org/dl/"
>  UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
> diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.1.bb b/meta/recipes-devtools/go/go-cross-canadian_1.20.4.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross-canadian_1.20.1.bb
> rename to meta/recipes-devtools/go/go-cross-canadian_1.20.4.bb
> diff --git a/meta/recipes-devtools/go/go-cross_1.20.1.bb b/meta/recipes-devtools/go/go-cross_1.20.4.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross_1.20.1.bb
> rename to meta/recipes-devtools/go/go-cross_1.20.4.bb
> diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.1.bb b/meta/recipes-devtools/go/go-crosssdk_1.20.4.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-crosssdk_1.20.1.bb
> rename to meta/recipes-devtools/go/go-crosssdk_1.20.4.bb
> diff --git a/meta/recipes-devtools/go/go-native_1.20.1.bb b/meta/recipes-devtools/go/go-native_1.20.4.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-native_1.20.1.bb
> rename to meta/recipes-devtools/go/go-native_1.20.4.bb
> diff --git a/meta/recipes-devtools/go/go-runtime_1.20.1.bb b/meta/recipes-devtools/go/go-runtime_1.20.4.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-runtime_1.20.1.bb
> rename to meta/recipes-devtools/go/go-runtime_1.20.4.bb
> diff --git a/meta/recipes-devtools/go/go/0010-cmd-compile-re-compile-instantiated-generic-methods-.patch b/meta/recipes-devtools/go/go/0010-cmd-compile-re-compile-instantiated-generic-methods-.patch
> deleted file mode 100644
> index f9ac2024210..00000000000
> --- a/meta/recipes-devtools/go/go/0010-cmd-compile-re-compile-instantiated-generic-methods-.patch
> +++ /dev/null
> @@ -1,90 +0,0 @@
> -From 7a3bb16b43efba73674629eae4369f9004e37f22 Mon Sep 17 00:00:00 2001
> -From: Cuong Manh Le <cuong.manhle.vn@gmail.com>
> -Date: Sat, 18 Mar 2023 00:53:07 +0700
> -Subject: [PATCH] cmd/compile: re-compile instantiated generic methods in
> - linkshared mode
> -
> -For G[T] that was seen and compiled in imported package, it is not added
> -to typecheck.Target.Decls, prevent wasting compile time re-creating
> -DUPOKS symbols. However, the linker do not support a type symbol
> -referencing a method symbol across DSO boundary. That causes unreachable
> -sym error when building under -linkshared mode.
> -
> -To fix it, always re-compile generic methods in linkshared mode.
> -
> -Fixes #58966
> -
> -Change-Id: I894b417cfe8234ae1fe809cc975889345df22cef
> -Reviewed-on: https://go-review.googlesource.com/c/go/+/477375
> -Run-TryBot: Cuong Manh Le <cuong.manhle.vn@gmail.com>
> -Reviewed-by: Cherry Mui <cherryyz@google.com>
> -Reviewed-by: Matthew Dempsky <mdempsky@google.com>
> -TryBot-Result: Gopher Robot <gobot@golang.org>
> -
> -Upstream-Status: Backport [https://github.com/golang/go/commit/bcd82125f85c7c552493e863fa1bb14e6c444557]
> -
> -Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ----
> - misc/cgo/testshared/shared_test.go              |  7 ++++++-
> - misc/cgo/testshared/testdata/issue58966/main.go | 15 +++++++++++++++
> - src/cmd/compile/internal/noder/unified.go       |  6 +++++-
> - 3 files changed, 26 insertions(+), 2 deletions(-)
> - create mode 100644 misc/cgo/testshared/testdata/issue58966/main.go
> -
> -diff --git a/misc/cgo/testshared/shared_test.go b/misc/cgo/testshared/shared_test.go
> -index b14fb1cb3a..03da8f9435 100644
> ---- a/misc/cgo/testshared/shared_test.go
> -+++ b/misc/cgo/testshared/shared_test.go
> -@@ -1112,8 +1112,13 @@ func TestStd(t *testing.T) {
> - 		t.Skip("skip in short mode")
> - 	}
> - 	t.Parallel()
> -+	tmpDir := t.TempDir()
> - 	// Use a temporary pkgdir to not interfere with other tests, and not write to GOROOT.
> - 	// Cannot use goCmd as it runs with cloned GOROOT which is incomplete.
> - 	runWithEnv(t, "building std", []string{"GOROOT=" + oldGOROOT},
> --		filepath.Join(oldGOROOT, "bin", "go"), "install", "-buildmode=shared", "-pkgdir="+t.TempDir(), "std")
> -+		filepath.Join(oldGOROOT, "bin", "go"), "install", "-buildmode=shared", "-pkgdir="+tmpDir, "std")
> -+
> -+	// Issue #58966.
> -+	runWithEnv(t, "testing issue #58966", []string{"GOROOT=" + oldGOROOT},
> -+		filepath.Join(oldGOROOT, "bin", "go"), "run", "-linkshared", "-pkgdir="+tmpDir, "./issue58966/main.go")
> - }
> -diff --git a/misc/cgo/testshared/testdata/issue58966/main.go b/misc/cgo/testshared/testdata/issue58966/main.go
> -new file mode 100644
> -index 0000000000..2d923c3607
> ---- /dev/null
> -+++ b/misc/cgo/testshared/testdata/issue58966/main.go
> -@@ -0,0 +1,15 @@
> -+// Copyright 2023 The Go Authors. All rights reserved.
> -+// Use of this source code is governed by a BSD-style
> -+// license that can be found in the LICENSE file.
> -+
> -+package main
> -+
> -+import "crypto/elliptic"
> -+
> -+var curve elliptic.Curve
> -+
> -+func main() {
> -+	switch curve {
> -+	case elliptic.P224():
> -+	}
> -+}
> -diff --git a/src/cmd/compile/internal/noder/unified.go b/src/cmd/compile/internal/noder/unified.go
> -index ed97a09302..25136e6aad 100644
> ---- a/src/cmd/compile/internal/noder/unified.go
> -+++ b/src/cmd/compile/internal/noder/unified.go
> -@@ -158,7 +158,11 @@ func readBodies(target *ir.Package, duringInlining bool) {
> - 			// Instantiated generic function: add to Decls for typechecking
> - 			// and compilation.
> - 			if fn.OClosure == nil && len(pri.dict.targs) != 0 {
> --				if duringInlining {
> -+				// cmd/link does not support a type symbol referencing a method symbol
> -+				// across DSO boundary, so force re-compiling methods on a generic type
> -+				// even it was seen from imported package in linkshared mode, see #58966.
> -+				canSkipNonGenericMethod := !(base.Ctxt.Flag_linkshared && ir.IsMethod(fn))
> -+				if duringInlining && canSkipNonGenericMethod {
> - 					inlDecls = append(inlDecls, fn)
> - 				} else {
> - 					target.Decls = append(target.Decls, fn)
> diff --git a/meta/recipes-devtools/go/go/CVE-2023-24532.patch b/meta/recipes-devtools/go/go/CVE-2023-24532.patch
> deleted file mode 100644
> index 22f080dbd4b..00000000000
> --- a/meta/recipes-devtools/go/go/CVE-2023-24532.patch
> +++ /dev/null
> @@ -1,208 +0,0 @@
> -From 602eeaab387f24a4b28c5eccbb50fa934f3bc3c4 Mon Sep 17 00:00:00 2001
> -From: Filippo Valsorda <filippo@golang.org>
> -Date: Mon, 13 Feb 2023 15:16:27 +0100
> -Subject: [PATCH] [release-branch.go1.20] crypto/internal/nistec: reduce P-256
> - scalar
> -
> -Unlike the rest of nistec, the P-256 assembly doesn't use complete
> -addition formulas, meaning that p256PointAdd[Affine]Asm won't return the
> -correct value if the two inputs are equal.
> -
> -This was (undocumentedly) ignored in the scalar multiplication loops
> -because as long as the input point is not the identity and the scalar is
> -lower than the order of the group, the addition inputs can't be the same.
> -
> -As part of the math/big rewrite, we went however from always reducing
> -the scalar to only checking its length, under the incorrect assumption
> -that the scalar multiplication loop didn't require reduction.
> -
> -Added a reduction, and while at it added it in P256OrdInverse, too, to
> -enforce a universal reduction invariant on p256OrdElement values.
> -
> -Note that if the input point is the infinity, the code currently still
> -relies on undefined behavior, but that's easily tested to behave
> -acceptably, and will be addressed in a future CL.
> -
> -Updates #58647
> -Fixes #58720
> -Fixes CVE-2023-24532
> -
> -(Filed with the "safe APIs like complete addition formulas are good" dept.)
> -
> -Change-Id: I7b2c75238440e6852be2710fad66ff1fdc4e2b24
> -Reviewed-on: https://go-review.googlesource.com/c/go/+/471255
> -TryBot-Result: Gopher Robot <gobot@golang.org>
> -Reviewed-by: Roland Shoemaker <roland@golang.org>
> -Run-TryBot: Filippo Valsorda <filippo@golang.org>
> -Auto-Submit: Filippo Valsorda <filippo@golang.org>
> -Reviewed-by: Damien Neil <dneil@google.com>
> -(cherry picked from commit 203e59ad41bd288e1d92b6f617c2f55e70d3c8e3)
> -Reviewed-on: https://go-review.googlesource.com/c/go/+/471695
> -Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
> -Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
> -Reviewed-by: Filippo Valsorda <filippo@golang.org>
> -Run-TryBot: Roland Shoemaker <roland@golang.org>
> -
> -CVE: CVE-2023-24532
> -Upstream-Status: Backport [602eeaab387f24a4b28c5eccbb50fa934f3bc3c4]
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> ----
> - src/crypto/internal/nistec/nistec_test.go | 81 +++++++++++++++++++++++
> - src/crypto/internal/nistec/p256_asm.go    | 17 +++++
> - src/crypto/internal/nistec/p256_ordinv.go |  1 +
> - 3 files changed, 99 insertions(+)
> -
> -diff --git a/src/crypto/internal/nistec/nistec_test.go b/src/crypto/internal/nistec/nistec_test.go
> -index 309f68be16a9f..9103608c18a0f 100644
> ---- a/src/crypto/internal/nistec/nistec_test.go
> -+++ b/src/crypto/internal/nistec/nistec_test.go
> -@@ -8,6 +8,7 @@ import (
> - 	"bytes"
> - 	"crypto/elliptic"
> - 	"crypto/internal/nistec"
> -+	"fmt"
> - 	"internal/testenv"
> - 	"math/big"
> - 	"math/rand"
> -@@ -165,6 +166,86 @@ func testEquivalents[P nistPoint[P]](t *testing.T, newPoint func() P, c elliptic
> - 	}
> - }
> - 
> -+func TestScalarMult(t *testing.T) {
> -+	t.Run("P224", func(t *testing.T) {
> -+		testScalarMult(t, nistec.NewP224Point, elliptic.P224())
> -+	})
> -+	t.Run("P256", func(t *testing.T) {
> -+		testScalarMult(t, nistec.NewP256Point, elliptic.P256())
> -+	})
> -+	t.Run("P384", func(t *testing.T) {
> -+		testScalarMult(t, nistec.NewP384Point, elliptic.P384())
> -+	})
> -+	t.Run("P521", func(t *testing.T) {
> -+		testScalarMult(t, nistec.NewP521Point, elliptic.P521())
> -+	})
> -+}
> -+
> -+func testScalarMult[P nistPoint[P]](t *testing.T, newPoint func() P, c elliptic.Curve) {
> -+	G := newPoint().SetGenerator()
> -+	checkScalar := func(t *testing.T, scalar []byte) {
> -+		p1, err := newPoint().ScalarBaseMult(scalar)
> -+		fatalIfErr(t, err)
> -+		p2, err := newPoint().ScalarMult(G, scalar)
> -+		fatalIfErr(t, err)
> -+		if !bytes.Equal(p1.Bytes(), p2.Bytes()) {
> -+			t.Error("[k]G != ScalarBaseMult(k)")
> -+		}
> -+
> -+		d := new(big.Int).SetBytes(scalar)
> -+		d.Sub(c.Params().N, d)
> -+		d.Mod(d, c.Params().N)
> -+		g1, err := newPoint().ScalarBaseMult(d.FillBytes(make([]byte, len(scalar))))
> -+		fatalIfErr(t, err)
> -+		g1.Add(g1, p1)
> -+		if !bytes.Equal(g1.Bytes(), newPoint().Bytes()) {
> -+			t.Error("[N - k]G + [k]G != ∞")
> -+		}
> -+	}
> -+
> -+	byteLen := len(c.Params().N.Bytes())
> -+	bitLen := c.Params().N.BitLen()
> -+	t.Run("0", func(t *testing.T) { checkScalar(t, make([]byte, byteLen)) })
> -+	t.Run("1", func(t *testing.T) {
> -+		checkScalar(t, big.NewInt(1).FillBytes(make([]byte, byteLen)))
> -+	})
> -+	t.Run("N-1", func(t *testing.T) {
> -+		checkScalar(t, new(big.Int).Sub(c.Params().N, big.NewInt(1)).Bytes())
> -+	})
> -+	t.Run("N", func(t *testing.T) { checkScalar(t, c.Params().N.Bytes()) })
> -+	t.Run("N+1", func(t *testing.T) {
> -+		checkScalar(t, new(big.Int).Add(c.Params().N, big.NewInt(1)).Bytes())
> -+	})
> -+	t.Run("all1s", func(t *testing.T) {
> -+		s := new(big.Int).Lsh(big.NewInt(1), uint(bitLen))
> -+		s.Sub(s, big.NewInt(1))
> -+		checkScalar(t, s.Bytes())
> -+	})
> -+	if testing.Short() {
> -+		return
> -+	}
> -+	for i := 0; i < bitLen; i++ {
> -+		t.Run(fmt.Sprintf("1<<%d", i), func(t *testing.T) {
> -+			s := new(big.Int).Lsh(big.NewInt(1), uint(i))
> -+			checkScalar(t, s.FillBytes(make([]byte, byteLen)))
> -+		})
> -+	}
> -+	// Test N+1...N+32 since they risk overlapping with precomputed table values
> -+	// in the final additions.
> -+	for i := int64(2); i <= 32; i++ {
> -+		t.Run(fmt.Sprintf("N+%d", i), func(t *testing.T) {
> -+			checkScalar(t, new(big.Int).Add(c.Params().N, big.NewInt(i)).Bytes())
> -+		})
> -+	}
> -+}
> -+
> -+func fatalIfErr(t *testing.T, err error) {
> -+	t.Helper()
> -+	if err != nil {
> -+		t.Fatal(err)
> -+	}
> -+}
> -+
> - func BenchmarkScalarMult(b *testing.B) {
> - 	b.Run("P224", func(b *testing.B) {
> - 		benchmarkScalarMult(b, nistec.NewP224Point().SetGenerator(), 28)
> -diff --git a/src/crypto/internal/nistec/p256_asm.go b/src/crypto/internal/nistec/p256_asm.go
> -index 6ea161eb49953..99a22b833f028 100644
> ---- a/src/crypto/internal/nistec/p256_asm.go
> -+++ b/src/crypto/internal/nistec/p256_asm.go
> -@@ -364,6 +364,21 @@ func p256PointDoubleAsm(res, in *P256Point)
> - // Montgomery domain (with R 2²⁵⁶) as four uint64 limbs in little-endian order.
> - type p256OrdElement [4]uint64
> - 
> -+// p256OrdReduce ensures s is in the range [0, ord(G)-1].
> -+func p256OrdReduce(s *p256OrdElement) {
> -+	// Since 2 * ord(G) > 2²⁵⁶, we can just conditionally subtract ord(G),
> -+	// keeping the result if it doesn't underflow.
> -+	t0, b := bits.Sub64(s[0], 0xf3b9cac2fc632551, 0)
> -+	t1, b := bits.Sub64(s[1], 0xbce6faada7179e84, b)
> -+	t2, b := bits.Sub64(s[2], 0xffffffffffffffff, b)
> -+	t3, b := bits.Sub64(s[3], 0xffffffff00000000, b)
> -+	tMask := b - 1 // zero if subtraction underflowed
> -+	s[0] ^= (t0 ^ s[0]) & tMask
> -+	s[1] ^= (t1 ^ s[1]) & tMask
> -+	s[2] ^= (t2 ^ s[2]) & tMask
> -+	s[3] ^= (t3 ^ s[3]) & tMask
> -+}
> -+
> - // Add sets q = p1 + p2, and returns q. The points may overlap.
> - func (q *P256Point) Add(r1, r2 *P256Point) *P256Point {
> - 	var sum, double P256Point
> -@@ -393,6 +408,7 @@ func (r *P256Point) ScalarBaseMult(scalar []byte) (*P256Point, error) {
> - 	}
> - 	scalarReversed := new(p256OrdElement)
> - 	p256OrdBigToLittle(scalarReversed, (*[32]byte)(scalar))
> -+	p256OrdReduce(scalarReversed)
> - 
> - 	r.p256BaseMult(scalarReversed)
> - 	return r, nil
> -@@ -407,6 +423,7 @@ func (r *P256Point) ScalarMult(q *P256Point, scalar []byte) (*P256Point, error)
> - 	}
> - 	scalarReversed := new(p256OrdElement)
> - 	p256OrdBigToLittle(scalarReversed, (*[32]byte)(scalar))
> -+	p256OrdReduce(scalarReversed)
> - 
> - 	r.Set(q).p256ScalarMult(scalarReversed)
> - 	return r, nil
> -diff --git a/src/crypto/internal/nistec/p256_ordinv.go b/src/crypto/internal/nistec/p256_ordinv.go
> -index 86a7a230bdce8..1274fb7fd3f5c 100644
> ---- a/src/crypto/internal/nistec/p256_ordinv.go
> -+++ b/src/crypto/internal/nistec/p256_ordinv.go
> -@@ -25,6 +25,7 @@ func P256OrdInverse(k []byte) ([]byte, error) {
> - 
> - 	x := new(p256OrdElement)
> - 	p256OrdBigToLittle(x, (*[32]byte)(k))
> -+	p256OrdReduce(x)
> - 
> - 	// Inversion is implemented as exponentiation by n - 2, per Fermat's little theorem.
> - 	//
> diff --git a/meta/recipes-devtools/go/go/CVE-2023-24537.patch b/meta/recipes-devtools/go/go/CVE-2023-24537.patch
> deleted file mode 100644
> index 6b5dc2c8d9f..00000000000
> --- a/meta/recipes-devtools/go/go/CVE-2023-24537.patch
> +++ /dev/null
> @@ -1,89 +0,0 @@
> -From 110e4fb1c2e3a21631704bbfaf672230b9ba2492 Mon Sep 17 00:00:00 2001
> -From: Damien Neil <dneil@google.com>
> -Date: Wed, 22 Mar 2023 09:33:22 -0700
> -Subject: [PATCH] go/scanner: reject large line and column numbers in //line
> - directives
> -
> -Setting a large line or column number using a //line directive can cause
> -integer overflow even in small source files.
> -
> -Limit line and column numbers in //line directives to 2^30-1, which
> -is small enough to avoid int32 overflow on all reasonbly-sized files.
> -
> -For #59180
> -Fixes CVE-2023-24537
> -
> -Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1802456
> -Reviewed-by: Julie Qiu <julieqiu@google.com>
> -Reviewed-by: Roland Shoemaker <bracewell@google.com>
> -Run-TryBot: Damien Neil <dneil@google.com>
> -Change-Id: I149bf34deca532af7994203fa1e6aca3c890ea14
> -Reviewed-on: https://go-review.googlesource.com/c/go/+/482078
> -Reviewed-by: Matthew Dempsky <mdempsky@google.com>
> -TryBot-Bypass: Michael Knyszek <mknyszek@google.com>
> -Run-TryBot: Michael Knyszek <mknyszek@google.com>
> -Auto-Submit: Michael Knyszek <mknyszek@google.com>
> -
> -CVE: CVE-2023-24537
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> ----
> - src/go/parser/parser_test.go | 16 ++++++++++++++++
> - src/go/scanner/scanner.go    |  7 +++++--
> - 2 files changed, 21 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/go/parser/parser_test.go b/src/go/parser/parser_test.go
> -index 153562df75068..22b11a0cc4535 100644
> ---- a/src/go/parser/parser_test.go
> -+++ b/src/go/parser/parser_test.go
> -@@ -764,3 +764,19 @@ func TestRangePos(t *testing.T) {
> - 		})
> - 	}
> - }
> -+
> -+// TestIssue59180 tests that line number overflow doesn't cause an infinite loop.
> -+func TestIssue59180(t *testing.T) {
> -+	testcases := []string{
> -+		"package p\n//line :9223372036854775806\n\n//",
> -+		"package p\n//line :1:9223372036854775806\n\n//",
> -+		"package p\n//line file:9223372036854775806\n\n//",
> -+	}
> -+
> -+	for _, src := range testcases {
> -+		_, err := ParseFile(token.NewFileSet(), "", src, ParseComments)
> -+		if err == nil {
> -+			t.Errorf("ParseFile(%s) succeeded unexpectedly", src)
> -+		}
> -+	}
> -+}
> -diff --git a/src/go/scanner/scanner.go b/src/go/scanner/scanner.go
> -index 16958d22ce299..0cd9f5901d0bb 100644
> ---- a/src/go/scanner/scanner.go
> -+++ b/src/go/scanner/scanner.go
> -@@ -253,13 +253,16 @@ func (s *Scanner) updateLineInfo(next, offs int, text []byte) {
> - 		return
> - 	}
> - 
> -+	// Put a cap on the maximum size of line and column numbers.
> -+	// 30 bits allows for some additional space before wrapping an int32.
> -+	const maxLineCol = 1<<30 - 1
> - 	var line, col int
> - 	i2, n2, ok2 := trailingDigits(text[:i-1])
> - 	if ok2 {
> - 		//line filename:line:col
> - 		i, i2 = i2, i
> - 		line, col = n2, n
> --		if col == 0 {
> -+		if col == 0 || col > maxLineCol {
> - 			s.error(offs+i2, "invalid column number: "+string(text[i2:]))
> - 			return
> - 		}
> -@@ -269,7 +272,7 @@ func (s *Scanner) updateLineInfo(next, offs int, text []byte) {
> - 		line = n
> - 	}
> - 
> --	if line == 0 {
> -+	if line == 0 || line > maxLineCol {
> - 		s.error(offs+i, "invalid line number: "+string(text[i:]))
> - 		return
> - 	}
> diff --git a/meta/recipes-devtools/go/go_1.20.1.bb b/meta/recipes-devtools/go/go_1.20.4.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go_1.20.1.bb
> rename to meta/recipes-devtools/go/go_1.20.4.bb
> -- 
> 2.40.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181646): https://lists.openembedded.org/g/openembedded-core/message/181646
> Mute This Topic: https://lists.openembedded.org/mt/99090774/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

