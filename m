Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7A1C77B7A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 15:27:03 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.46.1684942021024536572
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 08:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=hvYnbWOF;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.46, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-510bcd2d6b8so4497614a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 08:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684942019; x=1687534019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSBkW0SSqVy+JzMgbNXnArGmwWu5FtxWM+Sg8Wiy1ic=;
        b=hvYnbWOFd9yrRvknLeBfs7nD+QmWofls5v0nX2WtophRiurysctwHjZmTC/1+1wlp6
         NJeLpay+9v0KvgBTgtOOJyxpqLGCIfZHBSnmYqETehG8zQBkvdGWkiYdsjWSXBtxP5pW
         XjYJsDtleW2Qdd936jr9qVezTeEoyb+j9/1dKzB/2f1uhMh0ztP2ZPw5sz8+gJQ6Ypty
         eYHLsdji2tq2xuDMbyWZ3uvGvgklhc+J3ngo2+jpw7abCJo/wgCvLEWRKwh7+7EyiJ5L
         W1EtUYUHtN4CT8s3BewTR0xUHndpyv2xLDNSkwcUG3osPIWB7EnkANBJ/joP2VihOVV3
         aCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684942019; x=1687534019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XSBkW0SSqVy+JzMgbNXnArGmwWu5FtxWM+Sg8Wiy1ic=;
        b=TUJXy+qTfAOTnP7GdiOwx/mVPjl/RVfyuNUb8wFOpJxW1EqY33X8Dmu0Iu2nIQCFwS
         Yc1bVlWIm4/d5hhR2q6BVAU5UH7oDPZiXNulhpttcuMwougbLmnPLIIyIERufe68MzsH
         IWVvuQfHaFcfKpTeb71s355+IfrhmyZe7cqN3e/JpEEGnRqOtTNqUh1jkpk2z0/xV1Mf
         NSXQj69f6zz77gtTP+Kdv/lgot/44XTxnK8h4wxNOvXDI25FFBuxc0c36cJcI2bI37pc
         mHW7E8zVb9Wr/zjc58xzAFATa50E482S/ONZnzqAqGQ8LSAimKMlJ2EdLQvyt/VDLaaI
         cL1w==
X-Gm-Message-State: AC+VfDyISj/YPpIGaQal3T6YC0cb344sL2XZidQisX7MC95x/De7wxBq
	5P+fBut8DxGnSSgAeikcLyxaq1fLUuhivwDCISUWpQ==
X-Google-Smtp-Source: ACHHUZ5i5rmw8e+W/IYWfw8rJb8DroX74dOonzAjyTYN1h58sA7ud+lfMfuAOjsMN2+apCO0CmE+0AbaK/gPcsJU8JE=
X-Received: by 2002:a17:907:7251:b0:96f:7060:9654 with SMTP id
 ds17-20020a170907725100b0096f70609654mr16541290ejc.18.1684942019052; Wed, 24
 May 2023 08:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230524052853.1666676-1-sakib.sajal@windriver.com> <SJ0PR11MB67172DFAB24257125B2E4B50DC419@SJ0PR11MB6717.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB67172DFAB24257125B2E4B50DC419@SJ0PR11MB6717.namprd11.prod.outlook.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 24 May 2023 05:26:48 -1000
Message-ID: <CAOSpxdbUv-1dTN1zP_icOka5t=MxoLJh4ANykHW-4mRcXDWE9Q@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] go: fix CVE-2023-24540
To: schitrod@cisco.com, 
	"sakib.sajal@windriver.com" <sakib.sajal@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 15:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181682

On Wed, May 24, 2023 at 3:59=E2=80=AFAM Sanjaykumar kantibhai Chitroda -X
(schitrod - E-INFO CHIPS INC at Cisco) via lists.openembedded.org
<schitrod=3Dcisco.com@lists.openembedded.org> wrote:
>
> Hi Sakib,
>
> Its good to have full URL link inside .patch file as below:
> CVE: CVE-2023-24540
> Upstream-Status: Backport [https://github.com/golang/go/commit/ce7bd33345=
416e6d8cac901792060591cafc2797]
>
>
> Its good have some information on CVE specifications in commit message:
>
> go: Fix CVE-2023-24540
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-24540
>
> Upstream patch:
> https://github.com/golang/go/commit/ce7bd33345416e6d8cac901792060591cafc2=
797 (go 1.19.9)

I've taken the patch and made the above referenced changes, so no need for =
a v2.

Thanks for the patch and the review!

Steve

