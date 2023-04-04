Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD71C761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 11:13:51 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.98477.1680606827519230685
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 04:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AEn8ERCT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id n19so18781345wms.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 04:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680606825;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+yEvJVKueeOmFBfXfTFxR38+Haxq/9/WX7HDZlVoO4=;
        b=AEn8ERCT4xPpPCFPb+Y77spR7cC6NhqadK9D9ahWuKoNInxtHq0y9S0sIzOx0YuZYT
         mhDi6BO7/5RolQKoCH6rF0LjpjtabXnRCf5qrJuLanJEyNOkKo7G4D480t88R4KBViqE
         TxE7gO29WlVJBW9edQU5vPvwh84pDcwh5yXIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680606825;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x+yEvJVKueeOmFBfXfTFxR38+Haxq/9/WX7HDZlVoO4=;
        b=7nuqTL2j/1srOEcd8bAb2xhSIE+lTE2ppR17J4kO1J6RwJknwfJTscU4M2ITPXDLUx
         l0lz4FTWiuD5q00q/kAVZ4YC11GmFgkItsDG9W7/AxAG8LE5qfdsI0E9R8jBn5GWnlXp
         ptgV5+TFbSu7DhuBqWeYoVakgCXwQimQGZPMyyiUsYeAoT8N7exNGtpbi0amU2J+sa+A
         oXUGeREF6ZTfvTX/nO+JeW7U8CzqQMtps8gNr0kmh5uPU1AjqC8O581OmRft608FkrV1
         AHk2Phgj38FRTNZwX0uKIwskwP93qTUVrO0yB3ErJTSruV3v2ISfqlfeMMHh7PBHZh3A
         BTfQ==
X-Gm-Message-State: AAQBX9fF0/NAHMpmYDNkuHVbozGg7ZG+nJ6oFbMCeWWijL7tWdB8taeZ
	INvhk4Np6IQWlJ0wqwz0WEGpzg==
X-Google-Smtp-Source: AKy350bbUZDJ5f3zvJyn/+kjkfEUGG7Bvam81mwbFciW49CWnf6EpSUJ94ZVKcuwI/EJ7l3jWcfCyg==
X-Received: by 2002:a1c:7309:0:b0:3f0:3049:b216 with SMTP id d9-20020a1c7309000000b003f03049b216mr1811744wmb.28.1680606825605;
        Tue, 04 Apr 2023 04:13:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ff0f:d6ee:8211:76e0? ([2001:8b0:aba:5f3c:ff0f:d6ee:8211:76e0])
        by smtp.gmail.com with ESMTPSA id n5-20020a1c7205000000b003f049a42689sm11220371wmc.25.2023.04.04.04.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 04:13:45 -0700 (PDT)
Message-ID: <08a0c4ee45e75ca3f56ba66a6cbf2f3c96444e6b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] mesa: fix non-trivial designated initializers
 issue
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kai Kang <kai.kang@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 04 Apr 2023 12:13:44 +0100
In-Reply-To: <20230404092124.27242-1-kai.kang@windriver.com>
References: <20230404092124.27242-1-kai.kang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 11:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179685

On Tue, 2023-04-04 at 17:21 +0800, Kai Kang wrote:
> From: Kai Kang <kai.kang@windriver.com>
>=20
> It fails to compile intel/compiler/brw_simd_selection.cpp with g++ 7.5.0:
>=20
> > mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp: In function =E2=
=80=98int
>   brw_simd_select_for_workgroup_size(const intel_device_info*,
>   const brw_cs_prog_data*, const unsigned int*)=E2=80=99:
> > mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp:205:7: sorry,
>   unimplemented: non-trivial designated initializers not supported
> >        };
> >        ^
>=20
> Initialize the leading 2 members to fix the issue.
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  ...on.cpp-fix-non-trivial-designated-in.patch | 59 +++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa.inc           |  1 +
>  2 files changed, 60 insertions(+)
>  create mode 100644 meta/recipes-graphics/mesa/files/0001-brw_simd_select=
ion.cpp-fix-non-trivial-designated-in.patch
>=20
> diff --git a/meta/recipes-graphics/mesa/files/0001-brw_simd_selection.cpp=
-fix-non-trivial-designated-in.patch b/meta/recipes-graphics/mesa/files/000=
1-brw_simd_selection.cpp-fix-non-trivial-designated-in.patch
> new file mode 100644
> index 0000000000..9db738cdc0
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-brw_simd_selection.cpp-fix-no=
n-trivial-designated-in.patch
> @@ -0,0 +1,59 @@
> +From 6fd92cfc8a52a1884b8bc45b9ac0c7ceaf492a58 Mon Sep 17 00:00:00 2001
> +From: Kai Kang <kai.kang@windriver.com>
> +Date: Mon, 27 Mar 2023 21:19:36 +0800
> +Subject: [PATCH] brw_simd_selection.cpp: fix non-trivial designated
> + initializers issue
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +It fails to compile intel/compiler/brw_simd_selection.cpp with g++ 7.5.0=
:
> +
> +| mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp: In function =E2=
=80=98int
> +  brw_simd_select_for_workgroup_size(const intel_device_info*,
> +  const brw_cs_prog_data*, const unsigned int*)=E2=80=99:
> +| mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp:205:7: sorry,
> +  unimplemented: non-trivial designated initializers not supported
> +|        };
> +|        ^
> +
> +Initialize the leading 2 members to fix the issue.
> +
> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/22138]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> + src/intel/compiler/brw_simd_selection.cpp | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/intel/compiler/brw_simd_selection.cpp b/src/intel/compi=
ler/brw_simd_selection.cpp
> +index 1515e538b74..4c065f9884a 100644
> +--- a/src/intel/compiler/brw_simd_selection.cpp
> ++++ b/src/intel/compiler/brw_simd_selection.cpp
> +@@ -232,10 +232,14 @@ brw_simd_select_for_workgroup_size(const struct in=
tel_device_info *devinfo,
> +                                    const struct brw_cs_prog_data *prog_=
data,
> +                                    const unsigned *sizes)
> + {
> ++   void *mem_ctx =3D ralloc_context(NULL);
> ++
> +    if (!sizes || (prog_data->local_size[0] =3D=3D sizes[0] &&
> +                   prog_data->local_size[1] =3D=3D sizes[1] &&
> +                   prog_data->local_size[2] =3D=3D sizes[2])) {
> +       brw_simd_selection_state simd_state{
> ++         .mem_ctx =3D mem_ctx,
> ++         .devinfo =3D devinfo,
> +          .prog_data =3D const_cast<struct brw_cs_prog_data *>(prog_data=
),
> +       };
> +=20
> +@@ -257,8 +261,6 @@ brw_simd_select_for_workgroup_size(const struct inte=
l_device_info *devinfo,
> +    cloned.prog_mask =3D 0;
> +    cloned.prog_spilled =3D 0;
> +=20
> +-   void *mem_ctx =3D ralloc_context(NULL);
> +-
> +    brw_simd_selection_state simd_state{
> +       .mem_ctx =3D mem_ctx,
> +       .devinfo =3D devinfo,
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 8f72f25c17..caab1eff6d 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -17,6 +17,7 @@ PE =3D "2"
>  SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-meson.build-check-for-all-linux-host_os-combinati=
ons.patch \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
> +           file://0001-brw_simd_selection.cpp-fix-non-trivial-designated=
-in.patch \
>             "
> =20
>  SRC_URI[sha256sum] =3D "01f3cff3763f09e0adabcb8011e4aebc6ad48f6a4dd4bae9=
04fe918707d253e4"

There is feedback upstream suggesting this causes a memory leak?

Cheers,

Richard


