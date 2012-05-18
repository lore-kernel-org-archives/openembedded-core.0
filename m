Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SVOj2-00012h-PL
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 17:04:17 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 May 2012 07:54:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="154443688"
Received: from orsmsx605.amr.corp.intel.com ([10.22.226.10])
	by fmsmga001.fm.intel.com with ESMTP; 18 May 2012 07:54:11 -0700
Received: from orsmsx152.amr.corp.intel.com (10.22.226.39) by
	orsmsx605.amr.corp.intel.com (10.22.226.10) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 18 May 2012 07:54:11 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.157]) by
	ORSMSX152.amr.corp.intel.com ([169.254.8.73]) with mapi id
	14.01.0355.002; Fri, 18 May 2012 07:54:11 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] eglibc: package mtrace separately
Thread-Index: AQHNNIHciY0mzPVcDE+Rt29zArUsIZbPn+MAgAADGhA=
Date: Fri, 18 May 2012 14:54:10 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C030ED9DC@ORSMSX106.amr.corp.intel.com>
References: <cover.1337295951.git.nitin.a.kamble@intel.com>
	<bce112d0eb42badfca77109b40cf2c86ca3efa48.1337295951.git.nitin.a.kamble@intel.com>
	<4FB5FD66.2010409@linux.intel.com>
