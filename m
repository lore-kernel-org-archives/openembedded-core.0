Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8684C433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 17:50:13 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.416.1652205012454003902
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 10:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=MFtJyy/Y;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.48,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f48.google.com with SMTP id dk23so34469347ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 10:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sLk/+i2QpIOh8oIsTk3SWGSOM/rwviCvEiJkllsZj7o=;
        b=MFtJyy/YqTgGL4jHaTaznhv32cLmtumqh+9KHC3bzDKoUhMmYL8on90bs85Wc4Ij75
         Y0lKPu/NzwUHdpOFK6oYyi6y8iZwEHtg/W8/vCyXssBy18omb8Vz7FvapbefuCz8lw16
         g0tz0KbhARKJNMgH3vOmSftTbJZ5OLwHPGaEQqGXxXeCnoZ57ffiemXkte9OIiPanVhY
         BcqZMpYpPf7KK9to6UFyRDo9/ZW9QhxK05ab/Jn+3Z9vQ1WlLu09R5dNQIPhoTGtFaW4
         6pJWxWeYDy8W28kWTvTBN3IcylTigh1ZA4uPpbV2ovDi8UVpUJrMDXm86w/QkK0PsKRZ
         Q0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sLk/+i2QpIOh8oIsTk3SWGSOM/rwviCvEiJkllsZj7o=;
        b=X6Ju8Ukf1HuoZHngAyCR+nR9WZ8MlsUh0IeKbPVt+Q/kA43mvuk81ZnEy87BaokBnJ
         3f2TSNC3QGqQJ6+bh6Tml1xpPkjKKs9vukj6c2tPZ0e/f03SKBpqVu0DyxZmUdwtRvIy
         5riOMRAhw6Ds/TmuNEUjbah/a8KHrXFyaHu3zYG/DczwW+oUbkN3meeGee0cPPOmmJxu
         AtrY+4SkOrOqcu9qqeXTHxsjEpmvqarZPmaJKP79mgdOFxqI1zjo89/mhGU/SOu+/SGr
         Fji736GK3IDp0FXPrJ7oKXeSRKWeoEf6jyPK2ovCZCgdDRZAa8tdw5zU6NK9KZebgo+A
         ynBg==
X-Gm-Message-State: AOAM531XYucGl6Dl/iPvCLLyECRDQMEL9dszmzflWW98ok/XhiROCGFQ
	H5zA5yWP9B6TU3eTtqzFrSoTIHSLZlwjCwvUqbd4EA==
X-Google-Smtp-Source: 
 ABdhPJzikxDfyAE08IeYsDYGAwF65QZli1DGDeXt4lgDUB3gnx6trDmGWIthLHebQHr+PhUlL56NxlSWB3BS9gDDarw=
X-Received: by 2002:a17:907:2da0:b0:6f4:e536:3771 with SMTP id
 gt32-20020a1709072da000b006f4e5363771mr21708062ejc.55.1652205010623; Tue, 10
 May 2022 10:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220509062438.12448-1-badganchipv@gmail.com>
In-Reply-To: <20220509062438.12448-1-badganchipv@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 10 May 2022 07:49:58 -1000
Message-ID: 
 <CAOSpxdZ7Nqe8XKFRgrNXp3Sx_LgajemLg3QNyTxf0vSHfcLcrA@mail.gmail.com>
Subject: Re: [OE-core] [meta][dunfell][PATCH] libinput: Add fix for
 CVE-2022-1215
To: Pawan Badganchi <badganchipv@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 17:50:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165466

