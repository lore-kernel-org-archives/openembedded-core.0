Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B18C25B74
	for <webhook@archiver.kernel.org>; Sat, 18 May 2024 10:49:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16467.1716029351446639879
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 May 2024 03:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=58680a6e36=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44IAU1xL024103
	for <openembedded-core@lists.openembedded.org>; Sat, 18 May 2024 10:49:10 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y6ka608a4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 18 May 2024 10:49:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXWVGjQ61mheOVXzpsyOMVMlEUgD2ztgfXx9p+GrRqAPv/9qX7DFwIxPxmmTBQECYjnfyGjg3YSBafvYYobLFEvkOq4ivm06yi99y4fFr7EY+/xw13WNDdhLK3hvwNbnHmX5kpg3Kf9wz9mGqCfCMzpXEb/hZLUghe5PsD5duO7nP/SK6K9nie5UxOZA+ijHEpg4khUlunNHAntstARRbaEE32WxhnaStF2uy288WaHMpB45wilW79rntRTgKTU54hum0j918/PUSzFSg3r+YAPWEerceFU9dIeJIVmKEnwZ4HWvPgM7df295RU6nBBWLY5jtv9cdHU2FPp6bSPsgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGI/AQ4F1eQcOvzU86nFqk1/nXyWcaS/O3yqusqdF+M=;
 b=R0XLHPgANH0wBOE7fxdxQJUbfHp1vP2DA1PX34E4UoO0qdkhbruGIbhUZjFxU5pkXEsoJtY0oKx3TLR4snwBDpA6zBfZ7rnQQ0RzUAScRmpTgFgdIab1aDZ11HyGOoCAJ3m0yVehi1+MyUbaRE2eQwwQLZH8ITDKasatGw3UwElcO3ulBK5WHbCKRbZ11v+DOrt6ugdRHqbe4S44T1jpkKWMDMD6ZKNr1bz+phMDqWR2BfLwb9Wppyu6oS0lkImsKTzXMaVx5jGL4jtThYDZlLqZZL2KS7N6AHTDV/EEP30HceyHszXURe1nrHMb4LMSECPO3YmNFJHXnGuLLpZb8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14)
 by PH7PR11MB6746.namprd11.prod.outlook.com (2603:10b6:510:1b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Sat, 18 May
 2024 10:49:08 +0000
Received: from SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7a00:833c:79b:5e48]) by SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7a00:833c:79b:5e48%5]) with mapi id 15.20.7587.028; Sat, 18 May 2024
 10:49:08 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libcap-ng: upgrade 0.8.4 -> 0.8.5
