Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 364A67859E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Dec 2017 04:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 622661883E;
	Sat,  2 Dec 2017 05:31:41 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id PrP9dl1LdI0T; Sat,  2 Dec 2017 05:31:39 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 5EF6D18827;
	Sat,  2 Dec 2017 05:31:39 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CF4F1E081;
	Sat,  2 Dec 2017 05:31:39 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4149C1E080;
	Sat,  2 Dec 2017 05:31:39 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Sat,  2 Dec 2017 05:31:39 +0100 (CET)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id 34DA22434;
	Sat,  2 Dec 2017 05:31:39 +0100 (CET)
Received: from xbox11.axis.com (10.0.5.25) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Sat, 2 Dec 2017 05:31:39 +0100
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Sat, 2 Dec 2017 05:31:38 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Sat, 2 Dec 2017 05:31:38 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Slater, Joseph" <joe.slater@windriver.com>, Andre McCurdy
	<armccurdy@gmail.com>
Thread-Topic: [OE-core] backfill mechanism
Thread-Index: AdNf+226ORa9l6NuR/SCoUcn6/NVXgCdG+0AACEMu4ACAP5h8A==
Date: Sat, 2 Dec 2017 04:31:38 +0000
Message-ID: <42a722fffcbc4a0687983cda67842af4@XBOX02.axis.com>
References: <007BD92917A2324FA403BCF9A464CF84CF45536D@ALA-MBC.corp.ad.wrs.com>,
	<CAJ86T=Ub5KJK6nEUCDithboripFosi2w_f5JifOwEaq7LH4keg@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84CF4569D8@ALA-MBC.corp.ad.wrs.com>
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84CF4569D8@ALA-MBC.corp.ad.wrs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: backfill mechanism
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
X-List-Received-Date: Sat, 02 Dec 2017 04:31:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Be careful with the _remove operator in common configuration files.=20
Once it has been used there is absolutely no way of getting the=20
removed value back in, for testing or for real.=20

E.g., if you were to change the:

DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"

in poky-tiny.conf to:=20

DISTRO_FEATURES_remove =3D "sysvinit"

then it would be impossible to use the poky-tiny distro in a=20
configuration where you also would like to enable sysvinit.

Also, after having looked at the Git history for when the backfill=20
feature was implemented, I do not think DISTRO_FEATURES_remove will=20
work, for the same reason DISTRO_FEATURES_append is not used to add=20
the backfilled values (the first implementation actually did use=20
_append). The reason it was changed is because the _append (and=20
_remove) are evaluated too late. I.e., code like this that use a=20
conditional based on DISTRO_FEATURES to do inherit would not=20
work as intended for a backfilled value:

inherit ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', 'systemd', =
d)}

A better solution for how to replace the backfill considered=20
mechanism would be to use individual variables for the backfilled=20
values. E.g., the current definition in bitbake.conf:

MACHINE_FEATURES_BACKFILL =3D "rtc qemu-usermode"=20

could be replaced with something like:

MACHINE_FEATURES_BACKFILL =3D " \
    ${MACHINE_FEATURES_BACKFILL_qemu-usermode} \
    ${MACHINE_FEATURES_BACKFILL_rtc} \
"
MACHINE_FEATURES_BACKFILL_qemu-usermode =3D "qemu-usermode"
MACHINE_FEATURES_BACKFILL_rtc =3D "rtc"

Then to do the equivalent of:

MACHINE_FEATURES_BACKFILL_CONSIDERED +=3D "rtc"

one would instead do:

MACHINE_FEATURES_BACKFILL_rtc =3D ""

Alternatively one could use variable flags:

MACHINE_FEATURES_BACKFILL[qemu-usermode] =3D "1"
MACHINE_FEATURES_BACKFILL[rtc] =3D "1"

and then simply set it to 0 if one does not want a feature:

MACHINE_FEATURES_BACKFILL[rtc] =3D "0"

That would of course take a little bit of Python code to=20
convert the variable flags into actual features:

MACHINE_FEATURES_BACKFILL =3D "${@' '.join(sorted(key for key in d.getVarFl=
ags('MACHINE_FEATURES_BACKFILL').keys() if d.getVarFlag('MACHINE_FEATURES_B=
ACKFILL', key) =3D=3D '1'))}"

(By explicitly testing for "1" we also avoid converting=20
MACHINE_FEATURES_BACKFILL[doc] into a feature.)

I also have a hunch that something like this would be needed:

MACHINE_FEATURES_BACKFILL[vardepvalue] =3D "${MACHINE_FEATURES_BACKFILL}"

which probably leads to recursion unless the key "vardepvalue" is=20
explicitly avoided in the if test above. Meh...

//Peter

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Slater, Joseph
> Sent: den 21 november 2017 20:11
> To: Andre McCurdy <armccurdy@gmail.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] backfill mechanism
>=20
> The problem is that when backfilling is done, TUNE_FEATURES, etc, all
> have values associated with the base arch, not the current multilib.
> The "generic" solution, below, should work, although I would still use
> overrides when available.
>=20
> Beyond what actually works, if the special backfill processing can be
> eliminated and regular constructs used I think that would be desirable.
>=20
> Joe
> ________________________________________
> From: Andre McCurdy [armccurdy@gmail.com]
> Sent: Monday, November 20, 2017 7:24 PM
> To: Slater, Joseph
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] backfill mechanism
>=20
> On Fri, Nov 17, 2017 at 3:32 PM, Slater, Joseph
> <joe.slater@windriver.com> wrote:
> > The backfill mechanism is not compatible with multilib.
>=20
> Did anyone ever explain why?
>=20
> > This could possibly
> > be fixed, but the backfill_considered functionality is also obscure,
> so I
> > think in at least the machine related .inc files we should replace
> lines
> > like
> >
> > MACHINE_FEATURES_BACKFILL_CONSIDERED_append =3D "
> > ${@bb.utils.contains('TUNE_FEATURES', 'n32', 'qemu-usermode', '',
> d)}"
> >
> > with lines like
> >
> > MACHINE_FEATURES_remove_mipsarchn32 =3D " qemu-usermode"
>=20
> That only works for TUNE_FEATURES which happen to have a corresponding
> over-ride, so may not be a generic solution. Does something like:
>=20
>   MACHINE_FEATURES_remove =3D "${@bb.utils.contains('TUNE_FEATURES',
> 'n32', 'qemu-usermode', '', d)}"
>=20
> work for multilib?
>=20
> > There are two advantages:  the second line works for multilib, and it
> is far
> > more readable.
> >
> > Joe
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

