Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B49CC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 09:30:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.84106.1738575044484276595
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 01:30:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4129d0a024=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5137WkEY032153
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Feb 2025 01:30:44 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hm0ps7fa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 01:30:43 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 3 Feb 2025 01:30:42 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 3 Feb 2025 01:30:41 -0800
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe-core][kirkstone][PATCH  1/1] go: Fix CVE-2024-45336
Date: Mon, 3 Feb 2025 09:30:33 +0000
Message-ID: <20250203093033.3761527-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=PqlpbxM3 c=1 sm=1 tr=0 ts=67a08cc3 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=Oh2cFVv5AAAA:8 a=P5wrnlEIAAAA:8 a=mNYpJT6RAAAA:8 a=v282ZVBLAAAA:8
 a=HnMHPIp3AAAA:8 a=yEquWHxyAAAA:8 a=t7CeM3EgAAAA:8 a=1XWaLZrsAAAA:8 a=yhUri8FnAAAA:8 a=eAAL1In8AAAA:8 a=A1X0JdhQAAAA:8 a=k_6PGB_HSR7cqQjt8kYA:9 a=lqcHg5cX4UMA:10 a=BAWAvUwMd3MA:10 a=BLPxT5hpz88A:10 a=ig2czLnNA7cA:10 a=56YP0Ln_AIoA:10
 a=7KeoIwV6GZqOttXkcoxL:22 a=aoaxo0Z0h-rxbPFMW5aL:22 a=eybOJ6GWDyyBfQoUqdmp:22 a=712B9CL0bqNCnhJSNvkC:22 a=j7VXw0cNxiiRp7-5Gr1y:22 a=_j3XSMEICZ-j_p4bQif0:22 a=FdTzh2GWekK77mhwV6Dw:22 a=8nbOMqh3J4Vhtx036jbE:22
X-Proofpoint-ORIG-GUID: bh2CRq7Ou89xHSmKJzeqEgow-bviHwWC
X-Proofpoint-GUID: bh2CRq7Ou89xHSmKJzeqEgow-bviHwWC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502030075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 09:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210634

The HTTP client drops sensitive headers after following a cross-domain redirect.
For example, a request to a.com/ containing an Authorization header which is redirected to
b.com/ will not send that header to b.com. In the event that the client received a subsequent
same-domain redirect, however, the sensitive headers would be restored. For example, a chain
of redirects from a.com/, to b.com/1, and finally to b.com/2 would incorrectly send the
Authorization header to b.com/2.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-45336