Date: Sat, 18 May 2024 18:48:53 +0800
Message-Id: <20240518104854.2524611-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYXPR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:403:a::15) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7489:EE_|PH7PR11MB6746:EE_
X-MS-Office365-Filtering-Correlation-Id: f1024815-f165-446a-fc10-08dc772823c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|52116005|366007|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ym6cRPgDRqic2e85VGJ10Kqv0Tjk3DUbc7nCGnX0TQ7wfPR+eOdONlZ2VT7u?=
 =?us-ascii?Q?tvgTFTfuAR9PA3IcplCGeIe8WyrjRWgn9tPs1ftAVZMqaPCUqVCXTR0vms+K?=
 =?us-ascii?Q?nuTGvu7XOyDY9Wq2EcV0Zc300LiqQVWReDVdzeuJSc6mEsFS+saKFScOYgOc?=
 =?us-ascii?Q?4gBVSjxFpk8C/6dCwJqnSckLkLoTJXncqy2zUNTuDo3se3s6ctA80ArrCYN9?=
 =?us-ascii?Q?lQphgmvIDidMKAgE434LX+9Go3VKoiPsgtixkgDbIFU1jJnsRg1rQR4p2QEb?=
 =?us-ascii?Q?9d4NwQvqUyEBXQmdvd7ASUaEx+GqMpjfkSWMrhl4twdfIWULW8BBmxonNX4L?=
 =?us-ascii?Q?ZMLotWaBCfmjQ6wiY3zFSYSK25AeuIUFOVU8AlGFO/BD7xOuQ9iA/mbwkir0?=
 =?us-ascii?Q?AJ5GG7qyjTtBuC6y8+bnKPHh4/LdmiJoUF0MaR4qxXQewh/q166bMR9MhFIV?=
 =?us-ascii?Q?omqQ12gD+FViThooEH683DM/KzZK9qQNl/VRPQymMicXJQbq1qOt1DoMMeXT?=
 =?us-ascii?Q?XtPd+I050258QxfOBRKK8SPZzIlj37X16d3droiT+dbV7W+N3cp6YtSGbwh7?=
 =?us-ascii?Q?rLoz4fdVAYbNCHYn8+AV9OkdmXtHo/mBlQ9q4kxD9/74UX+7SyMucdADZ7Z9?=
 =?us-ascii?Q?u5W+Cc2X3NBpw4THEJWmSaQwMeT+q088oMgbKngTO0xiocKIU6Tt7BLeXjVt?=
 =?us-ascii?Q?3qAKka2pjgqRnctg+XKdtLhbgiz4YWKGvFWTCz/QiHsxIVsg8CELlS05fdeX?=
 =?us-ascii?Q?Zb2CeSptdnb2870jx0ic7P1Vvuf/+UdLSHBlVVYnr1V4qUYMm3MKCFF+1y8o?=
 =?us-ascii?Q?D4tHfYdADnj665H+1F7yERjZehR+thPtljdvTpLU4/gpR0QNtMkqGAenWmIQ?=
 =?us-ascii?Q?cF4iLeYw8kGgZoCLkTxa/EpjxXNPJ2axgvIL3UWmcYPL/blRdeMaPVFrfP6C?=
 =?us-ascii?Q?d1ep+uqiV/YTCR7MBpPZG9FO1seAjhhaMqppRf1hGbuaESiDHRDzwZ+Znjc3?=
 =?us-ascii?Q?j4c/eHgD77NMbAX/OG4lj2ybkP7hAgSUXJaOowp9K1qxJkRjyod3/715exI9?=
 =?us-ascii?Q?SBEwonVJEAf7YYeUoWkN8v+IR8cgoWYi4+e8OgLhoSn6LzS/kSxd/qe5bOwL?=
 =?us-ascii?Q?yqsjZeolblHlROwqxHWzlgtLLC3e9JW5OwT6OvtBPDUn+TQUNFpJaB35Ttpk?=
 =?us-ascii?Q?mwWemBc9JRIXF/U37yKU1SHYIkMjABrXpc/evh+SAs6uw3V80LmHTAAEuTUJ?=
 =?us-ascii?Q?hvf0GDKTbLdmfMzBDKUDRddQgP32+GnrCNwwoshwWUrv3rMSYqRr+odcIXyq?=
 =?us-ascii?Q?TV4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7489.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(366007)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/urv1f4JSEUG1Y5YwaiDS6iAQQ89zLI24C9XpVe5a6gwPIDMvYUAHAMCu/6p?=
 =?us-ascii?Q?LMF4YYnsthrVm1YHj/xBDqWtyu7SZrbLH5nSX0JLp9Rjs08/SNaxyuK2zmoE?=
 =?us-ascii?Q?QxeVQmumpj6R0muAphGydIkm21afgITHWfGWMbzqO1jwKhYUaFOfA1X0eDdE?=
 =?us-ascii?Q?4Qg/+PUwR6zNqiOTpjZ4ZYb6WAVXKQI0M9l8fstj+zfnkefkiFck+bYBw0jK?=
 =?us-ascii?Q?ZSnE3xfyfOV5NsyMfk/yq3OnGstCOhIerMKBsGsMkIccA1zKwwtGRjcmNWNG?=
 =?us-ascii?Q?QcfntgBVAcy/ghigofpYb+kLGBsoi9qU7dSGDB2ohCp0Z/3qMTb480bUhq24?=
 =?us-ascii?Q?X3FRerRZ9XexK5XO1UPDEsfszM4Wo4UGsbaLspyGDCF6+nCXXVuePM1civUj?=
 =?us-ascii?Q?vecY9/dZLb5e2zTDOudws1pHAqLBtDc9BP9YwMkoUGXh6PZD40Hm8Wa+jQqW?=
 =?us-ascii?Q?seqjre5kklkg72QstTFlp4ZpkQw+3XIVZS6D5fx7wJaEWKtJFM2hFvIGd/G3?=
 =?us-ascii?Q?QGnzEqgWoTbxlxU5pDQSDwtp6neQ2cLLfgPWTSwUP4NKbz9kEucXEJLs0txX?=
 =?us-ascii?Q?XFeKcw/hZVIPTHU+eY3pRkNrh2l6E6/SuNZLihd7DEIIQu93hIdE1xeCzPvY?=
 =?us-ascii?Q?HIqYEt4uZS4e8En/3blH8kY4eFr04MFPiR1Z5/g2NZd+DOFchLxaah7vBekq?=
 =?us-ascii?Q?3sJ5IcpPt/dZT5KynBT6xRAtnUvsQ8ncrHqv5A13vn4nlXbn8uwPTr5D74bY?=
 =?us-ascii?Q?VjB7n6pwM5pbL7MnElwNZuJZA84l1YytEkZD6KAUdCad2jzwXM75Gfn9cgxe?=
 =?us-ascii?Q?PzjxMzu9D/MU4obC3KKVVv5C10ubj63E3hvCyHwI3QSLuedDMEUUEZY8erAL?=
 =?us-ascii?Q?j+TteFssqoqGKaYnXtyF4Y2h0BEzxtk6RO6RPhCjatDCFiXeebi6mXh1Dsac?=
 =?us-ascii?Q?HdVMwnV4CIpy9RUV3gdxgwS6P/Tow50RFwBUI4mlkU2wYZg6pjDvLqTsfB8W?=
 =?us-ascii?Q?O6GepkyKyMy4vJ5HPQ/F10AAwV4KExN7iJP5+d/7dKcy21GeodLIwdLWG6JR?=
 =?us-ascii?Q?+zmepSs0A/51ODrMScyJ3T9do1hwJgHv/H4rAXQRO7x0O16Soj+8VJa//QFh?=
 =?us-ascii?Q?PBKcKGzqWjpKosBsuZoO2Vz6t7zHf0mkUZtES6uSy1BM+l6fN6AzSIv3grm0?=
 =?us-ascii?Q?XSvYC+ZNgwzE20QfeTVou3+6AJcysnSvU4nlu2QASG7og6+PuY+Ca3Sgz8y8?=
 =?us-ascii?Q?NJHjra230DZGjW/WM6OIo4iIH3kF+58aMjo8mQpQTMQqpvpu9U19srzZWo2c?=
 =?us-ascii?Q?AIWkZ2vsgcjbnY4ruN2lQiEEoRwAQgjtCdfrYP2KssVNyJbTobEj8erfXKUS?=
 =?us-ascii?Q?FIap5CAJ/47hjdhEDrgeaaHSxdQ2ceVqIUUD92/C/SqhtEoABw94dpc7++R3?=
 =?us-ascii?Q?rPZEYYtZTAEcTCe6Ncg4OjBgGKW5N5dvJs+YIxcT67KOW3jTautACHHJs6Mr?=
 =?us-ascii?Q?aAfyjQmPwSyLgurdAQhklaIKS/RaKrNH+XkzsxIoshZ06KYVhmwrkEG+CMKg?=
 =?us-ascii?Q?s9JB3ajap/o99TKzwoOSdfXQL9Q5nX27of0MP+A+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1024815-f165-446a-fc10-08dc772823c7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2024 10:49:08.4962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMk9dWuuXYZXBH2IhTHkWPOls3DNpED/nle8cFRVQU50t6XI6268i/tYHvQ8PfHkdzySAbO+InPiVDh3ICJB6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6746
