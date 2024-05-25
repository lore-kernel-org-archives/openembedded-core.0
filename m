Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 758F5C25B78
	for <webhook@archiver.kernel.org>; Sat, 25 May 2024 05:04:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5817.1716613452160619296
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 22:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=58759ab0a9=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44P51mp6004556
	for <openembedded-core@lists.openembedded.org>; Sat, 25 May 2024 05:04:11 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yb56x84s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 25 May 2024 05:04:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oD08pjoiUi7XOvJKjECWFOXrZYl4Z2RNlv3YoTdXvs87QhSo39h/4TkJ0PhEd6Ua5wQk9bq52CLDvSJiZCt1opgLAcdFCKvo6+FpUK0r7dO45sPbPv/cgw2Ztjmdu5/0NW/h/6hwWceSdwctAz6Pz6CFz5idt/jxz5T3UTe16M5LnpVB6rk/4rIdaz1WaYCaWw5aF7WPSvZ9/a0tJN/sRW756jcwNm8KP7yhAS7Hu/Az42qY971M6Lda0MGrtu0/2raNlK0enI/YF0RvQaOIasDx7DKvYvLs3nEviO/bWlXkyUuQgt21m1sFBTm1sXPMHIpWJsGex+zoqJiUWPipEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/l++x6iwexPjD+nsmvohN80tw1Bt1ApQ5Z/IJxAwK/U=;
 b=OKuDShuMiFPWreBrp6n7yn5C1RSIF8zz8HgFetDUpVvUk+0knIcInu0odjAABEf+Q33icynlR9ulRdzRkf/u/vfJoBH8KKDH5S9CnGmbAUX/gQmGRLie47eJ2JboUqYkLEGav1/QkgxBS0zyPRp7hlNWijc4pxQDYey/ri4gx7TyMQcp3TfF8uyL9sLyPufQOYw27O6JK0gk2SiLsrf+sV73A6fCH7pkqqOHQQJPY7XuD6LEZG1b68w3PGilS4rFepBvUgB9CFe2yQIO9UkqT6E2SlTra8Lj9UerAlEui/W6euYj36BmHoiaWfCkYjEYaYvOT9EpFpgMHCMlPDIDqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB6403.namprd11.prod.outlook.com (2603:10b6:510:1f9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.26; Sat, 25 May
 2024 05:04:04 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7611.025; Sat, 25 May 2024
 05:04:04 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] util-linux/util-linux-libuuid: upgrade from 2.39.3 to 2.40.1
