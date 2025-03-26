Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E91C36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 15:16:20 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.25157.1743002161227247597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 08:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Me66DqlB;
 spf=temperror, err=temporary DNS error (domain: sakoman.com, ip: 209.85.128.176, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6f74b78df93so75254507b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 08:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743002160; x=1743606960; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYgCdxKHfs0wb2UHSnz68s4nM/jsgPsNn0Uh/DInJtw=;
        b=Me66DqlBhlvduIx9oc+18oWwqK8T0lvu1HY/gMkyMgwQDSU5aUXDdbwKrYxzwXxAEx
         D9XmF+FTN30mDLk3BbzoMF6qzGfp9dZ0GKygIbMaDWlhXr535ZWTUo47xujd8IUW6aQp
         0g7bfxG1drCigYz7UcvqLO9p0M3uHyTQTPiZBCsB8dmfwyYqGSDl6K3GlhUJvuD73rwi
         UmkpuPfv/y1FV7O+sGsgHM/Ya+M0+CIK1epvUcBDZwNEJSjimz3Ibdq6lUFDxXfXR4AF
         Yp+Bf0XeOwGY0yEMaiIRRrKW8jpwWKbtqJLFiEzWYgoLbmye6tTgf3M0MACp1Ogeg5IA
         H6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743002160; x=1743606960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYgCdxKHfs0wb2UHSnz68s4nM/jsgPsNn0Uh/DInJtw=;
        b=dD55jETxkqevg86T3EbQGetanaMMZexc6rXQ2PKpMeQfwXysU/RyuHk5+HbeVChWX0
         WD27NcpMrRKRW+RtElkR+W0U//kOIXo0FtoMFRnEjjTcMLOJpYd23aAg4yxNjDjZnmZT
         iLSfCW/fkzTF93OUSRuURSaHovcXZzQF1Vpk4CDylztULCA2wolOaL1FrQ40G2iLUP2e
         NPFXhZLLxZcoKnW1uqPBYpykOTtmIh4LHdu/3WkQBAJ64rQu5hntt9Y7pj/DUjD6luPk
         MiUEBpG8zpmgcsCV9LK8RWWN8xUOORTFnMiS31fUB67nTMkjLxO43P9QUK17zXatG9s6
         aE4w==
X-Gm-Message-State: AOJu0YwgJpIRbCg6U6xSnZ/toCzMft0ZNF/e+gadoqfnGzNPiKziKsOB
	tVt9cjkzLRrDlW7jYP+l+IwOGsRXhCPmCIU63FCufoqjlM3c6l6wa3WtzWgqfjU2c5iTXICCw3p
	4bg2PSQAEQPwnehR1vUsOdFn5pGuxhftYV5v5IktvKWDbrDECBfE=
X-Gm-Gg: ASbGncvp3pRtBVeRiD0f/9OCquVs14opVi3KB0F8Us0Gpz3OSjII54DOuR736Sg2XPI
	Y7T+Ru8KaZ58KzJIl1fVoNqFs+Q+lBsZ1DYj0gHX3iMT4oD4N2b/jOdhrZRlre7M4hGhAeO11HX
	2C1ZCTDG5781PeBa5TaLw7Saf/jg==
X-Google-Smtp-Source: AGHT+IEQNj+cX0xxcC0fJ/6OvjIqDtFP3d2NAiE/T4AGRvqWu4luXQtjrzENcb76vsWammoh8KYzwxJbM9SRW3eAU18=
X-Received: by 2002:a05:690c:6f04:b0:6fb:9495:1650 with SMTP id
 00721157ae682-700bac4b9c3mr311766007b3.11.1743002160070; Wed, 26 Mar 2025
 08:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250325215444.11125-1-hiagofranco@gmail.com>
In-Reply-To: <20250325215444.11125-1-hiagofranco@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 26 Mar 2025 08:15:49 -0700
X-Gm-Features: AQ5f1Jqja7Iwzb9JmHczebU6WJuuLPI-_rEYEdABse8zVkd4tNNrQSPUEAShLEg
Message-ID: <CAOSpxda1s_VUBMTQBRzfdXGy0B=9sgNr=eq+LdDDKFc+koG4dQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] linux-firmware: upgrade 20240909 -> 20250311
To: hiagofranco@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 15:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213649

Hi Hiago,

I'm getting build errors with this patch:

