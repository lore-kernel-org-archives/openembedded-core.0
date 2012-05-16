Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SUkK4-0005D0-0C
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 21:55:48 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 May 2012 12:45:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144049712"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by azsmga001.ch.intel.com with ESMTP; 16 May 2012 12:45:27 -0700
Received: from orsmsx103.amr.corp.intel.com (10.22.225.130) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 16 May 2012 12:45:27 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.157]) by
	ORSMSX103.amr.corp.intel.com ([169.254.2.163]) with mapi id
	14.01.0355.002; Wed, 16 May 2012 12:45:27 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] eglibc: package mtrace separately
Thread-Index: AQHNM49SQPS8HxInCE+coUlLF1wQ+JbNMvYA//+epEA=
Date: Wed, 16 May 2012 19:45:26 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C030EAE98@ORSMSX106.amr.corp.intel.com>
References: <cover.1337191798.git.nitin.a.kamble@intel.com>
	<95a4d7c127f39cac6fc7d60e8b4081ae774cd745.1337191798.git.nitin.a.kamble@intel.com>
	<4FB3F2F0.10201@linux.intel.com>
In-Reply-To: <4FB3F2F0.10201@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] eglibc: package mtrace separately
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
X-List-Received-Date: Wed, 16 May 2012 19:55:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Wednesday, May 16, 2012 11:33 AM
> To: Patches and discussions about the oe-core layer
> Cc: Kamble, Nitin A
> Subject: Re: [OE-core] [PATCH 1/2] eglibc: package mtrace separately
>=20
> On 05/16/2012 09:11 PM, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble<nitin.a.kamble@intel.com>
> >
> > eglibc-mtrace: add dependency into task-core-tools-debug
> >
> > now eglibc-mtrace gets included in an sdk image and not in a non-sdk
> image.
> >
> > This fixes bug: [YOCTO# 2374]
> >
> > Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> > ---
> >   meta/recipes-core/eglibc/eglibc-package.inc      |    7 ++++++-
> >   meta/recipes-core/eglibc/eglibc_2.13.bb          |    2 +-
> >   meta/recipes-core/eglibc/eglibc_2.15.bb          |    2 +-
> >   meta/recipes-core/tasks/task-core-tools-debug.bb |    1 +
> >   4 files changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-core/eglibc/eglibc-package.inc
> > b/meta/recipes-core/eglibc/eglibc-package.inc
> > index 7d97567..fd136bd 100644
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
> > +RPROVIDES_${PN}-mtrace =3D "glibc${PKGSUFFIX}-mtrace"
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
> > index 3c92f3f..64b976a 100644
> > --- a/meta/recipes-core/tasks/task-core-tools-debug.bb
> > +++ b/meta/recipes-core/tasks/task-core-tools-debug.bb
> > @@ -23,4 +23,5 @@ RDEPENDS_${PN} =3D "\
> >       tcf-agent \
> >       rsync \
> >       strace \
> > +    eglibc-mtrace \
> >       "
> Nitin,
>=20
> What's going to happen when someone builds with uclibc?  This won't
> work and an unmet dependency will occur.  I thought we talked about how
> to do something.
>=20
> Sau!

Saul,
 Forgot to add the uclibc changes I am adding those now.
Nitin



