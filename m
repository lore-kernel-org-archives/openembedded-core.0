Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10EF0C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 12:04:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20107.1703073837414627217
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 04:03:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UT9YMInX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0718af4d0d=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BKC1Ob0003787
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 12:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=uUfS3
	4OqOust0yoYXU8SaVMaq3Xdh0FPuhf4t9GLFmw=; b=UT9YMInX/UTBR1urQXe5l
	xiYwDIM6ovjfRvGb5qxZOI9TQy1rpidyMjgEIG+KgWCmG9ocrg99NaYR5psfuQ95
	5sxEnygyIwB6ejIRmWRx6oS6EDfbWXbdc5MYEZUB0kIQTLo+SFWj3IlLeVZH/hbt
	wcTYRBofRfXhstp2mbgTzpalRsPpmMGlG9yyNFz8ujmXh9PLUStXXv8Kdmp/OQJo
	duuD5RxjzCVzz0VvC7YPndFCwiNa+rM2bJlJFMaKmdVgamBtkFH2I6tUw48KTopS
	AoEKgq2Ecxsp52hb4LetMJ3Vp11uykcyRqNxXPp9sgy8wZb0YVeMtRgvpL2P1Je5
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v113xcdc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 12:03:56 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 04:04:00 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] go: Fix CVE-2023-39326
Date: Wed, 20 Dec 2023 12:03:38 +0000
Message-ID: <20231220120338.2651978-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: IxOGW_WaihyKhg5v7QEaVVKmjHayPaRz
X-Proofpoint-GUID: IxOGW_WaihyKhg5v7QEaVVKmjHayPaRz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312200084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 12:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192794

From: Soumya Sambu <soumya.sambu@windriver.com>

