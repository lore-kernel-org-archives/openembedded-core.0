Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 5BA846B260
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 22:20:38 +0000 (UTC)
Received: from SESTOEX05.enea.se ([fe80::41cb:8d2e:2e90:a183]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.02.0318.001; Fri, 19 Jul 2013 00:20:32 +0200
From: Tudor Florea <Tudor.Florea@enea.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] Install Python test suite and run it as ptest.
Thread-Index: AQHOgoIFcOVfd44B0UqQYpJWluhdKJlqEioAgADyATA=
Date: Thu, 18 Jul 2013 22:20:31 +0000
Message-ID: <26724FB0BFCB3D4C91BDE184751AA3A4289005CB@sestoex05.enea.se>
References: <1374019772-63941-1-git-send-email-tudor.florea@enea.com>
	<3508255.N7Chy3QYdi@helios>
In-Reply-To: <3508255.N7Chy3QYdi@helios>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.1.188]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Install Python test suite and run it as ptest.
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
X-List-Received-Date: Thu, 18 Jul 2013 22:20:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Paul,
Thank you for review and tip.
I'll come up with V2 patch soon.
Regards,
  Tudor.

-----Original Message-----
From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]=20
Sent: Thursday, July 18, 2013 10:51
To: Tudor Florea
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] Install Python test suite and run it as ptes=
t.

Hi Tudor,

On Wednesday 17 July 2013 02:09:32 Tudor Florea wrote:
>...
> +++ b/meta/recipes-devtools/python/python/run-ptest
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +#
> +#This script is used to run python test suites
> +
> +make -f /usr/lib/python/ptest/Makefile -k runtest-TESTS
> srcdir=3D/usr/lib/python2.7 TESTPROG=3D/usr/lib/python2.7/test/regrtest.p=
y |
> sed -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g'
> -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\.
> ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'=20

The run-ptest script here has hardcoded /usr/lib/ for ${libdir} (which can =
and=20
is changed in some distro configurations), we should ideally avoid this e.g=
.=20
through use of sed in do_install after installing the file.

>...
> +RDEPENDS_${PN}-ptest =3D "${PN}-json ${PN}-crypt ${PN}-unittest ${PN}-di=
fflib
> ${PN}-pprint ${PN}-shell ${PN}-tests ${PN}-misc ${PN}-netclient
> ${PN}-mailbox ${PN}-pkgutil ${PN}-profile ${PN}-compile ${PN}-pydoc
> ${PN}-robotparser ${PN}-netserver ${PN}-datetime ${PN}-compression
> ${PN}-mime ${PN}-audio ${PN}-db ${PN}-resource ${PN}-image ${PN}-subproce=
ss
> ${PN}-doctest ${PN}-numbers ${PN}-html ${PN}-email ${PN}-distutils
> ${PN}-hotshot ${PN}-2to3 ${PN}-mmap ${PN}-terminal ${PN}-xmlrpc ${PN}-smt=
pd
> ${PN}-unixadmin ${PN}-compiler"=20

Could the ptest package simply depend on ${PN}-modules rather than having a=
n=20
additional hardcoded list of modules packages? It looks like this could be=
=20
replaced by:

RDEPENDS_${PN}-ptest =3D "${PN}-modules ${PN}-misc"

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

