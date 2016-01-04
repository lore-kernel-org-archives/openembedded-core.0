Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B72F56067C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 13:45:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 04 Jan 2016 05:45:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,520,1444719600"; d="scan'208";a="853161813"
Received: from irsmsx105.ger.corp.intel.com ([163.33.3.28])
	by orsmga001.jf.intel.com with ESMTP; 04 Jan 2016 05:45:45 -0800
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.131]) by
	irsmsx105.ger.corp.intel.com ([169.254.7.104]) with mapi id
	14.03.0248.002; Mon, 4 Jan 2016 13:45:44 +0000
From: "Istrate, Daniel AlexandruX" <daniel.alexandrux.istrate@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCHv2] oe-selftest: Improved --list-classes when
	determining test names
Thread-Index: AQHRRvWQit79AB8bLkCde2eTfIgWbp7rXe0A
Date: Mon, 4 Jan 2016 13:45:44 +0000
Message-ID: <174AD7CFE5F468498ACCFE3FEE0EF1EB142F6E84@IRSMSX102.ger.corp.intel.com>
References: <1451915036-9767-1-git-send-email-daniel.alexandrux.istrate@intel.com>
In-Reply-To: <1451915036-9767-1-git-send-email-daniel.alexandrux.istrate@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNTZmMTM1MGYtNWUzYi00MTRmLWIyYWQtOTBlMGRlZmQ5NWYzIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX1BVQkxJQyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxNS40LjEwLjE5IiwiVHJ1c3RlZExhYmVsSGFzaCI6InZGM01ScWwzMnNtZkFLWGZMc3NxaG1CZkJKem9OR0JYXC9hS3BSUXY3ZTlJPSJ9
x-ctpclassification: CTP_PUBLIC
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCHv2] oe-selftest: Improved --list-classes when determining test names
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
X-List-Received-Date: Mon, 04 Jan 2016 13:45:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Used callable() instead of hasattr().

-----Original Message-----
From: Istrate, Daniel AlexandruX=20
Sent: Monday, January 4, 2016 15:44
To: openembedded-core@lists.openembedded.org
Cc: Istrate, Daniel AlexandruX <daniel.alexandrux.istrate@intel.com>
Subject: [PATCHv2] oe-selftest: Improved --list-classes when determining te=
st names

--list-classes does a weak validation when determining test names:
(if method.startswith("test_") which could report any class attribute that =
starts with 'test_' as a valid test case.

This fix checks that the class attribute that starts with 'test_'
is also callable (is a method).

Fix for [YOCTO #8862]

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 scripts/oe-selftest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest index 08a5af3..1aee0=
57 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -404,7 +404,7 @@ def main():
                         if isinstance(t, type(oeSelfTest)) and issubclass(=
t, oeSelfTest) and t!=3DoeSelfTest:
                             print " --", v
                             for method in dir(t):
-                                if method.startswith("test_"):
+                                if method.startswith("test_") and callable=
(vars(t)[method]):
                                     print " --  --", method
=20
                 except (AttributeError, ImportError) as e:
--
2.1.0


