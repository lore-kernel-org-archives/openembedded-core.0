Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62927CCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 10:21:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8262.1762510875063997941
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 02:21:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pU6sUJP+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3406543a8f=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A77nEd32041923
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Nov 2025 02:21:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=CrVWfBVR47AFQZUdqj7cTCsQOlvp2rZJhZoG1/AKmbo=; b=pU6sUJP+JnvR
	/O+NooOvcqJJw+Qdxze+5CpsGQe0fZ+4VlShnlEH1mk7GWM8ShII4Ks+DNQNYori
	gachh3QZ+9NSDQ3KQHQEBFaOORHrk/6th/mfV1DdyYMC3rXSXmbu9hSk6K3VxEQk
	c3+v4vhErGkkOO1u4fiuKuEUAzHkt2+zIOH0A6J9BHDp1eov+2hdnDcWExRuOtfv
	Q7L7F8I0Bu+yMRN5DBJus75smWGTpwNk/pMCtLxgf4xNxemZXf38mWnTcznJjNgO
	OiJ6gFWpJHDKK/BMEusHBubLvHw14R9QhS5ps+3C31TA7Zu4jeFfBD3tvWHo9IBZ
	8KkD3x274g==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a975fgchs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 02:21:14 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 7 Nov 2025 02:21:14 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 7 Nov 2025 02:21:13 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH  6/7] go: fix CVE-2025-61723
Date: Fri, 7 Nov 2025 15:51:02 +0530
Message-ID: <20251107102103.436637-6-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251107102103.436637-1-archana.polampalli@windriver.com>
References: <20251107102103.436637-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4MyBTYWx0ZWRfX6P3XXR/QlTDs
 Jg2tlDiMB/di0kNKeoTJTiP53ENWlFkq+MAg3E2TbNR3bwx3hvNSEhP5aill0JW6JxULOi4U7ha
 dmUQhsv+sQeE63bwUTFg4Rrq89Eu5xnOtNE3qB8a16W71RIDk+IsEVVpY7OVo+VDEkcFjxWTXN6
 7lDHYy3bU8AeZwxK0ql+o+3HmDYKdH7A/lvYc16Snr0vId6M8pQLlkvZXCw/8NXRMaZIby7si44
 gD9l6rSTdB55B3zS5lP5eMBZ6O3SDLQ7tCddbSEuPEIfmpKLBipzT3uzO5H+1Syf22pCVbwY6Ua
 rNov+bKC0Khw6LqAMOJn4xv0DTME/xjc50rXqKbD/RnFaO0Fy+8tJf4aNmFYRVQzCHnQMwrOgTT
 za816pYCpV3PgHy9CgFFDC9H846s4Q==
X-Authority-Analysis: v=2.4 cv=MtVfKmae c=1 sm=1 tr=0 ts=690dc81a cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Oh2cFVv5AAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=1XWaLZrsAAAA:8 a=pM9yUfARAAAA:8 a=GoZSH2nYNUFIAvPklPcA:9
 a=7KeoIwV6GZqOttXkcoxL:22 a=FdTzh2GWekK77mhwV6Dw:22 a=YH-7kEGJnRg4CV3apUU-:22
X-Proofpoint-GUID: _ni9UdzK717Q5TzfavnBHVvi80iccOCO
X-Proofpoint-ORIG-GUID: _ni9UdzK717Q5TzfavnBHVvi80iccOCO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 10:21:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226029

From: Archana Polampalli <archana.polampalli@windriver.com>