A malicious HTTP sender can use chunk extensions to cause a receiver
reading from a request or response body to read many more bytes from
the network than are in the body. A malicious HTTP client can further
exploit this to cause a server to automatically read a large amount
of data (up to about 1GiB) when a handler fails to read the entire
body of a request. Chunk extensions are a little-used HTTP feature
which permit including additional metadata in a request or response
body sent using the chunked encoding. The net/http chunked encoding
reader discards this metadata. A sender can exploit this by inserting
a large metadata segment with each byte transferred. The chunk reader
now produces an error if the ratio of real body to encoded bytes grows
too small.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-39326
https://security-tracker.debian.org/tracker/CVE-2023-39326

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.20/CVE-2023-39326.patch           | 182 ++++++++++++++++++
 2 files changed, 183 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.20/CVE-2023-39326.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 330f571d22..95c4461d3e 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -47,6 +47,7 @@ SRC_URI += "\
     file://CVE-2023-29409.patch \
     file://CVE-2023-39319.patch \
     file://CVE-2023-39318.patch \
+    file://CVE-2023-39326.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.20/CVE-2023-39326.patch b/meta/recipes-devtools/go/go-1.20/CVE-2023-39326.patch
new file mode 100644
index 0000000000..ca78e552c2
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.20/CVE-2023-39326.patch
@@ -0,0 +1,182 @@
+From 6446af942e2e2b161c4ec1b60d9703a2b55dc4dd Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Tue, 7 Nov 2023 10:47:56 -0800
+Subject: [PATCH] net/http: limit chunked data overhead
+
+The chunked transfer encoding adds some overhead to
+the content transferred. When writing one byte per
+chunk, for example, there are five bytes of overhead
+per byte of data transferred: "1\r\nX\r\n" to send "X".
+
+Chunks may include "chunk extensions",
+which we skip over and do not use.
+For example: "1;chunk extension here\r\nX\r\n".
+
+A malicious sender can use chunk extensions to add
+about 4k of overhead per byte of data.
+(The maximum chunk header line size we will accept.)
+
+Track the amount of overhead read in chunked data,
+and produce an error if it seems excessive.
+
+Updates #64433
+Fixes #64434
+Fixes CVE-2023-39326
+
+Change-Id: I40f8d70eb6f9575fb43f506eb19132ccedafcf39
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/2076135
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+(cherry picked from commit 3473ae72ee66c60744665a24b2fde143e8964d4f)
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/2095407
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+TryBot-Result: Security TryBots <security-trybots@go-security-trybots.iam.gserviceaccount.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/547355
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+
+CVE: CVE-2023-39326
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/6446af942e2e2b161c4ec1b60d9703a2b55dc4dd]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/net/http/internal/chunked.go      | 36 +++++++++++++---
+ src/net/http/internal/chunked_test.go | 59 +++++++++++++++++++++++++++
+ 2 files changed, 89 insertions(+), 6 deletions(-)
+
+diff --git a/src/net/http/internal/chunked.go b/src/net/http/internal/chunked.go
+index f06e572..ddbaacb 100644
+--- a/src/net/http/internal/chunked.go
++++ b/src/net/http/internal/chunked.go
+@@ -39,7 +39,8 @@ type chunkedReader struct {
+	n        uint64 // unread bytes in chunk
+	err      error
+	buf      [2]byte
+-	checkEnd bool // whether need to check for \r\n chunk footer
++	checkEnd bool  // whether need to check for \r\n chunk footer
++	excess   int64 // "excessive" chunk overhead, for malicious sender detection
+ }
+
+ func (cr *chunkedReader) beginChunk() {
+@@ -49,10 +50,38 @@ func (cr *chunkedReader) beginChunk() {
+	if cr.err != nil {
+		return
+	}
++	cr.excess += int64(len(line)) + 2 // header, plus \r\n after the chunk data
++	line = trimTrailingWhitespace(line)
++	line, cr.err = removeChunkExtension(line)
++	if cr.err != nil {
++		return
++	}
+	cr.n, cr.err = parseHexUint(line)
+	if cr.err != nil {
+		return
+	}
++	// A sender who sends one byte per chunk will send 5 bytes of overhead
++	// for every byte of data. ("1\r\nX\r\n" to send "X".)
++	// We want to allow this, since streaming a byte at a time can be legitimate.
++	//
++	// A sender can use chunk extensions to add arbitrary amounts of additional
++	// data per byte read. ("1;very long extension\r\nX\r\n" to send "X".)
++	// We don't want to disallow extensions (although we discard them),
++	// but we also don't want to allow a sender to reduce the signal/noise ratio
++	// arbitrarily.
++	//
++	// We track the amount of excess overhead read,
++	// and produce an error if it grows too large.
++	//
++	// Currently, we say that we're willing to accept 16 bytes of overhead per chunk,
++	// plus twice the amount of real data in the chunk.
++	cr.excess -= 16 + (2 * int64(cr.n))
++	if cr.excess < 0 {
++		cr.excess = 0
++	}
++	if cr.excess > 16*1024 {
++		cr.err = errors.New("chunked encoding contains too much non-data")
++	}
+	if cr.n == 0 {
+		cr.err = io.EOF
+	}
+@@ -133,11 +162,6 @@ func readChunkLine(b *bufio.Reader) ([]byte, error) {
+	if len(p) >= maxLineLength {
+		return nil, ErrLineTooLong
+	}
+-	p = trimTrailingWhitespace(p)
+-	p, err = removeChunkExtension(p)
+-	if err != nil {
+-		return nil, err
+-	}
+	return p, nil
+ }
+
+diff --git a/src/net/http/internal/chunked_test.go b/src/net/http/internal/chunked_test.go
+index 08152ed..5fbeb08 100644
+--- a/src/net/http/internal/chunked_test.go
++++ b/src/net/http/internal/chunked_test.go
+@@ -211,3 +211,62 @@ func TestChunkReadPartial(t *testing.T) {
+	}
+
+ }
++
++func TestChunkReaderTooMuchOverhead(t *testing.T) {
++	// If the sender is sending 100x as many chunk header bytes as chunk data,
++	// we should reject the stream at some point.
++	chunk := []byte("1;")
++	for i := 0; i < 100; i++ {
++		chunk = append(chunk, 'a') // chunk extension
++	}
++	chunk = append(chunk, "\r\nX\r\n"...)
++	const bodylen = 1 << 20
++	r := NewChunkedReader(&funcReader{f: func(i int) ([]byte, error) {
++		if i < bodylen {
++			return chunk, nil
++		}
++		return []byte("0\r\n"), nil
++	}})
++	_, err := io.ReadAll(r)
++	if err == nil {
++		t.Fatalf("successfully read body with excessive overhead; want error")
++	}
++}
++
++func TestChunkReaderByteAtATime(t *testing.T) {
++	// Sending one byte per chunk should not trip the excess-overhead detection.
++	const bodylen = 1 << 20
++	r := NewChunkedReader(&funcReader{f: func(i int) ([]byte, error) {
++		if i < bodylen {
++			return []byte("1\r\nX\r\n"), nil
++		}
++		return []byte("0\r\n"), nil
++	}})
++	got, err := io.ReadAll(r)
++	if err != nil {
++		t.Errorf("unexpected error: %v", err)
++	}
++	if len(got) != bodylen {
++		t.Errorf("read %v bytes, want %v", len(got), bodylen)
++	}
++}
++
++type funcReader struct {
++	f   func(iteration int) ([]byte, error)
++	i   int
++	b   []byte
++	err error
++}
++
++func (r *funcReader) Read(p []byte) (n int, err error) {
++	if len(r.b) == 0 && r.err == nil {
++		r.b, r.err = r.f(r.i)
++		r.i++
++	}
++	n = copy(p, r.b)
++	r.b = r.b[n:]
++	if len(r.b) > 0 {
++		return n, nil
++	}
++	return n, r.err
++}
+--
+2.40.0
-- 
2.40.0