On Sun, May 8, 2022 at 8:25 PM Pawan Badganchi <badganchipv@gmail.com> wrot=
e:
>
> From: Pawan Badganchi <badganchipv@gmail.com>
>
> Add below patch to fix CVE-2022-1215
>
> CVE-2022-1215.patch
> Link: https://gitlab.freedesktop.org/libinput/libinput/-/commit/2a8b8fde9=
0d63d48ce09ddae44142674bbca1c28
>
> Signed-off-by: Pawan Badganchi<badganchipv@gmail.com>
> ---
>  .../wayland/libinput/CVE-2022-1215.patch      | 361 ++++++++++++++++++
>  .../wayland/libinput_1.15.2.bb                |   1 +
>  2 files changed, 362 insertions(+)
>  create mode 100644 meta/recipes-graphics/wayland/libinput/CVE-2022-1215.=
patch
>
> diff --git a/meta/recipes-graphics/wayland/libinput/CVE-2022-1215.patch b=
/meta/recipes-graphics/wayland/libinput/CVE-2022-1215.patch
> new file mode 100644
> index 0000000000..5f8f7a9894
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/libinput/CVE-2022-1215.patch
> @@ -0,0 +1,361 @@
> +From 2a8b8fde90d63d48ce09ddae44142674bbca1c28 Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Wed, 30 Mar 2022 09:25:22 +1000
> +Subject: [PATCH] evdev: strip the device name of format directives
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This fixes a format string vulnerabilty.
> +
> +evdev_log_message() composes a format string consisting of a fixed
> +prefix (including the rendered device name) and the passed-in format
> +buffer. This format string is then passed with the arguments to the
> +actual log handler, which usually and eventually ends up being printf.
> +
> +If the device name contains a printf-style format directive, these ended
> +up in the format string and thus get interpreted correctly, e.g. for a
> +device "Foo%sBar" the log message vs printf invocation ends up being:
> +  evdev_log_message(device, "some message %s", "some argument");
> +  printf("event9 - Foo%sBar: some message %s", "some argument");
> +
> +This can enable an attacker to execute malicious code with the
> +privileges of the process using libinput.
> +
> +To exploit this, an attacker needs to be able to create a kernel device
> +with a malicious name, e.g. through /dev/uinput or a Bluetooth device.
> +
> +To fix this, convert any potential format directives in the device name
> +by duplicating percentages.
> +
> +Pre-rendering the device to avoid the issue altogether would be nicer
> +but the current log level hooks do not easily allow for this. The device
> +name is the only user-controlled part of the format string.
> +
> +A second potential issue is the sysname of the device which is also
> +sanitized.
> +
> +This issue was found by Albin Eldst=C3=A5l-Ahrens and Benjamin Svensson =
from
> +Assured AB, and independently by Lukas Lamster.
> +
> +Fixes #752
> +
> +Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> +(cherry picked from commit a423d7d3269dc32a87384f79e29bb5ac021c83d1)
> +
> +CVE: CVE-2022-1215
> +Upstream Status: Backport [https://gitlab.freedesktop.org/libinput/libin=
put/-/commit/2a8b8fde90d63d48ce09ddae44142674bbca1c28]
> +Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> +
> +---
> + meson.build                        |  1 +
> + src/evdev.c                        | 31 +++++++++++------
> + src/evdev.h                        |  6 ++--
> + src/util-strings.h                 | 30 ++++++++++++++++
> + test/litest-device-format-string.c | 56 ++++++++++++++++++++++++++++++
> + test/litest.h                      |  1 +
> + test/test-utils.c                  | 26 ++++++++++++++
> + 7 files changed, 139 insertions(+), 12 deletions(-)
> + create mode 100644 test/litest-device-format-string.c
> +
> +diff --git a/meson.build b/meson.build
> +index 90f528e6..1f6159e7 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -787,6 +787,7 @@
> +               'test/litest-device-dell-canvas-totem-touch.c',
> +               'test/litest-device-elantech-touchpad.c',
> +               'test/litest-device-elan-tablet.c',
> ++              'test/litest-device-format-string.c',
> +               'test/litest-device-generic-singletouch.c',
> +               'test/litest-device-gpio-keys.c',
> +               'test/litest-device-huion-pentablet.c',
> +diff --git a/src/evdev.c b/src/evdev.c
> +index 6d81f58f..d1c35c07 100644
> +--- a/src/evdev.c
> ++++ b/src/evdev.c
> +@@ -2356,19 +2356,19 @@ evdev_device_create(struct libinput_seat *seat,
> +       struct libinput *libinput =3D seat->libinput;
> +       struct evdev_device *device =3D NULL;
> +       int rc;
> +-      int fd;
> ++      int fd =3D -1;
> +       int unhandled_device =3D 0;
> +       const char *devnode =3D udev_device_get_devnode(udev_device);
> +-      const char *sysname =3D udev_device_get_sysname(udev_device);
> ++      char *sysname =3D str_sanitize(udev_device_get_sysname(udev_devic=
e));
> +
> +       if (!devnode) {
> +               log_info(libinput, "%s: no device node associated\n", sys=
name);
> +-              return NULL;
> ++              goto err;
> +       }
> +
> +       if (udev_device_should_be_ignored(udev_device)) {
> +               log_debug(libinput, "%s: device is ignored\n", sysname);
> +-              return NULL;
> ++              goto err;
> +       }
> +
> +       /* Use non-blocking mode so that we can loop on read on
> +@@ -2382,13 +2382,15 @@ evdev_device_create(struct libinput_seat *seat,
> +                        sysname,
> +                        devnode,
> +                        strerror(-fd));
> +-              return NULL;
> ++              goto err;
> +       }
> +
> +       if (!evdev_device_have_same_syspath(udev_device, fd))
> +               goto err;
> +
> +       device =3D zalloc(sizeof *device);
> ++      device->sysname =3D sysname;
> ++      sysname =3D NULL;
> +
> +       libinput_device_init(&device->base, seat);
> +       libinput_seat_ref(seat);
> +@@ -2411,6 +2413,9 @@ evdev_device_create(struct libinput_seat *seat,
> +       device->dispatch =3D NULL;
> +       device->fd =3D fd;
> +       device->devname =3D libevdev_get_name(device->evdev);
> ++      /* the log_prefix_name is used as part of a printf format string =
and
> ++       * must not contain % directives, see evdev_log_msg */
> ++      device->log_prefix_name =3D str_sanitize(device->devname);
> +       device->scroll.threshold =3D 5.0; /* Default may be overridden */
> +       device->scroll.direction_lock_threshold =3D 5.0; /* Default may b=
e overridden */
> +       device->scroll.direction =3D 0;
> +@@ -2238,9 +2238,14 @@
> +       return device;
> +
> + err:
> +-      close_restricted(libinput, fd);
> +-      if (device)
> +-              evdev_device_destroy(device);
> ++      if (fd >=3D 0) {
> ++              close_restricted(libinput, fd);
> ++              if (device) {
> ++                      unhandled_device =3D device->seat_caps =3D=3D 0;
> ++                      evdev_device_destroy(device);
> ++              }
> ++            }
> ++        free(sysname);
> +
> +       return unhandled_device ? EVDEV_UNHANDLED_DEVICE :  NULL;
> + }
> +

