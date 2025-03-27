Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36FD9C36010
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 12:07:59 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.48503.1743077278426182693
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 05:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AR5VGXuK;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: quaresma.jose@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c54a9d3fcaso94907185a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 05:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743077277; x=1743682077; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5a6MDWbdYKBe+oX7ds8Tf43dTOPybK7dUWDFej9dwiU=;
        b=AR5VGXuKJufFIdsu/bG5g/jVh6S2S3M8BMN2RNJzxNVqiG+XLDUY0p15M4w9+LV7uj
         2ELdIn/CED97qmPiWGzI0SHYWbG5EVU/o6/WVpZaSVa4MLNsFV49m75Fswj5D+OI9+z8
         9MLNBJoU8bU34CIgliXD0DCNvdzApRs07gKbjncC3yHTIRf61nPfzdkEx8VKiIrPrz84
         DbZYP/x1H0LM0hOA14rGgGuaH2m1PuzcZdJ46jKrG3/u4/pIM3E6MuhQcWHcgXJ+YLN9
         uPDK5yod31vbssZnvT/qW1wBJJgYoz75whX0Q+XdBtMPbt89NuX5AfWk4bONlOXVOJ1N
         fb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743077277; x=1743682077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5a6MDWbdYKBe+oX7ds8Tf43dTOPybK7dUWDFej9dwiU=;
        b=TRytv/6hoOOqdam+cFAPdRymytFqmj3mqO7cnneOmdR1RLgYRkTHnCAVykDWbqNGyX
         OvpyDyN6WEdArYPvrpe2YZHSYSG3dWyBvtKRK983n22aoyISOUmrWyiWJa1aUW1SmtI0
         t2V1APhIHnpUbyqcMFtPNHAXXlRnFZbAzTEAU9hUt9G0DigYms6NnS2ExuVj4tZuTjRw
         rEAyQ8RdqvLTXGcz0ZUu/iunAh9zXK64C+T/8uqJBLhcLS8s+LqySN7whB6i9qTt6uFz
         UGPSRQmO++GFwka5Tn5dJCwdLjv7MlOCg1RM6X99QjX0fekzJftenoB2ChdKl51KU3Ii
         Wbbg==
X-Forwarded-Encrypted: i=1; AJvYcCVBpeVHcdzOlAJXcdnd6m6hfQ+u9YSSV39XcK7ZGwyvfepcOfIQhhjMT1J3/ryLCAo1eoBEjw0VQ6OFvSh9jFAKCA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyCrvTajZmrV2FdFKztErmv9E5YQQgZFEmnJ3vukK4+SJB2oXg7
	pO8zor8/JmQgHnPZXwDsb+XbKhhYqZiI8cLl+pRNacxR/y4wB9Nbb2kfPC/HAE8xKem1RqU/eSO
	O5jgUUIQgeZWcB6e+OEgxm7A2f5E=
X-Gm-Gg: ASbGncsY75EfoAddZVIjdM6Vvvy0I08BGhekcKTQIz9t0NXjefkEWAudU0ZQESv/d1k
	sjt6c06EcheUHBHMDIs+dYVH8pY8Dg5KcVtiGkdUQF2eIyDUDWxHuQsIm+yr7Clu8D6SWALKCbP
	5F/Hss9NCEeNK2mPHMmxh9lR6jfgI=
X-Google-Smtp-Source: AGHT+IH36p/A2R/B1tPKOGCzz2HW7vZwgHKPFxkQhh+cjcSPnwNowrKccNEN99dzATjwZ7u2VgSOmITwzyZ0sOgdFY8=
X-Received: by 2002:a05:620a:2683:b0:7c5:cdc7:6238 with SMTP id
 af79cd13be357-7c5ed9fa1d5mr361032685a.19.1743077277187; Thu, 27 Mar 2025
 05:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250326063647.1941-1-leimaohui@fujitsu.com> <20250326063647.1941-6-leimaohui@fujitsu.com>
 <CANPvuRmESxURWti-HzcQAUpJYSOxm-2bBXzrFgoFOeF438mVrQ@mail.gmail.com> <TYCPR01MB11055AC78EB8DC1274163AA3FA0A12@TYCPR01MB11055.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11055AC78EB8DC1274163AA3FA0A12@TYCPR01MB11055.jpnprd01.prod.outlook.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 27 Mar 2025 12:07:45 +0000
X-Gm-Features: AQ5f1Jo-E8mmEjL3ejYzCFgbOQyKE_Z_5Bkbb56pJvxDF1ibHb-GpI-qots6k-w
Message-ID: <CANPvuRk290dzN4QMw0Q5AD0Z9QX-4cJfgdd6zw1gRFugwJgYuA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 6/7] gstreamer1.0-plugins-{ugly,base,good}:
 upgrade 1.24.12 -> 1.26.0
To: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ec42b2063151cda3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213728

--000000000000ec42b2063151cda3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maohui Lei (Fujitsu) <leimaohui@fujitsu.com> escreveu (quinta, 27/03/2025
=C3=A0(s) 03:18):

