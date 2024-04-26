Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D799C4345F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 08:40:04 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.9056.1714120797184225079
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Apr 2024 01:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NH5wPOrB;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51bafbe7509so2667811e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 01:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714120795; x=1714725595; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yB5rwIlFVMUrdvsoYhE98bmdGhzu21T60GjN6Ev1CII=;
        b=NH5wPOrBAu/1ZwqetRfGhwsMhBEerVKuTcQtXJvweUgi+UR5iHAQWp6uVE7oF8KpuZ
         kPAc7uWsz/GkeW6dFVwrdvpgXIiN1kYmqORBcs9PQwroirZgeU2TpOdFKEkQxQI43awx
         6XgY1A5s3+CflMUlxzC1THSGXr279PGmJW9ABJ52aMO/idtY2tCPZpIQ4BjiSazQcG7d
         Kjg8eT13C6cX5xZ0S1jQjEdG3O+pOxsGk+xNUsZPN/BN3znFH+zKZAcgW1aPRIY7rEUZ
         qoIDkZrU1K8Hcrj7GZ+XOr2xpwSWKGOV86nlE/iFjpylowvhJyV0x3Vcw1TV6EmBLAVg
         B+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714120795; x=1714725595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yB5rwIlFVMUrdvsoYhE98bmdGhzu21T60GjN6Ev1CII=;
        b=YNM//OSbHRaldZgtbnbIqDhQz6wlTqB5oME/NvziQcTA72NPJ+HWVxhIUmc8kmEEgq
         qDsgkQEcGsvuPZLZ1UKscb1WpSADnSMgEuQ0wp8REXayg3YkWdskqg/Im47IEi9CM33m
         h0cq9jJz463yu8a1dl4IvrWJvif5WoSEeCc4kU+9hEnOxMw169kxLiG9JhOGyTrBEN3L
         Iyz/BlZylPH2/y5tXANPbuLMizWNgcRz4kqkhTIrN8vedKgJwOlrzNq7ahAe4+kXuawL
         QRZLPFl77KW+yg23svH3JVb4KN78tNwRJMXIXpyVzTUl9uQ4I/X/jPfjhXtwnOaJkDvA
         JwtQ==
X-Gm-Message-State: AOJu0YzhzAOSj6ruP7iShvzwyyVYXIw+uGnyQNaAVVerUmt9YKamqgD7
	KdfrltbHxZ1xkHNPOx4GojTu51TOaqa5scwvEYDnC+o1F2jEk1weitmnz2lAQE1Z1VVCNuqo8f9
	PFwPWM5FElgzr7luD8RwkvjxeHSkKmwKS
X-Google-Smtp-Source: AGHT+IGziXEwwN/+2Kizyn9u5NvItS5Rrl5C24fOX78ZDNtYAdBiqFADirTzHYMnmZcuARmwXra0uza52+kacD4q/UA=
X-Received: by 2002:a19:750c:0:b0:519:611f:df49 with SMTP id
 y12-20020a19750c000000b00519611fdf49mr1691274lfe.69.1714120795041; Fri, 26
 Apr 2024 01:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240425055231.668897-1-leimaohui@fujitsu.com>
 <CANNYZj8U5X==Up3C8QoQf_RzEV1-9Ewo8w0Q00HJ3B-uUYBc5w@mail.gmail.com> <TY3PR01MB11056396A609AFF1770D3F05EA0162@TY3PR01MB11056.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11056396A609AFF1770D3F05EA0162@TY3PR01MB11056.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Apr 2024 10:39:44 +0200
Message-ID: <CANNYZj-RMjrhBZxxmTNrCE+L38YmX1_bvtZnwnBkQLst1XBjkA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3] libbsd: Fix conflict error when enable multilib.
To: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 08:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198717

On Fri, 26 Apr 2024 at 08:55, Maohui Lei (Fujitsu)
<leimaohui@fujitsu.com> wrote:
> From the build log and the source code of libbsd, I found that libbsd does provide header file in overlay mode by default as the man page says.
> -----------------------------------------------------------------------
> $ ls tmp/work/cortexa57-poky-linux/libbsd/0.12.2/image/usr/lib64/pkgconfig/
> libbsd-ctor.pc  libbsd-overlay.pc  libbsd.pc
> $ grep include tmp/work/cortexa57-poky-linux/libbsd/0.12.2/temp/log.do_compile -r
> ...... -I.. -isystem ../../libbsd-0.12.2/include/bsd/......
> ...... -I.. -isystem ../../libbsd-0.12.2/include/bsd/......
> ......
> $ vim tmp/work/cortexa57-poky-linux/libbsd/0.12.2/libbsd-0.12.2/include/bsd/stringlist.h
> #ifdef LIBBSD_OVERLAY
> #include <sys/cdefs.h>
> #else
> #include <bsd/sys/cdefs.h>
> #endif
> #include <sys/types.h>
> ----------------------------------------------------------------------

