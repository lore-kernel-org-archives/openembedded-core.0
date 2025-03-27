Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819AFC36013
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 06:22:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.43814.1743056532882395940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 23:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5181519be0=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5v9pi014333
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 06:22:12 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hm68njws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 06:22:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJ3hDMrjwgPJrdyhU5BuUtgkVzB4642zFUsj2R8uUKATQb+PA+jOLqVjITWvtUdu4cwPzV96R1PMwfwxDapJcuZ/GFgTP23aK18LnY2EKS6zWNYL26PicvMTCJPw1xlr2+f8KK3SFJwK/nDkmrBIIWfG8ODvyowITdKqznOqKxVVWp08rP7OTLfBeloHgygHKmfS242MB7ZFQAvGO2jlNtYyJvcAQ/fj5kNFSLPzd+v0ggqB6lD1ock2vjaBwMkyAJ7kESjAEO/baitvkDefgOBYRDH/YaIxWN5q7J3dBmGpFt/Hs61Bh9H3I1Rg41KNWK8cp8oE1YckeQ0FloefFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/DXibPDU3JF8FpOfp5/jdQORWjX+ROMDJk/XK7TrqI=;
 b=kCcVBLzFG2NXhiHqEc14qJEqvuVfQMrcZaBPeH950zqlYlFJ3XPv6EznDGr+S1ZTBYTP0CZzLNUDmejE1kkZMzYfASAoQr0LAZp8mzL9IA+aycsXNLbLC8DFsFytslvkLi2Jtm/4IV9iHLa5CWTSrisHXwCXiI0bBycffwmfVyNNCyXTnmlke2b7SEWMclO8aMcY0VRWIvMBfX2187CDrf9sWdECrLl6YbvGi2OoJ5EmzQohjeB8m4UYl33S1OZe7IA1m24U6PbQQZeS6l6fi4u50AxZUaWgvaPF0T3g/VF2T3yYZMqoAdMaGOW4nxCgPCHBNNlUmwrPOi3gvXH4lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by IA1PR11MB7869.namprd11.prod.outlook.com (2603:10b6:208:3f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 06:22:09 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 06:22:09 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Subject: [RFC PATCH 3/3] time: fix runtime version from UNKNOWN to 1.9
Date: Thu, 27 Mar 2025 14:21:44 +0800
Message-Id: <4fb03305a3cf138c9a40f40e04004b022989d520.1743052694.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743052694.git.Qi.Chen@windriver.com>
References: <cover.1743052694.git.Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0183.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::19) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|IA1PR11MB7869:EE_
X-MS-Office365-Filtering-Correlation-Id: 79f14122-336e-4770-0411-08dd6cf7b390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RqnADt9vXJX4IeCqQ1rhy2dqk3KV0OEeEoT5fNpGysOtJYO0Z+kS6+pJaCCu?=
 =?us-ascii?Q?ybBI8YLb9qPTstMLZ0aWghYV4ZKq+g8Htr7b8Jhx21FGOxiF8f3SEhuy+rid?=
 =?us-ascii?Q?7m8CompJgwRJjcHmoQ2UCmdULFxMNdMjo8vNJ6wjrsVJNcgh2xcIkjnGM3Cj?=
 =?us-ascii?Q?Cu17XgdCxN14+sOoDsb77CvKJXphDtVkZXrPAC3nLPbQA1w8MjcYyBl12CeY?=
 =?us-ascii?Q?bZR2AfKdHRLYM+Oa3gakJOxElh3v4NATRGKgzqmINeJw0GxmSY1CV4T6VDpp?=
 =?us-ascii?Q?J/YMbzDzRaEZ+e3V1wrK5XdFlmm+II3OHMZgzS0QFz12mQAlNYSMYGkQrlUW?=
 =?us-ascii?Q?Xzbbqh1QeSXtRCEJreAXu4n28+ioTJYVCIz9SKvv9XDgyy1GhqI6ntKtuGYt?=
 =?us-ascii?Q?vr50dIelN51lvAfRBbY7EdOH8hOJZvT5IUnJ4wmDge9Ht89Z/zfJDaPJpT56?=
 =?us-ascii?Q?i+PQJ9cGFMYRTXT06rH4OGG9djaoACdEaetlKMEdC6aTYUNG5QDFyuK+wN0E?=
 =?us-ascii?Q?o4uN3E44AlY3md99g8+E6yEbMD+xsMiq3jCK9Nd6mCj0/eF0f+a8Lfb8gNn1?=
 =?us-ascii?Q?gos3kFpji6vFMQPU/n9g+Ki/JNxvHJResfFiWdW5CO9fSALEpncJeh4aHYB1?=
 =?us-ascii?Q?kXjlerWtSBvLUb8vzLNcupno8qQCv/HhH4/KA7UFnPC/CMBKdjfNixqSlnD5?=
 =?us-ascii?Q?4oBA87tML/2cj6G27Nb7m2cfX9bTwFNyoF7jX4MLCDoi+N+sWVaekI3eUlK4?=
 =?us-ascii?Q?jJzVVuTEyGaZiomhdp1t8kM7Jo1v05D+nix/dlY49Xa69e6LmxrXHh6EzWNS?=
 =?us-ascii?Q?CEM8pFj2J1cX1QA1WM3lnkyDWogiJwMPajSenoKF2u2DjRiDSTZ0EhwcPE8N?=
 =?us-ascii?Q?vD4WZcqq0lhIxiWKL4YGqJDaKn7g8cvWsDXT4+3qcdKB3OThh6H3tWW6Tbsl?=
 =?us-ascii?Q?YQh6PprUzHT4KoaVTWr0vxjYBPg9lKCZIK5jQC1YY8QrDFZgAlFRZh451SfD?=
 =?us-ascii?Q?DnAll+Jp+29Htov/1jWjMxcuUu5Z2BKzsguoWKJ92ksqtpEyQYDD2OWxbzQe?=
 =?us-ascii?Q?qteGqQhMbY47FC744pBgyRkNosL6Tfm4KSUWlLb00XuDePBmTa/DVijiImBP?=
 =?us-ascii?Q?xvrC2eMORQLRtLF3zdWXEI32O8Ub9ybqugeqTtfWEp5y8j7R96eQiPNFhjV2?=
 =?us-ascii?Q?XnkZfMokFUyeGpB3pTJehFowdxgOOfoeyvEjUOwx0plFySRCFF3zXIkK+iy6?=
 =?us-ascii?Q?U4eQPyCfUCxhuSY4U7E0cRPwsgFLmljsn60Z3xR6Xb3DQIiv+WE6gyrGuN+R?=
 =?us-ascii?Q?TVecvf3rppiR3ja2zEMz6BFbETSvtEcPKupq0kO8v/CNUqy6KUFNmukqBG9y?=
 =?us-ascii?Q?GY0efgGfkX+0wJCZOj5c9ZbRLG31XqFHasK8grXRjMzfeXzoi9DYEF6wJcsr?=
 =?us-ascii?Q?uAU76cDFAB/8etUDSosd7uCrAOgYA2xr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?v8F2Ew7K+Tc16Ugp0Xn6lL1LfE6GZKLNDncQhb+qB2gi4uuw01GLde5hX2ix?=
 =?us-ascii?Q?BJJDV8CtHaLMleEUmwohq/8y5E/YLR+Bl4AjA16f89xyXlB++4W8s1uSpkGi?=
 =?us-ascii?Q?TGQxlzXVKnSktdfFJVeF6lGiSA8flrOZLNPwRPc7kHinWRHqBAJIGQzdB5JS?=
 =?us-ascii?Q?ffUN/sYo9ZZonJuG9sKCERjZPwoHPcLkd1ujpVV+uaCR38houPrrvEa0H3bT?=
 =?us-ascii?Q?qKb9FYcqUjOZUBrM2PQlL1ubCv6GobLZRqN86H5cXLAd0UKUjfnBoaFziehx?=
 =?us-ascii?Q?bMh4pZ2eCNQZKFfMhMoYHYIQwx38siWANeuooWTnhHN2h0GUyDsFIVG4SX2X?=
 =?us-ascii?Q?xfKVuaCRIXaACmLADI5KEXdKFbjmREe68Zh/EoEuzjj2TokwycDKt77HQDSL?=
 =?us-ascii?Q?d94BuFJOFm7fRTLZVZDdmntDdjTug79l/kS4w2mK8zj0CaxpOBE5ZxODzhDo?=
 =?us-ascii?Q?2qSfLAN/qlMzpa+0d8ViTVBJRSQdFv0XFOvs1om1650zT49oWN0RENOzEc0w?=
 =?us-ascii?Q?JvPOiaxbCs48LqrH6sUfXYCghGt9N4cLp+OTxhA74Yff+K71OynL8/sb9H8+?=
 =?us-ascii?Q?wZC2aVwIZ8hwa/YH4E+/YXmqWxNIDoH0fuX0pmjaximmRttNF5Sg5+6jc9dt?=
 =?us-ascii?Q?qBQcMkRTMrOknnNL/pseocbUoLKtVQT0GCnDL6Vxy/FvO9VbJ2VFBKRl9FvH?=
 =?us-ascii?Q?+SRHZzMK5cE4avyo7ap/vdUmlN+kxMWaDPp2VTEgMOGtHRKReRzAZTaJLC6V?=
 =?us-ascii?Q?pl3CwqN4vGrpujvYQHoTXPxV6wE58H8G3Vtp6dykKjPjC13GqnKQ4ykc/CdB?=
 =?us-ascii?Q?ZF6Q3OtnDnLKRPLCksd1lza3/wDEpbC0I9uGJkM07hZGs9b31JJzQzlbwZ5G?=
 =?us-ascii?Q?Oob5dSbHQRC49aaeNs7yzBsylvaGmWIqrxhySWLd+f0u2hDRBaFTWveVKW0G?=
 =?us-ascii?Q?z+PNdJ1WWZyQ8lwRZ7ATPR6pi8/ohIBAel3fyzoD7+iqKr/XtiRRkSElfWaC?=
 =?us-ascii?Q?FRZeDG1PR5K+SkOkiVb7igVEPJsL6Fuqpf/ghtG9/1o7I0IxfptNDAjJ6Qdb?=
 =?us-ascii?Q?vW8ff8fut5iK4VdW/ILPK2AzZ2uIttDaLXdx5uhIUur6OLk/J39QrX+jLHPv?=
 =?us-ascii?Q?VDsnFetg1vziOvheF0IaSXLm7kdX7BilBImsdGRN2BctqDDvkt0OStCu90Z2?=
 =?us-ascii?Q?BTSyAc0A8Yqt7lUYnwoEWbpBYmXf/VKFqVugIi7GcVSoOZcyJbLqJpVDyR3y?=
 =?us-ascii?Q?zVbi9B99eR39p5VFVZKSsrj7JWmy5spwFqVUJaAO8OM4hkQvGM0Mk9iLaNzb?=
 =?us-ascii?Q?sJ2sKeTj++jRynZK3GAiHA0bmYHYqQvWP3Dbr4O7hM5hTKsHwJga7gaQWf90?=
 =?us-ascii?Q?q4DbSKUR0JNkgLNu4vTO2vtBd6J5yS0Dv0NKu6DRpWcyjjgydtkF2qS81Vub?=
 =?us-ascii?Q?+T16gWN5pznLg/Fi77A0wnL/5bEImFOfw+NnbUrnXNL4tLZ1839TCWROpsGY?=
 =?us-ascii?Q?Q9Ng/pwVsfl0dfzeblszn5fVdF3kDb1K6PtZEVZieuhOrZsZs+R/UmGADpgx?=
 =?us-ascii?Q?W6O/sAHDbCRdHYz+acY64qKbd5quDSTueExsop5V?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f14122-336e-4770-0411-08dd6cf7b390
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 06:22:09.1465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlAQhR0167p0OW3RmEwdbnkmYZX17MJa42DyU5krYjbGPO3iG2DX2pEXGvf19gD4gNhY3W8cRO9JJavG88f2Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7869
X-Proofpoint-ORIG-GUID: utG3z_gPrW4HmeEumfPF9OhpW6aNrHJ2
X-Authority-Analysis: v=2.4 cv=etjfzppX c=1 sm=1 tr=0 ts=67e4ee93 cx=c_pps a=FmV7mXqD6UovpQmy5PTGeA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=t7CeM3EgAAAA:8 a=uruxHgBA79GqQsptt8UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: utG3z_gPrW4HmeEumfPF9OhpW6aNrHJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503270040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 06:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213708

