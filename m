Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1249FC021A0
	for <webhook@archiver.kernel.org>; Sun, 16 Feb 2025 02:04:20 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.22289.1739671453174800427
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 18:04:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rd2BHtVx;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2bc52407b78so1250249fac.0
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 18:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739671452; x=1740276252; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PAI75OoYTRF/2oJ3FX75gKYqzLOwAqHdivJ1fmnoQk=;
        b=Rd2BHtVx3hLT3J47tpCgdBUd/3efTePieDPFgZm4JqIACF0vMlT1sRDOUIt7Zo4i5y
         /62acpVa7YoYubwpuWEw47GZvMhoHIRQeSsByDv0CwhA1i7agzbc5rzDxwv2OPc9DkOh
         KG93r6Ogt6s2XtEPl3swe4eFlxqqobmJ+DTdAxyDFZitud+hBHn4HoLZmC5wLNv1VQ+k
         +tSraKMVdZto8sGHuhlGw12RSynewytwl+XzdaNTfdSgzxzbJ1TQ4CnnBN8qUPPNk1D4
         6GiKj/xfxyOkY26zRd/IP8eCVPMRDIsGwPTKN/Qo51TLcWU1Y6BNFbDKMs0sKkJcZUov
         1IBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739671452; x=1740276252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8PAI75OoYTRF/2oJ3FX75gKYqzLOwAqHdivJ1fmnoQk=;
        b=Eh4BARPoPdNRYW+leZ0hI2fCBSjEstP3Dzd8Ojbfe4if+9C/kuoPu2JXCzkmcAaO8f
         aFenhxUWf6xlPc3WHAxOMqqz4UD5oAcyqeXcaYTyZRh1gf2WGiMk1VwIzaskjXH9Pl3K
         yRYwK8WBRYQVd4ML0+84pgjvBkEkh1FGCRXz4qP4TwnaX1rbEElWde1WXZmN3OzD+ZRv
         0bWHhkpUQ475MYo0EpxZ9RBqxHNQABYmsICL6dzjzs+AfL8QdV97mjhZEeILbv0ycQyq
         sBY6ZwW6jsIQ5lhA93Im3rFsLXu7u/VeQaDegku6ujtPxjHhXv5QyIGNp+brGWhU55/Z
         5ujw==
X-Gm-Message-State: AOJu0YzEIDDMPA3X/ALfgXrDWUXhrLf1fsQIX1FtObg1yMnwISDWrXTL
	1gfeTy2H8lD9qpctzZWBnSIEq53B3k3jCV4i8Z2ZgFwqg2JC5uaiyXR/yhzdxicvMBbKUQqFnn8
	rfI+UM3nfjzJKcEhWfcIWTiREWmY=
X-Gm-Gg: ASbGncuSDZjV1dctpsSaF2wGXsbOp4sCnT83UR04SGxn8Gy6NitihCXJdYuhLFDZ00U
	gZ0nnm/m6IW2DPdxnvJPQodE+LnD4fsDzJUmrPm/xIKZZJNzIKh0JS6faA/glWIPJFGqes2aFe1
	ALxwc/1syraho=
X-Google-Smtp-Source: AGHT+IHMQnvBPRSEMdjePY0EHeX4Rxfhh9e91wluJ/GEUVkKsjJpj/lauZyIXdrcMMDeKOoWKG2Y4Tgj6IZPFC7daaI=
X-Received: by 2002:a05:6870:96a3:b0:29e:5df2:3e50 with SMTP id
 586e51a60fabf-2bc99aabb13mr2551150fac.15.1739671452277; Sat, 15 Feb 2025
 18:04:12 -0800 (PST)
MIME-Version: 1.0
References: <20250215150516.1168-1-alex.kiernan@gmail.com>
In-Reply-To: <20250215150516.1168-1-alex.kiernan@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 15 Feb 2025 18:03:46 -0800
X-Gm-Features: AWEUYZmDHx-NHw1k2KCtB7DISyOXTbFSgTD_M2gM23BAjhy3QmD7qymELiQXeKY
Message-ID: <CAMKF1so-xu31Hi-EFhX8WfLNP0vpp=4zJLFDWwwMbtTACaCGtw@mail.gmail.com>
Subject: Re: [OE-Core] packagegroup-base: Add option to set zeroconf provider
To: alex.kiernan@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 02:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211491

On Sat, Feb 15, 2025 at 7:06=E2=80=AFAM Alex Kiernan via
lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
wrote:
>
> avahi, systemd-resolved and mDNSResponder (in meta-networking) can all
> provide Zeroconf services. Add a `ZEROCONF_DAEMON` option to select
> which of these will provide service via packagegroup-base-zeroconf.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>  meta/recipes-core/packagegroups/packagegroup-base.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/=
recipes-core/packagegroups/packagegroup-base.bb
> index cb9d1f07af51..c172250a4322 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -312,11 +312,14 @@ RDEPENDS:packagegroup-base-nfs =3D "\
>  RRECOMMENDS:packagegroup-base-nfs =3D "\
>      kernel-module-nfs "
>
> +# Choose 'avahi-daemon', 'mdns' or 'systemd-resolved' as zeroconf-daemon
> +ZEROCONF_DAEMON ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd-=
resolved', 'systemd-resolved', 'avahi-daemon', d)}"

are these distro features new? if so we need to document them as well

>  SUMMARY:packagegroup-base-zeroconf =3D "Zeroconf support"
>  RDEPENDS:packagegroup-base-zeroconf =3D "\
> -    avahi-daemon"
> +    ${@ '' if d.getVar('ZEROCONF_DAEMON') =3D=3D 'systemd-resolved' else=
 d.getVar('ZEROCONF_DAEMON')} \
> +    "
>  RDEPENDS:packagegroup-base-zeroconf:append:libc-glibc =3D "\
> -    libnss-mdns \
> +    ${@bb.utils.contains('ZEROCONF_DAEMON', 'systemd-resolved', '', 'lib=
nss-mdns', d)} \
>      "
>
>  SUMMARY:packagegroup-base-ipv6 =3D "IPv6 support"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211488): https://lists.openembedded.org/g/openembedde=
d-core/message/211488
> Mute This Topic: https://lists.openembedded.org/mt/111200541/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