Date: Sat, 25 May 2024 13:03:48 +0800
Message-Id: <20240525050348.2443339-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:404:56::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: bb92134e-9721-4edb-fd75-08dc7c781940
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|1800799015|52116005|366007|376005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ft1BGh8a5zCNWFhCjPDbip0pcyJ23U8UBD9rRolo0aTjfVWsJPhK1M27rnSJ?=
 =?us-ascii?Q?id7p0LnzILzIIoOd8UomvO2YdbqCyDiY1ro9ikphZm3hgZ+fgT2qNb7xOeR3?=
 =?us-ascii?Q?A8l8f3l65vHS6kO25BCca1j4E5m3xM4SE3hh/sSy1xpLdCAvoIPKqqxfnJSB?=
 =?us-ascii?Q?z8VMTZX2V+alofUn4pFV7Oe+3IYDbgY6jX+DZ/pmCskR6yXPOV1rMtaBOhMG?=
 =?us-ascii?Q?cz8CE4lsV3ZBPC9JhvdWDFU8UIKMI0x8fMz5G5U3CXSzdJIPJycGjDftmZks?=
 =?us-ascii?Q?3tJTxttxGJsTDwHoLLXH0K9fTwvSVPjZ2j907FoPJvcguWI5GnrOPw7x4VFq?=
 =?us-ascii?Q?NJXroMh9wpuzXaK2YrqwqWQAoAvv2xVxdlmtEDbqZAXXxTvHUJUfZ5UcZ6G2?=
 =?us-ascii?Q?7+HCk+o0s+x+DrrsYIdukukSyViuaAZU/AEdLYTS4yvghqwdCHc5py4UHQWJ?=
 =?us-ascii?Q?3L0NCdgTFJAK3dRGRKSbJFGMBXouh2W/3dSyBzgDIn7V8duEB14Tn3sdvM7l?=
 =?us-ascii?Q?aLgl56sxyHHuYg7E1wMd68ugIUmeZXDlrm5zvGKlitAbYrEcmhbD74mQOG/q?=
 =?us-ascii?Q?kA3GbrWscM85R7EkXfoVha60PCYm2MkuBBgXC8BdL554fX1Hd62bgf3TkUtv?=
 =?us-ascii?Q?qqOYVJTo1q0nXFKRNAJUG4moe/fbmz/2XM80CPqh0ONOzeOEEm8BObfy4ITW?=
 =?us-ascii?Q?txCqgqrf9fQOMvyCgmVwJMV1zOSOvGvicr5nI2ajL2yxz8ykBSS7FuWSWSxO?=
 =?us-ascii?Q?AVMAp68XPYFQGASLa4n+TLfGrzKiocuviz2mUjWu9pVpgJ2L/COMTnWJLg9v?=
 =?us-ascii?Q?jRE0CXNm3FjWgcLRemtK9WjG7Vs5H5gWJ9dDjYPuC0gaQMyQRdIwZrhO/0EO?=
 =?us-ascii?Q?g9/EpIcwNdpyhnw00l5N0wvO9WIxgXdMbtEJ5kKqzcZX4DZX4mVBBIZlf2sz?=
 =?us-ascii?Q?dOsRj4DTEslDGgrpTyIz9KoTUAJh+bhIT4nippLXp3kF3m6PzaTE5WKaZsXe?=
 =?us-ascii?Q?fQtSyQIgr1p+41W8GOmvWF9ukVILNK6sIxsbFzQR3/ykaU3cgztOjd9US8uy?=
 =?us-ascii?Q?Z7CKAlH55GU0BnA0N8DipMZa1l0us97a7HNDci0mB983DmAWer6Vt5dcOEh4?=
 =?us-ascii?Q?Dws1Vhs1cDRLCCIrAADhjFhv/AsLOGB2HK4NHjfPnYwiGI+8WO5K8F6J9IgT?=
 =?us-ascii?Q?4GL4VL6eq99eVSGs82aj+nMHmXJOUFqya7uqF8Wz5L+K/0gchnIgX9gY87UG?=
 =?us-ascii?Q?4Te+InZOWyGaSVIKnAjYwZsZvzO2Z3Kfky7l9iroGVausgG8aaSs7ripk4Z/?=
 =?us-ascii?Q?Tzg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(366007)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?e7fMO0uSTpPZoXryjz19fBp1oemMdfiE8/UbiFQc2eaMt5EH8DTQwFakpwIa?=
 =?us-ascii?Q?LPpVP/MlEEunaVJN2eDhyXAkJZ4CViylEIXfBICzB80QXrBLpqNcsgUwFZg8?=
 =?us-ascii?Q?7e4WYvDvGW9ktgfKIcy7KhqntudoxNGZLqpcjwNwGy1PcIx79TPBGPXLauxH?=
 =?us-ascii?Q?dK275Xq039H3RWdMcCo61X+VNcq3Oq+Am7YtiSQ7PJr5GDoDh559DCVjlCRw?=
 =?us-ascii?Q?+hcKFC0WrKOuxkRDX3WC7qCFp3ubtu5MsSDFLahkdMBq6D8LjA0QkjPeX5JJ?=
 =?us-ascii?Q?sXqWN0MN9phHo3tG/5IjaAcUaWaZMw4hrBQaCppumh6H1VAkywK3yAa5iHAi?=
 =?us-ascii?Q?inVKnMCf8KT9Aa+MFYXUS4Zvrl3XoOIfTx1mM3bZfu9AKuCVlHEd0FniV7c4?=
 =?us-ascii?Q?IIq31swfezWcWOU4QKjj+ToNHqqDbRDk5m72d2qHDhm1uxYSytLIkSHiITx+?=
 =?us-ascii?Q?6nKBo0mUkn83LBlGXlZwaPo+JbXGRTGxtzXRd5w/vx47Aec97wc2OOQA0zIr?=
 =?us-ascii?Q?AkQtcYJ0+23/QDBeadhFF4ziCTlqDdzzZlcVdwIBuJVGvh3TpECeyLg4wiFM?=
 =?us-ascii?Q?9W8ObrCnrQl8iN6em3lmW76vhpYrfn6EPfgExCkh8OXCiflV5S5TMz7crkKi?=
 =?us-ascii?Q?W7+WbNnF5NoxMJw1CmPZW1dyyZviEfgeEetkzHvbkrVJszmcP40QflePoHF3?=
 =?us-ascii?Q?OeQzV0p5xU8acKmcxFaHxCBpr4mQ8gjqkzVwbUuyatWklATn1l2pLGhy3kUE?=
 =?us-ascii?Q?dj4ckUAODP7S1FlI763BTTN0ZCdflDo2Jqjkj5yTPUDbIGLuDTAb65mjMdcT?=
 =?us-ascii?Q?pdIFZkT41LmcjJPOiW54Y0Bfi24BL030QMSXdQykXpu19Nyrho0v7vFwHxGw?=
 =?us-ascii?Q?Iit0vQVuKKUJK3is5eUkGUZd9vEl1C3f7duLzxv1F2VX+86i/8YdBOrzjfJd?=
 =?us-ascii?Q?jypMjSUSNrURphVbEMV7vPq4uTzHH/KM01toAFBixqVhaZfdbq2lkTABz5Qt?=
 =?us-ascii?Q?ffXpSN0k9MTXG8rE62QE4l+EyAcsBWDw/97f7WIXUM53lVwu/EcGT/fqudl3?=
 =?us-ascii?Q?rGpGof1Ez+MUi1yUo493mdK0crjMBEZOoEmq3SOzn4ZeLKH+vRBMV17tOLuk?=
 =?us-ascii?Q?7OQ4gOraD7zImaY5W+XVR95i8mOlB9kkwBTSUGq9/8AQRU76a6dtg2adUsXA?=
 =?us-ascii?Q?PYSCW9oul5tXbbT+SbjWJb1qH11G8kF6DnS6aXz27485CoiqQh/ja4rWKMth?=
 =?us-ascii?Q?ldxvdeF17xN67Q+w1IswTziyERiQL4f6pXFKf98kLvSsUL+xNv6hDQTdeZj3?=
 =?us-ascii?Q?CpFRuWBm/3GYjEKYGQRDB12l7gp0NqUAcjDMhzwpEA2CmETpusaLwpOwpkli?=
 =?us-ascii?Q?nuEDXuR10GXy4365GWF122o/FrcUjDXUORULQgjQi36p5OsBEsbL1eGs3BPG?=
 =?us-ascii?Q?7CiXrDXofJblHHTvbn4eWSdv0EHDmOQCYUcgLVN5gFhuMaSXvO0xv2lOWQmz?=
 =?us-ascii?Q?6NFkdDR11qHQ2KwbP1Z6fsbVQlU1LPFZsaOUnBZcqXsc0e+P3Y+10ZIWSzpw?=
 =?us-ascii?Q?C7lsCPEn8ig+c1bQYMKRAEjU3r8pOyt3Cr+4C/Wn?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb92134e-9721-4edb-fd75-08dc7c781940
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2024 05:04:04.3574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpUEEo555x0dYEp+0F8BRo/jO34mLkJ9DjQrt3CTIpu60Bm3M6DxhaQ6NnlTOCtaosf04PkJxG3d9iDD2SrL0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6403
X-Proofpoint-ORIG-GUID: pNlDmN2DifXwuuhtKut2YkDbRua-4Rbx
X-Proofpoint-GUID: pNlDmN2DifXwuuhtKut2YkDbRua-4Rbx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-25_01,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405250036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 May 2024 05:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199864

