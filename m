Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0AEC6FD18
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 14:34:33 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.10544.1681828471366978412
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 07:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=eEH+3sc2;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.43, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f43.google.com with SMTP id xi5so73741137ejb.13
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 07:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681828470; x=1684420470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Armtey/53adT6GHiyL6Fi5Sw2VVhRMO1SvuNvHOFno=;
        b=eEH+3sc2fwE0XP0nzYhYlss2+zs8aKJA0VWjmANPzkinBOCappTNQJCLzZDAKni6m+
         pqC+bPSmw+fVz9BAl6z13YLNfJjqSY81AsL7tvh9AI05o5sW5r7mQAuUfKTdmCthx/20
         ZCHLUAUMWK6xGeVzRwYJJGMLZlhiunCqTzHypxU1GzJXHuAv2iDa2PzcerCKigmfeQGT
         RGB7CMOdGPZQgs7hUo0yj1w3NLYLgy1/biLAroY4YKf1WxONeOYknkLptLJ3tDCsHX1O
         BCUmpb6mK2VmK8SSeTeIp93RS84a+wpTiRpjb4MS2lw1fCr4JVjqkWwtTFkTQjRTHa8e
         UXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681828470; x=1684420470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Armtey/53adT6GHiyL6Fi5Sw2VVhRMO1SvuNvHOFno=;
        b=cLt8acx5YEnHqckqiFSbhWf/bUyx5y+vWAwF/Rhy6aQK7K4XYr8j7w2LiSDEbqgdKN
         YCr/6jizeTe5Ow1Y02zLzEgmjuG/iCpoVnks7RbXRE9VVOBL1PqU4AaebC6xZdpCYKV1
         6SqIED8rBgrqHcpkC/iwBpoqUK27kJjz2z/wSwU0gySlW7j8j2IfrzfwnA6Mhv0I03iI
         0n/9rt10J/4ShT6WNrpU73sq4jY0c7jGW1+p40oPMrqsvuPktiPIgm0uwOeTNqQsn7Kl
         5SPrh9n/mTZvyWaY6vXPy3Uy3b18kmPFKZ+LtYgjqgpX45Tpqh6SibuJOIXZnvn6u/QP
         Q4Sw==
X-Gm-Message-State: AAQBX9er4t9ZiSL066s1aNuzHvzS1LO3roTLWRff8sSt8dSJ25yB6bdK
	xiI1koRnCbPq+aOovXCRAdm/MZy5owLaXbcQlSIkIQ==
X-Google-Smtp-Source: AKy350bguKS1QjGnUXEhQAgtyyrPxuJN/85Gnrc41NsZJAtoz2dJFztX4lqo1/YDJfBMdw88mxBL9NklcIqr5d4Dt14=
X-Received: by 2002:a17:906:f57:b0:931:3a19:d835 with SMTP id
 h23-20020a1709060f5700b009313a19d835mr5604601ejj.3.1681828469610; Tue, 18 Apr
 2023 07:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230418115423.30752-1-skulkarni@mvista.com>
In-Reply-To: <20230418115423.30752-1-skulkarni@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 18 Apr 2023 04:34:18 -1000
Message-ID: <CAOSpxdY6vJ85rT9mQ6B+8z8NRiXVam+uMqmLfX2U9MeKLqb1yw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] go-runtime: Security fix for CVE-2022-41722
To: Shubham Kulkarni <skulkarni@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 14:34:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180192

There were a couple of issues with this patch.  I've fixed both so no
need to resubmit, but in the future please be sure to check the
following:

1. Patch should be based on the latest kirkstone head -- you were
using an earlier state which was missing "go: fix CVE-2022-41724,
41725" so the patch didn't apply.
2. CVE patch files should have a CVE: tag in addition to the
Upstream-status: and Signed-off-by: tags

Thanks for helping fix CVEs!

Steve

