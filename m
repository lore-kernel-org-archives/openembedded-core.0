Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F332EB64DD
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 00:18:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3938.1690935504478884611
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 17:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cVQC6vkJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=757808ff50=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 371NoxVE017988
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Aug 2023 17:18:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=QDQoe
	/MF1JwVQ0ZFeFWpXl+1IOdl7XUZH9NKwp1K5vg=; b=cVQC6vkJeC/lKSkJMX3rT
	lEDTeJgeJNMovHiDWFAQoszr0d4vBZZc8KXgVvEtahzt/7L491rZHKgPijWcZ552
	njBm1mXHEIrKTmdif/4rLFn5oquHJ0wwiGhnZqNUWntmVUX558ZcOh6SHTw380yi
	SZ9/Kt9kHU3bPR3f1rRBdr1LLXpftDyVQDhL3hzK5y2jdBzKPHWeTog39+mc9FMd
	hH8nlE0UbsKq65yuHsq7uhaYkOFMbZfRkUym1QgynWOAo7SlpkcJHi2YeK7xlzjz
	6pJ4b9OZuNn+iNtLXFFzbYGYRn+Q9zcUYmGSKC6Yem0NF0+BUeBD4Gq/JQJwrCFY
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s78py8532-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 17:18:21 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 17:18:21 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Tue, 1 Aug 2023 17:18:21 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 1/3] go: fix CVE-2023-24536
Date: Tue, 1 Aug 2023 17:18:11 -0700
Message-ID: <20230802001813.3521965-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 1azOBL5pTJCbRSOUfYuiOBfcIEj59SM9
X-Proofpoint-GUID: 1azOBL5pTJCbRSOUfYuiOBfcIEj59SM9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_21,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 mlxscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308020000
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 00:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185366

