Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9AABE77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 05:54:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12768.1736315667514098350
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 21:54:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3103ef720b=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5085ggGV004233
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Jan 2025 05:54:26 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fnkg5q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 05:54:26 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 7 Jan 2025 21:54:25 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 7 Jan 2025 21:54:23 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH  1/1] go: Fix CVE-2024-34155
Date: Wed, 8 Jan 2025 05:54:19 +0000
Message-ID: <20250108055421.3341813-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
X-Proofpoint-GUID: p-HUBXNOsUmJmzipac0qNMxk0FMUvjNH
X-Authority-Analysis: v=2.4 cv=bJjsIO+Z c=1 sm=1 tr=0 ts=677e1312 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=qf4gfuq51q0A:10 a=VdSt8ZQiCzkA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=Oh2cFVv5AAAA:8 a=t7CeM3EgAAAA:8 a=1XWaLZrsAAAA:8
 a=7H1ogpXflA0PW6_CKOMA:9 a=wr4gMOlj83Vuhi_h:21 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10 a=7KeoIwV6GZqOttXkcoxL:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: p-HUBXNOsUmJmzipac0qNMxk0FMUvjNH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-07_06,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=995
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501080045
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5085ggGV004233
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 05:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209514

From: Archana Polampalli <archana.polampalli@windriver.com>

Calling any of the Parse functions on Go source code which contains
deeply nested literals can cause a panic due to stack exhaustion.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-34155

Upstream-patch:
https://github.com/golang/go/commit/b232596139dbe96a62edbe3a2a203e856bf55=
6eb

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.21/CVE-2024-34155.patch           | 71 +++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2024-34155.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devto=
ols/go/go-1.17.13.inc
index 349b0be6be..11bd2afde0 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -58,6 +58,7 @@ SRC_URI +=3D "\
     file://CVE-2023-45288.patch \
     file://CVE-2024-24789.patch \
     file://CVE-2024-24791.patch \
+    file://CVE-2024-34155.patch \
 "
 SRC_URI[main.sha256sum] =3D "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d=
1fc0c1d784ada0cd300fd"
=20
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2024-34155.patch b/meta=
/recipes-devtools/go/go-1.21/CVE-2024-34155.patch
new file mode 100644
index 0000000000..515d9dcdff
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2024-34155.patch
@@ -0,0 +1,71 @@
+From b232596139dbe96a62edbe3a2a203e856bf556eb Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Mon, 10 Jun 2024 15:34:12 -0700
+Subject: [PATCH] go/parser: track depth in nested element lists
+
+Prevents stack exhaustion with extremely deeply nested literal values,
+i.e. field values in structs.
+
+Updates #69138
+Fixes #69142
+Fixes CVE-2024-34155
+
+Change-Id: I2e8e33b44105cc169d7ed1ae83fb56df0c10f1ee
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/1520
+Reviewed-by: Robert Griesemer <gri@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Russ Cox <rsc@google.com>
+(cherry picked from commit eb1b038c0d01761694e7a735ef87ac9164c6568e)
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/1561
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/611181
+Reviewed-by: Michael Pratt <mpratt@google.com>
+TryBot-Bypass: Dmitri Shuralyov <dmitshur@google.com>
+Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+
+CVE: CVE-2024-34155
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/b23259613=
9dbe96a62edbe3a2a203e856bf556eb]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/go/parser/parser.go      | 2 ++
+ src/go/parser/parser_test.go | 9 +++++----
+ 2 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/src/go/parser/parser.go b/src/go/parser/parser.go
+index 2c42b9f..a728d9a 100644
+--- a/src/go/parser/parser.go
++++ b/src/go/parser/parser.go
+@@ -1481,6 +1481,8 @@ func (p *parser) parseElementList() (list []ast.Ex=
pr) {
+ }
+
+ func (p *parser) parseLiteralValue(typ ast.Expr) ast.Expr {
++	defer decNestLev(incNestLev(p))
++
+	if p.trace {
+		defer un(trace(p, "LiteralValue"))
+	}
+diff --git a/src/go/parser/parser_test.go b/src/go/parser/parser_test.go
+index 993df63..b2cd501 100644
+--- a/src/go/parser/parser_test.go
++++ b/src/go/parser/parser_test.go
+@@ -607,10 +607,11 @@ var parseDepthTests =3D []struct {
+	{name: "chan2", format: "package main; var x =C2=AB<-chan =C2=BBint"},
+	{name: "interface", format: "package main; var x =C2=ABinterface { M() =
=C2=ABint=C2=BB }=C2=BB", scope: true, scopeMultiplier: 2}, // Scopes: In=
terfaceType, FuncType
+	{name: "map", format: "package main; var x =C2=ABmap[int]=C2=BBint"},
+-	{name: "slicelit", format: "package main; var x =3D =C2=AB[]any{=C2=AB=
=C2=BB}=C2=BB", parseMultiplier: 2},             // Parser nodes: UnaryEx=
pr, CompositeLit
+-	{name: "arraylit", format: "package main; var x =3D =C2=AB[1]any{=C2=AB=
nil=C2=BB}=C2=BB", parseMultiplier: 2},         // Parser nodes: UnaryExp=
r, CompositeLit
+-	{name: "structlit", format: "package main; var x =3D =C2=ABstruct{x an=
y}{=C2=ABnil=C2=BB}=C2=BB", parseMultiplier: 2}, // Parser nodes: UnaryEx=
pr, CompositeLit
+-	{name: "maplit", format: "package main; var x =3D =C2=ABmap[int]any{1:=
=C2=ABnil=C2=BB}=C2=BB", parseMultiplier: 2},    // Parser nodes: Composi=
teLit, KeyValueExpr
++	{name: "slicelit", format: "package main; var x =3D []any{=C2=AB[]any{=
=C2=AB=C2=BB}=C2=BB}", parseMultiplier: 3},      // Parser nodes: UnaryEx=
pr, CompositeLit
++	{name: "arraylit", format: "package main; var x =3D =C2=AB[1]any{=C2=AB=
nil=C2=BB}=C2=BB", parseMultiplier: 3},         // Parser nodes: UnaryExp=
r, CompositeLit
++	{name: "structlit", format: "package main; var x =3D =C2=ABstruct{x an=
y}{=C2=ABnil=C2=BB}=C2=BB", parseMultiplier: 3}, // Parser nodes: UnaryEx=
pr, CompositeLit
++	{name: "maplit", format: "package main; var x =3D =C2=ABmap[int]any{1:=
=C2=ABnil=C2=BB}=C2=BB", parseMultiplier: 3},    // Parser nodes: Composi=
teLit, KeyValueExpr
++	{name: "element", format: "package main; var x =3D struct{x any}{x: =C2=
=AB{=C2=AB=C2=BB}=C2=BB}"},
+	{name: "dot", format: "package main; var x =3D =C2=ABx.=C2=BBx"},
+	{name: "index", format: "package main; var x =3D x=C2=AB[1]=C2=BB"},
+	{name: "slice", format: "package main; var x =3D x=C2=AB[1:2]=C2=BB"},
+--
+2.40.0
--=20
2.40.0


