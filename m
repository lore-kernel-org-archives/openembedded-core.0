Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EBD8EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 15:28:48 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.19597.1687966124634749780
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 08:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Wkw0wa6V;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.43, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51d805cb33aso6187522a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 08:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687966123; x=1690558123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHXa3g3uVg3HQKi1Wpq74uTNUA9wHLUPe4+r+HtDgzg=;
        b=Wkw0wa6VbvQHnL9qm+kDguioJ0/d4gFW16WXE0qpESKqYxsXosyLI/2MQeTC/0mmZa
         fD1ecDYIqYENs0Xy8HqL4gf+GCEY3Ddv14lftZREzRF0C2hFomm3sGHlI8YvoaJAMm+I
         SFfMRM0V7JFo+AFJNrSoZhLSiDKFDUP9bRApCmiJqMh+ikmX8dQlKMGXDj7a2D/6Suvx
         BEhLr67vDE32IUUrJ3XXiy3qO6R/3IvA3u1hEzNgEhZh+pctw3gwCzi9OMyjg2GQyydO
         8S2yNzk5V/2fQ+trNEFwRr1ZOxF+vsQxIT33B02CdHrGfqkAF61q2JJJuswbnKO5E8ip
         IaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687966123; x=1690558123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHXa3g3uVg3HQKi1Wpq74uTNUA9wHLUPe4+r+HtDgzg=;
        b=JftRdiGqzd2SNUareRzGgW0Fq3K0esD0VrXGANZm22Gw6e9mHE2zTHt0nDx3HVniqI
         Pc8zkdweIBbmWWiEaCFo/xFqPqlZ6Z5hwWX4ardUnEoNkPEMO6LYupxSjkwowywcev9B
         waAPw47yFm7ZJsMupqAmgncVfWYfPuGj11no3H9CVomEtGx/VbM9rYvLJr2Z1K04sa8z
         PKVt6PRtWnOnYHSsuaeYDi+P7AmoX4le+vV54eic8SP3dy+s5zpae1Ens/hSav5QnTuo
         RPDnDJbsmr0AxkPM0imSrQhA2fyfZyoWik7mstADl5vRsETWuMZouq+qbxwy995TltFW
         nTHg==
X-Gm-Message-State: AC+VfDwRL9sLUZI+PgW46ZceRgto1jyUdBF7h11AQZJOOMOMItzKwSmp
	u/7uBT8ivMJBrBQ40wrqv9hqIQYECfg9FrK9wBwTHQ==
X-Google-Smtp-Source: ACHHUZ4YKGv+vpWSHvb3R892l2uptHkkdrvkeNBRpgz105kVn32AcEMA0ie7Xs9iNP00cAzejG8dAY/6e2kx9PywWdM=
X-Received: by 2002:aa7:da8b:0:b0:51d:b0a4:1d44 with SMTP id
 q11-20020aa7da8b000000b0051db0a41d44mr2764634eds.29.1687966122693; Wed, 28
 Jun 2023 08:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230627112345.5724-1-asharma@mvista.com>
In-Reply-To: <20230627112345.5724-1-asharma@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 28 Jun 2023 05:28:31 -1000
Message-ID: <CAOSpxdaG5QRj4rU_WooWRSfBW0R4V67jnz0Bg_JzkgGbA+RMqA@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] go: Fix CVE-2023-29400
To: Ashish Sharma <asharma@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 15:28:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183593

Hi Ashish,

Unfortunately I'm getting fuzz warnings with your patch:

WARNING: go-native-1.14.15-r0 do_patch: Fuzz detected:

Applying patch CVE-2023-29400.patch
patching file src/html/template/escape.go
Hunk #1 succeeded at 360 (offset -22 lines).
patching file src/html/template/escape_test.go
patching file src/html/template/html.go
Hunk #1 succeeded at 14 with fuzz 2.

Please correct and send a v2.

Thanks!

Steve

