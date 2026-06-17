Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970DECD98EE
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:39 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10213.1781682329657911416
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=A0qcKthj;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4602e2a0372so4246785f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682328; x=1782287128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gg3ggG3/FRbuRvavia1XyuQgM+QuwewXewdqZodRjI0=;
        b=A0qcKthj1wNluiQbzQxE98Qqc3taMKd+y6594FCxXwPkekanoeuyK7PoYwCGf8Dzoj
         XGR40xQ6fl5Zlo8/wfYsmrwhxguZNvvQS+nJgogI4EBcGmAi8XKeQm1hZbccQl/mBCUS
         budEIeR/pa9IE4OW1VdY/nd+jLYVaDj62w99A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682328; x=1782287128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gg3ggG3/FRbuRvavia1XyuQgM+QuwewXewdqZodRjI0=;
        b=r5hMgdANo3xSzLMTfVvvM2j89HW2yrYYwZ+HkPqNk6wrCxzKHO/k8X+wD26s/u6zyl
         sdRiaEP713tlX0BW6Ju135DIC155s9orE4ROkyb+y/DqDCur6xckiSA/u0PpkjQwPmL5
         42CgCIVrCls0ZSUee5VMWDkBOA10C2om+n9a0ZpZR6OM3HXZmXz9lfrrgYzXo22oYFGG
         N52u/ybGEq+qgax83xiDhm5QMQ8c7Is+TsF988a+pSC+PeDx2myTlUNq7VbWsIx4XVJ3
         wEMEDDv4SUbGTkYjvYDBOOiVzRVxC+42b0BCkw1oqGeiC3GnmALSw85dtyIrbQwQcGGT
         AwlA==
X-Gm-Message-State: AOJu0YwPn+muGjhfOoFvGbDAgD0itm6xl4O9m2S4/nuv7DUYia4Eq4kY
	KLNaVDN3KOkH0AIr4M3Ke2s0h3mQJwrSafOmjuI3uy9UjoQlT4kkrUpYD8G4k4LpI5L4el769sp
	q0d8o
X-Gm-Gg: AfdE7ckOVAqvDCMe+CpyZ0/EPonZdqafJh9nztjFRqRWx0M3MbBRY0M3XqmEWILdXJe
	m45Xk4yr9GLyLSyx+rLKnZUGf/LK+YURueQPzfjp40BR6fC/ax4iJUd21764Whly8pUi7odeqG7
	hVJBWIDIGYYVIDo1y34u0biwScfWn37Ljza3s6Uj8ysSg26NmalLLymirf7PoAYkiy0BsIbG/bF
	ZUZltM/LPL1XlBcSRbakDzh/odui9h6MaVF/ojMyxsY2H7kl3DukLPVwsX2L0RW0x01APYDDV71
	Z4b6vGp7Kig5eZMEFdNfxP8IR8AUtjRuHH9bSndy0ZHJXV1yfswbL+tuNvICaBR8E7dWdniPkIo
	NaJqzFGkwkefbEWP+vPY7vFPzms/OmVF0iGE5+w0Qzk2GVG/okVfX7HL1lbm0aFdzTfWiibjQTq
	KyTIaYsSZR3M+X8wyZfx8PbS3WAaGbjpfFLYJxES9i2eychAW5HIfXnRKmelpqzGkHKM6wLfo3Y
	vtQIG0NQ1nt66z1hw==
X-Received: by 2002:a05:6000:40d8:b0:460:38ee:9469 with SMTP id ffacd0b85a97d-4623ea375a2mr3870683f8f.7.1781682327774;
        Wed, 17 Jun 2026 00:45:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/30] go 1.22.12: fix CVE-2026-27143, CVE-2026-27144
Date: Wed, 17 Jun 2026 09:44:38 +0200
Message-ID: <c4273fecc42ab643eea036651c79d968f0caaafd.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238985

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] & [2] also mentioned at Debian report in [3] & [4]

