Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D24DE77199
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 05:54:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12445.1736315671937774016
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 21:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3103ef720b=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5085FHax028380
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Jan 2025 05:54:31 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fnkg5q9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 05:54:30 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 7 Jan 2025 21:54:29 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 7 Jan 2025 21:54:27 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH  1/1] go: Fix CVE-2024-34158
Date: Wed, 8 Jan 2025 05:54:21 +0000
Message-ID: <20250108055421.3341813-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250108055421.3341813-1-archana.polampalli@windriver.com>
References: <20250108055421.3341813-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
X-Proofpoint-GUID: dWA6I0SCnVNCyuJ0pwNU72nzphFBuxSM
X-Authority-Analysis: v=2.4 cv=bJjsIO+Z c=1 sm=1 tr=0 ts=677e1316 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=qf4gfuq51q0A:10 a=VdSt8ZQiCzkA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=Oh2cFVv5AAAA:8 a=t7CeM3EgAAAA:8 a=1XWaLZrsAAAA:8
 a=EILoGXziU6ubfaRaC-8A:9 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10 a=7KeoIwV6GZqOttXkcoxL:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: dWA6I0SCnVNCyuJ0pwNU72nzphFBuxSM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-07_06,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501080045
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5085FHax028380
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 05:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209516

From: Archana Polampalli <archana.polampalli@windriver.com>

Calling Parse on a "// +build" build tag line with deeply nested
expressions can cause a panic due to stack exhaustion.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-34158

Upstream-patch:
https://github.com/golang/go/commit/d4c53812e6ce2ac368173d7fcd31d0ecfcffb=
002

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.21/CVE-2024-34158.patch           | 205 ++++++++++++++++++
 2 files changed, 206 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2024-34158.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devto=
ols/go/go-1.17.13.inc
index 53ca869221..c483590931 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -60,6 +60,7 @@ SRC_URI +=3D "\
     file://CVE-2024-24791.patch \
     file://CVE-2024-34155.patch \
     file://CVE-2024-34156.patch \
+    file://CVE-2024-34158.patch \
 "
 SRC_URI[main.sha256sum] =3D "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d=
1fc0c1d784ada0cd300fd"
=20
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2024-34158.patch b/meta=
/recipes-devtools/go/go-1.21/CVE-2024-34158.patch
new file mode 100644
index 0000000000..ad4d4f092c
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2024-34158.patch
@@ -0,0 +1,205 @@
+From d4c53812e6ce2ac368173d7fcd31d0ecfcffb002 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Thu, 20 Jun 2024 10:45:30 -0700
+Subject: [PATCH] go/build/constraint: add parsing limits
+
+Limit the size of build constraints that we will parse. This prevents a
+number of stack exhaustions that can be hit when parsing overly complex
+constraints. The imposed limits are unlikely to ever be hit in real
+world usage.
+
+Updates #69141
+Fixes #69148
+Fixes CVE-2024-34158
+
+Change-Id: I38b614bf04caa36eefc6a4350d848588c4cef3c4
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/1540
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Russ Cox <rsc@google.com>
+(cherry picked from commit 0c74dc9e0da0cf1e12494b514d822b5bebbc9f04)
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/1582
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/611183
+Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Michael Pratt <mpratt@google.com>
+TryBot-Bypass: Dmitri Shuralyov <dmitshur@google.com>
+
+CVE: CVE-2024-34158
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/d4c53812e=
6ce2ac368173d7fcd31d0ecfcffb002]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/go/build/constraint/expr.go      | 28 ++++++++++--
+ src/go/build/constraint/expr_test.go | 65 +++++++++++++++++++++++++++-
+ 2 files changed, 89 insertions(+), 4 deletions(-)
+
+diff --git a/src/go/build/constraint/expr.go b/src/go/build/constraint/e=
xpr.go
+index 957eb9b..85897e2 100644
+--- a/src/go/build/constraint/expr.go
++++ b/src/go/build/constraint/expr.go
+@@ -18,6 +18,10 @@ import (
+	"unicode/utf8"
+ )
+
++// maxSize is a limit used to control the complexity of expressions, in=
 order
