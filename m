Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE81C77B73
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 14:57:08 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web10.10327.1682002627550289811
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 07:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=t92KWbmA;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: sakoman@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-43013d77b32so181629137.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 07:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682002626; x=1684594626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzIFqHhCIpfI+CA0f4kAx3Zt2GNxaXSWdzW6NWqps4I=;
        b=t92KWbmAFE5eLy2t2svY8p96aK7zg9AT3+jlwNlf66twJpjqkhEd21o2SjKIc0PyQ+
         kgjyB72GbBwAzh/chDLcScjZqzZMWmIrIYwyBmbmnVpDoBazvL28yqUDv6XvUz5GL5Nx
         LakGiCi9rBANZyZp26vCIeJEPRlhb7GamvCA7WOtUXaI8kWhRyEhborUBRoH4CB835A/
         gSFa4fN9O9zSWCKvP575kpW1AHeRqItpjV2FFNylDkEgnzvRwDNgCD8uuLmYh6L3JSMV
         wRsnpgRHIkKY1i6/a0/TnJKoOtYYLk7geuAwLMvm+QEHNQ1cpHtywSdL/hNQLNmsMJJy
         k4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682002626; x=1684594626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WzIFqHhCIpfI+CA0f4kAx3Zt2GNxaXSWdzW6NWqps4I=;
        b=KVZhyBaf3cWAQ6shOiP21faqyppU7mPpjTsNA8tDD7e5K9L9AhubFLdA55iFtNIbOs
         Pm45rPWykD/+zuO/+L+9Id++5gQPFwWyLodjQrG88oioLiJG+/YQjqhdAN2m9BuKg7Ra
         FD8xFniIGwSHR7jnU/lX/tceB/lyeBjbG+5XOhtStAMQ8Qq6JGhvq1j1h/yZIPoHBG4L
         CUgsG7CHtqyIRksH+Eg0vDEkZKlXZ5JkEp4vOJGi5t8b65xDGF3RJVR3A6Cy29dFUsAR
         XYkvCjM4If/+mS8VHetK0RzsrRFs/1C2yogWfyHVVWvg3SKBJG4EKWWi4Kp5cVDToeXN
         3KCA==
X-Gm-Message-State: AAQBX9frHMiRTNMwddwkrdaJMPJev4cqdO/ppk1Ne0tdcVCMzaB0P0sG
	dSRpw13dH5mNrrUGUGXQG2p4Eycv/zW1VPw7d/E=
X-Google-Smtp-Source: AKy350Zigfw+Tn324TzXqNl6/6s4X15uEg/XcgIBFySZxBlXkrj4oDle7OURth3T7OAykeEsILfYoNzdE1Yx59X9yec=
X-Received: by 2002:a67:fc47:0:b0:42e:927e:e811 with SMTP id
 p7-20020a67fc47000000b0042e927ee811mr973987vsq.20.1682002626490; Thu, 20 Apr
 2023 07:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230420093128.1209660-1-vkumbhar@mvista.com>
In-Reply-To: <20230420093128.1209660-1-vkumbhar@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 20 Apr 2023 04:56:55 -1000
Message-ID: <CAGDS+nkga5TXa3E=k1HetU8FjXJZo0NCDnEXxaBQjxXoapiYMg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] go: fix CVE-2023-24537 Infinite loop
 in parsing
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 14:57:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180253

Hi Vivek,

I'm getting fuzz errors with your patch:

WARNING: go-cross-core2-64-1.17.13-r0 do_patch: Fuzz detected:

Applying patch CVE-2023-24537.patch
patching file src/go/parser/parser_test.go
patching file src/go/scanner/scanner.go
Hunk #1 succeeded at 251 with fuzz 1.


The context lines in the patches can be updated with devtool:

    devtool modify go-cross-core2-64
    devtool finish --force-patch-refresh go-cross-core2-64 <layer_path>

Don't forget to review changes done by devtool!

WARNING: go-cross-core2-64-1.17.13-r0 do_patch: QA Issue: Patch log
indicates that patches do not apply cleanly. [patch-fuzz]

Steve