https://errors.yoctoproject.org/Errors/Details/849582/

I think you will need to add a PARALLEL_MAKE fix similar to what was
done in master:

https://github.com/openembedded/openembedded-core/commit/16e86b63696177a6f8=
b8f73b41e55dd6389f9e1c

(linking to the github mirror since our git infrastructure is under
attack at the moment)

Please submit a V2 with this addition.

Thanks!

Steve

On Tue, Mar 25, 2025 at 2:55=E2=80=AFPM Hiago De Franco via
lists.openembedded.org <hiagofranco=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Hiago De Franco <hiago.franco@toradex.com>
>
> Update the linux-firmware recipe to the most recent upstream tag.
>
> Since commit 515022675f81 ("make: separate installation and
> de-duplication targets") in linux-firmware, 'install-nodedup' no longer
> exists. Adapt the do_install function to accommodate these changes, as
> done in the oe-core master branch.
>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
>  ...20240909.bb =3D> linux-firmware_20250311.bb} | 24 ++++++++++++++-----
>  1 file changed, 18 insertions(+), 6 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20240909.bb =
=3D> linux-firmware_20250311.bb} (99%)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240909.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
> similarity index 99%
> rename from meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
> rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
> index 30c47d772088..2ba362ed3b33 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
> @@ -154,7 +154,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE.Abilis;md5=3Db5e=
e3f410780e56711ad48eadc22b8bc \
>                      "
>  # WHENCE checksum is defined separately to ease overriding it if
>  # class-devupstream is selected.
> -WHENCE_CHKSUM  =3D "6ae5ffd807c84809977286ad0b37acdb"
> +WHENCE_CHKSUM  =3D "886924eb733c4efcec21dff980795771"
>
>  # These are not common licenses, set NO_GENERIC_LICENSE for them
>  # so that the license files will be copied from fetched source
> @@ -241,23 +241,35 @@ SRC_URI:class-devupstream =3D "git://git.kernel.org=
/pub/scm/linux/kernel/git/firmw
>  # Pin this to the 20220509 release, override this in local.conf
>  SRCREV:class-devupstream ?=3D "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
>
> -SRC_URI[sha256sum] =3D "943fbd19883cf8eadf89e0b22422549db056557b1ecd30a5=
6400615971369671"
> +SRC_URI[sha256sum] =3D "b1083a36f19aea46f661dcfd4cd462d13933dcb4e7f0dc80=
9525552dd5c3541d"
>
>  inherit allarch
>
>  CLEANBROKEN =3D "1"
>
> -# Use PACKAGECONFIG_CONFARGS to set the Makefile target
>  PACKAGECONFIG ??=3D ""
> -# Enabling dedup will turn duplicate firmware files into links
> -PACKAGECONFIG[deduplicate] =3D "install,install-nodedup,rdfind-native"
> +PACKAGECONFIG[deduplicate] =3D ",,rdfind-native"
> +
> +# Possible values are "xz" and "zst".
> +FIRMWARE_COMPRESSION ?=3D ""
> +
> +def fw_compr_suffix(d):
> +    compr =3D d.getVar('FIRMWARE_COMPRESSION')
> +    if compr =3D=3D '':
> +        return ''
> +    return '-' + compr
>
>  do_compile() {
>         :
>  }
>
>  do_install() {
> -        oe_runmake 'DESTDIR=3D${D}' 'FIRMWAREDIR=3D${nonarch_base_libdir=
}/firmware' ${PACKAGECONFIG_CONFARGS}
> +        sed -i 's:^./check_whence.py:#./check_whence.py:' ${S}/copy-firm=
ware.sh
> +
> +        oe_runmake 'DESTDIR=3D${D}' 'FIRMWAREDIR=3D${nonarch_base_libdir=
}/firmware' install${@fw_compr_suffix(d)}
> +        if [ "${@bb.utils.contains('PACKAGECONFIG', 'deduplicate', '1', =
'0', d)}" =3D "1" ]; then
> +                oe_runmake 'DESTDIR=3D${D}' 'FIRMWAREDIR=3D${nonarch_bas=
e_libdir}/firmware' dedup
> +        fi
>          cp LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware/
>  }
>
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213622): https://lists.openembedded.org/g/openembedde=
d-core/message/213622
> Mute This Topic: https://lists.openembedded.org/mt/111906654/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

