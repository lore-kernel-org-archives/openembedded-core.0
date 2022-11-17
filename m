Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AB2C43219
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 16:55:13 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.1039.1668704109160201852
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 08:55:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PfPODC3S;
 spf=pass (domain: linaro.org, ip: 209.85.219.53, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qv1-f53.google.com with SMTP id ml12so1616650qvb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 08:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXzMad5diV45FvwRK2r6D+VT//+p4pw9Xj/C2RZt4BI=;
        b=PfPODC3SYnPionp0RWMVzdQm7EXsvaT+mwKlNs4ukYl15gPZ9NCP5Q05XlqhrZ9nug
         NyEpQikXFliJ5pnIIKIj3d44l6CldXkoIcSVhCc5pZReeLdybHMqSzekiTYtTcBCa4f3
         1TGhPLKvUdAkjUi8XLyYINMnitiybG5fX8Q41PtkAH7/YMgadUHd4oMvLI15GgZL3SKY
         vpoc++Va8WvQoKNof9mgrLwFSLXnObEEkHnYgHzRQMpoiSngB+AFjvyJnpzm2OhSxMkn
         h145t4baLMTXOZx99sw4UnlPWlcA4QPhtQtkk9ly7OgpBoPLLTGJYkDK9JrlI3JqmVAM
         72oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXzMad5diV45FvwRK2r6D+VT//+p4pw9Xj/C2RZt4BI=;
        b=HHqHWmm3yh/OYybiiipF4FA9F2UqUKYR6DsCD+/iVhFCNOOztwT3Yd77eKRDzqPqdk
         fcSYp8uf4138R4fa5Alrb3B0LODxUwSrcfnFXn2peCJEHTDD/V4UNfQYWdKTRJNJTxEU
         6mQLRH2+UcwA5eS84ctXV4C4FWeA1l29fN6b+LYuaCYFvGUVT9SUJMQjbU4HanwaKrjd
         CgMqMFIE3AhsCJflySDkRntITJdxrXIWXQDvSmI1DR3uBar4m92ndzGW8hPtnD4eM72a
         TCb3A8Q9SkhVJMv6wcXUquk0VQQCZc3Z1XH1NF5omUzvOjfeWOgk6qKH3bh32Ccho9Og
         nOTg==
X-Gm-Message-State: ANoB5pm6Ni3hVsKR5rnwjrm4hoAtZgE7gBrfXGa4Mx/fKykf1KMMjoex
	tVr8KOqh9wvPO+Z3NPd8yRFAOX0Cf2V8BQ==
X-Google-Smtp-Source: AA0mqf4v0mYcraDW3KBVcO7U70+9ZROYoNZOJr5rXc/CEBgF0B+PWrkuLYn5e7YsPxcDCHD46+5nqw==
X-Received: by 2002:a05:6214:3688:b0:4bb:9180:638f with SMTP id nl8-20020a056214368800b004bb9180638fmr3133993qvb.98.1668704108118;
        Thu, 17 Nov 2022 08:55:08 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm785081qkp.74.2022.11.17.08.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 08:55:07 -0800 (PST)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [dunfell][PATCH 04/11] golang: fix CVE-2022-24291
Date: Thu, 17 Nov 2022 11:54:49 -0500
Message-Id: <20221117165456.1029099-4-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117165456.1029099-1-ralph.siemsen@linaro.org>
References: <20221117165456.1029099-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 16:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173437

Upstream-Status: Backport [https://github.com/golang/go/commit/2b65cde5868d8245ef8a0b8eba1e361440252d3b]
CVE: CVE-2022-24921
Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-24921.patch           | 198 ++++++++++++++++++
 2 files changed, 199 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-24921.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index ae3f724c53..d670d637cd 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -45,6 +45,7 @@ SRC_URI += "\
     file://CVE-2021-33195.patch \
     file://CVE-2021-33198.patch \
     file://CVE-2021-44716.patch \
+    file://CVE-2022-24921.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-24921.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-24921.patch
new file mode 100644
index 0000000000..e4270d8a75
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-24921.patch
@@ -0,0 +1,198 @@
+From ba99f699d26483ea1045f47c760e9be30799e311 Mon Sep 17 00:00:00 2001
+From: Russ Cox <rsc@golang.org>
+Date: Wed, 2 Feb 2022 16:41:32 -0500
+Subject: [PATCH] regexp/syntax: reject very deeply nested regexps in Parse
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/2b65cde5868d8245ef8a0b8eba1e361440252d3b]
+CVE: CVE-2022-24921
+Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org
+
+
+The regexp code assumes it can recurse over the structure of
+a regexp safely. Go's growable stacks make that reasonable
+for all plausible regexps, but implausible ones can reach the
+“infinite recursion?” stack limit.
+
+This CL limits the depth of any parsed regexp to 1000.
+That is, the depth of the parse tree is required to be ≤ 1000.
+Regexps that require deeper parse trees will return ErrInternalError.
+A future CL will change the error to ErrInvalidDepth,
+but using ErrInternalError for now avoids introducing new API
+in point releases when this is backported.
+
+Fixes #51112.
+Fixes #51117.
+
+Change-Id: I97d2cd82195946eb43a4ea8561f5b95f91fb14c5
+Reviewed-on: https://go-review.googlesource.com/c/go/+/384616
+Trust: Russ Cox <rsc@golang.org>
+Run-TryBot: Russ Cox <rsc@golang.org>
+Reviewed-by: Ian Lance Taylor <iant@golang.org>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/384855
+---
+ src/regexp/syntax/parse.go      | 72 ++++++++++++++++++++++++++++++++-
+ src/regexp/syntax/parse_test.go |  7 ++++
+ 2 files changed, 77 insertions(+), 2 deletions(-)
+
+diff --git a/src/regexp/syntax/parse.go b/src/regexp/syntax/parse.go
+index 8c6d43a..55bd20d 100644
+--- a/src/regexp/syntax/parse.go
++++ b/src/regexp/syntax/parse.go
+@@ -76,13 +76,29 @@ const (
+ 	opVerticalBar
+ )
+ 
++// maxHeight is the maximum height of a regexp parse tree.
++// It is somewhat arbitrarily chosen, but the idea is to be large enough
++// that no one will actually hit in real use but at the same time small enough
++// that recursion on the Regexp tree will not hit the 1GB Go stack limit.
++// The maximum amount of stack for a single recursive frame is probably
++// closer to 1kB, so this could potentially be raised, but it seems unlikely
++// that people have regexps nested even this deeply.
++// We ran a test on Google's C++ code base and turned up only
++// a single use case with depth > 100; it had depth 128.
++// Using depth 1000 should be plenty of margin.
++// As an optimization, we don't even bother calculating heights
++// until we've allocated at least maxHeight Regexp structures.
++const maxHeight = 1000
++
+ type parser struct {
+ 	flags       Flags     // parse mode flags
+ 	stack       []*Regexp // stack of parsed expressions
+ 	free        *Regexp
+ 	numCap      int // number of capturing groups seen
+ 	wholeRegexp string
+-	tmpClass    []rune // temporary char class work space
++	tmpClass    []rune          // temporary char class work space
++	numRegexp   int             // number of regexps allocated
++	height      map[*Regexp]int // regexp height for height limit check
+ }
+ 
+ func (p *parser) newRegexp(op Op) *Regexp {
+@@ -92,16 +108,52 @@ func (p *parser) newRegexp(op Op) *Regexp {
+ 		*re = Regexp{}
+ 	} else {
+ 		re = new(Regexp)
++		p.numRegexp++
+ 	}
+ 	re.Op = op
+ 	return re
+ }
+ 
+ func (p *parser) reuse(re *Regexp) {
++	if p.height != nil {
++		delete(p.height, re)
++	}
+ 	re.Sub0[0] = p.free
+ 	p.free = re
+ }
+ 
++func (p *parser) checkHeight(re *Regexp) {
++	if p.numRegexp < maxHeight {
++		return
++	}
++	if p.height == nil {
++		p.height = make(map[*Regexp]int)
++		for _, re := range p.stack {
++			p.checkHeight(re)
++		}
++	}
++	if p.calcHeight(re, true) > maxHeight {
++		panic(ErrInternalError)
++	}
++}
++
++func (p *parser) calcHeight(re *Regexp, force bool) int {
++	if !force {
++		if h, ok := p.height[re]; ok {
++			return h
++		}
++	}
++	h := 1
++	for _, sub := range re.Sub {
++		hsub := p.calcHeight(sub, false)
++		if h < 1+hsub {
++			h = 1 + hsub
++		}
++	}
++	p.height[re] = h
++	return h
++}
++
+ // Parse stack manipulation.
+ 
+ // push pushes the regexp re onto the parse stack and returns the regexp.
+@@ -137,6 +189,7 @@ func (p *parser) push(re *Regexp) *Regexp {
+ 	}
+ 
+ 	p.stack = append(p.stack, re)
++	p.checkHeight(re)
+ 	return re
+ }
+ 
+@@ -252,6 +305,7 @@ func (p *parser) repeat(op Op, min, max int, before, after, lastRepeat string) (
+ 	re.Sub = re.Sub0[:1]
+ 	re.Sub[0] = sub
+ 	p.stack[n-1] = re
++	p.checkHeight(re)
+ 
+ 	if op == OpRepeat && (min >= 2 || max >= 2) && !repeatIsValid(re, 1000) {
+ 		return "", &Error{ErrInvalidRepeatSize, before[:len(before)-len(after)]}
+@@ -699,6 +753,21 @@ func literalRegexp(s string, flags Flags) *Regexp {
+ // Flags, and returns a regular expression parse tree. The syntax is
+ // described in the top-level comment.
+ func Parse(s string, flags Flags) (*Regexp, error) {
++	return parse(s, flags)
++}
++
++func parse(s string, flags Flags) (_ *Regexp, err error) {
++	defer func() {
++		switch r := recover(); r {
++		default:
++			panic(r)
++		case nil:
++			// ok
++		case ErrInternalError:
++			err = &Error{Code: ErrInternalError, Expr: s}
++		}
++	}()
++
+ 	if flags&Literal != 0 {
+ 		// Trivial parser for literal string.
+ 		if err := checkUTF8(s); err != nil {
+@@ -710,7 +779,6 @@ func Parse(s string, flags Flags) (*Regexp, error) {
+ 	// Otherwise, must do real work.
+ 	var (
+ 		p          parser
+-		err        error
+ 		c          rune
+ 		op         Op
+ 		lastRepeat string
+diff --git a/src/regexp/syntax/parse_test.go b/src/regexp/syntax/parse_test.go
+index 5581ba1..1ef6d8a 100644
+--- a/src/regexp/syntax/parse_test.go
++++ b/src/regexp/syntax/parse_test.go
+@@ -207,6 +207,11 @@ var parseTests = []parseTest{
+ 	// Valid repetitions.
+ 	{`((((((((((x{2}){2}){2}){2}){2}){2}){2}){2}){2}))`, ``},
+ 	{`((((((((((x{1}){2}){2}){2}){2}){2}){2}){2}){2}){2})`, ``},
++
++	// Valid nesting.
++	{strings.Repeat("(", 999) + strings.Repeat(")", 999), ``},
++	{strings.Repeat("(?:", 999) + strings.Repeat(")*", 999), ``},
++	{"(" + strings.Repeat("|", 12345) + ")", ``}, // not nested at all
+ }
+ 
+ const testFlags = MatchNL | PerlX | UnicodeGroups
+@@ -482,6 +487,8 @@ var invalidRegexps = []string{
+ 	`a{100000}`,
+ 	`a{100000,}`,
+ 	"((((((((((x{2}){2}){2}){2}){2}){2}){2}){2}){2}){2})",
++	strings.Repeat("(", 1000) + strings.Repeat(")", 1000),
++	strings.Repeat("(?:", 1000) + strings.Repeat(")*", 1000),
+ 	`\Q\E*`,
+ }
+ 
-- 
2.25.1


