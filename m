Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 5CB627FC06
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 08:59:57 +0000 (UTC)
IronPort-SDR: gOFl1pGcvL9k74XQWuI1BT9q33AP8eU7oRjTPvIypCGfUzupTn8SlmrreKHDdupBeQ6yaEDoGt
	JB0G/KLnZXZlU9ACba44FUABQGUWBHhIwx26839GrPeDr+QiPHNl4aslafcguRmbJ+C+epZojW
	tUJ1bMEGJu7LJBXX/FcH8Qv0589VqmNrQm9K/7eDNzLjLsA+BoEhmfLBJO2assvVHeYePg/Nrg
	VDeBbFFsKnXK6iygYUAL+bF4tUhYp762ucfuFskFPYkTXAxd5UkbwJpG1KrnFd7YNadUcC6n61
	O8w=
X-IronPort-AV: E=Sophos;i="5.69,283,1571695200"; 
   d="scan'208";a="3305123"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [master][zeus][PATCH 1/2] libtirpc: Simplify the
	installation of symlinks for legacy headers
Thread-Index: AQHVq/GWhCw93dLQoEChTREjB6InRaesziMQ
Date: Fri, 6 Dec 2019 08:59:58 +0000
Message-ID: <26df55cb3ae746e6b99dc1597fec2bd7@XBOX03.axis.com>
References: <20191205220716.29178-1-pkj@axis.com>
	<bf7d7c11-f4ee-864f-7e94-b307700a9c78@gmail.com>
In-Reply-To: <bf7d7c11-f4ee-864f-7e94-b307700a9c78@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [master][zeus][PATCH 1/2] libtirpc: Simplify the installation of symlinks for legacy headers
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
X-List-Received-Date: Fri, 06 Dec 2019 08:59:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Khem Raj
> Sent: den 6 december 2019 05:56
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [master][zeus][PATCH 1/2] libtirpc: Simplify the
> installation of symlinks for legacy headers
>=20
> On 12/5/19 2:07 PM, Peter Kjellerstedt wrote:
> > This also corrects the symbolic links installed in
> > /usr/include/rpcsvc.
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >   .../libtirpc/libtirpc_1.1.4.bb                | 27 +++++++++---------=
-
> >   1 file changed, 12 insertions(+), 15 deletions(-)
> >
> > diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> > index 633cececd4..91e0ce6fd2 100644
> > --- a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> > +++ b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> > @@ -1,5 +1,5 @@
> >   SUMMARY =3D "Transport-Independent RPC library"
> > -DESCRIPTION =3D "Libtirpc is a port of Suns Transport-Independent RPC
> library to Linux"
> > +DESCRIPTION =3D "Libtirpc is a port of Sun's Transport-Independent RPC
> library to Linux"
> >   SECTION =3D "libs/network"
> >   HOMEPAGE =3D "http://sourceforge.net/projects/libtirpc/"
> >   BUGTRACKER =3D
> "http://sourceforge.net/tracker/?group_id=3D183075&atid=3D903784"
> > @@ -22,21 +22,18 @@ inherit autotools pkgconfig
> >   EXTRA_OECONF =3D "--disable-gssapi"
> >
> >   do_install_append() {
> > -        chown root:root ${D}${sysconfdir}/netconfig
> > -        install -d ${D}${includedir}/rpc
> > -        install -d ${D}${includedir}/rpcsvc
> > -        for link_header in ${D}${includedir}/tirpc/rpc/*; do
> > -            if [ -f $link_header -a ! -e
> ${D}/${includedir}/rpc/$(basename $link_header) ]; then
> > -                ln -sf ../tirpc/rpc/$(basename $link_header)
> ${D}${includedir}/rpc/$(basename $link_header)
> > -            fi
> > -        done
> > -        for link_header in ${D}${includedir}/tirpc/rpcsvc/*; do
> > -            if [ -f $link_header -a ! -e
> ${D}/${includedir}/rpcsvc/$(basename $link_header) ]; then
> > -                ln -sf ../tirpc/rpc/$(basename $link_header)
> ${D}${includedir}/rpcsvc/$(basename $link_header)
> > -            fi
> > -        done
> > -        ln -sf  tirpc/netconfig.h ${D}/${includedir}/netconfig.h
> > +	chown root:root ${D}${sysconfdir}/netconfig
> >
> > +	for dir in rpc rpcsvc; do
> > +		install -d ${D}${includedir}/$dir
> > +		for link_header in ${D}${includedir}/tirpc/$dir/*;
> do
> > +			if [ -f $link_header ] &&
> > +			   [ ! -e
> ${D}${includedir}/$dir/$(basename $link_header) ]; then
> > +				ln -sf ../tirpc/$dir/$(basename
> $link_header) ${D}${includedir}/$dir/$(basename $link_header)
> > +			fi
> > +		done
> > +	done
> > +	ln -sf tirpc/netconfig.h ${D}${includedir}/netconfig.h
> >   }
> >
>=20
> I know this patch is making the existing logic better. But I dont think
> we should be substituting, sunrpc headers like this, what problems does
> this fix is not clear. tirpc is not a drop in replacement for sun rpc.
> Applications have to use it consciously. Sneaking the headers like this
> can cause subtle errors.
>=20
> Perhaps original patch should just be reverted.

I'm perfectly fine with reverting the original patch instead as that will=20
solve my problem.

> >   BBCLASSEXTEND =3D "native nativesdk"

//Peter