On Wed, Apr 19, 2023 at 11:31=E2=80=AFPM vkumbhar <vkumbhar@mvista.com> wro=
te:
>
> Setting a large line or column number using a //line directive can cause
> integer overflow even in small source files.
>
> Limit line and column numbers in //line directives to 2^30-1, which
> is small enough to avoid int32 overflow on all reasonbly-sized files.
>
> Fixes CVE-2023-24537
> Fixes #59273
> For #59180
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
>  .../go/go-1.18/CVE-2023-24537.patch           | 72 +++++++++++++++++++
>  2 files changed, 73 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-24537.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devto=
ols/go/go-1.17.13.inc
> index 34d58aec2f..cda9227042 100644
> --- a/meta/recipes-devtools/go/go-1.17.13.inc
> +++ b/meta/recipes-devtools/go/go-1.17.13.inc
> @@ -27,6 +27,7 @@ SRC_URI +=3D "\
>      file://add_godebug.patch \
>      file://cve-2022-41725.patch \
>      file://CVE-2022-41722.patch \
> +    file://CVE-2023-24537.patch \
>  "
>  SRC_URI[main.sha256sum] =3D "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d=
1fc0c1d784ada0cd300fd"
>
> diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2023-24537.patch b/meta=
/recipes-devtools/go/go-1.18/CVE-2023-24537.patch
> new file mode 100644
> index 0000000000..7733a605e7
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.18/CVE-2023-24537.patch
> @@ -0,0 +1,72 @@
> +From bf8c7c575c8a552d9d79deb29e80854dc88528d0 Mon Sep 17 00:00:00 2001
> +From: Damien Neil <dneil@google.com>
> +Date: Mon, 20 Mar 2023 10:43:19 -0700
> +Subject: [PATCH] [release-branch.go1.20] mime/multipart: limit parsed mi=
me
> + message sizes
> +
> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private=
/+/1802456
> +Reviewed-by: Julie Qiu <julieqiu@google.com>
> +Reviewed-by: Roland Shoemaker <bracewell@google.com>
> +Run-TryBot: Damien Neil <dneil@google.com>
> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private=
/+/1802611
> +Reviewed-by: Damien Neil <dneil@google.com>
> +Change-Id: Ifdfa192d54f722d781a4d8c5f35b5fb72d122168
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/481986
> +Reviewed-by: Matthew Dempsky <mdempsky@google.com>
> +TryBot-Result: Gopher Robot <gobot@golang.org>
> +Run-TryBot: Michael Knyszek <mknyszek@google.com>
> +Auto-Submit: Michael Knyszek <mknyszek@google.com>
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +Upstream-Status: Backport [https://github.com/golang/go/commit/126a1d02d=
a82f93ede7ce0bd8d3c51ef627f2104]
> +CVE: CVE-2023-24537
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + src/go/parser/parser_test.go | 16 ++++++++++++++++
> + src/go/scanner/scanner.go    |  7 +++++--
> + 2 files changed, 21 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/go/parser/parser_test.go b/src/go/parser/parser_test.go
> +index 1a46c87..993df63 100644
> +--- a/src/go/parser/parser_test.go
> ++++ b/src/go/parser/parser_test.go
> +@@ -746,3 +746,19 @@ func TestScopeDepthLimit(t *testing.T) {
> +               }
> +       }
> + }
> ++
> ++// TestIssue59180 tests that line number overflow doesn't cause an infi=
nite loop.
> ++func TestIssue59180(t *testing.T) {
> ++      testcases :=3D []string{
> ++              "package p\n//line :9223372036854775806\n\n//",
> ++              "package p\n//line :1:9223372036854775806\n\n//",
> ++              "package p\n//line file:9223372036854775806\n\n//",
> ++      }
> ++
> ++      for _, src :=3D range testcases {
> ++              _, err :=3D ParseFile(token.NewFileSet(), "", src, ParseC=
omments)
> ++              if err =3D=3D nil {
> ++                      t.Errorf("ParseFile(%s) succeeded unexpectedly", =
src)
> ++              }
> ++      }
> ++}
> +diff --git a/src/go/scanner/scanner.go b/src/go/scanner/scanner.go
> +index f08e28c..2276e07 100644
> +--- a/src/go/scanner/scanner.go
> ++++ b/src/go/scanner/scanner.go
> +@@ -251,13 +251,16 @@ func (s *Scanner) updateLineInfo(next, offs int, t=
ext []byte) {
> +               return
> +       }
> +
> ++      // Put a cap on the maximum size of line and column numbers.
> ++      // 30 bits allows for some additional space before wrapping an in=
t32.
> ++      const maxLineCol =3D 1<<30 - 1
> +       var line, col int
> +       i2, n2, ok2 :=3D trailingDigits(text[:i-1])
> +       if ok2 {
> +               //line filename:line:col
> +               i, i2 =3D i2, i
> +               line, col =3D n2, n
> +-              if col =3D=3D 0 {
> ++              if col =3D=3D 0 || col > maxLineCol {
> +                       s.error(offs+i2, "invalid column number: "+string=
(text[i2:]))
> +                       return
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180243): https://lists.openembedded.org/g/openembedde=
d-core/message/180243
> Mute This Topic: https://lists.openembedded.org/mt/98385268/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sa=
koman@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

