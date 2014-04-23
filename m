Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E347B65D78
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 09:27:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Apr 2014 02:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,910,1389772800"; d="scan'208";a="497943153"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by orsmga001.jf.intel.com with ESMTP; 23 Apr 2014 02:27:23 -0700
Received: from irsmsx153.ger.corp.intel.com (163.33.192.75) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Wed, 23 Apr 2014 10:26:21 +0100
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.183]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.50]) with mapi id
	14.03.0123.003; Wed, 23 Apr 2014 10:26:21 +0100
From: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: oe-selftest developer oriented improvements
Thread-Index: Ac9ezDUTM3PgP7mMTAmWhXLdaavYDw==
Date: Wed, 23 Apr 2014 09:26:21 +0000
Message-ID: <33115ABC4887814E8A92A08FBC93416B0A254DBE@IRSMSX103.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: oe-selftest developer oriented improvements
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
X-List-Received-Date: Wed, 23 Apr 2014 09:27:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

During the 1.6 development/testing cycle we introduced and used oe-selftest=
 more and more for QA purposes to identify various issues in the master bra=
nch. For those who don't know yet what is oe-selftest, it is a python unit =
test based testing framework designed to simulate poky external usage patte=
rns. What we basically do is translate test case steps into python classes =
and methods. This is useful both in reducing QA workload and the coverage o=
f our tests. For more information please visit the oe-selftest wiki page: h=
ttps://wiki.yoctoproject.org/wiki/Oe-selftest=20

What we would like oe-selftest to be useful with as well is helping develop=
ers quickly test their patches before submission. With this in mind, we cam=
e up with some ideas but we also encourage everyone to contribute with thei=
rs.

Test suites can be created from existing automated tests and accessed using=
 command-line options. For example, using 'oe-selftest --test-suite type=3D=
recipe target=3Dman' would test the recipe man and 'oe-selftest --test-suit=
e type=3Dclass target=3Dbuildhistory' would test the buildhistory class.

1)   Testing recipes updates or new recipes

Even though we cannot test every single scenario or the functionality of a =
recipe, we could create a test suite that would:
- build the recipe with all major architectures(qemux86, qemux86-64, qemuar=
m, qemuppc, qemumips)
- rebuild the recipe from sstate(with or without a sstate file for the reci=
pe)
- perform cleaning operations on the recipe(cleansstate)
- force all major tasks on the recipe (bitbake -C <task> <recipe>)
- selectively use each combination of .bbappend files with the recipe; all =
the combinations should not break the recipe build.
- we could also create mini test suites just for some of these tests like t=
esting only the rebuild from sstate.
(any experience from common recipe build fails can be helpful here)

2)  Testing classes

This is tricky. There is no general testing pattern to test all classes as =
they provide different functionality. Because of this we should have specif=
ic tests for each class or set of classes.  Also when updating a class, the=
 developer could add new tests or update the old ones. The tests used here =
should be straightforward and well documented.
Also I believe it's desired to have tests(even rudimentary ones) for all oe=
-core features and this could help push this forward.

3)  Stress testing=20

There were scenarios where sometimes a recipe would fail to build due to a =
race condition. We could create tests that run in a configurable number of =
build directories at a time with a specific number of threads and parallel =
make. For example, on a 8 threaded machine we could have 3 builds with 4 th=
reads and parallel make each run in parallel building the same recipe oven =
and over until it fails.=20

I hope many of you have made it to this line and hope to hear your feedback=
(comments, additions or new ideas). Based on it we will introduce the menti=
oned functionality or not.

Thank you again for the time!
Regards,
Corneliu
Yocto QA

