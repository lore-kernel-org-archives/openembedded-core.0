Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F157CCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 14:58:59 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19315.1762873132908418140
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 06:58:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=B20vwJHL;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34361025290so2980677a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 06:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762873132; x=1763477932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07A1Yt44Cj12ABg6lxP67i3HDjbvxHT4FypeG8zxZ58=;
        b=B20vwJHL5CF7epLK2RMpPpfJ+18uRo5kOSITbscjrGfj9+GWNX3tNBd2N69/4fZSwY
         7AdiS9WfUBOwPXjj2DhlcVdc5xfzgUuCWjhLDbIz3qgMaP7O0PeFGMLCxd+TZbkDFWUx
         a0qLMM03eGCVbuEcV2kH2v4SJnXl1v+7j/1hBaNtQwo/fbcc7iOuxsQiJJccaceS9k/w
         YKG2BneR8wPLN2i7+8fsbodzOXLkmoRseWElE0FivgIYvjPwG5miheYaQDEXdzdYbt/x
         WDVcoA48iJzRN2SZfpAYWNYfWef1IBAnsfIs+oq/akBGjbqG28S5fcjHX3aCw2sF4RFq
         9rtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873132; x=1763477932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=07A1Yt44Cj12ABg6lxP67i3HDjbvxHT4FypeG8zxZ58=;
        b=UUmWxCO2Rc5KwV0aDr5VKv2/HvWEBTlmju9D3VUIj0j1zTUbL52DjhgRlEs1p61Qab
         5xchib+3WvN08SKwPYb8l0X+ZGpPdOES6WwPIzYuiLhjRhPLtvWc+6oi6W3IsEOQlqRl
         nScF88xsV6E9I0L18Km12IsPEzzGuD35rVmbnJpaUpBN6TfRHFz+rz227SgSmxb+zHV+
         8ZnpJ57Ufa/oq8Trl8EAqL0LF++MI8vfItcc1vK/VRsR/quPqf9qUxF/3u3r+hJFvJAx
         pcOpI8EnBUWQdTG4Pq1emJ05L62oBDgPMDqYd+DdDSkr4yYCxtP5tVgaZwfGOCEoOoAp
         6C/w==
X-Gm-Message-State: AOJu0Yz8BpzvjCDfvAWouNay6y8TJGRRxy/OWN4MlLv/2J1FYzMuyuKI
	CTEVeKznRNAhrCcBtbHBDNOg+T2ZQOe9IcdPjLcklx2coOLMeIdQx0TVIh+FFPFhrMKVTcktxem
	NZTb3oxo=
X-Gm-Gg: ASbGncvbbkPqzvKBKsYW8qOBDo+T1imD6HALtys40JNlsA93CtGUF/RdORtne9HrEgh
	ytLZEDVYoB2z0x1MBXQVHBCGy2NzwojexPOgmXn7tVrYXj8nA4Wn1ZwAfS1k+U+HmGesM7wdG7L
	PAPaIN0vrez2fJBETNRTNlDGEYwsozTt8WM7bgNONg+NkhodDrTeBLqyjloxuPzyM7XojBpL0gZ
	wVUggRCKU2Ek4orFcssVOcUOTCVOVNdBoYpKoa55jESqTOMitErldqihnlJiJKDGLPA7MmuqN5V
	Mdm67Aw64It8TJXr8GJaMqtWvbLQg4IauSPR6FNTlnuDv6QEG6VxDA+xEBp/n3YGB3nQL7sCDIQ
	i0vOpMTYfj91Z7WpOkvGLw3aEKUdxh14xXpJbccq/8SMc6GZCW5mN5RRy7pGrVm4UhYIjEEaWB/
	/z2Q==
X-Google-Smtp-Source: AGHT+IGyOYVt/M19wNDl8HFacZD7yf7eiA8tfDKBut+m1oqDcSweoSCdKtuzbKm6E5g7zKwEndbnlg==
X-Received: by 2002:a17:90b:38cf:b0:33b:bed8:891c with SMTP id 98e67ed59e1d1-3436cbf892amr17545061a91.23.1762873132080;
        Tue, 11 Nov 2025 06:58:52 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:db6b:ed5a:7890:6b41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343685301f8sm11662588a91.5.2025.11.11.06.58.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:58:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/19] go: fix CVE-2025-47912
Date: Tue, 11 Nov 2025 06:58:14 -0800
Message-ID: <c5fc59eb87d0f92ba8596b7848d16d59773582a0.1762872962.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762872962.git.steve@sakoman.com>
References: <cover.1762872962.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 14:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226171

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
2.43.0


