Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3266C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 09:38:57 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.3402.1742463528181696772
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 02:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QjYe4GOu;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e90b8d4686so4777206d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 02:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742463527; x=1743068327; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kr+0eELi00KnGOilhDF64WZq0f7QK6StwJBHdt71wv8=;
        b=QjYe4GOuejEHBPgU49OcmzaP2S5sAcATd5q11gd1OBADJt8WbZpfQTtH0hI5Ke61pv
         8LzE5D7wxt+hjOpJPnZn5kEPwtFxZzIXXKG8/zH/+V+C+i4xxZOE3k3HvBsaxzaEQtxV
         bihAK0GASCD6Tw3qID1V0/c6/uI+I8p0n0NfUQg1BNyYbGGU6rk0M+2Yi1Z4C7B1XNol
         aCmV8sxMmZtF+ljENv2ekW9ptMRRM8EL1BB2w8vtVGyMBMiLu3A1XUPaF7TGhgF23hVe
         7SqDBcKicJFQzpC7s2//xtlz6DlwCTKcb0ZGAZzvVN8gTj1NYmdtRqNzi5G6uSmiXoUZ
         xYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742463527; x=1743068327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kr+0eELi00KnGOilhDF64WZq0f7QK6StwJBHdt71wv8=;
        b=dp827lGaofMSYV8v5L/E+JXl8R8dTXIBSYjAC7meBUbo3+FZdqoREyEPuyXxUP5rSL
         rJkOlSNIiFnB7RNYnoYcK364n49ARwZsGrxy7AqxDDhv6p8wCo/vnt31A9r5QZ0vnXYm
         VcnpsutT2iAtRdjUfaaX18ABFoN4RVdhJ2jf1M3X2ACTp097Rdf/FwsnqXfS/8XT9eXD
         H5HQh9gDJ7txyY0hhjacVgvprmFHoviv6mdPDpCh6oy6O2Boal+FMK1ZmS6W2l6zqpK1
         zn92Tcw4YoVXvwmwGLsXW7T3jq5w/j6AL0a6CYKTfwcImFxO97GwX7L3Qa6o7BPPP4h/
         69hg==
X-Gm-Message-State: AOJu0YwlK+cMONmAL1uLb5KM9YUSTetoYzWhBanRjyz228NdUGsXvYnY
	wVzAwB3XLhbEhQsur8/OXQhxTpL+FU0H5ZhigGqwEr82XpiDVGxPMhTEHfKLmN5axqn9oOsdUBC
	KScjcbsFUUjTDAgR9lyAXKk25SaU=
X-Gm-Gg: ASbGncv5KuIpFSFLYYSv+DQcUavsn35q9WxMG2UDVuT2dqrJq4R2p1YiuQyUG/i0XTP
	vOqdaSb/8ZXeEhvNNu20lks9iSbta3fPE7+SCOmCOCFqbMJ+3gYoWVafTwa/D34zIW+uw71vXpS
	KAoGAevy0ofrEmQg52F2GjGrEUltsaAim7rNBieaQCkmSloR4DeKpJuqRccwKm
X-Google-Smtp-Source: AGHT+IGQi+KJ9UvVJqU7LBaA8nTXTPoDrxe6nFkmrb2jvxe2l97T7JoCvnRqWBxC22KSwKivrTZ2jMYNKJjSRAEV0zI=
X-Received: by 2002:a05:6214:2a4b:b0:6d4:1425:6d2d with SMTP id
 6a1803df08f44-6eb294475b4mr76092396d6.43.1742463527211; Thu, 20 Mar 2025
 02:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250320092959.563213-1-matthias.schiffer@ew.tq-group.com>
In-Reply-To: <20250320092959.563213-1-matthias.schiffer@ew.tq-group.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Mar 2025 10:38:36 +0100
X-Gm-Features: AQ5f1Jo28MuIUVFivdeN1j_0tynYHpUkGmAe95xXgQVqLPbITs0Yvn9bv9tSTS8
Message-ID: <CANNYZj-3xbjCraHfGwFo_VmH4FQxYFmQ-3EePQ6GZ4scVwW2_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "git: git-replacement-native: depend on ca-certificate"
To: matthias.schiffer@ew.tq-group.com
Cc: openembedded-core@lists.openembedded.org, 
	Max Krummenacher <max.krummenacher@toradex.com>, oss@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 09:38:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213376

You shouldn't just revert things like that, without explaining how
this will avoid bringing back the original problem :-/

Alex

On Thu, 20 Mar 2025 at 10:30, Matthias Schiffer via
lists.openembedded.org
<matthias.schiffer=3Dew.tq-group.com@lists.openembedded.org> wrote:
>
> This reverts commit 2e99ffda70fd95b5eab3de47048032349cd66f4b.
>
> git-replacement-native is used only to provide a newer version than may
> be installed on the system; apart from that, it should work more or less
> the same. In particular, it is using the host system's /etc/gitconfig;
> it should also use the system CA certificates, otherwise it will break
> HTTPS connections in environments that need local certificates, for
> example for a corporate HTTP proxy.
>
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  meta/recipes-devtools/git/git_2.49.0.bb | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/git/git_2.49.0.bb b/meta/recipes-devto=
ols/git/git_2.49.0.bb
> index 66082d0bde..2ca8711f75 100644
> --- a/meta/recipes-devtools/git/git_2.49.0.bb
> +++ b/meta/recipes-devtools/git/git_2.49.0.bb
> @@ -4,7 +4,6 @@ DESCRIPTION =3D "Git is a free and open source distribute=
d version control system
>  SECTION =3D "console/utils"
>  LICENSE =3D "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause & MIT & BSL-=
1.0 & LGPL-2.1-or-later"
>  DEPENDS =3D "openssl zlib"
> -DEPENDS:class-native +=3D "ca-certificates"
>
>  PROVIDES:append:class-native =3D " git-replacement-native"
>
> @@ -97,7 +96,6 @@ perl_native_fixup () {
>
>  REL_GIT_EXEC_PATH =3D "${@os.path.relpath(libexecdir, bindir)}/git-core"
>  REL_GIT_TEMPLATE_DIR =3D "${@os.path.relpath(datadir, bindir)}/git-core/=
templates"
> -REL_GIT_SSL_CAINFO =3D "${@os.path.relpath(sysconfdir, bindir)}/ssl/cert=
s/ca-certificates.crt"
>
>  do_install:append:class-target () {
>         perl_native_fixup
> @@ -106,7 +104,6 @@ do_install:append:class-target () {
>  do_install:append:class-native() {
>         create_wrapper ${D}${bindir}/git \
>                 GIT_EXEC_PATH=3D'`dirname $''realpath`'/${REL_GIT_EXEC_PA=
TH} \
> -               GIT_SSL_CAINFO=3D'`dirname $''realpath`'/${REL_GIT_SSL_CA=
INFO} \
>                 GIT_TEMPLATE_DIR=3D'`dirname $''realpath`'/${REL_GIT_TEMP=
LATE_DIR}
>  }
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> https://www.tq-group.com/
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213375): https://lists.openembedded.org/g/openembedde=
d-core/message/213375
> Mute This Topic: https://lists.openembedded.org/mt/111805445/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