The processing time for parsing some invalid inputs scales non-linearly with
respect to the size of the input. This affects programs which parse untrusted PEM inputs.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2025-61723.patch                | 223 ++++++++++++++++++
 2 files changed, 224 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61723.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 2be5c8b519..9996cfb870 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -26,6 +26,7 @@ SRC_URI += "\
     file://CVE-2025-58188.patch \
     file://CVE-2025-58189.patch \
     file://CVE-2025-47912.patch \
+    file://CVE-2025-61723.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-61723.patch b/meta/recipes-devtools/go/go/CVE-2025-61723.patch
new file mode 100644
index 0000000000..b1664e701d
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-61723.patch
@@ -0,0 +1,223 @@
+From 74d4d836b91318a8764b94bc2b4b66ff599eb5f2 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Tue, 30 Sep 2025 11:16:56 -0700
+Subject: [PATCH] encoding/pem: make Decode complexity linear
+
+Because Decode scanned the input first for the first BEGIN line, and
+then the first END line, the complexity of Decode is quadratic. If the
+input contained a large number of BEGINs and then a single END right at
+the end of the input, we would find the first BEGIN, and then scan the
+entire input for the END, and fail to parse the block, so move onto the
+next BEGIN, scan the entire input for the END, etc.
+
+Instead, look for the first END in the input, and then the first BEGIN
+that precedes the found END. We then process the bytes between the BEGIN
+and END, and move onto the bytes after the END for further processing.
+This gives us linear complexity.
+
+Fixes CVE-2025-61723
+For #75676
+Fixes #75708
+
+Change-Id: I813c4f63e78bca4054226c53e13865c781564ccf
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2921
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2986
+Reviewed-on: https://go-review.googlesource.com/c/go/+/709842
+TryBot-Bypass: Michael Pratt <mpratt@google.com>
+Auto-Submit: Michael Pratt <mpratt@google.com>
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+
+CVE: CVE-2025-61723
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/74d4d836b91318a8764b94bc2b4b66ff599eb5f2]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/encoding/pem/pem.go      | 67 ++++++++++++++++++++----------------
+ src/encoding/pem/pem_test.go | 13 +++----
+ 2 files changed, 44 insertions(+), 36 deletions(-)
+
+diff --git a/src/encoding/pem/pem.go b/src/encoding/pem/pem.go
+index 4b4f749..d365012 100644
+--- a/src/encoding/pem/pem.go
++++ b/src/encoding/pem/pem.go
+@@ -37,7 +37,7 @@ type Block struct {
+ // line bytes. The remainder of the byte array (also not including the new line
+ // bytes) is also returned and this will always be smaller than the original
+ // argument.
+-func getLine(data []byte) (line, rest []byte) {
++func getLine(data []byte) (line, rest []byte, consumed int) {
+	i := bytes.IndexByte(data, '\n')
+	var j int
+	if i < 0 {
+@@ -49,7 +49,7 @@ func getLine(data []byte) (line, rest []byte) {
+			i--
+		}
+	}
+-	return bytes.TrimRight(data[0:i], " \t"), data[j:]
++	return bytes.TrimRight(data[0:i], " \t"), data[j:], j
+ }
+
+ // removeSpacesAndTabs returns a copy of its input with all spaces and tabs
+@@ -90,20 +90,32 @@ func Decode(data []byte) (p *Block, rest []byte) {
+	// pemStart begins with a newline. However, at the very beginning of
+	// the byte array, we'll accept the start string without it.
+	rest = data
++
+	for {
+-		if bytes.HasPrefix(rest, pemStart[1:]) {
+-			rest = rest[len(pemStart)-1:]
+-		} else if _, after, ok := bytes.Cut(rest, pemStart); ok {
+-			rest = after
+-		} else {
++		// Find the first END line, and then find the last BEGIN line before
++		// the end line. This lets us skip any repeated BEGIN lines that don't
++		// have a matching END.
++		endIndex := bytes.Index(rest, pemEnd)
++		if endIndex < 0 {
++			return nil, data
++		}
++		endTrailerIndex := endIndex + len(pemEnd)
++		beginIndex := bytes.LastIndex(rest[:endIndex], pemStart[1:])
++		if beginIndex < 0 || beginIndex > 0 && rest[beginIndex-1] != '\n' {
+			return nil, data
+		}
++		rest = rest[beginIndex+len(pemStart)-1:]
++		endIndex -= beginIndex + len(pemStart) - 1
++		endTrailerIndex -= beginIndex + len(pemStart) - 1
+
+		var typeLine []byte
+-		typeLine, rest = getLine(rest)
++		var consumed int
++		typeLine, rest, consumed = getLine(rest)
+		if !bytes.HasSuffix(typeLine, pemEndOfLine) {
+			continue
+		}
++		endIndex -= consumed
++		endTrailerIndex -= consumed
+		typeLine = typeLine[0 : len(typeLine)-len(pemEndOfLine)]
+
+		p = &Block{
+@@ -117,7 +129,7 @@ func Decode(data []byte) (p *Block, rest []byte) {
+			if len(rest) == 0 {
+				return nil, data
+			}
+-			line, next := getLine(rest)
++			line, next, consumed := getLine(rest)
+
+			key, val, ok := bytes.Cut(line, colon)
+			if !ok {
+@@ -129,21 +141,13 @@ func Decode(data []byte) (p *Block, rest []byte) {
+			val = bytes.TrimSpace(val)
+			p.Headers[string(key)] = string(val)
+			rest = next
++			endIndex -= consumed
++			endTrailerIndex -= consumed
+		}
+
+-		var endIndex, endTrailerIndex int
+-
+-		// If there were no headers, the END line might occur
+-		// immediately, without a leading newline.
+-		if len(p.Headers) == 0 && bytes.HasPrefix(rest, pemEnd[1:]) {
+-			endIndex = 0
+-			endTrailerIndex = len(pemEnd) - 1
+-		} else {
+-			endIndex = bytes.Index(rest, pemEnd)
+-			endTrailerIndex = endIndex + len(pemEnd)
+-		}
+-
+-		if endIndex < 0 {
++		// If there were headers, there must be a newline between the headers
++		// and the END line, so endIndex should be >= 0.
++		if len(p.Headers) > 0 && endIndex < 0 {
+			continue
+		}
+
+@@ -163,21 +167,24 @@ func Decode(data []byte) (p *Block, rest []byte) {
+		}
+
+		// The line must end with only whitespace.
+-		if s, _ := getLine(restOfEndLine); len(s) != 0 {
++		if s, _, _ := getLine(restOfEndLine); len(s) != 0 {
+			continue
+		}
+
+-		base64Data := removeSpacesAndTabs(rest[:endIndex])
+-		p.Bytes = make([]byte, base64.StdEncoding.DecodedLen(len(base64Data)))
+-		n, err := base64.StdEncoding.Decode(p.Bytes, base64Data)
+-		if err != nil {
+-			continue
++		p.Bytes = []byte{}
++		if endIndex > 0 {
++			base64Data := removeSpacesAndTabs(rest[:endIndex])
++			p.Bytes = make([]byte, base64.StdEncoding.DecodedLen(len(base64Data)))
++			n, err := base64.StdEncoding.Decode(p.Bytes, base64Data)
++			if err != nil {
++				continue
++			}
++			p.Bytes = p.Bytes[:n]
+		}
+-		p.Bytes = p.Bytes[:n]
+
+		// the -1 is because we might have only matched pemEnd without the
+		// leading newline if the PEM block was empty.
+-		_, rest = getLine(rest[endIndex+len(pemEnd)-1:])
++		_, rest, _ = getLine(rest[endIndex+len(pemEnd)-1:])
+		return p, rest
+	}
+ }
+diff --git a/src/encoding/pem/pem_test.go b/src/encoding/pem/pem_test.go
+index 56a7754..7025277 100644
+--- a/src/encoding/pem/pem_test.go
++++ b/src/encoding/pem/pem_test.go
+@@ -34,7 +34,7 @@ var getLineTests = []GetLineTest{
+
+ func TestGetLine(t *testing.T) {
+	for i, test := range getLineTests {
+-		x, y := getLine([]byte(test.in))
++		x, y, _ := getLine([]byte(test.in))
+		if string(x) != test.out1 || string(y) != test.out2 {
+			t.Errorf("#%d got:%+v,%+v want:%s,%s", i, x, y, test.out1, test.out2)
+		}
+@@ -46,6 +46,7 @@ func TestDecode(t *testing.T) {
+	if !reflect.DeepEqual(result, certificate) {
+		t.Errorf("#0 got:%#v want:%#v", result, certificate)
+	}
++
+	result, remainder = Decode(remainder)
+	if !reflect.DeepEqual(result, privateKey) {
+		t.Errorf("#1 got:%#v want:%#v", result, privateKey)
+@@ -68,7 +69,7 @@ func TestDecode(t *testing.T) {
+	}
+
+	result, remainder = Decode(remainder)
+-	if result == nil || result.Type != "HEADERS" || len(result.Headers) != 1 {
++	if result == nil || result.Type != "VALID HEADERS" || len(result.Headers) != 1 {
+		t.Errorf("#5 expected single header block but got :%v", result)
+	}
+
+@@ -381,15 +382,15 @@ ZWAaUoVtWIQ52aKS0p19G99hhb+IVANC4akkdHV4SP8i7MVNZhfUmg==
+
+ # This shouldn't be recognised because of the missing newline after the
+ headers.
+------BEGIN HEADERS-----
++-----BEGIN INVALID HEADERS-----
+ Header: 1
+------END HEADERS-----
++-----END INVALID HEADERS-----
+
+ # This should be valid, however.
+------BEGIN HEADERS-----
++-----BEGIN VALID HEADERS-----
+ Header: 1
+
+------END HEADERS-----`)
++-----END VALID HEADERS-----`)
+
+ var certificate = &Block{Type: "CERTIFICATE",
+	Headers: map[string]string{},
+--
+2.40.0
-- 
2.40.0


