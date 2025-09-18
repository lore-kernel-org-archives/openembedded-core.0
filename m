Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB98BCAC5AA
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 21:49:21 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.1109.1758232156405290038
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 14:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=R6J53UkX;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58ILn6HL098360;
	Thu, 18 Sep 2025 16:49:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758232146;
	bh=S2DW6esWu/oRavxcU/tdPF0C3hsU0/Hx1EEb76tnE0I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=R6J53UkXkCWMqqihsujXguJin599kknQ/nSKu8Z+roNAKKuh4R7mo/lOsL9mWaF/G
	 2YWdhArP05faeJR0eYhPxlmXzp05RjRZJx2V3Yhvc8tE64p6aalZRLkYULkrwrdqxc
	 AdGwwUJZ9G05IVWajSDvLkiDzJFpantha+otJ200=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58ILn65F3451048
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 18 Sep 2025 16:49:06 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 16:49:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 16:49:06 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58ILn6Hj1525808;
	Thu, 18 Sep 2025 16:49:06 -0500
From: <rs@ti.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
CC: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv9 2/6] go: fix sigaction usage on i386 platforms
Date: Thu, 18 Sep 2025 16:48:57 -0500
Message-ID: <20250918214903.341452-3-rs@ti.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918214903.341452-1-rs@ti.com>
References: <20250918214903.341452-1-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 58ILn6HL098360
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 21:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223697

From: Randolph Sapp <rs@ti.com>

In upstream the following commit [1] was submitted to resolve issues
with sigaction being used in linked libraries with cgo applications.

runtime: when using cgo on 386, call C sigaction function

This should address the previously reported issues with pam
authentication of go applications on related x86 platforms.

[1] https://github.com/golang/go/commit/c5737dc21bbac9fbefc35ac9313e66291=
d66b382

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta/recipes-devtools/go/go-1.25.0.inc        |   1 +
 ...ng-cgo-on-386-call-C-sigaction-funct.patch | 248 ++++++++++++++++++
 2 files changed, 249 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/0001-runtime-when-using-c=
go-on-386-call-C-sigaction-funct.patch

diff --git a/meta/recipes-devtools/go/go-1.25.0.inc b/meta/recipes-devtoo=
ls/go/go-1.25.0.inc
index f562fbb34b..1558b4623d 100644
--- a/meta/recipes-devtools/go/go-1.25.0.inc
+++ b/meta/recipes-devtools/go/go-1.25.0.inc
@@ -16,5 +16,6 @@ SRC_URI +=3D "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.pat=
ch \
     file://0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.pat=
ch \
+    file://0001-runtime-when-using-cgo-on-386-call-C-sigaction-funct.pat=
ch \
 "
 SRC_URI[main.sha256sum] =3D "4bd01e91297207bfa450ea40d4d5a93b1b531a5e438=