From: Chen Qi <Qi.Chen@windriver.com>

License-Update:
===============
GPL-2.0 is changed to GPL-2.0-only in README.licensing.

The following two patches are removed as they've been there in new release:

  0001-login-utils-include-libgen.h-for-basename-API.patch
  mit-license.patch

Other existing patches are refreshed to avoid patch-fuzz error.

A new PACKAGECONFIG, lastlog2, is added, which serves as a switch to build Y2038
safe lastlog pam module. This is a new functionality added in 2.40.

This 2.40.1 version has the problem of unnecessary remake, causing
intermmittent errors at parallel make. The do_compile:prepend is a
workaround for this. Upstream issue and PR are:
https://github.com/util-linux/util-linux/issues/3061
https://github.com/util-linux/util-linux/pull/3064

do_install is changed to do_install:append, the legacy codes are
removed. They've been there since the born of oe-core. I tested
with ccache, there's no error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...2.39.3.bb => util-linux-libuuid_2.40.1.bb} |  0
 meta/recipes-core/util-linux/util-linux.inc   |  8 +--
 ...ls-include-libgen.h-for-basename-API.patch | 60 -------------------
 .../util-linux/avoid_parallel_tests.patch     |  5 +-
 .../util-linux/configure-sbindir.patch        |  7 +--
 .../display_testname_for_subtest.patch        |  7 +--
 .../util-linux/util-linux/mit-license.patch   | 45 --------------
 .../util-linux/util-linux/ptest.patch         | 11 ++--
 ...l-linux_2.39.3.bb => util-linux_2.40.1.bb} | 21 ++++---
 9 files changed, 29 insertions(+), 135 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.39.3.bb => util-linux-libuuid_2.40.1.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/mit-license.patch
 rename meta/recipes-core/util-linux/{util-linux_2.39.3.bb => util-linux_2.40.1.bb} (95%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index d506783f9a..0f5f838e84 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -6,7 +6,7 @@ disk partitioning, kernel message management, filesystem creation, and system lo
 
 SECTION = "base"
 
-LICENSE = "GPL-1.0-or-later & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
+LICENSE = "GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
 LICENSE:${PN}-fcntl-lock = "MIT"
 LICENSE:${PN}-fdisk = "GPL-1.0-or-later"
 LICENSE:${PN}-libblkid = "LGPL-2.1-or-later"
@@ -14,7 +14,7 @@ LICENSE:${PN}-libfdisk = "LGPL-2.1-or-later"
 LICENSE:${PN}-libmount = "LGPL-2.1-or-later"
 LICENSE:${PN}-libsmartcols = "LGPL-2.1-or-later"
 
-LIC_FILES_CHKSUM = "file://README.licensing;md5=cc80239f106687ab39ef0271ff5cf4ba \
+LIC_FILES_CHKSUM = "file://README.licensing;md5=ddd58b6c94da86ff4f03e91208eb9cfc \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
@@ -30,7 +30,6 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=cc80239f106687ab39ef0271ff5cf4ba
 FILESEXTRAPATHS:prepend := "${THISDIR}/util-linux:"
 MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.xz \
-           file://mit-license.patch \
            file://configure-sbindir.patch \
            file://runuser.pamd \
            file://runuser-l.pamd \
@@ -38,8 +37,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
-           file://0001-login-utils-include-libgen.h-for-basename-API.patch \
            file://fcntl-lock.c \
            "
 
-SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
+SRC_URI[sha256sum] = "59e676aa53ccb44b6c39f0ffe01a8fa274891c91bef1474752fad92461def24f"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch b/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
deleted file mode 100644
index 6258710e1e..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From d44e3ad1f6f8b5c1b3098bb7d537943a4c21d22f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 3 Dec 2023 19:59:46 -0800
-Subject: [PATCH] login-utils: include libgen.h for basename API
-
-musl has removed the non-prototype declaration of basename from string.h [1] which now results in build errors with clang-17+ compiler
-
-include libgen.h for using the posix declaration of the funciton.
-
-Fixes
-
-../util-linux-2.39.2/login-utils/su-common.c:847:20: error: call to undeclared function 'basename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-  847 |                 shell_basename = basename(shell);
-      |                                  ^
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/2615]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- login-utils/su-common.c | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/login-utils/su-common.c b/login-utils/su-common.c
-index b674920..3297c78 100644
---- a/login-utils/su-common.c
-+++ b/login-utils/su-common.c
-@@ -26,6 +26,7 @@
- #include <sys/types.h>
- #include <pwd.h>
- #include <grp.h>
-+#include <libgen.h>
- #include <security/pam_appl.h>
- #ifdef HAVE_SECURITY_PAM_MISC_H
- # include <security/pam_misc.h>
-@@ -840,17 +841,20 @@ static void run_shell(
- 				su->simulate_login ? " login" : "",
- 				su->fast_startup ? " fast-start" : ""));
- 
-+  char* tmp = xstrdup(shell);
- 	if (su->simulate_login) {
- 		char *arg0;
- 		char *shell_basename;
- 
--		shell_basename = basename(shell);
-+		shell_basename = basename(tmp);
- 		arg0 = xmalloc(strlen(shell_basename) + 2);
- 		arg0[0] = '-';
- 		strcpy(arg0 + 1, shell_basename);
- 		args[0] = arg0;
--	} else
--		args[0] = basename(shell);
-+	} else {
-+    args[0] = basename(tmp);
-+  }
-+  free(tmp);
- 
- 	if (su->fast_startup)
- 		args[argno++] = "-f";
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
index 85ad7a5575..8ea00dbb95 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 0b05e4695a0616badef71dfa459a00ef6ff1b521 Mon Sep 17 00:00:00 2001
+From da58b4150f6932de36c962ea657713bcf4ea44be Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Mon, 14 Jun 2021 14:00:31 +0200
 Subject: [PATCH] util-linux: Add ptest
