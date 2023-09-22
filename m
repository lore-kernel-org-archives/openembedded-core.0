Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC39CD4846
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 16:28:29 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.2030.1695400105314212781
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 09:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xQdv6AE9;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.41, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso293028566b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 09:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695400103; x=1696004903; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPLMhIKwyv+oo/a0Bd0FGrlXo7P8L2If+6Xg5+vtaLU=;
        b=xQdv6AE9nS3GzSssgx0J6r9Nbdhdsyt7s1EM3JBoy0mJApulS9XODn/tPNp3hOf/XX
         CFw1y4RgF7547i4l6tAh+luaGBKVbgBmN0aDmMl0QKmm1gCf4u2USj4T7s+oCokoH7uV
         ic5LWhnZGtgMbKjLE89erH0tzli+z8I2RlnaeRJJeJ5zg0ANySUY5gkYjwVf1WejL1fY
         b6VOh4bE10j5pwt2n6OBsHLvBamRYAfGEIdMsd/GuSKYR6fbRM40+Od1vIO42lmps+7t
         2CfcDupKd+515WxTpC544oFs03tpqsuNo8hiKFml63u/inEADYtCRuxi3ml/UXWiFBgk
         dc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695400103; x=1696004903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EPLMhIKwyv+oo/a0Bd0FGrlXo7P8L2If+6Xg5+vtaLU=;
        b=Sb1rFyCDfBp3dVykBYrfPWzveOkjnSyv+8J+V/y1qpKvteUSTdZPIeFArXZotI/qXU
         qSsqBRzTB3vyejGeMaeht3Tt1FKu1dsE/dj0P2X9+KZmBIoeA5XMnn5DgZkfhrdpbUQ+
         bFagDt/zvJn4fWfuveLIuMKmYjUIe9BVvFNSH5abYXpdsJ+SxYCJCSEYV2pY1i2Hltg3
         anbYdyqSCOSQ2T9udeZHfsUXALIkMOYwPIPI5/9OaHEpKpN5L3mYQc4fKrNTMLEwrrsx
         7hTQRTk7GmngxzZKCS5gw4L0poRopOJZWpkC1Qg9AH7jvAD0ReUDV1Bjxz+SQuXvILAE
         FpZQ==
X-Gm-Message-State: AOJu0Yyd/iB+PdsafS0O/3FaXPt2U8R0l9ZAlkP8BN4TSl+ZLqppGj45
	PAYz1HfJjfVJ6suwcQPcbiskWku/a8D9VLCMeb/uNQ==
X-Google-Smtp-Source: AGHT+IEMBIGdNikPf3MWdeLoCwwR/VuwDFf6XB9E88pwkK68+wh8OhVrykNtW0eUX7LjbUsc7j/SBFbcLuXKQf7/lvM=
X-Received: by 2002:a17:907:77cd:b0:9ae:6196:a410 with SMTP id
 kz13-20020a17090777cd00b009ae6196a410mr5057886ejc.43.1695400102959; Fri, 22
 Sep 2023 09:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230921170746.224878-1-sdoshi@mvista.com>
In-Reply-To: <20230921170746.224878-1-sdoshi@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 22 Sep 2023 06:28:12 -1000
Message-ID: <CAOSpxdbq1w5tQNuWaPizpFAkhbvfaSYVHGuELZaYRCHxxhBGzQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] go: Fix CVE-2023-39318
To: sdoshi@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 16:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188128

On Thu, Sep 21, 2023 at 7:07=E2=80=AFAM Siddharth via lists.openembedded.or=
g
<sdoshi=3Dmvista.com@lists.openembedded.org> wrote:
>
> From: Siddharth Doshi <sdoshi@mvista.com>
>
> Upstream-Status: Backport from [https://github.com/golang/go/commit/023b5=
42edf38e2a1f87fcefb9f75ff2f99401b4c]
> CVE: CVE-2023-39318
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>  meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
>  .../go/go-1.21/CVE-2023-39318.patch           | 238 ++++++++++++++++++

Could you please send a V2 that deals with the fuzz warning?

WARNING: go-cross-core2-64-1.17.13-r0 do_patch: Fuzz detected:

Applying patch CVE-2023-39318.patch
patching file src/html/template/context.go
patching file src/html/template/escape.go
Hunk #1 succeeded at 721 (offset 21 lines).
patching file src/html/template/escape_test.go
Hunk #1 succeeded at 503 with fuzz 2.
patching file src/html/template/state_string.go
patching file src/html/template/transition.go
Hunk #2 succeeded at 270 (offset 5 lines).
Hunk #3 succeeded at 300 (offset 5 lines).
Hunk #4 succeeded at 409 (offset 15 lines).

Thanks!

