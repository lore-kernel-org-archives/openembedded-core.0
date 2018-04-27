Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 10270605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2018 16:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 28B1C189B2;
	Fri, 27 Apr 2018 18:34:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id GoFocUoOPrWm; Fri, 27 Apr 2018 18:34:29 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id BCD00189AF;
	Fri, 27 Apr 2018 18:34:28 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E07E1E05C;
	Fri, 27 Apr 2018 18:34:28 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 526A81E054;
	Fri, 27 Apr 2018 18:34:28 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri, 27 Apr 2018 18:34:28 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 460EA20E0;
	Fri, 27 Apr 2018 18:34:28 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 27 Apr 2018 18:34:28 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Fri, 27 Apr 2018 18:34:27 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] base: improve do_unpack[cleandirs] logic
Thread-Index: AQHT3J1+sakUN3n/806+mI4ZDhJwd6QSvLcAgAIT/dA=
Date: Fri, 27 Apr 2018 16:34:27 +0000
Message-ID: <47f5c35c2f064ba6aa1010d79d48fa23@XBOX02.axis.com>
References: <20180425135818.23345-1-ross.burton@intel.com>
	<CAJTo0LZ234RVEsXyUooFAzoGx+WxyxipSMMfxGqVcev5xBYjuw@mail.gmail.com>
In-Reply-To: <CAJTo0LZ234RVEsXyUooFAzoGx+WxyxipSMMfxGqVcev5xBYjuw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base: improve do_unpack[cleandirs] logic
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
X-List-Received-Date: Fri, 27 Apr 2018 16:34:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Burton, Ross
> Sent: den 26 april 2018 12:46
> To: OE-core <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH] base: improve do_unpack[cleandirs] logic
>=20
> Retracting this, doesn't work on a clean build dir.
>=20
> Ross
>=20
> On 25 April 2018 at 14:58, Ross Burton <ross.burton@intel.com> wrote:
> > If a recipe sets S to ${WORKDIR}/ then the S !=3D WORKDIR test doesn't
> work as
> > expected.  Use os.path.samefile() instead of string comparisons to do
> the right
> > thing.
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/classes/base.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> > index bb1f4b75336..7ddf70414a1 100644
> > --- a/meta/classes/base.bbclass
> > +++ b/meta/classes/base.bbclass
> > @@ -152,7 +152,7 @@ python base_do_fetch() {
> >  addtask unpack after do_fetch
> >  do_unpack[dirs] =3D "${WORKDIR}"
> >
> > -do_unpack[cleandirs] =3D "${@d.getVar('S') if d.getVar('S') !=3D d.get=
Var('WORKDIR') else os.path.join('${S}', 'patches')}"

This should work even if the paths don't exist:

do_unpack[cleandirs] =3D "${@d.getVar('S') if os.path.realpath(d.getVar('S'=
)) !=3D os.path.realpath(d.getVar('WORKDIR')) else os.path.join('${S}', 'pa=
tches')}"

> > +do_unpack[cleandirs] =3D "${@os.path.join('${S}', 'patches') if os.pat=
h.samefile(d.getVar('S'), d.getVar('WORKDIR')) else d.getVar('S')}"
> >
> >  python base_do_unpack() {
> >      src_uri =3D (d.getVar('SRC_URI') or "").split()
> > --
> > 2.11.0

//Peter


