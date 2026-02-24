Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9208E9B27E
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:12 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21676.1771943585693108773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Q5Ntbk+w;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso49027915e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943584; x=1772548384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctX/uba/w5V5bd43EGyKRU3UancUJEyNTbums186E0k=;
        b=Q5Ntbk+wkPE96aUSa150nWqmAjLDOcG0hlY1Z1Vlj23QXaQn7tuAcUy/MHd4UKpaNB
         c/e84gPGUb5cyyarF7vyx5h88A7ulkHOgmb2jawkG3K85hWzGkGmxzVFxNeX6/XhJi58
         efT5Z32CnBEVm66zKKaKpKOmDBjCba7cf1EpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943584; x=1772548384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ctX/uba/w5V5bd43EGyKRU3UancUJEyNTbums186E0k=;
        b=M0432RPQ2pGNlLxOUm+ZPFzWm48edD55WeacMDq/3AFKeAE/VBj8ZhsVIq1HlMpovY
         lNitMDxG1PxPvlQj72SB49PfiZn+3kLC1q0YTZawzPWpvRDfZLJQ4Dg80cPBJ4W5Iezk
         hZ6T1P09qkJTKFb5a7INYJVBcMz38yZNEknHvS+zvcqNaIU5Tm6C2HTiigK8kNFy+0vU
         T3+osE74AI8iq4lN0KgR1Iqsyy/6jiza7HpjBZ4p0AMG/YQ0pD8fiLDXTvhg0o9PCM0o
         AQSIWTzsynR/LduMZAgvhVPboy4USIxuwJl3qhVS/xTpIA3ICBvb+/25t86I0bkAXywq
         xxqw==
X-Gm-Message-State: AOJu0YxpKjU2qqGxkISQ3ZxT1kWW8uvdAT3FdLIkgwgIGKXBhPh2e0Wl
	Iz6B6s9hUapQj04yRp4LmLu3gen2Hdkrig4VdomQ+o7S7GMUUamMdUj+s3olf07CW7rQkOy0iEZ
	ftMoB
X-Gm-Gg: AZuq6aLpnXBs0x4irwxNJQM2PprXYKa3ilplxuQzGaR35amEHv1d546z0tgHWcN01DA
	fgeZrNghRLO6RNa0QKqPP9+RzrfNw+My4EdLwIeLbxKY8R3Wlj6ABW3lRQJpcajLNfGe9pVHf++
	xncXCyNgtYMmz2IId8R/SexKlvA4uit8cLo/a/XUbw7htfqWwjag2J/tUX5SY0Eq+YvzkABKPkd
	WhBQnub6wqJYvrNbp4rj0yrw5drvHkL+ambvWY5SipzdlRMmbPJ1kiir+Lyks+pIBbD5gmt5Y+J
	+3ERcr3fSDi0ds+hqQ3SSHhXAi58QqPTPYJ6Oa/ARFFATxES55yaZJj8MVi5MqPTVPPampXnzZy
	ZCyRvVGcPGa+XoqV535HUNv52BObJdLEJh/LGXREJJW8/wSTftnseLIajpIhKkF5+w7naR8hlH8
	eCI6oB+/4/ua0ulECAmzGVuDydT9UWvz3Y8xwkFEV+dOzKZEGgRlcouJqamu0yVAWNJh/S0LyBe
	QQ0bHwLC8SQSS1BvN6eLhX3/J73fQsP34+JhV84cur2
X-Received: by 2002:a05:600c:a49:b0:483:7631:befa with SMTP id 5b1f17b1804b1-483a95eb5e6mr235801755e9.5.1771943583676;
        Tue, 24 Feb 2026 06:33:03 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:03 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/44] go 1.22.12: Fix CVE-2025-61726
Date: Tue, 24 Feb 2026 15:31:49 +0100
Message-ID: <7949d623c3129bc81c13c0f1dd438cd69eeb48c7.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231828

From: Deepak Rathore <deeratho@cisco.com>

Upstream Repository: https://github.com/golang/go.git