X-Proofpoint-GUID: smZ-ea42HcXdLnN1iDOaWSkOCQy4Vc0o
X-Proofpoint-ORIG-GUID: smZ-ea42HcXdLnN1iDOaWSkOCQy4Vc0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-18_05,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 bulkscore=0 mlxlogscore=845
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405180080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 May 2024 10:49:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199535

Changelog:
https://people.redhat.com/sgrubb/libcap-ng/ChangeLog

 - Remove python global exception handler since it's deprecated
 - Make the utilities link against just built libraries
 - Remove unused macro in cap-ng.h

Drop backport patch fix-issues-with-swig-4-2.patch.
Backport a patch to fix build for libcap-ng-python.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...hon-path-when-invoking-py-compile-54.patch | 34 +++++++++++++++++++
 .../files/fix-issues-with-swig-4-2.patch      | 32 -----------------
 meta/recipes-support/libcap-ng/libcap-ng.inc  |  4 +--
 ...{libcap-ng_0.8.4.bb => libcap-ng_0.8.5.bb} |  0
 4 files changed, 36 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-support/libcap-ng/files/0001-Fix-python-path-when-invoking-py-compile-54.patch
 delete mode 100644 meta/recipes-support/libcap-ng/files/fix-issues-with-swig-4-2.patch
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.8.4.bb => libcap-ng_0.8.5.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/files/0001-Fix-python-path-when-invoking-py-compile-54.patch b/meta/recipes-support/libcap-ng/files/0001-Fix-python-path-when-invoking-py-compile-54.patch
new file mode 100644
index 0000000000..a0452ad53d
--- /dev/null
+++ b/meta/recipes-support/libcap-ng/files/0001-Fix-python-path-when-invoking-py-compile-54.patch
@@ -0,0 +1,34 @@
+From 1fe7c1cfeea00ba4eb903fbb39b74361594d4835 Mon Sep 17 00:00:00 2001
+From: Jan Palus <jpalus@fastmail.com>
+Date: Wed, 10 Apr 2024 21:30:51 +0200
+Subject: [PATCH] Fix python path when invoking py-compile (#54)
+
+48eebb2 replaced custom PYTHON3 variable with PYTHON by using standard
+AM_PATH_PYTHON macro. Makefile however still referred to old one.
+There's no need to set PYTHON explicitly anymore so drop it.
+
+Fixes #53
+
+Upstream-Status: Backport
+[https://github.com/stevegrubb/libcap-ng/commit/1fe7c1cfeea00ba4eb903fbb39b74361594d4835]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ bindings/python3/Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/bindings/python3/Makefile.am b/bindings/python3/Makefile.am
+index 70a1dd8..6072fc2 100644
+--- a/bindings/python3/Makefile.am
++++ b/bindings/python3/Makefile.am
+@@ -27,7 +27,6 @@ AM_CPPFLAGS = -I. -I$(top_builddir) $(PYTHON3_INCLUDES)
+ LIBS = ${top_builddir}/src/libcap-ng.la
+ SWIG_FLAGS = -python
+ SWIG_INCLUDES = ${AM_CPPFLAGS}
+-PYTHON = $(PYTHON3)
+ pyexec_PYTHON = capng.py
+ pyexec_LTLIBRARIES = _capng.la
+ pyexec_SOLIBRARIES = _capng.so
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libcap-ng/files/fix-issues-with-swig-4-2.patch b/meta/recipes-support/libcap-ng/files/fix-issues-with-swig-4-2.patch
deleted file mode 100644
index fb424fe725..0000000000
--- a/meta/recipes-support/libcap-ng/files/fix-issues-with-swig-4-2.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 355eada2d20886287cffc16e304087dd6f66ae37 Mon Sep 17 00:00:00 2001
-From: Steve Grubb <ausearch.1@gmail.com>
-Date: Thu, 4 Jan 2024 15:06:29 -0500
-Subject: [PATCH] Remove python global exception handler since its deprecated
-
-Upstream-Status: Backport [https://github.com/stevegrubb/libcap-ng/commit/30453b6553948cd05c438f9f509013e3bb84f25b]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- bindings/src/capng_swig.i | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/bindings/src/capng_swig.i b/bindings/src/capng_swig.i
-index fcdaf18..fa85e13 100644
---- a/bindings/src/capng_swig.i
-+++ b/bindings/src/capng_swig.i
-@@ -30,13 +30,6 @@
- 
- %varargs(16, signed capability = 0) capng_updatev;
- 
--%except(python) {
--  $action
--  if (result < 0) {
--    PyErr_SetFromErrno(PyExc_OSError);
--    return NULL;
--  }
--}
- #endif
- 
- %define __signed__
--- 
-2.43.2
-
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 845b7c2f0a..12b4002d11 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -8,10 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 SRC_URI = "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
-           file://fix-issues-with-swig-4-2.patch \
+           file://0001-Fix-python-path-when-invoking-py-compile-54.patch \
            "
 
-SRC_URI[sha256sum] = "68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a"
+SRC_URI[sha256sum] = "3ba5294d1cbdfa98afaacfbc00b6af9ed2b83e8a21817185dfd844cc8c7ac6ff"
 
 EXTRA_OECONF:append:class-target = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
 EXTRA_OECONF:append:class-nativesdk = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb
-- 
2.25.1


