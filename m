Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9C9A779AE7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Feb 2019 06:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id F1EEA18297;
	Sun, 10 Feb 2019 07:25:11 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id NAsq3tlO6CuI; Sun, 10 Feb 2019 07:25:10 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id C38F518117;
	Sun, 10 Feb 2019 07:25:10 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A404F1E066;
	Sun, 10 Feb 2019 07:25:10 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 980291E05C;
	Sun, 10 Feb 2019 07:25:10 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Sun, 10 Feb 2019 07:25:10 +0100 (CET)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id 8B71A44C;
	Sun, 10 Feb 2019 07:25:10 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Sun, 10 Feb 2019 07:25:10 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Sun, 10 Feb 2019 07:25:10 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] glibc-locale: Rewrite do_install using install
	utility instead of cp
Thread-Index: AQHUvsO2NPNJPiVEfkiTK0smTe4s2KXYM3gAgABavrA=
Date: Sun, 10 Feb 2019 06:25:10 +0000
Message-ID: <78add39e738e4038993d4266b92445f0@XBOX04.axis.com>
References: <20190207003537.7135-1-raj.khem@gmail.com>
	<88a02e81ed831ed4fba8adbd9e18f1a35dbf098d.camel@linuxfoundation.org>
	<770bd2ba38ec4688a45c1df281a1e112@XBOX04.axis.com>
