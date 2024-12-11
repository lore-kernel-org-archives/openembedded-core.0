Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18343E77180
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 17:21:05 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.312.1733937662612264159
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 09:21:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b9+OLRL0;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30229d5b22fso31112901fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 09:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733937661; x=1734542461; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/ZBd0LwHid5iQKIcKT5scxaBZ6kFxcFwaP6e2g8AY4=;
        b=b9+OLRL0Hs+NvITALeAYB9fGWQSF2K6Jqi1ubQcsvyjx4UtFJ04oxQiVtNNSCyVT3B
         C117Ue6TmuME9Tq4Xu5PW7+OhZbfhYhN9HPCRhkiffnlqURLDU8+VkfU4HtQZVlRnDmI
         2GjvyBkq9Tn+S0mTgAdlyF1r/QnlC7URI7CWwLGbNKQelZL8521hSOufh3wYrxyfZXe0
         DNyMyfNX+nBQRkHLt8qDASnjP3ZV0+PPs+tr5nNzvjlHgGHvU2TiO0a/3nUXEoCfVQXX
         ePJAK2vqQQOrdOiViPI6bbbZWXKlVgrjCeMafY8xCRRJY+fxW60NygDzKCJo+5jaC4gF
         alGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733937661; x=1734542461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/ZBd0LwHid5iQKIcKT5scxaBZ6kFxcFwaP6e2g8AY4=;
        b=SgdpZArxGtjzRAOkyQWZA85nBG/NkdZvDd0uAB4VE20dmwmoBSQal+LZoLwJqc44V7
         opnJ5QV630k0wPbRr2JJBxgYPb+BCKhoqPtJbCbtnvo6c3B4KjhA8rWF5nbD4QeL6HlH
         JPcKqktovj5pVjQnzgOwJ+tiuc6VUdw+1+oTnVobLbZF3KWXrloSEaWfbUtoLhidDE8g
         UIe6hs+Z7knhnCDmi2MGDgn4VmWvbaS/QqcRimd1xOwwVBdauJlgESWXANVHKjvhLMZe
         0SwfTIGv74e6ipMXMzrL57mxycBrE2p+w0YkVt8QY2FPmaRmHGAvA3lGJqs08d1SM+0A
         FJ4g==
X-Gm-Message-State: AOJu0YxWwXv5u2hOq8Vjhf2Vcdvz8ydXk0lkPGsoxewmej+0DQ11UWfh
	vHqSJ19GIku2kuGlWQNsIiQr4iia7zrFrxU9zqHldKuNTVKSRQcp7EGBq8bQYuIdueZE7yltzAA
	DIp4l9omVP8wRvTcTTlJWRGtYna0VJw==
X-Gm-Gg: ASbGncub5K5zu6OawE2Ij98ZcVLYzQB3XO1W6xnfcCQYWKtbylGzb/SwdUOCubizPmz
	8EkhoOtX/YS2jNMBPhSSA1fdLZqp4t8TvHylWrQ==
X-Google-Smtp-Source: AGHT+IGQYHGnAC4G+B0kNj/V35LRN1jvwkdYzKzdHeJC0MxvFWzYkb3e7Hx71fesEAltFlBCctz6j1PT58eZv0r8Wxg=
X-Received: by 2002:a05:651c:150c:b0:300:33b1:f0d4 with SMTP id
 38308e7fff4ca-30249e0f292mr1165851fa.15.1733937660242; Wed, 11 Dec 2024
 09:21:00 -0800 (PST)
MIME-Version: 1.0
References: <20241211171420.3859335-1-sunilkumar.dora@windriver.com>
In-Reply-To: <20241211171420.3859335-1-sunilkumar.dora@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 11 Dec 2024 18:20:48 +0100
Message-ID: <CA+chaQdJjkS-M5+uajiT1rca1o2CmX=0rVNCCpF_gpM3U5voYQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] Backport: Fix c++: tweak for Wrange-loop-construct
To: SunilKumar.Dora@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 17:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208597

the commit summary should start with gcc: not backport:.

And the Upstream-Status belongs to .patch it's not necessary do
duplicate that in oe-core commit message.

On Wed, Dec 11, 2024 at 6:14=E2=80=AFPM SunilKumar.Dora via
lists.openembedded.org
<SunilKumar.Dora=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Sunil Dora <sunilkumar.dora@windriver.com>
>
> This commit updates the warning to use a check for "trivially constructib=
le" instead of
> "trivially copyable." The original check was incorrect, as "trivially cop=
yable" only applies
> to types that can be copied trivially, whereas "trivially constructible" =
is the correct check
> for types that can be trivially default-constructed.
>
> This change ensures the warning is more accurate and aligns with the prop=
er type traits.
>
> LLVM accepted a similar fix:
> https://github.com/llvm/llvm-project/issues/47355
>
> PR c++/116731 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D116731]
>
> Upstream-Status: Backport [https://gcc.gnu.org/g:179dc0f0fe01012675c1b430=
591b9891ce96c26e]
>
> Signed-off-by: Marek Polacek <polacek@redhat.com>
> Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-13.3.inc        |   1 +
>  ...ix-c-tweak-for-Wrange-loop-construct.patch | 113 ++++++++++++++++++
>  2 files changed, 114 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/0028-Backport-Fix-c-twe=
ak-for-Wrange-loop-construct.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-13.3.inc b/meta/recipes-devtoo=
ls/gcc/gcc-13.3.inc
> index ffe90c7188..65477a29bc 100644
> --- a/meta/recipes-devtools/gcc/gcc-13.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-13.3.inc
> @@ -66,6 +66,7 @@ SRC_URI =3D "${BASEURI} \
>             file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch=
 \
