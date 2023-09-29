Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D988E728DD
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 19:23:05 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.26908.1696015383035420126
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 12:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=t150TZiB;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.52, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9936b3d0286so1966124666b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 12:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696015381; x=1696620181; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1gAUJHAcN58u6ibyNAYx5iNGPxpkjSnj2hDttf3v70=;
        b=t150TZiBr3P8qW3cZuJOCVnn6IuSo+9Xq49kY+q0D61nEtnYz5sQbFX/gyXBBWug91
         RH8dp53RUvwU43gGCEs/dkqCiK8HsqcDaRbJ8C4woLBc0C/+6owwe74JNtfDb+S45QbA
         8eyT7Ma8oGRKszu7rep3SYulEKv3jSmATJBHlka+eO6dX/Ytg8A4No+boCEcmcTM3zpR
         mfZYVURE/NcjAtVe9aZpaUL0emrP27L012XZEmMocVSO8YXQgBqP7F8h0/E0SWSEiET3
         D1zuB1Lj+meCMIDCGbxO/5C4uFALewHoDukpTGBjOgqUPdIaMUUvz5TZLyhVUZYO8Ppn
         dDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696015381; x=1696620181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1gAUJHAcN58u6ibyNAYx5iNGPxpkjSnj2hDttf3v70=;
        b=NdFiG2XKuc7ReH8XFpafpjuCY1LlALYRamNQybT1D3l/tCfUGij8bNNEwcWo/vDxDF
         F0nKwOJXJGYY6NJwTn+J+pNrX8qWt2Rxof41RZNjVJIAJA64ZblwCecPiwl3ZmblPRUV
         BSb3+Xe4lnkVh+tNk9VW+aeGPFTm3P7D2u23tvgMNzXiiKQYvNgCDPaPoKx2sxdOGjSR
         122wAQsDXtCCUqXSIYFdCdsN0QdX8yKtbgBqZvs0qgp8nTWD/lMfrT3PAVVq5mZB7uWB
         Vd6pTfYiKwra+mQ6cilEum0KtFXVMoqr/wq01oLHK1FTiPQGoNSQe1Q4EFZgdONlB9sk
         WX3A==
X-Gm-Message-State: AOJu0Yx+gLXlr3CK/yUMn+1IsTAeqEpZa9nMSHUDukARQzQnHxAVjEd/
	y5j2HzGI/NqE+xRrhbheWNPXkxT88eSaJlNP0NMVxPe5H/xYLCwJ
X-Google-Smtp-Source: AGHT+IFyWTovBxeuesPEvrIrgo4ssGtagsYsDXeXjOhBslA3I7NhZ7FxPvFNyPOzw4DiCCoDiyKsmDhAmN1akYGURzs=
X-Received: by 2002:a17:906:3299:b0:9ae:5ba3:9d8f with SMTP id
 25-20020a170906329900b009ae5ba39d8fmr4769240ejw.17.1696015380138; Fri, 29 Sep
 2023 12:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230929185254.13571-1-skulkarni@mvista.com> <CAKzga+xfA_kXe7K171RcQKvVm=OApmw7ADpApP=iFC_FZT4AGA@mail.gmail.com>
 <CAOSpxdZqmMFoO7D9ES6+2vxUHp5G7Xb0BKHq2neWJGc5HpN2sQ@mail.gmail.com>
In-Reply-To: <CAOSpxdZqmMFoO7D9ES6+2vxUHp5G7Xb0BKHq2neWJGc5HpN2sQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 29 Sep 2023 09:22:48 -1000
Message-ID: <CAOSpxdZxkoFT-bN-0eSRXqLwZ1=BQsBScWUrsn0GzyNC+wTkxA@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH v2] go: Update fix for CVE-2023-24538 & CVE-2023-39318
To: Shubham Kulkarni <skulkarni@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 19:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188416

On Fri, Sep 29, 2023 at 9:20=E2=80=AFAM Steve Sakoman <steve@sakoman.com> w=
rote:
>
> On Fri, Sep 29, 2023 at 9:06=E2=80=AFAM Shubham Kulkarni <skulkarni@mvist=
a.com> wrote:
> >
> > Hi Steve,
> >
> > Can you please check, if you are able to get these patches I sent for t=
he Kirkstone & Dunfell branch.
> > It is not generating the group links/Topic id links like https://lists.=
openembedded.org/g/openembedded-devel/message/.
> >
> > I have sent a v2 version for both the dunfell and kirkstone, but still =
it didn't generate the links.
> > If you are able to get these patches, you can take either original or v=
2 for both Dunfell and Kirkstone. Both v1 & v2 are the same, just resent fo=
r link generation. Apologies for the inconvenience caused.
>
> No, I'm not seeing these on the list :-(

Actually the kirsktone arrived just after sent this email!

Steve

