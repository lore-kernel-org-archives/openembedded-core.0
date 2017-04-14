Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 2C04777D6B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 02:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 631272E64E;
	Fri, 14 Apr 2017 04:39:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id trB4a+q4RjkQ; Fri, 14 Apr 2017 04:39:38 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 4CA552E64C;
	Fri, 14 Apr 2017 04:39:38 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B3CE1A064;
	Fri, 14 Apr 2017 04:39:38 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1DCDC1A061;
	Fri, 14 Apr 2017 04:39:38 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri, 14 Apr 2017 04:39:38 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 0FC7B329B;
	Fri, 14 Apr 2017 04:39:38 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 14 Apr 2017 04:39:37 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Fri, 14 Apr 2017 04:39:37 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] base-passwd/useradd: Various improvements to
	useradd with RSS
Thread-Index: AQHSs7tnSXRSGl6QR0m6EXfMPInqEqHEIgFQ
Date: Fri, 14 Apr 2017 02:39:37 +0000
Message-ID: <94259cfb17bc467485c33003af4a4925@XBOX02.axis.com>
References: <1492022024-30940-1-git-send-email-richard.purdie@linuxfoundation.org>
In-Reply-To: <1492022024-30940-1-git-send-email-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-passwd/useradd: Various improvements to	useradd with RSS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Apr 2017 02:39:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: den 12 april 2017 20:34
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] base-passwd/useradd: Various improvements to
> useradd with RSS
>=20
> Currently there are multiple issues with useradd:
>=20
> * If base-passwd rebuilds, it wipes out recipe specific user/group additi=
ons
>   to sysroots and causes errors
> * If recipe A adds a user and recipe B depends on A, it can't see any of =
the
>   users/groups A adds.
>=20
> This patch changes base-passwd so it always works as a postinst script
> within the sysroot and copies in the master files, then runs any
> postinst-useradd-* scripts afterwards to add additional user/groups.
>=20
> The postinst-useradd-* scripts are tweaked so that if /etc/passwd doesn't=
 exist
> they just exit, knowning they'll be executed later.
>=20
> There is a problem where if recipe A adds a user an recipe B depends on A=
 but
> doesn't care about users, it may not have a dependency on the useradd/gro=
upadd
> tools which would therefore not be available in B's sysroot. We therefore=
 also
> tweak postinst-useradd-* scripts so that if the tools aren't present we s=
imply
> don't add users. If you need the users, you add a dependency on the tools=
 in the
> recipe and they'll be added.
>=20
> We add postinst-* to SSTATE_SCAN_FILES since almost any postinst script o=
f this
> kind is going to need relocation help.
>=20
> We also ensure that the postinst-useradd script is written into the sstat=
e
> object as the current script was only being added in a recipe local way.
>=20
> Thanks to Peter Kjellerstedt <pkj@axis.com> for some pieces of this
> patch.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

I have tested this now, and it seems to be doing what is expected.=20

However, during my testing I stumbled upon a bug in pseudo which caused=20
bash to segmentation fault. It was triggered by how the postinst-useradd=20
scripts are called from the postinst-base-passwd script. Seebs and I=20
debugged this and eventually found a solution which is now available as=20
commit b6b68db896 in git://git.yoctoproject.org/pseudo. This must be=20
fixed in OE-Core, either as a backport patch or by using an updated=20
version of pseudo.=20

I also made some improvements to the debuggability of the postinst=20
scripts. I will send that as a separate patch set.

//Peter


