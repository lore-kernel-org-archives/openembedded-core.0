Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB60C7EE23
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 23:26:25 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.395.1684970779487864098
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 16:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=OOwvBsUc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f603ff9c02so12078165e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 16:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1684970778; x=1687562778;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+lYVCR3GhfIT8oJn1lFzhxzL5XqJJHWpNYe0rIsg4g=;
        b=OOwvBsUcSOiUeI37X9DVNWVluLN0YyMGzp2uXCh7awaKLzl4pVd3S7ZixigfsV9I84
         0bHfMWqxsxSoBVL/x1rKLAUXLA8ZnJDRUcUIEnCCUJZQxtkl/Megc3TMfQw8GmzwmgG+
         JPre7N+QQ33sBSKjnIJC5k7fkiTsl1H332MOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684970778; x=1687562778;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v+lYVCR3GhfIT8oJn1lFzhxzL5XqJJHWpNYe0rIsg4g=;
        b=DFd/H7YTGM5Gpr9pqogwSqVcv/D6hctHyBZrDxpU0BLv0W2BEm5sokFOuuwG0CNfWO
         DMrC5VbKBtWg24J7tYn16FxyTZ3gwwP/zOjo8YJAgQZzDa9sqNPr8tgL3PpqMvHU8+Ly
         FTG8hikPBrKA3fH3uxCe9UtXtPFDkrHoWUV2diFRnkv5t0FViJnHYrVeyoeMSYrLLd4+
         XWZFgyvVto3tuuzBpiBY91oyz3QSqRwtybgWHgGwsiikqZgQ9NKmcz7vxDSz2ABkcCVA
         vUrG50nCa495fZi/y180r+zrbSMsy7mJhXD8hy86bLfcD48MNezTt/IvyzqawrvZ9btA
         0nOA==
X-Gm-Message-State: AC+VfDxb5jxkb8yInZH2OstcfModHTMfBCe8W5JDR4HvmI59c5Ik/Fqt
	QUKmFWKC9rYnW6rndqvifpvpzw==
X-Google-Smtp-Source: ACHHUZ4cuayZ+nCuzDUx9KcCV9aXMjspkuy2khpdrE60O70k5KG/XH3K++ubRvJ5V5uUmngKy2V+WA==
X-Received: by 2002:a05:600c:2289:b0:3f5:39:240c with SMTP id 9-20020a05600c228900b003f50039240cmr1017801wmf.27.1684970777780;
        Wed, 24 May 2023 16:26:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4cab:7af6:3f6:b471? ([2001:8b0:aba:5f3c:4cab:7af6:3f6:b471])
        by smtp.gmail.com with ESMTPSA id b21-20020a05600c4e1500b003f4283f5c1bsm9489822wmq.2.2023.05.24.16.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 16:26:17 -0700 (PDT)
Message-ID: <303bdaddd7f8bd6f4655395bf977323c83211133.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 1/2] package-index: Convert package-index into
 a bbclass.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Charlie Johnston <charlie.johnston@ni.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 25 May 2023 00:26:16 +0100
In-Reply-To: <20230524215526.323283-1-charlie.johnston@ni.com>
References: <20230524215526.323283-1-charlie.johnston@ni.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 23:26:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181695

On Wed, 2023-05-24 at 16:55 -0500, Charlie Johnston wrote:
> Currently, package-index is a bit strange because it's a
> bitbake recipe that implements a task.

That isn't strange at all, it is perfectly fine for a recipe to add a
task.

> That task is
> already used elsewhere and could be leveraged further
> for BUILD_IMAGES_FROM_FEEDS.
>=20
> This change moves the logic for do_package_index into its
> own bbclass and has package-index.bb inherit from there.

The description here does not match what this patch actually does.=C2=A0The
patch changes the behaviour of the code considerably and this isn't
even mentioned.

>=20
> Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
> ---
>  meta/classes/package_index.bbclass      | 21 +++++++++++++++++++++
>  meta/recipes-core/meta/package-index.bb | 10 +---------
>  2 files changed, 22 insertions(+), 9 deletions(-)
>  create mode 100644 meta/classes/package_index.bbclass
>=20
> diff --git a/meta/classes/package_index.bbclass b/meta/classes/package_in=
dex.bbclass
> new file mode 100644
> index 0000000000..fdd10f6dd0
> --- /dev/null
> +++ b/meta/classes/package_index.bbclass
> @@ -0,0 +1,21 @@
> +#
> +#   Creates package indices for the IMAGE_PKGTYPE
> +#
> +
> +do_package_index[nostamp] =3D "1"
> +do_package_index[depends] +=3D "${PACKAGEINDEXDEPS}"
> +do_package_index[recrdeptask] +=3D 'do_package_write_deb'
> +do_package_index[recrdeptask] +=3D 'do_package_write_ipk'
> +do_package_index[recrdeptask] +=3D 'do_package_write_rpm'

Adding recrdeptask isn't mentioned in the commit message. "package-
index" deliberately just indexes what is in the packages directory with
no dependencies. This is therefore a significant change in behaviour.

> +
> +python do_package_index() {
> +    from oe.rootfs import generate_index_files
> +    generate_index_files(d)
> +}
> +
> +# Package indexes are required for the dummy SDK architectures
> +# to support scenarios where SDK images are built from feeds.
> +PACKAGE_ARCHS:append:task-package-index =3D " sdk-provides-dummy-target"
> +SDK_PACKAGE_ARCHS:append:task-package-index =3D " sdk-provides-dummy-${S=
DKPKGSUFFIX}"

This is also a change in behaviour, again unmentioned.

Cheers,

Richard

> +
> +addtask do_package_index before do_build
> diff --git a/meta/recipes-core/meta/package-index.bb b/meta/recipes-core/=
meta/package-index.bb
> index 98c5bcb372..3fc18865b7 100644
> --- a/meta/recipes-core/meta/package-index.bb
> +++ b/meta/recipes-core/meta/package-index.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "MIT"
>  INHIBIT_DEFAULT_DEPS =3D "1"
>  PACKAGES =3D ""
> =20
> -inherit nopackages
> +inherit nopackages package_index
> =20
>  deltask do_fetch
>  deltask do_unpack
> @@ -15,12 +15,4 @@ deltask do_install
>  deltask do_populate_lic
>  deltask do_populate_sysroot
> =20
> -do_package_index[nostamp] =3D "1"
> -do_package_index[depends] +=3D "${PACKAGEINDEXDEPS}"
> -
> -python do_package_index() {
> -    from oe.rootfs import generate_index_files
> -    generate_index_files(d)
> -}
> -addtask do_package_index before do_build
>  EXCLUDE_FROM_WORLD =3D "1"





