Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B614C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:48:18 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.26047.1668880095767739425
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 09:48:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=zeOGdgkO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id g10so7178272plo.11
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 09:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lb+Vt/Oo6cyW5vMpaUrPJRzS8ADY7RVukKsPMH9NMb0=;
        b=zeOGdgkOx4nvo7QjG3ahuCYm8jEHM4iWMO6RHTZ++AhNjjeFdhjeB44P/u4ZO88zgb
         Q0kPeIREFQvt++Xh08iFhheRU2paljhWwfTY6HsnjlbhQ6kRjiBMAYT3e+Lg1fCWCa9A
         4Gio1E/4iS9s/uqTwR4rrkqJI+IFsNXYnV2oSeIAB/SXmZT1UZicjOO83hKDIV3y/oti
         yNrgMu+de2tr/4OAIcm6bsDeuevTLYyKytQ4ML3wSs4H5hmuw04q4jCh9PD6wq95qzMa
         +2aV5rYqPaiZazOFj+C3HwiLc8caZeYifChuOfVUqoDYHOLzBiPHoqX7pt9cQsNlhyk0
         6Puw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lb+Vt/Oo6cyW5vMpaUrPJRzS8ADY7RVukKsPMH9NMb0=;
        b=hNZmWspiSGPXJSOxJZQb2u3VDe46MOn/yRqd7yg0OZllMXEkrTs3riUbSdFKmAeus6
         VgkOPfz9tGR+mrFIjAlg1nH3aWdUkxxd0nnQv2XfQunB1Es10sR3XFvbGi0WEab0a0Mu
         GGxXgD7r12wMSgL5lk1RSTXXZbSRoQ4R6El4JvBw6c2+CC8+rGEO/V+8CkUt79HNbCcs
         P1T6fB7c/N/sa3LbU8d6yXBCQ/WxMj6aRUuoSxk2vdg2hY0MN1PkbSo4xt4mxnEbZjMl
         voCD5OqgQH1Vsew8cOsMrlrhH75D0IBtt9BmKRVx9EYfkpBtAXNeaCqXfqRWp7EayjcM
         6RDg==
X-Gm-Message-State: ANoB5pn6D4f2SF26gPPofMJrPj3F1Ce/U7hC8PZPIffhTVyfVQMORTZ3
	n8uTxvdjLRNLnNTpBXvlhG1Ruf0MPny/4mgPUwo=
X-Google-Smtp-Source: AA0mqf4TuOsRNnWlP2meAcDl6lALDKEAAAQ1i9tpYozOSLxj3AqbWyY/7ATadcHQfu7yP8OPRdqq0A==
X-Received: by 2002:a17:90a:458a:b0:214:166e:e202 with SMTP id v10-20020a17090a458a00b00214166ee202mr13360191pjg.165.1668880094674;
        Sat, 19 Nov 2022 09:48:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a668600b0020d3662cc77sm7384151pjj.48.2022.11.19.09.48.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 09:48:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/21] golang: fix CVE-2022-24291
Date: Sat, 19 Nov 2022 07:47:38 -1000
Message-Id: <25e1b1177fd0290e8b0f227ad5d609d3c9908617.1668879817.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668879817.git.steve@sakoman.com>
References: <cover.1668879817.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 17:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173528

From: Ralph Siemsen <ralph.siemsen@linaro.org>

Upstream-Status: Backport [https://github.com/golang/go/commit/2b65cde5868d8245ef8a0b8eba1e361440252d3b]
CVE: CVE-2022-24921
Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-24921.patch           | 198 ++++++++++++++++++
 2 files changed, 199 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-24921.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 73b981db2b..08eefdcb5c 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -46,6 +46,7 @@ SRC_URI += "\
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


