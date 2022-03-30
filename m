Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3D3C433F5
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 17:34:36 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web08.892.1648661675644830153
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 10:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=8VVuV5sT;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.45,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f45.google.com with SMTP id r13so42971099ejd.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 10:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ip4Zu+GNJxF/k8GhpNRzjYry0k4tVt/gYKDYuzqPXUc=;
        b=8VVuV5sTdrT2QdXDFeUzbQMxU/BXBu6A1myxsA8HbrmOifRSGff58JDUfvbFrellGw
         t3JbUpBloln5WmR9dbihgs7ZVVjjmpMgWknAjtZhZr3fwUxHfHft1gFbnhG8hQeBjnCL
         5ZHggoSYRfFXJw+mhCx01MmOwy43S+WRLLip8KHGNDHUki9or95kcflcKWzXXkpHnO1l
         xWsM5jXFnB6Xd/BKaIw49wBC70gXlM26VgJK1Eyf79qNjhIf23E9djqv7fOkX/WCLMv9
         5S+Zy2BgmMKM7cyNrhldorSGPzoGJWtIU20AiyGx2rxUQqh1MIf0B3DamgcEBvcZAbtT
         xB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ip4Zu+GNJxF/k8GhpNRzjYry0k4tVt/gYKDYuzqPXUc=;
        b=i/tg5z78hphQ7T/hnQ7gD3kmqpu3ObjZbE+0WSIhTDZWyiXxalcHSs/Va4t60qlyVX
         z35AZrz5QR67AC+sTVMTxO26X6unmmnSSoHa1RvoKD2M7YcoUlMyzlTU9qOCabppfzSh
         hVBfUhC9XKpAQ7asdBpugd7s0zX5/D12Hdczpaemb00Ab3BqxiKC6Hnl/3JPqvfX6QFQ
         ynNmhHHwC8MPri4ljpIaayyW98JUtgDt97EJTTcaPS1FXN8tjL82+hzgad6TIz+c9qKi
         KkV5XMjB4pYtiNTWgUiLlht0f9wW3qU/Dsv+8uWRxXCt0GvtW7UsJAx2fgKHuDgjWEBF
         B1oQ==
X-Gm-Message-State: AOAM532r/A9oWxUHc/JkzFOo/aMh0b9CAnLzctoYJP6s4Zwj65Pt9enI
	ZaRRK3fNuF09PAkVYV8P6TTaFoeBB+TRuQsgnAYSCg==
X-Google-Smtp-Source: 
 ABdhPJz8eX0jg7RIqOKGtDhfuNhdM/g6kI6kiZ4haUCZS459+oZus88879PQuSaeVqg2yEvXtvQfLm+CDS72j81NDQo=
X-Received: by 2002:a17:906:4fc8:b0:6d8:5059:f998 with SMTP id
 i8-20020a1709064fc800b006d85059f998mr671280ejw.487.1648661673796; Wed, 30 Mar
 2022 10:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220330154946.70352-1-davide.gardenal@huawei.com>
 <16E134D113D47630.18217@lists.openembedded.org>
In-Reply-To: <16E134D113D47630.18217@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 30 Mar 2022 07:34:22 -1000
Message-ID: 
 <CAOSpxdaToT4W4rFcp-3TdPEs9o=6oc8skuKrfuXMvF0C7sb0mQ@mail.gmail.com>
Subject: Re: [oe-core][dunfell][PATCH] go: backport patch fix for
 CVE-2021-38297
To: steve@sakoman.com
Cc: Davide Gardenal <davidegarde2000@gmail.com>,
 openembedded-core@lists.openembedded.org,
	Davide Gardenal <davide.gardenal@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 17:34:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163791

