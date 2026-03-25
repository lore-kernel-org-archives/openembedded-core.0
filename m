Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D239109C02E
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 14:46:58 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24028.1774450016400264058
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 07:46:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dxSeHiDv;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79a7109f568so53010867b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 07:46:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774450015; cv=none;
        d=google.com; s=arc-20240605;
        b=GvkS9kc3Y+ufUxjkp/Be9ccwGDQjDfv0VaPoGK/6HSDXkHikzXKIY++OBGoHFr63EG
         /jdY3/0fldfGseUBo11zdrOPB/7u/+9m0jb7RjGRQeUa5QpqmkjLbIC8p/x+koei6dZv
         hI1t2bDJp8ryy97Cn4ObUkv0Pt/I0zAnFk9lwv6IaQdxdCvGQ/KlQ1T7DxwzhdqdiebW
         uF5A+Vmr/orEiGjozlqzRHMAcwEHdf51IfvGO2LR9KfxUtOIOZHgKU1yMsfKyq5Jco5N
         CYoEMsZHC9Bc5vdSeU8/cJzUkiuIGXt2dLYbqLZQu5lTXOgg5gTO2OaS6eW+MFELZ/s3
         Ykyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=daUuC1JpFls4+jqXkRjr5HHiweGpGxZS2JUYRqAOSik=;
        fh=Z19FJ1t1dQtX/teZcsv0yxsxLHYQGyF7uZDEYV3WQtE=;
        b=ag/hl1ktCl3VOC9+3cMHrXjSHa+IxYhnK+sIVJmHqBFY5zNDRKlliAUvEwQER2OlNb
         7tizupzVg6MILswDrLBDMdG8yZt/54vDm7roaHCOQHBRWFAG+pXwDaKSWJ2VnaCIUHfr
         McKOwXNMjh5isfDdbpYU19daFTgrAZ7OHb0ZFHMS6swhFLtGWJLYF6m1GJAX8vd14gHg
         3eXIsc7rNS1+pLVZvA2UFSkZB33xMS5W0j/BP23KpOcKSo2a793TzbOf7zbAwleueEb4
         h0dG9slLK/GsmXCIVCED7Yjkex8QAIODAG3nvM4IIVLE0Szd6WnqvRTFE1P8RAb0Yzvy
         Gkeg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774450015; x=1775054815; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=daUuC1JpFls4+jqXkRjr5HHiweGpGxZS2JUYRqAOSik=;
        b=dxSeHiDvuOhn4fYFk/PXNIH/6/ZDmKktD3aKDvYQKIZDeNyOWKwDJRTrrplf9g9Xjb
         igC7lM3HfrVRzjfG8IJrwiLEedCgc8a9m3EEr+QcvftHKqbOSmOkObfUH7+kGZbsfvlY
         +abJfCiqBSbxusYy5tvwQrMzEM80xjfDuv2ZNs+9wY/XKJZ4CNIFPPfwQY08HudJQwUO
         OKDNzwa3DVhoE6TKEy8G7skQZs9sqsl7ROLxsjVUEA8dYTLRephNGbwRWhF4DgPwzCIv
         mKf05MS6DIMhweYaFmQd7Xmi7042seTAUMlTaNRGcSr+GCqEhZ2DKKY4cNRvN5DHQeX+
         g/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774450015; x=1775054815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=daUuC1JpFls4+jqXkRjr5HHiweGpGxZS2JUYRqAOSik=;
        b=atSzGRz+E5oH+ZUfBvqmBFEF+KSpRooD5IEOrJxA/XMwkMW/s87YpJKbsALk7+Hbev
         NeI6lizKABep8mw1Kfd2OyCsoWHcXZYM6pFf6e72KFR7M661KNdYSgNB2Df+1pvpgjs1
         VcbcUX6MZ9CFSes5xVkU7m68D0Tnbc2VGl22wUNANjqFVCDo/g8fHc/7YteL/7AmrDs7
         kK+dVpwQ4QLR2SLw3wgy4gFNj46RG1f1eX7/J5fhOwmWW8KBu1hypAegb0lzeVp8vsn7
         FNs3a/7bP56jfRCNm6wBzo+b/UETK9lMg2VgQ3whaiYPJvihsJFIXvgH07FQaHg1QBJM
         XBRg==