In-Reply-To: <770bd2ba38ec4688a45c1df281a1e112@XBOX04.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] glibc-locale: Rewrite do_install using install utility instead of cp
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
X-List-Received-Date: Sun, 10 Feb 2019 06:25:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 10 februari 2019 02:29
> To: Richard Purdie <richard.purdie@linuxfoundation.org>; Khem Raj
> <raj.khem@gmail.com>; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] glibc-locale: Rewrite do_install using
> install utility instead of cp
>=20
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> > core-bounces@lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 7 februari 2019 10:01
> > To: Khem Raj <raj.khem@gmail.com>; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] glibc-locale: Rewrite do_install using
> > install utility instead of cp
> >
> > On Wed, 2019-02-06 at 16:35 -0800, Khem Raj wrote:
> > > This has been a constant source of trouble for build failures due
> to
> > host-user-contaminated QA
> > > errors of sort
> > >
> > > ERROR: QA Issue: glibc-locale: /glibc-binary-localedata-ca-
> > es+valencia/usr/lib/locale/ca_ES@valencia/LC_MONETARY is owned by uid
> > 3004, which is the same as the user running bitbake. This may be due
> to
> > host contamination [host-user-contaminated]
> > >
> > > So far we have tried to mould cp command into not carrying the
> build
> > > user permissions into install area but it is never entirely fixed
> > since
> > > the issue keeps popping up in various scenes
> > >
> > > This patch replaces use of cp with install utility and specifies
> > install
> > > mode for files explcitly
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-core/glibc/glibc-locale.inc | 44 ++++++++++++++------
> --
> > --
> > >  1 file changed, 25 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/meta/recipes-core/glibc/glibc-locale.inc
> b/meta/recipes-
> > core/glibc/glibc-locale.inc
> > > index 6384f9cbf1..9b256a5108 100644
> > > --- a/meta/recipes-core/glibc/glibc-locale.inc
> > > +++ b/meta/recipes-core/glibc/glibc-locale.inc
> > > @@ -72,27 +72,33 @@ FILES_localedef =3D "${bindir}/localedef"
> > >  LOCALETREESRC =3D "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-
> > locale"
> > >
> > >  do_install () {
> > > -	mkdir -p ${D}${bindir} ${D}${datadir}
> > > -	if [ -n "$(ls ${LOCALETREESRC}/${bindir})" ]; then
> > > -		cp -R --no-dereference --preserve=3Dmode,links
> > ${LOCALETREESRC}/${bindir}/* ${D}${bindir}
> > > -	fi
> > > -	if [ -n "$(ls ${LOCALETREESRC}/${localedir})" ]; then
> > > -		mkdir -p ${D}${localedir}
> > > -		cp -R --no-dereference --preserve=3Dmode,links
> > ${LOCALETREESRC}/${localedir}/* ${D}${localedir}
> > > -	fi
> > > +        install -d ${D}${bindir}
> > > +        find "${LOCALETREESRC}/${bindir}" -maxdepth 1 -type f \
> > > +        -exec install -m 0755 -t "${D}${bindir}" {} \;
> > > +
> > > +        for d in . $(find "${LOCALETREESRC}/${localedir}" -type d
> -
> > printf '%P ') ; do
> > > +                install -d "${D}${localedir}/$d"
> > > +                find "${LOCALETREESRC}/${localedir}/$d" -maxdepth
> 1
> > -type f \
> > > +                -exec install -m 0644 -t "${D}${localedir}/$d" {}
> \;
> > > +        done
> > >  	if [ ${@d.getVar('PACKAGE_NO_GCONV')} -eq 0 ]; then
> > > -		mkdir -p ${D}${libdir}
> > > -		if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then
> > > -			cp -R --no-dereference --
> > preserve=3Dmode,links ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
> > > -		fi
> > > -		if [ -e ${LOCALETREESRC}/${datadir}/i18n ]; then
> > > -			cp -R --no-dereference --
> > preserve=3Dmode,links ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
> > > -		fi
> > > -	fi
> > > -	if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then
> > > -		cp -R --no-dereference --preserve=3Dmode,links
> > ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
> > > +                for d in . $(find
> "${LOCALETREESRC}/${libdir}/gconv"
> > -type d -printf '%P ') ; do
> > > +                        install -d "${D}${libdir}/gconv/$d"
> > > +                        find "${LOCALETREESRC}/${libdir}/gconv/$d"
> -
> > maxdepth 1 -type f \
> > > +                        -exec install -m 0755 -t
> > "${D}${libdir}/gconv/$d" {} \;
> > > +                done
> > > +                for d in . $(find
> "${LOCALETREESRC}/${datadir}/i18n"
> > -type d -printf '%P ') ; do
> > > +                        install -d "${D}${datadir}/i18n/$d"
> > > +                        find "${LOCALETREESRC}/${datadir}/i18n/$d"
> -
> > maxdepth 1 -type f \
> > > +                        -exec install -m 0644 -t
> > "${D}${datadir}/i18n/$d" {} \;
> > > +                done
> > >  	fi
> > > -	cp -R --no-dereference --preserve=3Dmode,links
> > ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
> > > +        for d in . $(find "${LOCALETREESRC}/${datadir}/locale" -
> type
> > d -printf '%P ') ; do
> > > +                install -d "${D}${datadir}/locale/$d"
> > > +                find "${LOCALETREESRC}/${datadir}/locale/$d" -
> > maxdepth 1 -type f \
> > > +                -exec install -m 0644 -t
> "${D}${datadir}/locale/$d"
> > {} \;
> > > +        done
> > > +	install -m 0644 ${LOCALETREESRC}/SUPPORTED
> > ${WORKDIR}/SUPPORTED
> > >  }
> > >
> > >  inherit libc-package
> >
> > The trouble is this is a workaround. The cp commands should work and
> > there is some underlying issue in pseudo causing this. We really need
> > to figure out what that is since this will likely just mean we see
> the
> > problem somewhere else :(
> >
> > I still suspect some kind of inode number reuse problem which these
> cp
> > commands trigger...
> >
> > Cheers,
> >
> > Richard
>=20
> For the record, even if I think the patch was the right thing to do,=20
> it did not help the situation. The first build I did after it was
> integrated, I was bit by the following:
>=20
>   Failed to determine the user name of UID 323 for
>   tmp/work/core2-64-poky-linux/glibc-locale/2.29-r0/package/usr/lib/local=
e
>=20
> where UID 323 is my UID. If you do not recognize the error message,=20
> it is because it comes from a local patch we have for rpm to protect=20
> us from any incorrect UIDs/GIDs causing incorrect RPMs to be generated=20
> (see below). I checked the build directory and the /usr/lib/locale=20
> directory was the only file or directory with an incorrect owner,=20
> which is typical of these pseudo related problems with incorrect=20
> owners.
>=20
> [rpm will by default silently fall back to use root for any files=20
> where it cannot determine the name of the user or group based on=20
> its UID/GID. This can be due to missing information in the=20
> /etc/passwd or /etc/groups files, typically due to relying on=20
> another recipe in DEPENDS to create the user without also having=20
> an RDEPENDS on the package that creates the user, or because of=20
> pseudo messing up. After this bit us once where a device in /dev=20
> ended up in an rpm in the sstate cache with root as group instead
> of the intended video group, which in turn caused the video=20
> application to fail as it was no longer allowed to open its device,=20
> I created the patch. It is causing a fair bit of grief as it causes=20
> builds to fail randomly, but at least we don't end up with an=20
> incorrect sstate anymore, which is worse. I am not sure this patch=20
> is suitable for integration to OE-Core, but I have attached it if=20
> anyone is interested.]
>=20
> //Peter

Ok, this just got a lot more weird. At the time I wrote the mail=20
above, I had only tried to rebuild once. Now I have done it a number=20
of more times, and the result is not random any more. Every build=20
fails the same way. I've done `bitbake glibc-locale -c cleansstate`=20
followed by `bitbake glibc-locale` and the result is consistent.=20
What I have noted now, is that it is _not_ do_install that causes=20
the problem. The /usr/lib/locale directory created in ${D} has=20
the correct owner. It is when the data is copied to ${PKGD} that=20
it somehow ends up with the wrong owner. I cannot tell from a quick=20
glance what differs /usr/lib/locale from, e.g., /usr/lib/gconv,=20
where the latter does get the correct owner.

Unfortunately, I do not have more time to look at this right now,=20
but I thought I should share this information with you. If anyone=20
has any ideas of what to look at to determine why=20
${PKGD}/usr/lib/locale ends up with the wrong owner, I'm all ears.=20
It would also be interesting to hear if the result is the same for=20
anyone else with the patch I provided in my previous mail applied.

//Peter