On Tue, Apr 18, 2023 at 1:54=E2=80=AFAM Shubham Kulkarni <skulkarni@mvista.=
com> wrote:
>
> From: Shubham Kulkarni <skulkarni@mvista.com>
>
> path/filepath: do not Clean("a/../c:/b") into c:\b on Windows
>
> Backport from https://github.com/golang/go/commit/bdf07c2e168baf736e4c057=
279ca12a4d674f18c
>
> Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> ---
>  meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
>  .../go/go-1.18/CVE-2022-41722.patch           | 102 ++++++++++++++++++
>  2 files changed, 103 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-41722.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devto=
ols/go/go-1.17.13.inc
> index 14d58932dc..d104e34408 100644
> --- a/meta/recipes-devtools/go/go-1.17.13.inc
> +++ b/meta/recipes-devtools/go/go-1.17.13.inc
> @@ -23,6 +23,7 @@ SRC_URI +=3D "\
>      file://CVE-2022-2879.patch \
>      file://CVE-2022-41720.patch \
>      file://CVE-2022-41723.patch \
> +    file://CVE-2022-41722.patch \
>  "
>  SRC_URI[main.sha256sum] =3D "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d=
1fc0c1d784ada0cd300fd"
>
> diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2022-41722.patch b/meta=
/recipes-devtools/go/go-1.18/CVE-2022-41722.patch
> new file mode 100644
> index 0000000000..447c3d45bd
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.18/CVE-2022-41722.patch
> @@ -0,0 +1,102 @@
> +From a826b19625caebed6dd0f3fbd9d0111f6c83737c Mon Sep 17 00:00:00 2001
> +From: Damien Neil <dneil@google.com>
> +Date: Mon, 12 Dec 2022 16:43:37 -0800
> +Subject: [PATCH] path/filepath: do not Clean("a/../c:/b") into c:\b on W=
indows
> +
> +Do not permit Clean to convert a relative path into one starting
> +with a drive reference. This change causes Clean to insert a .
> +path element at the start of a path when the original path does not
> +start with a volume name, and the first path element would contain
> +a colon.
> +
> +This may introduce a spurious but harmless . path element under
> +some circumstances. For example, Clean("a/../b:/../c") becomes `.\c`.
> +
> +This reverts CL 401595, since the change here supersedes the one
> +in that CL.
> +
> +Thanks to RyotaK (https://twitter.com/ryotkak) for reporting this issue.
> +
> +Updates #57274
> +Fixes #57276
> +Fixes CVE-2022-41722
> +
> +Change-Id: I837446285a03aa74c79d7642720e01f354c2ca17
> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private=
/+/1675249
> +Reviewed-by: Roland Shoemaker <bracewell@google.com>
> +Run-TryBot: Damien Neil <dneil@google.com>
> +Reviewed-by: Julie Qiu <julieqiu@google.com>
> +TryBot-Result: Security TryBots <security-trybots@go-security-trybots.ia=
m.gserviceaccount.com>
> +(cherry picked from commit 8ca37f4813ef2f64600c92b83f17c9f3ca6c03a5)
> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private=
/+/1728944
> +Run-TryBot: Roland Shoemaker <bracewell@google.com>
> +Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
> +Reviewed-by: Damien Neil <dneil@google.com>
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/468119
> +Reviewed-by: Than McIntosh <thanm@google.com>
> +Run-TryBot: Michael Pratt <mpratt@google.com>
> +TryBot-Result: Gopher Robot <gobot@golang.org>
> +Auto-Submit: Michael Pratt <mpratt@google.com>
> +
> +Upstream-Status: Backport from https://github.com/golang/go/commit/bdf07=
c2e168baf736e4c057279ca12a4d674f18
> +Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> +---
> + src/path/filepath/path.go | 27 ++++++++++++++-------------
> + 1 file changed, 14 insertions(+), 13 deletions(-)
> +
> +diff --git a/src/path/filepath/path.go b/src/path/filepath/path.go
> +index 8300a32..94621a0 100644
> +--- a/src/path/filepath/path.go
> ++++ b/src/path/filepath/path.go
> +@@ -15,6 +15,7 @@ import (
> +       "errors"
> +       "io/fs"
> +       "os"
> ++      "runtime"
> +       "sort"
> +       "strings"
> + )
> +@@ -117,21 +118,9 @@ func Clean(path string) string {
> +               case os.IsPathSeparator(path[r]):
> +                       // empty path element
> +                       r++
> +-              case path[r] =3D=3D '.' && r+1 =3D=3D n:
> ++              case path[r] =3D=3D '.' && (r+1 =3D=3D n || os.IsPathSepa=
rator(path[r+1])):
> +                       // . element
> +                       r++
> +-              case path[r] =3D=3D '.' && os.IsPathSeparator(path[r+1]):
> +-                      // ./ element
> +-                      r++
> +-
> +-                      for r < len(path) && os.IsPathSeparator(path[r]) =
{
> +-                              r++
> +-                      }
> +-                      if out.w =3D=3D 0 && volumeNameLen(path[r:]) > 0 =
{
> +-                              // When joining prefix "." and an absolut=
e path on Windows,
> +-                              // the prefix should not be removed.
> +-                              out.append('.')
> +-                      }
> +               case path[r] =3D=3D '.' && path[r+1] =3D=3D '.' && (r+2 =
=3D=3D n || os.IsPathSeparator(path[r+2])):
> +                       // .. element: remove to last separator
> +                       r +=3D 2
> +@@ -157,6 +146,18 @@ func Clean(path string) string {
> +                       if rooted && out.w !=3D 1 || !rooted && out.w !=
=3D 0 {
> +                               out.append(Separator)
> +                       }
> ++                      // If a ':' appears in the path element at the st=
art of a Windows path,
> ++                      // insert a .\ at the beginning to avoid converti=
ng relative paths
> ++                      // like a/../c: into c:.
> ++                      if runtime.GOOS =3D=3D "windows" && out.w =3D=3D =
0 && out.volLen =3D=3D 0 && r !=3D 0 {
> ++                              for i :=3D r; i < n && !os.IsPathSeparato=
r(path[i]); i++ {
> ++                                      if path[i] =3D=3D ':' {
> ++                                              out.append('.')
> ++                                              out.append(Separator)
> ++                                              break
> ++                                      }
> ++                              }
> ++                      }
> +                       // copy element
> +                       for ; r < n && !os.IsPathSeparator(path[r]); r++ =
{
> +                               out.append(path[r])
> +--
> +2.7.4
> --
> 2.33.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180187): https://lists.openembedded.org/g/openembedde=
d-core/message/180187
> Mute This Topic: https://lists.openembedded.org/mt/98341957/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

