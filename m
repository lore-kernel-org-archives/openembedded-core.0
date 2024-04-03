Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F832C6FD1F
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 03:12:13 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.2730.1712113923510483682
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 20:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Vs/7nTPJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e6b22af648so414021b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 20:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712113923; x=1712718723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAXBthLlpLDMfPkughrA8il4rX9c3rqOLlAiOQFPqAY=;
        b=Vs/7nTPJKi11AQ4LZjbcl5VN3GfF/nbbQvljOUa+1TbU3M4jgwrwaX9K9u2468UCeV
         OyC+Al5jDn2ctB8ucXmHhU9lN9/FH+dXi4LxncxCjCa0FV0F13dyYmvOnxbxq162nf5e
         7+xqK31wt066a9Us2XOI3wJgMNXdQMndOW5jiwkD/yyQ6G+Z7qhPcoxWutstnbF7mAYU
         1xA5hFyvTbx1gdt3slfDcc2APgJT5EV3f3e+kCzJWSaYuhkMwVqkjD/vv24OXMPRBsq8
         WVqDDa380sFPJLtnszDFG8LpQ+ch1qk/WmfWKDyPvru0MiEcozRhTCBixuHk4BKVoVr3
         kQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712113923; x=1712718723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAXBthLlpLDMfPkughrA8il4rX9c3rqOLlAiOQFPqAY=;
        b=OHUzZvruKjFbIOhcBfL/pRElHLO7pOYQ5xw3aMAvkpEhxNQyHfLV/M9yEtxseeank1
         qs32FI199LNfjUY4v8jH2UO1a3bIwRfXIiNkGLn/SflWwYTATSubsm93oWmsmX+Hr9XJ
         R6mC36ZUOI3jGuX0dO+oiIZAMER60Rd2rma0MSnw3t9I3NwNIpVSTIYEbf/RSuHQoDzC
         ciQjRsJF2mXKB3jlSC/6KPziUjINJKroAtoti6lDfvQEOzlyKQdaD8xTd4GAz30e4JpN
         ZJLPHhice+WAnpSpwPr7dE2Ec8aIoBZh4rqHWSB+4gre9bhI8uWZdwDVLccTkhmiPfYw
         KXkA==
X-Gm-Message-State: AOJu0YxV1mfQsq3gPoM2ndxRsFYHPuwAqZ75L9CNdFQkqAgb3JTW90sg
	6Kv8UIkRKUkrbqpOMKwBrx3u5f2HdfLXaoqHusGAIgjBLENqC9tvG7wbAhDZTAqFQREQudKeV5m
	XDow=
X-Google-Smtp-Source: AGHT+IHiV5Qe5hR7wKKbkfnzcpQ6/Y8IuZwcBRdg8tVwTkXlL23MkzitdWAIlEzJ8hyWpiFVOV/DlA==
X-Received: by 2002:a05:6a20:3ca0:b0:1a3:4e27:c8d1 with SMTP id b32-20020a056a203ca000b001a34e27c8d1mr1652181pzj.25.1712113922328;
        Tue, 02 Apr 2024 20:12:02 -0700 (PDT)
Received: from xps13.. (067-053-223-136.biz.spectrum.com. [67.53.223.136])
        by smtp.gmail.com with ESMTPSA id x15-20020a63170f000000b005dc87f5dfcfsm10371743pgl.78.2024.04.02.20.12.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 20:12:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/7] go: Fix for CVE-2023-45289 CVE-2023-45290 & CVE-2024-24785
Date: Tue,  2 Apr 2024 17:11:47 -1000
Message-Id: <2bc50dccff15b9c4ad815092ef20caa3ef06864c.1712113689.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712113689.git.steve@sakoman.com>
References: <cover.1712113689.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 03:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197887

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://github.com/golang/go/commit/20586c0dbe03d144f914155f879fa5ee287591a1
&
https://github.com/golang/go/commit/bf80213b121074f4ad9b449410a4d13bae5e9be0
&
https://github.com/golang/go/commit/3643147a29352ca2894fd5d0d2069bc4b4335a7e]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


