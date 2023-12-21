Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF60C4706E
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 02:09:36 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.42660.1703124568380438604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 18:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=u9qX88aG;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-28b6218d102so260510a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 18:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703124567; x=1703729367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRI9Dl7scidx9T2+KxUHxRMpUfHI0H07KV8ZUkJdYEA=;
        b=u9qX88aGvdG+bq0HYflHjH3/zUxTi4+UiOkDhJSpXHF+Q50mfDBD0HPmrEd1f0t1C6
         IITpbUujQDy6hyg+aBaoXnXrc6iAIhKzbyJ3HVEh+EHF2ZcFwSXH8A+4r27H/DiLLCrI
         I2vdLt3b1yikBRkpFZv0UFoVrWShkSQSkRfuv7bc4UtxDJyoAfxFCHbGVErPEnxWZngm
         Q2uvuz9lhcnMhz4jGX81Tp5LNSYigLs8NzeOdrc7bGbFfaj+JXzcT4pzDrTkaBXk2D+P
         ABBOC9b+UGu74prjqgcvNH59K7UoIF+tpdr1AQfa6RjparN5pcTlKKphMPPByqzybdHw
         LBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703124567; x=1703729367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RRI9Dl7scidx9T2+KxUHxRMpUfHI0H07KV8ZUkJdYEA=;
        b=I1cT5AFitadSp1t0CwDHGFMbhLfLLyUY5Ys8VlIHvDj3aI3dwsoWxblnv1jIw6fASh
         2oJ9oXe0Utp9CtznPTw0ny7T23bdZFf+E+xocwafPJH2LJI11bKrVFP2UVYbubheiGFL
         XsMCVHRjZczCmhdGyyEBMJ0s7XQ0hFqmtmdfHNfzfFSyJz09HwFxmxZUQqIK8oWnHzjM
         LBlZw7DmIRoj0t90yZoh3VJfTLnG9Fds+gI/aa0D4MPpL8IpEXVTipj3oXzQ0k78ErT5
         3KBNZ3yIqZ9eoWVcpK9H2JyFXgsSTSRyXvURNNh50OL+NNoK1uBMnT/ZBSETu+RgtRuw
         azVA==
X-Gm-Message-State: AOJu0YxBfRALjzD4FJvrDZR7unqahr4uXlfTyluYQHzzYHt86gRNHDRX
	rO2Ebg+nY4spy5nM45fWT3r7JDXoACCLtbGZFBQJkQ==
X-Google-Smtp-Source: AGHT+IFp2cr6iBt1XMkzzrqAR1Iy0pKyIkrBUwmMHgGMB1vBw0gEQB4vG/l3ndaPwV4JkocyNQAF0w==
X-Received: by 2002:a17:90b:506:b0:28b:b995:c886 with SMTP id r6-20020a17090b050600b0028bb995c886mr2776600pjz.82.1703124567407;
        Wed, 20 Dec 2023 18:09:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id qb4-20020a17090b280400b0028aecd6b29fsm4447297pjb.3.2023.12.20.18.09.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 18:09:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/11] go: Fix CVE-2023-39326
Date: Wed, 20 Dec 2023 16:09:06 -1000
Message-Id: <448df3bb9277287dd8586987199223b7314fdd01.1703124430.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703124430.git.steve@sakoman.com>
References: <cover.1703124430.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 02:09:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192818

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


