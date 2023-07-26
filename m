Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC05C001B0
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 14:34:20 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web10.12780.1690382051572447231
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 07:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JsxraAoP;
 spf=pass (domain: mvista.com, ip: 209.85.161.43, mailfrom: vkumbhar@mvista.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-56368c40e8eso4194623eaf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 07:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1690382050; x=1690986850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+xsiB1jGiry+bgwV3qX8RyqT5x4nqXZN3hWe8wFT16U=;
        b=JsxraAoP+sh1wApKLVQfzs7wubMlM7npFoFQbEvvlT5FjFZsq4C/Cp3iTqSAPQNgwY
         mY21EhaO5VMUNRYXCY4e7/INwfKYdrtgiVnwj/dwBxdbYeTE+HpeAOKU2v9iQhNyFK9X
         NzveeUK5aYUaPXCaDdDAzEh3WmROmHdhUsKig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690382050; x=1690986850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xsiB1jGiry+bgwV3qX8RyqT5x4nqXZN3hWe8wFT16U=;
        b=gWt7i956uYby2BUHv35WYocriL51MT/ab5PGjI3ZAWQZGa5v82Lf1LHHWJo95pjnhj
         9ajCFcrihYCPcEqwpZLuhLXcU+baE7vjLM/j4q7bR0nuaBDgyAHTzdHxMKQNWjBvwdPK
         Hy4g68wtTjVBwFa5wM0xH/+WwC/UIevWeGz34lseopdUhjw0yxhvnAxCX73pfdi0mTbi
         GaxDjmqKNzq+kHQHfr4ZRAxoQGk/VkbeIex9jUAayFBNfb6TUUgNTpDYDKbG2iNmNpsI
         Qv3v26qBCY6Ibrod72ux/4cA+PkxsGXBoV1p4F4KDUh1DQnl7Uvx5hXt80hf7ocCnGDV
         Agsw==
X-Gm-Message-State: ABy/qLaxdcNCrI9VqacMTJYPtH7uodqkPLZyxrqt5Gxp/cM/DKJPUgk6
	K2iLnMrUDgaQ4AZn3uAlF1BJiK7rorWrB7a3jVc=
X-Google-Smtp-Source: APBJJlGMlYG6DeLlathpnHp0PjbilpcXWQZwEVwQBlf7cZrImJ6ajVBKvMWr7u5aemnNqmnvHaWMHg==
X-Received: by 2002:a05:6358:7f04:b0:131:b4c:b871 with SMTP id p4-20020a0563587f0400b001310b4cb871mr2184003rwn.22.1690382050106;
        Wed, 26 Jul 2023 07:34:10 -0700 (PDT)
Received: from vkumbhar-Latitude-3400.mvista.com ([115.96.166.134])
        by smtp.googlemail.com with ESMTPSA id a20-20020a637f14000000b0055fedbf1938sm6603397pgd.31.2023.07.26.07.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 07:34:09 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH] go: fix CVE-2023-29406 net/http: insufficient sanitization of Host header
