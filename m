Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6262ECCFA1A
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 10:21:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8353.1762510873786398939
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 02:21:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=q3zVzRi5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3406543a8f=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A77nEd22041923
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Nov 2025 02:21:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=9JN4sIFs2q6R5vNb4UfiopIdbWLUCHy4BB0n+z8RTSA=; b=q3zVzRi56zjt
	Cv52awTO0rRdg8meQSCBwT7kCWep9/KZ3YnunjcgleD/L7UdQKUqJHidRZB2q59f
	TLeBA1L7JwSz4Jy+H4dOhqViOgY6hj4qx3g6297wH/Tk1UhjfASrzWDRwO4S595T
	mgHyB8u7EZRuXJtpgYEvvN+5R5Lxm6pr/uFzEWUj48O5sTxit256SadX1zYbzZVX
	o+toQx6OL1o1Z+eZXbF5taNmR7637ovzQmGiYJlW1YNSofe7KE3K0L8AleiW3VlQ
	Noe8cd2ovevcG4rh5uoYXKjEg+PI17loWY5ZK2cx15CuDM3EgJTouP+Y+5rDfWrU
	IpRFmg0trg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a975fgchr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 02:21:13 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 7 Nov 2025 02:21:12 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 7 Nov 2025 02:21:11 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH  5/7] go: fix CVE-2025-47912
Date: Fri, 7 Nov 2025 15:51:01 +0530
Message-ID: <20251107102103.436637-5-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251107102103.436637-1-archana.polampalli@windriver.com>
References: <20251107102103.436637-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4MyBTYWx0ZWRfX/+Ccq8aWhOtJ
 ZcLcZHPsVWWnSUpUf/9JzWa/34aZcltcZ9+PGGghT72OthvhGC6D8qKQUOAcPgwjr6kogtSiUql
 5Sh35UOkYa/ZP9A827uge12VTqZay5qT7MEjUvWtUz/ulzRFHQacXaRDVTdwF4knjdI9hL69Uk7
 Sr30h9Lh2K8z/kJcTVuWLoGWNZHwmCSRA525uqWV4Ef6r3HIHdhDPrh2KPhI4uBWaAtDFr3edg0
 09o8Y8ysRDaPYPp7fW/XERVadhiYguiQh1I0IEPQ5+aLEuxTJT9hPA7jYeN7//+RdIFpVLkARbC
 J4BTrQoFvtBy2ZMNSG7v9rJi/yRMSC85uTn3odvRdJyOgOoiJyK5xAfuYfSUZ/aMfmn/rJ5QSks
 SlaaTygS9kpSmulimaXoqgtckjm68Q==
X-Authority-Analysis: v=2.4 cv=MtVfKmae c=1 sm=1 tr=0 ts=690dc819 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Oh2cFVv5AAAA:8 a=NEAV23lmAAAA:8
 a=r6LF-9bVAAAA:8 a=Rnsd1d2pAAAA:8 a=t7CeM3EgAAAA:8 a=1XWaLZrsAAAA:8
 a=pM9yUfARAAAA:8 a=BNKJNmVg3hzWodVNJTAA:9 a=6bh5H5uOXvuRkT0d:21
 a=lqcHg5cX4UMA:10 a=s5zKW874KtQA:10 a=7KeoIwV6GZqOttXkcoxL:22
 a=sL0kBDm1BSwOBZmmfnro:22 a=QqdcJgvOKW8-iKOPt_co:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=YH-7kEGJnRg4CV3apUU-:22 a=Soy3cZ2v3rD3IzUh-QDm:22 a=pHzHmUro8NiASowvMSCR:22
 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-GUID: 7GSoFGz7A7l885rwch0_t1nKDw62u222
X-Proofpoint-ORIG-GUID: 7GSoFGz7A7l885rwch0_t1nKDw62u222
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 10:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226028

From: Archana Polampalli <archana.polampalli@windriver.com>