> >This is a major bump and is a bit strange that there are no new
> packageconfig knobs and also some other deprecation.
>
> Have you checked the meson opinions changes?
>
>
>
> Yes, I have checked the meson_options.txt changes corresponding to the 10
> recipes upgraded this time.
>
>
>
> Although some meson_options.txt have changed, but I think the meson
> options changes do not affect the upgrade this time
>
>
>
> It=E2=80=99s mainly about glibc
>
>    1. gobject-cast-checks =C3=A0 glibc-debug
>    2. glib-asserts  =C3=A0 glib_assert   * change type from feature to bo=
olean
>    3. glib-checks  =C3=A0 glib_checks  * change type from feature to bool=
ean
>
> However, there is no glib related packageconfig options in our gstreamer
> related recipes,
>
> I mean we haven't meson built these options, so their changes have no
> effect on us
>
>
>
> And I also checked all do_configure logs, no option =E2=80=9Cdeprecated=
=E2=80=9D related
> logs
>
>
>
> Please let me know if further confirmations are needed
>

I see some changes on the gst-plugins-bad:

$ git diff --stat origin/1.26 origin/1.24 $(find | grep meson_options.txt)
 meson_options.txt                                  | 49
+++++++++++++++++--------------------------------
 subprojects/gst-devtools/meson_options.txt         |  2 --
 subprojects/gst-editing-services/meson_options.txt |  4 +---
 subprojects/gst-plugins-bad/meson_options.txt      | 76
+++++++++++++++------------------------------------------------------------=
-
 subprojects/gst-plugins-base/meson_options.txt     | 24
++++++------------------
 subprojects/gst-plugins-good/meson_options.txt     | 24
++++++------------------
 subprojects/gst-plugins-ugly/meson_options.txt     | 24
++++++------------------
 subprojects/gst-python/meson_options.txt           |  4 +---
 subprojects/gst-rtsp-server/meson_options.txt      | 24
++++++------------------
 subprojects/gstreamer/meson_options.txt            | 24
++++++------------------

I also recommend doing these major updates separately using one commit for
each component.

Jose


