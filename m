Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AFAC021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 20:03:45 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.32444.1739995421975464569
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 12:03:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=B3VvcmT3;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.171, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6fb2a0e4125so1046457b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 12:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739995421; x=1740600221; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jgvcnu7TWa5ZFa7iIb4c9n/M7MXKNBc9miNmvX0wY/I=;
        b=B3VvcmT3vVDPqwpF2VjmjPbmWzH1KR2N3zQRBn+sQSu3/3udHkoVryt0wHK6Kv8Gyv
         qSWZv3zQcZLrh7uZfp1q/fBGlhvB1bxA7Ps9qfcGJbzrAI4nXMv2A/hVM0evkEDFkgHv
         iNjvvBtTQeGNWXmacn7lsAMLvI9dmzPY/xvTywLek+fYag5hXaWSlHtThukMoC+Lmq7n
         x7rxonOIgsNBh3D7L/m2CC/Yp7oDBY8y7rC9Bpe6Lm+/DUZCtR8cLPBud+rPU/6PLapi
         9INcSt2W/hsjYwRC1MQlmwTgj3PvMm85EM6OQS9uu+Pu+gNbiMVig+W9qpetmCIFCDMH
         FBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739995421; x=1740600221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jgvcnu7TWa5ZFa7iIb4c9n/M7MXKNBc9miNmvX0wY/I=;
        b=wNNh9VdlWfWJ2CD1j+HSN+Fn5V6ANe8YBeuPM9TuBTJC62gtmfIlJOTojcYYhE3NYU
         z5LmfKqkBI0raBQ7xr82EObjDV3og7YtGKn4Lxnt9ozCIwzAfUSMAg+/g0s7xOOTNbhU
         P2ukiUbE+S9fV14Ut8yGcDaWd2e/BvjPl0lK8DCsRVqmtFZE2ZzjBhe7F9YYBkl9k/H2
         jTfZK4eN7xL6IIammsR0GkQcH8qS3oF01C6RqQqJWZBeZtp6NYtSvVKBRO0ceqBqUfae
         eg7496H7byb7b3v46XED6g9CGcY8lb1HdxZSR9iQqWMn5tfv0TDZ8C8NYwXevGYruvIN
         Kcgw==
X-Gm-Message-State: AOJu0YxnX+ZfSCoc50YijAVh8/x/yn5wuKC7235bSDfs2Itr++jiPOQb
	OgIOLBOuxC2m74KSMbkfbj3Xq9F6ZjWw8k+05xEeWv8maZNtxs7f7wMUCYpUOYAxnRo3MYKHSC6
	bg2z8cud1jTCYKmYUVQAs+cNldUTuSRQ69wP9M/6wYdrr50HCk9Q=
X-Gm-Gg: ASbGncvzSHMvKA3WUDnaDUt9pxjbyqEc1GnVaHrPIDiZxfDOGlIOOlCds/5ZbSAr0In
	GE8EQcgVTdRiT8pAu3l8NWERDOG01Td/uYhNfz5KVvalFAmxsnL3hUVmgmzDhGL4MOEK7mC6n40
	IbZaYPV5+atemNyx0YFBzdVLbxW6Wi
X-Google-Smtp-Source: AGHT+IF/CcIwCfiONCO1N11mKie0pXcHPD44p1cPw+U81aEH0UcO32kY6JzWQQksmbvfnDnKJV9bkZGDsFY3qlycot8=
X-Received: by 2002:a05:690c:6813:b0:6f5:4304:fdc with SMTP id
 00721157ae682-6fb5825d834mr173283827b3.6.1739995420991; Wed, 19 Feb 2025
 12:03:40 -0800 (PST)
MIME-Version: 1.0
References: <20250219085502.2297068-1-kai.kang@windriver.com>
In-Reply-To: <20250219085502.2297068-1-kai.kang@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 19 Feb 2025 12:03:30 -0800
X-Gm-Features: AWEUYZnoHTfyVVJu8Dr_6SWJb7uENhuEve6aHwCZrAfO6uFg_rwS1Z5jaBxajWQ
Message-ID: <CAOSpxdYQo7sqX+8MCxxKxgcBdeDLuyGgk7+KFqDV2gSYAkL6Dg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 1/2] qemu: fix compile error with lttng-ust
To: kai.kang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 20:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211731

Hi Kai,

I'm getting reproducibility errors with this patch set:

AssertionError: The following deb packages are missing or different
and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/d=
eploy/deb/./core2-64/qemu-src_6.2.0-r0_amd64.deb
The following ipk packages are missing or different and not in
exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/d=
eploy/ipk/./core2-64/qemu-src_6.2.0-r0_core2-64.ipk
The following rpm packages are missing or different and not in
exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/d=
eploy/rpm/./core2_64/qemu-src-6.2.0-r0.core2_64.rpm

The diffoscope output is here:

https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250219-aucltpnr/=
packages/diff-html/

It appears that full build machine paths are appearing in the packages
(see above link)

Steve

