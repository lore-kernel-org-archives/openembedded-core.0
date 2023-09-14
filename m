Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B53EEAA58
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 16:34:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.473.1694709250760834876
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 09:34:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QamiFn4L;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76211bba8e=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38E8e4gR032640
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 16:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=/Rnge
	+Jr+yRxDAQyBh4bB+6rgARsOuA1wNTsR/gxlxk=; b=QamiFn4LbCbjen4Tt4mCy
	pVzPeIHJ1zkTbPU05k/7TrHiE+EspHfefKUr4TT6Oh81orR2z+z6wyMH6U1zeaKm
	DkXLm9937AKwf45DUE4L616q89Ie2v3Ve7AC8QVup94ypo1ukB257KuoZbX+ZcJJ
	5MqGtRBuLuhP3Sa/oi4HM9Vor/QFw8ras5rCqDhlZSLs7UDbQ7/DXmxkjO+a7a9E
	JusA6ypZcc1T/e36+9r7S1mCc0LiL70v4GXuovVq26w99Jh1m7neuvISr1hCuro1
	GfLtTqWv7vkCWL10UwOMfMxL+YkfoufL9Ar0TfIUsWSE/0J693BBCYrNhktcZz7B
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2y8ma0bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 16:34:09 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 09:34:06 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] go: Fix CVE-2023-39319
Date: Thu, 14 Sep 2023 16:33:48 +0000
Message-ID: <20230914163348.2724993-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 4v3dOPqPCwMgnU6hnMEQkLaO2FBuNtVe
X-Proofpoint-GUID: 4v3dOPqPCwMgnU6hnMEQkLaO2FBuNtVe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_09,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=729 spamscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309140143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 16:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187645

From: Soumya Sambu <soumya.sambu@windriver.com>

The html/template package does not apply the proper rules for handling
occurrences of "<script", "<!--", and "</script" within JS literals in
<script> contexts. This may cause the template parser to improperly
consider script contexts to be terminated early, causing actions to be
improperly escaped. This could be leveraged to perform an XSS attack.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-39319

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   3 +-
 .../go/go-1.20/CVE-2023-39319.patch           | 254 ++++++++++++++++++
 2 files changed, 256 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/go/go-1.20/CVE-2023-39319.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 91dd886cd0..c753a26a7e 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -1,6 +1,6 @@
 require go-common.inc
 
-FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-1.21:${FILE_DIRNAME}/go-1.19:${FILE_DIRNAME}/go-1.18:"
+FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-1.21:${FILE_DIRNAME}/go-1.20:${FILE_DIRNAME}/go-1.19:${FILE_DIRNAME}/go-1.18:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
@@ -43,6 +43,7 @@ SRC_URI += "\
     file://CVE-2023-24531_1.patch \
     file://CVE-2023-24531_2.patch \
     file://CVE-2023-29409.patch \
+    file://CVE-2023-39319.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.20/CVE-2023-39319.patch b/meta/recipes-devtools/go/go-1.20/CVE-2023-39319.patch
new file mode 100644
index 0000000000..1554aa975c
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.20/CVE-2023-39319.patch
@@ -0,0 +1,254 @@
+From 2070531d2f53df88e312edace6c8dfc9686ab2f5 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Thu Aug 3 12:28:28 2023 -0700
+Subject: [PATCH] html/template: properly handle special tags within the script
+ context
+
+The HTML specification has incredibly complex rules for how to handle
+"<!--", "<script", and "</script" when they appear within literals in
+the script context. Rather than attempting to apply these restrictions
+(which require a significantly more complex state machine) we apply
+the workaround suggested in section 4.12.1.3 of the HTML specification [1].
+
+More precisely, when "<!--", "<script", and "</script" appear within
+literals (strings and regular expressions, ignoring comments since we
+already elide their content) we replace the "<" with "\x3C". This avoids
+the unintuitive behavior that using these tags within literals can cause,
+by simply preventing the rendered content from triggering it. This may
+break some correct usages of these tags, but on balance is more likely
+to prevent XSS attacks where users are unknowingly either closing or not
+closing the script blocks where they think they are.
+
+Thanks to Takeshi Kaneko (GMO Cybersecurity by Ierae, Inc.) for
+reporting this issue.
+
+Fixes #62197
+Fixes #62397
+Fixes CVE-2023-39319
+
+[1] https://html.spec.whatwg.org/#restrictions-for-contents-of-script-elements
+
+Change-Id: Iab57b0532694827e3eddf57a7497ba1fab1746dc
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1976594
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/2014621
+Reviewed-on: https://go-review.googlesource.com/c/go/+/526099
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Run-TryBot: Cherry Mui <cherryyz@google.com>
+
+CVE: CVE-2023-39319
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/2070531d2f53df88e312edace6c8dfc9686ab2f5]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/go/build/deps_test.go        |  6 ++--
+ src/html/template/context.go     | 14 ++++++++++
+ src/html/template/escape.go      | 26 ++++++++++++++++++
+ src/html/template/escape_test.go | 47 +++++++++++++++++++++++++++++++-
+ src/html/template/transition.go  | 15 ++++++++++
+ 5 files changed, 104 insertions(+), 4 deletions(-)
+
+diff --git a/src/go/build/deps_test.go b/src/go/build/deps_test.go
+index dc3bb8c..359a00a 100644
+--- a/src/go/build/deps_test.go
++++ b/src/go/build/deps_test.go
+@@ -255,15 +255,15 @@ var depsRules = `
+	< text/template
+	< internal/lazytemplate;
+
+-	encoding/json, html, text/template
+-	< html/template;
+-
+	# regexp
+	FMT
+	< regexp/syntax
+	< regexp
+	< internal/lazyregexp;
+
++	encoding/json, html, text/template, regexp
++	< html/template;
++
+	# suffix array
+	encoding/binary, regexp
+	< index/suffixarray;
+diff --git a/src/html/template/context.go b/src/html/template/context.go
+index 0b65313..f5f44a1 100644
+--- a/src/html/template/context.go
++++ b/src/html/template/context.go
+@@ -164,6 +164,20 @@ func isInTag(s state) bool {
+	return false
+ }
+
++// isInScriptLiteral returns true if s is one of the literal states within a
++// <script> tag, and as such occurances of "<!--", "<script", and "</script"
++// need to be treated specially.
++func isInScriptLiteral(s state) bool {
++	// Ignore the comment states (stateJSBlockCmt, stateJSLineCmt,
++	// stateJSHTMLOpenCmt, stateJSHTMLCloseCmt) because their content is already
++	// omitted from the output.
++	switch s {
++	case stateJSDqStr, stateJSSqStr, stateJSBqStr, stateJSRegexp:
++		return true
++	}
++	return false
++}
++
+ // delim is the delimiter that will end the current HTML attribute.
+ type delim uint8
+
+diff --git a/src/html/template/escape.go b/src/html/template/escape.go
+index bdccc65..1747ec9 100644
+--- a/src/html/template/escape.go
++++ b/src/html/template/escape.go
+@@ -10,6 +10,7 @@ import (
+	"html"
+	"internal/godebug"
+	"io"
++	"regexp"
+	"text/template"
+	"text/template/parse"
+ )
+@@ -652,6 +653,26 @@ var delimEnds = [...]string{
+	delimSpaceOrTagEnd: " \t\n\f\r>",
+ }
+
++var (
++	// Per WHATWG HTML specification, section 4.12.1.3, there are extremely
++	// complicated rules for how to handle the set of opening tags <!--,
++	// <script, and </script when they appear in JS literals (i.e. strings,
++	// regexs, and comments). The specification suggests a simple solution,
++	// rather than implementing the arcane ABNF, which involves simply escaping
++	// the opening bracket with \x3C. We use the below regex for this, since it
++	// makes doing the case-insensitive find-replace much simpler.
++	specialScriptTagRE          = regexp.MustCompile("(?i)<(script|/script|!--)")
++	specialScriptTagReplacement = []byte("\\x3C$1")
++)
++
++func containsSpecialScriptTag(s []byte) bool {
++	return specialScriptTagRE.Match(s)
++}
++
++func escapeSpecialScriptTags(s []byte) []byte {
++	return specialScriptTagRE.ReplaceAll(s, specialScriptTagReplacement)
++}
++
+ var doctypeBytes = []byte("<!DOCTYPE")
+
+ // escapeText escapes a text template node.
+@@ -707,6 +728,11 @@ func (e *escaper) escapeText(c context, n *parse.TextNode) context {
+			b.Write(s[written:cs])
+			written = i1
+		}
++		if isInScriptLiteral(c.state) && containsSpecialScriptTag(s[i:i1]) {
++			b.Write(s[written:i])
++			b.Write(escapeSpecialScriptTags(s[i:i1]))
++			written = i1
++		}
+		if i == i1 && c.state == c1.state {
+			panic(fmt.Sprintf("infinite loop from %v to %v on %q..%q", c, c1, s[:i], s[i:]))
+		}
+diff --git a/src/html/template/escape_test.go b/src/html/template/escape_test.go
+index 4f48afe..7853daa 100644
+--- a/src/html/template/escape_test.go
++++ b/src/html/template/escape_test.go
+@@ -503,6 +503,21 @@ func TestEscape(t *testing.T) {
+			"<script>var a/*b*///c\nd</script>",
+			"<script>var a \nd</script>",
+		},
++		{
++			"Special tags in <script> string literals",
++			`<script>var a = "asd < 123 <!-- 456 < fgh <script jkl < 789 </script"</script>`,
++			`<script>var a = "asd < 123 \x3C!-- 456 < fgh \x3Cscript jkl < 789 \x3C/script"</script>`,
++		},
++		{
++			"Special tags in <script> string literals (mixed case)",
++			`<script>var a = "<!-- <ScripT </ScripT"</script>`,
++			`<script>var a = "\x3C!-- \x3CScripT \x3C/ScripT"</script>`,
++		},
++		{
++			"Special tags in <script> regex literals (mixed case)",
++			`<script>var a = /<!-- <ScripT </ScripT/</script>`,
++			`<script>var a = /\x3C!-- \x3CScripT \x3C/ScripT/</script>`,
++		},
+		{
+			"CSS comments",
+			"<style>p// paragraph\n" +
+@@ -1491,8 +1506,38 @@ func TestEscapeText(t *testing.T) {
+			context{state: stateJS, element: elementScript},
+		},
+		{
++			// <script and </script tags are escaped, so </script> should not
++			// cause us to exit the JS state.
+			`<script>document.write("<script>alert(1)</script>");`,
+-			context{state: stateText},
++			context{state: stateJS, element: elementScript},
++		},
++		{
++			`<script>document.write("<script>`,
++			context{state: stateJSDqStr, element: elementScript},
++		},
++		{
++			`<script>document.write("<script>alert(1)</script>`,
++			context{state: stateJSDqStr, element: elementScript},
++		},
++		{
++			`<script>document.write("<script>alert(1)<!--`,
++			context{state: stateJSDqStr, element: elementScript},
++		},
++		{
++			`<script>document.write("<script>alert(1)</Script>");`,
++			context{state: stateJS, element: elementScript},
++		},
++		{
++			`<script>document.write("<!--");`,
++			context{state: stateJS, element: elementScript},
++		},
++		{
++			`<script>let a = /</script`,
++			context{state: stateJSRegexp, element: elementScript},
++		},
++		{
++			`<script>let a = /</script/`,
++			context{state: stateJS, element: elementScript, jsCtx: jsCtxDivOp},
+		},
+		{
+			`<script type="text/template">`,
+diff --git a/src/html/template/transition.go b/src/html/template/transition.go
+index 92eb351..e2660cc 100644
+--- a/src/html/template/transition.go
++++ b/src/html/template/transition.go
+@@ -212,6 +212,11 @@ var (
+ // element states.
+ func tSpecialTagEnd(c context, s []byte) (context, int) {
+	if c.element != elementNone {
++		// script end tags ("</script") within script literals are ignored, so that
++		// we can properly escape them.
++		if c.element == elementScript && (isInScriptLiteral(c.state) || isComment(c.state)) {
++			return c, len(s)
++		}
+		if i := indexTagEnd(s, specialTagEndMarkers[c.element]); i != -1 {
+			return context{}, i
+		}
+@@ -331,6 +336,16 @@ func tJSDelimited(c context, s []byte) (context, int) {
+			inCharset = true
+		case ']':
+			inCharset = false
++		case '/':
++			// If "</script" appears in a regex literal, the '/' should not
++			// close the regex literal, and it will later be escaped to
++			// "\x3C/script" in escapeText.
++			if i > 0 && i+7 <= len(s) && bytes.Compare(bytes.ToLower(s[i-1:i+7]), []byte("</script")) == 0 {
++				i++
++			} else if !inCharset {
++				c.state, c.jsCtx = stateJS, jsCtxDivOp
++				return c, i + 1
++			}
+		default:
+			// end delimiter
+			if !inCharset {
+--
+2.40.0
-- 
2.40.0