>
>
> userland@pumpkin3:/mnt/test/build_auh/workspace/attic/sources/gstreamer1.=
0.20250326023639$
> git diff devtool-base devtool-base-1.26.0 meson_options.txt
>
> diff --git a/meson_options.txt b/meson_options.txt
>
> index 340fb58..39255cf 100644
>
> --- a/meson_options.txt
>
> +++ b/meson_options.txt
>
> @@ -33,12 +33,6 @@ option('benchmarks', type : 'feature', value : 'auto',
> yield : true)
>
> option('tools', type : 'feature', value : 'auto', yield : true)
>
> option('introspection', type : 'feature', value : 'auto', yield : true,
> description : 'Generate gobject-introspection bindings')
>
> option('nls', type : 'feature', value : 'auto', yield: true, description =
:
> 'Enable native language support (translations)')
>
> -option('gobject-cast-checks', type : 'feature', value : 'auto', yield :
> true,
>
> -       description: 'Enable run-time GObject cast checks (auto =3D enabl=
ed
> for development, disabled for stable releases)')
>
> -option('glib-asserts', type : 'feature', value : 'enabled', yield : true=
,
>
> -       description: 'Enable GLib assertion (auto =3D enabled for
> development, disabled for stable releases)')
>
> -option('glib-checks', type : 'feature', value : 'enabled', yield : true,
>
> -       description: 'Enable GLib checks such as API guards (auto =3D
> enabled for development, disabled for stable releases)')
>
> option('extra-checks', type : 'feature', value : 'enabled', yield : true,
> description : 'Enable extra runtime checks')
>
>
>
> # Common options
>
> @@ -48,3 +42,21 @@ option('package-origin', type : 'string', value :
> 'Unknown package origin', yiel
>
>         description : 'package origin URL to use in plugins')
>
> option('doc', type : 'feature', value : 'auto', yield: true,
>
>         description: 'Enable documentation.')
>
> +option('glib_debug', type : 'feature', value : 'auto', yield : true,
> description : 'Enable GLib debug infrastructure (see docs/macros.txt)')
>
> +option('glib_assert', type : 'boolean', value : true, yield : true,
> description : 'Enable GLib assertion (see docs/macros.txt)',
>
> +  deprecated: {'enabled' : 'true', 'disabled' : 'false', 'auto' :
> 'false'},
>
> +)
>
> +option('glib_checks', type : 'boolean', value : true, yield : true,
> description : 'Enable GLib checks such as API guards (see docs/macros.txt=
)',
>
> +  deprecated: {'enabled' : 'true', 'disabled' : 'false', 'auto' :
> 'false'},
>
> +)
>
> +
>
> +# Deprecated, kept for backward compat
>
> +option('gobject-cast-checks', type : 'feature', value : 'auto', yield :
> true,
>
> +       description: 'Enable run-time GObject cast checks (auto =3D enabl=
ed
> for development, disabled for stable releases)',
>
> +       deprecated: 'glib_debug')
>
> +option('glib-asserts', type : 'feature', value : 'enabled', yield : true=
,
>
> +       description: 'Enable GLib assertion (auto =3D enabled for
> development, disabled for stable releases)',
>
> +       deprecated: 'glib_assert')
>
> +option('glib-checks', type : 'feature', value : 'enabled', yield : true,
>
> +       description: 'Enable GLib checks such as API guards (auto =3D
> enabled for development, disabled for stable releases)',
>
> +       deprecated: 'glib_checks')
>
>
>
> *From:* Jose Quaresma <quaresma.jose@gmail.com>
> *Sent:* Wednesday, March 26, 2025 7:36 PM
> *To:* Lei, Maohui/=E9=9B=B7 =E8=8C=82=E6=85=A7 <leimaohui@fujitsu.com>
> *Cc:* Anuj Mittal <anuj.mittal@intel.com>;
> openembedded-core@lists.openembedded.org; Lei Maohui <
> leihaohui@fujitsu.com>
> *Subject:* Re: [OE-core] [PATCH v2 6/7]
> gstreamer1.0-plugins-{ugly,base,good}: upgrade 1.24.12 -> 1.26.0
>
>
>
> Hi Lei,
>
> This is a major bump and is a bit strange that there are no new
> packageconfig knobs and also some other deprecation.
>
> Have you checked the meson opinions changes?
>
>
>
> Jose
>
> leimaohui via lists.openembedded.org <leimaohui=3D
> fujitsu.com@lists.openembedded.org> escreveu (quarta, 26/03/2025 =C3=A0(s=
)
> 06:37):
>
> From: Lei Maohui <leihaohui@fujitsu.com>
>
> Signed-off-by: Lei Maohui <leihaohui@fujitsu.com>
> ---
>  ...1-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch | 4 ++--
>  .../0002-ssaparse-enhance-SSA-text-lines-parsing.patch        | 2 +-
>  .../0003-viv-fb-Make-sure-config.h-is-included.patch          | 2 +-
>  ...ns-base_1.24.12.bb =3D> gstreamer1.0-plugins-base_1.26.0.bb} | 2 +-
>  ...ns-good_1.24.12.bb =3D> gstreamer1.0-plugins-good_1.26.0.bb} | 2 +-
>  ...ns-ugly_1.24.12.bb =3D> gstreamer1.0-plugins-ugly_1.26.0.bb} | 2 +-
>  6 files changed, 7 insertions(+), 7 deletions(-)
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-base_1.24.12.bb =3D>
> gstreamer1.0-plugins-base_1.26.0.bb} (98%)
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-good_1.24.12.bb =3D>
> gstreamer1.0-plugins-good_1.26.0.bb} (97%)
>  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0-plugins-ugly_1.24.12.bb =3D>
> gstreamer1.0-plugins-ugly_1.26.0.bb} (94%)
>
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00=
312515-get-caps-from-src-pad-when-query-caps.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00=
312515-get-caps-from-src-pad-when-query-caps.patch
> index e35ec026e4..7373bd3e26 100644
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00=
312515-get-caps-from-src-pad-when-query-caps.patch
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00=
312515-get-caps-from-src-pad-when-query-caps.patch
> @@ -1,4 +1,4 @@
> -From e0478a9b3bb1b49c34aaf076152ed8e49cf909e0 Mon Sep 17 00:00:00 2001
> +From bd1436f0027bb09cdcf90386910a497422d9a871 Mon Sep 17 00:00:00 2001
>  From: zhouming <b42586@freescale.com>
>  Date: Wed, 14 May 2014 10:16:20 +0800
>  Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
> @@ -16,7 +16,7 @@ Signed-off-by: zhouming <b42586@freescale.com>
>  diff --git a/gst-libs/gst/tag/gsttagdemux.c
> b/gst-libs/gst/tag/gsttagdemux.c
>  old mode 100644
>  new mode 100755
> -index ef0ff90..53f05c8
> +index 975fe83..df82840
>  --- a/gst-libs/gst/tag/gsttagdemux.c
>  +++ b/gst-libs/gst/tag/gsttagdemux.c
>  @@ -1796,6 +1796,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject =
*
> parent, GstQuery * query)
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssapar=
se-enhance-SSA-text-lines-parsing.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssapar=
se-enhance-SSA-text-lines-parsing.patch
> index 810a4ba676..fc9ad474d9 100644
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssapar=
se-enhance-SSA-text-lines-parsing.patch
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssapar=
se-enhance-SSA-text-lines-parsing.patch
> @@ -1,4 +1,4 @@
> -From 1b9887421de593854632571327b4918b880900c6 Mon Sep 17 00:00:00 2001
> +From 1cc876662b7707eb5a2f668654f7921b5642e108 Mon Sep 17 00:00:00 2001
>  From: Mingke Wang <mingke.wang@freescale.com>
>  Date: Thu, 19 Mar 2015 14:17:10 +0800
>  Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb=
-Make-sure-config.h-is-included.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb=
-Make-sure-config.h-is-included.patch
> index 8fa46d809a..06b5bc41ed 100644
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb=
-Make-sure-config.h-is-included.patch
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb=
-Make-sure-config.h-is-included.patch
> @@ -1,4 +1,4 @@
> -From 22a0e3a5288486991a15c48fdcb730eaa6dc08e5 Mon Sep 17 00:00:00 2001
> +From c0c6944eca0c497477aa9f2cec2c83c4ea7a70e5 Mon Sep 17 00:00:00 2001
>  From: Carlos Rafael Giani <crg7475@mailbox.org>
>  Date: Tue, 21 May 2019 14:01:11 +0200
>  Subject: [PATCH] viv-fb: Make sure config.h is included
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.24.12.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.26.0.bb
> similarity index 98%
> rename from meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.24.12.bb
> rename to meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.26.0.bb
> index f4505d831e..bd0131c647 100644
> --- a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.24.12.bb
> +++ b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-base_1.26.0.bb
> @@ -11,7 +11,7 @@ SRC_URI =3D "
> https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
>             file://0003-viv-fb-Make-sure-config.h-is-included.patch \
>             file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "f6efbaa8fea8d00bc380bccca76a530527b1f083e8523eafb3e9b1e18bc653d3"
> +SRC_URI[sha256sum] =3D
> "e23189fbed2ec486690382d1055c19eeaf5aae3e95e2576fc4c884d96a90e69e"
>
>  S =3D "${WORKDIR}/gst-plugins-base-${PV}"
>
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.24.12.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.26.0.bb
> similarity index 97%
> rename from meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.24.12.bb
> rename to meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.26.0.bb
> index 9cc2d462f6..a2c6426c34 100644
> --- a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.24.12.bb
> +++ b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.26.0.bb
> @@ -6,7 +6,7 @@ BUGTRACKER =3D "
> https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
>
>  SRC_URI =3D "
> https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-$=
{PV}.tar.xz
> "
>
> -SRC_URI[sha256sum] =3D
> "d0e66e2f935d1575f6adbef7d0a2b3faba7360344383c51bf0233b39e0489a64"
> +SRC_URI[sha256sum] =3D
> "9e18f139ef69ad0867c2dfbb8fe1d1736d76df11aac83f60e8d3adb1e2eaf03b"
>
>  S =3D "${WORKDIR}/gst-plugins-good-${PV}"
>
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.24.12.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.26.0.bb
> similarity index 94%
> rename from meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.24.12.bb
> rename to meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.26.0.bb
> index 75f528216f..f0e42ad8fb 100644
> --- a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.24.12.bb
> +++ b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.26.0.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D " \
>
> https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-$=
{PV}.tar.xz
> \
>              "
>
> -SRC_URI[sha256sum] =3D
> "19ed6eef4ea1a742234fb35e2cdb107168595a4dd409a9fac0b7a16543eee78b"
> +SRC_URI[sha256sum] =3D
> "a86b51c8454a813120848c803421f327d8c07aabcae461e0597cc49398c0fcde"
>
>  S =3D "${WORKDIR}/gst-plugins-ugly-${PV}"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213636):
> https://lists.openembedded.org/g/openembedded-core/message/213636
> Mute This Topic: https://lists.openembedded.org/mt/111912609/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
>
> --
>
> Best regards,
>
>
> Jos=C3=A9 Quaresma
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000ec42b2063151cda3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">Maohui Lei (Fujitsu) &lt;<a hre=
f=3D"mailto:leimaohui@fujitsu.com">leimaohui@fujitsu.com</a>&gt; escreveu (=
quinta, 27/03/2025 =C3=A0(s) 03:18):<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div class=3D"msg-4190508588908468095">





