Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12F1CE7CFC
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 09:30:38 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.77342.1727775028905444760
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 02:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VdQ9bq86;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so6395929e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 02:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727775027; x=1728379827; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mx4zNcYmmf2XEALfnyrTpgIDJPpUGeqRXl+sSZPWePE=;
        b=VdQ9bq86DtzLoJEl9UV2o9BNxmJc5ri0Mm7pSu1m3SgBJAPm+9vDBedYWoimkd9xgK
         +AnJ9Elv4sX1QxSbS9ULFv9grfESk3TWWsHdEDPSJRHtKpMXGVViS0HXvRfeyfFd5lCW
         se3oZjd5qa7h70hXMCHEjrKsOZo7QVzr66aSuSFkKxRe3g1wfXrkYXXytVqfP9jW0Blk
         j7CVSIRHNQuTDxXsHcXFs3ccCJ0rul0TxbX0Azvd2TUSsTAeoxW7liO3A5iZHGF7Uflg
         8jqogN/kEw414FluKMSCB44uU0skO0fzA1Or5GP7yPI/Ls+fqNrHP8LumaP95faD9Eh/
         ZTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727775027; x=1728379827;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mx4zNcYmmf2XEALfnyrTpgIDJPpUGeqRXl+sSZPWePE=;
        b=KGoc1Yqhb35UZh+cBKIbv5i17O37IiKkGNyrWrM4U01UvdW1YlvVXhe2yLqqPJu9Rt
         1z3b9tMAe5IlwesnybTOdYytLoX49RIlxpxZ3zQ3M6BvZOIUm+6BVMZk+xlkQFRcL8ik
         Pv9JyVIg3W4F72AbVPGBquL9t2dIqMQyt3WgDYUZNGH1kkWRUdpFDdjc03RzaQHNkGBh
         kxH+eMWBsGnRWhNC6LbiKWpDNt5cwPEvb7TsofIHSdLIgGRVVAs1mIGXzcy0AW0AF7VQ
         fC6FH1wD/qnJ3Ylow4zfTJLx1sam5rjWuDww9vNrEPkG6454KsUezsw1tph22MPVsbMc
         yi3g==
X-Gm-Message-State: AOJu0YyZYkms/oLd+yfIzqFDzZDhBMJVy6w1HRVgRjQsAGZG5XDORZMF
	vMOye6En8k0jI/C5Lw+eW29pYhgmZMInNU9oItourXobNAJqiC0UjIyV5g==
X-Google-Smtp-Source: AGHT+IGKE8ikICyX/zWnJCSyyWK16OShd0wLOzH0mf/rR7VYYnoEcAMATO+FaGEClK5DViTNyuAcJw==
X-Received: by 2002:a05:6512:1293:b0:52e:be50:9c55 with SMTP id 2adb3069b0e04-5389fc7fe60mr7975595e87.52.1727775026168;
        Tue, 01 Oct 2024 02:30:26 -0700 (PDT)
Received: from [10.9.136.49] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88240510fsm5876081a12.14.2024.10.01.02.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 02:30:25 -0700 (PDT)
Message-ID: <c4814f59e79459815125609b3f916e3382bb5a66.camel@gmail.com>
Subject: Re: [RFC][master][PATCH] populate_sdk_base: Add
 SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY
From: claus.stovgaard@gmail.com
To: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
Date: Tue, 01 Oct 2024 11:30:24 +0200
In-Reply-To: <20240927132040.200122-1-claus.stovgaard@gmail.com>
References: <20240927132040.200122-1-claus.stovgaard@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 09:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205148

On Fri, 2024-09-27 at 15:20 +0200, Claus Stovgaard wrote:
> SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY is a new variable to
> enable installation of recommended complementary packages in the
> classic
> sdk. Use it to get populate_sdk behave like Kirkstone and earlier.
>=20
> As installing complementary recommended packages is known to cause
> bugs
> it was disabled. Though it can be usefull when having dummy packages
> with DEPENDS to create SDK's. Use this variable with caution.
>=20
> Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>

I got a comment on IRC about splitting it up into documentation part
for yocto-doc mailing list and implementation, so will wait some days
more, and then split it up and send as normal patches if there is no
other comments.


/Claus


