Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B79C48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 14:10:37 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.22174.1707228634917204083
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 06:10:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PaSEygkL;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.48, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a38392b9917so67887966b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 06:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707228633; x=1707833433; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkTYxc8LrXT0LRQrSfmNf0mayEbMGhETNHePQJXx/JI=;
        b=PaSEygkLIU3raqLYNSqoHJ6Z8F5lJdcNW8bLMufiRgwTpVZRAEWdruBCiHA5Ji4ig1
         K9TPTOTRs1bvVTfLO0MmpwCjWqiRkwIvDoER0YJnvvH6JPtLdfUBtjLMXOSn4oglxD1c
         u7+61+E2cAFb/p6iZ9ITrwbYeO6Z0n9tAQmiqkeJ/H8RKz2eA4wjbt5XZ6YZFYxCp0SC
         MHZG4s9zWZ+qPtCPHR1Dmqd9h8bmySPL9fM8S3sbY+kIS/RUdQu3sgcnOtelQjpX2hOM
         /a06aSKocIukhJU9SB0hfGqhhJvmO2ThoBGGMbvFsfClB4Y4fqs3w2ue0NFn7mujVdXe
         l99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707228633; x=1707833433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IkTYxc8LrXT0LRQrSfmNf0mayEbMGhETNHePQJXx/JI=;
        b=IEBNmsqW9S6Jk3o4mnxrGTWUJV4YvKkRnil6O+CLEIl8m65A0vg4pZhDlbwdDJtd74
         zHsdvuMgRYd4T8vAv8LipLp4iz+56JS4O4y7B+u1Snymq356WvHuEZfKL3paVUgwlVQ6
         JrIOc8wE72mnYdgWPAar6Bo1LxfOhNq9gAClC9RxxNncjxv1Z1JKii83FxMQoIsZgl+u
         gishgiTd/ZVQfbuQkIq1hpYRa/bQxd5hk6On+WpNOLleqY442eNlqtkBwYfx3pWjJQ+g
         l6TggQ8h1+GNi93aOok1YC89UKmtcDifWGuOxVzpjkvp5PkNT8RIaVV42nHVIJAGAiVv
         s0Iw==
X-Gm-Message-State: AOJu0Yxz/bW/KUVKYwYW4oAZg1v1oYWDOZgXIS8vTKPE4aCAqGutiO9L
	agm1lPzubQmZMxqODfaXv7olMKh40aRHCRtpaSJxtB26YXXquuLAQmnCkBLSCUVI0jYhK7/Joyx
	rA22Pptxkf0OGGt6Z3USZuu5SP373Qtwz6ZYHWw==
X-Google-Smtp-Source: AGHT+IEXGV8ccMX0AFdKxaGYzDQBk8+FwrBoyq4SW6nrrY4nh5Dlq33J0WOLrI7J3/Y+FR5sLZ0USvl5EwPRwSJNQiQ=
X-Received: by 2002:a17:906:f88a:b0:a38:20dc:9fb6 with SMTP id
 lg10-20020a170906f88a00b00a3820dc9fb6mr1229572ejb.25.1707228632959; Tue, 06
 Feb 2024 06:10:32 -0800 (PST)
MIME-Version: 1.0
References: <20240206123104.99595-1-virendrak@kpit.com>
In-Reply-To: <20240206123104.99595-1-virendrak@kpit.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 6 Feb 2024 04:10:21 -1000
Message-ID: <CAOSpxda3prgu__ZW2Ugtg6mFDPTmd0vppybpj6AFfyYv_iCzUA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] ncurses: Fix CVE-2023-29491
To: virendra thakur <thakur.virendra1810@gmail.com>
Cc: openembedded-core@lists.openembedded.org, hongxu.jia@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 14:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194993

