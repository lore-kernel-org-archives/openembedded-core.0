Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D12C761AF
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 12:03:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.32959.1679918617867817152
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 05:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5600143D;
	Mon, 27 Mar 2023 05:04:21 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 09B7C3F663;
	Mon, 27 Mar 2023 05:03:36 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] go: fix CVE-2023-2453
Date: Mon, 27 Mar 2023 13:03:35 +0100
Message-Id: <20230327120335.3502677-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 12:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179158

Backport a security fix, can be removed once we have 1.20.2 onwards.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/go/go-1.20.1.inc        |   1 +
 .../go/go/CVE-2023-24532.patch                | 208 ++++++++++++++++++
 2 files changed, 209 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2023-24532.patch

diff --git a/meta/recipes-devtools/go/go-1.20.1.inc b/meta/recipes-devtoo=
ls/go/go-1.20.1.inc
index ffde7ed7324..b1f569212db 100644
--- a/meta/recipes-devtools/go/go-1.20.1.inc
+++ b/meta/recipes-devtools/go/go-1.20.1.inc
@@ -15,5 +15,6 @@ SRC_URI +=3D "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.pat=
ch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0010-cmd-compile-re-compile-instantiated-generic-methods-.pat=
ch \
+    file://CVE-2023-24532.patch \
 "
 SRC_URI[main.sha256sum] =3D "b5c1a3af52c385a6d1c76aed5361cf26459023980d0=
