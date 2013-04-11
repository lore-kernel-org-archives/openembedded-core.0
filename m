Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1UQH7X-00020j-Bm
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 15:01:24 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3BChUJV023787;
	Thu, 11 Apr 2013 07:43:30 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3BChUdV021516;
	Thu, 11 Apr 2013 07:43:30 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 11 Apr 2013 07:43:30 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [OE-core] [PATCH][for-danny] kernel bbclass: return to
	original directory in do_deploy
Thread-Index: AQHONj9zTM/tkxIz0E+0T10m73f8mJjQ98Ew
Date: Thu, 11 Apr 2013 12:43:30 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594DD843@DLEE11.ent.ti.com>
References: <1363628359-18023-1-git-send-email-Chase.Maupin@ti.com>
	<20130410230157.GB28466@denix.org>
In-Reply-To: <20130410230157.GB28466@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][for-danny] kernel bbclass: return to original directory in do_deploy
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
X-List-Received-Date: Thu, 11 Apr 2013 13:01:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denis@denix.org]
> Sent: Wednesday, April 10, 2013 6:02 PM
> To: Maupin, Chase
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH][for-danny] kernel bbclass: return
> to original directory in do_deploy
>=20
> Ping.
>=20
> Ross, is it in your queue for your next danny merge?

I see that one as already being commited to danny

>=20
> --
> Denys
>=20
>=20
> On Mon, Mar 18, 2013 at 12:39:19PM -0500, Chase Maupin wrote:
> > * During the base kernel_do_deploy function the directory is
> >   changed to DEPLOYDIR in order to do some cleanup and
> symlinking.
> >   However, the directory is not changed back to the original
> >   starting directory ${S} at the end.  For append functions
> this
> >   means that the starting directory is not ${S} as expected but
> >   instead ${DEPLOYDIR}.
> >
> >   For functions like the do_deploy_append in
> >   recipes-kernel/linux/linux-dtb.inc there is an assumption
> that
> >   you are still in the source directory and not the DEPLOYDIR.
> >   Without this change the .dtb files are not copied because the
> >   check for the existence of ${DTS_FILE} which is a relative
> >   path from the ${S} directory fails.  This means that the .dtb
> >   files are not copied into the deploy directory and
> subsequently
> >   the deploy/images directory.
> >
> >   In the log.do_deploy file you will see lines like:
> >
> >     Warning: arch/arm/boot/dts/xxxxx.dts is not available!
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  meta/classes/kernel.bbclass |    1 +
> >  1 files changed, 1 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta/classes/kernel.bbclass
> b/meta/classes/kernel.bbclass
> > index 88ce561..9691c25 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -529,6 +529,7 @@ kernel_do_deploy() {
> >  	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
> >
> >  	cp ${COREBASE}/meta/files/deploydir_readme.txt
> ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
> > +	cd -
> >  }
> >  do_deploy[dirs] =3D "${DEPLOYDIR} ${B}"
> >
> > --
> > 1.7.0.4
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-
> bin/mailman/listinfo/openembedded-core