Steve

>  2 files changed, 239 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2023-39318.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devto=
ols/go/go-1.17.13.inc
> index 119ae112af..df7d5d235a 100644
> --- a/meta/recipes-devtools/go/go-1.17.13.inc
> +++ b/meta/recipes-devtools/go/go-1.17.13.inc
> @@ -44,6 +44,7 @@ SRC_URI +=3D "\
>      file://CVE-2023-24531_2.patch \
>      file://CVE-2023-29409.patch \
>      file://CVE-2023-39319.patch \
> +    file://CVE-2023-39318.patch \
>  "
>  SRC_URI[main.sha256sum] =3D "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d=
1fc0c1d784ada0cd300fd"
>
> diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2023-39318.patch b/meta=
/recipes-devtools/go/go-1.21/CVE-2023-39318.patch
> new file mode 100644
> index 0000000000..942af323e0
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.21/CVE-2023-39318.patch
> @@ -0,0 +1,238 @@
> +From 023b542edf38e2a1f87fcefb9f75ff2f99401b4c Mon Sep 17 00:00:00 2001
> +From: Roland Shoemaker <bracewell@google.com>
> +Date: Thu, 3 Aug 2023 12:24:13 -0700
> +Subject: [PATCH] [release-branch.go1.20] html/template: support HTML-lik=
e
> + comments in script contexts
> +
> +Per Appendix B.1.1 of the ECMAScript specification, support HTML-like
> +comments in script contexts. Also per section 12.5, support hashbang
> +comments. This brings our parsing in-line with how browsers treat these
> +comment types.
> +
> +Thanks to Takeshi Kaneko (GMO Cybersecurity by Ierae, Inc.) for
> +reporting this issue.
> +
> +Fixes #62196
> +Fixes #62395
> +Fixes CVE-2023-39318
> +
> +Change-Id: Id512702c5de3ae46cf648e268cb10e1eb392a181
> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private=
/+/1976593
> +Run-TryBot: Roland Shoemaker <bracewell@google.com>
> +Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
> +Reviewed-by: Damien Neil <dneil@google.com>
> +Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private=
/+/2014620
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/526098
> +Run-TryBot: Cherry Mui <cherryyz@google.com>
> +TryBot-Result: Gopher Robot <gobot@golang.org>
> +
> +Upstream-Status: Backport from [https://github.com/golang/go/commit/023b=
542edf38e2a1f87fcefb9f75ff2f99401b4c]
> +CVE: CVE-2023-39318
> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> +---
> + src/html/template/context.go      |  6 ++-
> + src/html/template/escape.go       |  5 +-
> + src/html/template/escape_test.go  | 10 ++++
> + src/html/template/state_string.go |  4 +-
> + src/html/template/transition.go   | 80 ++++++++++++++++++++-----------
> + 5 files changed, 72 insertions(+), 33 deletions(-)
> +
> +diff --git a/src/html/template/context.go b/src/html/template/context.go
> +index 0b65313..4eb7891 100644
> +--- a/src/html/template/context.go
> ++++ b/src/html/template/context.go
> +@@ -124,6 +124,10 @@ const (
> +       stateJSBlockCmt
> +       // stateJSLineCmt occurs inside a JavaScript // line comment.
> +       stateJSLineCmt
> ++      // stateJSHTMLOpenCmt occurs inside a JavaScript <!-- HTML-like c=
omment.
> ++      stateJSHTMLOpenCmt
> ++      // stateJSHTMLCloseCmt occurs inside a JavaScript --> HTML-like c=
omment.
> ++      stateJSHTMLCloseCmt
> +       // stateCSS occurs inside a <style> element or style attribute.
> +       stateCSS
> +       // stateCSSDqStr occurs inside a CSS double quoted string.
> +@@ -149,7 +153,7 @@ const (
> + // authors & maintainers, not for end-users or machines.
> + func isComment(s state) bool {
> +       switch s {
> +-      case stateHTMLCmt, stateJSBlockCmt, stateJSLineCmt, stateCSSBlock=
Cmt, stateCSSLineCmt:
> ++      case stateHTMLCmt, stateJSBlockCmt, stateJSLineCmt, stateJSHTMLOp=
enCmt, stateJSHTMLCloseCmt, stateCSSBlockCmt, stateCSSLineCmt:
> +               return true
> +       }
> +       return false
> +diff --git a/src/html/template/escape.go b/src/html/template/escape.go
> +index bdccc65..3249c67 100644
> +--- a/src/html/template/escape.go
> ++++ b/src/html/template/escape.go
> +@@ -700,9 +700,12 @@ func (e *escaper) escapeText(c context, n *parse.Te=
xtNode) context {
> +               if c.state !=3D c1.state && isComment(c1.state) && c1.del=
im =3D=3D delimNone {
> +                       // Preserve the portion between written and the c=
omment start.
> +                       cs :=3D i1 - 2
> +-                      if c1.state =3D=3D stateHTMLCmt {
> ++                      if c1.state =3D=3D stateHTMLCmt || c1.state =3D=
=3D stateJSHTMLOpenCmt {
> +                               // "<!--" instead of "/*" or "//"
> +                               cs -=3D 2
> ++                      } else if c1.state =3D=3D stateJSHTMLCloseCmt {
> ++                              // "-->" instead of "/*" or "//"
> ++                              cs -=3D 1
> +                       }
> +                       b.Write(s[written:cs])
> +                       written =3D i1
> +diff --git a/src/html/template/escape_test.go b/src/html/template/escape=
_test.go
> +index 4f48afe..69cad08 100644
> +--- a/src/html/template/escape_test.go
> ++++ b/src/html/template/escape_test.go
> +@@ -503,6 +503,16 @@ func TestEscape(t *testing.T) {
> +                       "<script>var a/*b*///c\nd</script>",
> +                       "<script>var a \nd</script>",
> +               },
> ++              {
> ++                      "JS HTML-like comments",
> ++                      "<script>before <!-- beep\nbetween\nbefore-->boop=
\n</script>",
> ++                      "<script>before \nbetween\nbefore\n</script>",
> ++              },
> ++              {
> ++                      "JS hashbang comment",
> ++                      "<script>#! beep\n</script>",
> ++                      "<script>\n</script>",
> ++              },
> +               {
> +                       "CSS comments",
> +                       "<style>p// paragraph\n" +
> +diff --git a/src/html/template/state_string.go b/src/html/template/state=
_string.go
> +index 05104be..b5cfe70 100644
> +--- a/src/html/template/state_string.go
> ++++ b/src/html/template/state_string.go
> +@@ -4,9 +4,9 @@ package template
> +
> + import "strconv"
> +
> +-const _state_name =3D "stateTextstateTagstateAttrNamestateAfterNamestat=
eBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSstate=
JSDqStrstateJSSqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateC=
SSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtst=
ateCSSLineCmtstateError"
> ++const _state_name =3D "stateTextstateTagstateAttrNamestateAfterNamestat=
eBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSstate=
JSDqStrstateJSSqStrstateJSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtst=
ateJSHTMLOpenCmtstateJSHTMLCloseCmtstateCSSstateCSSDqStrstateCSSSqStrstateC=
SSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateErrorsta=
teDead"
> +
> +-var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100,=
 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 244, 255, 271, 286,=
 296}
> ++var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100,=
 111, 118, 130, 142, 154, 167, 182, 196, 214, 233, 241, 254, 267, 280, 293,=
 304, 320, 335, 345, 354}
> +
> + func (i state) String() string {
> +       if i >=3D state(len(_state_index)-1) {
> +diff --git a/src/html/template/transition.go b/src/html/template/transit=
ion.go
> +index 92eb351..12aa4c4 100644
> +--- a/src/html/template/transition.go
> ++++ b/src/html/template/transition.go
> +@@ -14,32 +14,34 @@ import (
> + // the updated context and the number of bytes consumed from the front =
of the
> + // input.
> + var transitionFunc =3D [...]func(context, []byte) (context, int){
> +-      stateText:        tText,
> +-      stateTag:         tTag,
> +-      stateAttrName:    tAttrName,
> +-      stateAfterName:   tAfterName,
> +-      stateBeforeValue: tBeforeValue,
> +-      stateHTMLCmt:     tHTMLCmt,
> +-      stateRCDATA:      tSpecialTagEnd,
> +-      stateAttr:        tAttr,
> +-      stateURL:         tURL,
> +-      stateSrcset:      tURL,
> +-      stateJS:          tJS,
> +-      stateJSDqStr:     tJSDelimited,
> +-      stateJSSqStr:     tJSDelimited,
> +-      stateJSBqStr:     tJSDelimited,
> +-      stateJSRegexp:    tJSDelimited,
> +-      stateJSBlockCmt:  tBlockCmt,
> +-      stateJSLineCmt:   tLineCmt,
> +-      stateCSS:         tCSS,
> +-      stateCSSDqStr:    tCSSStr,
> +-      stateCSSSqStr:    tCSSStr,
> +-      stateCSSDqURL:    tCSSStr,
> +-      stateCSSSqURL:    tCSSStr,
> +-      stateCSSURL:      tCSSStr,
> +-      stateCSSBlockCmt: tBlockCmt,
> +-      stateCSSLineCmt:  tLineCmt,
> +-      stateError:       tError,
> ++      stateText:           tText,
> ++      stateTag:            tTag,
> ++      stateAttrName:       tAttrName,
> ++      stateAfterName:      tAfterName,
> ++      stateBeforeValue:    tBeforeValue,
> ++      stateHTMLCmt:        tHTMLCmt,
> ++      stateRCDATA:         tSpecialTagEnd,
> ++      stateAttr:           tAttr,
> ++      stateURL:            tURL,
> ++      stateSrcset:         tURL,
> ++      stateJS:             tJS,
> ++      stateJSDqStr:        tJSDelimited,
> ++      stateJSSqStr:        tJSDelimited,
> ++      stateJSBqStr:        tJSDelimited,
> ++      stateJSRegexp:       tJSDelimited,
> ++      stateJSBlockCmt:     tBlockCmt,
> ++      stateJSLineCmt:      tLineCmt,
> ++      stateJSHTMLOpenCmt:  tLineCmt,
> ++      stateJSHTMLCloseCmt: tLineCmt,
> ++      stateCSS:            tCSS,
> ++      stateCSSDqStr:       tCSSStr,
> ++      stateCSSSqStr:       tCSSStr,
> ++      stateCSSDqURL:       tCSSStr,
> ++      stateCSSSqURL:       tCSSStr,
> ++      stateCSSURL:         tCSSStr,
> ++      stateCSSBlockCmt:    tBlockCmt,
> ++      stateCSSLineCmt:     tLineCmt,
> ++      stateError:          tError,
> + }
> +
> + var commentStart =3D []byte("<!--")
> +@@ -263,7 +265,7 @@ func tURL(c context, s []byte) (context, int) {
> +
> + // tJS is the context transition function for the JS state.
> + func tJS(c context, s []byte) (context, int) {
> +-      i :=3D bytes.IndexAny(s, "\"`'/")
> ++      i :=3D bytes.IndexAny(s, "\"`'/<-#")
> +       if i =3D=3D -1 {
> +               // Entire input is non string, comment, regexp tokens.
> +               c.jsCtx =3D nextJSCtx(s, c.jsCtx)
> +@@ -293,6 +295,26 @@ func tJS(c context, s []byte) (context, int) {
> +                               err:   errorf(ErrSlashAmbig, nil, 0, "'/'=
 could start a division or regexp: %.32q", s[i:]),
> +                       }, len(s)
> +               }
> ++      // ECMAScript supports HTML style comments for legacy reasons, se=
e Appendix
> ++      // B.1.1 "HTML-like Comments". The handling of these comments is =
somewhat
> ++      // confusing. Multi-line comments are not supported, i.e. anythin=
g on lines
> ++      // between the opening and closing tokens is not considered a com=
ment, but
> ++      // anything following the opening or closing token, on the same l=
ine, is
> ++      // ignored. As such we simply treat any line prefixed with "<!--"=
 or "-->"
> ++      // as if it were actually prefixed with "//" and move on.
> ++      case '<':
> ++              if i+3 < len(s) && bytes.Equal(commentStart, s[i:i+4]) {
> ++                      c.state, i =3D stateJSHTMLOpenCmt, i+3
> ++              }
> ++      case '-':
> ++              if i+2 < len(s) && bytes.Equal(commentEnd, s[i:i+3]) {
> ++                      c.state, i =3D stateJSHTMLCloseCmt, i+2
> ++              }
> ++      // ECMAScript also supports "hashbang" comment lines, see Section=
 12.5.
> ++      case '#':
> ++              if i+1 < len(s) && s[i+1] =3D=3D '!' {
> ++                      c.state, i =3D stateJSLineCmt, i+1
> ++              }
> +       default:
> +               panic("unreachable")
> +       }
> +@@ -372,12 +394,12 @@ func tBlockCmt(c context, s []byte) (context, int)=
 {
> +       return c, i + 2
> + }
> +
> +-// tLineCmt is the context transition function for //comment states.
> ++// tLineCmt is the context transition function for //comment states, an=
d the JS HTML-like comment state.
> + func tLineCmt(c context, s []byte) (context, int) {
> +       var lineTerminators string
> +       var endState state
> +       switch c.state {
> +-      case stateJSLineCmt:
> ++      case stateJSLineCmt, stateJSHTMLOpenCmt, stateJSHTMLCloseCmt:
> +               lineTerminators, endState =3D "\n\r\u2028\u2029", stateJS
> +       case stateCSSLineCmt:
> +               lineTerminators, endState =3D "\n\f\r", stateCSS
> +--
> +2.25.1
> +
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188020): https://lists.openembedded.org/g/openembedde=
d-core/message/188020
> Mute This Topic: https://lists.openembedded.org/mt/101504976/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