Date: Wed, 26 Jul 2023 20:03:52 +0530
Message-Id: <20230726143352.2707128-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 14:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184885

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2023-29406.patch           | 212 ++++++++++++++++++
 2 files changed, 213 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29406.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 33b53b1a34..b2cf805d2d 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -68,6 +68,7 @@ SRC_URI += "\
     file://CVE-2023-29402.patch \
     file://CVE-2023-29404.patch \
     file://CVE-2023-29400.patch \
+    file://CVE-2023-29406.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-29406.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-29406.patch
new file mode 100644
index 0000000000..080def4682
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-29406.patch
@@ -0,0 +1,212 @@
+From 5fa6923b1ea891400153d04ddf1545e23b40041b Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Wed, 28 Jun 2023 13:20:08 -0700
+Subject: [PATCH] [release-branch.go1.19] net/http: validate Host header before
+ sending
+
+Verify that the Host header we send is valid.
+Avoids surprising behavior such as a Host of "go.dev\r\nX-Evil:oops"
+adding an X-Evil header to HTTP/1 requests.
+
+Add a test, skip the test for HTTP/2. HTTP/2 is not vulnerable to
+header injection in the way HTTP/1 is, but x/net/http2 doesn't validate
+the header and will go into a retry loop when the server rejects it.
+CL 506995 adds the necessary validation to x/net/http2.
+
+Updates #60374
+Fixes #61075
+For CVE-2023-29406
+
+Change-Id: I05cb6866a9bead043101954dfded199258c6dd04
+Reviewed-on: https://go-review.googlesource.com/c/go/+/506996
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Run-TryBot: Damien Neil <dneil@google.com>
+(cherry picked from commit 499458f7ca04087958987a33c2703c3ef03e27e2)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/507358
+Run-TryBot: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/5fa6923b1ea891400153d04ddf1545e23b40041b]
+CVE: CVE-2023-29406
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/net/http/http_test.go      | 29 ---------------------
+ src/net/http/request.go        | 47 ++++++++--------------------------
+ src/net/http/request_test.go   | 11 ++------
+ src/net/http/transport_test.go | 18 +++++++++++++
+ 4 files changed, 31 insertions(+), 74 deletions(-)
+
+diff --git a/src/net/http/http_test.go b/src/net/http/http_test.go
+index f4ea52d..ea38cb4 100644
+--- a/src/net/http/http_test.go
++++ b/src/net/http/http_test.go
+@@ -49,35 +49,6 @@ func TestForeachHeaderElement(t *testing.T) {
+	}
+ }
+
+-func TestCleanHost(t *testing.T) {
+-	tests := []struct {
+-		in, want string
+-	}{
+-		{"www.google.com", "www.google.com"},
+-		{"www.google.com foo", "www.google.com"},
+-		{"www.google.com/foo", "www.google.com"},
+-		{" first character is a space", ""},
+-		{"[1::6]:8080", "[1::6]:8080"},
+-
+-		// Punycode:
+-		{"гофер.рф/foo", "xn--c1ae0ajs.xn--p1ai"},
+-		{"bücher.de", "xn--bcher-kva.de"},
+-		{"bücher.de:8080", "xn--bcher-kva.de:8080"},
+-		// Verify we convert to lowercase before punycode:
+-		{"BÜCHER.de", "xn--bcher-kva.de"},
+-		{"BÜCHER.de:8080", "xn--bcher-kva.de:8080"},
+-		// Verify we normalize to NFC before punycode:
+-		{"gophér.nfc", "xn--gophr-esa.nfc"},            // NFC input; no work needed
+-		{"goph\u0065\u0301r.nfd", "xn--gophr-esa.nfd"}, // NFD input
+-	}
+-	for _, tt := range tests {
+-		got := cleanHost(tt.in)
+-		if tt.want != got {
+-			t.Errorf("cleanHost(%q) = %q, want %q", tt.in, got, tt.want)
+-		}
+-	}
+-}
+-
+ // Test that cmd/go doesn't link in the HTTP server.
+ //
+ // This catches accidental dependencies between the HTTP transport and
+diff --git a/src/net/http/request.go b/src/net/http/request.go
+index cb2edd2..2706300 100644
+--- a/src/net/http/request.go
++++ b/src/net/http/request.go
+@@ -18,7 +18,6 @@ import (
+	"io/ioutil"
+	"mime"
+	"mime/multipart"
+-	"net"
+	"net/http/httptrace"
+	"net/textproto"
+	"net/url"
+@@ -26,7 +25,8 @@ import (
+	"strconv"
+	"strings"
+	"sync"
+-
++
++	"golang.org/x/net/http/httpguts"
+	"golang.org/x/net/idna"
+ )
+
+@@ -557,12 +557,19 @@ func (r *Request) write(w io.Writer, usingProxy bool, extraHeaders Header, waitF
+	// is not given, use the host from the request URL.
+	//
+	// Clean the host, in case it arrives with unexpected stuff in it.
+-	host := cleanHost(r.Host)
++	host := r.Host
+	if host == "" {
+		if r.URL == nil {
+			return errMissingHost
+		}
+-		host = cleanHost(r.URL.Host)
++		host = r.URL.Host
++	}
++	host, err = httpguts.PunycodeHostPort(host)
++	if err != nil {
++		return err
++	}
++	if !httpguts.ValidHostHeader(host) {
++		return errors.New("http: invalid Host header")
+	}
+
+	// According to RFC 6874, an HTTP client, proxy, or other
+@@ -717,38 +724,6 @@ func idnaASCII(v string) (string, error) {
+	return idna.Lookup.ToASCII(v)
+ }
+
+-// cleanHost cleans up the host sent in request's Host header.
+-//
+-// It both strips anything after '/' or ' ', and puts the value
+-// into Punycode form, if necessary.
+-//
+-// Ideally we'd clean the Host header according to the spec:
+-//   https://tools.ietf.org/html/rfc7230#section-5.4 (Host = uri-host [ ":" port ]")
+-//   https://tools.ietf.org/html/rfc7230#section-2.7 (uri-host -> rfc3986's host)
+-//   https://tools.ietf.org/html/rfc3986#section-3.2.2 (definition of host)
+-// But practically, what we are trying to avoid is the situation in
+-// issue 11206, where a malformed Host header used in the proxy context
+-// would create a bad request. So it is enough to just truncate at the
+-// first offending character.
+-func cleanHost(in string) string {
+-	if i := strings.IndexAny(in, " /"); i != -1 {
+-		in = in[:i]
+-	}
+-	host, port, err := net.SplitHostPort(in)
+-	if err != nil { // input was just a host
+-		a, err := idnaASCII(in)
+-		if err != nil {
+-			return in // garbage in, garbage out
+-		}
+-		return a
+-	}
+-	a, err := idnaASCII(host)
+-	if err != nil {
+-		return in // garbage in, garbage out
+-	}
+-	return net.JoinHostPort(a, port)
+-}
+-
+ // removeZone removes IPv6 zone identifier from host.
+ // E.g., "[fe80::1%en0]:8080" to "[fe80::1]:8080"
+ func removeZone(host string) string {
+diff --git a/src/net/http/request_test.go b/src/net/http/request_test.go
+index 461d66e..0d417ff 100644
+--- a/src/net/http/request_test.go
++++ b/src/net/http/request_test.go
+@@ -676,15 +676,8 @@ func TestRequestBadHost(t *testing.T) {
+	}
+	req.Host = "foo.com with spaces"
+	req.URL.Host = "foo.com with spaces"
+-	req.Write(logWrites{t, &got})
+-	want := []string{
+-		"GET /after HTTP/1.1\r\n",
+-		"Host: foo.com\r\n",
+-		"User-Agent: " + DefaultUserAgent + "\r\n",
+-		"\r\n",
+-	}
+-	if !reflect.DeepEqual(got, want) {
+-		t.Errorf("Writes = %q\n  Want = %q", got, want)
++	if err := req.Write(logWrites{t, &got}); err == nil {
++		t.Errorf("Writing request with invalid Host: succeded, want error")
+	}
+ }
+
+diff --git a/src/net/http/transport_test.go b/src/net/http/transport_test.go
+index fa0c370..0afb6b9 100644
+--- a/src/net/http/transport_test.go
++++ b/src/net/http/transport_test.go
+@@ -6249,3 +6249,21 @@ func TestIssue32441(t *testing.T) {
+		t.Error(err)
+	}
+ }
++
++func TestRequestSanitization(t *testing.T) {
++	setParallel(t)
++	defer afterTest(t)
++
++	ts := newClientServerTest(t, h1Mode, HandlerFunc(func(rw ResponseWriter, req *Request) {
++		if h, ok := req.Header["X-Evil"]; ok {
++			t.Errorf("request has X-Evil header: %q", h)
++		}
++	})).ts
++	defer ts.Close()
++	req, _ := NewRequest("GET", ts.URL, nil)
++	req.Host = "go.dev\r\nX-Evil:evil"
++	resp, _ := ts.Client().Do(req)
++	if resp != nil {
++		resp.Body.Close()
++	}
++}
+--
+2.25.1
-- 
2.25.1


