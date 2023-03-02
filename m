Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10EA3C6FA8E
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 21:49:52 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.7659.1677793783584992455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Mar 2023 13:49:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=tHqU4VkH;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.47, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f47.google.com with SMTP id cw28so2750321edb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 13:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677793782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cR+c6Vbl5K+bcKFXnJW8C8rmnjXckNF5KzPxEjkeoMg=;
        b=tHqU4VkHI00walyUQPTCrlNZz84fFDsnP5tVgAqzW3MW+GnGPta1TJExQmM1cNEs9/
         +y1eDj+KtylyHxs6yWEqVzYMhHBFe61FvxLMbORHpgRIdpB5wb3xdeLN6NkXFUKYZJO9
         nzBtrPwvVoTX4waAvCNS9XbWawu9nu8Sz9PyuGc1zzgJQFQZkfLctsWMGhQJMGIfhWgC
         TyBHa0clMxWvf9tRZRTg5gtacGC9u48fpnb1Zb5YmytlQ3e6KU9GRx9VjKzddzKsvV3R
         Wmno388Ypz1pff7lr9bNyhzyBFl7qlxnqZ+f8L2MX4vYHeS5TQ3MGU755UtY6lPy/3Ov
         XU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677793782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cR+c6Vbl5K+bcKFXnJW8C8rmnjXckNF5KzPxEjkeoMg=;
        b=sUn2wR8kQM4nJqJZ5s7qe+eDlMA0cS/xYlNEOVt6ZtrI0isGGWbPa7OhNk6yD/MJDp
         WJZdYXYpUnvs1mhRbStRiTO6XBj40wfE8Tc4Ml6eTuvn92aTP/3w0T/7108xcKB0LYEa
         yTI/9s/OM2qthMJOeZsGb74YbG6JhmULw2RNlPVeTtyE0X3DBKtCNyJDqKyGk64qZQ5q
         5+hVdryRy0X5kipn8vnQRtD63VQpk9j5//e2cs8Uucfc34hH+/1itrZ7rzKGCxxC1iqk
         7/QJm3ZS7qXZAs5c07PO+Gc4mhSwh95f1qJF2MDLAdUI5iHShu+gJYud8c1m7NY0xbo8
         kqHA==
X-Gm-Message-State: AO0yUKVRYlPhijKR4nnKebDcxF0IB3mn8kpgd5vEPm+bsmhkrfYp70YW
	wEOERi7dKK4xEuU+aLDUcKcAPHThTAIPDtiBkPoZ0B7bjtvzE13t3/Q=
X-Google-Smtp-Source: AK7set8exVdPBc9nVIptdioooqfIe9zdwC5tf88WnYRLndCiASqv5HATKqXkvV54gqmIb6WtWfnQzUAkSHgXc89Agts=
X-Received: by 2002:a50:9f6f:0:b0:4bf:5fd5:da42 with SMTP id
 b102-20020a509f6f000000b004bf5fd5da42mr2847643edf.3.1677793781568; Thu, 02
 Mar 2023 13:49:41 -0800 (PST)
MIME-Version: 1.0
References: <20230227025703.4986-1-vkumbhar@mvista.com>
In-Reply-To: <20230227025703.4986-1-vkumbhar@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 2 Mar 2023 11:49:30 -1000
Message-ID: <CAOSpxdZ9qHXW7mSLT4OPSDG_1Wjx1rkQw+uwvvtVosHbu729TQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] harfbuzz: fix CVE-2023-25193 allows
 attackers to trigger O(n^2) growth via consecutive marks
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 21:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177969

This patch results in build errors on dunfell:

