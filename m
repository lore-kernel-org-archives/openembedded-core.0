Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD27C43217
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 16:04:12 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.17573.1667750645926639926
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 08:04:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=cU2Df7AS;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so12373475pjc.3
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 08:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3s245h10/jc8nqBYl/qK3HY54rQhPrg6ICzvmaHzV8g=;
        b=cU2Df7ASSQ1WbnX0Ebm7X5Jh16/Oy/T/i7HOSeX26KcSP9F4wfXtxwV3otYuBaeIaB
         8GhwZ/xPeXGVpkI4cybuayc3NuknO7fzwbgBbukQmcA+tuBCiDnbVVFQpRjXPhXtiAnY
         YT1eu6NDIOsKC5qDi+jHhn/4A2oo79bkSm4SzM4ICOCK0VPKhxB1XNDX1tAEy8iQK+H+
         8yCZWCd8ZYg/ArlC8fqhylaIE0wjohUO415liSprwaP6sCBXpEk2BkxoVXsoDNjcity2
         MlKVOtdvDVPIoskP7eGbD8YH3JpkR4+oKLx/wwudYgD9DXoso/0TXbKSeHyt6pDzr4EY
         FdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3s245h10/jc8nqBYl/qK3HY54rQhPrg6ICzvmaHzV8g=;
        b=s4UjChnA0NnfaP7PNAtLH0aeFJNlOqzoFp7xPxAhmuv1HD0EWfZCLyyyqwe2hBQ4uE
         iUjJDNR9gI0qcpwvWVJj4Zc2I9AssjPDA/MPaztJ5B1qgL2q9W24MYUBBZ1RDi0XfnW4
         A2Gp+gVYzYu7V/14sjcyqdq20t70Shzj36P3hjzP6bOIochMJRuK73gRYBDXIzI03LjB
         ocGgpSUoGJdLHk65d1FmPGw5JHdGxos3VHq0ZswEv7Odlb/SVejirPegpXTz3XIv6Xo6
         /DA8txzXsOrclquOLtlyoTTpYwSRGJ1f3oALvkBXrHZWywI9nAXuj4e6pQHpZ5pHr9bW
         GO8w==
X-Gm-Message-State: ACrzQf0H+7Epmo1aDoPb6C3Q8Hxrg9RrveWI0uZzvZxbLSBg+ogjIDHr
	yAZFK1fnFHK7MuvjwR+G/2pOCnhGTk6VeR7j
X-Google-Smtp-Source: AMsMyM4CQqWUslMVm+KeVTb0FguM28bfGBAkZiL/SwC/BVSmCV4EYZQQ8TKNLejoEnuC25IADE4lVQ==
X-Received: by 2002:a17:90b:1bca:b0:213:c9ce:dad4 with SMTP id oa10-20020a17090b1bca00b00213c9cedad4mr41861737pjb.205.1667750644789;
        Sun, 06 Nov 2022 08:04:04 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s11-20020a170902ea0b00b0018700ba9090sm3294683plg.185.2022.11.06.08.04.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 08:04:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/8] golang: CVE-2022-2880 ReverseProxy should not forward unparseable query parameters
