Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A812BC4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 08:13:38 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.5702.1667895211195537611
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 00:13:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=EWQ3hf8P;
 spf=pass (domain: mvista.com, ip: 209.85.210.174, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f174.google.com with SMTP id i3so13116638pfc.11
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 00:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rbXSRunvdRCUUv0nlPWRLUVnGAvXDjFJJ2ktwSNtUDo=;
        b=EWQ3hf8PzdI9JQ7106pA4ziaeCCCntWYjXJdBoMUfHn9jCxFQp2QeTpkiz7wl6l1Zz
         ZWeOOKRRwMUu/Q42Ym13QyG2bNaQh+cuqP3h7lCUcOVMK92pU+Row35BDzFGacMnoD3p
         RaiTSJbn771eG6xivwMfIq40ehfgDeRAoyFTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbXSRunvdRCUUv0nlPWRLUVnGAvXDjFJJ2ktwSNtUDo=;
        b=1TtGOq69skI4U3BTM89cKcWdA4FUbB/kaiJMtZmlVtIBrLcpTRfl4MRofT6NyIT23f
         10t5H3pwNbuup0/HsuGGSi8gLheOCr1Q5xtHzuplqQMh7bUJWTI4NBbB52kTF48zXdZt
         G6q4UxNftT7ekDbsAJoxW3Am1+A+Z/PzHwLl2gY0sPNBeVjPByeGoNvX54ofeoCDIrqN
         fF3goKNfW2UVGPm9fzPYAo0KlVEJMYnXw+z3Ax/7HJxCK23yeLRmAItaI4c0kD2Cr7nh
         ow+/5e2ZNq3I4vDP6fSyKptiinXYgwNAJ9EUb+JFKkUr5eHXrcio8LmZTxD3M07y9943
         KIaw==
X-Gm-Message-State: ACrzQf2WVP+gH6LArbZu0r4dKvsX6f7itFYSRZGkckBVTY1zEVfvDwM3
	yMFNT4Hso78KA+gaa8EA/xjWicZUT0upYw==
X-Google-Smtp-Source: AMsMyM4uMfZhEMCtEmdmIRFx0lmzcqkZ58rABQkT74rRHiPftlkpLfOZZMpjSNJYCETiNh7/GMiM/Q==
X-Received: by 2002:a63:fb01:0:b0:440:6e9b:1e86 with SMTP id o1-20020a63fb01000000b004406e9b1e86mr45745778pgh.26.1667895210232;
        Tue, 08 Nov 2022 00:13:30 -0800 (PST)
Received: from MVIN00024 ([43.249.234.214])
        by smtp.gmail.com with ESMTPSA id u14-20020a170902e5ce00b00186c5e8a8d7sm6287204plf.171.2022.11.08.00.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 00:13:29 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Tue, 08 Nov 2022 13:43:23 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] golang: CVE-2022-2880 ReverseProxy should not forward  unparseable query parameters
Date: Tue,  8 Nov 2022 13:43:23 +0530
Message-Id: <20221108081323.89901-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 08:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172952

Upstream-Status: Backport from https://github.com/golang/go/commit/9d2c73a9fd69e45876509bb3bdb2af99bf77da1e

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2022-2880.patch            | 164 ++++++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-2880.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index b9129e3d75..8230cf2187 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -18,6 +18,7 @@ SRC_URI += "\
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://CVE-2022-27664.patch \
     file://CVE-2022-41715.patch \
+    file://CVE-2022-2880.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2022-2880.patch b/meta/recipes-devtools/go/go-1.18/CVE-2022-2880.patch
new file mode 100644
index 0000000000..ef274a8543
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2022-2880.patch
@@ -0,0 +1,164 @@
+From f91f888dd6f10e3c776d4a6b8b776241cca67a9e Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Tue, 8 Nov 2022 10:35:06 +0530
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
+2.25.1
+
-- 
2.25.1


