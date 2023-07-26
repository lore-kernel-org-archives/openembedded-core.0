Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82F3C0015E
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 21:54:03 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.154.1690408437655986362
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 14:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=OaGU3Wno;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6b9d16c1f3bso219357a34.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 14:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690408437; x=1691013237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDD9u18ytHTIoSPYhczTwWOHGwoxhvEXcviduAsuTiQ=;
        b=OaGU3Wno5Uu62PVoEzu8+lp7UhfVbBVjyE0IOsQQ2pAOG4Br8+opyEQ5MrUZaxl32L
         WA5jdmfa3Ma2f6sEOOZ8QZR7QZyOQRgHygSAyFeULAeBHs+SncaDBh5RzNRC7rv4tUVw
         TO9EDuluwrMu2E7A2qvZQTAt9n2mpqX4UEO6j7sO/xy8gt3P0HPtg+fZg4pV8QGrfn+1
         g3RzN3fE5GKgqCsJZftMaLtmt/ewDPNpfHP2PvIMastAq/cabsVUO4xL/blsR624+/kX
         QDHSjxr8JTfVzQAkKV1qtENO/5DFVu3gk0N7mCpD/jshJLZX93H7ZXsNwTjjgxedkVRS
         qwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690408437; x=1691013237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lDD9u18ytHTIoSPYhczTwWOHGwoxhvEXcviduAsuTiQ=;
        b=BZjaScmVJNOfuH8M97A25XWCI8wj4zcrymlhO3mOhAwECx8tOFSa9/gyE0kuEJujtQ
         E3tcFkDDg9Jis9J3WIHd+ahmh1Jm/NDXsklrip356rS4t4zLnzmKJEbbwopaKy3iUI98
         BErx/38COyJrU88gWxmF48nljjjVzkVuOof3gBtYNsgt2WKBCo+TK2zGFsLLYmj39SKz
         2rsclQ5Z2vLMoBOFP2H8zZLOkUPa1bbNyoG+uEtN/6mLiWEzH5rsMMlfFYexrDqaer5P
         tNkXpdaJN9t3zUL7LrTeT/siTmMDiJ/Ie9pY/mwk5hJSKqu1kn+zCiXUDPVdfLOJcy+E
         lLIQ==
X-Gm-Message-State: ABy/qLZxiCsC3caMpy6tSJeJ96noBWX37Osp4unTJLZLnfZjQqjjIf4Q
	sZQztUUYZOEF1iA6nUAYjTPhscgybNrrMgv21wo=
X-Google-Smtp-Source: APBJJlF++o59jqk63xDsT+dpta4SLNqEpS/qK9sTNCS2r6iyHqKNXzhwMeYw6MUXKqJja6d4+02Sgxfmg8INW+bavpw=
X-Received: by 2002:a9d:7d0f:0:b0:6b9:70b1:4aab with SMTP id
 v15-20020a9d7d0f000000b006b970b14aabmr3621510otn.14.1690408436767; Wed, 26
 Jul 2023 14:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230726195044.1453294-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230726195044.1453294-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Jul 2023 14:53:30 -0700
Message-ID: <CAMKF1srS88pj5UPBuDBP6ec7qUS85R7vsT7vkTM-EgQ+r=NmOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] createrepo-c: Fix 32 bit architecture segfaults
 with 64 bit time
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 21:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184902