320de7658bae3915831a2"
diff --git a/meta/recipes-devtools/go/go/CVE-2023-24532.patch b/meta/reci=
pes-devtools/go/go/CVE-2023-24532.patch
new file mode 100644
index 00000000000..22f080dbd4b
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2023-24532.patch
@@ -0,0 +1,208 @@
+From 602eeaab387f24a4b28c5eccbb50fa934f3bc3c4 Mon Sep 17 00:00:00 2001
+From: Filippo Valsorda <filippo@golang.org>
+Date: Mon, 13 Feb 2023 15:16:27 +0100
+Subject: [PATCH] [release-branch.go1.20] crypto/internal/nistec: reduce =
P-256
+ scalar
+
+Unlike the rest of nistec, the P-256 assembly doesn't use complete
+addition formulas, meaning that p256PointAdd[Affine]Asm won't return the
+correct value if the two inputs are equal.
+
+This was (undocumentedly) ignored in the scalar multiplication loops
+because as long as the input point is not the identity and the scalar is
+lower than the order of the group, the addition inputs can't be the same=
.
+
+As part of the math/big rewrite, we went however from always reducing
+the scalar to only checking its length, under the incorrect assumption
+that the scalar multiplication loop didn't require reduction.
+
+Added a reduction, and while at it added it in P256OrdInverse, too, to
+enforce a universal reduction invariant on p256OrdElement values.
+
+Note that if the input point is the infinity, the code currently still
+relies on undefined behavior, but that's easily tested to behave
+acceptably, and will be addressed in a future CL.
+
+Updates #58647
+Fixes #58720
+Fixes CVE-2023-24532
+
+(Filed with the "safe APIs like complete addition formulas are good" dep=
t.)
+
+Change-Id: I7b2c75238440e6852be2710fad66ff1fdc4e2b24
+Reviewed-on: https://go-review.googlesource.com/c/go/+/471255
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+Run-TryBot: Filippo Valsorda <filippo@golang.org>
+Auto-Submit: Filippo Valsorda <filippo@golang.org>
+Reviewed-by: Damien Neil <dneil@google.com>
+(cherry picked from commit 203e59ad41bd288e1d92b6f617c2f55e70d3c8e3)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/471695
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Filippo Valsorda <filippo@golang.org>
+Run-TryBot: Roland Shoemaker <roland@golang.org>
+
+CVE: CVE-2023-24532
+Upstream-Status: Backport [602eeaab387f24a4b28c5eccbb50fa934f3bc3c4]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+---
+ src/crypto/internal/nistec/nistec_test.go | 81 +++++++++++++++++++++++
+ src/crypto/internal/nistec/p256_asm.go    | 17 +++++
+ src/crypto/internal/nistec/p256_ordinv.go |  1 +
+ 3 files changed, 99 insertions(+)
+
+diff --git a/src/crypto/internal/nistec/nistec_test.go b/src/crypto/inte=
rnal/nistec/nistec_test.go
+index 309f68be16a9f..9103608c18a0f 100644
+--- a/src/crypto/internal/nistec/nistec_test.go
++++ b/src/crypto/internal/nistec/nistec_test.go
+@@ -8,6 +8,7 @@ import (
+ 	"bytes"
+ 	"crypto/elliptic"
+ 	"crypto/internal/nistec"
++	"fmt"
+ 	"internal/testenv"
+ 	"math/big"
+ 	"math/rand"
+@@ -165,6 +166,86 @@ func testEquivalents[P nistPoint[P]](t *testing.T, =
newPoint func() P, c elliptic
+ 	}
+ }
+=20
++func TestScalarMult(t *testing.T) {
++	t.Run("P224", func(t *testing.T) {
++		testScalarMult(t, nistec.NewP224Point, elliptic.P224())
++	})
++	t.Run("P256", func(t *testing.T) {
++		testScalarMult(t, nistec.NewP256Point, elliptic.P256())
++	})
++	t.Run("P384", func(t *testing.T) {
++		testScalarMult(t, nistec.NewP384Point, elliptic.P384())
++	})
++	t.Run("P521", func(t *testing.T) {
++		testScalarMult(t, nistec.NewP521Point, elliptic.P521())
++	})
++}
++
++func testScalarMult[P nistPoint[P]](t *testing.T, newPoint func() P, c =
elliptic.Curve) {
++	G :=3D newPoint().SetGenerator()
++	checkScalar :=3D func(t *testing.T, scalar []byte) {
++		p1, err :=3D newPoint().ScalarBaseMult(scalar)
++		fatalIfErr(t, err)
++		p2, err :=3D newPoint().ScalarMult(G, scalar)
++		fatalIfErr(t, err)
++		if !bytes.Equal(p1.Bytes(), p2.Bytes()) {
++			t.Error("[k]G !=3D ScalarBaseMult(k)")
++		}
++
++		d :=3D new(big.Int).SetBytes(scalar)
++		d.Sub(c.Params().N, d)
++		d.Mod(d, c.Params().N)
++		g1, err :=3D newPoint().ScalarBaseMult(d.FillBytes(make([]byte, len(s=
calar))))
++		fatalIfErr(t, err)
++		g1.Add(g1, p1)
++		if !bytes.Equal(g1.Bytes(), newPoint().Bytes()) {
++			t.Error("[N - k]G + [k]G !=3D =E2=88=9E")
++		}
++	}
++
++	byteLen :=3D len(c.Params().N.Bytes())
++	bitLen :=3D c.Params().N.BitLen()
++	t.Run("0", func(t *testing.T) { checkScalar(t, make([]byte, byteLen)) =
})
++	t.Run("1", func(t *testing.T) {
++		checkScalar(t, big.NewInt(1).FillBytes(make([]byte, byteLen)))
++	})
++	t.Run("N-1", func(t *testing.T) {
++		checkScalar(t, new(big.Int).Sub(c.Params().N, big.NewInt(1)).Bytes())
++	})
++	t.Run("N", func(t *testing.T) { checkScalar(t, c.Params().N.Bytes()) }=
)
++	t.Run("N+1", func(t *testing.T) {
++		checkScalar(t, new(big.Int).Add(c.Params().N, big.NewInt(1)).Bytes())
++	})
++	t.Run("all1s", func(t *testing.T) {
++		s :=3D new(big.Int).Lsh(big.NewInt(1), uint(bitLen))
++		s.Sub(s, big.NewInt(1))
++		checkScalar(t, s.Bytes())
++	})
++	if testing.Short() {
++		return
++	}
++	for i :=3D 0; i < bitLen; i++ {
++		t.Run(fmt.Sprintf("1<<%d", i), func(t *testing.T) {
++			s :=3D new(big.Int).Lsh(big.NewInt(1), uint(i))
++			checkScalar(t, s.FillBytes(make([]byte, byteLen)))
++		})
++	}
++	// Test N+1...N+32 since they risk overlapping with precomputed table =
values
++	// in the final additions.
++	for i :=3D int64(2); i <=3D 32; i++ {
++		t.Run(fmt.Sprintf("N+%d", i), func(t *testing.T) {
++			checkScalar(t, new(big.Int).Add(c.Params().N, big.NewInt(i)).Bytes()=
)
++		})
++	}
++}
++
++func fatalIfErr(t *testing.T, err error) {
++	t.Helper()
++	if err !=3D nil {
++		t.Fatal(err)
++	}
++}
++
+ func BenchmarkScalarMult(b *testing.B) {
+ 	b.Run("P224", func(b *testing.B) {
+ 		benchmarkScalarMult(b, nistec.NewP224Point().SetGenerator(), 28)
+diff --git a/src/crypto/internal/nistec/p256_asm.go b/src/crypto/interna=
l/nistec/p256_asm.go
+index 6ea161eb49953..99a22b833f028 100644
+--- a/src/crypto/internal/nistec/p256_asm.go
++++ b/src/crypto/internal/nistec/p256_asm.go
+@@ -364,6 +364,21 @@ func p256PointDoubleAsm(res, in *P256Point)
+ // Montgomery domain (with R 2=C2=B2=E2=81=B5=E2=81=B6) as four uint64 =
limbs in little-endian order.
+ type p256OrdElement [4]uint64
+=20
++// p256OrdReduce ensures s is in the range [0, ord(G)-1].
++func p256OrdReduce(s *p256OrdElement) {
++	// Since 2 * ord(G) > 2=C2=B2=E2=81=B5=E2=81=B6, we can just condition=
ally subtract ord(G),
++	// keeping the result if it doesn't underflow.
++	t0, b :=3D bits.Sub64(s[0], 0xf3b9cac2fc632551, 0)
++	t1, b :=3D bits.Sub64(s[1], 0xbce6faada7179e84, b)
++	t2, b :=3D bits.Sub64(s[2], 0xffffffffffffffff, b)
++	t3, b :=3D bits.Sub64(s[3], 0xffffffff00000000, b)
++	tMask :=3D b - 1 // zero if subtraction underflowed
++	s[0] ^=3D (t0 ^ s[0]) & tMask
++	s[1] ^=3D (t1 ^ s[1]) & tMask
++	s[2] ^=3D (t2 ^ s[2]) & tMask
++	s[3] ^=3D (t3 ^ s[3]) & tMask
++}
++
+ // Add sets q =3D p1 + p2, and returns q. The points may overlap.
+ func (q *P256Point) Add(r1, r2 *P256Point) *P256Point {
+ 	var sum, double P256Point
+@@ -393,6 +408,7 @@ func (r *P256Point) ScalarBaseMult(scalar []byte) (*=
P256Point, error) {
+ 	}
+ 	scalarReversed :=3D new(p256OrdElement)
+ 	p256OrdBigToLittle(scalarReversed, (*[32]byte)(scalar))
++	p256OrdReduce(scalarReversed)
+=20
+ 	r.p256BaseMult(scalarReversed)
+ 	return r, nil
+@@ -407,6 +423,7 @@ func (r *P256Point) ScalarMult(q *P256Point, scalar =
[]byte) (*P256Point, error)
+ 	}
+ 	scalarReversed :=3D new(p256OrdElement)
+ 	p256OrdBigToLittle(scalarReversed, (*[32]byte)(scalar))
++	p256OrdReduce(scalarReversed)
+=20
+ 	r.Set(q).p256ScalarMult(scalarReversed)
+ 	return r, nil
+diff --git a/src/crypto/internal/nistec/p256_ordinv.go b/src/crypto/inte=
rnal/nistec/p256_ordinv.go
+index 86a7a230bdce8..1274fb7fd3f5c 100644
+--- a/src/crypto/internal/nistec/p256_ordinv.go
++++ b/src/crypto/internal/nistec/p256_ordinv.go
+@@ -25,6 +25,7 @@ func P256OrdInverse(k []byte) ([]byte, error) {
+=20
+ 	x :=3D new(p256OrdElement)
+ 	p256OrdBigToLittle(x, (*[32]byte)(k))
++	p256OrdReduce(x)
+=20
+ 	// Inversion is implemented as exponentiation by n - 2, per Fermat's l=
ittle theorem.
+ 	//
--=20
2.34.1


