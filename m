Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DE6C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 15:47:36 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.web11.7963.1667404045756475080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 08:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=dHmt75Uy;
 spf=pass (domain: gmail.com, ip: 209.85.221.173, mailfrom: sakoman@gmail.com)
Received: by mail-vk1-f173.google.com with SMTP id g26so9148094vkm.12
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 08:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=24jP/onSzIiMPUF27jxxQI2f8KWp5ingB5nPX3o73FI=;
        b=dHmt75UysxstrOzj044EVN0djXtr5YMBKYaq3P0IPLz3d/424fyCzNF0qDraetPz58
         81tk5Qp6lhgaf+VuJKy/5a8OJy/ZgfD5+ajt2YxXQnuFXj77mlgaaUsPsHft9/JaHRbF
         SRUGrj6Bd5LkU7xQL6BVyAmAbFonhdy3cU8jKRs9OBeVU8X3lJmfRKYPbwFcZcZHJSmS
         AHgnwsMuH8qJOlAtW6d8QDtQyFFUI0M/f9KzFntGnqBoQViyT/EAcZUK/o9+4TQI5vvu
         h0Ua16N9C2u4b4kxK1KJ0dprzEwgvGCfXn4ckFkrWU0+pj/GKYLPJzPEaAITEu5G9bIp
         1C3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24jP/onSzIiMPUF27jxxQI2f8KWp5ingB5nPX3o73FI=;
        b=aedDA9maali8oNAknJ/9TSsnreToo/wyo4eBCjLxqcI4PsZueIFiHGvL1V9FjJ7XhL
         HE4MoM5/qXQHufLGl8tza9/N4p2h6OPJaOGFC/2+QmYln2h1ZmgAEi5BWAfhbKHriyVB
         P2VFacFZZu2fC75kOwCCR8vYecfEcvahEc1tplN9cpOHjpY9+qOGldxFVTYUAduWg+Zg
         Tsviqb4ZbtUEJeZHC+pWubJgScdlLzmgRNIO3xccvWur3Z0QLUS/ehsefdr1ICbI0Swm
         qMQg7g4dHwpjZ15r6hIhM9b1hV3J5cNVFk7Za7pVuMmYoy+sm90cp2DoW72QCirt2fDk
         mo2Q==
X-Gm-Message-State: ACrzQf18jaBGrjLNXOaC2i9Txe7b+1AWqS7p/9xCcxPnLHl7/86ii+C7
	cIN+T4syvsDLik79bfeZgRId8lemE+e2Nr2lcRw=
X-Google-Smtp-Source: AMsMyM4iXLtL9Ws1kpiuSXTd06092AVQh/dX/nfW/GY3uT5uS7UOpRul9qkUX6RpV0PXKaBdHYIPweIk/41IGF86G0k=
X-Received: by 2002:a1f:aa42:0:b0:3ab:81ee:8fa9 with SMTP id
 t63-20020a1faa42000000b003ab81ee8fa9mr12285497vke.17.1667404044483; Wed, 02
 Nov 2022 08:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221102112417.53713-1-hprajapati@mvista.com>
In-Reply-To: <20221102112417.53713-1-hprajapati@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 2 Nov 2022 05:47:13 -1000
Message-ID: <CAGDS+nnmSACBBwCntqb4B4ZfwON4cM=n81EdQU2J7SyaG9NYGw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] golang: CVE-2022-41715 regexp/syntax:
 limit memory used by parsing regexps
To: Hitendra Prajapati <hprajapati@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 15:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172595

This is failing in do_patch on the autobuilder:

ERROR: Applying patch 'CVE-2022-41715.patch' on target directory
'TOPDIR/tmp/work/x86_64-linux/go-native/1.14.15-r0/go'
Command Error: 'quilt --quiltrc
TOPDIR/tmp/work/x86_64-linux/go-native/1.14.15-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch CVE-2022-41715.patch
patching file src/regexp/syntax/parse.go
Hunk #1 FAILED at 90.
Hunk #2 FAILED at 122.
Hunk #3 succeeded at 106 (offset -52 lines).
Hunk #4 FAILED at 190.
Hunk #5 FAILED at 306.
Hunk #6 succeeded at 456 (offset -54 lines).
Hunk #7 succeeded at 514 (offset -54 lines).
4 out of 7 hunks FAILED -- rejects in file src/regexp/syntax/parse.go
patching file src/regexp/syntax/parse_test.go
Hunk #1 FAILED at 484.
1 out of 1 hunk FAILED -- rejects in file src/regexp/syntax/parse_test.go
Patch CVE-2022-41715.patch does not apply (enforce with -f)
DEBUG: Python function patch_do_patch finished
DEBUG: Python function do_patch finished

