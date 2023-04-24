Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C45FC77B61
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 17:45:13 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.58507.1682358308250081820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 10:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=uqPBpX1T;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.50, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5050491cb04so7153673a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 10:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682358306; x=1684950306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2cz8RmEwwBUGmNVZS+oK7De1k3B5s83E85kRt3WPzk=;
        b=uqPBpX1TLrm349esvLg0Kcr/crD2r4HYycwlLPhvwIipAodvtxzCo+Iksf+qzRC2zf
         Y5BogWBdLN/zpBG83CKSiZg6cIzsBekZGJ/6nzQfO0kD4LRFKp05zBZ0CTWlbXDkfUum
         z2cg6Cguicon4U0k9v+MihDXAExYVC/kWH+NwsIv5DttrmOnfehJvN/HnhoaOkd2feZA
         d8r9KBSDrlEyO9UNvIjfwi5KXIuCUlv8MQXq8YH3lWg9cheeWX7Q4CgZmOWHgE7DzMjr
         PgNn0YFC0RAyfjDW2Opzn1TTGA0FQPMR/+Egzim3t2CzV/nffc7Iq/HB815EqC+BIoVP
         8Mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682358306; x=1684950306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2cz8RmEwwBUGmNVZS+oK7De1k3B5s83E85kRt3WPzk=;
        b=ED1l8TtNBT0deC+xf3x4Ia7ZwCo7HQQwNxromY3Fw2K/Z79z0XiIiM2nOwDKxnTIFx
         ppcqH2NvkEww5k7zCkqy4vDqSHYDkgMJhsjD0bcI7frghxg7sAtnpqEQDfmG3lMyr+7K
         Ja8Giz5UMMJU7/6gynrEQtyEr2YAPkZvKNInVsgM8XpmVX6GY4o+rCHJBv7KGkxDpksN
         7LvPXWEC9MtFVkXAbiWT4WrPoESZmcEDmFQ/jT+dAwI3ZnROFxLuHoYXDF7+cZrXQqm0
         tFPiWoLWkwL5/cdV9JTGxiS2sQPwUtAPd+rBy7q0gaq4OXO2bxrC0242v059abqA5S0v
         zF+Q==
X-Gm-Message-State: AAQBX9c0Bkc09PchwCbVD2rd//Op9FkMyE3HiIyYV99SeDKn52LBk8nn
	VfAwRsJXKaysNx6VaGW5JXuVziDlr8SGWwkCL7l2+VbtPqcn62YHQkA=
X-Google-Smtp-Source: AKy350ax7rFjog2EZjA81ta6U7dNXvWu+ewkcvi0SMVoHr6etJ5rGhTwUVDzj3hSk/VK3ViCQqcR/zl5aaGfdaUZgDA=
X-Received: by 2002:aa7:dd16:0:b0:506:b33c:70ac with SMTP id
 i22-20020aa7dd16000000b00506b33c70acmr11813136edv.32.1682358306079; Mon, 24
 Apr 2023 10:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <1682315031-18840-1-git-send-email-skulkarni@mvista.com>
In-Reply-To: <1682315031-18840-1-git-send-email-skulkarni@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 24 Apr 2023 07:44:54 -1000
Message-ID: <CAOSpxdbdO0H2gZ1UP+ngviXsBaChFq1TzP1xtGHC5ch4ezuQhg@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] go: Security fix for CVE-2023-24538
To: Shubham Kulkarni <skulkarni@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 17:45:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180361

Unfortunately the dunfell version of this patch does not apply
(kirkstone seems fine):

Applying: go: Security fix for CVE-2023-24538
error: corrupt patch at line 594
error: could not build fake ancestor
Patch failed at 0001 go: Security fix for CVE-2023-24538
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Steve

