Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B7EC433F5
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 16:16:52 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.414.1648657010104628162
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 09:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=m8zK3qAM;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.54,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f54.google.com with SMTP id yy13so42561762ejb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 09:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8D2WKBoxxmQLlHsGaYLhF1EjhgpdrjVWK+bWAzDmRzg=;
        b=m8zK3qAMjekBkexFXxW15xE3nSEJDMy6SMSgUIH1WHp1EBEYVCLdbXU3jCj2LrKjbQ
         MRH+gjXO1OGrzUyflHaes+8WIhSO4RTaIl0iU1jkBbBoWhA8ShB91pjYXboMx6ErZYBn
         bPSx9zCD4YtgV3tm4m8MAIUf41g84WWoEy7Byj+Cb7gZUwkxsoDna468pgjUripW1pBJ
         1/zYmTRcc0wInRNgQHMCd0OYFAqsCfaqWtuI8+TzyYl/5q1H49w30XJJo2CQNxuGOmts
         cHfQjlJc0yxEwuG8SlI9oQYJsymQGF4mNNxpwOKK00nu/+9mEi2GRL7Cw4SUL7V55g+U
         vVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8D2WKBoxxmQLlHsGaYLhF1EjhgpdrjVWK+bWAzDmRzg=;
        b=z+OLZJpF+aLmtR8EVNlQxP1kGvLsfoZCOpHzSsBMnNSH3Aki5jT79L4BTQPS1JO1yg
         MWYkzbQLl2yGegx8eWIcwQtulDaxYlFEFJZZFsbV3rkuX7rzfB+b3R7fqR4yJrflRmD7
         3+er/EZ+HVKXwzy/gc37DpDq4p+JMlOeb1kMxTM62ImaIVgEkKWpUrw4xRuNI/Jz3m9V
         bml34jQNWpARmBuVjjtY2I2/oLL0zDo2v1GeAERr4mfq/VOpMeyJuhHy+PB4DgZrcz/R
         JtP+MPQ+tlM+uT/ieEaV+qjXWDHz2IwTOyr1hZfvKb7sTZV9pppcjKqg81MSn7gn1wXN
         ZeSw==
X-Gm-Message-State: AOAM533q4SbVrgaWTKQvYtfljXIFRS47pIInML5mE0MaR89I2kI/xxbh
	pscbiclGGgwLWgw58pzjRYXlAu0AJCDuhxKYaNv5dA==
X-Google-Smtp-Source: 
 ABdhPJyjQL8zo7baFRG7lgrBAlZ2bOB3QfGCEIY6oNlqugdMSEtP9ST5kBpjlUarr3cAI4McxZP31Mo8rbrvHTm9NpQ=
X-Received: by 2002:a17:907:9506:b0:6da:b4cd:515b with SMTP id
 ew6-20020a170907950600b006dab4cd515bmr301229ejc.602.1648657008148; Wed, 30
 Mar 2022 09:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220330154946.70352-1-davide.gardenal@huawei.com>
In-Reply-To: <20220330154946.70352-1-davide.gardenal@huawei.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 30 Mar 2022 06:16:36 -1000
Message-ID: 
 <CAOSpxdZ=CLc1tsLKB-6b3nCHdJ-D=TNuw7aETuwog23skNt=qw@mail.gmail.com>
Subject: Re: [oe-core][dunfell][PATCH] go: backport patch fix for
 CVE-2021-38297
To: Davide Gardenal <davidegarde2000@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Davide Gardenal <davide.gardenal@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 16:16:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163788

Unfortunately this patch doesn't seem to apply:

Applying: go: backport patch fix for CVE-2021-38297
Using index info to reconstruct a base tree...
M meta/recipes-devtools/go/go-1.14.inc
.git/rebase-apply/patch:73: space before tab in indent.
  offset += 8;
.git/rebase-apply/patch:74: space before tab in indent.
  });
.git/rebase-apply/patch:75: trailing whitespace.

.git/rebase-apply/patch:83: space before tab in indent.
  this._inst.exports.run(argc, argv);
