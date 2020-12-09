Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web08.5897.1607518223132222037
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Dec 2020 04:50:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=O/BhScWD;
 spf=pass (domain: konsulko.com, ip: 209.85.167.194, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f194.google.com with SMTP id d27so1597684oic.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Dec 2020 04:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=c0aqdN6LdYZGd0ov2bMwq+bVl9/qsAxx32iwfbLccfw=;
        b=O/BhScWDFatlhGfQk+LZbkGsR+8fKJIUQsQYQTIWPahuX5mwSjDBAJs3J1ijgralIA
         dYec0V9Cv9GvXWH17ZttfKYx4t8w091D+z3ZkRKLe1rT320zHv4HUBCEQNC/qjn58bfR
         wWXMaxpVd6YrbFBqf6lX6nPgegFIb/GwFzAbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=c0aqdN6LdYZGd0ov2bMwq+bVl9/qsAxx32iwfbLccfw=;
        b=ElamwpqcuRTDGVhVFestGJudvjaUogAk5RcPEvC+y1jMLW8P+n4of055EmZ78esMmD
         Vs5idhmYtWJNs5guXYA+tBWyDr2AioLA9NuGGtuYKAmYuAhn4U2FvY+19FXK1F0NzUSw
         Oa8hEQ4h6rbsXmEWDAxdxYT2a7l5u5GOFN97j+QVBMch/SSJL0p7LMVOH1tfXYJqeqHN
         frz4oxnJjr77jYbZtsflnoWIdRN1ky4eyBt09KKDmgLSZrYkSNyvy3nk57JFQw+XS6Br
         V3O/O1jVU3K2/lF3nyIrC4BUgbAdIEQhnX0li092R6KvpEqOz2ZhbnMe452kg5pppdfP
         XuXQ==
X-Gm-Message-State: AOAM530l62ri4J0y3VMSV/zry/ufQngTQR51ZVB5TkYyr/rOnuJOcbUT
	PkYAU3dhL7TIBbYdW5xgiY0RynybBfDRlHjtfvJZds+MTLk=
X-Google-Smtp-Source: ABdhPJzVsS2xrAgt+m+1eNBusXhJVZGVOsa4uokGsLuLIlpoTi/sm2y0Wc0adCYrSoc/jAPM4sgj8itqdYymrbFQlRI=
X-Received: by 2002:aca:f3d6:: with SMTP id r205mr1571739oih.152.1607518222414;
 Wed, 09 Dec 2020 04:50:22 -0800 (PST)
MIME-Version: 1.0
References: <20201209122626.3637550-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20201209122626.3637550-1-richard.purdie@linuxfoundation.org>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Wed, 9 Dec 2020 12:50:12 +0000
Message-ID: <CAM9ZRVsj9DoELb8O5+wwk7MA4xAEBvXiA6k0hQXFZszzagP2VA@mail.gmail.com>
Subject: Re: [PATCH] Revert "bitbake.conf: Add all layers (from BBLAYERS) to PSEUDO_IGNORE_PATHS"
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 9 Dec 2020 at 12:26, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> This reverts commit cc30537bb4d0815c4d69f0b1a1a8a200085902d5.
>
> There are issues with this change where the build directory may be includ=
ed
> within the paths included in BBLAYERS, which is particularly problematic
> where people are using kas.
>
> An alternative to this to handle the pyc file issue is being worked on bu=
t
> revert this for now whilst that fix is developed.
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index a353dc5d6b2..812cd051021 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -685,7 +685,7 @@ SRC_URI =3D ""
>  PSEUDO_LOCALSTATEDIR ?=3D "${WORKDIR}/pseudo/"
>  PSEUDO_PASSWD ?=3D "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
>  PSEUDO_SYSROOT =3D "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
> -PSEUDO_IGNORE_PATHS =3D "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-s=
ysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sst=
ate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR=
}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstat=
e-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${=
TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${@','.join(d.getVar('B=
BLAYERS').split())},${CCACHE_DIR}"
> +PSEUDO_IGNORE_PATHS =3D "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-s=
ysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sst=
ate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR=
}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstat=
e-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${=
TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${COREBASE}/meta,${CCAC=
HE_DIR}"
>
>  export PSEUDO_DISABLED =3D "1"
>  #export PSEUDO_PREFIX =3D "${STAGING_DIR_NATIVE}${prefix_native}"
> --
> 2.25.1
>

Thanks Richard, I had few other builds to run so haven't had a chance
to test this locally yet.

--=20
Paul Barker
Konsulko Group