Bug details: https://nvd.nist.gov/vuln/detail/CVE-2025-61726
Type: Security Fix
CVE: CVE-2025-61726
Score: 7.5
Patch: https://github.com/golang/go/commit/85c794ddce26

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2025-61726.patch                | 196 ++++++++++++++++++
 2 files changed, 197 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61726.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index e9a1803252e..46f6ef5d8fe 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -32,6 +32,7 @@ SRC_URI += "\
     file://CVE-2025-61727.patch \
     file://CVE-2025-61729.patch \
     file://CVE-2025-61730.patch \
+    file://CVE-2025-61726.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-61726.patch b/meta/recipes-devtools/go/go/CVE-2025-61726.patch
new file mode 100644
index 00000000000..ab053ff55c9
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-61726.patch
@@ -0,0 +1,196 @@
+From 85050ca6146f3edb50ded0a352ab9edbd635effc Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Mon, 3 Nov 2025 14:28:47 -0800
+Subject: [PATCH] [release-branch.go1.24] net/url: add urlmaxqueryparams
+ GODEBUG to limit the number of query parameters
+
+net/url does not currently limit the number of query parameters parsed by
+url.ParseQuery or URL.Query.
+
+When parsing a application/x-www-form-urlencoded form,
+net/http.Request.ParseForm will parse up to 10 MB of query parameters.
+An input consisting of a large number of small, unique parameters can
+cause excessive memory consumption.
+
+We now limit the number of query parameters parsed to 10000 by default.
+The limit can be adjusted by setting GODEBUG=urlmaxqueryparams=<n>.
+Setting urlmaxqueryparams to 0 disables the limit.
+
+Thanks to jub0bs for reporting this issue.
+
+Fixes #77101
+Fixes CVE-2025-61726
+
+CVE: CVE-2025-61726
+Upstream-Status: Backport [https://github.com/golang/go/commit/85c794ddce26]
+
+Change-Id: Iee3374c7ee2d8586dbf158536d3ade424203ff66
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3020
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3326
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/736702
+Auto-Submit: Michael Pratt <mpratt@google.com>
+Reviewed-by: Junyang Shao <shaojunyang@google.com>
+TryBot-Bypass: Michael Pratt <mpratt@google.com>
+(cherry picked from commit 85c794ddce26a092b0ea68d0fca79028b5069d5a)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ doc/godebug.md                 |  7 +++++
+ src/internal/godebugs/table.go |  1 +
+ src/net/url/url.go             | 24 +++++++++++++++++
+ src/net/url/url_test.go        | 48 ++++++++++++++++++++++++++++++++++
+ src/runtime/metrics/doc.go     |  5 ++++
+ 5 files changed, 85 insertions(+)
+
+diff --git a/doc/godebug.md b/doc/godebug.md
+index ae4f0576b4..635597ea42 100644
+--- a/doc/godebug.md
++++ b/doc/godebug.md
+@@ -126,6 +126,13 @@ for example,
+ see the [runtime documentation](/pkg/runtime#hdr-Environment_Variables)
+ and the [go command documentation](/cmd/go#hdr-Build_and_test_caching).
+
++Go 1.26 added a new `urlmaxqueryparams` setting that controls the maximum number
++of query parameters that net/url will accept when parsing a URL-encoded query string.
++If the number of parameters exceeds the number set in `urlmaxqueryparams`,
++parsing will fail early. The default value is `urlmaxqueryparams=10000`.
++Setting `urlmaxqueryparams=0`bles the limit. To avoid denial of service attacks,
++this setting and default was backported to Go 1.25.4 and Go 1.24.10.
++
+ Go 1.23.11 disabled build information stamping when multiple VCS are detected due
+ to concerns around VCS injection attacks. This behavior can be renabled with the
+ setting `allowmultiplevcs=1`.
+diff --git a/src/internal/godebugs/table.go b/src/internal/godebugs/table.go
+index 33dcd81fc3..4ae043053c 100644
+--- a/src/internal/godebugs/table.go
++++ b/src/internal/godebugs/table.go
+@@ -52,6 +52,7 @@ var All = []Info{
+	{Name: "tlsrsakex", Package: "crypto/tls", Changed: 22, Old: "1"},
+	{Name: "tlsunsafeekm", Package: "crypto/tls", Changed: 22, Old: "1"},
+	{Name: "x509sha1", Package: "crypto/x509"},
++	{Name: "urlmaxqueryparams", Package: "net/url", Changed: 24, Old: "0"},
+	{Name: "x509usefallbackroots", Package: "crypto/x509"},
+	{Name: "x509usepolicies", Package: "crypto/x509"},
+	{Name: "zipinsecurepath", Package: "archive/zip"},
+diff --git a/src/net/url/url.go b/src/net/url/url.go
+index d2ae03232f..5219e3c130 100644
+--- a/src/net/url/url.go
++++ b/src/net/url/url.go
+@@ -13,6 +13,7 @@ package url
+ import (
+	"errors"
+	"fmt"
++	"internal/godebug"
+	"net/netip"
+	"path"
+	"sort"
+@@ -958,7 +959,30 @@ func ParseQuery(query string) (Values, error) {
+	return m, err
+ }
+
++var urlmaxqueryparams = godebug.New("urlmaxqueryparams")
++
++const defaultMaxParams = 10000
++
++func urlParamsWithinMax(params int) bool {
++	withinDefaultMax := params <= defaultMaxParams
++	if urlmaxqueryparams.Value() == "" {
++		return withinDefaultMax
++	}
++	customMax, err := strconv.Atoi(urlmaxqueryparams.Value())
++	if err != nil {
++		return withinDefaultMax
++	}
++	withinCustomMax := customMax == 0 || params < customMax
++	if withinDefaultMax != withinCustomMax {
++		urlmaxqueryparams.IncNonDefault()
++	}
++	return withinCustomMax
++}
++
+ func parseQuery(m Values, query string) (err error) {
++	if !urlParamsWithinMax(strings.Count(query, "&") + 1) {
++		return errors.New("number of URL query parameters exceeded limit")
++	}
+	for query != "" {
+		var key string
+		key, query, _ = strings.Cut(query, "&")
+diff --git a/src/net/url/url_test.go b/src/net/url/url_test.go
+index fef236e40a..b2f8bd95fc 100644
+--- a/src/net/url/url_test.go
++++ b/src/net/url/url_test.go
+@@ -1488,6 +1488,54 @@ func TestParseQuery(t *testing.T) {
+	}
+ }
+
++func TestParseQueryLimits(t *testing.T) {
++	for _, test := range []struct {
++		params  int
++		godebug string
++		wantErr bool
++	}{{
++		params:  10,
++		wantErr: false,
++	}, {
++		params:  defaultMaxParams,
++		wantErr: false,
++	}, {
++		params:  defaultMaxParams + 1,
++		wantErr: true,
++	}, {
++		params:  10,
++		godebug: "urlmaxqueryparams=9",
++		wantErr: true,
++	}, {
++		params:  defaultMaxParams + 1,
++		godebug: "urlmaxqueryparams=0",
++		wantErr: false,
++	}} {
++		t.Setenv("GODEBUG", test.godebug)
++		want := Values{}
++		var b strings.Builder
++		for i := range test.params {
++			if i > 0 {
++				b.WriteString("&")
++			}
++			p := fmt.Sprintf("p%v", i)
++			b.WriteString(p)
++			want[p] = []string{""}
++		}
++		query := b.String()
++		got, err := ParseQuery(query)
++		if gotErr, wantErr := err != nil, test.wantErr; gotErr != wantErr {
++			t.Errorf("GODEBUG=%v ParseQuery(%v params) = %v, want error: %v", test.godebug, test.params, err, wantErr)
++		}
++		if err != nil {
++			continue
++		}
++		if got, want := len(got), test.params; got != want {
++			t.Errorf("GODEBUG=%v ParseQuery(%v params): got %v params, want %v", test.godebug, test.params, got, want)
++		}
++	}
++}
++
+ type RequestURITest struct {
+	url *URL
+	out string
+diff --git a/src/runtime/metrics/doc.go b/src/runtime/metrics/doc.go
+index 517ec0e0a4..335f7873b3 100644
+--- a/src/runtime/metrics/doc.go
++++ b/src/runtime/metrics/doc.go
+@@ -328,6 +328,11 @@ Below is the full list of supported metrics, ordered lexicographically.
+		The number of non-default behaviors executed by the crypto/tls
+		package due to a non-default GODEBUG=tlsunsafeekm=... setting.
+
++	/godebug/non-default-behavior/urlmaxqueryparams:events
++		The number of non-default behaviors executed by the net/url
++		package due to a non-default GODEBUG=urlmaxqueryparams=...
++		setting.
++
+	/godebug/non-default-behavior/x509sha1:events
+		The number of non-default behaviors executed by the crypto/x509
+		package due to a non-default GODEBUG=x509sha1=... setting.
+--
+2.35.6