On Tue, Jun 27, 2023 at 1:23=E2=80=AFAM Ashish Sharma <asharma@mvista.com> =
wrote:
>
> emit filterFailsafe for empty unquoted attr
> value
>
> Signed-off-by: Ashish Sharma <asharma@mvista.com>
> ---
>  meta/recipes-devtools/go/go-1.14.inc          |  1 +
>  .../go/go-1.14/CVE-2023-29400.patch           | 93 +++++++++++++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29400.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools=
/go/go-1.14.inc
> index c544b00b22d..1e0c3fab6fa 100644
> --- a/meta/recipes-devtools/go/go-1.14.inc
> +++ b/meta/recipes-devtools/go/go-1.14.inc
> @@ -66,6 +66,7 @@ SRC_URI +=3D "\
>      file://CVE-2023-24538-3.patch \
>      file://CVE-2023-24539.patch \
>      file://CVE-2023-24540.patch \
> +    file://CVE-2023-29400.patch \
>  "
>
>  SRC_URI_append_libc-musl =3D " file://0009-ld-replace-glibc-dynamic-link=
er-with-musl.patch"
> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-29400.patch b/meta=
/recipes-devtools/go/go-1.14/CVE-2023-29400.patch
> new file mode 100644
> index 00000000000..cb0419a920e
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-29400.patch
> @@ -0,0 +1,93 @@
> +From 0d347544cbca0f42b160424f6bc2458ebcc7b3fc Mon Sep 17 00:00:00 2001
> +From: Roland Shoemaker <bracewell@google.com>
> +Date: Thu, 13 Apr 2023 14:01:50 -0700
> +Subject: [PATCH] html/template: emit filterFailsafe for empty unquoted a=
ttr
> + value
> +
> +An unquoted action used as an attribute value can result in unsafe
> +behavior if it is empty, as HTML normalization will result in unexpected
> +attributes, and may allow attribute injection. If executing a template
> +results in a empty unquoted attribute value, emit filterFailsafe
> +instead.
> +
> +Thanks to Juho Nurminen of Mattermost for reporting this issue.
> +
> +Fixes #59722
> +Fixes CVE-2023-29400
> +
> +Change-Id: Ia38d1b536ae2b4af5323a6c6d861e3c057c2570a
> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private=
/+/1826631
> +Reviewed-by: Julie Qiu <julieqiu@google.com>
> +Run-TryBot: Roland Shoemaker <bracewell@google.com>
> +Reviewed-by: Damien Neil <dneil@google.com>
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/491617
> +Run-TryBot: Carlos Amedee <carlos@golang.org>
> +Reviewed-by: Dmitri Shuralyov <dmitshur@golang.org>
> +Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
> +TryBot-Result: Gopher Robot <gobot@golang.org>
> +
> +Upstream-Status: Backport from [https://github.com/golang/go/commit/0d34=
7544cbca0f42b160424f6bc2458ebcc7b3fc]
> +CVE: CVE-2023-29400
> +Signed-off-by: Ashish Sharma <asharma@mvista.com>
> +---
> + src/html/template/escape.go      |  5 ++---
> + src/html/template/escape_test.go | 15 +++++++++++++++
> + src/html/template/html.go        |  3 +++
> + 3 files changed, 20 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/html/template/escape.go b/src/html/template/escape.go
> +index 4ba1d6b31897e..a62ef159f0dcd 100644
> +--- a/src/html/template/escape.go
> ++++ b/src/html/template/escape.go
> +@@ -382,9 +382,8 @@ func normalizeEscFn(e string) string {
> + // for all x.
> + var redundantFuncs =3D map[string]map[string]bool{
> +       "_html_template_commentescaper": {
> +-              "_html_template_attrescaper":    true,
> +-              "_html_template_nospaceescaper": true,
> +-              "_html_template_htmlescaper":    true,
> ++              "_html_template_attrescaper": true,
> ++              "_html_template_htmlescaper": true,
> +       },
> +       "_html_template_cssescaper": {
> +               "_html_template_attrescaper": true,
> +diff --git a/src/html/template/escape_test.go b/src/html/template/escape=
_test.go
> +index 3dd212bac9406..f8b2b448f2dfa 100644
> +--- a/src/html/template/escape_test.go
> ++++ b/src/html/template/escape_test.go
> +@@ -678,6 +678,21 @@ func TestEscape(t *testing.T) {
> +                       `<img srcset=3D{{",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,=
,,,,,,,,,,,,,,,,,"}}>`,
> +                       `<img srcset=3D,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,=
,,,,,,,,,,,,,,>`,
> +               },
> ++              {
> ++                      "unquoted empty attribute value (plaintext)",
> ++                      "<p name=3D{{.U}}>",
> ++                      "<p name=3DZgotmplZ>",
> ++              },
> ++              {
> ++                      "unquoted empty attribute value (url)",
> ++                      "<p href=3D{{.U}}>",
> ++                      "<p href=3DZgotmplZ>",
> ++              },
> ++              {
> ++                      "quoted empty attribute value",
> ++                      "<p name=3D\"{{.U}}\">",
> ++                      "<p name=3D\"\">",
> ++              },
> +       }
> +
> +       for _, test :=3D range tests {
> +diff --git a/src/html/template/html.go b/src/html/template/html.go
> +index bcca0b51a0ef9..a181699a5bda8 100644
> +--- a/src/html/template/html.go
> ++++ b/src/html/template/html.go
> +@@ -14,6 +14,9 @@ import (
> + // htmlNospaceEscaper escapes for inclusion in unquoted attribute value=
s.
> + func htmlNospaceEscaper(args ...any) string {
> +       s, t :=3D stringify(args...)
> ++      if s =3D=3D "" {
> ++              return filterFailsafe
> ++      }
> +       if t =3D=3D contentTypeHTML {
> +               return htmlReplacer(stripTags(s), htmlNospaceNormReplacem=
entTable, false)
> +       }
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183485): https://lists.openembedded.org/g/openembedde=
d-core/message/183485
> Mute This Topic: https://lists.openembedded.org/mt/99807269/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

