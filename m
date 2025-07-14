Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF25C83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 11:50:32 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.76330.1752493824146716633
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 04:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VS+b9tKM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45526dec171so29245065e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 04:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1752493822; x=1753098622; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wGaN2/TseAC5CgqCglyDvjs/CCo+0Vv4FqgfBNjaW+Q=;
        b=VS+b9tKMfM3BgofRs0B+GjUkoitsUQ05HvkejmNTkDCq9OnzIncwlzQxfgYhq9bn4L
         +7mGNbdPee3jc5dmTxT2SjmoaAHDBPv7gUisRD3q65odD/uXzzEjW355xlp4sIrmqu6x
         /LgCZttgJiHTsg8guIQDiKnNnb11Bc5gvwQdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752493822; x=1753098622;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wGaN2/TseAC5CgqCglyDvjs/CCo+0Vv4FqgfBNjaW+Q=;
        b=oz0LHbz32QyJs7MkyKrulWrKujFx4LfXrHoK/tbg16TlzRdcrZUFfeTQRIllBASVY+
         k7Hw8E0WJtZj81lx3RVHQi19IolEPLz9HSJTA4OgCNQr1T5a0+z09evKubK3LR2ATZcU
         bruzjqquJRw01bZPirjmmLTne1Vrq51sl9TQ4Yyae2nFgCO2P+XfQofVQ6qjMXkKw7xe
         EN2jf+ZqTBD7OOpM8v53ABYTj171V644jfah41EEky73cqFcP8mX4rO3Zpeqsk733AmQ
         x1nPpaW0QQ3jObEgDkCfV6NH78ji4bVu/kk6uKaEnO9BvC/DWDBO35ANj6CvbLx1g53i
         b5FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhfvT7/bRsOqy8O5Kc9mYS1QhGwnjujBY+eVIL5Otpr3DFSjnTC+gC7f2waKurMd4le/pBrf4PBW/vZNc8yCP7qA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxNKV4R8dR03tVFa5/TJ/GYseKysV7Po87LXNSkiGYekNnGorjf
	cUuqQf2iO6SrsKkcMlHVaNdXIWL/jBRs0j59D3Yn6gMVjAAleyVABf1Hv5LcbvFz4xM=
X-Gm-Gg: ASbGnctSGCeW2xsYVjV5oyOd8w86Ui4rcLAV0Gikl8RjigwQAXBNiUYNe/ABZVGMoOn
	96GoUM/b259xgBVzn4C2Z7JlNmYViw76J5b0JraLoVdqZj+0HLkk0tCKJiYF40e8plRFK/lE5Y1
	G5SHiQe2W9LOBOM71hdjhUV4QWKCGxELjeCs7HavtgrUNkti8vV2U8fboghRW0szJ3lcwQj8xeY
	AVFYzYmeOGW+3pnKDZbCNbpfRtBdlRrMUvrm5adStul3WatOG/XMRNkS2LMEOUIebuFUsf/qg6p
	wPQZS5Pe0iiqvKIWe6eikZdjnGT2zpboXGuZpT7W5NJ+uJoAnT5q5Qefsu57lPXl+oOjME39lAQ
	NZDaBiaHcDoGGm3k+bJGDJR4NF+tq39VhvYllrZ8CLEoMNPLK7vHOSj5xe6JDMs9m9v2Pn/I5eC
	oBf42vSLhSK/A=
