Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA3AC5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 21:43:06 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.6279.1749246184267380026
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 14:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HnrzWVTD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a5096158dcso2204571f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 14:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749246183; x=1749850983; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBoZHF7hWshCAWkdvMGXx/gJl/+mg2BPhsa9RkOq7Io=;
        b=HnrzWVTDwMWiz7mH5rep/5aHYg+3Scdo+YG9OCL/BB31L2SOVkntGwsJJ7YGkhRMbv
         SxSOncy03CgQSKm1ue9YFR5AkgE5mnRcubGIcqgg8Bk579MpVBguDt5R6xtOiBqJ+nt9
         O6KpCAd3eDfyVA5mxp509Xh5KpWYNJTgBtxEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749246183; x=1749850983;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JBoZHF7hWshCAWkdvMGXx/gJl/+mg2BPhsa9RkOq7Io=;
        b=evZMymKzcXPmb6rCtHbHBjo82CrL9qX0CSLlZZzaUMg3AnjG1PDCKgPGKXO7jdTEnF
         clcmTrcno/LSFA3cKLA0E5XBex7skAb6CzumokVQpH2TYPwNGiYGcSv6asHCpHpxFYiL
         H+kQ1uW/BMTND5BtKNqyvA2pc5+TZdk5XwCjXSNdb7103kEsJB64z/ZtdUGf5GX49v5y
         QaBViC/GB6UwSfwXAiOQaOucGyWfgJDSa8KbYl88QCCkQVKwjiW6wWxvwXc0M4mzLvZ8
         NctShYvGLcsh4lutH9HoyvRPjvOvaeuPqiDbT78DbhDeMs8iuU3ySPjtAz2iURI1pEtU
         gDzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJvV3DU4Di4CW9PmsZAVCc4HHgPttv/YNiL4ETKr8A5d4bQQFK21Rabm91hUxbZ7oiTLs3PXXO2QhVOg7aBDtx4w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz3QWYDplqr4aTTDHGUt1mwuj3OaNu7kvwZeUrKA/Waex5y5L+a
	uFdDBsooiHNcsAGQIE3F+VEYnsLbBU04xTR/yX5gYxQxkOX9FtceLltjm9B6B4F5GM5TS1Ckja5
	nwtVvRZU=
X-Gm-Gg: ASbGncsNNXTLG9C6DaDviKYPfoHKpK5LKHS/TxUZOo0PLngc33S788onZFp1hCicKBp
	txqa8KZclRDzGXEujqkwoRr7dYJvlmEYnbFqQEawINGNjJ3gcHQp50rfnxg0ER4HxJHD5kgNTes
	RUzkeef8GZfxhNSfblmOjhTDCWkeTXoeKnaH79MlRckmw/wSEJXWZZvVPMOEqh6faHCmvO6WbQB
	TIi8sr3WzPc5fH1S050Ln8VvMCmG1QIFRVF9EdvF0Se9GW58KvPzPvniB6C3OE8F144OA3pyhng
	u7eYsd8twgoPg9wHDy4UKAAGaawwd13WLnpsIE/1y/wuwDlYSSQ1FSWjuIyvr3ptmar1H3mj9gG
	+3JAg/fvRtZYnaCP1nWUhVK9sWT7Lq7McZIfm0Fsd+3tCIHL2uGtrxUQbtGpC6A==
X-Google-Smtp-Source: AGHT+IF7rn3jaAF8xB7X5p/+HjxryCtDKGWEik3eLxLDRqTyyvp+nyZScQnCM72LPUztCKDnBYrnLQ==
X-Received: by 2002:a05:6000:2082:b0:3a3:4baa:3f3d with SMTP id ffacd0b85a97d-3a5319b69d2mr4411343f8f.6.1749246182574;
        Fri, 06 Jun 2025 14:43:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8f59:50ba:83a4:d366? ([2001:8b0:aba:5f3c:8f59:50ba:83a4:d366])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532131df6sm2898438f8f.0.2025.06.06.14.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 14:43:01 -0700 (PDT)
Message-ID: <f322ed9dbb8a47bdc9e819a91b1fb7968592c41b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 09/16] squashfs-tools: update to 4.7
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Fri, 06 Jun 2025 22:43:00 +0100
In-Reply-To: <20250606142822.3387675-9-ross.burton@arm.com>
References: <20250606142822.3387675-1-ross.burton@arm.com>
	 <20250606142822.3387675-9-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 21:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218188

