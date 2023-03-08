Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E571C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 17:31:52 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.14525.1678296705594518215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 09:31:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GaSKq1a7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id bx12so16114172wrb.11
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 09:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678296704;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R8hs+AEtG56gqCzJZjpLEqKGNL/3P5T8leyTXc5ajpE=;
        b=GaSKq1a7nyQYhnsDDFQQrtna0G9jYsKG8V2TT+b14A3Qgu+/7Cw69PRszNmdjKn6Pi
         EYzlSAzaAPS4aDGdGYh8J+Cfv0WzsLtobc8qXuBjkmzuwgjASVsbR5bWxIO2wooANnHI
         0wxFcqcljj0OWh/Bhe9onKjuLnhazuNwOTPWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678296704;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R8hs+AEtG56gqCzJZjpLEqKGNL/3P5T8leyTXc5ajpE=;
        b=fSR7xA5TtktfUPOquaYBncOoqiwSKokzPxQNgc3DVfRr335AXaT8pJ+R7JfX/lox4B
         loQH4rXrmeOLcnHiyLfHo9oTe5AxaW3XrjAUO3NThly0rJw5bJXXAOu9eNbbFtNuQSKX
         6mznjmz+mL72hDjCFp+t9Y7Op5L9cfFB0bxtf/DWVvZu8awQdCYvYAib83yXUbtogC1H
         LUPLOvbh243/mGVi8E0wJtv6Hgi8+nKHAbGJPCJDG2eyAiKSG3fqlgfT8K8wcPRU+XMu
         EA4MNeLgxwN9mOqR2XiqE6VmZvc9EVtfvx9BYqiBk5Qm59O8QRlpkSeGk4xqBwO9WKZY
         FqxA==
X-Gm-Message-State: AO0yUKU+CQ3d2sL7/vfksP7zveXY9niadQfCM5TS56EEGrhJD6XOyZZm
	2wBdVG/sHnfKiWpwBE1JqbHDcg==
X-Google-Smtp-Source: AK7set/XWBlSDNx1QqqPCvOgqVAO9WbEwk35n2HBNw/b7sAI8FlXBXXzeIx3j/6wKfKmXfu+o1L83g==
X-Received: by 2002:a5d:6512:0:b0:2c5:5687:5ed5 with SMTP id x18-20020a5d6512000000b002c556875ed5mr10999764wru.18.1678296703973;
        Wed, 08 Mar 2023 09:31:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1eb8:fdef:c144:ef0b? ([2001:8b0:aba:5f3c:1eb8:fdef:c144:ef0b])
        by smtp.gmail.com with ESMTPSA id o14-20020a5d408e000000b002bfd524255esm15712255wrp.43.2023.03.08.09.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 09:31:43 -0800 (PST)
Message-ID: <14246ffa7ccd8f1ee6b71f5002898b0b58b6bd06.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 1/2] qemu: split out qemu-guest-agent, add
 startup scripts
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Brenda Streiff <brenda.streiff@ni.com>
Date: Wed, 08 Mar 2023 17:31:42 +0000
In-Reply-To: <20230308171437.35160-1-peron.clem@gmail.com>
References: <20230308171437.35160-1-peron.clem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 17:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178187