Extra newline above silently inhibits application of the following two hunk=
s!

Patch tool then recovers with the next file diffs.

> +@@ -2469,7 +2478,7 @@ evdev_device_get_output(struct evdev_device *devic=
e)
> + const char *
> + evdev_device_get_sysname(struct evdev_device *device)
> + {
> +-      return udev_device_get_sysname(device->udev_device);
> ++      return device->sysname;
> + }
> +
> + const char *
> +@@ -3066,6 +3075,8 @@ evdev_device_destroy(struct evdev_device *device)
> +       if (device->base.group)
> +               libinput_device_group_unref(device->base.group);
> +
> ++      free(device->log_prefix_name);
> ++      free(device->sysname);
> +       free(device->output_name);
> +       filter_destroy(device->pointer.filter);
> +       libinput_timer_destroy(&device->scroll.timer);
> +diff --git a/src/evdev.h b/src/evdev.h
> +index c7d130f8..980c5943 100644
> +--- a/src/evdev.h
> ++++ b/src/evdev.h
> +@@ -169,6 +169,8 @@ struct evdev_device {
> +       struct udev_device *udev_device;
> +       char *output_name;
> +       const char *devname;
> ++      char *log_prefix_name;
> ++      char *sysname;
> +       bool was_removed;
> +       int fd;
> +       enum evdev_device_seat_capability seat_caps;
> +@@ -786,7 +788,7 @@ evdev_log_msg(struct evdev_device *device,
> +                sizeof(buf),
> +                "%-7s - %s%s%s",
> +                evdev_device_get_sysname(device),
> +-               (priority > LIBINPUT_LOG_PRIORITY_DEBUG) ?  device->devn=
ame : "",
> ++               (priority > LIBINPUT_LOG_PRIORITY_DEBUG) ?  device->log_=
prefix_name : "",
> +                (priority > LIBINPUT_LOG_PRIORITY_DEBUG) ?  ": " : "",
> +                format);
> +
> +@@ -824,7 +826,7 @@ evdev_log_msg_ratelimit(struct evdev_device *device,
> +                sizeof(buf),
> +                "%-7s - %s%s%s",
> +                evdev_device_get_sysname(device),
> +-               (priority > LIBINPUT_LOG_PRIORITY_DEBUG) ?  device->devn=
ame : "",
> ++               (priority > LIBINPUT_LOG_PRIORITY_DEBUG) ?  device->log_=
prefix_name : "",
> +                (priority > LIBINPUT_LOG_PRIORITY_DEBUG) ?  ": " : "",
> +                format);
> +
> +diff --git a/src/util-strings.h b/src/util-strings.h
> +index 2a15fab3..d5a84146 100644
> +--- a/src/util-strings.h
> ++++ b/src/util-strings.h
> +@@ -42,6 +42,7 @@
> + #ifdef HAVE_XLOCALE_H
> + #include <xlocale.h>
> + #endif
> ++#include "util-macros.h"
> +
> + #define streq(s1, s2) (strcmp((s1), (s2)) =3D=3D 0)
> + #define strneq(s1, s2, n) (strncmp((s1), (s2), (n)) =3D=3D 0)
> +@@ -312,3 +313,31 @@
> +       free(result);
> +       return -1;
> + }
> ++
> ++/**
> ++ * Return a copy of str with all % converted to %% to make the string
> ++ * acceptable as printf format.
> ++ */
> ++static inline char *
> ++str_sanitize(const char *str)
> ++{
> ++      if (!str)
> ++              return NULL;
> ++
> ++      if (!strchr(str, '%'))
> ++              return strdup(str);
> ++
> ++      size_t slen =3D min(strlen(str), 512);
> ++      char *sanitized =3D zalloc(2 * slen + 1);
> ++      const char *src =3D str;
> ++      char *dst =3D sanitized;
> ++
> ++      for (size_t i =3D 0; i < slen; i++) {
> ++              if (*src =3D=3D '%')
> ++                      *dst++ =3D '%';
> ++              *dst++ =3D *src++;
> ++      }
> ++      *dst =3D '\0';
> ++
> ++      return sanitized;
> ++}
> +diff --git a/test/litest-device-format-string.c b/test/litest-device-for=
mat-string.c
> +new file mode 100644
> +index 00000000..aed15db4
> +--- /dev/null
> ++++ b/test/litest-device-format-string.c
> +@@ -0,0 +1,56 @@
> ++
> ++/*
> ++ * Copyright =C2=A9 2013 Red Hat, Inc.
> ++ *
> ++ * Permission is hereby granted, free of charge, to any person obtainin=
g a
> ++ * copy of this software and associated documentation files (the "Softw=
are"),
> ++ * to deal in the Software without restriction, including without limit=
ation
> ++ * the rights to use, copy, modify, merge, publish, distribute, sublice=
nse,
> ++ * and/or sell copies of the Software, and to permit persons to whom th=
e
> ++ * Software is furnished to do so, subject to the following conditions:
> ++ *
> ++ * The above copyright notice and this permission notice (including the=
 next
> ++ * paragraph) shall be included in all copies or substantial portions o=
f the
> ++ * Software.
> ++ *
> ++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
> ++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
> ++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT S=
HALL
> ++ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR=
 OTHER
> ++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARIS=
ING
> ++ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> ++ * DEALINGS IN THE SOFTWARE.
> ++ */
> ++
> ++#include "config.h"
> ++
> ++#include "litest.h"
> ++#include "litest-int.h"
> ++
> ++static struct input_id input_id =3D {
> ++      .bustype =3D 0x3,
> ++      .vendor =3D 0x0123,
> ++      .product =3D 0x0456,
> ++};
> ++
> ++static int events[] =3D {
> ++      EV_KEY, BTN_LEFT,
> ++      EV_KEY, BTN_RIGHT,
> ++      EV_KEY, BTN_MIDDLE,
> ++      EV_REL, REL_X,
> ++      EV_REL, REL_Y,
> ++      EV_REL, REL_WHEEL,
> ++      EV_REL, REL_WHEEL_HI_RES,
> ++      -1 , -1,
> ++};
> ++
> ++TEST_DEVICE("mouse-format-string",
> ++      .type =3D LITEST_MOUSE_FORMAT_STRING,
> ++      .features =3D LITEST_RELATIVE | LITEST_BUTTON | LITEST_WHEEL,
> ++      .interface =3D NULL,
> ++
> ++      .name =3D "Evil %s %d %x Mouse %p %",
> ++      .id =3D &input_id,
> ++      .absinfo =3D NULL,
> ++      .events =3D events,
> ++)
> +diff --git a/test/litest.h b/test/litest.h
> +index 4982e516..1b1daa90 100644
> +--- a/test/litest.h
> ++++ b/test/litest.h
> +@@ -303,6 +303,7 @@
> +       LITEST_ALPS_3FG,
> +       LITEST_ELAN_TABLET,
> +       LITEST_ABSINFO_OVERRIDE,
> ++        LITEST_MOUSE_FORMAT_STRING,
> + };
> +
> + #define LITEST_DEVICELESS     -2
> +diff --git a/test/test-utils.c b/test/test-utils.c
> +index 989adecd..e80754be 100644
> +--- a/test/test-utils.c
> ++++ b/test/test-utils.c
> +@@ -1267,6 +1267,31 @@ START_TEST(strstartswith_test)
> + }
> + END_TEST
> +
> ++START_TEST(strsanitize_test)
> ++{
> ++      struct strsanitize_test {
> ++              const char *string;
> ++              const char *expected;
> ++      } tests[] =3D {
> ++              { "foobar", "foobar" },
> ++              { "", "" },
> ++              { "%", "%%" },
> ++              { "%%%%", "%%%%%%%%" },
> ++              { "x %s", "x %%s" },
> ++              { "x %", "x %%" },
> ++              { "%sx", "%%sx" },
> ++              { "%s%s", "%%s%%s" },
> ++              { NULL, NULL },
> ++      };
> ++
> ++      for (struct strsanitize_test *t =3D tests; t->string; t++) {
> ++              char *sanitized =3D str_sanitize(t->string);
> ++              ck_assert_str_eq(sanitized, t->expected);
> ++              free(sanitized);
> ++      }
> ++}
> ++END_TEST
> ++
> + START_TEST(list_test_insert)
> + {
> +       struct list_test {
> +@@ -1138,6 +1138,7 @@
> +       tcase_add_test(tc, strsplit_test);
> +       tcase_add_test(tc, kvsplit_double_test);
> +       tcase_add_test(tc, strjoin_test);
> ++      tcase_add_test(tc, strsanitize_test);
> +       tcase_add_test(tc, time_conversion);
> +
> +       tcase_add_test(tc, list_test_insert);
> +
> +--
> +GitLab
> +
> diff --git a/meta/recipes-graphics/wayland/libinput_1.15.2.bb b/meta/reci=
pes-graphics/wayland/libinput_1.15.2.bb
> index 810532774e..d7927d132a 100644
> --- a/meta/recipes-graphics/wayland/libinput_1.15.2.bb
> +++ b/meta/recipes-graphics/wayland/libinput_1.15.2.bb
> @@ -14,6 +14,7 @@ DEPENDS =3D "libevdev udev mtdev"
>
>  SRC_URI =3D "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
>             file://determinism.patch \
> +           file://CVE-2022-1215.patch \
>             "
>  SRC_URI[md5sum] =3D "eb6bd2907ad33d53954d70dfb881a643"
>  SRC_URI[sha256sum] =3D "971c3fbfb624f95c911adeb2803c372e4e3647d1b98f278f=
660051f834597747"
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165385): https://lists.openembedded.org/g/openembedde=
d-core/message/165385
> Mute This Topic: https://lists.openembedded.org/mt/90983830/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

