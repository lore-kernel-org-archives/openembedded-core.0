Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD942C3DA61
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 10:11:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.52878.1722247866168171672
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 03:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=89407ab778=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46T7mSQ2004127
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:11:05 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40mp3x9n51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:11:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0DphcV3Ka3vFMsprkubbez1pBMGxGNPDtk9pkGI1A7RrOaKJfjgtQT0rnbgHIc5H8dEiAf0Q9ibaXuGM2npAuI8lgDFsA4vlgvDdk+UCMijL6bF0VCLxH+wuDe1lhbFUy3bEVyRp3wpiMFX628CStZV0pWs+g+YUVt/HUJ7kQk0UnU7O63r0TENKmLeo2pMYJog+G71b076OjpYthC1LLhAlTGGUIU5hB4W9rqrR4t/9d6dRbrBbeKk26ehwE1BnKn7n/WOEGSsm5rebgw+NINxTdQBuEYgkYPNf6snLHXMAK8q+E4VGN2BXEasofRjwZxVa0FBZEjxweYJ8s+DUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvZfLuJwO1pqwvCSLsvz8LClORQs+WCeB5FMmg5b91Q=;
 b=Wvk7ZyDqw4SMdSwEm1DsRTCuVYK6ToCgyC1T/KRxOybrixcBjMb7F/ViWgGJrGKYxnDIC6Clzuob/lBGyZqUarrf+cMp1qvyuiDzB2D/ZiZP2bKpBXrvRCqrTgaCAxV1eoA+Xh0bri6KyihhK5cB/8wC8vKr53ujHvbCl+hRnotrs+pIdqXLpklHatGyrO7nnxAt6FVslkXQ5JIbk5CbhzHmFLK2rNbo+FXjWINoGXFrJotxWU6jaecysgQGM5yGKIpUyk+fJp8HCc906AtaLN/+sn8ml0XBn1eBFGRHNwz8EUV8MMC3FSRf1aXM0UewcF4ii05i3FKeJNlKx0Wsww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by CH3PR11MB8238.namprd11.prod.outlook.com (2603:10b6:610:155::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.23; Mon, 29 Jul
 2024 10:11:02 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 10:11:01 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [kirkstone][PATCH] llvm: Fix CVE-2023-46049
Date: Mon, 29 Jul 2024 03:10:42 -0700
Message-ID: <20240729101042.2984779-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:74::15) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|CH3PR11MB8238:EE_
X-MS-Office365-Filtering-Correlation-Id: ff33d49f-626c-49ad-de6a-08dcafb6bfe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zPPHT4ozH1XMaYO7gN0WmGKElLKjl/t1OAce8hQ0Q9yBEVsZmIJqZGhTnUFN?=
 =?us-ascii?Q?/6UouumRYKuIfhcIyEqIODFCgjYpt598kzPv9j4DLeFmgig0wmcrefEVmqMd?=
 =?us-ascii?Q?qa9iZHcpCcE/xnghDuISTp2taHRXro3ZdptueEp7nwUwhmy8E6ReAUjM4z3E?=
 =?us-ascii?Q?GT8sqJTDnxABLaYzHQMV6oezJd0nwvbxoThA+vVw3NGr7yVi/oMoiGG5MM/f?=
 =?us-ascii?Q?/PGWQIMHCoIBQZWCuhDOpP4UmfgGDiHK9KIG3QjLelM2KVbeeSe6xeDj+PrR?=
 =?us-ascii?Q?ComzXuulQl0ropeTf5DvWihjvmG9mCIM9wVFGKlqO8+w/W0RucBQsCwKnR/c?=
 =?us-ascii?Q?zdLbr5fe5Vmqoq/hZxP4IZJBenRfSXerYiZ6IgxSUcOZfETBpL1ySl90AxKe?=
 =?us-ascii?Q?tIG5cvXx+uXs+fs8TsuxpIksmPWlYsE3mLV5XaLm6zxWslVJdMh/wvwAag0w?=
 =?us-ascii?Q?xJdKuV+AS7/yw+cANuxwS1D2ea0Eg4qW/BxclCoDCXceREchsgFwqa4F83cG?=
 =?us-ascii?Q?twsfdWaYBzFP5WvovJFIBnmt+7vQtPb+qT3oH806lRqKOStMLotZFlXV++YY?=
 =?us-ascii?Q?MGYPnRKNxzOt5TR6Ixa45awa4H8AK/u9llHj1oqpaU7Qb0BWcaVGyqOOkr2c?=
 =?us-ascii?Q?WoChqkOQ2bh3fhzd5k7KzRWY5lsrRQ9iz7MlJwGVotPdTYNjREYD+OOZ3ouR?=
 =?us-ascii?Q?3lVo70Lnx1laKr6ymdNjMnAZHAwuf8JWzRj0aBy9SPdN3nX660nJQF5K+Abg?=
 =?us-ascii?Q?2Cs2IZHPh8me+Sdoz7AhK6OnWeRNS65qejMOFRDWBdi4rIXNkiztaHhkzigz?=
 =?us-ascii?Q?Yuw43yDkyyj1P1Iqh/B4diJv7KERtyX3nspAty+YUYUOg/OteGraTN+zf91m?=
 =?us-ascii?Q?Hl46lvT1hYIRSciL7yR2eQex2BGq1E95G6BI9U+qGVOTi3IVx3fnnVLhvFza?=
 =?us-ascii?Q?C5vmdk/YSTFJCR8he+FCkgZ1EGAq1hR+HG3APblKjp5MMIVgjZNXVqFPsIst?=
 =?us-ascii?Q?GQphS6aEQp841i6ljlEAfo6GOzH+JaRTTNcDJAS8vA1Tp4cvIM+IhLYtqiX5?=
 =?us-ascii?Q?OCxNb9UNNQoypDjOKp8NrjLOJDZQaWSUQJszkRQw+VCtSAlWXU1YTjA/tqcV?=
 =?us-ascii?Q?7lZont0WUqlVjantD6rgqb3GpsoTnUlz4r9l4AxggLlG5g/fbwa2Mik38Zfe?=
 =?us-ascii?Q?81Ii8lqEQZbQrI99FQfq3JPoVxZx4ldljOp1jSY4K3aHkpRpuO7kWEur3Poy?=
 =?us-ascii?Q?LVAy0gWrBGxydJZ4H37XiRrqzsK1v8cC1CB60bx5t0Q9WPkJd2BiQa2U55mi?=
 =?us-ascii?Q?5JxaJdXu0rizKSaTec76g3t5QfiBGq52AnWF2KwXy7cnjz7UqB8UJ4swiDLT?=
 =?us-ascii?Q?c0MOOyI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ToI0jIct1Bu/Q7IVR1JVvF23+XtMLb5pn0L4+/98c8XrbmVYKfVUJRoGrjDd?=
 =?us-ascii?Q?NerJwrL3UOD1dpucSUJfzcNZQe8xBRq42zMMPUUBdrHvZAH1vx2BiymHKfZF?=
 =?us-ascii?Q?zbFg2Mc+1EZhsLIFRy0SKxgkgC4u+0RQTT6V0MzPc0ZKful2zL5L3qKd/Nkc?=
 =?us-ascii?Q?/RvevIutG7xo6uy5QU8rLsS3aRKKjdK5YWsLU5buchj4BC7JfoJrSBp8DfWG?=
 =?us-ascii?Q?JAOuoWEJqCcwANVEdoZw7gfyj9oY5vA92qwDcEdL3a/NZzWjx8tDeBzyl5vZ?=
 =?us-ascii?Q?hAaiesv6C22N5rqbiqGPrUchrDmxCEjspgWTwJqvCtSKCWYlGbYb4PRtmtBC?=
 =?us-ascii?Q?9i8UPx0bC9bMDiciLJQ6LZ/CoNRtwlGOviVxtfayHAsCLQ4bFQqVcGCKxqCd?=
 =?us-ascii?Q?ajfAL9Ke0QV7kBZaDF682vxlrVnRA6TLOQzJBwBPosqb64Sq4Msz9Ahwf2iK?=
 =?us-ascii?Q?ApTx6L4ZbjeE0FZVAWE3g68kpDHv4AyCYJAWcij4KD6Fn9DZxu/1mo213HE0?=
 =?us-ascii?Q?1aYTxg3mWWK3yFjdScmODc9g09eVP0m0uLTEg/rUlqvGQ3It6YE3YA+wnrs0?=
 =?us-ascii?Q?BrZKjUTXiiFT9J6RzsoPObqTc4g+DZxGtLK8BHZoVbpsPIVhaKuJCpARTps0?=
 =?us-ascii?Q?GoCC1buy5RwqywHF0goz4PbK6N3SlIot0LZ+nl+LkBdo3I/2wjFfpvilXV5X?=
 =?us-ascii?Q?7enAFouDtwDNc44CRqVH6lV6H0VZ1BK4Jk/jgOT2JMuAg9OoUod7meo6/9ta?=
 =?us-ascii?Q?Ycu4wrjUGK89mpscvpY6NrRwxIGmiLjaVHMBhllOeLLYtTl1qbYf1wXgwHkY?=
 =?us-ascii?Q?0bOG23bbCX6xWjwEpKJmqwPFSsVB6AwULOQ7a26Q63tIo+KVzOGem7cthwcO?=
 =?us-ascii?Q?FPUCc11DtC7+oA3mLQJ1d+Gk5k4oEt4Us//2pA6wME5q/ZHnYtCifWm2PhFB?=
 =?us-ascii?Q?idbTjG84Antc2IRGA3zrshCz/OpPDOQplwXU1rj2cYl27HQulEKX15qqRvvf?=
 =?us-ascii?Q?Oe3jvk2iDVSOvPnnYlQjr569p+osEiGNXEpAfN8fnkJuImsk3qBKczkj1Y6l?=
 =?us-ascii?Q?vqaRa+6BviAeFMlKjMAcWYS92Itn680NXpTXqyUEbk+mnr3i+dSEuBoNIdff?=
 =?us-ascii?Q?zCR1632khD1hZEOfiNGlMZnmjwmNm29rYdRPuvMCQRfZbRVmFfYr/XWWjsVR?=
 =?us-ascii?Q?nqhq75C09JCEhA4BT4QL8XeznaapPWL3Y7hYaiwLfsnsplqsA2ZftXTHMadJ?=
 =?us-ascii?Q?onAXY7Nd5ujE0tVT8yRMVoPaLb+x1ph0ORKgVK4tQ/qtAZCNR8qtkHgY9j6D?=
 =?us-ascii?Q?Qg0oXl2kquxNaeadZxkAFumG4ujRMYysgzVDuVoWTaD6qgqEfIBRs2DmsaLp?=
 =?us-ascii?Q?25hbwTFfkBAk0B170VLN7s4ByMwCVcPhDtjdbqGkvc8co5BpSkaI8ACgI5tM?=
 =?us-ascii?Q?sr0cKvxUxErrV1egSa+7pRaULCzFtbU8A5KgVgwP65f2GDVmxSQfQgKFuNbP?=
 =?us-ascii?Q?KNOnHSutNaWuk9BXnhzBic+ECHRUNO2q9Ne3Kh2iK0ohMIC4Pb1whLvIptVd?=
 =?us-ascii?Q?lpag5hWsKnHi2NSkdQZ/gijqfhCQPlOfq0Yeo+ECxaBxyCrXaGnstYRDHL8G?=
 =?us-ascii?Q?XQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff33d49f-626c-49ad-de6a-08dcafb6bfe6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 10:11:01.9190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JwaCY+4m+cZQ6yKxH7okri6qsSQNgJ8cZ+jE7B8bFCdXwxDBpwbaXO6rLm/QljYryFXeoTqMXlTuci7y1JjCVPJO7mnQXWicz9EyvISLns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8238