<div lang=3D"ZH-CN" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-4190508588908468095WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">&gt;This is a major bump and is=
 a bit strange=C2=A0that there are no new packageconfig knobs and also some=
 other deprecation.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Have you checked=C2=A0the meson=
 opinions changes?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">Yes, I have checked the meson_options.txt changes =
corresponding to the 10 recipes upgraded this time.<u></u><u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">Although some meson_options.txt have changed, but =
I think the meson options changes do not affect the upgrade this time<u></u=
><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">It=E2=80=99s mainly about glibc<u></u><u></u></spa=
n></p>
<ol style=3D"margin-top:0cm" start=3D"1" type=3D"1">
<li class=3D"m_-4190508588908468095MsoListParagraph" style=3D"margin-left:6=
pt"><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:=E7=AD=89=E7=
=BA=BF">gobject-cast-checks
</span><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:Wingdings">=
=C3=A0</span><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:=E7=
=AD=89=E7=BA=BF"> glibc-debug<u></u><u></u></span></li><li class=3D"m_-4190=
508588908468095MsoListParagraph" style=3D"margin-left:6pt"><span lang=3D"EN=
-US" style=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">glib-asserts =
=C2=A0</span><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:Wingd=
ings">=C3=A0</span><span lang=3D"EN-US" style=3D"font-size:11pt;font-family=
:=E7=AD=89=E7=BA=BF">
 glib_assert=C2=A0=C2=A0 * change type from feature to boolean<u></u><u></u=
></span></li><li class=3D"m_-4190508588908468095MsoListParagraph" style=3D"=
margin-left:6pt"><span lang=3D"EN-US" style=3D"font-size:11pt;font-family:=
=E7=AD=89=E7=BA=BF">glib-checks =C2=A0</span><span lang=3D"EN-US" style=3D"=
font-size:11pt;font-family:Wingdings">=C3=A0</span><span lang=3D"EN-US" sty=
le=3D"font-size:11pt;font-family:=E7=AD=89=E7=BA=BF">
 glib_checks=C2=A0 * change type from feature to boolean<u></u><u></u></spa=