@@ -9,13 +9,12 @@ Revert run.sh script accordingly to serialize running tests
 
 Signed-off-by: Tudor Florea  <tudor.florea@enea.com>
 Upstream-Status: Inappropriate
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 890212f..870e817 100644
+index 651ef2b..2a8012e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
index 75adeca188..74abdc2038 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From c79222a9a5e3425c55e150edc0b7ac59c573aa2f Mon Sep 17 00:00:00 2001
+From 0387d71516c978899cfd556ca512f530a212b4a9 Mon Sep 17 00:00:00 2001
 From: Phil Blundell <pb@pbcl.net>
 Date: Mon, 24 Sep 2012 07:24:51 +0100
 Subject: [PATCH] util-linux: Ensure that ${sbindir} is respected
@@ -9,16 +9,15 @@ fix the test, the [ ] syntax was getting eaten by autoconf
 Signed-off-by: Phil Blundell <pb@pbcl.net>
 Signed-off-by: Saul Wold <sgw@linux.intel.com
 Upstream-Status: Inappropriate [configuration]
-
 ---
  configure.ac | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 36c24b4..890212f 100644
+index 23594ff..651ef2b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -102,7 +102,10 @@ AC_SUBST([runstatedir])
+@@ -110,7 +110,10 @@ AC_SUBST([runstatedir])
  usrbin_execdir='${exec_prefix}/bin'
  AC_SUBST([usrbin_execdir])
  
diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
index 815ae9c915..871b0b2d30 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,20 +1,19 @@
-From fc5de1de898fd1a372a2fd2fa493dc57323a029d Mon Sep 17 00:00:00 2001
+From 45450d0339cd7ee27f53c0f2fac1cc74ed9bbfb8 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Display testname for subtest
 
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Pending
-
 ---
  tests/functions.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/functions.sh b/tests/functions.sh
-index 5a562a3..098145e 100644
+index 5fe5ba0..a6c703e 100644
 --- a/tests/functions.sh
 +++ b/tests/functions.sh
-@@ -437,7 +437,7 @@ function ts_init_subtest {
+@@ -450,7 +450,7 @@ function ts_init_subtest {
  
  	if [ "$TS_PARSABLE" != "yes" ]; then
  		[ $TS_NSUBTESTS -eq 1 ] && echo
diff --git a/meta/recipes-core/util-linux/util-linux/mit-license.patch b/meta/recipes-core/util-linux/util-linux/mit-license.patch
deleted file mode 100644
index afbec98f18..0000000000
--- a/meta/recipes-core/util-linux/util-linux/mit-license.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 5b8fab1584017d9d9be008c23b90128bba41a7b5 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Thu, 28 Mar 2024 12:16:57 +0000
-Subject: [PATCH] README.licensing/flock: Add MIT license mention
-
-Looking at the license text, flock.c is under the MIT license (see
-https://spdx.org/licenses/MIT).
-
-Add an SPDX license identifier header and add to the list of licenses the
-source so everything is correctly listed/identified.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/2870]
-
----
- README.licensing  | 2 ++
- sys-utils/flock.c | 4 +++-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/README.licensing b/README.licensing
-index 4454f8392a..535ad34813 100644
---- a/README.licensing
-+++ b/README.licensing
-@@ -12,6 +12,8 @@ There is code under:
- 
-    * LGPL-2.1-or-later  - GNU Lesser General Public License 2.1 or any later version
- 
-+   * MIT                - MIT License
-+
-    * BSD-2-Clause       - Simplified BSD License
- 
-    * BSD-3-Clause       - BSD 3-Clause "New" or "Revised" License
-diff --git a/sys-utils/flock.c b/sys-utils/flock.c
-index fed29d7270..7d878ff810 100644
---- a/sys-utils/flock.c
-+++ b/sys-utils/flock.c
-@@ -1,4 +1,6 @@
--/*   Copyright 2003-2005 H. Peter Anvin - All Rights Reserved
-+/*   SPDX-License-Identifier: MIT
-+ *
-+ *   Copyright 2003-2005 H. Peter Anvin - All Rights Reserved
-  *
-  *   Permission is hereby granted, free of charge, to any person
-  *   obtaining a copy of this software and associated documentation
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index 6221de7182..7345926b88 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,24 +1,23 @@
-From d0a69ce80c579cbb7627a2f20e8b92e006a8d8ad Mon Sep 17 00:00:00 2001
+From f9be73c3e2b0a4f0923950dcb058be85d3ee8ed7 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Define TESTS variable
 
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Pending
-
 ---
  Makefile.am | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index effbb02..7d2bd1e 100644
+index 50ab8d0..7e2340d 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -57,6 +57,7 @@ systemdsystemunit_DATA =
+@@ -64,6 +64,7 @@ tmpfiles_DATA =
  dist_bashcompletion_DATA =
  check_PROGRAMS =
  dist_check_SCRIPTS =
 +TESTS = $(check_PROGRAMS)
  
- PATHFILES =
- ADOCFILES_COMMON =
+ BUILT_SOURCES =
+ 
diff --git a/meta/recipes-core/util-linux/util-linux_2.39.3.bb b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
similarity index 95%
rename from meta/recipes-core/util-linux/util-linux_2.39.3.bb
rename to meta/recipes-core/util-linux/util-linux_2.40.1.bb
index 2cd7750afc..5985ddc7dc 100644
--- a/meta/recipes-core/util-linux/util-linux_2.39.3.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
@@ -90,7 +90,7 @@ EXTRA_OECONF:append = " --disable-hwclock-gplv3"
 # build host versions during development
 #
 PACKAGECONFIG ?= "pcre2"
-PACKAGECONFIG:class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'chfn-chsh pam', '', d)}"
+PACKAGECONFIG:class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'chfn-chsh pam lastlog2', '', d)}"
 # inherit manpages requires this to be present, however util-linux does not have
 # configuration options, and installs manpages always
 PACKAGECONFIG[manpages] = ""
@@ -106,6 +106,7 @@ PACKAGECONFIG[pcre2] = ",,libpcre2"
 PACKAGECONFIG[cryptsetup] = "--with-cryptsetup,--without-cryptsetup,cryptsetup"
 PACKAGECONFIG[chfn-chsh] = "--enable-chfn-chsh,--disable-chfn-chsh,"
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
+PACKAGECONFIG[lastlog2] = "--enable-liblastlog2,--disable-liblastlog2,sqlite3"
 
 EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
 
@@ -117,6 +118,7 @@ FILES:${PN}-mount = "${sysconfdir}/default/mountall"
 FILES:${PN}-runuser = "${sysconfdir}/pam.d/runuser*"
 FILES:${PN}-su = "${sysconfdir}/pam.d/su-l"
 CONFFILES:${PN}-su = "${sysconfdir}/pam.d/su-l"
+FILES:${PN}-lastlog2 += "${base_libdir}/security/pam_lastlog2.so"
 FILES:${PN}-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
                           ${PYTHON_SITEPACKAGES_DIR}/libmount/__init__.* \
                           ${PYTHON_SITEPACKAGES_DIR}/libmount/__pycache__/*"
@@ -147,18 +149,21 @@ SYSTEMD_AUTO_ENABLE:${PN}-uuidd = "disable"
 SYSTEMD_SERVICE:${PN}-fstrim = "fstrim.timer fstrim.service"
 SYSTEMD_AUTO_ENABLE:${PN}-fstrim = "disable"
 
+do_compile:prepend () {
+	# this is a workaround for the unnecessary remake problem. Issue and PR are as below:
+	# https://github.com/util-linux/util-linux/issues/3061
+	# https://github.com/util-linux/util-linux/pull/3064
+	# When newly release tarball contains the above fix, the following workaround could be dropped.
+	[ -e ${S}/libsmartcols/src/filter-scanner.c ] && touch ${S}/libsmartcols/src/filter-scanner.c
+	[ -e ${S}/libsmartcols/src/filter-parser.c ] && touch ${S}/libsmartcols/src/filter-parser.c
+}
+
 do_compile:append () {
 	cp ${UNPACKDIR}/fcntl-lock.c ${S}/fcntl-lock.c
 	${CC} ${CFLAGS} ${LDFLAGS} ${S}/fcntl-lock.c -o ${B}/fcntl-lock
 }
 
-do_install () {
-	# with ccache the timestamps on compiled files may
-	# end up earlier than on their inputs, this allows
-	# for the resultant compilation in the install step.
-	oe_runmake 'CC=${CC}' 'LD=${LD}' \
-		'LDFLAGS=${LDFLAGS}' 'DESTDIR=${D}' install
-
+do_install:append () {
 	mkdir -p ${D}${base_bindir}
 
         sbinprogs="agetty ctrlaltdel cfdisk vipw vigr"
-- 
2.34.1


