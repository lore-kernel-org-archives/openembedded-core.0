Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB21C7EE23
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 14:19:23 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.9177.1685974753533991252
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 07:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=CE/iQK7P;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.48, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5149390b20aso7474843a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 07:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685974752; x=1688566752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLH3yf2Tf6mto82VZX8hfZCBwh/PrKUgCOn9++7/++g=;
        b=CE/iQK7Pnyw3qKw7sx7ATOdLpak8s7zJBNjlGc5UxJ6M7kiVOQfhwIqEzww8Qe+o0r
         bSJZewtVsU6OvYp4dovFiJUc1eexrBECZFmRNYPI7ECI5VsqelEo5u5qsljgSw0B78M/
         JLQC7t084gFi21AnUX/Ei4eXqFBTkrmWyI77Ftq+U1M5vo/ufiR1vPEq/WZYXfXPOGQu
         rvYcoQ+Iosl6ohJ0oVTvnoYdvHwykLMQEqeHorqj+dAnEOt0NyeQb8sYjrbM9yOcZ7rA
         HHuZg9LNNgaLWuDO7NTDsndwwZgVwLzTR4q8yHnO+0qrgO/iy0M1uCiOdlDj2mXwVdaz
         fVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685974752; x=1688566752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLH3yf2Tf6mto82VZX8hfZCBwh/PrKUgCOn9++7/++g=;
        b=hlz5USToAk205zv0QYdoDhKEWdoCwJv/gNA9heJka4PBUe8InfjJDpPHXnd+ZabWvF
         CmezchB1FbVpF3mimB+qFJlU6cJ6JE7lAhEESaNeJ2hSdUkGaFFZYqY0XJ2z4KrbkfM9
         YnnDCEMJ2v0o6+axrJ4XODz/0q3IoOnjSEH6Jrdr6/dFX1V6tzG08W5YFpCRg9HdFY/R
         P9kxA368DRLqHvoeYxdHiBPB65TvgDwc7tSWM0U1VzqT/gEqLqGMnjCesU1n4y2KMoc3
         8/3HJ8XgtHaevspFsfFRn5/DT3dpgL/+VIHlMipRmToRdMpioABLzDjEwkrLuKHvEreY
         v/Aw==
X-Gm-Message-State: AC+VfDyXY2hBRQlc+Tq0BMXSX6NnCah7QAMRWAd0FJ2Ax9599ENOiXZg
	BbTf678TnmYNVYj//5ayEseM/r1fq0Lvc4bzLBUBHw==
X-Google-Smtp-Source: ACHHUZ6wbWUhJJ2hk2GBJoChGgGjBwH/EweXw3CV/AYDGA/KBoS7ttWUlf3OE1ygFK6yX5PCAbJYLHg/jV8b7BQzIvo=
X-Received: by 2002:a50:ee01:0:b0:50b:d564:2f with SMTP id g1-20020a50ee01000000b0050bd564002fmr7237715eds.34.1685974751800;
 Mon, 05 Jun 2023 07:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230605032536.17282-1-asharma@mvista.com>
In-Reply-To: <20230605032536.17282-1-asharma@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 5 Jun 2023 04:18:59 -1000
Message-ID: <CAOSpxdZugdvYKjNAyRiWxeEs=L4E57+j9kdOubThE3BETz5v9A@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] golang: Fix CVE-2023-24539
To: Ashish Sharma <asharma@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 14:19:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182386

This patch will not apply.  Based on a quick inspection of your patch
I suspect you are using an older version of dunfell.  Please send a v2
based on the current dunfell head.

Thanks!

Steve