n></li></ol>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">However, there is no glib related packageconfig op=
tions in our gstreamer related recipes,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">I mean we haven&#39;t meson built these options, s=
o their changes have no effect on us<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">And I also checked all do_configure logs, no optio=
n =E2=80=9Cdeprecated=E2=80=9D related logs<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">Please let me know if further confirmations are ne=
eded</span></p></div></div></div></blockquote><div><br></div><div>I see som=
e changes on the gst-plugins-bad:<br><br>$ git diff --stat origin/1.26 orig=
in/1.24 $(find | grep meson_options.txt) <br>=C2=A0meson_options.txt =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 49 +++++++++++++++++---------------=
-----------------<br>=C2=A0subprojects/gst-devtools/meson_options.txt =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A02 --<br>=C2=A0subprojects/gst-editing-serv=
ices/meson_options.txt | =C2=A04 +---<br>=C2=A0subprojects/gst-plugins-bad/=
meson_options.txt =C2=A0 =C2=A0 =C2=A0| 76 +++++++++++++++-----------------=
--------------------------------------------<br>=C2=A0subprojects/gst-plugi=
ns-base/meson_options.txt =C2=A0 =C2=A0 | 24 ++++++------------------<br>=
=C2=A0subprojects/gst-plugins-good/meson_options.txt =C2=A0 =C2=A0 | 24 +++=
+++------------------<br>=C2=A0subprojects/gst-plugins-ugly/meson_options.t=
xt =C2=A0 =C2=A0 | 24 ++++++------------------<br>=C2=A0subprojects/gst-pyt=
hon/meson_options.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A04 +---<br>=
=C2=A0subprojects/gst-rtsp-server/meson_options.txt =C2=A0 =C2=A0 =C2=A0| 2=
4 ++++++------------------<br>=C2=A0subprojects/gstreamer/meson_options.txt=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 24 ++++++------------------<br>=
<br class=3D"gmail-Apple-interchange-newline"></div><div>I also recommend=
=C2=A0doing these major updates=C2=A0separately using one=C2=A0commit for e=
ach component.<br><br>Jose<br><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div class=3D"msg-4190508588908468095"><div lang=3D"ZH-CN" s=
tyle=3D"overflow-wrap: break-word;"><div class=3D"m_-4190508588908468095Wor=
dSection1"><p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:1=
1pt;font-family:=E7=AD=89=E7=BA=BF"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF"><a href=3D"mailto:userland@pumpkin3:/mnt/test/buil=
d_auh/workspace/attic/sources/gstreamer1.0.20250326023639$" target=3D"_blan=
k">userland@pumpkin3:/mnt/test/build_auh/workspace/attic/sources/gstreamer1=
.0.20250326023639$</a>
 git diff devtool-base devtool-base-1.26.0 meson_options.txt<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">diff --git a/meson_options.txt b/meson_options.txt=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">index 340fb58..39255cf 100644<u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">--- a/meson_options.txt<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+++ b/meson_options.txt<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">@@ -33,12 +33,6 @@ option(&#39;benchmarks&#39;, ty=
pe : &#39;feature&#39;, value : &#39;auto&#39;, yield : true)<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">option(&#39;tools&#39;, type : &#39;feature&#39;, =
value : &#39;auto&#39;, yield : true)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">option(&#39;introspection&#39;, type : &#39;featur=
e&#39;, value : &#39;auto&#39;, yield : true, description : &#39;Generate g=
object-introspection bindings&#39;)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">option(&#39;nls&#39;, type : &#39;feature&#39;, va=
lue : &#39;auto&#39;, yield: true, description : &#39;Enable native languag=
e support (translations)&#39;)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">-option(&#39;gobject-cast-checks&#39;, type : &#39=
;feature&#39;, value : &#39;auto&#39;, yield : true,<u></u><u></u></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description:=
 &#39;Enable run-time GObject cast checks (auto =3D enabled for development=
, disabled for stable releases)&#39;)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">-option(&#39;glib-asserts&#39;, type : &#39;featur=
e&#39;, value : &#39;enabled&#39;, yield : true,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description:=
 &#39;Enable GLib assertion (auto =3D enabled for development, disabled for=
 stable releases)&#39;)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">-option(&#39;glib-checks&#39;, type : &#39;feature=
&#39;, value : &#39;enabled&#39;, yield : true,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description:=
 &#39;Enable GLib checks such as API guards (auto =3D enabled for developme=
