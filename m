Return-Path: <mazliana.mohamad@intel.com>
X-Greylist: delayed 325 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 11 Mar 2019 09:07:03 UTC
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A9DEA7CE64
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 09:07:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Mar 2019 02:03:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,467,1544515200"; d="scan'208";a="327448981"
Received: from pgsmsx104.gar.corp.intel.com ([10.221.44.91])
	by fmsmga005.fm.intel.com with ESMTP; 11 Mar 2019 02:03:55 -0700
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.121]) by
	PGSMSX104.gar.corp.intel.com ([169.254.3.40]) with mapi id
	14.03.0415.000; Mon, 11 Mar 2019 17:03:54 +0800
From: "Mohamad, Mazliana" <mazliana.mohamad@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] scripts/resulttool: Enhance retrieving test cases value
Thread-Index: AQHU1+kZjoOkLBG+kke0NrxMbpdSwaYGIrqw
Date: Mon, 11 Mar 2019 09:03:54 +0000
Message-ID: <A974252CAD7AF945AB1D34185A2045050293D861@PGSMSX105.gar.corp.intel.com>
References: <1552293034-65821-1-git-send-email-mazliana.mohamad@intel.com>
	<1552293034-65821-2-git-send-email-mazliana.mohamad@intel.com>
In-Reply-To: <1552293034-65821-2-git-send-email-mazliana.mohamad@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOWM3ZmYyNDctOWY5NS00MzhmLTgxYjItM2YyOWUzMDQwZGVlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidE1sME5wN0s1WFVITUlcL2VvTFpuenNzMjBMRk1cL1pkUnhwN1BENnh1QzZIcklDQWoxRjl5c1UyNlBOaE1kNmJrIn0=
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH] scripts/resulttool: Enhance retrieving test cases value
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
X-List-Received-Date: Mon, 11 Mar 2019 09:07:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Apologize, please ignore this email

-----Original Message-----
From: Mohamad, Mazliana=20
Sent: Monday, March 11, 2019 4:31 PM
To: openembedded-core@lists.openembedded.org
Cc: Mohamad, Mazliana <mazliana.mohamad@intel.com>; Yeoh, Ee Peng <ee.peng.=
yeoh@intel.com>
Subject: [PATCH] scripts/resulttool: Enhance retrieving test cases value

From: Mazliana <mazliana.mohamad@intel.com>

We found that manualexecution does not capture test suite values correctly =
if there are more than one test suite in test cases.
After verification has made we found out we should retrieved full test case=
s value <test_module.test_suite.test_case> from oeqa/manual/ json file rath=
er than split it them into new variables test_suite and test_cases.

Signed-off-by: Mazliana <mazliana.mohamad@intel.com>
---
 scripts/lib/resulttool/manualexecution.py | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/result=
tool/manualexecution.py
index a44cc86..6487cd9 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -29,8 +29,7 @@ class ManualTestRunner(object):
     def __init__(self):
         self.jdata =3D ''
         self.test_module =3D ''
-        self.test_suite =3D ''
-        self.test_cases =3D ''
+        self.test_cases_id =3D ''
         self.configuration =3D ''
         self.starttime =3D ''
         self.result_id =3D ''
@@ -38,11 +37,10 @@ class ManualTestRunner(object):
=20
     def _get_testcases(self, file):
         self.jdata =3D load_json_file(file)
-        self.test_cases =3D []
+        self.test_cases_id =3D []
         self.test_module =3D self.jdata[0]['test']['@alias'].split('.', 2)=
[0]
-        self.test_suite =3D self.jdata[0]['test']['@alias'].split('.', 2)[=
1]
         for i in self.jdata:
-            self.test_cases.append(i['test']['@alias'].split('.', 2)[2])
+            self.test_cases_id.append(i['test']['@alias'])
    =20
     def _get_input(self, config):
         while True:
@@ -81,10 +79,9 @@ class ManualTestRunner(object):
=20
     def _execute_test_steps(self, test_id):
         test_result =3D {}
-        testcase_id =3D self.test_module + '.' + self.test_suite + '.' + s=
elf.test_cases[test_id]
         total_steps =3D len(self.jdata[test_id]['test']['execution'].keys(=
))
         print('-----------------------------------------------------------=
-------------')
-        print('Executing test case:' + '' '' + self.test_cases[test_id])
+        print('Executing test case:' + '' '' +=20
+ self.test_cases_id[test_id])
         print('-----------------------------------------------------------=
-------------')
         print('You have total ' + str(total_steps) + ' test steps to be ex=
ecuted.')
         print('-----------------------------------------------------------=
-------------\n')
@@ -105,9 +102,9 @@ class ManualTestRunner(object):
                         res =3D result_types[r]
                         if res =3D=3D 'FAILED':
                             log_input =3D input('\nPlease enter the error =
and the description of the log: (Ex:log:211 Error Bitbake)\n')
-                            test_result.update({testcase_id: {'status': '%=
s' % res, 'log': '%s' % log_input}})
+                           =20
+ test_result.update({self.test_cases_id[test_id]: {'status': '%s' %=20
+ res, 'log': '%s' % log_input}})
                         else:
-                            test_result.update({testcase_id: {'status': '%=
s' % res}})
+                           =20
+ test_result.update({self.test_cases_id[test_id]: {'status': '%s' %=20
+ res}})
                 break
             print('Invalid input!')
         return test_result
--
2.7.4