The man page does not say overlay mode is default, it only says that
it's recommended. And indeed the above shows that you need to opt into
it by defining LIBBSD_OVERLAY. Let's see how example projects handle
it.

> And I Investigated several OSS(e.g. shadow, mg, libxdmcp) that depend on libbsd. From the source code of theirs. I found that they does used libbsd in overlay mode by default.
> Such as shadow:
> -----------------------------------------------------------------------
> vim tmp/work/cortexa57-poky-linux/shadow/4.15.0/shadow-4.15.0/lib/readpassphrase.h
> ......
> #ifdef LIBBSD_OVERLAY
> #include <sys/cdefs.h>
> #endif
> ......
> -----------------------------------------------------------------------

shadow does not use overlay mode by default, it makes that decision
based on other factors in configure.ac:

if test "$with_libbsd" != "no"; then
        AC_SEARCH_LIBS([readpassphrase], [bsd], [], [
                AC_MSG_ERROR([readpassphrase() is missing, either from
libc or libbsd])
        ])
        AS_IF([test "$ac_cv_search_readpassphrase" = "-lbsd"], [
                PKG_CHECK_MODULES([LIBBSD], [libbsd-overlay])
        ])
        dnl Make sure either the libc or libbsd provide the header.
        save_CFLAGS="$CFLAGS"
        CFLAGS="$CFLAGS $LIBBSD_CFLAGS"
        AC_CHECK_HEADERS([readpassphrase.h])
        AS_IF([test "$ac_cv_header_readpassphrase_h" != "yes"], [
                AC_MSG_ERROR([readpassphrase.h is missing])
        ])
        CFLAGS="$save_CFLAGS"
        AC_DEFINE(WITH_LIBBSD, 1, [Build shadow with libbsd support])
else
        AC_DEFINE(WITH_LIBBSD, 0, [Build shadow without libbsd support])
fi
AM_CONDITIONAL(WITH_LIBBSD, test x$with_libbsd = xyes)


> The same as mg :
> -----------------------------------------------------------------------
> $ vim tmp/work/cortexa57-poky-linux/mg/20230501/git/CMakeLists.txt
> if(CMAKE_SYSTEM_NAME MATCHES "Linux")
>   pkg_check_modules (BSD REQUIRED libbsd-overlay)
>   link_directories (${BSD_LIBRARY_DIRS})
>   string (REPLACE ";" " " LIBBSD_FLAGS "${BSD_CFLAGS}")
>   target_link_libraries (mg ${BSD_LIBRARIES})
>   set (CMAKE_C_FLAGS "-Wall -DREGEX -D_GNU_SOURCE ${LIBBSD_FLAGS} ${NCURSES_FLAGS} -L${NCURSES_LIBRARY_DIRS}")
> else()
>   set (CMAKE_C_FLAGS "-Wall -DREGEX ${LIBBSD_FLAGS} ${NCURSES_FLAGS} -L${NCURSES_LIBRARY_DIRS}")
> endif()
> -----------------------------------------------------------------------

This one does use overlay mode by default, but that doesn't mean every
other project does the same. We have to continue supporting both
options until libbsd upstream provides only one option.

> So, I think the header file after oe_multilib_header should be in overlay mode as the other header files in libbsd.
> Of course, If added "#ifdef LIBBSD_OVERLAY" into the header file after oe_multilib_header, libbsd will have a better compatibility. What do you think?

I don't think this is correct. Without sed, both modes will work
(unless you can demonstrate how it will break; I asked that, and
there's no answer in the above). With sed, only overlay mode will
work, and now you're proposing additional fixing to undo that effect.

So I'd suggest you submit the patch without sed (just oe_multilib
parts), and we can then consider if any further fixing is required.
Again: please show what is the problem that would occur without sed.

Alex

