Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DDFC83F3E
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 10:57:32 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.18479.1693911449150472897
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 03:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=1lofWbt0;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=nCYjhxuJP3sDCyUhaVVLnZy9mGVnKeEuv3Ox5oOs7QM=; b=1lofWbt0M7ZAbMRctg1V1w9k1V
	3HlFiw3y1WdVmiUI9N3F1Uy/sxVDOJFq6ognFG+q/z+Z58NPDxVY9H+ddbAhKO0ZdJHyPsUIvp/M1
	ZJHfF4OGCdTLufVcN8RCpEIdS4Ip8lhzeoyYd8N6gx1dQtfjG30y0WjqXemyIi85O9obwVI+8bJ76
	46fn13anHfp5nvlr7T2g/jSfzASVj97BpZrWqzGS2zxqHLLU+FQzgU28eI2FLBqWMGpMmwT3pJyyL
	xcI2BWaWcHb/WCQuB/QZV8bRDUvFIWI4duALBnG30UFGj0iYULWlA6/8IWFKcxrS6BxTMk+OlrP7u
	Ce95CvkQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1qdTkN-000Dz2-FE; Tue, 05 Sep 2023 12:57:27 +0200
Received: from [85.184.138.13] (helo=[192.168.8.20])
	by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <martin@geanix.com>)
	id 1qdTkN-000MF7-0u; Tue, 05 Sep 2023 12:57:27 +0200
Message-ID: <43728c5e972e97ef0a793eb7a0e022439d282c70.camel@geanix.com>
Subject: Re: [OE-core] [RFC PATCH 3/5] ninja: build modified version with
 GNU Make jobserver support
From: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 05 Sep 2023 12:57:26 +0200
In-Reply-To: <177F9C5870C611AE.22520@lists.openembedded.org>
References: <20230828124834.376779-1-martin@geanix.com>
	 <20230828124834.376779-3-martin@geanix.com>
	 <CAMKF1soPeynqxqQs6tsxdvbOXriZOGByDJijU76a3eodcqE91g@mail.gmail.com>
	 <177F9C5870C611AE.22520@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/27022/Tue Sep  5 09:59:33 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 10:57:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187205

On Mon, 2023-08-28 at 19:31 +0200, Martin Hundeb?ll wrote:
> =C2=A0
> =C2=A0Aug 28, 2023 19:16:28 Khem Raj <raj.khem@gmail.com>:=20
> =C2=A0
> =C2=A0> On Mon, Aug 28, 2023 at 5:48=E2=80=AFAM Martin Hundeb?ll
> <martin@geanix.com> wrote:=20
> =C2=A0>>=20
> =C2=A0>> Ninja doesn't (yet) support the GNU Make jobserver out of the
> box, but=20
> =C2=A0>> there is a pull request adding that support[1]. Switch the
> SRC_URI and=20
> =C2=A0>> SRCREV to point at the source of that pull request, to make ninj=
a
> play=20
> =C2=A0>> nicely together with the recently added jobserver class.=20
> =C2=A0>>=20
> =C2=A0>> Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>=20
> =C2=A0>> ---=20
> =C2=A0>> .../ninja/{ninja_1.11.1.bb =3D> ninja_1.12.0.bb}=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 4
> ++--=20
> =C2=A0>> 1 file changed, 2 insertions(+), 2 deletions(-)=20
> =C2=A0>> rename meta/recipes-devtools/ninja/{ninja_1.11.1.bb =3D>
> ninja_1.12.0.bb} (84%)=20
> =C2=A0>>=20
> =C2=A0>> diff --git a/meta/recipes-devtools/ninja/ninja_1.11.1.bb
> b/meta/recipes-devtools/ninja/ninja_1.12.0.bb=20
> =C2=A0>> similarity index 84%=20
> =C2=A0>> rename from meta/recipes-devtools/ninja/ninja_1.11.1.bb=20
> =C2=A0>> rename to meta/recipes-devtools/ninja/ninja_1.12.0.bb=20
> =C2=A0>> index 8e297ec4d4..9abdd40a92 100644=20
> =C2=A0>> --- a/meta/recipes-devtools/ninja/ninja_1.11.1.bb=20
> =C2=A0>> +++ b/meta/recipes-devtools/ninja/ninja_1.12.0.bb=20
> =C2=A0>> @@ -6,9 +6,9 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Da81586a64ad4e476c791cda7e2f2c52e"=20
> =C2=A0>>=20
> =C2=A0>> DEPENDS =3D "re2c-native ninja-native"=20
> =C2=A0>>=20
> =C2=A0>> -SRCREV =3D "a524bf3f6bacd1b4ad85d719eed2737d8562f27a"=20
> =C2=A0>> +SRCREV =3D "c9e21dbbc4c746ba397c0f9bec5f65c99f783c08"=20
> =C2=A0>>=20
> =C2=A0>> -SRC_URI =3D "git://github.com/ninja-
> build/ninja.git;branch=3Drelease;protocol=3Dhttps"=20
> =C2=A0>> +SRC_URI =3D "git://github.com/stefanb2/ninja.git;branch=3Dtopic=
-
> issue-1139-part-3-jobserver-fifo;protocol=3Dhttps"=20
> =C2=A0>=20
> =C2=A0> This is a little concerning, as we are pointing to a fork here an=
d
> =C2=A0> quite a lot depend on ninja now=20
> =C2=A0> a days. so I wonder whats the status of the patches and likelyhoo=
d
> of=20
> =C2=A0> them going upstream=20
> =C2=A0> in anycase, we should pick the patches instead of switching
> SRC_URI=20
> =C2=A0
> =C2=A0Yes, I agree that we shouldn't change uri to a fork; hence the
> RFC... Maybe I should try to put some pressure on ninja upstream to
> consider the pull request...=20

One option could be to use the kitware fork of ninja, which supports
the fifo makeserver:
https://github.com/Kitware/ninja

This is what buildroot does:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/ninja/ninj=
a.mk

// Martin

> =C2=A0>> UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.*)"=20
> =C2=A0>>=20
> =C2=A0>> S =3D "${WORKDIR}/git"=20
> =C2=A0>> --=20
> =C2=A0>> 2.41.0=20
> =C2=A0>>=20
> =C2=A0>>=20
> =C2=A0>> =20
> =C2=A0>>=20
> =C2=A0
> =C2=A0
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186841):
> https://lists.openembedded.org/g/openembedded-core/message/186841
> Mute This Topic: https://lists.openembedded.org/mt/101009093/3618414
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> martin@geanix.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


