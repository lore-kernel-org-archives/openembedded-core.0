Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 206ACC77B73
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 16:36:51 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.43165.1681922210313247330
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Apr 2023 09:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=WT7ZJeZb;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.46, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-94a342f7c4cso768503366b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 09:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681922208; x=1684514208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoA8V2r2Q2I9psq+2l4bQkoJZIg8i2hvNvjhaO6Rv4E=;
        b=WT7ZJeZbR78NAWM3I7SzGFARtkPSjl4UNhxbFW7XCI55GGR2TfqeO9iac3X+emCedV
         FfU556NT0bEUTrXVFPLVSoIIbtVjH+lhYe6FO3rWHPkJqqSnZj94j025RCd1aNMtbRn8
         TFEqUIFmTo4VlTKIJ35wALTRcAXo+fQ+22Qzk4Z5icie677IF0TXUcMVuQEZ/IFVZXeb
         LzIJWCVADfeGEDAgg8H4NEqlufl5BTAJuJWWVz6JzO5z5m4kQ0khVS98HxQ79q12N09O
         PziTAN3+w7GAyHUfV3veEohGyzIm4SDf3XvWmMKlWIKjyxA2sZsjXyDCnJqjgLlY+0KA
         lA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681922208; x=1684514208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QoA8V2r2Q2I9psq+2l4bQkoJZIg8i2hvNvjhaO6Rv4E=;
        b=c/2BTHhJWwHQSCT1zNITXnhjWTVqgFKH0JSiLdMqjZQsd0onhHg1fnCv0d/b+79YWe
         02yGi/LyvYBmhGKVsGHkp0uFaiBL/+qJEMUi6lXZatfxmjQioQlC4Hf804H3V+tDyhBo
         On/EZAi3ktc6cWndc54i0yD02ne9eUfDC4Jm1k5Y1xVVVNh1rCCRa+it/zN++ag/RwBj
         qt02wtdf+1dDLF7XwKTVDU7v7AtyjeJAVAwGEclL2Q+V8SLJbK5vXsb60glIb1ftkzWD
         VuQKT5szTt2AgySsyLAbpGve91tuyDpiBZIyIn6tXBnMBzF3CxPRITUuwOll8y5PFmvP
         JgqQ==
X-Gm-Message-State: AAQBX9fCQYiQ29yV7Z6+I5ZbIXotkh3DKin+/4hZgFAfSvM9lJGYhxtJ
	8scBVAqfdT2Gq2r3Q6Dzoaj5jEIba8rqvXv4JeetuzIun8AxhcHl
X-Google-Smtp-Source: AKy350bcKq8tIe0I0zVJe0r+y2MaZqftCR8EhVlOuCl3tVzlxBxPXLTxmHrC1Y9G3ERMQbtHovG8D/B2KMpyF30kuNE=
X-Received: by 2002:a05:6402:158:b0:4fe:9689:96bb with SMTP id
 s24-20020a056402015800b004fe968996bbmr7096551edu.35.1681922207910; Wed, 19
 Apr 2023 09:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <1757560BEE901822.9727@lists.openembedded.org> <CAKzga+z33dA2udYtSo4WsyC4R-Ry56DFkCtO3oQvodxu=Gg9DQ@mail.gmail.com>
In-Reply-To: <CAKzga+z33dA2udYtSo4WsyC4R-Ry56DFkCtO3oQvodxu=Gg9DQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 19 Apr 2023 06:36:36 -1000
Message-ID: <CAOSpxdbQUAdcpv2DkfVKvaC9wcjFQWF30HcsNaxmnTJx6TE3WA@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] go-runtime: Security fix for CVE-2022-41722
To: Shubham Kulkarni <skulkarni@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 16:36:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180225

On Wed, Apr 19, 2023 at 2:39=E2=80=AFAM Shubham Kulkarni <skulkarni@mvista.=
com> wrote:
>
> Hello Steve,
>
> I have sent a dunfell branch patch with the subject "[OE-core][dunfell][P=
ATCH] go-runtime: Security fix for CVE-2022-41722". I am not sure why it's =
showing as a reply on kirkstone patch, not a separate email. Please conside=
r this patch to fix CVE-2022-41722 in dunfell.

I've got it!  Thank you.

Steve