[1] https://github.com/golang/go/commit/7d2dd3488cdfbddda14c18c455d3263df75a46fc
[2] https://github.com/golang/go/commit/72cc33629a3b26e68f6e6e5564618a1d763896f3
[3] https://security-tracker.debian.org/tracker/CVE-2026-27143
[4] https://security-tracker.debian.org/tracker/CVE-2026-27144

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   2 +
 .../go/go/CVE-2026-27143.patch                | 165 ++++++++++++++++++
 .../go/go/CVE-2026-27144.patch                | 125 +++++++++++++
 3 files changed, 292 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-27143.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-27144.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 46d75d13b21..7016acd0616 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -43,6 +43,8 @@ SRC_URI += "\
     file://CVE-2025-68121_p3.patch \
     file://CVE-2026-27140.patch \
     file://CVE-2026-27142.patch \
+    file://CVE-2026-27143.patch \
+    file://CVE-2026-27144.patch \
     file://CVE-2026-32280.patch \
     file://CVE-2026-32283.patch \
     file://CVE-2026-32289.patch \
diff --git a/meta/recipes-devtools/go/go/CVE-2026-27143.patch b/meta/recipes-devtools/go/go/CVE-2026-27143.patch
new file mode 100644
index 00000000000..99e7f7639ec
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-27143.patch
@@ -0,0 +1,165 @@
+From 7d2dd3488cdfbddda14c18c455d3263df75a46fc Mon Sep 17 00:00:00 2001
+From: Junyang Shao <shaojunyang@google.com>
+Date: Fri, 6 Mar 2026 00:03:45 +0000
+Subject: [PATCH] [release-branch.go1.25] cmd/compile: fix loopbce overflow
+ check logic
+
+addWillOverflow and subWillOverflow has an implicit assumption that y is
+positive, using it outside of addU and subU is really incorrect. This CL
+fixes those incorrect usage to use the correct logic in place.
+
+Thanks to Jakub Ciolek for reporting this issue.
+
+Fixes #78333
+Fixes CVE-2026-27143
+
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3700
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Change-Id: I263e8e7ac227e2a68109eb7bbd45f66569ed22ec
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3987
+Commit-Queue: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/763553
+Reviewed-by: David Chase <drchase@google.com>
+Auto-Submit: Gopher Robot <gobot@golang.org>
+TryBot-Bypass: Gopher Robot <gobot@golang.org>
+Reviewed-by: Junyang Shao <shaojunyang@google.com>
+
+CVE: CVE-2026-27143
+Upstream-Status: Backport [https://github.com/golang/go/commit/7d2dd3488cdfbddda14c18c455d3263df75a46fc]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/cmd/compile/internal/ssa/loopbce.go | 36 +++++++++++++++++--------
+ test/loopbce.go                         | 28 +++++++++++++++++++
+ 2 files changed, 53 insertions(+), 11 deletions(-)
+
+diff --git a/src/cmd/compile/internal/ssa/loopbce.go b/src/cmd/compile/internal/ssa/loopbce.go
+index dd1f39d..1b3e567 100644
+--- a/src/cmd/compile/internal/ssa/loopbce.go
++++ b/src/cmd/compile/internal/ssa/loopbce.go
+@@ -204,9 +204,11 @@ func findIndVar(f *Func) []indVar {
+ 						if init.AuxInt > v {
+ 							return false
+ 						}
++						// TODO(1.27): investigate passing a smaller-magnitude overflow limit to addU
++						// for addWillOverflow.
+ 						v = addU(init.AuxInt, diff(v, init.AuxInt)/uint64(step)*uint64(step))
+ 					}
+-					if addWillOverflow(v, step) {
++					if addWillOverflow(v, step, maxSignedValue(ind.Type)) {
+ 						return false
+ 					}
+ 					if inclusive && v != limit.AuxInt || !inclusive && v+1 != limit.AuxInt {
+@@ -235,7 +237,7 @@ func findIndVar(f *Func) []indVar {
+ 				// ind < knn - k cannot overflow if step is at most k+1
+ 				return step <= k+1 && k != maxSignedValue(limit.Type)
+ 			} else { // step < 0
+-				if limit.Op == OpConst64 {
++				if limit.isGenericIntConst() {
+ 					// Figure out the actual smallest value.
+ 					v := limit.AuxInt
+ 					if !inclusive {
+@@ -249,9 +251,11 @@ func findIndVar(f *Func) []indVar {
+ 						if init.AuxInt < v {
+ 							return false
+ 						}
++						// TODO(1.27): investigate passing a smaller-magnitude underflow limit to subU
++						// for subWillUnderflow.
+ 						v = subU(init.AuxInt, diff(init.AuxInt, v)/uint64(-step)*uint64(-step))
+ 					}
+-					if subWillUnderflow(v, -step) {
++					if subWillUnderflow(v, -step, minSignedValue(ind.Type)) {
+ 						return false
+ 					}
+ 					if inclusive && v != limit.AuxInt || !inclusive && v-1 != limit.AuxInt {
+@@ -313,14 +317,22 @@ func findIndVar(f *Func) []indVar {
+ 	return iv
+ }
+ 
+-// addWillOverflow reports whether x+y would result in a value more than maxint.
+-func addWillOverflow(x, y int64) bool {
+-	return x+y < x
++// subWillUnderflow checks if x - y underflows the min value.
++// y must be positive.
++func subWillUnderflow(x, y int64, min int64) bool {
++	if y < 0 {
++		base.Fatalf("expecting positive value")
++	}
++	return x < min+y
+ }
+ 
+-// subWillUnderflow reports whether x-y would result in a value less than minint.
+-func subWillUnderflow(x, y int64) bool {
+-	return x-y > x
++// addWillOverflow checks if x + y overflows the max value.
++// y must be positive.
++func addWillOverflow(x, y int64, max int64) bool {
++	if y < 0 {
++		base.Fatalf("expecting positive value")
++	}
++	return x > max-y
+ }
+ 
+ // diff returns x-y as a uint64. Requires x>=y.
+@@ -341,7 +353,8 @@ func addU(x int64, y uint64) int64 {
+ 		x += 1
+ 		y -= 1 << 63
+ 	}
+-	if addWillOverflow(x, int64(y)) {
++	// TODO(1.27): investigate passing a smaller-magnitude overflow limit in here.
++	if addWillOverflow(x, int64(y), maxSignedValue(types.Types[types.TINT64])) {
+ 		base.Fatalf("addU overflowed %d + %d", x, y)
+ 	}
+ 	return x + int64(y)
+@@ -357,7 +370,8 @@ func subU(x int64, y uint64) int64 {
+ 		x -= 1
+ 		y -= 1 << 63
+ 	}
+-	if subWillUnderflow(x, int64(y)) {
++	// TODO(1.27): investigate passing a smaller-magnitude underflow limit in here.
++	if subWillUnderflow(x, int64(y), minSignedValue(types.Types[types.TINT64])) {
+ 		base.Fatalf("subU underflowed %d - %d", x, y)
+ 	}
+ 	return x - int64(y)
+diff --git a/test/loopbce.go b/test/loopbce.go
+index 04c186b..a4b101b 100644
+--- a/test/loopbce.go
++++ b/test/loopbce.go
+@@ -466,6 +466,34 @@ func stride2(x *[7]int) int {
+ 	return s
+ }
+ 
++// This loop should not be proved anything.
++func smallIntUp(arr *[128]int) {
++	for i := int8(0); i <= int8(120); i += int8(10) {
++		arr[i] = int(i)
++	}
++}
++
++// This loop should not be proved anything.
++func smallIntDown(arr *[128]int) {
++	for i := int8(0); i >= int8(-120); i -= int8(10) {
++		arr[127+i] = int(i)
++	}
++}
++
++// This loop should not be proved anything.
++func smallUintUp(arr *[128]int) {
++	for i := uint8(0); i <= uint8(250); i += uint8(10) {
++		arr[i] = int(i)
++	}
++}
++
++// This loop should not be proved anything.
++func smallUintDown(arr *[128]int) {
++	for i := uint8(255); i >= uint8(0); i -= uint8(10) {
++		arr[127+i] = int(i)
++	}
++}
++
+ //go:noinline
+ func useString(a string) {
+ }
+-- 
+2.50.1
+
diff --git a/meta/recipes-devtools/go/go/CVE-2026-27144.patch b/meta/recipes-devtools/go/go/CVE-2026-27144.patch
new file mode 100644
index 00000000000..3f791ea4918
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-27144.patch
@@ -0,0 +1,125 @@
+From 72cc33629a3b26e68f6e6e5564618a1d763896f3 Mon Sep 17 00:00:00 2001
+From: Junyang Shao <shaojunyang@google.com>
+Date: Thu, 12 Mar 2026 21:36:33 +0000
+Subject: [PATCH] [release-branch.go1.25] cmd/compile: fix mem access overlap
+ detection
+
+When a no-op interface conversion is wrapped around the rhs of an
+assignment, the memory overlap detection logic in the compiler failed to
+peel down conversion to see the actual pointer, causing an incorrect
+no-overlapping determination.
+
+Thanks to Jakub Ciolek for reporting this issue.
+
+
+Fixes #78371
+Fixes CVE-2026-27144
+
+Change-Id: I55ff0806b099e1447bdbfba7fde6c6597db5d65c
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3780
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/4002
+Reviewed-on: https://go-review.googlesource.com/c/go/+/763552
+Auto-Submit: Gopher Robot <gobot@golang.org>
+TryBot-Bypass: Gopher Robot <gobot@golang.org>
+Reviewed-by: Junyang Shao <shaojunyang@google.com>
+Reviewed-by: David Chase <drchase@google.com>
+
+CVE: CVE-2026-27144
+Upstream-Status: Backport [https://github.com/golang/go/commit/72cc33629a3b26e68f6e6e5564618a1d763896f3]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/cmd/compile/internal/ssagen/ssa.go        | 20 ++++++---
+ .../compile/internal/test/memoverlap_test.go  | 41 +++++++++++++++++++
+ 2 files changed, 55 insertions(+), 6 deletions(-)
+ create mode 100644 src/cmd/compile/internal/test/memoverlap_test.go
+
+diff --git a/src/cmd/compile/internal/ssagen/ssa.go b/src/cmd/compile/internal/ssagen/ssa.go
+index c794d6f..0214621 100644
+--- a/src/cmd/compile/internal/ssagen/ssa.go
++++ b/src/cmd/compile/internal/ssagen/ssa.go
+@@ -1427,6 +1427,16 @@ func (s *state) stmtList(l ir.Nodes) {
+ 	}
+ }
+ 
++func peelConvNop(n ir.Node) ir.Node {
++	if n == nil {
++		return n
++	}
++	for n.Op() == ir.OCONVNOP {
++		n = n.(*ir.ConvExpr).X
++	}
++	return n
++}
++
+ // stmt converts the statement n to SSA and adds it to s.
+ func (s *state) stmt(n ir.Node) {
+ 	s.pushLine(n.Pos())
+@@ -1598,12 +1608,10 @@ func (s *state) stmt(n ir.Node) {
+ 		// arrays referenced are strictly smaller parts of the same base array.
+ 		// If one side of the assignment is a full array, then partial overlap
+ 		// can't happen. (The arrays are either disjoint or identical.)
+-		mayOverlap := n.X.Op() == ir.ODEREF && (n.Y != nil && n.Y.Op() == ir.ODEREF)
+-		if n.Y != nil && n.Y.Op() == ir.ODEREF {
+-			p := n.Y.(*ir.StarExpr).X
+-			for p.Op() == ir.OCONVNOP {
+-				p = p.(*ir.ConvExpr).X
+-			}
++		ny := peelConvNop(n.Y)
++		mayOverlap := n.X.Op() == ir.ODEREF && (n.Y != nil && ny.Op() == ir.ODEREF)
++		if ny != nil && ny.Op() == ir.ODEREF {
++			p := peelConvNop(ny.(*ir.StarExpr).X)
+ 			if p.Op() == ir.OSPTR && p.(*ir.UnaryExpr).X.Type().IsString() {
+ 				// Pointer fields of strings point to unmodifiable memory.
+ 				// That memory can't overlap with the memory being written.
+diff --git a/src/cmd/compile/internal/test/memoverlap_test.go b/src/cmd/compile/internal/test/memoverlap_test.go
+new file mode 100644
+index 0000000..c53288e
+--- /dev/null
++++ b/src/cmd/compile/internal/test/memoverlap_test.go
+@@ -0,0 +1,41 @@
++// Copyright 2026 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++package test
++
++import "testing"
++
++const arrFooSize = 96
++
++type arrFoo [arrFooSize]int
++
++//go:noinline
++func badCopy(dst, src []int) {
++	p := (*[arrFooSize]int)(dst[:arrFooSize])
++	q := (*[arrFooSize]int)(src[:arrFooSize])
++	*p = arrFoo(*q)
++}
++
++//go:noinline
++func goodCopy(dst, src []int) {
++	p := (*[arrFooSize]int)(dst[:arrFooSize])
++	q := (*[arrFooSize]int)(src[:arrFooSize])
++	*p = *q
++}
++
++func TestOverlapedMoveWithNoopIConv(t *testing.T) {
++	h1 := make([]int, arrFooSize+1)
++	h2 := make([]int, arrFooSize+1)
++	for i := range arrFooSize + 1 {
++		h1[i] = i
++		h2[i] = i
++	}
++	badCopy(h1[1:], h1[:arrFooSize])
++	goodCopy(h2[1:], h2[:arrFooSize])
++	for i := range arrFooSize + 1 {
++		if h1[i] != h2[i] {
++			t.Errorf("h1 and h2 differ at index %d, expect them to be the same", i)
++		}
++	}
++}
+-- 
+2.50.1
+

