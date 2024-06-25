Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47F7C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 18:29:44 +0000 (UTC)
Subject: Re: [PATCH] gobject-introspection: split tools and giscanner into a separate package
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudnimar@noxmedical.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 25 Jun 2024 11:29:36 -0700
References: <20240625132432c4f9913e@mail.local>
In-Reply-To: <20240625132432c4f9913e@mail.local>
Message-ID: <22089.1719340176086311033@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ZoIRhnBSfR2ZyW4GFag0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 18:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201140

--ZoIRhnBSfR2ZyW4GFag0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre, I have managed to reproduce the issue on the master branch an=
d found a solution. It was a simple mistake on my part. glib-2.0 needs to b=
e added to RDEPENDS:${PN}-tools

I erroniously assumed that given:
RDEPENDS:${PN} =3D "python3-pickle python3-xml glib-2.0"
RDEPENDS:${PN}-tools =3D "${PN} python3-setuptools"

Would result in

RDEPENDS:gobject-introspection-tools =3D "python3-pickle python3-xml glib-2=
.0 python3-setuptools"

But nope, it's RDEPENDS:gobject-introspection-tools =3D "gobject-introspect=
ion python3-setuptools" which is obvious now that I realised it :)

I will add a fix for this in my v2 patch.

--ZoIRhnBSfR2ZyW4GFag0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre, I have managed to reproduce the issue on the master branch an=
d found a solution. It was a simple mistake on my part. glib-2.0 needs to b=
e added to RDEPENDS:${PN}-tools<br /><br />I erroniously assumed that given=
:<br />RDEPENDS:${PN} =3D "python3-pickle python3-xml glib-2.0"<br />RDEPEN=
DS:${PN}-tools =3D "${PN} python3-setuptools"<br /><br />Would result in<br=
 /><br />RDEPENDS:gobject-introspection-tools =3D "python3-pickle python3-x=
ml glib-2.0 python3-setuptools"&nbsp;<br /><br />But nope, it's RDEPENDS:go=
bject-introspection-tools =3D "gobject-introspection python3-setuptools" wh=
ich is obvious now that I realised it :)&nbsp;<br /><br />I will add a fix =
for this in my v2 patch.

--ZoIRhnBSfR2ZyW4GFag0--

