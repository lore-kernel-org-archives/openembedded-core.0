Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Minjae Kim" <flowergom@gmail.com>
Subject: [dunfell][PATCH 1/2] go: fix CVE-2022-23806
Date: Sat, 26 Feb 2022 20:55:34 +0000
Message-Id: <20220226205535.86919-1-flowergom@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>

crypto/elliptic: fix IsOnCurve for big.Int values that are not valid coordinates

Some big.Int values that are not valid field elements (negative or overflowing)
might cause Curve.IsOnCurve to incorrectly return true. Operating on those values
may cause a panic or an invalid curve operation. Note that Unmarshal will never
return such values.

Upstream-Status: Backport [https://go.dev/issue/50974]
CVE: CVE-2022-23806
Signed-off-by:Minjae Kim <flowergom@gmail.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-23806.patch           | 142 ++++++++++++++++++
 2 files changed, 143 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-23806.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index abc6f42184..fcb316e09e 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -19,6 +19,7 @@ SRC_URI += "\
     file://CVE-2021-34558.patch \
     file://CVE-2021-33196.patch \
     file://CVE-2021-33197.patch \
+    file://CVE-2022-23806.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 SRC_URI[main.sha256sum] = "7ed13b2209e54a451835997f78035530b331c5b6943cdcd68a3d815fdc009149"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-23806.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-23806.patch
new file mode 100644
index 0000000000..772acdcbf6
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-23806.patch
@@ -0,0 +1,142 @@
+From 5b376a209d1c61e10847e062d78c4b1aa90dff0c Mon Sep 17 00:00:00 2001
+From: Filippo Valsorda <filippo@golang.org>
+Date: Sat, 26 Feb 2022 10:40:57 +0000
+Subject: [PATCH] crypto/elliptic: make IsOnCurve return false for invalid
+
+ field elements
+
+Updates #50974
+Fixes #50977
+Fixes CVE-2022-23806
+
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+
+---
+ src/crypto/elliptic/elliptic.go      |  6 +++
+ src/crypto/elliptic/elliptic_test.go | 81 ++++++++++++++++++++++++++++
+ src/crypto/elliptic/p224.go          |  6 +++
+ 3 files changed, 93 insertions(+)
+
+diff --git a/src/crypto/elliptic/elliptic.go b/src/crypto/elliptic/elliptic.go
+index e2f71cd..bd574a4 100644
+--- a/src/crypto/elliptic/elliptic.go
++++ b/src/crypto/elliptic/elliptic.go
+@@ -53,6 +53,12 @@ func (curve *CurveParams) Params() *CurveParams {
+ }
+ 
+ func (curve *CurveParams) IsOnCurve(x, y *big.Int) bool {
++
++	if x.Sign() < 0 || x.Cmp(curve.P) >= 0 ||
++		y.Sign() < 0 || y.Cmp(curve.P) >= 0 {
++		return false
++	}
++
+ 	// y² = x³ - 3x + b
+ 	y2 := new(big.Int).Mul(y, y)
+ 	y2.Mod(y2, curve.P)
+diff --git a/src/crypto/elliptic/elliptic_test.go b/src/crypto/elliptic/elliptic_test.go
+index 09c5483..b13a620 100644
+--- a/src/crypto/elliptic/elliptic_test.go
++++ b/src/crypto/elliptic/elliptic_test.go
+@@ -628,3 +628,84 @@ func TestUnmarshalToLargeCoordinates(t *testing.T) {
+ 		t.Errorf("Unmarshal accepts invalid Y coordinate")
+ 	}
+ }
++
++func testAllCurves(t *testing.T, f func(*testing.T, Curve)) {
++	tests := []struct {
++		name  string
++		curve Curve
++	}{
++		{"P256", P256()},
++		{"P256/Params", P256().Params()},
++		{"P224", P224()},
++		{"P224/Params", P224().Params()},
++		{"P384", P384()},
++		{"P384/Params", P384().Params()},
++		{"P521", P521()},
++		{"P521/Params", P521().Params()},
++	}
++	if testing.Short() {
++		tests = tests[:1]
++	}
++	for _, test := range tests {
++		curve := test.curve
++		t.Run(test.name, func(t *testing.T) {
++			t.Parallel()
++			f(t, curve)
++		})
++	}
++}
++
++// TestInvalidCoordinates tests big.Int values that are not valid field elements
++// (negative or bigger than P). They are expected to return false from
++// IsOnCurve, all other behavior is undefined.
++func TestInvalidCoordinates(t *testing.T) {
++	testAllCurves(t, testInvalidCoordinates)
++}
++
++func testInvalidCoordinates(t *testing.T, curve Curve) {
++	checkIsOnCurveFalse := func(name string, x, y *big.Int) {
++		if curve.IsOnCurve(x, y) {
++			t.Errorf("IsOnCurve(%s) unexpectedly returned true", name)
++		}
++	}
++
++	p := curve.Params().P
++	_, x, y, _ := GenerateKey(curve, rand.Reader)
++	xx, yy := new(big.Int), new(big.Int)
++
++	// Check if the sign is getting dropped.
++	xx.Neg(x)
++	checkIsOnCurveFalse("-x, y", xx, y)
++	yy.Neg(y)
++	checkIsOnCurveFalse("x, -y", x, yy)
++
++	// Check if negative values are reduced modulo P.
++	xx.Sub(x, p)
++	checkIsOnCurveFalse("x-P, y", xx, y)
++	yy.Sub(y, p)
++	checkIsOnCurveFalse("x, y-P", x, yy)
++
++	// Check if positive values are reduced modulo P.
++	xx.Add(x, p)
++	checkIsOnCurveFalse("x+P, y", xx, y)
++	yy.Add(y, p)
++	checkIsOnCurveFalse("x, y+P", x, yy)
++
++	// Check if the overflow is dropped.
++	xx.Add(x, new(big.Int).Lsh(big.NewInt(1), 535))
++	checkIsOnCurveFalse("x+2⁵³⁵, y", xx, y)
++	yy.Add(y, new(big.Int).Lsh(big.NewInt(1), 535))
++	checkIsOnCurveFalse("x, y+2⁵³⁵", x, yy)
++
++	// Check if P is treated like zero (if possible).
++	// y^2 = x^3 - 3x + B
++	// y = mod_sqrt(x^3 - 3x + B)
++	// y = mod_sqrt(B) if x = 0
++	// If there is no modsqrt, there is no point with x = 0, can't test x = P.
++	if yy := new(big.Int).ModSqrt(curve.Params().B, p); yy != nil {
++		if !curve.IsOnCurve(big.NewInt(0), yy) {
++			t.Fatal("(0, mod_sqrt(B)) is not on the curve?")
++		}
++		checkIsOnCurveFalse("P, y", p, yy)
++	}
++}
+diff --git a/src/crypto/elliptic/p224.go b/src/crypto/elliptic/p224.go
+index 8c76021..f1bfd7e 100644
+--- a/src/crypto/elliptic/p224.go
++++ b/src/crypto/elliptic/p224.go
+@@ -48,6 +48,12 @@ func (curve p224Curve) Params() *CurveParams {
+ }
+ 
+ func (curve p224Curve) IsOnCurve(bigX, bigY *big.Int) bool {
++
++	if bigX.Sign() < 0 || bigX.Cmp(curve.P) >= 0 ||
++		bigY.Sign() < 0 || bigY.Cmp(curve.P) >= 0 {
++		return false
++	}
++
+ 	var x, y p224FieldElement
+ 	p224FromBig(&x, bigX)
+ 	p224FromBig(&y, bigY)
-- 
2.17.1