.git/rebase-apply/patch:84: space before tab in indent.
  if (this.exited) {
warning: squelched 13 whitespace errors
warning: 18 lines add whitespace errors.
Falling back to patching base and 3-way merge...
Auto-merging meta/recipes-devtools/go/go-1.14.inc
CONFLICT (content): Merge conflict in meta/recipes-devtools/go/go-1.14.inc
error: Failed to merge in the changes.
Patch failed at 0001 go: backport patch fix for CVE-2021-38297
hint: Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

It appears that you haven't based your patch on the current dunfell
head -- you seem to be missing a couple of go CVE patches from last
month!

Steve

On Wed, Mar 30, 2022 at 5:50 AM Davide Gardenal
<davidegarde2000@gmail.com> wrote:
>
> Patch taken from
> https://github.com/golang/go/commit/4548fcc8dfd933c237f29bba6f90040a85922564
> from the following issue
> https://github.com/golang/go/issues/48797
>
> Original repo
> https://go.googlesource.com/go/+/77f2750f4398990eed972186706f160631d7dae4
>
> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> ---
>  meta/recipes-devtools/go/go-1.14.inc          |  1 +
>  .../go/go-1.14/CVE-2021-38297.patch           | 94 +++++++++++++++++++
>  2 files changed, 95 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
> index abc6f42184..947f1798ee 100644
> --- a/meta/recipes-devtools/go/go-1.14.inc
> +++ b/meta/recipes-devtools/go/go-1.14.inc
> @@ -19,6 +19,7 @@ SRC_URI += "\
>      file://CVE-2021-34558.patch \
>      file://CVE-2021-33196.patch \
>      file://CVE-2021-33197.patch \
> +    file://CVE-2021-38297.patch \
>  "
>  SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
>  SRC_URI[main.sha256sum] = "7ed13b2209e54a451835997f78035530b331c5b6943cdcd68a3d815fdc009149"
> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch b/meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch
> new file mode 100644
> index 0000000000..0b5d0b591e
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch
> @@ -0,0 +1,94 @@
> +From 4548fcc8dfd933c237f29bba6f90040a85922564 Mon Sep 17 00:00:00 2001
> +From: Michael Knyszek <mknyszek@google.com>
> +Date: Thu, 2 Sep 2021 16:51:59 -0400
> +Subject: [PATCH] [release-branch.go1.16] misc/wasm, cmd/link: do not let
> + command line args overwrite global data
> +
> +On Wasm, wasm_exec.js puts command line arguments at the beginning
> +of the linear memory (following the "zero page"). Currently there
> +is no limit for this, and a very long command line can overwrite
> +the program's data section. Prevent this by limiting the command
> +line to 4096 bytes, and in the linker ensuring the data section
> +starts at a high enough address (8192).
> +
> +(Arguably our address assignment on Wasm is a bit confusing. This
> +is the minimum fix I can come up with.)
> +
> +Thanks to Ben Lubar for reporting this issue.
> +
> +Change by Cherry Mui <cherryyz@google.com>.
> +
> +For #48797
> +Fixes #48799
> +Fixes CVE-2021-38297
> +
> +Change-Id: I0f50fbb2a5b6d0d047e3c134a88988d9133e4ab3
> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1205933
> +Reviewed-by: Roland Shoemaker <bracewell@google.com>
> +Reviewed-by: Than McIntosh <thanm@google.com>
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/354591
> +Trust: Michael Knyszek <mknyszek@google.com>
> +Reviewed-by: Heschi Kreinick <heschi@google.com>
> +
> +CVE: CVE-2021-38297
> +
> +Upstream-Status: Backport:
> +https://github.com/golang/go/commit/4548fcc8dfd933c237f29bba6f90040a85922564
> +
> +Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> +---
> + misc/wasm/wasm_exec.js           |  7 +++++++
> + src/cmd/link/internal/ld/data.go | 11 ++++++++++-
> + 2 files changed, 17 insertions(+), 1 deletion(-)
> +
> +diff --git a/misc/wasm/wasm_exec.js b/misc/wasm/wasm_exec.js
> +index 82041e6bb901..a0a264278b1b 100644
> +--- a/misc/wasm/wasm_exec.js
> ++++ b/misc/wasm/wasm_exec.js
> +@@ -564,6 +564,13 @@
> +                               offset += 8;
> +                       });
> +
> ++                      // The linker guarantees global data starts from at least wasmMinDataAddr.
> ++                      // Keep in sync with cmd/link/internal/ld/data.go:wasmMinDataAddr.
> ++                      const wasmMinDataAddr = 4096 + 4096;
> ++                      if (offset >= wasmMinDataAddr) {
> ++                              throw new Error("command line too long");
> ++                      }
> ++
> +                       this._inst.exports.run(argc, argv);
> +                       if (this.exited) {
> +                               this._resolveExitPromise();
> +diff --git a/src/cmd/link/internal/ld/data.go b/src/cmd/link/internal/ld/data.go
> +index 52035e96301c..54a1d188cdb9 100644
> +--- a/src/cmd/link/internal/ld/data.go
> ++++ b/src/cmd/link/internal/ld/data.go
> +@@ -2330,6 +2330,11 @@ func assignAddress(ctxt *Link, sect *sym.Section, n int, s loader.Sym, va uint64
> +       return sect, n, va
> + }
> +
> ++// On Wasm, we reserve 4096 bytes for zero page, then 4096 bytes for wasm_exec.js
> ++// to store command line args. Data sections starts from at least address 8192.
> ++// Keep in sync with wasm_exec.js.
> ++const wasmMinDataAddr = 4096 + 4096
> ++
> + // address assigns virtual addresses to all segments and sections and
> + // returns all segments in file order.
> + func (ctxt *Link) address() []*sym.Segment {
> +@@ -2339,10 +2344,14 @@ func (ctxt *Link) address() []*sym.Segment {
> +       order = append(order, &Segtext)
> +       Segtext.Rwx = 05
> +       Segtext.Vaddr = va
> +-      for _, s := range Segtext.Sections {
> ++      for i, s := range Segtext.Sections {
> +               va = uint64(Rnd(int64(va), int64(s.Align)))
> +               s.Vaddr = va
> +               va += s.Length
> ++
> ++              if ctxt.IsWasm() && i == 0 && va < wasmMinDataAddr {
> ++                      va = wasmMinDataAddr
> ++              }
> +       }
> +
> +       Segtext.Length = va - uint64(*FlagTextAddr)
> +
> \ No newline at end of file
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163787): https://lists.openembedded.org/g/openembedded-core/message/163787
> Mute This Topic: https://lists.openembedded.org/mt/90134464/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