| In file included from ../../harfbuzz-2.6.4/src/hb-ot-layout-gpos-table.hh=
:32,
|                  from ../../harfbuzz-2.6.4/src/hb-kern.hh:32,
|                  from ../../harfbuzz-2.6.4/src/hb-aat-layout-kerx-table.h=
h:31,
|                  from ../../harfbuzz-2.6.4/src/hb-aat-layout.cc:36:
| ../../harfbuzz-2.6.4/src/hb-ot-layout-gsubgpos.hh: In member
function 'bool OT::hb_ot_apply_context_t::skipping_iterator_t::next()':
| ../../harfbuzz-2.6.4/src/hb-ot-layout-gsubgpos.hh:376:30: error:
'HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT' was not declared in this
scope
|   376 |       if (c->buffer->flags & HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CON=
CAT)
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
| ../../harfbuzz-2.6.4/src/hb-ot-layout-gsubgpos.hh: In member
function 'bool OT::hb_ot_apply_context_t::skipping_iterator_t::prev()':
| ../../harfbuzz-2.6.4/src/hb-ot-layout-gsubgpos.hh:406:30: error:
'HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT' was not declared in this
scope
|   406 |       if (c->buffer->flags & HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CON=
CAT)
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
| x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-g++ -m64
-march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-stron=
g
-D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security
--sysroot=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-li=
nux/harfbuzz/2.6.4-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../harfbuzz-2.6.4/src -I.. -pthread
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/glib-2.0
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/lib/glib-2.0/include
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/freetype2
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/libpng16
-fno-rtti -O2 -pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0=3D/usr/src/debug/harfbuzz/2.6.4-r0
-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0=3D/usr/src/debug/harfbuzz/2.6.4-r0
-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0/recipe-sysroot=3D
-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0/recipe-sysroot-native=3D
-fvisibility-inlines-hidden -fno-exceptions -fno-threadsafe-statics
-fvisibility-inlines-hidden -std=3Dc++11 -c
../../harfbuzz-2.6.4/src/hb-ot-meta.cc  -fPIC -DPIC -o
.libs/libharfbuzz_la-hb-ot-meta.o
| In file included from ../../harfbuzz-2.6.4/src/main.cc:30:
| ../../harfbuzz-2.6.4/src/hb-ot-layout-gsubgpos.hh: In member
function 'bool OT::hb_ot_apply_context_t::skipping_iterator_t::next()':
| ../../harfbuzz-2.6.4/src/hb-ot-layout-gsubgpos.hh:376:30: error:
'HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT' was not declared in this
scope
|   376 |       if (c->buffer->flags & HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CON=
CAT)
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
| ../../harfbuzz-2.6.4/src/hb-ot-layout-gsubgpos.hh: In member
function 'bool OT::hb_ot_apply_context_t::skipping_iterator_t::prev()':
| ../../harfbuzz-2.6.4/src/hb-ot-layout-gsubgpos.hh:406:30: error:
'HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT' was not declared in this
scope
|   406 |       if (c->buffer->flags & HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CON=
CAT)
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
| ../x86_64-poky-linux-libtool  --tag=3DCXX   --mode=3Dcompile
x86_64-poky-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
-mfpmath=3Dsse -fstack-protector-strong  -D_FORTIFY_SOURCE=3D2 -Wformat
-Wformat-security -Werror=3Dformat-security
--sysroot=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-li=
nux/harfbuzz/2.6.4-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../harfbuzz-2.6.4/src -I..  -pthread
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/glib-2.0
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/lib/glib-2.0/include
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/freetype2
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/libpng16
         -fno-rtti  -O2 -pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0=3D/usr/src/debug/harfbuzz/2.6.4-r0

-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0=3D/usr/src/debug/harfbuzz/2.6.4-r0

-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0/recipe-sysroot=3D

-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0/recipe-sysroot-native=3D
 -fvisibility-inlines-hidden -fno-exceptions -fno-threadsafe-statics
-fvisibility-inlines-hidden -std=3Dc++11 -c -o
libharfbuzz_la-hb-ot-metrics.lo `test -f 'hb-ot-metrics.cc' || echo
'../../harfbuzz-2.6.4/src/'`hb-ot-metrics.cc
| ../x86_64-poky-linux-libtool  --tag=3DCXX   --mode=3Dcompile
x86_64-poky-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
-mfpmath=3Dsse -fstack-protector-strong  -D_FORTIFY_SOURCE=3D2 -Wformat
-Wformat-security -Werror=3Dformat-security
--sysroot=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-li=
nux/harfbuzz/2.6.4-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../harfbuzz-2.6.4/src -I..  -pthread
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/glib-2.0
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/lib/glib-2.0/include
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/freetype2
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/libpng16
         -fno-rtti  -O2 -pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0=3D/usr/src/debug/harfbuzz/2.6.4-r0

-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0=3D/usr/src/debug/harfbuzz/2.6.4-r0

-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0/recipe-sysroot=3D

-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0/recipe-sysroot-native=3D
 -fvisibility-inlines-hidden -fno-exceptions -fno-threadsafe-statics
