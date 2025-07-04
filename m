Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4566AC83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 13:38:48 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.12660.1751636324093291569
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 06:38:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WZttwiVx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so793240f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 06:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751636322; x=1752241122; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AS7jc30ZQymsAohq1VL9witl/FGQ2BNct2VmzDUe2Q=;
        b=WZttwiVxoE5wSiMJmFi1WFmGrBxVFzqUWo05quM5lhianHed1ifHKbGdm1x5dwCxRk
         r5o0qPj/0FONltm/01UaRRbc/N6sMOa9KV7Pi65LF/oZJ2Ekyic7sJM8hBlJLtVobwWm
         J4HD2MF8h5v6/xu4wIxz+wcc71SC23j9hwNXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751636322; x=1752241122;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0AS7jc30ZQymsAohq1VL9witl/FGQ2BNct2VmzDUe2Q=;
        b=ltCE7tcicjWYpF5wZP8FzcygMYoWdlOcA0ODY48FVWA5Kz0gEgbp4Aj4lfhOjm2236
         3UJ+bDgEjqVSJnFqenpIEa/EGXMa1Bm9El6mTTdZm4UB2rjur9P2okNblCyRfkOfMa2E
         YecPoMKnBk+u1rLXSWBK6xl0IkCZ9qQMRvGp903hM7kOGlHKi2PVeOcSz+YqDO1xArxW
         13ltagv/OprugxVOOoZ00QRj1Glx1KNI2ICjDcUPZrHYx1EvRmYQKDI9zkuQiUXQlF8a
         CunWeWWhGh257wJBbPSXgQaGcjEYXewW6ie21NnRo7OCGL57see3+DOouP+kf4SvGQVn
         JqkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2iw4hzX9blk/hDdVsG7Vj7WZOBR5xFi03QhtWHyRGfEQhep3lm+AlD4pSbewB6kxFHTgz21rYk+TBAdLHXq/cmQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yznhk9oc9g00zWUM7/QDhO9Ug1wT9SwHg4RX28a67GxXlyjRl3c
	O1oN5aJD4mgHXeev3FO2pZQYANd2+i+vey0fEXDS5bzq6pe7IIe+drqdssuGEVcXbYXfBzm241N
	QU8v9
X-Gm-Gg: ASbGncs8TMhy0whUdZTKN8cNVd8cgR/x5mwUZfJlfrdI4c5t3UYsU7FVcBn0UcrJXl0
	+oxdvcn+XnXTlomYZR4e7UeFlkRHa8JLToM7OkE9hguz7/7fuOtE73j0l0A3QuyvFMA+WqL3NPv
	yvlKKgcKxdF3NVhB4TUMXPmyVO88tN7EUXE4UdTh2Z0DO260+BLnA3rt/OpJ6Qb/P54v0jloDil
	8XNp4MO5E+39lFKa0mZUf6zoXC+fPY4ktcITzBgKXZdzybzP/X8G6SnlgAXqjCX3jVw2I5Fac6m
	Z04GesIubcqkGK8LeJgjje+fZxvO9+WtOnUTIyO7dC6f7C7V9dldUd6GY6ZZzgj+YXSriiBxKuW
	6//gtcE16Bj0TyEjEKKKjWnsbdGx62+y8tvkJ4VSgjGzb7RBEmlw=
X-Google-Smtp-Source: AGHT+IHdpFtAtq8W+uAjDapBIfvBEhOJBjwAkKkPXKmfna6ms3Zq2xl6yXR+fBDz3kJPptgkEnNYbQ==
X-Received: by 2002:a05:6000:2289:b0:3a6:d95c:5db with SMTP id ffacd0b85a97d-3b4970140fdmr1897373f8f.26.1751636322331;
        Fri, 04 Jul 2025 06:38:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6ff3:dcb5:7901:3609? ([2001:8b0:aba:5f3c:6ff3:dcb5:7901:3609])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b9736bsm2556707f8f.60.2025.07.04.06.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:38:41 -0700 (PDT)
Message-ID: <6f97d5b509d2d2319ad93f46658b3f0ea93288ec.camel@linuxfoundation.org>
Subject: Re: [kirkstone][PATCH] classes: Move package RDEPENDS processing
 out of debian.bbclass
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?J=F6rg?= Sommer <joerg.sommer@navimatix.de>, 
	openembedded-core@lists.openembedded.org, s.zhmylev@yadro.com, 
	alexandre.belloni@bootlin.com
Date: Fri, 04 Jul 2025 14:38:40 +0100
In-Reply-To: <4f53825c14f9940ea8d379dcd35a5ae02bcb92e2.1751631411.git.joerg.sommer@navimatix.de>
References: 
	<4f53825c14f9940ea8d379dcd35a5ae02bcb92e2.1751631411.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 13:38:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219922

