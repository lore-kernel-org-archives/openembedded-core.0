Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB074C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 14:05:32 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web12.6468.1659449122827513734
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 07:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20,
 mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout08.t-online.de (Postfix) with SMTP id C4982ED14;
	Tue,  2 Aug 2022 16:05:20 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.47.193]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oIsWO-0eLmxU0; Tue, 2 Aug 2022 16:05:20 +0200
Date: Tue, 02 Aug 2022 16:05:14 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [meta-oe][PATCH] wic/direct.py: ignore root mountpoint
 in fstab updater
To: Ross Burton <Ross.Burton@arm.com>
Cc: tobiasschmidl@siemens.com, openembedded-core@lists.openembedded.org
Message-Id: <Q4RZFR.Q72GTSVZXCK3@t-online.de>
In-Reply-To: <536911C2-925C-47AF-A369-9453B5900916@arm.com>
References: <20220727134512.4033-1-f_l_k@t-online.de>
	<A08B6BB6-EFD1-425D-AC02-457EF8A40229@arm.com>
	<1705BCB17DD12169.1380@lists.openembedded.org>
	<3FVOFR.R0ZY9H7K1WKY1@t-online.de>
	<536911C2-925C-47AF-A369-9453B5900916@arm.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-KpF68peoQscJmn5On+6z"
X-TOI-EXPURGATEID: 150726::1659449120-01447895-CB3DE485/0/0 CLEAN NORMAL
X-TOI-MSGID: d72e29dc-83a6-4c7a-b028-65d47d85b9fc
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 14:05:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168786

--=-KpF68peoQscJmn5On+6z
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

Maybe we could do like this in base-files.bb ?

FSTAB_HAVE_WIC =3D "${@bb.utils.contains('IMAGE_FSTYPES', 'wic', 'true',=20
'false', d)}"
FSTAB_WIC_UPDATER =3D "${@bb.utils.contains('WIC_CREATE_EXTRA_ARGS',=20
'--no-fstab-update', 'false', 'true', d)}"

do_install:append() {
	if [ ${FSTAB_HAVE_WIC} =3D true ] && [ ${FSTAB_WIC_UPDATER} =3D true ];=20
then
		sed -i '/\/dev\/root/d' ${D}${sysconfdir}/fstab
	fi
}

This would remove the hardcoded '/dev/root' entry  if all conditions=20
are met to add the root entry with wic fstab-update
>=20=0DIt=FFs looking like the easiest fix here is to revert your patch, so=
=20
> at least we don=FFt have warnings and unexpected behaviour on boot. =20
> Unless you=FFre willing to rework your patch so that it allows edits=20
> to the root mount point but doesn=FFt end up creating duplicates?


--=-KpF68peoQscJmn5On+6z
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Maybe we could do like this in bas=
e-files.bb ?</div><div><br></div><div><div>FSTAB_HAVE_WIC =3D "${@bb.utils.=
contains('IMAGE_FSTYPES', 'wic', 'true', 'false', d)}"</div><div>FSTAB_WIC_=
UPDATER =3D "${@bb.utils.contains('WIC_CREATE_EXTRA_ARGS', '--no-fstab-upda=
te', 'false', 'true', d)}"</div><div><br></div><div>do_install:append() {</=
div><div><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>i=
f [ ${FSTAB_HAVE_WIC} =3D true ] &amp;&amp; [ ${FSTAB_WIC_UPDATER} =3D true=
 ]; then</div><div><span class=3D"Apple-tab-span" style=3D"white-space:pre"=
>		</span>sed -i '/\/dev\/root/d' ${D}${sysconfdir}/fstab</div><div><span c=
lass=3D"Apple-tab-span" style=3D"white-space:pre">	</span>fi</div><div>}</d=
iv></div><div><br></div><div>This would remove the hardcoded '/dev/root' en=
try &nbsp;if all conditions are met to add the root entry with wic fstab-up=
date</div></div><div id=3D"geary-quote" dir=3D"auto"><blockquote type=3D"ci=
te"><div class=3D"plaintext" style=3D"white-space: break-spaces;">=0DIt=FFs=
 looking like the easiest fix here is to revert your patch, so at least we =
don=FFt have warnings and unexpected behaviour on boot.  Unless you=FFre wi=
lling to rework your patch so that it allows edits to the root mount point =
but doesn=FFt end up creating duplicates?
</div></blockquote></div>
--=-KpF68peoQscJmn5On+6z--


