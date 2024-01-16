Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 499DEC47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 14:07:25 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.14831.1705414035576451995
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 06:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QjoTAIm/;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50e7f58c5fbso13306980e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 06:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705414034; x=1706018834; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mixwbxAuJxtRMhRjpWKgNx07Z6Tg1Izg/+2sGEU//kM=;
        b=QjoTAIm/VyfMAwIyfucrSFJs2+KKu8wU5Ye5lBu3/INLGrkDltG6n6P7U0zobWPwWk
         4YJeKh0lLR4ybyik6LXEhTGbC87K/Z3x4BpIsTzXLQLtLlULO6AY8PuNX/94jhrTkonK
         Mu/Yl+FCSyO2AMYItdqMTYA3VilteMpsIU181yWvMNs7uG8LKmruDrZ6Kjaxy0wrDbSK
         daNnmBsXS1wF6BLjStHeJyQYWcjoMvCyCDkSISOWxrDugG3pYp6cDNaS1jTFv4fHeJs+
         RJlA9E0F6+uLzB8N4lOE+c/QMVbkuNBXiJraP30EZHgdRUaBGywU4+SQ4bDS48gIYkgh
         7leQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705414034; x=1706018834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mixwbxAuJxtRMhRjpWKgNx07Z6Tg1Izg/+2sGEU//kM=;
        b=YGqdRMjH4E/Sdg1+AVOJcZ2buECBWA8uFxgO5/+4Y35putgptvIr6uR7sCkoUeMPaZ
         48LR9o/DmyTqQLblov3yvjCdP6P+FycgdbieGhLMeG5oa5Yj8BG8b1RencVwM9hfzGXt
         cTQG8NqfEXAIUw0AmCBrmjeFPJG31b6TLC2pbY29MdyDJt/b1fnuPRJaddtdiZKl9Gn1
         SzTJZ2YWzeZnkIA9vdzr9Gf2BiwMVglYxNPogQjSyc0AIKyty+11jd/gELDHodGtwGNW
         wU2foLBOceBzv859iC0G3zBUkJ+N8GWPoZ03M/AyfJx+SqBCAZ/LojFDOXlpJ2nCqvdh
         jwvw==
X-Gm-Message-State: AOJu0YwpFPa5S8761eoH7xs7vTWX4Y8ncuBPc+5ovpT6qKIPII7NRwY0
	RQvkxnK9bnOI8eowlK5eMAGKZOui2JZtC5l+wtw=
X-Google-Smtp-Source: AGHT+IEX08TXrv0HgcYJhlyE5R8jjMHYSJpVx2qtmEayk2mu15tVUWBGhPVNcosablOYKUBemZu7abT2NTXHNkrHuZ0=
X-Received: by 2002:ac2:599b:0:b0:50e:6ddb:551d with SMTP id
 w27-20020ac2599b000000b0050e6ddb551dmr3186717lfn.73.1705414033316; Tue, 16
 Jan 2024 06:07:13 -0800 (PST)
MIME-Version: 1.0
References: <20240115112235.185409-1-ppjadhav456@gmail.com> <CAOSpxdbjKFUC8tWDZE2MYm25acXC0ZvNzJOy+Pf5=W-sTyj8ng@mail.gmail.com>
In-Reply-To: <CAOSpxdbjKFUC8tWDZE2MYm25acXC0ZvNzJOy+Pf5=W-sTyj8ng@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Jan 2024 15:07:02 +0100
Message-ID: <CANNYZj92Cf9wcTH+8C_YbeU7fyg1Dbj09KT6tXWqg=kP7TbvLg@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] dbus: Add patches to clear cache on
 policy reload
To: Steve Sakoman <steve@sakoman.com>
Cc: Chen Qi <qi.chen@windriver.com>, openembedded-core@lists.openembedded.org, 
	bindu.bhabu@kpit.com, akash.hadke@kpit.com, 
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>, Poonam Jadhav <ppjadhav456@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 14:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193862

FWIW to me this looks like an outcome of specific product
requirements, and not something that would be generally useful in
dunfell. If these are backported, then why not every other bugfix that
accumulated in dbus repo over the past 4-ish years?

Alex