> > On Sat, Sep 30, 2023 at 12:23=E2=80=AFAM Shubham Kulkarni <skulkarni@mv=
ista.com> wrote:
> >>
> >> From: Shubham Kulkarni <skulkarni@mvista.com>
> >>
> >> Add missing files in fix for CVE-2023-24538 & CVE-2023-39318
> >>
> >> Upstream Link -
> >> CVE-2023-24538: https://github.com/golang/go/commit/b1e3ecfa06b6701442=
9a197ec5e134ce4303ad9b
> >> CVE-2023-39318: https://github.com/golang/go/commit/023b542edf38e2a1f8=
7fcefb9f75ff2f99401b4c
> >>
> >> Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> >> ---
> >>  meta/recipes-devtools/go/go-1.14.inc          |   5 +-
> >>  .../go/go-1.14/CVE-2023-24538-1.patch         |   4 +-
> >>  .../go/go-1.14/CVE-2023-24538-2.patch         | 447 ++++++++++++-
> >>  .../go/go-1.14/CVE-2023-24538_3.patch         | 393 ++++++++++++
> >>  .../go/go-1.14/CVE-2023-24538_4.patch         | 497 +++++++++++++++
> >>  .../go/go-1.14/CVE-2023-24538_5.patch         | 585 +++++++++++++++++=
+
> >>  ...3-24538-3.patch =3D> CVE-2023-24538_6.patch} | 175 +++++-
> >>  .../go/go-1.14/CVE-2023-39318.patch           |  38 +-
> >>  8 files changed, 2124 insertions(+), 20 deletions(-)
> >>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24538_3.=
patch
> >>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24538_4.=
patch
> >>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24538_5.=
patch
> >>  rename meta/recipes-devtools/go/go-1.14/{CVE-2023-24538-3.patch =3D> =
CVE-2023-24538_6.patch} (53%)
> >>
> >> diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devto=
ols/go/go-1.14.inc
> >> index be63f64825..091b778de8 100644
> >> --- a/meta/recipes-devtools/go/go-1.14.inc
> >> +++ b/meta/recipes-devtools/go/go-1.14.inc
> >> @@ -60,7 +60,10 @@ SRC_URI +=3D "\
> >>      file://CVE-2023-24534.patch \
> >>      file://CVE-2023-24538-1.patch \
> >>      file://CVE-2023-24538-2.patch \
> >> -    file://CVE-2023-24538-3.patch \
> >> +    file://CVE-2023-24538_3.patch \
> >> +    file://CVE-2023-24538_4.patch \
> >> +    file://CVE-2023-24538_5.patch \
> >> +    file://CVE-2023-24538_6.patch \
> >>      file://CVE-2023-24539.patch \
> >>      file://CVE-2023-24540.patch \
> >>      file://CVE-2023-29405-1.patch \
> >> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch b=
/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
> >> index eda26e5ff6..23c5075e41 100644
> >> --- a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
> >> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
> >> @@ -1,7 +1,7 @@
> >>  From 8acd01094d9ee17f6e763a61e49a8a808b3a9ddb Mon Sep 17 00:00:00 200=
1
> >>  From: Brad Fitzpatrick <bradfitz@golang.org>
> >>  Date: Mon, 2 Aug 2021 14:55:51 -0700
> >> -Subject: [PATCH 1/3] net/netip: add new IP address package
> >> +Subject: [PATCH 1/6] net/netip: add new IP address package
> >>
> >>  Co-authored-by: Alex Willmer <alex@moreati.org.uk> (GitHub @moreati)
> >>  Co-authored-by: Alexander Yastrebov <yastrebov.alex@gmail.com>
> >> @@ -31,7 +31,7 @@ Trust: Brad Fitzpatrick <bradfitz@golang.org>
> >>
> >>  Dependency Patch #1
> >>
> >> -Upstream-Status: Backport [https://github.com/golang/go/commit/a59e33=
224e42d60a97fa720a45e1b74eb6aaa3d0]
> >> +Upstream-Status: Backport from https://github.com/golang/go/commit/a5=
9e33224e42d60a97fa720a45e1b74eb6aaa3d0
> >>  CVE: CVE-2023-24538
> >>  Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> >>  ---
> >> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch b=
/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
> >> index 5036f2890b..3840617a32 100644
> >> --- a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
> >> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
> >> @@ -1,7 +1,7 @@
> >>  From 6fc21505614f36178df0dad7034b6b8e3f7588d5 Mon Sep 17 00:00:00 200=
1
> >>  From: empijei <robclap8@gmail.com>
> >>  Date: Fri, 27 Mar 2020 19:27:55 +0100
> >> -Subject: [PATCH 2/3] html/template,text/template: switch to Unicode e=
scapes
> >> +Subject: [PATCH 2/6] html/template,text/template: switch to Unicode e=
scapes
> >>   for JSON compatibility
> >>  MIME-Version: 1.0
> >>  Content-Type: text/plain; charset=3DUTF-8
> >> @@ -31,10 +31,238 @@ Upstream-Status: Backport from https://github.com=
/golang/go/commit/d4d298040d072
> >>  CVE: CVE-2023-24538
> >>  Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> >>  ---
> >> - src/html/template/js.go    | 70 +++++++++++++++++++++++++++---------=
----------
> >> - src/text/template/funcs.go |  8 +++---
> >> - 2 files changed, 46 insertions(+), 32 deletions(-)
> >> + src/html/template/content_test.go  | 70 +++++++++++++++++++---------=
----------
> >> + src/html/template/escape_test.go   |  6 ++--
> >> + src/html/template/example_test.go  |  6 ++--
> >> + src/html/template/js.go            | 70 +++++++++++++++++++++++-----=
----------
> >> + src/html/template/js_test.go       | 68 ++++++++++++++++++----------=
--------
> >> + src/html/template/template_test.go | 39 +++++++++++++++++++++
> >> + src/text/template/exec_test.go     |  6 ++--
> >> + src/text/template/funcs.go         |  8 ++---
> >> + 8 files changed, 163 insertions(+), 110 deletions(-)
> >>
> >> +diff --git a/src/html/template/content_test.go b/src/html/template/co=
ntent_test.go
> >> +index 72d56f5..bd86527 100644
> >> +--- a/src/html/template/content_test.go
> >> ++++ b/src/html/template/content_test.go
> >> +@@ -18,7 +18,7 @@ func TestTypedContent(t *testing.T) {
> >> +               HTML(`Hello, <b>World</b> &amp;tc!`),
> >> +               HTMLAttr(` dir=3D"ltr"`),
> >> +               JS(`c && alert("Hello, World!");`),
> >> +-              JSStr(`Hello, World & O'Reilly\x21`),
> >> ++              JSStr(`Hello, World & O'Reilly\u0021`),
> >> +               URL(`greeting=3DH%69,&addressee=3D(World)`),
> >> +               Srcset(`greeting=3DH%69,&addressee=3D(World) 2x, https=
://golang.org/favicon.ico 500.5w`),
> >> +               URL(`,foo/,`),
> >> +@@ -70,7 +70,7 @@ func TestTypedContent(t *testing.T) {
> >> +                               `Hello, <b>World</b> &amp;tc!`,
> >> +                               ` dir=3D&#34;ltr&#34;`,
> >> +                               `c &amp;&amp; alert(&#34;Hello, World!=
&#34;);`,
> >> +-                              `Hello, World &amp; O&#39;Reilly\x21`,
> >> ++                              `Hello, World &amp; O&#39;Reilly\u0021=
`,
> >> +                               `greeting=3DH%69,&amp;addressee=3D(Wor=
ld)`,
> >> +                               `greeting=3DH%69,&amp;addressee=3D(Wor=
ld) 2x, https://golang.org/favicon.ico 500.5w`,
> >> +                               `,foo/,`,
> >> +@@ -100,7 +100,7 @@ func TestTypedContent(t *testing.T) {
> >> +                               `Hello,&#32;World&#32;&amp;tc!`,
> >> +                               `&#32;dir&#61;&#34;ltr&#34;`,
> >> +                               `c&#32;&amp;&amp;&#32;alert(&#34;Hello=
,&#32;World!&#34;);`,
> >> +-                              `Hello,&#32;World&#32;&amp;&#32;O&#39;=
Reilly\x21`,
> >> ++                              `Hello,&#32;World&#32;&amp;&#32;O&#39;=
Reilly\u0021`,
> >> +                               `greeting&#61;H%69,&amp;addressee&#61;=
(World)`,
> >> +                               `greeting&#61;H%69,&amp;addressee&#61;=
(World)&#32;2x,&#32;https://golang.org/favicon.ico&#32;500.5w`,
> >> +                               `,foo/,`,
> >> +@@ -115,7 +115,7 @@ func TestTypedContent(t *testing.T) {
> >> +                               `Hello, World &amp;tc!`,
> >> +                               ` dir=3D&#34;ltr&#34;`,
> >> +                               `c &amp;&amp; alert(&#34;Hello, World!=
&#34;);`,
> >> +-                              `Hello, World &amp; O&#39;Reilly\x21`,
> >> ++                              `Hello, World &amp; O&#39;Reilly\u0021=
`,
> >> +                               `greeting=3DH%69,&amp;addressee=3D(Wor=
ld)`,
> >> +                               `greeting=3DH%69,&amp;addressee=3D(Wor=
ld) 2x, https://golang.org/favicon.ico 500.5w`,
> >> +                               `,foo/,`,
> >> +@@ -130,7 +130,7 @@ func TestTypedContent(t *testing.T) {
> >> +                               `Hello, &lt;b&gt;World&lt;/b&gt; &amp;=
tc!`,
> >> +                               ` dir=3D&#34;ltr&#34;`,
> >> +                               `c &amp;&amp; alert(&#34;Hello, World!=
&#34;);`,
> >> +-                              `Hello, World &amp; O&#39;Reilly\x21`,
> >> ++                              `Hello, World &amp; O&#39;Reilly\u0021=
`,
> >> +                               `greeting=3DH%69,&amp;addressee=3D(Wor=
ld)`,
> >> +                               `greeting=3DH%69,&amp;addressee=3D(Wor=
ld) 2x, https://golang.org/favicon.ico 500.5w`,
> >> +                               `,foo/,`,
> >> +@@ -146,7 +146,7 @@ func TestTypedContent(t *testing.T) {
> >> +                               // Not escaped.
> >> +                               `c && alert("Hello, World!");`,
> >> +                               // Escape sequence not over-escaped.
> >> +-                              `"Hello, World & O'Reilly\x21"`,
> >> ++                              `"Hello, World & O'Reilly\u0021"`,
> >> +                               `"greeting=3DH%69,\u0026addressee=3D(W=
orld)"`,
> >> +                               `"greeting=3DH%69,\u0026addressee=3D(W=
orld) 2x, https://golang.org/favicon.ico 500.5w"`,
> >> +                               `",foo/,"`,
> >> +@@ -162,7 +162,7 @@ func TestTypedContent(t *testing.T) {
> >> +                               // Not JS escaped but HTML escaped.
> >> +                               `c &amp;&amp; alert(&#34;Hello, World!=
&#34;);`,
> >> +                               // Escape sequence not over-escaped.
> >> +-                              `&#34;Hello, World &amp; O&#39;Reilly\=
x21&#34;`,
> >> ++                              `&#34;Hello, World &amp; O&#39;Reilly\=
u0021&#34;`,
> >> +                               `&#34;greeting=3DH%69,\u0026addressee=
=3D(World)&#34;`,
> >> +                               `&#34;greeting=3DH%69,\u0026addressee=
=3D(World) 2x, https://golang.org/favicon.ico 500.5w&#34;`,
> >> +                               `&#34;,foo/,&#34;`,
> >> +@@ -171,30 +171,30 @@ func TestTypedContent(t *testing.T) {
> >> +               {
> >> +                       `<script>alert("{{.}}")</script>`,
> >> +                       []string{
> >> +-                              `\x3cb\x3e \x22foo%\x22 O\x27Reilly \x=
26bar;`,
> >> +-                              `a[href =3D~ \x22\/\/example.com\x22]#=
foo`,
> >> +-                              `Hello, \x3cb\x3eWorld\x3c\/b\x3e \x26=
amp;tc!`,
> >> +-                              ` dir=3D\x22ltr\x22`,
> >> +-                              `c \x26\x26 alert(\x22Hello, World!\x2=
2);`,
> >> ++                              `\u003cb\u003e \u0022foo%\u0022 O\u002=
7Reilly \u0026bar;`,
> >> ++                              `a[href =3D~ \u0022\/\/example.com\u00=
22]#foo`,
> >> ++                              `Hello, \u003cb\u003eWorld\u003c\/b\u0=
03e \u0026amp;tc!`,
> >> ++                              ` dir=3D\u0022ltr\u0022`,
> >> ++                              `c \u0026\u0026 alert(\u0022Hello, Wor=
ld!\u0022);`,
> >> +                               // Escape sequence not over-escaped.
> >> +-                              `Hello, World \x26 O\x27Reilly\x21`,
> >> +-                              `greeting=3DH%69,\x26addressee=3D(Worl=
d)`,
> >> +-                              `greeting=3DH%69,\x26addressee=3D(Worl=
d) 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
> >> ++                              `Hello, World \u0026 O\u0027Reilly\u00=
21`,
> >> ++                              `greeting=3DH%69,\u0026addressee=3D(Wo=
rld)`,
> >> ++                              `greeting=3DH%69,\u0026addressee=3D(Wo=
rld) 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
> >> +                               `,foo\/,`,
> >> +                       },
> >> +               },
> >> +               {
> >> +                       `<script type=3D"text/javascript">alert("{{.}}=
")</script>`,
> >> +                       []string{
> >> +-                              `\x3cb\x3e \x22foo%\x22 O\x27Reilly \x=
26bar;`,
> >> +-                              `a[href =3D~ \x22\/\/example.com\x22]#=
foo`,
> >> +-                              `Hello, \x3cb\x3eWorld\x3c\/b\x3e \x26=
amp;tc!`,
> >> +-                              ` dir=3D\x22ltr\x22`,
> >> +-                              `c \x26\x26 alert(\x22Hello, World!\x2=
2);`,
> >> ++                              `\u003cb\u003e \u0022foo%\u0022 O\u002=
7Reilly \u0026bar;`,
> >> ++                              `a[href =3D~ \u0022\/\/example.com\u00=
22]#foo`,
> >> ++                              `Hello, \u003cb\u003eWorld\u003c\/b\u0=
03e \u0026amp;tc!`,
> >> ++                              ` dir=3D\u0022ltr\u0022`,
> >> ++                              `c \u0026\u0026 alert(\u0022Hello, Wor=
ld!\u0022);`,
> >> +                               // Escape sequence not over-escaped.
> >> +-                              `Hello, World \x26 O\x27Reilly\x21`,
> >> +-                              `greeting=3DH%69,\x26addressee=3D(Worl=
d)`,
> >> +-                              `greeting=3DH%69,\x26addressee=3D(Worl=
d) 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
> >> ++                              `Hello, World \u0026 O\u0027Reilly\u00=
21`,
> >> ++                              `greeting=3DH%69,\u0026addressee=3D(Wo=
rld)`,
> >> ++                              `greeting=3DH%69,\u0026addressee=3D(Wo=
rld) 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
> >> +                               `,foo\/,`,
> >> +                       },
> >> +               },
> >> +@@ -208,7 +208,7 @@ func TestTypedContent(t *testing.T) {
> >> +                               // Not escaped.
> >> +                               `c && alert("Hello, World!");`,
> >> +                               // Escape sequence not over-escaped.
> >> +-                              `"Hello, World & O'Reilly\x21"`,
> >> ++                              `"Hello, World & O'Reilly\u0021"`,
> >> +                               `"greeting=3DH%69,\u0026addressee=3D(W=
orld)"`,
> >> +                               `"greeting=3DH%69,\u0026addressee=3D(W=
orld) 2x, https://golang.org/favicon.ico 500.5w"`,
> >> +                               `",foo/,"`,
> >> +@@ -224,7 +224,7 @@ func TestTypedContent(t *testing.T) {
> >> +                               `Hello, <b>World</b> &amp;tc!`,
> >> +                               ` dir=3D&#34;ltr&#34;`,
> >> +                               `c &amp;&amp; alert(&#34;Hello, World!=
&#34;);`,
> >> +-                              `Hello, World &amp; O&#39;Reilly\x21`,
> >> ++                              `Hello, World &amp; O&#39;Reilly\u0021=
`,
> >> +                               `greeting=3DH%69,&amp;addressee=3D(Wor=
ld)`,
> >> +                               `greeting=3DH%69,&amp;addressee=3D(Wor=
ld) 2x, https://golang.org/favicon.ico 500.5w`,
> >> +                               `,foo/,`,
> >> +@@ -233,15 +233,15 @@ func TestTypedContent(t *testing.T) {
> >> +               {
> >> +                       `<button onclick=3D'alert("{{.}}")'>`,
> >> +                       []string{
> >> +-                              `\x3cb\x3e \x22foo%\x22 O\x27Reilly \x=
26bar;`,
> >> +-                              `a[href =3D~ \x22\/\/example.com\x22]#=
foo`,
> >> +-                              `Hello, \x3cb\x3eWorld\x3c\/b\x3e \x26=
amp;tc!`,
> >> +-                              ` dir=3D\x22ltr\x22`,
> >> +-                              `c \x26\x26 alert(\x22Hello, World!\x2=
2);`,
> >> ++                              `\u003cb\u003e \u0022foo%\u0022 O\u002=
7Reilly \u0026bar;`,
> >> ++                              `a[href =3D~ \u0022\/\/example.com\u00=
22]#foo`,
> >> ++                              `Hello, \u003cb\u003eWorld\u003c\/b\u0=
03e \u0026amp;tc!`,
> >> ++                              ` dir=3D\u0022ltr\u0022`,
> >> ++                              `c \u0026\u0026 alert(\u0022Hello, Wor=
ld!\u0022);`,
> >> +                               // Escape sequence not over-escaped.
> >> +-                              `Hello, World \x26 O\x27Reilly\x21`,
> >> +-                              `greeting=3DH%69,\x26addressee=3D(Worl=
d)`,
> >> +-                              `greeting=3DH%69,\x26addressee=3D(Worl=
d) 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
> >> ++                              `Hello, World \u0026 O\u0027Reilly\u00=
21`,
> >> ++                              `greeting=3DH%69,\u0026addressee=3D(Wo=
rld)`,
> >> ++                              `greeting=3DH%69,\u0026addressee=3D(Wo=
rld) 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
> >> +                               `,foo\/,`,
> >> +                       },
> >> +               },
> >> +@@ -253,7 +253,7 @@ func TestTypedContent(t *testing.T) {
> >> +                               `Hello%2c%20%3cb%3eWorld%3c%2fb%3e%20%=
26amp%3btc%21`,
> >> +                               `%20dir%3d%22ltr%22`,
> >> +                               `c%20%26%26%20alert%28%22Hello%2c%20Wo=
rld%21%22%29%3b`,
> >> +-                              `Hello%2c%20World%20%26%20O%27Reilly%5=
cx21`,
> >> ++                              `Hello%2c%20World%20%26%20O%27Reilly%5=
cu0021`,
> >> +                               // Quotes and parens are escaped but %=
69 is not over-escaped. HTML escaping is done.
> >> +                               `greeting=3DH%69,&amp;addressee=3D%28W=
orld%29`,
> >> +                               `greeting%3dH%2569%2c%26addressee%3d%2=
8World%29%202x%2c%20https%3a%2f%2fgolang.org%2ffavicon.ico%20500.5w`,
> >> +@@ -268,7 +268,7 @@ func TestTypedContent(t *testing.T) {
> >> +                               `Hello%2c%20%3cb%3eWorld%3c%2fb%3e%20%=
26amp%3btc%21`,
> >> +                               `%20dir%3d%22ltr%22`,
> >> +                               `c%20%26%26%20alert%28%22Hello%2c%20Wo=
rld%21%22%29%3b`,
> >> +-                              `Hello%2c%20World%20%26%20O%27Reilly%5=
cx21`,
> >> ++                              `Hello%2c%20World%20%26%20O%27Reilly%5=
cu0021`,
> >> +                               // Quotes and parens are escaped but %=
69 is not over-escaped. HTML escaping is not done.
> >> +                               `greeting=3DH%69,&addressee=3D%28World=
%29`,
> >> +                               `greeting%3dH%2569%2c%26addressee%3d%2=
8World%29%202x%2c%20https%3a%2f%2fgolang.org%2ffavicon.ico%20500.5w`,
> >> +diff --git a/src/html/template/escape_test.go b/src/html/template/esc=
ape_test.go
> >> +index e72a9ba..c709660 100644
> >> +--- a/src/html/template/escape_test.go
> >> ++++ b/src/html/template/escape_test.go
> >> +@@ -238,7 +238,7 @@ func TestEscape(t *testing.T) {
> >> +               {
> >> +                       "jsStr",
> >> +                       "<button onclick=3D'alert(&quot;{{.H}}&quot;)'=
>",
> >> +-                      `<button onclick=3D'alert(&quot;\x3cHello\x3e&=
quot;)'>`,
> >> ++                      `<button onclick=3D'alert(&quot;\u003cHello\u0=
03e&quot;)'>`,
> >> +               },
> >> +               {
> >> +                       "badMarshaler",
> >> +@@ -259,7 +259,7 @@ func TestEscape(t *testing.T) {
> >> +               {
> >> +                       "jsRe",
> >> +                       `<button onclick=3D'alert(/{{"foo+bar"}}/.test=
(""))'>`,
> >> +-                      `<button onclick=3D'alert(/foo\x2bbar/.test(""=
))'>`,
> >> ++                      `<button onclick=3D'alert(/foo\u002bbar/.test(=
""))'>`,
> >> +               },
> >> +               {
> >> +                       "jsReBlank",
> >> +@@ -825,7 +825,7 @@ func TestEscapeSet(t *testing.T) {
> >> +                               "main":   `<button onclick=3D"title=3D=
'{{template "helper"}}'; ...">{{template "helper"}}</button>`,
> >> +                               "helper": `{{11}} of {{"<100>"}}`,
> >> +                       },
> >> +-                      `<button onclick=3D"title=3D'11 of \x3c100\x3e=
'; ...">11 of &lt;100&gt;</button>`,
> >> ++                      `<button onclick=3D"title=3D'11 of \u003c100\u=
003e'; ...">11 of &lt;100&gt;</button>`,
> >> +               },
> >> +               // A non-recursive template that ends in a different c=
ontext.
> >> +               // helper starts in jsCtxRegexp and ends in jsCtxDivOp=
.
> >> +diff --git a/src/html/template/example_test.go b/src/html/template/ex=
ample_test.go
> >> +index 9d965f1..6cf936f 100644
> >> +--- a/src/html/template/example_test.go
> >> ++++ b/src/html/template/example_test.go
> >> +@@ -116,9 +116,9 @@ func Example_escape() {
> >> +       // &#34;Fran &amp; Freddie&#39;s Diner&#34; &lt;tasty@example.=
com&gt;
> >> +       // &#34;Fran &amp; Freddie&#39;s Diner&#34; &lt;tasty@example.=
com&gt;
> >> +       // &#34;Fran &amp; Freddie&#39;s Diner&#34;32&lt;tasty@example=
.com&gt;
> >> +-      // \"Fran \x26 Freddie\'s Diner\" \x3Ctasty@example.com\x3E
> >> +-      // \"Fran \x26 Freddie\'s Diner\" \x3Ctasty@example.com\x3E
> >> +-      // \"Fran \x26 Freddie\'s Diner\"32\x3Ctasty@example.com\x3E
> >> ++      // \"Fran \u0026 Freddie\'s Diner\" \u003Ctasty@example.com\u0=
03E
> >> ++      // \"Fran \u0026 Freddie\'s Diner\" \u003Ctasty@example.com\u0=
03E
> >> ++      // \"Fran \u0026 Freddie\'s Diner\"32\u003Ctasty@example.com\u=
003E
> >> +       // %22Fran+%26+Freddie%27s+Diner%2232%3Ctasty%40example.com%3E
> >> +
> >> + }
> >>  diff --git a/src/html/template/js.go b/src/html/template/js.go
> >>  index 0e91458..ea9c183 100644
> >>  --- a/src/html/template/js.go
> >> @@ -173,6 +401,217 @@ index 0e91458..ea9c183 100644
> >>         '?':  `\?`,
> >>         '[':  `\[`,
> >>         '\\': `\\`,
> >> +diff --git a/src/html/template/js_test.go b/src/html/template/js_test=
.go
> >> +index 075adaa..d7ee47b 100644
> >> +--- a/src/html/template/js_test.go
> >> ++++ b/src/html/template/js_test.go
> >> +@@ -137,7 +137,7 @@ func TestJSValEscaper(t *testing.T) {
> >> +               {"foo", `"foo"`},
> >> +               // Newlines.
> >> +               {"\r\n\u2028\u2029", `"\r\n\u2028\u2029"`},
> >> +-              // "\v" =3D=3D "v" on IE 6 so use "\x0b" instead.
> >> ++              // "\v" =3D=3D "v" on IE 6 so use "\u000b" instead.
> >> +               {"\t\x0b", `"\t\u000b"`},
> >> +               {struct{ X, Y int }{1, 2}, `{"X":1,"Y":2}`},
> >> +               {[]interface{}{}, "[]"},
> >> +@@ -173,7 +173,7 @@ func TestJSStrEscaper(t *testing.T) {
> >> +       }{
> >> +               {"", ``},
> >> +               {"foo", `foo`},
> >> +-              {"\u0000", `\0`},
> >> ++              {"\u0000", `\u0000`},
> >> +               {"\t", `\t`},
> >> +               {"\n", `\n`},
> >> +               {"\r", `\r`},
> >> +@@ -183,14 +183,14 @@ func TestJSStrEscaper(t *testing.T) {
> >> +               {"\\n", `\\n`},
> >> +               {"foo\r\nbar", `foo\r\nbar`},
> >> +               // Preserve attribute boundaries.
> >> +-              {`"`, `\x22`},
> >> +-              {`'`, `\x27`},
> >> ++              {`"`, `\u0022`},
> >> ++              {`'`, `\u0027`},
> >> +               // Allow embedding in HTML without further escaping.
> >> +-              {`&amp;`, `\x26amp;`},
> >> ++              {`&amp;`, `\u0026amp;`},
> >> +               // Prevent breaking out of text node and element bound=
aries.
> >> +-              {"</script>", `\x3c\/script\x3e`},
> >> +-              {"<![CDATA[", `\x3c![CDATA[`},
> >> +-              {"]]>", `]]\x3e`},
> >> ++              {"</script>", `\u003c\/script\u003e`},
> >> ++              {"<![CDATA[", `\u003c![CDATA[`},
> >> ++              {"]]>", `]]\u003e`},
> >> +               // https://dev.w3.org/html5/markup/aria/syntax.html#es=
caping-text-span
> >> +               //   "The text in style, script, title, and textarea e=
lements
> >> +               //   must not have an escaping text span start that is=
 not
> >> +@@ -201,11 +201,11 @@ func TestJSStrEscaper(t *testing.T) {
> >> +               // allow regular text content to be interpreted as scr=
ipt
> >> +               // allowing script execution via a combination of a JS=
 string
> >> +               // injection followed by an HTML text injection.
> >> +-              {"<!--", `\x3c!--`},
> >> +-              {"-->", `--\x3e`},
> >> ++              {"<!--", `\u003c!--`},
> >> ++              {"-->", `--\u003e`},
> >> +               // From https://code.google.com/p/doctype/wiki/Article=
Utf7
> >> +               {"+ADw-script+AD4-alert(1)+ADw-/script+AD4-",
> >> +-                      `\x2bADw-script\x2bAD4-alert(1)\x2bADw-\/scrip=
t\x2bAD4-`,
> >> ++                      `\u002bADw-script\u002bAD4-alert(1)\u002bADw-\=
/script\u002bAD4-`,
> >> +               },
> >> +               // Invalid UTF-8 sequence
> >> +               {"foo\xA0bar", "foo\xA0bar"},
> >> +@@ -228,7 +228,7 @@ func TestJSRegexpEscaper(t *testing.T) {
> >> +       }{
> >> +               {"", `(?:)`},
> >> +               {"foo", `foo`},
> >> +-              {"\u0000", `\0`},
> >> ++              {"\u0000", `\u0000`},
> >> +               {"\t", `\t`},
> >> +               {"\n", `\n`},
> >> +               {"\r", `\r`},
> >> +@@ -238,19 +238,19 @@ func TestJSRegexpEscaper(t *testing.T) {
> >> +               {"\\n", `\\n`},
> >> +               {"foo\r\nbar", `foo\r\nbar`},
> >> +               // Preserve attribute boundaries.
> >> +-              {`"`, `\x22`},
> >> +-              {`'`, `\x27`},
> >> ++              {`"`, `\u0022`},
> >> ++              {`'`, `\u0027`},
> >> +               // Allow embedding in HTML without further escaping.
> >> +-              {`&amp;`, `\x26amp;`},
> >> ++              {`&amp;`, `\u0026amp;`},
> >> +               // Prevent breaking out of text node and element bound=
aries.
> >> +-              {"</script>", `\x3c\/script\x3e`},
> >> +-              {"<![CDATA[", `\x3c!\[CDATA\[`},
> >> +-              {"]]>", `\]\]\x3e`},
> >> ++              {"</script>", `\u003c\/script\u003e`},
> >> ++              {"<![CDATA[", `\u003c!\[CDATA\[`},
> >> ++              {"]]>", `\]\]\u003e`},
> >> +               // Escaping text spans.
> >> +-              {"<!--", `\x3c!\-\-`},
> >> +-              {"-->", `\-\-\x3e`},
> >> ++              {"<!--", `\u003c!\-\-`},
> >> ++              {"-->", `\-\-\u003e`},
> >> +               {"*", `\*`},
> >> +-              {"+", `\x2b`},
> >> ++              {"+", `\u002b`},
> >> +               {"?", `\?`},
> >> +               {"[](){}", `\[\]\(\)\{\}`},
> >> +               {"$foo|x.y", `\$foo\|x\.y`},
> >> +@@ -284,27 +284,27 @@ func TestEscapersOnLower7AndSelectHighCodepoint=
s(t *testing.T) {
> >> +               {
> >> +                       "jsStrEscaper",
> >> +                       jsStrEscaper,
> >> +-                      "\\0\x01\x02\x03\x04\x05\x06\x07" +
> >> +-                              "\x08\\t\\n\\x0b\\f\\r\x0E\x0F" +
> >> +-                              "\x10\x11\x12\x13\x14\x15\x16\x17" +
> >> +-                              "\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f" +
> >> +-                              ` !\x22#$%\x26\x27()*\x2b,-.\/` +
> >> +-                              `0123456789:;\x3c=3D\x3e?` +
> >> ++                      `\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0=
007` +
> >> ++                              `\u0008\t\n\u000b\f\r\u000e\u000f` +
> >> ++                              `\u0010\u0011\u0012\u0013\u0014\u0015\=
u0016\u0017` +
> >> ++                              `\u0018\u0019\u001a\u001b\u001c\u001d\=
u001e\u001f` +
> >> ++                              ` !\u0022#$%\u0026\u0027()*\u002b,-.\/=
` +
> >> ++                              `0123456789:;\u003c=3D\u003e?` +
> >> +                               `@ABCDEFGHIJKLMNO` +
> >> +                               `PQRSTUVWXYZ[\\]^_` +
> >> +                               "`abcdefghijklmno" +
> >> +-                              "pqrstuvwxyz{|}~\x7f" +
> >> ++                              "pqrstuvwxyz{|}~\u007f" +
> >> +                               "\u00A0\u0100\\u2028\\u2029\ufeff\U000=
1D11E",
> >> +               },
> >> +               {
> >> +                       "jsRegexpEscaper",
> >> +                       jsRegexpEscaper,
> >> +-                      "\\0\x01\x02\x03\x04\x05\x06\x07" +
> >> +-                              "\x08\\t\\n\\x0b\\f\\r\x0E\x0F" +
> >> +-                              "\x10\x11\x12\x13\x14\x15\x16\x17" +
> >> +-                              "\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f" +
> >> +-                              ` !\x22#\$%\x26\x27\(\)\*\x2b,\-\.\/` =
+
> >> +-                              `0123456789:;\x3c=3D\x3e\?` +
> >> ++                      `\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0=
007` +
> >> ++                              `\u0008\t\n\u000b\f\r\u000e\u000f` +
> >> ++                              `\u0010\u0011\u0012\u0013\u0014\u0015\=
u0016\u0017` +
> >> ++                              `\u0018\u0019\u001a\u001b\u001c\u001d\=
u001e\u001f` +
> >> ++                              ` !\u0022#\$%\u0026\u0027\(\)\*\u002b,=
\-\.\/` +
> >> ++                              `0123456789:;\u003c=3D\u003e\?` +
> >> +                               `@ABCDEFGHIJKLMNO` +
> >> +                               `PQRSTUVWXYZ\[\\\]\^_` +
> >> +                               "`abcdefghijklmno" +
> >> +diff --git a/src/html/template/template_test.go b/src/html/template/t=
emplate_test.go
> >> +index 13e6ba4..86bd4db 100644
> >> +--- a/src/html/template/template_test.go
> >> ++++ b/src/html/template/template_test.go
> >> +@@ -6,6 +6,7 @@ package template_test
> >> +
> >> + import (
> >> +       "bytes"
> >> ++      "encoding/json"
> >> +       . "html/template"
> >> +       "strings"
> >> +       "testing"
> >> +@@ -121,6 +122,44 @@ func TestNumbers(t *testing.T) {
> >> +       c.mustExecute(c.root, nil, "12.34 7.5")
> >> + }
> >> +
> >> ++func TestStringsInScriptsWithJsonContentTypeAreCorrectlyEscaped(t *t=
esting.T) {
> >> ++      // See #33671 and #37634 for more context on this.
> >> ++      tests :=3D []struct{ name, in string }{
> >> ++              {"empty", ""},
> >> ++              {"invalid", string(rune(-1))},
> >> ++              {"null", "\u0000"},
> >> ++              {"unit separator", "\u001F"},
> >> ++              {"tab", "\t"},
> >> ++              {"gt and lt", "<>"},
> >> ++              {"quotes", `'"`},
> >> ++              {"ASCII letters", "ASCII letters"},
> >> ++              {"Unicode", "=CA=95=E2=8A=99=CF=96=E2=8A=99=CA=94"},
> >> ++              {"Pizza", "=F0=9F=8D=95"},
> >> ++      }
> >> ++      const (
> >> ++              prefix =3D `<script type=3D"application/ld+json">`
> >> ++              suffix =3D `</script>`
> >> ++              templ  =3D prefix + `"{{.}}"` + suffix
> >> ++      )
> >> ++      tpl :=3D Must(New("JS string is JSON string").Parse(templ))
> >> ++      for _, tt :=3D range tests {
> >> ++              t.Run(tt.name, func(t *testing.T) {
> >> ++                      var buf bytes.Buffer
> >> ++                      if err :=3D tpl.Execute(&buf, tt.in); err !=3D=
 nil {
> >> ++                              t.Fatalf("Cannot render template: %v",=
 err)
> >> ++                      }
> >> ++                      trimmed :=3D bytes.TrimSuffix(bytes.TrimPrefix=
(buf.Bytes(), []byte(prefix)), []byte(suffix))
> >> ++                      var got string
> >> ++                      if err :=3D json.Unmarshal(trimmed, &got); err=
 !=3D nil {
> >> ++                              t.Fatalf("Cannot parse JS string %q as=
 JSON: %v", trimmed[1:len(trimmed)-1], err)
> >> ++                      }
> >> ++                      if got !=3D tt.in {
> >> ++                              t.Errorf("Serialization changed the st=
ring value: got %q want %q", got, tt.in)
> >> ++                      }
> >> ++              })
> >> ++      }
> >> ++}
> >> ++
> >> + type testCase struct {
> >> +       t    *testing.T
> >> +       root *Template
> >> +diff --git a/src/text/template/exec_test.go b/src/text/template/exec_=
test.go
> >> +index 77294ed..b8a809e 100644
> >> +--- a/src/text/template/exec_test.go
> >> ++++ b/src/text/template/exec_test.go
> >> +@@ -911,9 +911,9 @@ func TestJSEscaping(t *testing.T) {
> >> +               {`Go "jump" \`, `Go \"jump\" \\`},
> >> +               {`Yukihiro says "=E4=BB=8A=E6=97=A5=E3=81=AF=E4=B8=96=
=E7=95=8C"`, `Yukihiro says \"=E4=BB=8A=E6=97=A5=E3=81=AF=E4=B8=96=E7=95=8C=
\"`},
> >> +               {"unprintable \uFDFF", `unprintable \uFDFF`},
> >> +-              {`<html>`, `\x3Chtml\x3E`},
> >> +-              {`no =3D in attributes`, `no \x3D in attributes`},
> >> +-              {`&#x27; does not become HTML entity`, `\x26#x27; does=
 not become HTML entity`},
> >> ++              {`<html>`, `\u003Chtml\u003E`},
> >> ++              {`no =3D in attributes`, `no \u003D in attributes`},
> >> ++              {`&#x27; does not become HTML entity`, `\u0026#x27; do=
es not become HTML entity`},
> >> +       }
> >> +       for _, tc :=3D range testCases {
> >> +               s :=3D JSEscapeString(tc.in)
> >>  diff --git a/src/text/template/funcs.go b/src/text/template/funcs.go
> >>  index 46125bc..f3de9fb 100644
> >>  --- a/src/text/template/funcs.go
> >> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_3.patch b=
/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_3.patch
> >> new file mode 100644
> >> index 0000000000..cd7dd0957c
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_3.patch
> >> @@ -0,0 +1,393 @@
> >> +From 7ddce23c7d5b728acf8482f5006497c7b9915f8a Mon Sep 17 00:00:00 200=
1
> >> +From: Ariel Mashraki <ariel@mashraki.co.il>
> >> +Date: Wed, 22 Apr 2020 22:17:56 +0300
> >> +Subject: [PATCH 3/6] text/template: add CommentNode to template parse=
 tree
> >> +MIME-Version: 1.0
> >> +Content-Type: text/plain; charset=3DUTF-8
> >> +Content-Transfer-Encoding: 8bit
> >> +
> >> +Fixes #34652
> >> +
> >> +Change-Id: Icf6e3eda593fed826736f34f95a9d66f5450cc98
> >> +Reviewed-on: https://go-review.googlesource.com/c/go/+/229398
> >> +Reviewed-by: Daniel Mart=C3=AD <mvdan@mvdan.cc>
> >> +Run-TryBot: Daniel Mart=C3=AD <mvdan@mvdan.cc>
> >> +TryBot-Result: Gobot Gobot <gobot@golang.org>
> >> +
> >> +Dependency Patch #3
> >> +
> >> +Upstream-Status: Backport from https://github.com/golang/go/commit/c8=
ea03828b0645b1fd5725888e44873b75fcfbb6
> >> +CVE: CVE-2023-24538
> >> +Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> >> +---
> >> + api/next.txt                          | 19 +++++++++++++++++++
> >> + src/html/template/escape.go           |  2 ++
> >> + src/html/template/template_test.go    | 16 ++++++++++++++++
> >> + src/text/template/exec.go             |  1 +
> >> + src/text/template/parse/lex.go        |  8 +++++++-
> >> + src/text/template/parse/lex_test.go   |  7 +++++--
> >> + src/text/template/parse/node.go       | 33 +++++++++++++++++++++++++=
++++++++
> >> + src/text/template/parse/parse.go      | 22 +++++++++++++++++++---
> >> + src/text/template/parse/parse_test.go | 25 +++++++++++++++++++++++++
> >> + 9 files changed, 127 insertions(+), 6 deletions(-)
> >> +
> >> +diff --git a/api/next.txt b/api/next.txt
> >> +index e69de29..076f39e 100644
> >> +--- a/api/next.txt
> >> ++++ b/api/next.txt
> >> +@@ -0,0 +1,19 @@
> >> ++pkg unicode, const Version =3D "13.0.0"
> >> ++pkg unicode, var Chorasmian *RangeTable
> >> ++pkg unicode, var Dives_Akuru *RangeTable
> >> ++pkg unicode, var Khitan_Small_Script *RangeTable
> >> ++pkg unicode, var Yezidi *RangeTable
> >> ++pkg text/template/parse, const NodeComment =3D 20
> >> ++pkg text/template/parse, const NodeComment NodeType
> >> ++pkg text/template/parse, const ParseComments =3D 1
> >> ++pkg text/template/parse, const ParseComments Mode
> >> ++pkg text/template/parse, method (*CommentNode) Copy() Node
> >> ++pkg text/template/parse, method (*CommentNode) String() string
> >> ++pkg text/template/parse, method (CommentNode) Position() Pos
> >> ++pkg text/template/parse, method (CommentNode) Type() NodeType
> >> ++pkg text/template/parse, type CommentNode struct
> >> ++pkg text/template/parse, type CommentNode struct, Text string
> >> ++pkg text/template/parse, type CommentNode struct, embedded NodeType
> >> ++pkg text/template/parse, type CommentNode struct, embedded Pos
> >> ++pkg text/template/parse, type Mode uint
> >> ++pkg text/template/parse, type Tree struct, Mode Mode
> >> +diff --git a/src/html/template/escape.go b/src/html/template/escape.g=
o
> >> +index f12dafa..8739735 100644
> >> +--- a/src/html/template/escape.go
> >> ++++ b/src/html/template/escape.go
> >> +@@ -124,6 +124,8 @@ func (e *escaper) escape(c context, n parse.Node)=
 context {
> >> +       switch n :=3D n.(type) {
> >> +       case *parse.ActionNode:
> >> +               return e.escapeAction(c, n)
> >> ++      case *parse.CommentNode:
> >> ++              return c
> >> +       case *parse.IfNode:
> >> +               return e.escapeBranch(c, &n.BranchNode, "if")
> >> +       case *parse.ListNode:
> >> +diff --git a/src/html/template/template_test.go b/src/html/template/t=
emplate_test.go
> >> +index 86bd4db..1f2c888 100644
> >> +--- a/src/html/template/template_test.go
> >> ++++ b/src/html/template/template_test.go
> >> +@@ -10,6 +10,7 @@ import (
> >> +       . "html/template"
> >> +       "strings"
> >> +       "testing"
> >> ++      "text/template/parse"
> >> + )
> >> +
> >> + func TestTemplateClone(t *testing.T) {
> >> +@@ -160,6 +161,21 @@ func TestStringsInScriptsWithJsonContentTypeAreC=
orrectlyEscaped(t *testing.T) {
> >> +       }
> >> + }
> >> +
> >> ++func TestSkipEscapeComments(t *testing.T) {
> >> ++      c :=3D newTestCase(t)
> >> ++      tr :=3D parse.New("root")
> >> ++      tr.Mode =3D parse.ParseComments
> >> ++      newT, err :=3D tr.Parse("{{/* A comment */}}{{ 1 }}{{/* Anothe=
r comment */}}", "", "", make(map[string]*parse.Tree))
> >> ++      if err !=3D nil {
> >> ++              t.Fatalf("Cannot parse template text: %v", err)
> >> ++      }
> >> ++      c.root, err =3D c.root.AddParseTree("root", newT)
> >> ++      if err !=3D nil {
> >> ++              t.Fatalf("Cannot add parse tree to template: %v", err)
> >> ++      }
> >> ++      c.mustExecute(c.root, nil, "1")
> >> ++}
> >> ++
> >> + type testCase struct {
> >> +       t    *testing.T
> >> +       root *Template
> >> +diff --git a/src/text/template/exec.go b/src/text/template/exec.go
> >> +index ac3e741..7ac5175 100644
> >> +--- a/src/text/template/exec.go
> >> ++++ b/src/text/template/exec.go
> >> +@@ -256,6 +256,7 @@ func (s *state) walk(dot reflect.Value, node pars=
e.Node) {
> >> +               if len(node.Pipe.Decl) =3D=3D 0 {
> >> +                       s.printValue(node, val)
> >> +               }
> >> ++      case *parse.CommentNode:
> >> +       case *parse.IfNode:
> >> +               s.walkIfOrWith(parse.NodeIf, dot, node.Pipe, node.List=
, node.ElseList)
> >> +       case *parse.ListNode:
> >> +diff --git a/src/text/template/parse/lex.go b/src/text/template/parse=
/lex.go
> >> +index 30371f2..e41373a 100644
> >> +--- a/src/text/template/parse/lex.go
> >> ++++ b/src/text/template/parse/lex.go
> >> +@@ -41,6 +41,7 @@ const (
> >> +       itemBool                         // boolean constant
> >> +       itemChar                         // printable ASCII character;=
 grab bag for comma etc.
> >> +       itemCharConstant                 // character constant
> >> ++      itemComment                      // comment text
> >> +       itemComplex                      // complex constant (1+2i); i=
maginary is just a number
> >> +       itemAssign                       // equals ('=3D') introducing=
 an assignment
> >> +       itemDeclare                      // colon-equals (':=3D') intr=
oducing a declaration
> >> +@@ -112,6 +113,7 @@ type lexer struct {
> >> +       leftDelim      string    // start of action
> >> +       rightDelim     string    // end of action
> >> +       trimRightDelim string    // end of action with trim marker
> >> ++      emitComment    bool      // emit itemComment tokens.
> >> +       pos            Pos       // current position in the input
> >> +       start          Pos       // start position of this item
> >> +       width          Pos       // width of last rune read from input
> >> +@@ -203,7 +205,7 @@ func (l *lexer) drain() {
> >> + }
> >> +
> >> + // lex creates a new scanner for the input string.
> >> +-func lex(name, input, left, right string) *lexer {
> >> ++func lex(name, input, left, right string, emitComment bool) *lexer {
> >> +       if left =3D=3D "" {
> >> +               left =3D leftDelim
> >> +       }
> >> +@@ -216,6 +218,7 @@ func lex(name, input, left, right string) *lexer =
{
> >> +               leftDelim:      left,
> >> +               rightDelim:     right,
> >> +               trimRightDelim: rightTrimMarker + right,
> >> ++              emitComment:    emitComment,
> >> +               items:          make(chan item),
> >> +               line:           1,
> >> +               startLine:      1,
> >> +@@ -323,6 +326,9 @@ func lexComment(l *lexer) stateFn {
> >> +       if !delim {
> >> +               return l.errorf("comment ends before closing delimiter=
")
> >> +       }
> >> ++      if l.emitComment {
> >> ++              l.emit(itemComment)
> >> ++      }
> >> +       if trimSpace {
> >> +               l.pos +=3D trimMarkerLen
> >> +       }
> >> +diff --git a/src/text/template/parse/lex_test.go b/src/text/template/=
parse/lex_test.go
> >> +index 563c4fc..f6d5f28 100644
> >> +--- a/src/text/template/parse/lex_test.go
> >> ++++ b/src/text/template/parse/lex_test.go
> >> +@@ -15,6 +15,7 @@ var itemName =3D map[itemType]string{
> >> +       itemBool:         "bool",
> >> +       itemChar:         "char",
> >> +       itemCharConstant: "charconst",
> >> ++      itemComment:      "comment",
> >> +       itemComplex:      "complex",
> >> +       itemDeclare:      ":=3D",
> >> +       itemEOF:          "EOF",
> >> +@@ -90,6 +91,7 @@ var lexTests =3D []lexTest{
> >> +       {"text", `now is the time`, []item{mkItem(itemText, "now is th=
e time"), tEOF}},
> >> +       {"text with comment", "hello-{{/* this is a comment */}}-world=
", []item{
> >> +               mkItem(itemText, "hello-"),
> >> ++              mkItem(itemComment, "/* this is a comment */"),
> >> +               mkItem(itemText, "-world"),
> >> +               tEOF,
> >> +       }},
> >> +@@ -311,6 +313,7 @@ var lexTests =3D []lexTest{
> >> +       }},
> >> +       {"trimming spaces before and after comment", "hello- {{- /* he=
llo */ -}} -world", []item{
> >> +               mkItem(itemText, "hello-"),
> >> ++              mkItem(itemComment, "/* hello */"),
> >> +               mkItem(itemText, "-world"),
> >> +               tEOF,
> >> +       }},
> >> +@@ -389,7 +392,7 @@ var lexTests =3D []lexTest{
> >> +
> >> + // collect gathers the emitted items into a slice.
> >> + func collect(t *lexTest, left, right string) (items []item) {
> >> +-      l :=3D lex(t.name, t.input, left, right)
> >> ++      l :=3D lex(t.name, t.input, left, right, true)
> >> +       for {
> >> +               item :=3D l.nextItem()
> >> +               items =3D append(items, item)
> >> +@@ -529,7 +532,7 @@ func TestPos(t *testing.T) {
> >> + func TestShutdown(t *testing.T) {
> >> +       // We need to duplicate template.Parse here to hold on to the =
lexer.
> >> +       const text =3D "erroneous{{define}}{{else}}1234"
> >> +-      lexer :=3D lex("foo", text, "{{", "}}")
> >> ++      lexer :=3D lex("foo", text, "{{", "}}", false)
> >> +       _, err :=3D New("root").parseLexer(lexer)
> >> +       if err =3D=3D nil {
> >> +               t.Fatalf("expected error")
> >> +diff --git a/src/text/template/parse/node.go b/src/text/template/pars=
e/node.go
> >> +index 1c116ea..a9dad5e 100644
> >> +--- a/src/text/template/parse/node.go
> >> ++++ b/src/text/template/parse/node.go
> >> +@@ -70,6 +70,7 @@ const (
> >> +       NodeTemplate                   // A template invocation action=
.
> >> +       NodeVariable                   // A $ variable.
> >> +       NodeWith                       // A with action.
> >> ++      NodeComment                    // A comment.
> >> + )
> >> +
> >> + // Nodes.
> >> +@@ -149,6 +150,38 @@ func (t *TextNode) Copy() Node {
> >> +       return &TextNode{tr: t.tr, NodeType: NodeText, Pos: t.Pos, Tex=
t: append([]byte{}, t.Text...)}
> >> + }
> >> +
> >> ++// CommentNode holds a comment.
> >> ++type CommentNode struct {
> >> ++      NodeType
> >> ++      Pos
> >> ++      tr   *Tree
> >> ++      Text string // Comment text.
> >> ++}
> >> ++
> >> ++func (t *Tree) newComment(pos Pos, text string) *CommentNode {
> >> ++      return &CommentNode{tr: t, NodeType: NodeComment, Pos: pos, Te=
xt: text}
> >> ++}
> >> ++
> >> ++func (c *CommentNode) String() string {
> >> ++      var sb strings.Builder
> >> ++      c.writeTo(&sb)
> >> ++      return sb.String()
> >> ++}
> >> ++
> >> ++func (c *CommentNode) writeTo(sb *strings.Builder) {
> >> ++      sb.WriteString("{{")
> >> ++      sb.WriteString(c.Text)
> >> ++      sb.WriteString("}}")
> >> ++}
> >> ++
> >> ++func (c *CommentNode) tree() *Tree {
> >> ++      return c.tr
> >> ++}
> >> ++
> >> ++func (c *CommentNode) Copy() Node {
> >> ++      return &CommentNode{tr: c.tr, NodeType: NodeComment, Pos: c.Po=
s, Text: c.Text}
> >> ++}
> >> ++
> >> + // PipeNode holds a pipeline with optional declaration
> >> + type PipeNode struct {
> >> +       NodeType
> >> +diff --git a/src/text/template/parse/parse.go b/src/text/template/par=
se/parse.go
> >> +index c9b80f4..496d8bf 100644
> >> +--- a/src/text/template/parse/parse.go
> >> ++++ b/src/text/template/parse/parse.go
> >> +@@ -21,6 +21,7 @@ type Tree struct {
> >> +       Name      string    // name of the template represented by the=
 tree.
> >> +       ParseName string    // name of the top-level template during p=
arsing, for error messages.
> >> +       Root      *ListNode // top-level root of the tree.
> >> ++      Mode      Mode      // parsing mode.
> >> +       text      string    // text parsed to create the template (or =
its parent)
> >> +       // Parsing only; cleared after parse.
> >> +       funcs     []map[string]interface{}
> >> +@@ -29,8 +30,16 @@ type Tree struct {
> >> +       peekCount int
> >> +       vars      []string // variables defined at the moment.
> >> +       treeSet   map[string]*Tree
> >> ++      mode      Mode
> >> + }
> >> +
> >> ++// A mode value is a set of flags (or 0). Modes control parser behav=
ior.
> >> ++type Mode uint
> >> ++
> >> ++const (
> >> ++      ParseComments Mode =3D 1 << iota // parse comments and add the=
m to AST
> >> ++)
> >> ++
> >> + // Copy returns a copy of the Tree. Any parsing state is discarded.
> >> + func (t *Tree) Copy() *Tree {
> >> +       if t =3D=3D nil {
> >> +@@ -220,7 +229,8 @@ func (t *Tree) stopParse() {
> >> + func (t *Tree) Parse(text, leftDelim, rightDelim string, treeSet map=
[string]*Tree, funcs ...map[string]interface{}) (tree *Tree, err error) {
> >> +       defer t.recover(&err)
> >> +       t.ParseName =3D t.Name
> >> +-      t.startParse(funcs, lex(t.Name, text, leftDelim, rightDelim), =
treeSet)
> >> ++      emitComment :=3D t.Mode&ParseComments !=3D 0
> >> ++      t.startParse(funcs, lex(t.Name, text, leftDelim, rightDelim, e=
mitComment), treeSet)
> >> +       t.text =3D text
> >> +       t.parse()
> >> +       t.add()
> >> +@@ -240,12 +250,14 @@ func (t *Tree) add() {
> >> +       }
> >> + }
> >> +
> >> +-// IsEmptyTree reports whether this tree (node) is empty of everythi=
ng but space.
> >> ++// IsEmptyTree reports whether this tree (node) is empty of everythi=
ng but space or comments.
> >> + func IsEmptyTree(n Node) bool {
> >> +       switch n :=3D n.(type) {
> >> +       case nil:
> >> +               return true
> >> +       case *ActionNode:
> >> ++      case *CommentNode:
> >> ++              return true
> >> +       case *IfNode:
> >> +       case *ListNode:
> >> +               for _, node :=3D range n.Nodes {
> >> +@@ -276,6 +288,7 @@ func (t *Tree) parse() {
> >> +                       if t.nextNonSpace().typ =3D=3D itemDefine {
> >> +                               newT :=3D New("definition") // name wi=
ll be updated once we know it.
> >> +                               newT.text =3D t.text
> >> ++                              newT.Mode =3D t.Mode
> >> +                               newT.ParseName =3D t.ParseName
> >> +                               newT.startParse(t.funcs, t.lex, t.tree=
Set)
> >> +                               newT.parseDefinition()
> >> +@@ -331,13 +344,15 @@ func (t *Tree) itemList() (list *ListNode, next=
 Node) {
> >> + }
> >> +
> >> + // textOrAction:
> >> +-//    text | action
> >> ++//    text | comment | action
> >> + func (t *Tree) textOrAction() Node {
> >> +       switch token :=3D t.nextNonSpace(); token.typ {
> >> +       case itemText:
> >> +               return t.newText(token.pos, token.val)
> >> +       case itemLeftDelim:
> >> +               return t.action()
> >> ++      case itemComment:
> >> ++              return t.newComment(token.pos, token.val)
> >> +       default:
> >> +               t.unexpected(token, "input")
> >> +       }
> >> +@@ -539,6 +554,7 @@ func (t *Tree) blockControl() Node {
> >> +
> >> +       block :=3D New(name) // name will be updated once we know it.
> >> +       block.text =3D t.text
> >> ++      block.Mode =3D t.Mode
> >> +       block.ParseName =3D t.ParseName
> >> +       block.startParse(t.funcs, t.lex, t.treeSet)
> >> +       var end Node
> >> +diff --git a/src/text/template/parse/parse_test.go b/src/text/templat=
e/parse/parse_test.go
> >> +index 4e09a78..d9c13c5 100644
> >> +--- a/src/text/template/parse/parse_test.go
> >> ++++ b/src/text/template/parse/parse_test.go
> >> +@@ -348,6 +348,30 @@ func TestParseCopy(t *testing.T) {
> >> +       testParse(true, t)
> >> + }
> >> +
> >> ++func TestParseWithComments(t *testing.T) {
> >> ++      textFormat =3D "%q"
> >> ++      defer func() { textFormat =3D "%s" }()
> >> ++      tests :=3D [...]parseTest{
> >> ++              {"comment", "{{/*\n\n\n*/}}", noError, "{{/*\n\n\n*/}}=
"},
> >> ++              {"comment trim left", "x \r\n\t{{- /* hi */}}", noErro=
r, `"x"{{/* hi */}}`},
> >> ++              {"comment trim right", "{{/* hi */ -}}\n\n\ty", noErro=
r, `{{/* hi */}}"y"`},
> >> ++              {"comment trim left and right", "x \r\n\t{{- /* */ -}}=
\n\n\ty", noError, `"x"{{/* */}}"y"`},
> >> ++      }
> >> ++      for _, test :=3D range tests {
> >> ++              t.Run(test.name, func(t *testing.T) {
> >> ++                      tr :=3D New(test.name)
> >> ++                      tr.Mode =3D ParseComments
> >> ++                      tmpl, err :=3D tr.Parse(test.input, "", "", ma=
ke(map[string]*Tree))
> >> ++                      if err !=3D nil {
> >> ++                              t.Errorf("%q: expected error; got none=
", test.name)
> >> ++                      }
> >> ++                      if result :=3D tmpl.Root.String(); result !=3D=
 test.result {
> >> ++                              t.Errorf("%s=3D(%q): got\n\t%v\nexpect=
ed\n\t%v", test.name, test.input, result, test.result)
> >> ++                      }
> >> ++              })
> >> ++      }
> >> ++}
> >> ++
> >> + type isEmptyTest struct {
> >> +       name  string
> >> +       input string
> >> +@@ -358,6 +382,7 @@ var isEmptyTests =3D []isEmptyTest{
> >> +       {"empty", ``, true},
> >> +       {"nonempty", `hello`, false},
> >> +       {"spaces only", " \t\n \t\n", true},
> >> ++      {"comment only", "{{/* comment */}}", true},
> >> +       {"definition", `{{define "x"}}something{{end}}`, true},
> >> +       {"definitions and space", "{{define `x`}}something{{end}}\n\n{=
{define `y`}}something{{end}}\n\n", true},
> >> +       {"definitions and text", "{{define `x`}}something{{end}}\nx\n{=
{define `y`}}something{{end}}\ny\n", false},
> >> +--
> >> +2.7.4
> >> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_4.patch b=
/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_4.patch
> >> new file mode 100644
> >> index 0000000000..d5e2eb6684
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_4.patch
> >> @@ -0,0 +1,497 @@
> >> +From 760d88497091fb5d6d231a18e6f4e06ecb9af9b2 Mon Sep 17 00:00:00 200=
1
> >> +From: Russ Cox <rsc@golang.org>
> >> +Date: Thu, 10 Sep 2020 18:53:26 -0400
> >> +Subject: [PATCH 4/6] text/template: allow newlines inside action deli=
miters
> >> +
> >> +This allows multiline constructs like:
> >> +
> >> +       {{"hello" |
> >> +         printf}}
> >> +
> >> +Now that unclosed actions can span multiple lines,
> >> +track and report the start of the action when reporting errors.
> >> +
> >> +Also clean up a few "unexpected <error message>" to be just "<error m=
essage>".
> >> +
> >> +Fixes #29770.
> >> +
> >> +Change-Id: I54c6c016029a8328b7902a4b6d85eab713ec3285
> >> +Reviewed-on: https://go-review.googlesource.com/c/go/+/254257
> >> +Trust: Russ Cox <rsc@golang.org>
> >> +Run-TryBot: Russ Cox <rsc@golang.org>
> >> +TryBot-Result: Go Bot <gobot@golang.org>
> >> +Reviewed-by: Rob Pike <r@golang.org>
> >> +
> >> +Dependency Patch #4
> >> +
> >> +Upstream-Status: Backport from https://github.com/golang/go/commit/93=
84d34c58099657bb1b133beaf3ff37ada9b017
> >> +CVE: CVE-2023-24538
> >> +Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> >> +---
> >> + src/text/template/doc.go              | 21 ++++-----
> >> + src/text/template/exec_test.go        |  2 +-
> >> + src/text/template/parse/lex.go        | 84 +++++++++++++++++--------=
----------
> >> + src/text/template/parse/lex_test.go   |  2 +-
> >> + src/text/template/parse/parse.go      | 59 +++++++++++++-----------
> >> + src/text/template/parse/parse_test.go | 36 ++++++++++++---
> >> + 6 files changed, 117 insertions(+), 87 deletions(-)
> >> +
> >> +diff --git a/src/text/template/doc.go b/src/text/template/doc.go
> >> +index 4b0efd2..7b30294 100644
> >> +--- a/src/text/template/doc.go
> >> ++++ b/src/text/template/doc.go
> >> +@@ -40,16 +40,17 @@ More intricate examples appear below.
> >> + Text and spaces
> >> +
> >> + By default, all text between actions is copied verbatim when the tem=
plate is
> >> +-executed. For example, the string " items are made of " in the examp=
le above appears
> >> +-on standard output when the program is run.
> >> +-
> >> +-However, to aid in formatting template source code, if an action's l=
eft delimiter
> >> +-(by default "{{") is followed immediately by a minus sign and ASCII =
space character
> >> +-("{{- "), all trailing white space is trimmed from the immediately p=
receding text.
> >> +-Similarly, if the right delimiter ("}}") is preceded by a space and =
minus sign
> >> +-(" -}}"), all leading white space is trimmed from the immediately fo=
llowing text.
> >> +-In these trim markers, the ASCII space must be present; "{{-3}}" par=
ses as an
> >> +-action containing the number -3.
> >> ++executed. For example, the string " items are made of " in the examp=
le above
> >> ++appears on standard output when the program is run.
> >> ++
> >> ++However, to aid in formatting template source code, if an action's l=
eft
> >> ++delimiter (by default "{{") is followed immediately by a minus sign =
and white
> >> ++space, all trailing white space is trimmed from the immediately prec=
eding text.
> >> ++Similarly, if the right delimiter ("}}") is preceded by white space =
and a minus
> >> ++sign, all leading white space is trimmed from the immediately follow=
ing text.
> >> ++In these trim markers, the white space must be present:
> >> ++"{{- 3}}" is like "{{3}}" but trims the immediately preceding text, =
while
> >> ++"{{-3}}" parses as an action containing the number -3.
> >> +
> >> + For instance, when executing the template whose source is
> >> +
> >> +diff --git a/src/text/template/exec_test.go b/src/text/template/exec_=
test.go
> >> +index b8a809e..3309b33 100644
> >> +--- a/src/text/template/exec_test.go
> >> ++++ b/src/text/template/exec_test.go
> >> +@@ -1295,7 +1295,7 @@ func TestUnterminatedStringError(t *testing.T) =
{
> >> +               t.Fatal("expected error")
> >> +       }
> >> +       str :=3D err.Error()
> >> +-      if !strings.Contains(str, "X:3: unexpected unterminated raw qu=
oted string") {
> >> ++      if !strings.Contains(str, "X:3: unterminated raw quoted string=
") {
> >> +               t.Fatalf("unexpected error: %s", str)
> >> +       }
> >> + }
> >> +diff --git a/src/text/template/parse/lex.go b/src/text/template/parse=
/lex.go
> >> +index e41373a..6784071 100644
> >> +--- a/src/text/template/parse/lex.go
> >> ++++ b/src/text/template/parse/lex.go
> >> +@@ -92,15 +92,14 @@ const eof =3D -1
> >> + // If the action begins "{{- " rather than "{{", then all space/tab/=
newlines
> >> + // preceding the action are trimmed; conversely if it ends " -}}" th=
e
> >> + // leading spaces are trimmed. This is done entirely in the lexer; t=
he
> >> +-// parser never sees it happen. We require an ASCII space to be
> >> +-// present to avoid ambiguity with things like "{{-3}}". It reads
> >> ++// parser never sees it happen. We require an ASCII space (' ', \t, =
\r, \n)
> >> ++// to be present to avoid ambiguity with things like "{{-3}}". It re=
ads
> >> + // better with the space present anyway. For simplicity, only ASCII
> >> +-// space does the job.
> >> ++// does the job.
> >> + const (
> >> +-      spaceChars      =3D " \t\r\n" // These are the space character=
s defined by Go itself.
> >> +-      leftTrimMarker  =3D "- "      // Attached to left delimiter, t=
rims trailing spaces from preceding text.
> >> +-      rightTrimMarker =3D " -"      // Attached to right delimiter, =
trims leading spaces from following text.
> >> +-      trimMarkerLen   =3D Pos(len(leftTrimMarker))
> >> ++      spaceChars    =3D " \t\r\n"  // These are the space characters=
 defined by Go itself.
> >> ++      trimMarker    =3D '-'        // Attached to left/right delimit=
er, trims trailing spaces from preceding/following text.
> >> ++      trimMarkerLen =3D Pos(1 + 1) // marker plus space before or af=
ter
> >> + )
> >> +
> >> + // stateFn represents the state of the scanner as a function that re=
turns the next state.
> >> +@@ -108,19 +107,18 @@ type stateFn func(*lexer) stateFn
> >> +
> >> + // lexer holds the state of the scanner.
> >> + type lexer struct {
> >> +-      name           string    // the name of the input; used only f=
or error reports
> >> +-      input          string    // the string being scanned
> >> +-      leftDelim      string    // start of action
> >> +-      rightDelim     string    // end of action
> >> +-      trimRightDelim string    // end of action with trim marker
> >> +-      emitComment    bool      // emit itemComment tokens.
> >> +-      pos            Pos       // current position in the input
> >> +-      start          Pos       // start position of this item
> >> +-      width          Pos       // width of last rune read from input
> >> +-      items          chan item // channel of scanned items
> >> +-      parenDepth     int       // nesting depth of ( ) exprs
> >> +-      line           int       // 1+number of newlines seen
> >> +-      startLine      int       // start line of this item
> >> ++      name        string    // the name of the input; used only for =
error reports
> >> ++      input       string    // the string being scanned
> >> ++      leftDelim   string    // start of action
> >> ++      rightDelim  string    // end of action
> >> ++      emitComment bool      // emit itemComment tokens.
> >> ++      pos         Pos       // current position in the input
> >> ++      start       Pos       // start position of this item
> >> ++      width       Pos       // width of last rune read from input
> >> ++      items       chan item // channel of scanned items
> >> ++      parenDepth  int       // nesting depth of ( ) exprs
> >> ++      line        int       // 1+number of newlines seen
> >> ++      startLine   int       // start line of this item
> >> + }
> >> +
> >> + // next returns the next rune in the input.
> >> +@@ -213,15 +211,14 @@ func lex(name, input, left, right string, emitC=
omment bool) *lexer {
> >> +               right =3D rightDelim
> >> +       }
> >> +       l :=3D &lexer{
> >> +-              name:           name,
> >> +-              input:          input,
> >> +-              leftDelim:      left,
> >> +-              rightDelim:     right,
> >> +-              trimRightDelim: rightTrimMarker + right,
> >> +-              emitComment:    emitComment,
> >> +-              items:          make(chan item),
> >> +-              line:           1,
> >> +-              startLine:      1,
> >> ++              name:        name,
> >> ++              input:       input,
> >> ++              leftDelim:   left,
> >> ++              rightDelim:  right,
> >> ++              emitComment: emitComment,
> >> ++              items:       make(chan item),
> >> ++              line:        1,
> >> ++              startLine:   1,
> >> +       }
> >> +       go l.run()
> >> +       return l
> >> +@@ -251,7 +248,7 @@ func lexText(l *lexer) stateFn {
> >> +               ldn :=3D Pos(len(l.leftDelim))
> >> +               l.pos +=3D Pos(x)
> >> +               trimLength :=3D Pos(0)
> >> +-              if strings.HasPrefix(l.input[l.pos+ldn:], leftTrimMark=
er) {
> >> ++              if hasLeftTrimMarker(l.input[l.pos+ldn:]) {
> >> +                       trimLength =3D rightTrimLength(l.input[l.start=
:l.pos])
> >> +               }
> >> +               l.pos -=3D trimLength
> >> +@@ -280,7 +277,7 @@ func rightTrimLength(s string) Pos {
> >> +
> >> + // atRightDelim reports whether the lexer is at a right delimiter, p=
ossibly preceded by a trim marker.
> >> + func (l *lexer) atRightDelim() (delim, trimSpaces bool) {
> >> +-      if strings.HasPrefix(l.input[l.pos:], l.trimRightDelim) { // W=
ith trim marker.
> >> ++      if hasRightTrimMarker(l.input[l.pos:]) && strings.HasPrefix(l.=
input[l.pos+trimMarkerLen:], l.rightDelim) { // With trim marker.
> >> +               return true, true
> >> +       }
> >> +       if strings.HasPrefix(l.input[l.pos:], l.rightDelim) { // Witho=
ut trim marker.
> >> +@@ -297,7 +294,7 @@ func leftTrimLength(s string) Pos {
> >> + // lexLeftDelim scans the left delimiter, which is known to be prese=
nt, possibly with a trim marker.
> >> + func lexLeftDelim(l *lexer) stateFn {
> >> +       l.pos +=3D Pos(len(l.leftDelim))
> >> +-      trimSpace :=3D strings.HasPrefix(l.input[l.pos:], leftTrimMark=
er)
> >> ++      trimSpace :=3D hasLeftTrimMarker(l.input[l.pos:])
> >> +       afterMarker :=3D Pos(0)
> >> +       if trimSpace {
> >> +               afterMarker =3D trimMarkerLen
> >> +@@ -342,7 +339,7 @@ func lexComment(l *lexer) stateFn {
> >> +
> >> + // lexRightDelim scans the right delimiter, which is known to be pre=
sent, possibly with a trim marker.
> >> + func lexRightDelim(l *lexer) stateFn {
> >> +-      trimSpace :=3D strings.HasPrefix(l.input[l.pos:], rightTrimMar=
ker)
> >> ++      trimSpace :=3D hasRightTrimMarker(l.input[l.pos:])
> >> +       if trimSpace {
> >> +               l.pos +=3D trimMarkerLen
> >> +               l.ignore()
> >> +@@ -369,7 +366,7 @@ func lexInsideAction(l *lexer) stateFn {
> >> +               return l.errorf("unclosed left paren")
> >> +       }
> >> +       switch r :=3D l.next(); {
> >> +-      case r =3D=3D eof || isEndOfLine(r):
> >> ++      case r =3D=3D eof:
> >> +               return l.errorf("unclosed action")
> >> +       case isSpace(r):
> >> +               l.backup() // Put space back in case we have " -}}".
> >> +@@ -439,7 +436,7 @@ func lexSpace(l *lexer) stateFn {
> >> +       }
> >> +       // Be careful about a trim-marked closing delimiter, which has=
 a minus
> >> +       // after a space. We know there is a space, so check for the '=
-' that might follow.
> >> +-      if strings.HasPrefix(l.input[l.pos-1:], l.trimRightDelim) {
> >> ++      if hasRightTrimMarker(l.input[l.pos-1:]) && strings.HasPrefix(=
l.input[l.pos-1+trimMarkerLen:], l.rightDelim) {
> >> +               l.backup() // Before the space.
> >> +               if numSpaces =3D=3D 1 {
> >> +                       return lexRightDelim // On the delim, so go ri=
ght to that.
> >> +@@ -526,7 +523,7 @@ func lexFieldOrVariable(l *lexer, typ itemType) s=
tateFn {
> >> + // day to implement arithmetic.
> >> + func (l *lexer) atTerminator() bool {
> >> +       r :=3D l.peek()
> >> +-      if isSpace(r) || isEndOfLine(r) {
> >> ++      if isSpace(r) {
> >> +               return true
> >> +       }
> >> +       switch r {
> >> +@@ -657,15 +654,18 @@ Loop:
> >> +
> >> + // isSpace reports whether r is a space character.
> >> + func isSpace(r rune) bool {
> >> +-      return r =3D=3D ' ' || r =3D=3D '\t'
> >> +-}
> >> +-
> >> +-// isEndOfLine reports whether r is an end-of-line character.
> >> +-func isEndOfLine(r rune) bool {
> >> +-      return r =3D=3D '\r' || r =3D=3D '\n'
> >> ++      return r =3D=3D ' ' || r =3D=3D '\t' || r =3D=3D '\r' || r =3D=
=3D '\n'
> >> + }
> >> +
> >> + // isAlphaNumeric reports whether r is an alphabetic, digit, or unde=
rscore.
> >> + func isAlphaNumeric(r rune) bool {
> >> +       return r =3D=3D '_' || unicode.IsLetter(r) || unicode.IsDigit(=
r)
> >> + }
> >> ++
> >> ++func hasLeftTrimMarker(s string) bool {
> >> ++      return len(s) >=3D 2 && s[0] =3D=3D trimMarker && isSpace(rune=
(s[1]))
> >> ++}
> >> ++
> >> ++func hasRightTrimMarker(s string) bool {
> >> ++      return len(s) >=3D 2 && isSpace(rune(s[0])) && s[1] =3D=3D tri=
mMarker
> >> ++}
> >> +diff --git a/src/text/template/parse/lex_test.go b/src/text/template/=
parse/lex_test.go
> >> +index f6d5f28..6510eed 100644
> >> +--- a/src/text/template/parse/lex_test.go
> >> ++++ b/src/text/template/parse/lex_test.go
> >> +@@ -323,7 +323,7 @@ var lexTests =3D []lexTest{
> >> +               tLeft,
> >> +               mkItem(itemError, "unrecognized character in action: U=
+0001"),
> >> +       }},
> >> +-      {"unclosed action", "{{\n}}", []item{
> >> ++      {"unclosed action", "{{", []item{
> >> +               tLeft,
> >> +               mkItem(itemError, "unclosed action"),
> >> +       }},
> >> +diff --git a/src/text/template/parse/parse.go b/src/text/template/par=
se/parse.go
> >> +index 496d8bf..5e6e512 100644
> >> +--- a/src/text/template/parse/parse.go
> >> ++++ b/src/text/template/parse/parse.go
> >> +@@ -24,13 +24,14 @@ type Tree struct {
> >> +       Mode      Mode      // parsing mode.
> >> +       text      string    // text parsed to create the template (or =
its parent)
> >> +       // Parsing only; cleared after parse.
> >> +-      funcs     []map[string]interface{}
> >> +-      lex       *lexer
> >> +-      token     [3]item // three-token lookahead for parser.
> >> +-      peekCount int
> >> +-      vars      []string // variables defined at the moment.
> >> +-      treeSet   map[string]*Tree
> >> +-      mode      Mode
> >> ++      funcs      []map[string]interface{}
> >> ++      lex        *lexer
> >> ++      token      [3]item // three-token lookahead for parser.
> >> ++      peekCount  int
> >> ++      vars       []string // variables defined at the moment.
> >> ++      treeSet    map[string]*Tree
> >> ++      actionLine int // line of left delim starting action
> >> ++      mode       Mode
> >> + }
> >> +
> >> + // A mode value is a set of flags (or 0). Modes control parser behav=
ior.
> >> +@@ -187,6 +188,16 @@ func (t *Tree) expectOneOf(expected1, expected2 =
itemType, context string) item {
> >> +
> >> + // unexpected complains about the token and terminates processing.
> >> + func (t *Tree) unexpected(token item, context string) {
> >> ++      if token.typ =3D=3D itemError {
> >> ++              extra :=3D ""
> >> ++              if t.actionLine !=3D 0 && t.actionLine !=3D token.line=
 {
> >> ++                      extra =3D fmt.Sprintf(" in action started at %=
s:%d", t.ParseName, t.actionLine)
> >> ++                      if strings.HasSuffix(token.val, " action") {
> >> ++                              extra =3D extra[len(" in action"):] //=
 avoid "action in action"
> >> ++                      }
> >> ++              }
> >> ++              t.errorf("%s%s", token, extra)
> >> ++      }
> >> +       t.errorf("unexpected %s in %s", token, context)
> >> + }
> >> +
> >> +@@ -350,6 +361,8 @@ func (t *Tree) textOrAction() Node {
> >> +       case itemText:
> >> +               return t.newText(token.pos, token.val)
> >> +       case itemLeftDelim:
> >> ++              t.actionLine =3D token.line
> >> ++              defer t.clearActionLine()
> >> +               return t.action()
> >> +       case itemComment:
> >> +               return t.newComment(token.pos, token.val)
> >> +@@ -359,6 +372,10 @@ func (t *Tree) textOrAction() Node {
> >> +       return nil
> >> + }
> >> +
> >> ++func (t *Tree) clearActionLine() {
> >> ++      t.actionLine =3D 0
> >> ++}
> >> ++
> >> + // Action:
> >> + //    control
> >> + //    command ("|" command)*
> >> +@@ -384,12 +401,12 @@ func (t *Tree) action() (n Node) {
> >> +       t.backup()
> >> +       token :=3D t.peek()
> >> +       // Do not pop variables; they persist until "end".
> >> +-      return t.newAction(token.pos, token.line, t.pipeline("command"=
))
> >> ++      return t.newAction(token.pos, token.line, t.pipeline("command"=
, itemRightDelim))
> >> + }
> >> +
> >> + // Pipeline:
> >> + //    declarations? command ('|' command)*
> >> +-func (t *Tree) pipeline(context string) (pipe *PipeNode) {
> >> ++func (t *Tree) pipeline(context string, end itemType) (pipe *PipeNod=
e) {
> >> +       token :=3D t.peekNonSpace()
> >> +       pipe =3D t.newPipeline(token.pos, token.line, nil)
> >> +       // Are there declarations or assignments?
> >> +@@ -430,12 +447,9 @@ decls:
> >> +       }
> >> +       for {
> >> +               switch token :=3D t.nextNonSpace(); token.typ {
> >> +-              case itemRightDelim, itemRightParen:
> >> ++              case end:
> >> +                       // At this point, the pipeline is complete
> >> +                       t.checkPipeline(pipe, context)
> >> +-                      if token.typ =3D=3D itemRightParen {
> >> +-                              t.backup()
> >> +-                      }
> >> +                       return
> >> +               case itemBool, itemCharConstant, itemComplex, itemDot,=
 itemField, itemIdentifier,
> >> +                       itemNumber, itemNil, itemRawString, itemString=
, itemVariable, itemLeftParen:
> >> +@@ -464,7 +478,7 @@ func (t *Tree) checkPipeline(pipe *PipeNode, cont=
ext string) {
> >> +
> >> + func (t *Tree) parseControl(allowElseIf bool, context string) (pos P=
os, line int, pipe *PipeNode, list, elseList *ListNode) {
> >> +       defer t.popVars(len(t.vars))
> >> +-      pipe =3D t.pipeline(context)
> >> ++      pipe =3D t.pipeline(context, itemRightDelim)
> >> +       var next Node
> >> +       list, next =3D t.itemList()
> >> +       switch next.Type() {
> >> +@@ -550,7 +564,7 @@ func (t *Tree) blockControl() Node {
> >> +
> >> +       token :=3D t.nextNonSpace()
> >> +       name :=3D t.parseTemplateName(token, context)
> >> +-      pipe :=3D t.pipeline(context)
> >> ++      pipe :=3D t.pipeline(context, itemRightDelim)
> >> +
> >> +       block :=3D New(name) // name will be updated once we know it.
> >> +       block.text =3D t.text
> >> +@@ -580,7 +594,7 @@ func (t *Tree) templateControl() Node {
> >> +       if t.nextNonSpace().typ !=3D itemRightDelim {
> >> +               t.backup()
> >> +               // Do not pop variables; they persist until "end".
> >> +-              pipe =3D t.pipeline(context)
> >> ++              pipe =3D t.pipeline(context, itemRightDelim)
> >> +       }
> >> +       return t.newTemplate(token.pos, token.line, name, pipe)
> >> + }
> >> +@@ -614,13 +628,12 @@ func (t *Tree) command() *CommandNode {
> >> +               switch token :=3D t.next(); token.typ {
> >> +               case itemSpace:
> >> +                       continue
> >> +-              case itemError:
> >> +-                      t.errorf("%s", token.val)
> >> +               case itemRightDelim, itemRightParen:
> >> +                       t.backup()
> >> +               case itemPipe:
> >> ++                      // nothing here; break loop below
> >> +               default:
> >> +-                      t.errorf("unexpected %s in operand", token)
> >> ++                      t.unexpected(token, "operand")
> >> +               }
> >> +               break
> >> +       }
> >> +@@ -675,8 +688,6 @@ func (t *Tree) operand() Node {
> >> + // A nil return means the next item is not a term.
> >> + func (t *Tree) term() Node {
> >> +       switch token :=3D t.nextNonSpace(); token.typ {
> >> +-      case itemError:
> >> +-              t.errorf("%s", token.val)
> >> +       case itemIdentifier:
> >> +               if !t.hasFunction(token.val) {
> >> +                       t.errorf("function %q not defined", token.val)
> >> +@@ -699,11 +710,7 @@ func (t *Tree) term() Node {
> >> +               }
> >> +               return number
> >> +       case itemLeftParen:
> >> +-              pipe :=3D t.pipeline("parenthesized pipeline")
> >> +-              if token :=3D t.next(); token.typ !=3D itemRightParen =
{
> >> +-                      t.errorf("unclosed right paren: unexpected %s"=
, token)
> >> +-              }
> >> +-              return pipe
> >> ++              return t.pipeline("parenthesized pipeline", itemRightP=
aren)
> >> +       case itemString, itemRawString:
> >> +               s, err :=3D strconv.Unquote(token.val)
> >> +               if err !=3D nil {
> >> +diff --git a/src/text/template/parse/parse_test.go b/src/text/templat=
e/parse/parse_test.go
> >> +index d9c13c5..220f984 100644
> >> +--- a/src/text/template/parse/parse_test.go
> >> ++++ b/src/text/template/parse/parse_test.go
> >> +@@ -250,6 +250,13 @@ var parseTests =3D []parseTest{
> >> +       {"comment trim left and right", "x \r\n\t{{- /* */ -}}\n\n\ty"=
, noError, `"x""y"`},
> >> +       {"block definition", `{{block "foo" .}}hello{{end}}`, noError,
> >> +               `{{template "foo" .}}`},
> >> ++
> >> ++      {"newline in assignment", "{{ $x \n :=3D \n 1 \n }}", noError,=
 "{{$x :=3D 1}}"},
> >> ++      {"newline in empty action", "{{\n}}", hasError, "{{\n}}"},
> >> ++      {"newline in pipeline", "{{\n\"x\"\n|\nprintf\n}}", noError, `=
{{"x" | printf}}`},
> >> ++      {"newline in comment", "{{/*\nhello\n*/}}", noError, ""},
> >> ++      {"newline in comment", "{{-\n/*\nhello\n*/\n-}}", noError, ""}=
,
> >> ++
> >> +       // Errors.
> >> +       {"unclosed action", "hello{{range", hasError, ""},
> >> +       {"unmatched end", "{{end}}", hasError, ""},
> >> +@@ -426,23 +433,38 @@ var errorTests =3D []parseTest{
> >> +       // Check line numbers are accurate.
> >> +       {"unclosed1",
> >> +               "line1\n{{",
> >> +-              hasError, `unclosed1:2: unexpected unclosed action in =
command`},
> >> ++              hasError, `unclosed1:2: unclosed action`},
> >> +       {"unclosed2",
> >> +               "line1\n{{define `x`}}line2\n{{",
> >> +-              hasError, `unclosed2:3: unexpected unclosed action in =
command`},
> >> ++              hasError, `unclosed2:3: unclosed action`},
> >> ++      {"unclosed3",
> >> ++              "line1\n{{\"x\"\n\"y\"\n",
> >> ++              hasError, `unclosed3:4: unclosed action started at unc=
losed3:2`},
> >> ++      {"unclosed4",
> >> ++              "{{\n\n\n\n\n",
> >> ++              hasError, `unclosed4:6: unclosed action started at unc=
losed4:1`},
> >> ++      {"var1",
> >> ++              "line1\n{{\nx\n}}",
> >> ++              hasError, `var1:3: function "x" not defined`},
> >> +       // Specific errors.
> >> +       {"function",
> >> +               "{{foo}}",
> >> +               hasError, `function "foo" not defined`},
> >> +-      {"comment",
> >> ++      {"comment1",
> >> +               "{{/*}}",
> >> +-              hasError, `unclosed comment`},
> >> ++              hasError, `comment1:1: unclosed comment`},
> >> ++      {"comment2",
> >> ++              "{{/*\nhello\n}}",
> >> ++              hasError, `comment2:1: unclosed comment`},
> >> +       {"lparen",
> >> +               "{{.X (1 2 3}}",
> >> +               hasError, `unclosed left paren`},
> >> +       {"rparen",
> >> +-              "{{.X 1 2 3)}}",
> >> +-              hasError, `unexpected ")"`},
> >> ++              "{{.X 1 2 3 ) }}",
> >> ++              hasError, `unexpected ")" in command`},
> >> ++      {"rparen2",
> >> ++              "{{(.X 1 2 3",
> >> ++              hasError, `unclosed action`},
> >> +       {"space",
> >> +               "{{`x`3}}",
> >> +               hasError, `in operand`},
> >> +@@ -488,7 +510,7 @@ var errorTests =3D []parseTest{
> >> +               hasError, `missing value for parenthesized pipeline`},
> >> +       {"multilinerawstring",
> >> +               "{{ $v :=3D `\n` }} {{",
> >> +-              hasError, `multilinerawstring:2: unexpected unclosed a=
ction`},
> >> ++              hasError, `multilinerawstring:2: unclosed action`},
> >> +       {"rangeundefvar",
> >> +               "{{range $k}}{{end}}",
> >> +               hasError, `undefined variable`},
> >> +--
> >> +2.7.4
> >> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_5.patch b=
/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_5.patch
> >> new file mode 100644
> >> index 0000000000..fc38929648
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_5.patch
> >> @@ -0,0 +1,585 @@
> >> +From e0e6bca6ddc0e6d9fa3a5b644af9b446924fbf83 Mon Sep 17 00:00:00 200=
1
> >> +From: Russ Cox <rsc@golang.org>
> >> +Date: Thu, 20 May 2021 12:46:33 -0400
> >> +Subject: [PATCH 5/6] html/template, text/template: implement break an=
d
> >> + continue for range loops
> >> +
> >> +Break and continue for range loops was accepted as a proposal in June=
 2017.
> >> +It was implemented in CL 66410 (Oct 2017)
> >> +but then rolled back in CL 92155 (Feb 2018)
> >> +because html/template changes had not been implemented.
> >> +
> >> +This CL reimplements break and continue in text/template
> >> +and then adds support for them in html/template as well.
> >> +
> >> +Fixes #20531.
> >> +
> >> +Change-Id: I05330482a976f1c078b4b49c2287bd9031bb7616
> >> +Reviewed-on: https://go-review.googlesource.com/c/go/+/321491
> >> +Trust: Russ Cox <rsc@golang.org>
> >> +Run-TryBot: Russ Cox <rsc@golang.org>
> >> +TryBot-Result: Go Bot <gobot@golang.org>
> >> +Reviewed-by: Rob Pike <r@golang.org>
> >> +
> >> +Dependency Patch #5
> >> +
> >> +Upstream-Status: Backport from https://github.com/golang/go/commit/d0=
dd26a88c019d54f22463daae81e785f5867565
> >> +CVE: CVE-2023-24538
> >> +Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> >> +---
> >> + src/html/template/context.go          |  4 ++
> >> + src/html/template/escape.go           | 71 +++++++++++++++++++++++++=
+++++++++-
> >> + src/html/template/escape_test.go      | 24 ++++++++++++
> >> + src/text/template/doc.go              |  8 ++++
> >> + src/text/template/exec.go             | 24 +++++++++++-
> >> + src/text/template/exec_test.go        |  2 +
> >> + src/text/template/parse/lex.go        | 13 ++++++-
> >> + src/text/template/parse/lex_test.go   |  2 +
> >> + src/text/template/parse/node.go       | 36 ++++++++++++++++++
> >> + src/text/template/parse/parse.go      | 42 ++++++++++++++++++++-
> >> + src/text/template/parse/parse_test.go |  8 ++++
> >> + 11 files changed, 230 insertions(+), 4 deletions(-)
> >> +
> >> +diff --git a/src/html/template/context.go b/src/html/template/context=
.go
> >> +index f7d4849..aaa7d08 100644
> >> +--- a/src/html/template/context.go
> >> ++++ b/src/html/template/context.go
> >> +@@ -6,6 +6,7 @@ package template
> >> +
> >> + import (
> >> +       "fmt"
> >> ++      "text/template/parse"
> >> + )
> >> +
> >> + // context describes the state an HTML parser must be in when it rea=
ches the
> >> +@@ -22,6 +23,7 @@ type context struct {
> >> +       jsCtx   jsCtx
> >> +       attr    attr
> >> +       element element
> >> ++      n       parse.Node // for range break/continue
> >> +       err     *Error
> >> + }
> >> +
> >> +@@ -141,6 +143,8 @@ const (
> >> +       // stateError is an infectious error state outside any valid
> >> +       // HTML/CSS/JS construct.
> >> +       stateError
> >> ++      // stateDead marks unreachable code after a {{break}} or {{con=
tinue}}.
> >> ++      stateDead
> >> + )
> >> +
> >> + // isComment is true for any state that contains content meant for t=
emplate
> >> +diff --git a/src/html/template/escape.go b/src/html/template/escape.g=
o
> >> +index 8739735..6dea79c 100644
> >> +--- a/src/html/template/escape.go
> >> ++++ b/src/html/template/escape.go
> >> +@@ -97,6 +97,15 @@ type escaper struct {
> >> +       actionNodeEdits   map[*parse.ActionNode][]string
> >> +       templateNodeEdits map[*parse.TemplateNode]string
> >> +       textNodeEdits     map[*parse.TextNode][]byte
> >> ++      // rangeContext holds context about the current range loop.
> >> ++      rangeContext *rangeContext
> >> ++}
> >> ++
> >> ++// rangeContext holds information about the current range loop.
> >> ++type rangeContext struct {
> >> ++      outer     *rangeContext // outer loop
> >> ++      breaks    []context     // context at each break action
> >> ++      continues []context     // context at each continue action
> >> + }
> >> +
> >> + // makeEscaper creates a blank escaper for the given set.
> >> +@@ -109,6 +118,7 @@ func makeEscaper(n *nameSpace) escaper {
> >> +               map[*parse.ActionNode][]string{},
> >> +               map[*parse.TemplateNode]string{},
> >> +               map[*parse.TextNode][]byte{},
> >> ++              nil,
> >> +       }
> >> + }
> >> +
> >> +@@ -124,8 +134,16 @@ func (e *escaper) escape(c context, n parse.Node=
) context {
> >> +       switch n :=3D n.(type) {
> >> +       case *parse.ActionNode:
> >> +               return e.escapeAction(c, n)
> >> ++      case *parse.BreakNode:
> >> ++              c.n =3D n
> >> ++              e.rangeContext.breaks =3D append(e.rangeContext.breaks=
, c)
> >> ++              return context{state: stateDead}
> >> +       case *parse.CommentNode:
> >> +               return c
> >> ++      case *parse.ContinueNode:
> >> ++              c.n =3D n
> >> ++              e.rangeContext.continues =3D append(e.rangeContext.bre=
aks, c)
> >> ++              return context{state: stateDead}
> >> +       case *parse.IfNode:
> >> +               return e.escapeBranch(c, &n.BranchNode, "if")
> >> +       case *parse.ListNode:
> >> +@@ -427,6 +445,12 @@ func join(a, b context, node parse.Node, nodeNam=
e string) context {
> >> +       if b.state =3D=3D stateError {
> >> +               return b
> >> +       }
> >> ++      if a.state =3D=3D stateDead {
> >> ++              return b
> >> ++      }
> >> ++      if b.state =3D=3D stateDead {
> >> ++              return a
> >> ++      }
> >> +       if a.eq(b) {
> >> +               return a
> >> +       }
> >> +@@ -466,14 +490,27 @@ func join(a, b context, node parse.Node, nodeNa=
me string) context {
> >> +
> >> + // escapeBranch escapes a branch template node: "if", "range" and "w=
ith".
> >> + func (e *escaper) escapeBranch(c context, n *parse.BranchNode, nodeN=
ame string) context {
> >> ++      if nodeName =3D=3D "range" {
> >> ++              e.rangeContext =3D &rangeContext{outer: e.rangeContext=
}
> >> ++      }
> >> +       c0 :=3D e.escapeList(c, n.List)
> >> +-      if nodeName =3D=3D "range" && c0.state !=3D stateError {
> >> ++      if nodeName =3D=3D "range" {
> >> ++              if c0.state !=3D stateError {
> >> ++                      c0 =3D joinRange(c0, e.rangeContext)
> >> ++              }
> >> ++              e.rangeContext =3D e.rangeContext.outer
> >> ++              if c0.state =3D=3D stateError {
> >> ++                      return c0
> >> ++              }
> >> ++
> >> +               // The "true" branch of a "range" node can execute mul=
tiple times.
> >> +               // We check that executing n.List once results in the =
same context
> >> +               // as executing n.List twice.
> >> ++              e.rangeContext =3D &rangeContext{outer: e.rangeContext=
}
> >> +               c1, _ :=3D e.escapeListConditionally(c0, n.List, nil)
> >> +               c0 =3D join(c0, c1, n, nodeName)
> >> +               if c0.state =3D=3D stateError {
> >> ++                      e.rangeContext =3D e.rangeContext.outer
> >> +                       // Make clear that this is a problem on loop r=
e-entry
> >> +                       // since developers tend to overlook that bran=
ch when
> >> +                       // debugging templates.
> >> +@@ -481,11 +518,39 @@ func (e *escaper) escapeBranch(c context, n *pa=
rse.BranchNode, nodeName string)
> >> +                       c0.err.Description =3D "on range loop re-entry=
: " + c0.err.Description
> >> +                       return c0
> >> +               }
> >> ++              c0 =3D joinRange(c0, e.rangeContext)
> >> ++              e.rangeContext =3D e.rangeContext.outer
> >> ++              if c0.state =3D=3D stateError {
> >> ++                      return c0
> >> ++              }
> >> +       }
> >> +       c1 :=3D e.escapeList(c, n.ElseList)
> >> +       return join(c0, c1, n, nodeName)
> >> + }
> >> +
> >> ++func joinRange(c0 context, rc *rangeContext) context {
> >> ++      // Merge contexts at break and continue statements into overal=
l body context.
> >> ++      // In theory we could treat breaks differently from continues,=
 but for now it is
> >> ++      // enough to treat them both as going back to the start of the=
 loop (which may then stop).
> >> ++      for _, c :=3D range rc.breaks {
> >> ++              c0 =3D join(c0, c, c.n, "range")
> >> ++              if c0.state =3D=3D stateError {
> >> ++                      c0.err.Line =3D c.n.(*parse.BreakNode).Line
> >> ++                      c0.err.Description =3D "at range loop break: "=
 + c0.err.Description
> >> ++                      return c0
> >> ++              }
> >> ++      }
> >> ++      for _, c :=3D range rc.continues {
> >> ++              c0 =3D join(c0, c, c.n, "range")
> >> ++              if c0.state =3D=3D stateError {
> >> ++                      c0.err.Line =3D c.n.(*parse.ContinueNode).Line
> >> ++                      c0.err.Description =3D "at range loop continue=
: " + c0.err.Description
> >> ++                      return c0
> >> ++              }
> >> ++      }
> >> ++      return c0
> >> ++}
> >> ++
> >> + // escapeList escapes a list template node.
> >> + func (e *escaper) escapeList(c context, n *parse.ListNode) context {
> >> +       if n =3D=3D nil {
> >> +@@ -493,6 +558,9 @@ func (e *escaper) escapeList(c context, n *parse.=
ListNode) context {
> >> +       }
> >> +       for _, m :=3D range n.Nodes {
> >> +               c =3D e.escape(c, m)
> >> ++              if c.state =3D=3D stateDead {
> >> ++                      break
> >> ++              }
> >> +       }
> >> +       return c
> >> + }
> >> +@@ -503,6 +571,7 @@ func (e *escaper) escapeList(c context, n *parse.=
ListNode) context {
> >> + // which is the same as whether e was updated.
> >> + func (e *escaper) escapeListConditionally(c context, n *parse.ListNo=
de, filter func(*escaper, context) bool) (context, bool) {
> >> +       e1 :=3D makeEscaper(e.ns)
> >> ++      e1.rangeContext =3D e.rangeContext
> >> +       // Make type inferences available to f.
> >> +       for k, v :=3D range e.output {
> >> +               e1.output[k] =3D v
> >> +diff --git a/src/html/template/escape_test.go b/src/html/template/esc=
ape_test.go
> >> +index c709660..fa2b84a 100644
> >> +--- a/src/html/template/escape_test.go
> >> ++++ b/src/html/template/escape_test.go
> >> +@@ -920,6 +920,22 @@ func TestErrors(t *testing.T) {
> >> +                       "<a href=3D'/foo?{{range .Items}}&{{.K}}=3D{{.=
V}}{{end}}'>",
> >> +                       "",
> >> +               },
> >> ++              {
> >> ++                      "{{range .Items}}<a{{if .X}}{{end}}>{{end}}",
> >> ++                      "",
> >> ++              },
> >> ++              {
> >> ++                      "{{range .Items}}<a{{if .X}}{{end}}>{{continue=
}}{{end}}",
> >> ++                      "",
> >> ++              },
> >> ++              {
> >> ++                      "{{range .Items}}<a{{if .X}}{{end}}>{{break}}{=
{end}}",
> >> ++                      "",
> >> ++              },
> >> ++              {
> >> ++                      "{{range .Items}}<a{{if .X}}{{end}}>{{if .X}}{=
{break}}{{end}}{{end}}",
> >> ++                      "",
> >> ++              },
> >> +               // Error cases.
> >> +               {
> >> +                       "{{if .Cond}}<a{{end}}",
> >> +@@ -956,6 +972,14 @@ func TestErrors(t *testing.T) {
> >> +                       "z:2:8: on range loop re-entry: {{range}} bran=
ches",
> >> +               },
> >> +               {
> >> ++                      "{{range .Items}}<a{{if .X}}{{break}}{{end}}>{=
{end}}",
> >> ++                      "z:1:29: at range loop break: {{range}} branch=
es end in different contexts",
> >> ++              },
> >> ++              {
> >> ++                      "{{range .Items}}<a{{if .X}}{{continue}}{{end}=
}>{{end}}",
> >> ++                      "z:1:29: at range loop continue: {{range}} bra=
nches end in different contexts",
> >> ++              },
> >> ++              {
> >> +                       "<a b=3D1 c=3D{{.H}}",
> >> +                       "z: ends in a non-text context: {stateAttr del=
imSpaceOrTagEnd",
> >> +               },
> >> +diff --git a/src/text/template/doc.go b/src/text/template/doc.go
> >> +index 7b30294..0228b15 100644
> >> +--- a/src/text/template/doc.go
> >> ++++ b/src/text/template/doc.go
> >> +@@ -112,6 +112,14 @@ data, defined in detail in the corresponding sec=
tions that follow.
> >> +               T0 is executed; otherwise, dot is set to the successiv=
e elements
> >> +               of the array, slice, or map and T1 is executed.
> >> +
> >> ++      {{break}}
> >> ++              The innermost {{range pipeline}} loop is ended early, =
stopping the
> >> ++              current iteration and bypassing all remaining iteratio=
ns.
> >> ++
> >> ++      {{continue}}
> >> ++              The current iteration of the innermost {{range pipelin=
e}} loop is
> >> ++              stopped, and the loop starts the next iteration.
> >> ++
> >> +       {{template "name"}}
> >> +               The template with the specified name is executed with =
nil data.
> >> +
> >> +diff --git a/src/text/template/exec.go b/src/text/template/exec.go
> >> +index 7ac5175..6cb140a 100644
> >> +--- a/src/text/template/exec.go
> >> ++++ b/src/text/template/exec.go
> >> +@@ -5,6 +5,7 @@
> >> + package template
> >> +
> >> + import (
> >> ++      "errors"
> >> +       "fmt"
> >> +       "internal/fmtsort"
> >> +       "io"
> >> +@@ -244,6 +245,12 @@ func (t *Template) DefinedTemplates() string {
> >> +       return b.String()
> >> + }
> >> +
> >> ++// Sentinel errors for use with panic to signal early exits from ran=
ge loops.
> >> ++var (
> >> ++      walkBreak    =3D errors.New("break")
> >> ++      walkContinue =3D errors.New("continue")
> >> ++)
> >> ++
> >> + // Walk functions step through the major pieces of the template stru=
cture,
> >> + // generating output as they go.
> >> + func (s *state) walk(dot reflect.Value, node parse.Node) {
> >> +@@ -256,7 +263,11 @@ func (s *state) walk(dot reflect.Value, node par=
se.Node) {
> >> +               if len(node.Pipe.Decl) =3D=3D 0 {
> >> +                       s.printValue(node, val)
> >> +               }
> >> ++      case *parse.BreakNode:
> >> ++              panic(walkBreak)
> >> +       case *parse.CommentNode:
> >> ++      case *parse.ContinueNode:
> >> ++              panic(walkContinue)
> >> +       case *parse.IfNode:
> >> +               s.walkIfOrWith(parse.NodeIf, dot, node.Pipe, node.List=
, node.ElseList)
> >> +       case *parse.ListNode:
> >> +@@ -335,6 +346,11 @@ func isTrue(val reflect.Value) (truth, ok bool) =
{
> >> +
> >> + func (s *state) walkRange(dot reflect.Value, r *parse.RangeNode) {
> >> +       s.at(r)
> >> ++      defer func() {
> >> ++              if r :=3D recover(); r !=3D nil && r !=3D walkBreak {
> >> ++                      panic(r)
> >> ++              }
> >> ++      }()
> >> +       defer s.pop(s.mark())
> >> +       val, _ :=3D indirect(s.evalPipeline(dot, r.Pipe))
> >> +       // mark top of stack before any variables in the body are push=
ed.
> >> +@@ -348,8 +364,14 @@ func (s *state) walkRange(dot reflect.Value, r *=
parse.RangeNode) {
> >> +               if len(r.Pipe.Decl) > 1 {
> >> +                       s.setTopVar(2, index)
> >> +               }
> >> ++              defer s.pop(mark)
> >> ++              defer func() {
> >> ++                      // Consume panic(walkContinue)
> >> ++                      if r :=3D recover(); r !=3D nil && r !=3D walk=
Continue {
> >> ++                              panic(r)
> >> ++                      }
> >> ++              }()
> >> +               s.walk(elem, r.List)
> >> +-              s.pop(mark)
> >> +       }
> >> +       switch val.Kind() {
> >> +       case reflect.Array, reflect.Slice:
> >> +diff --git a/src/text/template/exec_test.go b/src/text/template/exec_=
test.go
> >> +index 3309b33..a639f44 100644
> >> +--- a/src/text/template/exec_test.go
> >> ++++ b/src/text/template/exec_test.go
> >> +@@ -563,6 +563,8 @@ var execTests =3D []execTest{
> >> +       {"range empty no else", "{{range .SIEmpty}}-{{.}}-{{end}}", ""=
, tVal, true},
> >> +       {"range []int else", "{{range .SI}}-{{.}}-{{else}}EMPTY{{end}}=
", "-3--4--5-", tVal, true},
> >> +       {"range empty else", "{{range .SIEmpty}}-{{.}}-{{else}}EMPTY{{=
end}}", "EMPTY", tVal, true},
> >> ++      {"range []int break else", "{{range .SI}}-{{.}}-{{break}}NOTRE=
ACHED{{else}}EMPTY{{end}}", "-3-", tVal, true},
> >> ++      {"range []int continue else", "{{range .SI}}-{{.}}-{{continue}=
}NOTREACHED{{else}}EMPTY{{end}}", "-3--4--5-", tVal, true},
> >> +       {"range []bool", "{{range .SB}}-{{.}}-{{end}}", "-true--false-=
", tVal, true},
> >> +       {"range []int method", "{{range .SI | .MAdd .I}}-{{.}}-{{end}}=
", "-20--21--22-", tVal, true},
> >> +       {"range map", "{{range .MSI}}-{{.}}-{{end}}", "-1--3--2-", tVa=
l, true},
> >> +diff --git a/src/text/template/parse/lex.go b/src/text/template/parse=
/lex.go
> >> +index 6784071..95e3377 100644
> >> +--- a/src/text/template/parse/lex.go
> >> ++++ b/src/text/template/parse/lex.go
> >> +@@ -62,6 +62,8 @@ const (
> >> +       // Keywords appear after all the rest.
> >> +       itemKeyword  // used only to delimit the keywords
> >> +       itemBlock    // block keyword
> >> ++      itemBreak    // break keyword
> >> ++      itemContinue // continue keyword
> >> +       itemDot      // the cursor, spelled '.'
> >> +       itemDefine   // define keyword
> >> +       itemElse     // else keyword
> >> +@@ -76,6 +78,8 @@ const (
> >> + var key =3D map[string]itemType{
> >> +       ".":        itemDot,
> >> +       "block":    itemBlock,
> >> ++      "break":    itemBreak,
> >> ++      "continue": itemContinue,
> >> +       "define":   itemDefine,
> >> +       "else":     itemElse,
> >> +       "end":      itemEnd,
> >> +@@ -119,6 +123,8 @@ type lexer struct {
> >> +       parenDepth  int       // nesting depth of ( ) exprs
> >> +       line        int       // 1+number of newlines seen
> >> +       startLine   int       // start line of this item
> >> ++      breakOK     bool      // break keyword allowed
> >> ++      continueOK  bool      // continue keyword allowed
> >> + }
> >> +
> >> + // next returns the next rune in the input.
> >> +@@ -461,7 +467,12 @@ Loop:
> >> +                       }
> >> +                       switch {
> >> +                       case key[word] > itemKeyword:
> >> +-                              l.emit(key[word])
> >> ++                              item :=3D key[word]
> >> ++                              if item =3D=3D itemBreak && !l.breakOK=
 || item =3D=3D itemContinue && !l.continueOK {
> >> ++                                      l.emit(itemIdentifier)
> >> ++                              } else {
> >> ++                                      l.emit(item)
> >> ++                              }
> >> +                       case word[0] =3D=3D '.':
> >> +                               l.emit(itemField)
> >> +                       case word =3D=3D "true", word =3D=3D "false":
> >> +diff --git a/src/text/template/parse/lex_test.go b/src/text/template/=
parse/lex_test.go
> >> +index 6510eed..df6aabf 100644
> >> +--- a/src/text/template/parse/lex_test.go
> >> ++++ b/src/text/template/parse/lex_test.go
> >> +@@ -35,6 +35,8 @@ var itemName =3D map[itemType]string{
> >> +       // keywords
> >> +       itemDot:      ".",
> >> +       itemBlock:    "block",
> >> ++      itemBreak:    "break",
> >> ++      itemContinue: "continue",
> >> +       itemDefine:   "define",
> >> +       itemElse:     "else",
> >> +       itemIf:       "if",
> >> +diff --git a/src/text/template/parse/node.go b/src/text/template/pars=
e/node.go
> >> +index a9dad5e..c398da0 100644
> >> +--- a/src/text/template/parse/node.go
> >> ++++ b/src/text/template/parse/node.go
> >> +@@ -71,6 +71,8 @@ const (
> >> +       NodeVariable                   // A $ variable.
> >> +       NodeWith                       // A with action.
> >> +       NodeComment                    // A comment.
> >> ++      NodeBreak                      // A break action.
> >> ++      NodeContinue                   // A continue action.
> >> + )
> >> +
> >> + // Nodes.
> >> +@@ -907,6 +909,40 @@ func (i *IfNode) Copy() Node {
> >> +       return i.tr.newIf(i.Pos, i.Line, i.Pipe.CopyPipe(), i.List.Cop=
yList(), i.ElseList.CopyList())
> >> + }
> >> +
> >> ++// BreakNode represents a {{break}} action.
> >> ++type BreakNode struct {
> >> ++      tr *Tree
> >> ++      NodeType
> >> ++      Pos
> >> ++      Line int
> >> ++}
> >> ++
> >> ++func (t *Tree) newBreak(pos Pos, line int) *BreakNode {
> >> ++      return &BreakNode{tr: t, NodeType: NodeBreak, Pos: pos, Line: =
line}
> >> ++}
> >> ++
> >> ++func (b *BreakNode) Copy() Node                  { return b.tr.newBr=
eak(b.Pos, b.Line) }
> >> ++func (b *BreakNode) String() string              { return "{{break}}=
" }
> >> ++func (b *BreakNode) tree() *Tree                 { return b.tr }
> >> ++func (b *BreakNode) writeTo(sb *strings.Builder) { sb.WriteString("{=
{break}}") }
> >> ++
> >> ++// ContinueNode represents a {{continue}} action.
> >> ++type ContinueNode struct {
> >> ++      tr *Tree
> >> ++      NodeType
> >> ++      Pos
> >> ++      Line int
> >> ++}
> >> ++
> >> ++func (t *Tree) newContinue(pos Pos, line int) *ContinueNode {
> >> ++      return &ContinueNode{tr: t, NodeType: NodeContinue, Pos: pos, =
Line: line}
> >> ++}
> >> ++
> >> ++func (c *ContinueNode) Copy() Node                  { return c.tr.ne=
wContinue(c.Pos, c.Line) }
> >> ++func (c *ContinueNode) String() string              { return "{{cont=
inue}}" }
> >> ++func (c *ContinueNode) tree() *Tree                 { return c.tr }
> >> ++func (c *ContinueNode) writeTo(sb *strings.Builder) { sb.WriteString=
("{{continue}}") }
> >> ++
> >> + // RangeNode represents a {{range}} action and its commands.
> >> + type RangeNode struct {
> >> +       BranchNode
> >> +diff --git a/src/text/template/parse/parse.go b/src/text/template/par=
se/parse.go
> >> +index 5e6e512..7f78b56 100644
> >> +--- a/src/text/template/parse/parse.go
> >> ++++ b/src/text/template/parse/parse.go
> >> +@@ -31,6 +31,7 @@ type Tree struct {
> >> +       vars       []string // variables defined at the moment.
> >> +       treeSet    map[string]*Tree
> >> +       actionLine int // line of left delim starting action
> >> ++      rangeDepth int
> >> +       mode       Mode
> >> + }
> >> +
> >> +@@ -223,6 +224,8 @@ func (t *Tree) startParse(funcs []map[string]inte=
rface{}, lex *lexer, treeSet ma
> >> +       t.vars =3D []string{"$"}
> >> +       t.funcs =3D funcs
> >> +       t.treeSet =3D treeSet
> >> ++      lex.breakOK =3D !t.hasFunction("break")
> >> ++      lex.continueOK =3D !t.hasFunction("continue")
> >> + }
> >> +
> >> + // stopParse terminates parsing.
> >> +@@ -385,6 +388,10 @@ func (t *Tree) action() (n Node) {
> >> +       switch token :=3D t.nextNonSpace(); token.typ {
> >> +       case itemBlock:
> >> +               return t.blockControl()
> >> ++      case itemBreak:
> >> ++              return t.breakControl(token.pos, token.line)
> >> ++      case itemContinue:
> >> ++              return t.continueControl(token.pos, token.line)
> >> +       case itemElse:
> >> +               return t.elseControl()
> >> +       case itemEnd:
> >> +@@ -404,6 +411,32 @@ func (t *Tree) action() (n Node) {
> >> +       return t.newAction(token.pos, token.line, t.pipeline("command"=
, itemRightDelim))
> >> + }
> >> +
> >> ++// Break:
> >> ++//    {{break}}
> >> ++// Break keyword is past.
> >> ++func (t *Tree) breakControl(pos Pos, line int) Node {
> >> ++      if token :=3D t.next(); token.typ !=3D itemRightDelim {
> >> ++              t.unexpected(token, "in {{break}}")
> >> ++      }
> >> ++      if t.rangeDepth =3D=3D 0 {
> >> ++              t.errorf("{{break}} outside {{range}}")
> >> ++      }
> >> ++      return t.newBreak(pos, line)
> >> ++}
> >> ++
> >> ++// Continue:
> >> ++//    {{continue}}
> >> ++// Continue keyword is past.
> >> ++func (t *Tree) continueControl(pos Pos, line int) Node {
> >> ++      if token :=3D t.next(); token.typ !=3D itemRightDelim {
> >> ++              t.unexpected(token, "in {{continue}}")
> >> ++      }
> >> ++      if t.rangeDepth =3D=3D 0 {
> >> ++              t.errorf("{{continue}} outside {{range}}")
> >> ++      }
> >> ++      return t.newContinue(pos, line)
> >> ++}
> >> ++
> >> + // Pipeline:
> >> + //    declarations? command ('|' command)*
> >> + func (t *Tree) pipeline(context string, end itemType) (pipe *PipeNod=
e) {
> >> +@@ -479,8 +512,14 @@ func (t *Tree) checkPipeline(pipe *PipeNode, con=
text string) {
> >> + func (t *Tree) parseControl(allowElseIf bool, context string) (pos P=
os, line int, pipe *PipeNode, list, elseList *ListNode) {
> >> +       defer t.popVars(len(t.vars))
> >> +       pipe =3D t.pipeline(context, itemRightDelim)
> >> ++      if context =3D=3D "range" {
> >> ++              t.rangeDepth++
> >> ++      }
> >> +       var next Node
> >> +       list, next =3D t.itemList()
> >> ++      if context =3D=3D "range" {
> >> ++              t.rangeDepth--
> >> ++      }
> >> +       switch next.Type() {
> >> +       case nodeEnd: //done
> >> +       case nodeElse:
> >> +@@ -522,7 +561,8 @@ func (t *Tree) ifControl() Node {
> >> + //    {{range pipeline}} itemList {{else}} itemList {{end}}
> >> + // Range keyword is past.
> >> + func (t *Tree) rangeControl() Node {
> >> +-      return t.newRange(t.parseControl(false, "range"))
> >> ++      r :=3D t.newRange(t.parseControl(false, "range"))
> >> ++      return r
> >> + }
> >> +
> >> + // With:
> >> +diff --git a/src/text/template/parse/parse_test.go b/src/text/templat=
e/parse/parse_test.go
> >> +index 220f984..ba45636 100644
> >> +--- a/src/text/template/parse/parse_test.go
> >> ++++ b/src/text/template/parse/parse_test.go
> >> +@@ -230,6 +230,10 @@ var parseTests =3D []parseTest{
> >> +               `{{range $x :=3D .SI}}{{.}}{{end}}`},
> >> +       {"range 2 vars", "{{range $x, $y :=3D .SI}}{{.}}{{end}}", noEr=
ror,
> >> +               `{{range $x, $y :=3D .SI}}{{.}}{{end}}`},
> >> ++      {"range with break", "{{range .SI}}{{.}}{{break}}{{end}}", noE=
rror,
> >> ++              `{{range .SI}}{{.}}{{break}}{{end}}`},
> >> ++      {"range with continue", "{{range .SI}}{{.}}{{continue}}{{end}}=
", noError,
> >> ++              `{{range .SI}}{{.}}{{continue}}{{end}}`},
> >> +       {"constants", "{{range .SI 1 -3.2i true false 'a' nil}}{{end}}=
", noError,
> >> +               `{{range .SI 1 -3.2i true false 'a' nil}}{{end}}`},
> >> +       {"template", "{{template `x`}}", noError,
> >> +@@ -279,6 +283,10 @@ var parseTests =3D []parseTest{
> >> +       {"adjacent args", "{{printf 3`x`}}", hasError, ""},
> >> +       {"adjacent args with .", "{{printf `x`.}}", hasError, ""},
> >> +       {"extra end after if", "{{if .X}}a{{else if .Y}}b{{end}}{{end}=
}", hasError, ""},
> >> ++      {"break outside range", "{{range .}}{{end}} {{break}}", hasErr=
or, ""},
> >> ++      {"continue outside range", "{{range .}}{{end}} {{continue}}", =
hasError, ""},
> >> ++      {"break in range else", "{{range .}}{{else}}{{break}}{{end}}",=
 hasError, ""},
> >> ++      {"continue in range else", "{{range .}}{{else}}{{continue}}{{e=
nd}}", hasError, ""},
> >> +       // Other kinds of assignments and operators aren't available y=
et.
> >> +       {"bug0a", "{{$x :=3D 0}}{{$x}}", noError, "{{$x :=3D 0}}{{$x}}=
"},
> >> +       {"bug0b", "{{$x +=3D 1}}{{$x}}", hasError, ""},
> >> +--
> >> +2.7.4
> >> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-3.patch b=
/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_6.patch
> >> similarity index 53%
> >> rename from meta/recipes-devtools/go/go-1.14/CVE-2023-24538-3.patch
> >> rename to meta/recipes-devtools/go/go-1.14/CVE-2023-24538_6.patch
> >> index d5bb33e091..baf400b891 100644
> >> --- a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-3.patch
> >> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_6.patch
> >> @@ -1,7 +1,7 @@
> >>  From 16f4882984569f179d73967c9eee679bb9b098c5 Mon Sep 17 00:00:00 200=
1
> >>  From: Roland Shoemaker <bracewell@google.com>
> >>  Date: Mon, 20 Mar 2023 11:01:13 -0700
> >> -Subject: [PATCH 3/3] html/template: disallow actions in JS template l=
iterals
> >> +Subject: [PATCH 6/6] html/template: disallow actions in JS template l=
iterals
> >>
> >>  ECMAScript 6 introduced template literals[0][1] which are delimited w=
ith
> >>  backticks. These need to be escaped in a similar fashion to the
> >> @@ -52,12 +52,15 @@ CVE: CVE-2023-24538
> >>  Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> >>  ---
> >>   src/html/template/context.go      |  2 ++
> >> - src/html/template/error.go        | 13 +++++++++++++
> >> - src/html/template/escape.go       | 11 +++++++++++
> >> + src/html/template/error.go        | 13 ++++++++
> >> + src/html/template/escape.go       | 11 +++++++
> >> + src/html/template/escape_test.go  | 66 ++++++++++++++++++++++-------=
----------
> >>   src/html/template/js.go           |  2 ++
> >> - src/html/template/jsctx_string.go |  9 +++++++++
> >> - src/html/template/transition.go   |  7 ++++++-
> >> - 6 files changed, 43 insertions(+), 1 deletion(-)
> >> + src/html/template/js_test.go      |  2 +-
> >> + src/html/template/jsctx_string.go |  9 ++++++
> >> + src/html/template/state_string.go | 37 ++++++++++++++++++++--
> >> + src/html/template/transition.go   |  7 ++++-
> >> + 9 files changed, 116 insertions(+), 33 deletions(-)
> >>
> >>  diff --git a/src/html/template/context.go b/src/html/template/context=
.go
> >>  index f7d4849..0b65313 100644
> >> @@ -125,6 +128,104 @@ index f12dafa..29ca5b3 100644
> >>         case stateJSRegexp:
> >>                 s =3D append(s, "_html_template_jsregexpescaper")
> >>         case stateCSS:
> >> +diff --git a/src/html/template/escape_test.go b/src/html/template/esc=
ape_test.go
> >> +index fa2b84a..1b150e9 100644
> >> +--- a/src/html/template/escape_test.go
> >> ++++ b/src/html/template/escape_test.go
> >> +@@ -681,35 +681,31 @@ func TestEscape(t *testing.T) {
> >> +       }
> >> +
> >> +       for _, test :=3D range tests {
> >> +-              tmpl :=3D New(test.name)
> >> +-              tmpl =3D Must(tmpl.Parse(test.input))
> >> +-              // Check for bug 6459: Tree field was not set in Parse=
.
> >> +-              if tmpl.Tree !=3D tmpl.text.Tree {
> >> +-                      t.Errorf("%s: tree not set properly", test.nam=
e)
> >> +-                      continue
> >> +-              }
> >> +-              b :=3D new(bytes.Buffer)
> >> +-              if err :=3D tmpl.Execute(b, data); err !=3D nil {
> >> +-                      t.Errorf("%s: template execution failed: %s", =
test.name, err)
> >> +-                      continue
> >> +-              }
> >> +-              if w, g :=3D test.output, b.String(); w !=3D g {
> >> +-                      t.Errorf("%s: escaped output: want\n\t%q\ngot\=
n\t%q", test.name, w, g)
> >> +-                      continue
> >> +-              }
> >> +-              b.Reset()
> >> +-              if err :=3D tmpl.Execute(b, pdata); err !=3D nil {
> >> +-                      t.Errorf("%s: template execution failed for po=
inter: %s", test.name, err)
> >> +-                      continue
> >> +-              }
> >> +-              if w, g :=3D test.output, b.String(); w !=3D g {
> >> +-                      t.Errorf("%s: escaped output for pointer: want=
\n\t%q\ngot\n\t%q", test.name, w, g)
> >> +-                      continue
> >> +-              }
> >> +-              if tmpl.Tree !=3D tmpl.text.Tree {
> >> +-                      t.Errorf("%s: tree mismatch", test.name)
> >> +-                      continue
> >> +-              }
> >> ++              t.Run(test.name, func(t *testing.T) {
> >> ++                      tmpl :=3D New(test.name)
> >> ++                      tmpl =3D Must(tmpl.Parse(test.input))
> >> ++                      // Check for bug 6459: Tree field was not set =
in Parse.
> >> ++                      if tmpl.Tree !=3D tmpl.text.Tree {
> >> ++                              t.Fatalf("%s: tree not set properly", =
test.name)
> >> ++                      }
> >> ++                      b :=3D new(strings.Builder)
> >> ++                      if err :=3D tmpl.Execute(b, data); err !=3D ni=
l {
> >> ++                              t.Fatalf("%s: template execution faile=
d: %s", test.name, err)
> >> ++                      }
> >> ++                      if w, g :=3D test.output, b.String(); w !=3D g=
 {
> >> ++                              t.Fatalf("%s: escaped output: want\n\t=
%q\ngot\n\t%q", test.name, w, g)
> >> ++                      }
> >> ++                      b.Reset()
> >> ++                      if err :=3D tmpl.Execute(b, pdata); err !=3D n=
il {
> >> ++                              t.Fatalf("%s: template execution faile=
d for pointer: %s", test.name, err)
> >> ++                      }
> >> ++                      if w, g :=3D test.output, b.String(); w !=3D g=
 {
> >> ++                              t.Fatalf("%s: escaped output for point=
er: want\n\t%q\ngot\n\t%q", test.name, w, g)
> >> ++                      }
> >> ++                      if tmpl.Tree !=3D tmpl.text.Tree {
> >> ++                              t.Fatalf("%s: tree mismatch", test.nam=
e)
> >> ++                      }
> >> ++              })
> >> +       }
> >> + }
> >> +
> >> +@@ -936,6 +932,10 @@ func TestErrors(t *testing.T) {
> >> +                       "{{range .Items}}<a{{if .X}}{{end}}>{{if .X}}{=
{break}}{{end}}{{end}}",
> >> +                       "",
> >> +               },
> >> ++              {
> >> ++                      "<script>var a =3D `${a+b}`</script>`",
> >> ++                      "",
> >> ++              },
> >> +               // Error cases.
> >> +               {
> >> +                       "{{if .Cond}}<a{{end}}",
> >> +@@ -1082,6 +1082,10 @@ func TestErrors(t *testing.T) {
> >> +                       // html is allowed since it is the last comman=
d in the pipeline, but urlquery is not.
> >> +                       `predefined escaper "urlquery" disallowed in t=
emplate`,
> >> +               },
> >> ++              {
> >> ++                      "<script>var tmpl =3D `asd {{.}}`;</script>",
> >> ++                      `{{.}} appears in a JS template literal`,
> >> ++              },
> >> +       }
> >> +       for _, test :=3D range tests {
> >> +               buf :=3D new(bytes.Buffer)
> >> +@@ -1304,6 +1308,10 @@ func TestEscapeText(t *testing.T) {
> >> +                       context{state: stateJSSqStr, delim: delimDoubl=
eQuote, attr: attrScript},
> >> +               },
> >> +               {
> >> ++                      "<a onclick=3D\"`foo",
> >> ++                      context{state: stateJSBqStr, delim: delimDoubl=
eQuote, attr: attrScript},
> >> ++              },
> >> ++              {
> >> +                       `<A ONCLICK=3D"'`,
> >> +                       context{state: stateJSSqStr, delim: delimDoubl=
eQuote, attr: attrScript},
> >> +               },
> >>  diff --git a/src/html/template/js.go b/src/html/template/js.go
> >>  index ea9c183..b888eaf 100644
> >>  --- a/src/html/template/js.go
> >> @@ -145,6 +246,19 @@ index ea9c183..b888eaf 100644
> >>         '+':  `\u002b`,
> >>         '/':  `\/`,
> >>         '<':  `\u003c`,
> >> +diff --git a/src/html/template/js_test.go b/src/html/template/js_test=
.go
> >> +index d7ee47b..7d963ae 100644
> >> +--- a/src/html/template/js_test.go
> >> ++++ b/src/html/template/js_test.go
> >> +@@ -292,7 +292,7 @@ func TestEscapersOnLower7AndSelectHighCodepoints(=
t *testing.T) {
> >> +                               `0123456789:;\u003c=3D\u003e?` +
> >> +                               `@ABCDEFGHIJKLMNO` +
> >> +                               `PQRSTUVWXYZ[\\]^_` +
> >> +-                              "`abcdefghijklmno" +
> >> ++                              "\\u0060abcdefghijklmno" +
> >> +                               "pqrstuvwxyz{|}~\u007f" +
> >> +                               "\u00A0\u0100\\u2028\\u2029\ufeff\U000=
1D11E",
> >> +               },
> >>  diff --git a/src/html/template/jsctx_string.go b/src/html/template/js=
ctx_string.go
> >>  index dd1d87e..2394893 100644
> >>  --- a/src/html/template/jsctx_string.go
> >> @@ -165,6 +279,55 @@ index dd1d87e..2394893 100644
> >>   const _jsCtx_name =3D "jsCtxRegexpjsCtxDivOpjsCtxUnknown"
> >>
> >>   var _jsCtx_index =3D [...]uint8{0, 11, 21, 33}
> >> +diff --git a/src/html/template/state_string.go b/src/html/template/st=
ate_string.go
> >> +index 05104be..6fb1a6e 100644
> >> +--- a/src/html/template/state_string.go
> >> ++++ b/src/html/template/state_string.go
> >> +@@ -4,9 +4,42 @@ package template
> >> +
> >> + import "strconv"
> >> +
> >> +-const _state_name =3D "stateTextstateTagstateAttrNamestateAfterNames=
tateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSst=
ateJSDqStrstateJSSqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateCSSsta=
teCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCm=
tstateCSSLineCmtstateError"
> >> ++func _() {
> >> ++      // An "invalid array index" compiler error signifies that the =
constant values have changed.
> >> ++      // Re-run the stringer command to generate them again.
> >> ++      var x [1]struct{}
> >> ++      _ =3D x[stateText-0]
> >> ++      _ =3D x[stateTag-1]
> >> ++      _ =3D x[stateAttrName-2]
> >> ++      _ =3D x[stateAfterName-3]
> >> ++      _ =3D x[stateBeforeValue-4]
> >> ++      _ =3D x[stateHTMLCmt-5]
> >> ++      _ =3D x[stateRCDATA-6]
> >> ++      _ =3D x[stateAttr-7]
> >> ++      _ =3D x[stateURL-8]
> >> ++      _ =3D x[stateSrcset-9]
> >> ++      _ =3D x[stateJS-10]
> >> ++      _ =3D x[stateJSDqStr-11]
> >> ++      _ =3D x[stateJSSqStr-12]
> >> ++      _ =3D x[stateJSBqStr-13]
> >> ++      _ =3D x[stateJSRegexp-14]
> >> ++      _ =3D x[stateJSBlockCmt-15]
> >> ++      _ =3D x[stateJSLineCmt-16]
> >> ++      _ =3D x[stateCSS-17]
> >> ++      _ =3D x[stateCSSDqStr-18]
> >> ++      _ =3D x[stateCSSSqStr-19]
> >> ++      _ =3D x[stateCSSDqURL-20]
> >> ++      _ =3D x[stateCSSSqURL-21]
> >> ++      _ =3D x[stateCSSURL-22]
> >> ++      _ =3D x[stateCSSBlockCmt-23]
> >> ++      _ =3D x[stateCSSLineCmt-24]
> >> ++      _ =3D x[stateError-25]
> >> ++      _ =3D x[stateDead-26]
> >> ++}
> >> ++
> >> ++const _state_name =3D "stateTextstateTagstateAttrNamestateAfterNames=
tateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSst=
ateJSDqStrstateJSSqStrstateJSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCm=
tstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLsta=
teCSSBlockCmtstateCSSLineCmtstateErrorstateDead"
> >> +
> >> +-var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 1=
00, 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 244, 255, 271, 2=
86, 296}
> >> ++var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 1=
00, 111, 118, 130, 142, 154, 167, 182, 196, 204, 217, 230, 243, 256, 267, 2=
83, 298, 308, 317}
> >> +
> >> + func (i state) String() string {
> >> +       if i >=3D state(len(_state_index)-1) {
> >>  diff --git a/src/html/template/transition.go b/src/html/template/tran=
sition.go
> >>  index 06df679..92eb351 100644
> >>  --- a/src/html/template/transition.go
> >> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch b/m=
eta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
> >> index 20e70c0485..00def8fcda 100644
> >> --- a/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
> >> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
> >> @@ -34,9 +34,9 @@ Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> >>   src/html/template/context.go      |  6 ++-
> >>   src/html/template/escape.go       |  5 +-
> >>   src/html/template/escape_test.go  | 10 ++++
> >> - src/html/template/state_string.go |  4 +-
> >> + src/html/template/state_string.go | 26 +++++-----
> >>   src/html/template/transition.go   | 80 ++++++++++++++++++++---------=
--
> >> - 5 files changed, 72 insertions(+), 33 deletions(-)
> >> + 5 files changed, 84 insertions(+), 43 deletions(-)
> >>
> >>  diff --git a/src/html/template/context.go b/src/html/template/context=
.go
> >>  index 0b65313..4eb7891 100644
> >> @@ -105,14 +105,38 @@ diff --git a/src/html/template/state_string.go b=
/src/html/template/state_string.
> >>  index 05104be..b5cfe70 100644
> >>  --- a/src/html/template/state_string.go
> >>  +++ b/src/html/template/state_string.go
> >> -@@ -4,9 +4,9 @@ package template
> >> -
> >> - import "strconv"
> >> +@@ -25,21 +25,23 @@ func _() {
> >> +       _ =3D x[stateJSRegexp-14]
> >> +       _ =3D x[stateJSBlockCmt-15]
> >> +       _ =3D x[stateJSLineCmt-16]
> >> +-      _ =3D x[stateCSS-17]
> >> +-      _ =3D x[stateCSSDqStr-18]
> >> +-      _ =3D x[stateCSSSqStr-19]
> >> +-      _ =3D x[stateCSSDqURL-20]
> >> +-      _ =3D x[stateCSSSqURL-21]
> >> +-      _ =3D x[stateCSSURL-22]
> >> +-      _ =3D x[stateCSSBlockCmt-23]
> >> +-      _ =3D x[stateCSSLineCmt-24]
> >> +-      _ =3D x[stateError-25]
> >> +-      _ =3D x[stateDead-26]
> >> ++      _ =3D x[stateJSHTMLOpenCmt-17]
> >> ++      _ =3D x[stateJSHTMLCloseCmt-18]
> >> ++      _ =3D x[stateCSS-19]
> >> ++      _ =3D x[stateCSSDqStr-20]
> >> ++      _ =3D x[stateCSSSqStr-21]
> >> ++      _ =3D x[stateCSSDqURL-22]
> >> ++      _ =3D x[stateCSSSqURL-23]
> >> ++      _ =3D x[stateCSSURL-24]
> >> ++      _ =3D x[stateCSSBlockCmt-25]
> >> ++      _ =3D x[stateCSSLineCmt-26]
> >> ++      _ =3D x[stateError-27]
> >> ++      _ =3D x[stateDead-28]
> >> + }
> >>
> >> --const _state_name =3D "stateTextstateTagstateAttrNamestateAfterNames=
tateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSst=
ateJSDqStrstateJSSqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateCSSsta=
teCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCm=
tstateCSSLineCmtstateError"
> >> +-const _state_name =3D "stateTextstateTagstateAttrNamestateAfterNames=
tateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSst=
ateJSDqStrstateJSSqStrstateJSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCm=
tstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLsta=
teCSSBlockCmtstateCSSLineCmtstateErrorstateDead"
> >>  +const _state_name =3D "stateTextstateTagstateAttrNamestateAfterNames=
tateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSst=
ateJSDqStrstateJSSqStrstateJSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCm=
tstateJSHTMLOpenCmtstateJSHTMLCloseCmtstateCSSstateCSSDqStrstateCSSSqStrsta=
teCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateError=
stateDead"
> >>
> >> --var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 1=
00, 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 244, 255, 271, 2=
86, 296}
> >> +-var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 1=
00, 111, 118, 130, 142, 154, 167, 182, 196, 204, 217, 230, 243, 256, 267, 2=
83, 298, 308, 317}
> >>  +var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 1=
00, 111, 118, 130, 142, 154, 167, 182, 196, 214, 233, 241, 254, 267, 280, 2=
93, 304, 320, 335, 345, 354}
> >>
> >>   func (i state) String() string {
> >> --
> >> 2.42.0
> >>