++// to prevent stack exhaustion issues due to recursion.
++const maxSize =3D 1000
++
+ // An Expr is a build tag constraint expression.
+ // The underlying concrete type is *AndExpr, *OrExpr, *NotExpr, or *Tag=
Expr.
+ type Expr interface {
+@@ -153,7 +157,7 @@ func Parse(line string) (Expr, error) {
+		return parseExpr(text)
+	}
+	if text, ok :=3D splitPlusBuild(line); ok {
+-		return parsePlusBuildExpr(text), nil
++		return parsePlusBuildExpr(text)
+	}
+	return nil, errNotConstraint
+ }
+@@ -203,6 +207,8 @@ type exprParser struct {
+	tok   string // last token read
+	isTag bool
+	pos   int // position (start) of last token
++
++	size int
+ }
+
+ // parseExpr parses a boolean build tag expression.
+@@ -251,6 +257,10 @@ func (p *exprParser) and() Expr {
+ // On entry, the next input token has not yet been lexed.
+ // On exit, the next input token has been lexed and is in p.tok.
+ func (p *exprParser) not() Expr {
++	p.size++
++	if p.size > maxSize {
++		panic(&SyntaxError{Offset: p.pos, Err: "build expression too large"})
++	}
+	p.lex()
+	if p.tok =3D=3D "!" {
+		p.lex()
+@@ -391,7 +401,13 @@ func splitPlusBuild(line string) (expr string, ok b=
ool) {
+ }
+
+ // parsePlusBuildExpr parses a legacy build tag expression (as used wit=
h =E2=80=9C// +build=E2=80=9D).
+-func parsePlusBuildExpr(text string) Expr {
++func parsePlusBuildExpr(text string) (Expr, error) {
++	// Only allow up to 100 AND/OR operators for "old" syntax.
++	// This is much less than the limit for "new" syntax,
++	// but uses of old syntax were always very simple.
++	const maxOldSize =3D 100
++	size :=3D 0
++
+	var x Expr
+	for _, clause :=3D range strings.Fields(text) {
+		var y Expr
+@@ -417,19 +433,25 @@ func parsePlusBuildExpr(text string) Expr {
+			if y =3D=3D nil {
+				y =3D z
+			} else {
++				if size++; size > maxOldSize {
++					return nil, errComplex
++				}
+				y =3D and(y, z)
+			}
+		}
+		if x =3D=3D nil {
+			x =3D y
+		} else {
++			if size++; size > maxOldSize {
++				return nil, errComplex
++			}
+			x =3D or(x, y)
+		}
+	}
+	if x =3D=3D nil {
+		x =3D tag("ignore")
+	}
+-	return x
++	return x, nil
+ }
+
+ // isValidTag reports whether the word is a valid build tag.
+diff --git a/src/go/build/constraint/expr_test.go b/src/go/build/constra=
int/expr_test.go
+index 15d1890..ac38ba6 100644
+--- a/src/go/build/constraint/expr_test.go
++++ b/src/go/build/constraint/expr_test.go
+@@ -222,7 +222,7 @@ var parsePlusBuildExprTests =3D []struct {
+ func TestParsePlusBuildExpr(t *testing.T) {
+	for i, tt :=3D range parsePlusBuildExprTests {
+		t.Run(fmt.Sprint(i), func(t *testing.T) {
+-			x :=3D parsePlusBuildExpr(tt.in)
++			x, _ :=3D parsePlusBuildExpr(tt.in)
+			if x.String() !=3D tt.x.String() {
+				t.Errorf("parsePlusBuildExpr(%q):\nhave %v\nwant %v", tt.in, x, tt.x=
)
+			}
+@@ -319,3 +319,66 @@ func TestPlusBuildLines(t *testing.T) {
+		})
+	}
+ }
++
++func TestSizeLimits(t *testing.T) {
++	for _, tc :=3D range []struct {
++		name string
++		expr string
++	}{
++		{
++			name: "go:build or limit",
++			expr: "//go:build " + strings.Repeat("a || ", maxSize+2),
++		},
++		{
++			name: "go:build and limit",
++			expr: "//go:build " + strings.Repeat("a && ", maxSize+2),
++		},
++		{
++			name: "go:build and depth limit",
++			expr: "//go:build " + strings.Repeat("(a &&", maxSize+2),
++		},
++		{
++			name: "go:build or depth limit",
++			expr: "//go:build " + strings.Repeat("(a ||", maxSize+2),
++		},
++	} {
++		t.Run(tc.name, func(t *testing.T) {
++			_, err :=3D Parse(tc.expr)
++			if err =3D=3D nil {
++				t.Error("expression did not trigger limit")
++			} else if syntaxErr, ok :=3D err.(*SyntaxError); !ok || syntaxErr.Er=
r !=3D "build expression too large" {
++				if !ok {
++					t.Errorf("unexpected error: %v", err)
++				} else {
++					t.Errorf("unexpected syntax error: %s", syntaxErr.Err)
++				}
++			}
++		})
++	}
++}
++
++func TestPlusSizeLimits(t *testing.T) {
++	maxOldSize :=3D 100
++	for _, tc :=3D range []struct {
++		name string
++		expr string
++	}{
++		{
++			name: "+build or limit",
++			expr: "// +build " + strings.Repeat("a ", maxOldSize+2),
++		},
++		{
++			name: "+build and limit",
++			expr: "// +build " + strings.Repeat("a,", maxOldSize+2),
++		},
++	} {
++		t.Run(tc.name, func(t *testing.T) {
++			_, err :=3D Parse(tc.expr)
++			if err =3D=3D nil {
++				t.Error("expression did not trigger limit")
++			} else if err !=3D errComplex {
++				t.Errorf("unexpected error: got %q, want %q", err, errComplex)
++			}
++		})
++	}
++}
+--
+2.40.0
--=20
2.40.0


