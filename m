Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.9635.1613577563580765013
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 07:59:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hbjU5uMP;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id g6so17904136wrs.11
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 07:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/4XDj6TNJhsW1aK6yIU+LfhUs/hPXOIjy30rFxDgE/M=;
        b=hbjU5uMP6o+MzPrVkVfOB4bwx5TkIydM/IMQNQGbZ15mXsSPZh9f6BwhNLIH/QNM/x
         ku43oaloLL0ceL8170HOPtoBM3sfee9/MvGOm4pIsxws/CF+K7RBnKSGTHDjp5kXILMk
         3AtFcmsVNvkaTMzUVfKblm3M9qn+j3N3AZShy27L3yXdir8mqUOGLCpAfqeY34xpeGv0
         COs4sQhdCSUcAuqZK75GELMi0coxh9wGrldJ43TvdQkFYcp6d3ldtslzci7b6H2pXGPi
         t9hfefrmT3VZIc7CCw5/fohtOWQ09prxsgTHeK919ErHRUELL8gWgGuXG2gtRkFhpqPJ
         CU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/4XDj6TNJhsW1aK6yIU+LfhUs/hPXOIjy30rFxDgE/M=;
        b=dE4H64vwvqJBaBLelzOWWM1/zyAVy0D+a4PERQrbA4DOKEHym675n7RerxO9uvV4o/
         BVc/Tor4IMhmSywg1gG1JO8WeGk8cJ+AImKtZqxu5dGJJLRObNlOy/522riXRKAtXTMe
         5xXG2ZS2MVkSs00w6Au6O0VustgjyUPbvwWiSj4WHp0DSbV27JTjMermiEw7/OcCUOwf
         d/rUKPL37lxTy/fw+86rqFCQvgzV9FDzGudovnVF3j0QZdk5nyBjtIN9QrhE4QEPyU5q
         TnSixaNTfrLXqHiiyJsubJhFgCYILtfIfvEseTQzVqFVZRMSVW2osa07I+leTbYzv5Dz
         JA6w==
X-Gm-Message-State: AOAM531Xx5eCLq7AwVRz+frvZNqWG/kLk8WUKiatfLOaASREE1iYkNU7
	HsZfxU037O9lrenNscAfR0RcvsEbgGIQnTtbWDadCOiP
X-Google-Smtp-Source: ABdhPJxk9rCVMI6vvKnYrZSwuUU041u7l+QYo9/f/lHxt0WQfTZp7gVxqvrfKqiASCJtMIFaV29zBxwONLo+TR4T0rA=
X-Received: by 2002:adf:e68d:: with SMTP id r13mr29098639wrm.303.1613577561696;
 Wed, 17 Feb 2021 07:59:21 -0800 (PST)
MIME-Version: 1.0
References: <20201113211143.30425-1-JPEWhacker@gmail.com> <20201116143826.26521-1-JPEWhacker@gmail.com>
 <a3f36e65-157d-4255-7ae1-5a2094cbdd37@gmail.com>
In-Reply-To: <a3f36e65-157d-4255-7ae1-5a2094cbdd37@gmail.com>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Wed, 17 Feb 2021 09:59:10 -0600
Message-ID: <CAJdd5GZnxO68ir=moPXMUrQ9XmSg+wGimWYeOBMqJBzRiOB5Vg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] systemd: Re-enable chvt as non-root user without polkit
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Anuj Mittal <anuj.mittal@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2020 at 4:03 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> On 11/16/20 8:38 AM, Joshua Watt wrote:
> > systemd 245 introduced a regression in behavior where they removed
> > support for non-root users to chvt from a service file. This prevents
> > running compositors (e.g. weston) as any user other than root. The
> > intention is for polkit to be used to allow this (and in fact the
> > default polkit rules that ship with systemd allow this). However, polkit
> > is a huge dependency to bring in for an embedded system, and isn't
> > support by OE-core.
> >
> > The patch has been proposed upstream to restore the previous behavior of
> > allowing a non-root user to chvt to unbreak the regression without
> > requiring polkit.
>
> Can this be backported to 3.2, since it affects the systemd version
> there also?

