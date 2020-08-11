Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.10883.1597135135665504728
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 01:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: zhixiong.chi@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 07B8cs2O016218
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2020 01:38:54 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Tue, 11 Aug 2020
 01:38:54 -0700
From: "Zhixiong Chi" <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][dunfell][PATCH] go: CVE-2020-16845
Date: Tue, 11 Aug 2020 01:38:53 -0700
Message-ID: <20200811083853.83841-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id 07B8cs2O016218
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Backport CVE patch from the upstream:
https://github.com/golang/go.git
commit 027d7241ce050d197e7fabea3d541ffbe3487258

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2020-16845.patch           | 110 ++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2020-16845.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools=
/go/go-1.14.inc
index c52593db6b..8db7f4e4e4 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -16,6 +16,7 @@ SRC_URI +=3D "\
     file://0006-cmd-dist-separate-host-and-target-builds.patch \
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
+    file://CVE-2020-16845.patch \
 "
 SRC_URI_append_libc-musl =3D " file://0009-ld-replace-glibc-dynamic-link=
er-with-musl.patch"
=20
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2020-16845.patch b/meta=
/recipes-devtools/go/go-1.14/CVE-2020-16845.patch
new file mode 100644
index 0000000000..80f467522f
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2020-16845.patch
@@ -0,0 +1,110 @@
+From 027d7241ce050d197e7fabea3d541ffbe3487258 Mon Sep 17 00:00:00 2001
+From: Katie Hockman <katie@golang.org>
+Date: Tue, 4 Aug 2020 11:45:32 -0400
+Subject: [PATCH] encoding/binary: read at most MaxVarintLen64 bytes in
+ ReadUvarint
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This CL ensures that ReadUvarint consumes only a limited
+amount of input (instead of an unbounded amount).
+
+On some inputs, ReadUvarint could read an arbitrary number
+of bytes before deciding to return an overflow error.
+After this CL, ReadUvarint returns that same overflow
+error sooner, after reading at most MaxVarintLen64 bytes.
+
+Fix authored by Robert Griesemer and Filippo Valsorda.
+
+Thanks to Diederik Loerakker, Jonny Rhea, Ra=C3=BAl Kripalani,
+and Preston Van Loon for reporting this.
+
+Fixes #40618
+Fixes CVE-2020-16845
+
+Change-Id: Ie0cb15972f14c38b7cf7af84c45c4ce54909bb8f
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private=
/+/812099
+Reviewed-by: Filippo Valsorda <valsorda@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/247120
+Run-TryBot: Katie Hockman <katie@golang.org>
+TryBot-Result: Gobot Gobot <gobot@golang.org>
+Reviewed-by: Alexander Rakoczy <alex@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go.git]
+CVE: CVE-2020-16845
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ src/encoding/binary/varint.go      |  5 +++--
+ src/encoding/binary/varint_test.go | 18 ++++++++++++------
+ 2 files changed, 15 insertions(+), 8 deletions(-)
+
+diff --git a/src/encoding/binary/varint.go b/src/encoding/binary/varint.=
go
+index bcb8ac9a45..38af61075c 100644
+--- a/src/encoding/binary/varint.go
++++ b/src/encoding/binary/varint.go
+@@ -106,13 +106,13 @@ var overflow =3D errors.New("binary: varint overfl=
ows a 64-bit integer")
+ func ReadUvarint(r io.ByteReader) (uint64, error) {
+ 	var x uint64
+ 	var s uint
+-	for i :=3D 0; ; i++ {
++	for i :=3D 0; i < MaxVarintLen64; i++ {
+ 		b, err :=3D r.ReadByte()
+ 		if err !=3D nil {
+ 			return x, err
+ 		}
+ 		if b < 0x80 {
+-			if i > 9 || i =3D=3D 9 && b > 1 {
++			if i =3D=3D 9 && b > 1 {
+ 				return x, overflow
+ 			}
+ 			return x | uint64(b)<<s, nil
+@@ -120,6 +120,7 @@ func ReadUvarint(r io.ByteReader) (uint64, error) {
+ 		x |=3D uint64(b&0x7f) << s
+ 		s +=3D 7
+ 	}
++	return x, overflow
+ }
+=20
+ // ReadVarint reads an encoded signed integer from r and returns it as =
an int64.
+diff --git a/src/encoding/binary/varint_test.go b/src/encoding/binary/va=
rint_test.go
+index ca411ecbd6..6ef4c99505 100644
+--- a/src/encoding/binary/varint_test.go
++++ b/src/encoding/binary/varint_test.go
+@@ -121,21 +121,27 @@ func TestBufferTooSmall(t *testing.T) {
+ 	}
+ }
+=20
+-func testOverflow(t *testing.T, buf []byte, n0 int, err0 error) {
++func testOverflow(t *testing.T, buf []byte, x0 uint64, n0 int, err0 err=
or) {
+ 	x, n :=3D Uvarint(buf)
+ 	if x !=3D 0 || n !=3D n0 {
+ 		t.Errorf("Uvarint(%v): got x =3D %d, n =3D %d; want 0, %d", buf, x, n=
, n0)
+ 	}
+=20
+-	x, err :=3D ReadUvarint(bytes.NewReader(buf))
+-	if x !=3D 0 || err !=3D err0 {
+-		t.Errorf("ReadUvarint(%v): got x =3D %d, err =3D %s; want 0, %s", buf=
, x, err, err0)
++	r :=3D bytes.NewReader(buf)
++	len :=3D r.Len()
++	x, err :=3D ReadUvarint(r)
++	if x !=3D x0 || err !=3D err0 {
++		t.Errorf("ReadUvarint(%v): got x =3D %d, err =3D %s; want %d, %s", bu=
f, x, err, x0, err0)
++	}
++	if read :=3D len - r.Len(); read > MaxVarintLen64 {
++		t.Errorf("ReadUvarint(%v): read more than MaxVarintLen64 bytes, got %=
d", buf, read)
+ 	}
+ }
+=20
+ func TestOverflow(t *testing.T) {
+-	testOverflow(t, []byte{0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,=
 0x80, 0x2}, -10, overflow)
+-	testOverflow(t, []byte{0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,=
 0x80, 0x80, 0x80, 0x80, 0x1, 0, 0}, -13, overflow)
++	testOverflow(t, []byte{0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,=
 0x80, 0x2}, 0, -10, overflow)
++	testOverflow(t, []byte{0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,=
 0x80, 0x80, 0x80, 0x80, 0x1, 0, 0}, 0, -13, overflow)
++	testOverflow(t, []byte{0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,=
 0xFF, 0xFF, 0xFF}, 1<<64-1, 0, overflow) // 11 bytes, should overflow
+ }
+=20
+ func TestNonCanonicalZero(t *testing.T) {
+--=20
+2.17.0
+
--=20
2.17.1

