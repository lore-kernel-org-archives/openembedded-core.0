Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF3DC6FD1F
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 03:20:13 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.29044.1711509606376755852
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Mar 2024 20:20:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=E8CChVAL;
 spf=pass (domain: mvista.com, ip: 209.85.215.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5d3912c9a83so3032810a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 20:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1711509605; x=1712114405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R5oBbb2gU7QGkS3fb1Gmsw8ahsAwa+W/A6xiHP2wQsY=;
        b=E8CChVALhYR2eIQX0fbhOnAvhQOcp++OPESCRIJjL4bOqypAXkst6nAajh2qtt8XSv
         1Pa3sXLZLsQzUTHL847tnk1DQE5fBYzrIL7FHk33H9z0htUFg6NgRr4/MGA97UsrCkxg
         RUSZgLHrNoVmYF4OjYtoGKjoz/YjuDXSpB4+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711509605; x=1712114405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5oBbb2gU7QGkS3fb1Gmsw8ahsAwa+W/A6xiHP2wQsY=;
        b=pIWdDPssiCunVfKV1YlWV/ZyIC0v7OALB1jsPQja/QptJn3AfFzlS0ddIKqRtp9KQ0
         pISUQoqumPLvbHyrPy+460Sa2KXBJzJqPRjnLfV3VHsAcK6MFWcyztJU2f6tr5PLjWEp
         mgSYpOkcxjZ72ityVWszw7Djao9r1tBkIPL29CgUe8uR0pZ8UCzfIykLNMopbsuv5MMf
         Cgq9P5HyYZvcfCLbHxOtXKwWV5Pzd2xeLTNYeNLbFQB15xLlRoOgDSNTfXwQQB5ekD2s
         v+H/g/IC8GSNCAwwKrYV4AiM+OT+BvUT+tsdCzMVfjJmP0sllk/vcyKBM21iBu5+EWHT
         VJJg==
X-Gm-Message-State: AOJu0YxE87gPmzDoEXidZ+I7n73K5DoDzx9UUoVP52DGMDWkNpRddMEC
	O84Tdh7JhziSK+NLosUCVpy9oXO24T+JWS2vLFtVxZUtZHZtfjAGGnRauMN4PzxK9zJWBKSAnUr
	w
X-Google-Smtp-Source: AGHT+IHSN+PDMUEiG0/FgwSgYKODJHsYx3uskBMgvSXXnpzO9dyqFmdK2hCRcvmvq9fIWN178SmDYg==
X-Received: by 2002:a17:90b:350:b0:2a0:6849:a8de with SMTP id fh16-20020a17090b035000b002a06849a8demr2901507pjb.10.1711509604418;
        Tue, 26 Mar 2024 20:20:04 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:1cb1:ffb5:53b8:4035:413:157f])
        by smtp.gmail.com with ESMTPSA id oe10-20020a17090b394a00b002a0304e158bsm415177pjb.41.2024.03.26.20.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 20:20:03 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH v2] go: Fix for CVE-2023-45289 CVE-2023-45290 & CVE-2024-24785