On Sun, Apr 23, 2023 at 7:43=E2=80=AFPM Shubham Kulkarni <skulkarni@mvista.=
com> wrote:
>
> From: Shubham Kulkarni <skulkarni@mvista.com>
>
> html/template: disallow actions in JS template literals
>
> Backport from https://github.com/golang/go/commit/b1e3ecfa06b67014429a197=
ec5e134ce4303ad9b
>
> Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> ---
>  meta/recipes-devtools/go/go-1.14.inc               |   2 +
>  .../go/go-1.14/CVE-2023-24538-1.patch              | 633 +++++++++++++++=
++++++
>  .../go/go-1.14/CVE-2023-24538-2.patch              | 371 ++++++++++++
>  3 files changed, 1006 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.pat=
ch
>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.pat=
ch
>
> diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools=
/go/go-1.14.inc
> index 56f4f12..01f9f1e 100644
> --- a/meta/recipes-devtools/go/go-1.14.inc
> +++ b/meta/recipes-devtools/go/go-1.14.inc
> @@ -57,6 +57,8 @@ SRC_URI +=3D "\
>      file://CVE-2022-41722-2.patch \
>      file://CVE-2020-29510.patch \
>      file://CVE-2023-24537.patch \
> +    file://CVE-2023-24538-1.patch \
> +    file://CVE-2023-24538-2.patch \
>  "
>
>  SRC_URI_append_libc-musl =3D " file://0009-ld-replace-glibc-dynamic-link=
er-with-musl.patch"
> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch b/me=
ta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
> new file mode 100644
> index 0000000..4b0d200
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
> @@ -0,0 +1,633 @@
> +From 64779a6dfb11631133ff3cfba7ae7e449c191a88 Mon Sep 17 00:00:00 2001
> +From: empijei <robclap8@gmail.com>
> +Date: Fri, 27 Mar 2020 19:27:55 +0100
> +Subject: [PATCH 1/2] html/template,text/template: switch to Unicode esca=
pes
> + for JSON compatibility
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The existing implementation is not compatible with JSON
> +escape as it uses hex escaping.
> +Unicode escape, instead, is valid for both JSON and JS.
> +This fix avoids creating a separate escaping context for
> +scripts of type "application/ld+json" and it is more
> +future-proof in case more JSON+JS contexts get added
> +to the platform (e.g. import maps).
> +
> +Fixes #33671
> +Fixes #37634
> +
> +Change-Id: Id6f6524b4abc52e81d9d744d46bbe5bf2e081543
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/226097
> +Reviewed-by: Carl Johnson <me@carlmjohnson.net>
> +Reviewed-by: Daniel Mart=C3=AD <mvdan@mvdan.cc>
> +Run-TryBot: Daniel Mart=C3=AD <mvdan@mvdan.cc>
> +TryBot-Result: Gobot Gobot <gobot@golang.org>
> +
> +Upstream-Status: Backport from https://github.com/golang/go/commit/d4d29=
8040d072ddacea0e0d6b55fb148fff18070
> +CVE: CVE-2023-24538
> +Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> +---
> + src/html/template/content_test.go  | 70 +++++++++++++++++++------------=
-------
> + src/html/template/escape_test.go   |  6 ++--
> + src/html/template/example_test.go  |  6 ++--
> + src/html/template/js.go            | 70 +++++++++++++++++++++++--------=
-------
> + src/html/template/js_test.go       | 68 ++++++++++++++++++-------------=
-----
> + src/html/template/template_test.go | 39 +++++++++++++++++++++
> + src/text/template/exec_test.go     |  6 ++--
> + src/text/template/funcs.go         |  8 ++---
> + 8 files changed, 163 insertions(+), 110 deletions(-)
> +
> +diff --git a/src/html/template/content_test.go b/src/html/template/conte=
nt_test.go
> +index 72d56f5..bd86527 100644
> +--- a/src/html/template/content_test.go
> ++++ b/src/html/template/content_test.go
> +@@ -18,7 +18,7 @@ func TestTypedContent(t *testing.T) {
> +               HTML(`Hello, <b>World</b> &amp;tc!`),
> +               HTMLAttr(` dir=3D"ltr"`),
> +               JS(`c && alert("Hello, World!");`),
> +-              JSStr(`Hello, World & O'Reilly\x21`),
> ++              JSStr(`Hello, World & O'Reilly\u0021`),
> +               URL(`greeting=3DH%69,&addressee=3D(World)`),
> +               Srcset(`greeting=3DH%69,&addressee=3D(World) 2x, https://=
golang.org/favicon.ico 500.5w`),
> +               URL(`,foo/,`),
> +@@ -70,7 +70,7 @@ func TestTypedContent(t *testing.T) {
> +                               `Hello, <b>World</b> &amp;tc!`,
> +                               ` dir=3D&#34;ltr&#34;`,
> +                               `c &amp;&amp; alert(&#34;Hello, World!&#3=
4;);`,
> +-                              `Hello, World &amp; O&#39;Reilly\x21`,
> ++                              `Hello, World &amp; O&#39;Reilly\u0021`,
> +                               `greeting=3DH%69,&amp;addressee=3D(World)=
`,
> +                               `greeting=3DH%69,&amp;addressee=3D(World)=
 2x, https://golang.org/favicon.ico 500.5w`,
> +                               `,foo/,`,
> +@@ -100,7 +100,7 @@ func TestTypedContent(t *testing.T) {
> +                               `Hello,&#32;World&#32;&amp;tc!`,
> +                               `&#32;dir&#61;&#34;ltr&#34;`,
> +                               `c&#32;&amp;&amp;&#32;alert(&#34;Hello,&#=
32;World!&#34;);`,
> +-                              `Hello,&#32;World&#32;&amp;&#32;O&#39;Rei=
lly\x21`,
> ++                              `Hello,&#32;World&#32;&amp;&#32;O&#39;Rei=
lly\u0021`,
> +                               `greeting&#61;H%69,&amp;addressee&#61;(Wo=
rld)`,
> +                               `greeting&#61;H%69,&amp;addressee&#61;(Wo=
rld)&#32;2x,&#32;https://golang.org/favicon.ico&#32;500.5w`,
> +                               `,foo/,`,
> +@@ -115,7 +115,7 @@ func TestTypedContent(t *testing.T) {
> +                               `Hello, World &amp;tc!`,
> +                               ` dir=3D&#34;ltr&#34;`,
> +                               `c &amp;&amp; alert(&#34;Hello, World!&#3=
4;);`,
> +-                              `Hello, World &amp; O&#39;Reilly\x21`,
> ++                              `Hello, World &amp; O&#39;Reilly\u0021`,
> +                               `greeting=3DH%69,&amp;addressee=3D(World)=
`,
> +                               `greeting=3DH%69,&amp;addressee=3D(World)=
 2x, https://golang.org/favicon.ico 500.5w`,
> +                               `,foo/,`,
> +@@ -130,7 +130,7 @@ func TestTypedContent(t *testing.T) {
> +                               `Hello, &lt;b&gt;World&lt;/b&gt; &amp;tc!=
`,
> +                               ` dir=3D&#34;ltr&#34;`,
> +                               `c &amp;&amp; alert(&#34;Hello, World!&#3=
4;);`,
> +-                              `Hello, World &amp; O&#39;Reilly\x21`,
> ++                              `Hello, World &amp; O&#39;Reilly\u0021`,
> +                               `greeting=3DH%69,&amp;addressee=3D(World)=
`,
> +                               `greeting=3DH%69,&amp;addressee=3D(World)=
 2x, https://golang.org/favicon.ico 500.5w`,
> +                               `,foo/,`,
> +@@ -146,7 +146,7 @@ func TestTypedContent(t *testing.T) {
> +                               // Not escaped.
> +                               `c && alert("Hello, World!");`,
> +                               // Escape sequence not over-escaped.
> +-                              `"Hello, World & O'Reilly\x21"`,
> ++                              `"Hello, World & O'Reilly\u0021"`,
> +                               `"greeting=3DH%69,\u0026addressee=3D(Worl=
d)"`,
> +                               `"greeting=3DH%69,\u0026addressee=3D(Worl=
d) 2x, https://golang.org/favicon.ico 500.5w"`,
> +                               `",foo/,"`,
> +@@ -162,7 +162,7 @@ func TestTypedContent(t *testing.T) {
> +                               // Not JS escaped but HTML escaped.
> +                               `c &amp;&amp; alert(&#34;Hello, World!&#3=
4;);`,
> +                               // Escape sequence not over-escaped.
> +-                              `&#34;Hello, World &amp; O&#39;Reilly\x21=
&#34;`,
> ++                              `&#34;Hello, World &amp; O&#39;Reilly\u00=
21&#34;`,
> +                               `&#34;greeting=3DH%69,\u0026addressee=3D(=
World)&#34;`,
> +                               `&#34;greeting=3DH%69,\u0026addressee=3D(=
World) 2x, https://golang.org/favicon.ico 500.5w&#34;`,
> +                               `&#34;,foo/,&#34;`,
> +@@ -171,30 +171,30 @@ func TestTypedContent(t *testing.T) {
> +               {
> +                       `<script>alert("{{.}}")</script>`,
> +                       []string{
> +-                              `\x3cb\x3e \x22foo%\x22 O\x27Reilly \x26b=
ar;`,
> +-                              `a[href =3D~ \x22\/\/example.com\x22]#foo=
`,
> +-                              `Hello, \x3cb\x3eWorld\x3c\/b\x3e \x26amp=
;tc!`,
> +-                              ` dir=3D\x22ltr\x22`,
> +-                              `c \x26\x26 alert(\x22Hello, World!\x22);=
`,
> ++                              `\u003cb\u003e \u0022foo%\u0022 O\u0027Re=
illy \u0026bar;`,
> ++                              `a[href =3D~ \u0022\/\/example.com\u0022]=
#foo`,
> ++                              `Hello, \u003cb\u003eWorld\u003c\/b\u003e=
 \u0026amp;tc!`,
> ++                              ` dir=3D\u0022ltr\u0022`,
> ++                              `c \u0026\u0026 alert(\u0022Hello, World!=
\u0022);`,
> +                               // Escape sequence not over-escaped.
> +-                              `Hello, World \x26 O\x27Reilly\x21`,
> +-                              `greeting=3DH%69,\x26addressee=3D(World)`=
,
> +-                              `greeting=3DH%69,\x26addressee=3D(World) =
2x, https:\/\/golang.org\/favicon.ico 500.5w`,
> ++                              `Hello, World \u0026 O\u0027Reilly\u0021`=
,
> ++                              `greeting=3DH%69,\u0026addressee=3D(World=
)`,
> ++                              `greeting=3DH%69,\u0026addressee=3D(World=
) 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
> +                               `,foo\/,`,
> +                       },
> +               },
> +               {
> +                       `<script type=3D"text/javascript">alert("{{.}}")<=
/script>`,
> +                       []string{
> +-                              `\x3cb\x3e \x22foo%\x22 O\x27Reilly \x26b=
ar;`,
> +-                              `a[href =3D~ \x22\/\/example.com\x22]#foo=
`,
> +-                              `Hello, \x3cb\x3eWorld\x3c\/b\x3e \x26amp=
;tc!`,
> +-                              ` dir=3D\x22ltr\x22`,
> +-                              `c \x26\x26 alert(\x22Hello, World!\x22);=
`,
> ++                              `\u003cb\u003e \u0022foo%\u0022 O\u0027Re=
illy \u0026bar;`,
> ++                              `a[href =3D~ \u0022\/\/example.com\u0022]=
#foo`,
> ++                              `Hello, \u003cb\u003eWorld\u003c\/b\u003e=
 \u0026amp;tc!`,
> ++                              ` dir=3D\u0022ltr\u0022`,
> ++                              `c \u0026\u0026 alert(\u0022Hello, World!=
\u0022);`,
> +                               // Escape sequence not over-escaped.
> +-                              `Hello, World \x26 O\x27Reilly\x21`,
> +-                              `greeting=3DH%69,\x26addressee=3D(World)`=
,
> +-                              `greeting=3DH%69,\x26addressee=3D(World) =
2x, https:\/\/golang.org\/favicon.ico 500.5w`,
> ++                              `Hello, World \u0026 O\u0027Reilly\u0021`=
,
> ++                              `greeting=3DH%69,\u0026addressee=3D(World=
)`,
> ++                              `greeting=3DH%69,\u0026addressee=3D(World=
) 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
> +                               `,foo\/,`,
> +                       },
> +               },
> +@@ -208,7 +208,7 @@ func TestTypedContent(t *testing.T) {
> +                               // Not escaped.
> +                               `c && alert("Hello, World!");`,
> +                               // Escape sequence not over-escaped.
> +-                              `"Hello, World & O'Reilly\x21"`,
> ++                              `"Hello, World & O'Reilly\u0021"`,
> +                               `"greeting=3DH%69,\u0026addressee=3D(Worl=
d)"`,
> +                               `"greeting=3DH%69,\u0026addressee=3D(Worl=
d) 2x, https://golang.org/favicon.ico 500.5w"`,
> +                               `",foo/,"`,
> +@@ -224,7 +224,7 @@ func TestTypedContent(t *testing.T) {
> +                               `Hello, <b>World</b> &amp;tc!`,
> +                               ` dir=3D&#34;ltr&#34;`,
> +                               `c &amp;&amp; alert(&#34;Hello, World!&#3=
4;);`,
> +-                              `Hello, World &amp; O&#39;Reilly\x21`,
> ++                              `Hello, World &amp; O&#39;Reilly\u0021`,
> +                               `greeting=3DH%69,&amp;addressee=3D(World)=
`,
> +                               `greeting=3DH%69,&amp;addressee=3D(World)=
 2x, https://golang.org/favicon.ico 500.5w`,
> +                               `,foo/,`,
> +@@ -233,15 +233,15 @@ func TestTypedContent(t *testing.T) {
> +               {
> +                       `<button onclick=3D'alert("{{.}}")'>`,
> +                       []string{
> +-                              `\x3cb\x3e \x22foo%\x22 O\x27Reilly \x26b=
ar;`,
> +-                              `a[href =3D~ \x22\/\/example.com\x22]#foo=
`,
> +-                              `Hello, \x3cb\x3eWorld\x3c\/b\x3e \x26amp=
;tc!`,
> +-                              ` dir=3D\x22ltr\x22`,
> +-                              `c \x26\x26 alert(\x22Hello, World!\x22);=
`,
> ++                              `\u003cb\u003e \u0022foo%\u0022 O\u0027Re=
illy \u0026bar;`,
> ++                              `a[href =3D~ \u0022\/\/example.com\u0022]=
#foo`,
> ++                              `Hello, \u003cb\u003eWorld\u003c\/b\u003e=
 \u0026amp;tc!`,
> ++                              ` dir=3D\u0022ltr\u0022`,
> ++                              `c \u0026\u0026 alert(\u0022Hello, World!=
\u0022);`,
> +                               // Escape sequence not over-escaped.
> +-                              `Hello, World \x26 O\x27Reilly\x21`,
> +-                              `greeting=3DH%69,\x26addressee=3D(World)`=
,
> +-                              `greeting=3DH%69,\x26addressee=3D(World) =
2x, https:\/\/golang.org\/favicon.ico 500.5w`,
> ++                              `Hello, World \u0026 O\u0027Reilly\u0021`=
,
> ++                              `greeting=3DH%69,\u0026addressee=3D(World=
)`,
> ++                              `greeting=3DH%69,\u0026addressee=3D(World=
) 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
> +                               `,foo\/,`,
> +                       },
> +               },
> +@@ -253,7 +253,7 @@ func TestTypedContent(t *testing.T) {
> +                               `Hello%2c%20%3cb%3eWorld%3c%2fb%3e%20%26a=
mp%3btc%21`,
> +                               `%20dir%3d%22ltr%22`,
> +                               `c%20%26%26%20alert%28%22Hello%2c%20World=
%21%22%29%3b`,
> +-                              `Hello%2c%20World%20%26%20O%27Reilly%5cx2=
1`,
> ++                              `Hello%2c%20World%20%26%20O%27Reilly%5cu0=
021`,
> +                               // Quotes and parens are escaped but %69 =
is not over-escaped. HTML escaping is done.
> +                               `greeting=3DH%69,&amp;addressee=3D%28Worl=
d%29`,
> +                               `greeting%3dH%2569%2c%26addressee%3d%28Wo=
rld%29%202x%2c%20https%3a%2f%2fgolang.org%2ffavicon.ico%20500.5w`,
> +@@ -268,7 +268,7 @@ func TestTypedContent(t *testing.T) {
> +                               `Hello%2c%20%3cb%3eWorld%3c%2fb%3e%20%26a=
mp%3btc%21`,
> +                               `%20dir%3d%22ltr%22`,
> +                               `c%20%26%26%20alert%28%22Hello%2c%20World=
%21%22%29%3b`,
> +-                              `Hello%2c%20World%20%26%20O%27Reilly%5cx2=
1`,
> ++                              `Hello%2c%20World%20%26%20O%27Reilly%5cu0=
021`,
> +                               // Quotes and parens are escaped but %69 =
is not over-escaped. HTML escaping is not done.
> +                               `greeting=3DH%69,&addressee=3D%28World%29=
`,
> +                               `greeting%3dH%2569%2c%26addressee%3d%28Wo=
rld%29%202x%2c%20https%3a%2f%2fgolang.org%2ffavicon.ico%20500.5w`,
> +diff --git a/src/html/template/escape_test.go b/src/html/template/escape=
_test.go
> +index e72a9ba..c709660 100644
> +--- a/src/html/template/escape_test.go
> ++++ b/src/html/template/escape_test.go
> +@@ -238,7 +238,7 @@ func TestEscape(t *testing.T) {
> +               {
> +                       "jsStr",
> +                       "<button onclick=3D'alert(&quot;{{.H}}&quot;)'>",
> +-                      `<button onclick=3D'alert(&quot;\x3cHello\x3e&quo=
t;)'>`,
> ++                      `<button onclick=3D'alert(&quot;\u003cHello\u003e=
&quot;)'>`,
> +               },
> +               {
> +                       "badMarshaler",
> +@@ -259,7 +259,7 @@ func TestEscape(t *testing.T) {
> +               {
> +                       "jsRe",
> +                       `<button onclick=3D'alert(/{{"foo+bar"}}/.test(""=
))'>`,
> +-                      `<button onclick=3D'alert(/foo\x2bbar/.test(""))'=
>`,
> ++                      `<button onclick=3D'alert(/foo\u002bbar/.test("")=
)'>`,
> +               },
> +               {
> +                       "jsReBlank",
> +@@ -825,7 +825,7 @@ func TestEscapeSet(t *testing.T) {
> +                               "main":   `<button onclick=3D"title=3D'{{=
template "helper"}}'; ...">{{template "helper"}}</button>`,
> +                               "helper": `{{11}} of {{"<100>"}}`,
> +                       },
> +-                      `<button onclick=3D"title=3D'11 of \x3c100\x3e'; =
...">11 of &lt;100&gt;</button>`,
> ++                      `<button onclick=3D"title=3D'11 of \u003c100\u003=
e'; ...">11 of &lt;100&gt;</button>`,
> +               },
> +               // A non-recursive template that ends in a different cont=
ext.
> +               // helper starts in jsCtxRegexp and ends in jsCtxDivOp.
> +diff --git a/src/html/template/example_test.go b/src/html/template/examp=
le_test.go
> +index 9d965f1..6cf936f 100644
> +--- a/src/html/template/example_test.go
> ++++ b/src/html/template/example_test.go
> +@@ -116,9 +116,9 @@ func Example_escape() {
> +       // &#34;Fran &amp; Freddie&#39;s Diner&#34; &lt;tasty@example.com=
&gt;
> +       // &#34;Fran &amp; Freddie&#39;s Diner&#34; &lt;tasty@example.com=
&gt;
> +       // &#34;Fran &amp; Freddie&#39;s Diner&#34;32&lt;tasty@example.co=
m&gt;
> +-      // \"Fran \x26 Freddie\'s Diner\" \x3Ctasty@example.com\x3E
> +-      // \"Fran \x26 Freddie\'s Diner\" \x3Ctasty@example.com\x3E
> +-      // \"Fran \x26 Freddie\'s Diner\"32\x3Ctasty@example.com\x3E
> ++      // \"Fran \u0026 Freddie\'s Diner\" \u003Ctasty@example.com\u003E
> ++      // \"Fran \u0026 Freddie\'s Diner\" \u003Ctasty@example.com\u003E
> ++      // \"Fran \u0026 Freddie\'s Diner\"32\u003Ctasty@example.com\u003=
E
> +       // %22Fran+%26+Freddie%27s+Diner%2232%3Ctasty%40example.com%3E
> +
> + }
> +diff --git a/src/html/template/js.go b/src/html/template/js.go
> +index 0e91458..ea9c183 100644
> +--- a/src/html/template/js.go
> ++++ b/src/html/template/js.go
> +@@ -163,7 +163,6 @@ func jsValEscaper(args ...interface{}) string {
> +       }
> +       // TODO: detect cycles before calling Marshal which loops infinit=
ely on
> +       // cyclic data. This may be an unacceptable DoS risk.
> +-
> +       b, err :=3D json.Marshal(a)
> +       if err !=3D nil {
> +               // Put a space before comment so that if it is flush agai=
nst
> +@@ -178,8 +177,8 @@ func jsValEscaper(args ...interface{}) string {
> +       // TODO: maybe post-process output to prevent it from containing
> +       // "<!--", "-->", "<![CDATA[", "]]>", or "</script"
> +       // in case custom marshalers produce output containing those.
> +-
> +-      // TODO: Maybe abbreviate \u00ab to \xab to produce more compact =
output.
> ++      // Note: Do not use \x escaping to save bytes because it is not J=
SON compatible and this escaper
> ++      // supports ld+json content-type.
> +       if len(b) =3D=3D 0 {
> +               // In, `x=3Dy/{{.}}*z` a json.Marshaler that produces "" =
should
> +               // not cause the output `x=3Dy/*z`.
> +@@ -260,6 +259,8 @@ func replace(s string, replacementTable []string) st=
ring {
> +               r, w =3D utf8.DecodeRuneInString(s[i:])
> +               var repl string
> +               switch {
> ++              case int(r) < len(lowUnicodeReplacementTable):
> ++                      repl =3D lowUnicodeReplacementTable[r]
> +               case int(r) < len(replacementTable) && replacementTable[r=
] !=3D "":
> +                       repl =3D replacementTable[r]
> +               case r =3D=3D '\u2028':
> +@@ -283,67 +284,80 @@ func replace(s string, replacementTable []string) =
string {
> +       return b.String()
> + }
> +
> ++var lowUnicodeReplacementTable =3D []string{
> ++      0: `\u0000`, 1: `\u0001`, 2: `\u0002`, 3: `\u0003`, 4: `\u0004`, =
5: `\u0005`, 6: `\u0006`,
> ++      '\a': `\u0007`,
> ++      '\b': `\u0008`,
> ++      '\t': `\t`,
> ++      '\n': `\n`,
> ++      '\v': `\u000b`, // "\v" =3D=3D "v" on IE 6.
> ++      '\f': `\f`,
> ++      '\r': `\r`,
> ++      0xe:  `\u000e`, 0xf: `\u000f`, 0x10: `\u0010`, 0x11: `\u0011`, 0x=
12: `\u0012`, 0x13: `\u0013`,
> ++      0x14: `\u0014`, 0x15: `\u0015`, 0x16: `\u0016`, 0x17: `\u0017`, 0=
x18: `\u0018`, 0x19: `\u0019`,
> ++      0x1a: `\u001a`, 0x1b: `\u001b`, 0x1c: `\u001c`, 0x1d: `\u001d`, 0=
x1e: `\u001e`, 0x1f: `\u001f`,
> ++}
> ++
> + var jsStrReplacementTable =3D []string{
> +-      0:    `\0`,
> ++      0:    `\u0000`,
> +       '\t': `\t`,
> +       '\n': `\n`,
> +-      '\v': `\x0b`, // "\v" =3D=3D "v" on IE 6.
> ++      '\v': `\u000b`, // "\v" =3D=3D "v" on IE 6.
> +       '\f': `\f`,
> +       '\r': `\r`,
> +       // Encode HTML specials as hex so the output can be embedded
> +       // in HTML attributes without further encoding.
> +-      '"':  `\x22`,
> +-      '&':  `\x26`,
> +-      '\'': `\x27`,
> +-      '+':  `\x2b`,
> ++      '"':  `\u0022`,
> ++      '&':  `\u0026`,
> ++      '\'': `\u0027`,
> ++      '+':  `\u002b`,
> +       '/':  `\/`,
> +-      '<':  `\x3c`,
> +-      '>':  `\x3e`,
> ++      '<':  `\u003c`,
> ++      '>':  `\u003e`,
> +       '\\': `\\`,
> + }
> +
> + // jsStrNormReplacementTable is like jsStrReplacementTable but does not
> + // overencode existing escapes since this table has no entry for `\`.
> + var jsStrNormReplacementTable =3D []string{
> +-      0:    `\0`,
> ++      0:    `\u0000`,
> +       '\t': `\t`,
> +       '\n': `\n`,
> +-      '\v': `\x0b`, // "\v" =3D=3D "v" on IE 6.
> ++      '\v': `\u000b`, // "\v" =3D=3D "v" on IE 6.
> +       '\f': `\f`,
> +       '\r': `\r`,
> +       // Encode HTML specials as hex so the output can be embedded
> +       // in HTML attributes without further encoding.
> +-      '"':  `\x22`,
> +-      '&':  `\x26`,
> +-      '\'': `\x27`,
> +-      '+':  `\x2b`,
> ++      '"':  `\u0022`,
> ++      '&':  `\u0026`,
> ++      '\'': `\u0027`,
> ++      '+':  `\u002b`,
> +       '/':  `\/`,
> +-      '<':  `\x3c`,
> +-      '>':  `\x3e`,
> ++      '<':  `\u003c`,
> ++      '>':  `\u003e`,
> + }
> +-
> + var jsRegexpReplacementTable =3D []string{
> +-      0:    `\0`,
> ++      0:    `\u0000`,
> +       '\t': `\t`,
> +       '\n': `\n`,
> +-      '\v': `\x0b`, // "\v" =3D=3D "v" on IE 6.
> ++      '\v': `\u000b`, // "\v" =3D=3D "v" on IE 6.
> +       '\f': `\f`,
> +       '\r': `\r`,
> +       // Encode HTML specials as hex so the output can be embedded
> +       // in HTML attributes without further encoding.
> +-      '"':  `\x22`,
> ++      '"':  `\u0022`,
> +       '$':  `\$`,
> +-      '&':  `\x26`,
> +-      '\'': `\x27`,
> ++      '&':  `\u0026`,
> ++      '\'': `\u0027`,
> +       '(':  `\(`,
> +       ')':  `\)`,
> +       '*':  `\*`,
> +-      '+':  `\x2b`,
> ++      '+':  `\u002b`,
> +       '-':  `\-`,
> +       '.':  `\.`,
> +       '/':  `\/`,
> +-      '<':  `\x3c`,
> +-      '>':  `\x3e`,
> ++      '<':  `\u003c`,
> ++      '>':  `\u003e`,
> +       '?':  `\?`,
> +       '[':  `\[`,
> +       '\\': `\\`,
> +diff --git a/src/html/template/js_test.go b/src/html/template/js_test.go
> +index 075adaa..d7ee47b 100644
> +--- a/src/html/template/js_test.go
> ++++ b/src/html/template/js_test.go
> +@@ -137,7 +137,7 @@ func TestJSValEscaper(t *testing.T) {
> +               {"foo", `"foo"`},
> +               // Newlines.
> +               {"\r\n\u2028\u2029", `"\r\n\u2028\u2029"`},
> +-              // "\v" =3D=3D "v" on IE 6 so use "\x0b" instead.
> ++              // "\v" =3D=3D "v" on IE 6 so use "\u000b" instead.
> +               {"\t\x0b", `"\t\u000b"`},
> +               {struct{ X, Y int }{1, 2}, `{"X":1,"Y":2}`},
> +               {[]interface{}{}, "[]"},
> +@@ -173,7 +173,7 @@ func TestJSStrEscaper(t *testing.T) {
> +       }{
> +               {"", ``},
> +               {"foo", `foo`},
> +-              {"\u0000", `\0`},
> ++              {"\u0000", `\u0000`},
> +               {"\t", `\t`},
> +               {"\n", `\n`},
> +               {"\r", `\r`},
> +@@ -183,14 +183,14 @@ func TestJSStrEscaper(t *testing.T) {
> +               {"\\n", `\\n`},
> +               {"foo\r\nbar", `foo\r\nbar`},
> +               // Preserve attribute boundaries.
> +-              {`"`, `\x22`},
> +-              {`'`, `\x27`},
> ++              {`"`, `\u0022`},
> ++              {`'`, `\u0027`},
> +               // Allow embedding in HTML without further escaping.
> +-              {`&amp;`, `\x26amp;`},
> ++              {`&amp;`, `\u0026amp;`},
> +               // Prevent breaking out of text node and element boundari=
es.
> +-              {"</script>", `\x3c\/script\x3e`},
> +-              {"<![CDATA[", `\x3c![CDATA[`},
> +-              {"]]>", `]]\x3e`},
> ++              {"</script>", `\u003c\/script\u003e`},
> ++              {"<![CDATA[", `\u003c![CDATA[`},
> ++              {"]]>", `]]\u003e`},
> +               // https://dev.w3.org/html5/markup/aria/syntax.html#escap=
ing-text-span
> +               //   "The text in style, script, title, and textarea elem=
ents
> +               //   must not have an escaping text span start that is no=
t
> +@@ -201,11 +201,11 @@ func TestJSStrEscaper(t *testing.T) {
> +               // allow regular text content to be interpreted as script
> +               // allowing script execution via a combination of a JS st=
ring
> +               // injection followed by an HTML text injection.
> +-              {"<!--", `\x3c!--`},
> +-              {"-->", `--\x3e`},
> ++              {"<!--", `\u003c!--`},
> ++              {"-->", `--\u003e`},
> +               // From https://code.google.com/p/doctype/wiki/ArticleUtf=
7
> +               {"+ADw-script+AD4-alert(1)+ADw-/script+AD4-",
> +-                      `\x2bADw-script\x2bAD4-alert(1)\x2bADw-\/script\x=
2bAD4-`,
> ++                      `\u002bADw-script\u002bAD4-alert(1)\u002bADw-\/sc=
ript\u002bAD4-`,
> +               },
> +               // Invalid UTF-8 sequence
> +               {"foo\xA0bar", "foo\xA0bar"},
> +@@ -228,7 +228,7 @@ func TestJSRegexpEscaper(t *testing.T) {
> +       }{
> +               {"", `(?:)`},
> +               {"foo", `foo`},
> +-              {"\u0000", `\0`},
> ++              {"\u0000", `\u0000`},
> +               {"\t", `\t`},
> +               {"\n", `\n`},
> +               {"\r", `\r`},
> +@@ -238,19 +238,19 @@ func TestJSRegexpEscaper(t *testing.T) {
> +               {"\\n", `\\n`},
> +               {"foo\r\nbar", `foo\r\nbar`},
> +               // Preserve attribute boundaries.
> +-              {`"`, `\x22`},
> +-              {`'`, `\x27`},
> ++              {`"`, `\u0022`},
> ++              {`'`, `\u0027`},
> +               // Allow embedding in HTML without further escaping.
> +-              {`&amp;`, `\x26amp;`},
> ++              {`&amp;`, `\u0026amp;`},
> +               // Prevent breaking out of text node and element boundari=
es.
> +-              {"</script>", `\x3c\/script\x3e`},
> +-              {"<![CDATA[", `\x3c!\[CDATA\[`},
> +-              {"]]>", `\]\]\x3e`},
> ++              {"</script>", `\u003c\/script\u003e`},
> ++              {"<![CDATA[", `\u003c!\[CDATA\[`},
> ++              {"]]>", `\]\]\u003e`},
> +               // Escaping text spans.
> +-              {"<!--", `\x3c!\-\-`},
> +-              {"-->", `\-\-\x3e`},
> ++              {"<!--", `\u003c!\-\-`},
> ++              {"-->", `\-\-\u003e`},
> +               {"*", `\*`},
> +-              {"+", `\x2b`},
> ++              {"+", `\u002b`},
> +               {"?", `\?`},
> +               {"[](){}", `\[\]\(\)\{\}`},
> +               {"$foo|x.y", `\$foo\|x\.y`},
> +@@ -284,27 +284,27 @@ func TestEscapersOnLower7AndSelectHighCodepoints(t=
 *testing.T) {
> +               {
> +                       "jsStrEscaper",
> +                       jsStrEscaper,
> +-                      "\\0\x01\x02\x03\x04\x05\x06\x07" +
> +-                              "\x08\\t\\n\\x0b\\f\\r\x0E\x0F" +
> +-                              "\x10\x11\x12\x13\x14\x15\x16\x17" +
> +-                              "\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f" +
> +-                              ` !\x22#$%\x26\x27()*\x2b,-.\/` +
> +-                              `0123456789:;\x3c=3D\x3e?` +
> ++                      `\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007=
` +
> ++                              `\u0008\t\n\u000b\f\r\u000e\u000f` +
> ++                              `\u0010\u0011\u0012\u0013\u0014\u0015\u00=
16\u0017` +
> ++                              `\u0018\u0019\u001a\u001b\u001c\u001d\u00=
1e\u001f` +
> ++                              ` !\u0022#$%\u0026\u0027()*\u002b,-.\/` +
> ++                              `0123456789:;\u003c=3D\u003e?` +
> +                               `@ABCDEFGHIJKLMNO` +
> +                               `PQRSTUVWXYZ[\\]^_` +
> +                               "`abcdefghijklmno" +
> +-                              "pqrstuvwxyz{|}~\x7f" +
> ++                              "pqrstuvwxyz{|}~\u007f" +
> +                               "\u00A0\u0100\\u2028\\u2029\ufeff\U0001D1=
1E",
> +               },
> +               {
> +                       "jsRegexpEscaper",
> +                       jsRegexpEscaper,
> +-                      "\\0\x01\x02\x03\x04\x05\x06\x07" +
> +-                              "\x08\\t\\n\\x0b\\f\\r\x0E\x0F" +
> +-                              "\x10\x11\x12\x13\x14\x15\x16\x17" +
> +-                              "\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f" +
> +-                              ` !\x22#\$%\x26\x27\(\)\*\x2b,\-\.\/` +
> +-                              `0123456789:;\x3c=3D\x3e\?` +
> ++                      `\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007=
` +
> ++                              `\u0008\t\n\u000b\f\r\u000e\u000f` +
> ++                              `\u0010\u0011\u0012\u0013\u0014\u0015\u00=
16\u0017` +
> ++                              `\u0018\u0019\u001a\u001b\u001c\u001d\u00=
1e\u001f` +
> ++                              ` !\u0022#\$%\u0026\u0027\(\)\*\u002b,\-\=
.\/` +
> ++                              `0123456789:;\u003c=3D\u003e\?` +
> +                               `@ABCDEFGHIJKLMNO` +
> +                               `PQRSTUVWXYZ\[\\\]\^_` +
> +                               "`abcdefghijklmno" +
> +diff --git a/src/html/template/template_test.go b/src/html/template/temp=
late_test.go
> +index 13e6ba4..86bd4db 100644
> +--- a/src/html/template/template_test.go
> ++++ b/src/html/template/template_test.go
> +@@ -6,6 +6,7 @@ package template_test
> +
> + import (
> +       "bytes"
> ++      "encoding/json"
> +       . "html/template"
> +       "strings"
> +       "testing"
> +@@ -121,6 +122,44 @@ func TestNumbers(t *testing.T) {
> +       c.mustExecute(c.root, nil, "12.34 7.5")
> + }
> +
> ++func TestStringsInScriptsWithJsonContentTypeAreCorrectlyEscaped(t *test=
ing.T) {
> ++      // See #33671 and #37634 for more context on this.
> ++      tests :=3D []struct{ name, in string }{
> ++              {"empty", ""},
> ++              {"invalid", string(rune(-1))},
> ++              {"null", "\u0000"},
> ++              {"unit separator", "\u001F"},
> ++              {"tab", "\t"},
> ++              {"gt and lt", "<>"},
> ++              {"quotes", `'"`},
> ++              {"ASCII letters", "ASCII letters"},
> ++              {"Unicode", "=CA=95=E2=8A=99=CF=96=E2=8A=99=CA=94"},
> ++              {"Pizza", "=F0=9F=8D=95"},
> ++      }
> ++      const (
> ++              prefix =3D `<script type=3D"application/ld+json">`
> ++              suffix =3D `</script>`
> ++              templ  =3D prefix + `"{{.}}"` + suffix
> ++      )
> ++      tpl :=3D Must(New("JS string is JSON string").Parse(templ))
> ++      for _, tt :=3D range tests {
> ++              t.Run(tt.name, func(t *testing.T) {
> ++                      var buf bytes.Buffer
> ++                      if err :=3D tpl.Execute(&buf, tt.in); err !=3D ni=
l {
> ++                              t.Fatalf("Cannot render template: %v", er=
r)
> ++                      }
> ++                      trimmed :=3D bytes.TrimSuffix(bytes.TrimPrefix(bu=
f.Bytes(), []byte(prefix)), []byte(suffix))
> ++                      var got string
> ++                      if err :=3D json.Unmarshal(trimmed, &got); err !=
=3D nil {
> ++                              t.Fatalf("Cannot parse JS string %q as JS=
ON: %v", trimmed[1:len(trimmed)-1], err)
> ++                      }
> ++                      if got !=3D tt.in {
> ++                              t.Errorf("Serialization changed the strin=
g value: got %q want %q", got, tt.in)
> ++                      }
> ++              })
> ++      }
> ++}
> ++
> + type testCase struct {
> +       t    *testing.T
> +       root *Template
> +diff --git a/src/text/template/exec_test.go b/src/text/template/exec_tes=
t.go
> +index 77294ed..b8a809e 100644
> +--- a/src/text/template/exec_test.go
> ++++ b/src/text/template/exec_test.go
> +@@ -911,9 +911,9 @@ func TestJSEscaping(t *testing.T) {
> +               {`Go "jump" \`, `Go \"jump\" \\`},
> +               {`Yukihiro says "=E4=BB=8A=E6=97=A5=E3=81=AF=E4=B8=96=E7=
=95=8C"`, `Yukihiro says \"=E4=BB=8A=E6=97=A5=E3=81=AF=E4=B8=96=E7=95=8C\"`=
},
> +               {"unprintable \uFDFF", `unprintable \uFDFF`},
> +-              {`<html>`, `\x3Chtml\x3E`},
> +-              {`no =3D in attributes`, `no \x3D in attributes`},
> +-              {`&#x27; does not become HTML entity`, `\x26#x27; does no=
t become HTML entity`},
> ++              {`<html>`, `\u003Chtml\u003E`},
> ++              {`no =3D in attributes`, `no \u003D in attributes`},
> ++              {`&#x27; does not become HTML entity`, `\u0026#x27; does =
not become HTML entity`},
> +       }
> +       for _, tc :=3D range testCases {
> +               s :=3D JSEscapeString(tc.in)
> +diff --git a/src/text/template/funcs.go b/src/text/template/funcs.go
> +index 46125bc..f3de9fb 100644
> +--- a/src/text/template/funcs.go
> ++++ b/src/text/template/funcs.go
> +@@ -640,10 +640,10 @@ var (
> +       jsBackslash =3D []byte(`\\`)
> +       jsApos      =3D []byte(`\'`)
> +       jsQuot      =3D []byte(`\"`)
> +-      jsLt        =3D []byte(`\x3C`)
> +-      jsGt        =3D []byte(`\x3E`)
> +-      jsAmp       =3D []byte(`\x26`)
> +-      jsEq        =3D []byte(`\x3D`)
> ++      jsLt        =3D []byte(`\u003C`)
> ++      jsGt        =3D []byte(`\u003E`)
> ++      jsAmp       =3D []byte(`\u0026`)
> ++      jsEq        =3D []byte(`\u003D`)
> + )
> +
> + // JSEscape writes to w the escaped JavaScript equivalent of the plain =
text data b.
> +--
> +2.7.4
> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch b/me=
ta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
> new file mode 100644
> index 0000000..5f5a2d9
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
> @@ -0,0 +1,371 @@
> +From 576db9a3262931fcda4dbf1b78b56d4565a5ad3f Mon Sep 17 00:00:00 2001
> +From: Roland Shoemaker <bracewell@google.com>
> +Date: Mon, 20 Mar 2023 11:01:13 -0700
> +Subject: [PATCH 2/2] html/template: disallow actions in JS template lite=
rals
> +
> +ECMAScript 6 introduced template literals[0][1] which are delimited with
> +backticks. These need to be escaped in a similar fashion to the
> +delimiters for other string literals. Additionally template literals can
> +contain special syntax for string interpolation.
> +
> +There is no clear way to allow safe insertion of actions within JS
> +template literals, as handling (JS) string interpolation inside of these
> +literals is rather complex. As such we've chosen to simply disallow
> +template actions within these template literals.
> +
> +A new error code is added for this parsing failure case, errJsTmplLit,
> +but it is unexported as it is not backwards compatible with other minor
> +release versions to introduce an API change in a minor release. We will
> +export this code in the next major release.
> +
> +The previous behavior (with the cavet that backticks are now escaped
> +properly) can be re-enabled with GODEBUG=3Djstmpllitinterp=3D1.
> +
> +This change subsumes CL471455.
> +
> +Thanks to Sohom Datta, Manipal Institute of Technology, for reporting
> +this issue.
> +
> +Fixes CVE-2023-24538
> +For #59234
> +Fixes #59271
> +
> +[0] https://tc39.es/ecma262/multipage/ecmascript-language-expressions.ht=
ml#sec-template-literals
> +[1] https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Te=
mplate_literals
> +
> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private=
/+/1802457
> +Reviewed-by: Damien Neil <dneil@google.com>
> +Run-TryBot: Damien Neil <dneil@google.com>
> +Reviewed-by: Julie Qiu <julieqiu@google.com>
> +Reviewed-by: Roland Shoemaker <bracewell@google.com>
> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private=
/+/1802612
> +Run-TryBot: Roland Shoemaker <bracewell@google.com>
> +Change-Id: Ic7f10595615f2b2740d9c85ad7ef40dc0e78c04c
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/481987
> +Auto-Submit: Michael Knyszek <mknyszek@google.com>
> +TryBot-Result: Gopher Robot <gobot@golang.org>
> +Run-TryBot: Michael Knyszek <mknyszek@google.com>
> +Reviewed-by: Matthew Dempsky <mdempsky@google.com>
> +
> +Upstream-Status: Backport from https://github.com/golang/go/commit/b1e3e=
cfa06b67014429a197ec5e134ce4303ad9b
> +CVE: CVE-2023-24538
> +Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> +---
> + src/html/template/context.go      |  2 ++
> + src/html/template/error.go        | 13 ++++++++
> + src/html/template/escape.go       | 11 +++++++
> + src/html/template/escape_test.go  | 66 ++++++++++++++++++++++----------=
-------
> + src/html/template/js.go           |  2 ++
> + src/html/template/js_test.go      |  2 +-
> + src/html/template/jsctx_string.go |  9 ++++++
> + src/html/template/state_string.go | 37 ++++++++++++++++++++--
> + src/html/template/transition.go   |  7 ++++-
> + 9 files changed, 116 insertions(+), 33 deletions(-)
> +
> +diff --git a/src/html/template/context.go b/src/html/template/context.go
> +index f7d4849..0b65313 100644
> +--- a/src/html/template/context.go
> ++++ b/src/html/template/context.go
> +@@ -116,6 +116,8 @@ const (
> +       stateJSDqStr
> +       // stateJSSqStr occurs inside a JavaScript single quoted string.
> +       stateJSSqStr
> ++      // stateJSBqStr occurs inside a JavaScript back quoted string.
> ++      stateJSBqStr
> +       // stateJSRegexp occurs inside a JavaScript regexp literal.
> +       stateJSRegexp
> +       // stateJSBlockCmt occurs inside a JavaScript /* block comment */=
.
> +diff --git a/src/html/template/error.go b/src/html/template/error.go
> +index 0e52706..fd26b64 100644
> +--- a/src/html/template/error.go
> ++++ b/src/html/template/error.go
> +@@ -211,6 +211,19 @@ const (
> +       //   pipeline occurs in an unquoted attribute value context, "htm=
l" is
> +       //   disallowed. Avoid using "html" and "urlquery" entirely in ne=
w templates.
> +       ErrPredefinedEscaper
> ++
> ++      // errJSTmplLit: "... appears in a JS template literal"
> ++      // Example:
> ++      //     <script>var tmpl =3D `{{.Interp}`</script>
> ++      // Discussion:
> ++      //   Package html/template does not support actions inside of JS =
template
> ++      //   literals.
> ++      //
> ++      // TODO(rolandshoemaker): we cannot add this as an exported error=
 in a minor
> ++      // release, since it is backwards incompatible with the other min=
or
> ++      // releases. As such we need to leave it unexported, and then we'=
ll add it
> ++      // in the next major release.
> ++      errJSTmplLit
> + )
> +
> + func (e *Error) Error() string {
> +diff --git a/src/html/template/escape.go b/src/html/template/escape.go
> +index f12dafa..29ca5b3 100644
> +--- a/src/html/template/escape.go
> ++++ b/src/html/template/escape.go
> +@@ -8,6 +8,7 @@ import (
> +       "bytes"
> +       "fmt"
> +       "html"
> ++      "internal/godebug"
> +       "io"
> +       "text/template"
> +       "text/template/parse"
> +@@ -203,6 +204,16 @@ func (e *escaper) escapeAction(c context, n *parse.=
ActionNode) context {
> +               c.jsCtx =3D jsCtxDivOp
> +       case stateJSDqStr, stateJSSqStr:
> +               s =3D append(s, "_html_template_jsstrescaper")
> ++      case stateJSBqStr:
> ++              debugAllowActionJSTmpl :=3D godebug.Get("jstmpllitinterp"=
)
> ++              if debugAllowActionJSTmpl =3D=3D "1" {
> ++                      s =3D append(s, "_html_template_jsstrescaper")
> ++              } else {
> ++                      return context{
> ++                              state: stateError,
> ++                              err:   errorf(errJSTmplLit, n, n.Line, "%=
s appears in a JS template literal", n),
> ++                      }
> ++              }
> +       case stateJSRegexp:
> +               s =3D append(s, "_html_template_jsregexpescaper")
> +       case stateCSS:
> +diff --git a/src/html/template/escape_test.go b/src/html/template/escape=
_test.go
> +index c709660..807aabd 100644
> +--- a/src/html/template/escape_test.go
> ++++ b/src/html/template/escape_test.go
> +@@ -681,35 +681,31 @@ func TestEscape(t *testing.T) {
> +       }
> +
> +       for _, test :=3D range tests {
> +-              tmpl :=3D New(test.name)
> +-              tmpl =3D Must(tmpl.Parse(test.input))
> +-              // Check for bug 6459: Tree field was not set in Parse.
> +-              if tmpl.Tree !=3D tmpl.text.Tree {
> +-                      t.Errorf("%s: tree not set properly", test.name)
> +-                      continue
> +-              }
> +-              b :=3D new(bytes.Buffer)
> +-              if err :=3D tmpl.Execute(b, data); err !=3D nil {
> +-                      t.Errorf("%s: template execution failed: %s", tes=
t.name, err)
> +-                      continue
> +-              }
> +-              if w, g :=3D test.output, b.String(); w !=3D g {
> +-                      t.Errorf("%s: escaped output: want\n\t%q\ngot\n\t=
%q", test.name, w, g)
> +-                      continue
> +-              }
> +-              b.Reset()
> +-              if err :=3D tmpl.Execute(b, pdata); err !=3D nil {
> +-                      t.Errorf("%s: template execution failed for point=
er: %s", test.name, err)
> +-                      continue
> +-              }
> +-              if w, g :=3D test.output, b.String(); w !=3D g {
> +-                      t.Errorf("%s: escaped output for pointer: want\n\=
t%q\ngot\n\t%q", test.name, w, g)
> +-                      continue
> +-              }
> +-              if tmpl.Tree !=3D tmpl.text.Tree {
> +-                      t.Errorf("%s: tree mismatch", test.name)
> +-                      continue
> +-              }
> ++              t.Run(test.name, func(t *testing.T) {
> ++                      tmpl :=3D New(test.name)
> ++                      tmpl =3D Must(tmpl.Parse(test.input))
> ++                      // Check for bug 6459: Tree field was not set in =
Parse.
> ++                      if tmpl.Tree !=3D tmpl.text.Tree {
> ++                              t.Fatalf("%s: tree not set properly", tes=
t.name)
> ++                      }
> ++                      b :=3D new(strings.Builder)
> ++                      if err :=3D tmpl.Execute(b, data); err !=3D nil {
> ++                              t.Fatalf("%s: template execution failed: =
%s", test.name, err)
> ++                      }
> ++                      if w, g :=3D test.output, b.String(); w !=3D g {
> ++                              t.Fatalf("%s: escaped output: want\n\t%q\=
ngot\n\t%q", test.name, w, g)
> ++                      }
> ++                      b.Reset()
> ++                      if err :=3D tmpl.Execute(b, pdata); err !=3D nil =
{
> ++                              t.Fatalf("%s: template execution failed f=
or pointer: %s", test.name, err)
> ++                      }
> ++                      if w, g :=3D test.output, b.String(); w !=3D g {
> ++                              t.Fatalf("%s: escaped output for pointer:=
 want\n\t%q\ngot\n\t%q", test.name, w, g)
> ++                      }
> ++                      if tmpl.Tree !=3D tmpl.text.Tree {
> ++                              t.Fatalf("%s: tree mismatch", test.name)
> ++                      }
> ++              })
> +       }
> + }
> +
> +@@ -920,6 +916,10 @@ func TestErrors(t *testing.T) {
> +                       "<a href=3D'/foo?{{range .Items}}&{{.K}}=3D{{.V}}=
{{end}}'>",
> +                       "",
> +               },
> ++              {
> ++                      "<script>var a =3D `${a+b}`</script>`",
> ++                      "",
> ++              },
> +               // Error cases.
> +               {
> +                       "{{if .Cond}}<a{{end}}",
> +@@ -1058,6 +1058,10 @@ func TestErrors(t *testing.T) {
> +                       // html is allowed since it is the last command i=
n the pipeline, but urlquery is not.
> +                       `predefined escaper "urlquery" disallowed in temp=
late`,
> +               },
> ++              {
> ++                      "<script>var tmpl =3D `asd {{.}}`;</script>",
> ++                      `{{.}} appears in a JS template literal`,
> ++              },
> +       }
> +       for _, test :=3D range tests {
> +               buf :=3D new(bytes.Buffer)
> +@@ -1280,6 +1284,10 @@ func TestEscapeText(t *testing.T) {
> +                       context{state: stateJSSqStr, delim: delimDoubleQu=
ote, attr: attrScript},
> +               },
> +               {
> ++                      "<a onclick=3D\"`foo",
> ++                      context{state: stateJSBqStr, delim: delimDoubleQu=
ote, attr: attrScript},
> ++              },
> ++              {
> +                       `<A ONCLICK=3D"'`,
> +                       context{state: stateJSSqStr, delim: delimDoubleQu=
ote, attr: attrScript},
> +               },
> +diff --git a/src/html/template/js.go b/src/html/template/js.go
> +index ea9c183..b888eaf 100644
> +--- a/src/html/template/js.go
> ++++ b/src/html/template/js.go
> +@@ -308,6 +308,7 @@ var jsStrReplacementTable =3D []string{
> +       // Encode HTML specials as hex so the output can be embedded
> +       // in HTML attributes without further encoding.
> +       '"':  `\u0022`,
> ++      '`':  `\u0060`,
> +       '&':  `\u0026`,
> +       '\'': `\u0027`,
> +       '+':  `\u002b`,
> +@@ -331,6 +332,7 @@ var jsStrNormReplacementTable =3D []string{
> +       '"':  `\u0022`,
> +       '&':  `\u0026`,
> +       '\'': `\u0027`,
> ++      '`':  `\u0060`,
> +       '+':  `\u002b`,
> +       '/':  `\/`,
> +       '<':  `\u003c`,
> +diff --git a/src/html/template/js_test.go b/src/html/template/js_test.go
> +index d7ee47b..7d963ae 100644
> +--- a/src/html/template/js_test.go
> ++++ b/src/html/template/js_test.go
> +@@ -292,7 +292,7 @@ func TestEscapersOnLower7AndSelectHighCodepoints(t *=
testing.T) {
> +                               `0123456789:;\u003c=3D\u003e?` +
> +                               `@ABCDEFGHIJKLMNO` +
> +                               `PQRSTUVWXYZ[\\]^_` +
> +-                              "`abcdefghijklmno" +
> ++                              "\\u0060abcdefghijklmno" +
> +                               "pqrstuvwxyz{|}~\u007f" +
> +                               "\u00A0\u0100\\u2028\\u2029\ufeff\U0001D1=
1E",
> +               },
> +diff --git a/src/html/template/jsctx_string.go b/src/html/template/jsctx=
_string.go
> +index dd1d87e..2394893 100644
> +--- a/src/html/template/jsctx_string.go
> ++++ b/src/html/template/jsctx_string.go
> +@@ -4,6 +4,15 @@ package template
> +
> + import "strconv"
> +
> ++func _() {
> ++      // An "invalid array index" compiler error signifies that the con=
stant values have changed.
> ++      // Re-run the stringer command to generate them again.
> ++      var x [1]struct{}
> ++      _ =3D x[jsCtxRegexp-0]
> ++      _ =3D x[jsCtxDivOp-1]
> ++      _ =3D x[jsCtxUnknown-2]
> ++}
> ++
> + const _jsCtx_name =3D "jsCtxRegexpjsCtxDivOpjsCtxUnknown"
> +
> + var _jsCtx_index =3D [...]uint8{0, 11, 21, 33}
> +diff --git a/src/html/template/state_string.go b/src/html/template/state=
_string.go
> +index 05104be..6fb1a6e 100644
> +--- a/src/html/template/state_string.go
> ++++ b/src/html/template/state_string.go
> +@@ -4,9 +4,42 @@ package template
> +
> + import "strconv"
> +
> +-const _state_name =3D "stateTextstateTagstateAttrNamestateAfterNamestat=
eBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSstate=
JSDqStrstateJSSqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateC=
SSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtst=
ateCSSLineCmtstateError"
> ++func _() {
> ++      // An "invalid array index" compiler error signifies that the con=
stant values have changed.
> ++      // Re-run the stringer command to generate them again.
> ++      var x [1]struct{}
> ++      _ =3D x[stateText-0]
> ++      _ =3D x[stateTag-1]
> ++      _ =3D x[stateAttrName-2]
> ++      _ =3D x[stateAfterName-3]
> ++      _ =3D x[stateBeforeValue-4]
> ++      _ =3D x[stateHTMLCmt-5]
> ++      _ =3D x[stateRCDATA-6]
> ++      _ =3D x[stateAttr-7]
> ++      _ =3D x[stateURL-8]
> ++      _ =3D x[stateSrcset-9]
> ++      _ =3D x[stateJS-10]
> ++      _ =3D x[stateJSDqStr-11]
> ++      _ =3D x[stateJSSqStr-12]
> ++      _ =3D x[stateJSBqStr-13]
> ++      _ =3D x[stateJSRegexp-14]
> ++      _ =3D x[stateJSBlockCmt-15]
> ++      _ =3D x[stateJSLineCmt-16]
> ++      _ =3D x[stateCSS-17]
> ++      _ =3D x[stateCSSDqStr-18]
> ++      _ =3D x[stateCSSSqStr-19]
> ++      _ =3D x[stateCSSDqURL-20]
> ++      _ =3D x[stateCSSSqURL-21]
> ++      _ =3D x[stateCSSURL-22]
> ++      _ =3D x[stateCSSBlockCmt-23]
> ++      _ =3D x[stateCSSLineCmt-24]
> ++      _ =3D x[stateError-25]
> ++      _ =3D x[stateDead-26]
> ++}
> ++
> ++const _state_name =3D "stateTextstateTagstateAttrNamestateAfterNamestat=
eBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSstate=
JSDqStrstateJSSqStrstateJSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtst=
ateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateC=
SSBlockCmtstateCSSLineCmtstateErrorstateDead"
> +
> +-var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100,=
 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 244, 255, 271, 286,=
 296}
> ++var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100,=
 111, 118, 130, 142, 154, 167, 182, 196, 204, 217, 230, 243, 256, 267, 283,=
 298, 308, 317}
> +
> + func (i state) String() string {
> +       if i >=3D state(len(_state_index)-1) {
> +diff --git a/src/html/template/transition.go b/src/html/template/transit=
ion.go
> +index 06df679..92eb351 100644
> +--- a/src/html/template/transition.go
> ++++ b/src/html/template/transition.go
> +@@ -27,6 +27,7 @@ var transitionFunc =3D [...]func(context, []byte) (con=
text, int){
> +       stateJS:          tJS,
> +       stateJSDqStr:     tJSDelimited,
> +       stateJSSqStr:     tJSDelimited,
> ++      stateJSBqStr:     tJSDelimited,
> +       stateJSRegexp:    tJSDelimited,
> +       stateJSBlockCmt:  tBlockCmt,
> +       stateJSLineCmt:   tLineCmt,
> +@@ -262,7 +263,7 @@ func tURL(c context, s []byte) (context, int) {
> +
> + // tJS is the context transition function for the JS state.
> + func tJS(c context, s []byte) (context, int) {
> +-      i :=3D bytes.IndexAny(s, `"'/`)
> ++      i :=3D bytes.IndexAny(s, "\"`'/")
> +       if i =3D=3D -1 {
> +               // Entire input is non string, comment, regexp tokens.
> +               c.jsCtx =3D nextJSCtx(s, c.jsCtx)
> +@@ -274,6 +275,8 @@ func tJS(c context, s []byte) (context, int) {
> +               c.state, c.jsCtx =3D stateJSDqStr, jsCtxRegexp
> +       case '\'':
> +               c.state, c.jsCtx =3D stateJSSqStr, jsCtxRegexp
> ++      case '`':
> ++              c.state, c.jsCtx =3D stateJSBqStr, jsCtxRegexp
> +       case '/':
> +               switch {
> +               case i+1 < len(s) && s[i+1] =3D=3D '/':
> +@@ -303,6 +306,8 @@ func tJSDelimited(c context, s []byte) (context, int=
) {
> +       switch c.state {
> +       case stateJSSqStr:
> +               specials =3D `\'`
> ++      case stateJSBqStr:
> ++              specials =3D "`\\"
> +       case stateJSRegexp:
> +               specials =3D `\/[]`
> +       }
> +--
> +2.7.4
> --
> 2.7.4
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180338): https://lists.openembedded.org/g/openembedde=
d-core/message/180338
> Mute This Topic: https://lists.openembedded.org/mt/98464668/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

