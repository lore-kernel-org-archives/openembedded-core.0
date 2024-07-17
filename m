Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3261C3DA62
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 17:16:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3882.1721236610175619509
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 10:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 89C6840C67;
	Wed, 17 Jul 2024 17:16:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nTlC1rFNhI-7; Wed, 17 Jul 2024 17:16:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 720D840A03;
	Wed, 17 Jul 2024 17:16:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BFC70163FF6; Wed, 17 Jul 2024 13:16:47 -0400 (EDT)
Date: Wed, 17 Jul 2024 13:16:47 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] nativesdk-libtool: sanitize the script,
 remove buildpaths
Message-ID: <20240717171647.GF17572@denix.org>
References: <20240716220940.3828246-1-denis@denix.org>
 <7f395fd1db119b4d0b6777bdb17aa4572b45bb97.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <7f395fd1db119b4d0b6777bdb17aa4572b45bb97.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 17:16:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202171

On Wed, Jul 17, 2024 at 07:29:45AM +0100, Richard Purdie wrote:
> On Tue, 2024-07-16 at 18:09 -0400, Denys Dmytriyenko via lists.openembe=
dded.org wrote:
> > From: Denys Dmytriyenko <denys@konsulko.com>
> >=20
> > Copy the same sed command to sanitize libtool script from target reci=
pe
> > to nativesdk one. Otherwise fails with buildpaths QA error:
> >=20
> > ERROR: nativesdk-libtool-2.5.0-r0 do_package_qa: QA Issue: File /usr/=
local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/li=
btool in package nativesdk-libtool contains reference to TMPDIR [buildpat=
hs]
> >=20
> > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > ---
> > =A0.../libtool/nativesdk-libtool_2.5.0.bb=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 | 12 ++++++++++++
> > =A01 file changed, 12 insertions(+)
> >=20
> > diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb=
 b/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb
> > index ddb60e717c..69de7a8e40 100644
> > --- a/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb
> > +++ b/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb
> > @@ -13,6 +13,18 @@ do_install () {
> > =A0	autotools_do_install
> > =A0	install -d ${D}${bindir}/
> > =A0	install -m 0755 libtool ${D}${bindir}/
> > +
> > +	sed -e 's@--sysroot=3D${STAGING_DIR_HOST}@@g' \
> > +	=A0=A0=A0 -e "s@${DEBUG_PREFIX_MAP}@@g" \
> > +	=A0=A0=A0 -e 's@${STAGING_DIR_HOST}@@g' \
> > +	=A0=A0=A0 -e 's@${STAGING_DIR_NATIVE}@@g' \
> > +	=A0=A0=A0 -e 's@^\(sys_lib_search_path_spec=3D"\).*@\1${libdir} ${b=
ase_libdir}"@' \
> > +	=A0=A0=A0 -e 's@^\(compiler_lib_search_dirs=3D"\).*@\1${libdir} ${b=
ase_libdir}"@' \
> > +	=A0=A0=A0 -e 's@^\(compiler_lib_search_path=3D"\).*@\1${libdir} ${b=
ase_libdir}"@' \
> > +	=A0=A0=A0 -e 's@^\(predep_objects=3D"\).*@\1"@' \
> > +	=A0=A0=A0 -e 's@^\(postdep_objects=3D"\).*@\1"@' \
> > +	=A0=A0=A0 -e "s@${HOSTTOOLS_DIR}/@@g" \
> > +	=A0=A0=A0 -i ${D}${bindir}/libtool
> > =A0}
> > =A0
> > =A0SYSROOT_PREPROCESS_FUNCS +=3D "libtoolnativesdk_sysroot_preprocess=
"
> >=20
>=20
> Rather than duplicate code, particularly long commands like this, it
> should be moved to a function and called from both locations.

v2 submitted.

--=20
Denys

