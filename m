Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8160F79DCC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Feb 2019 23:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 9C518181C4;
	Mon, 11 Feb 2019 00:32:55 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id k-EjU9mPufe2; Mon, 11 Feb 2019 00:32:54 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 24B2C18136;
	Mon, 11 Feb 2019 00:32:54 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F2A91A060;
	Mon, 11 Feb 2019 00:32:54 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 030321A05C;
	Mon, 11 Feb 2019 00:32:54 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Mon, 11 Feb 2019 00:32:53 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id E8C7B2E75;
	Mon, 11 Feb 2019 00:32:53 +0100 (CET)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 11 Feb 2019 00:32:53 +0100
Received: from XBOX04.axis.com (10.0.5.18) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 11 Feb 2019 00:32:53 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Mon, 11 Feb 2019 00:32:53 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] glibc-locale: Rewrite do_install using install
	utility instead of cp
Thread-Index: AQHUvsO2NPNJPiVEfkiTK0smTe4s2KXYM3gAgABavrCAASOLsA==
Date: Sun, 10 Feb 2019 23:32:53 +0000
Message-ID: <3b378c3a9a4746b289bc71fd5bc88470@XBOX04.axis.com>
References: <20190207003537.7135-1-raj.khem@gmail.com>
	<88a02e81ed831ed4fba8adbd9e18f1a35dbf098d.camel@linuxfoundation.org>
	<770bd2ba38ec4688a45c1df281a1e112@XBOX04.axis.com>
	<78add39e738e4038993d4266b92445f0@XBOX04.axis.com>
