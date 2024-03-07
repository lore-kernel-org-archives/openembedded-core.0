Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BADC48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 05:44:57 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.16796.1709790290863200241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 21:44:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HdENDmOA;
 spf=pass (domain: mvista.com, ip: 209.85.167.171, mailfrom: hprajapati@mvista.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c1ec2d05feso210137b6e.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 21:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1709790290; x=1710395090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VncDS7YdKjH5muiUZBC4K5yznEPwZ5IhkDxIuRE9Ot8=;
        b=HdENDmOAS7VWurZFAxTSCpq+gjIAulUv9yEdSF7sv5o73YJ7pwyk8DGzxpkX1pdJmq
         Kojb7BPPUK+gmKjgrPCR2NG3zkYiXEm/jibReTjaSlKF+71LYp+bViHEVJLf4Epgfi69
         Bob/NavLMG9GgGTwsm34aBD8MNcKQ3w3EHEOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709790290; x=1710395090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VncDS7YdKjH5muiUZBC4K5yznEPwZ5IhkDxIuRE9Ot8=;
        b=IFH0yLUhU+pc2q1WPHMbrnh5fyShHctwN6yQKSq8yGpB9YVIpICH4Gp1QeNib1oe43
         awJZ2uZO5alzwpiBt00NzrDJ4VL8+Wnz6dhFXSCok0OkJfi9MCciFOshkzVAQSbLqg1S
         azQD8jxKygyfgxLsuMzB00yabsroHyJWAB+GApFm5FrSd7vIfRBjCv/g5k9G6ZhxUlg0
         UaL5+o37jcLA2JuroTZzL9NJ8WeAy/VmOqyTk08ZrdBsFnOFrqc/1Mz8nI6PApLBwsm1
         odqtdPxKhcjWfYBeALkP5X4s7EGEeh4LjpAADlNNeghrBlte6hVSQKVVQQ/VOTCanT7y
         FnaA==
X-Gm-Message-State: AOJu0YxrTB/0FX0Bit2orxKExFdn/u+JCd9eq98N6XFZ08REhDnf9T/V
	lOZOnYzLch0hXBDh4SikTK5yRYBk32TwHRSj+TODYiKi3Xskq19uJTZVCJMhNabPoVlY1uSA3bb
	w
X-Google-Smtp-Source: AGHT+IHULHp6h4Kj0UoVYzx9Onvqb4fZuqfFpYw+P/w67KAD3kGr138sk2yvLuN20uCQFJ/lcHsifw==
X-Received: by 2002:a05:6871:8a7:b0:21e:3c57:18d4 with SMTP id r39-20020a05687108a700b0021e3c5718d4mr7327700oaq.19.1709790289682;
        Wed, 06 Mar 2024 21:44:49 -0800 (PST)
Received: from MVIN00016.mvista.com ([43.249.234.154])
        by smtp.gmail.com with ESMTPSA id m7-20020aa78a07000000b006e319d8c752sm11691981pfa.150.2024.03.06.21.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 21:44:49 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] golang: Fix CVE-2023-45289 & CVE-2023-45290
Date: Thu,  7 Mar 2024 11:14:43 +0530
Message-Id: <20240307054443.44478-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 05:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196768

