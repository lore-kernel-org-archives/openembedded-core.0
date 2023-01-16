Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1A7C54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 21:06:50 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.180006.1673903207192584831
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 13:06:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FXClxeBL;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-15eec491b40so9113329fac.12
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 13:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kgmy/Kr2Q9XMiv+Z4pu8ZsolWDFrtKwUApI/1kTpP9U=;
        b=FXClxeBL5ZnzhPX2VySjqlJjWpC65rWt5SD9OkywxXyxO4NexnpRLpOkLbQoIkHX2V
         UGuA7UHsJs4cp/ROBMk1Pc4Wdc0f+DI7Hu2K/Os3/6OvCdjxu4QemM8SZlcE+Ojj861P
         Zqq2ZLTDtBQppXqeqH7rdcL84V7wX4V7d3G6MRKftVBkdbMZugTzdMoUWUm8EFZqp3Yr
         BPmyf5Yp83VWqF5fRcxZMdWT2bE+OMnlmtYVj0NYB7l7PtOQdHgneP+QRGflaVr0ptF0
         h2qN7JX8CmT+j0Owsw1XIvrzKyhXSXrnlh0Ab6PzI90OD6qdaGpcw4uyzKRgrpNFIesw
         eGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kgmy/Kr2Q9XMiv+Z4pu8ZsolWDFrtKwUApI/1kTpP9U=;
        b=GjPEppPeKbaD7Qq3JFkKOgRv+t1+CCT8Gl9yaRayRvQ0fS/8+PoXOEXaRa6CsdiGmJ
         g6FIGx6Rtv6voyfNUP92UL0+gcvlLqSJ6UMLTen2lQJzK8JFmaxbJlCrQn3JIzp9VrSG
         UhlIcJwEMy2f3B03UlLL4Ckh9W93NFbKD6ufuA8mqNP9SXQxzeJqBhJk/9mP9F43gbGs
         PYqK+EHXWeXGLZrGVxLkXDXuxWkOcY/oAu4wb94VTG6XdbbHII8Z1h07Tj8eElc5fbPR
         FHPTUN8ClkA5JC7go/kaL3/JR9HoE8za8YdB6zalCGqBTEyeRnilivsTxSyIniZ2AYaY
         uTeA==
X-Gm-Message-State: AFqh2koEfYSv5T/OVK2Yr16tzDvSC24nLTpzo9/xof8G9TERHb2YzJPn
	+UToLnD+4aqxTgpoxRr+zSZ9KNGFnvEfxNJ4q5Mhkw03em0=
X-Google-Smtp-Source: AMrXdXtZtNcfcXVeF4Kr3Sdobn/VqcDGqKXiDI3fQ/IutwwQWwxJfePhlPscXRqL13WMQHtn9F89m1zG2Ewcd+GVtdA=
X-Received: by 2002:a05:6870:514a:b0:15e:d5b1:33df with SMTP id
 z10-20020a056870514a00b0015ed5b133dfmr78589oak.55.1673903206128; Mon, 16 Jan
 2023 13:06:46 -0800 (PST)
MIME-Version: 1.0
References: <20230115185153.2277534-1-raj.khem@gmail.com> <20230115185153.2277534-2-raj.khem@gmail.com>
In-Reply-To: <20230115185153.2277534-2-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Jan 2023 13:06:20 -0800
Message-ID: <CAMKF1sqAcsA-hcm_BZTaAZ12z6DvDiHMUcWmL6UvB94x8ZuqbQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] glib-2.0: Switch to using C11 std
To: openembedded-core@lists.openembedded.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 21:06:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176014

upstream glib-2,0 has not accepted these patches so lets hold on to
them for now.

