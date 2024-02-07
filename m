Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32B2C4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 12:59:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.19705.1707310773607872851
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 04:59:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=WgO3x4h4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=27679bc1fe=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 417CLSa8014988
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Feb 2024 12:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=Pi6rr3Al9LVwlDvtwl
	zYiy77ktHTswI9oA4I5QF5Ubg=; b=WgO3x4h4HBlegw+V+MwepvgMZ4QCb+rdJS
	gUCCOd3RSWu1Aa9yz3ND1QgZ/C05c/WFfjC/+GezbsyFGcHdp070wIdwjROLh/Xy
	EjDb0UUV2SaPY4EHo8onN6S7ekGZ1aFZiEkgl3fhNxhRc2lIogr5YXokRteTfKRC
	dPtxy4E0pNtrtN4GwWSMyAET1lPaguWv9DX/tZefHvlB7IwBjQB5O9kZJqFqYzMm
	9LNOZ++8L5fA/yH+UzMo6W0F8yuXXLOvtzuhJlN+S44u4x8cnj3P5GezrSiS6ysD
	9xZkXhLdl38gt5iKy+xF2MT5WJbVqiOsMkdnqiPFaL9mvKlg9ypQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1cs7c13h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 12:59:32 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 04:59:28 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] go: Fix CVE-2023-45285 and CVE-2023-45287
Date: Wed, 7 Feb 2024 12:59:13 +0000
Message-ID: <20240207125913.1506713-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: u4Poe-zEoZ0qbfnnkgeIjKIupX_d0I9f
X-Proofpoint-GUID: u4Poe-zEoZ0qbfnnkgeIjKIupX_d0I9f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_04,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 bulkscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402070096
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 417CLSa8014988
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 12:59:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195059

From: Soumya Sambu <soumya.sambu@windriver.com>

CVE-2023-45285:
Using go get to fetch a module with the ".git" suffix may unexpectedly
fallback to the insecure "git://" protocol if the module is unavailable
via the secure "https://" and "git+ssh://" protocols, even if GOINSECURE
is not set for said module. This only affects users who are not using
the module proxy and are fetching modules directly (i.e. GOPROXY=3Doff).

CVE-2023-45287:
Before Go 1.20, the RSA based TLS key exchanges used the math/big
library, which is not constant time. RSA blinding was applied to prevent
timing attacks, but analysis shows this may not have been fully effective.
In particular it appears as if the removal of PKCS#1 padding may leak
timing information, which in turn could be used to recover session key
bits. In Go 1.20, the crypto/tls library switched to a fully constant
time RSA implementation, which we do not believe exhibits any timing
side channels.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-45285
https://nvd.nist.gov/vuln/detail/CVE-2023-45287
https://security-tracker.debian.org/tracker/CVE-2023-45285
https://security-tracker.debian.org/tracker/CVE-2023-45287

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |    2 +
 .../go/go-1.20/CVE-2023-45285.patch           |  110 ++
 .../go/go-1.20/CVE-2023-45287.patch           | 1695 +++++++++++++++++
 3 files changed, 1807 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.20/CVE-2023-45285.patch
 create mode 100644 meta/recipes-devtools/go/go-1.20/CVE-2023-45287.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devto=
ols/go/go-1.17.13.inc
index 95c4461d3e..6fc07bb910 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -48,6 +48,8 @@ SRC_URI +=3D "\
     file://CVE-2023-39319.patch \
     file://CVE-2023-39318.patch \
     file://CVE-2023-39326.patch \
+    file://CVE-2023-45285.patch \
+    file://CVE-2023-45287.patch \
 "
 SRC_URI[main.sha256sum] =3D "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d=