On Tue, 16 Jan 2024 at 14:58, Steve Sakoman <steve@sakoman.com> wrote:
>
> Adding Chen Qi (dbus maintainer).  Does this look OK to you?
>
> Steve
>
> On Mon, Jan 15, 2024 at 1:23=E2=80=AFAM Poonam Jadhav <ppjadhav456@gmail.=
com> wrote:
> >
> > See discussion at https://marc.info/?l=3Dselinux&m=3D152173501930182&w=
=3D2
> > Link: https://gitlab.freedesktop.org/dbus/dbus/-/merge_requests/31
> >
> > Support patches added:
> > 1. "Add-_dbus_clear_loop-and-_dbus_clear_watch.patch"
> >    Where '_dbus_clear_loop' and '_dbus_clear_watch'
> >    functions are available.
> > 2. "Add-utility-functions-to-emit-TAP-diagnostics-and-fa.patch"
> >    Where 'dbus/dbus-test-tap.h' header file is available
> >
> > Patches to resolve issue as provided in above link:
> > 3. "Stop-using-avc_init-which-is-deprecated.patch"
> >    To stop using avc_init() which is deprecated and use avc_open()
> >    instead.With this commit dbus-daemon will stop using a thread
> >    to monitor the avc netlink and will poll it instead.
> > 4. "Use-SELINUX_CB_POLICYLOAD-instead-of-AVC_CALLBACK_RE"
> >     Use SELINUX_CB_POLICYLOAD instead of AVC_CALLBACK_RESET callback
> >     as this only seems necessary on policy reload and not if the
> >     enforcing mode is changing.
> >
> > Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > Signed-off-by: Bhabu Bindu <bindu.bhabu@kpit.com>
> > ---
> >  meta/recipes-core/dbus/dbus.inc               |   4 +
> >  ...bus_clear_loop-and-_dbus_clear_watch.patch |  56 +++
> >  ...tions-to-emit-TAP-diagnostics-and-fa.patch | 192 ++++++++
> >  ...p-using-avc_init-which-is-deprecated.patch | 439 ++++++++++++++++++
> >  ...OLICYLOAD-instead-of-AVC_CALLBACK_RE.patch |  63 +++
> >  5 files changed, 754 insertions(+)
> >  create mode 100644 meta/recipes-core/dbus/dbus/0001-Add-_dbus_clear_lo=
op-and-_dbus_clear_watch.patch
> >  create mode 100644 meta/recipes-core/dbus/dbus/0001-Add-utility-functi=
ons-to-emit-TAP-diagnostics-and-fa.patch
> >  create mode 100644 meta/recipes-core/dbus/dbus/0001-Stop-using-avc_ini=
t-which-is-deprecated.patch
> >  create mode 100644 meta/recipes-core/dbus/dbus/0002-Use-SELINUX_CB_POL=
ICYLOAD-instead-of-AVC_CALLBACK_RE.patch
> >
> > diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/d=
bus.inc
> > index 9b5cc53d92..12be2c0ea6 100644
> > --- a/meta/recipes-core/dbus/dbus.inc
> > +++ b/meta/recipes-core/dbus/dbus.inc
> > @@ -9,6 +9,10 @@ SRC_URI =3D "https://dbus.freedesktop.org/releases/dbu=
s/dbus-${PV}.tar.gz \
> >             file://dbus-1.init \
> >             file://clear-guid_from_server-if-send_negotiate_unix_f.patc=
h \
> >             file://CVE-2023-34969.patch \
> > +           file://0001-Add-utility-functions-to-emit-TAP-diagnostics-a=
nd-fa.patch \
> > +           file://0001-Add-_dbus_clear_loop-and-_dbus_clear_watch.patc=
h \
> > +           file://0001-Stop-using-avc_init-which-is-deprecated.patch \
> > +           file://0002-Use-SELINUX_CB_POLICYLOAD-instead-of-AVC_CALLBA=
CK_RE.patch \
> >  "
> >
> >  SRC_URI[sha256sum] =3D "bc42d196c1756ac520d61bf3ccd6f42013617def45dd1e=
591a6091abf51dca38"
> > diff --git a/meta/recipes-core/dbus/dbus/0001-Add-_dbus_clear_loop-and-=
_dbus_clear_watch.patch b/meta/recipes-core/dbus/dbus/0001-Add-_dbus_clear_=
loop-and-_dbus_clear_watch.patch
> > new file mode 100644
> > index 0000000000..f684f2a1f9
> > --- /dev/null
> > +++ b/meta/recipes-core/dbus/dbus/0001-Add-_dbus_clear_loop-and-_dbus_c=
lear_watch.patch
> > @@ -0,0 +1,56 @@
> > +From 8a4e07925c54eac83878c39313f44fe87d6c3538 Mon Sep 17 00:00:00 2001
> > +From: Laurent Bigonville <bigon@bigon.be>
> > +Date: Mon, 5 Mar 2018 22:30:44 +0100
> > +Subject: [PATCH] Add _dbus_clear_loop and _dbus_clear_watch
> > +
> > +Bug: https://bugs.freedesktop.org/show_bug.cgi?id=3D92831
> > +[smcv: Fix variable names]
> > +Reviewed-by: Simon McVittie <smcv@collabora.com>
> > +
> > +Upstream-Status: Backport [https://gitlab.freedesktop.org/dbus/dbus/-/=
commit/8a4e07925c54eac83878c39313f44fe87d6c3538]
> > +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > +
> > +---
> > + dbus/dbus-mainloop.h | 7 +++++++
> > + dbus/dbus-watch.h    | 7 +++++++
> > + 2 files changed, 14 insertions(+)
> > +
> > +diff --git a/dbus/dbus-mainloop.h b/dbus/dbus-mainloop.h
> > +index a76cb6f0..19a7c0d5 100644
> > +--- a/dbus/dbus-mainloop.h
> > ++++ b/dbus/dbus-mainloop.h
> > +@@ -60,6 +60,13 @@ dbus_bool_t _dbus_loop_dispatch       (DBusLoop    =
        *loop);
> > + int  _dbus_get_oom_wait    (void);
> > + void _dbus_wait_for_memory (void);
> > +
> > ++static inline void
> > ++_dbus_clear_loop (DBusLoop **pointer_to_loop)
> > ++{
> > ++  _dbus_clear_pointer_impl (DBusLoop, pointer_to_loop,
> > ++                            _dbus_loop_unref);
> > ++}
> > ++
> > + #endif /* !DOXYGEN_SHOULD_SKIP_THIS */
> > +
> > + #endif /* DBUS_MAINLOOP_H */
> > +diff --git a/dbus/dbus-watch.h b/dbus/dbus-watch.h
> > +index 8d8bbf2b..05d9b20e 100644
> > +--- a/dbus/dbus-watch.h
> > ++++ b/dbus/dbus-watch.h
> > +@@ -99,6 +99,13 @@ DBusSocket     _dbus_watch_get_socket         (DBus=
Watch               *watch);
> > + DBUS_PRIVATE_EXPORT
> > + DBusPollable   _dbus_watch_get_pollable       (DBusWatch             =
  *watch);