On Fri, 2025-06-06 at 15:28 +0100, Ross Burton via lists.openembedded.org w=
rote:
> The REPRODUCIBLE_DEFAULT option was removed in 4.7[1].
>=20
> Backport a patch to fix missing pthread typedefs, and a patch to fix
> missing pid_t typedefs.
>=20
> Also clean up the tasks to be neater and more concise.
>=20
> [1] squash-tools ae9914d15293af7c596148aedd997b3058e35d9e
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0.../squashfs-tools/squashfs-tools/pid.patch=C2=A0=C2=A0 | 40 ++++++=
+++++++++++++
> =C2=A0.../squashfs-tools/thread.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 33 +++++++++++++++
> =C2=A0...s-tools_4.6.1.bb =3D> squashfs-tools_4.7.bb} | 15 ++++---
> =C2=A03 files changed, 80 insertions(+), 8 deletions(-)
> =C2=A0create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-to=
ols/pid.patch
> =C2=A0create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-to=
ols/thread.patch
> =C2=A0rename meta/recipes-devtools/squashfs-tools/{squashfs-tools_4.6.1.b=
b =3D> squashfs-tools_4.7.bb} (77%)
>=20
> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/pid.patc=
h b/meta/recipes-devtools/squashfs-tools/squashfs-tools/pid.patch
> new file mode 100644
> index 00000000000..a15b6211248
> --- /dev/null
> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools/pid.patch
> @@ -0,0 +1,40 @@
> +From 05a895b3f996d1ac157d95b04980f5f047e7dbf7 Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Fri, 6 Jun 2025 15:23:07 +0100
> +Subject: [PATCH] print_pager: add missing includes
> +
> +When building with musl:
> +
> +=C2=A0 print_pager.h:33:25: error: unknown type name 'pid_t'
> +=C2=A0=C2=A0=C2=A0=C2=A0 33 | extern void wait_to_die(pid_t process);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~
> +=C2=A0 print_pager.h:34:25: error: unknown type name 'pid_t'
> +=C2=A0=C2=A0=C2=A0=C2=A0 34 | extern FILE *exec_pager(pid_t *process);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~
> +
> +print_pager.h uses pid_t and FILE, so add the required #includes to
> +ensure that these are defined.
> +
> +Upstream-Status: Submitted [https://github.com/plougher/squashfs-tools/p=
ull/314]
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +---
> + squashfs-tools/print_pager.h | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/squashfs-tools/print_pager.h b/squashfs-tools/print_pager.h
> +index c33d4d2e..f3e0da6c 100644
> +--- a/squashfs-tools/print_pager.h
> ++++ b/squashfs-tools/print_pager.h
> +@@ -30,6 +30,9 @@
> + #define MORE_PAGER 2
> + #define UNKNOWN_PAGER 3
> +=20
> ++#include <stdio.h>
> ++#include <sys/types.h>
> ++
> + extern void wait_to_die(pid_t process);
> + extern FILE *exec_pager(pid_t *process);
> + extern int get_column_width();
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/thread.p=
atch b/meta/recipes-devtools/squashfs-tools/squashfs-tools/thread.patch
> new file mode 100644
> index 00000000000..01741639c03
> --- /dev/null
> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools/thread.patch
> @@ -0,0 +1,33 @@
> +From b6e9f4b62cc3e762ceeddc0fc099f7d65f7b7361 Mon Sep 17 00:00:00 2001
> +From: Shiji Yang <yangshiji66@outlook.com>
> +Date: Wed, 4 Jun 2025 19:53:39 +0800
> +Subject: [PATCH] thread: add the missing pthread.h header
> +
> +Fix build error on macos:
> +
> +In file included from mksquashfs_help.c:35:
> +./thread.h:46:39: error: unknown type name 'pthread_mutex_t'; did you me=
an 'pthread_attr_t'?
> +=C2=A0=C2=A0 46 | extern void wait_thread_idle(int tid, pthread_mutex_t =
*mutex);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pthread_attr_t
> +
> +Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> +
> +Upstream-Status: Backport [b6e9f4b62cc3e762ceeddc0fc099f7d65f7b7361]
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +---
> + squashfs-tools/thread.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/squashfs-tools/thread.h b/squashfs-tools/thread.h
> +index 5a22fc43..e56a58cf 100644
> +--- a/squashfs-tools/thread.h
> ++++ b/squashfs-tools/thread.h
> +@@ -22,6 +22,7 @@
> +=C2=A0 *
> +=C2=A0 * thread.h
> +=C2=A0 */
> ++#include <pthread.h>
> +=20
> + #define TRUE 1
> + #define FALSE 0
> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.6.1.bb=
 b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb
