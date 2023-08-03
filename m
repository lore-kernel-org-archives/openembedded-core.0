Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91446C3DA40
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 14:04:38 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.15492.1691071474362111591
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 07:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=XD/vtS0Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-686f25d045cso721169b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 07:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691071473; x=1691676273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TEL4/8XSvZYsecvfpwaytM9CaTpP9hSdeS2+jXHvf6o=;
        b=XD/vtS0ZDByHdT26tOitajbb3LiX3qGREsLDvdUXcRaUGwl4NyUSDY0y72/mth0gaB
         HZzAo5oE9cNcRTfZzmQP1DmhAae16+9CLLFye0cDcb1L8qNYgwuoWlTdrvcn5jWxcD2R
         0PUW/rfVIuQ6yTs58Nr7mHEeGWJDgpKCmL/AGjlQqwRSWULrXKiKzQRrgy9+SyyrJYKu
         fP+dZ5l0SUp28zpwd8vZ4JOVJ4O3kew5uyFvt7Arp8/gCQZe6vZtJ80IJ00j+sbzSCAX
         VmYd4rN1CPihIFT0+uEzkXi4mKFyWpe+C8bwpUGPWA595wTXs8GOPyoOWXVOscEBVzZ2
         C2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071473; x=1691676273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEL4/8XSvZYsecvfpwaytM9CaTpP9hSdeS2+jXHvf6o=;
        b=fye8dFIBEeJY00w+SnN1ApAbOjiPBfroDw6UveSFiri63laYJxtftVtcZOrBhQYQrA
         tA6WHTS0VoMvSbczivSwceGuiBLzKPETN8BpayTKpDYWAKub2vH3pPLcKUNB/uZ4s/Wv
         jqb4ZqXi1K1u3d01Y4GCGXmuxiIDYB8Y1wW0xZTgsqZcXudYBkFCWagTz3VrGdKt1ZOA
         r4bf0dz/Ob6uXc86iYpOOiBi58b63f5BGXChl0Gko0nGKyi2/roIc1pZBOkVi2UuiSnz
         LyvxfxIspXpsgT22VEaT09dQAqVpyBLiPi6f6G719XF2yAQvpdaZMTqc69S9gLmWx9s4
         Plcw==
X-Gm-Message-State: ABy/qLYLoHPoFULujkjDJK8xXDPzZO325eNAG2G3hixAxi1XWWgA0D4/
	JBSucE+dOsBHF/V3CPcFEIU1yAs6SeH45MVkR1U=
X-Google-Smtp-Source: APBJJlGjGjojzHxqAl3eWJRD1v9zVRemrsIvb16rX1tRWO0nt8igk24jHc8Y7JRvrX8pajxJEBF4zg==
X-Received: by 2002:a05:6a20:7491:b0:134:1b62:fac0 with SMTP id p17-20020a056a20749100b001341b62fac0mr21903731pzd.51.1691071472829;
        Thu, 03 Aug 2023 07:04:32 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm12866242pfe.75.2023.08.03.07.04.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:04:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/10] go: fix CVE-2023-24536
Date: Thu,  3 Aug 2023 04:04:10 -1000
Message-Id: <a774c895f4a425979cef8e05e8dd17c2dcb67654.1691071255.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691071255.git.steve@sakoman.com>
References: <cover.1691071255.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 14:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185485

From: Sakib Sajal <sakib.sajal@windriver.com>

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
index 36904a92fb..53e09a545c 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -37,6 +37,9 @@ SRC_URI += "\
     file://CVE-2023-29402.patch \
     file://CVE-2023-29400.patch \
     file://CVE-2023-29406.patch \
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
2.34.1