nt, disabled for stable releases)&#39;)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">option(&#39;extra-checks&#39;, type : &#39;feature=
&#39;, value : &#39;enabled&#39;, yield : true, description : &#39;Enable e=
xtra runtime checks&#39;)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF"># Common options<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">@@ -48,3 +42,21 @@ option(&#39;package-origin&#39;=
, type : &#39;string&#39;, value : &#39;Unknown package origin&#39;, yiel<u=
></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 descrip=
tion : &#39;package origin URL to use in plugins&#39;)<u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">option(&#39;doc&#39;, type : &#39;feature&#39;, va=
lue : &#39;auto&#39;, yield: true,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 descrip=
tion: &#39;Enable documentation.&#39;)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+option(&#39;glib_debug&#39;, type : &#39;feature&=
#39;, value : &#39;auto&#39;, yield : true, description : &#39;Enable GLib =
debug infrastructure (see docs/macros.txt)&#39;)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+option(&#39;glib_assert&#39;, type : &#39;boolean=
&#39;, value : true, yield : true, description : &#39;Enable GLib assertion=
 (see docs/macros.txt)&#39;,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+=C2=A0 deprecated: {&#39;enabled&#39; : &#39;true=
&#39;, &#39;disabled&#39; : &#39;false&#39;, &#39;auto&#39; : &#39;false&#3=
9;},<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+option(&#39;glib_checks&#39;, type : &#39;boolean=
&#39;, value : true, yield : true, description : &#39;Enable GLib checks su=
ch as API guards (see docs/macros.txt)&#39;,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+=C2=A0 deprecated: {&#39;enabled&#39; : &#39;true=
&#39;, &#39;disabled&#39; : &#39;false&#39;, &#39;auto&#39; : &#39;false&#3=
9;},<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+# Deprecated, kept for backward compat<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+option(&#39;gobject-cast-checks&#39;, type : &#39=
;feature&#39;, value : &#39;auto&#39;, yield : true,<u></u><u></u></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description:=
 &#39;Enable run-time GObject cast checks (auto =3D enabled for development=
, disabled for stable releases)&#39;,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 deprecated: =
&#39;glib_debug&#39;)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+option(&#39;glib-asserts&#39;, type : &#39;featur=
e&#39;, value : &#39;enabled&#39;, yield : true,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description:=
 &#39;Enable GLib assertion (auto =3D enabled for development, disabled for=
 stable releases)&#39;,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 deprecated: =
&#39;glib_assert&#39;)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+option(&#39;glib-checks&#39;, type : &#39;feature=
&#39;, value : &#39;enabled&#39;, yield : true,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description:=
 &#39;Enable GLib checks such as API guards (auto =3D enabled for developme=
nt, disabled for stable releases)&#39;,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 deprecated: =
&#39;glib_checks&#39;)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;font-fa=
mily:=E7=AD=89=E7=BA=BF"><u></u>=C2=A0<u></u></span></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:Calibri,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:Calibri,sans-serif"> Jose Quaresma &lt;<a href=3D=
"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com<=
/a>&gt;
<br>
<b>Sent:</b> Wednesday, March 26, 2025 7:36 PM<br>
<b>To:</b> Lei, Maohui/</span><span style=3D"font-size:11pt">=E9=9B=B7</spa=
n><span style=3D"font-size:11pt;font-family:Calibri,sans-serif">
</span><span style=3D"font-size:11pt">=E8=8C=82=E6=85=A7</span><span lang=
=3D"EN-US" style=3D"font-size:11pt;font-family:Calibri,sans-serif"> &lt;<a =
href=3D"mailto:leimaohui@fujitsu.com" target=3D"_blank">leimaohui@fujitsu.c=
om</a>&gt;<br>
<b>Cc:</b> Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=
=3D"_blank">anuj.mittal@intel.com</a>&gt;; <a href=3D"mailto:openembedded-c=
ore@lists.openembedded.org" target=3D"_blank">openembedded-core@lists.opene=
mbedded.org</a>; Lei Maohui &lt;<a href=3D"mailto:leihaohui@fujitsu.com" ta=
rget=3D"_blank">leihaohui@fujitsu.com</a>&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH v2 6/7] gstreamer1.0-plugins-{ugly,bas=
e,good}: upgrade 1.24.12 -&gt; 1.26.0<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Lei,<br>
<br>
This is a major bump and is a bit strange=C2=A0that there are no new packag=
econfig knobs and also some other deprecation.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Have you checked=C2=A0the meson=
 opinions changes?<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span lang=3D"EN-US">Jo=
