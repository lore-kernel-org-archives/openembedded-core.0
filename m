Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2120065D00;
	Mon, 22 Aug 2016 17:01:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7MH1w6n025992
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 22 Aug 2016 10:01:59 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.25]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0248.002;
	Mon, 22 Aug 2016 10:01:58 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-commits] [openembedded-core] 01/02: systemd-compat-units:
	pkg_postinst() does not work
Thread-Index: AQHR/IBhsPKwEaNa1kuAHYMUG1T3PqBVM/Qw
Date: Mon, 22 Aug 2016 17:01:57 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84B6209B91@ALA-MBA.corp.ad.wrs.com>
References: <20160818155231.26598.41172@opal.openembedded.org>
	<20160818155232.98F9250386@opal.openembedded.org>
	<20160822142037.mreue353yrb6kvgs@jama>
In-Reply-To: <20160822142037.mreue353yrb6kvgs@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.160]
MIME-Version: 1.0
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 01/02: systemd-compat-units: pkg_postinst() does not work
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
X-List-Received-Date: Mon, 22 Aug 2016 17:02:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

At the cost of a little build time, I guess we could lose the inherit allar=
ch.
As a practical matter, we could get rid of the RDEPEND (or make it a DEPEND=
?),
but that seems wrong, somehow.

Joe

> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]
> Sent: Monday, August 22, 2016 7:21 AM
> To: openembedded-core@lists.openembedded.org; Slater, Joseph
> Cc: openembedded-commits@lists.openembedded.org
> Subject: Re: [oe-commits] [openembedded-core] 01/02: systemd-compat-units=
: pkg_postinst()
> does not work
>=20
> On Thu, Aug 18, 2016 at 03:52:33PM +0000, git@git.openembedded.org wrote:
> > rpurdie pushed a commit to branch master
> > in repository openembedded-core.
> >
> > commit 8183309080aee45746daaff46b0506b09b5bd269
> > Author: Joe Slater <jslater@windriver.com>
> > AuthorDate: Mon Aug 15 16:04:53 2016 -0700
> >
> >     systemd-compat-units: pkg_postinst() does not work
> >
> >     The test for various files is wrong and will always be
> >     true, even if init.d does not exist.
> >
> >     Exit if init.d does not exist, and correctly test for
> >     file existence otherwise.
> >
> >     Signed-off-by: Joe Slater <jslater@windriver.com>
> >     Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/recipes-core/systemd/systemd-compat-units.bb | 17 ++++++++++-----=
--
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/r=
ecipes-
> core/systemd/systemd-compat-units.bb
> > index 0b8ff09..90811da 100644
> > --- a/meta/recipes-core/systemd/systemd-compat-units.bb
> > +++ b/meta/recipes-core/systemd/systemd-compat-units.bb
> > @@ -23,21 +23,24 @@ SYSTEMD_DISABLED_SYSV_SERVICES =3D " \
> >  "
> >
> >  pkg_postinst_${PN} () {
> > -	cd $D${sysconfdir}/init.d
> >
> > -	echo "Disabling the following sysv scripts: "
> > +	cd $D${sysconfdir}/init.d  ||  exit 0
> >
> > -	OPTS=3D""
> > +	echo "Disabling the following sysv scripts: "
> >
> >  	if [ -n "$D" ]; then
> >  		OPTS=3D"--root=3D$D"
> > +	else
> > +		OPTS=3D""
> >  	fi
> >
> >  	for i in ${SYSTEMD_DISABLED_SYSV_SERVICES} ; do
> > -		if [ \( -e $i -o $i.sh \) -a ! \( -e $D${sysconfdir}/systemd/system/=
$i.service -
> o  -e $D${systemd_unitdir}/system/$i.service \) ] ; then
> > -			echo -n "$i: " ; systemctl ${OPTS} mask $i.service
> > +		if [ -e $i -o -e $i.sh ]  &&   ! [ -e $D${sysconfdir}/systemd/system=
/$i.service
> -o -e $D${systemd_unitdir}/system/$i.service ] ; then
> > +			echo -n "$i: "
> > +			systemctl $OPTS mask $i.service
> >  		fi
> > -	done ; echo
> > +	done
> > +	echo
> >  }
> >
> > -RDPEPENDS_${PN} =3D "systemd"
> > +RDEPENDS_${PN} =3D "systemd"
>=20
> This is good typo fix, but also causes allarch systemd-compat-units to
> RDEPENDS on TUNE_PKGARCH systemd as reported in:
> http://lists.openembedded.org/pipermail/openembedded-core/2016-August/125=
483.html
>=20
> So either please exclude it in layer.conf for drop this runtime
> dependency completely.
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