Ping on backporting this to 3.2?

>
> Thanks
>
> >
> > Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/17494]
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >   ...chvt-as-non-root-user-without-polkit.patch | 227 ++++++++++++++++++
> >   meta/recipes-core/systemd/systemd_246.6.bb    |   1 +
> >   2 files changed, 228 insertions(+)
> >   create mode 100644 meta/recipes-core/systemd/systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch
> >
> > diff --git a/meta/recipes-core/systemd/systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch b/meta/recipes-core/systemd/systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch
> > new file mode 100644
> > index 0000000000..89ef39bc3e
> > --- /dev/null
> > +++ b/meta/recipes-core/systemd/systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch
> > @@ -0,0 +1,227 @@
> > +From 150d9cade6d475570395cb418b824524dead9577 Mon Sep 17 00:00:00 2001
> > +From: Joshua Watt <JPEWhacker@gmail.com>
> > +Date: Fri, 30 Oct 2020 08:15:43 -0500
> > +Subject: [PATCH] logind: Restore chvt as non-root user without polkit
> > +
> > +4acf0cfd2f ("logind: check PolicyKit before allowing VT switch") broke
> > +the ability to write user sessions that run graphical sessions (e.g.
> > +weston/X11). This was partially amended in 19bb87fbfa ("login: allow
> > +non-console sessions to change vt") by changing the default PolicyKit
> > +policy so that non-root users are again allowed to switch the VT. This
> > +makes the policy when PolKit is not enabled (as on many embedded
> > +systems) match the default PolKit policy and allows launching graphical
> > +sessions as a non-root user.
> > +
> > +Closes #17473
> > +---
> > + src/login/logind-dbus.c         | 11 ++-------
> > + src/login/logind-polkit.c       | 26 +++++++++++++++++++++
> > + src/login/logind-polkit.h       | 10 ++++++++
> > + src/login/logind-seat-dbus.c    | 41 ++++-----------------------------
> > + src/login/logind-session-dbus.c | 11 ++-------
> > + src/login/meson.build           |  1 +
> > + 6 files changed, 46 insertions(+), 54 deletions(-)
> > + create mode 100644 src/login/logind-polkit.c
> > + create mode 100644 src/login/logind-polkit.h
> > +
> > +diff --git a/src/login/logind-dbus.c b/src/login/logind-dbus.c
> > +index 0f83ed99bc..a3765d88ba 100644
> > +--- a/src/login/logind-dbus.c
> > ++++ b/src/login/logind-dbus.c
> > +@@ -30,6 +30,7 @@
> > + #include "format-util.h"
> > + #include "fs-util.h"
> > + #include "logind-dbus.h"
> > ++#include "logind-polkit.h"
> > + #include "logind-seat-dbus.h"
> > + #include "logind-session-dbus.h"
> > + #include "logind-user-dbus.h"
> > +@@ -1047,15 +1048,7 @@ static int method_activate_session_on_seat(sd_bus_message *message, void *userda
> > +                 return sd_bus_error_setf(error, BUS_ERROR_SESSION_NOT_ON_SEAT,
> > +                                          "Session %s not on seat %s", session_name, seat_name);
> > +
> > +-        r = bus_verify_polkit_async(
> > +-                        message,
> > +-                        CAP_SYS_ADMIN,
> > +-                        "org.freedesktop.login1.chvt",
> > +-                        NULL,
> > +-                        false,
> > +-                        UID_INVALID,
> > +-                        &m->polkit_registry,
> > +-                        error);
> > ++        r = check_polkit_chvt(message, m, error);
> > +         if (r < 0)
> > +                 return r;
> > +         if (r == 0)
> > +diff --git a/src/login/logind-polkit.c b/src/login/logind-polkit.c
> > +new file mode 100644
> > +index 0000000000..9072570cc6
> > +--- /dev/null
> > ++++ b/src/login/logind-polkit.c
> > +@@ -0,0 +1,26 @@
> > ++/* SPDX-License-Identifier: LGPL-2.1+ */
> > ++
> > ++#include "bus-polkit.h"
> > ++#include "logind-polkit.h"
> > ++#include "missing_capability.h"
> > ++#include "user-util.h"
> > ++
> > ++int check_polkit_chvt(sd_bus_message *message, Manager *manager, sd_bus_error *error) {
> > ++#if ENABLE_POLKIT
> > ++        return bus_verify_polkit_async(
> > ++                        message,
> > ++                        CAP_SYS_ADMIN,
> > ++                        "org.freedesktop.login1.chvt",
> > ++                        NULL,
> > ++                        false,
> > ++                        UID_INVALID,
> > ++                        &manager->polkit_registry,
> > ++                        error);
> > ++#else
> > ++        /* Allow chvt when polkit is not present. This allows a service to start a graphical session as a
> > ++         * non-root user when polkit is not compiled in, matching the default polkit policy */
> > ++        return 1;
> > ++#endif
> > ++}
> > ++
> > ++
> > +diff --git a/src/login/logind-polkit.h b/src/login/logind-polkit.h
> > +new file mode 100644
> > +index 0000000000..476c077a8a
> > +--- /dev/null
> > ++++ b/src/login/logind-polkit.h
> > +@@ -0,0 +1,10 @@
> > ++/* SPDX-License-Identifier: LGPL-2.1+ */
> > ++#pragma once
> > ++
> > ++#include "sd-bus.h"
> > ++
> > ++#include "bus-object.h"
> > ++#include "logind.h"
> > ++
> > ++int check_polkit_chvt(sd_bus_message *message, Manager *manager, sd_bus_error *error);
> > ++
> > +diff --git a/src/login/logind-seat-dbus.c b/src/login/logind-seat-dbus.c
> > +index a945132284..f22e9e2734 100644
> > +--- a/src/login/logind-seat-dbus.c
> > ++++ b/src/login/logind-seat-dbus.c
> > +@@ -9,6 +9,7 @@
> > + #include "bus-polkit.h"
> > + #include "bus-util.h"
> > + #include "logind-dbus.h"
> > ++#include "logind-polkit.h"
> > + #include "logind-seat-dbus.h"
> > + #include "logind-seat.h"
> > + #include "logind-session-dbus.h"
> > +@@ -179,15 +180,7 @@ static int method_activate_session(sd_bus_message *message, void *userdata, sd_b
> > +         if (session->seat != s)
> > +                 return sd_bus_error_setf(error, BUS_ERROR_SESSION_NOT_ON_SEAT, "Session %s not on seat %s", name, s->id);
> > +
> > +-        r = bus_verify_polkit_async(
> > +-                        message,
> > +-                        CAP_SYS_ADMIN,
> > +-                        "org.freedesktop.login1.chvt",
> > +-                        NULL,
> > +-                        false,
> > +-                        UID_INVALID,
> > +-                        &s->manager->polkit_registry,
> > +-                        error);
> > ++        r = check_polkit_chvt(message, s->manager, error);
> > +         if (r < 0)
> > +                 return r;
> > +         if (r == 0)
> > +@@ -215,15 +208,7 @@ static int method_switch_to(sd_bus_message *message, void *userdata, sd_bus_erro
> > +         if (to <= 0)
> > +                 return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS, "Invalid virtual terminal");
> > +
> > +-        r = bus_verify_polkit_async(
> > +-                        message,
> > +-                        CAP_SYS_ADMIN,
> > +-                        "org.freedesktop.login1.chvt",
> > +-                        NULL,
> > +-                        false,
> > +-                        UID_INVALID,
> > +-                        &s->manager->polkit_registry,
> > +-                        error);
> > ++        r = check_polkit_chvt(message, s->manager, error);
> > +         if (r < 0)
> > +                 return r;
> > +         if (r == 0)
> > +@@ -243,15 +228,7 @@ static int method_switch_to_next(sd_bus_message *message, void *userdata, sd_bus
> > +         assert(message);
> > +         assert(s);
> > +
> > +-        r = bus_verify_polkit_async(
> > +-                        message,
> > +-                        CAP_SYS_ADMIN,
> > +-                        "org.freedesktop.login1.chvt",
> > +-                        NULL,
> > +-                        false,
> > +-                        UID_INVALID,
> > +-                        &s->manager->polkit_registry,
> > +-                        error);
> > ++        r = check_polkit_chvt(message, s->manager, error);
> > +         if (r < 0)
> > +                 return r;
> > +         if (r == 0)
> > +@@ -271,15 +248,7 @@ static int method_switch_to_previous(sd_bus_message *message, void *userdata, sd
> > +         assert(message);
> > +         assert(s);
> > +
> > +-        r = bus_verify_polkit_async(
> > +-                        message,
> > +-                        CAP_SYS_ADMIN,
> > +-                        "org.freedesktop.login1.chvt",
> > +-                        NULL,
> > +-                        false,
> > +-                        UID_INVALID,
> > +-                        &s->manager->polkit_registry,
> > +-                        error);
> > ++        r = check_polkit_chvt(message, s->manager, error);
> > +         if (r < 0)
> > +                 return r;
> > +         if (r == 0)
> > +diff --git a/src/login/logind-session-dbus.c b/src/login/logind-session-dbus.c
> > +index ccc5ac8df2..57c8a4e900 100644
> > +--- a/src/login/logind-session-dbus.c
> > ++++ b/src/login/logind-session-dbus.c
> > +@@ -11,6 +11,7 @@
> > + #include "fd-util.h"
> > + #include "logind-brightness.h"
> > + #include "logind-dbus.h"
> > ++#include "logind-polkit.h"
> > + #include "logind-seat-dbus.h"
> > + #include "logind-session-dbus.h"
> > + #include "logind-session-device.h"
> > +@@ -192,15 +193,7 @@ int bus_session_method_activate(sd_bus_message *message, void *userdata, sd_bus_
> > +         assert(message);
> > +         assert(s);
> > +
> > +-        r = bus_verify_polkit_async(
> > +-                        message,
> > +-                        CAP_SYS_ADMIN,
> > +-                        "org.freedesktop.login1.chvt",
> > +-                        NULL,
> > +-                        false,
> > +-                        UID_INVALID,
> > +-                        &s->manager->polkit_registry,
> > +-                        error);
> > ++        r = check_polkit_chvt(message, s->manager, error);
> > +         if (r < 0)
> > +                 return r;
> > +         if (r == 0)
> > +diff --git a/src/login/meson.build b/src/login/meson.build
> > +index 0a7d3d5440..7e46be2add 100644
> > +--- a/src/login/meson.build
> > ++++ b/src/login/meson.build
> > +@@ -26,6 +26,7 @@ liblogind_core_sources = files('''
> > +         logind-device.h
> > +         logind-inhibit.c
> > +         logind-inhibit.h
> > ++        logind-polkit.c
> > +         logind-seat-dbus.c
> > +         logind-seat-dbus.h
> > +         logind-seat.c
> > +--
> > +2.28.0
> > +
> > diff --git a/meta/recipes-core/systemd/systemd_246.6.bb b/meta/recipes-core/systemd/systemd_246.6.bb
> > index 1d1ff34d89..d9e7b1a00c 100644
> > --- a/meta/recipes-core/systemd/systemd_246.6.bb
> > +++ b/meta/recipes-core/systemd/systemd_246.6.bb
> > @@ -23,6 +23,7 @@ SRC_URI += "file://touchscreen.rules \
> >              file://0003-implment-systemd-sysv-install-for-OE.patch \
> >              file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
> >              file://selinux-hook-handling-to-enumerate-nexthop.patch \
> > +           file://0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch \
> >              "
> >
> >   # patches needed by musl