Date: Sun,  6 Nov 2022 06:03:46 -1000
Message-Id: <f977d712455411c091aeee04ea7096d9e8c5b563.1667750511.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667750511.git.steve@sakoman.com>
References: <cover.1667750511.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 16:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172807

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/golang/go/commit/9d2c73a9fd69e45876509bb3bdb2af99bf77da1e

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-2880.patch            | 164 ++++++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-2880.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 2e1d8240f6..3341beb159 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -41,6 +41,7 @@ SRC_URI += "\
     file://0002-CVE-2022-32190.patch \
     file://0003-CVE-2022-32190.patch \
     file://0004-CVE-2022-32190.patch \
+    file://CVE-2022-2880.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-2880.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-2880.patch
new file mode 100644
index 0000000000..8376dc45ba
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-2880.patch
@@ -0,0 +1,164 @@
+From 753e3f8da191c2ac400407d83c70f46900769417 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Thu, 27 Oct 2022 12:22:41 +0530
+Subject: [PATCH] CVE-2022-2880
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/9d2c73a9fd69e45876509bb3bdb2af99bf77da1e]
+CVE: CVE-2022-2880
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+net/http/httputil: avoid query parameter
+
+Query parameter smuggling occurs when a proxy's interpretation
+of query parameters differs from that of a downstream server.
+Change ReverseProxy to avoid forwarding ignored query parameters.
+
+Remove unparsable query parameters from the outbound request
+
+   * if req.Form != nil after calling ReverseProxy.Director; and
+   * before calling ReverseProxy.Rewrite.
+
+This change preserves the existing behavior of forwarding the
+raw query untouched if a Director hook does not parse the query
+by calling Request.ParseForm (possibly indirectly).
+---
+ src/net/http/httputil/reverseproxy.go      | 36 +++++++++++
+ src/net/http/httputil/reverseproxy_test.go | 74 ++++++++++++++++++++++
+ 2 files changed, 110 insertions(+)
+
+diff --git a/src/net/http/httputil/reverseproxy.go b/src/net/http/httputil/reverseproxy.go
+index 2072a5f..c6fb873 100644
+--- a/src/net/http/httputil/reverseproxy.go
++++ b/src/net/http/httputil/reverseproxy.go
+@@ -212,6 +212,9 @@ func (p *ReverseProxy) ServeHTTP(rw http.ResponseWriter, req *http.Request) {
+ 	}
+ 
+ 	p.Director(outreq)
++	if outreq.Form != nil {
++		outreq.URL.RawQuery = cleanQueryParams(outreq.URL.RawQuery)
++	}
+ 	outreq.Close = false
+ 
+ 	reqUpType := upgradeType(outreq.Header)
+@@ -561,3 +564,36 @@ func (c switchProtocolCopier) copyToBackend(errc chan<- error) {
+ 	_, err := io.Copy(c.backend, c.user)
+ 	errc <- err
+ }
++
++func cleanQueryParams(s string) string {
++	reencode := func(s string) string {
++		v, _ := url.ParseQuery(s)
++		return v.Encode()
++	}
++	for i := 0; i < len(s); {
++		switch s[i] {
++		case ';':
++			return reencode(s)
++		case '%':
++			if i+2 >= len(s) || !ishex(s[i+1]) || !ishex(s[i+2]) {
++				return reencode(s)
++			}
++			i += 3
++		default:
++			i++
++		}
++	}
++	return s
++}
++
++func ishex(c byte) bool {
++	switch {
++	case '0' <= c && c <= '9':
++		return true
++	case 'a' <= c && c <= 'f':
++		return true
++	case 'A' <= c && c <= 'F':
++		return true
++	}
++	return false
++}
+diff --git a/src/net/http/httputil/reverseproxy_test.go b/src/net/http/httputil/reverseproxy_test.go
+index 9a7223a..bc87a3b 100644
+--- a/src/net/http/httputil/reverseproxy_test.go
++++ b/src/net/http/httputil/reverseproxy_test.go
+@@ -1269,3 +1269,77 @@ func TestSingleJoinSlash(t *testing.T) {
+ 		}
+ 	}
+ }
++
++const (
++	testWantsCleanQuery = true
++	testWantsRawQuery   = false
++)
++
++func TestReverseProxyQueryParameterSmugglingDirectorDoesNotParseForm(t *testing.T) {
++	testReverseProxyQueryParameterSmuggling(t, testWantsRawQuery, func(u *url.URL) *ReverseProxy {
++		proxyHandler := NewSingleHostReverseProxy(u)
++		oldDirector := proxyHandler.Director
++		proxyHandler.Director = func(r *http.Request) {
++			oldDirector(r)
++		}
++		return proxyHandler
++	})
++}
++
++func TestReverseProxyQueryParameterSmugglingDirectorParsesForm(t *testing.T) {
++	testReverseProxyQueryParameterSmuggling(t, testWantsCleanQuery, func(u *url.URL) *ReverseProxy {
++		proxyHandler := NewSingleHostReverseProxy(u)
++		oldDirector := proxyHandler.Director
++		proxyHandler.Director = func(r *http.Request) {
++			// Parsing the form causes ReverseProxy to remove unparsable
++			// query parameters before forwarding.
++			r.FormValue("a")
++			oldDirector(r)
++		}
++		return proxyHandler
++	})
++}
++
++func testReverseProxyQueryParameterSmuggling(t *testing.T, wantCleanQuery bool, newProxy func(*url.URL) *ReverseProxy) {
++	const content = "response_content"
++	backend := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
++		w.Write([]byte(r.URL.RawQuery))
++	}))
++	defer backend.Close()
++	backendURL, err := url.Parse(backend.URL)
++	if err != nil {
++		t.Fatal(err)
++	}
++	proxyHandler := newProxy(backendURL)
++	frontend := httptest.NewServer(proxyHandler)
++	defer frontend.Close()
++
++	// Don't spam output with logs of queries containing semicolons.
++	backend.Config.ErrorLog = log.New(io.Discard, "", 0)
++	frontend.Config.ErrorLog = log.New(io.Discard, "", 0)
++
++	for _, test := range []struct {
++		rawQuery   string
++		cleanQuery string
++	}{{
++		rawQuery:   "a=1&a=2;b=3",
++		cleanQuery: "a=1",
++	}, {
++		rawQuery:   "a=1&a=%zz&b=3",
++		cleanQuery: "a=1&b=3",
++	}} {
++		res, err := frontend.Client().Get(frontend.URL + "?" + test.rawQuery)
++		if err != nil {
++			t.Fatalf("Get: %v", err)
++		}
++		defer res.Body.Close()
++		body, _ := io.ReadAll(res.Body)
++		wantQuery := test.rawQuery
++		if wantCleanQuery {
++			wantQuery = test.cleanQuery
++		}
++		if got, want := string(body), wantQuery; got != want {
++			t.Errorf("proxy forwarded raw query %q as %q, want %q", test.rawQuery, got, want)
++		}
++	}
++}
+-- 
+2.25.1
+
-- 
2.25.1