1fc0c1d784ada0cd300fd"
=20
diff --git a/meta/recipes-devtools/go/go-1.20/CVE-2023-45285.patch b/meta=
/recipes-devtools/go/go-1.20/CVE-2023-45285.patch
new file mode 100644
index 0000000000..92711a9393
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.20/CVE-2023-45285.patch
@@ -0,0 +1,110 @@
+From 46bc33819ac86a9596b8059235842f0e0c7469bd Mon Sep 17 00:00:00 2001
+From: Bryan C. Mills <bcmills@google.com>
+Date: Thu, 2 Nov 2023 15:06:35 -0400
+Subject: [PATCH] cmd/go/internal/vcs: error out if the requested repo do=
es not
+ support a secure protocol
+
+Updates #63845.
+Fixes #63972.
+
+Change-Id: If86d6b13d3b55877b35c087112bd76388c9404b8
+Reviewed-on: https://go-review.googlesource.com/c/go/+/539321
+Reviewed-by: Michael Matloob <matloob@golang.org>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gse=
rviceaccount.com>
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+Auto-Submit: Bryan Mills <bcmills@google.com>
+(cherry picked from commit be26ae18caf7ddffca4073333f80d0d9e76483c3)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/540335
+Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+
+CVE: CVE-2023-45285
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/46bc33819=
ac86a9596b8059235842f0e0c7469bd]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/cmd/go/internal/vcs/vcs.go                | 25 +++++++++++++----
+ .../script/mod_insecure_issue63845.txt        | 28 +++++++++++++++++++
+ 2 files changed, 47 insertions(+), 6 deletions(-)
+ create mode 100644 src/cmd/go/testdata/script/mod_insecure_issue63845.t=
xt
+
+diff --git a/src/cmd/go/internal/vcs/vcs.go b/src/cmd/go/internal/vcs/vc=
s.go
+index ab42424..0e2882d 100644
+--- a/src/cmd/go/internal/vcs/vcs.go
++++ b/src/cmd/go/internal/vcs/vcs.go
+@@ -891,19 +891,32 @@ func repoRootFromVCSPaths(importPath string, secur=
ity web.SecurityMode, vcsPaths
+		if !srv.schemelessRepo {
+			repoURL =3D match["repo"]
+		} else {
+-			scheme :=3D vcs.Scheme[0] // default to first scheme
+			repo :=3D match["repo"]
+-			if vcs.PingCmd !=3D "" {
+-				// If we know how to test schemes, scan to find one.
++			scheme, err :=3D func() (string, error) {
+				for _, s :=3D range vcs.Scheme {
+					if security =3D=3D web.SecureOnly && !vcs.isSecureScheme(s) {
+						continue
+					}
+-					if vcs.Ping(s, repo) =3D=3D nil {
+-						scheme =3D s
+-						break
++
++					// If we know how to ping URL schemes for this VCS,
++					// check that this repo works.
++					// Otherwise, default to the first scheme
++					// that meets the requested security level.
++					if vcs.PingCmd =3D=3D "" {
++						return s, nil
++					}
++					if err :=3D vcs.Ping(s, repo); err =3D=3D nil {
++						return s, nil
+					}
+				}
++				securityFrag :=3D ""
++				if security =3D=3D web.SecureOnly {
++					securityFrag =3D "secure "
++				}
++				return "", fmt.Errorf("no %sprotocol found for repository", securit=
yFrag)
++			}()
++			if err !=3D nil {
++				return nil, err
+			}
+			repoURL =3D scheme + "://" + repo
+		}
+diff --git a/src/cmd/go/testdata/script/mod_insecure_issue63845.txt b/sr=
c/cmd/go/testdata/script/mod_insecure_issue63845.txt
+new file mode 100644
+index 0000000..5fa6a4f
+--- /dev/null
++++ b/src/cmd/go/testdata/script/mod_insecure_issue63845.txt
+@@ -0,0 +1,28 @@
++# Regression test for https://go.dev/issue/63845:
++# If 'git ls-remote' fails for all secure protocols,
++# we should fail instead of falling back to an arbitrary protocol.
++#
++# Note that this test does not use the local vcweb test server
++# (vcs-test.golang.org), because the hook for redirecting to that
++# server bypasses the "ping to determine protocol" logic
++# in cmd/go/internal/vcs.
++
++[!net] skip
++[!git] skip
++[short] skip 'tries to access a nonexistent external Git repo'
++
++env GOPRIVATE=3Dgolang.org
++env CURLOPT_TIMEOUT_MS=3D100
++env GIT_SSH_COMMAND=3Dfalse
++
++! go get -x golang.org/nonexist.git@latest
++stderr '^git ls-remote https://golang.org/nonexist$'
++stderr '^git ls-remote git\+ssh://golang.org/nonexist'
++stderr '^git ls-remote ssh://golang.org/nonexist$'
++! stderr 'git://'
++stderr '^go: golang.org/nonexist.git@latest: no secure protocol found f=
or repository$'
++
++-- go.mod --
++module example
++
++go 1.19
+--
+2.40.0
diff --git a/meta/recipes-devtools/go/go-1.20/CVE-2023-45287.patch b/meta=
/recipes-devtools/go/go-1.20/CVE-2023-45287.patch
new file mode 100644
index 0000000000..b31a0f0320
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.20/CVE-2023-45287.patch
@@ -0,0 +1,1695 @@
+From 8a81fdf165facdcefa06531de5af98a4db343035 Mon Sep 17 00:00:00 2001
+From: L=C3=BAc=C3=A1s Meier <cronokirby@gmail.com>
+Date: Tue Jun 8 21:36:06 2021 +0200
+Subject: [PATCH] crypto/rsa: replace big.Int for encryption and decrypti=
on
+
+Infamously, big.Int does not provide constant-time arithmetic, making
+its use in cryptographic code quite tricky. RSA uses big.Int
+pervasively, in its public API, for key generation, precomputation, and
+for encryption and decryption. This is a known problem. One mitigation,
+blinding, is already in place during decryption. This helps mitigate the
+very leaky exponentiation operation. Because big.Int is fundamentally
+not constant-time, it's unfortunately difficult to guarantee that
+mitigations like these are completely effective.
+
+This patch removes the use of big.Int for encryption and decryption,
+replacing it with an internal nat type instead. Signing and verification
+are also affected, because they depend on encryption and decryption.
+
+Overall, this patch degrades performance by 55% for private key
+operations, and 4-5x for (much faster) public key operations.
+(Signatures do both, so the slowdown is worse than decryption.)
+
+name                    old time/op  new time/op    delta
+DecryptPKCS1v15/2048-8  1.50ms =C2=B1 0%    2.34ms =C2=B1 0%    +56.44% =
 (p=3D0.000 n=3D8+10)
+DecryptPKCS1v15/3072-8  4.40ms =C2=B1 0%    6.79ms =C2=B1 0%    +54.33% =
 (p=3D0.000 n=3D10+9)
+DecryptPKCS1v15/4096-8  9.31ms =C2=B1 0%   15.14ms =C2=B1 0%    +62.60% =
 (p=3D0.000 n=3D10+10)
+EncryptPKCS1v15/2048-8  8.16=C2=B5s =C2=B1 0%  355.58=C2=B5s =C2=B1 0%  =
+4258.90%  (p=3D0.000 n=3D10+9)
+DecryptOAEP/2048-8      1.50ms =C2=B1 0%    2.34ms =C2=B1 0%    +55.68% =
 (p=3D0.000 n=3D10+9)
+EncryptOAEP/2048-8      8.51=C2=B5s =C2=B1 0%  355.95=C2=B5s =C2=B1 0%  =
+4082.75%  (p=3D0.000 n=3D10+9)
+SignPKCS1v15/2048-8     1.51ms =C2=B1 0%    2.69ms =C2=B1 0%    +77.94% =
 (p=3D0.000 n=3D10+10)
+VerifyPKCS1v15/2048-8   7.25=C2=B5s =C2=B1 0%  354.34=C2=B5s =C2=B1 0%  =
+4789.52%  (p=3D0.000 n=3D9+9)
+SignPSS/2048-8          1.51ms =C2=B1 0%    2.70ms =C2=B1 0%    +78.80% =
 (p=3D0.000 n=3D9+10)
+VerifyPSS/2048-8        8.27=C2=B5s =C2=B1 1%  355.65=C2=B5s =C2=B1 0%  =
+4199.39%  (p=3D0.000 n=3D10+10)
+
+Keep in mind that this is without any assembly at all, and that further
+improvements are likely possible. I think having a review of the logic
+and the cryptography would be a good idea at this stage, before we
+complicate the code too much through optimization.
+
+The bulk of the work is in nat.go. This introduces two new types: nat,
+representing natural numbers, and modulus, representing moduli used in
+modular arithmetic.
+
+A nat has an "announced size", which may be larger than its "true size",
+the number of bits needed to represent this number. Operations on a nat
+will only ever leak its announced size, never its true size, or other
+information about its value. The size of a nat is always clear based on
+how its value is set. For example, x.mod(y, m) will make the announced
+size of x match that of m, since x is reduced modulo m.
+
+Operations assume that the announced size of the operands match what's
+expected (with a few exceptions). For example, x.modAdd(y, m) assumes
+that x and y have the same announced size as m, and that they're reduced
+modulo m.
+
+Nats are represented over unsatured bits.UintSize - 1 bit limbs. This
+means that we can't reuse the assembly routines for big.Int, which use
+saturated bits.UintSize limbs. The advantage of unsaturated limbs is
+that it makes Montgomery multiplication faster, by needing fewer
+registers in a hot loop. This makes exponentiation faster, which
+consists of many Montgomery multiplications.
+
+Moduli use nat internally. Unlike nat, the true size of a modulus always
+matches its announced size. When creating a modulus, any zero padding is
+removed. Moduli will also precompute constants when created, which is
+another reason why having a separate type is desirable.
+
+Updates #20654
+
+Co-authored-by: Filippo Valsorda <filippo@golang.org>
+Change-Id: I73b61f87d58ab912e80a9644e255d552cbadcced
+Reviewed-on: https://go-review.googlesource.com/c/go/+/326012
+Run-TryBot: Filippo Valsorda <filippo@golang.org>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+Reviewed-by: Joedian Reid <joedian@golang.org>
+
+CVE: CVE-2023-45287
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/8a81fdf16=
5facdcefa06531de5af98a4db343035]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/crypto/rsa/example_test.go |  21 +-
+ src/crypto/rsa/nat.go          | 626 +++++++++++++++++++++++++++++++++
+ src/crypto/rsa/nat_test.go     | 384 ++++++++++++++++++++
+ src/crypto/rsa/pkcs1v15.go     |  47 +--
+ src/crypto/rsa/pss.go          |  49 ++-
+ src/crypto/rsa/pss_test.go     |  10 +-
+ src/crypto/rsa/rsa.go          | 172 ++++-----
+ 7 files changed, 1140 insertions(+), 169 deletions(-)
+ create mode 100644 src/crypto/rsa/nat.go
+ create mode 100644 src/crypto/rsa/nat_test.go
+
+diff --git a/src/crypto/rsa/example_test.go b/src/crypto/rsa/example_tes=
t.go
+index ce5c2d9..52e5639 100644
+--- a/src/crypto/rsa/example_test.go
++++ b/src/crypto/rsa/example_test.go
+@@ -12,7 +12,6 @@ import (
+	"crypto/sha256"
+	"encoding/hex"
+	"fmt"
+-	"io"
+	"os"
+ )
+
+@@ -36,21 +35,17 @@ import (
+ // a buffer that contains a random key. Thus, if the RSA result isn't
+ // well-formed, the implementation uses a random key in constant time.
+ func ExampleDecryptPKCS1v15SessionKey() {
+-	// crypto/rand.Reader is a good source of entropy for blinding the RSA
+-	// operation.
+-	rng :=3D rand.Reader
+-
+	// The hybrid scheme should use at least a 16-byte symmetric key. Here
+	// we read the random key that will be used if the RSA decryption isn't
+	// well-formed.
+	key :=3D make([]byte, 32)
+-	if _, err :=3D io.ReadFull(rng, key); err !=3D nil {
++	if _, err :=3D rand.Read(key); err !=3D nil {
+		panic("RNG failure")
+	}
+
+	rsaCiphertext, _ :=3D hex.DecodeString("aabbccddeeff")
+
+-	if err :=3D DecryptPKCS1v15SessionKey(rng, rsaPrivateKey, rsaCiphertex=
t, key); err !=3D nil {
++	if err :=3D DecryptPKCS1v15SessionKey(nil, rsaPrivateKey, rsaCiphertex=
t, key); err !=3D nil {
+		// Any errors that result will be =E2=80=9Cpublic=E2=80=9D =E2=80=93 m=
eaning that they
+		// can be determined without any secret information. (For
+		// instance, if the length of key is impossible given the RSA
+@@ -86,10 +81,6 @@ func ExampleDecryptPKCS1v15SessionKey() {
+ }
+
+ func ExampleSignPKCS1v15() {
+-	// crypto/rand.Reader is a good source of entropy for blinding the RSA
+-	// operation.
+-	rng :=3D rand.Reader
+-
+	message :=3D []byte("message to be signed")
+
+	// Only small messages can be signed directly; thus the hash of a
+@@ -99,7 +90,7 @@ func ExampleSignPKCS1v15() {
+	// of writing (2016).
+	hashed :=3D sha256.Sum256(message)
+
+-	signature, err :=3D SignPKCS1v15(rng, rsaPrivateKey, crypto.SHA256, ha=
shed[:])
++	signature, err :=3D SignPKCS1v15(nil, rsaPrivateKey, crypto.SHA256, ha=
shed[:])
+	if err !=3D nil {
+		fmt.Fprintf(os.Stderr, "Error from signing: %s\n", err)
+		return
+@@ -151,11 +142,7 @@ func ExampleDecryptOAEP() {
+	ciphertext, _ :=3D hex.DecodeString("4d1ee10e8f286390258c51a5e80802844c=
3e6358ad6690b7285218a7c7ed7fc3a4c7b950fbd04d4b0239cc060dcc7065ca6f84c1756=
deb71ca5685cadbb82be025e16449b905c568a19c088a1abfad54bf7ecc67a7df39943ec5=
11091a34c0f2348d04e058fcff4d55644de3cd1d580791d4524b92f3e91695582e6e340a1=
c50b6c6d78e80b4e42c5b4d45e479b492de42bbd39cc642ebb80226bb5200020d501b24a3=
7bcc2ec7f34e596b4fd6b063de4858dbf5a4e3dd18e262eda0ec2d19dbd8e890d672b63d3=
68768360b20c0b6b8592a438fa275e5fa7f60bef0dd39673fd3989cc54d2cb80c08fcd19d=
acbc265ee1c6014616b0e04ea0328c2a04e73460")
+	label :=3D []byte("orders")
+
+-	// crypto/rand.Reader is a good source of entropy for blinding the RSA
+-	// operation.
+-	rng :=3D rand.Reader
+-
+-	plaintext, err :=3D DecryptOAEP(sha256.New(), rng, test2048Key, cipher=
text, label)
++	plaintext, err :=3D DecryptOAEP(sha256.New(), nil, test2048Key, cipher=
text, label)
+	if err !=3D nil {
+		fmt.Fprintf(os.Stderr, "Error from decryption: %s\n", err)
+		return
+diff --git a/src/crypto/rsa/nat.go b/src/crypto/rsa/nat.go
+new file mode 100644
+index 0000000..da521c2
+--- /dev/null
++++ b/src/crypto/rsa/nat.go
+@@ -0,0 +1,626 @@
++// Copyright 2021 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++package rsa
++
++import (
++	"math/big"
++	"math/bits"
++)
++
++const (
++	// _W is the number of bits we use for our limbs.
++	_W =3D bits.UintSize - 1
++	// _MASK selects _W bits from a full machine word.
++	_MASK =3D (1 << _W) - 1
++)
++
++// choice represents a constant-time boolean. The value of choice is al=
ways
++// either 1 or 0. We use an int instead of bool in order to make decisi=
ons in
++// constant time by turning it into a mask.
++type choice uint
++
++func not(c choice) choice { return 1 ^ c }
++
++const yes =3D choice(1)
++const no =3D choice(0)
++
++// ctSelect returns x if on =3D=3D 1, and y if on =3D=3D 0. The executi=
on time of this
++// function does not depend on its inputs. If on is any value besides 1=
 or 0,
++// the result is undefined.
++func ctSelect(on choice, x, y uint) uint {
++	// When on =3D=3D 1, mask is 0b111..., otherwise mask is 0b000...
++	mask :=3D -uint(on)
++	// When mask is all zeros, we just have y, otherwise, y cancels with i=
tself.
++	return y ^ (mask & (y ^ x))
++}
++
++// ctEq returns 1 if x =3D=3D y, and 0 otherwise. The execution time of=
 this
++// function does not depend on its inputs.
++func ctEq(x, y uint) choice {
++	// If x !=3D y, then either x - y or y - x will generate a carry.
++	_, c1 :=3D bits.Sub(x, y, 0)
++	_, c2 :=3D bits.Sub(y, x, 0)
++	return not(choice(c1 | c2))
++}
++
++// ctGeq returns 1 if x >=3D y, and 0 otherwise. The execution time of =
this
++// function does not depend on its inputs.
++func ctGeq(x, y uint) choice {
++	// If x < y, then x - y generates a carry.
++	_, carry :=3D bits.Sub(x, y, 0)
++	return not(choice(carry))
++}
++
++// nat represents an arbitrary natural number
++//
++// Each nat has an announced length, which is the number of limbs it ha=
s stored.
++// Operations on this number are allowed to leak this length, but will =
not leak
++// any information about the values contained in those limbs.
++type nat struct {
++	// limbs is a little-endian representation in base 2^W with
++	// W =3D bits.UintSize - 1. The top bit is always unset between operat=
ions.
++	//
++	// The top bit is left unset to optimize Montgomery multiplication, in=
 the
++	// inner loop of exponentiation. Using fully saturated limbs would lea=
ve us
++	// working with 129-bit numbers on 64-bit platforms, wasting a lot of =
space,
++	// and thus time.
++	limbs []uint
++}
++
++// expand expands x to n limbs, leaving its value unchanged.
++func (x *nat) expand(n int) *nat {
++	for len(x.limbs) > n {
++		if x.limbs[len(x.limbs)-1] !=3D 0 {
++			panic("rsa: internal error: shrinking nat")
++		}
++		x.limbs =3D x.limbs[:len(x.limbs)-1]
++	}
++	if cap(x.limbs) < n {
++		newLimbs :=3D make([]uint, n)
++		copy(newLimbs, x.limbs)
++		x.limbs =3D newLimbs
++		return x
++	}
++	extraLimbs :=3D x.limbs[len(x.limbs):n]
++	for i :=3D range extraLimbs {
++		extraLimbs[i] =3D 0
++	}
++	x.limbs =3D x.limbs[:n]
++	return x
++}
++
++// reset returns a zero nat of n limbs, reusing x's storage if n <=3D c=
ap(x.limbs).
++func (x *nat) reset(n int) *nat {
++	if cap(x.limbs) < n {
++		x.limbs =3D make([]uint, n)
++		return x
++	}
++	for i :=3D range x.limbs {
++		x.limbs[i] =3D 0
++	}
++	x.limbs =3D x.limbs[:n]
++	return x
++}
++
++// clone returns a new nat, with the same value and announced length as=
 x.
++func (x *nat) clone() *nat {
++	out :=3D &nat{make([]uint, len(x.limbs))}
++	copy(out.limbs, x.limbs)
++	return out
++}
++
++// natFromBig creates a new natural number from a big.Int.
++//
++// The announced length of the resulting nat is based on the actual bit=
 size of
++// the input, ignoring leading zeroes.
++func natFromBig(x *big.Int) *nat {
++	xLimbs :=3D x.Bits()
++	bitSize :=3D bigBitLen(x)
++	requiredLimbs :=3D (bitSize + _W - 1) / _W
++
++	out :=3D &nat{make([]uint, requiredLimbs)}
++	outI :=3D 0
++	shift :=3D 0
++	for i :=3D range xLimbs {
++		xi :=3D uint(xLimbs[i])
++		out.limbs[outI] |=3D (xi << shift) & _MASK
++		outI++
++		if outI =3D=3D requiredLimbs {
++			return out
++		}
++		out.limbs[outI] =3D xi >> (_W - shift)
++		shift++ // this assumes bits.UintSize - _W =3D 1
++		if shift =3D=3D _W {
++			shift =3D 0
++			outI++
++		}
++	}
++	return out
++}
++
++// fillBytes sets bytes to x as a zero-extended big-endian byte slice.
++//
++// If bytes is not long enough to contain the number or at least len(x.=
limbs)-1
++// limbs, or has zero length, fillBytes will panic.
++func (x *nat) fillBytes(bytes []byte) []byte {
++	if len(bytes) =3D=3D 0 {
++		panic("nat: fillBytes invoked with too small buffer")
++	}
++	for i :=3D range bytes {
++		bytes[i] =3D 0
++	}
++	shift :=3D 0
++	outI :=3D len(bytes) - 1
++	for i, limb :=3D range x.limbs {
++		remainingBits :=3D _W
++		for remainingBits >=3D 8 {
++			bytes[outI] |=3D byte(limb) << shift
++			consumed :=3D 8 - shift
++			limb >>=3D consumed
++			remainingBits -=3D consumed
++			shift =3D 0
++			outI--
++			if outI < 0 {
++				if limb !=3D 0 || i < len(x.limbs)-1 {
++					panic("nat: fillBytes invoked with too small buffer")
++				}
++				return bytes
++			}
++		}
++		bytes[outI] =3D byte(limb)
++		shift =3D remainingBits
++	}
++	return bytes
++}
++
++// natFromBytes converts a slice of big-endian bytes into a nat.
++//
++// The announced length of the output depends on the length of bytes. U=
nlike
++// big.Int, creating a nat will not remove leading zeros.
++func natFromBytes(bytes []byte) *nat {
++	bitSize :=3D len(bytes) * 8
++	requiredLimbs :=3D (bitSize + _W - 1) / _W
++
++	out :=3D &nat{make([]uint, requiredLimbs)}
++	outI :=3D 0
++	shift :=3D 0
++	for i :=3D len(bytes) - 1; i >=3D 0; i-- {
++		bi :=3D bytes[i]
++		out.limbs[outI] |=3D uint(bi) << shift
++		shift +=3D 8
++		if shift >=3D _W {
++			shift -=3D _W
++			out.limbs[outI] &=3D _MASK
++			outI++
++			if shift > 0 {
++				out.limbs[outI] =3D uint(bi) >> (8 - shift)
++			}
++		}
++	}
++	return out
++}
++
++// cmpEq returns 1 if x =3D=3D y, and 0 otherwise.
++//
++// Both operands must have the same announced length.
++func (x *nat) cmpEq(y *nat) choice {
++	// Eliminate bounds checks in the loop.
++	size :=3D len(x.limbs)
++	xLimbs :=3D x.limbs[:size]
++	yLimbs :=3D y.limbs[:size]
++
++	equal :=3D yes
++	for i :=3D 0; i < size; i++ {
++		equal &=3D ctEq(xLimbs[i], yLimbs[i])
++	}
++	return equal
++}
++
++// cmpGeq returns 1 if x >=3D y, and 0 otherwise.
++//
++// Both operands must have the same announced length.
++func (x *nat) cmpGeq(y *nat) choice {
++	// Eliminate bounds checks in the loop.
++	size :=3D len(x.limbs)
++	xLimbs :=3D x.limbs[:size]
++	yLimbs :=3D y.limbs[:size]
++
++	var c uint
++	for i :=3D 0; i < size; i++ {
++		c =3D (xLimbs[i] - yLimbs[i] - c) >> _W
++	}
++	// If there was a carry, then subtracting y underflowed, so
++	// x is not greater than or equal to y.
++	return not(choice(c))
++}
++
++// assign sets x <- y if on =3D=3D 1, and does nothing otherwise.
++//
++// Both operands must have the same announced length.
++func (x *nat) assign(on choice, y *nat) *nat {
++	// Eliminate bounds checks in the loop.
++	size :=3D len(x.limbs)
++	xLimbs :=3D x.limbs[:size]
++	yLimbs :=3D y.limbs[:size]
++
++	for i :=3D 0; i < size; i++ {
++		xLimbs[i] =3D ctSelect(on, yLimbs[i], xLimbs[i])
++	}
++	return x
++}
++
++// add computes x +=3D y if on =3D=3D 1, and does nothing otherwise. It=
 returns the
++// carry of the addition regardless of on.
++//
++// Both operands must have the same announced length.
++func (x *nat) add(on choice, y *nat) (c uint) {
++	// Eliminate bounds checks in the loop.
++	size :=3D len(x.limbs)
++	xLimbs :=3D x.limbs[:size]
++	yLimbs :=3D y.limbs[:size]
++
++	for i :=3D 0; i < size; i++ {
++		res :=3D xLimbs[i] + yLimbs[i] + c
++		xLimbs[i] =3D ctSelect(on, res&_MASK, xLimbs[i])
++		c =3D res >> _W
++	}
++	return
++}
++
++// sub computes x -=3D y if on =3D=3D 1, and does nothing otherwise. It=
 returns the
++// borrow of the subtraction regardless of on.
++//
++// Both operands must have the same announced length.
++func (x *nat) sub(on choice, y *nat) (c uint) {
++	// Eliminate bounds checks in the loop.
++	size :=3D len(x.limbs)
++	xLimbs :=3D x.limbs[:size]
++	yLimbs :=3D y.limbs[:size]
++
++	for i :=3D 0; i < size; i++ {
++		res :=3D xLimbs[i] - yLimbs[i] - c
++		xLimbs[i] =3D ctSelect(on, res&_MASK, xLimbs[i])
++		c =3D res >> _W
++	}
++	return
++}
++
++// modulus is used for modular arithmetic, precomputing relevant consta=
nts.
++//
++// Moduli are assumed to be odd numbers. Moduli can also leak the exact
++// number of bits needed to store their value, and are stored without p=
adding.
++//
++// Their actual value is still kept secret.
++type modulus struct {
++	// The underlying natural number for this modulus.
++	//
++	// This will be stored without any padding, and shouldn't alias with a=
ny
++	// other natural number being used.
++	nat     *nat
++	leading int  // number of leading zeros in the modulus
++	m0inv   uint // -nat.limbs[0]=E2=81=BB=C2=B9 mod _W
++}
++
++// minusInverseModW computes -x=E2=81=BB=C2=B9 mod _W with x odd.
++//
++// This operation is used to precompute a constant involved in Montgome=
ry
++// multiplication.
++func minusInverseModW(x uint) uint {
++	// Every iteration of this loop doubles the least-significant bits of
++	// correct inverse in y. The first three bits are already correct (1=E2=
=81=BB=C2=B9 =3D 1,
++	// 3=E2=81=BB=C2=B9 =3D 3, 5=E2=81=BB=C2=B9 =3D 5, and 7=E2=81=BB=C2=B9=
 =3D 7 mod 8), so doubling five times is enough
++	// for 61 bits (and wastes only one iteration for 31 bits).
++	//
++	// See https://crypto.stackexchange.com/a/47496.
++	y :=3D x
++	for i :=3D 0; i < 5; i++ {
++		y =3D y * (2 - x*y)
++	}
++	return (1 << _W) - (y & _MASK)
++}
++
++// modulusFromNat creates a new modulus from a nat.
++//
++// The nat should be odd, nonzero, and the number of significant bits i=
n the
++// number should be leakable. The nat shouldn't be reused.
++func modulusFromNat(nat *nat) *modulus {
++	m :=3D &modulus{}
++	m.nat =3D nat
++	size :=3D len(m.nat.limbs)
++	for m.nat.limbs[size-1] =3D=3D 0 {
++		size--
++	}
++	m.nat.limbs =3D m.nat.limbs[:size]
++	m.leading =3D _W - bitLen(m.nat.limbs[size-1])
++	m.m0inv =3D minusInverseModW(m.nat.limbs[0])
++	return m
++}
++
++// bitLen is a version of bits.Len that only leaks the bit length of n,=
 but not
++// its value. bits.Len and bits.LeadingZeros use a lookup table for the
++// low-order bits on some architectures.
++func bitLen(n uint) int {
++	var len int
++	// We assume, here and elsewhere, that comparison to zero is constant =
time
++	// with respect to different non-zero values.
++	for n !=3D 0 {
++		len++
++		n >>=3D 1
++	}
++	return len
++}
++
++// bigBitLen is a version of big.Int.BitLen that only leaks the bit len=
gth of x,
++// but not its value. big.Int.BitLen uses bits.Len.
++func bigBitLen(x *big.Int) int {
++	xLimbs :=3D x.Bits()
++	fullLimbs :=3D len(xLimbs) - 1
++	topLimb :=3D uint(xLimbs[len(xLimbs)-1])
++	return fullLimbs*bits.UintSize + bitLen(topLimb)
++}
++
++// modulusSize returns the size of m in bytes.
++func modulusSize(m *modulus) int {
++	bits :=3D len(m.nat.limbs)*_W - int(m.leading)
++	return (bits + 7) / 8
++}
++
++// shiftIn calculates x =3D x << _W + y mod m.
++//
++// This assumes that x is already reduced mod m, and that y < 2^_W.
++func (x *nat) shiftIn(y uint, m *modulus) *nat {
++	d :=3D new(nat).resetFor(m)
++
++	// Eliminate bounds checks in the loop.
++	size :=3D len(m.nat.limbs)
++	xLimbs :=3D x.limbs[:size]
++	dLimbs :=3D d.limbs[:size]
++	mLimbs :=3D m.nat.limbs[:size]
++
++	// Each iteration of this loop computes x =3D 2x + b mod m, where b is=
 a bit
++	// from y. Effectively, it left-shifts x and adds y one bit at a time,
++	// reducing it every time.
++	//
++	// To do the reduction, each iteration computes both 2x + b and 2x + b=
 - m.
++	// The next iteration (and finally the return line) will use either re=
sult
++	// based on whether the subtraction underflowed.
++	needSubtraction :=3D no
++	for i :=3D _W - 1; i >=3D 0; i-- {
++		carry :=3D (y >> i) & 1
++		var borrow uint
++		for i :=3D 0; i < size; i++ {
++			l :=3D ctSelect(needSubtraction, dLimbs[i], xLimbs[i])
++
++			res :=3D l<<1 + carry
++			xLimbs[i] =3D res & _MASK
++			carry =3D res >> _W
++
++			res =3D xLimbs[i] - mLimbs[i] - borrow
++			dLimbs[i] =3D res & _MASK
++			borrow =3D res >> _W
++		}
++		// See modAdd for how carry (aka overflow), borrow (aka underflow), a=
nd
++		// needSubtraction relate.
++		needSubtraction =3D ctEq(carry, borrow)
++	}
++	return x.assign(needSubtraction, d)
++}
++
++// mod calculates out =3D x mod m.
++//
++// This works regardless how large the value of x is.
++//
++// The output will be resized to the size of m and overwritten.
++func (out *nat) mod(x *nat, m *modulus) *nat {
++	out.resetFor(m)
++	// Working our way from the most significant to the least significant =
limb,
++	// we can insert each limb at the least significant position, shifting=
 all
++	// previous limbs left by _W. This way each limb will get shifted by t=
he
++	// correct number of bits. We can insert at least N - 1 limbs without
++	// overflowing m. After that, we need to reduce every time we shift.
++	i :=3D len(x.limbs) - 1
++	// For the first N - 1 limbs we can skip the actual shifting and posit=
ion
++	// them at the shifted position, which starts at min(N - 2, i).
++	start :=3D len(m.nat.limbs) - 2
++	if i < start {
++		start =3D i
++	}
++	for j :=3D start; j >=3D 0; j-- {
++		out.limbs[j] =3D x.limbs[i]
++		i--
++	}
++	// We shift in the remaining limbs, reducing modulo m each time.
++	for i >=3D 0 {
++		out.shiftIn(x.limbs[i], m)
++		i--
++	}
++	return out
++}
++
++// expandFor ensures out has the right size to work with operations mod=
ulo m.
++//
++// This assumes that out has as many or fewer limbs than m, or that the=
 extra
++// limbs are all zero (which may happen when decoding a value that has =
leading
++// zeroes in its bytes representation that spill over the limb threshol=
d).
++func (out *nat) expandFor(m *modulus) *nat {
++	return out.expand(len(m.nat.limbs))
++}
++
++// resetFor ensures out has the right size to work with operations modu=
lo m.
++//
++// out is zeroed and may start at any size.
++func (out *nat) resetFor(m *modulus) *nat {
++	return out.reset(len(m.nat.limbs))
++}
++
++// modSub computes x =3D x - y mod m.
++//
++// The length of both operands must be the same as the modulus. Both op=
erands
++// must already be reduced modulo m.
++func (x *nat) modSub(y *nat, m *modulus) *nat {
++	underflow :=3D x.sub(yes, y)
++	// If the subtraction underflowed, add m.
++	x.add(choice(underflow), m.nat)
++	return x
++}
++
++// modAdd computes x =3D x + y mod m.
++//
++// The length of both operands must be the same as the modulus. Both op=
erands
++// must already be reduced modulo m.
++func (x *nat) modAdd(y *nat, m *modulus) *nat {
++	overflow :=3D x.add(yes, y)
++	underflow :=3D not(x.cmpGeq(m.nat)) // x < m
++
++	// Three cases are possible:
++	//
++	//   - overflow =3D 0, underflow =3D 0
++	//
++	// In this case, addition fits in our limbs, but we can still subtract=
 away
++	// m without an underflow, so we need to perform the subtraction to re=
duce
++	// our result.
++	//
++	//   - overflow =3D 0, underflow =3D 1
++	//
++	// The addition fits in our limbs, but we can't subtract m without
++	// underflowing. The result is already reduced.
++	//
++	//   - overflow =3D 1, underflow =3D 1
++	//
++	// The addition does not fit in our limbs, and the subtraction's borro=
w
++	// would cancel out with the addition's carry. We need to subtract m t=
o
++	// reduce our result.
++	//
++	// The overflow =3D 1, underflow =3D 0 case is not possible, because y=
 is at
++	// most m - 1, and if adding m - 1 overflows, then subtracting m must
++	// necessarily underflow.
++	needSubtraction :=3D ctEq(overflow, uint(underflow))
++
++	x.sub(needSubtraction, m.nat)
++	return x
++}
++
++// montgomeryRepresentation calculates x =3D x * R mod m, with R =3D 2^=
(_W * n) and
++// n =3D len(m.nat.limbs).
++//
++// Faster Montgomery multiplication replaces standard modular multiplic=
ation for
++// numbers in this representation.
++//
++// This assumes that x is already reduced mod m.
++func (x *nat) montgomeryRepresentation(m *modulus) *nat {
++	for i :=3D 0; i < len(m.nat.limbs); i++ {
++		x.shiftIn(0, m) // x =3D x * 2^_W mod m
++	}
++	return x
++}
++
++// montgomeryMul calculates d =3D a * b / R mod m, with R =3D 2^(_W * n=
) and
++// n =3D len(m.nat.limbs), using the Montgomery Multiplication techniqu=
e.
++//
++// All inputs should be the same length, not aliasing d, and already
++// reduced modulo m. d will be resized to the size of m and overwritten.
++func (d *nat) montgomeryMul(a *nat, b *nat, m *modulus) *nat {
++	// See https://bearssl.org/bigint.html#montgomery-reduction-and-multip=
lication
++	// for a description of the algorithm.
++
++	// Eliminate bounds checks in the loop.
++	size :=3D len(m.nat.limbs)
++	aLimbs :=3D a.limbs[:size]
++	bLimbs :=3D b.limbs[:size]
++	dLimbs :=3D d.resetFor(m).limbs[:size]
++	mLimbs :=3D m.nat.limbs[:size]
++
++	var overflow uint
++	for i :=3D 0; i < size; i++ {
++		f :=3D ((dLimbs[0] + aLimbs[i]*bLimbs[0]) * m.m0inv) & _MASK
++		carry :=3D uint(0)
++		for j :=3D 0; j < size; j++ {
++			// z =3D d[j] + a[i] * b[j] + f * m[j] + carry <=3D 2^(2W+1) - 2^(W+=
1) + 2^W
++			hi, lo :=3D bits.Mul(aLimbs[i], bLimbs[j])
++			z_lo, c :=3D bits.Add(dLimbs[j], lo, 0)
++			z_hi, _ :=3D bits.Add(0, hi, c)
++			hi, lo =3D bits.Mul(f, mLimbs[j])
++			z_lo, c =3D bits.Add(z_lo, lo, 0)
++			z_hi, _ =3D bits.Add(z_hi, hi, c)
++			z_lo, c =3D bits.Add(z_lo, carry, 0)
++			z_hi, _ =3D bits.Add(z_hi, 0, c)
++			if j > 0 {
++				dLimbs[j-1] =3D z_lo & _MASK
++			}
++			carry =3D z_hi<<1 | z_lo>>_W // carry <=3D 2^(W+1) - 2
++		}
++		z :=3D overflow + carry // z <=3D 2^(W+1) - 1
++		dLimbs[size-1] =3D z & _MASK
++		overflow =3D z >> _W // overflow <=3D 1
++	}
++	// See modAdd for how overflow, underflow, and needSubtraction relate.
++	underflow :=3D not(d.cmpGeq(m.nat)) // d < m
++	needSubtraction :=3D ctEq(overflow, uint(underflow))
++	d.sub(needSubtraction, m.nat)
++
++	return d
++}
++
++// modMul calculates x *=3D y mod m.
++//
++// x and y must already be reduced modulo m, they must share its announ=
ced
++// length, and they may not alias.
++func (x *nat) modMul(y *nat, m *modulus) *nat {
++	// A Montgomery multiplication by a value out of the Montgomery domain
++	// takes the result out of Montgomery representation.
++	xR :=3D x.clone().montgomeryRepresentation(m) // xR =3D x * R mod m
++	return x.montgomeryMul(xR, y, m)            // x =3D xR * y / R mod m
++}
++
++// exp calculates out =3D x^e mod m.
++//
++// The exponent e is represented in big-endian order. The output will b=
e resized
++// to the size of m and overwritten. x must already be reduced modulo m.
++func (out *nat) exp(x *nat, e []byte, m *modulus) *nat {
++	// We use a 4 bit window. For our RSA workload, 4 bit windows are fast=
er
++	// than 2 bit windows, but use an extra 12 nats worth of scratch space.
++	// Using bit sizes that don't divide 8 are more complex to implement.
++	table :=3D make([]*nat, (1<<4)-1) // table[i] =3D x ^ (i+1)
++	table[0] =3D x.clone().montgomeryRepresentation(m)
++	for i :=3D 1; i < len(table); i++ {
++		table[i] =3D new(nat).expandFor(m)
++		table[i].montgomeryMul(table[i-1], table[0], m)
++	}
++
++	out.resetFor(m)
++	out.limbs[0] =3D 1
++	out.montgomeryRepresentation(m)
++	t0 :=3D new(nat).expandFor(m)
++	t1 :=3D new(nat).expandFor(m)
++	for _, b :=3D range e {
++		for _, j :=3D range []int{4, 0} {
++			// Square four times.
++			t1.montgomeryMul(out, out, m)
++			out.montgomeryMul(t1, t1, m)
++			t1.montgomeryMul(out, out, m)
++			out.montgomeryMul(t1, t1, m)
++
++			// Select x^k in constant time from the table.
++			k :=3D uint((b >> j) & 0b1111)
++			for i :=3D range table {
++				t0.assign(ctEq(k, uint(i+1)), table[i])
++			}
++
++			// Multiply by x^k, discarding the result if k =3D 0.
++			t1.montgomeryMul(out, t0, m)
++			out.assign(not(ctEq(k, 0)), t1)
++		}
++	}
++
++	// By Montgomery multiplying with 1 not in Montgomery representation, =
we
++	// convert out back from Montgomery representation, because it works o=
ut to
++	// dividing by R.
++	t0.assign(yes, out)
++	t1.resetFor(m)
++	t1.limbs[0] =3D 1
++	out.montgomeryMul(t0, t1, m)
++
++	return out
++}
+diff --git a/src/crypto/rsa/nat_test.go b/src/crypto/rsa/nat_test.go
+new file mode 100644
+index 0000000..3e6eb10
+--- /dev/null
++++ b/src/crypto/rsa/nat_test.go
+@@ -0,0 +1,384 @@
++// Copyright 2021 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++package rsa
++
++import (
++	"bytes"
++	"math/big"
++	"math/bits"
++	"math/rand"
++	"reflect"
++	"testing"
++	"testing/quick"
++)
++
++// Generate generates an even nat. It's used by testing/quick to produc=
e random
++// *nat values for quick.Check invocations.
++func (*nat) Generate(r *rand.Rand, size int) reflect.Value {
++	limbs :=3D make([]uint, size)
++	for i :=3D 0; i < size; i++ {
++		limbs[i] =3D uint(r.Uint64()) & ((1 << _W) - 2)
++	}
++	return reflect.ValueOf(&nat{limbs})
++}
++
++func testModAddCommutative(a *nat, b *nat) bool {
++	mLimbs :=3D make([]uint, len(a.limbs))
++	for i :=3D 0; i < len(mLimbs); i++ {
++		mLimbs[i] =3D _MASK
++	}
++	m :=3D modulusFromNat(&nat{mLimbs})
++	aPlusB :=3D a.clone()
++	aPlusB.modAdd(b, m)
++	bPlusA :=3D b.clone()
++	bPlusA.modAdd(a, m)
++	return aPlusB.cmpEq(bPlusA) =3D=3D 1
++}
++
++func TestModAddCommutative(t *testing.T) {
++	err :=3D quick.Check(testModAddCommutative, &quick.Config{})
++	if err !=3D nil {
++		t.Error(err)
++	}
++}
++
++func testModSubThenAddIdentity(a *nat, b *nat) bool {
++	mLimbs :=3D make([]uint, len(a.limbs))
++	for i :=3D 0; i < len(mLimbs); i++ {
++		mLimbs[i] =3D _MASK
++	}
++	m :=3D modulusFromNat(&nat{mLimbs})
++	original :=3D a.clone()
++	a.modSub(b, m)
++	a.modAdd(b, m)
++	return a.cmpEq(original) =3D=3D 1
++}
++
++func TestModSubThenAddIdentity(t *testing.T) {
++	err :=3D quick.Check(testModSubThenAddIdentity, &quick.Config{})
++	if err !=3D nil {
++		t.Error(err)
++	}
++}
++
++func testMontgomeryRoundtrip(a *nat) bool {
++	one :=3D &nat{make([]uint, len(a.limbs))}
++	one.limbs[0] =3D 1
++	aPlusOne :=3D a.clone()
++	aPlusOne.add(1, one)
++	m :=3D modulusFromNat(aPlusOne)
++	monty :=3D a.clone()
++	monty.montgomeryRepresentation(m)
++	aAgain :=3D monty.clone()
++	aAgain.montgomeryMul(monty, one, m)
++	return a.cmpEq(aAgain) =3D=3D 1
++}
++
++func TestMontgomeryRoundtrip(t *testing.T) {
++	err :=3D quick.Check(testMontgomeryRoundtrip, &quick.Config{})
++	if err !=3D nil {
++		t.Error(err)
++	}
++}
++
++func TestFromBig(t *testing.T) {
++	expected :=3D []byte{0x01, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0=
xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}
++	theBig :=3D new(big.Int).SetBytes(expected)
++	actual :=3D natFromBig(theBig).fillBytes(make([]byte, len(expected)))
++	if !bytes.Equal(actual, expected) {
++		t.Errorf("%+x !=3D %+x", actual, expected)
++	}
++}
++
++func TestFillBytes(t *testing.T) {
++	xBytes :=3D []byte{0xAA, 0xFF, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x8=
8}
++	x :=3D natFromBytes(xBytes)
++	for l :=3D 20; l >=3D len(xBytes); l-- {
++		buf :=3D make([]byte, l)
++		rand.Read(buf)
++		actual :=3D x.fillBytes(buf)
++		expected :=3D make([]byte, l)
++		copy(expected[l-len(xBytes):], xBytes)
++		if !bytes.Equal(actual, expected) {
++			t.Errorf("%d: %+v !=3D %+v", l, actual, expected)
++		}
++	}
++	for l :=3D len(xBytes) - 1; l >=3D 0; l-- {
++		(func() {
++			defer func() {
++				if recover() =3D=3D nil {
++					t.Errorf("%d: expected panic", l)
++				}
++			}()
++			x.fillBytes(make([]byte, l))
++		})()
++	}
++}
++
++func TestFromBytes(t *testing.T) {
++	f :=3D func(xBytes []byte) bool {
++		if len(xBytes) =3D=3D 0 {
++			return true
++		}
++		actual :=3D natFromBytes(xBytes).fillBytes(make([]byte, len(xBytes)))
++		if !bytes.Equal(actual, xBytes) {
++			t.Errorf("%+x !=3D %+x", actual, xBytes)
++			return false
++		}
++		return true
++	}
++
++	err :=3D quick.Check(f, &quick.Config{})
++	if err !=3D nil {
++		t.Error(err)
++	}
++
++	f([]byte{0xFF, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88})
++	f(bytes.Repeat([]byte{0xFF}, _W))
++}
++
++func TestShiftIn(t *testing.T) {
++	if bits.UintSize !=3D 64 {
++		t.Skip("examples are only valid in 64 bit")
++	}
++	examples :=3D []struct {
++		m, x, expected []byte
++		y              uint64
++	}{{
++		m:        []byte{13},
++		x:        []byte{0},
++		y:        0x7FFF_FFFF_FFFF_FFFF,
++		expected: []byte{7},
++	}, {
++		m:        []byte{13},
++		x:        []byte{7},
++		y:        0x7FFF_FFFF_FFFF_FFFF,
++		expected: []byte{11},
++	}, {
++		m:        []byte{0x06, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0d=
},
++		x:        make([]byte, 9),
++		y:        0x7FFF_FFFF_FFFF_FFFF,
++		expected: []byte{0x00, 0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff=
},
++	}, {
++		m:        []byte{0x06, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0d=
},
++		x:        []byte{0x00, 0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff=
},
++		y:        0,
++		expected: []byte{0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08=
},
++	}}
++
++	for i, tt :=3D range examples {
++		m :=3D modulusFromNat(natFromBytes(tt.m))
++		got :=3D natFromBytes(tt.x).expandFor(m).shiftIn(uint(tt.y), m)
++		if got.cmpEq(natFromBytes(tt.expected).expandFor(m)) !=3D 1 {
++			t.Errorf("%d: got %x, expected %x", i, got, tt.expected)
++		}
++	}
++}
++
++func TestModulusAndNatSizes(t *testing.T) {
++	// These are 126 bit (2 * _W on 64-bit architectures) values, serializ=
ed as
++	// 128 bits worth of bytes. If leading zeroes are stripped, they fit i=
n two
++	// limbs, if they are not, they fit in three. This can be a problem be=
cause
++	// modulus strips leading zeroes and nat does not.
++	m :=3D modulusFromNat(natFromBytes([]byte{
++		0x3f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
++		0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff}))
++	x :=3D natFromBytes([]byte{
++		0x3f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
++		0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfe})
++	x.expandFor(m) // must not panic for shrinking
++}
++
++func TestExpand(t *testing.T) {
++	sliced :=3D []uint{1, 2, 3, 4}
++	examples :=3D []struct {
++		in  []uint
++		n   int
++		out []uint
++	}{{
++		[]uint{1, 2},
++		4,
++		[]uint{1, 2, 0, 0},
++	}, {
++		sliced[:2],
++		4,
++		[]uint{1, 2, 0, 0},
++	}, {
++		[]uint{1, 2},
++		2,
++		[]uint{1, 2},
++	}, {
++		[]uint{1, 2, 0},
++		2,
++		[]uint{1, 2},
++	}}
++
++	for i, tt :=3D range examples {
++		got :=3D (&nat{tt.in}).expand(tt.n)
++		if len(got.limbs) !=3D len(tt.out) || got.cmpEq(&nat{tt.out}) !=3D 1 =
{
++			t.Errorf("%d: got %x, expected %x", i, got, tt.out)
++		}
++	}
++}
++
++func TestMod(t *testing.T) {
++	m :=3D modulusFromNat(natFromBytes([]byte{0x06, 0x80, 0x00, 0x00, 0x00=
, 0x00, 0x00, 0x00, 0x0d}))
++	x :=3D natFromBytes([]byte{0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01})
++	out :=3D new(nat)
++	out.mod(x, m)
++	expected :=3D natFromBytes([]byte{0x04, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00, 0x00, 0x09})
++	if out.cmpEq(expected) !=3D 1 {
++		t.Errorf("%+v !=3D %+v", out, expected)
++	}
++}
++
++func TestModSub(t *testing.T) {
++	m :=3D modulusFromNat(&nat{[]uint{13}})
++	x :=3D &nat{[]uint{6}}
++	y :=3D &nat{[]uint{7}}
++	x.modSub(y, m)
++	expected :=3D &nat{[]uint{12}}
++	if x.cmpEq(expected) !=3D 1 {
++		t.Errorf("%+v !=3D %+v", x, expected)
++	}
++	x.modSub(y, m)
++	expected =3D &nat{[]uint{5}}
++	if x.cmpEq(expected) !=3D 1 {
++		t.Errorf("%+v !=3D %+v", x, expected)
++	}
++}
++
++func TestModAdd(t *testing.T) {
++	m :=3D modulusFromNat(&nat{[]uint{13}})
++	x :=3D &nat{[]uint{6}}
++	y :=3D &nat{[]uint{7}}
++	x.modAdd(y, m)
++	expected :=3D &nat{[]uint{0}}
++	if x.cmpEq(expected) !=3D 1 {
++		t.Errorf("%+v !=3D %+v", x, expected)
++	}
++	x.modAdd(y, m)
++	expected =3D &nat{[]uint{7}}
++	if x.cmpEq(expected) !=3D 1 {
++		t.Errorf("%+v !=3D %+v", x, expected)
++	}
++}
++
++func TestExp(t *testing.T) {
++	m :=3D modulusFromNat(&nat{[]uint{13}})
++	x :=3D &nat{[]uint{3}}
++	out :=3D &nat{[]uint{0}}
++	out.exp(x, []byte{12}, m)
++	expected :=3D &nat{[]uint{1}}
++	if out.cmpEq(expected) !=3D 1 {
++		t.Errorf("%+v !=3D %+v", out, expected)
++	}
++}
++
++func makeBenchmarkModulus() *modulus {
++	m :=3D make([]uint, 32)
++	for i :=3D 0; i < 32; i++ {
++		m[i] =3D _MASK
++	}
++	return modulusFromNat(&nat{limbs: m})
++}
++
++func makeBenchmarkValue() *nat {
++	x :=3D make([]uint, 32)
++	for i :=3D 0; i < 32; i++ {
++		x[i] =3D _MASK - 1
++	}
++	return &nat{limbs: x}
++}
++
++func makeBenchmarkExponent() []byte {
++	e :=3D make([]byte, 256)
++	for i :=3D 0; i < 32; i++ {
++		e[i] =3D 0xFF
++	}
++	return e
++}
++
++func BenchmarkModAdd(b *testing.B) {
++	x :=3D makeBenchmarkValue()
++	y :=3D makeBenchmarkValue()
++	m :=3D makeBenchmarkModulus()
++
++	b.ResetTimer()
++	for i :=3D 0; i < b.N; i++ {
++		x.modAdd(y, m)
++	}
++}
++
++func BenchmarkModSub(b *testing.B) {
++	x :=3D makeBenchmarkValue()
++	y :=3D makeBenchmarkValue()
++	m :=3D makeBenchmarkModulus()
++
++	b.ResetTimer()
++	for i :=3D 0; i < b.N; i++ {
++		x.modSub(y, m)
++	}
++}
++
++func BenchmarkMontgomeryRepr(b *testing.B) {
++	x :=3D makeBenchmarkValue()
++	m :=3D makeBenchmarkModulus()
++
++	b.ResetTimer()
++	for i :=3D 0; i < b.N; i++ {
++		x.montgomeryRepresentation(m)
++	}
++}
++
++func BenchmarkMontgomeryMul(b *testing.B) {
++	x :=3D makeBenchmarkValue()
++	y :=3D makeBenchmarkValue()
++	out :=3D makeBenchmarkValue()
++	m :=3D makeBenchmarkModulus()
++
++	b.ResetTimer()
++	for i :=3D 0; i < b.N; i++ {
++		out.montgomeryMul(x, y, m)
++	}
++}
++
++func BenchmarkModMul(b *testing.B) {
++	x :=3D makeBenchmarkValue()
++	y :=3D makeBenchmarkValue()
++	m :=3D makeBenchmarkModulus()
++
++	b.ResetTimer()
++	for i :=3D 0; i < b.N; i++ {
++		x.modMul(y, m)
++	}
++}
++
++func BenchmarkExpBig(b *testing.B) {
++	out :=3D new(big.Int)
++	exponentBytes :=3D makeBenchmarkExponent()
++	x :=3D new(big.Int).SetBytes(exponentBytes)
++	e :=3D new(big.Int).SetBytes(exponentBytes)
++	n :=3D new(big.Int).SetBytes(exponentBytes)
++	one :=3D new(big.Int).SetUint64(1)
++	n.Add(n, one)
++
++	b.ResetTimer()
++	for i :=3D 0; i < b.N; i++ {
++		out.Exp(x, e, n)
++	}
++}
++
++func BenchmarkExp(b *testing.B) {
++	x :=3D makeBenchmarkValue()
++	e :=3D makeBenchmarkExponent()
++	out :=3D makeBenchmarkValue()
++	m :=3D makeBenchmarkModulus()
++
++	b.ResetTimer()
++	for i :=3D 0; i < b.N; i++ {
++		out.exp(x, e, m)
++	}
++}
+diff --git a/src/crypto/rsa/pkcs1v15.go b/src/crypto/rsa/pkcs1v15.go
+index 0cbd6d0..90233bb 100644
+--- a/src/crypto/rsa/pkcs1v15.go
++++ b/src/crypto/rsa/pkcs1v15.go
+@@ -9,7 +9,6 @@ import (
+	"crypto/subtle"
+	"errors"
+	"io"
+-	"math/big"
+
+	"crypto/internal/randutil"
+ )
+@@ -58,14 +57,11 @@ func EncryptPKCS1v15(rand io.Reader, pub *PublicKey,=
 msg []byte) ([]byte, error)
+	em[len(em)-len(msg)-1] =3D 0
+	copy(mm, msg)
+
+-	m :=3D new(big.Int).SetBytes(em)
+-	c :=3D encrypt(new(big.Int), pub, m)
+-
+-	return c.FillBytes(em), nil
++	return encrypt(pub, em), nil
+ }
+
+ // DecryptPKCS1v15 decrypts a plaintext using RSA and the padding schem=
e from PKCS #1 v1.5.
+-// If rand !=3D nil, it uses RSA blinding to avoid timing side-channel =
attacks.
++// The random parameter is legacy and ignored, and it can be as nil.
+ //
+ // Note that whether this function returns an error or not discloses se=
cret
+ // information. If an attacker can cause this function to run repeatedl=
y and
+@@ -76,7 +72,7 @@ func DecryptPKCS1v15(rand io.Reader, priv *PrivateKey,=
 ciphertext []byte) ([]byt
+	if err :=3D checkPub(&priv.PublicKey); err !=3D nil {
+		return nil, err
+	}
+-	valid, out, index, err :=3D decryptPKCS1v15(rand, priv, ciphertext)
++	valid, out, index, err :=3D decryptPKCS1v15(priv, ciphertext)
+	if err !=3D nil {
+		return nil, err
+	}
+@@ -87,7 +83,7 @@ func DecryptPKCS1v15(rand io.Reader, priv *PrivateKey,=
 ciphertext []byte) ([]byt
+ }
+
+ // DecryptPKCS1v15SessionKey decrypts a session key using RSA and the p=
adding scheme from PKCS #1 v1.5.
+-// If rand !=3D nil, it uses RSA blinding to avoid timing side-channel =
attacks.
++// The random parameter is legacy and ignored, and it can be as nil.
+ // It returns an error if the ciphertext is the wrong length or if the
+ // ciphertext is greater than the public modulus. Otherwise, no error i=
s
+ // returned. If the padding is valid, the resulting plaintext message i=
s copied
+@@ -114,7 +110,7 @@ func DecryptPKCS1v15SessionKey(rand io.Reader, priv =
*PrivateKey, ciphertext []by
+		return ErrDecryption
+	}
+
+-	valid, em, index, err :=3D decryptPKCS1v15(rand, priv, ciphertext)
++	valid, em, index, err :=3D decryptPKCS1v15(priv, ciphertext)
+	if err !=3D nil {
+		return err
+	}
+@@ -130,26 +126,24 @@ func DecryptPKCS1v15SessionKey(rand io.Reader, pri=
v *PrivateKey, ciphertext []by
+	return nil
+ }
+
+-// decryptPKCS1v15 decrypts ciphertext using priv and blinds the operat=
ion if
+-// rand is not nil. It returns one or zero in valid that indicates whet=
her the
+-// plaintext was correctly structured. In either case, the plaintext is
+-// returned in em so that it may be read independently of whether it wa=
s valid
+-// in order to maintain constant memory access patterns. If the plainte=
xt was
+-// valid then index contains the index of the original message in em.
+-func decryptPKCS1v15(rand io.Reader, priv *PrivateKey, ciphertext []byt=
e) (valid int, em []byte, index int, err error) {
++// decryptPKCS1v15 decrypts ciphertext using priv. It returns one or ze=
ro in
++// valid that indicates whether the plaintext was correctly structured.
++// In either case, the plaintext is returned in em so that it may be re=
ad
++// independently of whether it was valid in order to maintain constant =
memory
++// access patterns. If the plaintext was valid then index contains the =
index of
++// the original message in em, to allow constant time padding removal.
++func decryptPKCS1v15(priv *PrivateKey, ciphertext []byte) (valid int, e=
m []byte, index int, err error) {
+	k :=3D priv.Size()
+	if k < 11 {
+		err =3D ErrDecryption
+		return
+	}
+
+-	c :=3D new(big.Int).SetBytes(ciphertext)
+-	m, err :=3D decrypt(rand, priv, c)
++	em, err =3D decrypt(priv, ciphertext)
+	if err !=3D nil {
+		return
+	}
+
+-	em =3D m.FillBytes(make([]byte, k))
+	firstByteIsZero :=3D subtle.ConstantTimeByteEq(em[0], 0)
+	secondByteIsTwo :=3D subtle.ConstantTimeByteEq(em[1], 2)
+
+@@ -221,8 +215,7 @@ var hashPrefixes =3D map[crypto.Hash][]byte{
+ // function. If hash is zero, hashed is signed directly. This isn't
+ // advisable except for interoperability.
+ //
+-// If rand is not nil then RSA blinding will be used to avoid timing
+-// side-channel attacks.
++// The random parameter is legacy and ignored, and it can be as nil.
+ //
+ // This function is deterministic. Thus, if the set of possible
+ // messages is small, an attacker may be able to build a map from
+@@ -249,13 +242,7 @@ func SignPKCS1v15(rand io.Reader, priv *PrivateKey,=
 hash crypto.Hash, hashed []b
+	copy(em[k-tLen:k-hashLen], prefix)
+	copy(em[k-hashLen:k], hashed)
+
+-	m :=3D new(big.Int).SetBytes(em)
+-	c, err :=3D decryptAndCheck(rand, priv, m)
+-	if err !=3D nil {
+-		return nil, err
+-	}
+-
+-	return c.FillBytes(em), nil
++	return decryptAndCheck(priv, em)
+ }
+
+ // VerifyPKCS1v15 verifies an RSA PKCS #1 v1.5 signature.
+@@ -282,9 +269,7 @@ func VerifyPKCS1v15(pub *PublicKey, hash crypto.Hash=
, hashed []byte, sig []byte)
+		return ErrVerification
+	}
+
+-	c :=3D new(big.Int).SetBytes(sig)
+-	m :=3D encrypt(new(big.Int), pub, c)
+-	em :=3D m.FillBytes(make([]byte, k))
++	em :=3D encrypt(pub, sig)
+	// EM =3D 0x00 || 0x01 || PS || 0x00 || T
+
+	ok :=3D subtle.ConstantTimeByteEq(em[0], 0)
+diff --git a/src/crypto/rsa/pss.go b/src/crypto/rsa/pss.go
+index 814522d..aeb6148 100644
+--- a/src/crypto/rsa/pss.go
++++ b/src/crypto/rsa/pss.go
+@@ -12,7 +12,6 @@ import (
+	"errors"
+	"hash"
+	"io"
+-	"math/big"
+ )
+
+ // Per RFC 8017, Section 9.1
+@@ -207,19 +206,26 @@ func emsaPSSVerify(mHash, em []byte, emBits, sLen =
int, hash hash.Hash) error {
+ // Note that hashed must be the result of hashing the input message usi=
ng the
+ // given hash function. salt is a random sequence of bytes whose length=
 will be
+ // later used to verify the signature.
+-func signPSSWithSalt(rand io.Reader, priv *PrivateKey, hash crypto.Hash=
, hashed, salt []byte) ([]byte, error) {
+-	emBits :=3D priv.N.BitLen() - 1
++func signPSSWithSalt(priv *PrivateKey, hash crypto.Hash, hashed, salt [=
]byte) ([]byte, error) {
++	emBits :=3D bigBitLen(priv.N) - 1
+	em, err :=3D emsaPSSEncode(hashed, emBits, salt, hash.New())
+	if err !=3D nil {
+		return nil, err
+	}
+-	m :=3D new(big.Int).SetBytes(em)
+-	c, err :=3D decryptAndCheck(rand, priv, m)
+-	if err !=3D nil {
+-		return nil, err
++	// RFC 8017: "Note that the octet length of EM will be one less than k=
 if
++	// modBits - 1 is divisible by 8 and equal to k otherwise, where k is =
the
++	// length in octets of the RSA modulus n." =F0=9F=99=84
++	//
++	// This is extremely annoying, as all other encrypt and decrypt inputs=
 are
++	// always the exact same size as the modulus. Since it only happens fo=
r
++	// weird modulus sizes, fix it by padding inefficiently.
++	if emLen, k :=3D len(em), priv.Size(); emLen < k {
++		emNew :=3D make([]byte, k)
++		copy(emNew[k-emLen:], em)
++		em =3D emNew
+	}
+-	s :=3D make([]byte, priv.Size())
+-	return c.FillBytes(s), nil
++
++	return decryptAndCheck(priv, em)
+ }
+
+ const (
+@@ -269,7 +275,7 @@ func SignPSS(rand io.Reader, priv *PrivateKey, hash =
crypto.Hash, digest []byte,
+	saltLength :=3D opts.saltLength()
+	switch saltLength {
+	case PSSSaltLengthAuto:
+-		saltLength =3D (priv.N.BitLen()-1+7)/8 - 2 - hash.Size()
++		saltLength =3D (bigBitLen(priv.N)-1+7)/8 - 2 - hash.Size()
+	case PSSSaltLengthEqualsHash:
+		saltLength =3D hash.Size()
+	}
+@@ -278,7 +284,7 @@ func SignPSS(rand io.Reader, priv *PrivateKey, hash =
crypto.Hash, digest []byte,
+	if _, err :=3D io.ReadFull(rand, salt); err !=3D nil {
+		return nil, err
+	}
+-	return signPSSWithSalt(rand, priv, hash, digest, salt)
++	return signPSSWithSalt(priv, hash, digest, salt)
+ }
+
+ // VerifyPSS verifies a PSS signature.
+@@ -291,13 +297,22 @@ func VerifyPSS(pub *PublicKey, hash crypto.Hash, d=
igest []byte, sig []byte, opts
+	if len(sig) !=3D pub.Size() {
+		return ErrVerification
+	}
+-	s :=3D new(big.Int).SetBytes(sig)
+-	m :=3D encrypt(new(big.Int), pub, s)
+-	emBits :=3D pub.N.BitLen() - 1
++
++	emBits :=3D bigBitLen(pub.N) - 1
+	emLen :=3D (emBits + 7) / 8
+-	if m.BitLen() > emLen*8 {
+-		return ErrVerification
++	em :=3D encrypt(pub, sig)
++
++	// Like in signPSSWithSalt, deal with mismatches between emLen and the=
 size
++	// of the modulus. The spec would have us wire emLen into the encoding
++	// function, but we'd rather always encode to the size of the modulus =
and
++	// then strip leading zeroes if necessary. This only happens for weird
++	// modulus sizes anyway.
++	for len(em) > emLen && len(em) > 0 {
++		if em[0] !=3D 0 {
++			return ErrVerification
++		}
++		em =3D em[1:]
+	}
+-	em :=3D m.FillBytes(make([]byte, emLen))
++
+	return emsaPSSVerify(digest, em, emBits, opts.saltLength(), hash.New())
+ }
+diff --git a/src/crypto/rsa/pss_test.go b/src/crypto/rsa/pss_test.go
+index c3a6d46..d018b43 100644
+--- a/src/crypto/rsa/pss_test.go
++++ b/src/crypto/rsa/pss_test.go
+@@ -233,7 +233,10 @@ func TestPSSSigning(t *testing.T) {
+	}
+ }
+
+-func TestSignWithPSSSaltLengthAuto(t *testing.T) {
++func TestPSS513(t *testing.T) {
++	// See Issue 42741, and separately, RFC 8017: "Note that the octet len=
gth of
++	// EM will be one less than k if modBits - 1 is divisible by 8 and equ=
al to
++	// k otherwise, where k is the length in octets of the RSA modulus n."
+	key, err :=3D GenerateKey(rand.Reader, 513)
+	if err !=3D nil {
+		t.Fatal(err)
+@@ -246,8 +249,9 @@ func TestSignWithPSSSaltLengthAuto(t *testing.T) {
+	if err !=3D nil {
+		t.Fatal(err)
+	}
+-	if len(signature) =3D=3D 0 {
+-		t.Fatal("empty signature returned")
++	err =3D VerifyPSS(&key.PublicKey, crypto.SHA256, digest[:], signature,=
 nil)
++	if err !=3D nil {
++		t.Error(err)
+	}
+ }
+
+diff --git a/src/crypto/rsa/rsa.go b/src/crypto/rsa/rsa.go
+index 6fd59b3..20c1fe1 100644
+--- a/src/crypto/rsa/rsa.go
++++ b/src/crypto/rsa/rsa.go
+@@ -19,13 +19,17 @@
+ // over the public key primitive, the PrivateKey type implements the
+ // Decrypter and Signer interfaces from the crypto package.
+ //
+-// The RSA operations in this package are not implemented using constan=
t-time algorithms.
++// Operations in this package are implemented using constant-time algor=
ithms,
++// except for [GenerateKey], [PrivateKey.Precompute], and [PrivateKey.V=
alidate].
++// Every other operation only leaks the bit size of the involved values=
, which
++// all depend on the selected key size.
+ package rsa
+
+ import (
+	"crypto"
+	"crypto/rand"
+	"crypto/subtle"
++	"encoding/binary"
+	"errors"
+	"hash"
+	"io"
+@@ -35,7 +39,6 @@ import (
+	"crypto/internal/randutil"
+ )
+
+-var bigZero =3D big.NewInt(0)
+ var bigOne =3D big.NewInt(1)
+
+ // A PublicKey represents the public part of an RSA key.
+@@ -50,7 +53,7 @@ type PublicKey struct {
+ // Size returns the modulus size in bytes. Raw signatures and ciphertex=
ts
+ // for or by this public key will have the same size.
+ func (pub *PublicKey) Size() int {
+-	return (pub.N.BitLen() + 7) / 8
++	return (bigBitLen(pub.N) + 7) / 8
+ }
+
+ // Equal reports whether pub and x have the same value.
+@@ -384,10 +387,18 @@ func mgf1XOR(out []byte, hash hash.Hash, seed []by=
te) {
+ // too large for the size of the public key.
+ var ErrMessageTooLong =3D errors.New("crypto/rsa: message too long for =
RSA public key size")
+
+-func encrypt(c *big.Int, pub *PublicKey, m *big.Int) *big.Int {
+-	e :=3D big.NewInt(int64(pub.E))
+-	c.Exp(m, e, pub.N)
+-	return c
++func encrypt(pub *PublicKey, plaintext []byte) []byte {
++	N :=3D modulusFromNat(natFromBig(pub.N))
++	m :=3D natFromBytes(plaintext).expandFor(N)
++
++	e :=3D make([]byte, 8)
++	binary.BigEndian.PutUint64(e, uint64(pub.E))
++	for len(e) > 1 && e[0] =3D=3D 0 {
++		e =3D e[1:]
++	}
++
++	out :=3D make([]byte, modulusSize(N))
++	return new(nat).exp(m, e, N).fillBytes(out)
+ }
+
+ // EncryptOAEP encrypts the given message with RSA-OAEP.
+@@ -437,12 +448,7 @@ func EncryptOAEP(hash hash.Hash, random io.Reader, =
pub *PublicKey, msg []byte, l
+	mgf1XOR(db, hash, seed)
+	mgf1XOR(seed, hash, db)
+
+-	m :=3D new(big.Int)
+-	m.SetBytes(em)
+-	c :=3D encrypt(new(big.Int), pub, m)
+-
+-	out :=3D make([]byte, k)
+-	return c.FillBytes(out), nil
++	return encrypt(pub, em), nil
+ }
+
+ // ErrDecryption represents a failure to decrypt a message.
+@@ -484,98 +490,70 @@ func (priv *PrivateKey) Precompute() {
+	}
+ }
+
+-// decrypt performs an RSA decryption, resulting in a plaintext integer=
. If a
+-// random source is given, RSA blinding is used.
+-func decrypt(random io.Reader, priv *PrivateKey, c *big.Int) (m *big.In=
t, err error) {
+-	// TODO(agl): can we get away with reusing blinds?
+-	if c.Cmp(priv.N) > 0 {
+-		err =3D ErrDecryption
+-		return
++// decrypt performs an RSA decryption of ciphertext into out.
++func decrypt(priv *PrivateKey, ciphertext []byte) ([]byte, error) {
++	N :=3D modulusFromNat(natFromBig(priv.N))
++	c :=3D natFromBytes(ciphertext).expandFor(N)
++	if c.cmpGeq(N.nat) =3D=3D 1 {
++		return nil, ErrDecryption
+	}
+	if priv.N.Sign() =3D=3D 0 {
+		return nil, ErrDecryption
+	}
+
+-	var ir *big.Int
+-	if random !=3D nil {
+-		randutil.MaybeReadByte(random)
+-
+-		// Blinding enabled. Blinding involves multiplying c by r^e.
+-		// Then the decryption operation performs (m^e * r^e)^d mod n
+-		// which equals mr mod n. The factor of r can then be removed
+-		// by multiplying by the multiplicative inverse of r.
+-
+-		var r *big.Int
+-		ir =3D new(big.Int)
+-		for {
+-			r, err =3D rand.Int(random, priv.N)
+-			if err !=3D nil {
+-				return
+-			}
+-			if r.Cmp(bigZero) =3D=3D 0 {
+-				r =3D bigOne
+-			}
+-			ok :=3D ir.ModInverse(r, priv.N)
+-			if ok !=3D nil {
+-				break
+-			}
+-		}
+-		bigE :=3D big.NewInt(int64(priv.E))
+-		rpowe :=3D new(big.Int).Exp(r, bigE, priv.N) // N !=3D 0
+-		cCopy :=3D new(big.Int).Set(c)
+-		cCopy.Mul(cCopy, rpowe)
+-		cCopy.Mod(cCopy, priv.N)
+-		c =3D cCopy
+-	}
+-
++	// Note that because our private decryption exponents are stored as bi=
g.Int,
++	// we potentially leak the exact number of bits of these exponents. Th=
is
++	// isn't great, but should be fine.
+	if priv.Precomputed.Dp =3D=3D nil {
+-		m =3D new(big.Int).Exp(c, priv.D, priv.N)
+-	} else {
+-		// We have the precalculated values needed for the CRT.
+-		m =3D new(big.Int).Exp(c, priv.Precomputed.Dp, priv.Primes[0])
+-		m2 :=3D new(big.Int).Exp(c, priv.Precomputed.Dq, priv.Primes[1])
+-		m.Sub(m, m2)
+-		if m.Sign() < 0 {
+-			m.Add(m, priv.Primes[0])
+-		}
+-		m.Mul(m, priv.Precomputed.Qinv)
+-		m.Mod(m, priv.Primes[0])
+-		m.Mul(m, priv.Primes[1])
+-		m.Add(m, m2)
+-
+-		for i, values :=3D range priv.Precomputed.CRTValues {
+-			prime :=3D priv.Primes[2+i]
+-			m2.Exp(c, values.Exp, prime)
+-			m2.Sub(m2, m)
+-			m2.Mul(m2, values.Coeff)
+-			m2.Mod(m2, prime)
+-			if m2.Sign() < 0 {
+-				m2.Add(m2, prime)
+-			}
+-			m2.Mul(m2, values.R)
+-			m.Add(m, m2)
+-		}
+-	}
+-
+-	if ir !=3D nil {
+-		// Unblind.
+-		m.Mul(m, ir)
+-		m.Mod(m, priv.N)
+-	}
+-
+-	return
++		out :=3D make([]byte, modulusSize(N))
++		return new(nat).exp(c, priv.D.Bytes(), N).fillBytes(out), nil
++	}
++
++	t0 :=3D new(nat)
++	P :=3D modulusFromNat(natFromBig(priv.Primes[0]))
++	Q :=3D modulusFromNat(natFromBig(priv.Primes[1]))
++	// m =3D c ^ Dp mod p
++	m :=3D new(nat).exp(t0.mod(c, P), priv.Precomputed.Dp.Bytes(), P)
++	// m2 =3D c ^ Dq mod q
++	m2 :=3D new(nat).exp(t0.mod(c, Q), priv.Precomputed.Dq.Bytes(), Q)
++	// m =3D m - m2 mod p
++	m.modSub(t0.mod(m2, P), P)
++	// m =3D m * Qinv mod p
++	m.modMul(natFromBig(priv.Precomputed.Qinv).expandFor(P), P)
++	// m =3D m * q mod N
++	m.expandFor(N).modMul(t0.mod(Q.nat, N), N)
++	// m =3D m + m2 mod N
++	m.modAdd(m2.expandFor(N), N)
++
++	for i, values :=3D range priv.Precomputed.CRTValues {
++		p :=3D modulusFromNat(natFromBig(priv.Primes[2+i]))
++		// m2 =3D c ^ Exp mod p
++		m2.exp(t0.mod(c, p), values.Exp.Bytes(), p)
++		// m2 =3D m2 - m mod p
++		m2.modSub(t0.mod(m, p), p)
++		// m2 =3D m2 * Coeff mod p
++		m2.modMul(natFromBig(values.Coeff).expandFor(p), p)
++		// m2 =3D m2 * R mod N
++		R :=3D natFromBig(values.R).expandFor(N)
++		m2.expandFor(N).modMul(R, N)
++		// m =3D m + m2 mod N
++		m.modAdd(m2, N)
++	}
++
++	out :=3D make([]byte, modulusSize(N))
++	return m.fillBytes(out), nil
+ }
+
+-func decryptAndCheck(random io.Reader, priv *PrivateKey, c *big.Int) (m=
 *big.Int, err error) {
+-	m, err =3D decrypt(random, priv, c)
++func decryptAndCheck(priv *PrivateKey, ciphertext []byte) (m []byte, er=
r error) {
++	m, err =3D decrypt(priv, ciphertext)
+	if err !=3D nil {
+		return nil, err
+	}
+
+	// In order to defend against errors in the CRT computation, m^e is
+	// calculated, which should match the original ciphertext.
+-	check :=3D encrypt(new(big.Int), &priv.PublicKey, m)
+-	if c.Cmp(check) !=3D 0 {
++	check :=3D encrypt(&priv.PublicKey, m)
++	if subtle.ConstantTimeCompare(ciphertext, check) !=3D 1 {
+		return nil, errors.New("rsa: internal error")
+	}
+	return m, nil
+@@ -587,9 +565,7 @@ func decryptAndCheck(random io.Reader, priv *Private=
Key, c *big.Int) (m *big.Int
+ // Encryption and decryption of a given message must use the same hash =
function
+ // and sha256.New() is a reasonable choice.
+ //
+-// The random parameter, if not nil, is used to blind the private-key o=
peration
+-// and avoid timing side-channel attacks. Blinding is purely internal t=
o this
+-// function =E2=80=93 the random data need not match that used when enc=
rypting.
++// The random parameter is legacy and ignored, and it can be as nil.
+ //
+ // The label parameter must match the value given when encrypting. See
+ // EncryptOAEP for details.
+@@ -603,9 +579,7 @@ func DecryptOAEP(hash hash.Hash, random io.Reader, p=
riv *PrivateKey, ciphertext
+		return nil, ErrDecryption
+	}
+
+-	c :=3D new(big.Int).SetBytes(ciphertext)
+-
+-	m, err :=3D decrypt(random, priv, c)
++	em, err :=3D decrypt(priv, ciphertext)
+	if err !=3D nil {
+		return nil, err
+	}
+@@ -614,10 +588,6 @@ func DecryptOAEP(hash hash.Hash, random io.Reader, =
priv *PrivateKey, ciphertext
+	lHash :=3D hash.Sum(nil)
+	hash.Reset()
+
+-	// We probably leak the number of leading zeros.
+-	// It's not clear that we can do anything about this.
+-	em :=3D m.FillBytes(make([]byte, k))
+-
+	firstByteIsZero :=3D subtle.ConstantTimeByteEq(em[0], 0)
+
+	seed :=3D em[1 : hash.Size()+1]
+--
+2.40.0
--=20
2.40.0