Backport fixes for:
CVE-2023-45289 - Upstream-Status: Backport from https://github.com/golang/go/commit/3a855208e3efed2e9d7c20ad023f1fa78afcc0be
CVE-2023-45290 - Upstream-Status: Backport from https://github.com/golang/go/commit/041a47712e765e94f86d841c3110c840e76d8f82

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   2 +
 .../go/go-1.21/CVE-2023-45289.patch           | 121 ++++++++
 .../go/go-1.21/CVE-2023-45290.patch           | 270 ++++++++++++++++++
 3 files changed, 393 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2023-45289.patch
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2023-45290.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 95c4461d3e..02433a79e5 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -48,6 +48,8 @@ SRC_URI += "\
     file://CVE-2023-39319.patch \
     file://CVE-2023-39318.patch \
     file://CVE-2023-39326.patch \
+    file://CVE-2023-45289.patch \
+    file://CVE-2023-45290.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2023-45289.patch b/meta/recipes-devtools/go/go-1.21/CVE-2023-45289.patch
new file mode 100644
index 0000000000..f8ac64472f
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2023-45289.patch
@@ -0,0 +1,121 @@
+From 3a855208e3efed2e9d7c20ad023f1fa78afcc0be Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Thu, 11 Jan 2024 11:31:57 -0800
+Subject: [PATCH] [release-branch.go1.22] net/http, net/http/cookiejar: avoid
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
+Fixes #65859
+For #65065
+
+Change-Id: I8f463f59f0e700c8a18733d2b264a8bcb3a19599
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/2131938
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/2174344
+Reviewed-by: Carlos Amedee <amedee@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/569236
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Auto-Submit: Michael Knyszek <mknyszek@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/3a855208e3efed2e9d7c20ad023f1fa78afcc0be]
+CVE: CVE-2023-45289
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/net/http/client.go             |  6 ++++++
+ src/net/http/client_test.go        |  1 +
+ src/net/http/cookiejar/jar.go      |  7 +++++++
+ src/net/http/cookiejar/jar_test.go | 10 ++++++++++
+ 4 files changed, 24 insertions(+)
+
+diff --git a/src/net/http/client.go b/src/net/http/client.go
+index 22db96b..b2dd445 100644
+--- a/src/net/http/client.go
++++ b/src/net/http/client.go
+@@ -1015,6 +1015,12 @@ func isDomainOrSubdomain(sub, parent string) bool {
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
+index 9788c7a..7a0aa53 100644
+--- a/src/net/http/client_test.go
++++ b/src/net/http/client_test.go
+@@ -1729,6 +1729,7 @@ func TestShouldCopyHeaderOnRedirect(t *testing.T) {
+ 		{"cookie2", "http://foo.com/", "http://bar.com/", false},
+ 		{"authorization", "http://foo.com/", "http://bar.com/", false},
+ 		{"www-authenticate", "http://foo.com/", "http://bar.com/", false},
++		{"authorization", "http://foo.com/", "http://[::1%25.foo.com]/", false},
+ 
+ 		// But subdomains should work:
+ 		{"www-authenticate", "http://foo.com/", "http://foo.com/", true},
+diff --git a/src/net/http/cookiejar/jar.go b/src/net/http/cookiejar/jar.go
+index e6583da..f2cf9c2 100644
+--- a/src/net/http/cookiejar/jar.go
++++ b/src/net/http/cookiejar/jar.go
+@@ -362,6 +362,13 @@ func jarKey(host string, psl PublicSuffixList) string {
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
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2023-45290.patch b/meta/recipes-devtools/go/go-1.21/CVE-2023-45290.patch
new file mode 100644
index 0000000000..81f2123f34
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2023-45290.patch
@@ -0,0 +1,270 @@
+From 041a47712e765e94f86d841c3110c840e76d8f82 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Tue, 16 Jan 2024 15:37:52 -0800
+Subject: [PATCH] [release-branch.go1.22] net/textproto, mime/multipart: avoid
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
+Fixes #65850
+For #65383
+
+Change-Id: I7f9264d25752009e95f6b2c80e3d76aaf321d658
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/2134435
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/2174345
+Reviewed-by: Carlos Amedee <amedee@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/569237
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Auto-Submit: Michael Knyszek <mknyszek@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/041a47712e765e94f86d841c3110c840e76d8f82]
+CVE: CVE-2023-45290
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>---
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
+index c6569c8..3ac4d4d 100644
+--- a/src/net/textproto/reader.go
++++ b/src/net/textproto/reader.go
+@@ -16,6 +16,10 @@ import (
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
+@@ -37,13 +41,13 @@ func NewReader(r *bufio.Reader) *Reader {
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
+@@ -52,7 +56,10 @@ func (r *Reader) ReadLineBytes() ([]byte, error) {
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
+@@ -60,6 +67,9 @@ func (r *Reader) readLineSlice() ([]byte, error) {
+ 		if err != nil {
+ 			return nil, err
+ 		}
++		if lim >= 0 && int64(len(line))+int64(len(l)) > lim {
++			return nil, errMessageTooLarge
++		}
+ 		// Avoid the copy if the first call produced a full line.
+ 		if line == nil && !more {
+ 			return l, nil
+@@ -92,7 +102,7 @@ func (r *Reader) readLineSlice() ([]byte, error) {
+ // Empty lines are never continued.
+ //
+ func (r *Reader) ReadContinuedLine() (string, error) {
+-	line, err := r.readContinuedLineSlice(noValidation)
++	line, err := r.readContinuedLineSlice(-1, noValidation)
+ 	return string(line), err
+ }
+ 
+@@ -113,7 +123,7 @@ func trim(s []byte) []byte {
+ // ReadContinuedLineBytes is like ReadContinuedLine but
+ // returns a []byte instead of a string.
+ func (r *Reader) ReadContinuedLineBytes() ([]byte, error) {
+-	line, err := r.readContinuedLineSlice(noValidation)
++	line, err := r.readContinuedLineSlice(-1, noValidation)
+ 	if line != nil {
+ 		buf := make([]byte, len(line))
+ 		copy(buf, line)
+@@ -126,13 +136,14 @@ func (r *Reader) ReadContinuedLineBytes() ([]byte, error) {
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
+@@ -160,13 +171,21 @@ func (r *Reader) readContinuedLineSlice(validateFirstLine func([]byte) error) ([
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
+@@ -511,7 +530,8 @@ func readMIMEHeader(r *Reader, maxMemory, maxHeaders int64) (MIMEHeader, error)
+ 
+ 	// The first line cannot start with a leading space.
+ 	if buf, err := r.R.Peek(1); err == nil && (buf[0] == ' ' || buf[0] == '\t') {
+-		line, err := r.readLineSlice()
++		const errorLimit = 80 // arbitrary limit on how much of the line we'll quote
++		line, err := r.readLineSlice(errorLimit)
+ 		if err != nil {
+ 			return m, err
+ 		}
+@@ -519,7 +539,7 @@ func readMIMEHeader(r *Reader, maxMemory, maxHeaders int64) (MIMEHeader, error)
+ 	}
+ 
+ 	for {
+-		kv, err := r.readContinuedLineSlice(mustHaveFieldNameColon)
++		kv, err := r.readContinuedLineSlice(maxMemory, mustHaveFieldNameColon)
+ 		if len(kv) == 0 {
+ 			return m, err
+ 		}
+@@ -540,7 +560,7 @@ func readMIMEHeader(r *Reader, maxMemory, maxHeaders int64) (MIMEHeader, error)
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
-- 
2.25.1


