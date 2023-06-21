Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A03BEB64DD
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 15:30:33 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.1577.1687361429290861762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 08:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=PRo151l3;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.51, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5193c97ecbbso6359637a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 08:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687361428; x=1689953428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjtcua/sT2BcILfw3FzUWWs1v+vqa/5UpILfMTQlhlo=;
        b=PRo151l3i/+nzyif9nUyUfDnsY77NPqTmG6Z+Trhp49v12PoGYjET+2+MdDZFwgvbf
         kyf/uVvpxX3d6IqB0cPQB4Sqv2NF+70A9HNRSXReHHbcWJPXn7amQxa9PfBp+7kjkz6Z
         dL4BS0O39LE9Q9uSFojDke2qQ9E2j5+s3qBDVN89mIpaSL6RbNr3AJkJteIhnNZ2eKZP
         u9Rtv4F5IYC25tpIYMm3aPQtmHZiJ880cgTS7mrXk6GAl+g8JliZExrp1aE0kvml6IlC
         SJdihMPx7ihITq36C/dL8ZCq0/GEM50EWNugQCSWk09ungncmzNICHshhiy/S3Nda8WK
         Dabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687361428; x=1689953428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjtcua/sT2BcILfw3FzUWWs1v+vqa/5UpILfMTQlhlo=;
        b=Rs8YVp6e2SjU0qj2OgKvx2gNb6x6ZUaDmJUcFh4WeqQ2gaBBPKjxyLYXhadPDAGunK
         m2iHnjjQ0TJjDEZqHba8en53f1jr0eJupUEr9bk88BysdKFZxMZQLV7L7+snfTpjFal6
         0ko+ziHqy7YEpAdTXaC4r5DK55yuRRd+iFQ/M/eK2wJ49mm2eFE/ezKaP9nI6FOCuPtb
         YjIIG3wPdxKiPP+5eRfrP/riLi/5b4o7KeOtxs/2iEgq36tEYVspSd3g9xIOVwkKpSeM
         If58u53hhe4/iA5gD5XJWYpVw5fRpKV3e2r7uwMqckHVgzViEvEwQ/XoCt0ouf2sD3uk
         /ozg==
X-Gm-Message-State: AC+VfDw7IQnUQki/Mn0RuvMJDZqXfrzQ+7a/zvzOdX22CYqBprPivQRp
	OtNpsXVml+oG19qfk23yZEhj+nC2zOxAzxNdjl3V1w==
X-Google-Smtp-Source: ACHHUZ6tsfDLylAhApRUANEgAj8s51SeWThQkAqFWn//k02+NgdDAjujwboaeqV50AToQWfk4IC3eV8S3RVdokD2x1Y=
X-Received: by 2002:aa7:ca4a:0:b0:51a:5b39:5cfc with SMTP id
 j10-20020aa7ca4a000000b0051a5b395cfcmr5794194edt.18.1687361427331; Wed, 21
 Jun 2023 08:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230621104829.1370292-1-archana.polampalli@windriver.com> <20230621104829.1370292-2-archana.polampalli@windriver.com>
In-Reply-To: <20230621104829.1370292-2-archana.polampalli@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 21 Jun 2023 05:30:15 -1000
Message-ID: <CAOSpxdYOW5y8p4Eu3NCyFyYLSPN_8LEFwae5cF2myst3s8dTJQ@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] go: fix CVE-2023-29405
To: archana.polampalli@windriver.com
Cc: openembedded-core@lists.openembedded.org, Hari.GPillai@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183185

Hi Archana,

In the future could you please send patch sets like this as a patch
series rather than individual patches?  That way it will be obvious to
me what order the patches should be applied.

Thanks for helping out with CVE fixes!

Steve

