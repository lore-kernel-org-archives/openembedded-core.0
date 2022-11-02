Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA82C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 11:24:34 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.4977.1667388266209240667
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 04:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gSxEzelL;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id 4so16306471pli.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 04:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qVSFJ9cCE1b0ZbXHzK8CnrbO2QLEdx4iXgXM7ZNHqJw=;
        b=gSxEzelLcuS8VLjQwctRT8gAS7N49KF6P/S+P06On01Kvahn5COuo1WmZwp3n2fiNr
         FlgOP5doFo1Aq6tKp7BDbPIuJFt/zdRjMXov9Cn1pPGibFj7RKth+EoW/bwxk/w1EHT5
         /f7U/AgdvjBzHMSbRQitlvrJ9u6CJKOOMQPFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVSFJ9cCE1b0ZbXHzK8CnrbO2QLEdx4iXgXM7ZNHqJw=;
        b=BNf5xJtLWPH8jdw/OtjxI+WAjKfPCoCY/Y8PIN1dfsT2HmDkfmJExRmkw9Ye80/kdu
         U+oJZytXb/h6ya8/gY6lGi39Gy5mv3sh4N73fl/rXTclAAttZJpXr4h/SbT8CJF0aYxy
         oE55uyYDvooEuXkRDmM2L34DZcxfpE36j0neIZRKWQ/kjvtwpuO63HhCSoleO/Xflx2S
         k7NQ9ZF6zIAI+nbRk5C8DsHrXuYN+tsmi4WqzwqecvVQyoDNR5VpHYI8lgSvGx0vxQ81
         lDnqlhEEdNLYiwM3tVUq0bk3uy6jUaWEELX6csQv8cyg4JxV67w9ZlFcTDbdM5Pr7Mnx
         xgNw==
X-Gm-Message-State: ACrzQf2VacxMCIOkqrFZQv+shcGGmTaelUYoEm7q9iofASXK/wBYw5hm
	V65Unhu0k0BxDezeorJMb7MwoJ7fG7ZS6Q==
X-Google-Smtp-Source: AMsMyM5Kv1xg4RxzGb4vXmS6Ys1jLuNXglrtHtcF0oc/GZSipX4XpAruYJdJ9IkHYYljWuhYitW8Eg==
X-Received: by 2002:a17:90a:4e85:b0:213:13f2:162b with SMTP id o5-20020a17090a4e8500b0021313f2162bmr25324236pjh.228.1667388265190;
        Wed, 02 Nov 2022 04:24:25 -0700 (PDT)
Received: from MVIN00024 ([27.121.101.119])
        by smtp.gmail.com with ESMTPSA id g13-20020a63200d000000b0043954df3162sm7292295pgg.10.2022.11.02.04.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 04:24:24 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Wed, 02 Nov 2022 16:54:18 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] golang: CVE-2022-41715 regexp/syntax: limit memory used by parsing regexps
Date: Wed,  2 Nov 2022 16:54:17 +0530
Message-Id: <20221102112417.53713-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 11:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172585

Upstream-Status: Backport from https://github.com/golang/go/commit/e9017c2416ad0ef642f5e0c2eab2dbf3cba4d997

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-41715.patch           | 253 ++++++++++++++++++
 2 files changed, 254 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41715.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 3341beb159..bae8eb8398 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -42,6 +42,7 @@ SRC_URI += "\
     file://0003-CVE-2022-32190.patch \
     file://0004-CVE-2022-32190.patch \
     file://CVE-2022-2880.patch \
+    file://CVE-2022-41715.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-41715.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-41715.patch
new file mode 100644
index 0000000000..e0bfbaa55f
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-41715.patch
@@ -0,0 +1,253 @@
+From db39634158a68c19c8821323fe855643d11cedfc Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Wed, 2 Nov 2022 10:55:30 +0530
+Subject: [PATCH] CVE-2022-41715
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/e9017c2416ad0ef642f5e0c2eab2dbf3cba4d997]
+CVE: CVE-2022-41715
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+regexp: limit size of parsed regexps
+
+Set a 128 MB limit on the amount of space used by []syntax.Inst
+in the compiled form corresponding to a given regexp.
+
+Also set a 128 MB limit on the rune storage in the *syntax.Regexp
+tree itself.
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