Date: Wed, 27 Mar 2024 08:49:54 +0530
Message-Id: <20240327031954.40778-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 03:20:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197544

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://github.com/golang/go/commit/20586c0dbe03d144f914155f879fa5ee287591a1
&
https://github.com/golang/go/commit/bf80213b121074f4ad9b449410a4d13bae5e9be0
&
https://github.com/golang/go/commit/3643147a29352ca2894fd5d0d2069bc4b4335a7e]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   3 +
 .../go/go-1.14/CVE-2023-45289.patch           | 121 ++++++++
 .../go/go-1.14/CVE-2023-45290.patch           | 271 ++++++++++++++++++
 .../go/go-1.14/CVE-2024-24785.patch           | 197 +++++++++++++
 4 files changed, 592 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-45289.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-45290.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2024-24785.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 4fbf9d7590..69b65f3eb2 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -88,6 +88,9 @@ SRC_URI += "\
     file://CVE-2023-45287-pre2.patch \
     file://CVE-2023-45287-pre3.patch \
     file://CVE-2023-45287.patch \
+    file://CVE-2023-45289.patch \
+    file://CVE-2023-45290.patch \
+    file://CVE-2024-24785.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-45289.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-45289.patch
new file mode 100644
index 0000000000..13d3510504
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-45289.patch
@@ -0,0 +1,121 @@
+From 20586c0dbe03d144f914155f879fa5ee287591a1 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Thu, 11 Jan 2024 11:31:57 -0800
+Subject: [PATCH] [release-branch.go1.21] net/http, net/http/cookiejar: avoid
+ subdomain matches on IPv6 zones
+
+When deciding whether to forward cookies or sensitive headers
+across a redirect, do not attempt to interpret an IPv6 address
+as a domain name.
+
+Avoids a case where a maliciously-crafted redirect to an
+IPv6 address with a scoped addressing zone could be
+misinterpreted as a within-domain redirect. For example,
+we could interpret "::1%.www.example.com" as a subdomain
+of "www.example.com".
+
+Thanks to Juho Nurminen of Mattermost for reporting this issue.
+
+Fixes CVE-2023-45289
+Fixes #65385
+For #65065
+
+Change-Id: I8f463f59f0e700c8a18733d2b264a8bcb3a19599
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/2131938
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/2173775
+Reviewed-by: Carlos Amedee <amedee@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/569239
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+Auto-Submit: Michael Knyszek <mknyszek@google.com>
+TryBot-Bypass: Michael Knyszek <mknyszek@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/20586c0dbe03d144f914155f879fa5ee287591a1]
+CVE: CVE-2023-45289
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/net/http/client.go             |  6 ++++++
+ src/net/http/client_test.go        |  1 +
+ src/net/http/cookiejar/jar.go      |  7 +++++++
+ src/net/http/cookiejar/jar_test.go | 10 ++++++++++
+ 4 files changed, 24 insertions(+)
+
+diff --git a/src/net/http/client.go b/src/net/http/client.go
+index a496f1c..2031834 100644
+--- a/src/net/http/client.go
++++ b/src/net/http/client.go
+@@ -973,6 +973,12 @@ func isDomainOrSubdomain(sub, parent string) bool {
+ 	if sub == parent {
+ 		return true
+ 	}
++	// If sub contains a :, it's probably an IPv6 address (and is definitely not a hostname).
++	// Don't check the suffix in this case, to avoid matching the contents of a IPv6 zone.
++	// For example, "::1%.www.example.com" is not a subdomain of "www.example.com".
++	if strings.ContainsAny(sub, ":%") {
++		return false
++	}
+ 	// If sub is "foo.example.com" and parent is "example.com",
+ 	// that means sub must end in "."+parent.
+ 	// Do it without allocating.
+diff --git a/src/net/http/client_test.go b/src/net/http/client_test.go
+index 2b4f53f..442fe35 100644
+--- a/src/net/http/client_test.go
++++ b/src/net/http/client_test.go
+@@ -1703,6 +1703,7 @@ func TestShouldCopyHeaderOnRedirect(t *testing.T) {
+ 		{"cookie2", "http://foo.com/", "http://bar.com/", false},
+ 		{"authorization", "http://foo.com/", "http://bar.com/", false},
+ 		{"www-authenticate", "http://foo.com/", "http://bar.com/", false},
++		{"authorization", "http://foo.com/", "http://[::1%25.foo.com]/", false},
+ 
+ 		// But subdomains should work:
+ 		{"www-authenticate", "http://foo.com/", "http://foo.com/", true},
+diff --git a/src/net/http/cookiejar/jar.go b/src/net/http/cookiejar/jar.go
+index 9f19917..18cbfc2 100644
+--- a/src/net/http/cookiejar/jar.go
++++ b/src/net/http/cookiejar/jar.go
+@@ -356,6 +356,13 @@ func jarKey(host string, psl PublicSuffixList) string {
+ 
+ // isIP reports whether host is an IP address.
+ func isIP(host string) bool {
++	if strings.ContainsAny(host, ":%") {
++		// Probable IPv6 address.
++		// Hostnames can't contain : or %, so this is definitely not a valid host.
++		// Treating it as an IP is the more conservative option, and avoids the risk
++		// of interpeting ::1%.www.example.com as a subtomain of www.example.com.
++		return true
++	}
+ 	return net.ParseIP(host) != nil
+ }
+ 
+diff --git a/src/net/http/cookiejar/jar_test.go b/src/net/http/cookiejar/jar_test.go
+index 47fb1ab..fd8d40e 100644
+--- a/src/net/http/cookiejar/jar_test.go
++++ b/src/net/http/cookiejar/jar_test.go
+@@ -251,6 +251,7 @@ var isIPTests = map[string]bool{
+ 	"127.0.0.1":            true,
+ 	"1.2.3.4":              true,
+ 	"2001:4860:0:2001::68": true,
++	"::1%zone":             true,
+ 	"example.com":          false,
+ 	"1.1.1.300":            false,
+ 	"www.foo.bar.net":      false,
+@@ -613,6 +614,15 @@ var basicsTests = [...]jarTest{
+ 			{"http://www.host.test:1234/", "a=1"},
+ 		},
+ 	},
++	{
++		"IPv6 zone is not treated as a host.",
++		"https://example.com/",
++		[]string{"a=1"},
++		"a=1",
++		[]query{
++			{"https://[::1%25.example.com]:80/", ""},
++		},
++	},
+ }
+ 
+ func TestBasics(t *testing.T) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-45290.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-45290.patch
new file mode 100644
index 0000000000..ddc2f67c96
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-45290.patch
@@ -0,0 +1,271 @@
+From bf80213b121074f4ad9b449410a4d13bae5e9be0 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Tue, 16 Jan 2024 15:37:52 -0800
+Subject: [PATCH] [release-branch.go1.21] net/textproto, mime/multipart: avoid
+ unbounded read in MIME header
+
+mime/multipart.Reader.ReadForm allows specifying the maximum amount
+of memory that will be consumed by the form. While this limit is
+correctly applied to the parsed form data structure, it was not
+being applied to individual header lines in a form.
+
+For example, when presented with a form containing a header line
+that never ends, ReadForm will continue to read the line until it
+runs out of memory.
+
+Limit the amount of data consumed when reading a header.
+
+Fixes CVE-2023-45290
+Fixes #65389
+For #65383
+
+Change-Id: I7f9264d25752009e95f6b2c80e3d76aaf321d658
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/2134435
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/2173776
+Reviewed-by: Carlos Amedee <amedee@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/569240
+Auto-Submit: Michael Knyszek <mknyszek@google.com>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/bf80213b121074f4ad9b449410a4d13bae5e9be0]
+CVE: CVE-2023-45290
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/mime/multipart/formdata_test.go | 42 +++++++++++++++++++++++++
+ src/net/textproto/reader.go         | 48 ++++++++++++++++++++---------
+ src/net/textproto/reader_test.go    | 12 ++++++++
+ 3 files changed, 87 insertions(+), 15 deletions(-)
+
+diff --git a/src/mime/multipart/formdata_test.go b/src/mime/multipart/formdata_test.go
+index c78eeb7..f729da6 100644
+--- a/src/mime/multipart/formdata_test.go
++++ b/src/mime/multipart/formdata_test.go
+@@ -421,6 +421,48 @@ func TestReadFormLimits(t *testing.T) {
+ 	}
+ }
+ 
++func TestReadFormEndlessHeaderLine(t *testing.T) {
++	for _, test := range []struct {
++		name   string
++		prefix string
++	}{{
++		name:   "name",
++		prefix: "X-",
++	}, {
++		name:   "value",
++		prefix: "X-Header: ",
++	}, {
++		name:   "continuation",
++		prefix: "X-Header: foo\r\n  ",
++	}} {
++		t.Run(test.name, func(t *testing.T) {
++			const eol = "\r\n"
++			s := `--boundary` + eol
++			s += `Content-Disposition: form-data; name="a"` + eol
++			s += `Content-Type: text/plain` + eol
++			s += test.prefix
++			fr := io.MultiReader(
++				strings.NewReader(s),
++				neverendingReader('X'),
++			)
++			r := NewReader(fr, "boundary")
++			_, err := r.ReadForm(1 << 20)
++			if err != ErrMessageTooLarge {
++				t.Fatalf("ReadForm(1 << 20): %v, want ErrMessageTooLarge", err)
++			}
++		})
++	}
++}
++
++type neverendingReader byte
++
++func (r neverendingReader) Read(p []byte) (n int, err error) {
++	for i := range p {
++		p[i] = byte(r)
++	}
++	return len(p), nil
++}
++
+ func BenchmarkReadForm(b *testing.B) {
+ 	for _, test := range []struct {
+ 		name string
+diff --git a/src/net/textproto/reader.go b/src/net/textproto/reader.go
+index ad2d777..cea6613 100644
+--- a/src/net/textproto/reader.go
++++ b/src/net/textproto/reader.go
+@@ -17,6 +17,10 @@ import (
+ 	"sync"
+ )
+ 
++// TODO: This should be a distinguishable error (ErrMessageTooLarge)
++// to allow mime/multipart to detect it.
++var errMessageTooLarge = errors.New("message too large")
++
+ // A Reader implements convenience methods for reading requests
+ // or responses from a text protocol network connection.
+ type Reader struct {
+@@ -38,13 +42,13 @@ func NewReader(r *bufio.Reader) *Reader {
+ // ReadLine reads a single line from r,
+ // eliding the final \n or \r\n from the returned string.
+ func (r *Reader) ReadLine() (string, error) {
+-	line, err := r.readLineSlice()
++	line, err := r.readLineSlice(-1)
+ 	return string(line), err
+ }
+ 
+ // ReadLineBytes is like ReadLine but returns a []byte instead of a string.
+ func (r *Reader) ReadLineBytes() ([]byte, error) {
+-	line, err := r.readLineSlice()
++	line, err := r.readLineSlice(-1)
+ 	if line != nil {
+ 		buf := make([]byte, len(line))
+ 		copy(buf, line)
+@@ -53,7 +57,10 @@ func (r *Reader) ReadLineBytes() ([]byte, error) {
+ 	return line, err
+ }
+ 
+-func (r *Reader) readLineSlice() ([]byte, error) {
++// readLineSlice reads a single line from r,
++// up to lim bytes long (or unlimited if lim is less than 0),
++// eliding the final \r or \r\n from the returned string.
++func (r *Reader) readLineSlice(lim int64) ([]byte, error) {
+ 	r.closeDot()
+ 	var line []byte
+ 	for {
+@@ -61,6 +68,9 @@ func (r *Reader) readLineSlice() ([]byte, error) {
+ 		if err != nil {
+ 			return nil, err
+ 		}
++		if lim >= 0 && int64(len(line))+int64(len(l)) > lim {
++			return nil, errMessageTooLarge
++		}
+ 		// Avoid the copy if the first call produced a full line.
+ 		if line == nil && !more {
+ 			return l, nil
+@@ -93,7 +103,7 @@ func (r *Reader) readLineSlice() ([]byte, error) {
+ // A line consisting of only white space is never continued.
+ //
+ func (r *Reader) ReadContinuedLine() (string, error) {
+-	line, err := r.readContinuedLineSlice(noValidation)
++	line, err := r.readContinuedLineSlice(-1, noValidation)
+ 	return string(line), err
+ }
+ 
+@@ -114,7 +124,7 @@ func trim(s []byte) []byte {
+ // ReadContinuedLineBytes is like ReadContinuedLine but
+ // returns a []byte instead of a string.
+ func (r *Reader) ReadContinuedLineBytes() ([]byte, error) {
+-	line, err := r.readContinuedLineSlice(noValidation)
++	line, err := r.readContinuedLineSlice(-1, noValidation)
+ 	if line != nil {
+ 		buf := make([]byte, len(line))
+ 		copy(buf, line)
+@@ -127,13 +137,14 @@ func (r *Reader) ReadContinuedLineBytes() ([]byte, error) {
+ // returning a byte slice with all lines. The validateFirstLine function
+ // is run on the first read line, and if it returns an error then this
+ // error is returned from readContinuedLineSlice.
+-func (r *Reader) readContinuedLineSlice(validateFirstLine func([]byte) error) ([]byte, error) {
++// It reads up to lim bytes of data (or unlimited if lim is less than 0).
++func (r *Reader) readContinuedLineSlice(lim int64, validateFirstLine func([]byte) error) ([]byte, error) {
+ 	if validateFirstLine == nil {
+ 		return nil, fmt.Errorf("missing validateFirstLine func")
+ 	}
+ 
+ 	// Read the first line.
+-	line, err := r.readLineSlice()
++	line, err := r.readLineSlice(lim)
+ 	if err != nil {
+ 		return nil, err
+ 	}
+@@ -161,13 +172,21 @@ func (r *Reader) readContinuedLineSlice(validateFirstLine func([]byte) error) ([
+ 	// copy the slice into buf.
+ 	r.buf = append(r.buf[:0], trim(line)...)
+ 
++	if lim < 0 {
++		lim = math.MaxInt64
++	}
++	lim -= int64(len(r.buf))
++
+ 	// Read continuation lines.
+ 	for r.skipSpace() > 0 {
+-		line, err := r.readLineSlice()
++		r.buf = append(r.buf, ' ')
++		if int64(len(r.buf)) >= lim {
++			return nil, errMessageTooLarge
++		}
++		line, err := r.readLineSlice(lim - int64(len(r.buf)))
+ 		if err != nil {
+ 			break
+ 		}
+-		r.buf = append(r.buf, ' ')
+ 		r.buf = append(r.buf, trim(line)...)
+ 	}
+ 	return r.buf, nil
+@@ -512,7 +531,8 @@ func readMIMEHeader(r *Reader, maxMemory, maxHeaders int64) (MIMEHeader, error)
+ 
+ 	// The first line cannot start with a leading space.
+ 	if buf, err := r.R.Peek(1); err == nil && (buf[0] == ' ' || buf[0] == '\t') {
+-		line, err := r.readLineSlice()
++		const errorLimit = 80 // arbitrary limit on how much of the line we'll quote
++		line, err := r.readLineSlice(errorLimit)
+ 		if err != nil {
+ 			return m, err
+ 		}
+@@ -520,7 +540,7 @@ func readMIMEHeader(r *Reader, maxMemory, maxHeaders int64) (MIMEHeader, error)
+ 	}
+ 
+ 	for {
+-		kv, err := r.readContinuedLineSlice(mustHaveFieldNameColon)
++		kv, err := r.readContinuedLineSlice(maxMemory, mustHaveFieldNameColon)
+ 		if len(kv) == 0 {
+ 			return m, err
+ 		}
+@@ -541,7 +561,7 @@ func readMIMEHeader(r *Reader, maxMemory, maxHeaders int64) (MIMEHeader, error)
+ 
+ 		maxHeaders--
+ 		if maxHeaders < 0 {
+-			return nil, errors.New("message too large")
++			return nil, errMessageTooLarge
+ 		}
+ 
+ 		// backport 5c55ac9bf1e5f779220294c843526536605f42ab
+@@ -567,9 +587,7 @@ func readMIMEHeader(r *Reader, maxMemory, maxHeaders int64) (MIMEHeader, error)
+ 		}
+ 		maxMemory -= int64(len(value))
+ 		if maxMemory < 0 {
+-			// TODO: This should be a distinguishable error (ErrMessageTooLarge)
+-			// to allow mime/multipart to detect it.
+-			return m, errors.New("message too large")
++			return m, errMessageTooLarge
+ 		}
+ 		if vv == nil && len(strs) > 0 {
+ 			// More than likely this will be a single-element key.
+diff --git a/src/net/textproto/reader_test.go b/src/net/textproto/reader_test.go
+index 3ae0de1..db1ed91 100644
+--- a/src/net/textproto/reader_test.go
++++ b/src/net/textproto/reader_test.go
+@@ -34,6 +34,18 @@ func TestReadLine(t *testing.T) {
+ 	}
+ }
+ 
++func TestReadLineLongLine(t *testing.T) {
++	line := strings.Repeat("12345", 10000)
++	r := reader(line + "\r\n")
++	s, err := r.ReadLine()
++	if err != nil {
++		t.Fatalf("Line 1: %v", err)
++	}
++	if s != line {
++		t.Fatalf("%v-byte line does not match expected %v-byte line", len(s), len(line))
++	}
++}
++
+ func TestReadContinuedLine(t *testing.T) {
+ 	r := reader("line1\nline\n 2\nline3\n")
+ 	s, err := r.ReadContinuedLine()
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2024-24785.patch b/meta/recipes-devtools/go/go-1.14/CVE-2024-24785.patch
new file mode 100644
index 0000000000..1398a2ca48
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2024-24785.patch
@@ -0,0 +1,197 @@
+From 3643147a29352ca2894fd5d0d2069bc4b4335a7e Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <roland@golang.org>
+Date: Wed, 14 Feb 2024 17:18:36 -0800
+Subject: [PATCH] [release-branch.go1.21] html/template: escape additional
+ tokens in MarshalJSON errors
+
+Escape "</script" and "<!--" in errors returned from MarshalJSON errors
+when attempting to marshal types in script blocks. This prevents any
+user controlled content from prematurely terminating the script block.
+
+Updates #65697
+Fixes #65968
+
+Change-Id: Icf0e26c54ea7d9c1deed0bff11b6506c99ddef1b
+Reviewed-on: https://go-review.googlesource.com/c/go/+/564196
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+(cherry picked from commit ccbc725f2d678255df1bd326fa511a492aa3a0aa)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/567515
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/3643147a29352ca2894fd5d0d2069bc4b4335a7e]
+CVE: CVE-2024-24785
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/html/template/js.go      | 22 ++++++++-
+ src/html/template/js_test.go | 96 ++++++++++++++++++++----------------
+ 2 files changed, 74 insertions(+), 44 deletions(-)
+
+diff --git a/src/html/template/js.go b/src/html/template/js.go
+index 35994f0..4d3b25d 100644
+--- a/src/html/template/js.go
++++ b/src/html/template/js.go
+@@ -171,13 +171,31 @@ func jsValEscaper(args ...interface{}) string {
+ 	// cyclic data. This may be an unacceptable DoS risk.
+ 	b, err := json.Marshal(a)
+ 	if err != nil {
+-		// Put a space before comment so that if it is flush against
++		// While the standard JSON marshaller does not include user controlled
++		// information in the error message, if a type has a MarshalJSON method,
++		// the content of the error message is not guaranteed. Since we insert
++		// the error into the template, as part of a comment, we attempt to
++		// prevent the error from either terminating the comment, or the script
++		// block itself.
++		//
++		// In particular we:
++		//   * replace "*/" comment end tokens with "* /", which does not
++		//     terminate the comment
++		//   * replace "</script" with "\x3C/script", and "<!--" with
++		//     "\x3C!--", which prevents confusing script block termination
++		//     semantics
++		//
++		// We also put a space before the comment so that if it is flush against
+ 		// a division operator it is not turned into a line comment:
+ 		//     x/{{y}}
+ 		// turning into
+ 		//     x//* error marshaling y:
+ 		//          second line of error message */null
+-		return fmt.Sprintf(" /* %s */null ", strings.ReplaceAll(err.Error(), "*/", "* /"))
++		errStr := err.Error()
++		errStr = strings.ReplaceAll(errStr, "*/", "* /")
++		errStr = strings.ReplaceAll(errStr, "</script", `\x3C/script`)
++		errStr = strings.ReplaceAll(errStr, "<!--", `\x3C!--`)
++		return fmt.Sprintf(" /* %s */null ", errStr)
+ 	}
+ 
+ 	// TODO: maybe post-process output to prevent it from containing
+diff --git a/src/html/template/js_test.go b/src/html/template/js_test.go
+index de9ef28..3fc3baf 100644
+--- a/src/html/template/js_test.go
++++ b/src/html/template/js_test.go
+@@ -5,6 +5,7 @@
+ package template
+ 
+ import (
++	"errors"
+ 	"bytes"
+ 	"math"
+ 	"strings"
+@@ -104,61 +105,72 @@ func TestNextJsCtx(t *testing.T) {
+ 	}
+ }
+ 
++type jsonErrType struct{}
++
++func (e *jsonErrType) MarshalJSON() ([]byte, error) {
++	return nil, errors.New("beep */ boop </script blip <!--")
++}
++
+ func TestJSValEscaper(t *testing.T) {
+ 	tests := []struct {
+-		x  interface{}
+-		js string
++		x        interface{}
++		js       string
++		skipNest bool
+ 	}{
+-		{int(42), " 42 "},
+-		{uint(42), " 42 "},
+-		{int16(42), " 42 "},
+-		{uint16(42), " 42 "},
+-		{int32(-42), " -42 "},
+-		{uint32(42), " 42 "},
+-		{int16(-42), " -42 "},
+-		{uint16(42), " 42 "},
+-		{int64(-42), " -42 "},
+-		{uint64(42), " 42 "},
+-		{uint64(1) << 53, " 9007199254740992 "},
++		{int(42), " 42 ", false},
++		{uint(42), " 42 ", false},
++		{int16(42), " 42 ", false},
++		{uint16(42), " 42 ", false},
++		{int32(-42), " -42 ", false},
++		{uint32(42), " 42 ", false},
++		{int16(-42), " -42 ", false},
++		{uint16(42), " 42 ", false},
++		{int64(-42), " -42 ", false},
++		{uint64(42), " 42 ", false},
++		{uint64(1) << 53, " 9007199254740992 ", false},
+ 		// ulp(1 << 53) > 1 so this loses precision in JS
+ 		// but it is still a representable integer literal.
+-		{uint64(1)<<53 + 1, " 9007199254740993 "},
+-		{float32(1.0), " 1 "},
+-		{float32(-1.0), " -1 "},
+-		{float32(0.5), " 0.5 "},
+-		{float32(-0.5), " -0.5 "},
+-		{float32(1.0) / float32(256), " 0.00390625 "},
+-		{float32(0), " 0 "},
+-		{math.Copysign(0, -1), " -0 "},
+-		{float64(1.0), " 1 "},
+-		{float64(-1.0), " -1 "},
+-		{float64(0.5), " 0.5 "},
+-		{float64(-0.5), " -0.5 "},
+-		{float64(0), " 0 "},
+-		{math.Copysign(0, -1), " -0 "},
+-		{"", `""`},
+-		{"foo", `"foo"`},
++		{uint64(1)<<53 + 1, " 9007199254740993 ", false},
++		{float32(1.0), " 1 ", false},
++		{float32(-1.0), " -1 ", false},
++		{float32(0.5), " 0.5 ", false},
++		{float32(-0.5), " -0.5 ", false},
++		{float32(1.0) / float32(256), " 0.00390625 ", false},
++		{float32(0), " 0 ", false},
++		{math.Copysign(0, -1), " -0 ", false},
++		{float64(1.0), " 1 ", false},
++		{float64(-1.0), " -1 ", false},
++		{float64(0.5), " 0.5 ", false},
++		{float64(-0.5), " -0.5 ", false},
++		{float64(0), " 0 ", false},
++		{math.Copysign(0, -1), " -0 ", false},
++		{"", `""`, false},
++		{"foo", `"foo"`, false},
+ 		// Newlines.
+-		{"\r\n\u2028\u2029", `"\r\n\u2028\u2029"`},
++		{"\r\n\u2028\u2029", `"\r\n\u2028\u2029"`, false},
+ 		// "\v" == "v" on IE 6 so use "\u000b" instead.
+-		{"\t\x0b", `"\t\u000b"`},
+-		{struct{ X, Y int }{1, 2}, `{"X":1,"Y":2}`},
+-		{[]interface{}{}, "[]"},
+-		{[]interface{}{42, "foo", nil}, `[42,"foo",null]`},
+-		{[]string{"<!--", "</script>", "-->"}, `["\u003c!--","\u003c/script\u003e","--\u003e"]`},
+-		{"<!--", `"\u003c!--"`},
+-		{"-->", `"--\u003e"`},
+-		{"<![CDATA[", `"\u003c![CDATA["`},
+-		{"]]>", `"]]\u003e"`},
+-		{"</script", `"\u003c/script"`},
+-		{"\U0001D11E", "\"\U0001D11E\""}, // or "\uD834\uDD1E"
+-		{nil, " null "},
++		{"\t\x0b", `"\t\u000b"`, false},
++		{struct{ X, Y int }{1, 2}, `{"X":1,"Y":2}`, false},
++		{[]interface{}{}, "[]", false},
++		{[]interface{}{42, "foo", nil}, `[42,"foo",null]`, false},
++		{[]string{"<!--", "</script>", "-->"}, `["\u003c!--","\u003c/script\u003e","--\u003e"]`, false},
++		{"<!--", `"\u003c!--"`, false},
++		{"-->", `"--\u003e"`, false},
++		{"<![CDATA[", `"\u003c![CDATA["`, false},
++		{"]]>", `"]]\u003e"`, false},
++		{"</script", `"\u003c/script"`, false},
++		{"\U0001D11E", "\"\U0001D11E\"", false}, // or "\uD834\uDD1E"
++		{nil, " null ", false},
++		{&jsonErrType{}, " /* json: error calling MarshalJSON for type *template.jsonErrType: beep * / boop \\x3C/script blip \\x3C!-- */null ", true},
+ 	}
+ 
+ 	for _, test := range tests {
+ 		if js := jsValEscaper(test.x); js != test.js {
+ 			t.Errorf("%+v: want\n\t%q\ngot\n\t%q", test.x, test.js, js)
+ 		}
++		if test.skipNest {
++			continue
++		}
+ 		// Make sure that escaping corner cases are not broken
+ 		// by nesting.
+ 		a := []interface{}{test.x}
+-- 
+2.25.1
+
-- 
2.25.1