On Sun, Jun 4, 2023 at 5:25=E2=80=AFPM Ashish Sharma <asharma@mvista.com> w=
rote:
>
> Fixing of improper sanitization of CSS values in html/template
>
> Signed-off-by: Ashish Sharma <asharma@mvista.com>
> ---
>  meta/recipes-devtools/go/go-1.14.inc          |  1 +
>  .../go/go-1.14/CVE-2023-24539.patch           | 60 +++++++++++++++++++
>  2 files changed, 61 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24539.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools=
/go/go-1.14.inc
> index f7482f8458..228becdb23 100644
> --- a/meta/recipes-devtools/go/go-1.14.inc
> +++ b/meta/recipes-devtools/go/go-1.14.inc
> @@ -55,6 +55,7 @@ SRC_URI +=3D "\
>      file://CVE-2022-41715.patch \
>      file://CVE-2022-41717.patch \
>      file://CVE-2022-1962.patch \
> +    file://CVE-2023-24539.patch \
>  "
>
>  SRC_URI_append_libc-musl =3D " file://0009-ld-replace-glibc-dynamic-link=
er-with-musl.patch"
> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24539.patch b/meta=
/recipes-devtools/go/go-1.14/CVE-2023-24539.patch
> new file mode 100644
> index 0000000000..1b7d849c23
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24539.patch
> @@ -0,0 +1,60 @@
> +From 8673ca81e5340b87709db2d9749c92a3bf925df1 Mon Sep 17 00:00:00 2001
> +From: Roland Shoemaker <bracewell@google.com>
> +Date: Thu, 13 Apr 2023 15:40:44 -0700
> +Subject: [PATCH] html/template: disallow angle brackets in CSS values
> +
> +Angle brackets should not appear in CSS contexts, as they may affect
> +token boundaries (such as closing a <style> tag, resulting in
> +injection). Instead emit filterFailsafe, matching the behavior for other
> +dangerous characters.
> +
> +Thanks to Juho Nurminen of Mattermost for reporting this issue.
> +
> +Fixes #59720
> +Fixes CVE-2023-24539
> +
> +Change-Id: Iccc659c9a18415992b0c05c178792228e3a7bae4
> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private=
/+/1826636
> +Reviewed-by: Julie Qiu <julieqiu@google.com>
> +Run-TryBot: Roland Shoemaker <bracewell@google.com>
> +Reviewed-by: Damien Neil <dneil@google.com>
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/491615
> +Reviewed-by: Dmitri Shuralyov <dmitshur@golang.org>
> +Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
> +Run-TryBot: Carlos Amedee <carlos@golang.org>
> +TryBot-Result: Gopher Robot <gobot@golang.org>
> +
> +Upstream-Status: Backport [https://github.com/golang/go/commit/8673ca81e=
5340b87709db2d9749c92a3bf925df1]
> +CVE: CVE-2023-24539
> +Signed-off-by: Ashish Sharma <asharma@mvista.com>
> +---
> + src/html/template/css.go      | 2 +-
> + src/html/template/css_test.go | 2 ++
> + 2 files changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/html/template/css.go b/src/html/template/css.go
> +index 890a0c6b227fe..f650d8b3e843a 100644
> +--- a/src/html/template/css.go
> ++++ b/src/html/template/css.go
> +@@ -238,7 +238,7 @@ func cssValueFilter(args ...any) string {
> +       // inside a string that might embed JavaScript source.
> +       for i, c :=3D range b {
> +               switch c {
> +-              case 0, '"', '\'', '(', ')', '/', ';', '@', '[', '\\', ']=
', '`', '{', '}':
> ++              case 0, '"', '\'', '(', ')', '/', ';', '@', '[', '\\', ']=
', '`', '{', '}', '<', '>':
> +                       return filterFailsafe
> +               case '-':
> +                       // Disallow <!-- or -->.
> +diff --git a/src/html/template/css_test.go b/src/html/template/css_test.=
go
> +index a735638b0314f..2b76256a766e9 100644
> +--- a/src/html/template/css_test.go
> ++++ b/src/html/template/css_test.go
> +@@ -231,6 +231,8 @@ func TestCSSValueFilter(t *testing.T) {
> +               {`-exp\000052 ession(alert(1337))`, "ZgotmplZ"},
> +               {`-expre\0000073sion`, "-expre\x073sion"},
> +               {`@import url evil.css`, "ZgotmplZ"},
> ++              {"<", "ZgotmplZ"},
> ++              {">", "ZgotmplZ"},
> +       }
> +       for _, test :=3D range tests {
> +               got :=3D cssValueFilter(test.css)
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182371): https://lists.openembedded.org/g/openembedde=
d-core/message/182371
> Mute This Topic: https://lists.openembedded.org/mt/99333673/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