>             file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
>             file://0027-Fix-gcc-vect-module-testcases.patch \
> +          file://0028-Backport-Fix-c-tweak-for-Wrange-loop-construct.pat=
ch \
>             file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch=
 \
>  "
>  SRC_URI[sha256sum] =3D "0845e9621c9543a13f484e94584a49ffc0129970e9914624=
235fc1d061a0c083"
> diff --git a/meta/recipes-devtools/gcc/gcc/0028-Backport-Fix-c-tweak-for-=
Wrange-loop-construct.patch b/meta/recipes-devtools/gcc/gcc/0028-Backport-F=
ix-c-tweak-for-Wrange-loop-construct.patch
> new file mode 100644
> index 0000000000..406578eebf
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0028-Backport-Fix-c-tweak-for-Wrange-=
loop-construct.patch
> @@ -0,0 +1,113 @@
> +From 096ff216265bb114b28a5b717d0139f37d03c322 Mon Sep 17 00:00:00 2001
> +From: Sunil Dora <sunilkumar.dora@windriver.com>
> +Date: Wed, 11 Dec 2024 00:53:31 -0800
> +Subject: [PATCH] Backport: Fix c++: tweak for Wrange-loop-construct
> +
> +This commit updates the warning to use a check for "trivially constructi=
ble" instead of
> +"trivially copyable." The original check was incorrect, as "trivially co=
pyable" only applies
> +to types that can be copied trivially, whereas "trivially constructible"=
 is the correct check
> +for types that can be trivially default-constructed.
> +
> +This change ensures the warning is more accurate and aligns with the pro=
per type traits.
> +
> +LLVM accepted a similar fix:
> +https://github.com/llvm/llvm-project/issues/47355
> +
> +PR c++/116731 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D116731]
> +
> +Upstream-Status: Backport [https://gcc.gnu.org/g:179dc0f0fe01012675c1b43=
0591b9891ce96c26e]
> +
> +Signed-off-by: Marek Polacek <polacek@redhat.com>
> +Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> +---
> + gcc/cp/parser.cc                              |  7 ++-
> + .../g++.dg/warn/Wrange-loop-construct3.C      | 57 +++++++++++++++++++
> + 2 files changed, 61 insertions(+), 3 deletions(-)
> + create mode 100644 gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
> +
> +diff --git a/gcc/cp/parser.cc b/gcc/cp/parser.cc
> +index 4e67da6ff..5dd94357d 100644
> +--- a/gcc/cp/parser.cc
> ++++ b/gcc/cp/parser.cc
> +@@ -13854,11 +13854,12 @@ warn_for_range_copy (tree decl, tree expr)
> +   else if (!CP_TYPE_CONST_P (type))
> +     return;
> +
> +-  /* Since small trivially copyable types are cheap to copy, we suppres=
s the
> +-     warning for them.  64B is a common size of a cache line.  */
> ++  /* Since small trivially constructible types are cheap to construct, =
we
> ++     suppress the warning for them.  64B is a common size of a cache li=
ne.  */
> ++  tree list =3D build_tree_list (NULL_TREE, TREE_TYPE (expr));
> +   if (TREE_CODE (TYPE_SIZE_UNIT (type)) !=3D INTEGER_CST
> +       || (tree_to_uhwi (TYPE_SIZE_UNIT (type)) <=3D 64
> +-        && trivially_copyable_p (type)))
> ++        && is_trivially_xible (INIT_EXPR, type, list)))
> +     return;
> +
> +   /* If we can initialize a reference directly, suggest that to avoid t=
he
> +diff --git a/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C b/gcc/te=
stsuite/g++.dg/warn/Wrange-loop-construct3.C
> +new file mode 100644
> +index 000000000..3d9d0c908
> +--- /dev/null
> ++++ b/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
> +@@ -0,0 +1,57 @@
> ++// PR c++/116731
> ++// { dg-do compile { target c++11 } }
> ++// { dg-options "-Wrange-loop-construct" }
> ++
> ++void
> ++f0 ()
> ++{
> ++  struct S {
> ++    char a[64];
> ++    S& operator=3D(const S&) { return *this; };
> ++  };
> ++
> ++  S arr[8];
> ++  for (const auto r : arr)
> ++    (void) r;
> ++}
> ++
> ++void
> ++f1 ()
> ++{
> ++  struct S {
> ++    char a[65];
> ++    S& operator=3D(const S&) { return *this; };
> ++  };
> ++
> ++  S arr[8];
> ++  for (const auto r : arr) // { dg-warning "creates a copy" }
> ++    (void) r;
> ++}
> ++
> ++void
> ++f2 ()
> ++{
> ++  struct S {
> ++    char a[64];
> ++    S& operator=3D(const S&) { return *this; };
> ++    ~S() { }
> ++  };
> ++
> ++  S arr[8];
> ++  for (const auto r : arr) // { dg-warning "creates a copy" }
> ++    (void) r;
> ++}
> ++
> ++void
> ++f3 ()
> ++{
> ++  struct S {
> ++    char a[65];
> ++    S& operator=3D(const S&) { return *this; };
> ++    ~S() { }
> ++  };
> ++
> ++  S arr[8];
> ++  for (const auto r : arr) // { dg-warning "creates a copy" }
> ++    (void) r;
> ++}
> +--
> +2.43.0
> +
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208596): https://lists.openembedded.org/g/openembedde=
d-core/message/208596
> Mute This Topic: https://lists.openembedded.org/mt/110065245/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