Details of all failures:

https://errors.yoctoproject.org/Errors/Build/154397/

Steve

On Wed, Nov 2, 2022 at 1:24 AM Hitendra Prajapati <hprajapati@mvista.com> wrote:
>
> Upstream-Status: Backport from https://github.com/golang/go/commit/e9017c2416ad0ef642f5e0c2eab2dbf3cba4d997
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  meta/recipes-devtools/go/go-1.14.inc          |   1 +
>  .../go/go-1.14/CVE-2022-41715.patch           | 253 ++++++++++++++++++
>  2 files changed, 254 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41715.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
> index 3341beb159..bae8eb8398 100644
> --- a/meta/recipes-devtools/go/go-1.14.inc
> +++ b/meta/recipes-devtools/go/go-1.14.inc
> @@ -42,6 +42,7 @@ SRC_URI += "\
>      file://0003-CVE-2022-32190.patch \
>      file://0004-CVE-2022-32190.patch \
>      file://CVE-2022-2880.patch \
> +    file://CVE-2022-41715.patch \
>  "
>
>  SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-41715.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-41715.patch
> new file mode 100644
> index 0000000000..e0bfbaa55f
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-41715.patch
> @@ -0,0 +1,253 @@
> +From db39634158a68c19c8821323fe855643d11cedfc Mon Sep 17 00:00:00 2001
> +From: Hitendra Prajapati <hprajapati@mvista.com>
> +Date: Wed, 2 Nov 2022 10:55:30 +0530
> +Subject: [PATCH] CVE-2022-41715
> +
> +Upstream-Status: Backport [https://github.com/golang/go/commit/e9017c2416ad0ef642f5e0c2eab2dbf3cba4d997]
> +CVE: CVE-2022-41715
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +
> +regexp: limit size of parsed regexps
> +
> +Set a 128 MB limit on the amount of space used by []syntax.Inst
> +in the compiled form corresponding to a given regexp.
> +
> +Also set a 128 MB limit on the rune storage in the *syntax.Regexp
> +tree itself.
> +---
> + src/regexp/syntax/parse.go      | 145 ++++++++++++++++++++++++++++++--
> + src/regexp/syntax/parse_test.go |  13 +--
> + 2 files changed, 148 insertions(+), 10 deletions(-)
> +
> +diff --git a/src/regexp/syntax/parse.go b/src/regexp/syntax/parse.go
> +index 55bd20d..60491d5 100644
> +--- a/src/regexp/syntax/parse.go
> ++++ b/src/regexp/syntax/parse.go
> +@@ -90,15 +90,49 @@ const (
> + // until we've allocated at least maxHeight Regexp structures.
> + const maxHeight = 1000
> +
> ++// maxSize is the maximum size of a compiled regexp in Insts.
> ++// It too is somewhat arbitrarily chosen, but the idea is to be large enough
> ++// to allow significant regexps while at the same time small enough that
> ++// the compiled form will not take up too much memory.
> ++// 128 MB is enough for a 3.3 million Inst structures, which roughly
> ++// corresponds to a 3.3 MB regexp.
> ++const (
> ++      maxSize  = 128 << 20 / instSize
> ++      instSize = 5 * 8 // byte, 2 uint32, slice is 5 64-bit words
> ++)
> ++
> ++// maxRunes is the maximum number of runes allowed in a regexp tree
> ++// counting the runes in all the nodes.
> ++// Ignoring character classes p.numRunes is always less than the length of the regexp.
> ++// Character classes can make it much larger: each \pL adds 1292 runes.
> ++// 128 MB is enough for 32M runes, which is over 26k \pL instances.
> ++// Note that repetitions do not make copies of the rune slices,
> ++// so \pL{1000} is only one rune slice, not 1000.
> ++// We could keep a cache of character classes we've seen,
> ++// so that all the \pL we see use the same rune list,
> ++// but that doesn't remove the problem entirely:
> ++// consider something like [\pL01234][\pL01235][\pL01236]...[\pL^&*()].
> ++// And because the Rune slice is exposed directly in the Regexp,
> ++// there is not an opportunity to change the representation to allow
> ++// partial sharing between different character classes.
> ++// So the limit is the best we can do.
> ++const (
> ++      maxRunes = 128 << 20 / runeSize
> ++      runeSize = 4 // rune is int32
> ++)
> ++
> + type parser struct {
> +       flags       Flags     // parse mode flags
> +       stack       []*Regexp // stack of parsed expressions
> +       free        *Regexp
> +       numCap      int // number of capturing groups seen
> +       wholeRegexp string
> +-      tmpClass    []rune          // temporary char class work space
> +-      numRegexp   int             // number of regexps allocated
> +-      height      map[*Regexp]int // regexp height for height limit check
> ++      tmpClass    []rune            // temporary char class work space
> ++      numRegexp   int               // number of regexps allocated
> ++      numRunes    int               // number of runes in char classes
> ++      repeats     int64             // product of all repetitions seen
> ++      height      map[*Regexp]int   // regexp height, for height limit check
> ++      size        map[*Regexp]int64 // regexp compiled size, for size limit check
> + }
> +
> + func (p *parser) newRegexp(op Op) *Regexp {
> +@@ -122,6 +156,104 @@ func (p *parser) reuse(re *Regexp) {
> +       p.free = re
> + }
> +
> ++func (p *parser) checkLimits(re *Regexp) {
> ++      if p.numRunes > maxRunes {
> ++              panic(ErrInternalError)
> ++      }
> ++      p.checkSize(re)
> ++      p.checkHeight(re)
> ++}
> ++
> ++func (p *parser) checkSize(re *Regexp) {
> ++      if p.size == nil {
> ++              // We haven't started tracking size yet.
> ++              // Do a relatively cheap check to see if we need to start.
> ++              // Maintain the product of all the repeats we've seen
> ++              // and don't track if the total number of regexp nodes
> ++              // we've seen times the repeat product is in budget.
> ++              if p.repeats == 0 {
> ++                      p.repeats = 1
> ++              }
> ++              if re.Op == OpRepeat {
> ++                      n := re.Max
> ++                      if n == -1 {
> ++                              n = re.Min
> ++                      }
> ++                      if n <= 0 {
> ++                              n = 1
> ++                      }
> ++                      if int64(n) > maxSize/p.repeats {
> ++                              p.repeats = maxSize
> ++                      } else {
> ++                              p.repeats *= int64(n)
> ++                      }
> ++              }
> ++              if int64(p.numRegexp) < maxSize/p.repeats {
> ++                      return
> ++              }
> ++
> ++              // We need to start tracking size.
> ++              // Make the map and belatedly populate it
> ++              // with info about everything we've constructed so far.
> ++              p.size = make(map[*Regexp]int64)
> ++              for _, re := range p.stack {
> ++                      p.checkSize(re)
> ++              }
> ++      }
> ++
> ++      if p.calcSize(re, true) > maxSize {
> ++              panic(ErrInternalError)
> ++      }
> ++}
> ++
> ++func (p *parser) calcSize(re *Regexp, force bool) int64 {
> ++      if !force {
> ++              if size, ok := p.size[re]; ok {
> ++                      return size
> ++              }
> ++      }
> ++
> ++      var size int64
> ++      switch re.Op {
> ++      case OpLiteral:
> ++              size = int64(len(re.Rune))
> ++      case OpCapture, OpStar:
> ++              // star can be 1+ or 2+; assume 2 pessimistically
> ++              size = 2 + p.calcSize(re.Sub[0], false)
> ++      case OpPlus, OpQuest:
> ++              size = 1 + p.calcSize(re.Sub[0], false)
> ++      case OpConcat:
> ++              for _, sub := range re.Sub {
> ++                      size += p.calcSize(sub, false)
> ++              }
> ++      case OpAlternate:
> ++              for _, sub := range re.Sub {
> ++                      size += p.calcSize(sub, false)
> ++              }
> ++              if len(re.Sub) > 1 {
> ++                      size += int64(len(re.Sub)) - 1
> ++              }
> ++      case OpRepeat:
> ++              sub := p.calcSize(re.Sub[0], false)
> ++              if re.Max == -1 {
> ++                      if re.Min == 0 {
> ++                              size = 2 + sub // x*
> ++                      } else {
> ++                              size = 1 + int64(re.Min)*sub // xxx+
> ++                      }
> ++                      break
> ++              }
> ++              // x{2,5} = xx(x(x(x)?)?)?
> ++              size = int64(re.Max)*sub + int64(re.Max-re.Min)
> ++      }
> ++
> ++      if size < 1 {
> ++              size = 1
> ++      }
> ++      p.size[re] = size
> ++      return size
> ++}
> ++
> + func (p *parser) checkHeight(re *Regexp) {
> +       if p.numRegexp < maxHeight {
> +               return
> +@@ -158,6 +290,7 @@ func (p *parser) calcHeight(re *Regexp, force bool) int {
> +
> + // push pushes the regexp re onto the parse stack and returns the regexp.
> + func (p *parser) push(re *Regexp) *Regexp {
> ++      p.numRunes += len(re.Rune)
> +       if re.Op == OpCharClass && len(re.Rune) == 2 && re.Rune[0] == re.Rune[1] {
> +               // Single rune.
> +               if p.maybeConcat(re.Rune[0], p.flags&^FoldCase) {
> +@@ -189,7 +322,7 @@ func (p *parser) push(re *Regexp) *Regexp {
> +       }
> +
> +       p.stack = append(p.stack, re)
> +-      p.checkHeight(re)
> ++      p.checkLimits(re)
> +       return re
> + }
> +
> +@@ -305,7 +438,7 @@ func (p *parser) repeat(op Op, min, max int, before, after, lastRepeat string) (
> +       re.Sub = re.Sub0[:1]
> +       re.Sub[0] = sub
> +       p.stack[n-1] = re
> +-      p.checkHeight(re)
> ++      p.checkLimits(re)
> +
> +       if op == OpRepeat && (min >= 2 || max >= 2) && !repeatIsValid(re, 1000) {
> +               return "", &Error{ErrInvalidRepeatSize, before[:len(before)-len(after)]}
> +@@ -509,6 +642,7 @@ func (p *parser) factor(sub []*Regexp) []*Regexp {
> +
> +                       for j := start; j < i; j++ {
> +                               sub[j] = p.removeLeadingString(sub[j], len(str))
> ++                              p.checkLimits(sub[j])
> +                       }
> +                       suffix := p.collapse(sub[start:i], OpAlternate) // recurse
> +
> +@@ -566,6 +700,7 @@ func (p *parser) factor(sub []*Regexp) []*Regexp {
> +                       for j := start; j < i; j++ {
> +                               reuse := j != start // prefix came from sub[start]
> +                               sub[j] = p.removeLeadingRegexp(sub[j], reuse)
> ++                              p.checkLimits(sub[j])
> +                       }
> +                       suffix := p.collapse(sub[start:i], OpAlternate) // recurse
> +
> +diff --git a/src/regexp/syntax/parse_test.go b/src/regexp/syntax/parse_test.go
> +index 1ef6d8a..67e3c56 100644
> +--- a/src/regexp/syntax/parse_test.go
> ++++ b/src/regexp/syntax/parse_test.go
> +@@ -484,12 +484,15 @@ var invalidRegexps = []string{
> +       `(?P<>a)`,
> +       `[a-Z]`,
> +       `(?i)[a-Z]`,
> +-      `a{100000}`,
> +-      `a{100000,}`,
> +-      "((((((((((x{2}){2}){2}){2}){2}){2}){2}){2}){2}){2})",
> +-      strings.Repeat("(", 1000) + strings.Repeat(")", 1000),
> +-      strings.Repeat("(?:", 1000) + strings.Repeat(")*", 1000),
> +       `\Q\E*`,
> ++      `a{100000}`,  // too much repetition
> ++      `a{100000,}`, // too much repetition
> ++      "((((((((((x{2}){2}){2}){2}){2}){2}){2}){2}){2}){2})",    // too much repetition
> ++      strings.Repeat("(", 1000) + strings.Repeat(")", 1000),    // too deep
> ++      strings.Repeat("(?:", 1000) + strings.Repeat(")*", 1000), // too deep
> ++      "(" + strings.Repeat("(xx?)", 1000) + "){1000}",          // too long
> ++      strings.Repeat("(xx?){1000}", 1000),                      // too long
> ++      strings.Repeat(`\pL`, 27000),                             // too many runes
> + }
> +
> + var onlyPerl = []string{
> +--
> +2.25.1
> +
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172585): https://lists.openembedded.org/g/openembedded-core/message/172585
> Mute This Topic: https://lists.openembedded.org/mt/94731679/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

