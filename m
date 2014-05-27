Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id AB0966F4F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 09:05:44 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0158.001; Tue, 27 May 2014 11:05:44 +0200
From: Tudor Florea <Tudor.Florea@enea.com>
To: Chong Lu <Chong.Lu@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1][V2] ethtool: fix ptest execution failure
Thread-Index: AQHPeU0nB2iv93xCN0e4916l21VhrptUFI3w
Date: Tue, 27 May 2014 09:05:44 +0000
Message-ID: <26724FB0BFCB3D4C91BDE184751AA3A428A49820@SESTOEX04.enea.se>
References: <cover.1401154906.git.Chong.Lu@windriver.com>
	<1b730d155fa4bc1c464fa84ea934ed40391ddafa.1401154906.git.Chong.Lu@windriver.com>
In-Reply-To: <1b730d155fa4bc1c464fa84ea934ed40391ddafa.1401154906.git.Chong.Lu@windriver.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.14.201]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1][V2] ethtool: fix ptest execution failure
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
X-List-Received-Date: Tue, 27 May 2014 09:05:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Chong Lu
> Sent: Tuesday, May 27, 2014 04:44
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/1][V2] ethtool: fix ptest execution failure
>=20
> Modify ptest suite to make it enabled on new version.
>=20
> --- a/meta/recipes-extended/ethtool/ethtool/run-ptest
> +++ b/meta/recipes-extended/ethtool/ethtool/run-ptest
> @@ -1,2 +1,2 @@
>  #!/bin/sh
> -make -k runtest-TESTS
> +make -k check-TESTS
[Tudor Florea] I don't think this is the good approach.
The concept of ptest  is to split "check" target testing into building part=
 executed on host machine and then running part on the target. (as per http=
s://wiki.yoctoproject.org/wiki/Ptest#Building_the_test_suite  )
My impression is that with this patch we are shifting this approach.

I  know that this patch http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree=
/meta/recipes-devtools/automake/automake/buildtest.patch ) does not produce=
 "buildtest-TESTS" and "runtest-TESTS" targets because automake use now par=
allel testing by default.

Having said that  the real solution for issue like this is another (quite c=
hallenging) patch in automake along with the above one to deal with paralle=
l testing hence leave the tested package recipe (e.g. ethtool) untouched.

The short term solution might be to avoid parallel testing for this package=
.
In yocto, with cross-testing environment we use are not taking (yet) any be=
nefits of the parallel building environment.

I have sent a while back a patch for this package but  for some reason it w=
as not merged:
+++ b/meta/recipes-extended/ethtool/ethtool-3.12.1/use_serial_tests.patch
@@ -0,0 +1,20 @@
+ptest needs buildtest-TESTS and runtest-TESTS targets.
+serial-tests is required to generate those targets.
+
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+Upstream-Status: Inappropriate=20
+(default automake behavior incompatible with ptest)=20
+
+diff -ruN a/configure.ac b/configure.ac
+--- a/configure.ac	2013-12-03 10:37:40.773157142 +0100
++++ b/configure.ac	2013-12-03 10:37:21.521992831 +0100
+@@ -2,7 +2,7 @@
+ AC_INIT(ethtool, 3.12.1, netdev@vger.kernel.org)
+ AC_PREREQ(2.52)
+ AC_CONFIG_SRCDIR([ethtool.c])
+-AM_INIT_AUTOMAKE([gnu])
++AM_INIT_AUTOMAKE([gnu serial-tests])
+ AC_CONFIG_HEADERS([ethtool-config.h])
+=20
+ AM_MAINTAINER_MODE