> ---
> =C2=A0documentation/ref-manual/variables.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 7 +++++++
> =C2=A0meta/classes-recipe/populate_sdk_base.bbclass | 1 +
> =C2=A0meta/conf/documentation.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A0meta/lib/oe/package_manager/__init__.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 4 ++--
> =C2=A0meta/lib/oe/package_manager/deb/sdk.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 4 +++-
> =C2=A0meta/lib/oe/package_manager/ipk/sdk.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 4 +++-
> =C2=A0meta/lib/oe/package_manager/rpm/sdk.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 6 ++++--
> =C2=A07 files changed, 21 insertions(+), 6 deletions(-)
>=20
> diff --git a/documentation/ref-manual/variables.rst
> b/documentation/ref-manual/variables.rst
> index 32c9e7407d..44ec6d59a6 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7658,6 +7658,13 @@ system and gives an overview of their function
> and contents.
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $ bitbake -c popul=
ate_sdk imagename
> =C2=A0
> +=C2=A0=C2=A0 :term:`SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY`
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Set to '0' to install recommended complem=
entary packages as
> part of populate_sdk.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Used to make the clasical sdk behave like=
 Kirkstone and
> earlier yocto releases.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Complementary recommended packages was di=
sabled for default
> because of long standing
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bugs where RDEPENDS from -dev packages ca=
uses problems in sdk.
> Example with conflict
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for main openssh and dropbear packages. U=
se with caution.
> +
> =C2=A0=C2=A0=C2=A0 :term:`SDKMACHINE`
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The machine for which the SDK is bui=
lt. In other words, the
> SDK is built
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 such that it runs on the target you =
specify with the
> :term:`SDKMACHINE`
> diff --git a/meta/classes-recipe/populate_sdk_base.bbclass
> b/meta/classes-recipe/populate_sdk_base.bbclass
> index 16013d5872..09e9c5b61c 100644
> --- a/meta/classes-recipe/populate_sdk_base.bbclass
> +++ b/meta/classes-recipe/populate_sdk_base.bbclass
> @@ -37,6 +37,7 @@ def complementary_globs(featurevar, d):
> =C2=A0SDKIMAGE_FEATURES ??=3D "dev-pkgs dbg-pkgs src-pkgs
> ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'doc-
> pkgs', '', d)}"
> =C2=A0SDKIMAGE_INSTALL_COMPLEMENTARY =3D
> '${@complementary_globs("SDKIMAGE_FEATURES", d)}'
> =C2=A0SDKIMAGE_INSTALL_COMPLEMENTARY[vardeps] +=3D "SDKIMAGE_FEATURES"
> +SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY ??=3D "1"
> =C2=A0
> =C2=A0PACKAGE_ARCHS:append:task-populate-sdk =3D " sdk-provides-dummy-
> target"
> =C2=A0SDK_PACKAGE_ARCHS +=3D "sdk-provides-dummy-${SDKPKGSUFFIX}"
> diff --git a/meta/conf/documentation.conf
> b/meta/conf/documentation.conf
> index 3f130120c0..84e2fef688 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -376,6 +376,7 @@ SDK_DIR[doc] =3D "The parent directory used by the
> OpenEmbedded build system when
> =C2=A0SDK_NAME[doc] =3D "The base name for SDK output files."
> =C2=A0SDK_OUTPUT[doc] =3D "The location used by the OpenEmbedded build
> system when creating SDK output."
> =C2=A0SDKIMAGE_FEATURES[doc] =3D "Equivalent to IMAGE_FEATURES. However,
> this variable applies to the SDK generated from an image using the
> command 'bitbake -c populate_sdk imagename'."
> +SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY[doc] =3D "Set to
> something else than '1' to install recommended complementary packages
> as part of sdk. Used to make populate_sdk behave like Kirkstone and
> earlier"
> =C2=A0SDKMACHINE[doc] =3D "Specifies the architecture (i.e. i686 or x86_6=
4)
> for which to build SDK and ADT items."
> =C2=A0SECTION[doc] =3D "The section in which packages should be categoriz=
ed.
> Package management utilities can make use of this variable."
> =C2=A0SELECTED_OPTIMIZATION[doc] =3D "The variable takes the value of
> FULL_OPTIMIZATION unless DEBUG_BUILD =3D '1'. In this case, the value
> of DEBUG_OPTIMIZATION is used."
> diff --git a/meta/lib/oe/package_manager/__init__.py
> b/meta/lib/oe/package_manager/__init__.py
> index d3b2317894..50e78c4017 100644
> --- a/meta/lib/oe/package_manager/__init__.py
> +++ b/meta/lib/oe/package_manager/__init__.py
> @@ -344,7 +344,7 @@ class PackageManager(object, metaclass=3DABCMeta):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "'%s' returned %d:\n%s" %
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (' '.join(cmd), e.returncode,
> e.output.decode("utf-8")))
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 def install_complementary(self, globs=3DNone):
> +=C2=A0=C2=A0=C2=A0 def install_complementary(self, globs=3DNone,
> hard_depends_only=3DTrue):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Install complementary pa=
ckages based upon the list of
> currently installed
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packages e.g. locales, *=
-dev, *-dbg, etc. Note: every
> backend needs to
> @@ -399,7 +399,7 @@ class PackageManager(object, metaclass=3DABCMeta):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 bb.note("Installing complementary packages ... %s
> (skipped already provided packages %s)" % (
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ' '.join(install_pkgs),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ' '.join(skip_pkgs)))
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 self.install(install_pkgs, hard_depends_only=3DTrue)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 self.install(install_pkgs,
> hard_depends_only=3Dhard_depends_only)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
except subprocess.CalledProcessError as e:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 bb.fatal("Could not compute complementary packages
> list. Command "
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "'%s' returned %d:\n%s" %
> diff --git a/meta/lib/oe/package_manager/deb/sdk.py
> b/meta/lib/oe/package_manager/deb/sdk.py
> index 6f3005053e..6232c47f4a 100644
> --- a/meta/lib/oe/package_manager/deb/sdk.py
> +++ b/meta/lib/oe/package_manager/deb/sdk.py
> @@ -65,7 +65,9 @@ class PkgSdk(Sdk):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.note("Installing TARG=
ET packages")
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._populate_sysroot(s=
elf.target_pm, self.target_manifest)
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_
> COMPLEMENTARY'))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hard_depends_only =3D
> (self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY') =3D=3D
> '1')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_
> COMPLEMENTARY'),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hard_=
depends_only)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.target_pm.run_pre_p=
ost_installs()
> =C2=A0
> diff --git a/meta/lib/oe/package_manager/ipk/sdk.py
> b/meta/lib/oe/package_manager/ipk/sdk.py
> index 3acd55f548..e8663523df 100644
> --- a/meta/lib/oe/package_manager/ipk/sdk.py
> +++ b/meta/lib/oe/package_manager/ipk/sdk.py
> @@ -61,7 +61,9 @@ class PkgSdk(Sdk):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.note("Installing TARG=
ET packages")
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._populate_sysroot(s=
elf.target_pm, self.target_manifest)
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_
> COMPLEMENTARY'))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hard_depends_only =3D
> (self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY') =3D=3D
> '1')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_
> COMPLEMENTARY'),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hard_=
depends_only)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env_bkp =3D os.environ.c=
opy()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.environ['PATH'] =3D
> self.d.expand("${COREBASE}/scripts/nativesdk-intercept") + \
> diff --git a/meta/lib/oe/package_manager/rpm/sdk.py
> b/meta/lib/oe/package_manager/rpm/sdk.py
> index ea79fe050b..a3f505c023 100644
> --- a/meta/lib/oe/package_manager/rpm/sdk.py
> +++ b/meta/lib/oe/package_manager/rpm/sdk.py
> @@ -65,8 +65,10 @@ class PkgSdk(Sdk):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.note("Installing TARG=
ET packages")
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._populate_sysroot(s=
elf.target_pm, self.target_manifest)
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_
> COMPLEMENTARY'))
> -
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hard_depends_only =3D
> (self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY') =3D=3D
> '1')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_
> COMPLEMENTARY'),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hard_=
depends_only)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env_bkp =3D os.environ.c=
opy()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.environ['PATH'] =3D
> self.d.expand("${COREBASE}/scripts/nativesdk-intercept") + \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.pathsep + os.environ["PATH"]


