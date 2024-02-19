Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DB3C48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 14:54:52 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.43164.1708354486140290771
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 06:54:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ewKf9aF4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4126144d931so12420855e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 06:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708354484; x=1708959284; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIexhOMVdIprPzkGHhYMt90kDFbY30rE+ec6xe2h6Gs=;
        b=ewKf9aF4jFYIFh8Lzbni3ImIN8S0CxhFFi+ukD8IyjwS6Eq5lwA6Su9F7E0+/7ZF9c
         U/wvDl4kbQ5Jyr+rCyfRnevBLXUzi15z58YloEUW8dxjGY0S+dgiuOlkLvmtoGbI94cg
         VrSDVAT0rY2Ge1NcESOAfVOds8KNjQCFeuZNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708354484; x=1708959284;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EIexhOMVdIprPzkGHhYMt90kDFbY30rE+ec6xe2h6Gs=;
        b=K+nsSBdyRDY2ISwHaGeDGbzZwZJFUs9MzPjAkhOLAGrFl6+9Ud5W0KBTWyz9kdg97t
         iJuFRsco3Y6JiY6ibrHmNJJvTQgEQ8Ezce/NQw2wAVkYAUNYAlpiDDs4pxMQEfPZXh04
         1FAGTRIGi0S/urylggnnGpwowrDhdOQnr2nStfOHLKHXrQlN3xvvhjA7UwSc4C5eF0hF
         +YY2ifRZBgl5KW0pXTiSXT6k6NogImO8rEwt3EppcF7iZclzPwxKWRwxAxo+IdTna2rR
         X+NahtysbetlPdH+nGPiXb8lwguGBY6LHLtl3p0kPsWPkNLXjuUDEJBjk5+87gZ0TX+r
         58nw==
X-Forwarded-Encrypted: i=1; AJvYcCUmfGb+2nQgc2ZQzWzl5Jl7TLFsACnPoFkb7J3ihqseRPLd1+HaOMTmulCpwZXE66B0myOyE1wXt414k8gxeNXEckQOKMsyL4gNJdUbOHXBc2nsTW7ekdan
X-Gm-Message-State: AOJu0Yx2x0yLEZVMA5jFsc0qyhYy8P51n4ZcsN296NjnOlF031ZoyZXF
	LCJi9T7gHPa1n9xsUbrmdfsoIGNplpnHKWilZk6hXqHkV/6rGpMYkS/fz4AJsJPVeKhovZGaz1o
	r
X-Google-Smtp-Source: AGHT+IFuOC/QdE8GpNJWI4q8PHWOxolHRyNUEYWOlWyn6gUcpMgZaEqxq1aqAh3Yrw+OXTCpdn6mNQ==
X-Received: by 2002:a05:600c:548b:b0:412:5890:60e6 with SMTP id iv11-20020a05600c548b00b00412589060e6mr3919496wmb.4.1708354484533;
        Mon, 19 Feb 2024 06:54:44 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f060:69a2:69c4:ec75? ([2001:8b0:aba:5f3c:f060:69a2:69c4:ec75])
        by smtp.gmail.com with ESMTPSA id g17-20020a05600c4ed100b0040ecdd672fasm11774049wmq.13.2024.02.19.06.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 06:54:44 -0800 (PST)
Message-ID: <ba662b54bfda53a4e3da6121091cfde260777191.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/3] image.bbclass/rootfs: set&unpack
 package-database
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: johannes.schneider@leica-geosystems.com, 
	openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2024 14:54:43 +0000
In-Reply-To: <20240213100012.252237-3-johannes.schneider@leica-geosystems.com>
References: 
	<20240213100012.252237-1-johannes.schneider@leica-geosystems.com>
	 <20240213100012.252237-3-johannes.schneider@leica-geosystems.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 14:54:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195878

On Tue, 2024-02-13 at 11:00 +0100, Johannes Schneider via lists.openembedde=
d.org wrote:
> set the package-database of a "lower image" to unpack and build upon when
> installing packages for the current image. This way a lean image will be
> created, which only holds the packages that are not already present in th=
e lower
> image, that then could be used with overlayfs or systemd-sysext to extend=
 the