-fvisibility-inlines-hidden -std=3Dc++11 -c -o
libharfbuzz_la-hb-ot-name.lo `test -f 'hb-ot-name.cc' || echo
'../../harfbuzz-2.6.4/src/'`hb-ot-name.cc
| x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-g++ -m64
-march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-stron=
g
-D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security
--sysroot=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-li=
nux/harfbuzz/2.6.4-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../harfbuzz-2.6.4/src -I.. -pthread
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/glib-2.0
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/lib/glib-2.0/include
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/freetype2
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/libpng16
-fno-rtti -O2 -pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0=3D/usr/src/debug/harfbuzz/2.6.4-r0
-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0=3D/usr/src/debug/harfbuzz/2.6.4-r0
-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0/recipe-sysroot=3D
-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0/recipe-sysroot-native=3D
-fvisibility-inlines-hidden -fno-exceptions -fno-threadsafe-statics
-fvisibility-inlines-hidden -std=3Dc++11 -c
../../harfbuzz-2.6.4/src/hb-ot-metrics.cc  -fPIC -DPIC -o
.libs/libharfbuzz_la-hb-ot-metrics.o
| x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-g++ -m64
-march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-stron=
g
-D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security
--sysroot=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-li=
nux/harfbuzz/2.6.4-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../harfbuzz-2.6.4/src -I.. -pthread
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/glib-2.0
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/lib/glib-2.0/include
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/freetype2
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/libpng16
-fno-rtti -O2 -pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0=3D/usr/src/debug/harfbuzz/2.6.4-r0
-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0=3D/usr/src/debug/harfbuzz/2.6.4-r0
-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0/recipe-sysroot=3D
-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0/recipe-sysroot-native=3D
-fvisibility-inlines-hidden -fno-exceptions -fno-threadsafe-statics
-fvisibility-inlines-hidden -std=3Dc++11 -c
../../harfbuzz-2.6.4/src/hb-ot-name.cc  -fPIC -DPIC -o
.libs/libharfbuzz_la-hb-ot-name.o
| In file included from ../../harfbuzz-2.6.4/src/hb-ot-layout-gpos-table.hh=
:32,
|                  from ../../harfbuzz-2.6.4/src/hb-kern.hh:32,
|                  from ../../harfbuzz-2.6.4/src/hb-aat-layout-kerx-table.h=
h:31,
|                  from ../../harfbuzz-2.6.4/src/hb-ot-kern-table.hh:30,
|                  from ../../harfbuzz-2.6.4/src/hb-ot-face.cc:34:
| ../../harfbuzz-2.6.4/src/hb-ot-layout-gsubgpos.hh: In member
function 'bool OT::hb_ot_apply_context_t::skipping_iterator_t::next()':
| ../../harfbuzz-2.6.4/src/hb-ot-layout-gsubgpos.hh:376:30: error:
'HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT' was not declared in this
scope
|   376 |       if (c->buffer->flags & HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CON=
CAT)
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
| ../../harfbuzz-2.6.4/src/hb-ot-layout-gsubgpos.hh: In member
function 'bool OT::hb_ot_apply_context_t::skipping_iterator_t::prev()':
| ../../harfbuzz-2.6.4/src/hb-ot-layout-gsubgpos.hh:406:30: error:
'HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT' was not declared in this
scope
|   406 |       if (c->buffer->flags & HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CON=
CAT)
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
| In file included from ../../harfbuzz-2.6.4/src/hb-ot-layout-gpos-table.hh=
:32,
|                  from ../../harfbuzz-2.6.4/src/hb-kern.hh:32,
|                  from ../../harfbuzz-2.6.4/src/hb-aat-layout-kerx-table.h=
h:31,
|                  from ../../harfbuzz-2.6.4/src/hb-ot-kern-table.hh:30,
|                  from ../../harfbuzz-2.6.4/src/hb-ot-layout.cc:45:
| ../../harfbuzz-2.6.4/src/hb-ot-layout-gsubgpos.hh: In member
function 'bool OT::hb_ot_apply_context_t::skipping_iterator_t::next()':
| ../../harfbuzz-2.6.4/src/hb-ot-layout-gsubgpos.hh:376:30: error:
'HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT' was not declared in this
scope
|   376 |       if (c->buffer->flags & HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CON=
CAT)
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
| ../../harfbuzz-2.6.4/src/hb-ot-layout-gsubgpos.hh: In member
function 'bool OT::hb_ot_apply_context_t::skipping_iterator_t::prev()':
| ../../harfbuzz-2.6.4/src/hb-ot-layout-gsubgpos.hh:406:30: error:
'HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT' was not declared in this
scope
|   406 |       if (c->buffer->flags & HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CON=
CAT)
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
| ../x86_64-poky-linux-libtool  --tag=3DCXX   --mode=3Dcompile
x86_64-poky-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
-mfpmath=3Dsse -fstack-protector-strong  -D_FORTIFY_SOURCE=3D2 -Wformat
-Wformat-security -Werror=3Dformat-security
--sysroot=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-li=
nux/harfbuzz/2.6.4-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../harfbuzz-2.6.4/src -I..  -pthread
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/glib-2.0
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/lib/glib-2.0/include
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/freetype2
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/libpng16
         -fno-rtti  -O2 -pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0=3D/usr/src/debug/harfbuzz/2.6.4-r0