On Wed, Feb 19, 2025 at 12:55=E2=80=AFAM Kai Kang via lists.openembedded.or=
g
<kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> When PACKAGECONFIG ust is enabled for qemu, it fails to compile:
>
> | In file included from trace/trace-ust-all.h:44179,
> |                  from trace/trace-ust-all.c:13:
> | /path_to/qemu/6.2.0-r0/recipe-sysroot/usr/include/lttng/tracepoint-even=
t.h:67:10:
>     error: #include expects "FILENAME" or <FILENAME>
> |    67 | #include LTTNG_UST_TRACEPOINT_INCLUDE
> |       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Backport upstream commit to fix it.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  1 +
>  ...-fix-compilation-with-lttng-ust-2.13.patch | 75 +++++++++++++++++++
>  2 files changed, 76 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0001-trace-fix-compil=
ation-with-lttng-ust-2.13.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index bee30cd56f..02afafc2e8 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -128,6 +128,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \
>             file://CVE-2024-3446-0005.patch \
>             file://CVE-2024-3446-0006.patch \
>             file://CVE-2024-3447.patch \
> +           file://0001-trace-fix-compilation-with-lttng-ust-2.13.patch \
>             "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-trace-fix-compilation-w=
ith-lttng-ust-2.13.patch b/meta/recipes-devtools/qemu/qemu/0001-trace-fix-c=
ompilation-with-lttng-ust-2.13.patch
> new file mode 100644
> index 0000000000..d3cb19c839
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/0001-trace-fix-compilation-with-ltt=
ng-ust-2.13.patch
> @@ -0,0 +1,75 @@
> +From e32aaa5a19e24233180042f84a0235a209de71cc Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <marcandre.lureau@r=
edhat.com>
> +Date: Mon, 28 Mar 2022 12:47:13 +0400
> +Subject: [PATCH] trace: fix compilation with lttng-ust >=3D 2.13
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +On Fedora 36, with lttng-ust 2.13.1, compilation fails with:
> +
> +In file included from trace/trace-ust-all.h:49085,
> +                 from trace/trace-ust-all.c:13:
> +/usr/include/lttng/tracepoint-event.h:67:10: error: #include expects "FI=
LENAME" or <FILENAME>
> +   67 | #include LTTNG_UST_TRACEPOINT_INCLUDE
> +      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +In lttng-ust commit 41858e2b6e8 ("Fix: don't do macro expansion in
> +tracepoint file name") from 2012, starting from lttng-ust 2.1, the API
> +was changed to expect TRACEPOINT_INCLUDE to be defined as a string.
> +
> +In lttng-ust commit d2966b4b0b2 ("Remove TRACEPOINT_INCLUDE_FILE
> +macro"), in 2021, the compatibility macro was removed.
> +
> +Use the "new" API from 2012, and bump the version requirement to 2.1 to
> +fix compilation with >=3D 2.13.
> +
> +According to repology, all distributions we support have >=3D 2.1 (cento=
s
> +8 has oldest with 2.8.1 afaict)
> +
> +Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> +Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> +Message-Id: <20220328084717.367993-2-marcandre.lureau@redhat.com>
> +Signed-off-by: Thomas Huth <thuth@redhat.com>
> +
> +Upstream-Status: Backport [https://github.com/qemu/qemu/commit/e32aaa5]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> + meson.build                              | 4 ++--
> + scripts/tracetool/format/ust_events_h.py | 4 ++--
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 04ce33fef1..861de93c4f 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -455,8 +455,8 @@ if 'CONFIG_GIO' in config_host
> + endif
> + lttng =3D not_found
> + if 'ust' in get_option('trace_backends')
> +-  lttng =3D dependency('lttng-ust', required: true, method: 'pkg-config=
',
> +-                     kwargs: static_kwargs)
> ++  lttng =3D dependency('lttng-ust', required: true, version: '>=3D 2.1'=
,
> ++                     method: 'pkg-config', kwargs: static_kwargs)
> + endif
> + pixman =3D not_found
> + if have_system or have_tools
> +diff --git a/scripts/tracetool/format/ust_events_h.py b/scripts/tracetoo=
l/format/ust_events_h.py
> +index 6ce559f6cc..b99fe6896b 100644
> +--- a/scripts/tracetool/format/ust_events_h.py
> ++++ b/scripts/tracetool/format/ust_events_h.py
> +@@ -29,8 +29,8 @@ def generate(events, backend, group):
> +         '#undef TRACEPOINT_PROVIDER',
> +         '#define TRACEPOINT_PROVIDER qemu',
> +         '',
> +-        '#undef TRACEPOINT_INCLUDE_FILE',
> +-        '#define TRACEPOINT_INCLUDE_FILE ./%s' % include,
> ++        '#undef TRACEPOINT_INCLUDE',
> ++        '#define TRACEPOINT_INCLUDE "./%s"' % include,
> +         '',
> +         '#if !defined (TRACE_%s_GENERATED_UST_H) || \\'  % group.upper(=
),
> +         '     defined(TRACEPOINT_HEADER_MULTI_READ)',
> +--
> +2.47.1
> +
> --
> 2.47.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211689): https://lists.openembedded.org/g/openembedde=
d-core/message/211689
> Mute This Topic: https://lists.openembedded.org/mt/111266608/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