In-Reply-To: <78add39e738e4038993d4266b92445f0@XBOX04.axis.com>
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
X-List-Received-Date: Sun, 10 Feb 2019 23:32:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 10 februari 2019 07:25
> To: Richard Purdie <richard.purdie@linuxfoundation.org>; Khem Raj
> <raj.khem@gmail.com>; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] glibc-locale: Rewrite do_install using
> install utility instead of cp
>=20
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> > core-bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > Sent: den 10 februari 2019 02:29
> > To: Richard Purdie <richard.purdie@linuxfoundation.org>; Khem Raj
> > <raj.khem@gmail.com>; openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] glibc-locale: Rewrite do_install using
> > install utility instead of cp
> >
> > > -----Original Message-----
> > > From: openembedded-core-bounces@lists.openembedded.org
> <openembedded-
> > > core-bounces@lists.openembedded.org> On Behalf Of Richard Purdie
> > > Sent: den 7 februari 2019 10:01
> > > To: Khem Raj <raj.khem@gmail.com>; openembedded-
> > > core@lists.openembedded.org
> > > Subject: Re: [OE-core] [PATCH] glibc-locale: Rewrite do_install
> using
> > > install utility instead of cp
> > >
> > > On Wed, 2019-02-06 at 16:35 -0800, Khem Raj wrote:
> > > > This has been a constant source of trouble for build failures due
> > to
> > > host-user-contaminated QA
> > > > errors of sort
> > > >
> > > > ERROR: QA Issue: glibc-locale: /glibc-binary-localedata-ca-
> > > es+valencia/usr/lib/locale/ca_ES@valencia/LC_MONETARY is owned by
> uid
> > > 3004, which is the same as the user running bitbake. This may be
> due
> > to
> > > host contamination [host-user-contaminated]
> > > >
> > > > So far we have tried to mould cp command into not carrying the
> > build
> > > > user permissions into install area but it is never entirely fixed
> > > since
> > > > the issue keeps popping up in various scenes
> > > >
> > > > This patch replaces use of cp with install utility and specifies
> > > install
> > > > mode for files explcitly
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  meta/recipes-core/glibc/glibc-locale.inc | 44 ++++++++++++++----
> --
> > --
> > > --
> > > >  1 file changed, 25 insertions(+), 19 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-core/glibc/glibc-locale.inc
> > b/meta/recipes-
> > > core/glibc/glibc-locale.inc
> > > > index 6384f9cbf1..9b256a5108 100644
> > > > --- a/meta/recipes-core/glibc/glibc-locale.inc
> > > > +++ b/meta/recipes-core/glibc/glibc-locale.inc
> > > > @@ -72,27 +72,33 @@ FILES_localedef =3D "${bindir}/localedef"
> > > >  LOCALETREESRC =3D "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-
> > > locale"
> > > >
> > > >  do_install () {
> > > > -	mkdir -p ${D}${bindir} ${D}${datadir}
> > > > -	if [ -n "$(ls ${LOCALETREESRC}/${bindir})" ]; then
> > > > -		cp -R --no-dereference --preserve=3Dmode,links
> > > ${LOCALETREESRC}/${bindir}/* ${D}${bindir}
> > > > -	fi
> > > > -	if [ -n "$(ls ${LOCALETREESRC}/${localedir})" ]; then
> > > > -		mkdir -p ${D}${localedir}
> > > > -		cp -R --no-dereference --preserve=3Dmode,links
> > > ${LOCALETREESRC}/${localedir}/* ${D}${localedir}
> > > > -	fi
> > > > +        install -d ${D}${bindir}
> > > > +        find "${LOCALETREESRC}/${bindir}" -maxdepth 1 -type f \
> > > > +        -exec install -m 0755 -t "${D}${bindir}" {} \;
> > > > +
> > > > +        for d in . $(find "${LOCALETREESRC}/${localedir}" -type
> d
> > -
> > > printf '%P ') ; do
> > > > +                install -d "${D}${localedir}/$d"
> > > > +                find "${LOCALETREESRC}/${localedir}/$d" -
> maxdepth
> > 1
> > > -type f \
> > > > +                -exec install -m 0644 -t "${D}${localedir}/$d"
> {}
> > \;
> > > > +        done
> > > >  	if [ ${@d.getVar('PACKAGE_NO_GCONV')} -eq 0 ]; then
> > > > -		mkdir -p ${D}${libdir}
> > > > -		if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then
> > > > -			cp -R --no-dereference --
> > > preserve=3Dmode,links ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
> > > > -		fi
> > > > -		if [ -e ${LOCALETREESRC}/${datadir}/i18n ]; then
> > > > -			cp -R --no-dereference --
> > > preserve=3Dmode,links ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
> > > > -		fi
> > > > -	fi
> > > > -	if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then
> > > > -		cp -R --no-dereference --preserve=3Dmode,links
> > > ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
> > > > +                for d in . $(find
> > "${LOCALETREESRC}/${libdir}/gconv"
> > > -type d -printf '%P ') ; do
> > > > +                        install -d "${D}${libdir}/gconv/$d"
> > > > +                        find
> "${LOCALETREESRC}/${libdir}/gconv/$d"
> > -
> > > maxdepth 1 -type f \
> > > > +                        -exec install -m 0755 -t
> > > "${D}${libdir}/gconv/$d" {} \;
> > > > +                done
> > > > +                for d in . $(find
> > "${LOCALETREESRC}/${datadir}/i18n"
> > > -type d -printf '%P ') ; do
> > > > +                        install -d "${D}${datadir}/i18n/$d"
> > > > +                        find
> "${LOCALETREESRC}/${datadir}/i18n/$d"
> > -
> > > maxdepth 1 -type f \
> > > > +                        -exec install -m 0644 -t
> > > "${D}${datadir}/i18n/$d" {} \;
> > > > +                done
> > > >  	fi
> > > > -	cp -R --no-dereference --preserve=3Dmode,links
> > > ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
> > > > +        for d in . $(find "${LOCALETREESRC}/${datadir}/locale" -
> > type
> > > d -printf '%P ') ; do
> > > > +                install -d "${D}${datadir}/locale/$d"
> > > > +                find "${LOCALETREESRC}/${datadir}/locale/$d" -
> > > maxdepth 1 -type f \
> > > > +                -exec install -m 0644 -t
> > "${D}${datadir}/locale/$d"
> > > {} \;
> > > > +        done
> > > > +	install -m 0644 ${LOCALETREESRC}/SUPPORTED
> > > ${WORKDIR}/SUPPORTED
> > > >  }
> > > >
> > > >  inherit libc-package
> > >
> > > The trouble is this is a workaround. The cp commands should work
> and
> > > there is some underlying issue in pseudo causing this. We really
> need
> > > to figure out what that is since this will likely just mean we see
> > the
> > > problem somewhere else :(
> > >
> > > I still suspect some kind of inode number reuse problem which these
> > cp
> > > commands trigger...
> > >
> > > Cheers,
> > >
> > > Richard
> >
> > For the record, even if I think the patch was the right thing to do,
> > it did not help the situation. The first build I did after it was
> > integrated, I was bit by the following:
> >
> >   Failed to determine the user name of UID 323 for
> >   tmp/work/core2-64-poky-linux/glibc-locale/2.29-
> r0/package/usr/lib/locale
> >
> > where UID 323 is my UID. If you do not recognize the error message,
> > it is because it comes from a local patch we have for rpm to protect
> > us from any incorrect UIDs/GIDs causing incorrect RPMs to be
> generated
> > (see below). I checked the build directory and the /usr/lib/locale
> > directory was the only file or directory with an incorrect owner,
> > which is typical of these pseudo related problems with incorrect
> > owners.
> >
> > [rpm will by default silently fall back to use root for any files
> > where it cannot determine the name of the user or group based on
> > its UID/GID. This can be due to missing information in the
> > /etc/passwd or /etc/groups files, typically due to relying on
> > another recipe in DEPENDS to create the user without also having
> > an RDEPENDS on the package that creates the user, or because of
> > pseudo messing up. After this bit us once where a device in /dev
> > ended up in an rpm in the sstate cache with root as group instead
> > of the intended video group, which in turn caused the video
> > application to fail as it was no longer allowed to open its device,
> > I created the patch. It is causing a fair bit of grief as it causes
> > builds to fail randomly, but at least we don't end up with an
> > incorrect sstate anymore, which is worse. I am not sure this patch
> > is suitable for integration to OE-Core, but I have attached it if
> > anyone is interested.]
> >
> > //Peter
>=20
> Ok, this just got a lot more weird. At the time I wrote the mail
> above, I had only tried to rebuild once. Now I have done it a number
> of more times, and the result is not random any more. Every build
> fails the same way. I've done `bitbake glibc-locale -c cleansstate`
> followed by `bitbake glibc-locale` and the result is consistent.
> What I have noted now, is that it is _not_ do_install that causes
> the problem. The /usr/lib/locale directory created in ${D} has
> the correct owner. It is when the data is copied to ${PKGD} that
> it somehow ends up with the wrong owner. I cannot tell from a quick
> glance what differs /usr/lib/locale from, e.g., /usr/lib/gconv,
> where the latter does get the correct owner.
>=20
> Unfortunately, I do not have more time to look at this right now,
> but I thought I should share this information with you. If anyone
> has any ideas of what to look at to determine why
> ${PKGD}/usr/lib/locale ends up with the wrong owner, I'm all ears.
> It would also be interesting to hear if the result is the same for
> anyone else with the patch I provided in my previous mail applied.
>=20
> //Peter

Further investigation indicates that the problem I'm seeing is not=20
related to pseudo, but an actual problem in the code. I have not dug=20
too far into it, but I'm seeing the problem in the directories used=20
in do_prep_locale_tree() and do_collect_bins_from_locale_tree() in=20
libc-package.bbclass where some of them seems to have been created=20
without being run under pseudo. The following patch works around the=20
problem, though it would probably be better to correct the problem=20
at the source by running whatever part of the code under pseudo that=20
is currently missing it:

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.=
bbclass
index 0b4c666a74..174465a891 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -72,6 +72,7 @@ do_prep_locale_tree() {
                tar -cf - -C ${STAGING_DIR_NATIVE}/${prefix_native}/${base_=
libdir} -p libgcc_s.* | tar -xf - -C $treedir/${base_libdir}
        fi
        install -m 0755 ${LOCALETREESRC}${bindir}/localedef $treedir/${base=
_bindir}
+       chown -R root:root $treedir
 }

 do_collect_bins_from_locale_tree() {

//Peter