X-Google-Smtp-Source: AGHT+IE1oa7L90lmJXDrF84XndQsZzBuG6robF4Kh0XugL89vxhDxYIx6N/SS9sqQBYm9HDgvjpstw==
X-Received: by 2002:a5d:5f88:0:b0:3b5:e077:af24 with SMTP id ffacd0b85a97d-3b5f2dc21famr10361830f8f.14.1752493822091;
        Mon, 14 Jul 2025 04:50:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7cb4:487f:cc4e:53c1? ([2001:8b0:aba:5f3c:7cb4:487f:cc4e:53c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd15bfsm12465478f8f.19.2025.07.14.04.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 04:50:21 -0700 (PDT)
Message-ID: <56b917893bea829074e4727fc716f939000842f0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] mtd-utils: add optional systemd service for
 ubihealthd
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: hiagofranco@gmail.com, openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>, Hiago De Franco
	 <hiago.franco@toradex.com>
Date: Mon, 14 Jul 2025 12:50:20 +0100
In-Reply-To: <20250712015604.148635-1-hiagofranco@gmail.com>
References: <20250712015604.148635-1-hiagofranco@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 11:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220224

On Fri, 2025-07-11 at 22:56 -0300, Hiago De Franco via lists.openembedded.o=
rg wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
>=20
> Add support for deploying a ubihealthd.service systemd unit through a
> new 'ubihealthd-service' PACKAGECONFIG option.
>=20
> This change allows systems using systemd to easily enable and manage the
> UBI health monitoring daemon as a background service.
>=20
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
> =C2=A0.../mtd/files/ubihealthd.service=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 +++++++++
> =C2=A0meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb=C2=A0 | 21 +++++++++++=
+++++---
> =C2=A02 files changed, 28 insertions(+), 3 deletions(-)
> =C2=A0create mode 100644 meta/recipes-devtools/mtd/files/ubihealthd.servi=
ce
>=20
> diff --git a/meta/recipes-devtools/mtd/files/ubihealthd.service b/meta/re=
cipes-devtools/mtd/files/ubihealthd.service
> new file mode 100644
> index 000000000000..74b8df655b5c
> --- /dev/null
> +++ b/meta/recipes-devtools/mtd/files/ubihealthd.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=3DUBI health daemon
> +After=3Dmulti-user.target
> +
> +[Service]
> +Type=3Dforking
> +ExecStart=3D@SBINDIR@/ubihealthd
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb b/meta/recipes-=
devtools/mtd/mtd-utils_2.3.0.bb
> index 47f0b01abe0f..d99a1d5c7b70 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
> @@ -6,7 +6,7 @@ LICENSE =3D "GPL-2.0-or-later"
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c3=
2c317bb3=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://include/common.h;be=
ginline=3D1;endline=3D17;md5=3Dba05b07912a44ea2bf81ce409380049c"
> =C2=A0
> -inherit autotools pkgconfig update-alternatives
> +inherit autotools pkgconfig systemd update-alternatives
> =C2=A0
> =C2=A0DEPENDS =3D "zlib e2fsprogs util-linux"
> =C2=A0RDEPENDS:mtd-utils-tests +=3D "bash"
> @@ -17,7 +17,8 @@ SRC_URI =3D "git://git.infradead.org/mtd-utils.git;bran=
ch=3Dmaster \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0002-ubifs-utils-journal-Include-sys-stat.h.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0003-ubifs-utils-link-libmissing.a-in-case-execinfo.h-isn.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0004-ubifs-utils-extract_files-Include-linux-limits.h.patch=C2=A0\
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001=
-Improve-check-for-GCC-compiler-version.patch"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001=
-Improve-check-for-GCC-compiler-version.patch=C2=A0\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://ubih=
ealthd.service"
> =C2=A0
> =C2=A0# xattr support creates an additional compile-time dependency on ac=
l because
> =C2=A0# the sys/acl.h header is needed. libacl is not needed and thus ena=
bling xattr
> @@ -29,6 +30,7 @@ PACKAGECONFIG[crypto] =3D "--with-crypto,--without-cryp=
to,openssl"
> =C2=A0PACKAGECONFIG[jffs] =3D "--with-jffs,--without-jffs"
> =C2=A0PACKAGECONFIG[ubifs] =3D "--with-ubifs,--without-ubifs"
> =C2=A0PACKAGECONFIG[zstd] =3D "--with-zstd,--without-zstd,zstd"
> +PACKAGECONFIG[ubihealthd-service] =3D ",,systemd"
> =C2=A0
> =C2=A0CPPFLAGS:append:riscv64=C2=A0 =3D " -pthread -D_REENTRANT"
> =C2=A0
> @@ -54,6 +56,9 @@ ALTERNATIVE_LINK_NAME[flash_lock] =3D "${sbindir}/flash=
_lock"
> =C2=A0ALTERNATIVE_LINK_NAME[flash_unlock] =3D "${sbindir}/flash_unlock"
> =C2=A0ALTERNATIVE_LINK_NAME[flashcp] =3D "${sbindir}/flashcp"
> =C2=A0
> +SYSTEMD_SERVICE:${PN} =3D "ubihealthd.service"
> +SYSTEMD_AUTO_ENABLE =3D "disable"
> +
> =C2=A0do_install () {
> =C2=A0	oe_runmake install DESTDIR=3D${D} SBINDIR=3D${sbindir} MANDIR=3D${=
mandir} INCLUDEDIR=3D${includedir}
> =C2=A0	install -d ${D}${includedir}/mtd
> @@ -64,6 +69,12 @@ do_install () {
> =C2=A0	install -m 0644 ${S}/include/libubigen.h ${D}${includedir}
> =C2=A0	oe_libinstall -a libubi ${D}${libdir}/
> =C2=A0	oe_libinstall -a libmtd ${D}${libdir}/
> +
> +	if ${@bb.utils.contains('PACKAGECONFIG', 'ubihealthd-service', 'true', =
'false', d)}; then
> +		install -d ${D}${systemd_system_unitdir}
> +		install -m 0644 ${UNPACKDIR}/ubihealthd.service ${D}${systemd_system_u=
nitdir}
> +		sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/ubi=
healthd.service
> +	fi
> =C2=A0}
> =C2=A0
> =C2=A0PACKAGES =3D+ "mtd-utils-misc mtd-utils-tests"
> @@ -71,7 +82,11 @@ PACKAGES =3D+ "${@bb.utils.contains("PACKAGECONFIG", "=
jffs", "mtd-utils-jffs2", ""
> =C2=A0PACKAGES =3D+ "${@bb.utils.contains("PACKAGECONFIG", "ubifs", "mtd-=
utils-ubifs", "", d)}"
> =C2=A0
> =C2=A0FILES:mtd-utils-jffs2 =3D "${sbindir}/mkfs.jffs2 ${sbindir}/jffs2du=
mp ${sbindir}/jffs2reader ${sbindir}/sumtool"
> -FILES:mtd-utils-ubifs =3D "${sbindir}/mkfs.ubifs ${sbindir}/ubi*"
> +FILES:mtd-utils-ubifs =3D "\
> +=C2=A0=C2=A0=C2=A0 ${sbindir}/mkfs.ubifs \
> +=C2=A0=C2=A0=C2=A0 ${sbindir}/ubi* \
> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('PACKAGECONFIG', 'ubihealthd-ser=
vice', '${systemd_system_unitdir}/ubihealthd.service', '', d)} \
> +=C2=A0=C2=A0=C2=A0 "
> =C2=A0FILES:mtd-utils-misc =3D "${sbindir}/nftl* ${sbindir}/ftl* ${sbindi=
r}/rfd* ${sbindir}/doc* ${sbindir}/serve_image ${sbindir}/recv_image"
> =C2=A0FILES:mtd-utils-tests =3D "${libexecdir}/mtd-utils/*"

As well as the feedback from Peter, there were autobuilder testing failures=
:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/2029
https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/1875

Cheers,

Richard