> > +
> > ++static inline void
> > ++_dbus_clear_watch (DBusWatch **pointer_to_watch)
> > ++{
> > ++  _dbus_clear_pointer_impl (DBusWatch, pointer_to_watch,
> > ++                            _dbus_watch_unref);
> > ++}
> > ++
> > + /** @} */
> > +
> > + DBUS_END_DECLS
> > +--
> > +2.17.1
> > +
> > diff --git a/meta/recipes-core/dbus/dbus/0001-Add-utility-functions-to-=
emit-TAP-diagnostics-and-fa.patch b/meta/recipes-core/dbus/dbus/0001-Add-ut=
ility-functions-to-emit-TAP-diagnostics-and-fa.patch
> > new file mode 100644
> > index 0000000000..12e8d3752c
> > --- /dev/null
> > +++ b/meta/recipes-core/dbus/dbus/0001-Add-utility-functions-to-emit-TA=
P-diagnostics-and-fa.patch
> > @@ -0,0 +1,192 @@
> > +From 5ffb709b42783b0d13a49b8c9a84c75f556c88a2 Mon Sep 17 00:00:00 2001
> > +From: Simon McVittie <smcv@collabora.com>
> > +Date: Tue, 14 Nov 2017 14:01:56 +0000
> > +Subject: [PATCH] Add utility functions to emit TAP diagnostics and fat=
al
> > + errors
> > +
> > +Reviewed-by: Philip Withnall <withnall@endlessm.com>
> > +[smcv: Add an explanatory comment as suggested]
> > +Signed-off-by: Simon McVittie <smcv@collabora.com>
> > +Bug: https://bugs.freedesktop.org/show_bug.cgi?id=3D103601
> > +
> > +Upstream-Status: Backport [https://gitlab.freedesktop.org/dbus/dbus/-/=
commit/5ffb709b42783b0d13a49b8c9a84c75f556c88a2]
> > +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > +
> > +---
> > + cmake/dbus/CMakeLists.txt |  2 +
> > + dbus/Makefile.am          |  2 +
> > + dbus/dbus-test-tap.c      | 77 ++++++++++++++++++++++++++++++++++++++=
+
> > + dbus/dbus-test-tap.h      | 44 ++++++++++++++++++++++
> > + 4 files changed, 125 insertions(+)
> > + create mode 100644 dbus/dbus-test-tap.c
> > + create mode 100644 dbus/dbus-test-tap.h
> > +
> > +diff --git a/cmake/dbus/CMakeLists.txt b/cmake/dbus/CMakeLists.txt
> > +index 8a01d918..2fdd1128 100644
> > +--- a/cmake/dbus/CMakeLists.txt
> > ++++ b/cmake/dbus/CMakeLists.txt
> > +@@ -127,6 +127,7 @@ set (DBUS_SHARED_SOURCES
> > +       ${DBUS_DIR}/dbus-string.c
> > +       ${DBUS_DIR}/dbus-sysdeps.c
> > +       ${DBUS_DIR}/dbus-pipe.c
> > ++      ${DBUS_DIR}/dbus-test-tap.c
> > + )
> > +
> > + set (DBUS_SHARED_HEADERS
> > +@@ -141,6 +142,7 @@ set (DBUS_SHARED_HEADERS
> > +       ${DBUS_DIR}/dbus-string-private.h
> > +       ${DBUS_DIR}/dbus-pipe.h
> > +       ${DBUS_DIR}/dbus-sysdeps.h
> > ++      ${DBUS_DIR}/dbus-test-tap.h
> > + )
> > +
> > + ### source code that is generic utility functionality used
> > +diff --git a/dbus/Makefile.am b/dbus/Makefile.am
> > +index b2913ef0..d4fe09f8 100644
> > +--- a/dbus/Makefile.am
> > ++++ b/dbus/Makefile.am
> > +@@ -231,6 +231,8 @@ DBUS_SHARED_SOURCES=3D                            =
   \
> > +       $(DBUS_SHARED_arch_sources)             \
> > +       dbus-sysdeps.c                          \
> > +       dbus-sysdeps.h                          \
> > ++      dbus-test-tap.c                         \
> > ++      dbus-test-tap.h                         \
> > +       dbus-valgrind-internal.h
> > +
> > + ### source code that is generic utility functionality used
> > +diff --git a/dbus/dbus-test-tap.c b/dbus/dbus-test-tap.c
> > +new file mode 100644
> > +index 00000000..a6f99b54
> > +--- /dev/null
> > ++++ b/dbus/dbus-test-tap.c
> > +@@ -0,0 +1,77 @@
> > ++/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
> > ++/* dbus-test-tap =E2=80=94 TAP helpers for "embedded tests"
> > ++ *
> > ++ * Copyright =C2=A9 2017 Collabora Ltd.
> > ++ *
> > ++ * Permission is hereby granted, free of charge, to any person
> > ++ * obtaining a copy of this software and associated documentation fil=
es
> > ++ * (the "Software"), to deal in the Software without restriction,
> > ++ * including without limitation the rights to use, copy, modify, merg=
e,
> > ++ * publish, distribute, sublicense, and/or sell copies of the Softwar=
e,
> > ++ * and to permit persons to whom the Software is furnished to do so,
> > ++ * subject to the following conditions:
> > ++ *
> > ++ * The above copyright notice and this permission notice shall be
> > ++ * included in all copies or substantial portions of the Software.
> > ++ *
> > ++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > ++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > ++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > ++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDER=
S
> > ++ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> > ++ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> > ++ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> > ++ * SOFTWARE.
> > ++ */
> > ++
> > ++#include <config.h>
> > ++#include "dbus/dbus-test-tap.h"
> > ++
> > ++/*
> > ++ * TAP, the Test Anything Protocol, is a text-based syntax for test-c=
ases
> > ++ * to report results to test harnesses.
> > ++ *
> > ++ * See <http://testanything.org/> for details of the syntax, which
> > ++ * will not be explained here.
> > ++ */
> > ++
> > ++#ifdef DBUS_ENABLE_EMBEDDED_TESTS
> > ++
> > ++#include <stdio.h>
> > ++#include <stdlib.h>
> > ++
> > ++/*
> > ++ * Output TAP indicating a fatal error, and exit unsuccessfully.
> > ++ */
> > ++void
> > ++_dbus_test_fatal (const char *format,
> > ++    ...)
> > ++{
> > ++  va_list ap;
> > ++
> > ++  printf ("Bail out! ");
> > ++  va_start (ap, format);
> > ++  vprintf (format, ap);
> > ++  va_end (ap);
> > ++  printf ("\n");
> > ++  fflush (stdout);
> > ++  exit (1);
> > ++}
> > ++
> > ++/*
> > ++ * Output TAP indicating a diagnostic (informational message).
> > ++ */
> > ++void
> > ++_dbus_test_diag (const char *format,
> > ++    ...)
> > ++{
> > ++  va_list ap;
> > ++
> > ++  printf ("# ");
> > ++  va_start (ap, format);
> > ++  vprintf (format, ap);
> > ++  va_end (ap);
> > ++  printf ("\n");
> > ++}
> > ++
> > ++#endif
> > +diff --git a/dbus/dbus-test-tap.h b/dbus/dbus-test-tap.h
> > +new file mode 100644
> > +index 00000000..706475bd
> > +--- /dev/null
> > ++++ b/dbus/dbus-test-tap.h
> > +@@ -0,0 +1,44 @@
> > ++/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
> > ++/* dbus-test-tap =E2=80=94 TAP helpers for "embedded tests"
> > ++ *
> > ++ * Copyright =C2=A9 2017 Collabora Ltd.
> > ++ *
> > ++ * Permission is hereby granted, free of charge, to any person
> > ++ * obtaining a copy of this software and associated documentation fil=
es
> > ++ * (the "Software"), to deal in the Software without restriction,
> > ++ * including without limitation the rights to use, copy, modify, merg=
e,
> > ++ * publish, distribute, sublicense, and/or sell copies of the Softwar=
e,
> > ++ * and to permit persons to whom the Software is furnished to do so,
> > ++ * subject to the following conditions:
> > ++ *
> > ++ * The above copyright notice and this permission notice shall be
> > ++ * included in all copies or substantial portions of the Software.
> > ++ *
> > ++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > ++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > ++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > ++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDER=
S
> > ++ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> > ++ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> > ++ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> > ++ * SOFTWARE.
> > ++ */
> > ++
> > ++#ifndef DBUS_TEST_TAP_H
> > ++#define DBUS_TEST_TAP_H
> > ++
> > ++#include <dbus/dbus-internals.h>
> > ++
> > ++#ifdef DBUS_ENABLE_EMBEDDED_TESTS
> > ++
> > ++DBUS_PRIVATE_EXPORT
> > ++void _dbus_test_fatal (const char *format,
> > ++    ...) _DBUS_GNUC_NORETURN _DBUS_GNUC_PRINTF (1, 2);
> > ++
> > ++DBUS_PRIVATE_EXPORT
> > ++void _dbus_test_diag (const char *format,
> > ++    ...) _DBUS_GNUC_PRINTF (1, 2);
> > ++
> > ++#endif
> > ++
> > ++#endif
> > +--
> > +2.17.1
> > +
> > diff --git a/meta/recipes-core/dbus/dbus/0001-Stop-using-avc_init-which=
-is-deprecated.patch b/meta/recipes-core/dbus/dbus/0001-Stop-using-avc_init=
-which-is-deprecated.patch
> > new file mode 100644
> > index 0000000000..c1e1de37b8
> > --- /dev/null
> > +++ b/meta/recipes-core/dbus/dbus/0001-Stop-using-avc_init-which-is-dep=
recated.patch
> > @@ -0,0 +1,439 @@
> > +From 67f7bdf8c2e1df01781a117511517e55292f80c0 Mon Sep 17 00:00:00 2001
> > +From: Laurent Bigonville <bigon@bigon.be>
> > +Date: Sat, 3 Mar 2018 13:15:17 +0100
> > +Subject: [PATCH 1/2] Stop using avc_init() which is deprecated
> > +
> > +Stop using avc_init() and use avc_open() instead. With this commit
> > +dbus-daemon will stop using a thread to monitor the avc netlink and wi=
ll
> > +poll it instead.
> > +
> > +https://gitlab.freedesktop.org/dbus/dbus/issues/134
> > +
> > +Upstream-Status: Backport [https://gitlab.freedesktop.org/dbus/dbus/-/=
commit/67f7bdf8c2e1df01781a117511517e55292f80c0]
> > +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > +
> > +---
> > + bus/bus.c       |  15 ++--
> > + bus/selinux.c   | 219 ++++++++++++++++++++++++-----------------------=
-
> > + bus/selinux.h   |   2 +-
> > + bus/test-main.c |   6 --
> > + bus/test.c      |   9 ++
> > + 5 files changed, 128 insertions(+), 123 deletions(-)
> > +
> > +diff --git a/bus/bus.c b/bus/bus.c
> > +index 22b7d0b8..ca48b4bb 100644
> > +--- a/bus/bus.c
> > ++++ b/bus/bus.c
> > +@@ -995,12 +995,10 @@ bus_context_new (const DBusString *config_file,
> > +    */
> > +   bus_audit_init (context);
> > +
> > +-  if (!bus_selinux_full_init ())
> > ++  if (!bus_selinux_full_init (context, error))
> > +     {
> > +-      bus_context_log (context, DBUS_SYSTEM_LOG_ERROR,
> > +-                       "SELinux enabled but D-Bus initialization fail=
ed; "
> > +-                       "check system log");
> > +-      exit (1);
> > ++      _DBUS_ASSERT_ERROR_IS_SET (error);
> > ++      goto failed;
> > +     }
> > +
> > +   if (!bus_apparmor_full_init (error))
> > +@@ -1009,6 +1007,13 @@ bus_context_new (const DBusString *config_file,
> > +       goto failed;
> > +     }
> > +
> > ++  if (bus_selinux_enabled ())
> > ++    {
> > ++      if (context->syslog)
> > ++        bus_context_log (context, DBUS_SYSTEM_LOG_INFO,
> > ++                         "SELinux support is enabled\n");
> > ++    }
> > ++
> > +   if (bus_apparmor_enabled ())
> > +     {
> > +       /* Only print AppArmor mediation message when syslog support is=
 enabled */
> > +diff --git a/bus/selinux.c b/bus/selinux.c
> > +index d09afb4b..c764794c 100644
> > +--- a/bus/selinux.c
> > ++++ b/bus/selinux.c
> > +@@ -49,6 +49,7 @@
> > + #include <stdarg.h>
> > + #include <stdio.h>
> > + #include <grp.h>
> > ++#include <dbus/dbus-watch.h>
> > + #endif /* HAVE_SELINUX */
> > + #ifdef HAVE_LIBAUDIT
> > + #include <libaudit.h>
> > +@@ -64,45 +65,20 @@ static dbus_bool_t selinux_enabled =3D FALSE;
> > + /* Store an avc_entry_ref to speed AVC decisions. */
> > + static struct avc_entry_ref aeref;
> > +
> > ++/* Store the avc netlink fd. */
> > ++static int avc_netlink_fd =3D -1;
> > ++
> > ++/* Watch to listen for SELinux status changes via netlink. */
> > ++static DBusWatch *avc_netlink_watch_obj =3D NULL;
> > ++static DBusLoop *avc_netlink_loop_obj =3D NULL;
> > ++
> > + /* Store the SID of the bus itself to use as the default. */
> > + static security_id_t bus_sid =3D SECSID_WILD;
> > +
> > +-/* Thread to listen for SELinux status changes via netlink. */
> > +-static pthread_t avc_notify_thread;
> > +-
> > + /* Prototypes for AVC callback functions.  */
> > +-static void log_callback (const char *fmt, ...) _DBUS_GNUC_PRINTF (1,=
 2);
> > +-static void log_audit_callback (void *data, security_class_t class, c=
har *buf, size_t bufleft);
> > +-static void *avc_create_thread (void (*run) (void));
> > +-static void avc_stop_thread (void *thread);
> > +-static void *avc_alloc_lock (void);
> > +-static void avc_get_lock (void *lock);
> > +-static void avc_release_lock (void *lock);
> > +-static void avc_free_lock (void *lock);
> > +-
> > +-/* AVC callback structures for use in avc_init.  */
> > +-static const struct avc_memory_callback mem_cb =3D
> > +-{
> > +-  .func_malloc =3D dbus_malloc,
> > +-  .func_free =3D dbus_free
> > +-};
> > +-static const struct avc_log_callback log_cb =3D
> > +-{
> > +-  .func_log =3D log_callback,
> > +-  .func_audit =3D log_audit_callback
> > +-};
> > +-static const struct avc_thread_callback thread_cb =3D
> > +-{
> > +-  .func_create_thread =3D avc_create_thread,
> > +-  .func_stop_thread =3D avc_stop_thread
> > +-};
> > +-static const struct avc_lock_callback lock_cb =3D
> > +-{
> > +-  .func_alloc_lock =3D avc_alloc_lock,
> > +-  .func_get_lock =3D avc_get_lock,
> > +-  .func_release_lock =3D avc_release_lock,
> > +-  .func_free_lock =3D avc_free_lock
> > +-};
> > ++static int log_callback (int type, const char *fmt, ...) _DBUS_GNUC_P=
RINTF (2, 3);
> > ++static int log_audit_callback (void *data, security_class_t class, ch=
ar *buf, size_t bufleft);
> > ++
> > + #endif /* HAVE_SELINUX */
> > +
> > + /**
> > +@@ -115,8 +91,8 @@ static const struct avc_lock_callback lock_cb =3D
> > +  */
> > + #ifdef HAVE_SELINUX
> > +
> > +-static void
> > +-log_callback (const char *fmt, ...)
> > ++static int
> > ++log_callback (int type, const char *fmt, ...)
> > + {
> > +   va_list ap;
> > + #ifdef HAVE_LIBAUDIT
> > +@@ -150,6 +126,8 @@ log_callback (const char *fmt, ...)
> > + out:
> > + #endif
> > +   va_end(ap);
> > ++
> > ++  return 0;
> > + }
> > +
> > + /**
> > +@@ -170,7 +148,7 @@ policy_reload_callback (u_int32_t event, security_=
id_t ssid,
> > + /**
> > +  * Log any auxiliary data
> > +  */
> > +-static void
> > ++static int
> > + log_audit_callback (void *data, security_class_t class, char *buf, si=
ze_t bufleft)
> > + {
> > +   DBusString *audmsg =3D data;
> > +@@ -188,73 +166,20 @@ log_audit_callback (void *data, security_class_t=
 class, char *buf, size_t buflef
> > +       if (bufleft > (size_t) _dbus_string_get_length(&s))
> > +         _dbus_string_copy_to_buffer_with_nul (&s, buf, bufleft);
> > +     }
> > +-}
> > +-
> > +-/**
> > +- * Create thread to notify the AVC of enforcing and policy reload
> > +- * changes via netlink.
> > +- *
> > +- * @param run the thread run function
> > +- * @return pointer to the thread
> > +- */
> > +-static void *
> > +-avc_create_thread (void (*run) (void))
> > +-{
> > +-  int rc;
> > +-
> > +-  rc =3D pthread_create (&avc_notify_thread, NULL, (void *(*) (void *=
)) run, NULL);
> > +-  if (rc !=3D 0)
> > +-    {
> > +-      _dbus_warn ("Failed to start AVC thread: %s", _dbus_strerror (r=
c));
> > +-      exit (1);
> > +-    }
> > +-  return &avc_notify_thread;
> > +-}
> > +
> > +-/* Stop AVC netlink thread.  */
> > +-static void
> > +-avc_stop_thread (void *thread)
> > +-{
> > +-  pthread_cancel (*(pthread_t *) thread);
> > ++  return 0;
> > + }
> > +
> > +-/* Allocate a new AVC lock.  */
> > +-static void *
> > +-avc_alloc_lock (void)
> > ++static dbus_bool_t
> > ++handle_avc_netlink_watch (DBusWatch *passed_watch, unsigned int flags=
, void *data)
> > + {
> > +-  pthread_mutex_t *avc_mutex;
> > +-
> > +-  avc_mutex =3D dbus_new (pthread_mutex_t, 1);
> > +-  if (avc_mutex =3D=3D NULL)
> > ++  if (avc_netlink_check_nb () < 0)
> > +     {
> > +-      _dbus_warn ("Could not create mutex: %s", _dbus_strerror (errno=
));
> > +-      exit (1);
> > ++      _dbus_warn ("Failed to check the netlink socket for pending mes=
sages and process them: %s", _dbus_strerror (errno));
> > ++      return FALSE;
> > +     }
> > +-  pthread_mutex_init (avc_mutex, NULL);
> > +-
> > +-  return avc_mutex;
> > +-}
> > +-
> > +-/* Acquire an AVC lock.  */
> > +-static void
> > +-avc_get_lock (void *lock)
> > +-{
> > +-  pthread_mutex_lock (lock);
> > +-}
> > +
> > +-/* Release an AVC lock.  */
> > +-static void
> > +-avc_release_lock (void *lock)
> > +-{
> > +-  pthread_mutex_unlock (lock);
> > +-}
> > +-
> > +-/* Free an AVC lock.  */
> > +-static void
> > +-avc_free_lock (void *lock)
> > +-{
> > +-  pthread_mutex_destroy (lock);
> > +-  dbus_free (lock);
> > ++  return TRUE;
> > + }
> > + #endif /* HAVE_SELINUX */
> > +
> > +@@ -335,7 +260,7 @@ static struct security_class_mapping dbus_map[] =
=3D {
> > +  * logging callbacks.
> > +  */
> > + dbus_bool_t
> > +-bus_selinux_full_init (void)
> > ++bus_selinux_full_init (BusContext *context, DBusError *error)
> > + {
> > + #ifdef HAVE_SELINUX
> > +   char *bus_context;
> > +@@ -358,9 +283,11 @@ bus_selinux_full_init (void)
> > +     }
> > +
> > +   avc_entry_ref_init (&aeref);
> > +-  if (avc_init ("avc", &mem_cb, &log_cb, &thread_cb, &lock_cb) < 0)
> > ++  if (avc_open (NULL, 0) < 0)
> > +     {
> > +-      _dbus_warn ("Failed to start Access Vector Cache (AVC).");
> > ++      dbus_set_error (error, DBUS_ERROR_FAILED,
> > ++                      "Failed to start Access Vector Cache (AVC): %s"=
,
> > ++                      _dbus_strerror (errno));
> > +       return FALSE;
> > +     }
> > +   else
> > +@@ -368,34 +295,90 @@ bus_selinux_full_init (void)
> > +       _dbus_verbose ("Access Vector Cache (AVC) started.\n");
> > +     }
> > +
> > ++  avc_netlink_fd =3D avc_netlink_acquire_fd ();
> > ++  if (avc_netlink_fd < 0)
> > ++    {
> > ++       dbus_set_error (error, DBUS_ERROR_FAILED,
> > ++                      "Cannot acquire AVC netlink fd: %s",
> > ++                      _dbus_strerror (errno));
> > ++       goto error;
> > ++    }
> > ++
> > ++  _dbus_fd_set_close_on_exec (avc_netlink_fd);
> > ++
> > ++  avc_netlink_loop_obj =3D bus_context_get_loop (context);
> > ++  /* avc_netlink_loop_obj is a global variable */
> > ++  _dbus_loop_ref (avc_netlink_loop_obj);
> > ++
> > ++  avc_netlink_watch_obj =3D _dbus_watch_new (avc_netlink_fd, DBUS_WAT=
CH_READABLE, TRUE,
> > ++                                           handle_avc_netlink_watch, =
NULL, NULL);
> > ++  if (avc_netlink_watch_obj =3D=3D NULL)
> > ++    {
> > ++      BUS_SET_OOM (error);
> > ++      goto error;
> > ++    }
> > ++
> > ++  if (!_dbus_loop_add_watch (avc_netlink_loop_obj, avc_netlink_watch_=
obj))
> > ++    {
> > ++      _dbus_watch_invalidate (avc_netlink_watch_obj);
> > ++      _dbus_clear_watch (&avc_netlink_watch_obj);
> > ++      avc_netlink_watch_obj =3D NULL;
> > ++      BUS_SET_OOM (error);
> > ++      goto error;
> > ++    }
> > ++
> > +   if (avc_add_callback (policy_reload_callback, AVC_CALLBACK_RESET,
> > +                        NULL, NULL, 0, 0) < 0)
> > +     {
> > +-      _dbus_warn ("Failed to add policy reload callback: %s",
> > +-                  _dbus_strerror (errno));
> > +-      avc_destroy ();
> > +-      return FALSE;
> > ++      dbus_set_error (error, DBUS_ERROR_FAILED,
> > ++                      "Failed to add policy reload callback: %s",
> > ++                      _dbus_strerror (errno));
> > ++      goto error;
> > +     }
> > +
> > ++  selinux_set_callback (SELINUX_CB_AUDIT, (union selinux_callback) lo=
g_audit_callback);
> > ++  selinux_set_callback (SELINUX_CB_LOG, (union selinux_callback) log_=
callback);
> > ++
> > +   bus_context =3D NULL;
> > +   bus_sid =3D SECSID_WILD;
> > +
> > +   if (getcon (&bus_context) < 0)
> > +     {
> > +-      _dbus_verbose ("Error getting context of bus: %s\n",
> > +-                     _dbus_strerror (errno));
> > +-      return FALSE;
> > ++      dbus_set_error (error, DBUS_ERROR_FAILED,
> > ++                      "Error getting context of bus: %s",
> > ++                      _dbus_strerror (errno));
> > ++      goto error;
> > +     }
> > +
> > +   if (avc_context_to_sid (bus_context, &bus_sid) < 0)
> > +     {
> > +-      _dbus_verbose ("Error getting SID from bus context: %s\n",
> > +-                     _dbus_strerror (errno));
> > ++      dbus_set_error (error, DBUS_ERROR_FAILED,
> > ++                      "Error getting SID from bus context: %s",
> > ++                      _dbus_strerror (errno));
> > +       freecon (bus_context);
> > +-      return FALSE;
> > ++      goto error;
> > +     }
> > +
> > +   freecon (bus_context);
> > ++
> > ++  return TRUE;
> > ++
> > ++error:
> > ++  if (avc_netlink_watch_obj)
> > ++    {
> > ++      _dbus_loop_remove_watch (avc_netlink_loop_obj, avc_netlink_watc=
h_obj);
> > ++      _dbus_watch_invalidate (avc_netlink_watch_obj);
> > ++      _dbus_clear_watch (&avc_netlink_watch_obj);
> > ++    }
> > ++  _dbus_clear_loop (&avc_netlink_loop_obj);
> > ++  if (avc_netlink_fd >=3D 0)
> > ++    {
> > ++      avc_netlink_release_fd ();
> > ++      avc_netlink_fd =3D -1;
> > ++    }
> > ++  avc_destroy ();
> > ++  _DBUS_ASSERT_ERROR_IS_SET (error);
> > ++  return FALSE;
> > +
> > + #endif /* HAVE_SELINUX */
> > +   return TRUE;
> > +@@ -976,6 +959,20 @@ bus_selinux_shutdown (void)
> > +
> > +   _dbus_verbose ("AVC shutdown\n");
> > +
> > ++  if (avc_netlink_watch_obj)
> > ++    {
> > ++      _dbus_loop_remove_watch (avc_netlink_loop_obj, avc_netlink_watc=
h_obj);
> > ++      _dbus_watch_invalidate (avc_netlink_watch_obj);
> > ++      _dbus_clear_watch (&avc_netlink_watch_obj);
> > ++    }
> > ++  _dbus_clear_loop (&avc_netlink_loop_obj);
> > ++
> > ++  if (avc_netlink_fd >=3D 0)
> > ++    {
> > ++      avc_netlink_release_fd ();
> > ++      avc_netlink_fd =3D -1;
> > ++    }
> > ++
> > +   if (bus_sid !=3D SECSID_WILD)
> > +     {
> > +       bus_sid =3D SECSID_WILD;
> > +diff --git a/bus/selinux.h b/bus/selinux.h
> > +index a0383cdd..53de1a84 100644
> > +--- a/bus/selinux.h
> > ++++ b/bus/selinux.h
> > +@@ -28,7 +28,7 @@
> > + #include "services.h"
> > +
> > + dbus_bool_t bus_selinux_pre_init (void);
> > +-dbus_bool_t bus_selinux_full_init(void);
> > ++dbus_bool_t bus_selinux_full_init(BusContext *context, DBusError *err=
or);
> > + void        bus_selinux_shutdown (void);
> > +
> > + dbus_bool_t bus_selinux_enabled  (void);
> > +diff --git a/bus/test-main.c b/bus/test-main.c
> > +index 400ea423..ba73a1b4 100644
> > +--- a/bus/test-main.c
> > ++++ b/bus/test-main.c
> > +@@ -67,12 +67,6 @@ static DBusInitialFDs *initial_fds =3D NUL
> > + static void
> > + test_pre_hook (void)
> > + {
> > +-
> > +-  if (_dbus_getenv ("DBUS_TEST_SELINUX")
> > +-      && (!bus_selinux_pre_init ()
> > +-        || !bus_selinux_full_init ()))
> > +-    die ("could not init selinux support");
> > +-
> > +   initial_fds =3D _dbus_check_fdleaks_enter ();
> > + }
> > +
> > +diff --git a/bus/test.c b/bus/test.c
> > +index 76960a30..730cd64a 100644
> > +--- a/bus/test.c
> > ++++ b/bus/test.c
> > +@@ -28,6 +28,8 @@
> > + #include <dbus/dbus-internals.h>
> > + #include <dbus/dbus-list.h>
> > + #include <dbus/dbus-sysdeps.h>
> > ++#include <dbus/dbus-test-tap.h>
> > ++#include "selinux.h"
> > +
> > + /* The "debug client" watch/timeout handlers don't dispatch messages,
> > +  * as we manually pull them in order to verify them. This is why they
> > +@@ -307,6 +309,13 @@ bus_context_new_test (const DBusString *test_data=
_dir,
> > +       return NULL;
> > +     }
> > +
> > ++    if (_dbus_getenv ("DBUS_TEST_SELINUX")
> > ++      && (!bus_selinux_pre_init ()
> > ++        || !bus_selinux_full_init (context, &error)))
> > ++    _dbus_test_fatal ("Could not init selinux support");
> > ++
> > ++  dbus_error_free (&error);
> > ++
> > +   _dbus_string_free (&config_file);
> > +
> > +   return context;
> > +--
> > +2.17.1
> > +
> > diff --git a/meta/recipes-core/dbus/dbus/0002-Use-SELINUX_CB_POLICYLOAD=
-instead-of-AVC_CALLBACK_RE.patch b/meta/recipes-core/dbus/dbus/0002-Use-SE=
LINUX_CB_POLICYLOAD-instead-of-AVC_CALLBACK_RE.patch
> > new file mode 100644
> > index 0000000000..3c7421ddae
> > --- /dev/null
> > +++ b/meta/recipes-core/dbus/dbus/0002-Use-SELINUX_CB_POLICYLOAD-instea=
d-of-AVC_CALLBACK_RE.patch
> > @@ -0,0 +1,63 @@
> > +From a442601cb2e14f6ff3111fe5a86ebdf4d0dee436 Mon Sep 17 00:00:00 2001
> > +From: Laurent Bigonville <bigon@bigon.be>
> > +Date: Wed, 30 May 2018 18:18:15 +0200
> > +Subject: [PATCH 2/2] Use SELINUX_CB_POLICYLOAD instead of AVC_CALLBACK=
_RESET
> > + callback
> > +
> > +Use SELINUX_CB_POLICYLOAD instead of AVC_CALLBACK_RESET callback as th=
is
> > +only seems necessary on policy reload and not if the enforcing mode is
> > +changing.
> > +
> > +See discussion at https://marc.info/?l=3Dselinux&m=3D152173501930182&w=
=3D2
> > +
> > +https://gitlab.freedesktop.org/dbus/dbus/issues/134
> > +
> > +Upstream-Status: Backport [https://gitlab.freedesktop.org/dbus/dbus/-/=
commit/a442601cb2e14f6ff3111fe5a86ebdf4d0dee436]
> > +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> > +
> > +---
> > + bus/selinux.c | 20 ++++----------------
> > + 1 file changed, 4 insertions(+), 16 deletions(-)
> > +
> > +diff --git a/bus/selinux.c b/bus/selinux.c
> > +index c764794c..52cb9866 100644
> > +--- a/bus/selinux.c
> > ++++ b/bus/selinux.c
> > +@@ -135,14 +135,10 @@ out:
> > +  * this could have changed.  Send a SIGHUP to reload all configs.
> > +  */
> > + static int
> > +-policy_reload_callback (u_int32_t event, security_id_t ssid,
> > +-                        security_id_t tsid, security_class_t tclass,
> > +-                        access_vector_t perms, access_vector_t *out_r=
etained)
> > ++policy_reload_callback (int seqno)
> > + {
> > +-  if (event =3D=3D AVC_CALLBACK_RESET)
> > +-    return raise (SIGHUP);
> > +-
> > +-  return 0;
> > ++  _dbus_verbose ("SELinux policy reload callback called, sending SIGH=
UP\n");
> > ++  return raise (SIGHUP);
> > + }
> > +
> > + /**
> > +@@ -327,15 +323,7 @@ bus_selinux_full_init (BusContext *context, DBusE=
rror *error)
> > +       goto error;
> > +     }
> > +
> > +-  if (avc_add_callback (policy_reload_callback, AVC_CALLBACK_RESET,
> > +-                       NULL, NULL, 0, 0) < 0)
> > +-    {
> > +-      dbus_set_error (error, DBUS_ERROR_FAILED,
> > +-                      "Failed to add policy reload callback: %s",
> > +-                      _dbus_strerror (errno));
> > +-      goto error;
> > +-    }
> > +-
> > ++  selinux_set_callback (SELINUX_CB_POLICYLOAD, (union selinux_callbac=
k) policy_reload_callback);
> > +   selinux_set_callback (SELINUX_CB_AUDIT, (union selinux_callback) lo=
g_audit_callback);
> > +   selinux_set_callback (SELINUX_CB_LOG, (union selinux_callback) log_=
callback);
> > +
> > +--
> > +2.17.1
> > +
> > --
> > 2.25.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193861): https://lists.openembedded.org/g/openembedde=
d-core/message/193861
> Mute This Topic: https://lists.openembedded.org/mt/103736817/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

