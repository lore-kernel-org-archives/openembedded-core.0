Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fcooper@ti.com>) id 1U3Yxj-0006ui-9N
	for Openembedded-core@lists.openembedded.org;
	Thu, 07 Feb 2013 22:25:11 +0100
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r17I0CuL024350;
	Thu, 7 Feb 2013 12:00:12 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r17I0CYH028126;
	Thu, 7 Feb 2013 12:00:12 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Thu, 7 Feb 2013 12:00:12 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] Multiple MACHINE building is broken in OE-core?
Thread-Index: AQHOBEfqvKKp5POftkqsNENZBmpCEZhuro/g
Date: Thu, 7 Feb 2013 18:00:12 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C38936B@DFLE09.ent.ti.com>
References: <8F29D6B095ED194EA1980491A5E029710C38764C@DFLE09.ent.ti.com>
	<20130206085644.GR3271@jama>
In-Reply-To: <20130206085644.GR3271@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: Multiple MACHINE building is broken in OE-core?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2013 21:26:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I found what the problem was. Some machine config file defined TARGET_ARCH =
=3D "arm" and others did not. By default bitbake conf file sets TARGET_ARCH=
 =3D ${TUNE_ARCH}. Although when evaluated TUNE_ARCH is set to "arm".

Using that diffsig tool bitbake gave different checksums because a change i=
n task dependencies since some machines TARGET_ARCH depended on TUNE_ARCH w=
hile others didn't.

Thanks for your help Martin.


> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]
> Sent: Wednesday, February 06, 2013 2:57 AM
> To: Cooper Jr., Franklin
> Cc: ross.burton@intel.com; Openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] Multiple MACHINE building is broken in OE-core?
>=20
> On Wed, Feb 06, 2013 at 08:02:31AM +0000, Cooper Jr., Franklin wrote:
> > Hi Everyone,
> >
> > While performing denzil to danny work I ran into this same issue that M=
ike
> mentioned. I have 4 machines that are armv7a based and previously in denz=
il
> only very specific recipes that I deliberately made machine specific were=
 being
> rebuilt. Now a significant amount of recipes are being unnecessarily rebu=
ilt. I
> first noticed this when building Qt but this also occurs with something e=
ven
> simpler such as tslib. If I look at tslib's temp directory I end up seein=
g multiple
> logs for the majority of the tasks. For example I will see 4 log.do_compi=
le logs.
> >
> > I ran the sstate-diff-machines.sh script that Martin mentioned for mach=
ines
> defined in meta-ti and I got the below output when using tslib as the -ta=
rgets:
> >
> > list.M am3517-evm
> >
> > http://pastebin.com/zMH8PkmP
> >
> > list.M am335x-evm
> > http://pastebin.com/6jbP6guA
> >
> > The checksums differs for non-native recipes such as gettext, tslib and=
 zlib.
> >
> > If it matters I am using the 1.17.0 branch of bitbake since the master =
branch
> throws parsing errors.
> >
> > Any suggestions on what could be the issue?
>=20
> Please pick something like tslib or gettext. Find first different checksu=
m
> (do_configure is usually good for that).
>=20
> # Then to compare sigdata use something like:
> # $ ls sstate-diff/134934*/*/*/tslib/*do_configure*sigdata*
> # it should return 2 different sigdata with 2 different sstate # checksum=
s,
> otherwise change ls expression
>=20
> # $ bitbake-diffsigs sstate-diff/134934*/*/*/tslib/*do_configure*sigdata*
>=20
> It will probably show some other recipe causing the difference, so just r=
epeat
> ls, bitbake-diffsigs until you find the root cause.
>=20
> Cheers,
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


