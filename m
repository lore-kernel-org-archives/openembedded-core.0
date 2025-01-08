Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4D6E7719A
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 05:54:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12769.1736315668674506495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 21:54:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3103ef720b=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5084g1Ql024309
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Jan 2025 21:54:28 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fkp860s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 21:54:28 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 7 Jan 2025 21:54:27 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 7 Jan 2025 21:54:25 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH  1/1] go: Fix CVE-2024-34156
Date: Wed, 8 Jan 2025 05:54:20 +0000
Message-ID: <20250108055421.3341813-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250108055421.3341813-1-archana.polampalli@windriver.com>
References: <20250108055421.3341813-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=XZxzzJ55 c=1 sm=1 tr=0 ts=677e1314 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VdSt8ZQiCzkA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=Oh2cFVv5AAAA:8 a=t7CeM3EgAAAA:8 a=1XWaLZrsAAAA:8
 a=OO5WLQZBw0tTnswepzgA:9 a=7KeoIwV6GZqOttXkcoxL:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ddzE2uPwxSGcWrC9wiGfrod1CeXKK1vQ
X-Proofpoint-GUID: ddzE2uPwxSGcWrC9wiGfrod1CeXKK1vQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-07_06,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501080045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 05:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209515

From: Archana Polampalli <archana.polampalli@windriver.com>

Calling Decoder.Decode on a message which contains deeply nested structures can
cause a panic due to stack exhaustion. This is a follow-up to CVE-2022-30635.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-34156