-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0=3D/usr/src/debug/harfbuzz/2.6.4-r0

-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0/recipe-sysroot=3D

-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0/recipe-sysroot-native=3D
 -fvisibility-inlines-hidden -fno-exceptions -fno-threadsafe-statics
-fvisibility-inlines-hidden -std=3Dc++11 -c -o
libharfbuzz_la-hb-ot-shape-complex-arabic.lo `test -f
'hb-ot-shape-complex-arabic.cc' || echo
'../../harfbuzz-2.6.4/src/'`hb-ot-shape-complex-arabic.cc
| x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-g++ -m64
-march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-stron=
g
-D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security
--sysroot=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-li=
nux/harfbuzz/2.6.4-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../harfbuzz-2.6.4/src -I.. -pthread
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/glib-2.0
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/lib/glib-2.0/include
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/freetype2
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/libpng16
-fno-rtti -O2 -pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0=3D/usr/src/debug/harfbuzz/2.6.4-r0
-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0=3D/usr/src/debug/harfbuzz/2.6.4-r0
-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0/recipe-sysroot=3D
-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0/recipe-sysroot-native=3D
-fvisibility-inlines-hidden -fno-exceptions -fno-threadsafe-statics
-fvisibility-inlines-hidden -std=3Dc++11 -c
../../harfbuzz-2.6.4/src/hb-ot-shape-complex-arabic.cc  -fPIC -DPIC -o
.libs/libharfbuzz_la-hb-ot-shape-complex-arabic.o
| ../x86_64-poky-linux-libtool  --tag=3DCXX   --mode=3Dcompile
x86_64-poky-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
-mfpmath=3Dsse -fstack-protector-strong  -D_FORTIFY_SOURCE=3D2 -Wformat
-Wformat-security -Werror=3Dformat-security
--sysroot=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-li=
nux/harfbuzz/2.6.4-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../harfbuzz-2.6.4/src -I..  -pthread
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/glib-2.0
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/lib/glib-2.0/include
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/freetype2
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/libpng16
         -fno-rtti  -O2 -pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0=3D/usr/src/debug/harfbuzz/2.6.4-r0

-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0=3D/usr/src/debug/harfbuzz/2.6.4-r0

-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0/recipe-sysroot=3D

-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0/recipe-sysroot-native=3D
 -fvisibility-inlines-hidden -fno-exceptions -fno-threadsafe-statics
-fvisibility-inlines-hidden -std=3Dc++11 -c -o
libharfbuzz_la-hb-ot-shape-complex-default.lo `test -f
'hb-ot-shape-complex-default.cc' || echo
'../../harfbuzz-2.6.4/src/'`hb-ot-shape-complex-default.cc
| x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-g++ -m64
-march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-stron=
g
-D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security
--sysroot=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-li=
nux/harfbuzz/2.6.4-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../harfbuzz-2.6.4/src -I.. -pthread
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/glib-2.0
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/lib/glib-2.0/include
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/freetype2
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/libpng16
-fno-rtti -O2 -pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0=3D/usr/src/debug/harfbuzz/2.6.4-r0
-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0=3D/usr/src/debug/harfbuzz/2.6.4-r0
-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0/recipe-sysroot=3D
-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0/recipe-sysroot-native=3D
-fvisibility-inlines-hidden -fno-exceptions -fno-threadsafe-statics
-fvisibility-inlines-hidden -std=3Dc++11 -c
../../harfbuzz-2.6.4/src/hb-ot-shape-complex-default.cc  -fPIC -DPIC
-o .libs/libharfbuzz_la-hb-ot-shape-complex-default.o
| ../x86_64-poky-linux-libtool  --tag=3DCXX   --mode=3Dcompile
x86_64-poky-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
-mfpmath=3Dsse -fstack-protector-strong  -D_FORTIFY_SOURCE=3D2 -Wformat
-Wformat-security -Werror=3Dformat-security
--sysroot=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-li=
nux/harfbuzz/2.6.4-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../harfbuzz-2.6.4/src -I..  -pthread
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/glib-2.0
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/lib/glib-2.0/include
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/freetype2
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/libpng16
         -fno-rtti  -O2 -pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0=3D/usr/src/debug/harfbuzz/2.6.4-r0