On Tue, Feb 6, 2024 at 2:31=E2=80=AFAM virendra thakur
<thakur.virendra1810@gmail.com> wrote:
>
> memory corruption when processing malformed terminfo data entries
> loaded by setuid/setgid programs
>
> CVE-2023-29491.patch change the --disable-root-environ configure option
> behavior.
> set --disable-root-environ in configuration options.
>
> --disable-root-environ option with a few additional changes
> to the code allows us to mitigate CVE-2023-29491 and avoid
> other issues that involve the possibility of malicious use of
> environment variables through setuid applications, and, therefore,
> it was the fix chosen in order to resolve this vulnerability.
>
> Reference:
> https://ubuntu.com/security/CVE-2023-29491
> https://launchpad.net/ubuntu/+source/ncurses/6.2-0ubuntu2.1
>
> Signed-off-by: virendra thakur <virendrak@kpit.com>
> ---
>  .../ncurses/files/CVE-2023-29491.patch        | 45 +++++++++++++++++++
>  meta/recipes-core/ncurses/ncurses_6.2.bb      |  3 +-
>  2 files changed, 47 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/ncurses/files/CVE-2023-29491.patch
>
> diff --git a/meta/recipes-core/ncurses/files/CVE-2023-29491.patch b/meta/=
recipes-core/ncurses/files/CVE-2023-29491.patch
> new file mode 100644
> index 0000000000..0a0497723f
> --- /dev/null
> +++ b/meta/recipes-core/ncurses/files/CVE-2023-29491.patch
> @@ -0,0 +1,45 @@
> +Backport of:
> +
> +Author: Sven Joachim <svenjoac@gmx.de>
> +Description: Change the --disable-root-environ configure option behavior
> + By default, the --disable-root-environ option forbids program run by
> + the superuser to load custom terminfo entries.  This patch changes
> + that to only restrict programs running with elevated privileges,
> + matching the behavior of the --disable-setuid-environ option
> + introduced in the 20230423 upstream patchlevel.
> +Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1034372#=
29
> +Bug: https://lists.gnu.org/archive/html/bug-ncurses/2023-04/msg00018.htm=
l
> +Forwarded: not-needed
> +Last-Update: 2023-05-01
> +
> +Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary=
/+sourcefiles/ncurses/6.2-0ubuntu2.1/ncurses_6.2-0ubuntu2.1.debian.tar.xz]

Ubuntu launchpad is not the upstream for ncurses.  Please reference
the actual upstream commit in a V2.

Thanks!

Steve

> +CVE: CVE-2023-29491
> +Signed-off-by: Virendra Thakur <virendrak@kpit.com>
> +
> +---
> + ncurses/tinfo/access.c |    2 --
> + 1 file changed, 2 deletions(-)
> +
> +--- a/ncurses/tinfo/access.c
> ++++ b/ncurses/tinfo/access.c
> +@@ -178,15 +178,16 @@ _nc_is_file_path(const char *path)
> + NCURSES_EXPORT(int)
> + _nc_env_access(void)
> + {
> ++    int result =3D TRUE;
> ++
> + #if HAVE_ISSETUGID
> +     if (issetugid())
> +-      return FALSE;
> ++      result =3D FALSE;
> + #elif HAVE_GETEUID && HAVE_GETEGID
> +     if (getuid() !=3D geteuid()
> +       || getgid() !=3D getegid())
> +-      return FALSE;
> ++      result =3D FALSE;
> + #endif
> +-    /* ...finally, disallow root */
> +-    return (getuid() !=3D ROOT_UID) && (geteuid() !=3D ROOT_UID);
> ++    return result;
> + }
> + #endif
> diff --git a/meta/recipes-core/ncurses/ncurses_6.2.bb b/meta/recipes-core=
/ncurses/ncurses_6.2.bb
> index 451bfbcb5d..33285bcb5b 100644
> --- a/meta/recipes-core/ncurses/ncurses_6.2.bb
> +++ b/meta/recipes-core/ncurses/ncurses_6.2.bb
> @@ -5,11 +5,12 @@ SRC_URI +=3D "file://0001-tic-hang.patch \
>             file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-genera=
ted.patch \
>             file://CVE-2021-39537.patch \
>             file://CVE-2022-29458.patch \
> +           file://CVE-2023-29491.patch \
>             "
>  # commit id corresponds to the revision in package version
>  SRCREV =3D "a669013cd5e9d6434e5301348ea51baf306c93c4"
>  S =3D "${WORKDIR}/git"
> -EXTRA_OECONF +=3D "--with-abi-version=3D5"
> +EXTRA_OECONF +=3D "--with-abi-version=3D5 --disable-root-environ"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
>
>  # This is needed when using patchlevel versions like 6.1+20181013
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194991): https://lists.openembedded.org/g/openembedde=
d-core/message/194991
> Mute This Topic: https://lists.openembedded.org/mt/104196627/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