473b2a06e18e077227225"
diff --git a/meta/recipes-devtools/go/go/0001-runtime-when-using-cgo-on-3=
86-call-C-sigaction-funct.patch b/meta/recipes-devtools/go/go/0001-runtim=
e-when-using-cgo-on-386-call-C-sigaction-funct.patch
new file mode 100644
index 0000000000..33e3b033a1
--- /dev/null
+++ b/meta/recipes-devtools/go/go/0001-runtime-when-using-cgo-on-386-call=
-C-sigaction-funct.patch
@@ -0,0 +1,248 @@
+From c5737dc21bbac9fbefc35ac9313e66291d66b382 Mon Sep 17 00:00:00 2001
+From: Ian Lance Taylor <iant@golang.org>
+Date: Fri, 5 Sep 2025 22:24:37 -0700
+Subject: [PATCH] runtime: when using cgo on 386, call C sigaction functi=
on
+
+On 386 the C sigaction function assumes that the caller does not set
+the SA_RESTORER flag. It does not copy the C sa_restorer field to
+the kernel sa_restorer field. The effect is that the kernel sees
+the SA_RESTORER flag but a NULL sa_restorer field, and the program
+crashes when returning from a signal handler.
+
+On the other hand, the C sigaction function will return the SA_RESTORER
+flag and the sa_restorer field stored in the kernel.
+
+This means that if the Go runtime installs a signal handler,
+with SA_RESTORER as is required when calling the kernel,
+and the Go program calls C code that calls the C sigaction function
+to query the current signal handler, that C code will get a result
+that it can't pass back to sigaction.
+
+This CL fixes the problem by using the C sigaction function
+for 386 programs that use cgo. This reuses the functionality
+used on amd64 and other GOARCHs to support the race detector.
+
+See #75253, or runtime/testdata/testprogcgo/eintr.go, for sample
+code that used to fail on 386. No new test case is required,
+we just remove the skip we used to have for eintr.go.
+
+Fixes #75253
+
+Change-Id: I803059b1fb9e09e9fbb43f68eccb6a59a92c2991
+Reviewed-on: https://go-review.googlesource.com/c/go/+/701375
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gse=
rviceaccount.com>
+Reviewed-by: Cherry Mui <cherryyz@google.com>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Auto-Submit: Ian Lance Taylor <iant@golang.org>
+Upstream-Status: Backport [https://github.com/golang/go/commit/c5737dc21=
bbac9fbefc35ac9313e66291d66b382]
+Signed-off-by: Randolph Sapp <rs@ti.com>
+---
+ src/runtime/cgo/gcc_sigaction.c |  8 ++++----
+ src/runtime/cgo/sigaction.go    |  2 +-
+ src/runtime/cgo_sigaction.go    |  6 +++++-
+ src/runtime/crash_cgo_test.go   | 11 -----------
+ src/runtime/os_freebsd.go       |  6 ++++++
+ src/runtime/os_linux.go         | 18 +++++++++++++++++-
+ src/runtime/sigaction.go        |  2 +-
+ src/runtime/sys_linux_386.s     | 19 +++++++++++++++++++
+ 8 files changed, 53 insertions(+), 19 deletions(-)
+
+diff --git a/src/runtime/cgo/gcc_sigaction.c b/src/runtime/cgo/gcc_sigac=
tion.c
+index 7cbef7db11..ad48a88dc1 100644
+--- a/src/runtime/cgo/gcc_sigaction.c
++++ b/src/runtime/cgo/gcc_sigaction.c
+@@ -2,7 +2,7 @@
+ // Use of this source code is governed by a BSD-style
+ // license that can be found in the LICENSE file.
+=20
+-//go:build linux && (amd64 || arm64 || loong64 || ppc64le)
++//go:build linux && (386 || amd64 || arm64 || loong64 || ppc64le)
+=20
+ #include <errno.h>
+ #include <stddef.h>
+@@ -17,7 +17,7 @@
+ // to and from struct sigaction =E2=80=94 are specific to ${goos}/${goa=
rch}.
+ typedef struct {
+ 	uintptr_t handler;
+-	uint64_t flags;
++	unsigned long flags;
+ #ifdef __loongarch__
+ 	uint64_t mask;
+ 	uintptr_t restorer;
+@@ -57,7 +57,7 @@ x_cgo_sigaction(intptr_t signum, const go_sigaction_t =
*goact, go_sigaction_t *ol
+ 				sigaddset(&act.sa_mask, (int)(i+1));
+ 			}
+ 		}
+-		act.sa_flags =3D (int)(goact->flags & ~(uint64_t)SA_RESTORER);
++		act.sa_flags =3D (int)(goact->flags & ~(unsigned long)SA_RESTORER);
+ 	}
+=20
+ 	ret =3D sigaction((int)signum, goact ? &act : NULL, oldgoact ? &oldact=
 : NULL);
