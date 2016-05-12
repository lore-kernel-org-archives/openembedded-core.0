Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id AC8F670034
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 08:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A83AC1812A;
	Thu, 12 May 2016 10:18:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id K0pwW73fDvre; Thu, 12 May 2016 10:18:48 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id D5C101813A;
	Thu, 12 May 2016 10:18:47 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 93A43175B;
	Thu, 12 May 2016 10:18:47 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 88E8416E2;
	Thu, 12 May 2016 10:18:47 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 86F6110E2;
	Thu, 12 May 2016 10:18:47 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1156.6;
	Thu, 12 May 2016 10:18:47 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%22]) with mapi id
	15.00.1156.000; Thu, 12 May 2016 10:18:47 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 00/16] Simplify how to stage directories in the
	sysroot
Thread-Index: AQHRq88sJjfKtOiCsk6cDjYkNgY4PJ+080eg
Date: Thu, 12 May 2016 08:18:47 +0000
Message-ID: <225f61b6fefa4aebbc7d99d66cfa4fac@XBOX02.axis.com>
References: <cover.1462987580.git.pkj@axis.com>
	<1463002482.21831.291.camel@linuxfoundation.org>
In-Reply-To: <1463002482.21831.291.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.55]
MIME-Version: 1.0
Subject: Re: [PATCH 00/16] Simplify how to stage directories in the sysroot
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
X-List-Received-Date: Thu, 12 May 2016 08:18:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Ri=
chard Purdie
> Sent: den 11 maj 2016 23:35
> To: Peter Kjellerstedt; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 00/16] Simplify how to stage directories in=
 the sysroot
>=20
> On Wed, 2016-05-11 at 19:27 +0200, Peter Kjellerstedt wrote:
> > The first commit in this set makes it possible to specify the
> > directories that will be staged in the sysroot via variables rather
> > than hardcoding it in sysroot_stage_dirs(). This should make it a lot
> > easier to add/remove directories to stage.
> >
> > The rest of the commits just change recipes to take advantage of the
> > new variables.
> >
> > Because of the following if statement in sysroot_stage_dirs():
> >
> > 	if [ "${BUILD_SYS}" =3D "${HOST_SYS}" ]; then
> >
> > I have split the list of directories into SYSROOT_DIRS and
> > SYSROOT_DIRS_NATIVE, where the latter is included if that if statement
> > is true. I am not sure when that statement is true (my understanding
> > is that it should be true for native builds, but I am not sure if it
> > is also true for other builds like cross, nativesdk, etc). If it is
> > only true for native builds then that if statement could be removed,
> > and the SYSROOT_DIRS_NATIVE variable could be replaced by
> > SYSROOT_DIRS_append_class-native...
>=20
> It matches binaries that can run on the build system so it needs to
> match native and cross. Something like:
>=20
> SYSROOT_DIRS_append_class-native =3D "${SYSROOT_DIRS_NATIVE}"
> SYSROOT_DIRS_append_class-cross =3D "${SYSROOT_DIRS_NATIVE}"

Apparently it is true for crossssdk as well (I ran recipes from each of=20
the five classes through bitbake -e to verify). I will send an updated=20
patch that uses the _append solution instead.

> I hadn't realised how much duplication there was in that class. Cleanup
> I'd never gotten around to doing. I guess most people don't even
> remember how we ended up with that code or the horrors of do_stage
> functions :)

I looked at some of the horrors in the git log while investigating how=20
it works. I am glad you got rid of them. ;)

> Cheers,
>=20
> Richard

//Peter


