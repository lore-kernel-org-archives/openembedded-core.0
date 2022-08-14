Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B635CC25B06
	for <webhook@archiver.kernel.org>; Sun, 14 Aug 2022 12:43:14 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.4572.1660480986499339583
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 05:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MZcVoqJ+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id l4so6172410wrm.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 05:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=ZLawP9g5a/ZGHrOTC/XyKy2A9JKtgHP2rTeyjMxVssk=;
        b=MZcVoqJ+YB2xhyBoegeiCec0mGBk/oTDa+OBIzZgvXZzD71hNwSGmyF+x7szicBLe8
         klKbEWoG/NNXKpu+s/7bK2BhHmvmSYc3aCxqEJ7qvQ1RQiGOMUZd+7fbQ6rC5kQyQVbH
         zHZc7scB2tFWFMrrJ5oF78buXgrCXQ32O7kkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=ZLawP9g5a/ZGHrOTC/XyKy2A9JKtgHP2rTeyjMxVssk=;
        b=VPzjQRM4a3zADYGq0xckTlcnnidJShYigbHYTb+TUD2jw9hsdGKKbnq3XYUpFF/JKW
         BBSDamZtY/ML8ZIXu2JZBPWlT0N8JNuLUvCTvbYtDGGy6F7VIKI3pdNfMbi3KEpV6baC
         OjmrPiN2V3fuemyUpBDQXNKbOf2V/YIT1jm3cSyJo7OOLM7vB3SZnSEHbnhT5p3uk05T
         CGexYwNRe6++AoO6qMDP8QUxBnitRP+Ny/4Vu+Nr8Ygm9jRorWzlXAJcRDtjD10Ub16x
         bDKN3qr78HfSWbaLzGBdXKSxaJDNKK5i72flHSXVaoyq5yVPJa+vOss+mF/wJIUAs9eY
         eoRQ==
X-Gm-Message-State: ACgBeo1OS+fYqkFuGtc4oNgH75N9lhweE+KHWCSYD2U5/sgs0tcyDbjK
	QfgiEwjNTG9R9nOY2Se218k4v8tWk8BeaA==
X-Google-Smtp-Source: 
 AA6agR6f/MZJWrVVgEyWfI+u1alMTU1xrRRxVjN9xsX5q7bGZHE39FWCtvyUjV3UU1Ix/bC3wj5Aaw==
X-Received: by 2002:adf:fd4a:0:b0:220:66b6:83ab with SMTP id
 h10-20020adffd4a000000b0022066b683abmr6472025wrs.360.1660480984544;
        Sun, 14 Aug 2022 05:43:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a4b0:91f3:f2:f39?
 ([2001:8b0:aba:5f3c:a4b0:91f3:f2:f39])
        by smtp.gmail.com with ESMTPSA id
 v2-20020adf8b42000000b0021e74ef5ae8sm4623178wra.21.2022.08.14.05.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 05:43:03 -0700 (PDT)
Message-ID: 
 <c316990afed0a1ce620c186ec595a39233c82e86.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/5] gcc: Resolve relative prefix-map filenames
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 14 Aug 2022 13:43:02 +0100
In-Reply-To: <170B01D5C8A5AC22.16737@lists.openembedded.org>
References: <170B01D5C8A5AC22.16737@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Aug 2022 12:43:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169322

On Sat, 2022-08-13 at 21:34 +0100, Richard Purdie via
lists.openembedded.org wrote:
> Add a patch to gcc so that relative paths are handled by -fdebug-prefix-m=
ap
> and friends. In OE we use relative paths in autotools and removing that
> creates a lot of issues we'd have to fix. This alternative allows us to
> fix the paths within gcc and improve our debug file coverage (and SPDX
> manifests) accordingly.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/gcc/gcc-12.1.inc        |  1 +
>  .../gcc/gcc/prefix-map-realpath.patch         | 46 +++++++++++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/prefix-map-realpath.pat=
ch
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-12.1.inc b/meta/recipes-devtoo=
ls/gcc/gcc-12.1.inc
> index 56678c78bef..c42fa3d72f0 100644
> --- a/meta/recipes-devtools/gcc/gcc-12.1.inc
> +++ b/meta/recipes-devtools/gcc/gcc-12.1.inc
> @@ -65,6 +65,7 @@ SRC_URI =3D "${BASEURI} \
>             file://0025-Move-sched.h-include-ahead-of-user-headers.patch =
\
>             file://0026-rust-recursion-limit.patch \
>             file://0001-libsanitizer-cherry-pick-9cf13067cb5088626ba7-fro=
m-u.patch \
> +           file://prefix-map-realpath.patch \
>  "
>  SRC_URI[sha256sum] =3D "62fd634889f31c02b64af2c468f064b47ad1ca78411c45ab=
e6ac4b5f8dd19c7b"
> =20
> diff --git a/meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch b/me=
ta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch
> new file mode 100644
> index 00000000000..137fc645624
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch
> @@ -0,0 +1,46 @@
> +Relative paths don't work with -fdebug-prefix-map and friends. This
> +can lead to paths which the user wanted to be remapped being missed.
> +Setting -fdebug-prefix-map to work with a relative path isn't practical
> +either.
> +
> +Instead, call gcc's realpath function on the incomming path name before
> +comparing it with the remapping. This means other issues like symlinks
> +are also accounted for and leads to a more consistent remapping experien=
ce.
> +
> +Upstream-Status: Pending [need to see if gcc developers would accept thi=
s]
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +
> +Index: gcc-12.1.0/gcc/file-prefix-map.cc
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-12.1.0.orig/gcc/file-prefix-map.cc
> ++++ gcc-12.1.0/gcc/file-prefix-map.cc
> +@@ -70,19 +70,25 @@ remap_filename (file_prefix_map *maps, c
> +   file_prefix_map *map;
> +   char *s;
> +   const char *name;
> ++  char *realname;
> +   size_t name_len;
> +=20
> ++  realname =3D lrealpath (filename);
> ++
> +   for (map =3D maps; map; map =3D map->next)
> +-    if (filename_ncmp (filename, map->old_prefix, map->old_len) =3D=3D =
0)
> ++    if (filename_ncmp (realname, map->old_prefix, map->old_len) =3D=3D =
0)
> +       break;
> +-  if (!map)
> ++  if (!map) {
> ++    free (realname);
> +     return filename;
> +-  name =3D filename + map->old_len;
> ++  }
> ++  name =3D realname + map->old_len;
> +   name_len =3D strlen (name) + 1;
> +=20
> +   s =3D (char *) ggc_alloc_atomic (name_len + map->new_len);
> +   memcpy (s, map->new_prefix, map->new_len);
> +   memcpy (s + map->new_len, name, name_len);
> ++  free (realname);
> +   return s;
> + }
> +=20


Seems there is a downside to this, it breaks ruby and xen-tools:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/1386/ste=
ps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/482/step=
s/12/logs/stdio

which both do:

#include __FILE__

I'm tempted to suggest we patch that to something different in both
cases as the alternatives to debug handling are much worse.

Cheers,

Richard


