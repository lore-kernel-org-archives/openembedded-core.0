Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635CDCCFA1A
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 10:21:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8256.1762510867620913736
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 02:21:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=f/qDVVKd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3406543a8f=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A74vOHO2487900
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Nov 2025 02:21:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=g3qHSBU1hkjM3PYUjHoE
	iPIzcU/P+z1XkdbKTrUw+Lo=; b=f/qDVVKd1zce6DQuuNL3dtkRVPO9NSxXlRBB
	yOIP0ETrAblx+Aep8mToO1Dj9OXe2Tr32wwhpKrXeOWv8fdPnTdoD0Z0njAtl3i/
	bCy+2LptaQiBI6ULHQtrS64QypkAPXrBBu8jXoUyIgpu3s0czl1qvPQ2H6q1+RvZ
	ANg0Q18LZM5ygejsomVQ1fu1TDrvf7Za/QeeWAdWaQJaq6fJg20g2NhtoNS5mCEy
	Bf+xRx3oUZr/zUoQKiSBIdVe4nSOCbHmUqY4lWASxIHwsdEuBSJ0BigEnt4eh6Md
	Graa5Rx3JywloPPhtELng5C8FsQZcWGupUbzXVkKBa/5GUe8iA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a96ym8d08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 02:21:07 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 7 Nov 2025 02:21:06 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 7 Nov 2025 02:21:05 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH  1/7] go: fix CVE-2025-58185
Date: Fri, 7 Nov 2025 15:50:57 +0530
Message-ID: <20251107102103.436637-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: g_Jc4r9t7fVlrXSWwp9TCf1-Hw5MshUK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4MyBTYWx0ZWRfX7W5atUHvAY/+
 kM1MGwwnTFEE3kLlgeyazqfMYFwygQvcChmovtH0TiUEgLzMb8hx3+68QvAaYWU/GKoQR50OpFe
 fX6uq5LTaYK2VEOtHdjItfLfOGkSFwCDexn7y6+Q0cA0k+bPP5Vcocvw35pSwjFBMzy/ejlzgav
 Nhnex/jZ80RahgX52vB1e+tWqRsLuP/WQrz9S3TxMQZyCOu3PDegsYJEzq4dlelR2hW8mz0qdLs
 rDoxT5dhGrwYXQAQ5tPQry1frsR0ewjKGj2/72bIzZNwYtxfxPHlriv/uBKre0n5WcSmMif84Db
 rxcFK6hByqHMlIWZeFfthuYA3BmsKJ2zHRvqinfsWhrjOdRUBw154IlNEvzvbWvDjhQuCz3TP8i
 imQMBMiT0AoiZ/r0SFE6FseHkXBKUw==
X-Proofpoint-GUID: g_Jc4r9t7fVlrXSWwp9TCf1-Hw5MshUK
X-Authority-Analysis: v=2.4 cv=NqPcssdJ c=1 sm=1 tr=0 ts=690dc813 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Oh2cFVv5AAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=1XWaLZrsAAAA:8 a=pM9yUfARAAAA:8 a=m-fl97lkFUjkAqCwY5kA:9
 a=7KeoIwV6GZqOttXkcoxL:22 a=FdTzh2GWekK77mhwV6Dw:22 a=YH-7kEGJnRg4CV3apUU-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 10:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226024

From: Archana Polampalli <archana.polampalli@windriver.com>

