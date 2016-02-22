Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 18563770A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 09:24:33 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 22 Feb 2016 01:24:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,483,1449561600"; d="scan'208";a="52339288"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by fmsmga004.fm.intel.com with ESMTP; 22 Feb 2016 01:24:32 -0800
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.97]) by
	IRSMSX104.ger.corp.intel.com ([163.33.3.159]) with mapi id
	14.03.0248.002; Mon, 22 Feb 2016 09:24:09 +0000
From: "Istrate, Daniel AlexandruX" <daniel.alexandrux.istrate@intel.com>
To: "Pedraza Gonzalez, Francisco J" <francisco.j.pedraza.gonzalez@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCHv2 2/2] oeqa/selftest/prservice: Added new TC:
	check pr-server starts and stop correctly on localhost.
Thread-Index: AQHRa2HY9X06bhEnhUyA+ThEi0imY583y7Cg
Date: Mon, 22 Feb 2016 09:24:08 +0000
Message-ID: <174AD7CFE5F468498ACCFE3FEE0EF1EB14310440@IRSMSX102.ger.corp.intel.com>
References: <1455919542-28863-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
	<1455919542-28863-2-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
In-Reply-To: <1455919542-28863-2-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiM2M5NmM0YWYtZDY4OS00MWViLTkyZjEtOGJjODEzMjcyYmUzIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6IkxxVnUzMU80ZWhiUGhGbUlnT2FnTW55SFwvWVBnTEZYcVlKTWlLczFpXC81UT0ifQ==
x-ctpclassification: CTP_IC
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: "Pedraza Gonzalez, Francisco J" <francisco.j.pedraza.gonzalez@intel.com>
Subject: Re: [PATCHv2 2/2] oeqa/selftest/prservice: Added new TC:	check pr-server starts and stop correctly on localhost.
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
X-List-Received-Date: Mon, 22 Feb 2016 09:24:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Francisco,

There is no need to check the ret.status of runCmd.
If ret.status is other than 0 runCmd will throw an error.
If you want to catch the ret.status of runCmd when you expect the command t=
o fail you should use runCmd('cmd', ignore_status=3DTrue).

Please make sure you pay close attention to what you are testing here. Leon=
ardo pointed out in the bug that "It is important to notice that the server=
 was CORRECTLY stopped, just the extra message is wrong."
So the server is stopped correctly, you should check only that the extra me=
ssage is not displayed or the correct message is displayed instead.

--Daniel

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Francisco Pedraza
Sent: Saturday, February 20, 2016 00:06
To: openembedded-core@lists.openembedded.org
Cc: Pedraza Gonzalez, Francisco J <francisco.j.pedraza.gonzalez@intel.com>
Subject: [OE-core] [PATCHv2 2/2] oeqa/selftest/prservice: Added new TC: che=
ck pr-server starts and stop correctly on localhost.

This test case validates if prservice start and stop properly the server.
Using bitbake commands also validates the exit status.

[YOCTO #8258]

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/lib/oeqa/selftest/prservice.py | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/prservice.py b/meta/lib/oeqa/selftest/p=
rservice.py
index f22288e..66638de 100644
--- a/meta/lib/oeqa/selftest/prservice.py
+++ b/meta/lib/oeqa/selftest/prservice.py
@@ -9,9 +9,10 @@ import oeqa.utils.ftools as ftools  from oeqa.selftest.bas=
e import oeSelfTest  from oeqa.utils.commands import runCmd, bitbake, get_b=
b_var  from oeqa.utils.decorators import testcase
+from oeqa.utils.network import get_free_port
=20
 class BitbakePrTests(oeSelfTest):
-
+=20
     def get_pr_version(self, package_name):
         pkgdata_dir =3D get_bb_var('PKGDATA_DIR')
         package_data_file =3D os.path.join(pkgdata_dir, 'runtime', package=
_name) @@ -119,3 +120,13 @@ class BitbakePrTests(oeSelfTest):
     @testcase(936)
     def test_pr_service_ipk_arch_indep(self):
         self.run_test_pr_service('xcursor-transparent-theme', 'ipk', 'do_p=
ackage')
+
+    @testcase(1419)
+    def test_stopping_prservice_message(self):
+        port =3D get_free_port()
+
+        runCmd('bitbake-prserv --host localhost --port %s --loglevel=3DDEB=
UG --start' % port)
+        ret =3D runCmd('bitbake-prserv --host localhost --port %s=20
+ --loglevel=3DDEBUG --stop' % port)
+
+        self.assertEqual(ret.status, 0)
+
--
2.5.0

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