From: Chen Qi <Qi.Chen@windriver.com>

The runtime version of time is determined by:
build-aux/git-version-gen .tarball-version

But there's no .tarball-version in the tarball. And time's last
commit dates back to 20210105, it's very unlikely for them to
generate a new tarball. So we add this file manually with ${PV}
as the content.

Before the fix, time --version:
time (GNU Time) UNKNOWN

After the fix, time --version:
time (GNU Time) 1.9

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/time/time_1.9.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/time/time_1.9.bb b/meta/recipes-extended/time/time_1.9.bb
index 8364210e61..1872a409f7 100644
--- a/meta/recipes-extended/time/time_1.9.bb
+++ b/meta/recipes-extended/time/time_1.9.bb
@@ -21,3 +21,9 @@ SRC_URI[md5sum] = "d2356e0fe1c0b85285d83c6b2ad51b5f"
 SRC_URI[sha256sum] = "fbacf0c81e62429df3e33bda4cee38756604f18e01d977338e23306a3e3b521e"
 
 inherit autotools
+
+# We don't want our version to be "UNKNOWN", and time repo's latest commits dates back
+# to 20210105. It's very unlikely it'll generate a new tarball with a .tarball-version included.
+do_configure:prepend () {
+    echo ${PV} > ${S}/.tarball-version
+}
-- 
2.34.1


