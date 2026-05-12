Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02939CD4F26
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 07:21:23 +0000 (UTC)
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70325.1778570475270826709
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 00:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ShF8swVJ;
 spf=pass (domain: mvista.com, ip: 74.125.82.47, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1334825de43so431427c88.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 00:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1778570474; x=1779175274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ed8VOwN+HdnhRtaPn7OVlzPp7qQBEpBCwq/dcv5lTWk=;
        b=ShF8swVJlQSgldQWDW4FYStaV8lDg2YcPlqncz96nAJGRktCOtm/ZMpTjC4KkeJIz7
         TFy0T7z4MFNxPsgP2otrYpIWMi57Y5KlBeruGb89zah5f31MHjGpt8HoORlfjgl0OOSQ
         SCEsV7QgXppEfBP7yR7SjyQwyOSABqFJME4so=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778570474; x=1779175274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ed8VOwN+HdnhRtaPn7OVlzPp7qQBEpBCwq/dcv5lTWk=;
        b=hIfg4/EsXo6GdDIbNDkrwiSO1vQrnAXsqD2T62qT8E0RqgyveE68NHI5+baoeP+Y4r
         SGPTRN5rlslNvciI1Mi4dRSLQqYvxx8XiUrTkFJd5v/xx1CXPOVkDYA5OZ08+RUYb+Xd
         wBVCCB9roQbc0r95qpMHo4p16Yx6goMJW4TlrZyOvjY9zHYkNYO7fQdhUH2nPO29AJhh
         QKTs9awRi5NKJxwxERGgOQ78sz0TEm1I6e60T3UillortGpRyJz6JSoFG15BS+dmy/Ez
         kFs4oqhkGVrfUC8XCvMUHgu2arLYeVD9gnBGlu6eo+qedOmw/eB8weBOeIwZJ2iTEjM4
         3O5w==
X-Gm-Message-State: AOJu0YxKmOK8Uv9mcE9KTWV3XIRdHyhrYqnun5GfYom67rXaQjR0pTbr
	otSGr3VU3AQ0dVFZFG+kZXpFFMk7j0Kd4cBZ/Zs322+rFRTSYMBqYYSRHqFnKLN5yS/iYO+TrJx
	H4+1jpvM=
X-Gm-Gg: Acq92OGGeIutkypuLwziFdXOlT1/tz3Mo6TV6x7nZBazjM1fR1inSADlP+FwOGWIZpW
	2wPKBRKbPnir3W09RYajXAVf8492XSvixJtUfv0Rnqdc6wwX9551zeiiLpmAWoGYe+WKDAjOz5t
	V3NXya3c1kflvkBq/6RcHrnvEdcycnR++5hcceq1OTtZ/+hbK9dBlgV55+bM6s7dtpC55kQtvW4
	Fa4e9uslUwuSylgtJ5kwIjU8nbCT0J1Svrwj2cvYaJ5nbmLGYcCvOYUir9blqDXvdqvHx/OeQu9
	t3f29MTyDt8zxRFpGVys9U/tnkfsP4yIPbgRc5SCzbkVDLPR+eauhPHhSeabGzforfoIgrMIX6k
	5WRje/+RmYjyc9CYio9rotW6QOu6CV8W5cY6rYLOiE8qASWXKEAUZxl/9hIN7jVN0ly5lfoRmzy
	5rqIu7KaDKb8c0/VVsNOsbiycCA0li3oPc95MV
X-Received: by 2002:a05:7022:45a2:b0:12a:b932:81d3 with SMTP id a92af1059eb24-132a83f746dmr6472279c88.26.1778570474248;
        Tue, 12 May 2026 00:21:14 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.207])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327865a1a4sm17917845c88.10.2026.05.12.00.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:21:13 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] go 1.22.12: fix CVE-2026-27143, CVE-2026-27144
Date: Tue, 12 May 2026 12:51:06 +0530
Message-ID: <20260512072106.82626-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 07:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236853

Pick patch from [1] & [2] also mentioned at Debian report in [3] & [4]

[1] https://github.com/golang/go/commit/7d2dd3488cdfbddda14c18c455d3263df75a46fc
[2] https://github.com/golang/go/commit/72cc33629a3b26e68f6e6e5564618a1d763896f3
[3] https://security-tracker.debian.org/tracker/CVE-2026-27143
[4] https://security-tracker.debian.org/tracker/CVE-2026-27144

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   2 +
 .../go/go/CVE-2026-27143.patch                | 165 ++++++++++++++++++
 .../go/go/CVE-2026-27144.patch                | 125 +++++++++++++
 3 files changed, 292 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-27143.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-27144.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 7ece9095ff..03437f0358 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -42,6 +42,8 @@ SRC_URI += "\
     file://CVE-2025-68121_p2.patch \
     file://CVE-2025-68121_p3.patch \
     file://CVE-2026-27140.patch \
+    file://CVE-2026-27143.patch \
+    file://CVE-2026-27144.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-27143.patch b/meta/recipes-devtools/go/go/CVE-2026-27143.patch
new file mode 100644
index 0000000000..99e7f7639e
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
index 0000000000..3f791ea491
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
-- 
2.50.1


