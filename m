Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AA2C46467
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 14:58:15 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.15110.1671202682004738349
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 06:58:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=y0PIBwok;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id a9so2550190pld.7
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 06:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fahoIAAtpI175Nln87p7HAaV8p4bMtNzGfdx/66zfdI=;
        b=y0PIBwokb2GTma/TB1luQg/sbGOgcwMc1vtKu4wsuWrvnHKChpG6a9KIY/Qv0FdiXU
         BlK8NKnrfkr25zBIy7dZ3Cna0EA6ScGkrpm6ntIAle/QOzG0WjnlG5r3lfRI6EfNnHYp
         D8hvRH1DWUbPvoZB0qW1boeVnpbNb7Ob/NKi5Ps0AS9mF1+osx3nAOsuffrweIfh6/HC
         RLQydW8jZ4CNpq+171S8g2EDZoGja0uTVdbZOkw6D9xN5oUyqu5j/qWJm20Nl7be0vuK
         UJo26sq66uJonoGzkYK7lSTqav5RtygkbyOKLYP7jHnPaFEmFO+GXYuEXXkvPC9GtRYr
         8idg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fahoIAAtpI175Nln87p7HAaV8p4bMtNzGfdx/66zfdI=;
        b=p5UqKBpkZ4gD98zaxrTrNgiRTA4o2avtmXkhImD8+10JRikEfKLVYePYRx4/uJuBCy
         yYmot18AdC3k4loIlYtRL2c5wCKKz0vPjDOXgq+z2DiiBSHIOt5cH6R5IGQpG9JpRsRV
         Idao/kLtPtZfMhZbIHHAsxXTODdYC1zNBqgTQG3bBt7bFuIgzC7+lxwP2TCTdMB+wYI5
         BF8sSChRxfpootPP73bnwhVYL52SyoGxEdJMlL/K9SS90jr0rFs4uhCFZqOFrarvrfLs
         aVOZ0WV1383T+LAdHWr8+Ujq8DvQsQRRAxeK3Ya0e7U8yahyLFE8HpOuDj3REPen43qk
         IPEg==
X-Gm-Message-State: ANoB5pmfc7eljzrVvFZtM8fIB1V3jrOTtLDBGVFq9UGCn2yRedDA9qTk
	+XPyP0QRBnZtL2KC1EobCqx2VRwMovtAbidEzQ4=
X-Google-Smtp-Source: AA0mqf7extqmwjZ+4PhRArwCfR+aSkHBhRXdGSq25rkGYWp+JQbyPaNbkspMF4K68Sz+LWU7WUNyrg==
X-Received: by 2002:a17:90a:3188:b0:219:3e5f:2a65 with SMTP id j8-20020a17090a318800b002193e5f2a65mr33916218pjb.36.1671202692832;
        Fri, 16 Dec 2022 06:58:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r21-20020a17090b051500b00219eefe47c7sm1482230pjz.47.2022.12.16.06.58.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 06:58:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/13] golang: CVE-2022-41715 regexp/syntax: limit memory used by parsing regexps
