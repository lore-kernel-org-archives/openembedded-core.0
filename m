Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 505E3C41513
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 00:18:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3939.1690935504581038244
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 17:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=YvHI2Yrz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=757808ff50=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37201w2b006115
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Aug 2023 17:18:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	PPS06212021; bh=DyhVrsYd54prEf9rAxHsOY5eJGXh3OGd07pOfwQIv/4=; b=
	YvHI2YrzztQ+VZUcHqIyQsQ0IuPfKplu6mLEmxMaLGnEwVn99oqFD68HbEmzVR8c
	dy6+0TVsDmKZIhBEOrbQNf1e2LYMDTRl4x6VwWq23LzYmyKzu7lWEGs7wySLf+2i
	IhCe1xvo2zJCgst9EOEzPspqQ5+qV5Bby7X3oZNP2NSV8SZP5fk1r9e4OChuldNo
	orcwSd6zDPFLlPojRIOjgKrV2qihdmWTX8YNQGQxDt6bwzFyxZIFD3LIPDB1YLh/
	NOryNdawnFKZEKGpxmUkA2qw2SuS3+vCz2Hy63OsJdbVm9l6FfQ7sEve9FeoWbyd
	F5R5yxPjmRE6PR3CxBGITg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s6daqsp6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 17:18:22 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 17:18:21 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Tue, 1 Aug 2023 17:18:21 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 3/3] go: fix CVE-2023-29406
Date: Tue, 1 Aug 2023 17:18:13 -0700
Message-ID: <20230802001813.3521965-3-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230802001813.3521965-1-sakib.sajal@windriver.com>
References: <20230802001813.3521965-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: g8seb_4iy_7a0EjOZfVNkLZ6AfXdgQ0W
X-Proofpoint-GUID: g8seb_4iy_7a0EjOZfVNkLZ6AfXdgQ0W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_21,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 mlxlogscore=977 malwarescore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308020000
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 37201w2b006115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 00:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185367

Backport required patch to fix CVE-2023-29406.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.19/CVE-2023-29406.patch           | 210 ++++++++++++++++++
 2 files changed, 211 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-29406.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devto=
ols/go/go-1.17.13.inc
index d46eab01a0..b9d905a616 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -41,6 +41,7 @@ SRC_URI +=3D "\
     file://CVE-2023-24536_3.patch \
     file://CVE-2023-24531_1.patch \
     file://CVE-2023-24531_2.patch \
+    file://CVE-2023-29406.patch \
 "
 SRC_URI[main.sha256sum] =3D "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d=