Upstream-patch:
https://github.com/golang/go/commit/2092294f2b097c5828f4eace6c98a322c1510b01

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.21/CVE-2024-34156.patch           | 150 ++++++++++++++++++
 2 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2024-34156.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 11bd2afde0..53ca869221 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -59,6 +59,7 @@ SRC_URI += "\
     file://CVE-2024-24789.patch \
     file://CVE-2024-24791.patch \
     file://CVE-2024-34155.patch \
+    file://CVE-2024-34156.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2024-34156.patch b/meta/recipes-devtools/go/go-1.21/CVE-2024-34156.patch
new file mode 100644
index 0000000000..d8a915d6e9
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2024-34156.patch
@@ -0,0 +1,150 @@
+From 2092294f2b097c5828f4eace6c98a322c1510b01 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Fri, 3 May 2024 09:21:39 -0400
+Subject: [PATCH] encoding/gob: cover missed cases when checking ignore depth
+
+This change makes sure that we are properly checking the ignored field
+recursion depth in decIgnoreOpFor consistently. This prevents stack
+exhaustion when attempting to decode a message that contains an
+extremely deeply nested struct which is ignored.
+
+Thanks to Md Sakib Anwar of The Ohio State University (anwar.40@osu.edu)
+for reporting this issue.
+
+Updates #69139
+Fixes #69144
+Fixes CVE-2024-34156
+
+Change-Id: Iacce06be95a5892b3064f1c40fcba2e2567862d6
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/1440
+Reviewed-by: Russ Cox <rsc@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+(cherry picked from commit f0a11f9b3aaa362cb1d05e095e3c8d421d4f087f)
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/1580
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/611182
+TryBot-Bypass: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Michael Pratt <mpratt@google.com>
+Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+
+CVE: CVE-2024-34156
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/2092294f2b097c5828f4eace6c98a322c1510b01]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/encoding/gob/decode.go         | 19 +++++++++++--------
+ src/encoding/gob/decoder.go        |  2 ++
+ src/encoding/gob/gobencdec_test.go | 14 ++++++++++++++
+ 3 files changed, 27 insertions(+), 8 deletions(-)
+
+diff --git a/src/encoding/gob/decode.go b/src/encoding/gob/decode.go
+index 0e0ec75..92d64cb 100644
+--- a/src/encoding/gob/decode.go
++++ b/src/encoding/gob/decode.go
+@@ -874,8 +874,11 @@ func (dec *Decoder) decOpFor(wireId typeId, rt reflect.Type, name string, inProg
+ var maxIgnoreNestingDepth = 10000
+
+ // decIgnoreOpFor returns the decoding op for a field that has no destination.
+-func (dec *Decoder) decIgnoreOpFor(wireId typeId, inProgress map[typeId]*decOp, depth int) *decOp {
+-	if depth > maxIgnoreNestingDepth {
++func (dec *Decoder) decIgnoreOpFor(wireId typeId, inProgress map[typeId]*decOp) *decOp {
++	// Track how deep we've recursed trying to skip nested ignored fields.
++	dec.ignoreDepth++
++	defer func() { dec.ignoreDepth-- }()
++	if dec.ignoreDepth > maxIgnoreNestingDepth {
+		error_(errors.New("invalid nesting depth"))
+	}
+	// If this type is already in progress, it's a recursive type (e.g. map[string]*T).
+@@ -901,7 +904,7 @@ func (dec *Decoder) decIgnoreOpFor(wireId typeId, inProgress map[typeId]*decOp,
+			errorf("bad data: undefined type %s", wireId.string())
+		case wire.ArrayT != nil:
+			elemId := wire.ArrayT.Elem
+-			elemOp := dec.decIgnoreOpFor(elemId, inProgress, depth+1)
++			elemOp := dec.decIgnoreOpFor(elemId, inProgress)
+			op = func(i *decInstr, state *decoderState, value reflect.Value) {
+				state.dec.ignoreArray(state, *elemOp, wire.ArrayT.Len)
+			}
+@@ -909,15 +912,15 @@ func (dec *Decoder) decIgnoreOpFor(wireId typeId, inProgress map[typeId]*decOp,
+		case wire.MapT != nil:
+			keyId := dec.wireType[wireId].MapT.Key
+			elemId := dec.wireType[wireId].MapT.Elem
+-			keyOp := dec.decIgnoreOpFor(keyId, inProgress, depth+1)
+-			elemOp := dec.decIgnoreOpFor(elemId, inProgress, depth+1)
++			keyOp := dec.decIgnoreOpFor(keyId, inProgress)
++			elemOp := dec.decIgnoreOpFor(elemId, inProgress)
+			op = func(i *decInstr, state *decoderState, value reflect.Value) {
+				state.dec.ignoreMap(state, *keyOp, *elemOp)
+			}
+
+		case wire.SliceT != nil:
+			elemId := wire.SliceT.Elem
+-			elemOp := dec.decIgnoreOpFor(elemId, inProgress, depth+1)
++			elemOp := dec.decIgnoreOpFor(elemId, inProgress)
+			op = func(i *decInstr, state *decoderState, value reflect.Value) {
+				state.dec.ignoreSlice(state, *elemOp)
+			}
+@@ -1078,7 +1081,7 @@ func (dec *Decoder) compileSingle(remoteId typeId, ut *userTypeInfo) (engine *de
+ func (dec *Decoder) compileIgnoreSingle(remoteId typeId) *decEngine {
+	engine := new(decEngine)
+	engine.instr = make([]decInstr, 1) // one item
+-	op := dec.decIgnoreOpFor(remoteId, make(map[typeId]*decOp), 0)
++	op := dec.decIgnoreOpFor(remoteId, make(map[typeId]*decOp))
+	ovfl := overflow(dec.typeString(remoteId))
+	engine.instr[0] = decInstr{*op, 0, nil, ovfl}
+	engine.numInstr = 1
+@@ -1123,7 +1126,7 @@ func (dec *Decoder) compileDec(remoteId typeId, ut *userTypeInfo) (engine *decEn
+		localField, present := srt.FieldByName(wireField.Name)
+		// TODO(r): anonymous names
+		if !present || !isExported(wireField.Name) {
+-			op := dec.decIgnoreOpFor(wireField.Id, make(map[typeId]*decOp), 0)
++			op := dec.decIgnoreOpFor(wireField.Id, make(map[typeId]*decOp))
+			engine.instr[fieldnum] = decInstr{*op, fieldnum, nil, ovfl}
+			continue
+		}
+diff --git a/src/encoding/gob/decoder.go b/src/encoding/gob/decoder.go
+index b476aaa..8fab2fd 100644
+--- a/src/encoding/gob/decoder.go
++++ b/src/encoding/gob/decoder.go
+@@ -34,6 +34,8 @@ type Decoder struct {
+	freeList     *decoderState                           // list of free decoderStates; avoids reallocation
+	countBuf     []byte                                  // used for decoding integers while parsing messages
+	err          error
++       // ignoreDepth tracks the depth of recursively parsed ignored fields
++       ignoreDepth int
+ }
+
+ // NewDecoder returns a new decoder that reads from the io.Reader.
+diff --git a/src/encoding/gob/gobencdec_test.go b/src/encoding/gob/gobencdec_test.go
+index 1b52ecc..2b5f2a8 100644
+--- a/src/encoding/gob/gobencdec_test.go
++++ b/src/encoding/gob/gobencdec_test.go
+@@ -806,6 +806,8 @@ func TestIngoreDepthLimit(t *testing.T) {
+	defer func() { maxIgnoreNestingDepth = oldNestingDepth }()
+	b := new(bytes.Buffer)
+	enc := NewEncoder(b)
++
++	// Nested slice
+	typ := reflect.TypeOf(int(0))
+	nested := reflect.ArrayOf(1, typ)
+	for i := 0; i < 100; i++ {
+@@ -819,4 +821,16 @@ func TestIngoreDepthLimit(t *testing.T) {
+	if err := dec.Decode(&output); err == nil || err.Error() != expectedErr {
+		t.Errorf("Decode didn't fail with depth limit of 100: want %q, got %q", expectedErr, err)
+	}
++
++	// Nested struct
++	nested = reflect.StructOf([]reflect.StructField{{Name: "F", Type: typ}})
++	for i := 0; i < 100; i++ {
++		nested = reflect.StructOf([]reflect.StructField{{Name: "F", Type: nested}})
++	}
++	badStruct = reflect.New(reflect.StructOf([]reflect.StructField{{Name: "F", Type: nested}}))
++	enc.Encode(badStruct.Interface())
++	dec = NewDecoder(b)
++	if err := dec.Decode(&output); err == nil || err.Error() != expectedErr {
++		t.Errorf("Decode didn't fail with depth limit of 100: want %q, got %q", expectedErr, err)
++	}
+ }
+--
+2.40.0
-- 
2.40.0