+@@ -79,7 +79,7 @@ x_cgo_sigaction(intptr_t signum, const go_sigaction_t =
*goact, go_sigaction_t *ol
+ 				oldgoact->mask |=3D (uint64_t)(1)<<i;
+ 			}
+ 		}
+-		oldgoact->flags =3D (uint64_t)oldact.sa_flags;
++		oldgoact->flags =3D (unsigned long)oldact.sa_flags;
+ 	}
+=20
+ 	_cgo_tsan_release();
+diff --git a/src/runtime/cgo/sigaction.go b/src/runtime/cgo/sigaction.go
+index dc3f5fd255..90034bad32 100644
+--- a/src/runtime/cgo/sigaction.go
++++ b/src/runtime/cgo/sigaction.go
+@@ -2,7 +2,7 @@
+ // Use of this source code is governed by a BSD-style
+ // license that can be found in the LICENSE file.
+=20
+-//go:build (linux && (amd64 || arm64 || loong64 || ppc64le)) || (freebs=
d && amd64)
++//go:build (linux && (386 || amd64 || arm64 || loong64 || ppc64le)) || =
(freebsd && amd64)
+=20
+ package cgo
+=20
+diff --git a/src/runtime/cgo_sigaction.go b/src/runtime/cgo_sigaction.go
+index 5c644587f0..f725dbef4d 100644
+--- a/src/runtime/cgo_sigaction.go
++++ b/src/runtime/cgo_sigaction.go
+@@ -3,8 +3,10 @@
+ // license that can be found in the LICENSE file.
+=20
+ // Support for sanitizers. See runtime/cgo/sigaction.go.
++// Also used on linux/386 to clear the SA_RESTORER flag
++// when using cgo; see issue #75253.
+=20
+-//go:build (linux && (amd64 || arm64 || loong64 || ppc64le)) || (freebs=
d && amd64)
++//go:build (linux && (386 || amd64 || arm64 || loong64 || ppc64le)) || =
(freebsd && amd64)
+=20
+ package runtime
+=20
+@@ -42,6 +44,8 @@ func sigaction(sig uint32, new, old *sigactiont) {
+=20
+ 		var ret int32
+=20
++		fixSigactionForCgo(new)
++
+ 		var g *g
+ 		if mainStarted {
+ 			g =3D getg()
+diff --git a/src/runtime/crash_cgo_test.go b/src/runtime/crash_cgo_test.=
go
+index c5d7303261..b77ff8dafd 100644
+--- a/src/runtime/crash_cgo_test.go
++++ b/src/runtime/crash_cgo_test.go
+@@ -842,17 +842,6 @@ func TestEINTR(t *testing.T) {
+ 	switch runtime.GOOS {
+ 	case "plan9", "windows":
+ 		t.Skipf("no EINTR on %s", runtime.GOOS)
+-	case "linux":
+-		if runtime.GOARCH =3D=3D "386" {
+-			// On linux-386 the Go signal handler sets
+-			// a restorer function that is not preserved
+-			// by the C sigaction call in the test,
+-			// causing the signal handler to crash when
+-			// returning the normal code. The test is not
+-			// architecture-specific, so just skip on 386
+-			// rather than doing a complicated workaround.
+-			t.Skip("skipping on linux-386; C sigaction does not preserve Go rest=
orer")
+-		}
+ 	}
+ 	if runtime.GOOS =3D=3D "freebsd" && race.Enabled {
+ 		t.Skipf("race + cgo freebsd not supported. See https://go.dev/issue/7=
3788.")
+diff --git a/src/runtime/os_freebsd.go b/src/runtime/os_freebsd.go
+index ab859cfb47..68d895b95d 100644
+--- a/src/runtime/os_freebsd.go
++++ b/src/runtime/os_freebsd.go
+@@ -457,6 +457,12 @@ func sysSigaction(sig uint32, new, old *sigactiont)=
 {
+ 	}
+ }
+=20
++// fixSigactionForCgo is needed for Linux.
++//
++//go:nosplit
++func fixSigactionForCgo(new *sigactiont) {
++}
++
+ // asmSigaction is implemented in assembly.
+ //
+ //go:noescape
+diff --git a/src/runtime/os_linux.go b/src/runtime/os_linux.go
+index c9d25a5be8..f9fe1b5f33 100644
+--- a/src/runtime/os_linux.go
++++ b/src/runtime/os_linux.go
+@@ -486,7 +486,8 @@ func setsig(i uint32, fn uintptr) {
+ 	sigfillset(&sa.sa_mask)
+ 	// Although Linux manpage says "sa_restorer element is obsolete and
+ 	// should not be used". x86_64 kernel requires it. Only use it on
+-	// x86.
++	// x86. Note that on 386 this is cleared when using the C sigaction
++	// function via cgo; see fixSigactionForCgo.
+ 	if GOARCH =3D=3D "386" || GOARCH =3D=3D "amd64" {
+ 		sa.sa_restorer =3D abi.FuncPCABI0(sigreturn__sigaction)
+ 	}
+@@ -562,6 +563,21 @@ func sysSigaction(sig uint32, new, old *sigactiont)=
 {
+ //go:noescape
+ func rt_sigaction(sig uintptr, new, old *sigactiont, size uintptr) int3=
2
+=20
++// fixSigactionForCgo is called when we are using cgo to call the
++// C sigaction function. On 386 the C function does not expect the
++// SA_RESTORER flag to be set, and in some cases will fail if it is set=
:
++// it will pass the SA_RESTORER flag to the kernel without passing
++// the sa_restorer field. Since the C function will handle SA_RESTORER
++// for us, we need not pass it. See issue #75253.
++//
++//go:nosplit
++func fixSigactionForCgo(new *sigactiont) {
++	if GOARCH =3D=3D "386" && new !=3D nil {
++		new.sa_flags &^=3D _SA_RESTORER
++		new.sa_restorer =3D 0
++	}
++}
++
+ func getpid() int
+ func tgkill(tgid, tid, sig int)
+=20
+diff --git a/src/runtime/sigaction.go b/src/runtime/sigaction.go
+index 2027ae80bf..1a99f7f3ec 100644
+--- a/src/runtime/sigaction.go
++++ b/src/runtime/sigaction.go
+@@ -2,7 +2,7 @@
+ // Use of this source code is governed by a BSD-style
+ // license that can be found in the LICENSE file.
+=20
+-//go:build (linux && !amd64 && !arm64 && !loong64 && !ppc64le) || (free=
bsd && !amd64)
++//go:build (linux && !386 && !amd64 && !arm64 && !loong64 && !ppc64le) =
|| (freebsd && !amd64)
+=20
+ package runtime
+=20
+diff --git a/src/runtime/sys_linux_386.s b/src/runtime/sys_linux_386.s
+index d53be243fe..8e832687e0 100644
+--- a/src/runtime/sys_linux_386.s
++++ b/src/runtime/sys_linux_386.s
+@@ -410,6 +410,25 @@ TEXT runtime=C2=B7rt_sigaction(SB),NOSPLIT,$0
+ 	MOVL	AX, ret+16(FP)
+ 	RET
+=20
++// Call the function stored in _cgo_sigaction using the GCC calling con=
vention.
++TEXT runtime=C2=B7callCgoSigaction(SB),NOSPLIT,$0-16
++	MOVL	_cgo_sigaction(SB), AX
++	MOVL	sig+0(FP), BX
++	MOVL	new+4(FP), CX
++	MOVL	old+8(FP), DX
++	MOVL	SP, SI // align stack to call C function
++	SUBL	$32, SP
++	ANDL	$~15, SP
++	MOVL	BX, 0(SP)
++	MOVL	CX, 4(SP)
++	MOVL	DX, 8(SP)
++	MOVL	SI, 12(SP)
++	CALL	AX
++	MOVL	12(SP), BX
++	MOVL	BX, SP
++	MOVL	AX, ret+12(FP)
++	RET
++
+ TEXT runtime=C2=B7sigfwd(SB),NOSPLIT,$12-16
+ 	MOVL	fn+0(FP), AX
+ 	MOVL	sig+4(FP), BX
+--=20
+2.51.0
+
--=20
2.51.0