1fc0c1d784ada0cd300fd"
=20
diff --git a/meta/recipes-devtools/go/go-1.19/CVE-2023-29406.patch b/meta=
/recipes-devtools/go/go-1.19/CVE-2023-29406.patch
new file mode 100644
index 0000000000..8a82d5c18c
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.19/CVE-2023-29406.patch
@@ -0,0 +1,210 @@
+From 3077df09879fb1aad0ccfc009fee6fc5e5f532bc Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Wed, 28 Jun 2023 13:20:08 -0700
+Subject: [PATCH] net/http: validate Host header before sending
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
+CVE: CVE-2023-29406
+Upstream-Status: Backport [5fa6923b1ea891400153d04ddf1545e23b40041b]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
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
+ 	}
+ }
+=20
+-func TestCleanHost(t *testing.T) {
+-	tests :=3D []struct {
+-		in, want string
+-	}{
+-		{"www.google.com", "www.google.com"},
+-		{"www.google.com foo", "www.google.com"},
+-		{"www.google.com/foo", "www.google.com"},
+-		{" first character is a space", ""},
+-		{"[1::6]:8080", "[1::6]:8080"},
+-
+-		// Punycode:
+-		{"=D0=B3=D0=BE=D1=84=D0=B5=D1=80.=D1=80=D1=84/foo", "xn--c1ae0ajs.xn-=
-p1ai"},
+-		{"b=C3=BCcher.de", "xn--bcher-kva.de"},
+-		{"b=C3=BCcher.de:8080", "xn--bcher-kva.de:8080"},
+-		// Verify we convert to lowercase before punycode:
+-		{"B=C3=9CCHER.de", "xn--bcher-kva.de"},
+-		{"B=C3=9CCHER.de:8080", "xn--bcher-kva.de:8080"},
+-		// Verify we normalize to NFC before punycode:
+-		{"goph=C3=A9r.nfc", "xn--gophr-esa.nfc"},            // NFC input; no=
 work needed
+-		{"goph\u0065\u0301r.nfd", "xn--gophr-esa.nfd"}, // NFD input
+-	}
+-	for _, tt :=3D range tests {
+-		got :=3D cleanHost(tt.in)
+-		if tt.want !=3D got {
+-			t.Errorf("cleanHost(%q) =3D %q, want %q", tt.in, got, tt.want)
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
+ 	"io"
+ 	"mime"
+ 	"mime/multipart"
+-	"net"
+ 	"net/http/httptrace"
+ 	"net/http/internal/ascii"
+ 	"net/textproto"
+@@ -27,6 +26,7 @@ import (
+ 	"strings"
+ 	"sync"
+=20
++	"golang.org/x/net/http/httpguts"
+ 	"golang.org/x/net/idna"
+ )
+=20
+@@ -568,12 +568,19 @@ func (r *Request) write(w io.Writer, usingProxy bo=
ol, extraHeaders Header, waitF
+ 	// is not given, use the host from the request URL.
+ 	//
+ 	// Clean the host, in case it arrives with unexpected stuff in it.
+-	host :=3D cleanHost(r.Host)
++	host :=3D r.Host
+ 	if host =3D=3D "" {
+ 		if r.URL =3D=3D nil {
+ 			return errMissingHost
+ 		}
+-		host =3D cleanHost(r.URL.Host)
++		host =3D r.URL.Host
++	}
++	host, err =3D httpguts.PunycodeHostPort(host)
++	if err !=3D nil {
++		return err
++	}
++	if !httpguts.ValidHostHeader(host) {
++		return errors.New("http: invalid Host header")
+ 	}
+=20
+ 	// According to RFC 6874, an HTTP client, proxy, or other
+@@ -730,38 +737,6 @@ func idnaASCII(v string) (string, error) {
+ 	return idna.Lookup.ToASCII(v)
+ }
+=20
+-// cleanHost cleans up the host sent in request's Host header.
+-//
+-// It both strips anything after '/' or ' ', and puts the value
+-// into Punycode form, if necessary.
+-//
+-// Ideally we'd clean the Host header according to the spec:
+-//   https://tools.ietf.org/html/rfc7230#section-5.4 (Host =3D uri-host=
 [ ":" port ]")
+-//   https://tools.ietf.org/html/rfc7230#section-2.7 (uri-host -> rfc39=
86's host)
+-//   https://tools.ietf.org/html/rfc3986#section-3.2.2 (definition of h=
ost)
+-// But practically, what we are trying to avoid is the situation in
+-// issue 11206, where a malformed Host header used in the proxy context
+-// would create a bad request. So it is enough to just truncate at the
+-// first offending character.
+-func cleanHost(in string) string {
+-	if i :=3D strings.IndexAny(in, " /"); i !=3D -1 {
+-		in =3D in[:i]
+-	}
+-	host, port, err :=3D net.SplitHostPort(in)
+-	if err !=3D nil { // input was just a host
+-		a, err :=3D idnaASCII(in)
+-		if err !=3D nil {
+-			return in // garbage in, garbage out
+-		}
+-		return a
+-	}
+-	a, err :=3D idnaASCII(host)
+-	if err !=3D nil {
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
+ 	}
+ 	req.Host =3D "foo.com with spaces"
+ 	req.URL.Host =3D "foo.com with spaces"
+-	req.Write(logWrites{t, &got})
+-	want :=3D []string{
+-		"GET /after HTTP/1.1\r\n",
+-		"Host: foo.com\r\n",
+-		"User-Agent: " + DefaultUserAgent + "\r\n",
+-		"\r\n",
+-	}
+-	if !reflect.DeepEqual(got, want) {
+-		t.Errorf("Writes =3D %q\n  Want =3D %q", got, want)
++	if err :=3D req.Write(logWrites{t, &got}); err =3D=3D nil {
++		t.Errorf("Writing request with invalid Host: succeded, want error")
+ 	}
+ }
+=20
+diff --git a/src/net/http/transport_test.go b/src/net/http/transport_tes=
t.go
+index eeaa492..58f12af 100644
+--- a/src/net/http/transport_test.go
++++ b/src/net/http/transport_test.go
+@@ -6512,3 +6512,21 @@ func TestCancelRequestWhenSharingConnection(t *te=
sting.T) {
+ 	close(r2c)
+ 	wg.Wait()
+ }
++
++func TestRequestSanitization(t *testing.T) {
++	setParallel(t)
++	defer afterTest(t)
++
++	ts :=3D newClientServerTest(t, h1Mode, HandlerFunc(func(rw ResponseWri=
ter, req *Request) {
++		if h, ok :=3D req.Header["X-Evil"]; ok {
++			t.Errorf("request has X-Evil header: %q", h)
++		}
++	})).ts
++	defer ts.Close()
++	req, _ :=3D NewRequest("GET", ts.URL, nil)
++	req.Host =3D "go.dev\r\nX-Evil:evil"
++	resp, _ :=3D ts.Client().Do(req)
++	if resp !=3D nil {
++		resp.Body.Close()
++	}
++}
+--=20
+2.35.5
+
--=20
2.39.0