Parsing a maliciously crafted DER payload could allocate large amounts of memory,
causing memory exhaustion.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2025-58185.patch                | 142 ++++++++++++++++++
 2 files changed, 143 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-58185.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index a364e1aae8..38992219c8 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -21,6 +21,7 @@ SRC_URI += "\
     file://CVE-2025-47907-pre.patch \
     file://CVE-2025-47907.patch \
     file://CVE-2025-47906.patch \
+    file://CVE-2025-58185.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-58185.patch b/meta/recipes-devtools/go/go/CVE-2025-58185.patch
new file mode 100644
index 0000000000..63250614ce
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-58185.patch
@@ -0,0 +1,142 @@
+From 5c3d61c886f7ecfce9a6d6d3c97e6d5a8afb17d1 Mon Sep 17 00:00:00 2001
+From: Nicholas Husin <husin@google.com>
+Date: Wed, 3 Sep 2025 09:30:56 -0400
+Subject: [PATCH] [release-branch.go1.24] encoding/asn1: prevent memory
+ exhaustion when parsing using internal/saferio
+
+Within parseSequenceOf,
+reflect.MakeSlice is being used to pre-allocate a slice that is needed in
+order to fully validate the given DER payload. The size of the slice
+allocated are also multiple times larger than the input DER:
+
+- When using asn1.Unmarshal directly, the allocated slice is ~28x
+  larger.
+- When passing in DER using x509.ParseCertificateRequest, the allocated
+  slice is ~48x larger.
+- When passing in DER using ocsp.ParseResponse, the allocated slice is
+  ~137x larger.
+
+As a result, a malicious actor can craft a big empty DER payload,
+resulting in an unnecessary large allocation of memories. This can be a
+way to cause memory exhaustion.
+
+To prevent this, we now use SliceCapWithSize within internal/saferio to
+enforce a memory allocation cap.
+
+Thanks to Jakub Ciolek for reporting this issue.
+
+For #75671
+Fixes #75704
+Fixes CVE-2025-58185
+
+Change-Id: Id50e76187eda43f594be75e516b9ca1d2ae6f428
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2700
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2984
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/709841
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+Auto-Submit: Michael Pratt <mpratt@google.com>
+TryBot-Bypass: Michael Pratt <mpratt@google.com>
+
+CVE: CVE-2025-58185
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/5c3d61c886f7ecfce9a6d6d3c97e6d5a8afb17d1]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/encoding/asn1/asn1.go      | 10 ++++++++-
+ src/encoding/asn1/asn1_test.go | 38 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 47 insertions(+), 1 deletion(-)
+
+diff --git a/src/encoding/asn1/asn1.go b/src/encoding/asn1/asn1.go
+index 781ab87..16c7138 100644
+--- a/src/encoding/asn1/asn1.go
++++ b/src/encoding/asn1/asn1.go
+@@ -22,6 +22,7 @@ package asn1
+ import (
+	"errors"
+	"fmt"
++	"internal/saferio"
+	"math"
+	"math/big"
+	"reflect"
+@@ -643,10 +644,17 @@ func parseSequenceOf(bytes []byte, sliceType reflect.Type, elemType reflect.Type
+		offset += t.length
+		numElements++
+	}
+-	ret = reflect.MakeSlice(sliceType, numElements, numElements)
++	elemSize := uint64(elemType.Size())
++	safeCap := saferio.SliceCapWithSize(elemSize, uint64(numElements))
++	if safeCap < 0 {
++		err = SyntaxError{fmt.Sprintf("%s slice too big: %d elements of %d bytes", elemType.Kind(), numElements, elemSize)}
++		return
++	}
++	ret = reflect.MakeSlice(sliceType, 0, safeCap)
+	params := fieldParameters{}
+	offset := 0
+	for i := 0; i < numElements; i++ {
++		ret = reflect.Append(ret, reflect.Zero(elemType))
+		offset, err = parseField(ret.Index(i), bytes, offset, params)
+		if err != nil {
+			return
+diff --git a/src/encoding/asn1/asn1_test.go b/src/encoding/asn1/asn1_test.go
+index 9a605e2..249d4e4 100644
+--- a/src/encoding/asn1/asn1_test.go
++++ b/src/encoding/asn1/asn1_test.go
+@@ -7,10 +7,12 @@ package asn1
+ import (
+	"bytes"
+	"encoding/hex"
++	"errors"
+	"fmt"
+	"math"
+	"math/big"
+	"reflect"
++	"runtime"
+	"strings"
+	"testing"
+	"time"
+@@ -1175,3 +1177,39 @@ func BenchmarkObjectIdentifierString(b *testing.B) {
+		_ = oidPublicKeyRSA.String()
+	}
+ }
++
++func TestParsingMemoryConsumption(t *testing.T) {
++	// Craft a syntatically valid, but empty, ~10 MB DER bomb. A successful
++	// unmarshal of this bomb should yield ~280 MB. However, the parsing should
++	// fail due to the empty content; and, in such cases, we want to make sure
++	// that we do not unnecessarily allocate memories.
++	derBomb := make([]byte, 10_000_000)
++	for i := range derBomb {
++		derBomb[i] = 0x30
++	}
++	derBomb = append([]byte{0x30, 0x83, 0x98, 0x96, 0x80}, derBomb...)
++
++	var m runtime.MemStats
++	runtime.GC()
++	runtime.ReadMemStats(&m)
++	memBefore := m.TotalAlloc
++
++	var out []struct {
++		Id       []int
++		Critical bool `asn1:"optional"`
++		Value    []byte
++	}
++	_, err := Unmarshal(derBomb, &out)
++	if !errors.As(err, &SyntaxError{}) {
++		t.Fatalf("Incorrect error result: want (%v), but got (%v) instead", &SyntaxError{}, err)
++	}
++
++	runtime.ReadMemStats(&m)
++	memDiff := m.TotalAlloc - memBefore
++
++	// Ensure that the memory allocated does not exceed 10<<21 (~20 MB) when
++	// the parsing fails.
++	if memDiff > 10<<21 {
++		t.Errorf("Too much memory allocated while parsing DER: %v MiB", memDiff/1024/1024)
++	}
++}
+--
+2.40.0
-- 
2.40.0