-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0=3D/usr/src/debug/harfbuzz/2.6.4-r0

-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0/recipe-sysroot=3D

-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0/recipe-sysroot-native=3D
 -fvisibility-inlines-hidden -fno-exceptions -fno-threadsafe-statics
-fvisibility-inlines-hidden -std=3Dc++11 -c -o
libharfbuzz_la-hb-ot-shape-complex-hangul.lo `test -f
'hb-ot-shape-complex-hangul.cc' || echo
'../../harfbuzz-2.6.4/src/'`hb-ot-shape-complex-hangul.cc
| x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-g++ -m64
-march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-stron=
g
-D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security
--sysroot=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-li=
nux/harfbuzz/2.6.4-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../harfbuzz-2.6.4/src -I.. -pthread
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/glib-2.0
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/lib/glib-2.0/include
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/freetype2
-I/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/harfbu=
zz/2.6.4-r0/recipe-sysroot/usr/include/libpng16
-fno-rtti -O2 -pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0=3D/usr/src/debug/harfbuzz/2.6.4-r0
-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0=3D/usr/src/debug/harfbuzz/2.6.4-r0
-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0/recipe-sysroot=3D
-fdebug-prefix-map=3D/home/steve/builds/poky-contrib/build/tmp/work/core2-6=
4-poky-linux/harfbuzz/2.6.4-r0/recipe-sysroot-native=3D
-fvisibility-inlines-hidden -fno-exceptions -fno-threadsafe-statics
-fvisibility-inlines-hidden -std=3Dc++11 -c
../../harfbuzz-2.6.4/src/hb-ot-shape-complex-hangul.cc  -fPIC -DPIC -o
.libs/libharfbuzz_la-hb-ot-shape-complex-hangul.o
| make[4]: *** [Makefile:2573: main-main.o] Error 1
| make[4]: *** Waiting for unfinished jobs....
| In file included from ../../harfbuzz-2.6.4/src/hb-ot-layout-gsub-table.hh=
:32,
|                  from
../../harfbuzz-2.6.4/src/hb-ot-shape-complex-arabic-fallback.hh:33,
|                  from
../../harfbuzz-2.6.4/src/hb-ot-shape-complex-arabic.cc:245:
| ../../harfbuzz-2.6.4/src/hb-ot-layout-gsubgpos.hh: In member
function 'bool OT::hb_ot_apply_context_t::skipping_iterator_t::next()':
| ../../harfbuzz-2.6.4/src/hb-ot-layout-gsubgpos.hh:376:30: error:
'HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT' was not declared in this
scope
|   376 |       if (c->buffer->flags & HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CON=
CAT)
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
| ../../harfbuzz-2.6.4/src/hb-ot-layout-gsubgpos.hh: In member
function 'bool OT::hb_ot_apply_context_t::skipping_iterator_t::prev()':
| ../../harfbuzz-2.6.4/src/hb-ot-layout-gsubgpos.hh:406:30: error:
'HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT' was not declared in this
scope
|   406 |       if (c->buffer->flags & HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CON=
CAT)
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
| make[4]: *** [Makefile:2083: libharfbuzz_la-hb-aat-layout.lo] Error 1
| make[4]: *** [Makefile:2181: libharfbuzz_la-hb-ot-face.lo] Error 1
| make[4]: *** [Makefile:2195: libharfbuzz_la-hb-ot-layout.lo] Error 1
| make[4]: *** [Makefile:2237:
libharfbuzz_la-hb-ot-shape-complex-arabic.lo] Error 1

On Sun, Feb 26, 2023 at 4:57=E2=80=AFPM vkumbhar <vkumbhar@mvista.com> wrot=
e:
>
> [layout] Limit how far we skip when looking back
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  .../harfbuzz/harfbuzz/CVE-2023-25193.patch    | 71 +++++++++++++++++++
>  .../harfbuzz/harfbuzz_2.6.4.bb                |  5 +-
>  2 files changed, 75 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-2519=
3.patch
>
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch=
 b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
