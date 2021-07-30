Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.2729.1627674941487861455
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 12:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 16UJtdX2003989
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 12:55:40 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 30 Jul 2021 12:55:39 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 30 Jul 2021 12:55:39 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] go: fix CVE-2020-29509, CVE-2020-29511
Date: Fri, 30 Jul 2021 15:54:39 -0400
Message-ID: <20210730195439.37498-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backport patch to fix CVE-2020-29509, CVE-2020-29511

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/go/go-1.16.5.inc        |   1 +
 ...dle-leading-trailing-or-double-colon.patch | 123 ++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.16/0001-encoding-xml-handle-leading-trailing-or-double-colon.patch

diff --git a/meta/recipes-devtools/go/go-1.16.5.inc b/meta/recipes-devtools/go/go-1.16.5.inc
index bd928e44f8..b693315917 100644
--- a/meta/recipes-devtools/go/go-1.16.5.inc
+++ b/meta/recipes-devtools/go/go-1.16.5.inc
@@ -16,5 +16,6 @@ SRC_URI += "\
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
+    file://0001-encoding-xml-handle-leading-trailing-or-double-colon.patch \
 "
 SRC_URI[main.sha256sum] = "7bfa7e5908c7cc9e75da5ddf3066d7cbcf3fd9fa51945851325eebc17f50ba80"
diff --git a/meta/recipes-devtools/go/go-1.16/0001-encoding-xml-handle-leading-trailing-or-double-colon.patch b/meta/recipes-devtools/go/go-1.16/0001-encoding-xml-handle-leading-trailing-or-double-colon.patch
new file mode 100644
index 0000000000..3c47157d1a
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.16/0001-encoding-xml-handle-leading-trailing-or-double-colon.patch
@@ -0,0 +1,123 @@
+From 4d014e723165f28b34458edb4aa9136e0fb4c702 Mon Sep 17 00:00:00 2001
+From: Filippo Valsorda <filippo@golang.org>
+Date: Tue, 27 Oct 2020 00:17:15 +0100
+Subject: [PATCH] encoding/xml: handle leading, trailing, or double colons in
+ names
+
+Before this change, <:name> would parse as <name>, which could cause
+issues in applications that rely on the parse-encode cycle to
+round-trip. Similarly, <x name:=""> would parse as expected but then
+have the attribute dropped when serializing because its name was empty.
+Finally, <a:b:c> would parse and get serialized incorrectly. All these
+values are invalid XML, but to minimize the impact of this change, we
+parse them whole into Name.Local.
+
+This issue was reported by Juho Nurminen of Mattermost as it leads to
+round-trip mismatches. See #43168. It's not being fixed in a security
+release because round-trip stability is not a currently supported
+security property of encoding/xml, and we don't believe these fixes
+would be sufficient to reliably guarantee it in the future.
+
+Fixes CVE-2020-29509
+Fixes CVE-2020-29511
+Updates #43168
+
+Change-Id: I68321c4d867305046f664347192948a889af3c7f
+Reviewed-on: https://go-review.googlesource.com/c/go/+/277892
+Run-TryBot: Filippo Valsorda <filippo@golang.org>
+TryBot-Result: Go Bot <gobot@golang.org>
+Trust: Filippo Valsorda <filippo@golang.org>
+Reviewed-by: Katie Hockman <katie@golang.org>
+
+CVE: CVE-2020-29509 CVE-2020-29511
+Upstream-Status: Backport [4d014e723165f28b34458edb4aa9136e0fb4c702]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/encoding/xml/xml.go      |  5 ++--
+ src/encoding/xml/xml_test.go | 56 ++++++++++++++++++++++++++++++++++++
+ 2 files changed, 59 insertions(+), 2 deletions(-)
+
+diff --git a/src/encoding/xml/xml.go b/src/encoding/xml/xml.go
+index 384d6ad4b8..c902f1295a 100644
+--- a/src/encoding/xml/xml.go
++++ b/src/encoding/xml/xml.go
+@@ -1156,8 +1156,9 @@ func (d *Decoder) nsname() (name Name, ok bool) {
+ 	if !ok {
+ 		return
+ 	}
+-	i := strings.Index(s, ":")
+-	if i < 0 {
++	if strings.Count(s, ":") > 1 {
++		name.Local = s
++	} else if i := strings.Index(s, ":"); i < 1 || i > len(s)-2 {
+ 		name.Local = s
+ 	} else {
+ 		name.Space = s[0:i]
+diff --git a/src/encoding/xml/xml_test.go b/src/encoding/xml/xml_test.go
+index 5a10f5309d..47d0c39167 100644
+--- a/src/encoding/xml/xml_test.go
++++ b/src/encoding/xml/xml_test.go
+@@ -1003,3 +1003,59 @@ func TestTokenUnmarshaler(t *testing.T) {
+ 	d := NewTokenDecoder(tokReader{})
+ 	d.Decode(&Failure{})
+ }
++
++func testRoundTrip(t *testing.T, input string) {
++	d := NewDecoder(strings.NewReader(input))
++	var tokens []Token
++	var buf bytes.Buffer
++	e := NewEncoder(&buf)
++	for {
++		tok, err := d.Token()
++		if err == io.EOF {
++			break
++		}
++		if err != nil {
++			t.Fatalf("invalid input: %v", err)
++		}
++		if err := e.EncodeToken(tok); err != nil {
++			t.Fatalf("failed to re-encode input: %v", err)
++		}
++		tokens = append(tokens, CopyToken(tok))
++	}
++	if err := e.Flush(); err != nil {
++		t.Fatal(err)
++	}
++
++	d = NewDecoder(&buf)
++	for {
++		tok, err := d.Token()
++		if err == io.EOF {
++			break
++		}
++		if err != nil {
++			t.Fatalf("failed to decode output: %v", err)
++		}
++		if len(tokens) == 0 {
++			t.Fatalf("unexpected token: %#v", tok)
++		}
++		a, b := tokens[0], tok
++		if !reflect.DeepEqual(a, b) {
++			t.Fatalf("token mismatch: %#v vs %#v", a, b)
++		}
++		tokens = tokens[1:]
++	}
++	if len(tokens) > 0 {
++		t.Fatalf("lost tokens: %#v", tokens)
++	}
++}
++
++func TestRoundTrip(t *testing.T) {
++	tests := map[string]string{
++		"leading colon":  `<::Test ::foo="bar"><:::Hello></:::Hello><Hello></Hello></::Test>`,
++		"trailing colon": `<foo abc:="x"></foo>`,
++		"double colon":   `<x:y:foo></x:y:foo>`,
++	}
++	for name, input := range tests {
++		t.Run(name, func(t *testing.T) { testRoundTrip(t, input) })
++	}
++}
+-- 
+2.25.1
+
-- 
2.32.0