The Parse function permits values other than IPv6 addresses to be included
in square brackets within the host component of a URL. RFC 3986 permits
IPv6 addresses to be included within the host component, enclosed within
square brackets. For example: "http://[::1]/". IPv4 addresses and hostnames
must not appear within square brackets. Parse did not enforce this requirement.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2025-47912.patch                | 226 ++++++++++++++++++
 2 files changed, 227 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-47912.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 1e4139148e..2be5c8b519 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -25,6 +25,7 @@ SRC_URI += "\
     file://CVE-2025-58187.patch \
     file://CVE-2025-58188.patch \
     file://CVE-2025-58189.patch \
+    file://CVE-2025-47912.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-47912.patch b/meta/recipes-devtools/go/go/CVE-2025-47912.patch
new file mode 100644
index 0000000000..bc63b323ca
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-47912.patch
@@ -0,0 +1,226 @@
+From d6d2f7bf76718f1db05461cd912ae5e30d7b77ea Mon Sep 17 00:00:00 2001
+From: Ethan Lee <ethanalee@google.com>
+Date: Fri, 29 Aug 2025 17:35:55 +0000
+Subject: [PATCH] [release-branch.go1.24] net/url: enforce stricter parsing of
+
+ bracketed IPv6 hostnames - Previously, url.Parse did not enforce validation
+ of hostnames within   square brackets. - RFC 3986 stipulates that only IPv6
+ hostnames can be embedded within   square brackets in a URL. - Now, the
+ parsing logic should strictly enforce that only IPv6   hostnames can be
+ resolved when in square brackets. IPv4, IPv4-mapped   addresses and other
+ input will be rejected. - Update url_test to add test cases that cover the
+ above scenarios.
+
+Thanks to Enze Wang, Jingcheng Yang and Zehui Miao of Tsinghua
+University for reporting this issue.
+
+Fixes CVE-2025-47912
+Fixes #75678
+Fixes #75712
+
+Change-Id: Iaa41432bf0ee86de95a39a03adae5729e4deb46c
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2680
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2968
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/709838
+TryBot-Bypass: Michael Pratt <mpratt@google.com>
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+Auto-Submit: Michael Pratt <mpratt@google.com>
+
+CVE: CVE-2025-47912
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/d6d2f7bf76718f1db05461cd912ae5e30d7b77ea]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/go/build/deps_test.go |  9 ++++++---
+ src/net/url/url.go        | 42 +++++++++++++++++++++++++++++----------
+ src/net/url/url_test.go   | 39 ++++++++++++++++++++++++++++++++++++
+ 3 files changed, 77 insertions(+), 13 deletions(-)
+
+diff --git a/src/go/build/deps_test.go b/src/go/build/deps_test.go
+index 7ce8d34..9f2663f 100644
+--- a/src/go/build/deps_test.go
++++ b/src/go/build/deps_test.go
+@@ -209,7 +209,6 @@ var depsRules = `
+	  internal/types/errors,
+	  mime/quotedprintable,
+	  net/internal/socktest,
+-	  net/url,
+	  runtime/trace,
+	  text/scanner,
+	  text/tabwriter;
+@@ -252,6 +251,12 @@ var depsRules = `
+	FMT
+	< text/template/parse;
+
++	internal/bytealg, internal/itoa, math/bits, slices, strconv, unique
++	< net/netip;
++
++	FMT, net/netip
++	< net/url;
++
+	net/url, text/template/parse
+	< text/template
+	< internal/lazytemplate;
+@@ -367,8 +372,6 @@ var depsRules = `
+	internal/godebug
+	< internal/intern;
+
+-	internal/bytealg, internal/intern, internal/itoa, math/bits, sort, strconv
+-	< net/netip;
+
+	# net is unavoidable when doing any networking,
+	# so large dependencies must be kept out.
+diff --git a/src/net/url/url.go b/src/net/url/url.go
+index f362958..d2ae032 100644
+--- a/src/net/url/url.go
++++ b/src/net/url/url.go
+@@ -13,6 +13,7 @@ package url
+ import (
+	"errors"
+	"fmt"
++	"net/netip"
+	"path"
+	"sort"
+	"strconv"
+@@ -621,40 +622,61 @@ func parseAuthority(authority string) (user *Userinfo, host string, err error) {
+ // parseHost parses host as an authority without user
+ // information. That is, as host[:port].
+ func parseHost(host string) (string, error) {
+-	if strings.HasPrefix(host, "[") {
++	if openBracketIdx := strings.LastIndex(host, "["); openBracketIdx != -1 {
+		// Parse an IP-Literal in RFC 3986 and RFC 6874.
+		// E.g., "[fe80::1]", "[fe80::1%25en0]", "[fe80::1]:80".
+-		i := strings.LastIndex(host, "]")
+-		if i < 0 {
++		closeBracketIdx := strings.LastIndex(host, "]")
++		if closeBracketIdx < 0 {
+			return "", errors.New("missing ']' in host")
+		}
+-		colonPort := host[i+1:]
++
++		colonPort := host[closeBracketIdx+1:]
+		if !validOptionalPort(colonPort) {
+			return "", fmt.Errorf("invalid port %q after host", colonPort)
+		}
++		unescapedColonPort, err := unescape(colonPort, encodeHost)
++		if err != nil {
++			return "", err
++		}
+
++		hostname := host[openBracketIdx+1 : closeBracketIdx]
++		var unescapedHostname string
+		// RFC 6874 defines that %25 (%-encoded percent) introduces
+		// the zone identifier, and the zone identifier can use basically
+		// any %-encoding it likes. That's different from the host, which
+		// can only %-encode non-ASCII bytes.
+		// We do impose some restrictions on the zone, to avoid stupidity
+		// like newlines.
+-		zone := strings.Index(host[:i], "%25")
+-		if zone >= 0 {
+-			host1, err := unescape(host[:zone], encodeHost)
++		zoneIdx := strings.Index(hostname, "%25")
++		if zoneIdx >= 0 {
++			hostPart, err := unescape(hostname[:zoneIdx], encodeHost)
+			if err != nil {
+				return "", err
+			}
+-			host2, err := unescape(host[zone:i], encodeZone)
++			zonePart, err := unescape(hostname[zoneIdx:], encodeZone)
+			if err != nil {
+				return "", err
+			}
+-			host3, err := unescape(host[i:], encodeHost)
++			unescapedHostname = hostPart + zonePart
++		} else {
++			var err error
++			unescapedHostname, err = unescape(hostname, encodeHost)
+			if err != nil {
+				return "", err
+			}
+-			return host1 + host2 + host3, nil
+		}
++
++		// Per RFC 3986, only a host identified by a valid
++		// IPv6 address can be enclosed by square brackets.
++		// This excludes any IPv4 or IPv4-mapped addresses.
++		addr, err := netip.ParseAddr(unescapedHostname)
++		if err != nil {
++			return "", fmt.Errorf("invalid host: %w", err)
++		}
++		if addr.Is4() || addr.Is4In6() {
++			return "", errors.New("invalid IPv6 host")
++		}
++		return "[" + unescapedHostname + "]" + unescapedColonPort, nil
+	} else if i := strings.LastIndex(host, ":"); i != -1 {
+		colonPort := host[i:]
+		if !validOptionalPort(colonPort) {
+diff --git a/src/net/url/url_test.go b/src/net/url/url_test.go
+index 4aa20bb..fef236e 100644
+--- a/src/net/url/url_test.go
++++ b/src/net/url/url_test.go
+@@ -383,6 +383,16 @@ var urltests = []URLTest{
+		},
+		"",
+	},
++	// valid IPv6 host with port and path
++	{
++		"https://[2001:db8::1]:8443/test/path",
++		&URL{
++			Scheme: "https",
++			Host:   "[2001:db8::1]:8443",
++			Path:   "/test/path",
++		},
++		"",
++	},
+	// host subcomponent; IPv6 address with zone identifier in RFC 6874
+	{
+		"http://[fe80::1%25en0]/", // alphanum zone identifier
+@@ -707,6 +717,24 @@ var parseRequestURLTests = []struct {
+	// RFC 6874.
+	{"http://[fe80::1%en0]/", false},
+	{"http://[fe80::1%en0]:8080/", false},
++
++	// Tests exercising RFC 3986 compliance
++	{"https://[1:2:3:4:5:6:7:8]", true},             // full IPv6 address
++	{"https://[2001:db8::a:b:c:d]", true},           // compressed IPv6 address
++	{"https://[fe80::1%25eth0]", true},              // link-local address with zone ID (interface name)
++	{"https://[fe80::abc:def%254]", true},           // link-local address with zone ID (interface index)
++	{"https://[2001:db8::1]/path", true},            // compressed IPv6 address with path
++	{"https://[fe80::1%25eth0]/path?query=1", true}, // link-local with zone, path, and query
++
++	{"https://[::ffff:192.0.2.1]", false},
++	{"https://[:1] ", false},
++	{"https://[1:2:3:4:5:6:7:8:9]", false},
++	{"https://[1::1::1]", false},
++	{"https://[1:2:3:]", false},
++	{"https://[ffff::127.0.0.4000]", false},
++	{"https://[0:0::test.com]:80", false},
++	{"https://[2001:db8::test.com]", false},
++	{"https://[test.com]", false},
+ }
+
+ func TestParseRequestURI(t *testing.T) {
+@@ -1635,6 +1663,17 @@ func TestParseErrors(t *testing.T) {
+		{"cache_object:foo", true},
+		{"cache_object:foo/bar", true},
+		{"cache_object/:foo/bar", false},
++
++		{"http://[192.168.0.1]/", true},             // IPv4 in brackets
++		{"http://[192.168.0.1]:8080/", true},        // IPv4 in brackets with port
++		{"http://[::ffff:192.168.0.1]/", true},      // IPv4-mapped IPv6 in brackets
++		{"http://[::ffff:192.168.0.1]:8080/", true}, // IPv4-mapped IPv6 in brackets with port
++		{"http://[::ffff:c0a8:1]/", true},           // IPv4-mapped IPv6 in brackets (hex)
++		{"http://[not-an-ip]/", true},               // invalid IP string in brackets
++		{"http://[fe80::1%foo]/", true},             // invalid zone format in brackets
++		{"http://[fe80::1", true},                   // missing closing bracket
++		{"http://fe80::1]/", true},                  // missing opening bracket
++		{"http://[test.com]/", true},                // domain name in brackets
+	}
+	for _, tt := range tests {
+		u, err := Parse(tt.in)
+--
+2.40.0
-- 
2.40.0