Backport required patches to fix CVE-2023-24536.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   3 +
 .../go/go-1.19/CVE-2023-24536_1.patch         | 137 +++++++
 .../go/go-1.19/CVE-2023-24536_2.patch         | 187 ++++++++++
 .../go/go-1.19/CVE-2023-24536_3.patch         | 349 ++++++++++++++++++
 4 files changed, 676 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-24536_1.patch
 create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-24536_2.patch
 create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-24536_3.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 73921852fc..f8b046500a 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -36,6 +36,9 @@ SRC_URI += "\
     file://CVE-2023-29405.patch \
     file://CVE-2023-29402.patch \
     file://CVE-2023-29400.patch \
+    file://CVE-2023-24536_1.patch \
+    file://CVE-2023-24536_2.patch \
+    file://CVE-2023-24536_3.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.19/CVE-2023-24536_1.patch b/meta/recipes-devtools/go/go-1.19/CVE-2023-24536_1.patch
new file mode 100644
index 0000000000..ff9ba18ec5
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.19/CVE-2023-24536_1.patch
@@ -0,0 +1,137 @@
+From f8d691d335c6ac14bcbae6886b5bf8ca8bf1e6a5 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Thu, 16 Mar 2023 14:18:04 -0700
+Subject: [PATCH 1/3] mime/multipart: avoid excessive copy buffer allocations
+ in ReadForm
+
+When copying form data to disk with io.Copy,
+allocate only one copy buffer and reuse it rather than
+creating two buffers per file (one from io.multiReader.WriteTo,
+and a second one from os.File.ReadFrom).
+
+Thanks to Jakob Ackermann (@das7pad) for reporting this issue.
+
+For CVE-2023-24536
+For #59153
+For #59269
+
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1802453
+Run-TryBot: Damien Neil <dneil@google.com>
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1802395
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Change-Id: Ie405470c92abffed3356913b37d813e982c96c8b
+Reviewed-on: https://go-review.googlesource.com/c/go/+/481983
+Run-TryBot: Michael Knyszek <mknyszek@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Auto-Submit: Michael Knyszek <mknyszek@google.com>
+Reviewed-by: Matthew Dempsky <mdempsky@google.com>
+
+CVE: CVE-2023-24536
+Upstream-Status: Backport [ef41a4e2face45e580c5836eaebd51629fc23f15]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/mime/multipart/formdata.go      | 15 +++++++--
+ src/mime/multipart/formdata_test.go | 49 +++++++++++++++++++++++++++++
+ 2 files changed, 61 insertions(+), 3 deletions(-)
+
+diff --git a/src/mime/multipart/formdata.go b/src/mime/multipart/formdata.go
+index a7d4ca9..975dcb6 100644
+--- a/src/mime/multipart/formdata.go
++++ b/src/mime/multipart/formdata.go
+@@ -84,6 +84,7 @@ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ 			maxMemoryBytes = math.MaxInt64
+ 		}
+ 	}
++	var copyBuf []byte
+ 	for {
+ 		p, err := r.nextPart(false, maxMemoryBytes)
+ 		if err == io.EOF {
+@@ -147,14 +148,22 @@ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ 				}
+ 			}
+ 			numDiskFiles++
+-			size, err := io.Copy(file, io.MultiReader(&b, p))
++			if _, err := file.Write(b.Bytes()); err != nil {
++				return nil, err
++			}
++			if copyBuf == nil {
++				copyBuf = make([]byte, 32*1024) // same buffer size as io.Copy uses
++			}
++			// os.File.ReadFrom will allocate its own copy buffer if we let io.Copy use it.
++			type writerOnly struct{ io.Writer }
++			remainingSize, err := io.CopyBuffer(writerOnly{file}, p, copyBuf)
+ 			if err != nil {
+ 				return nil, err
+ 			}
+ 			fh.tmpfile = file.Name()
+-			fh.Size = size
++			fh.Size = int64(b.Len()) + remainingSize
+ 			fh.tmpoff = fileOff
+-			fileOff += size
++			fileOff += fh.Size
+ 			if !combineFiles {
+ 				if err := file.Close(); err != nil {
+ 					return nil, err
+diff --git a/src/mime/multipart/formdata_test.go b/src/mime/multipart/formdata_test.go
+index 5cded71..f5b5608 100644
+--- a/src/mime/multipart/formdata_test.go
++++ b/src/mime/multipart/formdata_test.go
+@@ -368,3 +368,52 @@ func testReadFormManyFiles(t *testing.T, distinct bool) {
+ 		t.Fatalf("temp dir contains %v files; want 0", len(names))
+ 	}
+ }
++
++func BenchmarkReadForm(b *testing.B) {
++	for _, test := range []struct {
++		name string
++		form func(fw *Writer, count int)
++	}{{
++		name: "fields",
++		form: func(fw *Writer, count int) {
++			for i := 0; i < count; i++ {
++				w, _ := fw.CreateFormField(fmt.Sprintf("field%v", i))
++				fmt.Fprintf(w, "value %v", i)
++			}
++		},
++	}, {
++		name: "files",
++		form: func(fw *Writer, count int) {
++			for i := 0; i < count; i++ {
++				w, _ := fw.CreateFormFile(fmt.Sprintf("field%v", i), fmt.Sprintf("file%v", i))
++				fmt.Fprintf(w, "value %v", i)
++			}
++		},
++	}} {
++		b.Run(test.name, func(b *testing.B) {
++			for _, maxMemory := range []int64{
++				0,
++				1 << 20,
++			} {
++				var buf bytes.Buffer
++				fw := NewWriter(&buf)
++				test.form(fw, 10)
++				if err := fw.Close(); err != nil {
++					b.Fatal(err)
++				}
++				b.Run(fmt.Sprintf("maxMemory=%v", maxMemory), func(b *testing.B) {
++					b.ReportAllocs()
++					for i := 0; i < b.N; i++ {
++						fr := NewReader(bytes.NewReader(buf.Bytes()), fw.Boundary())
++						form, err := fr.ReadForm(maxMemory)
++						if err != nil {
++							b.Fatal(err)
++						}
++						form.RemoveAll()
++					}
++
++				})
++			}
++		})
++	}
++}
+-- 
+2.35.5
+
diff --git a/meta/recipes-devtools/go/go-1.19/CVE-2023-24536_2.patch b/meta/recipes-devtools/go/go-1.19/CVE-2023-24536_2.patch
new file mode 100644
index 0000000000..704a1fb567
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.19/CVE-2023-24536_2.patch
@@ -0,0 +1,187 @@
+From 4174a87b600c58e8cc00d9d18d0c507c67ca5d41 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Thu, 16 Mar 2023 16:56:12 -0700
+Subject: [PATCH 2/3] net/textproto, mime/multipart: improve accounting of
+ non-file data
+
+For requests containing large numbers of small parts,
+memory consumption of a parsed form could be about 250%
+over the estimated size.
+
+When considering the size of parsed forms, account for the size of
+FileHeader structs and increase the estimate of memory consumed by
+map entries.
+
+Thanks to Jakob Ackermann (@das7pad) for reporting this issue.
+
+For CVE-2023-24536
+For #59153
+For #59269
+
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1802454
+Run-TryBot: Damien Neil <dneil@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1802396
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Change-Id: I31bc50e9346b4eee6fbe51a18c3c57230cc066db
+Reviewed-on: https://go-review.googlesource.com/c/go/+/481984
+Reviewed-by: Matthew Dempsky <mdempsky@google.com>
+Auto-Submit: Michael Knyszek <mknyszek@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Run-TryBot: Michael Knyszek <mknyszek@google.com>
+
+CVE: CVE-2023-24536
+Upstream-Status: Backport [7a359a651c7ebdb29e0a1c03102fce793e9f58f0]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/mime/multipart/formdata.go      |  9 +++--
+ src/mime/multipart/formdata_test.go | 55 ++++++++++++-----------------
+ src/net/textproto/reader.go         |  8 ++++-
+ 3 files changed, 37 insertions(+), 35 deletions(-)
+
+diff --git a/src/mime/multipart/formdata.go b/src/mime/multipart/formdata.go
+index 975dcb6..3f6ff69 100644
+--- a/src/mime/multipart/formdata.go
++++ b/src/mime/multipart/formdata.go
+@@ -103,8 +103,9 @@ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ 		// Multiple values for the same key (one map entry, longer slice) are cheaper
+ 		// than the same number of values for different keys (many map entries), but
+ 		// using a consistent per-value cost for overhead is simpler.
++		const mapEntryOverhead = 200
+ 		maxMemoryBytes -= int64(len(name))
+-		maxMemoryBytes -= 100 // map overhead
++		maxMemoryBytes -= mapEntryOverhead
+ 		if maxMemoryBytes < 0 {
+ 			// We can't actually take this path, since nextPart would already have
+ 			// rejected the MIME headers for being too large. Check anyway.
+@@ -128,7 +129,10 @@ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ 		}
+ 
+ 		// file, store in memory or on disk
++		const fileHeaderSize = 100
+ 		maxMemoryBytes -= mimeHeaderSize(p.Header)
++		maxMemoryBytes -= mapEntryOverhead
++		maxMemoryBytes -= fileHeaderSize
+ 		if maxMemoryBytes < 0 {
+ 			return nil, ErrMessageTooLarge
+ 		}
+@@ -183,9 +187,10 @@ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ }
+ 
+ func mimeHeaderSize(h textproto.MIMEHeader) (size int64) {
++	size = 400
+ 	for k, vs := range h {
+ 		size += int64(len(k))
+-		size += 100 // map entry overhead
++		size += 200 // map entry overhead
+ 		for _, v := range vs {
+ 			size += int64(len(v))
+ 		}
+diff --git a/src/mime/multipart/formdata_test.go b/src/mime/multipart/formdata_test.go
+index f5b5608..8ed26e0 100644
+--- a/src/mime/multipart/formdata_test.go
++++ b/src/mime/multipart/formdata_test.go
+@@ -192,10 +192,10 @@ func (r *failOnReadAfterErrorReader) Read(p []byte) (n int, err error) {
+ // TestReadForm_NonFileMaxMemory asserts that the ReadForm maxMemory limit is applied
+ // while processing non-file form data as well as file form data.
+ func TestReadForm_NonFileMaxMemory(t *testing.T) {
+-	n := 10<<20 + 25
+ 	if testing.Short() {
+-		n = 10<<10 + 25
++		t.Skip("skipping in -short mode")
+ 	}
++	n := 10 << 20
+ 	largeTextValue := strings.Repeat("1", n)
+ 	message := `--MyBoundary
+ Content-Disposition: form-data; name="largetext"
+@@ -203,38 +203,29 @@ Content-Disposition: form-data; name="largetext"
+ ` + largeTextValue + `
+ --MyBoundary--
+ `
+-
+ 	testBody := strings.ReplaceAll(message, "\n", "\r\n")
+-	testCases := []struct {
+-		name      string
+-		maxMemory int64
+-		err       error
+-	}{
+-		{"smaller", 50 + int64(len("largetext")) + 100, nil},
+-		{"exact-fit", 25 + int64(len("largetext")) + 100, nil},
+-		{"too-large", 0, ErrMessageTooLarge},
+-	}
+-	for _, tc := range testCases {
+-		t.Run(tc.name, func(t *testing.T) {
+-			if tc.maxMemory == 0 && testing.Short() {
+-				t.Skip("skipping in -short mode")
+-			}
+-			b := strings.NewReader(testBody)
+-			r := NewReader(b, boundary)
+-			f, err := r.ReadForm(tc.maxMemory)
+-			if err == nil {
+-				defer f.RemoveAll()
+-			}
+-			if tc.err != err {
+-				t.Fatalf("ReadForm error - got: %v; expected: %v", err, tc.err)
+-			}
+-			if err == nil {
+-				if g := f.Value["largetext"][0]; g != largeTextValue {
+-					t.Errorf("largetext mismatch: got size: %v, expected size: %v", len(g), len(largeTextValue))
+-				}
+-			}
+-		})
++	// Try parsing the form with increasing maxMemory values.
++	// Changes in how we account for non-file form data may cause the exact point
++	// where we change from rejecting the form as too large to accepting it to vary,
++	// but we should see both successes and failures.
++	const failWhenMaxMemoryLessThan = 128
++	for maxMemory := int64(0); maxMemory < failWhenMaxMemoryLessThan*2; maxMemory += 16 {
++		b := strings.NewReader(testBody)
++		r := NewReader(b, boundary)
++		f, err := r.ReadForm(maxMemory)
++		if err != nil {
++			continue
++		}
++		if g := f.Value["largetext"][0]; g != largeTextValue {
++			t.Errorf("largetext mismatch: got size: %v, expected size: %v", len(g), len(largeTextValue))
++		}
++		f.RemoveAll()
++		if maxMemory < failWhenMaxMemoryLessThan {
++			t.Errorf("ReadForm(%v): no error, expect to hit memory limit when maxMemory < %v", maxMemory, failWhenMaxMemoryLessThan)
++		}
++		return
+ 	}
++	t.Errorf("ReadForm(x) failed for x < 1024, expect success")
+ }
+ 
+ // TestReadForm_MetadataTooLarge verifies that we account for the size of field names,
+diff --git a/src/net/textproto/reader.go b/src/net/textproto/reader.go
+index fcbede8..9af4c49 100644
+--- a/src/net/textproto/reader.go
++++ b/src/net/textproto/reader.go
+@@ -503,6 +503,12 @@ func readMIMEHeader(r *Reader, lim int64) (MIMEHeader, error) {
+ 
+ 	m := make(MIMEHeader, hint)
+ 
++	// Account for 400 bytes of overhead for the MIMEHeader, plus 200 bytes per entry.
++	// Benchmarking map creation as of go1.20, a one-entry MIMEHeader is 416 bytes and large
++	// MIMEHeaders average about 200 bytes per entry.
++	lim -= 400
++	const mapEntryOverhead = 200
++
+ 	// The first line cannot start with a leading space.
+ 	if buf, err := r.R.Peek(1); err == nil && (buf[0] == ' ' || buf[0] == '\t') {
+ 		line, err := r.readLineSlice()
+@@ -552,7 +558,7 @@ func readMIMEHeader(r *Reader, lim int64) (MIMEHeader, error) {
+ 		vv := m[key]
+ 		if vv == nil {
+ 			lim -= int64(len(key))
+-			lim -= 100 // map entry overhead
++			lim -= mapEntryOverhead
+ 		}
+ 		lim -= int64(len(value))
+ 		if lim < 0 {
+-- 
+2.35.5
+
diff --git a/meta/recipes-devtools/go/go-1.19/CVE-2023-24536_3.patch b/meta/recipes-devtools/go/go-1.19/CVE-2023-24536_3.patch
new file mode 100644
index 0000000000..6de04e9a61
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.19/CVE-2023-24536_3.patch
@@ -0,0 +1,349 @@
+From ec763bc936f76cec0fe71a791c6bb7d4ac5f3e46 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Mon, 20 Mar 2023 10:43:19 -0700
+Subject: [PATCH 3/3] mime/multipart: limit parsed mime message sizes
+
+The parsed forms of MIME headers and multipart forms can consume
+substantially more memory than the size of the input data.
+A malicious input containing a very large number of headers or
+form parts can cause excessively large memory allocations.
+
+Set limits on the size of MIME data:
+
+Reader.NextPart and Reader.NextRawPart limit the the number
+of headers in a part to 10000.
+
+Reader.ReadForm limits the total number of headers in all
+FileHeaders to 10000.
+
+Both of these limits may be set with with
+GODEBUG=multipartmaxheaders=<values>.
+
+Reader.ReadForm limits the number of parts in a form to 1000.
+This limit may be set with GODEBUG=multipartmaxparts=<value>.
+
+Thanks for Jakob Ackermann (@das7pad) for reporting this issue.
+
+For CVE-2023-24536
+For #59153
+For #59269
+
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1802455
+Run-TryBot: Damien Neil <dneil@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1801087
+Reviewed-by: Damien Neil <dneil@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Change-Id: If134890d75f0d95c681d67234daf191ba08e6424
+Reviewed-on: https://go-review.googlesource.com/c/go/+/481985
+Run-TryBot: Michael Knyszek <mknyszek@google.com>
+Auto-Submit: Michael Knyszek <mknyszek@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Reviewed-by: Matthew Dempsky <mdempsky@google.com>
+
+CVE: CVE-2023-24536
+Upstream-Status: Backport [7917b5f31204528ea72e0629f0b7d52b35b27538]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/mime/multipart/formdata.go       | 19 ++++++++-
+ src/mime/multipart/formdata_test.go  | 61 ++++++++++++++++++++++++++++
+ src/mime/multipart/multipart.go      | 31 ++++++++++----
+ src/mime/multipart/readmimeheader.go |  2 +-
+ src/net/textproto/reader.go          | 19 +++++----
+ 5 files changed, 115 insertions(+), 17 deletions(-)
+
+diff --git a/src/mime/multipart/formdata.go b/src/mime/multipart/formdata.go
+index 3f6ff69..4f26aab 100644
+--- a/src/mime/multipart/formdata.go
++++ b/src/mime/multipart/formdata.go
+@@ -12,6 +12,7 @@ import (
+ 	"math"
+ 	"net/textproto"
+ 	"os"
++	"strconv"
+ )
+ 
+ // ErrMessageTooLarge is returned by ReadForm if the message form
+@@ -41,6 +42,15 @@ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ 	numDiskFiles := 0
+ 	multipartFiles := godebug.Get("multipartfiles")
+ 	combineFiles := multipartFiles != "distinct"
++	maxParts := 1000
++	multipartMaxParts := godebug.Get("multipartmaxparts")
++	if multipartMaxParts != "" {
++		if v, err := strconv.Atoi(multipartMaxParts); err == nil && v >= 0 {
++			maxParts = v
++		}
++	}
++	maxHeaders := maxMIMEHeaders()
++
+ 	defer func() {
+ 		if file != nil {
+ 			if cerr := file.Close(); err == nil {
+@@ -86,13 +96,17 @@ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ 	}
+ 	var copyBuf []byte
+ 	for {
+-		p, err := r.nextPart(false, maxMemoryBytes)
++		p, err := r.nextPart(false, maxMemoryBytes, maxHeaders)
+ 		if err == io.EOF {
+ 			break
+ 		}
+ 		if err != nil {
+ 			return nil, err
+ 		}
++		if maxParts <= 0 {
++			return nil, ErrMessageTooLarge
++		}
++		maxParts--
+ 
+ 		name := p.FormName()
+ 		if name == "" {
+@@ -136,6 +150,9 @@ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ 		if maxMemoryBytes < 0 {
+ 			return nil, ErrMessageTooLarge
+ 		}
++		for _, v := range p.Header {
++			maxHeaders -= int64(len(v))
++		}
+ 		fh := &FileHeader{
+ 			Filename: filename,
+ 			Header:   p.Header,
+diff --git a/src/mime/multipart/formdata_test.go b/src/mime/multipart/formdata_test.go
+index 8ed26e0..c78eeb7 100644
+--- a/src/mime/multipart/formdata_test.go
++++ b/src/mime/multipart/formdata_test.go
+@@ -360,6 +360,67 @@ func testReadFormManyFiles(t *testing.T, distinct bool) {
+ 	}
+ }
+ 
++func TestReadFormLimits(t *testing.T) {
++	for _, test := range []struct {
++		values           int
++		files            int
++		extraKeysPerFile int
++		wantErr          error
++		godebug          string
++	}{
++		{values: 1000},
++		{values: 1001, wantErr: ErrMessageTooLarge},
++		{values: 500, files: 500},
++		{values: 501, files: 500, wantErr: ErrMessageTooLarge},
++		{files: 1000},
++		{files: 1001, wantErr: ErrMessageTooLarge},
++		{files: 1, extraKeysPerFile: 9998}, // plus Content-Disposition and Content-Type
++		{files: 1, extraKeysPerFile: 10000, wantErr: ErrMessageTooLarge},
++		{godebug: "multipartmaxparts=100", values: 100},
++		{godebug: "multipartmaxparts=100", values: 101, wantErr: ErrMessageTooLarge},
++		{godebug: "multipartmaxheaders=100", files: 2, extraKeysPerFile: 48},
++		{godebug: "multipartmaxheaders=100", files: 2, extraKeysPerFile: 50, wantErr: ErrMessageTooLarge},
++	} {
++		name := fmt.Sprintf("values=%v/files=%v/extraKeysPerFile=%v", test.values, test.files, test.extraKeysPerFile)
++		if test.godebug != "" {
++			name += fmt.Sprintf("/godebug=%v", test.godebug)
++		}
++		t.Run(name, func(t *testing.T) {
++			if test.godebug != "" {
++				t.Setenv("GODEBUG", test.godebug)
++			}
++			var buf bytes.Buffer
++			fw := NewWriter(&buf)
++			for i := 0; i < test.values; i++ {
++				w, _ := fw.CreateFormField(fmt.Sprintf("field%v", i))
++				fmt.Fprintf(w, "value %v", i)
++			}
++			for i := 0; i < test.files; i++ {
++				h := make(textproto.MIMEHeader)
++				h.Set("Content-Disposition",
++					fmt.Sprintf(`form-data; name="file%v"; filename="file%v"`, i, i))
++				h.Set("Content-Type", "application/octet-stream")
++				for j := 0; j < test.extraKeysPerFile; j++ {
++					h.Set(fmt.Sprintf("k%v", j), "v")
++				}
++				w, _ := fw.CreatePart(h)
++				fmt.Fprintf(w, "value %v", i)
++			}
++			if err := fw.Close(); err != nil {
++				t.Fatal(err)
++			}
++			fr := NewReader(bytes.NewReader(buf.Bytes()), fw.Boundary())
++			form, err := fr.ReadForm(1 << 10)
++			if err == nil {
++				defer form.RemoveAll()
++			}
++			if err != test.wantErr {
++				t.Errorf("ReadForm = %v, want %v", err, test.wantErr)
++			}
++		})
++	}
++}
++
+ func BenchmarkReadForm(b *testing.B) {
+ 	for _, test := range []struct {
+ 		name string
+diff --git a/src/mime/multipart/multipart.go b/src/mime/multipart/multipart.go
+index 19fe0ea..80acabc 100644
+--- a/src/mime/multipart/multipart.go
++++ b/src/mime/multipart/multipart.go
+@@ -16,11 +16,13 @@ import (
+ 	"bufio"
+ 	"bytes"
+ 	"fmt"
++	"internal/godebug"
+ 	"io"
+ 	"mime"
+ 	"mime/quotedprintable"
+ 	"net/textproto"
+ 	"path/filepath"
++	"strconv"
+ 	"strings"
+ )
+ 
+@@ -128,12 +130,12 @@ func (r *stickyErrorReader) Read(p []byte) (n int, _ error) {
+ 	return n, r.err
+ }
+ 
+-func newPart(mr *Reader, rawPart bool, maxMIMEHeaderSize int64) (*Part, error) {
++func newPart(mr *Reader, rawPart bool, maxMIMEHeaderSize, maxMIMEHeaders int64) (*Part, error) {
+ 	bp := &Part{
+ 		Header: make(map[string][]string),
+ 		mr:     mr,
+ 	}
+-	if err := bp.populateHeaders(maxMIMEHeaderSize); err != nil {
++	if err := bp.populateHeaders(maxMIMEHeaderSize, maxMIMEHeaders); err != nil {
+ 		return nil, err
+ 	}
+ 	bp.r = partReader{bp}
+@@ -149,9 +151,9 @@ func newPart(mr *Reader, rawPart bool, maxMIMEHeaderSize int64) (*Part, error) {
+ 	return bp, nil
+ }
+ 
+-func (bp *Part) populateHeaders(maxMIMEHeaderSize int64) error {
++func (bp *Part) populateHeaders(maxMIMEHeaderSize, maxMIMEHeaders int64) error {
+ 	r := textproto.NewReader(bp.mr.bufReader)
+-	header, err := readMIMEHeader(r, maxMIMEHeaderSize)
++	header, err := readMIMEHeader(r, maxMIMEHeaderSize, maxMIMEHeaders)
+ 	if err == nil {
+ 		bp.Header = header
+ 	}
+@@ -313,6 +315,19 @@ type Reader struct {
+ // including header keys, values, and map overhead.
+ const maxMIMEHeaderSize = 10 << 20
+ 
++func maxMIMEHeaders() int64 {
++	// multipartMaxHeaders is the maximum number of header entries NextPart will return,
++	// as well as the maximum combined total of header entries Reader.ReadForm will return
++	// in FileHeaders.
++	multipartMaxHeaders := godebug.Get("multipartmaxheaders")
++	if multipartMaxHeaders != "" {
++		if v, err := strconv.ParseInt(multipartMaxHeaders, 10, 64); err == nil && v >= 0 {
++			return v
++		}
++	}
++	return 10000
++}
++
+ // NextPart returns the next part in the multipart or an error.
+ // When there are no more parts, the error io.EOF is returned.
+ //
+@@ -320,7 +335,7 @@ const maxMIMEHeaderSize = 10 << 20
+ // has a value of "quoted-printable", that header is instead
+ // hidden and the body is transparently decoded during Read calls.
+ func (r *Reader) NextPart() (*Part, error) {
+-	return r.nextPart(false, maxMIMEHeaderSize)
++	return r.nextPart(false, maxMIMEHeaderSize, maxMIMEHeaders())
+ }
+ 
+ // NextRawPart returns the next part in the multipart or an error.
+@@ -329,10 +344,10 @@ func (r *Reader) NextPart() (*Part, error) {
+ // Unlike NextPart, it does not have special handling for
+ // "Content-Transfer-Encoding: quoted-printable".
+ func (r *Reader) NextRawPart() (*Part, error) {
+-	return r.nextPart(true, maxMIMEHeaderSize)
++	return r.nextPart(true, maxMIMEHeaderSize, maxMIMEHeaders())
+ }
+ 
+-func (r *Reader) nextPart(rawPart bool, maxMIMEHeaderSize int64) (*Part, error) {
++func (r *Reader) nextPart(rawPart bool, maxMIMEHeaderSize, maxMIMEHeaders int64) (*Part, error) {
+ 	if r.currentPart != nil {
+ 		r.currentPart.Close()
+ 	}
+@@ -357,7 +372,7 @@ func (r *Reader) nextPart(rawPart bool, maxMIMEHeaderSize int64) (*Part, error)
+ 
+ 		if r.isBoundaryDelimiterLine(line) {
+ 			r.partsRead++
+-			bp, err := newPart(r, rawPart, maxMIMEHeaderSize)
++			bp, err := newPart(r, rawPart, maxMIMEHeaderSize, maxMIMEHeaders)
+ 			if err != nil {
+ 				return nil, err
+ 			}
+diff --git a/src/mime/multipart/readmimeheader.go b/src/mime/multipart/readmimeheader.go
+index 6836928..25aa6e2 100644
+--- a/src/mime/multipart/readmimeheader.go
++++ b/src/mime/multipart/readmimeheader.go
+@@ -11,4 +11,4 @@ import (
+ // readMIMEHeader is defined in package net/textproto.
+ //
+ //go:linkname readMIMEHeader net/textproto.readMIMEHeader
+-func readMIMEHeader(r *textproto.Reader, lim int64) (textproto.MIMEHeader, error)
++func readMIMEHeader(r *textproto.Reader, maxMemory, maxHeaders int64) (textproto.MIMEHeader, error)
+diff --git a/src/net/textproto/reader.go b/src/net/textproto/reader.go
+index 9af4c49..c6569c8 100644
+--- a/src/net/textproto/reader.go
++++ b/src/net/textproto/reader.go
+@@ -483,12 +483,12 @@ func (r *Reader) ReadDotLines() ([]string, error) {
+ //	}
+ //
+ func (r *Reader) ReadMIMEHeader() (MIMEHeader, error) {
+-	return readMIMEHeader(r, math.MaxInt64)
++	return readMIMEHeader(r, math.MaxInt64, math.MaxInt64)
+ }
+ 
+ // readMIMEHeader is a version of ReadMIMEHeader which takes a limit on the header size.
+ // It is called by the mime/multipart package.
+-func readMIMEHeader(r *Reader, lim int64) (MIMEHeader, error) {
++func readMIMEHeader(r *Reader, maxMemory, maxHeaders int64) (MIMEHeader, error) {
+ 	// Avoid lots of small slice allocations later by allocating one
+ 	// large one ahead of time which we'll cut up into smaller
+ 	// slices. If this isn't big enough later, we allocate small ones.
+@@ -506,7 +506,7 @@ func readMIMEHeader(r *Reader, lim int64) (MIMEHeader, error) {
+ 	// Account for 400 bytes of overhead for the MIMEHeader, plus 200 bytes per entry.
+ 	// Benchmarking map creation as of go1.20, a one-entry MIMEHeader is 416 bytes and large
+ 	// MIMEHeaders average about 200 bytes per entry.
+-	lim -= 400
++	maxMemory -= 400
+ 	const mapEntryOverhead = 200
+ 
+ 	// The first line cannot start with a leading space.
+@@ -538,6 +538,11 @@ func readMIMEHeader(r *Reader, lim int64) (MIMEHeader, error) {
+ 			continue
+ 		}
+ 
++		maxHeaders--
++		if maxHeaders < 0 {
++			return nil, errors.New("message too large")
++		}
++
+ 		// backport 5c55ac9bf1e5f779220294c843526536605f42ab
+ 		//
+ 		// value is computed as
+@@ -557,11 +562,11 @@ func readMIMEHeader(r *Reader, lim int64) (MIMEHeader, error) {
+ 
+ 		vv := m[key]
+ 		if vv == nil {
+-			lim -= int64(len(key))
+-			lim -= mapEntryOverhead
++			maxMemory -= int64(len(key))
++			maxMemory -= mapEntryOverhead
+ 		}
+-		lim -= int64(len(value))
+-		if lim < 0 {
++		maxMemory -= int64(len(value))
++		if maxMemory < 0 {
+ 			// TODO: This should be a distinguishable error (ErrMessageTooLarge)
+ 			// to allow mime/multipart to detect it.
+ 			return m, errors.New("message too large")
+-- 
+2.35.5
+
-- 
2.39.0


