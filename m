Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web12.10262.1594386253442754106
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 06:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=uGrHy8de;
 spf=pass (domain: konsulko.com, ip: 209.85.210.65, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f65.google.com with SMTP id c25so4128367otf.7
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 06:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Fcu+pYadcgvGDdS/mBeXMmvZwseOekB28eFnHqbW+Oo=;
        b=uGrHy8deR6Av1h5GkhrSnwVZE5P0XlyiQrctSnCHmnyKGiyLr+qaay5uiKIj/gBibH
         M0xF07uEZgAbiBje7SumkcFEf0/PANWHXNqaIhDA1ouCN5HO73Sm6g26MCTM/vZTYRRy
         tLdSJkdwskMX/BOGxPBlfAuVljJooWFUNOCf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Fcu+pYadcgvGDdS/mBeXMmvZwseOekB28eFnHqbW+Oo=;
        b=JVOwi4AyG9P0FzGhGDZ5wP0DIpOW8FREFSOdCBtdJHAahV5jsBE3peh9fMRM7mtNKO
         u5x24R6bTbwWT0tVJMo6q24nLL0/fddG9bRF3/1Q00HVauqvJAvRTh3SU8fSD2xmwfyL
         fgbNfL6tda1PS9MjobF3o15rNxgnNeeD8scIzNcy+T7HGZt6PHqpnuujy2KIDOjjIQ9V
         Suv54d1QI5T0oF/8NfJiNZ2p4FWuXFxR0GXJ/0+TnoG1qFYCKrQdWd3ccXm3qUjKsUd8
         YDpOoZO281RHhpZiuuH7pl5DVIbZz4qwhuTey1yFdSm1R/wSGEPjgkhm8b15h3vJIu49
         jHQw==
X-Gm-Message-State: AOAM531uaOwPTbt3WJlmAXZsZk5bd0zG9aslQWai6G12jbEZOWx6IwFD
	tV28fcjgfAXagjN8Fc4AVrusOQUKT2LT9qyxOs1tVA==
X-Google-Smtp-Source: ABdhPJxAJZ7hCvo4Afd8ZaBhzXTWfvimZXLzY5u3iHR5vS0nap5d4ZpKXYwKp37Pj0pDC90cP+r7qtlmBIdt4nf0VKI=
X-Received: by 2002:a9d:674a:: with SMTP id w10mr52599276otm.305.1594386252650;
 Fri, 10 Jul 2020 06:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <BMXPR01MB33973A13BA96F2FB63428220FD650@BMXPR01MB3397.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <BMXPR01MB33973A13BA96F2FB63428220FD650@BMXPR01MB3397.INDPRD01.PROD.OUTLOOK.COM>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Fri, 10 Jul 2020 14:04:03 +0100
Message-ID: <CAM9ZRVtGbbqD5GuGKEAkrfLy+vmZEfb5deM8k6j9jZyH0=r=0g@mail.gmail.com>
Subject: Re: [OE-core] [poky][master][PATCH] systemd: Fix codesonar warnings
To: Amitanand N Chikorde <Amitanand.Chikorde@kpit.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"raj.khem@gmail.com" <raj.khem@gmail.com>, Nisha Parrakat <Nisha.Parrakat@kpit.com>, 
	Anuj Chougule <Anuj.Chougule@kpit.com>, Aditya Tayade <Aditya.Tayade@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 10 Jul 2020 at 12:55, Amitanand N Chikorde
<Amitanand.Chikorde@kpit.com> wrote:
>
> From: "Amitanand.Chikorde" <Amitanand.Chikorde@kpit.com>
>
> Fixed below systemd codesonar warnings.
> 1. isprint() and isspace() is invoked here with an argument of signed
> type char, but only has defined behavior for int arguments that are
> either representable as unsigned char or equal to the value
> of macro EOF(-1).
>
> As per codesonar report, in a number of libc implementations, isprint()
> and isspace() functions implemented using lookup tables (arrays):
> passing in a negative value can result in a read underrun.
>
> To avoid this unexpected behaviour, typecasted char type argument to
> unsigned char type.
>
> 2. "seqnum" defined, not initialized & used in device-private.c
> Intialized "seqnum" at definition.
>
> Upstream-Status: Pending
> Signed-off-by: Amitanand.Chikorde <amitanand.chikorde@kpit.com>
> ---
>  .../files/systemd_codesonar_warnings_fix.patch      | 105 ++++++++++++++=
++++++
>  5 files changed, 9 insertions(+), 9 deletions(-)
>  create mode 100644 files/systemd_codesonar_warnings_fix.patch
>
> diff --git a/files/systemd_codesonar_warnings_fix.patch b/files/systemd_c=
odesonar_warnings_fix.patch
> new file mode 100644
> index 0000000..8138eba
> --- /dev/null
> +++ b/files/systemd_codesonar_warnings_fix.patch
> @@ -0,0 +1,105 @@
> +systemd: fix codesonar warnings
> +
> +Fixed below systemd codesonar warnings.
> +1. isprint() and isspace() is invoked here with an argument of signed
> +type char, but only has defined behavior for int arguments that are
> +either representable as unsigned char or equal to the value
> +of macro EOF(-1).
> +
> +As per codesonar report, in a number of libc implementations, isprint()
> +and isspace() functions implemented using lookup tables (arrays):
> +passing in a negative value can result in a read underrun.
> +
> +To avoid this unexpected behaviour, typecasted char type argument to
> +unsigned char type.
> +
> +2. "seqnum" defined, not initialized & used in device-private.c
> +Intialized "seqnum" at definition.
> +
> +Signed-off-by: Amitanand N. Chikorde <Amitanand.Chikorde@kpit.com>
> +Upstream-Status: Pending
> +
> +--- origcode/src/libsystemd/sd-device/device-private.c 2020-07-09 18:05:=
13.744127907 +0530
> ++++ modifcode/src/libsystemd/sd-device/device-private.c        2020-07-0=
9 18:01:56.494621945 +0530
> +@@ -560,7 +560,7 @@
> +         char **key;
> +         const char *major =3D NULL, *minor =3D NULL;
> +         DeviceAction action =3D _DEVICE_ACTION_INVALID;
> +-        uint64_t seqnum;
> ++        uint64_t seqnum =3D 0;
> +         int r;
> +
> +         assert(ret);
> +--- origcode/src/libudev/libudev-util.c        2020-07-09 18:05:13.65604=
9515 +0530
> ++++ modifcode/src/libudev/libudev-util.c       2020-07-09 18:02:32.56338=
6414 +0530
> +@@ -171,7 +171,7 @@
> +
> +         /* strip trailing whitespace */
> +         len =3D strnlen(str, len);
> +-        while (len && isspace(str[len-1]))
> ++        while (len && isspace((unsigned char) str[len-1]))
> +                 len--;
> +
> +         /* strip leading whitespace */
> +@@ -182,8 +182,8 @@
> +         j =3D 0;
> +         while (i < len) {
> +                 /* substitute multiple whitespace with a single '_' */
> +-                if (isspace(str[i])) {
> +-                        while (isspace(str[i]))
> ++                if (isspace((unsigned char) str[i])) {
> ++                        while (isspace((unsigned char) str[i]))
> +                                 i++;
> +                         to[j++] =3D '_';
> +                 }
> +--- origcode/src/udev/udevadm-hwdb.c   2020-07-09 18:05:13.612010318 +05=
30
> ++++ modifcode/src/udev/udevadm-hwdb.c  2020-07-09 18:03:26.243530163 +05=
30
> +@@ -487,7 +487,7 @@
> +
> +                 /* strip trailing whitespace */
> +                 len =3D strlen(line);
> +-                while (len > 0 && isspace(line[len-1]))
> ++                while (len > 0 && isspace((unsigned char) line[len-1]))
> +                         len--;
> +                 line[len] =3D '\0';
> +
> +--- origcode/src/udev/udevadm-info.c   2020-07-09 18:05:13.616013882 +05=
30
> ++++ modifcode/src/udev/udevadm-info.c  2020-07-09 18:03:41.621625782 +05=
30
> +@@ -73,7 +73,7 @@
> +
> +                 /* skip nonprintable attributes */
> +                 len =3D strlen(value);
> +-                while (len > 0 && isprint(value[len-1]))
> ++                while (len > 0 && isprint((unsigned char) value[len-1])=
)
> +                         len--;
> +                 if (len > 0)
> +                         continue;
> +--- origcode/src/udev/udev-rules.c     2020-07-09 18:05:13.624021008 +05=
30
> ++++ modifcode/src/udev/udev-rules.c    2020-07-09 18:03:03.227995790 +05=
30
> +@@ -726,7 +726,7 @@
> +                 return -1;
> +
> +         /* skip whitespace */
> +-        while (isspace(linepos[0]) || linepos[0] =3D=3D ',')
> ++        while (isspace((unsigned char) linepos[0]) || linepos[0] =3D=3D=
 ',')
> +                 linepos++;
> +
> +         /* get the key */
> +@@ -738,7 +738,7 @@
> +                 linepos++;
> +                 if (linepos[0] =3D=3D '\0')
> +                         return -1;
> +-                if (isspace(linepos[0]))
> ++                if (isspace((unsigned char) linepos[0]))
> +                         break;
> +                 if (linepos[0] =3D=3D '=3D')
> +                         break;
> +@@ -751,7 +751,7 @@
> +         temp =3D linepos;
> +
> +         /* skip whitespace after key */
> +-        while (isspace(linepos[0]))
> ++        while (isspace((unsigned char) linepos[0]))
> +                 linepos++;
> +         if (linepos[0] =3D=3D '\0')
> +                 return -1;

This patch seems to have got mangled by your email client, please
re-send via `git send-email`.

> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.

I'm not comfortable seeing footers like this on patches, it suggests
that the code above is subject to additional restrictions which would
make it unsuitable for inclusion in an open source project.

--=20
Paul Barker
Konsulko Group