On Wed, Jun 21, 2023 at 12:49=E2=80=AFAM Polampalli, Archana via
lists.openembedded.org
<archana.polampalli=3Dwindriver.com@lists.openembedded.org> wrote:
>
> The go command may execute arbitrary code at build time when using cgo.
> This may occur when running "go get" on a malicious module, or when runni=
ng
> any other command which builds untrusted code. This is can by triggered b=
y
> linker flags, specified via a "#cgo LDFLAGS" directive. Flags containing
> embedded spaces are mishandled, allowing disallowed flags to be smuggled
> through the LDFLAGS sanitization by including them in the argument of
> another flag. This only affects usage of the gccgo compiler.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-29405
>
> Upstream patches:
> https://github.com/golang/go/commit/6d8af00a630aa51134e54f0f321658621c641=
0f0
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
>  .../go/go-1.19/CVE-2023-29405.patch           | 109 ++++++++++++++++++
>  2 files changed, 110 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-29405.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devto=
ols/go/go-1.17.13.inc
> index 2c1febfe9c..9af9eb2752 100644
> --- a/meta/recipes-devtools/go/go-1.17.13.inc
> +++ b/meta/recipes-devtools/go/go-1.17.13.inc
> @@ -33,6 +33,7 @@ SRC_URI +=3D "\
>      file://CVE-2023-24540.patch \
>      file://CVE-2023-24539.patch \
>      file://CVE-2023-29404.patch \
> +    file://CVE-2023-29405.patch \
>  "
>  SRC_URI[main.sha256sum] =3D "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d=
1fc0c1d784ada0cd300fd"
>
> diff --git a/meta/recipes-devtools/go/go-1.19/CVE-2023-29405.patch b/meta=
/recipes-devtools/go/go-1.19/CVE-2023-29405.patch
> new file mode 100644
> index 0000000000..d806e1e67d
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.19/CVE-2023-29405.patch
> @@ -0,0 +1,109 @@
> +From 6d8af00a630aa51134e54f0f321658621c6410f0 Mon Sep 17 00:00:00 2001
> +From: Ian Lance Taylor <iant@golang.org>
> +Date: Thu, 4 May 2023 14:06:39 -0700
> +Subject: [PATCH] cmd/go,cmd/cgo: in _cgo_flags use one line per flag
> +
> +The flags that we recorded in _cgo_flags did not use any quoting,
> +so a flag containing embedded spaces was mishandled.
> +Change the _cgo_flags format to put each flag on a separate line.
> +That is a simple format that does not require any quoting.
> +
> +As far as I can tell only cmd/go uses _cgo_flags, and it is only
> +used for gccgo. If this patch doesn't cause any trouble, then
> +in the next release we can change to only using _cgo_flags for gccgo.
> +
> +Thanks to Juho Nurminen of Mattermost for reporting this issue.
> +
> +Fixes #60306
> +Fixes CVE-2023-29405
> +
> +Change-Id: I81fb5337db8a22e1f4daca22ceff4b79b96d0b4f
> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private=
/+/1875094
> +Reviewed-by: Damien Neil <dneil@google.com>
> +Reviewed-by: Roland Shoemaker <bracewell@google.com>
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/501224
> +Reviewed-by: Ian Lance Taylor <iant@google.com>
> +Run-TryBot: David Chase <drchase@google.com>
> +Reviewed-by: Michael Knyszek <mknyszek@google.com>
> +Reviewed-by: Roland Shoemaker <roland@golang.org>
> +TryBot-Result: Gopher Robot <gobot@golang.org>
> +
> +Upstream-Status: Backport [https://github.com/golang/go/commit/6d8af00a6=
30aa51134e54f0f321658621c6410f0]
> +CVE: CVE-2023-29405
> +
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +---
> + src/cmd/cgo/out.go                            |  4 +++-
> + src/cmd/go/internal/work/gccgo.go             | 14 ++++++-------
> + .../go/testdata/script/gccgo_link_ldflags.txt | 20 +++++++++++++++++++
> + 3 files changed, 29 insertions(+), 9 deletions(-)
> + create mode 100644 src/cmd/go/testdata/script/gccgo_link_ldflags.txt
> +
> +diff --git a/src/cmd/cgo/out.go b/src/cmd/cgo/out.go
> +index 94152f4..62e6528 100644
> +--- a/src/cmd/cgo/out.go
> ++++ b/src/cmd/cgo/out.go
> +@@ -47,7 +47,9 @@ func (p *Package) writeDefs() {
> +
> +       fflg :=3D creat(*objDir + "_cgo_flags")
> +       for k, v :=3D range p.CgoFlags {
> +-              fmt.Fprintf(fflg, "_CGO_%s=3D%s\n", k, strings.Join(v, " =
"))
> ++              for _, arg :=3D range v {
> ++                      fmt.Fprintf(fflg, "_CGO_%s=3D%s\n", k, arg)
> ++              }
> +               if k =3D=3D "LDFLAGS" && !*gccgo {
> +                       for _, arg :=3D range v {
> +                               fmt.Fprintf(fgo2, "//go:cgo_ldflag %q\n",=
 arg)
> +diff --git a/src/cmd/go/internal/work/gccgo.go b/src/cmd/go/internal/wor=
k/gccgo.go
> +index 1499536..bb4be2f 100644
> +--- a/src/cmd/go/internal/work/gccgo.go
> ++++ b/src/cmd/go/internal/work/gccgo.go
> +@@ -283,14 +283,12 @@ func (tools gccgoToolchain) link(b *Builder, root =
*Action, out, importcfg string
> +               const ldflagsPrefix =3D "_CGO_LDFLAGS=3D"
> +               for _, line :=3D range strings.Split(string(flags), "\n")=
 {
> +                       if strings.HasPrefix(line, ldflagsPrefix) {
> +-                              newFlags :=3D strings.Fields(line[len(ldf=
lagsPrefix):])
> +-                              for _, flag :=3D range newFlags {
> +-                                      // Every _cgo_flags file has -g a=
nd -O2 in _CGO_LDFLAGS
> +-                                      // but they don't mean anything t=
o the linker so filter
> +-                                      // them out.
> +-                                      if flag !=3D "-g" && !strings.Has=
Prefix(flag, "-O") {
> +-                                              cgoldflags =3D append(cgo=
ldflags, flag)
> +-                                      }
> ++                              flag :=3D line[len(ldflagsPrefix):]
> ++                              // Every _cgo_flags file has -g and -O2 i=
n _CGO_LDFLAGS
> ++                              // but they don't mean anything to the li=
nker so filter
> ++                              // them out.
> ++                              if flag !=3D "-g" && !strings.HasPrefix(f=
lag, "-O") {
> ++                                      cgoldflags =3D append(cgoldflags,=
 flag)
> +                               }
> +                       }
> +               }
> +diff --git a/src/cmd/go/testdata/script/gccgo_link_ldflags.txt b/src/cmd=
/go/testdata/script/gccgo_link_ldflags.txt
> +new file mode 100644
> +index 0000000..4e91ae5
> +--- /dev/null
> ++++ b/src/cmd/go/testdata/script/gccgo_link_ldflags.txt
> +@@ -0,0 +1,20 @@
> ++# Test that #cgo LDFLAGS are properly quoted.
> ++# The #cgo LDFLAGS below should pass a string with spaces to -L,
> ++# as though searching a directory with a space in its name.
> ++# It should not pass --nosuchoption to the external linker.
> ++
> ++[!cgo] skip
> ++
> ++go build
> ++
> ++[!exec:gccgo] skip
> ++
> ++go build -compiler gccgo
> ++
> ++-- go.mod --
> ++module m
> ++-- cgo.go --
> ++package main
> ++// #cgo LDFLAGS: -L "./ -Wl,--nosuchoption"
> ++import "C"
> ++func main() {}
> +--
> +2.40.0
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183180): https://lists.openembedded.org/g/openembedde=
d-core/message/183180
> Mute This Topic: https://lists.openembedded.org/mt/99673732/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

