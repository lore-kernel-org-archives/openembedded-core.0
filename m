Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C88C352A1
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:55:43 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.92031.1669557338739231194
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:55:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=KCXMFUuN;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id r18so7689942pgr.12
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KeVbzxVqjw6hVvKLEMOi9vlKikDfKRS1VYjdT+3CJ08=;
        b=KCXMFUuNigy0DZVhH6GNDqfJnCCtDk7xgccKdoA4uU1YddfEpQKXHEt7EdhURBOmXs
         CsSOOfkMlRDOQN4L35SRLvZg4WcIDuOahSykMAu5sq034rppFDzVsUGC4A/NXj66qpl+
         X3wjW7R3fKgGZsalpdzf7eSzt7uW1GeGzMmJ7bndh2EMvQyW0zZk8fukTkD/n7SKcgGM
         ZAXvYm+lv5qiPJuMVOtNkAuoA/gvDRYPBBpVIGzshPFvTGzdIETFB76SH3/0D2VD0LUM
         6k8ZS22TDJ9vVrClimOrb4WyWe1DeE++Y9gOTcodIyXPP5vENkdit+jHdhyvfxZoPEul
         152Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeVbzxVqjw6hVvKLEMOi9vlKikDfKRS1VYjdT+3CJ08=;
        b=UhQODnrSJUz8KB6XJKbcL8jV2SKztIPjCflWCDtSPk0bjBAPWAT9BFkKjyXi7rGS5g
         4l4QNNZF1ueip71UWceYJx3RQplmayPemOpRslnop9/GnZFh9Hhyg2ZdFG3FTnvTdj8u
         uiXI/Pp41LKU2Tvuz6fdvCFHUc7twL4ZkU6qBeIhNEqbgIZwfTbwct9tIzXySZh3hZVf
         Yp1NDfudIFbl4ZWWGldV4yP8UCKWq3crqLfPDH5OlWnIkWZMplTLKC8RcEt/WKrk+emy
         dsvmAlXWaHBCBM69kWOV69c9WBSnO8MQ+gKI8HLsZHRJ5E7j1d1MCBlBdXdAM91/UzNX
         t1EA==
X-Gm-Message-State: ANoB5pn8UVaWHa4vH409k0Aats9+6zy4Kfj07T7pTyy0HfaOBfE8N755
	mLUVzHJMJC7K3D8HM3dOOyeAw8dKaiTOeacpysA=
X-Google-Smtp-Source: AA0mqf6Flj1ng7n7OaDKhxaRaFdbyM+vc9jX7KlQ1b8gqmzg4Lv2izN7wzEbflKs5ME8/WigjjukEA==
X-Received: by 2002:a62:542:0:b0:56c:45db:4481 with SMTP id 63-20020a620542000000b0056c45db4481mr48493375pff.86.1669557341489;
        Sun, 27 Nov 2022 05:55:41 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.55.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:55:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/31] go: fix CVE-2022-2880
Date: Sun, 27 Nov 2022 03:54:52 -1000
Message-Id: <a38f8316fdd0c9fc6fc7af195973028370935ba3.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173851

From: Sakib Sajal <sakib.sajal@windriver.com>

Backport patch to fix CVE-2022-2880.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 ...util-avoid-query-parameter-smuggling.patch | 178 ++++++++++++++++++
 2 files changed, 179 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/0001-net-http-httputil-avoid-query-parameter-smuggling.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index b18de66f42..9c467d63b2 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -17,6 +17,7 @@ SRC_URI += "\
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://CVE-2022-27664.patch \
+    file://0001-net-http-httputil-avoid-query-parameter-smuggling.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/0001-net-http-httputil-avoid-query-parameter-smuggling.patch b/meta/recipes-devtools/go/go-1.18/0001-net-http-httputil-avoid-query-parameter-smuggling.patch
new file mode 100644
index 0000000000..80fba1446e
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/0001-net-http-httputil-avoid-query-parameter-smuggling.patch
@@ -0,0 +1,178 @@
+From c8bdf59453c95528a444a85e1b206c1c09eb20f6 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Thu, 22 Sep 2022 13:32:00 -0700
+Subject: [PATCH] net/http/httputil: avoid query parameter smuggling
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
+
+Fixes #55842
+For #54663
+For CVE-2022-2880
+
+Change-Id: If1621f6b0e73a49d79059dae9e6b256e0ff18ca9
+Reviewed-on: https://go-review.googlesource.com/c/go/+/432976
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+Reviewed-by: Brad Fitzpatrick <bradfitz@golang.org>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Run-TryBot: Damien Neil <dneil@google.com>
+(cherry picked from commit 7c84234142149bd24a4096c6cab691d3593f3431)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/433695
+Reviewed-by: Dmitri Shuralyov <dmitshur@golang.org>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+
+CVE: CVE-2022-2880
+Upstream-Status: Backport [9d2c73a9fd69e45876509bb3bdb2af99bf77da1e]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/net/http/httputil/reverseproxy.go      | 36 +++++++++++
+ src/net/http/httputil/reverseproxy_test.go | 74 ++++++++++++++++++++++
+ 2 files changed, 110 insertions(+)
+
+diff --git a/src/net/http/httputil/reverseproxy.go b/src/net/http/httputil/reverseproxy.go
+index 8b63368..c76eec6 100644
+--- a/src/net/http/httputil/reverseproxy.go
++++ b/src/net/http/httputil/reverseproxy.go
+@@ -249,6 +249,9 @@ func (p *ReverseProxy) ServeHTTP(rw http.ResponseWriter, req *http.Request) {
+ 	}
+ 
+ 	p.Director(outreq)
++	if outreq.Form != nil {
++		outreq.URL.RawQuery = cleanQueryParams(outreq.URL.RawQuery)
++	}
+ 	outreq.Close = false
+ 
+ 	reqUpType := upgradeType(outreq.Header)
+@@ -628,3 +631,36 @@ func (c switchProtocolCopier) copyToBackend(errc chan<- error) {
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
+index 4b6ad77..8c0a4f1 100644
+--- a/src/net/http/httputil/reverseproxy_test.go
++++ b/src/net/http/httputil/reverseproxy_test.go
+@@ -1517,3 +1517,77 @@ func TestJoinURLPath(t *testing.T) {
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
+2.32.0
+
-- 
2.25.1


