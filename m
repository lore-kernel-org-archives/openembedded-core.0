Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web10.4373.1607336950966055198
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 02:29:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZsWKOuEh;
 spf=pass (domain: konsulko.com, ip: 209.85.210.68, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f68.google.com with SMTP id b18so12027147ots.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Dec 2020 02:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1m/qJ4iJmmigwHUHoiLTsrEQ0T2QIAT0BmpvNaqz510=;
        b=ZsWKOuEhG76OwqBrv8xkO+otyvSPOXqvTFm1tluRTrVWXEUJarwF1AjbbQeaLGHt+S
         zNkbC+QCeKoD/jFitSQKcq6T3A1LF/tVs3eBrj4XWuA+K26wQ9QFmHoa+j/zRyzw+QBe
         uNEEkACZTY6+o0fhHlw21c9m+Bb3sfl4dJcaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1m/qJ4iJmmigwHUHoiLTsrEQ0T2QIAT0BmpvNaqz510=;
        b=XwkIV5G8H+D5Fi8E93De4eM3gSy8TM63CHdWfgCE7dmppe0i36p2M7foAd+wziRglh
         uPdzNf3o5SnkgfcQLMyZLHb1i/rRZ3dzAw5JxfnDZ2oQGvC1Yr+WFEiMvhL9GyYyBg60
         C5u24zsyzLH/ldWBsv5Gqu2428A2ST9pSjmnykzsjC72djla7IT2OnC9E3hR/vIH676R
         rmcobzA0U6Szp7p1/DXg/WhCUklKsndqPYAYtsTxjK384T1uBSI+NL0ShezCj5W3a/7e
         XdPeYVr4v/Ls7PCwjlIbKFLqty42I4g09Yy7r70+x3rCs/cgeHcj+v+as7weYmgVMx3j
         eKvQ==
X-Gm-Message-State: AOAM531VUPuTYMWhrYwTMu/OuIWq71n9yvA89NE0BnRj4pHdfk41gNAv
	DcH5+0dGm5j9ekakCRjQxowhLcfIX7SuVtf8Ch5kjw==
X-Google-Smtp-Source: ABdhPJyzjuEgjkBJ/fQkif6HY8Gk8ELrrkGI5SJd2l5wyTIJY0Yquz2FlXV//cu3jpWy3Z2gxmLLdvfFylDX1kA+FyA=
X-Received: by 2002:a9d:1725:: with SMTP id i37mr12514474ota.258.1607336950240;
 Mon, 07 Dec 2020 02:29:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606846217.git.pkj@axis.com> <b7bae6e1633fba206d9c7abad93d79fbe7b0f654.1606846217.git.pkj@axis.com>
In-Reply-To: <b7bae6e1633fba206d9c7abad93d79fbe7b0f654.1606846217.git.pkj@axis.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 7 Dec 2020 10:29:00 +0000
Message-ID: <CAM9ZRVtVRk2CrBKeG=Ks8a+OPhTPKu6q=HctT39tKyYCbAguFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv3 2/5] bitbake.conf: Add all layers (from BBLAYERS) to PSEUDO_IGNORE_PATHS
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Dec 2020 at 18:12, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> Instead of ignoring ${COREBASE}/meta in PSEUDO_IGNORE_PATHS (which may
> or may not ignore all layers depending on how they are named and placed
> under ${COREBASE}), ignore all layers.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 0d38eac094..9742fe4fe2 100644
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
TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${COREBASE}/meta,${CCAC=
HE_DIR}"
> +PSEUDO_IGNORE_PATHS =3D "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-s=
ysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sst=
ate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR=
}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstat=
e-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${=
TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${@','.join(d.getVar('B=
BLAYERS').split())},${CCACHE_DIR}"

This has now landed in master and unfortunately it breaks the way I
run builds. I often end up building inside a layer directory. For
example the one that failed this morning has:

    BBLAYERS ?=3D " \
        /home/pbarker/Projects/Yocto/meta-linux-mainline \
        /home/pbarker/Projects/Yocto/meta-linux-mainline/layers/poky/meta \
        /home/pbarker/Projects/Yocto/meta-linux-mainline/layers/poky/meta-p=
oky"

TOPDIR is "/home/pbarker/Projects/Yocto/meta-linux-mainline/build" and
TMPDIR is "${TOPDIR}/tmp". So everything under TMPDIR is now ignored
by pseudo and various do_install/do_package tasks fail.

I don't think this will just affect me as this is a common pattern,
especially when using something like kas to setup builds.

Before we revert this I'd like to understand the problem this patch is
trying to fix. Is there a specific reason why you need to ignore all
layer directories? I'm not 100% sure why "${COREBASE}/meta" is ignored
anyway though I guess it is to reduce pseudo db size and so speed up
builds.

Thanks,

--=20
Paul Barker
Konsulko Group