In-Reply-To: <4FB5FD66.2010409@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] eglibc: package mtrace separately
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 May 2012 15:04:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Friday, May 18, 2012 12:43 AM
> To: Patches and discussions about the oe-core layer
> Cc: Kamble, Nitin A
> Subject: Re: [OE-core] [PATCH 1/1] eglibc: package mtrace separately
>=20
> On 05/18/2012 02:07 AM, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble<nitin.a.kamble@intel.com>
> >
> > add libc-mtrace as dependency for task-core-tools-debug
> >
> > now eglibc-mtrace gets included in an sdk image and not in a non-sdk
> image.
> >
> > make uclibc recipe lie about providing libc-mtrace to satisfy the
> > dependency
> >
> > This fixes bug: [YOCTO# 2374]
> >
> > Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> > ---
> >   meta/recipes-core/eglibc/eglibc-package.inc      |    7 ++++++-
> >   meta/recipes-core/eglibc/eglibc_2.13.bb          |    2 +-
> >   meta/recipes-core/eglibc/eglibc_2.15.bb          |    2 +-
> >   meta/recipes-core/tasks/task-core-tools-debug.bb |    1 +
> >   meta/recipes-core/uclibc/uclibc.inc              |    2 +-
> >   5 files changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/recipes-core/eglibc/eglibc-package.inc
> > b/meta/recipes-core/eglibc/eglibc-package.inc
> > index 7d97567..ce37155 100644
> > --- a/meta/recipes-core/eglibc/eglibc-package.inc
> > +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> > @@ -20,11 +20,12 @@ USE_LDCONFIG ?=3D "1"
> >   PKGSUFFIX =3D ""
> >   PKGSUFFIX_virtclass-nativesdk =3D "-nativesdk"
> >
> > -PACKAGES =3D "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX}
> nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils eglibc-extra-
> nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-dev ${PN}-
> staticdev ${PN}-doc libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX}
> libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX}"
> > +PACKAGES =3D "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX}
> nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-mtrace ${PN}-utils eglibc-extra-
> nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-dev ${PN}-
> staticdev ${PN}-doc libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX}
> libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX}"
> >
> >   # The ld.so in this eglibc supports the GNU_HASH
> >   RPROVIDES_${PN} =3D "glibc${PKGSUFFIX} rtld(GNU_HASH)"
> >   RPROVIDES_${PN}-utils =3D "glibc${PKGSUFFIX}-utils"
> > +RPROVIDES_${PN}-mtrace =3D "glibc${PKGSUFFIX}-mtrace libc-mtrace"
> >   RPROVIDES_${PN}-pic =3D "glibc${PKGSUFFIX}-pic"
> >   RPROVIDES_${PN}-dev =3D "glibc${PKGSUFFIX}-dev"
> >   RPROVIDES_${PN}-staticdev =3D "glibc${PKGSUFFIX}-staticdev"
> > @@ -48,11 +49,13 @@ FILES_${PN}-dev_append +=3D "${bindir}/rpcgen
> ${libdir}/*_nonshared.a \
> >   	${base_libdir}/*_nonshared.a ${base_libdir}/*.o
> ${datadir}/aclocal"
> >   FILES_${PN}-staticdev_append +=3D "${libdir}/*.a ${base_libdir}/*.a"
> >   FILES_nscd${PKGSUFFIX} =3D "${sbindir}/nscd*"
> > +FILES_${PN}-mtrace =3D "${bindir}/mtrace"
> >   FILES_${PN}-utils =3D "${bindir}/* ${sbindir}/*"
> >   FILES_${PN}-dbg +=3D "${libexecdir}/*/.debug ${libdir}/audit/.debug"
> >   FILES_catchsegv${PKGSUFFIX} =3D "${bindir}/catchsegv"
> >   RDEPENDS_catchsegv${PKGSUFFIX} =3D "libsegfault"
> >   RDEPENDS_${PN}-utils +=3D "bash"
> > +RDEPENDS_${PN}-mtrace +=3D "perl"
> >   FILES_${PN}-pcprofile =3D "${base_libdir}/libpcprofile.so"
> >   FILES_eglibc-thread-db${PKGSUFFIX} =3D
> "${base_libdir}/libthread_db.so.* ${base_libdir}/libthread_db-*.so"
> >   RPROVIDES_${PN}-dev +=3D "libc-dev"
> > @@ -68,6 +71,8 @@ SUMMARY_ldd =3D "print shared library dependencies"
> >   DESCRIPTION_ldd =3D "/usr/bin/ldd prints shared library dependencies
> for each program or shared library specified on the command line."
> >   SUMMARY_${PN}-utils =3D "Miscellaneous utilities provided by eglibc"
> >   DESCRIPTION_${PN}-utils =3D "Miscellaneous utilities including
> getconf, iconf, locale, gencat, tzselect, zic, rpcinfo, ..."
> > +SUMMARY_${PN}-mtrace =3D "mtrace utility provided by eglibc"
> > +DESCRIPTION_${PN}-mtrace =3D "mtrace utility provided by eglibc"
> >   DESCRIPTION_libsotruss =3D "Library to support sotruss which traces
> calls through PLTs"
> >
> >   inherit libc-common multilib_header
> > diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb
> > b/meta/recipes-core/eglibc/eglibc_2.13.bb
> > index d8a41dc..73cd0aa 100644
> > --- a/meta/recipes-core/eglibc/eglibc_2.13.bb
> > +++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
> > @@ -3,7 +3,7 @@ require eglibc.inc
> >   SRCREV =3D "15508"
> >
> >   DEPENDS +=3D "gperf-native"
> > -PR =3D "r26"
> > +PR =3D "r27"
> >   PR_append =3D "+svnr${SRCPV}"
> >
> >   EGLIBC_BRANCH=3D"eglibc-2_13"
> > diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb
> > b/meta/recipes-core/eglibc/eglibc_2.15.bb
> > index 340ec99..bb60b57 100644
> > --- a/meta/recipes-core/eglibc/eglibc_2.15.bb
> > +++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
> > @@ -3,7 +3,7 @@ require eglibc.inc
> >   SRCREV =3D "17386"
> >
> >   DEPENDS +=3D "gperf-native"
> > -PR =3D "r10"
> > +PR =3D "r11"
> >   PR_append =3D "+svnr${SRCPV}"
> >
> >   EGLIBC_BRANCH=3D"eglibc-2_15"
> > diff --git a/meta/recipes-core/tasks/task-core-tools-debug.bb
> > b/meta/recipes-core/tasks/task-core-tools-debug.bb
> > index 3c92f3f..3970f14 100644
> > --- a/meta/recipes-core/tasks/task-core-tools-debug.bb
> > +++ b/meta/recipes-core/tasks/task-core-tools-debug.bb
> > @@ -23,4 +23,5 @@ RDEPENDS_${PN} =3D "\
> >       tcf-agent \
> >       rsync \
> >       strace \
> > +    libc-mtrace \
> >       "
>=20
> Nitin:
>=20
> A better way to do this is all in the task bb file using an override
> MTRACE =3D ""
> MTRACE_libc-eglibc =3D "eglibc-mtrace"
>=20
> Sau!
>=20


Saul,
  I don't understand, why is it better?
Nitin

>=20
> > diff --git a/meta/recipes-core/uclibc/uclibc.inc
> > b/meta/recipes-core/uclibc/uclibc.inc
> > index 55ab0c9..afc0ed5 100644
> > --- a/meta/recipes-core/uclibc/uclibc.inc
> > +++ b/meta/recipes-core/uclibc/uclibc.inc
> > @@ -89,7 +89,7 @@ RPROVIDES_${PN}-dev +=3D "libc-dev virtual-libc-dev"
> >   # going to work. So we pretend that we have it to make bitbake not
> pull other recipes
> >   # to satisfy this dependency for the images/tasks
> >
> > -RPROVIDES_uclibc +=3D "libsegfault rtld(GNU_HASH)"
> > +RPROVIDES_uclibc +=3D "libsegfault rtld(GNU_HASH) libc-mtrace"
> >
> >   SRC_URI =3D "\
> >
> > http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz2;name=3DuClibc-
> ${PV}
> > \