Upstream-patch:
https://github.com/golang/go/commit/b72d56f98d6620ebe07626dca4bb67ea8e185379

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.21/CVE-2024-45336.patch           | 394 ++++++++++++++++++
 2 files changed, 395 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2024-45336.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index c483590931..34ad70572f 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -61,6 +61,7 @@ SRC_URI += "\
     file://CVE-2024-34155.patch \
     file://CVE-2024-34156.patch \
     file://CVE-2024-34158.patch \
+    file://CVE-2024-45336.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2024-45336.patch b/meta/recipes-devtools/go/go-1.21/CVE-2024-45336.patch
new file mode 100644
index 0000000000..3755bb1b57
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2024-45336.patch
@@ -0,0 +1,394 @@
+From b72d56f98d6620ebe07626dca4bb67ea8e185379 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Fri, 22 Nov 2024 12:34:11 -0800
+Subject: [PATCH] net/http: persist header stripping across repeated redirects
+
+When an HTTP redirect changes the host of a request, we drop
+sensitive headers such as Authorization from the redirected request.
+Fix a bug where a chain of redirects could result in sensitive
+headers being sent to the wrong host:
+
+  1. request to a.tld with Authorization header
+  2. a.tld redirects to b.tld
+  3. request to b.tld with no Authorization header
+  4. b.tld redirects to b.tld
+  3. request to b.tld with Authorization header restored
+
+Thanks to Kyle Seely for reporting this issue.
+
+Fixes #70530
+For #71210
+Fixes CVE-2024-45336
+
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/1641
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Commit-Queue: Roland Shoemaker <bracewell@google.com>
+Change-Id: Id7b1e3c90345566b8ee1a51f65dbb179da6eb427
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/1765
+Reviewed-on: https://go-review.googlesource.com/c/go/+/643106
+Reviewed-by: Michael Pratt <mpratt@google.com>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Auto-Submit: Michael Knyszek <mknyszek@google.com>
+
+CVE: CVE-2024-45336
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/b72d56f98d6620ebe07626dca4bb67ea8e185379]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ src/net/http/client.go                     | 65 +++++++-------
+ src/net/http/client_test.go                | 98 +++++++++++++++++-----
+ src/net/http/internal/testcert/testcert.go | 84 +++++++++----------
+ 3 files changed, 153 insertions(+), 94 deletions(-)
+
+diff --git a/src/net/http/client.go b/src/net/http/client.go
+index b2dd445..13b6152 100644
+--- a/src/net/http/client.go
++++ b/src/net/http/client.go
+@@ -615,8 +615,9 @@ func (c *Client) do(req *Request) (retres *Response, reterr error) {
+		reqBodyClosed = false // have we closed the current req.Body?
+
+		// Redirect behavior:
+-		redirectMethod string
+-		includeBody    bool
++		redirectMethod        string
++		includeBody           = true
++		stripSensitiveHeaders = false
+	)
+	uerr := func(err error) error {
+		// the body may have been closed already by c.send()
+@@ -681,7 +682,12 @@ func (c *Client) do(req *Request) (retres *Response, reterr error) {
+			// in case the user set Referer on their first request.
+			// If they really want to override, they can do it in
+			// their CheckRedirect func.
+-			copyHeaders(req)
++			if !stripSensitiveHeaders && reqs[0].URL.Host != req.URL.Host {
++				if !shouldCopyHeaderOnRedirect(reqs[0].URL, req.URL) {
++					stripSensitiveHeaders = true
++				}
++			}
++			copyHeaders(req, stripSensitiveHeaders)
+
+			// Add the Referer header from the most recent
+			// request URL to the new one, if it's not https->http:
+@@ -747,7 +753,7 @@ func (c *Client) do(req *Request) (retres *Response, reterr error) {
+ // makeHeadersCopier makes a function that copies headers from the
+ // initial Request, ireq. For every redirect, this function must be called
+ // so that it can copy headers into the upcoming Request.
+-func (c *Client) makeHeadersCopier(ireq *Request) func(*Request) {
++func (c *Client) makeHeadersCopier(ireq *Request) func(req *Request, stripSensitiveHeaders bool) {
+	// The headers to copy are from the very initial request.
+	// We use a closured callback to keep a reference to these original headers.
+	var (
+@@ -761,8 +767,7 @@ func (c *Client) makeHeadersCopier(ireq *Request) func(*Request) {
+		}
+	}
+
+-	preq := ireq // The previous request
+-	return func(req *Request) {
++	return func(req *Request, stripSensitiveHeaders bool) {
+		// If Jar is present and there was some initial cookies provided
+		// via the request header, then we may need to alter the initial
+		// cookies as we follow redirects since each redirect may end up
+@@ -799,12 +804,15 @@ func (c *Client) makeHeadersCopier(ireq *Request) func(*Request) {
+		// Copy the initial request's Header values
+		// (at least the safe ones).
+		for k, vv := range ireqhdr {
+-			if shouldCopyHeaderOnRedirect(k, preq.URL, req.URL) {
++			sensitive := false
++			switch CanonicalHeaderKey(k) {
++			case "Authorization", "Www-Authenticate", "Cookie", "Cookie2":
++				sensitive = true
++			}
++			if !(sensitive && stripSensitiveHeaders) {
+				req.Header[k] = vv
+			}
+		}
+-
+-		preq = req // Update previous Request with the current request
+	}
+ }
+
+@@ -983,28 +991,23 @@ func (b *cancelTimerBody) Close() error {
+	return err
+ }
+
+-func shouldCopyHeaderOnRedirect(headerKey string, initial, dest *url.URL) bool {
+-	switch CanonicalHeaderKey(headerKey) {
+-	case "Authorization", "Www-Authenticate", "Cookie", "Cookie2":
+-		// Permit sending auth/cookie headers from "foo.com"
+-		// to "sub.foo.com".
+-
+-		// Note that we don't send all cookies to subdomains
+-		// automatically. This function is only used for
+-		// Cookies set explicitly on the initial outgoing
+-		// client request. Cookies automatically added via the
+-		// CookieJar mechanism continue to follow each
+-		// cookie's scope as set by Set-Cookie. But for
+-		// outgoing requests with the Cookie header set
+-		// directly, we don't know their scope, so we assume
+-		// it's for *.domain.com.
+-
+-		ihost := canonicalAddr(initial)
+-		dhost := canonicalAddr(dest)
+-		return isDomainOrSubdomain(dhost, ihost)
+-	}
+-	// All other headers are copied:
+-	return true
++func shouldCopyHeaderOnRedirect(initial, dest *url.URL) bool {
++	// Permit sending auth/cookie headers from "foo.com"
++	// to "sub.foo.com".
++
++	// Note that we don't send all cookies to subdomains
++	// automatically. This function is only used for
++	// Cookies set explicitly on the initial outgoing
++	// client request. Cookies automatically added via the
++	// CookieJar mechanism continue to follow each
++	// cookie's scope as set by Set-Cookie. But for
++	// outgoing requests with the Cookie header set
++	// directly, we don't know their scope, so we assume
++	// it's for *.domain.com.
++
++	ihost := canonicalAddr(initial)
++	dhost := canonicalAddr(dest)
++	return isDomainOrSubdomain(dhost, ihost)
+ }
+
+ // isDomainOrSubdomain reports whether sub is a subdomain (or exact
+diff --git a/src/net/http/client_test.go b/src/net/http/client_test.go
+index 7a0aa53..8bf1808 100644
+--- a/src/net/http/client_test.go
++++ b/src/net/http/client_test.go
+@@ -1551,6 +1551,54 @@ func TestClientCopyHeadersOnRedirect(t *testing.T) {
+		t.Errorf("result = %q; want ok", got)
+	}
+ }
++// Issue #70530: Once we strip a header on a redirect to a different host,
++// the header should stay stripped across any further redirects.
++func TestClientStripHeadersOnRepeatedRedirect(t *testing.T) {
++       run(t, testClientStripHeadersOnRepeatedRedirect)
++}
++func testClientStripHeadersOnRepeatedRedirect(t *testing.T, mode testMode) {
++       var proto string
++       ts := newClientServerTest(t, mode, HandlerFunc(func(w ResponseWriter, r *Request) {
++               if r.Host+r.URL.Path != "a.example.com/" {
++                       if h := r.Header.Get("Authorization"); h != "" {
++                               t.Errorf("on request to %v%v, Authorization=%q, want no header", r.Host, r.URL.Path, h)
++                       }
++               }
++               // Follow a chain of redirects from a to b and back to a.
++               // The Authorization header is stripped on the first redirect to b,
++               // and stays stripped even if we're sent back to a.
++               switch r.Host + r.URL.Path {
++               case "a.example.com/":
++                       Redirect(w, r, proto+"://b.example.com/", StatusFound)
++               case "b.example.com/":
++                       Redirect(w, r, proto+"://b.example.com/redirect", StatusFound)
++               case "b.example.com/redirect":
++                       Redirect(w, r, proto+"://a.example.com/redirect", StatusFound)
++               case "a.example.com/redirect":
++                       w.Header().Set("X-Done", "true")
++               default:
++                       t.Errorf("unexpected request to %v", r.URL)
++               }
++       })).ts
++       proto, _, _ = strings.Cut(ts.URL, ":")
++
++       c := ts.Client()
++       c.Transport.(*Transport).Dial = func(_ string, _ string) (net.Conn, error) {
++               return net.Dial("tcp", ts.Listener.Addr().String())
++       }
++
++       req, _ := NewRequest("GET", proto+"://a.example.com/", nil)
++       req.Header.Add("Cookie", "foo=bar")
++       req.Header.Add("Authorization", "secretpassword")
++       res, err := c.Do(req)
++       if err != nil {
++               t.Fatal(err)
++       }
++       defer res.Body.Close()
++       if res.Header.Get("X-Done") != "true" {
++               t.Fatalf("response missing expected header: X-Done=true")
++       }
++}
+
+ // Issue 22233: copy host when Client follows a relative redirect.
+ func TestClientCopyHostOnRedirect(t *testing.T) {
+@@ -1716,31 +1764,39 @@ func TestClientAltersCookiesOnRedirect(t *testing.T) {
+ // Part of Issue 4800
+ func TestShouldCopyHeaderOnRedirect(t *testing.T) {
+	tests := []struct {
+-		header     string
+		initialURL string
+		destURL    string
+		want       bool
+	}{
+-		{"User-Agent", "http://foo.com/", "http://bar.com/", true},
+-		{"X-Foo", "http://foo.com/", "http://bar.com/", true},
+-
+		// Sensitive headers:
+-		{"cookie", "http://foo.com/", "http://bar.com/", false},
+-		{"cookie2", "http://foo.com/", "http://bar.com/", false},
+-		{"authorization", "http://foo.com/", "http://bar.com/", false},
+-		{"www-authenticate", "http://foo.com/", "http://bar.com/", false},
+-		{"authorization", "http://foo.com/", "http://[::1%25.foo.com]/", false},
++               {"http://foo.com/", "http://bar.com/", false},
++               {"http://foo.com/", "http://bar.com/", false},
++               {"http://foo.com/", "http://bar.com/", false},
++               {"http://foo.com/", "https://foo.com/", true},
++               {"http://foo.com:1234/", "http://foo.com:4321/", true},
++               {"http://foo.com/", "http://bar.com/", false},
++               {"http://foo.com/", "http://[::1%25.foo.com]/", false},
+
+		// But subdomains should work:
+-		{"www-authenticate", "http://foo.com/", "http://foo.com/", true},
+-		{"www-authenticate", "http://foo.com/", "http://sub.foo.com/", true},
+-		{"www-authenticate", "http://foo.com/", "http://notfoo.com/", false},
+-		{"www-authenticate", "http://foo.com/", "https://foo.com/", false},
+-		{"www-authenticate", "http://foo.com:80/", "http://foo.com/", true},
+-		{"www-authenticate", "http://foo.com:80/", "http://sub.foo.com/", true},
+-		{"www-authenticate", "http://foo.com:443/", "https://foo.com/", true},
+-		{"www-authenticate", "http://foo.com:443/", "https://sub.foo.com/", true},
+-		{"www-authenticate", "http://foo.com:1234/", "http://foo.com/", false},
++               {"http://foo.com/", "http://foo.com/", true},
++               {"http://foo.com/", "http://sub.foo.com/", true},
++               {"http://foo.com/", "http://notfoo.com/", false},
++               {"http://foo.com/", "https://foo.com/", true},
++               {"http://foo.com:80/", "http://foo.com/", true},
++               {"http://foo.com:80/", "http://sub.foo.com/", true},
++               {"http://foo.com:443/", "https://foo.com/", true},
++               {"http://foo.com:443/", "https://sub.foo.com/", true},
++               {"http://foo.com:1234/", "http://foo.com/", true},
++
++               {"http://foo.com/", "http://foo.com/", true},
++               {"http://foo.com/", "http://sub.foo.com/", true},
++               {"http://foo.com/", "http://notfoo.com/", false},
++               {"http://foo.com/", "https://foo.com/", true},
++               {"http://foo.com:80/", "http://foo.com/", true},
++               {"http://foo.com:80/", "http://sub.foo.com/", true},
++               {"http://foo.com:443/", "https://foo.com/", true},
++               {"http://foo.com:443/", "https://sub.foo.com/", true},
++               {"http://foo.com:1234/", "http://foo.com/", true},
+	}
+	for i, tt := range tests {
+		u0, err := url.Parse(tt.initialURL)
+@@ -1753,10 +1809,10 @@ func TestShouldCopyHeaderOnRedirect(t *testing.T) {
+			t.Errorf("%d. dest URL %q parse error: %v", i, tt.destURL, err)
+			continue
+		}
+-		got := Export_shouldCopyHeaderOnRedirect(tt.header, u0, u1)
++		got := Export_shouldCopyHeaderOnRedirect(u0, u1)
+		if got != tt.want {
+-			t.Errorf("%d. shouldCopyHeaderOnRedirect(%q, %q => %q) = %v; want %v",
+-				i, tt.header, tt.initialURL, tt.destURL, got, tt.want)
++			t.Errorf("%d. shouldCopyHeaderOnRedirect(%q => %q) = %v; want %v",
++				i, tt.initialURL, tt.destURL, got, tt.want)
+		}
+	}
+ }
+diff --git a/src/net/http/internal/testcert/testcert.go b/src/net/http/internal/testcert/testcert.go
+index d510e79..78ce42e 100644
+--- a/src/net/http/internal/testcert/testcert.go
++++ b/src/net/http/internal/testcert/testcert.go
+@@ -10,56 +10,56 @@ import "strings"
+ // LocalhostCert is a PEM-encoded TLS cert with SAN IPs
+ // "127.0.0.1" and "[::1]", expiring at Jan 29 16:00:00 2084 GMT.
+ // generated from src/crypto/tls:
+-// go run generate_cert.go  --rsa-bits 2048 --host 127.0.0.1,::1,example.com --ca --start-date "Jan 1 00:00:00 1970" --duration=1000000h
++// go run generate_cert.go  --rsa-bits 2048 --host 127.0.0.1,::1,example.com,*.example.com --ca --start-date "Jan 1 00:00:00 1970" --duration=1000000h
+ var LocalhostCert = []byte(`-----BEGIN CERTIFICATE-----
+-MIIDOTCCAiGgAwIBAgIQSRJrEpBGFc7tNb1fb5pKFzANBgkqhkiG9w0BAQsFADAS
++MIIDSDCCAjCgAwIBAgIQEP/md970HysdBTpuzDOf0DANBgkqhkiG9w0BAQsFADAS
+ MRAwDgYDVQQKEwdBY21lIENvMCAXDTcwMDEwMTAwMDAwMFoYDzIwODQwMTI5MTYw
+ MDAwWjASMRAwDgYDVQQKEwdBY21lIENvMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
+-MIIBCgKCAQEA6Gba5tHV1dAKouAaXO3/ebDUU4rvwCUg/CNaJ2PT5xLD4N1Vcb8r
+-bFSW2HXKq+MPfVdwIKR/1DczEoAGf/JWQTW7EgzlXrCd3rlajEX2D73faWJekD0U
+-aUgz5vtrTXZ90BQL7WvRICd7FlEZ6FPOcPlumiyNmzUqtwGhO+9ad1W5BqJaRI6P
+-YfouNkwR6Na4TzSj5BrqUfP0FwDizKSJ0XXmh8g8G9mtwxOSN3Ru1QFc61Xyeluk
+-POGKBV/q6RBNklTNe0gI8usUMlYyoC7ytppNMW7X2vodAelSu25jgx2anj9fDVZu
+-h7AXF5+4nJS4AAt0n1lNY7nGSsdZas8PbQIDAQABo4GIMIGFMA4GA1UdDwEB/wQE
++MIIBCgKCAQEAxcl69ROJdxjN+MJZnbFrYxyQooADCsJ6VDkuMyNQIix/Hk15Nk/u
++FyBX1Me++aEpGmY3RIY4fUvELqT/srvAHsTXwVVSttMcY8pcAFmXSqo3x4MuUTG/
++jCX3Vftj0r3EM5M8ImY1rzA/jqTTLJg00rD+DmuDABcqQvoXw/RV8w1yTRi5BPoH
++DFD/AWTt/YgMvk1l2Yq/xI8VbMUIpjBoGXxWsSevQ5i2s1mk9/yZzu0Ysp1tTlzD
++qOPa4ysFjBitdXiwfxjxtv5nXqOCP5rheKO0sWLk0fetMp1OV5JSJMAJw6c2ZMkl
++U2WMqAEpRjdE/vHfIuNg+yGaRRqI07NZRQIDAQABo4GXMIGUMA4GA1UdDwEB/wQE
+ AwICpDATBgNVHSUEDDAKBggrBgEFBQcDATAPBgNVHRMBAf8EBTADAQH/MB0GA1Ud
+-DgQWBBStsdjh3/JCXXYlQryOrL4Sh7BW5TAuBgNVHREEJzAlggtleGFtcGxlLmNv
+-bYcEfwAAAYcQAAAAAAAAAAAAAAAAAAAAATANBgkqhkiG9w0BAQsFAAOCAQEAxWGI
+-5NhpF3nwwy/4yB4i/CwwSpLrWUa70NyhvprUBC50PxiXav1TeDzwzLx/o5HyNwsv
+-cxv3HdkLW59i/0SlJSrNnWdfZ19oTcS+6PtLoVyISgtyN6DpkKpdG1cOkW3Cy2P2
+-+tK/tKHRP1Y/Ra0RiDpOAmqn0gCOFGz8+lqDIor/T7MTpibL3IxqWfPrvfVRHL3B
+-grw/ZQTTIVjjh4JBSW3WyWgNo/ikC1lrVxzl4iPUGptxT36Cr7Zk2Bsg0XqwbOvK
+-5d+NTDREkSnUbie4GeutujmX3Dsx88UiV6UY/4lHJa6I5leHUNOHahRbpbWeOfs/
+-WkBKOclmOV2xlTVuPw==
++DgQWBBQR5QIzmacmw78ZI1C4MXw7Q0wJ1jA9BgNVHREENjA0ggtleGFtcGxlLmNv
++bYINKi5leGFtcGxlLmNvbYcEfwAAAYcQAAAAAAAAAAAAAAAAAAAAATANBgkqhkiG
++9w0BAQsFAAOCAQEACrRNgiioUDzxQftd0fwOa6iRRcPampZRDtuaF68yNHoNWbOu
++LUwc05eOWxRq3iABGSk2xg+FXM3DDeW4HhAhCFptq7jbVZ+4Jj6HeJG9mYRatAxR
++Y/dEpa0D0EHhDxxVg6UzKOXB355n0IetGE/aWvyTV9SiDs6QsaC57Q9qq1/mitx5
++2GFBoapol9L5FxCc77bztzK8CpLujkBi25Vk6GAFbl27opLfpyxkM+rX/T6MXCPO
++6/YBacNZ7ff1/57Etg4i5mNA6ubCpuc4Gi9oYqCNNohftr2lkJr7REdDR6OW0lsL
++rF7r4gUnKeC7mYIH1zypY7laskopiLFAfe96Kg==
+ -----END CERTIFICATE-----`)
+
+ // LocalhostKey is the private key for LocalhostCert.
+ var LocalhostKey = []byte(testingKey(`-----BEGIN RSA TESTING KEY-----
+-MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDoZtrm0dXV0Aqi
+-4Bpc7f95sNRTiu/AJSD8I1onY9PnEsPg3VVxvytsVJbYdcqr4w99V3AgpH/UNzMS
+-gAZ/8lZBNbsSDOVesJ3euVqMRfYPvd9pYl6QPRRpSDPm+2tNdn3QFAvta9EgJ3sW
+-URnoU85w+W6aLI2bNSq3AaE771p3VbkGolpEjo9h+i42TBHo1rhPNKPkGupR8/QX
+-AOLMpInRdeaHyDwb2a3DE5I3dG7VAVzrVfJ6W6Q84YoFX+rpEE2SVM17SAjy6xQy
+-VjKgLvK2mk0xbtfa+h0B6VK7bmODHZqeP18NVm6HsBcXn7iclLgAC3SfWU1jucZK
+-x1lqzw9tAgMBAAECggEABWzxS1Y2wckblnXY57Z+sl6YdmLV+gxj2r8Qib7g4ZIk
+-lIlWR1OJNfw7kU4eryib4fc6nOh6O4AWZyYqAK6tqNQSS/eVG0LQTLTTEldHyVJL
+-dvBe+MsUQOj4nTndZW+QvFzbcm2D8lY5n2nBSxU5ypVoKZ1EqQzytFcLZpTN7d89
+-EPj0qDyrV4NZlWAwL1AygCwnlwhMQjXEalVF1ylXwU3QzyZ/6MgvF6d3SSUlh+sq
+-XefuyigXw484cQQgbzopv6niMOmGP3of+yV4JQqUSb3IDmmT68XjGd2Dkxl4iPki
+-6ZwXf3CCi+c+i/zVEcufgZ3SLf8D99kUGE7v7fZ6AQKBgQD1ZX3RAla9hIhxCf+O
+-3D+I1j2LMrdjAh0ZKKqwMR4JnHX3mjQI6LwqIctPWTU8wYFECSh9klEclSdCa64s
+-uI/GNpcqPXejd0cAAdqHEEeG5sHMDt0oFSurL4lyud0GtZvwlzLuwEweuDtvT9cJ
+-Wfvl86uyO36IW8JdvUprYDctrQKBgQDycZ697qutBieZlGkHpnYWUAeImVA878sJ
+-w44NuXHvMxBPz+lbJGAg8Cn8fcxNAPqHIraK+kx3po8cZGQywKHUWsxi23ozHoxo
+-+bGqeQb9U661TnfdDspIXia+xilZt3mm5BPzOUuRqlh4Y9SOBpSWRmEhyw76w4ZP
+-OPxjWYAgwQKBgA/FehSYxeJgRjSdo+MWnK66tjHgDJE8bYpUZsP0JC4R9DL5oiaA
+-brd2fI6Y+SbyeNBallObt8LSgzdtnEAbjIH8uDJqyOmknNePRvAvR6mP4xyuR+Bv
+-m+Lgp0DMWTw5J9CKpydZDItc49T/mJ5tPhdFVd+am0NAQnmr1MCZ6nHxAoGABS3Y
+-LkaC9FdFUUqSU8+Chkd/YbOkuyiENdkvl6t2e52jo5DVc1T7mLiIrRQi4SI8N9bN
+-/3oJWCT+uaSLX2ouCtNFunblzWHBrhxnZzTeqVq4SLc8aESAnbslKL4i8/+vYZlN
+-s8xtiNcSvL+lMsOBORSXzpj/4Ot8WwTkn1qyGgECgYBKNTypzAHeLE6yVadFp3nQ
+-Ckq9yzvP/ib05rvgbvrne00YeOxqJ9gtTrzgh7koqJyX1L4NwdkEza4ilDWpucn0
+-xiUZS4SoaJq6ZvcBYS62Yr1t8n09iG47YL8ibgtmH3L+svaotvpVxVK+d7BLevA/
+-ZboOWVe3icTy64BT3OQhmg==
++MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDFyXr1E4l3GM34
++wlmdsWtjHJCigAMKwnpUOS4zI1AiLH8eTXk2T+4XIFfUx775oSkaZjdEhjh9S8Qu
++pP+yu8AexNfBVVK20xxjylwAWZdKqjfHgy5RMb+MJfdV+2PSvcQzkzwiZjWvMD+O
++pNMsmDTSsP4Oa4MAFypC+hfD9FXzDXJNGLkE+gcMUP8BZO39iAy+TWXZir/EjxVs
++xQimMGgZfFaxJ69DmLazWaT3/JnO7RiynW1OXMOo49rjKwWMGK11eLB/GPG2/mde
++o4I/muF4o7SxYuTR960ynU5XklIkwAnDpzZkySVTZYyoASlGN0T+8d8i42D7IZpF
++GojTs1lFAgMBAAECggEAIYthUi1lFBDd5gG4Rzlu+BlBIn5JhcqkCqLEBiJIFfOr
++/4yuMRrvS3bNzqWt6xJ9MSAC4ZlN/VobRLnxL/QNymoiGYUKCT3Ww8nvPpPzR9OE
++sE68TUL9tJw/zZJcRMKwgvrGqSLimfq53MxxkE+kLdOc0v9C8YH8Re26mB5ZcWYa
++7YFyZQpKsQYnsmu/05cMbpOQrQWhtmIqRoyn8mG/par2s3NzjtpSE9NINyz26uFc
++k/3ovFJQIHkUmTS7KHD3BgY5vuCqP98HramYnOysJ0WoYgvSDNCWw3037s5CCwJT
++gCKuM+Ow6liFrj83RrdKBpm5QUGjfNpYP31o+QNP4QKBgQDSrUQ2XdgtAnibAV7u
++7kbxOxro0EhIKso0Y/6LbDQgcXgxLqltkmeqZgG8nC3Z793lhlSasz2snhzzooV5
++5fTy1y8ikXqjhG0nNkInFyOhsI0auE28CFoDowaQd+5cmCatpN4Grqo5PNRXxm1w
++HktfPEgoP11NNCFHvvN5fEKbbQKBgQDwVlOaV20IvW3IPq7cXZyiyabouFF9eTRo
++VJka1Uv+JtyvL2P0NKkjYHOdN8gRblWqxQtJoTNk020rVA4UP1heiXALy50gvj/p
++hMcybPTLYSPOhAGx838KIcvGR5oskP1aUCmFbFQzGELxhJ9diVVjxUtbG2DuwPKd
++tD9TLxT2OQKBgQCcdlHSjp+dzdgERmBa0ludjGfPv9/uuNizUBAbO6D690psPFtY
++JQMYaemgSd1DngEOFVWADt4e9M5Lose+YCoqr+UxpxmNlyv5kzJOFcFAs/4XeglB
++PHKdgNW/NVKxMc6H54l9LPr+x05sYdGlEtqnP/3W5jhEvhJ5Vjc8YiyVgQKBgQCl
++zwjyrGo+42GACy7cPYE5FeIfIDqoVByB9guC5bD98JXEDu/opQQjsgFRcBCJZhOY
++M0UsURiB8ROaFu13rpQq9KrmmF0ZH+g8FSzQbzcbsTLg4VXCDXmR5esOKowFPypr
++Sm667BfTAGP++D5ya7MLmCv6+RKQ5XD8uEQQAaV2kQKBgAD8qeJuWIXZT0VKkQrn
++nIhgtzGERF/6sZdQGW2LxTbUDWG74AfFkkEbeBfwEkCZXY/xmnYqYABhvlSex8jU
++supU6Eea21esIxIub2zv/Np0ojUb6rlqTPS4Ox1E27D787EJ3VOXpriSD10vyNnZ
++jel6uj2FOP9g54s+GzlSVg/T
+ -----END RSA TESTING KEY-----`))
+
+ func testingKey(s string) string { return strings.ReplaceAll(s, "TESTING KEY", "PRIVATE KEY") }
+--
+2.40.0
-- 
2.40.0


