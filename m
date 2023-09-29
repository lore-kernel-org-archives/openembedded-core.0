Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57166E728C3
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 15:49:01 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.21113.1696002538724295482
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 08:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ixsiMpqu;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.45, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso1929042266b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 08:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696002537; x=1696607337; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbF1oZBs5G9MJPhwO8133y0ZpeH5pi6+ip/3hKBfpZc=;
        b=ixsiMpqur3syy40WNsw4em8aOy5NQ3dPZA/hLXhFgS2jRyBJr+vvYouMMyMsv0dyC5
         QSuZBoNfeTl5TX0TdMVuHd56om9hefMjj1ygMnP4cWEddRCFZFhe4WkosoJT0mCFSvAe
         snuKVHFrobRJm8g5wmLwQp5feZwcnhQIfOxB0hUMXDYnTuJTrPWIdorJ0wQqRsxYmK2v
         ZxlCDiO6v+ay6vZSAhWthur5FNeSuyzwJw+L0ES+vlR+rDIDTp98zRhJpz7iLhgTjqT5
         INWGlHM3GysTGxM1r0whcTLWIzdPtBg3WLvDYlGU8Ddopvc9Zg+e8W4DmoyO6ve4oZEx
         cACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696002537; x=1696607337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbF1oZBs5G9MJPhwO8133y0ZpeH5pi6+ip/3hKBfpZc=;
        b=GKJaaELPdGSclYL6UCprDaZsBce+451mJQVMt3b946F94np3gGUbtXusvggslxtTFp
         K29lh7NeOCtZcoX5Od/7RMv73y0ocD2Rpc4igRZHEU60Wpsr+2/h3kvS9Gz1CCgbz8aH
         hwqeDeYhJp94XxLZNGJayMc1zdz67dvjpowBgBzo/5hA/ikt2VydT9KPE0/X//8yxvdV
         MwTAS9Wa5D1aQxxCng8DKvcMtYsejgaOAydNeLN3QW+roAreRlIlcF3Ji6QtQRersjzt
         Hf7YN/D/AhuRcUiQd1YIJA6u8lVlZ85FhVPvokn4sFKgaRS3HOUVo+u0BQkKjK3iDMwV
         z9UQ==
X-Gm-Message-State: AOJu0Yw5Pnh9/90DOrq9gwnltMxvjYUCqrH4D5FSkzzjndvFT56fmZgy
	tEmATb+rHuEZv8ycUmgJ6I2ZcysluBmj0F+lulG/YA==
X-Google-Smtp-Source: AGHT+IGo8oUDPmMDtSkFo7Q/fHTVUcFsIoEKpkYA69jhUE29Pqib6MbjN9C11vk+bUvN5J4u2DE7/b2QiVD089AlQuI=
X-Received: by 2002:a17:906:51d6:b0:9ae:284:c93d with SMTP id
 v22-20020a17090651d600b009ae0284c93dmr4063196ejk.5.1696002536634; Fri, 29 Sep
 2023 08:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230926040754.6166-1-sdoshi@mvista.com> <CAKzga+zhofsNbpJkqg0beJNdNUfzMK4GKUdf_Ft0y-6zvsEFCQ@mail.gmail.com>
In-Reply-To: <CAKzga+zhofsNbpJkqg0beJNdNUfzMK4GKUdf_Ft0y-6zvsEFCQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 29 Sep 2023 05:48:45 -1000
Message-ID: <CAOSpxdbPjopHw4PKeK5GiV_svBWGTHFW_jrJaEv=8CAu_0UUhQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] go: Fix CVE-2023-39318 and CVE-2023-39319
To: Shubham Kulkarni <skulkarni@mvista.com>
Cc: openembedded-core@lists.openembedded.org, sdoshi@mvista.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 15:49:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188410

On Fri, Sep 29, 2023 at 4:47=E2=80=AFAM Shubham Kulkarni <skulkarni@mvista.=
com> wrote:
>
> Hi Steve,
>
> Is there any update on this?

It is in my current test queue:

https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/dunf=
ell-nut

Steve

> On Tue, Sep 26, 2023 at 9:38=E2=80=AFAM Siddharth via lists.openembedded.=
org <sdoshi=3Dmvista.com@lists.openembedded.org> wrote:
>>
>> From: Siddharth Doshi <sdoshi@mvista.com>
>>
>> Upstream-Status: Backport from [https://github.com/golang/go/commit/023b=
542edf38e2a1f87fcefb9f75ff2f99401b4c]
>> CVE: CVE-2023-39318
>> Upstream-Status: Backport from [https://github.com/golang/go/commit/2070=
531d2f53df88e312edace6c8dfc9686ab2f5]
>> CVE: CVE-2023-39319
>> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
>> ---
>>  meta/recipes-devtools/go/go-1.14.inc          |   2 +
>>  .../go/go-1.14/CVE-2023-39318.patch           | 238 ++++++++++++++++++
>>  .../go/go-1.14/CVE-2023-39319.patch           | 230 +++++++++++++++++
>>  3 files changed, 470 insertions(+)
>>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patc=
h
>>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-39319.patc=
h
>>
>> diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtool=
s/go/go-1.14.inc
>> index 20377e095b..9fc5eb130f 100644
>> --- a/meta/recipes-devtools/go/go-1.14.inc
>> +++ b/meta/recipes-devtools/go/go-1.14.inc
>> @@ -70,6 +70,8 @@ SRC_URI +=3D "\
>>      file://CVE-2023-29400.patch \
>>      file://CVE-2023-29406.patch \
>>      file://CVE-2023-29409.patch \
>> +    file://CVE-2023-39318.patch \
>> +    file://CVE-2023-39319.patch \
>>  "
>>
>>  SRC_URI_append_libc-musl =3D " file://0009-ld-replace-glibc-dynamic-lin=
ker-with-musl.patch"
>> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch b/met=
a/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
>> new file mode 100644
>> index 0000000000..20e70c0485
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
>> @@ -0,0 +1,238 @@
>> +From 023b542edf38e2a1f87fcefb9f75ff2f99401b4c Mon Sep 17 00:00:00 2001
>> +From: Roland Shoemaker <bracewell@google.com>
>> +Date: Thu, 3 Aug 2023 12:24:13 -0700
>> +Subject: [PATCH] [release-branch.go1.20] html/template: support HTML-li=
ke
>> + comments in script contexts
>> +
>> +Per Appendix B.1.1 of the ECMAScript specification, support HTML-like
>> +comments in script contexts. Also per section 12.5, support hashbang
>> +comments. This brings our parsing in-line with how browsers treat these
>> +comment types.
>> +
>> +Thanks to Takeshi Kaneko (GMO Cybersecurity by Ierae, Inc.) for
>> +reporting this issue.
>> +
>> +Fixes #62196
>> +Fixes #62395
>> +Fixes CVE-2023-39318
>> +
>> +Change-Id: Id512702c5de3ae46cf648e268cb10e1eb392a181
>> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-privat=
e/+/1976593
>> +Run-TryBot: Roland Shoemaker <bracewell@google.com>
>> +Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
>> +Reviewed-by: Damien Neil <dneil@google.com>
>> +Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
>> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-privat=
e/+/2014620
>> +Reviewed-on: https://go-review.googlesource.com/c/go/+/526098
>> +Run-TryBot: Cherry Mui <cherryyz@google.com>
>> +TryBot-Result: Gopher Robot <gobot@golang.org>
>> +
>> +Upstream-Status: Backport from [https://github.com/golang/go/commit/023=
b542edf38e2a1f87fcefb9f75ff2f99401b4c]
>> +CVE: CVE-2023-39318
>> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
>> +---
>> + src/html/template/context.go      |  6 ++-
>> + src/html/template/escape.go       |  5 +-
>> + src/html/template/escape_test.go  | 10 ++++
>> + src/html/template/state_string.go |  4 +-
>> + src/html/template/transition.go   | 80 ++++++++++++++++++++-----------
>> + 5 files changed, 72 insertions(+), 33 deletions(-)
>> +
>> +diff --git a/src/html/template/context.go b/src/html/template/context.g=
o
>> +index 0b65313..4eb7891 100644
>> +--- a/src/html/template/context.go
>> ++++ b/src/html/template/context.go
>> +@@ -124,6 +124,10 @@ const (
>> +       stateJSBlockCmt
>> +       // stateJSLineCmt occurs inside a JavaScript // line comment.
>> +       stateJSLineCmt
>> ++      // stateJSHTMLOpenCmt occurs inside a JavaScript <!-- HTML-like =
comment.
>> ++      stateJSHTMLOpenCmt
>> ++      // stateJSHTMLCloseCmt occurs inside a JavaScript --> HTML-like =
comment.
>> ++      stateJSHTMLCloseCmt
>> +       // stateCSS occurs inside a <style> element or style attribute.
>> +       stateCSS
>> +       // stateCSSDqStr occurs inside a CSS double quoted string.
>> +@@ -149,7 +153,7 @@ const (
>> + // authors & maintainers, not for end-users or machines.
>> + func isComment(s state) bool {
>> +       switch s {
>> +-      case stateHTMLCmt, stateJSBlockCmt, stateJSLineCmt, stateCSSBloc=
kCmt, stateCSSLineCmt:
>> ++      case stateHTMLCmt, stateJSBlockCmt, stateJSLineCmt, stateJSHTMLO=
penCmt, stateJSHTMLCloseCmt, stateCSSBlockCmt, stateCSSLineCmt:
>> +               return true
>> +       }
>> +       return false
>> +diff --git a/src/html/template/escape.go b/src/html/template/escape.go
>> +index 435f912..ad2ec69 100644
>> +--- a/src/html/template/escape.go
>> ++++ b/src/html/template/escape.go
>> +@@ -698,9 +698,12 @@ func (e *escaper) escapeText(c context, n *parse.T=
extNode) context {
>> +               if c.state !=3D c1.state && isComment(c1.state) && c1.de=
lim =3D=3D delimNone {
>> +                       // Preserve the portion between written and the =
comment start.
>> +                       cs :=3D i1 - 2
>> +-                      if c1.state =3D=3D stateHTMLCmt {
>> ++                      if c1.state =3D=3D stateHTMLCmt || c1.state =3D=
=3D stateJSHTMLOpenCmt {
>> +                               // "<!--" instead of "/*" or "//"
>> +                               cs -=3D 2
>> ++                      } else if c1.state =3D=3D stateJSHTMLCloseCmt {
>> ++                              // "-->" instead of "/*" or "//"
>> ++                              cs -=3D 1
>> +                       }
>> +                       b.Write(s[written:cs])
>> +                       written =3D i1
>> +diff --git a/src/html/template/escape_test.go b/src/html/template/escap=
e_test.go
>> +index f550691..5f41e52 100644
>> +--- a/src/html/template/escape_test.go
>> ++++ b/src/html/template/escape_test.go
>> +@@ -503,6 +503,16 @@ func TestEscape(t *testing.T) {
>> +                       "<script>var a/*b*///c\nd</script>",
>> +                       "<script>var a \nd</script>",
>> +               },
>> ++              {
>> ++                      "JS HTML-like comments",
>> ++                      "<script>before <!-- beep\nbetween\nbefore-->boo=
p\n</script>",
>> ++                      "<script>before \nbetween\nbefore\n</script>",
>> ++              },
>> ++              {
>> ++                      "JS hashbang comment",
>> ++                      "<script>#! beep\n</script>",
>> ++                      "<script>\n</script>",
>> ++              },
>> +               {
>> +                       "CSS comments",
>> +                       "<style>p// paragraph\n" +
>> +diff --git a/src/html/template/state_string.go b/src/html/template/stat=
e_string.go
>> +index 05104be..b5cfe70 100644
>> +--- a/src/html/template/state_string.go
>> ++++ b/src/html/template/state_string.go
>> +@@ -4,9 +4,9 @@ package template
>> +
>> + import "strconv"
>> +
>> +-const _state_name =3D "stateTextstateTagstateAttrNamestateAfterNamesta=
teBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSstat=
eJSDqStrstateJSSqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstate=
CSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmts=
tateCSSLineCmtstateError"
>> ++const _state_name =3D "stateTextstateTagstateAttrNamestateAfterNamesta=
teBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSstat=
eJSDqStrstateJSSqStrstateJSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCmts=
tateJSHTMLOpenCmtstateJSHTMLCloseCmtstateCSSstateCSSDqStrstateCSSSqStrstate=
CSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateErrorst=
ateDead"
>> +
>> +-var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100=
, 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 244, 255, 271, 286=
, 296}
>> ++var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100=
, 111, 118, 130, 142, 154, 167, 182, 196, 214, 233, 241, 254, 267, 280, 293=
, 304, 320, 335, 345, 354}
>> +
>> + func (i state) String() string {
>> +       if i >=3D state(len(_state_index)-1) {
>> +diff --git a/src/html/template/transition.go b/src/html/template/transi=
tion.go
>> +index 92eb351..12aa4c4 100644
>> +--- a/src/html/template/transition.go
>> ++++ b/src/html/template/transition.go
>> +@@ -14,32 +14,34 @@ import (
>> + // the updated context and the number of bytes consumed from the front=
 of the
>> + // input.
>> + var transitionFunc =3D [...]func(context, []byte) (context, int){
>> +-      stateText:        tText,
>> +-      stateTag:         tTag,
>> +-      stateAttrName:    tAttrName,
>> +-      stateAfterName:   tAfterName,
>> +-      stateBeforeValue: tBeforeValue,
>> +-      stateHTMLCmt:     tHTMLCmt,
>> +-      stateRCDATA:      tSpecialTagEnd,
>> +-      stateAttr:        tAttr,
>> +-      stateURL:         tURL,
>> +-      stateSrcset:      tURL,
>> +-      stateJS:          tJS,
>> +-      stateJSDqStr:     tJSDelimited,
>> +-      stateJSSqStr:     tJSDelimited,
>> +-      stateJSBqStr:     tJSDelimited,
>> +-      stateJSRegexp:    tJSDelimited,
>> +-      stateJSBlockCmt:  tBlockCmt,
>> +-      stateJSLineCmt:   tLineCmt,
>> +-      stateCSS:         tCSS,
>> +-      stateCSSDqStr:    tCSSStr,
>> +-      stateCSSSqStr:    tCSSStr,
>> +-      stateCSSDqURL:    tCSSStr,
>> +-      stateCSSSqURL:    tCSSStr,
>> +-      stateCSSURL:      tCSSStr,
>> +-      stateCSSBlockCmt: tBlockCmt,
>> +-      stateCSSLineCmt:  tLineCmt,
>> +-      stateError:       tError,
>> ++      stateText:           tText,
>> ++      stateTag:            tTag,
>> ++      stateAttrName:       tAttrName,
>> ++      stateAfterName:      tAfterName,
>> ++      stateBeforeValue:    tBeforeValue,
>> ++      stateHTMLCmt:        tHTMLCmt,
>> ++      stateRCDATA:         tSpecialTagEnd,
>> ++      stateAttr:           tAttr,
>> ++      stateURL:            tURL,
>> ++      stateSrcset:         tURL,
>> ++      stateJS:             tJS,
>> ++      stateJSDqStr:        tJSDelimited,
>> ++      stateJSSqStr:        tJSDelimited,
>> ++      stateJSBqStr:        tJSDelimited,
>> ++      stateJSRegexp:       tJSDelimited,
>> ++      stateJSBlockCmt:     tBlockCmt,
>> ++      stateJSLineCmt:      tLineCmt,
>> ++      stateJSHTMLOpenCmt:  tLineCmt,
>> ++      stateJSHTMLCloseCmt: tLineCmt,
>> ++      stateCSS:            tCSS,
>> ++      stateCSSDqStr:       tCSSStr,
>> ++      stateCSSSqStr:       tCSSStr,
>> ++      stateCSSDqURL:       tCSSStr,
>> ++      stateCSSSqURL:       tCSSStr,
>> ++      stateCSSURL:         tCSSStr,
>> ++      stateCSSBlockCmt:    tBlockCmt,
>> ++      stateCSSLineCmt:     tLineCmt,
>> ++      stateError:          tError,
>> + }
>> +
>> + var commentStart =3D []byte("<!--")
>> +@@ -263,7 +265,7 @@ func tURL(c context, s []byte) (context, int) {
>> +
>> + // tJS is the context transition function for the JS state.
>> + func tJS(c context, s []byte) (context, int) {
>> +-      i :=3D bytes.IndexAny(s, "\"`'/")
>> ++      i :=3D bytes.IndexAny(s, "\"`'/<-#")
>> +       if i =3D=3D -1 {
>> +               // Entire input is non string, comment, regexp tokens.
>> +               c.jsCtx =3D nextJSCtx(s, c.jsCtx)
>> +@@ -293,6 +295,26 @@ func tJS(c context, s []byte) (context, int) {
>> +                               err:   errorf(ErrSlashAmbig, nil, 0, "'/=
' could start a division or regexp: %.32q", s[i:]),
>> +                       }, len(s)
>> +               }
>> ++      // ECMAScript supports HTML style comments for legacy reasons, s=
ee Appendix
>> ++      // B.1.1 "HTML-like Comments". The handling of these comments is=
 somewhat
>> ++      // confusing. Multi-line comments are not supported, i.e. anythi=
ng on lines
>> ++      // between the opening and closing tokens is not considered a co=
mment, but
>> ++      // anything following the opening or closing token, on the same =
line, is
>> ++      // ignored. As such we simply treat any line prefixed with "<!--=
" or "-->"
>> ++      // as if it were actually prefixed with "//" and move on.
>> ++      case '<':
>> ++              if i+3 < len(s) && bytes.Equal(commentStart, s[i:i+4]) {
>> ++                      c.state, i =3D stateJSHTMLOpenCmt, i+3
>> ++              }
>> ++      case '-':
>> ++              if i+2 < len(s) && bytes.Equal(commentEnd, s[i:i+3]) {
>> ++                      c.state, i =3D stateJSHTMLCloseCmt, i+2
>> ++              }
>> ++      // ECMAScript also supports "hashbang" comment lines, see Sectio=
n 12.5.
>> ++      case '#':
>> ++              if i+1 < len(s) && s[i+1] =3D=3D '!' {
>> ++                      c.state, i =3D stateJSLineCmt, i+1
>> ++              }
>> +       default:
>> +               panic("unreachable")
>> +       }
>> +@@ -372,12 +394,12 @@ func tBlockCmt(c context, s []byte) (context, int=
) {
>> +       return c, i + 2
>> + }
>> +
>> +-// tLineCmt is the context transition function for //comment states.
>> ++// tLineCmt is the context transition function for //comment states, a=
nd the JS HTML-like comment state.
>> + func tLineCmt(c context, s []byte) (context, int) {
>> +       var lineTerminators string
>> +       var endState state
>> +       switch c.state {
>> +-      case stateJSLineCmt:
>> ++      case stateJSLineCmt, stateJSHTMLOpenCmt, stateJSHTMLCloseCmt:
>> +               lineTerminators, endState =3D "\n\r\u2028\u2029", stateJ=
S
>> +       case stateCSSLineCmt:
>> +               lineTerminators, endState =3D "\n\f\r", stateCSS
>> +--
>> +2.24.4
>> +
>> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-39319.patch b/met=
a/recipes-devtools/go/go-1.14/CVE-2023-39319.patch
>> new file mode 100644
>> index 0000000000..69106e3e05
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-39319.patch
>> @@ -0,0 +1,230 @@
>> +From 2070531d2f53df88e312edace6c8dfc9686ab2f5 Mon Sep 17 00:00:00 2001
>> +From: Roland Shoemaker <bracewell@google.com>
>> +Date: Thu, 3 Aug 2023 12:28:28 -0700
>> +Subject: [PATCH] [release-branch.go1.20] html/template: properly handle
>> + special tags within the script context
>> +
>> +The HTML specification has incredibly complex rules for how to handle
>> +"<!--", "<script", and "</script" when they appear within literals in
>> +the script context. Rather than attempting to apply these restrictions
>> +(which require a significantly more complex state machine) we apply
>> +the workaround suggested in section 4.12.1.3 of the HTML specification =
[1].
>> +
>> +More precisely, when "<!--", "<script", and "</script" appear within
>> +literals (strings and regular expressions, ignoring comments since we
>> +already elide their content) we replace the "<" with "\x3C". This avoid=
s
>> +the unintuitive behavior that using these tags within literals can caus=
e,
>> +by simply preventing the rendered content from triggering it. This may
>> +break some correct usages of these tags, but on balance is more likely
>> +to prevent XSS attacks where users are unknowingly either closing or no=
t
>> +closing the script blocks where they think they are.
>> +
>> +Thanks to Takeshi Kaneko (GMO Cybersecurity by Ierae, Inc.) for
>> +reporting this issue.
>> +
>> +Fixes #62197
>> +Fixes #62397
>> +Fixes CVE-2023-39319
>> +
>> +[1] https://html.spec.whatwg.org/#restrictions-for-contents-of-script-e=
lements
>> +
>> +Change-Id: Iab57b0532694827e3eddf57a7497ba1fab1746dc
>> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-privat=
e/+/1976594
>> +Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
>> +Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
>> +Reviewed-by: Damien Neil <dneil@google.com>
>> +Run-TryBot: Roland Shoemaker <bracewell@google.com>
>> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-privat=
e/+/2014621
>> +TryBot-Result: Security TryBots <security-trybots@go-security-trybots.i=
am.gserviceaccount.com>
>> +Reviewed-on: https://go-review.googlesource.com/c/go/+/526099
>> +TryBot-Result: Gopher Robot <gobot@golang.org>
>> +Run-TryBot: Cherry Mui <cherryyz@google.com>
>> +
>> +Upstream-Status: Backport from [https://github.com/golang/go/commit/207=
0531d2f53df88e312edace6c8dfc9686ab2f5]
>> +CVE: CVE-2023-39319
>> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
>> +---
>> + src/html/template/context.go     | 14 ++++++++++
>> + src/html/template/escape.go      | 26 ++++++++++++++++++
>> + src/html/template/escape_test.go | 47 +++++++++++++++++++++++++++++++-
>> + src/html/template/transition.go  | 15 ++++++++++
>> + 4 files changed, 101 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/src/html/template/context.go b/src/html/template/context.g=
o
>> +index 4eb7891..feb6517 100644
>> +--- a/src/html/template/context.go
>> ++++ b/src/html/template/context.go
>> +@@ -168,6 +168,20 @@ func isInTag(s state) bool {
>> +       return false
>> + }
>> +
>> ++// isInScriptLiteral returns true if s is one of the literal states wi=
thin a
>> ++// <script> tag, and as such occurances of "<!--", "<script", and "</s=
cript"
>> ++// need to be treated specially.
>> ++func isInScriptLiteral(s state) bool {
>> ++      // Ignore the comment states (stateJSBlockCmt, stateJSLineCmt,
>> ++      // stateJSHTMLOpenCmt, stateJSHTMLCloseCmt) because their conten=
t is already
>> ++      // omitted from the output.
>> ++      switch s {
>> ++      case stateJSDqStr, stateJSSqStr, stateJSBqStr, stateJSRegexp:
>> ++              return true
>> ++      }
>> ++      return false
>> ++}
>> ++
>> + // delim is the delimiter that will end the current HTML attribute.
>> + type delim uint8
>> +
>> +diff --git a/src/html/template/escape.go b/src/html/template/escape.go
>> +index ad2ec69..de8cf6f 100644
>> +--- a/src/html/template/escape.go
>> ++++ b/src/html/template/escape.go
>> +@@ -10,6 +10,7 @@ import (
>> +       "html"
>> +       "internal/godebug"
>> +       "io"
>> ++      "regexp"
>> +       "text/template"
>> +       "text/template/parse"
>> + )
>> +@@ -650,6 +651,26 @@ var delimEnds =3D [...]string{
>> +       delimSpaceOrTagEnd: " \t\n\f\r>",
>> + }
>> +
>> ++var (
>> ++      // Per WHATWG HTML specification, section 4.12.1.3, there are ex=
tremely
>> ++      // complicated rules for how to handle the set of opening tags <=
!--,
>> ++      // <script, and </script when they appear in JS literals (i.e. s=
trings,
>> ++      // regexs, and comments). The specification suggests a simple so=
lution,
>> ++      // rather than implementing the arcane ABNF, which involves simp=
ly escaping
>> ++      // the opening bracket with \x3C. We use the below regex for thi=
s, since it
>> ++      // makes doing the case-insensitive find-replace much simpler.
>> ++      specialScriptTagRE          =3D regexp.MustCompile("(?i)<(script=
|/script|!--)")
>> ++      specialScriptTagReplacement =3D []byte("\\x3C$1")
>> ++)
>> ++
>> ++func containsSpecialScriptTag(s []byte) bool {
>> ++      return specialScriptTagRE.Match(s)
>> ++}
>> ++
>> ++func escapeSpecialScriptTags(s []byte) []byte {
>> ++      return specialScriptTagRE.ReplaceAll(s, specialScriptTagReplacem=
ent)
>> ++}
>> ++
>> + var doctypeBytes =3D []byte("<!DOCTYPE")
>> +
>> + // escapeText escapes a text template node.
>> +@@ -708,6 +729,11 @@ func (e *escaper) escapeText(c context, n *parse.T=
extNode) context {
>> +                       b.Write(s[written:cs])
>> +                       written =3D i1
>> +               }
>> ++              if isInScriptLiteral(c.state) && containsSpecialScriptTa=
g(s[i:i1]) {
>> ++                      b.Write(s[written:i])
>> ++                      b.Write(escapeSpecialScriptTags(s[i:i1]))
>> ++                      written =3D i1
>> ++              }
>> +               if i =3D=3D i1 && c.state =3D=3D c1.state {
>> +                       panic(fmt.Sprintf("infinite loop from %v to %v o=
n %q..%q", c, c1, s[:i], s[i:]))
>> +               }
>> +diff --git a/src/html/template/escape_test.go b/src/html/template/escap=
e_test.go
>> +index 5f41e52..0cacb20 100644
>> +--- a/src/html/template/escape_test.go
>> ++++ b/src/html/template/escape_test.go
>> +@@ -513,6 +513,21 @@ func TestEscape(t *testing.T) {
>> +                       "<script>#! beep\n</script>",
>> +                       "<script>\n</script>",
>> +               },
>> ++              {
>> ++                      "Special tags in <script> string literals",
>> ++                      `<script>var a =3D "asd < 123 <!-- 456 < fgh <sc=
ript jkl < 789 </script"</script>`,
>> ++                      `<script>var a =3D "asd < 123 \x3C!-- 456 < fgh =
\x3Cscript jkl < 789 \x3C/script"</script>`,
>> ++              },
>> ++              {
>> ++                      "Special tags in <script> string literals (mixed=
 case)",
>> ++                      `<script>var a =3D "<!-- <ScripT </ScripT"</scri=
pt>`,
>> ++                      `<script>var a =3D "\x3C!-- \x3CScripT \x3C/Scri=
pT"</script>`,
>> ++              },
>> ++              {
>> ++                      "Special tags in <script> regex literals (mixed =
case)",
>> ++                      `<script>var a =3D /<!-- <ScripT </ScripT/</scri=
pt>`,
>> ++                      `<script>var a =3D /\x3C!-- \x3CScripT \x3C/Scri=
pT/</script>`,
>> ++              },
>> +               {
>> +                       "CSS comments",
>> +                       "<style>p// paragraph\n" +
>> +@@ -1501,8 +1516,38 @@ func TestEscapeText(t *testing.T) {
>> +                       context{state: stateJS, element: elementScript},
>> +               },
>> +               {
>> ++                      // <script and </script tags are escaped, so </s=
cript> should not
>> ++                      // cause us to exit the JS state.
>> +                       `<script>document.write("<script>alert(1)</scrip=
t>");`,
>> +-                      context{state: stateText},
>> ++                      context{state: stateJS, element: elementScript},
>> ++              },
>> ++              {
>> ++                      `<script>document.write("<script>`,
>> ++                      context{state: stateJSDqStr, element: elementScr=
ipt},
>> ++              },
>> ++              {
>> ++                      `<script>document.write("<script>alert(1)</scrip=
t>`,
>> ++                      context{state: stateJSDqStr, element: elementScr=
ipt},
>> ++              },
>> ++              {
>> ++                      `<script>document.write("<script>alert(1)<!--`,
>> ++                      context{state: stateJSDqStr, element: elementScr=
ipt},
>> ++              },
>> ++              {
>> ++                      `<script>document.write("<script>alert(1)</Scrip=
t>");`,
>> ++                      context{state: stateJS, element: elementScript},
>> ++              },
>> ++              {
>> ++                      `<script>document.write("<!--");`,
>> ++                      context{state: stateJS, element: elementScript},
>> ++              },
>> ++              {
>> ++                      `<script>let a =3D /</script`,
>> ++                      context{state: stateJSRegexp, element: elementSc=
ript},
>> ++              },
>> ++              {
>> ++                      `<script>let a =3D /</script/`,
>> ++                      context{state: stateJS, element: elementScript, =
jsCtx: jsCtxDivOp},
>> +               },
>> +               {
>> +                       `<script type=3D"text/template">`,
>> +diff --git a/src/html/template/transition.go b/src/html/template/transi=
tion.go
>> +index 12aa4c4..3d2a37c 100644
>> +--- a/src/html/template/transition.go
>> ++++ b/src/html/template/transition.go
>> +@@ -214,6 +214,11 @@ var (
>> + // element states.
>> + func tSpecialTagEnd(c context, s []byte) (context, int) {
>> +       if c.element !=3D elementNone {
>> ++              // script end tags ("</script") within script literals a=
re ignored, so that
>> ++              // we can properly escape them.
>> ++              if c.element =3D=3D elementScript && (isInScriptLiteral(=
c.state) || isComment(c.state)) {
>> ++                      return c, len(s)
>> ++              }
>> +               if i :=3D indexTagEnd(s, specialTagEndMarkers[c.element]=
); i !=3D -1 {
>> +                       return context{}, i
>> +               }
>> +@@ -353,6 +358,16 @@ func tJSDelimited(c context, s []byte) (context, i=
nt) {
>> +                       inCharset =3D true
>> +               case ']':
>> +                       inCharset =3D false
>> ++              case '/':
>> ++                      // If "</script" appears in a regex literal, the=
 '/' should not
>> ++                      // close the regex literal, and it will later be=
 escaped to
>> ++                      // "\x3C/script" in escapeText.
>> ++                      if i > 0 && i+7 <=3D len(s) && bytes.Compare(byt=
es.ToLower(s[i-1:i+7]), []byte("</script")) =3D=3D 0 {
>> ++                              i++
>> ++                      } else if !inCharset {
>> ++                              c.state, c.jsCtx =3D stateJS, jsCtxDivOp
>> ++                              return c, i + 1
>> ++                      }
>> +               default:
>> +                       // end delimiter
>> +                       if !inCharset {
>> +--
>> +2.24.4
>> +
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#188215): https://lists.openembedded.org/g/openembedd=
ed-core/message/188215
>> Mute This Topic: https://lists.openembedded.org/mt/101589537/7032091
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [s=
kulkarni@mvista.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

