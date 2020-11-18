Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web08.583.1605737004802983039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 14:03:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ItK3xZZ9;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id f16so3330089otl.11
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2020 14:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=uvBcv3v7+BvsB1Ru9L52CZg5DoQXvIKESdpvrP/+erY=;
        b=ItK3xZZ9mjyVctsCElPNYi3Zo0j2ITw4NeO+7JcXyrvpbCpVqrQInieqO2Fq/oNfF0
         3TWTHmH2NeionJ9ucaDEUL/8LHfkIW4F+8flSLQhIeiCtekHziwMdmshBW2Q8bWgvrp5
         bx/u5+i0d0A9u69bNBH2Hrkyinykcvxbh9IwA3J+fiu/uug0/m3u19AHHqEWS+M7Uvlw
         yXoVR1RxalKSohe6tdfWQRXqBX82cynlsLgNmwWyQoCwpPKCSNjh+dnA3wI9kFcNOip6
         DMPehYBwcF1ZdDbGkKM9oNJeStBFqyF/NnO70EDJ5NCDPxvlL+9FJbqaLHJl6hVTyHco
         4Ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=uvBcv3v7+BvsB1Ru9L52CZg5DoQXvIKESdpvrP/+erY=;
        b=LvcEpWjwkuJ+Fj7kIt+mPyNWD4WIUMw/tKvWWlOXYh71Mq0W+QrKh/Gx3IQDZYUREu
         clzIOcivdEftHowPswnJ/6v73oqueIiByh9pSZ61r5EWzi4IvvopWlpTOb8tijKuVYNf
         qSOxvDsk5eUYIdYdITjjT8ZvyPUyrBSeKUdQmZLJ7w5KPaGOVv01SICDoUsjy69JhE1i
         voqj6w5MKk//0O1O/8qY/K4GqxjOXRkAZ7TpGKMTPkK4DzYqRH/Sk96Bu15j+hkjcrOJ
         pjah7oKsiT+verHfTHbeX/TVReooTfMopcM6lBdEx/WarV0Y3myy7KvkbrFaaI2dxMUO
         eyHw==
X-Gm-Message-State: AOAM532P8RXn8YlIdhW02jZmI4bRCb2KC4QzpKYVCMiUoLLl4QxU6I8L
	8E136/4WCLLIEvYBCHpXG+M=
X-Google-Smtp-Source: ABdhPJzMreYttBUAOc5fgCLRm6TUEou6gHhOPkEqqsKofDRjZCdyhBHb0I4H0eLpnLfuk3ATqsaV3Q==
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr8183152oth.250.1605737003989;
        Wed, 18 Nov 2020 14:03:23 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id 19sm8251104oth.63.2020.11.18.14.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2020 14:03:23 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core][PATCH v2] systemd: Re-enable chvt as non-root user without polkit
To: openembedded-core@lists.openembedded.org
References: <20201113211143.30425-1-JPEWhacker@gmail.com>
 <20201116143826.26521-1-JPEWhacker@gmail.com>
Cc: anuj.mittal@intel.com
Message-ID: <a3f36e65-157d-4255-7ae1-5a2094cbdd37@gmail.com>
Date: Wed, 18 Nov 2020 16:03:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116143826.26521-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 11/16/20 8:38 AM, Joshua Watt wrote:
> systemd 245 introduced a regression in behavior where they removed
> support for non-root users to chvt from a service file. This prevents
> running compositors (e.g. weston) as any user other than root. The
> intention is for polkit to be used to allow this (and in fact the
> default polkit rules that ship with systemd allow this). However, polkit
> is a huge dependency to bring in for an embedded system, and isn't
> support by OE-core.
>
> The patch has been proposed upstream to restore the previous behavior of
> allowing a non-root user to chvt to unbreak the regression without
> requiring polkit.

Can this be backported to 3.2, since it affects the systemd version 
there also?

Thanks