X-Gm-Message-State: AOJu0YyXoyC+NEH9hNji0GtW4zrYQ6Iqyekm9Lll/yKMCPGzoEBrTd5q
	gnmYlkdvgl/f1FBEeh2ubWCdhQSiMbrgoGTA30+lffRYeTECzDmkvC3wxWAG4bzwO5v3guzxmIQ
	d7jPvKma10p45g4kQtyqvjVnYjyyc3Lc=
X-Gm-Gg: ATEYQzyKuxmqaVa38Q3ffumvmF2RQoY8WkpmtJjoBKmG0fFUalpzfcdac0/wCjZu+2Q
	gghTDYmTNwSpqEwOyu8hAavPAuIVIDR9U7L6QMzM7wwWUi2Ai9kqWO3Hi1wnLscS4Ivim3dwnmu
	Mpi5Zcx3HRp2IosSpkZ5w33c9FP7trgmqox2TUZncfKcNBYWFNrynUAiHM1lcdJ2XXB/tSPf6R0
	SbjrAeX3exXSAvyNu3V6up4kxGo9kjDHrrUgPCX2A4WN5aSkGgzfpHV6ncJL69xkZSaW64zKqoJ
	8XUgQnxF5Tka4uFn6KT2EAH4X3vTciAC6Bigd1PtQvUgZ6RBj9luegZ5F7eAbJ7C3rL9TqF8GeH
	IsVJS6tz0HPYEakf4tgoXN4NYQ92Wvqo0z08=
X-Received: by 2002:a05:690e:2451:b0:64d:29a4:c933 with SMTP id
 956f58d0204a3-64ee614916bmr2846195d50.56.1774450015328; Wed, 25 Mar 2026
 07:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260325073954.1176537-1-khem.raj@oss.qualcomm.com> <CANNYZj9AkosvmmNePiALvwVkR2rsthvsGy3ARLTmWxKh=t7OaQ@mail.gmail.com>
In-Reply-To: <CANNYZj9AkosvmmNePiALvwVkR2rsthvsGy3ARLTmWxKh=t7OaQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Mar 2026 07:46:28 -0700
X-Gm-Features: AaiRm51K1mLC2jf5PNKxXlvDHTklGzNL7IyJbeZuj-h7zgNiUKJEdIqPa5cP_WE
Message-ID: <CAMKF1soXSQxLU3eRCejvHH5HORG9xRMxObU+svnAdd10JAs37Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa-tools-native: fix do_compile failure
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Changqing Li <changqing.li@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000d5df41064dda5685"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 14:46:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233922

--000000000000d5df41064dda5685
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 5:52=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> On Wed, 25 Mar 2026 at 08:40, Khem Raj via lists.openembedded.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> > Fix do_compile failure:
> > ../sources/mesa-26.0.1/src/panfrost/lib/kmod/pan_kmod.c:7:10: fatal
> error: xf86drm.h: No such file or directory
>
> > -DEPENDS +=3D "libclc-native spirv-tools-native
> spirv-llvm-translator-native"
> > +DEPENDS +=3D "libclc-native spirv-tools-native
> spirv-llvm-translator-native libdrm-native"
>
> Should this be in PACKAGECONFIG for panfrost?
>

I have opengl-only image to build for odroid-c4 which does not have
panfrost.


>
> Alex
>

--000000000000d5df41064dda5685
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 25,=
 2026 at 5:52=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanav=
in@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Wed, 25 Mar 2026 at 08:40, Khem Raj =
via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"=
_blank">lists.openembedded.org</a><br>
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; Fix do_compile failure:<br>
&gt; ../sources/mesa-26.0.1/src/panfrost/lib/kmod/pan_kmod.c:7:10: fatal er=
ror: xf86drm.h: No such file or directory<br>
<br>
&gt; -DEPENDS +=3D &quot;libclc-native spirv-tools-native spirv-llvm-transl=
ator-native&quot;<br>
&gt; +DEPENDS +=3D &quot;libclc-native spirv-tools-native spirv-llvm-transl=
ator-native libdrm-native&quot;<br>
<br>
Should this be in PACKAGECONFIG for panfrost?<br></blockquote><div><br></di=
v><div>I have opengl-only image to build for odroid-c4 which does not have =
panfrost.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
Alex<br>
</blockquote></div></div>

--000000000000d5df41064dda5685--

