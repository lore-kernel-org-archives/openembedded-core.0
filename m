Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FDBC04A94
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:11 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.77621.1690740068079635682
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=EzLPFse3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-686efb9ee0cso3782918b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740067; x=1691344867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXrqV95FynYyNUuBjDCk+Vd0h9fdWbdnFK8aliU4CJQ=;
        b=EzLPFse3sBv8f7lIeSWqqTUpl1/W4bfpbpTuIyeZ0yqKfrSCcpV/bSLnDDqyaPyXBy
         t/5ersWGYgUoUwvRaCcio4srjf0gXE8pkatoq0w2K60SsNk8cSCK5Iz/K4ynBefpS7ux
         NTR1i4yDqisO3k3gQAJo8d3GB6DVmuTI1NdSMr83pOkCcUdFC/HY0feFFUGRj//RnhGw
         UU+z79KVJjmVoCxCQfonMPD+EIpBIcQUzPdBmkYfphWhSNvzfynMvyqabKxXwQTgmF/O
         pqHF4B3/ASmyxKudc5WggC4Mk3veAd1X57VoKAikg+V7z1KD/ygG1S8HlnzjYYixFXj7
         qOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740067; x=1691344867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXrqV95FynYyNUuBjDCk+Vd0h9fdWbdnFK8aliU4CJQ=;
        b=LVonK3kDfdHJsiS1nFB4X3lfXGg3RvzIl3DpR6KqmSs+U4czNtp7L52psOuJK2E0is
         w2mCrt0QA1jFuIigI4T2wSYEe0FxWiWHrZyCcuoQvPpJgXvhtAxaU657rW7P+kFe+yu+
         eObzGFFD5JLLumAjJsQYLn1v/RPBouxwtkdpRC/eEC0Za6Ge5o10KGVE3pNTFzSwE1J4
         OKtmutLMlpxTYasiL0EjsKlIbiRMQEn8tQ0uxBvqTaYvlvgTgO0uEMb++YrvopOBccfW
         +cm+PNLw0kvHszTCkU12T04gpVOP0gNhOhqN5rOdaX2Tsxc7ydwPu4gpDtWWjqfKlhbY
         3V1Q==
X-Gm-Message-State: ABy/qLbLq+/L2HjnJDIj51/JfdqZIaP4nEBwtshSqUkb51CW86MISTzq
	9udc9C/a2CamQbrxee1d9Xk1Eko7JT+8W0vcqxZRGQ==
X-Google-Smtp-Source: APBJJlFpctNTArpeASzrJWDp8R7lMUMRl80vq3IQ4IakjT6VB9UsqzsW1JFd4xXapYnxOcepJwKLig==
X-Received: by 2002:a05:6a21:488b:b0:134:7364:a59f with SMTP id av11-20020a056a21488b00b001347364a59fmr8676039pzc.29.1690740066986;
        Sun, 30 Jul 2023 11:01:06 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/30] go: fix CVE-2023-29406 net/http insufficient sanitization of Host header
Date: Sun, 30 Jul 2023 08:00:27 -1000
Message-Id: <5dc74138649ab7a2c0158a43225dc7a8fd732355.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185082

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2023-29406.patch           | 210 ++++++++++++++++++
 2 files changed, 211 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-29406.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 73921852fc..36904a92fb 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -36,6 +36,7 @@ SRC_URI += "\
     file://CVE-2023-29405.patch \
     file://CVE-2023-29402.patch \
     file://CVE-2023-29400.patch \
+    file://CVE-2023-29406.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2023-29406.patch b/meta/recipes-devtools/go/go-1.18/CVE-2023-29406.patch
new file mode 100644
index 0000000000..a326cda5c4
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2023-29406.patch
@@ -0,0 +1,210 @@
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
+ src/net/http/http_test.go      | 29 ----------------------
+ src/net/http/request.go        | 45 ++++++++--------------------------
+ src/net/http/request_test.go   | 11 ++-------
+ src/net/http/transport_test.go | 18 ++++++++++++++
+ 4 files changed, 30 insertions(+), 73 deletions(-)
+
+diff --git a/src/net/http/http_test.go b/src/net/http/http_test.go
+index 0d92fe5..f03272a 100644
+--- a/src/net/http/http_test.go
++++ b/src/net/http/http_test.go
+@@ -48,35 +48,6 @@ func TestForeachHeaderElement(t *testing.T) {
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
+index 09cb0c7..2f4e740 100644
+--- a/src/net/http/request.go
++++ b/src/net/http/request.go
+@@ -17,7 +17,6 @@ import (
+	"io"
+	"mime"
+	"mime/multipart"
+-	"net"
+	"net/http/httptrace"
+	"net/http/internal/ascii"
+	"net/textproto"
+@@ -27,6 +26,7 @@ import (
+	"strings"
+	"sync"
+
++	"golang.org/x/net/http/httpguts"
+	"golang.org/x/net/idna"
+ )
+
+@@ -568,12 +568,19 @@ func (r *Request) write(w io.Writer, usingProxy bool, extraHeaders Header, waitF
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
+@@ -730,38 +737,6 @@ func idnaASCII(v string) (string, error) {
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
+index fac12b7..368e87a 100644
+--- a/src/net/http/request_test.go
++++ b/src/net/http/request_test.go
+@@ -776,15 +776,8 @@ func TestRequestBadHost(t *testing.T) {
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
+index eeaa492..58f12af 100644
+--- a/src/net/http/transport_test.go
++++ b/src/net/http/transport_test.go
+@@ -6512,3 +6512,21 @@ func TestCancelRequestWhenSharingConnection(t *testing.T) {
+	close(r2c)
+	wg.Wait()
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
2.34.1


