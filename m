Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEC7C77B72
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 12:54:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7012.1681995249941861769
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 05:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C8621480;
	Thu, 20 Apr 2023 05:54:53 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2FE613F587;
	Thu, 20 Apr 2023 05:54:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] go: backport fix for CVE-2023-24537
Date: Thu, 20 Apr 2023 13:54:05 +0100
Message-Id: <20230420125405.1919333-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 12:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180251

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/go/go-1.20.1.inc        |  1 +
 .../go/go/CVE-2023-24537.patch                | 89 +++++++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2023-24537.patch

diff --git a/meta/recipes-devtools/go/go-1.20.1.inc b/meta/recipes-devtoo=
ls/go/go-1.20.1.inc
index b1f569212db..179f0e29ebf 100644
--- a/meta/recipes-devtools/go/go-1.20.1.inc
+++ b/meta/recipes-devtools/go/go-1.20.1.inc
@@ -16,5 +16,6 @@ SRC_URI +=3D "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0010-cmd-compile-re-compile-instantiated-generic-methods-.pat=
ch \
     file://CVE-2023-24532.patch \
+    file://CVE-2023-24537.patch \
 "
 SRC_URI[main.sha256sum] =3D "b5c1a3af52c385a6d1c76aed5361cf26459023980d0=
320de7658bae3915831a2"
diff --git a/meta/recipes-devtools/go/go/CVE-2023-24537.patch b/meta/reci=
pes-devtools/go/go/CVE-2023-24537.patch
new file mode 100644
index 00000000000..6b5dc2c8d9f
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2023-24537.patch
@@ -0,0 +1,89 @@
+From 110e4fb1c2e3a21631704bbfaf672230b9ba2492 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Wed, 22 Mar 2023 09:33:22 -0700
+Subject: [PATCH] go/scanner: reject large line and column numbers in //l=
ine
+ directives
+
+Setting a large line or column number using a //line directive can cause
+integer overflow even in small source files.
+
+Limit line and column numbers in //line directives to 2^30-1, which
+is small enough to avoid int32 overflow on all reasonbly-sized files.
+
+For #59180
+Fixes CVE-2023-24537
+
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private=
/+/1802456
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Run-TryBot: Damien Neil <dneil@google.com>
+Change-Id: I149bf34deca532af7994203fa1e6aca3c890ea14
+Reviewed-on: https://go-review.googlesource.com/c/go/+/482078
+Reviewed-by: Matthew Dempsky <mdempsky@google.com>
+TryBot-Bypass: Michael Knyszek <mknyszek@google.com>
+Run-TryBot: Michael Knyszek <mknyszek@google.com>
+Auto-Submit: Michael Knyszek <mknyszek@google.com>
+
+CVE: CVE-2023-24537
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/go/parser/parser_test.go | 16 ++++++++++++++++
+ src/go/scanner/scanner.go    |  7 +++++--
+ 2 files changed, 21 insertions(+), 2 deletions(-)
+
+diff --git a/src/go/parser/parser_test.go b/src/go/parser/parser_test.go
+index 153562df75068..22b11a0cc4535 100644
+--- a/src/go/parser/parser_test.go
++++ b/src/go/parser/parser_test.go
+@@ -764,3 +764,19 @@ func TestRangePos(t *testing.T) {
+ 		})
+ 	}
+ }
++
++// TestIssue59180 tests that line number overflow doesn't cause an infi=
nite loop.
++func TestIssue59180(t *testing.T) {
++	testcases :=3D []string{
++		"package p\n//line :9223372036854775806\n\n//",
++		"package p\n//line :1:9223372036854775806\n\n//",
++		"package p\n//line file:9223372036854775806\n\n//",
++	}
++
++	for _, src :=3D range testcases {
++		_, err :=3D ParseFile(token.NewFileSet(), "", src, ParseComments)
++		if err =3D=3D nil {
++			t.Errorf("ParseFile(%s) succeeded unexpectedly", src)
++		}
++	}
++}
+diff --git a/src/go/scanner/scanner.go b/src/go/scanner/scanner.go
+index 16958d22ce299..0cd9f5901d0bb 100644
+--- a/src/go/scanner/scanner.go
++++ b/src/go/scanner/scanner.go
+@@ -253,13 +253,16 @@ func (s *Scanner) updateLineInfo(next, offs int, t=
ext []byte) {
+ 		return
+ 	}
+=20
++	// Put a cap on the maximum size of line and column numbers.
++	// 30 bits allows for some additional space before wrapping an int32.
++	const maxLineCol =3D 1<<30 - 1
+ 	var line, col int
+ 	i2, n2, ok2 :=3D trailingDigits(text[:i-1])
+ 	if ok2 {
+ 		//line filename:line:col
+ 		i, i2 =3D i2, i
+ 		line, col =3D n2, n
+-		if col =3D=3D 0 {
++		if col =3D=3D 0 || col > maxLineCol {
+ 			s.error(offs+i2, "invalid column number: "+string(text[i2:]))
+ 			return
+ 		}
+@@ -269,7 +272,7 @@ func (s *Scanner) updateLineInfo(next, offs int, tex=
t []byte) {
+ 		line =3D n
+ 	}
+=20
+-	if line =3D=3D 0 {
++	if line =3D=3D 0 || line > maxLineCol {
+ 		s.error(offs+i, "invalid line number: "+string(text[i:]))
+ 		return
+ 	}
--=20
2.34.1


