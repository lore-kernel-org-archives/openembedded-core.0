Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B99BE728DC
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 19:28:55 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.27034.1696015727523507693
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 12:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=T9XC2hzV;
 spf=pass (domain: mvista.com, ip: 209.85.167.50, mailfrom: skulkarni@mvista.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5033918c09eso22610149e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 12:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1696015726; x=1696620526; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lyvg8QXvXwmANNEiDY0jcsfG5MjUPcL2rhQAFOIZjB8=;
        b=T9XC2hzVFbBWKea01FUkBWvIg7OQdL3PSuA3kH8LSh5iuL5yvFzWwBn4yq7koSOjk2
         GGd3FzyHVg2tRVqgERZgzmNYuSCWM4LUaWwEQK59oCPALzZTYfybIFgCRu27RqBgKLoZ
         6uo9JUCD/MkEGTcD+tcuFGIPO0kyxENEOvJIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696015726; x=1696620526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyvg8QXvXwmANNEiDY0jcsfG5MjUPcL2rhQAFOIZjB8=;
        b=gd5rkNdvUjBJvQKnz707j9+LHH2mG13XGXWzhVnVJpbCMoMOvZQ2MgaVRYY/ifixxv
         OBeI0zEwi6uhKz0rKi530ysOcYDACBMCDRhdmgis8N9PSnF7wT3uCZBxMNpY/OLE8SmC
         P0bzA+AMeqC7b0oU6uLMSL1I33BvvtigdL0IiCh+QabJP/jPOAKjhgOeT8RsVeGxjkCW
         GZ0fpob9HuI5pRVvW+y3uivlacpZ4GJ1l0CpHHSCIqgdWa3HVJwfE2zJDM1ZKIJccFVE
         swwPWx805SZlWUReit4h8S+W53mzbWm7OLIxi3sr5/vbGnkY/bkt+ONvHrl2gv2U/QjQ
         HHmQ==
X-Gm-Message-State: AOJu0Yz+PZ37rwwNuY0QLfDrX6x8VLvuGv5JgXbkELpMc5g/o7TIwvCR
	iR/D90XYzJZTDo3/F+ru9ZcesP5uWbuJxARgEAL/ZMiQEqLIuMVpGYI=
X-Google-Smtp-Source: AGHT+IHz6s1eDBZ1Bjjvua7HV8NKRRzlnpxc/m3UsnbXzQZKYH8RZmgrm2JVjPFAAYjf3uI2HUhZt/pEG2QpsAcdZwI=
X-Received: by 2002:a05:6512:3a8c:b0:500:98ff:4162 with SMTP id
 q12-20020a0565123a8c00b0050098ff4162mr5109412lfu.40.1696015725106; Fri, 29
 Sep 2023 12:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230929185254.13571-1-skulkarni@mvista.com> <CAKzga+xfA_kXe7K171RcQKvVm=OApmw7ADpApP=iFC_FZT4AGA@mail.gmail.com>
 <CAOSpxdZqmMFoO7D9ES6+2vxUHp5G7Xb0BKHq2neWJGc5HpN2sQ@mail.gmail.com>
 <CAOSpxdZxkoFT-bN-0eSRXqLwZ1=BQsBScWUrsn0GzyNC+wTkxA@mail.gmail.com> <CAOSpxdb14AUBvxBPWPqLscT0KQT7MSgsFTnAcoT60xmvYeTVug@mail.gmail.com>
In-Reply-To: <CAOSpxdb14AUBvxBPWPqLscT0KQT7MSgsFTnAcoT60xmvYeTVug@mail.gmail.com>
From: Shubham Kulkarni <skulkarni@mvista.com>
Date: Sat, 30 Sep 2023 00:58:32 +0530
Message-ID: <CAKzga+wTp7eW9-GTovgtRyot_fDnHcwRRnooCX9ywpU-rWPwKg@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH v2] go: Update fix for CVE-2023-24538 & CVE-2023-39318
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d432a70606846e7f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 19:28:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188418

--000000000000d432a70606846e7f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Sorry!! There was an issue in my .gitconfig. I have sent v3 for both the
branches which generated list ids as follow:
kirkstone: https://lists.openembedded.org/g/openembedded-core/message/18841=
3
dunfell: https://lists.openembedded.org/g/openembedded-core/message/188415

Thanks,
Shubham Kulkarni

On Sat, Sep 30, 2023 at 12:53=E2=80=AFAM Steve Sakoman <steve@sakoman.com> =
wrote:

> On Fri, Sep 29, 2023 at 9:22=E2=80=AFAM Steve Sakoman <steve@sakoman.com>=
 wrote:
> >
> > On Fri, Sep 29, 2023 at 9:20=E2=80=AFAM Steve Sakoman <steve@sakoman.co=
m> wrote:
> > >
> > > On Fri, Sep 29, 2023 at 9:06=E2=80=AFAM Shubham Kulkarni <skulkarni@m=
vista.com>
> wrote:
> > > >
> > > > Hi Steve,
> > > >
> > > > Can you please check, if you are able to get these patches I sent
> for the Kirkstone & Dunfell branch.
> > > > It is not generating the group links/Topic id links like
> https://lists.openembedded.org/g/openembedded-devel/message/.
> > > >
> > > > I have sent a v2 version for both the dunfell and kirkstone, but
> still it didn't generate the links.
> > > > If you are able to get these patches, you can take either original
> or v2 for both Dunfell and Kirkstone. Both v1 & v2 are the same, just
> resent for link generation. Apologies for the inconvenience caused.
> > >
> > > No, I'm not seeing these on the list :-(
> >
> > Actually the kirsktone arrived just after sent this email!
>
> And now the dunfell version too.
>
> Steve
>
> > > > On Sat, Sep 30, 2023 at 12:23=E2=80=AFAM Shubham Kulkarni <
> skulkarni@mvista.com> wrote:
> > > >>
> > > >> From: Shubham Kulkarni <skulkarni@mvista.com>
> > > >>
> > > >> Add missing files in fix for CVE-2023-24538 & CVE-2023-39318
> > > >>
> > > >> Upstream Link -
> > > >> CVE-2023-24538:
> https://github.com/golang/go/commit/b1e3ecfa06b67014429a197ec5e134ce4303a=
d9b
> > > >> CVE-2023-39318:
> https://github.com/golang/go/commit/023b542edf38e2a1f87fcefb9f75ff2f99401=
b4c
> > > >>
> > > >> Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> > > >> ---
> > > >>  meta/recipes-devtools/go/go-1.14.inc          |   5 +-
> > > >>  .../go/go-1.14/CVE-2023-24538-1.patch         |   4 +-
> > > >>  .../go/go-1.14/CVE-2023-24538-2.patch         | 447 ++++++++++++-
> > > >>  .../go/go-1.14/CVE-2023-24538_3.patch         | 393 ++++++++++++
> > > >>  .../go/go-1.14/CVE-2023-24538_4.patch         | 497 +++++++++++++=
++
> > > >>  .../go/go-1.14/CVE-2023-24538_5.patch         | 585
> ++++++++++++++++++
> > > >>  ...3-24538-3.patch =3D> CVE-2023-24538_6.patch} | 175 +++++-
> > > >>  .../go/go-1.14/CVE-2023-39318.patch           |  38 +-
> > > >>  8 files changed, 2124 insertions(+), 20 deletions(-)
> > > >>  create mode 100644
> meta/recipes-devtools/go/go-1.14/CVE-2023-24538_3.patch
> > > >>  create mode 100644
> meta/recipes-devtools/go/go-1.14/CVE-2023-24538_4.patch
> > > >>  create mode 100644
> meta/recipes-devtools/go/go-1.14/CVE-2023-24538_5.patch
> > > >>  rename meta/recipes-devtools/go/go-1.14/{CVE-2023-24538-3.patch =
=3D>
> CVE-2023-24538_6.patch} (53%)
> > > >>
> > > >> diff --git a/meta/recipes-devtools/go/go-1.14.inc
> b/meta/recipes-devtools/go/go-1.14.inc
> > > >> index be63f64825..091b778de8 100644
> > > >> --- a/meta/recipes-devtools/go/go-1.14.inc
> > > >> +++ b/meta/recipes-devtools/go/go-1.14.inc
> > > >> @@ -60,7 +60,10 @@ SRC_URI +=3D "\
> > > >>      file://CVE-2023-24534.patch \
> > > >>      file://CVE-2023-24538-1.patch \
> > > >>      file://CVE-2023-24538-2.patch \
> > > >> -    file://CVE-2023-24538-3.patch \
> > > >> +    file://CVE-2023-24538_3.patch \
> > > >> +    file://CVE-2023-24538_4.patch \
> > > >> +    file://CVE-2023-24538_5.patch \
> > > >> +    file://CVE-2023-24538_6.patch \
> > > >>      file://CVE-2023-24539.patch \
> > > >>      file://CVE-2023-24540.patch \
> > > >>      file://CVE-2023-29405-1.patch \
> > > >> diff --git
> a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
> > > >> index eda26e5ff6..23c5075e41 100644
> > > >> --- a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
> > > >> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
> > > >> @@ -1,7 +1,7 @@
> > > >>  From 8acd01094d9ee17f6e763a61e49a8a808b3a9ddb Mon Sep 17 00:00:00
> 2001
> > > >>  From: Brad Fitzpatrick <bradfitz@golang.org>
> > > >>  Date: Mon, 2 Aug 2021 14:55:51 -0700
> > > >> -Subject: [PATCH 1/3] net/netip: add new IP address package
> > > >> +Subject: [PATCH 1/6] net/netip: add new IP address package
> > > >>
> > > >>  Co-authored-by: Alex Willmer <alex@moreati.org.uk> (GitHub
> @moreati)
> > > >>  Co-authored-by: Alexander Yastrebov <yastrebov.alex@gmail.com>
> > > >> @@ -31,7 +31,7 @@ Trust: Brad Fitzpatrick <bradfitz@golang.org>
> > > >>
> > > >>  Dependency Patch #1
> > > >>
> > > >> -Upstream-Status: Backport [
> https://github.com/golang/go/commit/a59e33224e42d60a97fa720a45e1b74eb6aaa=
3d0
> ]
> > > >> +Upstream-Status: Backport from
> https://github.com/golang/go/commit/a59e33224e42d60a97fa720a45e1b74eb6aaa=
3d0
> > > >>  CVE: CVE-2023-24538
> > > >>  Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> > > >>  ---
> > > >> diff --git
> a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
> > > >> index 5036f2890b..3840617a32 100644
> > > >> --- a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
> > > >> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
> > > >> @@ -1,7 +1,7 @@
> > > >>  From 6fc21505614f36178df0dad7034b6b8e3f7588d5 Mon Sep 17 00:00:00
> 2001
> > > >>  From: empijei <robclap8@gmail.com>
> > > >>  Date: Fri, 27 Mar 2020 19:27:55 +0100
> > > >> -Subject: [PATCH 2/3] html/template,text/template: switch to
> Unicode escapes
> > > >> +Subject: [PATCH 2/6] html/template,text/template: switch to
> Unicode escapes
> > > >>   for JSON compatibility
> > > >>  MIME-Version: 1.0
> > > >>  Content-Type: text/plain; charset=3DUTF-8
> > > >> @@ -31,10 +31,238 @@ Upstream-Status: Backport from
> https://github.com/golang/go/commit/d4d298040d072
> > > >>  CVE: CVE-2023-24538
> > > >>  Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> > > >>  ---
> > > >> - src/html/template/js.go    | 70
> +++++++++++++++++++++++++++-------------------
> > > >> - src/text/template/funcs.go |  8 +++---
> > > >> - 2 files changed, 46 insertions(+), 32 deletions(-)
> > > >> + src/html/template/content_test.go  | 70
> +++++++++++++++++++-------------------
> > > >> + src/html/template/escape_test.go   |  6 ++--
> > > >> + src/html/template/example_test.go  |  6 ++--
> > > >> + src/html/template/js.go            | 70
> +++++++++++++++++++++++---------------
> > > >> + src/html/template/js_test.go       | 68
> ++++++++++++++++++------------------
> > > >> + src/html/template/template_test.go | 39 +++++++++++++++++++++
> > > >> + src/text/template/exec_test.go     |  6 ++--
> > > >> + src/text/template/funcs.go         |  8 ++---
> > > >> + 8 files changed, 163 insertions(+), 110 deletions(-)
> > > >>
> > > >> +diff --git a/src/html/template/content_test.go
> b/src/html/template/content_test.go
> > > >> +index 72d56f5..bd86527 100644
> > > >> +--- a/src/html/template/content_test.go
> > > >> ++++ b/src/html/template/content_test.go
> > > >> +@@ -18,7 +18,7 @@ func TestTypedContent(t *testing.T) {
> > > >> +               HTML(`Hello, <b>World</b> &amp;tc!`),
> > > >> +               HTMLAttr(` dir=3D"ltr"`),
> > > >> +               JS(`c && alert("Hello, World!");`),
> > > >> +-              JSStr(`Hello, World & O'Reilly\x21`),
> > > >> ++              JSStr(`Hello, World & O'Reilly\u0021`),
> > > >> +               URL(`greeting=3DH%69,&addressee=3D(World)`),
> > > >> +               Srcset(`greeting=3DH%69,&addressee=3D(World) 2x,
> https://golang.org/favicon.ico 500.5w`),
> > > >> +               URL(`,foo/,`),
> > > >> +@@ -70,7 +70,7 @@ func TestTypedContent(t *testing.T) {
> > > >> +                               `Hello, <b>World</b> &amp;tc!`,
> > > >> +                               ` dir=3D&#34;ltr&#34;`,
> > > >> +                               `c &amp;&amp; alert(&#34;Hello,
> World!&#34;);`,
> > > >> +-                              `Hello, World &amp;
> O&#39;Reilly\x21`,
> > > >> ++                              `Hello, World &amp;
> O&#39;Reilly\u0021`,
> > > >> +
>  `greeting=3DH%69,&amp;addressee=3D(World)`,
> > > >> +
>  `greeting=3DH%69,&amp;addressee=3D(World) 2x, https://golang.org/favicon=
.ico
> 500.5w`,
> > > >> +                               `,foo/,`,
> > > >> +@@ -100,7 +100,7 @@ func TestTypedContent(t *testing.T) {
> > > >> +                               `Hello,&#32;World&#32;&amp;tc!`,
> > > >> +                               `&#32;dir&#61;&#34;ltr&#34;`,
> > > >> +
>  `c&#32;&amp;&amp;&#32;alert(&#34;Hello,&#32;World!&#34;);`,
> > > >> +-
> `Hello,&#32;World&#32;&amp;&#32;O&#39;Reilly\x21`,
> > > >> ++
> `Hello,&#32;World&#32;&amp;&#32;O&#39;Reilly\u0021`,
> > > >> +
>  `greeting&#61;H%69,&amp;addressee&#61;(World)`,
> > > >> +
>  `greeting&#61;H%69,&amp;addressee&#61;(World)&#32;2x,&#32;
> https://golang.org/favicon.ico&#32;500.5w`
> <https://golang.org/favicon.ico&#32;500.5w>,
> > > >> +                               `,foo/,`,
> > > >> +@@ -115,7 +115,7 @@ func TestTypedContent(t *testing.T) {
> > > >> +                               `Hello, World &amp;tc!`,
> > > >> +                               ` dir=3D&#34;ltr&#34;`,
> > > >> +                               `c &amp;&amp; alert(&#34;Hello,
> World!&#34;);`,
> > > >> +-                              `Hello, World &amp;
> O&#39;Reilly\x21`,
> > > >> ++                              `Hello, World &amp;
> O&#39;Reilly\u0021`,
> > > >> +
>  `greeting=3DH%69,&amp;addressee=3D(World)`,
> > > >> +
>  `greeting=3DH%69,&amp;addressee=3D(World) 2x, https://golang.org/favicon=
.ico
> 500.5w`,
> > > >> +                               `,foo/,`,
> > > >> +@@ -130,7 +130,7 @@ func TestTypedContent(t *testing.T) {
> > > >> +                               `Hello, &lt;b&gt;World&lt;/b&gt;
> &amp;tc!`,
> > > >> +                               ` dir=3D&#34;ltr&#34;`,
> > > >> +                               `c &amp;&amp; alert(&#34;Hello,
> World!&#34;);`,
> > > >> +-                              `Hello, World &amp;
> O&#39;Reilly\x21`,
> > > >> ++                              `Hello, World &amp;
> O&#39;Reilly\u0021`,
> > > >> +
>  `greeting=3DH%69,&amp;addressee=3D(World)`,
> > > >> +
>  `greeting=3DH%69,&amp;addressee=3D(World) 2x, https://golang.org/favicon=
.ico
> 500.5w`,
> > > >> +                               `,foo/,`,
> > > >> +@@ -146,7 +146,7 @@ func TestTypedContent(t *testing.T) {
> > > >> +                               // Not escaped.
> > > >> +                               `c && alert("Hello, World!");`,
> > > >> +                               // Escape sequence not over-escape=
d.
> > > >> +-                              `"Hello, World & O'Reilly\x21"`,
> > > >> ++                              `"Hello, World & O'Reilly\u0021"`,
> > > >> +
>  `"greeting=3DH%69,\u0026addressee=3D(World)"`,
> > > >> +
>  `"greeting=3DH%69,\u0026addressee=3D(World) 2x,
> https://golang.org/favicon.ico 500.5w"`,
> > > >> +                               `",foo/,"`,
> > > >> +@@ -162,7 +162,7 @@ func TestTypedContent(t *testing.T) {
> > > >> +                               // Not JS escaped but HTML escaped=
.
> > > >> +                               `c &amp;&amp; alert(&#34;Hello,
> World!&#34;);`,
> > > >> +                               // Escape sequence not over-escape=
d.
> > > >> +-                              `&#34;Hello, World &amp;
> O&#39;Reilly\x21&#34;`,
> > > >> ++                              `&#34;Hello, World &amp;
> O&#39;Reilly\u0021&#34;`,
> > > >> +
>  `&#34;greeting=3DH%69,\u0026addressee=3D(World)&#34;`,
> > > >> +
>  `&#34;greeting=3DH%69,\u0026addressee=3D(World) 2x,
> https://golang.org/favicon.ico 500.5w&#34;`,
> > > >> +                               `&#34;,foo/,&#34;`,
> > > >> +@@ -171,30 +171,30 @@ func TestTypedContent(t *testing.T) {
> > > >> +               {
> > > >> +                       `<script>alert("{{.}}")</script>`,
> > > >> +                       []string{
> > > >> +-                              `\x3cb\x3e \x22foo%\x22 O\x27Reill=
y
> \x26bar;`,
> > > >> +-                              `a[href =3D~ \x22\/\/example.com
> \x22]#foo`,
> > > >> +-                              `Hello, \x3cb\x3eWorld\x3c\/b\x3e
> \x26amp;tc!`,
> > > >> +-                              ` dir=3D\x22ltr\x22`,
> > > >> +-                              `c \x26\x26 alert(\x22Hello,
> World!\x22);`,
> > > >> ++                              `\u003cb\u003e \u0022foo%\u0022
> O\u0027Reilly \u0026bar;`,
> > > >> ++                              `a[href =3D~ \u0022\/\/example.com
> \u0022]#foo`,
> > > >> ++                              `Hello,
> \u003cb\u003eWorld\u003c\/b\u003e \u0026amp;tc!`,
> > > >> ++                              ` dir=3D\u0022ltr\u0022`,
> > > >> ++                              `c \u0026\u0026 alert(\u0022Hello,
> World!\u0022);`,
> > > >> +                               // Escape sequence not over-escape=
d.
> > > >> +-                              `Hello, World \x26 O\x27Reilly\x21=
`,
> > > >> +-
> `greeting=3DH%69,\x26addressee=3D(World)`,
> > > >> +-
> `greeting=3DH%69,\x26addressee=3D(World) 2x, https:\/\/golang.org\/favico=
n.ico
> 500.5w`,
> > > >> ++                              `Hello, World \u0026
> O\u0027Reilly\u0021`,
> > > >> ++
> `greeting=3DH%69,\u0026addressee=3D(World)`,
> > > >> ++
> `greeting=3DH%69,\u0026addressee=3D(World) 2x, https:\/\/golang.org\/favi=
con.ico
> 500.5w`,
> > > >> +                               `,foo\/,`,
> > > >> +                       },
> > > >> +               },
> > > >> +               {
> > > >> +                       `<script
> type=3D"text/javascript">alert("{{.}}")</script>`,
> > > >> +                       []string{
> > > >> +-                              `\x3cb\x3e \x22foo%\x22 O\x27Reill=
y
> \x26bar;`,
> > > >> +-                              `a[href =3D~ \x22\/\/example.com
> \x22]#foo`,
> > > >> +-                              `Hello, \x3cb\x3eWorld\x3c\/b\x3e
> \x26amp;tc!`,
> > > >> +-                              ` dir=3D\x22ltr\x22`,
> > > >> +-                              `c \x26\x26 alert(\x22Hello,
> World!\x22);`,
> > > >> ++                              `\u003cb\u003e \u0022foo%\u0022
> O\u0027Reilly \u0026bar;`,
> > > >> ++                              `a[href =3D~ \u0022\/\/example.com
> \u0022]#foo`,
> > > >> ++                              `Hello,
> \u003cb\u003eWorld\u003c\/b\u003e \u0026amp;tc!`,
> > > >> ++                              ` dir=3D\u0022ltr\u0022`,
> > > >> ++                              `c \u0026\u0026 alert(\u0022Hello,
> World!\u0022);`,
> > > >> +                               // Escape sequence not over-escape=
d.
> > > >> +-                              `Hello, World \x26 O\x27Reilly\x21=
`,
> > > >> +-
> `greeting=3DH%69,\x26addressee=3D(World)`,
> > > >> +-
> `greeting=3DH%69,\x26addressee=3D(World) 2x, https:\/\/golang.org\/favico=
n.ico
> 500.5w`,
> > > >> ++                              `Hello, World \u0026
> O\u0027Reilly\u0021`,
> > > >> ++
> `greeting=3DH%69,\u0026addressee=3D(World)`,
> > > >> ++
> `greeting=3DH%69,\u0026addressee=3D(World) 2x, https:\/\/golang.org\/favi=
con.ico
> 500.5w`,
> > > >> +                               `,foo\/,`,
> > > >> +                       },
> > > >> +               },
> > > >> +@@ -208,7 +208,7 @@ func TestTypedContent(t *testing.T) {
> > > >> +                               // Not escaped.
> > > >> +                               `c && alert("Hello, World!");`,
> > > >> +                               // Escape sequence not over-escape=
d.
> > > >> +-                              `"Hello, World & O'Reilly\x21"`,
> > > >> ++                              `"Hello, World & O'Reilly\u0021"`,
> > > >> +
>  `"greeting=3DH%69,\u0026addressee=3D(World)"`,
> > > >> +
>  `"greeting=3DH%69,\u0026addressee=3D(World) 2x,
> https://golang.org/favicon.ico 500.5w"`,
> > > >> +                               `",foo/,"`,
> > > >> +@@ -224,7 +224,7 @@ func TestTypedContent(t *testing.T) {
> > > >> +                               `Hello, <b>World</b> &amp;tc!`,
> > > >> +                               ` dir=3D&#34;ltr&#34;`,
> > > >> +                               `c &amp;&amp; alert(&#34;Hello,
> World!&#34;);`,
> > > >> +-                              `Hello, World &amp;
> O&#39;Reilly\x21`,
> > > >> ++                              `Hello, World &amp;
> O&#39;Reilly\u0021`,
> > > >> +
>  `greeting=3DH%69,&amp;addressee=3D(World)`,
> > > >> +
>  `greeting=3DH%69,&amp;addressee=3D(World) 2x, https://golang.org/favicon=
.ico
> 500.5w`,
> > > >> +                               `,foo/,`,
> > > >> +@@ -233,15 +233,15 @@ func TestTypedContent(t *testing.T) {
> > > >> +               {
> > > >> +                       `<button onclick=3D'alert("{{.}}")'>`,
> > > >> +                       []string{
> > > >> +-                              `\x3cb\x3e \x22foo%\x22 O\x27Reill=
y
> \x26bar;`,
> > > >> +-                              `a[href =3D~ \x22\/\/example.com
> \x22]#foo`,
> > > >> +-                              `Hello, \x3cb\x3eWorld\x3c\/b\x3e
> \x26amp;tc!`,
> > > >> +-                              ` dir=3D\x22ltr\x22`,
> > > >> +-                              `c \x26\x26 alert(\x22Hello,
> World!\x22);`,
> > > >> ++                              `\u003cb\u003e \u0022foo%\u0022
> O\u0027Reilly \u0026bar;`,
> > > >> ++                              `a[href =3D~ \u0022\/\/example.com
> \u0022]#foo`,
> > > >> ++                              `Hello,
> \u003cb\u003eWorld\u003c\/b\u003e \u0026amp;tc!`,
> > > >> ++                              ` dir=3D\u0022ltr\u0022`,
> > > >> ++                              `c \u0026\u0026 alert(\u0022Hello,
> World!\u0022);`,
> > > >> +                               // Escape sequence not over-escape=
d.
> > > >> +-                              `Hello, World \x26 O\x27Reilly\x21=
`,
> > > >> +-
> `greeting=3DH%69,\x26addressee=3D(World)`,
> > > >> +-
> `greeting=3DH%69,\x26addressee=3D(World) 2x, https:\/\/golang.org\/favico=
n.ico
> 500.5w`,
> > > >> ++                              `Hello, World \u0026
> O\u0027Reilly\u0021`,
> > > >> ++
> `greeting=3DH%69,\u0026addressee=3D(World)`,
> > > >> ++
> `greeting=3DH%69,\u0026addressee=3D(World) 2x, https:\/\/golang.org\/favi=
con.ico
> 500.5w`,
> > > >> +                               `,foo\/,`,
> > > >> +                       },
> > > >> +               },
> > > >> +@@ -253,7 +253,7 @@ func TestTypedContent(t *testing.T) {
> > > >> +
>  `Hello%2c%20%3cb%3eWorld%3c%2fb%3e%20%26amp%3btc%21`,
> > > >> +                               `%20dir%3d%22ltr%22`,
> > > >> +
>  `c%20%26%26%20alert%28%22Hello%2c%20World%21%22%29%3b`,
> > > >> +-
> `Hello%2c%20World%20%26%20O%27Reilly%5cx21`,
> > > >> ++
> `Hello%2c%20World%20%26%20O%27Reilly%5cu0021`,
> > > >> +                               // Quotes and parens are escaped
> but %69 is not over-escaped. HTML escaping is done.
> > > >> +
>  `greeting=3DH%69,&amp;addressee=3D%28World%29`,
> > > >> +
>  `greeting%3dH%2569%2c%26addressee%3d%28World%29%202x%2c%20https%3a%2f%
> 2fgolang.org%2ffavicon.ico%20500.5w`,
> > > >> +@@ -268,7 +268,7 @@ func TestTypedContent(t *testing.T) {
> > > >> +
>  `Hello%2c%20%3cb%3eWorld%3c%2fb%3e%20%26amp%3btc%21`,
> > > >> +                               `%20dir%3d%22ltr%22`,
> > > >> +
>  `c%20%26%26%20alert%28%22Hello%2c%20World%21%22%29%3b`,
> > > >> +-
> `Hello%2c%20World%20%26%20O%27Reilly%5cx21`,
> > > >> ++
> `Hello%2c%20World%20%26%20O%27Reilly%5cu0021`,
> > > >> +                               // Quotes and parens are escaped
> but %69 is not over-escaped. HTML escaping is not done.
> > > >> +
>  `greeting=3DH%69,&addressee=3D%28World%29`,
> > > >> +
>  `greeting%3dH%2569%2c%26addressee%3d%28World%29%202x%2c%20https%3a%2f%
> 2fgolang.org%2ffavicon.ico%20500.5w`,
> > > >> +diff --git a/src/html/template/escape_test.go
> b/src/html/template/escape_test.go
> > > >> +index e72a9ba..c709660 100644
> > > >> +--- a/src/html/template/escape_test.go
> > > >> ++++ b/src/html/template/escape_test.go
> > > >> +@@ -238,7 +238,7 @@ func TestEscape(t *testing.T) {
> > > >> +               {
> > > >> +                       "jsStr",
> > > >> +                       "<button
> onclick=3D'alert(&quot;{{.H}}&quot;)'>",
> > > >> +-                      `<button
> onclick=3D'alert(&quot;\x3cHello\x3e&quot;)'>`,
> > > >> ++                      `<button
> onclick=3D'alert(&quot;\u003cHello\u003e&quot;)'>`,
> > > >> +               },
> > > >> +               {
> > > >> +                       "badMarshaler",
> > > >> +@@ -259,7 +259,7 @@ func TestEscape(t *testing.T) {
> > > >> +               {
> > > >> +                       "jsRe",
> > > >> +                       `<button
> onclick=3D'alert(/{{"foo+bar"}}/.test(""))'>`,
> > > >> +-                      `<button
> onclick=3D'alert(/foo\x2bbar/.test(""))'>`,
> > > >> ++                      `<button
> onclick=3D'alert(/foo\u002bbar/.test(""))'>`,
> > > >> +               },
> > > >> +               {
> > > >> +                       "jsReBlank",
> > > >> +@@ -825,7 +825,7 @@ func TestEscapeSet(t *testing.T) {
> > > >> +                               "main":   `<button
> onclick=3D"title=3D'{{template "helper"}}'; ...">{{template
> "helper"}}</button>`,
> > > >> +                               "helper": `{{11}} of {{"<100>"}}`,
> > > >> +                       },
> > > >> +-                      `<button onclick=3D"title=3D'11 of
> \x3c100\x3e'; ...">11 of &lt;100&gt;</button>`,
> > > >> ++                      `<button onclick=3D"title=3D'11 of
> \u003c100\u003e'; ...">11 of &lt;100&gt;</button>`,
> > > >> +               },
> > > >> +               // A non-recursive template that ends in a
> different context.
> > > >> +               // helper starts in jsCtxRegexp and ends in
> jsCtxDivOp.
> > > >> +diff --git a/src/html/template/example_test.go
> b/src/html/template/example_test.go
> > > >> +index 9d965f1..6cf936f 100644
> > > >> +--- a/src/html/template/example_test.go
> > > >> ++++ b/src/html/template/example_test.go
> > > >> +@@ -116,9 +116,9 @@ func Example_escape() {
> > > >> +       // &#34;Fran &amp; Freddie&#39;s Diner&#34; &
> lt;tasty@example.com&gt;
> > > >> +       // &#34;Fran &amp; Freddie&#39;s Diner&#34; &
> lt;tasty@example.com&gt;
> > > >> +       // &#34;Fran &amp; Freddie&#39;s Diner&#
> 34;32&lt;tasty@example.com&gt;
> > > >> +-      // \"Fran \x26 Freddie\'s Diner\" \x3Ctasty@example.com\x3=
E
> > > >> +-      // \"Fran \x26 Freddie\'s Diner\" \x3Ctasty@example.com\x3=
E
> > > >> +-      // \"Fran \x26 Freddie\'s Diner\"32\x3Ctasty@example.com
> \x3E
> > > >> ++      // \"Fran \u0026 Freddie\'s Diner\" \u003Ctasty@example.co=
m
> \u003E
> > > >> ++      // \"Fran \u0026 Freddie\'s Diner\" \u003Ctasty@example.co=
m
> \u003E
> > > >> ++      // \"Fran \u0026 Freddie\'s Diner\"32\
> u003Ctasty@example.com\u003E
> > > >> +       // %22Fran+%26+Freddie%27s+Diner%2232%3Ctasty%40example.co=
m
> %3E
> > > >> +
> > > >> + }
> > > >>  diff --git a/src/html/template/js.go b/src/html/template/js.go
> > > >>  index 0e91458..ea9c183 100644
> > > >>  --- a/src/html/template/js.go
> > > >> @@ -173,6 +401,217 @@ index 0e91458..ea9c183 100644
> > > >>         '?':  `\?`,
> > > >>         '[':  `\[`,
> > > >>         '\\': `\\`,
> > > >> +diff --git a/src/html/template/js_test.go
> b/src/html/template/js_test.go
> > > >> +index 075adaa..d7ee47b 100644
> > > >> +--- a/src/html/template/js_test.go
> > > >> ++++ b/src/html/template/js_test.go
> > > >> +@@ -137,7 +137,7 @@ func TestJSValEscaper(t *testing.T) {
> > > >> +               {"foo", `"foo"`},
> > > >> +               // Newlines.
> > > >> +               {"\r\n\u2028\u2029", `"\r\n\u2028\u2029"`},
> > > >> +-              // "\v" =3D=3D "v" on IE 6 so use "\x0b" instead.
> > > >> ++              // "\v" =3D=3D "v" on IE 6 so use "\u000b" instead=
.
> > > >> +               {"\t\x0b", `"\t\u000b"`},
> > > >> +               {struct{ X, Y int }{1, 2}, `{"X":1,"Y":2}`},
> > > >> +               {[]interface{}{}, "[]"},
> > > >> +@@ -173,7 +173,7 @@ func TestJSStrEscaper(t *testing.T) {
> > > >> +       }{
> > > >> +               {"", ``},
> > > >> +               {"foo", `foo`},
> > > >> +-              {"\u0000", `\0`},
> > > >> ++              {"\u0000", `\u0000`},
> > > >> +               {"\t", `\t`},
> > > >> +               {"\n", `\n`},
> > > >> +               {"\r", `\r`},
> > > >> +@@ -183,14 +183,14 @@ func TestJSStrEscaper(t *testing.T) {
> > > >> +               {"\\n", `\\n`},
> > > >> +               {"foo\r\nbar", `foo\r\nbar`},
> > > >> +               // Preserve attribute boundaries.
> > > >> +-              {`"`, `\x22`},
> > > >> +-              {`'`, `\x27`},
> > > >> ++              {`"`, `\u0022`},
> > > >> ++              {`'`, `\u0027`},
> > > >> +               // Allow embedding in HTML without further escapin=
g.
> > > >> +-              {`&amp;`, `\x26amp;`},
> > > >> ++              {`&amp;`, `\u0026amp;`},
> > > >> +               // Prevent breaking out of text node and element
> boundaries.
> > > >> +-              {"</script>", `\x3c\/script\x3e`},
> > > >> +-              {"<![CDATA[", `\x3c![CDATA[`},
> > > >> +-              {"]]>", `]]\x3e`},
> > > >> ++              {"</script>", `\u003c\/script\u003e`},
> > > >> ++              {"<![CDATA[", `\u003c![CDATA[`},
> > > >> ++              {"]]>", `]]\u003e`},
> > > >> +               //
> https://dev.w3.org/html5/markup/aria/syntax.html#escaping-text-span
> > > >> +               //   "The text in style, script, title, and
> textarea elements
> > > >> +               //   must not have an escaping text span start tha=
t
> is not
> > > >> +@@ -201,11 +201,11 @@ func TestJSStrEscaper(t *testing.T) {
> > > >> +               // allow regular text content to be interpreted as
> script
> > > >> +               // allowing script execution via a combination of =
a
> JS string
> > > >> +               // injection followed by an HTML text injection.
> > > >> +-              {"<!--", `\x3c!--`},
> > > >> +-              {"-->", `--\x3e`},
> > > >> ++              {"<!--", `\u003c!--`},
> > > >> ++              {"-->", `--\u003e`},
> > > >> +               // From
> https://code.google.com/p/doctype/wiki/ArticleUtf7
> > > >> +               {"+ADw-script+AD4-alert(1)+ADw-/script+AD4-",
> > > >> +-
> `\x2bADw-script\x2bAD4-alert(1)\x2bADw-\/script\x2bAD4-`,
> > > >> ++
> `\u002bADw-script\u002bAD4-alert(1)\u002bADw-\/script\u002bAD4-`,
> > > >> +               },
> > > >> +               // Invalid UTF-8 sequence
> > > >> +               {"foo\xA0bar", "foo\xA0bar"},
> > > >> +@@ -228,7 +228,7 @@ func TestJSRegexpEscaper(t *testing.T) {
> > > >> +       }{
> > > >> +               {"", `(?:)`},
> > > >> +               {"foo", `foo`},
> > > >> +-              {"\u0000", `\0`},
> > > >> ++              {"\u0000", `\u0000`},
> > > >> +               {"\t", `\t`},
> > > >> +               {"\n", `\n`},
> > > >> +               {"\r", `\r`},
> > > >> +@@ -238,19 +238,19 @@ func TestJSRegexpEscaper(t *testing.T) {
> > > >> +               {"\\n", `\\n`},
> > > >> +               {"foo\r\nbar", `foo\r\nbar`},
> > > >> +               // Preserve attribute boundaries.
> > > >> +-              {`"`, `\x22`},
> > > >> +-              {`'`, `\x27`},
> > > >> ++              {`"`, `\u0022`},
> > > >> ++              {`'`, `\u0027`},
> > > >> +               // Allow embedding in HTML without further escapin=
g.
> > > >> +-              {`&amp;`, `\x26amp;`},
> > > >> ++              {`&amp;`, `\u0026amp;`},
> > > >> +               // Prevent breaking out of text node and element
> boundaries.
> > > >> +-              {"</script>", `\x3c\/script\x3e`},
> > > >> +-              {"<![CDATA[", `\x3c!\[CDATA\[`},
> > > >> +-              {"]]>", `\]\]\x3e`},
> > > >> ++              {"</script>", `\u003c\/script\u003e`},
> > > >> ++              {"<![CDATA[", `\u003c!\[CDATA\[`},
> > > >> ++              {"]]>", `\]\]\u003e`},
> > > >> +               // Escaping text spans.
> > > >> +-              {"<!--", `\x3c!\-\-`},
> > > >> +-              {"-->", `\-\-\x3e`},
> > > >> ++              {"<!--", `\u003c!\-\-`},
> > > >> ++              {"-->", `\-\-\u003e`},
> > > >> +               {"*", `\*`},
> > > >> +-              {"+", `\x2b`},
> > > >> ++              {"+", `\u002b`},
> > > >> +               {"?", `\?`},
> > > >> +               {"[](){}", `\[\]\(\)\{\}`},
> > > >> +               {"$foo|x.y", `\$foo\|x\.y`},
> > > >> +@@ -284,27 +284,27 @@ func
> TestEscapersOnLower7AndSelectHighCodepoints(t *testing.T) {
> > > >> +               {
> > > >> +                       "jsStrEscaper",
> > > >> +                       jsStrEscaper,
> > > >> +-                      "\\0\x01\x02\x03\x04\x05\x06\x07" +
> > > >> +-                              "\x08\\t\\n\\x0b\\f\\r\x0E\x0F" +
> > > >> +-                              "\x10\x11\x12\x13\x14\x15\x16\x17"=
 +
> > > >> +-                              "\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f"=
 +
> > > >> +-                              ` !\x22#$%\x26\x27()*\x2b,-.\/` +
> > > >> +-                              `0123456789:;\x3c=3D\x3e?` +
> > > >> ++
> `\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007` +
> > > >> ++                              `\u0008\t\n\u000b\f\r\u000e\u000f`=
 +
> > > >> ++
> `\u0010\u0011\u0012\u0013\u0014\u0015\u0016\u0017` +
> > > >> ++
> `\u0018\u0019\u001a\u001b\u001c\u001d\u001e\u001f` +
> > > >> ++                              `
> !\u0022#$%\u0026\u0027()*\u002b,-.\/` +
> > > >> ++                              `0123456789:;\u003c=3D\u003e?` +
> > > >> +                               `@ABCDEFGHIJKLMNO` +
> > > >> +                               `PQRSTUVWXYZ[\\]^_` +
> > > >> +                               "`abcdefghijklmno" +
> > > >> +-                              "pqrstuvwxyz{|}~\x7f" +
> > > >> ++                              "pqrstuvwxyz{|}~\u007f" +
> > > >> +
>  "\u00A0\u0100\\u2028\\u2029\ufeff\U0001D11E",
> > > >> +               },
> > > >> +               {
> > > >> +                       "jsRegexpEscaper",
> > > >> +                       jsRegexpEscaper,
> > > >> +-                      "\\0\x01\x02\x03\x04\x05\x06\x07" +
> > > >> +-                              "\x08\\t\\n\\x0b\\f\\r\x0E\x0F" +
> > > >> +-                              "\x10\x11\x12\x13\x14\x15\x16\x17"=
 +
> > > >> +-                              "\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f"=
 +
> > > >> +-                              `
> !\x22#\$%\x26\x27\(\)\*\x2b,\-\.\/` +
> > > >> +-                              `0123456789:;\x3c=3D\x3e\?` +
> > > >> ++
> `\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007` +
> > > >> ++                              `\u0008\t\n\u000b\f\r\u000e\u000f`=
 +
> > > >> ++
> `\u0010\u0011\u0012\u0013\u0014\u0015\u0016\u0017` +
> > > >> ++
> `\u0018\u0019\u001a\u001b\u001c\u001d\u001e\u001f` +
> > > >> ++                              `
> !\u0022#\$%\u0026\u0027\(\)\*\u002b,\-\.\/` +
> > > >> ++                              `0123456789:;\u003c=3D\u003e\?` +
> > > >> +                               `@ABCDEFGHIJKLMNO` +
> > > >> +                               `PQRSTUVWXYZ\[\\\]\^_` +
> > > >> +                               "`abcdefghijklmno" +
> > > >> +diff --git a/src/html/template/template_test.go
> b/src/html/template/template_test.go
> > > >> +index 13e6ba4..86bd4db 100644
> > > >> +--- a/src/html/template/template_test.go
> > > >> ++++ b/src/html/template/template_test.go
> > > >> +@@ -6,6 +6,7 @@ package template_test
> > > >> +
> > > >> + import (
> > > >> +       "bytes"
> > > >> ++      "encoding/json"
> > > >> +       . "html/template"
> > > >> +       "strings"
> > > >> +       "testing"
> > > >> +@@ -121,6 +122,44 @@ func TestNumbers(t *testing.T) {
> > > >> +       c.mustExecute(c.root, nil, "12.34 7.5")
> > > >> + }
> > > >> +
> > > >> ++func TestStringsInScriptsWithJsonContentTypeAreCorrectlyEscaped(=
t
> *testing.T) {
> > > >> ++      // See #33671 and #37634 for more context on this.
> > > >> ++      tests :=3D []struct{ name, in string }{
> > > >> ++              {"empty", ""},
> > > >> ++              {"invalid", string(rune(-1))},
> > > >> ++              {"null", "\u0000"},
> > > >> ++              {"unit separator", "\u001F"},
> > > >> ++              {"tab", "\t"},
> > > >> ++              {"gt and lt", "<>"},
> > > >> ++              {"quotes", `'"`},
> > > >> ++              {"ASCII letters", "ASCII letters"},
> > > >> ++              {"Unicode", "=CA=95=E2=8A=99=CF=96=E2=8A=99=CA=94"=
},
> > > >> ++              {"Pizza", "=F0=9F=8D=95"},
> > > >> ++      }
> > > >> ++      const (
> > > >> ++              prefix =3D `<script type=3D"application/ld+json">`
> > > >> ++              suffix =3D `</script>`
> > > >> ++              templ  =3D prefix + `"{{.}}"` + suffix
> > > >> ++      )
> > > >> ++      tpl :=3D Must(New("JS string is JSON string").Parse(templ)=
)
> > > >> ++      for _, tt :=3D range tests {
> > > >> ++              t.Run(tt.name, func(t *testing.T) {
> > > >> ++                      var buf bytes.Buffer
> > > >> ++                      if err :=3D tpl.Execute(&buf, tt.in); err =
!=3D
> nil {
> > > >> ++                              t.Fatalf("Cannot render template:
> %v", err)
> > > >> ++                      }
> > > >> ++                      trimmed :=3D
> bytes.TrimSuffix(bytes.TrimPrefix(buf.Bytes(), []byte(prefix)),
> []byte(suffix))
> > > >> ++                      var got string
> > > >> ++                      if err :=3D json.Unmarshal(trimmed, &got);
> err !=3D nil {
> > > >> ++                              t.Fatalf("Cannot parse JS string %=
q
> as JSON: %v", trimmed[1:len(trimmed)-1], err)
> > > >> ++                      }
> > > >> ++                      if got !=3D tt.in {
> > > >> ++                              t.Errorf("Serialization changed th=
e
> string value: got %q want %q", got, tt.in)
> > > >> ++                      }
> > > >> ++              })
> > > >> ++      }
> > > >> ++}
> > > >> ++
> > > >> + type testCase struct {
> > > >> +       t    *testing.T
> > > >> +       root *Template
> > > >> +diff --git a/src/text/template/exec_test.go
> b/src/text/template/exec_test.go
> > > >> +index 77294ed..b8a809e 100644
> > > >> +--- a/src/text/template/exec_test.go
> > > >> ++++ b/src/text/template/exec_test.go
> > > >> +@@ -911,9 +911,9 @@ func TestJSEscaping(t *testing.T) {
> > > >> +               {`Go "jump" \`, `Go \"jump\" \\`},
> > > >> +               {`Yukihiro says "=E4=BB=8A=E6=97=A5=E3=81=AF=E4=B8=
=96=E7=95=8C"`, `Yukihiro says
> \"=E4=BB=8A=E6=97=A5=E3=81=AF=E4=B8=96=E7=95=8C\"`},
> > > >> +               {"unprintable \uFDFF", `unprintable \uFDFF`},
> > > >> +-              {`<html>`, `\x3Chtml\x3E`},
> > > >> +-              {`no =3D in attributes`, `no \x3D in attributes`},
> > > >> +-              {`&#x27; does not become HTML entity`, `\x26#x27;
> does not become HTML entity`},
> > > >> ++              {`<html>`, `\u003Chtml\u003E`},
> > > >> ++              {`no =3D in attributes`, `no \u003D in attributes`=
},
> > > >> ++              {`&#x27; does not become HTML entity`, `\u0026#x27=
;
> does not become HTML entity`},
> > > >> +       }
> > > >> +       for _, tc :=3D range testCases {
> > > >> +               s :=3D JSEscapeString(tc.in)
> > > >>  diff --git a/src/text/template/funcs.go
> b/src/text/template/funcs.go
> > > >>  index 46125bc..f3de9fb 100644
> > > >>  --- a/src/text/template/funcs.go
> > > >> diff --git
> a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_3.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_3.patch
> > > >> new file mode 100644
> > > >> index 0000000000..cd7dd0957c
> > > >> --- /dev/null
> > > >> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_3.patch
> > > >> @@ -0,0 +1,393 @@
> > > >> +From 7ddce23c7d5b728acf8482f5006497c7b9915f8a Mon Sep 17 00:00:00
> 2001
> > > >> +From: Ariel Mashraki <ariel@mashraki.co.il>
> > > >> +Date: Wed, 22 Apr 2020 22:17:56 +0300
> > > >> +Subject: [PATCH 3/6] text/template: add CommentNode to template
> parse tree
> > > >> +MIME-Version: 1.0
> > > >> +Content-Type: text/plain; charset=3DUTF-8
> > > >> +Content-Transfer-Encoding: 8bit
> > > >> +
> > > >> +Fixes #34652
> > > >> +
> > > >> +Change-Id: Icf6e3eda593fed826736f34f95a9d66f5450cc98
> > > >> +Reviewed-on: https://go-review.googlesource.com/c/go/+/229398
> > > >> +Reviewed-by: Daniel Mart=C3=AD <mvdan@mvdan.cc>
> > > >> +Run-TryBot: Daniel Mart=C3=AD <mvdan@mvdan.cc>
> > > >> +TryBot-Result: Gobot Gobot <gobot@golang.org>
> > > >> +
> > > >> +Dependency Patch #3
> > > >> +
> > > >> +Upstream-Status: Backport from
> https://github.com/golang/go/commit/c8ea03828b0645b1fd5725888e44873b75fcf=
bb6
> > > >> +CVE: CVE-2023-24538
> > > >> +Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> > > >> +---
> > > >> + api/next.txt                          | 19 +++++++++++++++++++
> > > >> + src/html/template/escape.go           |  2 ++
> > > >> + src/html/template/template_test.go    | 16 ++++++++++++++++
> > > >> + src/text/template/exec.go             |  1 +
> > > >> + src/text/template/parse/lex.go        |  8 +++++++-
> > > >> + src/text/template/parse/lex_test.go   |  7 +++++--
> > > >> + src/text/template/parse/node.go       | 33
> +++++++++++++++++++++++++++++++++
> > > >> + src/text/template/parse/parse.go      | 22 +++++++++++++++++++--=
-
> > > >> + src/text/template/parse/parse_test.go | 25
> +++++++++++++++++++++++++
> > > >> + 9 files changed, 127 insertions(+), 6 deletions(-)
> > > >> +
> > > >> +diff --git a/api/next.txt b/api/next.txt
> > > >> +index e69de29..076f39e 100644
> > > >> +--- a/api/next.txt
> > > >> ++++ b/api/next.txt
> > > >> +@@ -0,0 +1,19 @@
> > > >> ++pkg unicode, const Version =3D "13.0.0"
> > > >> ++pkg unicode, var Chorasmian *RangeTable
> > > >> ++pkg unicode, var Dives_Akuru *RangeTable
> > > >> ++pkg unicode, var Khitan_Small_Script *RangeTable
> > > >> ++pkg unicode, var Yezidi *RangeTable
> > > >> ++pkg text/template/parse, const NodeComment =3D 20
> > > >> ++pkg text/template/parse, const NodeComment NodeType
> > > >> ++pkg text/template/parse, const ParseComments =3D 1
> > > >> ++pkg text/template/parse, const ParseComments Mode
> > > >> ++pkg text/template/parse, method (*CommentNode) Copy() Node
> > > >> ++pkg text/template/parse, method (*CommentNode) String() string
> > > >> ++pkg text/template/parse, method (CommentNode) Position() Pos
> > > >> ++pkg text/template/parse, method (CommentNode) Type() NodeType
> > > >> ++pkg text/template/parse, type CommentNode struct
> > > >> ++pkg text/template/parse, type CommentNode struct, Text string
> > > >> ++pkg text/template/parse, type CommentNode struct, embedded
> NodeType
> > > >> ++pkg text/template/parse, type CommentNode struct, embedded Pos
> > > >> ++pkg text/template/parse, type Mode uint
> > > >> ++pkg text/template/parse, type Tree struct, Mode Mode
> > > >> +diff --git a/src/html/template/escape.go
> b/src/html/template/escape.go
> > > >> +index f12dafa..8739735 100644
> > > >> +--- a/src/html/template/escape.go
> > > >> ++++ b/src/html/template/escape.go
> > > >> +@@ -124,6 +124,8 @@ func (e *escaper) escape(c context, n
> parse.Node) context {
> > > >> +       switch n :=3D n.(type) {
> > > >> +       case *parse.ActionNode:
> > > >> +               return e.escapeAction(c, n)
> > > >> ++      case *parse.CommentNode:
> > > >> ++              return c
> > > >> +       case *parse.IfNode:
> > > >> +               return e.escapeBranch(c, &n.BranchNode, "if")
> > > >> +       case *parse.ListNode:
> > > >> +diff --git a/src/html/template/template_test.go
> b/src/html/template/template_test.go
> > > >> +index 86bd4db..1f2c888 100644
> > > >> +--- a/src/html/template/template_test.go
> > > >> ++++ b/src/html/template/template_test.go
> > > >> +@@ -10,6 +10,7 @@ import (
> > > >> +       . "html/template"
> > > >> +       "strings"
> > > >> +       "testing"
> > > >> ++      "text/template/parse"
> > > >> + )
> > > >> +
> > > >> + func TestTemplateClone(t *testing.T) {
> > > >> +@@ -160,6 +161,21 @@ func
> TestStringsInScriptsWithJsonContentTypeAreCorrectlyEscaped(t *testing.T) =
{
> > > >> +       }
> > > >> + }
> > > >> +
> > > >> ++func TestSkipEscapeComments(t *testing.T) {
> > > >> ++      c :=3D newTestCase(t)
> > > >> ++      tr :=3D parse.New("root")
> > > >> ++      tr.Mode =3D parse.ParseComments
> > > >> ++      newT, err :=3D tr.Parse("{{/* A comment */}}{{ 1 }}{{/*
> Another comment */}}", "", "", make(map[string]*parse.Tree))
> > > >> ++      if err !=3D nil {
> > > >> ++              t.Fatalf("Cannot parse template text: %v", err)
> > > >> ++      }
> > > >> ++      c.root, err =3D c.root.AddParseTree("root", newT)
> > > >> ++      if err !=3D nil {
> > > >> ++              t.Fatalf("Cannot add parse tree to template: %v",
> err)
> > > >> ++      }
> > > >> ++      c.mustExecute(c.root, nil, "1")
> > > >> ++}
> > > >> ++
> > > >> + type testCase struct {
> > > >> +       t    *testing.T
> > > >> +       root *Template
> > > >> +diff --git a/src/text/template/exec.go b/src/text/template/exec.g=
o
> > > >> +index ac3e741..7ac5175 100644
> > > >> +--- a/src/text/template/exec.go
> > > >> ++++ b/src/text/template/exec.go
> > > >> +@@ -256,6 +256,7 @@ func (s *state) walk(dot reflect.Value, node
> parse.Node) {
> > > >> +               if len(node.Pipe.Decl) =3D=3D 0 {
> > > >> +                       s.printValue(node, val)
> > > >> +               }
> > > >> ++      case *parse.CommentNode:
> > > >> +       case *parse.IfNode:
> > > >> +               s.walkIfOrWith(parse.NodeIf, dot, node.Pipe,
> node.List, node.ElseList)
> > > >> +       case *parse.ListNode:
> > > >> +diff --git a/src/text/template/parse/lex.go
> b/src/text/template/parse/lex.go
> > > >> +index 30371f2..e41373a 100644
> > > >> +--- a/src/text/template/parse/lex.go
> > > >> ++++ b/src/text/template/parse/lex.go
> > > >> +@@ -41,6 +41,7 @@ const (
> > > >> +       itemBool                         // boolean constant
> > > >> +       itemChar                         // printable ASCII
> character; grab bag for comma etc.
> > > >> +       itemCharConstant                 // character constant
> > > >> ++      itemComment                      // comment text
> > > >> +       itemComplex                      // complex constant
> (1+2i); imaginary is just a number
> > > >> +       itemAssign                       // equals ('=3D')
> introducing an assignment
> > > >> +       itemDeclare                      // colon-equals (':=3D')
> introducing a declaration
> > > >> +@@ -112,6 +113,7 @@ type lexer struct {
> > > >> +       leftDelim      string    // start of action
> > > >> +       rightDelim     string    // end of action
> > > >> +       trimRightDelim string    // end of action with trim marker
> > > >> ++      emitComment    bool      // emit itemComment tokens.
> > > >> +       pos            Pos       // current position in the input
> > > >> +       start          Pos       // start position of this item
> > > >> +       width          Pos       // width of last rune read from
> input
> > > >> +@@ -203,7 +205,7 @@ func (l *lexer) drain() {
> > > >> + }
> > > >> +
> > > >> + // lex creates a new scanner for the input string.
> > > >> +-func lex(name, input, left, right string) *lexer {
> > > >> ++func lex(name, input, left, right string, emitComment bool)
> *lexer {
> > > >> +       if left =3D=3D "" {
> > > >> +               left =3D leftDelim
> > > >> +       }
> > > >> +@@ -216,6 +218,7 @@ func lex(name, input, left, right string)
> *lexer {
> > > >> +               leftDelim:      left,
> > > >> +               rightDelim:     right,
> > > >> +               trimRightDelim: rightTrimMarker + right,
> > > >> ++              emitComment:    emitComment,
> > > >> +               items:          make(chan item),
> > > >> +               line:           1,
> > > >> +               startLine:      1,
> > > >> +@@ -323,6 +326,9 @@ func lexComment(l *lexer) stateFn {
> > > >> +       if !delim {
> > > >> +               return l.errorf("comment ends before closing
> delimiter")
> > > >> +       }
> > > >> ++      if l.emitComment {
> > > >> ++              l.emit(itemComment)
> > > >> ++      }
> > > >> +       if trimSpace {
> > > >> +               l.pos +=3D trimMarkerLen
> > > >> +       }
> > > >> +diff --git a/src/text/template/parse/lex_test.go
> b/src/text/template/parse/lex_test.go
> > > >> +index 563c4fc..f6d5f28 100644
> > > >> +--- a/src/text/template/parse/lex_test.go
> > > >> ++++ b/src/text/template/parse/lex_test.go
> > > >> +@@ -15,6 +15,7 @@ var itemName =3D map[itemType]string{
> > > >> +       itemBool:         "bool",
> > > >> +       itemChar:         "char",
> > > >> +       itemCharConstant: "charconst",
> > > >> ++      itemComment:      "comment",
> > > >> +       itemComplex:      "complex",
> > > >> +       itemDeclare:      ":=3D",
> > > >> +       itemEOF:          "EOF",
> > > >> +@@ -90,6 +91,7 @@ var lexTests =3D []lexTest{
> > > >> +       {"text", `now is the time`, []item{mkItem(itemText, "now i=
s
> the time"), tEOF}},
> > > >> +       {"text with comment", "hello-{{/* this is a comment
> */}}-world", []item{
> > > >> +               mkItem(itemText, "hello-"),
> > > >> ++              mkItem(itemComment, "/* this is a comment */"),
> > > >> +               mkItem(itemText, "-world"),
> > > >> +               tEOF,
> > > >> +       }},
> > > >> +@@ -311,6 +313,7 @@ var lexTests =3D []lexTest{
> > > >> +       }},
> > > >> +       {"trimming spaces before and after comment", "hello- {{- /=
*
> hello */ -}} -world", []item{
> > > >> +               mkItem(itemText, "hello-"),
> > > >> ++              mkItem(itemComment, "/* hello */"),
> > > >> +               mkItem(itemText, "-world"),
> > > >> +               tEOF,
> > > >> +       }},
> > > >> +@@ -389,7 +392,7 @@ var lexTests =3D []lexTest{
> > > >> +
> > > >> + // collect gathers the emitted items into a slice.
> > > >> + func collect(t *lexTest, left, right string) (items []item) {
> > > >> +-      l :=3D lex(t.name, t.input, left, right)
> > > >> ++      l :=3D lex(t.name, t.input, left, right, true)
> > > >> +       for {
> > > >> +               item :=3D l.nextItem()
> > > >> +               items =3D append(items, item)
> > > >> +@@ -529,7 +532,7 @@ func TestPos(t *testing.T) {
> > > >> + func TestShutdown(t *testing.T) {
> > > >> +       // We need to duplicate template.Parse here to hold on to
> the lexer.
> > > >> +       const text =3D "erroneous{{define}}{{else}}1234"
> > > >> +-      lexer :=3D lex("foo", text, "{{", "}}")
> > > >> ++      lexer :=3D lex("foo", text, "{{", "}}", false)
> > > >> +       _, err :=3D New("root").parseLexer(lexer)
> > > >> +       if err =3D=3D nil {
> > > >> +               t.Fatalf("expected error")
> > > >> +diff --git a/src/text/template/parse/node.go
> b/src/text/template/parse/node.go
> > > >> +index 1c116ea..a9dad5e 100644
> > > >> +--- a/src/text/template/parse/node.go
> > > >> ++++ b/src/text/template/parse/node.go
> > > >> +@@ -70,6 +70,7 @@ const (
> > > >> +       NodeTemplate                   // A template invocation
> action.
> > > >> +       NodeVariable                   // A $ variable.
> > > >> +       NodeWith                       // A with action.
> > > >> ++      NodeComment                    // A comment.
> > > >> + )
> > > >> +
> > > >> + // Nodes.
> > > >> +@@ -149,6 +150,38 @@ func (t *TextNode) Copy() Node {
> > > >> +       return &TextNode{tr: t.tr, NodeType: NodeText, Pos: t.Pos,
> Text: append([]byte{}, t.Text...)}
> > > >> + }
> > > >> +
> > > >> ++// CommentNode holds a comment.
> > > >> ++type CommentNode struct {
> > > >> ++      NodeType
> > > >> ++      Pos
> > > >> ++      tr   *Tree
> > > >> ++      Text string // Comment text.
> > > >> ++}
> > > >> ++
> > > >> ++func (t *Tree) newComment(pos Pos, text string) *CommentNode {
> > > >> ++      return &CommentNode{tr: t, NodeType: NodeComment, Pos: pos=
,
> Text: text}
> > > >> ++}
> > > >> ++
> > > >> ++func (c *CommentNode) String() string {
> > > >> ++      var sb strings.Builder
> > > >> ++      c.writeTo(&sb)
> > > >> ++      return sb.String()
> > > >> ++}
> > > >> ++
> > > >> ++func (c *CommentNode) writeTo(sb *strings.Builder) {
> > > >> ++      sb.WriteString("{{")
> > > >> ++      sb.WriteString(c.Text)
> > > >> ++      sb.WriteString("}}")
> > > >> ++}
> > > >> ++
> > > >> ++func (c *CommentNode) tree() *Tree {
> > > >> ++      return c.tr
> > > >> ++}
> > > >> ++
> > > >> ++func (c *CommentNode) Copy() Node {
> > > >> ++      return &CommentNode{tr: c.tr, NodeType: NodeComment, Pos:
> c.Pos, Text: c.Text}
> > > >> ++}
> > > >> ++
> > > >> + // PipeNode holds a pipeline with optional declaration
> > > >> + type PipeNode struct {
> > > >> +       NodeType
> > > >> +diff --git a/src/text/template/parse/parse.go
> b/src/text/template/parse/parse.go
> > > >> +index c9b80f4..496d8bf 100644
> > > >> +--- a/src/text/template/parse/parse.go
> > > >> ++++ b/src/text/template/parse/parse.go
> > > >> +@@ -21,6 +21,7 @@ type Tree struct {
> > > >> +       Name      string    // name of the template represented by
> the tree.
> > > >> +       ParseName string    // name of the top-level template
> during parsing, for error messages.
> > > >> +       Root      *ListNode // top-level root of the tree.
> > > >> ++      Mode      Mode      // parsing mode.
> > > >> +       text      string    // text parsed to create the template
> (or its parent)
> > > >> +       // Parsing only; cleared after parse.
> > > >> +       funcs     []map[string]interface{}
> > > >> +@@ -29,8 +30,16 @@ type Tree struct {
> > > >> +       peekCount int
> > > >> +       vars      []string // variables defined at the moment.
> > > >> +       treeSet   map[string]*Tree
> > > >> ++      mode      Mode
> > > >> + }
> > > >> +
> > > >> ++// A mode value is a set of flags (or 0). Modes control parser
> behavior.
> > > >> ++type Mode uint
> > > >> ++
> > > >> ++const (
> > > >> ++      ParseComments Mode =3D 1 << iota // parse comments and add
> them to AST
> > > >> ++)
> > > >> ++
> > > >> + // Copy returns a copy of the Tree. Any parsing state is
> discarded.
> > > >> + func (t *Tree) Copy() *Tree {
> > > >> +       if t =3D=3D nil {
> > > >> +@@ -220,7 +229,8 @@ func (t *Tree) stopParse() {
> > > >> + func (t *Tree) Parse(text, leftDelim, rightDelim string, treeSet
> map[string]*Tree, funcs ...map[string]interface{}) (tree *Tree, err error=
) {
> > > >> +       defer t.recover(&err)
> > > >> +       t.ParseName =3D t.Name
> > > >> +-      t.startParse(funcs, lex(t.Name, text, leftDelim,
> rightDelim), treeSet)
> > > >> ++      emitComment :=3D t.Mode&ParseComments !=3D 0
> > > >> ++      t.startParse(funcs, lex(t.Name, text, leftDelim,
> rightDelim, emitComment), treeSet)
> > > >> +       t.text =3D text
> > > >> +       t.parse()
> > > >> +       t.add()
> > > >> +@@ -240,12 +250,14 @@ func (t *Tree) add() {
> > > >> +       }
> > > >> + }
> > > >> +
> > > >> +-// IsEmptyTree reports whether this tree (node) is empty of
> everything but space.
> > > >> ++// IsEmptyTree reports whether this tree (node) is empty of
> everything but space or comments.
> > > >> + func IsEmptyTree(n Node) bool {
> > > >> +       switch n :=3D n.(type) {
> > > >> +       case nil:
> > > >> +               return true
> > > >> +       case *ActionNode:
> > > >> ++      case *CommentNode:
> > > >> ++              return true
> > > >> +       case *IfNode:
> > > >> +       case *ListNode:
> > > >> +               for _, node :=3D range n.Nodes {
> > > >> +@@ -276,6 +288,7 @@ func (t *Tree) parse() {
> > > >> +                       if t.nextNonSpace().typ =3D=3D itemDefine =
{
> > > >> +                               newT :=3D New("definition") // nam=
e
> will be updated once we know it.
> > > >> +                               newT.text =3D t.text
> > > >> ++                              newT.Mode =3D t.Mode
> > > >> +                               newT.ParseName =3D t.ParseName
> > > >> +                               newT.startParse(t.funcs, t.lex,
> t.treeSet)
> > > >> +                               newT.parseDefinition()
> > > >> +@@ -331,13 +344,15 @@ func (t *Tree) itemList() (list *ListNode,
> next Node) {
> > > >> + }
> > > >> +
> > > >> + // textOrAction:
> > > >> +-//    text | action
> > > >> ++//    text | comment | action
> > > >> + func (t *Tree) textOrAction() Node {
> > > >> +       switch token :=3D t.nextNonSpace(); token.typ {
> > > >> +       case itemText:
> > > >> +               return t.newText(token.pos, token.val)
> > > >> +       case itemLeftDelim:
> > > >> +               return t.action()
> > > >> ++      case itemComment:
> > > >> ++              return t.newComment(token.pos, token.val)
> > > >> +       default:
> > > >> +               t.unexpected(token, "input")
> > > >> +       }
> > > >> +@@ -539,6 +554,7 @@ func (t *Tree) blockControl() Node {
> > > >> +
> > > >> +       block :=3D New(name) // name will be updated once we know =
it.
> > > >> +       block.text =3D t.text
> > > >> ++      block.Mode =3D t.Mode
> > > >> +       block.ParseName =3D t.ParseName
> > > >> +       block.startParse(t.funcs, t.lex, t.treeSet)
> > > >> +       var end Node
> > > >> +diff --git a/src/text/template/parse/parse_test.go
> b/src/text/template/parse/parse_test.go
> > > >> +index 4e09a78..d9c13c5 100644
> > > >> +--- a/src/text/template/parse/parse_test.go
> > > >> ++++ b/src/text/template/parse/parse_test.go
> > > >> +@@ -348,6 +348,30 @@ func TestParseCopy(t *testing.T) {
> > > >> +       testParse(true, t)
> > > >> + }
> > > >> +
> > > >> ++func TestParseWithComments(t *testing.T) {
> > > >> ++      textFormat =3D "%q"
> > > >> ++      defer func() { textFormat =3D "%s" }()
> > > >> ++      tests :=3D [...]parseTest{
> > > >> ++              {"comment", "{{/*\n\n\n*/}}", noError,
> "{{/*\n\n\n*/}}"},
> > > >> ++              {"comment trim left", "x \r\n\t{{- /* hi */}}",
> noError, `"x"{{/* hi */}}`},
> > > >> ++              {"comment trim right", "{{/* hi */ -}}\n\n\ty",
> noError, `{{/* hi */}}"y"`},
> > > >> ++              {"comment trim left and right", "x \r\n\t{{- /* */
> -}}\n\n\ty", noError, `"x"{{/* */}}"y"`},
> > > >> ++      }
> > > >> ++      for _, test :=3D range tests {
> > > >> ++              t.Run(test.name, func(t *testing.T) {
> > > >> ++                      tr :=3D New(test.name)
> > > >> ++                      tr.Mode =3D ParseComments
> > > >> ++                      tmpl, err :=3D tr.Parse(test.input, "", ""=
,
> make(map[string]*Tree))
> > > >> ++                      if err !=3D nil {
> > > >> ++                              t.Errorf("%q: expected error; got
> none", test.name)
> > > >> ++                      }
> > > >> ++                      if result :=3D tmpl.Root.String(); result =
!=3D
> test.result {
> > > >> ++                              t.Errorf("%s=3D(%q):
> got\n\t%v\nexpected\n\t%v", test.name, test.input, result, test.result)
> > > >> ++                      }
> > > >> ++              })
> > > >> ++      }
> > > >> ++}
> > > >> ++
> > > >> + type isEmptyTest struct {
> > > >> +       name  string
> > > >> +       input string
> > > >> +@@ -358,6 +382,7 @@ var isEmptyTests =3D []isEmptyTest{
> > > >> +       {"empty", ``, true},
> > > >> +       {"nonempty", `hello`, false},
> > > >> +       {"spaces only", " \t\n \t\n", true},
> > > >> ++      {"comment only", "{{/* comment */}}", true},
> > > >> +       {"definition", `{{define "x"}}something{{end}}`, true},
> > > >> +       {"definitions and space", "{{define
> `x`}}something{{end}}\n\n{{define `y`}}something{{end}}\n\n", true},
> > > >> +       {"definitions and text", "{{define
> `x`}}something{{end}}\nx\n{{define `y`}}something{{end}}\ny\n", false},
> > > >> +--
> > > >> +2.7.4
> > > >> diff --git
> a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_4.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_4.patch
> > > >> new file mode 100644
> > > >> index 0000000000..d5e2eb6684
> > > >> --- /dev/null
> > > >> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_4.patch
> > > >> @@ -0,0 +1,497 @@
> > > >> +From 760d88497091fb5d6d231a18e6f4e06ecb9af9b2 Mon Sep 17 00:00:00
> 2001
> > > >> +From: Russ Cox <rsc@golang.org>
> > > >> +Date: Thu, 10 Sep 2020 18:53:26 -0400
> > > >> +Subject: [PATCH 4/6] text/template: allow newlines inside action
> delimiters
> > > >> +
> > > >> +This allows multiline constructs like:
> > > >> +
> > > >> +       {{"hello" |
> > > >> +         printf}}
> > > >> +
> > > >> +Now that unclosed actions can span multiple lines,
> > > >> +track and report the start of the action when reporting errors.
> > > >> +
> > > >> +Also clean up a few "unexpected <error message>" to be just
> "<error message>".
> > > >> +
> > > >> +Fixes #29770.
> > > >> +
> > > >> +Change-Id: I54c6c016029a8328b7902a4b6d85eab713ec3285
> > > >> +Reviewed-on: https://go-review.googlesource.com/c/go/+/254257
> > > >> +Trust: Russ Cox <rsc@golang.org>
> > > >> +Run-TryBot: Russ Cox <rsc@golang.org>
> > > >> +TryBot-Result: Go Bot <gobot@golang.org>
> > > >> +Reviewed-by: Rob Pike <r@golang.org>
> > > >> +
> > > >> +Dependency Patch #4
> > > >> +
> > > >> +Upstream-Status: Backport from
> https://github.com/golang/go/commit/9384d34c58099657bb1b133beaf3ff37ada9b=
017
> > > >> +CVE: CVE-2023-24538
> > > >> +Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> > > >> +---
> > > >> + src/text/template/doc.go              | 21 ++++-----
> > > >> + src/text/template/exec_test.go        |  2 +-
> > > >> + src/text/template/parse/lex.go        | 84
> +++++++++++++++++------------------
> > > >> + src/text/template/parse/lex_test.go   |  2 +-
> > > >> + src/text/template/parse/parse.go      | 59
> +++++++++++++-----------
> > > >> + src/text/template/parse/parse_test.go | 36 ++++++++++++---
> > > >> + 6 files changed, 117 insertions(+), 87 deletions(-)
> > > >> +
> > > >> +diff --git a/src/text/template/doc.go b/src/text/template/doc.go
> > > >> +index 4b0efd2..7b30294 100644
> > > >> +--- a/src/text/template/doc.go
> > > >> ++++ b/src/text/template/doc.go
> > > >> +@@ -40,16 +40,17 @@ More intricate examples appear below.
> > > >> + Text and spaces
> > > >> +
> > > >> + By default, all text between actions is copied verbatim when the
> template is
> > > >> +-executed. For example, the string " items are made of " in the
> example above appears
> > > >> +-on standard output when the program is run.
> > > >> +-
> > > >> +-However, to aid in formatting template source code, if an
> action's left delimiter
> > > >> +-(by default "{{") is followed immediately by a minus sign and
> ASCII space character
> > > >> +-("{{- "), all trailing white space is trimmed from the
> immediately preceding text.
> > > >> +-Similarly, if the right delimiter ("}}") is preceded by a space
> and minus sign
> > > >> +-(" -}}"), all leading white space is trimmed from the immediatel=
y
> following text.
> > > >> +-In these trim markers, the ASCII space must be present; "{{-3}}"
> parses as an
> > > >> +-action containing the number -3.
> > > >> ++executed. For example, the string " items are made of " in the
> example above
> > > >> ++appears on standard output when the program is run.
> > > >> ++
> > > >> ++However, to aid in formatting template source code, if an
> action's left
> > > >> ++delimiter (by default "{{") is followed immediately by a minus
> sign and white
> > > >> ++space, all trailing white space is trimmed from the immediately
> preceding text.
> > > >> ++Similarly, if the right delimiter ("}}") is preceded by white
> space and a minus
> > > >> ++sign, all leading white space is trimmed from the immediately
> following text.
> > > >> ++In these trim markers, the white space must be present:
> > > >> ++"{{- 3}}" is like "{{3}}" but trims the immediately preceding
> text, while
> > > >> ++"{{-3}}" parses as an action containing the number -3.
> > > >> +
> > > >> + For instance, when executing the template whose source is
> > > >> +
> > > >> +diff --git a/src/text/template/exec_test.go
> b/src/text/template/exec_test.go
> > > >> +index b8a809e..3309b33 100644
> > > >> +--- a/src/text/template/exec_test.go
> > > >> ++++ b/src/text/template/exec_test.go
> > > >> +@@ -1295,7 +1295,7 @@ func TestUnterminatedStringError(t
> *testing.T) {
> > > >> +               t.Fatal("expected error")
> > > >> +       }
> > > >> +       str :=3D err.Error()
> > > >> +-      if !strings.Contains(str, "X:3: unexpected unterminated ra=
w
> quoted string") {
> > > >> ++      if !strings.Contains(str, "X:3: unterminated raw quoted
> string") {
> > > >> +               t.Fatalf("unexpected error: %s", str)
> > > >> +       }
> > > >> + }
> > > >> +diff --git a/src/text/template/parse/lex.go
> b/src/text/template/parse/lex.go
> > > >> +index e41373a..6784071 100644
> > > >> +--- a/src/text/template/parse/lex.go
> > > >> ++++ b/src/text/template/parse/lex.go
> > > >> +@@ -92,15 +92,14 @@ const eof =3D -1
> > > >> + // If the action begins "{{- " rather than "{{", then all
> space/tab/newlines
> > > >> + // preceding the action are trimmed; conversely if it ends " -}}=
"
> the
> > > >> + // leading spaces are trimmed. This is done entirely in the
> lexer; the
> > > >> +-// parser never sees it happen. We require an ASCII space to be
> > > >> +-// present to avoid ambiguity with things like "{{-3}}". It read=
s
> > > >> ++// parser never sees it happen. We require an ASCII space (' ',
> \t, \r, \n)
> > > >> ++// to be present to avoid ambiguity with things like "{{-3}}". I=
t
> reads
> > > >> + // better with the space present anyway. For simplicity, only
> ASCII
> > > >> +-// space does the job.
> > > >> ++// does the job.
> > > >> + const (
> > > >> +-      spaceChars      =3D " \t\r\n" // These are the space
> characters defined by Go itself.
> > > >> +-      leftTrimMarker  =3D "- "      // Attached to left delimite=
r,
> trims trailing spaces from preceding text.
> > > >> +-      rightTrimMarker =3D " -"      // Attached to right delimit=
er,
> trims leading spaces from following text.
> > > >> +-      trimMarkerLen   =3D Pos(len(leftTrimMarker))
> > > >> ++      spaceChars    =3D " \t\r\n"  // These are the space
> characters defined by Go itself.
> > > >> ++      trimMarker    =3D '-'        // Attached to left/right
> delimiter, trims trailing spaces from preceding/following text.
> > > >> ++      trimMarkerLen =3D Pos(1 + 1) // marker plus space before o=
r
> after
> > > >> + )
> > > >> +
> > > >> + // stateFn represents the state of the scanner as a function tha=
t
> returns the next state.
> > > >> +@@ -108,19 +107,18 @@ type stateFn func(*lexer) stateFn
> > > >> +
> > > >> + // lexer holds the state of the scanner.
> > > >> + type lexer struct {
> > > >> +-      name           string    // the name of the input; used
> only for error reports
> > > >> +-      input          string    // the string being scanned
> > > >> +-      leftDelim      string    // start of action
> > > >> +-      rightDelim     string    // end of action
> > > >> +-      trimRightDelim string    // end of action with trim marker
> > > >> +-      emitComment    bool      // emit itemComment tokens.
> > > >> +-      pos            Pos       // current position in the input
> > > >> +-      start          Pos       // start position of this item
> > > >> +-      width          Pos       // width of last rune read from
> input
> > > >> +-      items          chan item // channel of scanned items
> > > >> +-      parenDepth     int       // nesting depth of ( ) exprs
> > > >> +-      line           int       // 1+number of newlines seen
> > > >> +-      startLine      int       // start line of this item
> > > >> ++      name        string    // the name of the input; used only
> for error reports
> > > >> ++      input       string    // the string being scanned
> > > >> ++      leftDelim   string    // start of action
> > > >> ++      rightDelim  string    // end of action
> > > >> ++      emitComment bool      // emit itemComment tokens.
> > > >> ++      pos         Pos       // current position in the input
> > > >> ++      start       Pos       // start position of this item
> > > >> ++      width       Pos       // width of last rune read from inpu=
t
> > > >> ++      items       chan item // channel of scanned items
> > > >> ++      parenDepth  int       // nesting depth of ( ) exprs
> > > >> ++      line        int       // 1+number of newlines seen
> > > >> ++      startLine   int       // start line of this item
> > > >> + }
> > > >> +
> > > >> + // next returns the next rune in the input.
> > > >> +@@ -213,15 +211,14 @@ func lex(name, input, left, right string,
> emitComment bool) *lexer {
> > > >> +               right =3D rightDelim
> > > >> +       }
> > > >> +       l :=3D &lexer{
> > > >> +-              name:           name,
> > > >> +-              input:          input,
> > > >> +-              leftDelim:      left,
> > > >> +-              rightDelim:     right,
> > > >> +-              trimRightDelim: rightTrimMarker + right,
> > > >> +-              emitComment:    emitComment,
> > > >> +-              items:          make(chan item),
> > > >> +-              line:           1,
> > > >> +-              startLine:      1,
> > > >> ++              name:        name,
> > > >> ++              input:       input,
> > > >> ++              leftDelim:   left,
> > > >> ++              rightDelim:  right,
> > > >> ++              emitComment: emitComment,
> > > >> ++              items:       make(chan item),
> > > >> ++              line:        1,
> > > >> ++              startLine:   1,
> > > >> +       }
> > > >> +       go l.run()
> > > >> +       return l
> > > >> +@@ -251,7 +248,7 @@ func lexText(l *lexer) stateFn {
> > > >> +               ldn :=3D Pos(len(l.leftDelim))
> > > >> +               l.pos +=3D Pos(x)
> > > >> +               trimLength :=3D Pos(0)
> > > >> +-              if strings.HasPrefix(l.input[l.pos+ldn:],
> leftTrimMarker) {
> > > >> ++              if hasLeftTrimMarker(l.input[l.pos+ldn:]) {
> > > >> +                       trimLength =3D
> rightTrimLength(l.input[l.start:l.pos])
> > > >> +               }
> > > >> +               l.pos -=3D trimLength
> > > >> +@@ -280,7 +277,7 @@ func rightTrimLength(s string) Pos {
> > > >> +
> > > >> + // atRightDelim reports whether the lexer is at a right
> delimiter, possibly preceded by a trim marker.
> > > >> + func (l *lexer) atRightDelim() (delim, trimSpaces bool) {
> > > >> +-      if strings.HasPrefix(l.input[l.pos:], l.trimRightDelim) {
> // With trim marker.
> > > >> ++      if hasRightTrimMarker(l.input[l.pos:]) &&
> strings.HasPrefix(l.input[l.pos+trimMarkerLen:], l.rightDelim) { // With
> trim marker.
> > > >> +               return true, true
> > > >> +       }
> > > >> +       if strings.HasPrefix(l.input[l.pos:], l.rightDelim) { //
> Without trim marker.
> > > >> +@@ -297,7 +294,7 @@ func leftTrimLength(s string) Pos {
> > > >> + // lexLeftDelim scans the left delimiter, which is known to be
> present, possibly with a trim marker.
> > > >> + func lexLeftDelim(l *lexer) stateFn {
> > > >> +       l.pos +=3D Pos(len(l.leftDelim))
> > > >> +-      trimSpace :=3D strings.HasPrefix(l.input[l.pos:],
> leftTrimMarker)
> > > >> ++      trimSpace :=3D hasLeftTrimMarker(l.input[l.pos:])
> > > >> +       afterMarker :=3D Pos(0)
> > > >> +       if trimSpace {
> > > >> +               afterMarker =3D trimMarkerLen
> > > >> +@@ -342,7 +339,7 @@ func lexComment(l *lexer) stateFn {
> > > >> +
> > > >> + // lexRightDelim scans the right delimiter, which is known to be
> present, possibly with a trim marker.
> > > >> + func lexRightDelim(l *lexer) stateFn {
> > > >> +-      trimSpace :=3D strings.HasPrefix(l.input[l.pos:],
> rightTrimMarker)
> > > >> ++      trimSpace :=3D hasRightTrimMarker(l.input[l.pos:])
> > > >> +       if trimSpace {
> > > >> +               l.pos +=3D trimMarkerLen
> > > >> +               l.ignore()
> > > >> +@@ -369,7 +366,7 @@ func lexInsideAction(l *lexer) stateFn {
> > > >> +               return l.errorf("unclosed left paren")
> > > >> +       }
> > > >> +       switch r :=3D l.next(); {
> > > >> +-      case r =3D=3D eof || isEndOfLine(r):
> > > >> ++      case r =3D=3D eof:
> > > >> +               return l.errorf("unclosed action")
> > > >> +       case isSpace(r):
> > > >> +               l.backup() // Put space back in case we have " -}}=
".
> > > >> +@@ -439,7 +436,7 @@ func lexSpace(l *lexer) stateFn {
> > > >> +       }
> > > >> +       // Be careful about a trim-marked closing delimiter, which
> has a minus
> > > >> +       // after a space. We know there is a space, so check for
> the '-' that might follow.
> > > >> +-      if strings.HasPrefix(l.input[l.pos-1:], l.trimRightDelim) =
{
> > > >> ++      if hasRightTrimMarker(l.input[l.pos-1:]) &&
> strings.HasPrefix(l.input[l.pos-1+trimMarkerLen:], l.rightDelim) {
> > > >> +               l.backup() // Before the space.
> > > >> +               if numSpaces =3D=3D 1 {
> > > >> +                       return lexRightDelim // On the delim, so g=
o
> right to that.
> > > >> +@@ -526,7 +523,7 @@ func lexFieldOrVariable(l *lexer, typ
> itemType) stateFn {
> > > >> + // day to implement arithmetic.
> > > >> + func (l *lexer) atTerminator() bool {
> > > >> +       r :=3D l.peek()
> > > >> +-      if isSpace(r) || isEndOfLine(r) {
> > > >> ++      if isSpace(r) {
> > > >> +               return true
> > > >> +       }
> > > >> +       switch r {
> > > >> +@@ -657,15 +654,18 @@ Loop:
> > > >> +
> > > >> + // isSpace reports whether r is a space character.
> > > >> + func isSpace(r rune) bool {
> > > >> +-      return r =3D=3D ' ' || r =3D=3D '\t'
> > > >> +-}
> > > >> +-
> > > >> +-// isEndOfLine reports whether r is an end-of-line character.
> > > >> +-func isEndOfLine(r rune) bool {
> > > >> +-      return r =3D=3D '\r' || r =3D=3D '\n'
> > > >> ++      return r =3D=3D ' ' || r =3D=3D '\t' || r =3D=3D '\r' || r=
 =3D=3D '\n'
> > > >> + }
> > > >> +
> > > >> + // isAlphaNumeric reports whether r is an alphabetic, digit, or
> underscore.
> > > >> + func isAlphaNumeric(r rune) bool {
> > > >> +       return r =3D=3D '_' || unicode.IsLetter(r) || unicode.IsDi=
git(r)
> > > >> + }
> > > >> ++
> > > >> ++func hasLeftTrimMarker(s string) bool {
> > > >> ++      return len(s) >=3D 2 && s[0] =3D=3D trimMarker &&
> isSpace(rune(s[1]))
> > > >> ++}
> > > >> ++
> > > >> ++func hasRightTrimMarker(s string) bool {
> > > >> ++      return len(s) >=3D 2 && isSpace(rune(s[0])) && s[1] =3D=3D
> trimMarker
> > > >> ++}
> > > >> +diff --git a/src/text/template/parse/lex_test.go
> b/src/text/template/parse/lex_test.go
> > > >> +index f6d5f28..6510eed 100644
> > > >> +--- a/src/text/template/parse/lex_test.go
> > > >> ++++ b/src/text/template/parse/lex_test.go
> > > >> +@@ -323,7 +323,7 @@ var lexTests =3D []lexTest{
> > > >> +               tLeft,
> > > >> +               mkItem(itemError, "unrecognized character in
> action: U+0001"),
> > > >> +       }},
> > > >> +-      {"unclosed action", "{{\n}}", []item{
> > > >> ++      {"unclosed action", "{{", []item{
> > > >> +               tLeft,
> > > >> +               mkItem(itemError, "unclosed action"),
> > > >> +       }},
> > > >> +diff --git a/src/text/template/parse/parse.go
> b/src/text/template/parse/parse.go
> > > >> +index 496d8bf..5e6e512 100644
> > > >> +--- a/src/text/template/parse/parse.go
> > > >> ++++ b/src/text/template/parse/parse.go
> > > >> +@@ -24,13 +24,14 @@ type Tree struct {
> > > >> +       Mode      Mode      // parsing mode.
> > > >> +       text      string    // text parsed to create the template
> (or its parent)
> > > >> +       // Parsing only; cleared after parse.
> > > >> +-      funcs     []map[string]interface{}
> > > >> +-      lex       *lexer
> > > >> +-      token     [3]item // three-token lookahead for parser.
> > > >> +-      peekCount int
> > > >> +-      vars      []string // variables defined at the moment.
> > > >> +-      treeSet   map[string]*Tree
> > > >> +-      mode      Mode
> > > >> ++      funcs      []map[string]interface{}
> > > >> ++      lex        *lexer
> > > >> ++      token      [3]item // three-token lookahead for parser.
> > > >> ++      peekCount  int
> > > >> ++      vars       []string // variables defined at the moment.
> > > >> ++      treeSet    map[string]*Tree
> > > >> ++      actionLine int // line of left delim starting action
> > > >> ++      mode       Mode
> > > >> + }
> > > >> +
> > > >> + // A mode value is a set of flags (or 0). Modes control parser
> behavior.
> > > >> +@@ -187,6 +188,16 @@ func (t *Tree) expectOneOf(expected1,
> expected2 itemType, context string) item {
> > > >> +
> > > >> + // unexpected complains about the token and terminates processin=
g.
> > > >> + func (t *Tree) unexpected(token item, context string) {
> > > >> ++      if token.typ =3D=3D itemError {
> > > >> ++              extra :=3D ""
> > > >> ++              if t.actionLine !=3D 0 && t.actionLine !=3D token.=
line {
> > > >> ++                      extra =3D fmt.Sprintf(" in action started =
at
> %s:%d", t.ParseName, t.actionLine)
> > > >> ++                      if strings.HasSuffix(token.val, " action")=
 {
> > > >> ++                              extra =3D extra[len(" in action"):=
]
> // avoid "action in action"
> > > >> ++                      }
> > > >> ++              }
> > > >> ++              t.errorf("%s%s", token, extra)
> > > >> ++      }
> > > >> +       t.errorf("unexpected %s in %s", token, context)
> > > >> + }
> > > >> +
> > > >> +@@ -350,6 +361,8 @@ func (t *Tree) textOrAction() Node {
> > > >> +       case itemText:
> > > >> +               return t.newText(token.pos, token.val)
> > > >> +       case itemLeftDelim:
> > > >> ++              t.actionLine =3D token.line
> > > >> ++              defer t.clearActionLine()
> > > >> +               return t.action()
> > > >> +       case itemComment:
> > > >> +               return t.newComment(token.pos, token.val)
> > > >> +@@ -359,6 +372,10 @@ func (t *Tree) textOrAction() Node {
> > > >> +       return nil
> > > >> + }
> > > >> +
> > > >> ++func (t *Tree) clearActionLine() {
> > > >> ++      t.actionLine =3D 0
> > > >> ++}
> > > >> ++
> > > >> + // Action:
> > > >> + //    control
> > > >> + //    command ("|" command)*
> > > >> +@@ -384,12 +401,12 @@ func (t *Tree) action() (n Node) {
> > > >> +       t.backup()
> > > >> +       token :=3D t.peek()
> > > >> +       // Do not pop variables; they persist until "end".
> > > >> +-      return t.newAction(token.pos, token.line,
> t.pipeline("command"))
> > > >> ++      return t.newAction(token.pos, token.line,
> t.pipeline("command", itemRightDelim))
> > > >> + }
> > > >> +
> > > >> + // Pipeline:
> > > >> + //    declarations? command ('|' command)*
> > > >> +-func (t *Tree) pipeline(context string) (pipe *PipeNode) {
> > > >> ++func (t *Tree) pipeline(context string, end itemType) (pipe
> *PipeNode) {
> > > >> +       token :=3D t.peekNonSpace()
> > > >> +       pipe =3D t.newPipeline(token.pos, token.line, nil)
> > > >> +       // Are there declarations or assignments?
> > > >> +@@ -430,12 +447,9 @@ decls:
> > > >> +       }
> > > >> +       for {
> > > >> +               switch token :=3D t.nextNonSpace(); token.typ {
> > > >> +-              case itemRightDelim, itemRightParen:
> > > >> ++              case end:
> > > >> +                       // At this point, the pipeline is complete
> > > >> +                       t.checkPipeline(pipe, context)
> > > >> +-                      if token.typ =3D=3D itemRightParen {
> > > >> +-                              t.backup()
> > > >> +-                      }
> > > >> +                       return
> > > >> +               case itemBool, itemCharConstant, itemComplex,
> itemDot, itemField, itemIdentifier,
> > > >> +                       itemNumber, itemNil, itemRawString,
> itemString, itemVariable, itemLeftParen:
> > > >> +@@ -464,7 +478,7 @@ func (t *Tree) checkPipeline(pipe *PipeNode,
> context string) {
> > > >> +
> > > >> + func (t *Tree) parseControl(allowElseIf bool, context string)
> (pos Pos, line int, pipe *PipeNode, list, elseList *ListNode) {
> > > >> +       defer t.popVars(len(t.vars))
> > > >> +-      pipe =3D t.pipeline(context)
> > > >> ++      pipe =3D t.pipeline(context, itemRightDelim)
> > > >> +       var next Node
> > > >> +       list, next =3D t.itemList()
> > > >> +       switch next.Type() {
> > > >> +@@ -550,7 +564,7 @@ func (t *Tree) blockControl() Node {
> > > >> +
> > > >> +       token :=3D t.nextNonSpace()
> > > >> +       name :=3D t.parseTemplateName(token, context)
> > > >> +-      pipe :=3D t.pipeline(context)
> > > >> ++      pipe :=3D t.pipeline(context, itemRightDelim)
> > > >> +
> > > >> +       block :=3D New(name) // name will be updated once we know =
it.
> > > >> +       block.text =3D t.text
> > > >> +@@ -580,7 +594,7 @@ func (t *Tree) templateControl() Node {
> > > >> +       if t.nextNonSpace().typ !=3D itemRightDelim {
> > > >> +               t.backup()
> > > >> +               // Do not pop variables; they persist until "end".
> > > >> +-              pipe =3D t.pipeline(context)
> > > >> ++              pipe =3D t.pipeline(context, itemRightDelim)
> > > >> +       }
> > > >> +       return t.newTemplate(token.pos, token.line, name, pipe)
> > > >> + }
> > > >> +@@ -614,13 +628,12 @@ func (t *Tree) command() *CommandNode {
> > > >> +               switch token :=3D t.next(); token.typ {
> > > >> +               case itemSpace:
> > > >> +                       continue
> > > >> +-              case itemError:
> > > >> +-                      t.errorf("%s", token.val)
> > > >> +               case itemRightDelim, itemRightParen:
> > > >> +                       t.backup()
> > > >> +               case itemPipe:
> > > >> ++                      // nothing here; break loop below
> > > >> +               default:
> > > >> +-                      t.errorf("unexpected %s in operand", token=
)
> > > >> ++                      t.unexpected(token, "operand")
> > > >> +               }
> > > >> +               break
> > > >> +       }
> > > >> +@@ -675,8 +688,6 @@ func (t *Tree) operand() Node {
> > > >> + // A nil return means the next item is not a term.
> > > >> + func (t *Tree) term() Node {
> > > >> +       switch token :=3D t.nextNonSpace(); token.typ {
> > > >> +-      case itemError:
> > > >> +-              t.errorf("%s", token.val)
> > > >> +       case itemIdentifier:
> > > >> +               if !t.hasFunction(token.val) {
> > > >> +                       t.errorf("function %q not defined",
> token.val)
> > > >> +@@ -699,11 +710,7 @@ func (t *Tree) term() Node {
> > > >> +               }
> > > >> +               return number
> > > >> +       case itemLeftParen:
> > > >> +-              pipe :=3D t.pipeline("parenthesized pipeline")
> > > >> +-              if token :=3D t.next(); token.typ !=3D itemRightPa=
ren {
> > > >> +-                      t.errorf("unclosed right paren: unexpected
> %s", token)
> > > >> +-              }
> > > >> +-              return pipe
> > > >> ++              return t.pipeline("parenthesized pipeline",
> itemRightParen)
> > > >> +       case itemString, itemRawString:
> > > >> +               s, err :=3D strconv.Unquote(token.val)
> > > >> +               if err !=3D nil {
> > > >> +diff --git a/src/text/template/parse/parse_test.go
> b/src/text/template/parse/parse_test.go
> > > >> +index d9c13c5..220f984 100644
> > > >> +--- a/src/text/template/parse/parse_test.go
> > > >> ++++ b/src/text/template/parse/parse_test.go
> > > >> +@@ -250,6 +250,13 @@ var parseTests =3D []parseTest{
> > > >> +       {"comment trim left and right", "x \r\n\t{{- /* */
> -}}\n\n\ty", noError, `"x""y"`},
> > > >> +       {"block definition", `{{block "foo" .}}hello{{end}}`,
> noError,
> > > >> +               `{{template "foo" .}}`},
> > > >> ++
> > > >> ++      {"newline in assignment", "{{ $x \n :=3D \n 1 \n }}",
> noError, "{{$x :=3D 1}}"},
> > > >> ++      {"newline in empty action", "{{\n}}", hasError, "{{\n}}"},
> > > >> ++      {"newline in pipeline", "{{\n\"x\"\n|\nprintf\n}}",
> noError, `{{"x" | printf}}`},
> > > >> ++      {"newline in comment", "{{/*\nhello\n*/}}", noError, ""},
> > > >> ++      {"newline in comment", "{{-\n/*\nhello\n*/\n-}}", noError,
> ""},
> > > >> ++
> > > >> +       // Errors.
> > > >> +       {"unclosed action", "hello{{range", hasError, ""},
> > > >> +       {"unmatched end", "{{end}}", hasError, ""},
> > > >> +@@ -426,23 +433,38 @@ var errorTests =3D []parseTest{
> > > >> +       // Check line numbers are accurate.
> > > >> +       {"unclosed1",
> > > >> +               "line1\n{{",
> > > >> +-              hasError, `unclosed1:2: unexpected unclosed action
> in command`},
> > > >> ++              hasError, `unclosed1:2: unclosed action`},
> > > >> +       {"unclosed2",
> > > >> +               "line1\n{{define `x`}}line2\n{{",
> > > >> +-              hasError, `unclosed2:3: unexpected unclosed action
> in command`},
> > > >> ++              hasError, `unclosed2:3: unclosed action`},
> > > >> ++      {"unclosed3",
> > > >> ++              "line1\n{{\"x\"\n\"y\"\n",
> > > >> ++              hasError, `unclosed3:4: unclosed action started at
> unclosed3:2`},
> > > >> ++      {"unclosed4",
> > > >> ++              "{{\n\n\n\n\n",
> > > >> ++              hasError, `unclosed4:6: unclosed action started at
> unclosed4:1`},
> > > >> ++      {"var1",
> > > >> ++              "line1\n{{\nx\n}}",
> > > >> ++              hasError, `var1:3: function "x" not defined`},
> > > >> +       // Specific errors.
> > > >> +       {"function",
> > > >> +               "{{foo}}",
> > > >> +               hasError, `function "foo" not defined`},
> > > >> +-      {"comment",
> > > >> ++      {"comment1",
> > > >> +               "{{/*}}",
> > > >> +-              hasError, `unclosed comment`},
> > > >> ++              hasError, `comment1:1: unclosed comment`},
> > > >> ++      {"comment2",
> > > >> ++              "{{/*\nhello\n}}",
> > > >> ++              hasError, `comment2:1: unclosed comment`},
> > > >> +       {"lparen",
> > > >> +               "{{.X (1 2 3}}",
> > > >> +               hasError, `unclosed left paren`},
> > > >> +       {"rparen",
> > > >> +-              "{{.X 1 2 3)}}",
> > > >> +-              hasError, `unexpected ")"`},
> > > >> ++              "{{.X 1 2 3 ) }}",
> > > >> ++              hasError, `unexpected ")" in command`},
> > > >> ++      {"rparen2",
> > > >> ++              "{{(.X 1 2 3",
> > > >> ++              hasError, `unclosed action`},
> > > >> +       {"space",
> > > >> +               "{{`x`3}}",
> > > >> +               hasError, `in operand`},
> > > >> +@@ -488,7 +510,7 @@ var errorTests =3D []parseTest{
> > > >> +               hasError, `missing value for parenthesized
> pipeline`},
> > > >> +       {"multilinerawstring",
> > > >> +               "{{ $v :=3D `\n` }} {{",
> > > >> +-              hasError, `multilinerawstring:2: unexpected
> unclosed action`},
> > > >> ++              hasError, `multilinerawstring:2: unclosed action`}=
,
> > > >> +       {"rangeundefvar",
> > > >> +               "{{range $k}}{{end}}",
> > > >> +               hasError, `undefined variable`},
> > > >> +--
> > > >> +2.7.4
> > > >> diff --git
> a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_5.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_5.patch
> > > >> new file mode 100644
> > > >> index 0000000000..fc38929648
> > > >> --- /dev/null
> > > >> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_5.patch
> > > >> @@ -0,0 +1,585 @@
> > > >> +From e0e6bca6ddc0e6d9fa3a5b644af9b446924fbf83 Mon Sep 17 00:00:00
> 2001
> > > >> +From: Russ Cox <rsc@golang.org>
> > > >> +Date: Thu, 20 May 2021 12:46:33 -0400
> > > >> +Subject: [PATCH 5/6] html/template, text/template: implement brea=
k
> and
> > > >> + continue for range loops
> > > >> +
> > > >> +Break and continue for range loops was accepted as a proposal in
> June 2017.
> > > >> +It was implemented in CL 66410 (Oct 2017)
> > > >> +but then rolled back in CL 92155 (Feb 2018)
> > > >> +because html/template changes had not been implemented.
> > > >> +
> > > >> +This CL reimplements break and continue in text/template
> > > >> +and then adds support for them in html/template as well.
> > > >> +
> > > >> +Fixes #20531.
> > > >> +
> > > >> +Change-Id: I05330482a976f1c078b4b49c2287bd9031bb7616
> > > >> +Reviewed-on: https://go-review.googlesource.com/c/go/+/321491
> > > >> +Trust: Russ Cox <rsc@golang.org>
> > > >> +Run-TryBot: Russ Cox <rsc@golang.org>
> > > >> +TryBot-Result: Go Bot <gobot@golang.org>
> > > >> +Reviewed-by: Rob Pike <r@golang.org>
> > > >> +
> > > >> +Dependency Patch #5
> > > >> +
> > > >> +Upstream-Status: Backport from
> https://github.com/golang/go/commit/d0dd26a88c019d54f22463daae81e785f5867=
565
> > > >> +CVE: CVE-2023-24538
> > > >> +Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> > > >> +---
> > > >> + src/html/template/context.go          |  4 ++
> > > >> + src/html/template/escape.go           | 71
> ++++++++++++++++++++++++++++++++++-
> > > >> + src/html/template/escape_test.go      | 24 ++++++++++++
> > > >> + src/text/template/doc.go              |  8 ++++
> > > >> + src/text/template/exec.go             | 24 +++++++++++-
> > > >> + src/text/template/exec_test.go        |  2 +
> > > >> + src/text/template/parse/lex.go        | 13 ++++++-
> > > >> + src/text/template/parse/lex_test.go   |  2 +
> > > >> + src/text/template/parse/node.go       | 36 ++++++++++++++++++
> > > >> + src/text/template/parse/parse.go      | 42 ++++++++++++++++++++-
> > > >> + src/text/template/parse/parse_test.go |  8 ++++
> > > >> + 11 files changed, 230 insertions(+), 4 deletions(-)
> > > >> +
> > > >> +diff --git a/src/html/template/context.go
> b/src/html/template/context.go
> > > >> +index f7d4849..aaa7d08 100644
> > > >> +--- a/src/html/template/context.go
> > > >> ++++ b/src/html/template/context.go
> > > >> +@@ -6,6 +6,7 @@ package template
> > > >> +
> > > >> + import (
> > > >> +       "fmt"
> > > >> ++      "text/template/parse"
> > > >> + )
> > > >> +
> > > >> + // context describes the state an HTML parser must be in when it
> reaches the
> > > >> +@@ -22,6 +23,7 @@ type context struct {
> > > >> +       jsCtx   jsCtx
> > > >> +       attr    attr
> > > >> +       element element
> > > >> ++      n       parse.Node // for range break/continue
> > > >> +       err     *Error
> > > >> + }
> > > >> +
> > > >> +@@ -141,6 +143,8 @@ const (
> > > >> +       // stateError is an infectious error state outside any val=
id
> > > >> +       // HTML/CSS/JS construct.
> > > >> +       stateError
> > > >> ++      // stateDead marks unreachable code after a {{break}} or
> {{continue}}.
> > > >> ++      stateDead
> > > >> + )
> > > >> +
> > > >> + // isComment is true for any state that contains content meant
> for template
> > > >> +diff --git a/src/html/template/escape.go
> b/src/html/template/escape.go
> > > >> +index 8739735..6dea79c 100644
> > > >> +--- a/src/html/template/escape.go
> > > >> ++++ b/src/html/template/escape.go
> > > >> +@@ -97,6 +97,15 @@ type escaper struct {
> > > >> +       actionNodeEdits   map[*parse.ActionNode][]string
> > > >> +       templateNodeEdits map[*parse.TemplateNode]string
> > > >> +       textNodeEdits     map[*parse.TextNode][]byte
> > > >> ++      // rangeContext holds context about the current range loop=
.
> > > >> ++      rangeContext *rangeContext
> > > >> ++}
> > > >> ++
> > > >> ++// rangeContext holds information about the current range loop.
> > > >> ++type rangeContext struct {
> > > >> ++      outer     *rangeContext // outer loop
> > > >> ++      breaks    []context     // context at each break action
> > > >> ++      continues []context     // context at each continue action
> > > >> + }
> > > >> +
> > > >> + // makeEscaper creates a blank escaper for the given set.
> > > >> +@@ -109,6 +118,7 @@ func makeEscaper(n *nameSpace) escaper {
> > > >> +               map[*parse.ActionNode][]string{},
> > > >> +               map[*parse.TemplateNode]string{},
> > > >> +               map[*parse.TextNode][]byte{},
> > > >> ++              nil,
> > > >> +       }
> > > >> + }
> > > >> +
> > > >> +@@ -124,8 +134,16 @@ func (e *escaper) escape(c context, n
> parse.Node) context {
> > > >> +       switch n :=3D n.(type) {
> > > >> +       case *parse.ActionNode:
> > > >> +               return e.escapeAction(c, n)
> > > >> ++      case *parse.BreakNode:
> > > >> ++              c.n =3D n
> > > >> ++              e.rangeContext.breaks =3D
> append(e.rangeContext.breaks, c)
> > > >> ++              return context{state: stateDead}
> > > >> +       case *parse.CommentNode:
> > > >> +               return c
> > > >> ++      case *parse.ContinueNode:
> > > >> ++              c.n =3D n
> > > >> ++              e.rangeContext.continues =3D
> append(e.rangeContext.breaks, c)
> > > >> ++              return context{state: stateDead}
> > > >> +       case *parse.IfNode:
> > > >> +               return e.escapeBranch(c, &n.BranchNode, "if")
> > > >> +       case *parse.ListNode:
> > > >> +@@ -427,6 +445,12 @@ func join(a, b context, node parse.Node,
> nodeName string) context {
> > > >> +       if b.state =3D=3D stateError {
> > > >> +               return b
> > > >> +       }
> > > >> ++      if a.state =3D=3D stateDead {
> > > >> ++              return b
> > > >> ++      }
> > > >> ++      if b.state =3D=3D stateDead {
> > > >> ++              return a
> > > >> ++      }
> > > >> +       if a.eq(b) {
> > > >> +               return a
> > > >> +       }
> > > >> +@@ -466,14 +490,27 @@ func join(a, b context, node parse.Node,
> nodeName string) context {
> > > >> +
> > > >> + // escapeBranch escapes a branch template node: "if", "range" an=
d
> "with".
> > > >> + func (e *escaper) escapeBranch(c context, n *parse.BranchNode,
> nodeName string) context {
> > > >> ++      if nodeName =3D=3D "range" {
> > > >> ++              e.rangeContext =3D &rangeContext{outer:
> e.rangeContext}
> > > >> ++      }
> > > >> +       c0 :=3D e.escapeList(c, n.List)
> > > >> +-      if nodeName =3D=3D "range" && c0.state !=3D stateError {
> > > >> ++      if nodeName =3D=3D "range" {
> > > >> ++              if c0.state !=3D stateError {
> > > >> ++                      c0 =3D joinRange(c0, e.rangeContext)
> > > >> ++              }
> > > >> ++              e.rangeContext =3D e.rangeContext.outer
> > > >> ++              if c0.state =3D=3D stateError {
> > > >> ++                      return c0
> > > >> ++              }
> > > >> ++
> > > >> +               // The "true" branch of a "range" node can execute
> multiple times.
> > > >> +               // We check that executing n.List once results in
> the same context
> > > >> +               // as executing n.List twice.
> > > >> ++              e.rangeContext =3D &rangeContext{outer:
> e.rangeContext}
> > > >> +               c1, _ :=3D e.escapeListConditionally(c0, n.List, n=
il)
> > > >> +               c0 =3D join(c0, c1, n, nodeName)
> > > >> +               if c0.state =3D=3D stateError {
> > > >> ++                      e.rangeContext =3D e.rangeContext.outer
> > > >> +                       // Make clear that this is a problem on
> loop re-entry
> > > >> +                       // since developers tend to overlook that
> branch when
> > > >> +                       // debugging templates.
> > > >> +@@ -481,11 +518,39 @@ func (e *escaper) escapeBranch(c context, n
> *parse.BranchNode, nodeName string)
> > > >> +                       c0.err.Description =3D "on range loop
> re-entry: " + c0.err.Description
> > > >> +                       return c0
> > > >> +               }
> > > >> ++              c0 =3D joinRange(c0, e.rangeContext)
> > > >> ++              e.rangeContext =3D e.rangeContext.outer
> > > >> ++              if c0.state =3D=3D stateError {
> > > >> ++                      return c0
> > > >> ++              }
> > > >> +       }
> > > >> +       c1 :=3D e.escapeList(c, n.ElseList)
> > > >> +       return join(c0, c1, n, nodeName)
> > > >> + }
> > > >> +
> > > >> ++func joinRange(c0 context, rc *rangeContext) context {
> > > >> ++      // Merge contexts at break and continue statements into
> overall body context.
> > > >> ++      // In theory we could treat breaks differently from
> continues, but for now it is
> > > >> ++      // enough to treat them both as going back to the start of
> the loop (which may then stop).
> > > >> ++      for _, c :=3D range rc.breaks {
> > > >> ++              c0 =3D join(c0, c, c.n, "range")
> > > >> ++              if c0.state =3D=3D stateError {
> > > >> ++                      c0.err.Line =3D c.n.(*parse.BreakNode).Lin=
e
> > > >> ++                      c0.err.Description =3D "at range loop brea=
k:
> " + c0.err.Description
> > > >> ++                      return c0
> > > >> ++              }
> > > >> ++      }
> > > >> ++      for _, c :=3D range rc.continues {
> > > >> ++              c0 =3D join(c0, c, c.n, "range")
> > > >> ++              if c0.state =3D=3D stateError {
> > > >> ++                      c0.err.Line =3D c.n.(*parse.ContinueNode).=
Line
> > > >> ++                      c0.err.Description =3D "at range loop
> continue: " + c0.err.Description
> > > >> ++                      return c0
> > > >> ++              }
> > > >> ++      }
> > > >> ++      return c0
> > > >> ++}
> > > >> ++
> > > >> + // escapeList escapes a list template node.
> > > >> + func (e *escaper) escapeList(c context, n *parse.ListNode)
> context {
> > > >> +       if n =3D=3D nil {
> > > >> +@@ -493,6 +558,9 @@ func (e *escaper) escapeList(c context, n
> *parse.ListNode) context {
> > > >> +       }
> > > >> +       for _, m :=3D range n.Nodes {
> > > >> +               c =3D e.escape(c, m)
> > > >> ++              if c.state =3D=3D stateDead {
> > > >> ++                      break
> > > >> ++              }
> > > >> +       }
> > > >> +       return c
> > > >> + }
> > > >> +@@ -503,6 +571,7 @@ func (e *escaper) escapeList(c context, n
> *parse.ListNode) context {
> > > >> + // which is the same as whether e was updated.
> > > >> + func (e *escaper) escapeListConditionally(c context, n
> *parse.ListNode, filter func(*escaper, context) bool) (context, bool) {
> > > >> +       e1 :=3D makeEscaper(e.ns)
> > > >> ++      e1.rangeContext =3D e.rangeContext
> > > >> +       // Make type inferences available to f.
> > > >> +       for k, v :=3D range e.output {
> > > >> +               e1.output[k] =3D v
> > > >> +diff --git a/src/html/template/escape_test.go
> b/src/html/template/escape_test.go
> > > >> +index c709660..fa2b84a 100644
> > > >> +--- a/src/html/template/escape_test.go
> > > >> ++++ b/src/html/template/escape_test.go
> > > >> +@@ -920,6 +920,22 @@ func TestErrors(t *testing.T) {
> > > >> +                       "<a href=3D'/foo?{{range
> .Items}}&{{.K}}=3D{{.V}}{{end}}'>",
> > > >> +                       "",
> > > >> +               },
> > > >> ++              {
> > > >> ++                      "{{range .Items}}<a{{if
> .X}}{{end}}>{{end}}",
> > > >> ++                      "",
> > > >> ++              },
> > > >> ++              {
> > > >> ++                      "{{range .Items}}<a{{if
> .X}}{{end}}>{{continue}}{{end}}",
> > > >> ++                      "",
> > > >> ++              },
> > > >> ++              {
> > > >> ++                      "{{range .Items}}<a{{if
> .X}}{{end}}>{{break}}{{end}}",
> > > >> ++                      "",
> > > >> ++              },
> > > >> ++              {
> > > >> ++                      "{{range .Items}}<a{{if .X}}{{end}}>{{if
> .X}}{{break}}{{end}}{{end}}",
> > > >> ++                      "",
> > > >> ++              },
> > > >> +               // Error cases.
> > > >> +               {
> > > >> +                       "{{if .Cond}}<a{{end}}",
> > > >> +@@ -956,6 +972,14 @@ func TestErrors(t *testing.T) {
> > > >> +                       "z:2:8: on range loop re-entry: {{range}}
> branches",
> > > >> +               },
> > > >> +               {
> > > >> ++                      "{{range .Items}}<a{{if
> .X}}{{break}}{{end}}>{{end}}",
> > > >> ++                      "z:1:29: at range loop break: {{range}}
> branches end in different contexts",
> > > >> ++              },
> > > >> ++              {
> > > >> ++                      "{{range .Items}}<a{{if
> .X}}{{continue}}{{end}}>{{end}}",
> > > >> ++                      "z:1:29: at range loop continue: {{range}}
> branches end in different contexts",
> > > >> ++              },
> > > >> ++              {
> > > >> +                       "<a b=3D1 c=3D{{.H}}",
> > > >> +                       "z: ends in a non-text context: {stateAttr
> delimSpaceOrTagEnd",
> > > >> +               },
> > > >> +diff --git a/src/text/template/doc.go b/src/text/template/doc.go
> > > >> +index 7b30294..0228b15 100644
> > > >> +--- a/src/text/template/doc.go
> > > >> ++++ b/src/text/template/doc.go
> > > >> +@@ -112,6 +112,14 @@ data, defined in detail in the corresponding
> sections that follow.
> > > >> +               T0 is executed; otherwise, dot is set to the
> successive elements
> > > >> +               of the array, slice, or map and T1 is executed.
> > > >> +
> > > >> ++      {{break}}
> > > >> ++              The innermost {{range pipeline}} loop is ended
> early, stopping the
> > > >> ++              current iteration and bypassing all remaining
> iterations.
> > > >> ++
> > > >> ++      {{continue}}
> > > >> ++              The current iteration of the innermost {{range
> pipeline}} loop is
> > > >> ++              stopped, and the loop starts the next iteration.
> > > >> ++
> > > >> +       {{template "name"}}
> > > >> +               The template with the specified name is executed
> with nil data.
> > > >> +
> > > >> +diff --git a/src/text/template/exec.go b/src/text/template/exec.g=
o
> > > >> +index 7ac5175..6cb140a 100644
> > > >> +--- a/src/text/template/exec.go
> > > >> ++++ b/src/text/template/exec.go
> > > >> +@@ -5,6 +5,7 @@
> > > >> + package template
> > > >> +
> > > >> + import (
> > > >> ++      "errors"
> > > >> +       "fmt"
> > > >> +       "internal/fmtsort"
> > > >> +       "io"
> > > >> +@@ -244,6 +245,12 @@ func (t *Template) DefinedTemplates() string=
 {
> > > >> +       return b.String()
> > > >> + }
> > > >> +
> > > >> ++// Sentinel errors for use with panic to signal early exits from
> range loops.
> > > >> ++var (
> > > >> ++      walkBreak    =3D errors.New("break")
> > > >> ++      walkContinue =3D errors.New("continue")
> > > >> ++)
> > > >> ++
> > > >> + // Walk functions step through the major pieces of the template
> structure,
> > > >> + // generating output as they go.
> > > >> + func (s *state) walk(dot reflect.Value, node parse.Node) {
> > > >> +@@ -256,7 +263,11 @@ func (s *state) walk(dot reflect.Value, node
> parse.Node) {
> > > >> +               if len(node.Pipe.Decl) =3D=3D 0 {
> > > >> +                       s.printValue(node, val)
> > > >> +               }
> > > >> ++      case *parse.BreakNode:
> > > >> ++              panic(walkBreak)
> > > >> +       case *parse.CommentNode:
> > > >> ++      case *parse.ContinueNode:
> > > >> ++              panic(walkContinue)
> > > >> +       case *parse.IfNode:
> > > >> +               s.walkIfOrWith(parse.NodeIf, dot, node.Pipe,
> node.List, node.ElseList)
> > > >> +       case *parse.ListNode:
> > > >> +@@ -335,6 +346,11 @@ func isTrue(val reflect.Value) (truth, ok
> bool) {
> > > >> +
> > > >> + func (s *state) walkRange(dot reflect.Value, r *parse.RangeNode)=
 {
> > > >> +       s.at(r)
> > > >> ++      defer func() {
> > > >> ++              if r :=3D recover(); r !=3D nil && r !=3D walkBrea=
k {
> > > >> ++                      panic(r)
> > > >> ++              }
> > > >> ++      }()
> > > >> +       defer s.pop(s.mark())
> > > >> +       val, _ :=3D indirect(s.evalPipeline(dot, r.Pipe))
> > > >> +       // mark top of stack before any variables in the body are
> pushed.
> > > >> +@@ -348,8 +364,14 @@ func (s *state) walkRange(dot reflect.Value,
> r *parse.RangeNode) {
> > > >> +               if len(r.Pipe.Decl) > 1 {
> > > >> +                       s.setTopVar(2, index)
> > > >> +               }
> > > >> ++              defer s.pop(mark)
> > > >> ++              defer func() {
> > > >> ++                      // Consume panic(walkContinue)
> > > >> ++                      if r :=3D recover(); r !=3D nil && r !=3D
> walkContinue {
> > > >> ++                              panic(r)
> > > >> ++                      }
> > > >> ++              }()
> > > >> +               s.walk(elem, r.List)
> > > >> +-              s.pop(mark)
> > > >> +       }
> > > >> +       switch val.Kind() {
> > > >> +       case reflect.Array, reflect.Slice:
> > > >> +diff --git a/src/text/template/exec_test.go
> b/src/text/template/exec_test.go
> > > >> +index 3309b33..a639f44 100644
> > > >> +--- a/src/text/template/exec_test.go
> > > >> ++++ b/src/text/template/exec_test.go
> > > >> +@@ -563,6 +563,8 @@ var execTests =3D []execTest{
> > > >> +       {"range empty no else", "{{range .SIEmpty}}-{{.}}-{{end}}"=
,
> "", tVal, true},
> > > >> +       {"range []int else", "{{range
> .SI}}-{{.}}-{{else}}EMPTY{{end}}", "-3--4--5-", tVal, true},
> > > >> +       {"range empty else", "{{range
> .SIEmpty}}-{{.}}-{{else}}EMPTY{{end}}", "EMPTY", tVal, true},
> > > >> ++      {"range []int break else", "{{range
> .SI}}-{{.}}-{{break}}NOTREACHED{{else}}EMPTY{{end}}", "-3-", tVal, true},
> > > >> ++      {"range []int continue else", "{{range
> .SI}}-{{.}}-{{continue}}NOTREACHED{{else}}EMPTY{{end}}", "-3--4--5-", tVa=
l,
> true},
> > > >> +       {"range []bool", "{{range .SB}}-{{.}}-{{end}}",
> "-true--false-", tVal, true},
> > > >> +       {"range []int method", "{{range .SI | .MAdd
> .I}}-{{.}}-{{end}}", "-20--21--22-", tVal, true},
> > > >> +       {"range map", "{{range .MSI}}-{{.}}-{{end}}", "-1--3--2-",
> tVal, true},
> > > >> +diff --git a/src/text/template/parse/lex.go
> b/src/text/template/parse/lex.go
> > > >> +index 6784071..95e3377 100644
> > > >> +--- a/src/text/template/parse/lex.go
> > > >> ++++ b/src/text/template/parse/lex.go
> > > >> +@@ -62,6 +62,8 @@ const (
> > > >> +       // Keywords appear after all the rest.
> > > >> +       itemKeyword  // used only to delimit the keywords
> > > >> +       itemBlock    // block keyword
> > > >> ++      itemBreak    // break keyword
> > > >> ++      itemContinue // continue keyword
> > > >> +       itemDot      // the cursor, spelled '.'
> > > >> +       itemDefine   // define keyword
> > > >> +       itemElse     // else keyword
> > > >> +@@ -76,6 +78,8 @@ const (
> > > >> + var key =3D map[string]itemType{
> > > >> +       ".":        itemDot,
> > > >> +       "block":    itemBlock,
> > > >> ++      "break":    itemBreak,
> > > >> ++      "continue": itemContinue,
> > > >> +       "define":   itemDefine,
> > > >> +       "else":     itemElse,
> > > >> +       "end":      itemEnd,
> > > >> +@@ -119,6 +123,8 @@ type lexer struct {
> > > >> +       parenDepth  int       // nesting depth of ( ) exprs
> > > >> +       line        int       // 1+number of newlines seen
> > > >> +       startLine   int       // start line of this item
> > > >> ++      breakOK     bool      // break keyword allowed
> > > >> ++      continueOK  bool      // continue keyword allowed
> > > >> + }
> > > >> +
> > > >> + // next returns the next rune in the input.
> > > >> +@@ -461,7 +467,12 @@ Loop:
> > > >> +                       }
> > > >> +                       switch {
> > > >> +                       case key[word] > itemKeyword:
> > > >> +-                              l.emit(key[word])
> > > >> ++                              item :=3D key[word]
> > > >> ++                              if item =3D=3D itemBreak && !l.bre=
akOK
> || item =3D=3D itemContinue && !l.continueOK {
> > > >> ++                                      l.emit(itemIdentifier)
> > > >> ++                              } else {
> > > >> ++                                      l.emit(item)
> > > >> ++                              }
> > > >> +                       case word[0] =3D=3D '.':
> > > >> +                               l.emit(itemField)
> > > >> +                       case word =3D=3D "true", word =3D=3D "fals=
e":
> > > >> +diff --git a/src/text/template/parse/lex_test.go
> b/src/text/template/parse/lex_test.go
> > > >> +index 6510eed..df6aabf 100644
> > > >> +--- a/src/text/template/parse/lex_test.go
> > > >> ++++ b/src/text/template/parse/lex_test.go
> > > >> +@@ -35,6 +35,8 @@ var itemName =3D map[itemType]string{
> > > >> +       // keywords
> > > >> +       itemDot:      ".",
> > > >> +       itemBlock:    "block",
> > > >> ++      itemBreak:    "break",
> > > >> ++      itemContinue: "continue",
> > > >> +       itemDefine:   "define",
> > > >> +       itemElse:     "else",
> > > >> +       itemIf:       "if",
> > > >> +diff --git a/src/text/template/parse/node.go
> b/src/text/template/parse/node.go
> > > >> +index a9dad5e..c398da0 100644
> > > >> +--- a/src/text/template/parse/node.go
> > > >> ++++ b/src/text/template/parse/node.go
> > > >> +@@ -71,6 +71,8 @@ const (
> > > >> +       NodeVariable                   // A $ variable.
> > > >> +       NodeWith                       // A with action.
> > > >> +       NodeComment                    // A comment.
> > > >> ++      NodeBreak                      // A break action.
> > > >> ++      NodeContinue                   // A continue action.
> > > >> + )
> > > >> +
> > > >> + // Nodes.
> > > >> +@@ -907,6 +909,40 @@ func (i *IfNode) Copy() Node {
> > > >> +       return i.tr.newIf(i.Pos, i.Line, i.Pipe.CopyPipe(),
> i.List.CopyList(), i.ElseList.CopyList())
> > > >> + }
> > > >> +
> > > >> ++// BreakNode represents a {{break}} action.
> > > >> ++type BreakNode struct {
> > > >> ++      tr *Tree
> > > >> ++      NodeType
> > > >> ++      Pos
> > > >> ++      Line int
> > > >> ++}
> > > >> ++
> > > >> ++func (t *Tree) newBreak(pos Pos, line int) *BreakNode {
> > > >> ++      return &BreakNode{tr: t, NodeType: NodeBreak, Pos: pos,
> Line: line}
> > > >> ++}
> > > >> ++
> > > >> ++func (b *BreakNode) Copy() Node                  { return
> b.tr.newBreak(b.Pos, b.Line) }
> > > >> ++func (b *BreakNode) String() string              { return
> "{{break}}" }
> > > >> ++func (b *BreakNode) tree() *Tree                 { return b.tr }
> > > >> ++func (b *BreakNode) writeTo(sb *strings.Builder) {
> sb.WriteString("{{break}}") }
> > > >> ++
> > > >> ++// ContinueNode represents a {{continue}} action.
> > > >> ++type ContinueNode struct {
> > > >> ++      tr *Tree
> > > >> ++      NodeType
> > > >> ++      Pos
> > > >> ++      Line int
> > > >> ++}
> > > >> ++
> > > >> ++func (t *Tree) newContinue(pos Pos, line int) *ContinueNode {
> > > >> ++      return &ContinueNode{tr: t, NodeType: NodeContinue, Pos:
> pos, Line: line}
> > > >> ++}
> > > >> ++
> > > >> ++func (c *ContinueNode) Copy() Node                  { return
> c.tr.newContinue(c.Pos, c.Line) }
> > > >> ++func (c *ContinueNode) String() string              { return
> "{{continue}}" }
> > > >> ++func (c *ContinueNode) tree() *Tree                 { return c.t=
r
> }
> > > >> ++func (c *ContinueNode) writeTo(sb *strings.Builder) {
> sb.WriteString("{{continue}}") }
> > > >> ++
> > > >> + // RangeNode represents a {{range}} action and its commands.
> > > >> + type RangeNode struct {
> > > >> +       BranchNode
> > > >> +diff --git a/src/text/template/parse/parse.go
> b/src/text/template/parse/parse.go
> > > >> +index 5e6e512..7f78b56 100644
> > > >> +--- a/src/text/template/parse/parse.go
> > > >> ++++ b/src/text/template/parse/parse.go
> > > >> +@@ -31,6 +31,7 @@ type Tree struct {
> > > >> +       vars       []string // variables defined at the moment.
> > > >> +       treeSet    map[string]*Tree
> > > >> +       actionLine int // line of left delim starting action
> > > >> ++      rangeDepth int
> > > >> +       mode       Mode
> > > >> + }
> > > >> +
> > > >> +@@ -223,6 +224,8 @@ func (t *Tree) startParse(funcs
> []map[string]interface{}, lex *lexer, treeSet ma
> > > >> +       t.vars =3D []string{"$"}
> > > >> +       t.funcs =3D funcs
> > > >> +       t.treeSet =3D treeSet
> > > >> ++      lex.breakOK =3D !t.hasFunction("break")
> > > >> ++      lex.continueOK =3D !t.hasFunction("continue")
> > > >> + }
> > > >> +
> > > >> + // stopParse terminates parsing.
> > > >> +@@ -385,6 +388,10 @@ func (t *Tree) action() (n Node) {
> > > >> +       switch token :=3D t.nextNonSpace(); token.typ {
> > > >> +       case itemBlock:
> > > >> +               return t.blockControl()
> > > >> ++      case itemBreak:
> > > >> ++              return t.breakControl(token.pos, token.line)
> > > >> ++      case itemContinue:
> > > >> ++              return t.continueControl(token.pos, token.line)
> > > >> +       case itemElse:
> > > >> +               return t.elseControl()
> > > >> +       case itemEnd:
> > > >> +@@ -404,6 +411,32 @@ func (t *Tree) action() (n Node) {
> > > >> +       return t.newAction(token.pos, token.line,
> t.pipeline("command", itemRightDelim))
> > > >> + }
> > > >> +
> > > >> ++// Break:
> > > >> ++//    {{break}}
> > > >> ++// Break keyword is past.
> > > >> ++func (t *Tree) breakControl(pos Pos, line int) Node {
> > > >> ++      if token :=3D t.next(); token.typ !=3D itemRightDelim {
> > > >> ++              t.unexpected(token, "in {{break}}")
> > > >> ++      }
> > > >> ++      if t.rangeDepth =3D=3D 0 {
> > > >> ++              t.errorf("{{break}} outside {{range}}")
> > > >> ++      }
> > > >> ++      return t.newBreak(pos, line)
> > > >> ++}
> > > >> ++
> > > >> ++// Continue:
> > > >> ++//    {{continue}}
> > > >> ++// Continue keyword is past.
> > > >> ++func (t *Tree) continueControl(pos Pos, line int) Node {
> > > >> ++      if token :=3D t.next(); token.typ !=3D itemRightDelim {
> > > >> ++              t.unexpected(token, "in {{continue}}")
> > > >> ++      }
> > > >> ++      if t.rangeDepth =3D=3D 0 {
> > > >> ++              t.errorf("{{continue}} outside {{range}}")
> > > >> ++      }
> > > >> ++      return t.newContinue(pos, line)
> > > >> ++}
> > > >> ++
> > > >> + // Pipeline:
> > > >> + //    declarations? command ('|' command)*
> > > >> + func (t *Tree) pipeline(context string, end itemType) (pipe
> *PipeNode) {
> > > >> +@@ -479,8 +512,14 @@ func (t *Tree) checkPipeline(pipe *PipeNode,
> context string) {
> > > >> + func (t *Tree) parseControl(allowElseIf bool, context string)
> (pos Pos, line int, pipe *PipeNode, list, elseList *ListNode) {
> > > >> +       defer t.popVars(len(t.vars))
> > > >> +       pipe =3D t.pipeline(context, itemRightDelim)
> > > >> ++      if context =3D=3D "range" {
> > > >> ++              t.rangeDepth++
> > > >> ++      }
> > > >> +       var next Node
> > > >> +       list, next =3D t.itemList()
> > > >> ++      if context =3D=3D "range" {
> > > >> ++              t.rangeDepth--
> > > >> ++      }
> > > >> +       switch next.Type() {
> > > >> +       case nodeEnd: //done
> > > >> +       case nodeElse:
> > > >> +@@ -522,7 +561,8 @@ func (t *Tree) ifControl() Node {
> > > >> + //    {{range pipeline}} itemList {{else}} itemList {{end}}
> > > >> + // Range keyword is past.
> > > >> + func (t *Tree) rangeControl() Node {
> > > >> +-      return t.newRange(t.parseControl(false, "range"))
> > > >> ++      r :=3D t.newRange(t.parseControl(false, "range"))
> > > >> ++      return r
> > > >> + }
> > > >> +
> > > >> + // With:
> > > >> +diff --git a/src/text/template/parse/parse_test.go
> b/src/text/template/parse/parse_test.go
> > > >> +index 220f984..ba45636 100644
> > > >> +--- a/src/text/template/parse/parse_test.go
> > > >> ++++ b/src/text/template/parse/parse_test.go
> > > >> +@@ -230,6 +230,10 @@ var parseTests =3D []parseTest{
> > > >> +               `{{range $x :=3D .SI}}{{.}}{{end}}`},
> > > >> +       {"range 2 vars", "{{range $x, $y :=3D .SI}}{{.}}{{end}}",
> noError,
> > > >> +               `{{range $x, $y :=3D .SI}}{{.}}{{end}}`},
> > > >> ++      {"range with break", "{{range .SI}}{{.}}{{break}}{{end}}",
> noError,
> > > >> ++              `{{range .SI}}{{.}}{{break}}{{end}}`},
> > > >> ++      {"range with continue", "{{range
> .SI}}{{.}}{{continue}}{{end}}", noError,
> > > >> ++              `{{range .SI}}{{.}}{{continue}}{{end}}`},
> > > >> +       {"constants", "{{range .SI 1 -3.2i true false 'a'
> nil}}{{end}}", noError,
> > > >> +               `{{range .SI 1 -3.2i true false 'a' nil}}{{end}}`}=
,
> > > >> +       {"template", "{{template `x`}}", noError,
> > > >> +@@ -279,6 +283,10 @@ var parseTests =3D []parseTest{
> > > >> +       {"adjacent args", "{{printf 3`x`}}", hasError, ""},
> > > >> +       {"adjacent args with .", "{{printf `x`.}}", hasError, ""},
> > > >> +       {"extra end after if", "{{if .X}}a{{else if
> .Y}}b{{end}}{{end}}", hasError, ""},
> > > >> ++      {"break outside range", "{{range .}}{{end}} {{break}}",
> hasError, ""},
> > > >> ++      {"continue outside range", "{{range .}}{{end}}
> {{continue}}", hasError, ""},
> > > >> ++      {"break in range else", "{{range
> .}}{{else}}{{break}}{{end}}", hasError, ""},
> > > >> ++      {"continue in range else", "{{range
> .}}{{else}}{{continue}}{{end}}", hasError, ""},
> > > >> +       // Other kinds of assignments and operators aren't
> available yet.
> > > >> +       {"bug0a", "{{$x :=3D 0}}{{$x}}", noError, "{{$x :=3D
> 0}}{{$x}}"},
> > > >> +       {"bug0b", "{{$x +=3D 1}}{{$x}}", hasError, ""},
> > > >> +--
> > > >> +2.7.4
> > > >> diff --git
> a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-3.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_6.patch
> > > >> similarity index 53%
> > > >> rename from meta/recipes-devtools/go/go-1.14/CVE-2023-24538-3.patc=
h
> > > >> rename to meta/recipes-devtools/go/go-1.14/CVE-2023-24538_6.patch
> > > >> index d5bb33e091..baf400b891 100644
> > > >> --- a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-3.patch
> > > >> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_6.patch
> > > >> @@ -1,7 +1,7 @@
> > > >>  From 16f4882984569f179d73967c9eee679bb9b098c5 Mon Sep 17 00:00:00
> 2001
> > > >>  From: Roland Shoemaker <bracewell@google.com>
> > > >>  Date: Mon, 20 Mar 2023 11:01:13 -0700
> > > >> -Subject: [PATCH 3/3] html/template: disallow actions in JS
> template literals
> > > >> +Subject: [PATCH 6/6] html/template: disallow actions in JS
> template literals
> > > >>
> > > >>  ECMAScript 6 introduced template literals[0][1] which are
> delimited with
> > > >>  backticks. These need to be escaped in a similar fashion to the
> > > >> @@ -52,12 +52,15 @@ CVE: CVE-2023-24538
> > > >>  Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> > > >>  ---
> > > >>   src/html/template/context.go      |  2 ++
> > > >> - src/html/template/error.go        | 13 +++++++++++++
> > > >> - src/html/template/escape.go       | 11 +++++++++++
> > > >> + src/html/template/error.go        | 13 ++++++++
> > > >> + src/html/template/escape.go       | 11 +++++++
> > > >> + src/html/template/escape_test.go  | 66
> ++++++++++++++++++++++-----------------
> > > >>   src/html/template/js.go           |  2 ++
> > > >> - src/html/template/jsctx_string.go |  9 +++++++++
> > > >> - src/html/template/transition.go   |  7 ++++++-
> > > >> - 6 files changed, 43 insertions(+), 1 deletion(-)
> > > >> + src/html/template/js_test.go      |  2 +-
> > > >> + src/html/template/jsctx_string.go |  9 ++++++
> > > >> + src/html/template/state_string.go | 37 ++++++++++++++++++++--
> > > >> + src/html/template/transition.go   |  7 ++++-
> > > >> + 9 files changed, 116 insertions(+), 33 deletions(-)
> > > >>
> > > >>  diff --git a/src/html/template/context.go
> b/src/html/template/context.go
> > > >>  index f7d4849..0b65313 100644
> > > >> @@ -125,6 +128,104 @@ index f12dafa..29ca5b3 100644
> > > >>         case stateJSRegexp:
> > > >>                 s =3D append(s, "_html_template_jsregexpescaper")
> > > >>         case stateCSS:
> > > >> +diff --git a/src/html/template/escape_test.go
> b/src/html/template/escape_test.go
> > > >> +index fa2b84a..1b150e9 100644
> > > >> +--- a/src/html/template/escape_test.go
> > > >> ++++ b/src/html/template/escape_test.go
> > > >> +@@ -681,35 +681,31 @@ func TestEscape(t *testing.T) {
> > > >> +       }
> > > >> +
> > > >> +       for _, test :=3D range tests {
> > > >> +-              tmpl :=3D New(test.name)
> > > >> +-              tmpl =3D Must(tmpl.Parse(test.input))
> > > >> +-              // Check for bug 6459: Tree field was not set in
> Parse.
> > > >> +-              if tmpl.Tree !=3D tmpl.text.Tree {
> > > >> +-                      t.Errorf("%s: tree not set properly",
> test.name)
> > > >> +-                      continue
> > > >> +-              }
> > > >> +-              b :=3D new(bytes.Buffer)
> > > >> +-              if err :=3D tmpl.Execute(b, data); err !=3D nil {
> > > >> +-                      t.Errorf("%s: template execution failed:
> %s", test.name, err)
> > > >> +-                      continue
> > > >> +-              }
> > > >> +-              if w, g :=3D test.output, b.String(); w !=3D g {
> > > >> +-                      t.Errorf("%s: escaped output:
> want\n\t%q\ngot\n\t%q", test.name, w, g)
> > > >> +-                      continue
> > > >> +-              }
> > > >> +-              b.Reset()
> > > >> +-              if err :=3D tmpl.Execute(b, pdata); err !=3D nil {
> > > >> +-                      t.Errorf("%s: template execution failed fo=
r
> pointer: %s", test.name, err)
> > > >> +-                      continue
> > > >> +-              }
> > > >> +-              if w, g :=3D test.output, b.String(); w !=3D g {
> > > >> +-                      t.Errorf("%s: escaped output for pointer:
> want\n\t%q\ngot\n\t%q", test.name, w, g)
> > > >> +-                      continue
> > > >> +-              }
> > > >> +-              if tmpl.Tree !=3D tmpl.text.Tree {
> > > >> +-                      t.Errorf("%s: tree mismatch", test.name)
> > > >> +-                      continue
> > > >> +-              }
> > > >> ++              t.Run(test.name, func(t *testing.T) {
> > > >> ++                      tmpl :=3D New(test.name)
> > > >> ++                      tmpl =3D Must(tmpl.Parse(test.input))
> > > >> ++                      // Check for bug 6459: Tree field was not
> set in Parse.
> > > >> ++                      if tmpl.Tree !=3D tmpl.text.Tree {
> > > >> ++                              t.Fatalf("%s: tree not set
> properly", test.name)
> > > >> ++                      }
> > > >> ++                      b :=3D new(strings.Builder)
> > > >> ++                      if err :=3D tmpl.Execute(b, data); err !=
=3D nil
> {
> > > >> ++                              t.Fatalf("%s: template execution
> failed: %s", test.name, err)
> > > >> ++                      }
> > > >> ++                      if w, g :=3D test.output, b.String(); w !=
=3D g {
> > > >> ++                              t.Fatalf("%s: escaped output:
> want\n\t%q\ngot\n\t%q", test.name, w, g)
> > > >> ++                      }
> > > >> ++                      b.Reset()
> > > >> ++                      if err :=3D tmpl.Execute(b, pdata); err !=
=3D
> nil {
> > > >> ++                              t.Fatalf("%s: template execution
> failed for pointer: %s", test.name, err)
> > > >> ++                      }
> > > >> ++                      if w, g :=3D test.output, b.String(); w !=
=3D g {
> > > >> ++                              t.Fatalf("%s: escaped output for
> pointer: want\n\t%q\ngot\n\t%q", test.name, w, g)
> > > >> ++                      }
> > > >> ++                      if tmpl.Tree !=3D tmpl.text.Tree {
> > > >> ++                              t.Fatalf("%s: tree mismatch",
> test.name)
> > > >> ++                      }
> > > >> ++              })
> > > >> +       }
> > > >> + }
> > > >> +
> > > >> +@@ -936,6 +932,10 @@ func TestErrors(t *testing.T) {
> > > >> +                       "{{range .Items}}<a{{if .X}}{{end}}>{{if
> .X}}{{break}}{{end}}{{end}}",
> > > >> +                       "",
> > > >> +               },
> > > >> ++              {
> > > >> ++                      "<script>var a =3D `${a+b}`</script>`",
> > > >> ++                      "",
> > > >> ++              },
> > > >> +               // Error cases.
> > > >> +               {
> > > >> +                       "{{if .Cond}}<a{{end}}",
> > > >> +@@ -1082,6 +1082,10 @@ func TestErrors(t *testing.T) {
> > > >> +                       // html is allowed since it is the last
> command in the pipeline, but urlquery is not.
> > > >> +                       `predefined escaper "urlquery" disallowed
> in template`,
> > > >> +               },
> > > >> ++              {
> > > >> ++                      "<script>var tmpl =3D `asd {{.}}`;</script=
>",
> > > >> ++                      `{{.}} appears in a JS template literal`,
> > > >> ++              },
> > > >> +       }
> > > >> +       for _, test :=3D range tests {
> > > >> +               buf :=3D new(bytes.Buffer)
> > > >> +@@ -1304,6 +1308,10 @@ func TestEscapeText(t *testing.T) {
> > > >> +                       context{state: stateJSSqStr, delim:
> delimDoubleQuote, attr: attrScript},
> > > >> +               },
> > > >> +               {
> > > >> ++                      "<a onclick=3D\"`foo",
> > > >> ++                      context{state: stateJSBqStr, delim:
> delimDoubleQuote, attr: attrScript},
> > > >> ++              },
> > > >> ++              {
> > > >> +                       `<A ONCLICK=3D"'`,
> > > >> +                       context{state: stateJSSqStr, delim:
> delimDoubleQuote, attr: attrScript},
> > > >> +               },
> > > >>  diff --git a/src/html/template/js.go b/src/html/template/js.go
> > > >>  index ea9c183..b888eaf 100644
> > > >>  --- a/src/html/template/js.go
> > > >> @@ -145,6 +246,19 @@ index ea9c183..b888eaf 100644
> > > >>         '+':  `\u002b`,
> > > >>         '/':  `\/`,
> > > >>         '<':  `\u003c`,
> > > >> +diff --git a/src/html/template/js_test.go
> b/src/html/template/js_test.go
> > > >> +index d7ee47b..7d963ae 100644
> > > >> +--- a/src/html/template/js_test.go
> > > >> ++++ b/src/html/template/js_test.go
> > > >> +@@ -292,7 +292,7 @@ func
> TestEscapersOnLower7AndSelectHighCodepoints(t *testing.T) {
> > > >> +                               `0123456789:;\u003c=3D\u003e?` +
> > > >> +                               `@ABCDEFGHIJKLMNO` +
> > > >> +                               `PQRSTUVWXYZ[\\]^_` +
> > > >> +-                              "`abcdefghijklmno" +
> > > >> ++                              "\\u0060abcdefghijklmno" +
> > > >> +                               "pqrstuvwxyz{|}~\u007f" +
> > > >> +
>  "\u00A0\u0100\\u2028\\u2029\ufeff\U0001D11E",
> > > >> +               },
> > > >>  diff --git a/src/html/template/jsctx_string.go
> b/src/html/template/jsctx_string.go
> > > >>  index dd1d87e..2394893 100644
> > > >>  --- a/src/html/template/jsctx_string.go
> > > >> @@ -165,6 +279,55 @@ index dd1d87e..2394893 100644
> > > >>   const _jsCtx_name =3D "jsCtxRegexpjsCtxDivOpjsCtxUnknown"
> > > >>
> > > >>   var _jsCtx_index =3D [...]uint8{0, 11, 21, 33}
> > > >> +diff --git a/src/html/template/state_string.go
> b/src/html/template/state_string.go
> > > >> +index 05104be..6fb1a6e 100644
> > > >> +--- a/src/html/template/state_string.go
> > > >> ++++ b/src/html/template/state_string.go
> > > >> +@@ -4,9 +4,42 @@ package template
> > > >> +
> > > >> + import "strconv"
> > > >> +
> > > >> +-const _state_name =3D
> "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmt=
stateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstate=
JSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateCSSDqStrstateCSSSqStrstat=
eCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateError"
> > > >> ++func _() {
> > > >> ++      // An "invalid array index" compiler error signifies that
> the constant values have changed.
> > > >> ++      // Re-run the stringer command to generate them again.
> > > >> ++      var x [1]struct{}
> > > >> ++      _ =3D x[stateText-0]
> > > >> ++      _ =3D x[stateTag-1]
> > > >> ++      _ =3D x[stateAttrName-2]
> > > >> ++      _ =3D x[stateAfterName-3]
> > > >> ++      _ =3D x[stateBeforeValue-4]
> > > >> ++      _ =3D x[stateHTMLCmt-5]
> > > >> ++      _ =3D x[stateRCDATA-6]
> > > >> ++      _ =3D x[stateAttr-7]
> > > >> ++      _ =3D x[stateURL-8]
> > > >> ++      _ =3D x[stateSrcset-9]
> > > >> ++      _ =3D x[stateJS-10]
> > > >> ++      _ =3D x[stateJSDqStr-11]
> > > >> ++      _ =3D x[stateJSSqStr-12]
> > > >> ++      _ =3D x[stateJSBqStr-13]
> > > >> ++      _ =3D x[stateJSRegexp-14]
> > > >> ++      _ =3D x[stateJSBlockCmt-15]
> > > >> ++      _ =3D x[stateJSLineCmt-16]
> > > >> ++      _ =3D x[stateCSS-17]
> > > >> ++      _ =3D x[stateCSSDqStr-18]
> > > >> ++      _ =3D x[stateCSSSqStr-19]
> > > >> ++      _ =3D x[stateCSSDqURL-20]
> > > >> ++      _ =3D x[stateCSSSqURL-21]
> > > >> ++      _ =3D x[stateCSSURL-22]
> > > >> ++      _ =3D x[stateCSSBlockCmt-23]
> > > >> ++      _ =3D x[stateCSSLineCmt-24]
> > > >> ++      _ =3D x[stateError-25]
> > > >> ++      _ =3D x[stateDead-26]
> > > >> ++}
> > > >> ++
> > > >> ++const _state_name =3D
> "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmt=
stateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstate=
JSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateCSSDqStrstate=
CSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCm=
tstateErrorstateDead"
> > > >> +
> > > >> +-var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 9=
2,
> 100, 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 244, 255, 271=
,
> 286, 296}
> > > >> ++var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 9=
2,
> 100, 111, 118, 130, 142, 154, 167, 182, 196, 204, 217, 230, 243, 256, 267=
,
> 283, 298, 308, 317}
> > > >> +
> > > >> + func (i state) String() string {
> > > >> +       if i >=3D state(len(_state_index)-1) {
> > > >>  diff --git a/src/html/template/transition.go
> b/src/html/template/transition.go
> > > >>  index 06df679..92eb351 100644
> > > >>  --- a/src/html/template/transition.go
> > > >> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
> > > >> index 20e70c0485..00def8fcda 100644
> > > >> --- a/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
> > > >> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
> > > >> @@ -34,9 +34,9 @@ Signed-off-by: Siddharth Doshi <sdoshi@mvista.co=
m
> >
> > > >>   src/html/template/context.go      |  6 ++-
> > > >>   src/html/template/escape.go       |  5 +-
> > > >>   src/html/template/escape_test.go  | 10 ++++
> > > >> - src/html/template/state_string.go |  4 +-
> > > >> + src/html/template/state_string.go | 26 +++++-----
> > > >>   src/html/template/transition.go   | 80
> ++++++++++++++++++++-----------
> > > >> - 5 files changed, 72 insertions(+), 33 deletions(-)
> > > >> + 5 files changed, 84 insertions(+), 43 deletions(-)
> > > >>
> > > >>  diff --git a/src/html/template/context.go
> b/src/html/template/context.go
> > > >>  index 0b65313..4eb7891 100644
> > > >> @@ -105,14 +105,38 @@ diff --git
> a/src/html/template/state_string.go b/src/html/template/state_string.
> > > >>  index 05104be..b5cfe70 100644
> > > >>  --- a/src/html/template/state_string.go
> > > >>  +++ b/src/html/template/state_string.go
> > > >> -@@ -4,9 +4,9 @@ package template
> > > >> -
> > > >> - import "strconv"
> > > >> +@@ -25,21 +25,23 @@ func _() {
> > > >> +       _ =3D x[stateJSRegexp-14]
> > > >> +       _ =3D x[stateJSBlockCmt-15]
> > > >> +       _ =3D x[stateJSLineCmt-16]
> > > >> +-      _ =3D x[stateCSS-17]
> > > >> +-      _ =3D x[stateCSSDqStr-18]
> > > >> +-      _ =3D x[stateCSSSqStr-19]
> > > >> +-      _ =3D x[stateCSSDqURL-20]
> > > >> +-      _ =3D x[stateCSSSqURL-21]
> > > >> +-      _ =3D x[stateCSSURL-22]
> > > >> +-      _ =3D x[stateCSSBlockCmt-23]
> > > >> +-      _ =3D x[stateCSSLineCmt-24]
> > > >> +-      _ =3D x[stateError-25]
> > > >> +-      _ =3D x[stateDead-26]
> > > >> ++      _ =3D x[stateJSHTMLOpenCmt-17]
> > > >> ++      _ =3D x[stateJSHTMLCloseCmt-18]
> > > >> ++      _ =3D x[stateCSS-19]
> > > >> ++      _ =3D x[stateCSSDqStr-20]
> > > >> ++      _ =3D x[stateCSSSqStr-21]
> > > >> ++      _ =3D x[stateCSSDqURL-22]
> > > >> ++      _ =3D x[stateCSSSqURL-23]
> > > >> ++      _ =3D x[stateCSSURL-24]
> > > >> ++      _ =3D x[stateCSSBlockCmt-25]
> > > >> ++      _ =3D x[stateCSSLineCmt-26]
> > > >> ++      _ =3D x[stateError-27]
> > > >> ++      _ =3D x[stateDead-28]
> > > >> + }
> > > >>
> > > >> --const _state_name =3D
> "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmt=
stateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstate=
JSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateCSSDqStrstateCSSSqStrstat=
eCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateError"
> > > >> +-const _state_name =3D
> "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmt=
stateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstate=
JSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateCSSDqStrstate=
CSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCm=
tstateErrorstateDead"
> > > >>  +const _state_name =3D
> "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmt=
stateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstate=
JSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateJSHTMLOpenCmtstateJSH=
TMLCloseCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstat=
eCSSURLstateCSSBlockCmtstateCSSLineCmtstateErrorstateDead"
> > > >>
> > > >> --var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 9=
2,
> 100, 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 244, 255, 271=
,
> 286, 296}
> > > >> +-var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 9=
2,
> 100, 111, 118, 130, 142, 154, 167, 182, 196, 204, 217, 230, 243, 256, 267=
,
> 283, 298, 308, 317}
> > > >>  +var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 9=
2,
> 100, 111, 118, 130, 142, 154, 167, 182, 196, 214, 233, 241, 254, 267, 280=
,
> 293, 304, 320, 335, 345, 354}
> > > >>
> > > >>   func (i state) String() string {
> > > >> --
> > > >> 2.42.0
> > > >>
>

--000000000000d432a70606846e7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Steve,<div><br></div><div>Sorry!! There was an issue in=
 my .gitconfig. I have sent v3 for both the branches which generated list i=
ds as follow:</div><div>kirkstone:=C2=A0<a href=3D"https://lists.openembedd=
ed.org/g/openembedded-core/message/188413">https://lists.openembedded.org/g=
/openembedded-core/message/188413</a></div><div>dunfell:=C2=A0<a href=3D"ht=
tps://lists.openembedded.org/g/openembedded-core/message/188415">https://li=
sts.openembedded.org/g/openembedded-core/message/188415</a></div><div><br><=
/div><div>Thanks,</div><div>Shubham Kulkarni</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 30, 2023 at 1=
2:53=E2=80=AFAM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">stev=
e@sakoman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Fri, Sep 29, 2023 at 9:22=E2=80=AFAM Steve Sakoman &lt;<a h=
ref=3D"mailto:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt=
; wrote:<br>
&gt;<br>
&gt; On Fri, Sep 29, 2023 at 9:20=E2=80=AFAM Steve Sakoman &lt;<a href=3D"m=
ailto:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; wrote:=
<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Sep 29, 2023 at 9:06=E2=80=AFAM Shubham Kulkarni &lt;<a h=
ref=3D"mailto:skulkarni@mvista.com" target=3D"_blank">skulkarni@mvista.com<=
/a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi Steve,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Can you please check, if you are able to get these patches I=
 sent for the Kirkstone &amp; Dunfell branch.<br>
&gt; &gt; &gt; It is not generating the group links/Topic id links like <a =
href=3D"https://lists.openembedded.org/g/openembedded-devel/message/" rel=
=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/openembe=
dded-devel/message/</a>.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I have sent a v2 version for both the dunfell and kirkstone,=
 but still it didn&#39;t generate the links.<br>
&gt; &gt; &gt; If you are able to get these patches, you can take either or=
iginal or v2 for both Dunfell and Kirkstone. Both v1 &amp; v2 are the same,=
 just resent for link generation. Apologies for the inconvenience caused.<b=
r>
&gt; &gt;<br>
&gt; &gt; No, I&#39;m not seeing these on the list :-(<br>
&gt;<br>
&gt; Actually the kirsktone arrived just after sent this email!<br>
<br>
And now the dunfell version too.<br>
<br>
Steve<br>
<br>
&gt; &gt; &gt; On Sat, Sep 30, 2023 at 12:23=E2=80=AFAM Shubham Kulkarni &l=
t;<a href=3D"mailto:skulkarni@mvista.com" target=3D"_blank">skulkarni@mvist=
a.com</a>&gt; wrote:<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; From: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@m=
vista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Add missing files in fix for CVE-2023-24538 &amp; CVE-20=
23-39318<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Upstream Link -<br>
&gt; &gt; &gt;&gt; CVE-2023-24538: <a href=3D"https://github.com/golang/go/=
commit/b1e3ecfa06b67014429a197ec5e134ce4303ad9b" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/golang/go/commit/b1e3ecfa06b67014429a197ec5e=
134ce4303ad9b</a><br>
&gt; &gt; &gt;&gt; CVE-2023-39318: <a href=3D"https://github.com/golang/go/=
commit/023b542edf38e2a1f87fcefb9f75ff2f99401b4c" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/golang/go/commit/023b542edf38e2a1f87fcefb9f7=
5ff2f99401b4c</a><br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:sk=
ulkarni@mvista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt; &gt; &gt;&gt; ---<br>
&gt; &gt; &gt;&gt;=C2=A0 meta/recipes-devtools/go/go-1.14.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
&gt; &gt; &gt;&gt;=C2=A0 .../go/go-1.14/CVE-2023-24538-1.patch=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt; &gt; &gt;&gt;=C2=A0 .../go/go-1.14/CVE-2023-24538-2.patch=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 447 ++++++++++++-<br>
&gt; &gt; &gt;&gt;=C2=A0 .../go/go-1.14/CVE-2023-24538_3.patch=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 393 ++++++++++++<br>
&gt; &gt; &gt;&gt;=C2=A0 .../go/go-1.14/CVE-2023-24538_4.patch=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 497 +++++++++++++++<br>
&gt; &gt; &gt;&gt;=C2=A0 .../go/go-1.14/CVE-2023-24538_5.patch=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 585 ++++++++++++++++++<br>
&gt; &gt; &gt;&gt;=C2=A0 ...3-24538-3.patch =3D&gt; CVE-2023-24538_6.patch}=
 | 175 +++++-<br>
&gt; &gt; &gt;&gt;=C2=A0 .../go/go-1.14/CVE-2023-39318.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 38 +-<br>
&gt; &gt; &gt;&gt;=C2=A0 8 files changed, 2124 insertions(+), 20 deletions(=
-)<br>
&gt; &gt; &gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go-1.1=
4/CVE-2023-24538_3.patch<br>
&gt; &gt; &gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go-1.1=
4/CVE-2023-24538_4.patch<br>
&gt; &gt; &gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go-1.1=
4/CVE-2023-24538_5.patch<br>
&gt; &gt; &gt;&gt;=C2=A0 rename meta/recipes-devtools/go/go-1.14/{CVE-2023-=
24538-3.patch =3D&gt; CVE-2023-24538_6.patch} (53%)<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta=
/recipes-devtools/go/go-1.14.inc<br>
&gt; &gt; &gt;&gt; index be63f64825..091b778de8 100644<br>
&gt; &gt; &gt;&gt; --- a/meta/recipes-devtools/go/go-1.14.inc<br>
&gt; &gt; &gt;&gt; +++ b/meta/recipes-devtools/go/go-1.14.inc<br>
&gt; &gt; &gt;&gt; @@ -60,7 +60,10 @@ SRC_URI +=3D &quot;\<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2023-24534.patch \<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2023-24538-1.patch \<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2023-24538-2.patch \<br>
&gt; &gt; &gt;&gt; -=C2=A0 =C2=A0 file://CVE-2023-24538-3.patch \<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 file://CVE-2023-24538_3.patch \<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 file://CVE-2023-24538_4.patch \<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 file://CVE-2023-24538_5.patch \<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 file://CVE-2023-24538_6.patch \<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2023-24539.patch \<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2023-24540.patch \<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2023-29405-1.patch \<br>
&gt; &gt; &gt;&gt; diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-2=
4538-1.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch<br>
&gt; &gt; &gt;&gt; index eda26e5ff6..23c5075e41 100644<br>
&gt; &gt; &gt;&gt; --- a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.=
patch<br>
&gt; &gt; &gt;&gt; +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.=
patch<br>
&gt; &gt; &gt;&gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; &gt;&gt;=C2=A0 From 8acd01094d9ee17f6e763a61e49a8a808b3a9ddb Mon =
Sep 17 00:00:00 2001<br>
&gt; &gt; &gt;&gt;=C2=A0 From: Brad Fitzpatrick &lt;<a href=3D"mailto:bradf=
itz@golang.org" target=3D"_blank">bradfitz@golang.org</a>&gt;<br>
&gt; &gt; &gt;&gt;=C2=A0 Date: Mon, 2 Aug 2021 14:55:51 -0700<br>
&gt; &gt; &gt;&gt; -Subject: [PATCH 1/3] net/netip: add new IP address pack=
age<br>
&gt; &gt; &gt;&gt; +Subject: [PATCH 1/6] net/netip: add new IP address pack=
age<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;=C2=A0 Co-authored-by: Alex Willmer &lt;<a href=3D"mailto=
:alex@moreati.org.uk" target=3D"_blank">alex@moreati.org.uk</a>&gt; (GitHub=
 @moreati)<br>
&gt; &gt; &gt;&gt;=C2=A0 Co-authored-by: Alexander Yastrebov &lt;<a href=3D=
"mailto:yastrebov.alex@gmail.com" target=3D"_blank">yastrebov.alex@gmail.co=
m</a>&gt;<br>
&gt; &gt; &gt;&gt; @@ -31,7 +31,7 @@ Trust: Brad Fitzpatrick &lt;<a href=3D=
"mailto:bradfitz@golang.org" target=3D"_blank">bradfitz@golang.org</a>&gt;<=
br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;=C2=A0 Dependency Patch #1<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; -Upstream-Status: Backport [<a href=3D"https://github.co=
m/golang/go/commit/a59e33224e42d60a97fa720a45e1b74eb6aaa3d0" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/golang/go/commit/a59e33224e42d60a=
97fa720a45e1b74eb6aaa3d0</a>]<br>
&gt; &gt; &gt;&gt; +Upstream-Status: Backport from <a href=3D"https://githu=
b.com/golang/go/commit/a59e33224e42d60a97fa720a45e1b74eb6aaa3d0" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/golang/go/commit/a59e33224e42=
d60a97fa720a45e1b74eb6aaa3d0</a><br>
&gt; &gt; &gt;&gt;=C2=A0 CVE: CVE-2023-24538<br>
&gt; &gt; &gt;&gt;=C2=A0 Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mai=
lto:skulkarni@mvista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br=
>
&gt; &gt; &gt;&gt;=C2=A0 ---<br>
&gt; &gt; &gt;&gt; diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-2=
4538-2.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch<br>
&gt; &gt; &gt;&gt; index 5036f2890b..3840617a32 100644<br>
&gt; &gt; &gt;&gt; --- a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.=
patch<br>
&gt; &gt; &gt;&gt; +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.=
patch<br>
&gt; &gt; &gt;&gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; &gt;&gt;=C2=A0 From 6fc21505614f36178df0dad7034b6b8e3f7588d5 Mon =
Sep 17 00:00:00 2001<br>
&gt; &gt; &gt;&gt;=C2=A0 From: empijei &lt;<a href=3D"mailto:robclap8@gmail=
.com" target=3D"_blank">robclap8@gmail.com</a>&gt;<br>
&gt; &gt; &gt;&gt;=C2=A0 Date: Fri, 27 Mar 2020 19:27:55 +0100<br>
&gt; &gt; &gt;&gt; -Subject: [PATCH 2/3] html/template,text/template: switc=
h to Unicode escapes<br>
&gt; &gt; &gt;&gt; +Subject: [PATCH 2/6] html/template,text/template: switc=
h to Unicode escapes<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0for JSON compatibility<br>
&gt; &gt; &gt;&gt;=C2=A0 MIME-Version: 1.0<br>
&gt; &gt; &gt;&gt;=C2=A0 Content-Type: text/plain; charset=3DUTF-8<br>
&gt; &gt; &gt;&gt; @@ -31,10 +31,238 @@ Upstream-Status: Backport from <a h=
ref=3D"https://github.com/golang/go/commit/d4d298040d072" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/golang/go/commit/d4d298040d072</a><b=
r>
&gt; &gt; &gt;&gt;=C2=A0 CVE: CVE-2023-24538<br>
&gt; &gt; &gt;&gt;=C2=A0 Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mai=
lto:skulkarni@mvista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br=
>
&gt; &gt; &gt;&gt;=C2=A0 ---<br>
&gt; &gt; &gt;&gt; - src/html/template/js.go=C2=A0 =C2=A0 | 70 ++++++++++++=
+++++++++++++++-------------------<br>
&gt; &gt; &gt;&gt; - src/text/template/funcs.go |=C2=A0 8 +++---<br>
&gt; &gt; &gt;&gt; - 2 files changed, 46 insertions(+), 32 deletions(-)<br>
&gt; &gt; &gt;&gt; + src/html/template/content_test.go=C2=A0 | 70 +++++++++=
++++++++++-------------------<br>
&gt; &gt; &gt;&gt; + src/html/template/escape_test.go=C2=A0 =C2=A0|=C2=A0 6=
 ++--<br>
&gt; &gt; &gt;&gt; + src/html/template/example_test.go=C2=A0 |=C2=A0 6 ++--=
<br>
&gt; &gt; &gt;&gt; + src/html/template/js.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 70 +++++++++++++++++++++++---------------<br>
&gt; &gt; &gt;&gt; + src/html/template/js_test.go=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 68 ++++++++++++++++++------------------<br>
&gt; &gt; &gt;&gt; + src/html/template/template_test.go | 39 ++++++++++++++=
+++++++<br>
&gt; &gt; &gt;&gt; + src/text/template/exec_test.go=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 6 ++--<br>
&gt; &gt; &gt;&gt; + src/text/template/funcs.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 8 ++---<br>
&gt; &gt; &gt;&gt; + 8 files changed, 163 insertions(+), 110 deletions(-)<b=
r>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; +diff --git a/src/html/template/content_test.go b/src/ht=
ml/template/content_test.go<br>
&gt; &gt; &gt;&gt; +index 72d56f5..bd86527 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/html/template/content_test.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/html/template/content_test.go<br>
&gt; &gt; &gt;&gt; +@@ -18,7 +18,7 @@ func TestTypedContent(t *testing.T) {=
<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
HTML(`Hello, &lt;b&gt;World&lt;/b&gt; &amp;amp;tc!`),<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
HTMLAttr(` dir=3D&quot;ltr&quot;`),<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
JS(`c &amp;&amp; alert(&quot;Hello, World!&quot;);`),<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 JSStr=
(`Hello, World &amp; O&#39;Reilly\x21`),<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 JSStr=
(`Hello, World &amp; O&#39;Reilly\u0021`),<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
URL(`greeting=3DH%69,&amp;addressee=3D(World)`),<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
Srcset(`greeting=3DH%69,&amp;addressee=3D(World) 2x, <a href=3D"https://gol=
ang.org/favicon.ico" rel=3D"noreferrer" target=3D"_blank">https://golang.or=
g/favicon.ico</a> 500.5w`),<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
URL(`,foo/,`),<br>
&gt; &gt; &gt;&gt; +@@ -70,7 +70,7 @@ func TestTypedContent(t *testing.T) {=
<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`Hello, &lt;b&gt;Wo=
rld&lt;/b&gt; &amp;amp;tc!`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0` dir=3D&amp;#34;lt=
r&amp;#34;`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c &amp;amp;&amp;am=
p; alert(&amp;#34;Hello, World!&amp;#34;);`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp=
; O&amp;#39;Reilly\x21`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp=
; O&amp;#39;Reilly\u0021`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&a=
mp;amp;addressee=3D(World)`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&a=
mp;amp;addressee=3D(World) 2x, <a href=3D"https://golang.org/favicon.ico" r=
el=3D"noreferrer" target=3D"_blank">https://golang.org/favicon.ico</a> 500.=
5w`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo/,`,<br>
&gt; &gt; &gt;&gt; +@@ -100,7 +100,7 @@ func TestTypedContent(t *testing.T)=
 {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`Hello,&amp;#32;Wor=
ld&amp;#32;&amp;amp;tc!`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&amp;#32;dir&amp;#=
61;&amp;#34;ltr&amp;#34;`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c&amp;#32;&amp;amp=
;&amp;amp;&amp;#32;alert(&amp;#34;Hello,&amp;#32;World!&amp;#34;);`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello,&amp;#32;World&=
amp;#32;&amp;amp;&amp;#32;O&amp;#39;Reilly\x21`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello,&amp;#32;World&=
amp;#32;&amp;amp;&amp;#32;O&amp;#39;Reilly\u0021`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting&amp;#61;H=
%69,&amp;amp;addressee&amp;#61;(World)`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting&amp;#61;H=
%69,&amp;amp;addressee&amp;#61;(World)&amp;#32;2x,&amp;#32;<a href=3D"https=
://golang.org/favicon.ico&amp;#32;500.5w" rel=3D"noreferrer" target=3D"_bla=
nk">https://golang.org/favicon.ico&amp;#32;500.5w`</a>,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo/,`,<br>
&gt; &gt; &gt;&gt; +@@ -115,7 +115,7 @@ func TestTypedContent(t *testing.T)=
 {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`Hello, World &amp;=
amp;tc!`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0` dir=3D&amp;#34;lt=
r&amp;#34;`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c &amp;amp;&amp;am=
p; alert(&amp;#34;Hello, World!&amp;#34;);`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp=
; O&amp;#39;Reilly\x21`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp=
; O&amp;#39;Reilly\u0021`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&a=
mp;amp;addressee=3D(World)`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&a=
mp;amp;addressee=3D(World) 2x, <a href=3D"https://golang.org/favicon.ico" r=
el=3D"noreferrer" target=3D"_blank">https://golang.org/favicon.ico</a> 500.=
5w`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo/,`,<br>
&gt; &gt; &gt;&gt; +@@ -130,7 +130,7 @@ func TestTypedContent(t *testing.T)=
 {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`Hello, &amp;lt;b&a=
mp;gt;World&amp;lt;/b&amp;gt; &amp;amp;tc!`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0` dir=3D&amp;#34;lt=
r&amp;#34;`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c &amp;amp;&amp;am=
p; alert(&amp;#34;Hello, World!&amp;#34;);`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp=
; O&amp;#39;Reilly\x21`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp=
; O&amp;#39;Reilly\u0021`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&a=
mp;amp;addressee=3D(World)`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&a=
mp;amp;addressee=3D(World) 2x, <a href=3D"https://golang.org/favicon.ico" r=
el=3D"noreferrer" target=3D"_blank">https://golang.org/favicon.ico</a> 500.=
5w`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo/,`,<br>
&gt; &gt; &gt;&gt; +@@ -146,7 +146,7 @@ func TestTypedContent(t *testing.T)=
 {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Not escaped.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c &amp;&amp; alert=
(&quot;Hello, World!&quot;);`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Escape sequence =
not over-escaped.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `&quot;Hello, World &a=
mp; O&#39;Reilly\x21&quot;`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `&quot;Hello, World &a=
mp; O&#39;Reilly\u0021&quot;`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&quot;greeting=3DH=
%69,\u0026addressee=3D(World)&quot;`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&quot;greeting=3DH=
%69,\u0026addressee=3D(World) 2x, <a href=3D"https://golang.org/favicon.ico=
" rel=3D"noreferrer" target=3D"_blank">https://golang.org/favicon.ico</a> 5=
00.5w&quot;`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&quot;,foo/,&quot;=
`,<br>
&gt; &gt; &gt;&gt; +@@ -162,7 +162,7 @@ func TestTypedContent(t *testing.T)=
 {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Not JS escaped b=
ut HTML escaped.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c &amp;amp;&amp;am=
p; alert(&amp;#34;Hello, World!&amp;#34;);`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Escape sequence =
not over-escaped.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `&amp;#34;Hello, World=
 &amp;amp; O&amp;#39;Reilly\x21&amp;#34;`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `&amp;#34;Hello, World=
 &amp;amp; O&amp;#39;Reilly\u0021&amp;#34;`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&amp;#34;greeting=
=3DH%69,\u0026addressee=3D(World)&amp;#34;`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&amp;#34;greeting=
=3DH%69,\u0026addressee=3D(World) 2x, <a href=3D"https://golang.org/favicon=
.ico" rel=3D"noreferrer" target=3D"_blank">https://golang.org/favicon.ico</=
a> 500.5w&amp;#34;`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&amp;#34;,foo/,&am=
p;#34;`,<br>
&gt; &gt; &gt;&gt; +@@ -171,30 +171,30 @@ func TestTypedContent(t *testing.=
T) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&lt;script&gt;alert(&quot;{{.}}&quot;)&lt;/scr=
ipt&gt;`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0[]string{<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\x3cb\x3e \x22foo%\x2=
2 O\x27Reilly \x26bar;`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `a[href =3D~ \x22\/\/<=
a href=3D"http://example.com" rel=3D"noreferrer" target=3D"_blank">example.=
com</a>\x22]#foo`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, \x3cb\x3eWorld=
\x3c\/b\x3e \x26amp;tc!`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` dir=3D\x22ltr\x22`,<=
br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `c \x26\x26 alert(\x22=
Hello, World!\x22);`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u003cb\u003e \u0022f=
oo%\u0022 O\u0027Reilly \u0026bar;`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `a[href =3D~ \u0022\/\=
/<a href=3D"http://example.com" rel=3D"noreferrer" target=3D"_blank">exampl=
e.com</a>\u0022]#foo`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, \u003cb\u003eW=
orld\u003c\/b\u003e \u0026amp;tc!`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` dir=3D\u0022ltr\u002=
2`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `c \u0026\u0026 alert(=
\u0022Hello, World!\u0022);`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Escape sequence =
not over-escaped.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World \x26 O\x=
27Reilly\x21`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\x26a=
ddressee=3D(World)`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\x26a=
ddressee=3D(World) 2x, https:\/\/<a href=3D"http://golang.org" rel=3D"noref=
errer" target=3D"_blank">golang.org</a>\/favicon.ico 500.5w`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World \u0026 O=
\u0027Reilly\u0021`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\u002=
6addressee=3D(World)`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\u002=
6addressee=3D(World) 2x, https:\/\/<a href=3D"http://golang.org" rel=3D"nor=
eferrer" target=3D"_blank">golang.org</a>\/favicon.ico 500.5w`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo\/,`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&lt;script type=3D&quot;text/javascript&quot;&=
gt;alert(&quot;{{.}}&quot;)&lt;/script&gt;`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0[]string{<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\x3cb\x3e \x22foo%\x2=
2 O\x27Reilly \x26bar;`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `a[href =3D~ \x22\/\/<=
a href=3D"http://example.com" rel=3D"noreferrer" target=3D"_blank">example.=
com</a>\x22]#foo`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, \x3cb\x3eWorld=
\x3c\/b\x3e \x26amp;tc!`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` dir=3D\x22ltr\x22`,<=
br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `c \x26\x26 alert(\x22=
Hello, World!\x22);`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u003cb\u003e \u0022f=
oo%\u0022 O\u0027Reilly \u0026bar;`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `a[href =3D~ \u0022\/\=
/<a href=3D"http://example.com" rel=3D"noreferrer" target=3D"_blank">exampl=
e.com</a>\u0022]#foo`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, \u003cb\u003eW=
orld\u003c\/b\u003e \u0026amp;tc!`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` dir=3D\u0022ltr\u002=
2`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `c \u0026\u0026 alert(=
\u0022Hello, World!\u0022);`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Escape sequence =
not over-escaped.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World \x26 O\x=
27Reilly\x21`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\x26a=
ddressee=3D(World)`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\x26a=
ddressee=3D(World) 2x, https:\/\/<a href=3D"http://golang.org" rel=3D"noref=
errer" target=3D"_blank">golang.org</a>\/favicon.ico 500.5w`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World \u0026 O=
\u0027Reilly\u0021`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\u002=
6addressee=3D(World)`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\u002=
6addressee=3D(World) 2x, https:\/\/<a href=3D"http://golang.org" rel=3D"nor=
eferrer" target=3D"_blank">golang.org</a>\/favicon.ico 500.5w`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo\/,`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
},<br>
&gt; &gt; &gt;&gt; +@@ -208,7 +208,7 @@ func TestTypedContent(t *testing.T)=
 {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Not escaped.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c &amp;&amp; alert=
(&quot;Hello, World!&quot;);`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Escape sequence =
not over-escaped.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `&quot;Hello, World &a=
mp; O&#39;Reilly\x21&quot;`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `&quot;Hello, World &a=
mp; O&#39;Reilly\u0021&quot;`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&quot;greeting=3DH=
%69,\u0026addressee=3D(World)&quot;`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&quot;greeting=3DH=
%69,\u0026addressee=3D(World) 2x, <a href=3D"https://golang.org/favicon.ico=
" rel=3D"noreferrer" target=3D"_blank">https://golang.org/favicon.ico</a> 5=
00.5w&quot;`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&quot;,foo/,&quot;=
`,<br>
&gt; &gt; &gt;&gt; +@@ -224,7 +224,7 @@ func TestTypedContent(t *testing.T)=
 {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`Hello, &lt;b&gt;Wo=
rld&lt;/b&gt; &amp;amp;tc!`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0` dir=3D&amp;#34;lt=
r&amp;#34;`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c &amp;amp;&amp;am=
p; alert(&amp;#34;Hello, World!&amp;#34;);`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp=
; O&amp;#39;Reilly\x21`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp=
; O&amp;#39;Reilly\u0021`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&a=
mp;amp;addressee=3D(World)`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&a=
mp;amp;addressee=3D(World) 2x, <a href=3D"https://golang.org/favicon.ico" r=
el=3D"noreferrer" target=3D"_blank">https://golang.org/favicon.ico</a> 500.=
5w`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo/,`,<br>
&gt; &gt; &gt;&gt; +@@ -233,15 +233,15 @@ func TestTypedContent(t *testing.=
T) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&lt;button onclick=3D&#39;alert(&quot;{{.}}&qu=
ot;)&#39;&gt;`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0[]string{<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\x3cb\x3e \x22foo%\x2=
2 O\x27Reilly \x26bar;`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `a[href =3D~ \x22\/\/<=
a href=3D"http://example.com" rel=3D"noreferrer" target=3D"_blank">example.=
com</a>\x22]#foo`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, \x3cb\x3eWorld=
\x3c\/b\x3e \x26amp;tc!`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` dir=3D\x22ltr\x22`,<=
br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `c \x26\x26 alert(\x22=
Hello, World!\x22);`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u003cb\u003e \u0022f=
oo%\u0022 O\u0027Reilly \u0026bar;`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `a[href =3D~ \u0022\/\=
/<a href=3D"http://example.com" rel=3D"noreferrer" target=3D"_blank">exampl=
e.com</a>\u0022]#foo`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, \u003cb\u003eW=
orld\u003c\/b\u003e \u0026amp;tc!`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` dir=3D\u0022ltr\u002=
2`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `c \u0026\u0026 alert(=
\u0022Hello, World!\u0022);`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Escape sequence =
not over-escaped.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World \x26 O\x=
27Reilly\x21`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\x26a=
ddressee=3D(World)`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\x26a=
ddressee=3D(World) 2x, https:\/\/<a href=3D"http://golang.org" rel=3D"noref=
errer" target=3D"_blank">golang.org</a>\/favicon.ico 500.5w`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World \u0026 O=
\u0027Reilly\u0021`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\u002=
6addressee=3D(World)`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\u002=
6addressee=3D(World) 2x, https:\/\/<a href=3D"http://golang.org" rel=3D"nor=
eferrer" target=3D"_blank">golang.org</a>\/favicon.ico 500.5w`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo\/,`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
},<br>
&gt; &gt; &gt;&gt; +@@ -253,7 +253,7 @@ func TestTypedContent(t *testing.T)=
 {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`Hello%2c%20%3cb%3e=
World%3c%2fb%3e%20%26amp%3btc%21`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`%20dir%3d%22ltr%22=
`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c%20%26%26%20alert=
%28%22Hello%2c%20World%21%22%29%3b`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello%2c%20World%20%2=
6%20O%27Reilly%5cx21`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello%2c%20World%20%2=
6%20O%27Reilly%5cu0021`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Quotes and paren=
s are escaped but %69 is not over-escaped. HTML escaping is done.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&a=
mp;amp;addressee=3D%28World%29`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting%3dH%2569%=
2c%26addressee%3d%28World%29%202x%2c%20https%3a%2f%<a href=3D"http://2fgola=
ng.org" rel=3D"noreferrer" target=3D"_blank">2fgolang.org</a>%2ffavicon.ico=
%20500.5w`,<br>
&gt; &gt; &gt;&gt; +@@ -268,7 +268,7 @@ func TestTypedContent(t *testing.T)=
 {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`Hello%2c%20%3cb%3e=
World%3c%2fb%3e%20%26amp%3btc%21`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`%20dir%3d%22ltr%22=
`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c%20%26%26%20alert=
%28%22Hello%2c%20World%21%22%29%3b`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello%2c%20World%20%2=
6%20O%27Reilly%5cx21`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello%2c%20World%20%2=
6%20O%27Reilly%5cu0021`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Quotes and paren=
s are escaped but %69 is not over-escaped. HTML escaping is not done.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&a=
mp;addressee=3D%28World%29`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting%3dH%2569%=
2c%26addressee%3d%28World%29%202x%2c%20https%3a%2f%<a href=3D"http://2fgola=
ng.org" rel=3D"noreferrer" target=3D"_blank">2fgolang.org</a>%2ffavicon.ico=
%20500.5w`,<br>
&gt; &gt; &gt;&gt; +diff --git a/src/html/template/escape_test.go b/src/htm=
l/template/escape_test.go<br>
&gt; &gt; &gt;&gt; +index e72a9ba..c709660 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/html/template/escape_test.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/html/template/escape_test.go<br>
&gt; &gt; &gt;&gt; +@@ -238,7 +238,7 @@ func TestEscape(t *testing.T) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;jsStr&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&lt;button onclick=3D&#39;alert(&amp;quot=
;{{.H}}&amp;quot;)&#39;&gt;&quot;,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 `&lt;button onclick=3D&#39;alert(&amp;quot;\x3cHel=
lo\x3e&amp;quot;)&#39;&gt;`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 `&lt;button onclick=3D&#39;alert(&amp;quot;\u003cH=
ello\u003e&amp;quot;)&#39;&gt;`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;badMarshaler&quot;,<br>
&gt; &gt; &gt;&gt; +@@ -259,7 +259,7 @@ func TestEscape(t *testing.T) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;jsRe&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&lt;button onclick=3D&#39;alert(/{{&quot;foo+b=
ar&quot;}}/.test(&quot;&quot;))&#39;&gt;`,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 `&lt;button onclick=3D&#39;alert(/foo\x2bbar/.test=
(&quot;&quot;))&#39;&gt;`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 `&lt;button onclick=3D&#39;alert(/foo\u002bbar/.te=
st(&quot;&quot;))&#39;&gt;`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;jsReBlank&quot;,<br>
&gt; &gt; &gt;&gt; +@@ -825,7 +825,7 @@ func TestEscapeSet(t *testing.T) {<=
br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;main&quot;:=
=C2=A0 =C2=A0`&lt;button onclick=3D&quot;title=3D&#39;{{template &quot;help=
er&quot;}}&#39;; ...&quot;&gt;{{template &quot;helper&quot;}}&lt;/button&gt=
;`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;helper&quot;:=
 `{{11}} of {{&quot;&lt;100&gt;&quot;}}`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 `&lt;button onclick=3D&quot;title=3D&#39;11 of \x3=
c100\x3e&#39;; ...&quot;&gt;11 of &amp;lt;100&amp;gt;&lt;/button&gt;`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 `&lt;button onclick=3D&quot;title=3D&#39;11 of \u0=
03c100\u003e&#39;; ...&quot;&gt;11 of &amp;lt;100&amp;gt;&lt;/button&gt;`,<=
br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
// A non-recursive template that ends in a different context.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
// helper starts in jsCtxRegexp and ends in jsCtxDivOp.<br>
&gt; &gt; &gt;&gt; +diff --git a/src/html/template/example_test.go b/src/ht=
ml/template/example_test.go<br>
&gt; &gt; &gt;&gt; +index 9d965f1..6cf936f 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/html/template/example_test.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/html/template/example_test.go<br>
&gt; &gt; &gt;&gt; +@@ -116,9 +116,9 @@ func Example_escape() {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// &amp;#34;Fran &amp;amp; F=
reddie&amp;#39;s Diner&amp;#34; &amp;<a href=3D"mailto:lt%3Btasty@example.c=
om" target=3D"_blank">lt;tasty@example.com</a>&amp;gt;<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// &amp;#34;Fran &amp;amp; F=
reddie&amp;#39;s Diner&amp;#34; &amp;<a href=3D"mailto:lt%3Btasty@example.c=
om" target=3D"_blank">lt;tasty@example.com</a>&amp;gt;<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// &amp;#34;Fran &amp;amp; F=
reddie&amp;#39;s Diner&amp;#<a href=3D"mailto:34%3B32%26lt%3Btasty@example.=
com" target=3D"_blank">34;32&amp;lt;tasty@example.com</a>&amp;gt;<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 // \&quot;Fran \x26 Freddie\&#39;=
s Diner\&quot; \<a href=3D"mailto:x3Ctasty@example.com" target=3D"_blank">x=
3Ctasty@example.com</a>\x3E<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 // \&quot;Fran \x26 Freddie\&#39;=
s Diner\&quot; \<a href=3D"mailto:x3Ctasty@example.com" target=3D"_blank">x=
3Ctasty@example.com</a>\x3E<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 // \&quot;Fran \x26 Freddie\&#39;=
s Diner\&quot;32\<a href=3D"mailto:x3Ctasty@example.com" target=3D"_blank">=
x3Ctasty@example.com</a>\x3E<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // \&quot;Fran \u0026 Freddie\&#3=
9;s Diner\&quot; \<a href=3D"mailto:u003Ctasty@example.com" target=3D"_blan=
k">u003Ctasty@example.com</a>\u003E<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // \&quot;Fran \u0026 Freddie\&#3=
9;s Diner\&quot; \<a href=3D"mailto:u003Ctasty@example.com" target=3D"_blan=
k">u003Ctasty@example.com</a>\u003E<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // \&quot;Fran \u0026 Freddie\&#3=
9;s Diner\&quot;32\<a href=3D"mailto:u003Ctasty@example.com" target=3D"_bla=
nk">u003Ctasty@example.com</a>\u003E<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// %22Fran+%26+Freddie%27s+D=
iner%2232%3Ctasty%<a href=3D"http://40example.com" rel=3D"noreferrer" targe=
t=3D"_blank">40example.com</a>%3E<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt;=C2=A0 diff --git a/src/html/template/js.go b/src/html/te=
mplate/js.go<br>
&gt; &gt; &gt;&gt;=C2=A0 index 0e91458..ea9c183 100644<br>
&gt; &gt; &gt;&gt;=C2=A0 --- a/src/html/template/js.go<br>
&gt; &gt; &gt;&gt; @@ -173,6 +401,217 @@ index 0e91458..ea9c183 100644<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;?&#39;:=C2=A0 `\?`=
,<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;[&#39;:=C2=A0 `\[`=
,<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;\\&#39;: `\\`,<br>
&gt; &gt; &gt;&gt; +diff --git a/src/html/template/js_test.go b/src/html/te=
mplate/js_test.go<br>
&gt; &gt; &gt;&gt; +index 075adaa..d7ee47b 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/html/template/js_test.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/html/template/js_test.go<br>
&gt; &gt; &gt;&gt; +@@ -137,7 +137,7 @@ func TestJSValEscaper(t *testing.T)=
 {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;foo&quot;, `&quot;foo&quot;`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
// Newlines.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;\r\n\u2028\u2029&quot;, `&quot;\r\n\u2028\u2029&quot;`},<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // &q=
uot;\v&quot; =3D=3D &quot;v&quot; on IE 6 so use &quot;\x0b&quot; instead.<=
br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // &q=
uot;\v&quot; =3D=3D &quot;v&quot; on IE 6 so use &quot;\u000b&quot; instead=
.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;\t\x0b&quot;, `&quot;\t\u000b&quot;`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{struct{ X, Y int }{1, 2}, `{&quot;X&quot;:1,&quot;Y&quot;:2}`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{[]interface{}{}, &quot;[]&quot;},<br>
&gt; &gt; &gt;&gt; +@@ -173,7 +173,7 @@ func TestJSStrEscaper(t *testing.T)=
 {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;&quot;, ``},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;foo&quot;, `foo`},<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;\u0000&quot;, `\0`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;\u0000&quot;, `\u0000`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;\t&quot;, `\t`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;\n&quot;, `\n`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;\r&quot;, `\r`},<br>
&gt; &gt; &gt;&gt; +@@ -183,14 +183,14 @@ func TestJSStrEscaper(t *testing.=
T) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;\\n&quot;, `\\n`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;foo\r\nbar&quot;, `foo\r\nbar`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
// Preserve attribute boundaries.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&qu=
ot;`, `\x22`},<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&#3=
9;`, `\x27`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&qu=
ot;`, `\u0022`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&#3=
9;`, `\u0027`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
// Allow embedding in HTML without further escaping.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&am=
p;amp;`, `\x26amp;`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&am=
p;amp;`, `\u0026amp;`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
// Prevent breaking out of text node and element boundaries.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;&lt;/script&gt;&quot;, `\x3c\/script\x3e`},<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;&lt;![CDATA[&quot;, `\x3c![CDATA[`},<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;]]&gt;&quot;, `]]\x3e`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;&lt;/script&gt;&quot;, `\u003c\/script\u003e`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;&lt;![CDATA[&quot;, `\u003c![CDATA[`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;]]&gt;&quot;, `]]\u003e`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
// <a href=3D"https://dev.w3.org/html5/markup/aria/syntax.html#escaping-tex=
t-span" rel=3D"noreferrer" target=3D"_blank">https://dev.w3.org/html5/marku=
p/aria/syntax.html#escaping-text-span</a><br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
//=C2=A0 =C2=A0&quot;The text in style, script, title, and textarea element=
s<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
//=C2=A0 =C2=A0must not have an escaping text span start that is not<br>
&gt; &gt; &gt;&gt; +@@ -201,11 +201,11 @@ func TestJSStrEscaper(t *testing.=
T) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
// allow regular text content to be interpreted as script<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
// allowing script execution via a combination of a JS string<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
// injection followed by an HTML text injection.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;&lt;!--&quot;, `\x3c!--`},<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;--&gt;&quot;, `--\x3e`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;&lt;!--&quot;, `\u003c!--`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;--&gt;&quot;, `--\u003e`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
// From <a href=3D"https://code.google.com/p/doctype/wiki/ArticleUtf7" rel=
=3D"noreferrer" target=3D"_blank">https://code.google.com/p/doctype/wiki/Ar=
ticleUtf7</a><br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;+ADw-script+AD4-alert(1)+ADw-/script+AD4-&quot;,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 `\x2bADw-script\x2bAD4-alert(1)\x2bADw-\/script\x2=
bAD4-`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 `\u002bADw-script\u002bAD4-alert(1)\u002bADw-\/scr=
ipt\u002bAD4-`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
// Invalid UTF-8 sequence<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;foo\xA0bar&quot;, &quot;foo\xA0bar&quot;},<br>
&gt; &gt; &gt;&gt; +@@ -228,7 +228,7 @@ func TestJSRegexpEscaper(t *testing=
.T) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;&quot;, `(?:)`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;foo&quot;, `foo`},<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;\u0000&quot;, `\0`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;\u0000&quot;, `\u0000`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;\t&quot;, `\t`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;\n&quot;, `\n`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;\r&quot;, `\r`},<br>
&gt; &gt; &gt;&gt; +@@ -238,19 +238,19 @@ func TestJSRegexpEscaper(t *testi=
ng.T) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;\\n&quot;, `\\n`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;foo\r\nbar&quot;, `foo\r\nbar`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
// Preserve attribute boundaries.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&qu=
ot;`, `\x22`},<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&#3=
9;`, `\x27`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&qu=
ot;`, `\u0022`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&#3=
9;`, `\u0027`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
// Allow embedding in HTML without further escaping.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&am=
p;amp;`, `\x26amp;`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&am=
p;amp;`, `\u0026amp;`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
// Prevent breaking out of text node and element boundaries.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;&lt;/script&gt;&quot;, `\x3c\/script\x3e`},<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;&lt;![CDATA[&quot;, `\x3c!\[CDATA\[`},<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;]]&gt;&quot;, `\]\]\x3e`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;&lt;/script&gt;&quot;, `\u003c\/script\u003e`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;&lt;![CDATA[&quot;, `\u003c!\[CDATA\[`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;]]&gt;&quot;, `\]\]\u003e`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
// Escaping text spans.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;&lt;!--&quot;, `\x3c!\-\-`},<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;--&gt;&quot;, `\-\-\x3e`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;&lt;!--&quot;, `\u003c!\-\-`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;--&gt;&quot;, `\-\-\u003e`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;*&quot;, `\*`},<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;+&quot;, `\x2b`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;+&quot;, `\u002b`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;?&quot;, `\?`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;[](){}&quot;, `\[\]\(\)\{\}`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;$foo|x.y&quot;, `\$foo\|x\.y`},<br>
&gt; &gt; &gt;&gt; +@@ -284,27 +284,27 @@ func TestEscapersOnLower7AndSelec=
tHighCodepoints(t *testing.T) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;jsStrEscaper&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0jsStrEscaper,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\\0\x01\x02\x03\x04\x05\x06\x07&quot; +<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\x08\\t\\n\\x0b\=
\f\\r\x0E\x0F&quot; +<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\x10\x11\x12\x13=
\x14\x15\x16\x17&quot; +<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\x18\x19\x1a\x1b=
\x1c\x1d\x1e\x1f&quot; +<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` !\x22#$%\x26\x27()*\=
x2b,-.\/` +<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `0123456789:;\x3c=3D\x=
3e?` +<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 `\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007`=
 +<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u0008\t\n\u000b\f\r\=
u000e\u000f` +<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u0010\u0011\u0012\u0=
013\u0014\u0015\u0016\u0017` +<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u0018\u0019\u001a\u0=
01b\u001c\u001d\u001e\u001f` +<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` !\u0022#$%\u0026\u00=
27()*\u002b,-.\/` +<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `0123456789:;\u003c=3D=
\u003e?` +<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`@ABCDEFGHIJKLMNO` =
+<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`PQRSTUVWXYZ[\\]^_`=
 +<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;`abcdefghijkl=
mno&quot; +<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pqrstuvwxyz{|}~\=
x7f&quot; +<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pqrstuvwxyz{|}~\=
u007f&quot; +<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\u00A0\u0100\=
\u2028\\u2029\ufeff\U0001D11E&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;jsRegexpEscaper&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0jsRegexpEscaper,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\\0\x01\x02\x03\x04\x05\x06\x07&quot; +<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\x08\\t\\n\\x0b\=
\f\\r\x0E\x0F&quot; +<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\x10\x11\x12\x13=
\x14\x15\x16\x17&quot; +<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\x18\x19\x1a\x1b=
\x1c\x1d\x1e\x1f&quot; +<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` !\x22#\$%\x26\x27\(\=
)\*\x2b,\-\.\/` +<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `0123456789:;\x3c=3D\x=
3e\?` +<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 `\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007`=
 +<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u0008\t\n\u000b\f\r\=
u000e\u000f` +<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u0010\u0011\u0012\u0=
013\u0014\u0015\u0016\u0017` +<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u0018\u0019\u001a\u0=
01b\u001c\u001d\u001e\u001f` +<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` !\u0022#\$%\u0026\u0=
027\(\)\*\u002b,\-\.\/` +<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `0123456789:;\u003c=3D=
\u003e\?` +<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`@ABCDEFGHIJKLMNO` =
+<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`PQRSTUVWXYZ\[\\\]\=
^_` +<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;`abcdefghijkl=
mno&quot; +<br>
&gt; &gt; &gt;&gt; +diff --git a/src/html/template/template_test.go b/src/h=
tml/template/template_test.go<br>
&gt; &gt; &gt;&gt; +index 13e6ba4..86bd4db 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/html/template/template_test.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/html/template/template_test.go<br>
&gt; &gt; &gt;&gt; +@@ -6,6 +6,7 @@ package template_test<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + import (<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;bytes&quot;<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;encoding/json&quot;<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0. &quot;html/template&quot;<=
br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;strings&quot;<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;testing&quot;<br>
&gt; &gt; &gt;&gt; +@@ -121,6 +122,44 @@ func TestNumbers(t *testing.T) {<b=
r>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0c.mustExecute(c.root, nil, &=
quot;12.34 7.5&quot;)<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; ++func TestStringsInScriptsWithJsonContentTypeAreCorrect=
lyEscaped(t *testing.T) {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // See #33671 and #37634 for more=
 context on this.<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 tests :=3D []struct{ name, in str=
ing }{<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;empty&quot;, &quot;&quot;},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;invalid&quot;, string(rune(-1))},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;null&quot;, &quot;\u0000&quot;},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;unit separator&quot;, &quot;\u001F&quot;},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;tab&quot;, &quot;\t&quot;},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;gt and lt&quot;, &quot;&lt;&gt;&quot;},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;quotes&quot;, `&#39;&quot;`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;ASCII letters&quot;, &quot;ASCII letters&quot;},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;Unicode&quot;, &quot;=CA=95=E2=8A=99=CF=96=E2=8A=99=CA=94&quot;},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;Pizza&quot;, &quot;=F0=9F=8D=95&quot;},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 const (<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefi=
x =3D `&lt;script type=3D&quot;application/ld+json&quot;&gt;`<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 suffi=
x =3D `&lt;/script&gt;`<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 templ=
=C2=A0 =3D prefix + `&quot;{{.}}&quot;` + suffix<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 tpl :=3D Must(New(&quot;JS string=
 is JSON string&quot;).Parse(templ))<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 for _, tt :=3D range tests {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Run=
(<a href=3D"http://tt.name" rel=3D"noreferrer" target=3D"_blank">tt.name</a=
>, func(t *testing.T) {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 var buf bytes.Buffer<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if err :=3D tpl.Execute(&amp;buf, <a href=3D"http:=
//tt.in" rel=3D"noreferrer" target=3D"_blank">tt.in</a>); err !=3D nil {<br=
>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;Cannot =
render template: %v&quot;, err)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 trimmed :=3D bytes.TrimSuffix(bytes.TrimPrefix(buf=
.Bytes(), []byte(prefix)), []byte(suffix))<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 var got string<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if err :=3D json.Unmarshal(trimmed, &amp;got); err=
 !=3D nil {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;Cannot =
parse JS string %q as JSON: %v&quot;, trimmed[1:len(trimmed)-1], err)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if got !=3D <a href=3D"http://tt.in" rel=3D"norefe=
rrer" target=3D"_blank">tt.in</a> {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;Seriali=
zation changed the string value: got %q want %q&quot;, got, <a href=3D"http=
://tt.in" rel=3D"noreferrer" target=3D"_blank">tt.in</a>)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 })<br=
>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++}<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; + type testCase struct {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t=C2=A0 =C2=A0 *testing.T<br=
>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0root *Template<br>
&gt; &gt; &gt;&gt; +diff --git a/src/text/template/exec_test.go b/src/text/=
template/exec_test.go<br>
&gt; &gt; &gt;&gt; +index 77294ed..b8a809e 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/text/template/exec_test.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/text/template/exec_test.go<br>
&gt; &gt; &gt;&gt; +@@ -911,9 +911,9 @@ func TestJSEscaping(t *testing.T) {=
<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{`Go &quot;jump&quot; \`, `Go \&quot;jump\&quot; \\`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{`Yukihiro says &quot;=E4=BB=8A=E6=97=A5=E3=81=AF=E4=B8=96=E7=95=8C&quot;`,=
 `Yukihiro says \&quot;=E4=BB=8A=E6=97=A5=E3=81=AF=E4=B8=96=E7=95=8C\&quot;=
`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{&quot;unprintable \uFDFF&quot;, `unprintable \uFDFF`},<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&lt=
;html&gt;`, `\x3Chtml\x3E`},<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`no =
=3D in attributes`, `no \x3D in attributes`},<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&am=
p;#x27; does not become HTML entity`, `\x26#x27; does not become HTML entit=
y`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&lt=
;html&gt;`, `\u003Chtml\u003E`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`no =
=3D in attributes`, `no \u003D in attributes`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&am=
p;#x27; does not become HTML entity`, `\u0026#x27; does not become HTML ent=
ity`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, tc :=3D range testCas=
es {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
s :=3D JSEscapeString(<a href=3D"http://tc.in" rel=3D"noreferrer" target=3D=
"_blank">tc.in</a>)<br>
&gt; &gt; &gt;&gt;=C2=A0 diff --git a/src/text/template/funcs.go b/src/text=
/template/funcs.go<br>
&gt; &gt; &gt;&gt;=C2=A0 index 46125bc..f3de9fb 100644<br>
&gt; &gt; &gt;&gt;=C2=A0 --- a/src/text/template/funcs.go<br>
&gt; &gt; &gt;&gt; diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-2=
4538_3.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_3.patch<br>
&gt; &gt; &gt;&gt; new file mode 100644<br>
&gt; &gt; &gt;&gt; index 0000000000..cd7dd0957c<br>
&gt; &gt; &gt;&gt; --- /dev/null<br>
&gt; &gt; &gt;&gt; +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_3.=
patch<br>
&gt; &gt; &gt;&gt; @@ -0,0 +1,393 @@<br>
&gt; &gt; &gt;&gt; +From 7ddce23c7d5b728acf8482f5006497c7b9915f8a Mon Sep 1=
7 00:00:00 2001<br>
&gt; &gt; &gt;&gt; +From: Ariel Mashraki &lt;<a href=3D"mailto:ariel@mashra=
ki.co.il" target=3D"_blank">ariel@mashraki.co.il</a>&gt;<br>
&gt; &gt; &gt;&gt; +Date: Wed, 22 Apr 2020 22:17:56 +0300<br>
&gt; &gt; &gt;&gt; +Subject: [PATCH 3/6] text/template: add CommentNode to =
template parse tree<br>
&gt; &gt; &gt;&gt; +MIME-Version: 1.0<br>
&gt; &gt; &gt;&gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; &gt; &gt;&gt; +Content-Transfer-Encoding: 8bit<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +Fixes #34652<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +Change-Id: Icf6e3eda593fed826736f34f95a9d66f5450cc98<br=
>
&gt; &gt; &gt;&gt; +Reviewed-on: <a href=3D"https://go-review.googlesource.=
com/c/go/+/229398" rel=3D"noreferrer" target=3D"_blank">https://go-review.g=
ooglesource.com/c/go/+/229398</a><br>
&gt; &gt; &gt;&gt; +Reviewed-by: Daniel Mart=C3=AD &lt;<a href=3D"mailto:mv=
dan@mvdan.cc" target=3D"_blank">mvdan@mvdan.cc</a>&gt;<br>
&gt; &gt; &gt;&gt; +Run-TryBot: Daniel Mart=C3=AD &lt;<a href=3D"mailto:mvd=
an@mvdan.cc" target=3D"_blank">mvdan@mvdan.cc</a>&gt;<br>
&gt; &gt; &gt;&gt; +TryBot-Result: Gobot Gobot &lt;<a href=3D"mailto:gobot@=
golang.org" target=3D"_blank">gobot@golang.org</a>&gt;<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +Dependency Patch #3<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +Upstream-Status: Backport from <a href=3D"https://githu=
b.com/golang/go/commit/c8ea03828b0645b1fd5725888e44873b75fcfbb6" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/golang/go/commit/c8ea03828b06=
45b1fd5725888e44873b75fcfbb6</a><br>
&gt; &gt; &gt;&gt; +CVE: CVE-2023-24538<br>
&gt; &gt; &gt;&gt; +Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:s=
kulkarni@mvista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt; &gt; &gt;&gt; +---<br>
&gt; &gt; &gt;&gt; + api/next.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 19 +++++++++++++++++++<b=
r>
&gt; &gt; &gt;&gt; + src/html/template/escape.go=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
&gt; &gt; &gt;&gt; + src/html/template/template_test.go=C2=A0 =C2=A0 | 16 +=
+++++++++++++++<br>
&gt; &gt; &gt;&gt; + src/text/template/exec.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt; &gt;&gt; + src/text/template/parse/lex.go=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 8 +++++++-<br>
&gt; &gt; &gt;&gt; + src/text/template/parse/lex_test.go=C2=A0 =C2=A0|=C2=
=A0 7 +++++--<br>
&gt; &gt; &gt;&gt; + src/text/template/parse/node.go=C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 33 +++++++++++++++++++++++++++++++++<br>
&gt; &gt; &gt;&gt; + src/text/template/parse/parse.go=C2=A0 =C2=A0 =C2=A0 |=
 22 +++++++++++++++++++---<br>
&gt; &gt; &gt;&gt; + src/text/template/parse/parse_test.go | 25 +++++++++++=
++++++++++++++<br>
&gt; &gt; &gt;&gt; + 9 files changed, 127 insertions(+), 6 deletions(-)<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +diff --git a/api/next.txt b/api/next.txt<br>
&gt; &gt; &gt;&gt; +index e69de29..076f39e 100644<br>
&gt; &gt; &gt;&gt; +--- a/api/next.txt<br>
&gt; &gt; &gt;&gt; ++++ b/api/next.txt<br>
&gt; &gt; &gt;&gt; +@@ -0,0 +1,19 @@<br>
&gt; &gt; &gt;&gt; ++pkg unicode, const Version =3D &quot;13.0.0&quot;<br>
&gt; &gt; &gt;&gt; ++pkg unicode, var Chorasmian *RangeTable<br>
&gt; &gt; &gt;&gt; ++pkg unicode, var Dives_Akuru *RangeTable<br>
&gt; &gt; &gt;&gt; ++pkg unicode, var Khitan_Small_Script *RangeTable<br>
&gt; &gt; &gt;&gt; ++pkg unicode, var Yezidi *RangeTable<br>
&gt; &gt; &gt;&gt; ++pkg text/template/parse, const NodeComment =3D 20<br>
&gt; &gt; &gt;&gt; ++pkg text/template/parse, const NodeComment NodeType<br=
>
&gt; &gt; &gt;&gt; ++pkg text/template/parse, const ParseComments =3D 1<br>
&gt; &gt; &gt;&gt; ++pkg text/template/parse, const ParseComments Mode<br>
&gt; &gt; &gt;&gt; ++pkg text/template/parse, method (*CommentNode) Copy() =
Node<br>
&gt; &gt; &gt;&gt; ++pkg text/template/parse, method (*CommentNode) String(=
) string<br>
&gt; &gt; &gt;&gt; ++pkg text/template/parse, method (CommentNode) Position=
() Pos<br>
&gt; &gt; &gt;&gt; ++pkg text/template/parse, method (CommentNode) Type() N=
odeType<br>
&gt; &gt; &gt;&gt; ++pkg text/template/parse, type CommentNode struct<br>
&gt; &gt; &gt;&gt; ++pkg text/template/parse, type CommentNode struct, Text=
 string<br>
&gt; &gt; &gt;&gt; ++pkg text/template/parse, type CommentNode struct, embe=
dded NodeType<br>
&gt; &gt; &gt;&gt; ++pkg text/template/parse, type CommentNode struct, embe=
dded Pos<br>
&gt; &gt; &gt;&gt; ++pkg text/template/parse, type Mode uint<br>
&gt; &gt; &gt;&gt; ++pkg text/template/parse, type Tree struct, Mode Mode<b=
r>
&gt; &gt; &gt;&gt; +diff --git a/src/html/template/escape.go b/src/html/tem=
plate/escape.go<br>
&gt; &gt; &gt;&gt; +index f12dafa..8739735 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/html/template/escape.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/html/template/escape.go<br>
&gt; &gt; &gt;&gt; +@@ -124,6 +124,8 @@ func (e *escaper) escape(c context,=
 n parse.Node) context {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch n :=3D n.(type) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.ActionNode:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return e.escapeAction(c, n)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 case *parse.CommentNode:<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retur=
n c<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.IfNode:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return e.escapeBranch(c, &amp;n.BranchNode, &quot;if&quot;)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.ListNode:<br>
&gt; &gt; &gt;&gt; +diff --git a/src/html/template/template_test.go b/src/h=
tml/template/template_test.go<br>
&gt; &gt; &gt;&gt; +index 86bd4db..1f2c888 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/html/template/template_test.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/html/template/template_test.go<br>
&gt; &gt; &gt;&gt; +@@ -10,6 +10,7 @@ import (<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0. &quot;html/template&quot;<=
br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;strings&quot;<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;testing&quot;<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;text/template/parse&quot;<b=
r>
&gt; &gt; &gt;&gt; + )<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + func TestTemplateClone(t *testing.T) {<br>
&gt; &gt; &gt;&gt; +@@ -160,6 +161,21 @@ func TestStringsInScriptsWithJsonC=
ontentTypeAreCorrectlyEscaped(t *testing.T) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; ++func TestSkipEscapeComments(t *testing.T) {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 c :=3D newTestCase(t)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 tr :=3D parse.New(&quot;root&quot=
;)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 tr.Mode =3D parse.ParseComments<b=
r>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 newT, err :=3D tr.Parse(&quot;{{/=
* A comment */}}{{ 1 }}{{/* Another comment */}}&quot;, &quot;&quot;, &quot=
;&quot;, make(map[string]*parse.Tree))<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fat=
alf(&quot;Cannot parse template text: %v&quot;, err)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 c.root, err =3D c.root.AddParseTr=
ee(&quot;root&quot;, newT)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fat=
alf(&quot;Cannot add parse tree to template: %v&quot;, err)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 c.mustExecute(c.root, nil, &quot;=
1&quot;)<br>
&gt; &gt; &gt;&gt; ++}<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; + type testCase struct {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t=C2=A0 =C2=A0 *testing.T<br=
>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0root *Template<br>
&gt; &gt; &gt;&gt; +diff --git a/src/text/template/exec.go b/src/text/templ=
ate/exec.go<br>
&gt; &gt; &gt;&gt; +index ac3e741..7ac5175 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/text/template/exec.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/text/template/exec.go<br>
&gt; &gt; &gt;&gt; +@@ -256,6 +256,7 @@ func (s *state) walk(dot reflect.Va=
lue, node parse.Node) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
if len(node.Pipe.Decl) =3D=3D 0 {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0s.printValue(node, val)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
}<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 case *parse.CommentNode:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.IfNode:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
s.walkIfOrWith(parse.NodeIf, dot, node.Pipe, node.List, node.ElseList)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.ListNode:<br>
&gt; &gt; &gt;&gt; +diff --git a/src/text/template/parse/lex.go b/src/text/=
template/parse/lex.go<br>
&gt; &gt; &gt;&gt; +index 30371f2..e41373a 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/text/template/parse/lex.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/text/template/parse/lex.go<br>
&gt; &gt; &gt;&gt; +@@ -41,6 +41,7 @@ const (<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemBool=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// bo=
olean constant<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemChar=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// pr=
intable ASCII character; grab bag for comma etc.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemCharConstant=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// character constant<b=
r>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 itemComment=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // comment text<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemComplex=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // complex cons=
tant (1+2i); imaginary is just a number<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemAssign=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// equals=
 (&#39;=3D&#39;) introducing an assignment<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemDeclare=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // colon-equals=
 (&#39;:=3D&#39;) introducing a declaration<br>
&gt; &gt; &gt;&gt; +@@ -112,6 +113,7 @@ type lexer struct {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0leftDelim=C2=A0 =C2=A0 =C2=
=A0 string=C2=A0 =C2=A0 // start of action<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rightDelim=C2=A0 =C2=A0 =C2=
=A0string=C2=A0 =C2=A0 // end of action<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0trimRightDelim string=C2=A0 =
=C2=A0 // end of action with trim marker<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 emitComment=C2=A0 =C2=A0 bool=C2=
=A0 =C2=A0 =C2=A0 // emit itemComment tokens.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pos=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 Pos=C2=A0 =C2=A0 =C2=A0 =C2=A0// current position in the =
input<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0start=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Pos=C2=A0 =C2=A0 =C2=A0 =C2=A0// start position of this item<=
br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0width=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Pos=C2=A0 =C2=A0 =C2=A0 =C2=A0// width of last rune read from=
 input<br>
&gt; &gt; &gt;&gt; +@@ -203,7 +205,7 @@ func (l *lexer) drain() {<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + // lex creates a new scanner for the input string.<br>
&gt; &gt; &gt;&gt; +-func lex(name, input, left, right string) *lexer {<br>
&gt; &gt; &gt;&gt; ++func lex(name, input, left, right string, emitComment =
bool) *lexer {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if left =3D=3D &quot;&quot; =
{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
left =3D leftDelim<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; +@@ -216,6 +218,7 @@ func lex(name, input, left, right s=
tring) *lexer {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
leftDelim:=C2=A0 =C2=A0 =C2=A0 left,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
rightDelim:=C2=A0 =C2=A0 =C2=A0right,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
trimRightDelim: rightTrimMarker + right,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emitC=
omment:=C2=A0 =C2=A0 emitComment,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
items:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 make(chan item),<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
line:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
startLine:=C2=A0 =C2=A0 =C2=A0 1,<br>
&gt; &gt; &gt;&gt; +@@ -323,6 +326,9 @@ func lexComment(l *lexer) stateFn {=
<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if !delim {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return l.errorf(&quot;comment ends before closing delimiter&quot;)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if l.emitComment {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 l.emi=
t(itemComment)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if trimSpace {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
l.pos +=3D trimMarkerLen<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; +diff --git a/src/text/template/parse/lex_test.go b/src/=
text/template/parse/lex_test.go<br>
&gt; &gt; &gt;&gt; +index 563c4fc..f6d5f28 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/text/template/parse/lex_test.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/text/template/parse/lex_test.go<br>
&gt; &gt; &gt;&gt; +@@ -15,6 +15,7 @@ var itemName =3D map[itemType]string{=
<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemBool:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;bool&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemChar:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;char&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemCharConstant: &quot;char=
const&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 itemComment:=C2=A0 =C2=A0 =C2=A0 =
&quot;comment&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemComplex:=C2=A0 =C2=A0 =
=C2=A0 &quot;complex&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemDeclare:=C2=A0 =C2=A0 =
=C2=A0 &quot;:=3D&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemEOF:=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;EOF&quot;,<br>
&gt; &gt; &gt;&gt; +@@ -90,6 +91,7 @@ var lexTests =3D []lexTest{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;text&quot;, `now is t=
he time`, []item{mkItem(itemText, &quot;now is the time&quot;), tEOF}},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;text with comment&quo=
t;, &quot;hello-{{/* this is a comment */}}-world&quot;, []item{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
mkItem(itemText, &quot;hello-&quot;),<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkIte=
m(itemComment, &quot;/* this is a comment */&quot;),<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
mkItem(itemText, &quot;-world&quot;),<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
tEOF,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}},<br>
&gt; &gt; &gt;&gt; +@@ -311,6 +313,7 @@ var lexTests =3D []lexTest{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;trimming spaces befor=
e and after comment&quot;, &quot;hello- {{- /* hello */ -}} -world&quot;, [=
]item{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
mkItem(itemText, &quot;hello-&quot;),<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkIte=
m(itemComment, &quot;/* hello */&quot;),<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
mkItem(itemText, &quot;-world&quot;),<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
tEOF,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}},<br>
&gt; &gt; &gt;&gt; +@@ -389,7 +392,7 @@ var lexTests =3D []lexTest{<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + // collect gathers the emitted items into a slice.<br>
&gt; &gt; &gt;&gt; + func collect(t *lexTest, left, right string) (items []=
item) {<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 l :=3D lex(<a href=3D"http://t.na=
me" rel=3D"noreferrer" target=3D"_blank">t.name</a>, t.input, left, right)<=
br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 l :=3D lex(<a href=3D"http://t.na=
me" rel=3D"noreferrer" target=3D"_blank">t.name</a>, t.input, left, right, =
true)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
item :=3D l.nextItem()<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
items =3D append(items, item)<br>
&gt; &gt; &gt;&gt; +@@ -529,7 +532,7 @@ func TestPos(t *testing.T) {<br>
&gt; &gt; &gt;&gt; + func TestShutdown(t *testing.T) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// We need to duplicate temp=
late.Parse here to hold on to the lexer.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const text =3D &quot;erroneo=
us{{define}}{{else}}1234&quot;<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 lexer :=3D lex(&quot;foo&quot;, t=
ext, &quot;{{&quot;, &quot;}}&quot;)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 lexer :=3D lex(&quot;foo&quot;, t=
ext, &quot;{{&quot;, &quot;}}&quot;, false)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_, err :=3D New(&quot;root&q=
uot;).parseLexer(lexer)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if err =3D=3D nil {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
t.Fatalf(&quot;expected error&quot;)<br>
&gt; &gt; &gt;&gt; +diff --git a/src/text/template/parse/node.go b/src/text=
/template/parse/node.go<br>
&gt; &gt; &gt;&gt; +index 1c116ea..a9dad5e 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/text/template/parse/node.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/text/template/parse/node.go<br>
&gt; &gt; &gt;&gt; +@@ -70,6 +70,7 @@ const (<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NodeTemplate=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// A template invoca=
tion action.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NodeVariable=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// A $ variable.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NodeWith=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// A with ac=
tion.<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 NodeComment=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // A comment.<br>
&gt; &gt; &gt;&gt; + )<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + // Nodes.<br>
&gt; &gt; &gt;&gt; +@@ -149,6 +150,38 @@ func (t *TextNode) Copy() Node {<b=
r>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return &amp;TextNode{tr: <a =
href=3D"http://t.tr" rel=3D"noreferrer" target=3D"_blank">t.tr</a>, NodeTyp=
e: NodeText, Pos: t.Pos, Text: append([]byte{}, t.Text...)}<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; ++// CommentNode holds a comment.<br>
&gt; &gt; &gt;&gt; ++type CommentNode struct {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 NodeType<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 Pos<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 tr=C2=A0 =C2=A0*Tree<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 Text string // Comment text.<br>
&gt; &gt; &gt;&gt; ++}<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; ++func (t *Tree) newComment(pos Pos, text string) *Comme=
ntNode {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return &amp;CommentNode{tr: t, No=
deType: NodeComment, Pos: pos, Text: text}<br>
&gt; &gt; &gt;&gt; ++}<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; ++func (c *CommentNode) String() string {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 var sb strings.Builder<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 c.writeTo(&amp;sb)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return sb.String()<br>
&gt; &gt; &gt;&gt; ++}<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; ++func (c *CommentNode) writeTo(sb *strings.Builder) {<b=
r>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 sb.WriteString(&quot;{{&quot;)<br=
>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 sb.WriteString(c.Text)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 sb.WriteString(&quot;}}&quot;)<br=
>
&gt; &gt; &gt;&gt; ++}<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; ++func (c *CommentNode) tree() *Tree {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return <a href=3D"http://c.tr" re=
l=3D"noreferrer" target=3D"_blank">c.tr</a><br>
&gt; &gt; &gt;&gt; ++}<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; ++func (c *CommentNode) Copy() Node {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return &amp;CommentNode{tr: <a hr=
ef=3D"http://c.tr" rel=3D"noreferrer" target=3D"_blank">c.tr</a>, NodeType:=
 NodeComment, Pos: c.Pos, Text: c.Text}<br>
&gt; &gt; &gt;&gt; ++}<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; + // PipeNode holds a pipeline with optional declaration=
<br>
&gt; &gt; &gt;&gt; + type PipeNode struct {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NodeType<br>
&gt; &gt; &gt;&gt; +diff --git a/src/text/template/parse/parse.go b/src/tex=
t/template/parse/parse.go<br>
&gt; &gt; &gt;&gt; +index c9b80f4..496d8bf 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/text/template/parse/parse.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/text/template/parse/parse.go<br>
&gt; &gt; &gt;&gt; +@@ -21,6 +21,7 @@ type Tree struct {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Name=C2=A0 =C2=A0 =C2=A0 str=
ing=C2=A0 =C2=A0 // name of the template represented by the tree.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ParseName string=C2=A0 =C2=
=A0 // name of the top-level template during parsing, for error messages.<b=
r>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Root=C2=A0 =C2=A0 =C2=A0 *Li=
stNode // top-level root of the tree.<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 Mode=C2=A0 =C2=A0 =C2=A0 Mode=C2=
=A0 =C2=A0 =C2=A0 // parsing mode.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0text=C2=A0 =C2=A0 =C2=A0 str=
ing=C2=A0 =C2=A0 // text parsed to create the template (or its parent)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Parsing only; cleared aft=
er parse.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0funcs=C2=A0 =C2=A0 =C2=A0[]m=
ap[string]interface{}<br>
&gt; &gt; &gt;&gt; +@@ -29,8 +30,16 @@ type Tree struct {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0peekCount int<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vars=C2=A0 =C2=A0 =C2=A0 []s=
tring // variables defined at the moment.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0treeSet=C2=A0 =C2=A0map[stri=
ng]*Tree<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 mode=C2=A0 =C2=A0 =C2=A0 Mode<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; ++// A mode value is a set of flags (or 0). Modes contro=
l parser behavior.<br>
&gt; &gt; &gt;&gt; ++type Mode uint<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; ++const (<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 ParseComments Mode =3D 1 &lt;&lt;=
 iota // parse comments and add them to AST<br>
&gt; &gt; &gt;&gt; ++)<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; + // Copy returns a copy of the Tree. Any parsing state =
is discarded.<br>
&gt; &gt; &gt;&gt; + func (t *Tree) Copy() *Tree {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if t =3D=3D nil {<br>
&gt; &gt; &gt;&gt; +@@ -220,7 +229,8 @@ func (t *Tree) stopParse() {<br>
&gt; &gt; &gt;&gt; + func (t *Tree) Parse(text, leftDelim, rightDelim strin=
g, treeSet map[string]*Tree, funcs ...map[string]interface{}) (tree *Tree, =
err error) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0defer t.recover(&amp;err)<br=
>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t.ParseName =3D t.Name<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 t.startParse(funcs, lex(t.Name, t=
ext, leftDelim, rightDelim), treeSet)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 emitComment :=3D t.Mode&amp;Parse=
Comments !=3D 0<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 t.startParse(funcs, lex(t.Name, t=
ext, leftDelim, rightDelim, emitComment), treeSet)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t.text =3D text<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t.parse()<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t.add()<br>
&gt; &gt; &gt;&gt; +@@ -240,12 +250,14 @@ func (t *Tree) add() {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +-// IsEmptyTree reports whether this tree (node) is emp=
ty of everything but space.<br>
&gt; &gt; &gt;&gt; ++// IsEmptyTree reports whether this tree (node) is emp=
ty of everything but space or comments.<br>
&gt; &gt; &gt;&gt; + func IsEmptyTree(n Node) bool {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch n :=3D n.(type) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case nil:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return true<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *ActionNode:<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 case *CommentNode:<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retur=
n true<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *IfNode:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *ListNode:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
for _, node :=3D range n.Nodes {<br>
&gt; &gt; &gt;&gt; +@@ -276,6 +288,7 @@ func (t *Tree) parse() {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0if t.nextNonSpace().typ =3D=3D itemDefine {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newT :=3D New(&quot=
;definition&quot;) // name will be updated once we know it.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newT.text =3D t.tex=
t<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newT.Mode =3D t.Mode<b=
r>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newT.ParseName =3D =
t.ParseName<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newT.startParse(t.f=
uncs, t.lex, t.treeSet)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newT.parseDefinitio=
n()<br>
&gt; &gt; &gt;&gt; +@@ -331,13 +344,15 @@ func (t *Tree) itemList() (list *=
ListNode, next Node) {<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + // textOrAction:<br>
&gt; &gt; &gt;&gt; +-//=C2=A0 =C2=A0 text | action<br>
&gt; &gt; &gt;&gt; ++//=C2=A0 =C2=A0 text | comment | action<br>
&gt; &gt; &gt;&gt; + func (t *Tree) textOrAction() Node {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch token :=3D t.nextNonS=
pace(); token.typ {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case itemText:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return t.newText(token.pos, token.val)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case itemLeftDelim:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return t.action()<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 case itemComment:<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retur=
n t.newComment(token.pos, token.val)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
t.unexpected(token, &quot;input&quot;)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; +@@ -539,6 +554,7 @@ func (t *Tree) blockControl() Node =
{<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0block :=3D New(name) // name=
 will be updated once we know it.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0block.text =3D t.text<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 block.Mode =3D t.Mode<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0block.ParseName =3D t.ParseN=
ame<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0block.startParse(t.funcs, t.=
lex, t.treeSet)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0var end Node<br>
&gt; &gt; &gt;&gt; +diff --git a/src/text/template/parse/parse_test.go b/sr=
c/text/template/parse/parse_test.go<br>
&gt; &gt; &gt;&gt; +index 4e09a78..d9c13c5 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/text/template/parse/parse_test.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/text/template/parse/parse_test.go<br>
&gt; &gt; &gt;&gt; +@@ -348,6 +348,30 @@ func TestParseCopy(t *testing.T) {=
<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0testParse(true, t)<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; ++func TestParseWithComments(t *testing.T) {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 textFormat =3D &quot;%q&quot;<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 defer func() { textFormat =3D &qu=
ot;%s&quot; }()<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 tests :=3D [...]parseTest{<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;comment&quot;, &quot;{{/*\n\n\n*/}}&quot;, noError, &quot;{{/*\n\n\n*/}}&=
quot;},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;comment trim left&quot;, &quot;x \r\n\t{{- /* hi */}}&quot;, noError, `&q=
uot;x&quot;{{/* hi */}}`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;comment trim right&quot;, &quot;{{/* hi */ -}}\n\n\ty&quot;, noError, `{{=
/* hi */}}&quot;y&quot;`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quo=
t;comment trim left and right&quot;, &quot;x \r\n\t{{- /* */ -}}\n\n\ty&quo=
t;, noError, `&quot;x&quot;{{/* */}}&quot;y&quot;`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 for _, test :=3D range tests {<br=
>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Run=
(<a href=3D"http://test.name" rel=3D"noreferrer" target=3D"_blank">test.nam=
e</a>, func(t *testing.T) {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 tr :=3D New(<a href=3D"http://test.name" rel=3D"no=
referrer" target=3D"_blank">test.name</a>)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 tr.Mode =3D ParseComments<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 tmpl, err :=3D tr.Parse(test.input, &quot;&quot;, =
&quot;&quot;, make(map[string]*Tree))<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;%q: exp=
ected error; got none&quot;, <a href=3D"http://test.name" rel=3D"noreferrer=
" target=3D"_blank">test.name</a>)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if result :=3D tmpl.Root.String(); result !=3D tes=
t.result {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;%s=3D(%=
q): got\n\t%v\nexpected\n\t%v&quot;, <a href=3D"http://test.name" rel=3D"no=
referrer" target=3D"_blank">test.name</a>, test.input, result, test.result)=
<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 })<br=
>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++}<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; + type isEmptyTest struct {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0name=C2=A0 string<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0input string<br>
&gt; &gt; &gt;&gt; +@@ -358,6 +382,7 @@ var isEmptyTests =3D []isEmptyTest{=
<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;empty&quot;, ``, true=
},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;nonempty&quot;, `hell=
o`, false},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;spaces only&quot;, &q=
uot; \t\n \t\n&quot;, true},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;comment only&quot;, &quot;=
{{/* comment */}}&quot;, true},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;definition&quot;, `{{=
define &quot;x&quot;}}something{{end}}`, true},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;definitions and space=
&quot;, &quot;{{define `x`}}something{{end}}\n\n{{define `y`}}something{{en=
d}}\n\n&quot;, true},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;definitions and text&=
quot;, &quot;{{define `x`}}something{{end}}\nx\n{{define `y`}}something{{en=
d}}\ny\n&quot;, false},<br>
&gt; &gt; &gt;&gt; +--<br>
&gt; &gt; &gt;&gt; +2.7.4<br>
&gt; &gt; &gt;&gt; diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-2=
4538_4.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_4.patch<br>
&gt; &gt; &gt;&gt; new file mode 100644<br>
&gt; &gt; &gt;&gt; index 0000000000..d5e2eb6684<br>
&gt; &gt; &gt;&gt; --- /dev/null<br>
&gt; &gt; &gt;&gt; +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_4.=
patch<br>
&gt; &gt; &gt;&gt; @@ -0,0 +1,497 @@<br>
&gt; &gt; &gt;&gt; +From 760d88497091fb5d6d231a18e6f4e06ecb9af9b2 Mon Sep 1=
7 00:00:00 2001<br>
&gt; &gt; &gt;&gt; +From: Russ Cox &lt;<a href=3D"mailto:rsc@golang.org" ta=
rget=3D"_blank">rsc@golang.org</a>&gt;<br>
&gt; &gt; &gt;&gt; +Date: Thu, 10 Sep 2020 18:53:26 -0400<br>
&gt; &gt; &gt;&gt; +Subject: [PATCH 4/6] text/template: allow newlines insi=
de action delimiters<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +This allows multiline constructs like:<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{{&quot;hello&quot; |<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf}}<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +Now that unclosed actions can span multiple lines,<br>
&gt; &gt; &gt;&gt; +track and report the start of the action when reporting=
 errors.<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +Also clean up a few &quot;unexpected &lt;error message&=
gt;&quot; to be just &quot;&lt;error message&gt;&quot;.<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +Fixes #29770.<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +Change-Id: I54c6c016029a8328b7902a4b6d85eab713ec3285<br=
>
&gt; &gt; &gt;&gt; +Reviewed-on: <a href=3D"https://go-review.googlesource.=
com/c/go/+/254257" rel=3D"noreferrer" target=3D"_blank">https://go-review.g=
ooglesource.com/c/go/+/254257</a><br>
&gt; &gt; &gt;&gt; +Trust: Russ Cox &lt;<a href=3D"mailto:rsc@golang.org" t=
arget=3D"_blank">rsc@golang.org</a>&gt;<br>
&gt; &gt; &gt;&gt; +Run-TryBot: Russ Cox &lt;<a href=3D"mailto:rsc@golang.o=
rg" target=3D"_blank">rsc@golang.org</a>&gt;<br>
&gt; &gt; &gt;&gt; +TryBot-Result: Go Bot &lt;<a href=3D"mailto:gobot@golan=
g.org" target=3D"_blank">gobot@golang.org</a>&gt;<br>
&gt; &gt; &gt;&gt; +Reviewed-by: Rob Pike &lt;<a href=3D"mailto:r@golang.or=
g" target=3D"_blank">r@golang.org</a>&gt;<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +Dependency Patch #4<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +Upstream-Status: Backport from <a href=3D"https://githu=
b.com/golang/go/commit/9384d34c58099657bb1b133beaf3ff37ada9b017" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/golang/go/commit/9384d34c5809=
9657bb1b133beaf3ff37ada9b017</a><br>
&gt; &gt; &gt;&gt; +CVE: CVE-2023-24538<br>
&gt; &gt; &gt;&gt; +Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:s=
kulkarni@mvista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt; &gt; &gt;&gt; +---<br>
&gt; &gt; &gt;&gt; + src/text/template/doc.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 21 ++++-----<br>
&gt; &gt; &gt;&gt; + src/text/template/exec_test.go=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
&gt; &gt; &gt;&gt; + src/text/template/parse/lex.go=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 84 +++++++++++++++++------------------<br>
&gt; &gt; &gt;&gt; + src/text/template/parse/lex_test.go=C2=A0 =C2=A0|=C2=
=A0 2 +-<br>
&gt; &gt; &gt;&gt; + src/text/template/parse/parse.go=C2=A0 =C2=A0 =C2=A0 |=
 59 +++++++++++++-----------<br>
&gt; &gt; &gt;&gt; + src/text/template/parse/parse_test.go | 36 +++++++++++=
+---<br>
&gt; &gt; &gt;&gt; + 6 files changed, 117 insertions(+), 87 deletions(-)<br=
>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +diff --git a/src/text/template/doc.go b/src/text/templa=
te/doc.go<br>
&gt; &gt; &gt;&gt; +index 4b0efd2..7b30294 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/text/template/doc.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/text/template/doc.go<br>
&gt; &gt; &gt;&gt; +@@ -40,16 +40,17 @@ More intricate examples appear belo=
w.<br>
&gt; &gt; &gt;&gt; + Text and spaces<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + By default, all text between actions is copied verbati=
m when the template is<br>
&gt; &gt; &gt;&gt; +-executed. For example, the string &quot; items are mad=
e of &quot; in the example above appears<br>
&gt; &gt; &gt;&gt; +-on standard output when the program is run.<br>
&gt; &gt; &gt;&gt; +-<br>
&gt; &gt; &gt;&gt; +-However, to aid in formatting template source code, if=
 an action&#39;s left delimiter<br>
&gt; &gt; &gt;&gt; +-(by default &quot;{{&quot;) is followed immediately by=
 a minus sign and ASCII space character<br>
&gt; &gt; &gt;&gt; +-(&quot;{{- &quot;), all trailing white space is trimme=
d from the immediately preceding text.<br>
&gt; &gt; &gt;&gt; +-Similarly, if the right delimiter (&quot;}}&quot;) is =
preceded by a space and minus sign<br>
&gt; &gt; &gt;&gt; +-(&quot; -}}&quot;), all leading white space is trimmed=
 from the immediately following text.<br>
&gt; &gt; &gt;&gt; +-In these trim markers, the ASCII space must be present=
; &quot;{{-3}}&quot; parses as an<br>
&gt; &gt; &gt;&gt; +-action containing the number -3.<br>
&gt; &gt; &gt;&gt; ++executed. For example, the string &quot; items are mad=
e of &quot; in the example above<br>
&gt; &gt; &gt;&gt; ++appears on standard output when the program is run.<br=
>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; ++However, to aid in formatting template source code, if=
 an action&#39;s left<br>
&gt; &gt; &gt;&gt; ++delimiter (by default &quot;{{&quot;) is followed imme=
diately by a minus sign and white<br>
&gt; &gt; &gt;&gt; ++space, all trailing white space is trimmed from the im=
mediately preceding text.<br>
&gt; &gt; &gt;&gt; ++Similarly, if the right delimiter (&quot;}}&quot;) is =
preceded by white space and a minus<br>
&gt; &gt; &gt;&gt; ++sign, all leading white space is trimmed from the imme=
diately following text.<br>
&gt; &gt; &gt;&gt; ++In these trim markers, the white space must be present=
:<br>
&gt; &gt; &gt;&gt; ++&quot;{{- 3}}&quot; is like &quot;{{3}}&quot; but trim=
s the immediately preceding text, while<br>
&gt; &gt; &gt;&gt; ++&quot;{{-3}}&quot; parses as an action containing the =
number -3.<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + For instance, when executing the template whose source=
 is<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +diff --git a/src/text/template/exec_test.go b/src/text/=
template/exec_test.go<br>
&gt; &gt; &gt;&gt; +index b8a809e..3309b33 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/text/template/exec_test.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/text/template/exec_test.go<br>
&gt; &gt; &gt;&gt; +@@ -1295,7 +1295,7 @@ func TestUnterminatedStringError(=
t *testing.T) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
t.Fatal(&quot;expected error&quot;)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0str :=3D err.Error()<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 if !strings.Contains(str, &quot;X=
:3: unexpected unterminated raw quoted string&quot;) {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if !strings.Contains(str, &quot;X=
:3: unterminated raw quoted string&quot;) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
t.Fatalf(&quot;unexpected error: %s&quot;, str)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +diff --git a/src/text/template/parse/lex.go b/src/text/=
template/parse/lex.go<br>
&gt; &gt; &gt;&gt; +index e41373a..6784071 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/text/template/parse/lex.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/text/template/parse/lex.go<br>
&gt; &gt; &gt;&gt; +@@ -92,15 +92,14 @@ const eof =3D -1<br>
&gt; &gt; &gt;&gt; + // If the action begins &quot;{{- &quot; rather than &=
quot;{{&quot;, then all space/tab/newlines<br>
&gt; &gt; &gt;&gt; + // preceding the action are trimmed; conversely if it =
ends &quot; -}}&quot; the<br>
&gt; &gt; &gt;&gt; + // leading spaces are trimmed. This is done entirely i=
n the lexer; the<br>
&gt; &gt; &gt;&gt; +-// parser never sees it happen. We require an ASCII sp=
ace to be<br>
&gt; &gt; &gt;&gt; +-// present to avoid ambiguity with things like &quot;{=
{-3}}&quot;. It reads<br>
&gt; &gt; &gt;&gt; ++// parser never sees it happen. We require an ASCII sp=
ace (&#39; &#39;, \t, \r, \n)<br>
&gt; &gt; &gt;&gt; ++// to be present to avoid ambiguity with things like &=
quot;{{-3}}&quot;. It reads<br>
&gt; &gt; &gt;&gt; + // better with the space present anyway. For simplicit=
y, only ASCII<br>
&gt; &gt; &gt;&gt; +-// space does the job.<br>
&gt; &gt; &gt;&gt; ++// does the job.<br>
&gt; &gt; &gt;&gt; + const (<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 spaceChars=C2=A0 =C2=A0 =C2=A0 =
=3D &quot; \t\r\n&quot; // These are the space characters defined by Go its=
elf.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 leftTrimMarker=C2=A0 =3D &quot;- =
&quot;=C2=A0 =C2=A0 =C2=A0 // Attached to left delimiter, trims trailing sp=
aces from preceding text.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 rightTrimMarker =3D &quot; -&quot=
;=C2=A0 =C2=A0 =C2=A0 // Attached to right delimiter, trims leading spaces =
from following text.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 trimMarkerLen=C2=A0 =C2=A0=3D Pos=
(len(leftTrimMarker))<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 spaceChars=C2=A0 =C2=A0 =3D &quot=
; \t\r\n&quot;=C2=A0 // These are the space characters defined by Go itself=
.<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 trimMarker=C2=A0 =C2=A0 =3D &#39;=
-&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 // Attached to left/right delimiter, trim=
s trailing spaces from preceding/following text.<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 trimMarkerLen =3D Pos(1 + 1) // m=
arker plus space before or after<br>
&gt; &gt; &gt;&gt; + )<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + // stateFn represents the state of the scanner as a fu=
nction that returns the next state.<br>
&gt; &gt; &gt;&gt; +@@ -108,19 +107,18 @@ type stateFn func(*lexer) stateFn=
<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + // lexer holds the state of the scanner.<br>
&gt; &gt; &gt;&gt; + type lexer struct {<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0string=C2=A0 =C2=A0 // the name of the input; used only for er=
ror reports<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 input=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 string=C2=A0 =C2=A0 // the string being scanned<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 leftDelim=C2=A0 =C2=A0 =C2=A0 str=
ing=C2=A0 =C2=A0 // start of action<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 rightDelim=C2=A0 =C2=A0 =C2=A0str=
ing=C2=A0 =C2=A0 // end of action<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 trimRightDelim string=C2=A0 =C2=
=A0 // end of action with trim marker<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 emitComment=C2=A0 =C2=A0 bool=C2=
=A0 =C2=A0 =C2=A0 // emit itemComment tokens.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 pos=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Pos=C2=A0 =C2=A0 =C2=A0 =C2=A0// current position in the inpu=
t<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 start=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Pos=C2=A0 =C2=A0 =C2=A0 =C2=A0// start position of this item<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 width=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Pos=C2=A0 =C2=A0 =C2=A0 =C2=A0// width of last rune read from input<=
br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 items=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 chan item // channel of scanned items<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 parenDepth=C2=A0 =C2=A0 =C2=A0int=
=C2=A0 =C2=A0 =C2=A0 =C2=A0// nesting depth of ( ) exprs<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0// 1+number of newlines seen<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 startLine=C2=A0 =C2=A0 =C2=A0 int=
=C2=A0 =C2=A0 =C2=A0 =C2=A0// start line of this item<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 name=C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
tring=C2=A0 =C2=A0 // the name of the input; used only for error reports<br=
>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 input=C2=A0 =C2=A0 =C2=A0 =C2=A0s=
tring=C2=A0 =C2=A0 // the string being scanned<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 leftDelim=C2=A0 =C2=A0string=C2=
=A0 =C2=A0 // start of action<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 rightDelim=C2=A0 string=C2=A0 =C2=
=A0 // end of action<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 emitComment bool=C2=A0 =C2=A0 =C2=
=A0 // emit itemComment tokens.<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 pos=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Pos=C2=A0 =C2=A0 =C2=A0 =C2=A0// current position in the input<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 start=C2=A0 =C2=A0 =C2=A0 =C2=A0P=
os=C2=A0 =C2=A0 =C2=A0 =C2=A0// start position of this item<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 width=C2=A0 =C2=A0 =C2=A0 =C2=A0P=
os=C2=A0 =C2=A0 =C2=A0 =C2=A0// width of last rune read from input<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 items=C2=A0 =C2=A0 =C2=A0 =C2=A0c=
han item // channel of scanned items<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 parenDepth=C2=A0 int=C2=A0 =C2=A0=
 =C2=A0 =C2=A0// nesting depth of ( ) exprs<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
nt=C2=A0 =C2=A0 =C2=A0 =C2=A0// 1+number of newlines seen<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 startLine=C2=A0 =C2=A0int=C2=A0 =
=C2=A0 =C2=A0 =C2=A0// start line of this item<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + // next returns the next rune in the input.<br>
&gt; &gt; &gt;&gt; +@@ -213,15 +211,14 @@ func lex(name, input, left, right=
 string, emitComment bool) *lexer {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
right =3D rightDelim<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0l :=3D &amp;lexer{<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name:=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input=
:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 leftD=
elim:=C2=A0 =C2=A0 =C2=A0 left,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 right=
Delim:=C2=A0 =C2=A0 =C2=A0right,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trimR=
ightDelim: rightTrimMarker + right,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emitC=
omment:=C2=A0 =C2=A0 emitComment,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 items=
:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 make(chan item),<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line:=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start=
Line:=C2=A0 =C2=A0 =C2=A0 1,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name:=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 name,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input=
:=C2=A0 =C2=A0 =C2=A0 =C2=A0input,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 leftD=
elim:=C2=A0 =C2=A0left,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 right=
Delim:=C2=A0 right,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emitC=
omment: emitComment,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 items=
:=C2=A0 =C2=A0 =C2=A0 =C2=A0make(chan item),<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line:=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start=
Line:=C2=A0 =C2=A01,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0go l.run()<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return l<br>
&gt; &gt; &gt;&gt; +@@ -251,7 +248,7 @@ func lexText(l *lexer) stateFn {<br=
>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
ldn :=3D Pos(len(l.leftDelim))<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
l.pos +=3D Pos(x)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
trimLength :=3D Pos(0)<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if st=
rings.HasPrefix(l.input[l.pos+ldn:], leftTrimMarker) {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ha=
sLeftTrimMarker(l.input[l.pos+ldn:]) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0trimLength =3D rightTrimLength(l.input[l.start:=
l.pos])<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
l.pos -=3D trimLength<br>
&gt; &gt; &gt;&gt; +@@ -280,7 +277,7 @@ func rightTrimLength(s string) Pos =
{<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + // atRightDelim reports whether the lexer is at a righ=
t delimiter, possibly preceded by a trim marker.<br>
&gt; &gt; &gt;&gt; + func (l *lexer) atRightDelim() (delim, trimSpaces bool=
) {<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 if strings.HasPrefix(l.input[l.po=
s:], l.trimRightDelim) { // With trim marker.<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if hasRightTrimMarker(l.input[l.p=
os:]) &amp;&amp; strings.HasPrefix(l.input[l.pos+trimMarkerLen:], l.rightDe=
lim) { // With trim marker.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return true, true<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if strings.HasPrefix(l.input=
[l.pos:], l.rightDelim) { // Without trim marker.<br>
&gt; &gt; &gt;&gt; +@@ -297,7 +294,7 @@ func leftTrimLength(s string) Pos {=
<br>
&gt; &gt; &gt;&gt; + // lexLeftDelim scans the left delimiter, which is kno=
wn to be present, possibly with a trim marker.<br>
&gt; &gt; &gt;&gt; + func lexLeftDelim(l *lexer) stateFn {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0l.pos +=3D Pos(len(l.leftDel=
im))<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 trimSpace :=3D strings.HasPrefix(=
l.input[l.pos:], leftTrimMarker)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 trimSpace :=3D hasLeftTrimMarker(=
l.input[l.pos:])<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0afterMarker :=3D Pos(0)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if trimSpace {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
afterMarker =3D trimMarkerLen<br>
&gt; &gt; &gt;&gt; +@@ -342,7 +339,7 @@ func lexComment(l *lexer) stateFn {=
<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + // lexRightDelim scans the right delimiter, which is k=
nown to be present, possibly with a trim marker.<br>
&gt; &gt; &gt;&gt; + func lexRightDelim(l *lexer) stateFn {<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 trimSpace :=3D strings.HasPrefix(=
l.input[l.pos:], rightTrimMarker)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 trimSpace :=3D hasRightTrimMarker=
(l.input[l.pos:])<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if trimSpace {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
l.pos +=3D trimMarkerLen<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
l.ignore()<br>
&gt; &gt; &gt;&gt; +@@ -369,7 +366,7 @@ func lexInsideAction(l *lexer) stat=
eFn {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return l.errorf(&quot;unclosed left paren&quot;)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch r :=3D l.next(); {<br=
>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 case r =3D=3D eof || isEndOfLine(=
r):<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 case r =3D=3D eof:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return l.errorf(&quot;unclosed action&quot;)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case isSpace(r):<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
l.backup() // Put space back in case we have &quot; -}}&quot;.<br>
&gt; &gt; &gt;&gt; +@@ -439,7 +436,7 @@ func lexSpace(l *lexer) stateFn {<b=
r>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Be careful about a trim-m=
arked closing delimiter, which has a minus<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// after a space. We know th=
ere is a space, so check for the &#39;-&#39; that might follow.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 if strings.HasPrefix(l.input[l.po=
s-1:], l.trimRightDelim) {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if hasRightTrimMarker(l.input[l.p=
os-1:]) &amp;&amp; strings.HasPrefix(l.input[l.pos-1+trimMarkerLen:], l.rig=
htDelim) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
l.backup() // Before the space.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
if numSpaces =3D=3D 1 {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0return lexRightDelim // On the delim, so go rig=
ht to that.<br>
&gt; &gt; &gt;&gt; +@@ -526,7 +523,7 @@ func lexFieldOrVariable(l *lexer, t=
yp itemType) stateFn {<br>
&gt; &gt; &gt;&gt; + // day to implement arithmetic.<br>
&gt; &gt; &gt;&gt; + func (l *lexer) atTerminator() bool {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0r :=3D l.peek()<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 if isSpace(r) || isEndOfLine(r) {=
<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if isSpace(r) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return true<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch r {<br>
&gt; &gt; &gt;&gt; +@@ -657,15 +654,18 @@ Loop:<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + // isSpace reports whether r is a space character.<br>
&gt; &gt; &gt;&gt; + func isSpace(r rune) bool {<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 return r =3D=3D &#39; &#39; || r =
=3D=3D &#39;\t&#39;<br>
&gt; &gt; &gt;&gt; +-}<br>
&gt; &gt; &gt;&gt; +-<br>
&gt; &gt; &gt;&gt; +-// isEndOfLine reports whether r is an end-of-line cha=
racter.<br>
&gt; &gt; &gt;&gt; +-func isEndOfLine(r rune) bool {<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 return r =3D=3D &#39;\r&#39; || r=
 =3D=3D &#39;\n&#39;<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return r =3D=3D &#39; &#39; || r =
=3D=3D &#39;\t&#39; || r =3D=3D &#39;\r&#39; || r =3D=3D &#39;\n&#39;<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + // isAlphaNumeric reports whether r is an alphabetic, =
digit, or underscore.<br>
&gt; &gt; &gt;&gt; + func isAlphaNumeric(r rune) bool {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return r =3D=3D &#39;_&#39; =
|| unicode.IsLetter(r) || unicode.IsDigit(r)<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; ++func hasLeftTrimMarker(s string) bool {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return len(s) &gt;=3D 2 &amp;&amp=
; s[0] =3D=3D trimMarker &amp;&amp; isSpace(rune(s[1]))<br>
&gt; &gt; &gt;&gt; ++}<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; ++func hasRightTrimMarker(s string) bool {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return len(s) &gt;=3D 2 &amp;&amp=
; isSpace(rune(s[0])) &amp;&amp; s[1] =3D=3D trimMarker<br>
&gt; &gt; &gt;&gt; ++}<br>
&gt; &gt; &gt;&gt; +diff --git a/src/text/template/parse/lex_test.go b/src/=
text/template/parse/lex_test.go<br>
&gt; &gt; &gt;&gt; +index f6d5f28..6510eed 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/text/template/parse/lex_test.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/text/template/parse/lex_test.go<br>
&gt; &gt; &gt;&gt; +@@ -323,7 +323,7 @@ var lexTests =3D []lexTest{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
tLeft,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
mkItem(itemError, &quot;unrecognized character in action: U+0001&quot;),<br=
>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}},<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 {&quot;unclosed action&quot;, &qu=
ot;{{\n}}&quot;, []item{<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;unclosed action&quot;, &qu=
ot;{{&quot;, []item{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
tLeft,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
mkItem(itemError, &quot;unclosed action&quot;),<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}},<br>
&gt; &gt; &gt;&gt; +diff --git a/src/text/template/parse/parse.go b/src/tex=
t/template/parse/parse.go<br>
&gt; &gt; &gt;&gt; +index 496d8bf..5e6e512 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/text/template/parse/parse.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/text/template/parse/parse.go<br>
&gt; &gt; &gt;&gt; +@@ -24,13 +24,14 @@ type Tree struct {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Mode=C2=A0 =C2=A0 =C2=A0 Mod=
e=C2=A0 =C2=A0 =C2=A0 // parsing mode.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0text=C2=A0 =C2=A0 =C2=A0 str=
ing=C2=A0 =C2=A0 // text parsed to create the template (or its parent)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Parsing only; cleared aft=
er parse.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 funcs=C2=A0 =C2=A0 =C2=A0[]map[st=
ring]interface{}<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 lex=C2=A0 =C2=A0 =C2=A0 =C2=A0*le=
xer<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 token=C2=A0 =C2=A0 =C2=A0[3]item =
// three-token lookahead for parser.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 peekCount int<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 vars=C2=A0 =C2=A0 =C2=A0 []string=
 // variables defined at the moment.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 treeSet=C2=A0 =C2=A0map[string]*T=
ree<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 mode=C2=A0 =C2=A0 =C2=A0 Mode<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 funcs=C2=A0 =C2=A0 =C2=A0 []map[s=
tring]interface{}<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 lex=C2=A0 =C2=A0 =C2=A0 =C2=A0 *l=
exer<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 token=C2=A0 =C2=A0 =C2=A0 [3]item=
 // three-token lookahead for parser.<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 peekCount=C2=A0 int<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 vars=C2=A0 =C2=A0 =C2=A0 =C2=A0[]=
string // variables defined at the moment.<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 treeSet=C2=A0 =C2=A0 map[string]*=
Tree<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 actionLine int // line of left de=
lim starting action<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 mode=C2=A0 =C2=A0 =C2=A0 =C2=A0Mo=
de<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + // A mode value is a set of flags (or 0). Modes contro=
l parser behavior.<br>
&gt; &gt; &gt;&gt; +@@ -187,6 +188,16 @@ func (t *Tree) expectOneOf(expecte=
d1, expected2 itemType, context string) item {<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + // unexpected complains about the token and terminates=
 processing.<br>
&gt; &gt; &gt;&gt; + func (t *Tree) unexpected(token item, context string) =
{<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if token.typ =3D=3D itemError {<b=
r>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extra=
 :=3D &quot;&quot;<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if t.=
actionLine !=3D 0 &amp;&amp; t.actionLine !=3D token.line {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 extra =3D fmt.Sprintf(&quot; in action started at =
%s:%d&quot;, t.ParseName, t.actionLine)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if strings.HasSuffix(token.val, &quot; action&quot=
;) {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extra =3D extra[len(&q=
uot; in action&quot;):] // avoid &quot;action in action&quot;<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.err=
orf(&quot;%s%s&quot;, token, extra)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t.errorf(&quot;unexpected %s=
 in %s&quot;, token, context)<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +@@ -350,6 +361,8 @@ func (t *Tree) textOrAction() Node =
{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case itemText:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return t.newText(token.pos, token.val)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case itemLeftDelim:<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.act=
ionLine =3D token.line<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 defer=
 t.clearActionLine()<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return t.action()<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case itemComment:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return t.newComment(token.pos, token.val)<br>
&gt; &gt; &gt;&gt; +@@ -359,6 +372,10 @@ func (t *Tree) textOrAction() Node=
 {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return nil<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; ++func (t *Tree) clearActionLine() {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 t.actionLine =3D 0<br>
&gt; &gt; &gt;&gt; ++}<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; + // Action:<br>
&gt; &gt; &gt;&gt; + //=C2=A0 =C2=A0 control<br>
&gt; &gt; &gt;&gt; + //=C2=A0 =C2=A0 command (&quot;|&quot; command)*<br>
&gt; &gt; &gt;&gt; +@@ -384,12 +401,12 @@ func (t *Tree) action() (n Node) =
{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t.backup()<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0token :=3D t.peek()<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Do not pop variables; the=
y persist until &quot;end&quot;.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 return t.newAction(token.pos, tok=
en.line, t.pipeline(&quot;command&quot;))<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return t.newAction(token.pos, tok=
en.line, t.pipeline(&quot;command&quot;, itemRightDelim))<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + // Pipeline:<br>
&gt; &gt; &gt;&gt; + //=C2=A0 =C2=A0 declarations? command (&#39;|&#39; com=
mand)*<br>
&gt; &gt; &gt;&gt; +-func (t *Tree) pipeline(context string) (pipe *PipeNod=
e) {<br>
&gt; &gt; &gt;&gt; ++func (t *Tree) pipeline(context string, end itemType) =
(pipe *PipeNode) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0token :=3D t.peekNonSpace()<=
br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pipe =3D t.newPipeline(token=
.pos, token.line, nil)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Are there declarations or=
 assignments?<br>
&gt; &gt; &gt;&gt; +@@ -430,12 +447,9 @@ decls:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
switch token :=3D t.nextNonSpace(); token.typ {<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case =
itemRightDelim, itemRightParen:<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case =
end:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0// At this point, the pipeline is complete<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0t.checkPipeline(pipe, context)<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if token.typ =3D=3D itemRightParen {<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.backup()<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
case itemBool, itemCharConstant, itemComplex, itemDot, itemField, itemIdent=
ifier,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0itemNumber, itemNil, itemRawString, itemString,=
 itemVariable, itemLeftParen:<br>
&gt; &gt; &gt;&gt; +@@ -464,7 +478,7 @@ func (t *Tree) checkPipeline(pipe *=
PipeNode, context string) {<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + func (t *Tree) parseControl(allowElseIf bool, context =
string) (pos Pos, line int, pipe *PipeNode, list, elseList *ListNode) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0defer t.popVars(len(t.vars))=
<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 pipe =3D t.pipeline(context)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 pipe =3D t.pipeline(context, item=
RightDelim)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0var next Node<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0list, next =3D t.itemList()<=
br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch next.Type() {<br>
&gt; &gt; &gt;&gt; +@@ -550,7 +564,7 @@ func (t *Tree) blockControl() Node =
{<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0token :=3D t.nextNonSpace()<=
br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0name :=3D t.parseTemplateNam=
e(token, context)<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 pipe :=3D t.pipeline(context)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 pipe :=3D t.pipeline(context, ite=
mRightDelim)<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0block :=3D New(name) // name=
 will be updated once we know it.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0block.text =3D t.text<br>
&gt; &gt; &gt;&gt; +@@ -580,7 +594,7 @@ func (t *Tree) templateControl() No=
de {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if t.nextNonSpace().typ !=3D=
 itemRightDelim {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
t.backup()<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
// Do not pop variables; they persist until &quot;end&quot;.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pipe =
=3D t.pipeline(context)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pipe =
=3D t.pipeline(context, itemRightDelim)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return t.newTemplate(token.p=
os, token.line, name, pipe)<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +@@ -614,13 +628,12 @@ func (t *Tree) command() *Command=
Node {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
switch token :=3D t.next(); token.typ {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
case itemSpace:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case =
itemError:<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 t.errorf(&quot;%s&quot;, token.val)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
case itemRightDelim, itemRightParen:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0t.backup()<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
case itemPipe:<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 // nothing here; break loop below<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
default:<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 t.errorf(&quot;unexpected %s in operand&quot;, tok=
en)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 t.unexpected(token, &quot;operand&quot;)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
break<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; +@@ -675,8 +688,6 @@ func (t *Tree) operand() Node {<br>
&gt; &gt; &gt;&gt; + // A nil return means the next item is not a term.<br>
&gt; &gt; &gt;&gt; + func (t *Tree) term() Node {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch token :=3D t.nextNonS=
pace(); token.typ {<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 case itemError:<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.err=
orf(&quot;%s&quot;, token.val)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case itemIdentifier:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
if !t.hasFunction(token.val) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0t.errorf(&quot;function %q not defined&quot;, t=
oken.val)<br>
&gt; &gt; &gt;&gt; +@@ -699,11 +710,7 @@ func (t *Tree) term() Node {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return number<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case itemLeftParen:<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pipe =
:=3D t.pipeline(&quot;parenthesized pipeline&quot;)<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if to=
ken :=3D t.next(); token.typ !=3D itemRightParen {<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 t.errorf(&quot;unclosed right paren: unexpected %s=
&quot;, token)<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retur=
n pipe<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retur=
n t.pipeline(&quot;parenthesized pipeline&quot;, itemRightParen)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case itemString, itemRawStri=
ng:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
s, err :=3D strconv.Unquote(token.val)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
if err !=3D nil {<br>
&gt; &gt; &gt;&gt; +diff --git a/src/text/template/parse/parse_test.go b/sr=
c/text/template/parse/parse_test.go<br>
&gt; &gt; &gt;&gt; +index d9c13c5..220f984 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/text/template/parse/parse_test.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/text/template/parse/parse_test.go<br>
&gt; &gt; &gt;&gt; +@@ -250,6 +250,13 @@ var parseTests =3D []parseTest{<br=
>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;comment trim left and=
 right&quot;, &quot;x \r\n\t{{- /* */ -}}\n\n\ty&quot;, noError, `&quot;x&q=
uot;&quot;y&quot;`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;block definition&quot=
;, `{{block &quot;foo&quot; .}}hello{{end}}`, noError,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
`{{template &quot;foo&quot; .}}`},<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;newline in assignment&quot=
;, &quot;{{ $x \n :=3D \n 1 \n }}&quot;, noError, &quot;{{$x :=3D 1}}&quot;=
},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;newline in empty action&qu=
ot;, &quot;{{\n}}&quot;, hasError, &quot;{{\n}}&quot;},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;newline in pipeline&quot;,=
 &quot;{{\n\&quot;x\&quot;\n|\nprintf\n}}&quot;, noError, `{{&quot;x&quot; =
| printf}}`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;newline in comment&quot;, =
&quot;{{/*\nhello\n*/}}&quot;, noError, &quot;&quot;},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;newline in comment&quot;, =
&quot;{{-\n/*\nhello\n*/\n-}}&quot;, noError, &quot;&quot;},<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Errors.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;unclosed action&quot;=
, &quot;hello{{range&quot;, hasError, &quot;&quot;},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;unmatched end&quot;, =
&quot;{{end}}&quot;, hasError, &quot;&quot;},<br>
&gt; &gt; &gt;&gt; +@@ -426,23 +433,38 @@ var errorTests =3D []parseTest{<b=
r>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Check line numbers are ac=
curate.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;unclosed1&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;line1\n{{&quot;,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasEr=
ror, `unclosed1:2: unexpected unclosed action in command`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasEr=
ror, `unclosed1:2: unclosed action`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;unclosed2&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;line1\n{{define `x`}}line2\n{{&quot;,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasEr=
ror, `unclosed2:3: unexpected unclosed action in command`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasEr=
ror, `unclosed2:3: unclosed action`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;unclosed3&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;line1\n{{\&quot;x\&quot;\n\&quot;y\&quot;\n&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasEr=
ror, `unclosed3:4: unclosed action started at unclosed3:2`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;unclosed4&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;{{\n\n\n\n\n&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasEr=
ror, `unclosed4:6: unclosed action started at unclosed4:1`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;var1&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;line1\n{{\nx\n}}&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasEr=
ror, `var1:3: function &quot;x&quot; not defined`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Specific errors.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;function&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;{{foo}}&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
hasError, `function &quot;foo&quot; not defined`},<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 {&quot;comment&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;comment1&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;{{/*}}&quot;,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasEr=
ror, `unclosed comment`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasEr=
ror, `comment1:1: unclosed comment`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;comment2&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;{{/*\nhello\n}}&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasEr=
ror, `comment2:1: unclosed comment`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;lparen&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;{{.X (1 2 3}}&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
hasError, `unclosed left paren`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;rparen&quot;,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;{{.X 1 2 3)}}&quot;,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasEr=
ror, `unexpected &quot;)&quot;`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;{{.X 1 2 3 ) }}&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasEr=
ror, `unexpected &quot;)&quot; in command`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;rparen2&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;{{(.X 1 2 3&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasEr=
ror, `unclosed action`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;space&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;{{`x`3}}&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
hasError, `in operand`},<br>
&gt; &gt; &gt;&gt; +@@ -488,7 +510,7 @@ var errorTests =3D []parseTest{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
hasError, `missing value for parenthesized pipeline`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;multilinerawstring&qu=
ot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;{{ $v :=3D `\n` }} {{&quot;,<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasEr=
ror, `multilinerawstring:2: unexpected unclosed action`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasEr=
ror, `multilinerawstring:2: unclosed action`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;rangeundefvar&quot;,<=
br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;{{range $k}}{{end}}&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
hasError, `undefined variable`},<br>
&gt; &gt; &gt;&gt; +--<br>
&gt; &gt; &gt;&gt; +2.7.4<br>
&gt; &gt; &gt;&gt; diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-2=
4538_5.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_5.patch<br>
&gt; &gt; &gt;&gt; new file mode 100644<br>
&gt; &gt; &gt;&gt; index 0000000000..fc38929648<br>
&gt; &gt; &gt;&gt; --- /dev/null<br>
&gt; &gt; &gt;&gt; +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_5.=
patch<br>
&gt; &gt; &gt;&gt; @@ -0,0 +1,585 @@<br>
&gt; &gt; &gt;&gt; +From e0e6bca6ddc0e6d9fa3a5b644af9b446924fbf83 Mon Sep 1=
7 00:00:00 2001<br>
&gt; &gt; &gt;&gt; +From: Russ Cox &lt;<a href=3D"mailto:rsc@golang.org" ta=
rget=3D"_blank">rsc@golang.org</a>&gt;<br>
&gt; &gt; &gt;&gt; +Date: Thu, 20 May 2021 12:46:33 -0400<br>
&gt; &gt; &gt;&gt; +Subject: [PATCH 5/6] html/template, text/template: impl=
ement break and<br>
&gt; &gt; &gt;&gt; + continue for range loops<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +Break and continue for range loops was accepted as a pr=
oposal in June 2017.<br>
&gt; &gt; &gt;&gt; +It was implemented in CL 66410 (Oct 2017)<br>
&gt; &gt; &gt;&gt; +but then rolled back in CL 92155 (Feb 2018)<br>
&gt; &gt; &gt;&gt; +because html/template changes had not been implemented.=
<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +This CL reimplements break and continue in text/templat=
e<br>
&gt; &gt; &gt;&gt; +and then adds support for them in html/template as well=
.<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +Fixes #20531.<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +Change-Id: I05330482a976f1c078b4b49c2287bd9031bb7616<br=
>
&gt; &gt; &gt;&gt; +Reviewed-on: <a href=3D"https://go-review.googlesource.=
com/c/go/+/321491" rel=3D"noreferrer" target=3D"_blank">https://go-review.g=
ooglesource.com/c/go/+/321491</a><br>
&gt; &gt; &gt;&gt; +Trust: Russ Cox &lt;<a href=3D"mailto:rsc@golang.org" t=
arget=3D"_blank">rsc@golang.org</a>&gt;<br>
&gt; &gt; &gt;&gt; +Run-TryBot: Russ Cox &lt;<a href=3D"mailto:rsc@golang.o=
rg" target=3D"_blank">rsc@golang.org</a>&gt;<br>
&gt; &gt; &gt;&gt; +TryBot-Result: Go Bot &lt;<a href=3D"mailto:gobot@golan=
g.org" target=3D"_blank">gobot@golang.org</a>&gt;<br>
&gt; &gt; &gt;&gt; +Reviewed-by: Rob Pike &lt;<a href=3D"mailto:r@golang.or=
g" target=3D"_blank">r@golang.org</a>&gt;<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +Dependency Patch #5<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +Upstream-Status: Backport from <a href=3D"https://githu=
b.com/golang/go/commit/d0dd26a88c019d54f22463daae81e785f5867565" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/golang/go/commit/d0dd26a88c01=
9d54f22463daae81e785f5867565</a><br>
&gt; &gt; &gt;&gt; +CVE: CVE-2023-24538<br>
&gt; &gt; &gt;&gt; +Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:s=
kulkarni@mvista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt; &gt; &gt;&gt; +---<br>
&gt; &gt; &gt;&gt; + src/html/template/context.go=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 4 ++<br>
&gt; &gt; &gt;&gt; + src/html/template/escape.go=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 71 ++++++++++++++++++++++++++++++++++-<br>
&gt; &gt; &gt;&gt; + src/html/template/escape_test.go=C2=A0 =C2=A0 =C2=A0 |=
 24 ++++++++++++<br>
&gt; &gt; &gt;&gt; + src/text/template/doc.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++<br>
&gt; &gt; &gt;&gt; + src/text/template/exec.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 24 +++++++++++-<br>
&gt; &gt; &gt;&gt; + src/text/template/exec_test.go=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +<br>
&gt; &gt; &gt;&gt; + src/text/template/parse/lex.go=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 13 ++++++-<br>
&gt; &gt; &gt;&gt; + src/text/template/parse/lex_test.go=C2=A0 =C2=A0|=C2=
=A0 2 +<br>
&gt; &gt; &gt;&gt; + src/text/template/parse/node.go=C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 36 ++++++++++++++++++<br>
&gt; &gt; &gt;&gt; + src/text/template/parse/parse.go=C2=A0 =C2=A0 =C2=A0 |=
 42 ++++++++++++++++++++-<br>
&gt; &gt; &gt;&gt; + src/text/template/parse/parse_test.go |=C2=A0 8 ++++<b=
r>
&gt; &gt; &gt;&gt; + 11 files changed, 230 insertions(+), 4 deletions(-)<br=
>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +diff --git a/src/html/template/context.go b/src/html/te=
mplate/context.go<br>
&gt; &gt; &gt;&gt; +index f7d4849..aaa7d08 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/html/template/context.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/html/template/context.go<br>
&gt; &gt; &gt;&gt; +@@ -6,6 +6,7 @@ package template<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + import (<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;fmt&quot;<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;text/template/parse&quot;<b=
r>
&gt; &gt; &gt;&gt; + )<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + // context describes the state an HTML parser must be =
in when it reaches the<br>
&gt; &gt; &gt;&gt; +@@ -22,6 +23,7 @@ type context struct {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0jsCtx=C2=A0 =C2=A0jsCtx<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0attr=C2=A0 =C2=A0 attr<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0element element<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 n=C2=A0 =C2=A0 =C2=A0 =C2=A0parse=
.Node // for range break/continue<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0err=C2=A0 =C2=A0 =C2=A0*Erro=
r<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +@@ -141,6 +143,8 @@ const (<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// stateError is an infectio=
us error state outside any valid<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// HTML/CSS/JS construct.<br=
>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0stateError<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // stateDead marks unreachable co=
de after a {{break}} or {{continue}}.<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 stateDead<br>
&gt; &gt; &gt;&gt; + )<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + // isComment is true for any state that contains conte=
nt meant for template<br>
&gt; &gt; &gt;&gt; +diff --git a/src/html/template/escape.go b/src/html/tem=
plate/escape.go<br>
&gt; &gt; &gt;&gt; +index 8739735..6dea79c 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/html/template/escape.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/html/template/escape.go<br>
&gt; &gt; &gt;&gt; +@@ -97,6 +97,15 @@ type escaper struct {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0actionNodeEdits=C2=A0 =C2=A0=
map[*parse.ActionNode][]string<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0templateNodeEdits map[*parse=
.TemplateNode]string<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0textNodeEdits=C2=A0 =C2=A0 =
=C2=A0map[*parse.TextNode][]byte<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // rangeContext holds context abo=
ut the current range loop.<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 rangeContext *rangeContext<br>
&gt; &gt; &gt;&gt; ++}<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; ++// rangeContext holds information about the current ra=
nge loop.<br>
&gt; &gt; &gt;&gt; ++type rangeContext struct {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 outer=C2=A0 =C2=A0 =C2=A0*rangeCo=
ntext // outer loop<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 breaks=C2=A0 =C2=A0 []context=C2=
=A0 =C2=A0 =C2=A0// context at each break action<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 continues []context=C2=A0 =C2=A0 =
=C2=A0// context at each continue action<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + // makeEscaper creates a blank escaper for the given s=
et.<br>
&gt; &gt; &gt;&gt; +@@ -109,6 +118,7 @@ func makeEscaper(n *nameSpace) esca=
per {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
map[*parse.ActionNode][]string{},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
map[*parse.TemplateNode]string{},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
map[*parse.TextNode][]byte{},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nil,<=
br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +@@ -124,8 +134,16 @@ func (e *escaper) escape(c context=
, n parse.Node) context {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch n :=3D n.(type) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.ActionNode:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return e.escapeAction(c, n)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 case *parse.BreakNode:<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c.n =
=3D n<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e.ran=
geContext.breaks =3D append(e.rangeContext.breaks, c)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retur=
n context{state: stateDead}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.CommentNode:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return c<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 case *parse.ContinueNode:<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c.n =
=3D n<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e.ran=
geContext.continues =3D append(e.rangeContext.breaks, c)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retur=
n context{state: stateDead}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.IfNode:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return e.escapeBranch(c, &amp;n.BranchNode, &quot;if&quot;)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.ListNode:<br>
&gt; &gt; &gt;&gt; +@@ -427,6 +445,12 @@ func join(a, b context, node parse=
.Node, nodeName string) context {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if b.state =3D=3D stateError=
 {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return b<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if a.state =3D=3D stateDead {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retur=
n b<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if b.state =3D=3D stateDead {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retur=
n a<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if a.eq(b) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return a<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; +@@ -466,14 +490,27 @@ func join(a, b context, node pars=
e.Node, nodeName string) context {<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + // escapeBranch escapes a branch template node: &quot;=
if&quot;, &quot;range&quot; and &quot;with&quot;.<br>
&gt; &gt; &gt;&gt; + func (e *escaper) escapeBranch(c context, n *parse.Bra=
nchNode, nodeName string) context {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if nodeName =3D=3D &quot;range&qu=
ot; {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e.ran=
geContext =3D &amp;rangeContext{outer: e.rangeContext}<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0c0 :=3D e.escapeList(c, n.Li=
st)<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 if nodeName =3D=3D &quot;range&qu=
ot; &amp;&amp; c0.state !=3D stateError {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if nodeName =3D=3D &quot;range&qu=
ot; {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if c0=
.state !=3D stateError {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 c0 =3D joinRange(c0, e.rangeContext)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e.ran=
geContext =3D e.rangeContext.outer<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if c0=
.state =3D=3D stateError {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 return c0<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
// The &quot;true&quot; branch of a &quot;range&quot; node can execute mult=
iple times.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
// We check that executing n.List once results in the same context<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
// as executing n.List twice.<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e.ran=
geContext =3D &amp;rangeContext{outer: e.rangeContext}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
c1, _ :=3D e.escapeListConditionally(c0, n.List, nil)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
c0 =3D join(c0, c1, n, nodeName)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
if c0.state =3D=3D stateError {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 e.rangeContext =3D e.rangeContext.outer<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Make clear that this is a problem on loop re=
-entry<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0// since developers tend to overlook that branc=
h when<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0// debugging templates.<br>
&gt; &gt; &gt;&gt; +@@ -481,11 +518,39 @@ func (e *escaper) escapeBranch(c =
context, n *parse.BranchNode, nodeName string)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0c0.err.Description =3D &quot;on range loop re-e=
ntry: &quot; + c0.err.Description<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0return c0<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
}<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c0 =
=3D joinRange(c0, e.rangeContext)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e.ran=
geContext =3D e.rangeContext.outer<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if c0=
.state =3D=3D stateError {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 return c0<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0c1 :=3D e.escapeList(c, n.El=
seList)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return join(c0, c1, n, nodeN=
ame)<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; ++func joinRange(c0 context, rc *rangeContext) context {=
<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // Merge contexts at break and co=
ntinue statements into overall body context.<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // In theory we could treat break=
s differently from continues, but for now it is<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // enough to treat them both as g=
oing back to the start of the loop (which may then stop).<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 for _, c :=3D range rc.breaks {<b=
r>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c0 =
=3D join(c0, c, c.n, &quot;range&quot;)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if c0=
.state =3D=3D stateError {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 c0.err.Line =3D c.n.(*parse.BreakNode).Line<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 c0.err.Description =3D &quot;at range loop break: =
&quot; + c0.err.Description<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 return c0<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 for _, c :=3D range rc.continues =
{<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c0 =
=3D join(c0, c, c.n, &quot;range&quot;)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if c0=
.state =3D=3D stateError {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 c0.err.Line =3D c.n.(*parse.ContinueNode).Line<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 c0.err.Description =3D &quot;at range loop continu=
e: &quot; + c0.err.Description<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 return c0<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return c0<br>
&gt; &gt; &gt;&gt; ++}<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; + // escapeList escapes a list template node.<br>
&gt; &gt; &gt;&gt; + func (e *escaper) escapeList(c context, n *parse.ListN=
ode) context {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if n =3D=3D nil {<br>
&gt; &gt; &gt;&gt; +@@ -493,6 +558,9 @@ func (e *escaper) escapeList(c cont=
ext, n *parse.ListNode) context {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, m :=3D range n.Nodes =
{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
c =3D e.escape(c, m)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if c.=
state =3D=3D stateDead {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return c<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +@@ -503,6 +571,7 @@ func (e *escaper) escapeList(c cont=
ext, n *parse.ListNode) context {<br>
&gt; &gt; &gt;&gt; + // which is the same as whether e was updated.<br>
&gt; &gt; &gt;&gt; + func (e *escaper) escapeListConditionally(c context, n=
 *parse.ListNode, filter func(*escaper, context) bool) (context, bool) {<br=
>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0e1 :=3D makeEscaper(e.ns)<br=
>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 e1.rangeContext =3D e.rangeContex=
t<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Make type inferences avai=
lable to f.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for k, v :=3D range e.output=
 {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
e1.output[k] =3D v<br>
&gt; &gt; &gt;&gt; +diff --git a/src/html/template/escape_test.go b/src/htm=
l/template/escape_test.go<br>
&gt; &gt; &gt;&gt; +index c709660..fa2b84a 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/html/template/escape_test.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/html/template/escape_test.go<br>
&gt; &gt; &gt;&gt; +@@ -920,6 +920,22 @@ func TestErrors(t *testing.T) {<br=
>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&lt;a href=3D&#39;/foo?{{range .Items}}&a=
mp;{{.K}}=3D{{.V}}{{end}}&#39;&gt;&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;{{range .Items}}&lt;a{{if .X}}{{end}}&gt;{{e=
nd}}&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br=
>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;{{range .Items}}&lt;a{{if .X}}{{end}}&gt;{{c=
ontinue}}{{end}}&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br=
>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;{{range .Items}}&lt;a{{if .X}}{{end}}&gt;{{b=
reak}}{{end}}&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br=
>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;{{range .Items}}&lt;a{{if .X}}{{end}}&gt;{{i=
f .X}}{{break}}{{end}}{{end}}&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br=
>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
// Error cases.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;{{if .Cond}}&lt;a{{end}}&quot;,<br>
&gt; &gt; &gt;&gt; +@@ -956,6 +972,14 @@ func TestErrors(t *testing.T) {<br=
>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;z:2:8: on range loop re-entry: {{range}} =
branches&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;{{range .Items}}&lt;a{{if .X}}{{break}}{{end=
}}&gt;{{end}}&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;z:1:29: at range loop break: {{range}} branc=
hes end in different contexts&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br=
>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;{{range .Items}}&lt;a{{if .X}}{{continue}}{{=
end}}&gt;{{end}}&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;z:1:29: at range loop continue: {{range}} br=
anches end in different contexts&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br=
>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&lt;a b=3D1 c=3D{{.H}}&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;z: ends in a non-text context: {stateAttr=
 delimSpaceOrTagEnd&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
},<br>
&gt; &gt; &gt;&gt; +diff --git a/src/text/template/doc.go b/src/text/templa=
te/doc.go<br>
&gt; &gt; &gt;&gt; +index 7b30294..0228b15 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/text/template/doc.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/text/template/doc.go<br>
&gt; &gt; &gt;&gt; +@@ -112,6 +112,14 @@ data, defined in detail in the cor=
responding sections that follow.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
T0 is executed; otherwise, dot is set to the successive elements<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
of the array, slice, or map and T1 is executed.<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {{break}}<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The i=
nnermost {{range pipeline}} loop is ended early, stopping the<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curre=
nt iteration and bypassing all remaining iterations.<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {{continue}}<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The c=
urrent iteration of the innermost {{range pipeline}} loop is<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stopp=
ed, and the loop starts the next iteration.<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{{template &quot;name&quot;}=
}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
The template with the specified name is executed with nil data.<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +diff --git a/src/text/template/exec.go b/src/text/templ=
ate/exec.go<br>
&gt; &gt; &gt;&gt; +index 7ac5175..6cb140a 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/text/template/exec.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/text/template/exec.go<br>
&gt; &gt; &gt;&gt; +@@ -5,6 +5,7 @@<br>
&gt; &gt; &gt;&gt; + package template<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + import (<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;errors&quot;<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;fmt&quot;<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;internal/fmtsort&quot;=
<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;io&quot;<br>
&gt; &gt; &gt;&gt; +@@ -244,6 +245,12 @@ func (t *Template) DefinedTemplate=
s() string {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return b.String()<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; ++// Sentinel errors for use with panic to signal early =
exits from range loops.<br>
&gt; &gt; &gt;&gt; ++var (<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 walkBreak=C2=A0 =C2=A0 =3D errors=
.New(&quot;break&quot;)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 walkContinue =3D errors.New(&quot=
;continue&quot;)<br>
&gt; &gt; &gt;&gt; ++)<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; + // Walk functions step through the major pieces of the=
 template structure,<br>
&gt; &gt; &gt;&gt; + // generating output as they go.<br>
&gt; &gt; &gt;&gt; + func (s *state) walk(dot reflect.Value, node parse.Nod=
e) {<br>
&gt; &gt; &gt;&gt; +@@ -256,7 +263,11 @@ func (s *state) walk(dot reflect.V=
alue, node parse.Node) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
if len(node.Pipe.Decl) =3D=3D 0 {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0s.printValue(node, val)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
}<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 case *parse.BreakNode:<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic=
(walkBreak)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.CommentNode:<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 case *parse.ContinueNode:<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic=
(walkContinue)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.IfNode:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
s.walkIfOrWith(parse.NodeIf, dot, node.Pipe, node.List, node.ElseList)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.ListNode:<br>
&gt; &gt; &gt;&gt; +@@ -335,6 +346,11 @@ func isTrue(val reflect.Value) (tr=
uth, ok bool) {<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + func (s *state) walkRange(dot reflect.Value, r *parse.=
RangeNode) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://s.at" rel=
=3D"noreferrer" target=3D"_blank">s.at</a>(r)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 defer func() {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if r =
:=3D recover(); r !=3D nil &amp;&amp; r !=3D walkBreak {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 panic(r)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }()<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0defer s.pop(s.mark())<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0val, _ :=3D indirect(s.evalP=
ipeline(dot, r.Pipe))<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// mark top of stack before =
any variables in the body are pushed.<br>
&gt; &gt; &gt;&gt; +@@ -348,8 +364,14 @@ func (s *state) walkRange(dot refl=
ect.Value, r *parse.RangeNode) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
if len(r.Pipe.Decl) &gt; 1 {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0s.setTopVar(2, index)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
}<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 defer=
 s.pop(mark)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 defer=
 func() {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 // Consume panic(walkContinue)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if r :=3D recover(); r !=3D nil &amp;&amp; r !=3D =
walkContinue {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(r)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }()<b=
r>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
s.walk(elem, r.List)<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s.pop=
(mark)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch val.Kind() {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case reflect.Array, reflect.=
Slice:<br>
&gt; &gt; &gt;&gt; +diff --git a/src/text/template/exec_test.go b/src/text/=
template/exec_test.go<br>
&gt; &gt; &gt;&gt; +index 3309b33..a639f44 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/text/template/exec_test.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/text/template/exec_test.go<br>
&gt; &gt; &gt;&gt; +@@ -563,6 +563,8 @@ var execTests =3D []execTest{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;range empty no else&q=
uot;, &quot;{{range .SIEmpty}}-{{.}}-{{end}}&quot;, &quot;&quot;, tVal, tru=
e},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;range []int else&quot=
;, &quot;{{range .SI}}-{{.}}-{{else}}EMPTY{{end}}&quot;, &quot;-3--4--5-&qu=
ot;, tVal, true},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;range empty else&quot=
;, &quot;{{range .SIEmpty}}-{{.}}-{{else}}EMPTY{{end}}&quot;, &quot;EMPTY&q=
uot;, tVal, true},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;range []int break else&quo=
t;, &quot;{{range .SI}}-{{.}}-{{break}}NOTREACHED{{else}}EMPTY{{end}}&quot;=
, &quot;-3-&quot;, tVal, true},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;range []int continue else&=
quot;, &quot;{{range .SI}}-{{.}}-{{continue}}NOTREACHED{{else}}EMPTY{{end}}=
&quot;, &quot;-3--4--5-&quot;, tVal, true},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;range []bool&quot;, &=
quot;{{range .SB}}-{{.}}-{{end}}&quot;, &quot;-true--false-&quot;, tVal, tr=
ue},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;range []int method&qu=
ot;, &quot;{{range .SI | .MAdd .I}}-{{.}}-{{end}}&quot;, &quot;-20--21--22-=
&quot;, tVal, true},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;range map&quot;, &quo=
t;{{range .MSI}}-{{.}}-{{end}}&quot;, &quot;-1--3--2-&quot;, tVal, true},<b=
r>
&gt; &gt; &gt;&gt; +diff --git a/src/text/template/parse/lex.go b/src/text/=
template/parse/lex.go<br>
&gt; &gt; &gt;&gt; +index 6784071..95e3377 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/text/template/parse/lex.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/text/template/parse/lex.go<br>
&gt; &gt; &gt;&gt; +@@ -62,6 +62,8 @@ const (<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Keywords appear after all=
 the rest.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemKeyword=C2=A0 // used on=
ly to delimit the keywords<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemBlock=C2=A0 =C2=A0 // bl=
ock keyword<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 itemBreak=C2=A0 =C2=A0 // break k=
eyword<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 itemContinue // continue keyword<=
br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemDot=C2=A0 =C2=A0 =C2=A0 =
// the cursor, spelled &#39;.&#39;<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemDefine=C2=A0 =C2=A0// de=
fine keyword<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemElse=C2=A0 =C2=A0 =C2=A0=
// else keyword<br>
&gt; &gt; &gt;&gt; +@@ -76,6 +78,8 @@ const (<br>
&gt; &gt; &gt;&gt; + var key =3D map[string]itemType{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;.&quot;:=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 itemDot,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;block&quot;:=C2=A0 =C2=
=A0 itemBlock,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;break&quot;:=C2=A0 =C2=A0 i=
temBreak,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;continue&quot;: itemContinu=
e,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;define&quot;:=C2=A0 =
=C2=A0itemDefine,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;else&quot;:=C2=A0 =C2=
=A0 =C2=A0itemElse,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;end&quot;:=C2=A0 =C2=
=A0 =C2=A0 itemEnd,<br>
&gt; &gt; &gt;&gt; +@@ -119,6 +123,8 @@ type lexer struct {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0parenDepth=C2=A0 int=C2=A0 =
=C2=A0 =C2=A0 =C2=A0// nesting depth of ( ) exprs<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0line=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0// 1+number of newlines seen<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0startLine=C2=A0 =C2=A0int=C2=
=A0 =C2=A0 =C2=A0 =C2=A0// start line of this item<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 breakOK=C2=A0 =C2=A0 =C2=A0bool=
=C2=A0 =C2=A0 =C2=A0 // break keyword allowed<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 continueOK=C2=A0 bool=C2=A0 =C2=
=A0 =C2=A0 // continue keyword allowed<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + // next returns the next rune in the input.<br>
&gt; &gt; &gt;&gt; +@@ -461,7 +467,12 @@ Loop:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0case key[word] &gt; itemKeyword:<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 l.emit(key[word])<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 item :=3D key[word]<br=
>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if item =3D=3D itemBre=
ak &amp;&amp; !l.breakOK || item =3D=3D itemContinue &amp;&amp; !l.continue=
OK {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 l.emit(itemIdentifier)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 l.emit(item)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0case word[0] =3D=3D &#39;.&#39;:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0l.emit(itemField)<b=
r>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0case word =3D=3D &quot;true&quot;, word =3D=3D =
&quot;false&quot;:<br>
&gt; &gt; &gt;&gt; +diff --git a/src/text/template/parse/lex_test.go b/src/=
text/template/parse/lex_test.go<br>
&gt; &gt; &gt;&gt; +index 6510eed..df6aabf 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/text/template/parse/lex_test.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/text/template/parse/lex_test.go<br>
&gt; &gt; &gt;&gt; +@@ -35,6 +35,8 @@ var itemName =3D map[itemType]string{=
<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// keywords<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemDot:=C2=A0 =C2=A0 =C2=A0=
 &quot;.&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemBlock:=C2=A0 =C2=A0 &quo=
t;block&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 itemBreak:=C2=A0 =C2=A0 &quot;bre=
ak&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 itemContinue: &quot;continue&quot=
;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemDefine:=C2=A0 =C2=A0&quo=
t;define&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemElse:=C2=A0 =C2=A0 =C2=
=A0&quot;else&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemIf:=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;if&quot;,<br>
&gt; &gt; &gt;&gt; +diff --git a/src/text/template/parse/node.go b/src/text=
/template/parse/node.go<br>
&gt; &gt; &gt;&gt; +index a9dad5e..c398da0 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/text/template/parse/node.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/text/template/parse/node.go<br>
&gt; &gt; &gt;&gt; +@@ -71,6 +71,8 @@ const (<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NodeVariable=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// A $ variable.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NodeWith=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// A with ac=
tion.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NodeComment=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // A comment.<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 NodeBreak=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // A break action.<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 NodeContinue=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// A continue action.<br>
&gt; &gt; &gt;&gt; + )<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + // Nodes.<br>
&gt; &gt; &gt;&gt; +@@ -907,6 +909,40 @@ func (i *IfNode) Copy() Node {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return i.tr.newIf(i.Pos, i.L=
ine, i.Pipe.CopyPipe(), i.List.CopyList(), i.ElseList.CopyList())<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; ++// BreakNode represents a {{break}} action.<br>
&gt; &gt; &gt;&gt; ++type BreakNode struct {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 tr *Tree<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 NodeType<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 Pos<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 Line int<br>
&gt; &gt; &gt;&gt; ++}<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; ++func (t *Tree) newBreak(pos Pos, line int) *BreakNode =
{<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return &amp;BreakNode{tr: t, Node=
Type: NodeBreak, Pos: pos, Line: line}<br>
&gt; &gt; &gt;&gt; ++}<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; ++func (b *BreakNode) Copy() Node=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { return b.tr.newBreak(b.Pos, b.L=
ine) }<br>
&gt; &gt; &gt;&gt; ++func (b *BreakNode) String() string=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { return &quot;{{break}}&quot; }<br>
&gt; &gt; &gt;&gt; ++func (b *BreakNode) tree() *Tree=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ return <a href=3D"http://b.tr" r=
el=3D"noreferrer" target=3D"_blank">b.tr</a> }<br>
&gt; &gt; &gt;&gt; ++func (b *BreakNode) writeTo(sb *strings.Builder) { sb.=
WriteString(&quot;{{break}}&quot;) }<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; ++// ContinueNode represents a {{continue}} action.<br>
&gt; &gt; &gt;&gt; ++type ContinueNode struct {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 tr *Tree<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 NodeType<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 Pos<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 Line int<br>
&gt; &gt; &gt;&gt; ++}<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; ++func (t *Tree) newContinue(pos Pos, line int) *Continu=
eNode {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return &amp;ContinueNode{tr: t, N=
odeType: NodeContinue, Pos: pos, Line: line}<br>
&gt; &gt; &gt;&gt; ++}<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; ++func (c *ContinueNode) Copy() Node=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { return c.tr.newContinue(c.Pos,=
 c.Line) }<br>
&gt; &gt; &gt;&gt; ++func (c *ContinueNode) String() string=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { return &quot;{{continue}}&quot; }<br>
&gt; &gt; &gt;&gt; ++func (c *ContinueNode) tree() *Tree=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ return <a href=3D"http://c.t=
r" rel=3D"noreferrer" target=3D"_blank">c.tr</a> }<br>
&gt; &gt; &gt;&gt; ++func (c *ContinueNode) writeTo(sb *strings.Builder) { =
sb.WriteString(&quot;{{continue}}&quot;) }<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; + // RangeNode represents a {{range}} action and its com=
mands.<br>
&gt; &gt; &gt;&gt; + type RangeNode struct {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0BranchNode<br>
&gt; &gt; &gt;&gt; +diff --git a/src/text/template/parse/parse.go b/src/tex=
t/template/parse/parse.go<br>
&gt; &gt; &gt;&gt; +index 5e6e512..7f78b56 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/text/template/parse/parse.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/text/template/parse/parse.go<br>
&gt; &gt; &gt;&gt; +@@ -31,6 +31,7 @@ type Tree struct {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vars=C2=A0 =C2=A0 =C2=A0 =C2=
=A0[]string // variables defined at the moment.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0treeSet=C2=A0 =C2=A0 map[str=
ing]*Tree<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0actionLine int // line of le=
ft delim starting action<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 rangeDepth int<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mode=C2=A0 =C2=A0 =C2=A0 =C2=
=A0Mode<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +@@ -223,6 +224,8 @@ func (t *Tree) startParse(funcs []m=
ap[string]interface{}, lex *lexer, treeSet ma<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t.vars =3D []string{&quot;$&=
quot;}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t.funcs =3D funcs<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t.treeSet =3D treeSet<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 lex.breakOK =3D !t.hasFunction(&q=
uot;break&quot;)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 lex.continueOK =3D !t.hasFunction=
(&quot;continue&quot;)<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + // stopParse terminates parsing.<br>
&gt; &gt; &gt;&gt; +@@ -385,6 +388,10 @@ func (t *Tree) action() (n Node) {=
<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch token :=3D t.nextNonS=
pace(); token.typ {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case itemBlock:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return t.blockControl()<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 case itemBreak:<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retur=
n t.breakControl(token.pos, token.line)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 case itemContinue:<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retur=
n t.continueControl(token.pos, token.line)<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case itemElse:<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return t.elseControl()<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case itemEnd:<br>
&gt; &gt; &gt;&gt; +@@ -404,6 +411,32 @@ func (t *Tree) action() (n Node) {=
<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return t.newAction(token.pos=
, token.line, t.pipeline(&quot;command&quot;, itemRightDelim))<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; ++// Break:<br>
&gt; &gt; &gt;&gt; ++//=C2=A0 =C2=A0 {{break}}<br>
&gt; &gt; &gt;&gt; ++// Break keyword is past.<br>
&gt; &gt; &gt;&gt; ++func (t *Tree) breakControl(pos Pos, line int) Node {<=
br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if token :=3D t.next(); token.typ=
 !=3D itemRightDelim {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.une=
xpected(token, &quot;in {{break}}&quot;)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if t.rangeDepth =3D=3D 0 {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.err=
orf(&quot;{{break}} outside {{range}}&quot;)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return t.newBreak(pos, line)<br>
&gt; &gt; &gt;&gt; ++}<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; ++// Continue:<br>
&gt; &gt; &gt;&gt; ++//=C2=A0 =C2=A0 {{continue}}<br>
&gt; &gt; &gt;&gt; ++// Continue keyword is past.<br>
&gt; &gt; &gt;&gt; ++func (t *Tree) continueControl(pos Pos, line int) Node=
 {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if token :=3D t.next(); token.typ=
 !=3D itemRightDelim {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.une=
xpected(token, &quot;in {{continue}}&quot;)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if t.rangeDepth =3D=3D 0 {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.err=
orf(&quot;{{continue}} outside {{range}}&quot;)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return t.newContinue(pos, line)<b=
r>
&gt; &gt; &gt;&gt; ++}<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; + // Pipeline:<br>
&gt; &gt; &gt;&gt; + //=C2=A0 =C2=A0 declarations? command (&#39;|&#39; com=
mand)*<br>
&gt; &gt; &gt;&gt; + func (t *Tree) pipeline(context string, end itemType) =
(pipe *PipeNode) {<br>
&gt; &gt; &gt;&gt; +@@ -479,8 +512,14 @@ func (t *Tree) checkPipeline(pipe =
*PipeNode, context string) {<br>
&gt; &gt; &gt;&gt; + func (t *Tree) parseControl(allowElseIf bool, context =
string) (pos Pos, line int, pipe *PipeNode, list, elseList *ListNode) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0defer t.popVars(len(t.vars))=
<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pipe =3D t.pipeline(context,=
 itemRightDelim)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if context =3D=3D &quot;range&quo=
t; {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.ran=
geDepth++<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0var next Node<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0list, next =3D t.itemList()<=
br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if context =3D=3D &quot;range&quo=
t; {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.ran=
geDepth--<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch next.Type() {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case nodeEnd: //done<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case nodeElse:<br>
&gt; &gt; &gt;&gt; +@@ -522,7 +561,8 @@ func (t *Tree) ifControl() Node {<b=
r>
&gt; &gt; &gt;&gt; + //=C2=A0 =C2=A0 {{range pipeline}} itemList {{else}} i=
temList {{end}}<br>
&gt; &gt; &gt;&gt; + // Range keyword is past.<br>
&gt; &gt; &gt;&gt; + func (t *Tree) rangeControl() Node {<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 return t.newRange(t.parseControl(=
false, &quot;range&quot;))<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 r :=3D t.newRange(t.parseControl(=
false, &quot;range&quot;))<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 return r<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + // With:<br>
&gt; &gt; &gt;&gt; +diff --git a/src/text/template/parse/parse_test.go b/sr=
c/text/template/parse/parse_test.go<br>
&gt; &gt; &gt;&gt; +index 220f984..ba45636 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/text/template/parse/parse_test.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/text/template/parse/parse_test.go<br>
&gt; &gt; &gt;&gt; +@@ -230,6 +230,10 @@ var parseTests =3D []parseTest{<br=
>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
`{{range $x :=3D .SI}}{{.}}{{end}}`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;range 2 vars&quot;, &=
quot;{{range $x, $y :=3D .SI}}{{.}}{{end}}&quot;, noError,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
`{{range $x, $y :=3D .SI}}{{.}}{{end}}`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;range with break&quot;, &q=
uot;{{range .SI}}{{.}}{{break}}{{end}}&quot;, noError,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `{{ra=
nge .SI}}{{.}}{{break}}{{end}}`},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;range with continue&quot;,=
 &quot;{{range .SI}}{{.}}{{continue}}{{end}}&quot;, noError,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `{{ra=
nge .SI}}{{.}}{{continue}}{{end}}`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;constants&quot;, &quo=
t;{{range .SI 1 -3.2i true false &#39;a&#39; nil}}{{end}}&quot;, noError,<b=
r>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
`{{range .SI 1 -3.2i true false &#39;a&#39; nil}}{{end}}`},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;template&quot;, &quot=
;{{template `x`}}&quot;, noError,<br>
&gt; &gt; &gt;&gt; +@@ -279,6 +283,10 @@ var parseTests =3D []parseTest{<br=
>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;adjacent args&quot;, =
&quot;{{printf 3`x`}}&quot;, hasError, &quot;&quot;},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;adjacent args with .&=
quot;, &quot;{{printf `x`.}}&quot;, hasError, &quot;&quot;},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;extra end after if&qu=
ot;, &quot;{{if .X}}a{{else if .Y}}b{{end}}{{end}}&quot;, hasError, &quot;&=
quot;},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;break outside range&quot;,=
 &quot;{{range .}}{{end}} {{break}}&quot;, hasError, &quot;&quot;},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;continue outside range&quo=
t;, &quot;{{range .}}{{end}} {{continue}}&quot;, hasError, &quot;&quot;},<b=
r>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;break in range else&quot;,=
 &quot;{{range .}}{{else}}{{break}}{{end}}&quot;, hasError, &quot;&quot;},<=
br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;continue in range else&quo=
t;, &quot;{{range .}}{{else}}{{continue}}{{end}}&quot;, hasError, &quot;&qu=
ot;},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Other kinds of assignment=
s and operators aren&#39;t available yet.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;bug0a&quot;, &quot;{{=
$x :=3D 0}}{{$x}}&quot;, noError, &quot;{{$x :=3D 0}}{{$x}}&quot;},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;bug0b&quot;, &quot;{{=
$x +=3D 1}}{{$x}}&quot;, hasError, &quot;&quot;},<br>
&gt; &gt; &gt;&gt; +--<br>
&gt; &gt; &gt;&gt; +2.7.4<br>
&gt; &gt; &gt;&gt; diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-2=
4538-3.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_6.patch<br>
&gt; &gt; &gt;&gt; similarity index 53%<br>
&gt; &gt; &gt;&gt; rename from meta/recipes-devtools/go/go-1.14/CVE-2023-24=
538-3.patch<br>
&gt; &gt; &gt;&gt; rename to meta/recipes-devtools/go/go-1.14/CVE-2023-2453=
8_6.patch<br>
&gt; &gt; &gt;&gt; index d5bb33e091..baf400b891 100644<br>
&gt; &gt; &gt;&gt; --- a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-3.=
patch<br>
&gt; &gt; &gt;&gt; +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_6.=
patch<br>
&gt; &gt; &gt;&gt; @@ -1,7 +1,7 @@<br>
&gt; &gt; &gt;&gt;=C2=A0 From 16f4882984569f179d73967c9eee679bb9b098c5 Mon =
Sep 17 00:00:00 2001<br>
&gt; &gt; &gt;&gt;=C2=A0 From: Roland Shoemaker &lt;<a href=3D"mailto:brace=
well@google.com" target=3D"_blank">bracewell@google.com</a>&gt;<br>
&gt; &gt; &gt;&gt;=C2=A0 Date: Mon, 20 Mar 2023 11:01:13 -0700<br>
&gt; &gt; &gt;&gt; -Subject: [PATCH 3/3] html/template: disallow actions in=
 JS template literals<br>
&gt; &gt; &gt;&gt; +Subject: [PATCH 6/6] html/template: disallow actions in=
 JS template literals<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;=C2=A0 ECMAScript 6 introduced template literals[0][1] wh=
ich are delimited with<br>
&gt; &gt; &gt;&gt;=C2=A0 backticks. These need to be escaped in a similar f=
ashion to the<br>
&gt; &gt; &gt;&gt; @@ -52,12 +52,15 @@ CVE: CVE-2023-24538<br>
&gt; &gt; &gt;&gt;=C2=A0 Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mai=
lto:skulkarni@mvista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br=
>
&gt; &gt; &gt;&gt;=C2=A0 ---<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0src/html/template/context.go=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 ++<br>
&gt; &gt; &gt;&gt; - src/html/template/error.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| 13 +++++++++++++<br>
&gt; &gt; &gt;&gt; - src/html/template/escape.go=C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 11 +++++++++++<br>
&gt; &gt; &gt;&gt; + src/html/template/error.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| 13 ++++++++<br>
&gt; &gt; &gt;&gt; + src/html/template/escape.go=C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 11 +++++++<br>
&gt; &gt; &gt;&gt; + src/html/template/escape_test.go=C2=A0 | 66 ++++++++++=
++++++++++++-----------------<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0src/html/template/js.go=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
&gt; &gt; &gt;&gt; - src/html/template/jsctx_string.go |=C2=A0 9 +++++++++<=
br>
&gt; &gt; &gt;&gt; - src/html/template/transition.go=C2=A0 =C2=A0|=C2=A0 7 =
++++++-<br>
&gt; &gt; &gt;&gt; - 6 files changed, 43 insertions(+), 1 deletion(-)<br>
&gt; &gt; &gt;&gt; + src/html/template/js_test.go=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
&gt; &gt; &gt;&gt; + src/html/template/jsctx_string.go |=C2=A0 9 ++++++<br>
&gt; &gt; &gt;&gt; + src/html/template/state_string.go | 37 +++++++++++++++=
+++++--<br>
&gt; &gt; &gt;&gt; + src/html/template/transition.go=C2=A0 =C2=A0|=C2=A0 7 =
++++-<br>
&gt; &gt; &gt;&gt; + 9 files changed, 116 insertions(+), 33 deletions(-)<br=
>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;=C2=A0 diff --git a/src/html/template/context.go b/src/ht=
ml/template/context.go<br>
&gt; &gt; &gt;&gt;=C2=A0 index f7d4849..0b65313 100644<br>
&gt; &gt; &gt;&gt; @@ -125,6 +128,104 @@ index f12dafa..29ca5b3 100644<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case stateJSRegexp:<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0s =3D append(s, &quot;_html_template_jsregexpescaper&quot;)<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case stateCSS:<br>
&gt; &gt; &gt;&gt; +diff --git a/src/html/template/escape_test.go b/src/htm=
l/template/escape_test.go<br>
&gt; &gt; &gt;&gt; +index fa2b84a..1b150e9 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/html/template/escape_test.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/html/template/escape_test.go<br>
&gt; &gt; &gt;&gt; +@@ -681,35 +681,31 @@ func TestEscape(t *testing.T) {<b=
r>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, test :=3D range tests=
 {<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpl =
:=3D New(<a href=3D"http://test.name" rel=3D"noreferrer" target=3D"_blank">=
test.name</a>)<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpl =
=3D Must(tmpl.Parse(test.input))<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Ch=
eck for bug 6459: Tree field was not set in Parse.<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tm=
pl.Tree !=3D tmpl.text.Tree {<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;%s: tree not set properly&quot;, <a=
 href=3D"http://test.name" rel=3D"noreferrer" target=3D"_blank">test.name</=
a>)<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b :=
=3D new(bytes.Buffer)<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if er=
r :=3D tmpl.Execute(b, data); err !=3D nil {<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;%s: template execution failed: %s&q=
uot;, <a href=3D"http://test.name" rel=3D"noreferrer" target=3D"_blank">tes=
t.name</a>, err)<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if w,=
 g :=3D test.output, b.String(); w !=3D g {<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;%s: escaped output: want\n\t%q\ngot=
\n\t%q&quot;, <a href=3D"http://test.name" rel=3D"noreferrer" target=3D"_bl=
ank">test.name</a>, w, g)<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b.Res=
et()<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if er=
r :=3D tmpl.Execute(b, pdata); err !=3D nil {<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;%s: template execution failed for p=
ointer: %s&quot;, <a href=3D"http://test.name" rel=3D"noreferrer" target=3D=
"_blank">test.name</a>, err)<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if w,=
 g :=3D test.output, b.String(); w !=3D g {<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;%s: escaped output for pointer: wan=
t\n\t%q\ngot\n\t%q&quot;, <a href=3D"http://test.name" rel=3D"noreferrer" t=
arget=3D"_blank">test.name</a>, w, g)<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tm=
pl.Tree !=3D tmpl.text.Tree {<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;%s: tree mismatch&quot;, <a href=3D=
"http://test.name" rel=3D"noreferrer" target=3D"_blank">test.name</a>)<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Run=
(<a href=3D"http://test.name" rel=3D"noreferrer" target=3D"_blank">test.nam=
e</a>, func(t *testing.T) {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 tmpl :=3D New(<a href=3D"http://test.name" rel=3D"=
noreferrer" target=3D"_blank">test.name</a>)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 tmpl =3D Must(tmpl.Parse(test.input))<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 // Check for bug 6459: Tree field was not set in P=
arse.<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if tmpl.Tree !=3D tmpl.text.Tree {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;%s: tre=
e not set properly&quot;, <a href=3D"http://test.name" rel=3D"noreferrer" t=
arget=3D"_blank">test.name</a>)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 b :=3D new(strings.Builder)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if err :=3D tmpl.Execute(b, data); err !=3D nil {<=
br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;%s: tem=
plate execution failed: %s&quot;, <a href=3D"http://test.name" rel=3D"noref=
errer" target=3D"_blank">test.name</a>, err)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if w, g :=3D test.output, b.String(); w !=3D g {<b=
r>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;%s: esc=
aped output: want\n\t%q\ngot\n\t%q&quot;, <a href=3D"http://test.name" rel=
=3D"noreferrer" target=3D"_blank">test.name</a>, w, g)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 b.Reset()<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if err :=3D tmpl.Execute(b, pdata); err !=3D nil {=
<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;%s: tem=
plate execution failed for pointer: %s&quot;, <a href=3D"http://test.name" =
rel=3D"noreferrer" target=3D"_blank">test.name</a>, err)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if w, g :=3D test.output, b.String(); w !=3D g {<b=
r>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;%s: esc=
aped output for pointer: want\n\t%q\ngot\n\t%q&quot;, <a href=3D"http://tes=
t.name" rel=3D"noreferrer" target=3D"_blank">test.name</a>, w, g)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if tmpl.Tree !=3D tmpl.text.Tree {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;%s: tre=
e mismatch&quot;, <a href=3D"http://test.name" rel=3D"noreferrer" target=3D=
"_blank">test.name</a>)<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 })<br=
>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +@@ -936,6 +932,10 @@ func TestErrors(t *testing.T) {<br=
>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;{{range .Items}}&lt;a{{if .X}}{{end}}&gt;=
{{if .X}}{{break}}{{end}}{{end}}&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&lt;script&gt;var a =3D `${a+b}`&lt;/script&=
gt;`&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br=
>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
// Error cases.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;{{if .Cond}}&lt;a{{end}}&quot;,<br>
&gt; &gt; &gt;&gt; +@@ -1082,6 +1082,10 @@ func TestErrors(t *testing.T) {<=
br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0// html is allowed since it is the last command=
 in the pipeline, but urlquery is not.<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0`predefined escaper &quot;urlquery&quot; disall=
owed in template`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&lt;script&gt;var tmpl =3D `asd {{.}}`;&lt;/=
script&gt;&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 `{{.}} appears in a JS template literal`,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br=
>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, test :=3D range tests=
 {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
buf :=3D new(bytes.Buffer)<br>
&gt; &gt; &gt;&gt; +@@ -1304,6 +1308,10 @@ func TestEscapeText(t *testing.T=
) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0context{state: stateJSSqStr, delim: delimDouble=
Quote, attr: attrScript},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&lt;a onclick=3D\&quot;`foo&quot;,<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 context{state: stateJSBqStr, delim: delimDoubleQuo=
te, attr: attrScript},<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br=
>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&lt;A ONCLICK=3D&quot;&#39;`,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0context{state: stateJSSqStr, delim: delimDouble=
Quote, attr: attrScript},<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
},<br>
&gt; &gt; &gt;&gt;=C2=A0 diff --git a/src/html/template/js.go b/src/html/te=
mplate/js.go<br>
&gt; &gt; &gt;&gt;=C2=A0 index ea9c183..b888eaf 100644<br>
&gt; &gt; &gt;&gt;=C2=A0 --- a/src/html/template/js.go<br>
&gt; &gt; &gt;&gt; @@ -145,6 +246,19 @@ index ea9c183..b888eaf 100644<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;+&#39;:=C2=A0 `\u0=
02b`,<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;/&#39;:=C2=A0 `\/`=
,<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&lt;&#39;:=C2=A0 `=
\u003c`,<br>
&gt; &gt; &gt;&gt; +diff --git a/src/html/template/js_test.go b/src/html/te=
mplate/js_test.go<br>
&gt; &gt; &gt;&gt; +index d7ee47b..7d963ae 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/html/template/js_test.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/html/template/js_test.go<br>
&gt; &gt; &gt;&gt; +@@ -292,7 +292,7 @@ func TestEscapersOnLower7AndSelectH=
ighCodepoints(t *testing.T) {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`0123456789:;\u003c=
=3D\u003e?` +<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`@ABCDEFGHIJKLMNO` =
+<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`PQRSTUVWXYZ[\\]^_`=
 +<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;`abcdefghijklmno=
&quot; +<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\\u0060abcdefghi=
jklmno&quot; +<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;pqrstuvwxyz{|=
}~\u007f&quot; +<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\u00A0\u0100\=
\u2028\\u2029\ufeff\U0001D11E&quot;,<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
},<br>
&gt; &gt; &gt;&gt;=C2=A0 diff --git a/src/html/template/jsctx_string.go b/s=
rc/html/template/jsctx_string.go<br>
&gt; &gt; &gt;&gt;=C2=A0 index dd1d87e..2394893 100644<br>
&gt; &gt; &gt;&gt;=C2=A0 --- a/src/html/template/jsctx_string.go<br>
&gt; &gt; &gt;&gt; @@ -165,6 +279,55 @@ index dd1d87e..2394893 100644<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0const _jsCtx_name =3D &quot;jsCtxRegexpjsCtx=
DivOpjsCtxUnknown&quot;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0var _jsCtx_index =3D [...]uint8{0, 11, 21, 3=
3}<br>
&gt; &gt; &gt;&gt; +diff --git a/src/html/template/state_string.go b/src/ht=
ml/template/state_string.go<br>
&gt; &gt; &gt;&gt; +index 05104be..6fb1a6e 100644<br>
&gt; &gt; &gt;&gt; +--- a/src/html/template/state_string.go<br>
&gt; &gt; &gt;&gt; ++++ b/src/html/template/state_string.go<br>
&gt; &gt; &gt;&gt; +@@ -4,9 +4,42 @@ package template<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + import &quot;strconv&quot;<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +-const _state_name =3D &quot;stateTextstateTagstateAttr=
NamestateAfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLs=
tateSrcsetstateJSstateJSDqStrstateJSSqStrstateJSRegexpstateJSBlockCmtstateJ=
SLineCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCS=
SURLstateCSSBlockCmtstateCSSLineCmtstateError&quot;<br>
&gt; &gt; &gt;&gt; ++func _() {<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // An &quot;invalid array index&q=
uot; compiler error signifies that the constant values have changed.<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 // Re-run the stringer command to=
 generate them again.<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 var x [1]struct{}<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateText-0]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateTag-1]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateAttrName-2]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateAfterName-3]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateBeforeValue-4]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateHTMLCmt-5]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateRCDATA-6]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateAttr-7]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateURL-8]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateSrcset-9]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJS-10]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJSDqStr-11]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJSSqStr-12]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJSBqStr-13]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJSRegexp-14]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJSBlockCmt-15]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJSLineCmt-16]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSS-17]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSDqStr-18]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSSqStr-19]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSDqURL-20]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSSqURL-21]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSURL-22]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSBlockCmt-23]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSLineCmt-24]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateError-25]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateDead-26]<br>
&gt; &gt; &gt;&gt; ++}<br>
&gt; &gt; &gt;&gt; ++<br>
&gt; &gt; &gt;&gt; ++const _state_name =3D &quot;stateTextstateTagstateAttr=
NamestateAfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLs=
tateSrcsetstateJSstateJSDqStrstateJSSqStrstateJSBqStrstateJSRegexpstateJSBl=
ockCmtstateJSLineCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSS=
SqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateErrorstateDead&quot;<br=
>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; +-var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60,=
 72, 83, 92, 100, 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 24=
4, 255, 271, 286, 296}<br>
&gt; &gt; &gt;&gt; ++var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60,=
 72, 83, 92, 100, 111, 118, 130, 142, 154, 167, 182, 196, 204, 217, 230, 24=
3, 256, 267, 283, 298, 308, 317}<br>
&gt; &gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; + func (i state) String() string {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if i &gt;=3D state(len(_stat=
e_index)-1) {<br>
&gt; &gt; &gt;&gt;=C2=A0 diff --git a/src/html/template/transition.go b/src=
/html/template/transition.go<br>
&gt; &gt; &gt;&gt;=C2=A0 index 06df679..92eb351 100644<br>
&gt; &gt; &gt;&gt;=C2=A0 --- a/src/html/template/transition.go<br>
&gt; &gt; &gt;&gt; diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-3=
9318.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch<br>
&gt; &gt; &gt;&gt; index 20e70c0485..00def8fcda 100644<br>
&gt; &gt; &gt;&gt; --- a/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.pa=
tch<br>
&gt; &gt; &gt;&gt; +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.pa=
tch<br>
&gt; &gt; &gt;&gt; @@ -34,9 +34,9 @@ Signed-off-by: Siddharth Doshi &lt;<a =
href=3D"mailto:sdoshi@mvista.com" target=3D"_blank">sdoshi@mvista.com</a>&g=
t;<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0src/html/template/context.go=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 6 ++-<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0src/html/template/escape.go=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 5 +-<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0src/html/template/escape_test.go=C2=A0 | 10 =
++++<br>
&gt; &gt; &gt;&gt; - src/html/template/state_string.go |=C2=A0 4 +-<br>
&gt; &gt; &gt;&gt; + src/html/template/state_string.go | 26 +++++-----<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0src/html/template/transition.go=C2=A0 =C2=A0=
| 80 ++++++++++++++++++++-----------<br>
&gt; &gt; &gt;&gt; - 5 files changed, 72 insertions(+), 33 deletions(-)<br>
&gt; &gt; &gt;&gt; + 5 files changed, 84 insertions(+), 43 deletions(-)<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;=C2=A0 diff --git a/src/html/template/context.go b/src/ht=
ml/template/context.go<br>
&gt; &gt; &gt;&gt;=C2=A0 index 0b65313..4eb7891 100644<br>
&gt; &gt; &gt;&gt; @@ -105,14 +105,38 @@ diff --git a/src/html/template/sta=
te_string.go b/src/html/template/state_string.<br>
&gt; &gt; &gt;&gt;=C2=A0 index 05104be..b5cfe70 100644<br>
&gt; &gt; &gt;&gt;=C2=A0 --- a/src/html/template/state_string.go<br>
&gt; &gt; &gt;&gt;=C2=A0 +++ b/src/html/template/state_string.go<br>
&gt; &gt; &gt;&gt; -@@ -4,9 +4,9 @@ package template<br>
&gt; &gt; &gt;&gt; -<br>
&gt; &gt; &gt;&gt; - import &quot;strconv&quot;<br>
&gt; &gt; &gt;&gt; +@@ -25,21 +25,23 @@ func _() {<br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_ =3D x[stateJSRegexp-14]<br=
>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_ =3D x[stateJSBlockCmt-15]<=
br>
&gt; &gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_ =3D x[stateJSLineCmt-16]<b=
r>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSS-17]<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSDqStr-18]<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSSqStr-19]<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSDqURL-20]<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSSqURL-21]<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSURL-22]<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSBlockCmt-23]<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSLineCmt-24]<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateError-25]<br>
&gt; &gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateDead-26]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJSHTMLOpenCmt-17]<br=
>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJSHTMLCloseCmt-18]<b=
r>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSS-19]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSDqStr-20]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSSqStr-21]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSDqURL-22]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSSqURL-23]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSURL-24]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSBlockCmt-25]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSLineCmt-26]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateError-27]<br>
&gt; &gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateDead-28]<br>
&gt; &gt; &gt;&gt; + }<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; --const _state_name =3D &quot;stateTextstateTagstateAttr=
NamestateAfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLs=
tateSrcsetstateJSstateJSDqStrstateJSSqStrstateJSRegexpstateJSBlockCmtstateJ=
SLineCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCS=
SURLstateCSSBlockCmtstateCSSLineCmtstateError&quot;<br>
&gt; &gt; &gt;&gt; +-const _state_name =3D &quot;stateTextstateTagstateAttr=
NamestateAfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLs=
tateSrcsetstateJSstateJSDqStrstateJSSqStrstateJSBqStrstateJSRegexpstateJSBl=
ockCmtstateJSLineCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSS=
SqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateErrorstateDead&quot;<br=
>
&gt; &gt; &gt;&gt;=C2=A0 +const _state_name =3D &quot;stateTextstateTagstat=
eAttrNamestateAfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstat=
eURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstateJSBqStrstateJSRegexpstat=
eJSBlockCmtstateJSLineCmtstateJSHTMLOpenCmtstateJSHTMLCloseCmtstateCSSstate=
CSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmts=
tateCSSLineCmtstateErrorstateDead&quot;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; --var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60,=
 72, 83, 92, 100, 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 24=
4, 255, 271, 286, 296}<br>
&gt; &gt; &gt;&gt; +-var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60,=
 72, 83, 92, 100, 111, 118, 130, 142, 154, 167, 182, 196, 204, 217, 230, 24=
3, 256, 267, 283, 298, 308, 317}<br>
&gt; &gt; &gt;&gt;=C2=A0 +var _state_index =3D [...]uint16{0, 9, 17, 30, 44=
, 60, 72, 83, 92, 100, 111, 118, 130, 142, 154, 167, 182, 196, 214, 233, 24=
1, 254, 267, 280, 293, 304, 320, 335, 345, 354}<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;=C2=A0 =C2=A0func (i state) String() string {<br>
&gt; &gt; &gt;&gt; --<br>
&gt; &gt; &gt;&gt; 2.42.0<br>
&gt; &gt; &gt;&gt;<br>
</blockquote></div>

--000000000000d432a70606846e7f--

