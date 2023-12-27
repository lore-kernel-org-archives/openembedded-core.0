Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5612C46CD3
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 01:46:45 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.93472.1703641601312573386
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Dec 2023 17:46:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fkajm+q7;
 spf=pass (domain: mvista.com, ip: 209.85.166.177, mailfrom: vanusuri@mvista.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-35ff53a78a3so7302765ab.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 17:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1703641599; x=1704246399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PZLgm4Pp5xEQz/o2/eY728iMd2y9SSLvocXBI7UuT+4=;
        b=fkajm+q7oagkdMPj134i4onlO10YurhheOCqWh/mJtkFFA5fJ+swnUaBkVKB+EZizr
         QBftttrQuO/whveY+y7JxR3ojQ30OaY/enOx66GasKMQcbudeC0qOxUEofjTsJ2dP39V
         B0FEXrv2/0kiJ+vOwV9TosEnPevmQrZ6Uardc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703641599; x=1704246399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZLgm4Pp5xEQz/o2/eY728iMd2y9SSLvocXBI7UuT+4=;
        b=Qkl5COHAJfYwEQ9//8f0g6VcQqpzLjkfiqnthG/G0EJht2JI32gdYQ2aB/9M6VfNYI
         b4/MCN0XiStUG8i4HMPH8i7JD0fuWy0MKkqXTO/aKDp+huk+Y6FCTiZKTnieZZamrWVN
         IR1150/bPP2xluOcxDsXSz2Qh0rBa3BYIe0jvmKKhJ6I4o5iXOKA1/JFcK40/J4tEjYr
         u4VoCI0IiDN4tOqCuK9J0TOYMGGZnXoTRbtZAg9DStlyoV2FmrPDKiSlVjBR/FLXJBaS
         9d7XklhXcD3OSwXIOdU1eSBN5aarW9yJvZ1LXSF/ZfUFCudN+LJFoqB/W20fFdbTMMzU
         Sn5Q==
X-Gm-Message-State: AOJu0YzcPsGMCm151rf19eWGirMESwIj/vU+5zJpCApFBXfq4I+zFxN3
	BaQMXVisQdCXjrIN78ZolRgUthNCoBWzy5c92TgOnR/xSE0=
X-Google-Smtp-Source: AGHT+IGmxhcSuBy9jHKX7BZi/HqilSvgTkf1uC03+QQrjby3Y1fgRX73ULYgoa5pOkfHcdc7RkB7nQ==
X-Received: by 2002:a05:6e02:1e04:b0:35f:a46f:f40a with SMTP id g4-20020a056e021e0400b0035fa46ff40amr9545082ila.11.1703641599387;
        Tue, 26 Dec 2023 17:46:39 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.43.218.120])
        by smtp.gmail.com with ESMTPSA id l66-20020a633e45000000b005cd86cd9055sm6977022pga.1.2023.12.26.17.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 17:46:38 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] go: Fix CVE-2023-39326
Date: Wed, 27 Dec 2023 07:14:26 +0530
Message-Id: <20231227014426.6782-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 01:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192914

From: Vijay Anusuri <vanusuri@mvista.com>

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

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2023-39326.patch           | 181 ++++++++++++++++++
 2 files changed, 182 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-39326.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 091b778de8..b827a3606d 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -82,6 +82,7 @@ SRC_URI += "\
     file://CVE-2023-24536_3.patch \
     file://CVE-2023-39318.patch \
     file://CVE-2023-39319.patch \
+    file://CVE-2023-39326.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-39326.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-39326.patch
new file mode 100644
index 0000000000..998af361e8
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-39326.patch
@@ -0,0 +1,181 @@
+From 6446af942e2e2b161c4ec1b60d9703a2b55dc4dd Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Tue, 7 Nov 2023 10:47:56 -0800
+Subject: [PATCH] [release-branch.go1.20] net/http: limit chunked data overhead
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
+Upstream-Status: Backport [https://github.com/golang/go/commit/6446af942e2e2b161c4ec1b60d9703a2b55dc4dd]
+CVE: CVE-2023-39326
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
+ 	n        uint64 // unread bytes in chunk
+ 	err      error
+ 	buf      [2]byte
+-	checkEnd bool // whether need to check for \r\n chunk footer
++	checkEnd bool  // whether need to check for \r\n chunk footer
++	excess   int64 // "excessive" chunk overhead, for malicious sender detection
+ }
+ 
+ func (cr *chunkedReader) beginChunk() {
+@@ -49,10 +50,38 @@ func (cr *chunkedReader) beginChunk() {
+ 	if cr.err != nil {
+ 		return
+ 	}
++	cr.excess += int64(len(line)) + 2 // header, plus \r\n after the chunk data
++	line = trimTrailingWhitespace(line)
++	line, cr.err = removeChunkExtension(line)
++	if cr.err != nil {
++		return
++	}
+ 	cr.n, cr.err = parseHexUint(line)
+ 	if cr.err != nil {
+ 		return
+ 	}
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
+ 	if cr.n == 0 {
+ 		cr.err = io.EOF
+ 	}
+@@ -133,11 +162,6 @@ func readChunkLine(b *bufio.Reader) ([]byte, error) {
+ 	if len(p) >= maxLineLength {
+ 		return nil, ErrLineTooLong
+ 	}
+-	p = trimTrailingWhitespace(p)
+-	p, err = removeChunkExtension(p)
+-	if err != nil {
+-		return nil, err
+-	}
+ 	return p, nil
+ }
+ 
+diff --git a/src/net/http/internal/chunked_test.go b/src/net/http/internal/chunked_test.go
+index d067165..b20747d 100644
+--- a/src/net/http/internal/chunked_test.go
++++ b/src/net/http/internal/chunked_test.go
+@@ -212,3 +212,62 @@ func TestChunkReadPartial(t *testing.T) {
+ 	}
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
+2.25.1
+
-- 
2.25.1


