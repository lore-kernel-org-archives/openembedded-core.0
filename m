Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE8BEDF035
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 04:59:42 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38643.1770872374736070173
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 20:59:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Bf4QhoCR;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8271; q=dns/txt;
  s=iport01; t=1770872374; x=1772081974;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WUQSXzkRn8VpgrGOY9XMKtBm090zSDIDLCVRAJk8IOE=;
  b=Bf4QhoCRsed4sZOjbLKYCyTSWcodleuWCyqCApJLqIiE0m6kEzONiww3
   i5o05JGDa5QxCu3DvjukdAtcrxzK0nD/YVvaEIaigfV8RrAybw6rLdh16
   I8l0jHiWCzaS2fMRYtxdSVAor9yUS2bg4Slq0Dfmtb7xcNxptbIfBmJzf
   9P8Vo7rDFrLmovZUexlbuWsJZbZYxroL0H0hBy/Dc8cQxQD3EUvk/uejt
   AVaUFpkf/YySGP3TfZ0jbX/QqJoh0++4lhZuPhQh50C5T0JnNpELf5Khy
   1UA6Gu0KtW0rmkWK9Eunt5cUU7DTPjJDRRu8jXtjAcv9xW9PdAaMaNLDn
   w==;
X-CSE-ConnectionGUID: jqshLIhPTomLuJEn8Fp2Cw==
X-CSE-MsgGUID: WKk2k7K8RaO63bSBD/uwfg==
X-IPAS-Result: =?us-ascii?q?A0DrAwAcXY1p/4r/Ja1aglmCSA9xX0JJlCqCIZ4dgX8PA?=
 =?us-ascii?q?QEBDz0UBAEBkiYCJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBOAFyAwECWiMhgwIBgnMCARGoT4IsgQGCZnwBBQJDT9smA?=
 =?us-ascii?q?QsUAYE4hTuIGFsYAYNZgR8nGxuBcoR9gQWBXAEBgS0LhmwEgiKBDoFkNolOi?=
 =?us-ascii?q?AZIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQsbBwWIFQ+JD3hwgSByA?=
 =?us-ascii?q?wsYDUgRLDcUGwQ+bgeOS0GBZkwBLSYHIRMBCiABIFsKFngBGJMRFBMRkAqCI?=
 =?us-ascii?q?Z9QgT4KKIN0jB6VOhozhVulEAuYe44JlgBQhGiBaDw5gQ4LB3AVO4JnCUkZD?=
 =?us-ascii?q?444g2mBf4IIvVsiNTwCBwsBAQMJkWuBfAEB?=
IronPort-Data: A9a23:wlN3WK+DpmVekCM48DuGDrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 WFODW6FOvffZzP8L4wlPorl9x9Vu5bTnNJrTQBuqylEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mryyHjEAX9gWAsaDtOs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k0JJYY3sd3OV1J8
 NgFCh0LPj6b3cmplefTpulE3qzPLeHxN48Z/3UlxjbDALN+GNbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZOE0n1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3FboSPIoDVGZoE9qqej
 l3l/D76XTJKDtW4l2GPyViAwfLQkyyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjFCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:J0Hai6vojJyuAf4BqMcDWQWK7skDY9V00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBEDjexLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowEJ30bFh4pgPW
 AKSdkaNOHN
X-Talos-CUID: 9a23:jXxcxGMeWEtU1+5DWjB89Go1GvgZdXj50VX9JR+WETxCV+jA
X-Talos-MUID: 9a23:r1y2AAsafE7dUzr4+82nuxJhbsQ3wPSUAWdTyp89keXDKDN+NGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,286,1763424000"; 
   d="scan'208";a="662047479"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Feb 2026 04:59:33 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 708DF180001C1
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 04:59:33 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 060A0CC12B5; Wed, 11 Feb 2026 20:59:33 -0800 (PST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [openembedded-core] [scarthgap] [PATCH 2/5] go 1.22.12: Fix CVE-2025-61726
Date: Wed, 11 Feb 2026 20:59:00 -0800
Message-ID: <20260212045921.4067482-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 04:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231006

From: Deepak Rathore <deeratho@cisco.com>

Upstream Repository: https://github.com/golang/go.git

Bug details: https://nvd.nist.gov/vuln/detail/CVE-2025-61726
Type: Security Fix
CVE: CVE-2025-61726
Score: 7.5
Patch: https://github.com/golang/go/commit/85c794ddce26

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index e9a1803252..46f6ef5d8f 100644
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
index 0000000000..ab053ff55c
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
-- 
2.35.6