On Sun, Jan 15, 2023 at 10:51 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...0001-Switch-from-C99-to-C11-standard.patch | 40 +++++++++++++++++
>  ...efine-check_alignof-for-std-c11-and-.patch | 44 +++++++++++++++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb |  2 +
>  3 files changed, 86 insertions(+)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-C99-to-C11-standard.patch
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-tests-macros.c-Define-check_alignof-for-std-c11-and-.patch
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-C99-to-C11-standard.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-C99-to-C11-standard.patch
> new file mode 100644
> index 0000000000..4ddf49a9df
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-C99-to-C11-standard.patch
> @@ -0,0 +1,40 @@
> +From 59f4bdaedccb14802810e2f28646cc039a92f3d3 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 14 Jan 2023 12:15:29 -0800
> +Subject: [PATCH] Switch from C99 to C11 standard
> +
> +We need to start using _Alignof consistently as the fallback
> +implementation which uses types within offsetof is UB as per WG14 N2350
> +[1], moreover newer compilers like clang 16+ have started to error on
> +such use.
> +
> +Fixes errors like below with clang 16+
> +
> +| ../glib-2.74.4/glib/ghash.c:299:18: error: 'struct (unnamed at ../glib-2.74.4/glib/ghash.c:299:1)' cannot be defined in '__builtin_offsetof'
> +| G_STATIC_ASSERT (G_ALIGNOF (GHashTableIter) >= G_ALIGNOF (RealIter));
> +
> +[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
> +[2] https://reviews.llvm.org/D133574
> +
> +Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3202]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 8d3500ad7..87662fa47 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -5,7 +5,7 @@ project('glib', 'c',
> +   default_options : [
> +     'buildtype=debugoptimized',
> +     'warning_level=3',
> +-    'c_std=gnu99'
> ++    'c_std=gnu11'
> +   ]
> + )
> +
> +--
> +2.39.0
> +
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-tests-macros.c-Define-check_alignof-for-std-c11-and-.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-tests-macros.c-Define-check_alignof-for-std-c11-and-.patch
> new file mode 100644
> index 0000000000..c6f2ee1948
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-tests-macros.c-Define-check_alignof-for-std-c11-and-.patch
> @@ -0,0 +1,44 @@
> +From 3a86bfadd67983267e5d89b1a7e3a637041e599b Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 14 Jan 2023 10:54:28 -0800
> +Subject: [PATCH] tests/macros.c: Define check_alignof for std=c11 and newer
> +
> +WG14 N2350 made very clear that it is an UB having type definitions
> +within "offsetof" [1]. This patch changes the implementation of macro
> +check_alignof to builtin "_Alignof" to avoid undefined behavior.
> +
> +clang 16+ has started to diagnose this [2]
> +
> +Fixes build when using -std >= gnu11 and using clang16+
> +
> +[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
> +[2] https://reviews.llvm.org/D133574
> +
> +Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3201]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + glib/tests/macros.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/glib/tests/macros.c b/glib/tests/macros.c
> +index efe632b..17b1646 100644
> +--- a/glib/tests/macros.c
> ++++ b/glib/tests/macros.c
> +@@ -42,9 +42,13 @@ test_assert_static (void)
> + static void
> + test_alignof_fallback (void)
> + {
> ++#if defined(__STDC_VERSION__) && __STDC_VERSION__ >= 201112L && !defined(__cplusplus)
> ++#define check_alignof(type) \
> ++  g_assert_cmpint (G_ALIGNOF (type), ==, _Alignof (type))
> ++#else
> + #define check_alignof(type) \
> +   g_assert_cmpint (G_ALIGNOF (type), ==, G_STRUCT_OFFSET (struct { char a; type b; }, b))
> +-
> ++#endif
> +   check_alignof (char);
> +   check_alignof (int);
> +   check_alignof (float);
> +--
> +2.39.0
> +
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb
> index e5279e946c..de3f55e865 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb
> @@ -19,6 +19,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>             file://cpp-null.patch \
>             file://cpp-null2.patch \
>             file://fix-errno.patch \
> +           file://0001-tests-macros.c-Define-check_alignof-for-std-c11-and-.patch \
> +           file://0001-Switch-from-C99-to-C11-standard.patch \
>             "
>  SRC_URI:append:class-native = " file://relocate-modules.patch"
>
> --
> 2.39.0
>