> "lower image" on demand; for development purposes on an RO lower image fo=
r
> example.
>=20
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.co=
m>
> ---
> =C2=A0meta/classes-recipe/image.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 10 +++++++-
> =C2=A0meta/lib/oe/package_manager/deb/rootfs.py |=C2=A0 2 ++
> =C2=A0meta/lib/oe/package_manager/ipk/rootfs.py |=C2=A0 6 +++--
> =C2=A0meta/lib/oe/package_manager/rpm/rootfs.py |=C2=A0 7 ++++--
> =C2=A0meta/lib/oe/rootfs.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 29 +++++++++++++++++++++++
> =C2=A05 files changed, 49 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/imag=
e.bbclass
> index c688c39f15..b4a2460187 100644
> --- a/meta/classes-recipe/image.bbclass
> +++ b/meta/classes-recipe/image.bbclass
> @@ -42,8 +42,16 @@ IMAGE_FEATURES ?=3D ""
> =C2=A0IMAGE_FEATURES[type] =3D "list"
> =C2=A0IMAGE_FEATURES[validitems] +=3D "debug-tweaks read-only-rootfs read=
-only-rootfs-delayed-postinsts stateless-rootfs empty-root-password allow-e=
mpty-password allow-root-login serial-autologin-root post-install-logging o=
verlayfs-etc"
> =C2=A0
> +# Image layering:
> +# a "base image" would create a snapshot of the package-database after t=
he
> +# installation of all packages into the rootfs is done. The next/other i=
mage
> +# "layered on-top" of the former would then import that database and ins=
tall
> +# further packages; without reinstalling package dependencies that are a=
lready
> +# installed in the layer below.
> =C2=A0# Generate snapshot of the package database?
> =C2=A0IMAGE_GEN_PKGDBFS ?=3D "0"
> +# Package-database of the base image, upon which to build up a new image=
-layer
> +IMAGE_BASE_PKGDB ?=3D ""
> =C2=A0
> =C2=A0# Generate companion debugfs?
> =C2=A0IMAGE_GEN_DEBUGFS ?=3D "0"
> @@ -134,7 +142,7 @@ def rootfs_variables(d):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_L=
INK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTAL=
L_COMPLEMENTARY','IMAGE_LINGUAS', 'IMAGE_LINGUAS_COMPLEMENTARY', 'IMAGE_LOC=
ALES_ARCHIVE',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS=
','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GL=
OBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VE=
NDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYD=
IR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 'CONVERSIONTYPES', 'IMAGE_GEN_PKGDBFS', 'IMAGE_GEN=
_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMEN=
TARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 'CONVERSIONTYPES', 'IMAGE_GEN_PKGDBFS', 'IMAGE_BAS=
E_PKGDB', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKA=
GE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'IMAGE_INSTALL_DEBUGFS']
> =C2=A0=C2=A0=C2=A0=C2=A0 variables.extend(rootfs_command_variables(d))
> =C2=A0=C2=A0=C2=A0=C2=A0 variables.extend(variable_depends(d))
> diff --git a/meta/lib/oe/package_manager/deb/rootfs.py b/meta/lib/oe/pack=
age_manager/deb/rootfs.py
> index 43107c8663..71a21df09b 100644
> --- a/meta/lib/oe/package_manager/deb/rootfs.py
> +++ b/meta/lib/oe/package_manager/deb/rootfs.py
> @@ -152,6 +152,8 @@ class PkgRootfs(DpkgOpkgRootfs):
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 execute_pre_post_process=
(self.d, deb_pre_process_cmds)
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._unpack_pkg_db_rootfs(['=
/var/lib/dpkg'])
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if self.progress_reporte=
r:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
self.progress_reporter.next_stage()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
# Don't support incremental, so skip that
> diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/pack=
age_manager/ipk/rootfs.py
> index 64d9bc7969..408faa8030 100644
> --- a/meta/lib/oe/package_manager/ipk/rootfs.py
> +++ b/meta/lib/oe/package_manager/ipk/rootfs.py
> @@ -276,12 +276,16 @@ class PkgRootfs(DpkgOpkgRootfs):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgs_to_install =3D self=
.manifest.parse_initial_manifest()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opkg_pre_process_cmds =
=3D self.d.getVar('OPKG_PREPROCESS_COMMANDS')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opkg_post_process_cmds =
=3D self.d.getVar('OPKG_POSTPROCESS_COMMANDS')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opkg_lib_dir =3D self.d.getVa=
r('OPKGLIBDIR')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opkg_dir =3D os.path.join(opk=
g_lib_dir, 'opkg')
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # update PM index files
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.pm.write_index()
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 execute_pre_post_process=
(self.d, opkg_pre_process_cmds)
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._unpack_pkg_db_rootfs([o=
pkg_dir])
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if self.progress_reporte=
r:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
self.progress_reporter.next_stage()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
# Steps are a bit different in order, skip next
> @@ -317,8 +321,6 @@ class PkgRootfs(DpkgOpkgRootfs):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if self.progress_reporte=
r:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
self.progress_reporter.next_stage()
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opkg_lib_dir =3D self.d.getVa=
r('OPKGLIBDIR')
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opkg_dir =3D os.path.join(opk=
g_lib_dir, 'opkg')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._setup_pkg_db_rootf=
s([opkg_dir])
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._setup_dbg_rootfs([=
opkg_dir])
> =C2=A0
> diff --git a/meta/lib/oe/package_manager/rpm/rootfs.py b/meta/lib/oe/pack=
age_manager/rpm/rootfs.py
> index 673006c131..9986b13b5f 100644
> --- a/meta/lib/oe/package_manager/rpm/rootfs.py
> +++ b/meta/lib/oe/package_manager/rpm/rootfs.py
> @@ -67,12 +67,15 @@ class PkgRootfs(Rootfs):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgs_to_install =3D self=
.manifest.parse_initial_manifest()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rpm_pre_process_cmds =3D=
 self.d.getVar('RPM_PREPROCESS_COMMANDS')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rpm_post_process_cmds =
=3D self.d.getVar('RPM_POSTPROCESS_COMMANDS')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 package_paths =3D ['/etc/rpm'=
, '/etc/rpmrc', '/etc/dnf', '/var/lib/rpm', '/var/cache/dnf', '/var/lib/dnf=
']
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # update PM index files
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.pm.write_index()
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 execute_pre_post_process=
(self.d, rpm_pre_process_cmds)
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._unpack_pkg_db_rootfs(pa=
ckage_paths)
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if self.progress_reporte=
r:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
self.progress_reporter.next_stage()
> =C2=A0
> @@ -110,8 +113,8 @@ class PkgRootfs(Rootfs):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if self.progress_reporte=
r:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
self.progress_reporter.next_stage()
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._setup_pkg_db_rootfs(['/=
etc/rpm', '/etc/rpmrc', '/etc/dnf', '/var/lib/rpm', '/var/cache/dnf', '/var=
/lib/dnf'])
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._setup_dbg_rootfs(['/etc=
/rpm', '/etc/rpmrc', '/etc/dnf', '/var/lib/rpm', '/var/cache/dnf', '/var/li=
b/dnf'])
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._setup_pkg_db_rootfs(pac=
kage_paths)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._setup_dbg_rootfs(packag=
e_paths)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 execute_pre_post_process=
(self.d, rpm_post_process_cmds)
> =C2=A0
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 9268a02531..7ca574e6b1 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -106,6 +106,35 @@ class Rootfs(object, metaclass=3DABCMeta):
> =C2=A0=C2=A0=C2=A0=C2=A0 def _cleanup(self):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pass
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 def _unpack_pkg_db_rootfs(self, package_paths):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 import tarfile
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gen_pkg_db_fs =3D self.d.getV=
ar('IMAGE_BASE_PKGDB') or ''
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if gen_pkg_db_fs =3D=3D '':
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return

Can be simplified to:

gen_pkg_db_fs =3D self.d.getVar('IMAGE_BASE_PKGDB')
if not gen_pkg_db_fs:
    return


> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fname =3D self.d.getVar('DEPL=
OY_DIR_IMAGE') + '/' + self.d.getVar('IMAGE_BASE_PKGDB') + '-pkgdb.tar.gz'
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not fname:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.wa=
rn("PKGDB does not exit:", fname)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n

Shouldn't that be a hard error?

> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.note("=C2=A0 unpacking pac=
kage database...")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.utils.mkdirhier(self.image=
_rootfs + '-pkgdb')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if fname.endswith("tar.gz"):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tar =
=3D tarfile.open(fname, "r:gz")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tar.e=
xtractall(path=3Dself.image_rootfs + '-pkgdb')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tar.c=
lose()

Didn't you hardcode it to tar.gz above? FWIW the python tarfile module
is also very slow.

What happens if I set IMAGE_FSTYPES_PKGDBFS to something other than
tar.gz?

> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.note("=C2=A0 Copying back =
package database...")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for path in package_paths:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(p=
ath))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 excep=
t:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 pass
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if os=
.path.isdir(self.image_rootfs + '-pkgdb' + path):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 shutil.copytree(self.image_rootfs + '-pkgdb' + path, sel=
f.image_rootfs + path, symlinks=3DTrue, dirs_exist_ok=3DTrue)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif =
os.path.isfile(self.image_rootfs + '-pkgdb' + path):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 shutil.copyfile(self.image_rootfs + '-pkgdb' + path, sel=
f.image_rootfs + path)
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 def _setup_pkg_db_rootfs(self, package_paths):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gen_pkg_db_fs =3D self.d=
.getVar('IMAGE_GEN_PKGDBFS') or '0'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if gen_pkg_db_fs !=3D '1=
':