> new file mode 100644
> index 0000000000..1ae80c29c3
> --- /dev/null
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
> @@ -0,0 +1,71 @@
> +From 85be877925ddbf34f74a1229f3ca1716bb6170dc Mon Sep 17 00:00:00 2001
> +From: Behdad Esfahbod <behdad@behdad.org>
> +Date: Wed, 1 Feb 2023 20:00:43 -0700
> +Subject: [PATCH] [layout] Limit how far we skip when looking back
> +
> +Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/8=
5be877925ddbf34f74a1229f3ca1716bb6170dc]
> +CVE: CVE-2023-25193
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + src/hb-ot-layout-common.hh   |  7 +++++++
> + src/hb-ot-layout-gsubgpos.hh | 19 ++++++++++++++++---
> + 2 files changed, 23 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/hb-ot-layout-common.hh b/src/hb-ot-layout-common.hh
> +index fa08140..833be06 100644
> +--- a/src/hb-ot-layout-common.hh
> ++++ b/src/hb-ot-layout-common.hh
> +@@ -60,6 +60,13 @@
> + #define HB_MAX_LANGSYS        2000
> + #endif
> +
> ++#ifndef HB_MAX_NESTING_LEVEL
> ++#define HB_MAX_NESTING_LEVEL  6
> ++#endif
> ++#ifndef HB_MAX_CONTEXT_LENGTH
> ++#define HB_MAX_CONTEXT_LENGTH 64
> ++#endif
> ++
> +
> + namespace OT {
> +
> +diff --git a/src/hb-ot-layout-gsubgpos.hh b/src/hb-ot-layout-gsubgpos.hh
> +index 579d178..357c2bb 100644
> +--- a/src/hb-ot-layout-gsubgpos.hh
> ++++ b/src/hb-ot-layout-gsubgpos.hh
> +@@ -372,7 +372,10 @@ struct hb_ot_apply_context_t :
> +     bool next ()
> +     {
> +       assert (num_items > 0);
> +-      while (idx + num_items < end)
> ++      unsigned stop =3D end - num_items;
> ++      if (c->buffer->flags & HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT)
> ++              stop =3D end - 1;
> ++      while (idx < stop)
> +       {
> +       idx++;
> +       const hb_glyph_info_t &info =3D c->buffer->info[idx];
> +@@ -398,8 +401,18 @@ struct hb_ot_apply_context_t :
> +     }
> +     bool prev ()
> +     {
> +-      assert (num_items > 0);
> +-      while (idx > num_items - 1)
> ++      assert (num_items > 0);
> ++      unsigned stop =3D 1 - num_items;
> ++      if (c->buffer->flags & HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT)
> ++              stop =3D 1 - 1;
> ++
> ++      /* When looking back, limit how far we search; this function is m=
ostly
> ++       * used for looking back for base glyphs when attaching marks. If=
 we
> ++       * don't limit, we can get O(n^2) behavior where n is the number =
of
> ++       * consecutive marks. */
> ++      stop =3D (unsigned) hb_max ((int) stop, (int) idx - HB_MAX_CONTEX=
T_LENGTH);
> ++
> ++      while (idx > stop)
> +       {
> +       idx--;
> +       const hb_glyph_info_t &info =3D c->buffer->out_info[idx];
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.4.bb b/meta/reci=
pes-graphics/harfbuzz/harfbuzz_2.6.4.bb
> index ee08c12bee..a488dbee35 100644
> --- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.4.bb
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.4.bb
> @@ -7,7 +7,10 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De11f5c3149cdec4bb309babb020b3=
2b9 \
>                      file://src/hb-ucd.cc;beginline=3D1;endline=3D15;md5=
=3D29d4dcb6410429195df67efe3382d8bc"
>
> -SRC_URI =3D "http://www.freedesktop.org/software/harfbuzz/release/${BP}.=
tar.xz"
> +SRC_URI =3D "http://www.freedesktop.org/software/harfbuzz/release/${BP}.=
tar.xz \
> +           file://CVE-2023-25193.patch \
> +           "
> +
>  SRC_URI[md5sum] =3D "2b3a4dfdb3e5e50055f941978944da9f"
>  SRC_URI[sha256sum] =3D "9413b8d96132d699687ef914ebb8c50440efc87b3f775d25=
856d7ec347c03c12"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177768): https://lists.openembedded.org/g/openembedde=
d-core/message/177768
> Mute This Topic: https://lists.openembedded.org/mt/97258861/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