>
> Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/17494]
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   ...chvt-as-non-root-user-without-polkit.patch | 227 ++++++++++++++++++
>   meta/recipes-core/systemd/systemd_246.6.bb    |   1 +
>   2 files changed, 228 insertions(+)
>   create mode 100644 meta/recipes-core/systemd/systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch b/meta/recipes-core/systemd/systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch
> new file mode 100644
> index 0000000000..89ef39bc3e
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch
> @@ -0,0 +1,227 @@
> +From 150d9cade6d475570395cb418b824524dead9577 Mon Sep 17 00:00:00 2001
> +From: Joshua Watt <JPEWhacker@gmail.com>
> +Date: Fri, 30 Oct 2020 08:15:43 -0500
> +Subject: [PATCH] logind: Restore chvt as non-root user without polkit
> +
> +4acf0cfd2f ("logind: check PolicyKit before allowing VT switch") broke
> +the ability to write user sessions that run graphical sessions (e.g.
> +weston/X11). This was partially amended in 19bb87fbfa ("login: allow
> +non-console sessions to change vt") by changing the default PolicyKit
> +policy so that non-root users are again allowed to switch the VT. This
> +makes the policy when PolKit is not enabled (as on many embedded
> +systems) match the default PolKit policy and allows launching graphical
> +sessions as a non-root user.
> +
> +Closes #17473
> +---
> + src/login/logind-dbus.c         | 11 ++-------
> + src/login/logind-polkit.c       | 26 +++++++++++++++++++++
> + src/login/logind-polkit.h       | 10 ++++++++
> + src/login/logind-seat-dbus.c    | 41 ++++-----------------------------
> + src/login/logind-session-dbus.c | 11 ++-------
> + src/login/meson.build           |  1 +
> + 6 files changed, 46 insertions(+), 54 deletions(-)
> + create mode 100644 src/login/logind-polkit.c
> + create mode 100644 src/login/logind-polkit.h
> +
> +diff --git a/src/login/logind-dbus.c b/src/login/logind-dbus.c
> +index 0f83ed99bc..a3765d88ba 100644
> +--- a/src/login/logind-dbus.c
> ++++ b/src/login/logind-dbus.c
> +@@ -30,6 +30,7 @@
> + #include "format-util.h"
> + #include "fs-util.h"
> + #include "logind-dbus.h"
> ++#include "logind-polkit.h"
> + #include "logind-seat-dbus.h"
> + #include "logind-session-dbus.h"
> + #include "logind-user-dbus.h"
> +@@ -1047,15 +1048,7 @@ static int method_activate_session_on_seat(sd_bus_message *message, void *userda
> +                 return sd_bus_error_setf(error, BUS_ERROR_SESSION_NOT_ON_SEAT,
> +                                          "Session %s not on seat %s", session_name, seat_name);
> +
> +-        r = bus_verify_polkit_async(
> +-                        message,
> +-                        CAP_SYS_ADMIN,
> +-                        "org.freedesktop.login1.chvt",
> +-                        NULL,
> +-                        false,
> +-                        UID_INVALID,
> +-                        &m->polkit_registry,
> +-                        error);
> ++        r = check_polkit_chvt(message, m, error);
> +         if (r < 0)
> +                 return r;
> +         if (r == 0)
> +diff --git a/src/login/logind-polkit.c b/src/login/logind-polkit.c
> +new file mode 100644
> +index 0000000000..9072570cc6
> +--- /dev/null
> ++++ b/src/login/logind-polkit.c
> +@@ -0,0 +1,26 @@
> ++/* SPDX-License-Identifier: LGPL-2.1+ */
> ++
> ++#include "bus-polkit.h"
> ++#include "logind-polkit.h"
> ++#include "missing_capability.h"
> ++#include "user-util.h"
> ++
> ++int check_polkit_chvt(sd_bus_message *message, Manager *manager, sd_bus_error *error) {
> ++#if ENABLE_POLKIT
> ++        return bus_verify_polkit_async(
> ++                        message,
> ++                        CAP_SYS_ADMIN,
> ++                        "org.freedesktop.login1.chvt",
> ++                        NULL,
> ++                        false,
> ++                        UID_INVALID,
> ++                        &manager->polkit_registry,
> ++                        error);
> ++#else
> ++        /* Allow chvt when polkit is not present. This allows a service to start a graphical session as a
> ++         * non-root user when polkit is not compiled in, matching the default polkit policy */
> ++        return 1;
> ++#endif
> ++}
> ++
> ++
> +diff --git a/src/login/logind-polkit.h b/src/login/logind-polkit.h
> +new file mode 100644
> +index 0000000000..476c077a8a
> +--- /dev/null
> ++++ b/src/login/logind-polkit.h
> +@@ -0,0 +1,10 @@
> ++/* SPDX-License-Identifier: LGPL-2.1+ */
> ++#pragma once
> ++
> ++#include "sd-bus.h"
> ++
> ++#include "bus-object.h"
> ++#include "logind.h"
> ++
> ++int check_polkit_chvt(sd_bus_message *message, Manager *manager, sd_bus_error *error);
> ++
> +diff --git a/src/login/logind-seat-dbus.c b/src/login/logind-seat-dbus.c
> +index a945132284..f22e9e2734 100644
> +--- a/src/login/logind-seat-dbus.c
> ++++ b/src/login/logind-seat-dbus.c
> +@@ -9,6 +9,7 @@
> + #include "bus-polkit.h"
> + #include "bus-util.h"
> + #include "logind-dbus.h"
> ++#include "logind-polkit.h"
> + #include "logind-seat-dbus.h"
> + #include "logind-seat.h"
> + #include "logind-session-dbus.h"
> +@@ -179,15 +180,7 @@ static int method_activate_session(sd_bus_message *message, void *userdata, sd_b
> +         if (session->seat != s)
> +                 return sd_bus_error_setf(error, BUS_ERROR_SESSION_NOT_ON_SEAT, "Session %s not on seat %s", name, s->id);
> +
> +-        r = bus_verify_polkit_async(
> +-                        message,
> +-                        CAP_SYS_ADMIN,
> +-                        "org.freedesktop.login1.chvt",
> +-                        NULL,
> +-                        false,
> +-                        UID_INVALID,
> +-                        &s->manager->polkit_registry,
> +-                        error);
> ++        r = check_polkit_chvt(message, s->manager, error);
> +         if (r < 0)
> +                 return r;
> +         if (r == 0)
> +@@ -215,15 +208,7 @@ static int method_switch_to(sd_bus_message *message, void *userdata, sd_bus_erro
> +         if (to <= 0)
> +                 return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS, "Invalid virtual terminal");
> +
> +-        r = bus_verify_polkit_async(
> +-                        message,
> +-                        CAP_SYS_ADMIN,
> +-                        "org.freedesktop.login1.chvt",
> +-                        NULL,
> +-                        false,
> +-                        UID_INVALID,
> +-                        &s->manager->polkit_registry,
> +-                        error);
> ++        r = check_polkit_chvt(message, s->manager, error);
> +         if (r < 0)
> +                 return r;
> +         if (r == 0)
> +@@ -243,15 +228,7 @@ static int method_switch_to_next(sd_bus_message *message, void *userdata, sd_bus
> +         assert(message);
> +         assert(s);
> +
> +-        r = bus_verify_polkit_async(
> +-                        message,
> +-                        CAP_SYS_ADMIN,
> +-                        "org.freedesktop.login1.chvt",
> +-                        NULL,
> +-                        false,
> +-                        UID_INVALID,
> +-                        &s->manager->polkit_registry,
> +-                        error);
> ++        r = check_polkit_chvt(message, s->manager, error);
> +         if (r < 0)
> +                 return r;
> +         if (r == 0)
> +@@ -271,15 +248,7 @@ static int method_switch_to_previous(sd_bus_message *message, void *userdata, sd
> +         assert(message);
> +         assert(s);
> +
> +-        r = bus_verify_polkit_async(
> +-                        message,
> +-                        CAP_SYS_ADMIN,
> +-                        "org.freedesktop.login1.chvt",
> +-                        NULL,
> +-                        false,
> +-                        UID_INVALID,
> +-                        &s->manager->polkit_registry,
> +-                        error);
> ++        r = check_polkit_chvt(message, s->manager, error);
> +         if (r < 0)
> +                 return r;
> +         if (r == 0)
> +diff --git a/src/login/logind-session-dbus.c b/src/login/logind-session-dbus.c
> +index ccc5ac8df2..57c8a4e900 100644
> +--- a/src/login/logind-session-dbus.c
> ++++ b/src/login/logind-session-dbus.c
> +@@ -11,6 +11,7 @@
> + #include "fd-util.h"
> + #include "logind-brightness.h"
> + #include "logind-dbus.h"
> ++#include "logind-polkit.h"
> + #include "logind-seat-dbus.h"
> + #include "logind-session-dbus.h"
> + #include "logind-session-device.h"
> +@@ -192,15 +193,7 @@ int bus_session_method_activate(sd_bus_message *message, void *userdata, sd_bus_
> +         assert(message);
> +         assert(s);
> +
> +-        r = bus_verify_polkit_async(
> +-                        message,
> +-                        CAP_SYS_ADMIN,
> +-                        "org.freedesktop.login1.chvt",
> +-                        NULL,
> +-                        false,
> +-                        UID_INVALID,
> +-                        &s->manager->polkit_registry,
> +-                        error);
> ++        r = check_polkit_chvt(message, s->manager, error);
> +         if (r < 0)
> +                 return r;
> +         if (r == 0)
> +diff --git a/src/login/meson.build b/src/login/meson.build
> +index 0a7d3d5440..7e46be2add 100644
> +--- a/src/login/meson.build
> ++++ b/src/login/meson.build
> +@@ -26,6 +26,7 @@ liblogind_core_sources = files('''
> +         logind-device.h
> +         logind-inhibit.c
> +         logind-inhibit.h
> ++        logind-polkit.c
> +         logind-seat-dbus.c
> +         logind-seat-dbus.h
> +         logind-seat.c
> +--
> +2.28.0
> +
> diff --git a/meta/recipes-core/systemd/systemd_246.6.bb b/meta/recipes-core/systemd/systemd_246.6.bb
> index 1d1ff34d89..d9e7b1a00c 100644
> --- a/meta/recipes-core/systemd/systemd_246.6.bb
> +++ b/meta/recipes-core/systemd/systemd_246.6.bb
> @@ -23,6 +23,7 @@ SRC_URI += "file://touchscreen.rules \
>              file://0003-implment-systemd-sysv-install-for-OE.patch \
>              file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
>              file://selinux-hook-handling-to-enumerate-nexthop.patch \
> +           file://0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch \
>              "
>   
>   # patches needed by musl