> -----Original Message-----
> Backport from go-1.19:
> html/template: handle all JS whitespace characters
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
>  .../go/go-1.19/CVE-2023-24540.patch           | 93 +++++++++++++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-24540.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devto=
ols/go/go-1.17.13.inc
> index d7cb47ebf4..e5e9d841c4 100644
> --- a/meta/recipes-devtools/go/go-1.17.13.inc
> +++ b/meta/recipes-devtools/go/go-1.17.13.inc
> @@ -30,6 +30,7 @@ SRC_URI +=3D "\
>      file://CVE-2023-24537.patch \
>      file://CVE-2023-24534.patch \
>      file://CVE-2023-24538.patch \
> +    file://CVE-2023-24540.patch \
>  "
>  SRC_URI[main.sha256sum] =3D "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d=
1fc0c1d784ada0cd300fd"
>
> diff --git a/meta/recipes-devtools/go/go-1.19/CVE-2023-24540.patch b/meta=
/recipes-devtools/go/go-1.19/CVE-2023-24540.patch
> new file mode 100644
> index 0000000000..4ed9ba7096
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.19/CVE-2023-24540.patch
> @@ -0,0 +1,93 @@
> +From 2305cdb2aa5ac8e9960bd64e548a119c7dd87530 Mon Sep 17 00:00:00 2001
> +From: Roland Shoemaker <bracewell@google.com>
> +Date: Tue, 11 Apr 2023 16:27:43 +0100
> +Subject: [PATCH] html/template: handle all JS whitespace characters
> +
> +Rather than just a small set. Character class as defined by \s [0].
> +
> +Thanks to Juho Nurminen of Mattermost for reporting this.
> +
> +For #59721
> +Fixes  #59813
> +Fixes CVE-2023-24540
> +
> +[0]
> +https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_E
> +xpressions/Character_Classes
> +
> +Change-Id: I56d4fa1ef08125b417106ee7dbfb5b0923b901ba
> +Reviewed-on:
> +https://team-review.git.corp.google.com/c/golang/go-private/+/1821459
> +Reviewed-by: Julie Qiu <julieqiu@google.com>
> +Run-TryBot: Roland Shoemaker <bracewell@google.com>
> +Reviewed-by: Damien Neil <dneil@google.com>
> +Reviewed-on:
> +https://team-review.git.corp.google.com/c/golang/go-private/+/1851497
> +Run-TryBot: Damien Neil <dneil@google.com>
> +Reviewed-by: Roland Shoemaker <bracewell@google.com>
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/491355
> +Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
> +Reviewed-by: Carlos Amedee <carlos@golang.org>
> +TryBot-Bypass: Carlos Amedee <carlos@golang.org>
> +Run-TryBot: Carlos Amedee <carlos@golang.org>
> +
> +CVE: CVE-2023-24540
> +Upstream-Status: Backport [ce7bd33345416e6d8cac901792060591cafc2797]
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + src/html/template/js.go      |  8 +++++++-
> + src/html/template/js_test.go | 11 +++++++----
> + 2 files changed, 14 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/html/template/js.go b/src/html/template/js.go index
> +b888eaf..35994f0 100644
> +--- a/src/html/template/js.go
> ++++ b/src/html/template/js.go
> +@@ -13,6 +13,11 @@ import (
> +       "unicode/utf8"
> + )
> +
> ++// jsWhitespace contains all of the JS whitespace characters, as
> ++defined // by the \s character class.
> ++// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Re=
gular_expressions/Character_classes.
> ++const jsWhitespace =3D "\f\n\r\t\v\u0020\u00a0\u1680\u2000\u2001\u2002\=
u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u2028\u2029\u202f\u205f\u30=
00\ufeff"
> ++
> + // nextJSCtx returns the context that determines whether a slash after
> +the  // given run of tokens starts a regular expression instead of a
> +division  // operator: / or /=3D.
> +@@ -26,7 +31,8 @@ import (
> + // JavaScript 2.0 lexical grammar and requires one token of lookbehind:
> + //
> +https://www.mozilla.org/js/language/js20-2000-07/rationale/syntax.html
> + func nextJSCtx(s []byte, preceding jsCtx) jsCtx {
> +-      s =3D bytes.TrimRight(s, "\t\n\f\r \u2028\u2029")
> ++      // Trim all JS whitespace characters
> ++      s =3D bytes.TrimRight(s, jsWhitespace)
> +       if len(s) =3D=3D 0 {
> +               return preceding
> +       }
> +diff --git a/src/html/template/js_test.go
> +b/src/html/template/js_test.go index d7ee47b..8f5d76d 100644
> +--- a/src/html/template/js_test.go
> ++++ b/src/html/template/js_test.go
> +@@ -81,14 +81,17 @@ func TestNextJsCtx(t *testing.T) {
> +               {jsCtxDivOp, "0"},
> +               // Dots that are part of a number are div preceders.
> +               {jsCtxDivOp, "0."},
> ++              // Some JS interpreters treat NBSP as a normal space, so
> ++              // we must too in order to properly escape things.
> ++              {jsCtxRegexp, "=3D\u00A0"},
> +       }
> +
> +       for _, test :=3D range tests {
> +-              if nextJSCtx([]byte(test.s), jsCtxRegexp) !=3D test.jsCtx=
 {
> +-                      t.Errorf("want %s got %q", test.jsCtx, test.s)
> ++              if ctx :=3D nextJSCtx([]byte(test.s), jsCtxRegexp); ctx !=
=3D test.jsCtx {
> ++                      t.Errorf("%q: want %s got %s", test.s, test.jsCtx=
, ctx)
> +               }
> +-              if nextJSCtx([]byte(test.s), jsCtxDivOp) !=3D test.jsCtx =
{
> +-                      t.Errorf("want %s got %q", test.jsCtx, test.s)
> ++              if ctx :=3D nextJSCtx([]byte(test.s), jsCtxDivOp); ctx !=
=3D test.jsCtx {
> ++                      t.Errorf("%q: want %s got %s", test.s, test.jsCtx=
, ctx)
> +               }
> +       }
> +
> +--
> +2.40.0
> +
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181673): https://lists.openembedded.org/g/openembedde=
d-core/message/181673
> Mute This Topic: https://lists.openembedded.org/mt/99103273/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