X-Proofpoint-GUID: bLZYdE2fZ4WyNfK6o7mUeG3hy8WdDAd_
X-Proofpoint-ORIG-GUID: bLZYdE2fZ4WyNfK6o7mUeG3hy8WdDAd_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_08,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407290068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:11:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202609

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

[Bitcode] Add some missing GetTypeByID failure checks

Print an error instead of crashing.

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../llvm/llvm/0008-CVE-2023-46049.patch       | 34 +++++++++++++++++++
 meta/recipes-devtools/llvm/llvm_git.bb        |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0008-CVE-2023-46049.patch

diff --git a/meta/recipes-devtools/llvm/llvm/0008-CVE-2023-46049.patch b/meta/recipes-devtools/llvm/llvm/0008-CVE-2023-46049.patch
new file mode 100644
index 0000000000..c34e9ae69c
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0008-CVE-2023-46049.patch
@@ -0,0 +1,34 @@
+commit c2515a8f2be5dd23354c9891f41ad104000f88c4
+Author: Nikita Popov <npopov@redhat.com>
+Date:   Tue Sep 26 16:51:40 2023 +0200
+
+    [Bitcode] Add some missing GetTypeByID failure checks
+
+    Print an error instead of crashing.
+
+    Fixes https://github.com/llvm/llvm-project/issues/67388.
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/c2515a8f2be5dd23354c9891f41ad104000f88c4]
+CVE: CVE-2023-46049
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+--- a/llvm/lib/Bitcode/Reader/MetadataLoader.cpp	2022-01-20 13:31:59.000000000 -0800
++++ b/llvm/lib/Bitcode/Reader/MetadataLoader.cpp	2024-07-28 21:35:31.062992219 -0700
+@@ -1235,7 +1235,7 @@
+     }
+ 
+     Type *Ty = getTypeByID(Record[0]);
+-    if (Ty->isMetadataTy() || Ty->isVoidTy()) {
++    if (!Ty || Ty->isMetadataTy() || Ty->isVoidTy()) {
+       dropRecord();
+       break;
+     }
+@@ -1277,7 +1277,7 @@
+       return error("Invalid record");
+ 
+     Type *Ty = getTypeByID(Record[0]);
+-    if (Ty->isMetadataTy() || Ty->isVoidTy())
++    if (!Ty || Ty->isMetadataTy() || Ty->isVoidTy())
+       return error("Invalid record");
+ 
+     MetadataList.assignValue(
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index cedbfb138e..c48650c296 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -33,6 +33,7 @@ SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=http
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://0001-Support-Add-missing-cstdint-header-to-Signals.h.patch;striplevel=2 \
+           file://0008-CVE-2023-46049.patch;striplevel=2 \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


