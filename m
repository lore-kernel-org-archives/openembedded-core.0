Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD2BC001E0
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 21:18:59 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.93766.1691961537427160165
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 14:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=R7lIC3jW;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso2836665a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 14:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691961536; x=1692566336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxE1b5ft6mxqgqoiOQHLY5LwCkR+DWiCFO3p23KXVNY=;
        b=R7lIC3jWhbG4Yay87vB8z7GLpDS50IqZdmutnONJIN+1lVOe8uKc3WjsqcbrDXcREv
         cc392cso5/el0A5COd6l+nkjLyRvz0E9DfzOrj5mNqW9sRwnUgUd2L5lNrhuo+TyDYdj
         bsNTGYzNu2WvkFP3D1rw03GNox4MEG3FklHmd/k2NNIKIEV5TIqkOuoF9WweqV17TtQS
         2JhImTR9GYz6yh5k4SEGqS9BQtbpOja1qCxoUgPkCQ/NeiO0rQkSUGYfrdzLjSX+vfQo
         ZYuCuJSpH3GprbaATUrjqJLzHQ6o8/CmI8FGnNDVoNtv4bP8e0QId02+w1+eGRMC50VG
         v8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691961536; x=1692566336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxE1b5ft6mxqgqoiOQHLY5LwCkR+DWiCFO3p23KXVNY=;
        b=KjLhNISanpy5f29FcTmi0S4OZdzo/DOIJvDCRLi50MKoFZpj0zUv7zHV0K2oJSZdOD
         /GaFHQ/BQeHawsExr2IspRgwWvIMwnPGvToYIKfQu/V4EyCdx7hXrv/oZ40D2cDolGvA
         dqKbjK7xSn+tlcRIAoP7UWFyMzVCzQERKih22cfYPlir93DlBc6cyr0NB4ykFeNuuuBv
         AMY+T3M7wHNEw0XwU0b9RXLgHAm9pR+ZdQrkoLJccuLj8hvfl8yetc8Z0ne66vyULh3D
         Piz75qph96keTncoeB9DhTFWDb4mP+ai59v3c+0IzAT32nkytOw6flSuo+aI5CTcc3Xc
         d/4w==
X-Gm-Message-State: AOJu0YyfmVIuTW7gPVAwyTeUQATGhDdk4n59uMYV6OxSASrB2QqfKnty
	jxy8GlqtXfrAIBrJ+T/78AoloBzykiA/ImB7oDvLQQ==
X-Google-Smtp-Source: AGHT+IEjiXVXQRnBTUtzkJy9C9pHIVnuuE4ywvMf0Cvaai/CoNsTo3qZaLw7q/IIJgkmoyYbGQxDLA==
X-Received: by 2002:a17:90a:ee91:b0:262:e84f:ad80 with SMTP id i17-20020a17090aee9100b00262e84fad80mr7137513pjz.9.1691961536294;
        Sun, 13 Aug 2023 14:18:56 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id qa2-20020a17090b4fc200b00263dfe9b972sm8690578pjb.0.2023.08.13.14.18.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 14:18:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/22] go: fix CVE-2023-29406 net/http: insufficient sanitization of Host header
Date: Sun, 13 Aug 2023 11:18:10 -1000
Message-Id: <07e03175de91739064ae5530b3df093b4d05510b.1691961051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691961051.git.steve@sakoman.com>
References: <cover.1691961051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185895

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


