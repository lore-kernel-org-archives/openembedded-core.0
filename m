Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48EF0ECAAA1
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 11:43:09 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.5423.1666870982678944482
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 04:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=J/UdN2sR;
 spf=pass (domain: mvista.com, ip: 209.85.210.170, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f170.google.com with SMTP id i3so1197652pfc.11
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 04:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QI9Qo+o+om/xcIv9/HsfADoTYLN+zDdWLoyK2n2vOg0=;
        b=J/UdN2sRSIOTDerpXjnswGeCA2a+Zkva8zBG+GwCEIMZ163Dxs5KVDi7b1G0/EZXJ9
         /yhEzFq2dxoMxmtVtZsVxQ8mmfF8spR/K+HWvoEnonMH1isYSzRCD8LxxTaP6zAy9WBg
         xATfqi7+gPGlIonQyezeDUrNjMJPvRpud7vt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QI9Qo+o+om/xcIv9/HsfADoTYLN+zDdWLoyK2n2vOg0=;
        b=B1oDWsHTvUdbiTteS40iZgYWv+exX8kHYCEex1jwDjkJXTtTeL5JSpxcGfy++r81Uv
         FdB637ExTpZJ1BNXUhbvl0M7QAoAPB+9EMoU2nAykC2bUMNjlBiOGsmd00E7QEjvNESx
         1X362zTLEvgncodjrktUrsio490tEOWNaRMa10x7fFdhcIxCeP1XHl+ONufg5PRbdHN4
         2R2vM3EwmXBpfW1OtQ9Ljwh6DgoMraRQNjWeAIDdI92p8yJYhEYvSHKNNoRPPZ/njCNv
         rilH6DGh3YTFbPYG5EiiHEHfRH9r3LiomqcTctOYd0/dvEVRGXxLMGjdEeiN9ZJGMPNX
         syiA==
X-Gm-Message-State: ACrzQf3O9zuDBnopzfyb/9O7ComC8fBA55imquJsBjWx5Kx8/wq9l0ru
	M+gKCnvNe0hzHUAqSKOSsiqNlDQpsBFi6g==
X-Google-Smtp-Source: AMsMyM5YZuH/9weJmHmgzuR6UlcnHtA1UWhBIOZ/zZKt5Iaralt4ve/Oi2cIjvdkD1nOuCWL3gMVpg==
X-Received: by 2002:a63:87c7:0:b0:434:883:ea21 with SMTP id i190-20020a6387c7000000b004340883ea21mr43297520pge.152.1666870981584;
        Thu, 27 Oct 2022 04:43:01 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.254])
        by smtp.gmail.com with ESMTPSA id q5-20020a170902bd8500b00186c3af9644sm977664pls.273.2022.10.27.04.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 04:43:01 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Thu, 27 Oct 2022 17:12:53 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] golang: CVE-2022-2880 ReverseProxy should not forward unparseable query parameters
Date: Thu, 27 Oct 2022 17:12:51 +0530
Message-Id: <20221027114251.87191-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 11:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172189

Upstream-Status: Backport from https://github.com/golang/go/commit/9d2c73a9fd69e45876509bb3bdb2af99bf77da1e

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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