On Fri, 2025-07-04 at 14:16 +0200, J=C3=B6rg Sommer wrote:
> From: Sergei Zhmylev <s.zhmylev@yadro.com>
>=20
> INHERIT_DIRSTO by default includes debian.bbclass which in turn properly
> establishes dependencies between package management tasks and build
> process. Debian class also unconditionally renames several packages in a
> Debian way. In order to allow disabling of such renaming rules, the logic
> of RDEPENDS handling is moved to a package.bbclass.
> This commit also solves the SDK building issue without debian.bbclass.
>=20
> (From OE-Core rev: 8313a4201cde39c444aa6fbe82e46a767fc31f6b)
>=20
> Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 251a5c88f6bcf347d637b39b8a86e8a083774986)
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
> =C2=A0meta/classes/debian.bbclass=C2=A0 | 18 +++---------------
> =C2=A0meta/classes/package.bbclass | 21 ++++++++++++++++++++-
> =C2=A02 files changed, 23 insertions(+), 16 deletions(-)
>=20
> diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
> index 8367be9f37..ade0e6dd8c 100644
> --- a/meta/classes/debian.bbclass
> +++ b/meta/classes/debian.bbclass
> @@ -8,26 +8,14 @@
> =C2=A0#
> =C2=A0# Better expressed as ensure all RDEPENDS package before we package
> =C2=A0# This means we can't have circular RDEPENDS/RRECOMMENDS
> +#
> +# Logic of processing dependencies moved to a package.bbclass to
> +# allow removing inheritance on debian.bbclass
> =C2=A0
> =C2=A0AUTO_LIBNAME_PKGS =3D "${PACKAGES}"
> =C2=A0
> =C2=A0inherit package
> =C2=A0
> -DEBIANRDEP =3D "do_packagedata"
> -do_package_write_ipk[deptask] =3D "${DEBIANRDEP}"
> -do_package_write_deb[deptask] =3D "${DEBIANRDEP}"
> -do_package_write_tar[deptask] =3D "${DEBIANRDEP}"
> -do_package_write_rpm[deptask] =3D "${DEBIANRDEP}"
> -do_package_write_ipk[rdeptask] =3D "${DEBIANRDEP}"
> -do_package_write_deb[rdeptask] =3D "${DEBIANRDEP}"
> -do_package_write_tar[rdeptask] =3D "${DEBIANRDEP}"
> -do_package_write_rpm[rdeptask] =3D "${DEBIANRDEP}"
> -
> -python () {
> -=C2=A0=C2=A0=C2=A0 if not d.getVar("PACKAGES"):
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar("DEBIANRDEP", "")
> -}
> -
> =C2=A0python debian_package_name_hook () {
> =C2=A0=C2=A0=C2=A0=C2=A0 import glob, copy, stat, errno, re, pathlib, sub=
process
> =C2=A0
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index e6ba79346c..5cc3c779c0 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -54,7 +54,6 @@ ALL_MULTILIB_PACKAGE_ARCHS =3D "${@all_multilib_tune_va=
lues(d, 'PACKAGE_ARCHS')}"
> =C2=A0# dwarfsrcfiles is used to determine the list of debug source files
> =C2=A0PACKAGE_DEPENDS +=3D "rpm-native dwarfsrcfiles-native"
> =C2=A0
> -
> =C2=A0# If your postinstall can execute at rootfs creation time rather th=
an on
> =C2=A0# target but depends on a native/cross tool in order to execute, yo=
u need to
> =C2=A0# list that tool in PACKAGE_WRITE_DEPS. Target package dependencies=
 belong
> @@ -2547,6 +2546,26 @@ python do_packagedata_setscene () {
> =C2=A0}
> =C2=A0addtask do_packagedata_setscene
> =C2=A0
> +# This part ensures all the runtime packages built by the time
> +# dynamic renaming occures, if any.
> +# This part moved here from debian.bbclass (see for reference) in
> +# order to allow disabling default inheritance on debian package renamin=
g.
> +
> +PKGRDEP =3D "do_packagedata"
> +do_package_write_ipk[deptask] =3D "${PKGRDEP}"
> +do_package_write_deb[deptask] =3D "${PKGRDEP}"
> +do_package_write_tar[deptask] =3D "${PKGRDEP}"
> +do_package_write_rpm[deptask] =3D "${PKGRDEP}"
> +do_package_write_ipk[rdeptask] =3D "${PKGRDEP}"
> +do_package_write_deb[rdeptask] =3D "${PKGRDEP}"
> +do_package_write_tar[rdeptask] =3D "${PKGRDEP}"
> +do_package_write_rpm[rdeptask] =3D "${PKGRDEP}"
> +
> +python () {
> +=C2=A0=C2=A0=C2=A0 if not d.getVar("PACKAGES"):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar("PKGRDEP", "")
> +}
> +
> =C2=A0#
> =C2=A0# Helper functions for the package writing classes
> =C2=A0#

This was followed quickly by:

https://git.yoctoproject.org/poky/commit/?id=3Db177f377285746364354ab26d95b=
9f2f09f08dcf

which means this change wasn't well tested in isolation during development.

I'd guess you're trying to avoid debian.bbclass in kirkstone, I have to
wonder why now though as if we were going to change behaviour like this
in kirkstone, wouldn't we have done it long before now?

Cheers,

Richard