On Wed, 2023-03-08 at 18:14 +0100, Cl=C3=A9ment P=C3=A9ron wrote:
> Split out the QEMU guest agent into a separate package. The agent is
> intended to be installed within a QEMU VM guest where a user is likely
> to not want to have the rest of the QEMU installation within it.
>=20
> Additionally, an initscript, udev rules file, and systemd unit file are
> added to the package so that the guest agent can start automatically;
> the former two come from Debian's packaging for qemu-guest-agent.
>=20
> Signed-off-by: Brenda Streiff <brenda.streiff@ni.com>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>=20
> Changes since v3:
>  - fix missing comma in udev rule
>=20
> Changes since v2:
>  - Add missing files
>  - rebase on top of master
>=20
> Changes since v1:
>  - Fix systemd-service using PN where it should not
>=20
>  meta/recipes-devtools/qemu/qemu.inc           | 35 +++++++-
>  .../qemu/qemu/qemu-guest-agent.init           | 84 +++++++++++++++++++
>  .../qemu/qemu/qemu-guest-agent.udev           |  2 +
>  3 files changed, 120 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init
>  create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-guest-agent.udev
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index 1e768b560d..b41055fe5d 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -9,7 +9,7 @@ LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
>  RDEPENDS:${PN}-ptest =3D "bash"
> =20
>  require qemu-targets.inc
> -inherit pkgconfig ptest
> +inherit pkgconfig ptest update-rc.d systemd
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86e15a37fa47e15a72f=
bac \
>                      file://COPYING.LIB;endline=3D24;md5=3D8c5efda6cf1e1b=
03dcfd0e6c0d271c7f"
> @@ -32,6 +32,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
>             file://0001-configure-Fix-check-tcg-not-executing-any-tests.p=
atch \
>             file://0001-Revert-linux-user-add-more-compat-ioctl-definitio=
ns.patch \
>             file://0002-Revert-linux-user-fix-compat-with-glibc-2.36-sys-=
mou.patch \
> +           file://qemu-guest-agent.init \
> +           file://qemu-guest-agent.udev \
>             "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
> =20
> @@ -132,6 +134,20 @@ do_configure[cleandirs] +=3D "${B}"
>  do_install () {
>  	export STRIP=3D""
>  	oe_runmake 'DESTDIR=3D${D}' install
> +
> +	# If we built the guest agent, also install startup/udev rules
> +	if [ -e "${D}${bindir}/qemu-ga" ]; then
> +		install -d ${D}${sysconfdir}/init.d/
> +		install -m 0755 ${WORKDIR}/qemu-guest-agent.init ${D}${sysconfdir}/ini=
t.d/qemu-guest-agent
> +		sed -i 's:@bindir@:${bindir}:' ${D}${sysconfdir}/init.d/qemu-guest-age=
nt
> +
> +		install -d ${D}${sysconfdir}/udev/rules.d/
> +		install -m 0644 ${WORKDIR}/qemu-guest-agent.udev ${D}${sysconfdir}/ude=
v/rules.d/60-qemu-guest-agent.rules
> +
> +		install -d ${D}${systemd_unitdir}/system/
> +		install -m 0644 ${S}/contrib/systemd/qemu-guest-agent.service ${D}${sy=
stemd_unitdir}/system
> +		sed -i -e 's,-/usr/bin/,-${bindir}/,g' ${D}${systemd_unitdir}/system/q=
emu-guest-agent.service
> +	fi
>  }
> =20
>  # The following fragment will create a wrapper for qemu-mips user emulat=
ion
> @@ -210,3 +226,20 @@ PACKAGECONFIG[jack] =3D "--enable-jack,--disable-jac=
k,jack,"
>  INSANE_SKIP:${PN} =3D "arch"
> =20
>  FILES:${PN} +=3D "${datadir}/icons"
> +
> +# Put the guest agent in a separate package
> +PACKAGES =3D+ "${PN}-guest-agent"
> +SUMMARY:${PN}-guest-agent =3D "QEMU guest agent"
> +FILES:${PN}-guest-agent +=3D " \
> +    ${bindir}/qemu-ga \
> +    ${sysconfdir}/udev/rules.d/60-qemu-guest-agent.rules \
> +    ${sysconfdir}/init.d/qemu-guest-agent \
> +    ${systemd_unitdir}/system/qemu-guest-agent.service \
> +"
> +
> +INITSCRIPT_PACKAGES =3D "${PN}-guest-agent"
> +INITSCRIPT_NAME:${PN}-guest-agent =3D "qemu-guest-agent"
> +INITSCRIPT_PARAMS:${PN}-guest-agent =3D "defaults"
> +
> +SYSTEMD_PACKAGES =3D "${PN}-guest-agent"
> +SYSTEMD_SERVICE:${PN}-guest-agent =3D "qemu-guest-agent.service"
> diff --git a/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init b/meta=
/recipes-devtools/qemu/qemu/qemu-guest-agent.init
> new file mode 100644
> index 0000000000..493da0ef1a
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/qemu-guest-agent.init
> @@ -0,0 +1,84 @@
> +#!/bin/sh
> +### BEGIN INIT INFO
> +# Provides:		qemu-guest-agent
> +# Required-Start:	$remote_fs $syslog
> +# Required-Stop:	$remote_fs $syslog
> +# Default-Start:	2 3 4 5
> +# Default-Stop:		0 1 6
> +# Short-Description:	QEMU Guest Agent
> +### END INIT INFO
> +#
> +# Do not configure this file. Edit /etc/default/qemu-guest-agent
> +#

Do we install a /etc/default/qemu-guest-agent? The whole comment block
above can probably be dropped including the INIT INFO as it isn't
applicable for us?

Do we need to mention which license this script is under and where it
came from (seemingly Debian)?

Cheers,

Richard

