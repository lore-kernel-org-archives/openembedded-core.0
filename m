Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D865DC0015E
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 04:37:57 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.4338.1690346271618475991
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 21:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KSacOpn6;
 spf=pass (domain: mvista.com, ip: 209.85.215.181, mailfrom: vkumbhar@mvista.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-563dae89bc9so537213a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 21:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1690346270; x=1690951070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fzF0CCLOCNA3wfobGNpdoi2sQ9rRYZvcuWw/aZbmBSo=;
        b=KSacOpn6d/ml0NrJF92gkZ3b++maNKB/rrHGEqfuN/TSjDexSuSR8xg4pG0OnAW/b2
         ZHL5H1O8HBQ4HjAK1YcAH+L+tqmXZpEn8sj4Q33BTZSwHzTzp1Ltwgo1TRFnkwBQUs5M
         FiJsCOfNBWsXfvWw7wkqHOolu0r9icq4s6afo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690346270; x=1690951070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fzF0CCLOCNA3wfobGNpdoi2sQ9rRYZvcuWw/aZbmBSo=;
        b=J7fk3rzzq4q51GZYWEC51TWwBPjWLfbY9lszzUF8SjcyIlUohbo6eOQyaP98+8nvHU
         P5+0OmynqJmP6YYGd2Yw5UFGmsYn+DQVFoIR3Fpkb1eikF/zYH7iD3Jyx88iIGBTIDSm
         Ar2vjuPGXM7gLwNqcgF18lrqtBXSu9yw0+SRf9sPiasG/0UcByCskcSlgm814kDudI3l
         emqEiUQwVaifKC6VPSgH6bNTTDFGiu3hQ939Cwt3lEoJqJ7kudmdNkfKJcIxuhB3YDUm
         t0x5SZOJa0mVhTdo/7yQB7k1jtZ8I8QQSIrte1PFpGEumioxj0Jku6mLw1Jk5v3Ia6jt
         H7Mg==
X-Gm-Message-State: ABy/qLaFjJzT8xnwA3OmVjmsRD8oehwGkghNEo29X0GOAOZ9tVdeafFo
	TMWpLHo1RXW84688D/5+deGtA370EFz5FBOws+Y=
X-Google-Smtp-Source: APBJJlHZMELLwh4sgSv3kiHlmFz1jPC1neP0tNl0/lqidug04DWMYMw5dBsndIgeSJ5aMViLmtRJPg==
X-Received: by 2002:a05:6a20:2450:b0:126:81e0:49dd with SMTP id t16-20020a056a20245000b0012681e049ddmr848922pzc.14.1690346270241;
        Tue, 25 Jul 2023 21:37:50 -0700 (PDT)
Received: from vkumbhar-Latitude-3400.mvista.com ([115.96.166.134])
        by smtp.googlemail.com with ESMTPSA id d6-20020a170902cec600b001aadd0d7364sm11918530plg.83.2023.07.25.21.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 21:37:49 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH] go: fix CVE-2023-29406 net/http insufficient sanitization of Host header
Date: Wed, 26 Jul 2023 10:07:33 +0530
Message-Id: <20230726043733.1979925-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 04:37:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184856

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
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
2.25.1


