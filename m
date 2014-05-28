Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id B7C226AD16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 14:38:07 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0158.001; Wed, 28 May 2014 16:38:07 +0200
From: Tudor Florea <Tudor.Florea@enea.com>
To: Saul Wold <sgw@linux.intel.com>, Chong Lu <Chong.Lu@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] strace: fix ptest execution failure
Thread-Index: AQHPeXm//tzGTJWrQk2OPiyJgJbcPZtUiWZw///hTICAAabq8A==
Date: Wed, 28 May 2014 14:38:07 +0000
Message-ID: <26724FB0BFCB3D4C91BDE184751AA3A428A4A59D@SESTOEX04.enea.se>
References: <cover.1401174102.git.Chong.Lu@windriver.com>
	<c1e7421f8317b0dfb0988044e511dc95e5265af1.1401174102.git.Chong.Lu@windriver.com>
	<26724FB0BFCB3D4C91BDE184751AA3A428A49EA5@SESTOEX04.enea.se>
	<5384ADE7.6090307@linux.intel.com>
In-Reply-To: <5384ADE7.6090307@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.15.171]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] strace: fix ptest execution failure
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
X-List-Received-Date: Wed, 28 May 2014 14:38:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Tuesday, May 27, 2014 18:23
> To: Tudor Florea; Chong Lu; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 1/1] strace: fix ptest execution failure
>=20
> On 05/27/2014 08:16 AM, Tudor Florea wrote:
> >
> >
> >> -----Original Message-----
> >> From: openembedded-core-bounces@lists.openembedded.org
> >> [mailto:openembedded-core-bounces@lists.openembedded.org] On
> Behalf
> >> Of Chong Lu
> >> Sent: Tuesday, May 27, 2014 10:03
> >> To: openembedded-core@lists.openembedded.org
> >> Subject: [OE-core] [PATCH 1/1] strace: fix ptest execution failure
> >>
> >> Modify ptest suite to make it execute successfully.
> >>
> >> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> >> ---
> >>   meta/recipes-devtools/strace/strace-4.8/run-ptest | 2 +-
> >>   meta/recipes-devtools/strace/strace_4.8.bb        | 6 ++++++
> >>   2 files changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-devtools/strace/strace-4.8/run-ptest
> >> b/meta/recipes-devtools/strace/strace-4.8/run-ptest
> >> index 133cf92..66639fb 100755
> >> --- a/meta/recipes-devtools/strace/strace-4.8/run-ptest
> >> +++ b/meta/recipes-devtools/strace/strace-4.8/run-ptest
> >> @@ -1,2 +1,2 @@
> >>   #!/bin/sh
> >> -make -C tests -k runtest-TESTS
> >> +make -C tests -k check-TESTS
> > I have the same comment as in the previous patch. I'd rather use serial=
-
> tests in configure.ac file instead of this change.
> >
> You mentioned a past patch not merged, can you rebase against master and
> resent if it's still appropriate?
>=20
> Thanks
> 	Sau!
>=20
I'll review and resend the patch I a couple of days.
Regards,
Tudor.
> >> diff --git a/meta/recipes-devtools/strace/strace_4.8.bb b/meta/recipes=
-
> >> devtools/strace/strace_4.8.bb
> >> index 71563d4..9769cd4 100644
> >> --- a/meta/recipes-devtools/strace/strace_4.8.bb
> >> +++ b/meta/recipes-devtools/strace/strace_4.8.bb
> >> @@ -41,6 +41,12 @@ do_compile_ptest() {
> >>
> >>   do_install_ptest() {
> >>   	oe_runmake -C ${TESTDIR} install-ptest BUILDDIR=3D${B}
> >> DESTDIR=3D${D}${PTEST_PATH} TESTDIR=3D${TESTDIR}
> >> +	install ${S}/test-driver ${D}${PTEST_PATH}
> >> +	sed -e 's/bash/sh/' \
> >> +	    -e 's/gawk/awk/' \
> >> +	    -e 's/^top_srcdir =3D \(.*\)/top_srcdir =3D ../' \
> >> +	    -e '/^all:/a\\t@:' \
> >> +	    -i ${D}${PTEST_PATH}/${TESTDIR}/Makefile
> >>   }
> >>
> >>   BBCLASSEXTEND =3D "native"
> >> --
> >> 1.8.1.2
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core