> similarity index 77%
> rename from meta/recipes-devtools/squashfs-tools/squashfs-tools_4.6.1.bb
> rename to meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb
> index 51a2fbdb934..ae6845ddacf 100644
> --- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.6.1.bb
> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb
> @@ -7,8 +7,9 @@ SECTION =3D "base"
> =C2=A0LICENSE =3D "GPL-2.0-only"
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fd=
af4a4263"
> =C2=A0
> -SRC_URI =3D "git://github.com/plougher/squashfs-tools.git;protocol=3Dhtt=
ps;branch=3Dv6.1.1"
> -SRCREV =3D "d8cb82d9840330f9344ec37b992595b5d7b44184"
> +SRC_URI =3D "git://github.com/plougher/squashfs-tools.git;protocol=3Dhtt=
ps;branch=3Dmaster;tag=3D${PV} \
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://thread.patch"
> +SRCREV =3D "2e87d42ed089dc31990d83eeb07437b9d085d6d1"
> =C2=A0
> =C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))"
> =C2=A0
> @@ -16,7 +17,7 @@ S =3D "${WORKDIR}/git"
> =C2=A0
> =C2=A0EXTRA_OEMAKE =3D "${PACKAGECONFIG_CONFARGS}"
> =C2=A0
> -PACKAGECONFIG ??=3D "gzip xz lzo lz4 lzma xattr zstd reproducible"
> +PACKAGECONFIG ??=3D "gzip xz lzo lz4 lzma xattr zstd"
> =C2=A0PACKAGECONFIG[gzip] =3D "GZIP_SUPPORT=3D1,GZIP_SUPPORT=3D0,zlib"
> =C2=A0PACKAGECONFIG[xz] =3D "XZ_SUPPORT=3D1,XZ_SUPPORT=3D0,xz"
> =C2=A0PACKAGECONFIG[lzo] =3D "LZO_SUPPORT=3D1,LZO_SUPPORT=3D0,lzo"
> @@ -24,17 +25,15 @@ PACKAGECONFIG[lz4] =3D "LZ4_SUPPORT=3D1,LZ4_SUPPORT=
=3D0,lz4"
> =C2=A0PACKAGECONFIG[lzma] =3D "LZMA_XZ_SUPPORT=3D1,LZMA_XZ_SUPPORT=3D0,xz=
"
> =C2=A0PACKAGECONFIG[xattr] =3D "XATTR_SUPPORT=3D1,XATTR_SUPPORT=3D0,attr"
> =C2=A0PACKAGECONFIG[zstd] =3D "ZSTD_SUPPORT=3D1,ZSTD_SUPPORT=3D0,zstd"
> -PACKAGECONFIG[reproducible] =3D "REPRODUCIBLE_DEFAULT=3D1,REPRODUCIBLE_D=
EFAULT=3D0,"
> =C2=A0
> =C2=A0do_compile() {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd ${S}/squashfs-tools
> -	oe_runmake all
> +	oe_runmake -C ${S}/squashfs-tools all
> =C2=A0}
> =C2=A0
> =C2=A0do_install() {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd ${S}/squashfs-tools
> +	oe_runmake -C ${S}/squashfs-tools install INSTALL_PREFIX=3D${D}${prefix=
} INSTALL_MANPAGES_DIR=3D${D}${datadir}/man/man1
> +
> =C2=A0	install -d "${D}${includedir}"
> -	oe_runmake install INSTALL_PREFIX=3D${D}${prefix} INSTALL_MANPAGES_DIR=
=3D${D}${datadir}/man/man1
> =C2=A0	install -m 0644 "${S}"/squashfs-tools/squashfs_fs.h "${D}${include=
dir}"
> =C2=A0}
> =C2=A0

https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/537

Cheers,

Richard