se<u></u><u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">leimaohui via <a href=3D"http:/=
/lists.openembedded.org" target=3D"_blank">
lists.openembedded.org</a> &lt;leimaohui=3D<a href=3D"mailto:fujitsu.com@li=
sts.openembedded.org" target=3D"_blank">fujitsu.com@lists.openembedded.org<=
/a>&gt; escreveu (quarta, 26/03/2025 =C3=A0(s) 06:37):<u></u><u></u></span>=
</p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span lang=3D"EN-US">Fr=
om: Lei Maohui &lt;<a href=3D"mailto:leihaohui@fujitsu.com" target=3D"_blan=
k">leihaohui@fujitsu.com</a>&gt;<br>
<br>
Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leihaohui@fujitsu.com" targ=
et=3D"_blank">leihaohui@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...1-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch | 4 ++-=
-<br>
=C2=A0.../0002-ssaparse-enhance-SSA-text-lines-parsing.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0.../0003-viv-fb-Make-sure-config.h-is-included.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0...<a href=3D"http://ns-base_1.24.12.bb" target=3D"_blank">ns-base_1.=
24.12.bb</a> =3D&gt;
<a href=3D"http://gstreamer1.0-plugins-base_1.26.0.bb" target=3D"_blank">gs=
treamer1.0-plugins-base_1.26.0.bb</a>} | 2 +-<br>
=C2=A0...<a href=3D"http://ns-good_1.24.12.bb" target=3D"_blank">ns-good_1.=
24.12.bb</a> =3D&gt;
<a href=3D"http://gstreamer1.0-plugins-good_1.26.0.bb" target=3D"_blank">gs=
treamer1.0-plugins-good_1.26.0.bb</a>} | 2 +-<br>
=C2=A0...<a href=3D"http://ns-ugly_1.24.12.bb" target=3D"_blank">ns-ugly_1.=
24.12.bb</a> =3D&gt;
<a href=3D"http://gstreamer1.0-plugins-ugly_1.26.0.bb" target=3D"_blank">gs=
treamer1.0-plugins-ugly_1.26.0.bb</a>} | 2 +-<br>
=C2=A06 files changed, 7 insertions(+), 7 deletions(-)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-plugins-base_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-base_1.=
24.12.bb</a> =3D&gt;
<a href=3D"http://gstreamer1.0-plugins-base_1.26.0.bb" target=3D"_blank">gs=
treamer1.0-plugins-base_1.26.0.bb</a>} (98%)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-plugins-good_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-good_1.=
24.12.bb</a> =3D&gt;
<a href=3D"http://gstreamer1.0-plugins-good_1.26.0.bb" target=3D"_blank">gs=
treamer1.0-plugins-good_1.26.0.bb</a>} (97%)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0-plugins-ugly_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-ugly_1.=
24.12.bb</a> =3D&gt;
<a href=3D"http://gstreamer1.0-plugins-ugly_1.26.0.bb" target=3D"_blank">gs=
treamer1.0-plugins-ugly_1.26.0.bb</a>} (94%)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/00=
01-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-=
multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-f=
rom-src-pad-when-query-caps.patch<br>
index e35ec026e4..7373bd3e26 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR=
00312515-get-caps-from-src-pad-when-query-caps.patch<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR=
00312515-get-caps-from-src-pad-when-query-caps.patch<br>
@@ -1,4 +1,4 @@<br>
-From e0478a9b3bb1b49c34aaf076152ed8e49cf909e0 Mon Sep 17 00:00:00 2001<br>
+From bd1436f0027bb09cdcf90386910a497422d9a871 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: zhouming &lt;<a href=3D"mailto:b42586@freescale.com" target=3D"=
_blank">b42586@freescale.com</a>&gt;<br>
=C2=A0Date: Wed, 14 May 2014 10:16:20 +0800<br>
=C2=A0Subject: [PATCH] ENGR00312515: get caps from src pad when query caps<=
br>
@@ -16,7 +16,7 @@ Signed-off-by: zhouming &lt;<a href=3D"mailto:b42586@free=
scale.com" target=3D"_blank">b42586@freescale.com</a>&gt;<br>
=C2=A0diff --git a/gst-libs/gst/tag/gsttagdemux.c b/gst-libs/gst/tag/gsttag=
demux.c<br>
=C2=A0old mode 100644<br>
=C2=A0new mode 100755<br>
-index ef0ff90..53f05c8<br>
+index 975fe83..df82840<br>
=C2=A0--- a/gst-libs/gst/tag/gsttagdemux.c<br>
=C2=A0+++ b/gst-libs/gst/tag/gsttagdemux.c<br>
=C2=A0@@ -1796,6 +1796,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObje=
ct * parent, GstQuery * query)<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/00=
02-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/=
gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-pa=
rsing.patch<br>
index 810a4ba676..fc9ad474d9 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssap=
arse-enhance-SSA-text-lines-parsing.patch<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssap=
arse-enhance-SSA-text-lines-parsing.patch<br>
@@ -1,4 +1,4 @@<br>
-From 1b9887421de593854632571327b4918b880900c6 Mon Sep 17 00:00:00 2001<br>
+From 1cc876662b7707eb5a2f668654f7921b5642e108 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Mingke Wang &lt;<a href=3D"mailto:mingke.wang@freescale.com" ta=
rget=3D"_blank">mingke.wang@freescale.com</a>&gt;<br>
=C2=A0Date: Thu, 19 Mar 2015 14:17:10 +0800<br>
=C2=A0Subject: [PATCH] ssaparse: enhance SSA text lines parsing.<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/00=
03-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gs=
treamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-include=
d.patch<br>
index 8fa46d809a..06b5bc41ed 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-=
fb-Make-sure-config.h-is-included.patch<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-=
fb-Make-sure-config.h-is-included.patch<br>
@@ -1,4 +1,4 @@<br>
-From 22a0e3a5288486991a15c48fdcb730eaa6dc08e5 Mon Sep 17 00:00:00 2001<br>
+From c0c6944eca0c497477aa9f2cec2c83c4ea7a70e5 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Carlos Rafael Giani &lt;<a href=3D"mailto:crg7475@mailbox.org" =
target=3D"_blank">crg7475@mailbox.org</a>&gt;<br>
=C2=A0Date: Tue, 21 May 2019 14:01:11 +0200<br>
=C2=A0Subject: [PATCH] viv-fb: Make sure config.h is included<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-plugins-base_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-base_1.2=
4.12.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer=
1.0-plugins-base_1.26.0.bb" target=3D"_blank">gstreamer1.0-plugins-base_1.2=
6.0.bb</a><br>
similarity index 98%<br>
rename from meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.=
0-plugins-base_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-base_1.24=
.12.bb</a><br>
rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-=
plugins-base_1.26.0.bb" target=3D"_blank">gstreamer1.0-plugins-base_1.26.0.=
bb</a><br>
index f4505d831e..bd0131c647 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-base_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-base_1.24.12.bb=
</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-base_1.26.0.bb" target=3D"_blank">gstreamer1.0-plugins-base_1.26.0.bb</=
a><br>
@@ -11,7 +11,7 @@ SRC_URI =3D &quot;<a href=3D"https://gstreamer.freedeskto=
p.org/src/gst-plugins-base/gst-plugins-ba" target=3D"_blank">https://gstrea=
mer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-viv-fb-Make-sure-conf=
ig.h-is-included.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-ssaparse-enhance-SSA-=
text-lines-parsing.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;f6efbaa8fea8d00bc380bccca76a530527b1f083e8523=
eafb3e9b1e18bc653d3&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e23189fbed2ec486690382d1055c19eeaf5aae3e95e25=
76fc4c884d96a90e69e&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/gst-plugins-base-${PV}&quot;<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-plugins-good_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-good_1.2=
4.12.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer=
1.0-plugins-good_1.26.0.bb" target=3D"_blank">gstreamer1.0-plugins-good_1.2=
6.0.bb</a><br>
similarity index 97%<br>
rename from meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.=
0-plugins-good_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-good_1.24=
.12.bb</a><br>
rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-=
plugins-good_1.26.0.bb" target=3D"_blank">gstreamer1.0-plugins-good_1.26.0.=
bb</a><br>
index 9cc2d462f6..a2c6426c34 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-good_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-good_1.24.12.bb=
</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-good_1.26.0.bb" target=3D"_blank">gstreamer1.0-plugins-good_1.26.0.bb</=
a><br>
@@ -6,7 +6,7 @@ BUGTRACKER =3D &quot;<a href=3D"https://gitlab.freedesktop.=
org/gstreamer/gst-plugins-good/-/issues" target=3D"_blank">https://gitlab.f=
reedesktop.org/gstreamer/gst-plugins-good/-/issues</a><br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://gstreamer.freedesktop.org/src/gs=
t-plugins-good/gst-plugins-good-$%7BPV%7D.tar.xz" target=3D"_blank">https:/=
/gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.=
xz</a>&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;d0e66e2f935d1575f6adbef7d0a2b3faba7360344383c=
51bf0233b39e0489a64&quot;<br>
+SRC_URI[sha256sum] =3D &quot;9e18f139ef69ad0867c2dfbb8fe1d1736d76df11aac83=
f60e8d3adb1e2eaf03b&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/gst-plugins-good-${PV}&quot;<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-plugins-ugly_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-ugly_1.2=
4.12.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer=
1.0-plugins-ugly_1.26.0.bb" target=3D"_blank">gstreamer1.0-plugins-ugly_1.2=
6.0.bb</a><br>
similarity index 94%<br>
rename from meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.=
0-plugins-ugly_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-ugly_1.24=
.12.bb</a><br>
rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-=
plugins-ugly_1.26.0.bb" target=3D"_blank">gstreamer1.0-plugins-ugly_1.26.0.=
bb</a><br>
index 75f528216f..f0e42ad8fb 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-ugly_1.24.12.bb" target=3D"_blank">gstreamer1.0-plugins-ugly_1.24.12.bb=
</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-ugly_1.26.0.bb" target=3D"_blank">gstreamer1.0-plugins-ugly_1.26.0.bb</=
a><br>
@@ -15,7 +15,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://gstreame=
r.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-$%7BPV%7D.tar.xz" t=
arget=3D"_blank">https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst=
-plugins-ugly-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;19ed6eef4ea1a742234fb35e2cdb107168595a4dd409a=
9fac0b7a16543eee78b&quot;<br>
+SRC_URI[sha256sum] =3D &quot;a86b51c8454a813120848c803421f327d8c07aabcae46=
1e0597cc49398c0fcde&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/gst-plugins-ugly-${PV}&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#213636): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/213636" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/213636</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111912609/505=
2612" target=3D"_blank">
https://lists.openembedded.org/mt/111912609/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>=
]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<u></u><u></u></span></p>
</blockquote>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><br clear=3D"all">
<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<p class=3D"MsoNormal"><span class=3D"m_-4190508588908468095gmailsignaturep=
refix"><span lang=3D"EN-US">-- </span>
</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best regards,<u></u><u></u></sp=
an></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><br>
Jos=C3=A9 Quaresma<u></u><u></u></span></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</d=
iv></div></div></div>

--000000000000ec42b2063151cda3--