On Wed, Jul 26, 2023 at 12:50=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> After including time64.inc, createrepo-c was segfaulting on 32 bit archit=
ectures
> when creating repo indexes (even for an empty repo).
>
> Add a patch from Khem to fix this and some other compiler warnings relate=
d to 64
> bit time on 32 bit.
>
> [YOCTO #15170]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../createrepo-c/createrepo-c/time64fix.patch | 69 +++++++++++++++++++
>  .../createrepo-c/createrepo-c_0.21.1.bb       |  1 +
>  2 files changed, 70 insertions(+)
>  create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/time6=
4fix.patch
>
> diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/time64fix.pa=
tch b/meta/recipes-devtools/createrepo-c/createrepo-c/time64fix.patch
> new file mode 100644
> index 00000000000..d022d95b703
> --- /dev/null
> +++ b/meta/recipes-devtools/createrepo-c/createrepo-c/time64fix.patch
> @@ -0,0 +1,69 @@
> +From 89e1c9415fb8438310036d5810cdb7da75ee3a7f Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 26 Jul 2023 12:27:14 -0700
> +Subject: [PATCH] Adjust printf formats for 64bit time_t on 32bit systems
> +
> +Fixes format specifier mismatch warnings as well while here
> +
> +e.g.
> +warning: format '%ld' expects argument of type 'long int', but argument =
2 has type 'time_t'
> +
> +Upstream-Status: Pending

Its also submitted upstream now so you may want to change the status
to Submitted [https://github.com/rpm-software-management/createrepo_c/pull/=
376]

> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/createrepo_c.c    | 4 ++--
> + src/misc.c            | 4 ++--
> + src/xml_dump_repomd.c | 2 +-
> + 3 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/createrepo_c.c b/src/createrepo_c.c
> +index 8681419..0f9048a 100644
> +--- a/src/createrepo_c.c
> ++++ b/src/createrepo_c.c
> +@@ -582,9 +582,9 @@ duplicates_warning(const char *nevra, GArray *locati=
ons, CmdDupNevra option)
> +   for (size_t i=3D0; i<locations->len; i++) {
> +       struct DuplicateLocation location =3D g_array_index(locations, st=
ruct
> +                                                         DuplicateLocati=
on, i);
> +-      g_warning("    Sourced from location: \'%s\', build timestamp: %l=
d%s",
> ++      g_warning("    Sourced from location: \'%s\', build timestamp: %j=
d%s",
> +                 location.location,
> +-                location.pkg->time_build,
> ++                (intmax_t) location.pkg->time_build,
> +                 location.pkg->skip_dump ? skip_reason : "");
> +
> +   }
> +diff --git a/src/misc.c b/src/misc.c
> +index 8511ca2..7866c7b 100644
> +--- a/src/misc.c
> ++++ b/src/misc.c
> +@@ -1512,11 +1512,11 @@ cr_append_pid_and_datetime(const char *str, cons=
t char *suffix)
> +     gettimeofday(&tv, NULL);
> +     timeinfo =3D localtime (&(tv.tv_sec));
> +     strftime(datetime, 80, "%Y%m%d%H%M%S", timeinfo);
> +-    gchar *result =3D g_strdup_printf("%s%jd.%s.%ld%s",
> ++    gchar *result =3D g_strdup_printf("%s%jd.%s.%jd%s",
> +                                     str ? str : "",
> +                                     (intmax_t) getpid(),
> +                                     datetime,
> +-                                    tv.tv_usec,
> ++                                    (intmax_t) tv.tv_usec,
> +                                     suffix ? suffix : "");
> +     return result;
> + }
> +diff --git a/src/xml_dump_repomd.c b/src/xml_dump_repomd.c
> +index 33b0e09..9d24249 100644
> +--- a/src/xml_dump_repomd.c
> ++++ b/src/xml_dump_repomd.c
> +@@ -143,7 +143,7 @@ cr_xml_dump_repomd_body(xmlNodePtr root, cr_Repomd *=
repomd)
> +                            BAD_CAST repomd->revision);
> +     } else {
> +         // Use the current time if no revision was explicitly specified
> +-        gchar *rev =3D g_strdup_printf("%ld", time(NULL));
> ++        gchar *rev =3D g_strdup_printf("%jd", (intmax_t) time(NULL));
> +         xmlNewChild(root, NULL, BAD_CAST "revision", BAD_CAST rev);
> +         g_free(rev);
> +     }
> +--
> +2.41.0
> +
> diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb b/=
meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb
> index 5080131dc1e..57f23b8dfdb 100644
> --- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb
> +++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb
> @@ -8,6 +8,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/cre=
aterepo_c;branch=3Dmaster;p
>             file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.p=
atch \
>             file://0001-include-rpm-rpmstring.h.patch \
>             file://0001-src-cmd_parser.c-add-a-missing-parameter-name.pat=
ch \
> +           file://time64fix.patch \
>             "
>
>  SRCREV =3D "0652d7303ce236e596c83c29ccc9bee7868fce6e"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184901): https://lists.openembedded.org/g/openembedde=
d-core/message/184901
> Mute This Topic: https://lists.openembedded.org/mt/100378249/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