Date: Fri, 16 Dec 2022 04:57:46 -1000
Message-Id: <2470c52db633f206dbfcd049fcca828d1ff5f82a.1671202568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671202568.git.steve@sakoman.com>
References: <cover.1671202568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 14:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174751

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/golang/go/commit/e9017c2416ad0ef642f5e0c2eab2dbf3cba4d997

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-41715.patch           | 271 ++++++++++++++++++
 2 files changed, 272 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41715.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index cec37c1b09..b4a137b8c8 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -49,6 +49,7 @@ SRC_URI += "\
     file://CVE-2022-24921.patch \
     file://CVE-2022-28131.patch \
     file://CVE-2022-28327.patch \
+    file://CVE-2022-41715.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-41715.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-41715.patch
new file mode 100644
index 0000000000..fac0ebe94c
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-41715.patch
@@ -0,0 +1,271 @@
+From e9017c2416ad0ef642f5e0c2eab2dbf3cba4d997 Mon Sep 17 00:00:00 2001
+From: Russ Cox <rsc@golang.org>
+Date: Wed, 28 Sep 2022 11:18:51 -0400
+Subject: [PATCH] [release-branch.go1.18] regexp: limit size of parsed regexps
+
+Set a 128 MB limit on the amount of space used by []syntax.Inst
+in the compiled form corresponding to a given regexp.
+
+Also set a 128 MB limit on the rune storage in the *syntax.Regexp
+tree itself.
+
+Thanks to Adam Korczynski (ADA Logics) and OSS-Fuzz for reporting this issue.
+
+Fixes CVE-2022-41715.
+Updates #55949.
+Fixes #55950.
+
+Change-Id: Ia656baed81564436368cf950e1c5409752f28e1b
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1592136
+TryBot-Result: Security TryBots <security-trybots@go-security-trybots.iam.gserviceaccount.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/438501
+Run-TryBot: Carlos Amedee <carlos@golang.org>
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Reviewed-by: Dmitri Shuralyov <dmitshur@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/e9017c2416ad0ef642f5e0c2eab2dbf3cba4d997]
+CVE: CVE-2022-41715
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+---
+ src/regexp/syntax/parse.go      | 145 ++++++++++++++++++++++++++++++--
+ src/regexp/syntax/parse_test.go |  13 +--
+ 2 files changed, 148 insertions(+), 10 deletions(-)
+
+diff --git a/src/regexp/syntax/parse.go b/src/regexp/syntax/parse.go
+index 55bd20d..60491d5 100644
+--- a/src/regexp/syntax/parse.go
++++ b/src/regexp/syntax/parse.go
+@@ -90,15 +90,49 @@ const (
+ // until we've allocated at least maxHeight Regexp structures.
+ const maxHeight = 1000
+ 
++// maxSize is the maximum size of a compiled regexp in Insts.
++// It too is somewhat arbitrarily chosen, but the idea is to be large enough
++// to allow significant regexps while at the same time small enough that
++// the compiled form will not take up too much memory.
++// 128 MB is enough for a 3.3 million Inst structures, which roughly
++// corresponds to a 3.3 MB regexp.
++const (
++	maxSize  = 128 << 20 / instSize
++	instSize = 5 * 8 // byte, 2 uint32, slice is 5 64-bit words
++)
++
++// maxRunes is the maximum number of runes allowed in a regexp tree
++// counting the runes in all the nodes.
++// Ignoring character classes p.numRunes is always less than the length of the regexp.
++// Character classes can make it much larger: each \pL adds 1292 runes.
++// 128 MB is enough for 32M runes, which is over 26k \pL instances.
++// Note that repetitions do not make copies of the rune slices,
++// so \pL{1000} is only one rune slice, not 1000.
++// We could keep a cache of character classes we've seen,
++// so that all the \pL we see use the same rune list,
++// but that doesn't remove the problem entirely:
++// consider something like [\pL01234][\pL01235][\pL01236]...[\pL^&*()].
++// And because the Rune slice is exposed directly in the Regexp,
++// there is not an opportunity to change the representation to allow
++// partial sharing between different character classes.
++// So the limit is the best we can do.
++const (
++	maxRunes = 128 << 20 / runeSize
++	runeSize = 4 // rune is int32
++)
++
+ type parser struct {
+ 	flags       Flags     // parse mode flags
+ 	stack       []*Regexp // stack of parsed expressions
+ 	free        *Regexp
+ 	numCap      int // number of capturing groups seen
+ 	wholeRegexp string
+-	tmpClass    []rune          // temporary char class work space
+-	numRegexp   int             // number of regexps allocated
+-	height      map[*Regexp]int // regexp height for height limit check
++	tmpClass    []rune            // temporary char class work space
++	numRegexp   int               // number of regexps allocated
++	numRunes    int               // number of runes in char classes
++	repeats     int64             // product of all repetitions seen
++	height      map[*Regexp]int   // regexp height, for height limit check
++	size        map[*Regexp]int64 // regexp compiled size, for size limit check
+ }
+ 
+ func (p *parser) newRegexp(op Op) *Regexp {
+@@ -122,6 +156,104 @@ func (p *parser) reuse(re *Regexp) {
+ 	p.free = re
+ }
+ 
++func (p *parser) checkLimits(re *Regexp) {
++	if p.numRunes > maxRunes {
++		panic(ErrInternalError)
++	}
++	p.checkSize(re)
++	p.checkHeight(re)
++}
++
++func (p *parser) checkSize(re *Regexp) {
++	if p.size == nil {
++		// We haven't started tracking size yet.
++		// Do a relatively cheap check to see if we need to start.
++		// Maintain the product of all the repeats we've seen
++		// and don't track if the total number of regexp nodes
++		// we've seen times the repeat product is in budget.
++		if p.repeats == 0 {
++			p.repeats = 1
++		}
++		if re.Op == OpRepeat {
++			n := re.Max
++			if n == -1 {
++				n = re.Min
++			}
++			if n <= 0 {
++				n = 1
++			}
++			if int64(n) > maxSize/p.repeats {
++				p.repeats = maxSize
++			} else {
++				p.repeats *= int64(n)
++			}
++		}
++		if int64(p.numRegexp) < maxSize/p.repeats {
++			return
++		}
++
++		// We need to start tracking size.
++		// Make the map and belatedly populate it
++		// with info about everything we've constructed so far.
++		p.size = make(map[*Regexp]int64)
++		for _, re := range p.stack {
++			p.checkSize(re)
++		}
++	}
++
++	if p.calcSize(re, true) > maxSize {
++		panic(ErrInternalError)
++	}
++}
++
++func (p *parser) calcSize(re *Regexp, force bool) int64 {
++	if !force {
++		if size, ok := p.size[re]; ok {
++			return size
++		}
++	}
++
++	var size int64
++	switch re.Op {
++	case OpLiteral:
++		size = int64(len(re.Rune))
++	case OpCapture, OpStar:
++		// star can be 1+ or 2+; assume 2 pessimistically
++		size = 2 + p.calcSize(re.Sub[0], false)
++	case OpPlus, OpQuest:
++		size = 1 + p.calcSize(re.Sub[0], false)
++	case OpConcat:
++		for _, sub := range re.Sub {
++			size += p.calcSize(sub, false)
++		}
++	case OpAlternate:
++		for _, sub := range re.Sub {
++			size += p.calcSize(sub, false)
++		}
++		if len(re.Sub) > 1 {
++			size += int64(len(re.Sub)) - 1
++		}
++	case OpRepeat:
++		sub := p.calcSize(re.Sub[0], false)
++		if re.Max == -1 {
++			if re.Min == 0 {
++				size = 2 + sub // x*
++			} else {
++				size = 1 + int64(re.Min)*sub // xxx+
++			}
++			break
++		}
++		// x{2,5} = xx(x(x(x)?)?)?
++		size = int64(re.Max)*sub + int64(re.Max-re.Min)
++	}
++
++	if size < 1 {
++		size = 1
++	}
++	p.size[re] = size
++	return size
++}
++
+ func (p *parser) checkHeight(re *Regexp) {
+ 	if p.numRegexp < maxHeight {
+ 		return
+@@ -158,6 +290,7 @@ func (p *parser) calcHeight(re *Regexp, force bool) int {
+ 
+ // push pushes the regexp re onto the parse stack and returns the regexp.
+ func (p *parser) push(re *Regexp) *Regexp {
++	p.numRunes += len(re.Rune)
+ 	if re.Op == OpCharClass && len(re.Rune) == 2 && re.Rune[0] == re.Rune[1] {
+ 		// Single rune.
+ 		if p.maybeConcat(re.Rune[0], p.flags&^FoldCase) {
+@@ -189,7 +322,7 @@ func (p *parser) push(re *Regexp) *Regexp {
+ 	}
+ 
+ 	p.stack = append(p.stack, re)
+-	p.checkHeight(re)
++	p.checkLimits(re)
+ 	return re
+ }
+ 
+@@ -305,7 +438,7 @@ func (p *parser) repeat(op Op, min, max int, before, after, lastRepeat string) (
+ 	re.Sub = re.Sub0[:1]
+ 	re.Sub[0] = sub
+ 	p.stack[n-1] = re
+-	p.checkHeight(re)
++	p.checkLimits(re)
+ 
+ 	if op == OpRepeat && (min >= 2 || max >= 2) && !repeatIsValid(re, 1000) {
+ 		return "", &Error{ErrInvalidRepeatSize, before[:len(before)-len(after)]}
+@@ -509,6 +642,7 @@ func (p *parser) factor(sub []*Regexp) []*Regexp {
+ 
+ 			for j := start; j < i; j++ {
+ 				sub[j] = p.removeLeadingString(sub[j], len(str))
++				p.checkLimits(sub[j])
+ 			}
+ 			suffix := p.collapse(sub[start:i], OpAlternate) // recurse
+ 
+@@ -566,6 +700,7 @@ func (p *parser) factor(sub []*Regexp) []*Regexp {
+ 			for j := start; j < i; j++ {
+ 				reuse := j != start // prefix came from sub[start]
+ 				sub[j] = p.removeLeadingRegexp(sub[j], reuse)
++				p.checkLimits(sub[j])
+ 			}
+ 			suffix := p.collapse(sub[start:i], OpAlternate) // recurse
+ 
+diff --git a/src/regexp/syntax/parse_test.go b/src/regexp/syntax/parse_test.go
+index 1ef6d8a..67e3c56 100644
+--- a/src/regexp/syntax/parse_test.go
++++ b/src/regexp/syntax/parse_test.go
+@@ -484,12 +484,15 @@ var invalidRegexps = []string{
+ 	`(?P<>a)`,
+ 	`[a-Z]`,
+ 	`(?i)[a-Z]`,
+-	`a{100000}`,
+-	`a{100000,}`,
+-	"((((((((((x{2}){2}){2}){2}){2}){2}){2}){2}){2}){2})",
+-	strings.Repeat("(", 1000) + strings.Repeat(")", 1000),
+-	strings.Repeat("(?:", 1000) + strings.Repeat(")*", 1000),
+ 	`\Q\E*`,
++	`a{100000}`,  // too much repetition
++	`a{100000,}`, // too much repetition
++	"((((((((((x{2}){2}){2}){2}){2}){2}){2}){2}){2}){2})",    // too much repetition
++	strings.Repeat("(", 1000) + strings.Repeat(")", 1000),    // too deep
++	strings.Repeat("(?:", 1000) + strings.Repeat(")*", 1000), // too deep
++	"(" + strings.Repeat("(xx?)", 1000) + "){1000}",          // too long
++	strings.Repeat("(xx?){1000}", 1000),                      // too long
++	strings.Repeat(`\pL`, 27000),                             // too many runes
+ }
+ 
+ var onlyPerl = []string{
+-- 
+2.25.1
+
-- 
2.25.1