> On Wed, Apr 19, 2023 at 6:03=E2=80=AFPM Shubham Kulkarni via lists.openem=
bedded.org <skulkarni=3Dmvista.com@lists.openembedded.org> wrote:
>>
>> From: Shubham Kulkarni <skulkarni@mvista.com>
>>
>> path/filepath: do not Clean("a/../c:/b") into c:\b on Windows
>>
>> Backport from https://github.com/golang/go/commit/bdf07c2e168baf736e4c05=
7279ca12a4d674f18c
>>
>> Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
>> ---
>>  meta/recipes-devtools/go/go-1.14.inc               |   2 +
>>  .../go/go-1.14/CVE-2022-41722-1.patch              |  53 +++++++++++
>>  .../go/go-1.14/CVE-2022-41722-2.patch              | 104 ++++++++++++++=
+++++++
>>  3 files changed, 159 insertions(+)
>>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41722-1.pa=
tch
>>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41722-2.pa=
tch
>>
>> diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtool=
s/go/go-1.14.inc
>> index f2a5fc3..74017f4 100644
>> --- a/meta/recipes-devtools/go/go-1.14.inc
>> +++ b/meta/recipes-devtools/go/go-1.14.inc
>> @@ -53,6 +53,8 @@ SRC_URI +=3D "\
>>      file://CVE-2022-41717.patch \
>>      file://CVE-2022-1962.patch \
>>      file://CVE-2022-41723.patch \
>> +    file://CVE-2022-41722-1.patch \
>> +    file://CVE-2022-41722-2.patch \
>>  "
>>
>>  SRC_URI_append_libc-musl =3D " file://0009-ld-replace-glibc-dynamic-lin=
ker-with-musl.patch"
>> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-41722-1.patch b/m=
eta/recipes-devtools/go/go-1.14/CVE-2022-41722-1.patch
>> new file mode 100644
>> index 0000000..f5bffd7
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-41722-1.patch
>> @@ -0,0 +1,53 @@
>> +From 94e0c36694fb044e81381d112fef3692de7cdf52 Mon Sep 17 00:00:00 2001
>> +From: Yasuhiro Matsumoto <mattn.jp@gmail.com>
>> +Date: Fri, 22 Apr 2022 10:07:51 +0900
>> +Subject: [PATCH 1/2] path/filepath: do not remove prefix "." when follo=
wing
>> + path contains ":".
>> +
>> +Fixes #52476
>> +
>> +Change-Id: I9eb72ac7dbccd6322d060291f31831dc389eb9bb
>> +Reviewed-on: https://go-review.googlesource.com/c/go/+/401595
>> +Auto-Submit: Ian Lance Taylor <iant@google.com>
>> +Reviewed-by: Alex Brainman <alex.brainman@gmail.com>
>> +Run-TryBot: Ian Lance Taylor <iant@google.com>
>> +Reviewed-by: Ian Lance Taylor <iant@google.com>
>> +Reviewed-by: Damien Neil <dneil@google.com>
>> +TryBot-Result: Gopher Robot <gobot@golang.org>
>> +
>> +Upstream-Status: Backport from https://github.com/golang/go/commit/9cd1=
818a7d019c02fa4898b3e45a323e35033290
>> +CVE: CVE-2022-41722
>> +Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
>> +---
>> + src/path/filepath/path.go | 14 +++++++++++++-
>> + 1 file changed, 13 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/src/path/filepath/path.go b/src/path/filepath/path.go
>> +index 26f1833..92dc090 100644
>> +--- a/src/path/filepath/path.go
>> ++++ b/src/path/filepath/path.go
>> +@@ -116,9 +116,21 @@ func Clean(path string) string {
>> +               case os.IsPathSeparator(path[r]):
>> +                       // empty path element
>> +                       r++
>> +-              case path[r] =3D=3D '.' && (r+1 =3D=3D n || os.IsPathSep=
arator(path[r+1])):
>> ++              case path[r] =3D=3D '.' && r+1 =3D=3D n:
>> +                       // . element
>> +                       r++
>> ++              case path[r] =3D=3D '.' && os.IsPathSeparator(path[r+1])=
:
>> ++                      // ./ element
>> ++                      r++
>> ++
>> ++                      for r < len(path) && os.IsPathSeparator(path[r])=
 {
>> ++                              r++
>> ++                      }
>> ++                      if out.w =3D=3D 0 && volumeNameLen(path[r:]) > 0=
 {
>> ++                              // When joining prefix "." and an absolu=
te path on Windows,
>> ++                              // the prefix should not be removed.
>> ++                              out.append('.')
>> ++                      }
>> +               case path[r] =3D=3D '.' && path[r+1] =3D=3D '.' && (r+2 =
=3D=3D n || os.IsPathSeparator(path[r+2])):
>> +                       // .. element: remove to last separator
>> +                       r +=3D 2
>> +--
>> +2.7.4
>> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-41722-2.patch b/m=
eta/recipes-devtools/go/go-1.14/CVE-2022-41722-2.patch
>> new file mode 100644
>> index 0000000..e1f7a55
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-41722-2.patch
>> @@ -0,0 +1,104 @@
>> +From b8803cb711ae163b8e67897deb6cf8c49702227c Mon Sep 17 00:00:00 2001
>> +From: Damien Neil <dneil@google.com>
>> +Date: Mon, 12 Dec 2022 16:43:37 -0800
>> +Subject: [PATCH 2/2] path/filepath: do not Clean("a/../c:/b") into c:\b=
 on
>> + Windows
>> +
>> +Do not permit Clean to convert a relative path into one starting
>> +with a drive reference. This change causes Clean to insert a .
>> +path element at the start of a path when the original path does not
>> +start with a volume name, and the first path element would contain
>> +a colon.
>> +
>> +This may introduce a spurious but harmless . path element under
>> +some circumstances. For example, Clean("a/../b:/../c") becomes `.\c`.
>> +
>> +This reverts CL 401595, since the change here supersedes the one
>> +in that CL.
>> +
>> +Thanks to RyotaK (https://twitter.com/ryotkak) for reporting this issue=
.
>> +
>> +Updates #57274
>> +Fixes #57276
>> +Fixes CVE-2022-41722
>> +
>> +Change-Id: I837446285a03aa74c79d7642720e01f354c2ca17
>> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-privat=
e/+/1675249
>> +Reviewed-by: Roland Shoemaker <bracewell@google.com>
>> +Run-TryBot: Damien Neil <dneil@google.com>
>> +Reviewed-by: Julie Qiu <julieqiu@google.com>
>> +TryBot-Result: Security TryBots <security-trybots@go-security-trybots.i=
am.gserviceaccount.com>
>> +(cherry picked from commit 8ca37f4813ef2f64600c92b83f17c9f3ca6c03a5)
>> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-privat=
e/+/1728944
>> +Run-TryBot: Roland Shoemaker <bracewell@google.com>
>> +Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
>> +Reviewed-by: Damien Neil <dneil@google.com>
>> +Reviewed-on: https://go-review.googlesource.com/c/go/+/468119
>> +Reviewed-by: Than McIntosh <thanm@google.com>
>> +Run-TryBot: Michael Pratt <mpratt@google.com>
>> +TryBot-Result: Gopher Robot <gobot@golang.org>
>> +Auto-Submit: Michael Pratt <mpratt@google.com>
>> +
>> +Upstream-Status: Backport from https://github.com/golang/go/commit/bdf0=
7c2e168baf736e4c057279ca12a4d674f18c
>> +CVE: CVE-2022-41722
>> +Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
>> +---
>> + src/path/filepath/path.go | 27 ++++++++++++++-------------
>> + 1 file changed, 14 insertions(+), 13 deletions(-)
>> +
>> +diff --git a/src/path/filepath/path.go b/src/path/filepath/path.go
>> +index 92dc090..f0f095e 100644
>> +--- a/src/path/filepath/path.go
>> ++++ b/src/path/filepath/path.go
>> +@@ -14,6 +14,7 @@ package filepath
>> + import (
>> +       "errors"
>> +       "os"
>> ++      "runtime"
>> +       "sort"
>> +       "strings"
>> + )
>> +@@ -116,21 +117,9 @@ func Clean(path string) string {
>> +               case os.IsPathSeparator(path[r]):
>> +                       // empty path element
>> +                       r++
>> +-              case path[r] =3D=3D '.' && r+1 =3D=3D n:
>> ++              case path[r] =3D=3D '.' && (r+1 =3D=3D n || os.IsPathSep=
arator(path[r+1])):
>> +                       // . element
>> +                       r++
>> +-              case path[r] =3D=3D '.' && os.IsPathSeparator(path[r+1])=
:
>> +-                      // ./ element
>> +-                      r++
>> +-
>> +-                      for r < len(path) && os.IsPathSeparator(path[r])=
 {
>> +-                              r++
>> +-                      }
>> +-                      if out.w =3D=3D 0 && volumeNameLen(path[r:]) > 0=
 {
>> +-                              // When joining prefix "." and an absolu=
te path on Windows,
>> +-                              // the prefix should not be removed.
>> +-                              out.append('.')
>> +-                      }
>> +               case path[r] =3D=3D '.' && path[r+1] =3D=3D '.' && (r+2 =
=3D=3D n || os.IsPathSeparator(path[r+2])):
>> +                       // .. element: remove to last separator
>> +                       r +=3D 2
>> +@@ -156,6 +145,18 @@ func Clean(path string) string {
>> +                       if rooted && out.w !=3D 1 || !rooted && out.w !=
=3D 0 {
>> +                               out.append(Separator)
>> +                       }
>> ++                      // If a ':' appears in the path element at the s=
tart of a Windows path,
>> ++                      // insert a .\ at the beginning to avoid convert=
ing relative paths
>> ++                      // like a/../c: into c:.
>> ++                      if runtime.GOOS =3D=3D "windows" && out.w =3D=3D=
 0 && out.volLen =3D=3D 0 && r !=3D 0 {
>> ++                              for i :=3D r; i < n && !os.IsPathSeparat=
or(path[i]); i++ {
>> ++                                      if path[i] =3D=3D ':' {
>> ++                                              out.append('.')
>> ++                                              out.append(Separator)
>> ++                                              break
>> ++                                      }
>> ++                              }
>> ++                      }
>> +                       // copy element
>> +                       for ; r < n && !os.IsPathSeparator(path[r]); r++=
 {
>> +                               out.append(path[r])
>> +--
>> +2.7.4
>> --
>> 2.7.4
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#180217): https://lists.openembedded.org/g/openembedd=
ed-core/message/180217
>> Mute This Topic: https://lists.openembedded.org/mt/98365307/7032091
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [s=
kulkarni@mvista.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