On Wed, Mar 30, 2022 at 6:16 AM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> Unfortunately this patch doesn't seem to apply:
>
> Applying: go: backport patch fix for CVE-2021-38297
> Using index info to reconstruct a base tree...
> M meta/recipes-devtools/go/go-1.14.inc
> .git/rebase-apply/patch:73: space before tab in indent.
>   offset +=3D 8;
> .git/rebase-apply/patch:74: space before tab in indent.
>   });
> .git/rebase-apply/patch:75: trailing whitespace.
>
> .git/rebase-apply/patch:83: space before tab in indent.
>   this._inst.exports.run(argc, argv);
> .git/rebase-apply/patch:84: space before tab in indent.
>   if (this.exited) {
> warning: squelched 13 whitespace errors
> warning: 18 lines add whitespace errors.
> Falling back to patching base and 3-way merge...
> Auto-merging meta/recipes-devtools/go/go-1.14.inc
> CONFLICT (content): Merge conflict in meta/recipes-devtools/go/go-1.14.in=
c
> error: Failed to merge in the changes.
> Patch failed at 0001 go: backport patch fix for CVE-2021-38297
> hint: Use 'git am --show-current-patch' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
>
> It appears that you haven't based your patch on the current dunfell
> head -- you seem to be missing a couple of go CVE patches from last
> month!

And once I fixed the above issue the build failed:

ERROR: go-native-1.14.15-r0 do_compile: Execution of
'/home/steve/builds/poky-contrib/build/tmp/work/x86_64-linux/go-native/1.14=
.15-r0/temp/run.do_compile.2927597'
failed with exit code 2
ERROR: Logfile of failure stored in:
/home/steve/builds/poky-contrib/build/tmp/work/x86_64-linux/go-native/1.14.=
15-r0/temp/log.do_compile.2927597
Log data follows:
| DEBUG: Executing shell function do_compile
| Building Go cmd/dist using
/home/steve/builds/poky-contrib/build/tmp/work/x86_64-linux/go-native/1.14.=
15-r0/go1.4/go.
(go1.4-bootstrap-20170531 linux/amd64)
| Building Go toolchain1 using
/home/steve/builds/poky-contrib/build/tmp/work/x86_64-linux/go-native/1.14.=
15-r0/go1.4/go.
| # bootstrap/cmd/link/internal/ld
| /home/steve/builds/poky-contrib/build/tmp/work/x86_64-linux/go-native/1.1=
4.15-r0/go/src/cmd/link/internal/ld/data.go:2194[/home/steve/builds/poky-co=
ntrib/build/tmp/work/x86_64-linux/go-native/1.14.15-r0/go/pkg/bootstrap/src=
/bootstrap/cmd/link/internal/ld/data.go:2198]:
ctxt.IsWasm undefined (type *Link has no field or method IsWasm)
| go tool dist: FAILED:
/home/steve/builds/poky-contrib/build/tmp/work/x86_64-linux/go-native/1.14.=
15-r0/go1.4/go/bin/go
install -gcflags=3D-l -tags=3Dmath_big_pure_go compiler_bootstrap
bootstrap/cmd/...: exit status 2
| WARNING: /home/steve/builds/poky-contrib/build/tmp/work/x86_64-linux/go-n=
ative/1.14.15-r0/temp/run.do_compile.2927597:1
exit 2 from './make.bash --no-banner'
| ERROR: Execution of
'/home/steve/builds/poky-contrib/build/tmp/work/x86_64-linux/go-native/1.14=
.15-r0/temp/run.do_compile.2927597'
failed with exit code 2
ERROR: Task (/home/steve/builds/poky-contrib/meta/recipes-devtools/go/go-na=
tive_1.14.bb:do_compile)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 548 tasks of which 527 didn't need to
be rerun and 1 failed.

So it definitely looks like a v2 is required!


> Steve
>
> On Wed, Mar 30, 2022 at 5:50 AM Davide Gardenal
> <davidegarde2000@gmail.com> wrote:
> >
> > Patch taken from
> > https://github.com/golang/go/commit/4548fcc8dfd933c237f29bba6f90040a859=
22564
> > from the following issue
> > https://github.com/golang/go/issues/48797
> >
> > Original repo
> > https://go.googlesource.com/go/+/77f2750f4398990eed972186706f160631d7da=
e4
> >
> > Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> > ---
> >  meta/recipes-devtools/go/go-1.14.inc          |  1 +
> >  .../go/go-1.14/CVE-2021-38297.patch           | 94 +++++++++++++++++++
> >  2 files changed, 95 insertions(+)
> >  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-38297.pat=
ch
> >
> > diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtoo=
ls/go/go-1.14.inc
> > index abc6f42184..947f1798ee 100644
> > --- a/meta/recipes-devtools/go/go-1.14.inc
> > +++ b/meta/recipes-devtools/go/go-1.14.inc
> > @@ -19,6 +19,7 @@ SRC_URI +=3D "\
> >      file://CVE-2021-34558.patch \
> >      file://CVE-2021-33196.patch \
> >      file://CVE-2021-33197.patch \
> > +    file://CVE-2021-38297.patch \
> >  "
> >  SRC_URI_append_libc-musl =3D " file://0009-ld-replace-glibc-dynamic-li=
nker-with-musl.patch"
> >  SRC_URI[main.sha256sum] =3D "7ed13b2209e54a451835997f78035530b331c5b69=
43cdcd68a3d815fdc009149"
> > diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch b/me=
ta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch
> > new file mode 100644
> > index 0000000000..0b5d0b591e
> > --- /dev/null
> > +++ b/meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch
> > @@ -0,0 +1,94 @@
> > +From 4548fcc8dfd933c237f29bba6f90040a85922564 Mon Sep 17 00:00:00 2001
> > +From: Michael Knyszek <mknyszek@google.com>
> > +Date: Thu, 2 Sep 2021 16:51:59 -0400
> > +Subject: [PATCH] [release-branch.go1.16] misc/wasm, cmd/link: do not l=
et
> > + command line args overwrite global data
> > +
> > +On Wasm, wasm_exec.js puts command line arguments at the beginning
> > +of the linear memory (following the "zero page"). Currently there
> > +is no limit for this, and a very long command line can overwrite
> > +the program's data section. Prevent this by limiting the command
> > +line to 4096 bytes, and in the linker ensuring the data section
> > +starts at a high enough address (8192).
> > +
> > +(Arguably our address assignment on Wasm is a bit confusing. This
> > +is the minimum fix I can come up with.)
> > +
> > +Thanks to Ben Lubar for reporting this issue.
> > +
> > +Change by Cherry Mui <cherryyz@google.com>.
> > +
> > +For #48797
> > +Fixes #48799
> > +Fixes CVE-2021-38297
> > +
> > +Change-Id: I0f50fbb2a5b6d0d047e3c134a88988d9133e4ab3
> > +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-priva=
te/+/1205933
> > +Reviewed-by: Roland Shoemaker <bracewell@google.com>
> > +Reviewed-by: Than McIntosh <thanm@google.com>
> > +Reviewed-on: https://go-review.googlesource.com/c/go/+/354591
> > +Trust: Michael Knyszek <mknyszek@google.com>
> > +Reviewed-by: Heschi Kreinick <heschi@google.com>
> > +
> > +CVE: CVE-2021-38297
> > +
> > +Upstream-Status: Backport:
> > +https://github.com/golang/go/commit/4548fcc8dfd933c237f29bba6f90040a85=
922564
> > +
> > +Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> > +---
> > + misc/wasm/wasm_exec.js           |  7 +++++++
> > + src/cmd/link/internal/ld/data.go | 11 ++++++++++-
> > + 2 files changed, 17 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/misc/wasm/wasm_exec.js b/misc/wasm/wasm_exec.js
> > +index 82041e6bb901..a0a264278b1b 100644
> > +--- a/misc/wasm/wasm_exec.js
> > ++++ b/misc/wasm/wasm_exec.js
> > +@@ -564,6 +564,13 @@
> > +                               offset +=3D 8;
> > +                       });
> > +
> > ++                      // The linker guarantees global data starts fro=
m at least wasmMinDataAddr.
> > ++                      // Keep in sync with cmd/link/internal/ld/data.=
go:wasmMinDataAddr.
> > ++                      const wasmMinDataAddr =3D 4096 + 4096;
> > ++                      if (offset >=3D wasmMinDataAddr) {
> > ++                              throw new Error("command line too long"=
);
> > ++                      }
> > ++
> > +                       this._inst.exports.run(argc, argv);
> > +                       if (this.exited) {
> > +                               this._resolveExitPromise();
> > +diff --git a/src/cmd/link/internal/ld/data.go b/src/cmd/link/internal/=
ld/data.go
> > +index 52035e96301c..54a1d188cdb9 100644
> > +--- a/src/cmd/link/internal/ld/data.go
> > ++++ b/src/cmd/link/internal/ld/data.go
> > +@@ -2330,6 +2330,11 @@ func assignAddress(ctxt *Link, sect *sym.Sectio=
n, n int, s loader.Sym, va uint64
> > +       return sect, n, va
> > + }
> > +
> > ++// On Wasm, we reserve 4096 bytes for zero page, then 4096 bytes for =
wasm_exec.js
> > ++// to store command line args. Data sections starts from at least add=
ress 8192.
> > ++// Keep in sync with wasm_exec.js.
> > ++const wasmMinDataAddr =3D 4096 + 4096
> > ++
> > + // address assigns virtual addresses to all segments and sections and
> > + // returns all segments in file order.
> > + func (ctxt *Link) address() []*sym.Segment {
> > +@@ -2339,10 +2344,14 @@ func (ctxt *Link) address() []*sym.Segment {
> > +       order =3D append(order, &Segtext)
> > +       Segtext.Rwx =3D 05
> > +       Segtext.Vaddr =3D va
> > +-      for _, s :=3D range Segtext.Sections {
> > ++      for i, s :=3D range Segtext.Sections {
> > +               va =3D uint64(Rnd(int64(va), int64(s.Align)))
> > +               s.Vaddr =3D va
> > +               va +=3D s.Length
> > ++
> > ++              if ctxt.IsWasm() && i =3D=3D 0 && va < wasmMinDataAddr =
{
> > ++                      va =3D wasmMinDataAddr
> > ++              }
> > +       }
> > +
> > +       Segtext.Length =3D va - uint64(*FlagTextAddr)
> > +
> > \ No newline at end of file
> > --
> > 2.32.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163788): https://lists.openembedded.org/g/openembedde=
d-core/message/163788
> Mute This Topic: https://lists.openembedded.org/mt/90134464/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

