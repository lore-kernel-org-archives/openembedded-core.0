Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D61DEC5320E
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:14:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.70792.1724735652905445880
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8969ccc756=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R3ndwT004388
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:14:12 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 417f1kaaj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gwtF5RE+vEa/FHkSNMr3xzr2Ju6KNHNCvaLBpQR+MS0Nf2h3qAZ28TaR6G76N2mdp9SuTQtgMbcqkCekodY34oXJMl0FtiTbQqrCZ8Ix6+tj/kpE+5Ai4Pk7aWBAVPINd5zL8twURrbD/4PAbOn7I8srUYb74lhVaxQHvY76+1/WoZk4nqeMao1nRijnRB7F0Ux18wF0DVywIX8FaMlvdqRLwWE5yw+RS92DHqtjI6aOMSrU2lqPG5VLwiR+Hw/1QnrTiKYOeCnN9MasJn9UZoc1M2di+tjEkYHYebStIbVR3TOT5gKHegj8ClHAHcdO9c7WolCz4tiGGFplmT1wmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/slROxYIBtbXnUEl0IAfjTAl3KrbkHgtelHhC4R0F/Q=;
 b=LnBY23zB90DF/DISMQEClar9B57pLHGlpkfm4rIovthZMj02tbhDaMhkqIrC5TfS5Fm7ArXQy0/6kguZrTuy93MRWB1rwkhiHgAzq8RfsHLmYx9RQc41Gp1ufEBij8MTEIbVTTxGt5c6hZiHIj1bENCVY4qunKRXKtmytVzE7k4oi6rr2jIxehkWnYXEuzLp0X+o6XGdsMVBEmf9lI05jcc7foJnHma3JJuhniU5ZfeDWy5CnZoJ4tMUOjGhTXVEMplq4Wruw3qb7s/4JXOXOKVA6k63UVSaRa+wAO6WnVtvYCCkmF6IzYmNVEziunT/9hvPExwUef6lhFHzHZ6RKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB7962.namprd11.prod.outlook.com (2603:10b6:510:245::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.21; Tue, 27 Aug 2024 05:14:10 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.7875.019; Tue, 27 Aug 2024
 05:14:10 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bind: upgrade 9.20.0 -> 9.20.1
Date: Tue, 27 Aug 2024 13:13:58 +0800
Message-Id: <20240827051358.1265054-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fb6430a-336a-4fda-3be5-08dcc6571514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1+p2cDBxfTQ/SkPjBym7A9XY0NEnirXBjEyXpq6IZiX3OnY3jFBNl4LL+4Ss?=
 =?us-ascii?Q?FzTcWYobkVC1XwraUcKPa1emi73+cIxkYlJYpo/XTzb6tv8jtxGgXCjxZug0?=
 =?us-ascii?Q?yFyUh2hgJtLpW1eGuwxW8gVBHXdVgY6H8xj+u+E/DQ/ICYi+UrHpkotUVXh3?=
 =?us-ascii?Q?vV1Zy/iQziWtBHqA23KrDEFrvbbhP5PYrGq26Tyfm6k4huktpHrWIPgmJgaj?=
 =?us-ascii?Q?wCHGKbDeBjfPXgV6EIHVnbS2NfV3PjrB4lAOjfVhSVWSRYfINuijnPI1ZTXF?=
 =?us-ascii?Q?JlmuAR57HPq4btEV3Y0w1/ExP4yVJMeGz4eKS5qNUcGwhA4o3ays46Fkl8M6?=
 =?us-ascii?Q?NRWD9kd3azBAk0Fr94e8oo7iK2wMJOUlCBh4en8DGz1PyuhBRrgI8G4Yvuf3?=
 =?us-ascii?Q?vNVNC/MXZcDpGEZ/KalRvZ03M3D9PZH7cYyaf5CzzrPYFSoDeglmqU7TyUl8?=
 =?us-ascii?Q?lWLUbHnAGFFbRU+SuU8K9DHN1QSFui5nvn839ZjihBYxRAEX0MOJ6FBIfUm8?=
 =?us-ascii?Q?fTU3A/uygRotvyzeL9d/1o1YvyIUlvU+HRh0eMXzkQjqXhxVCAVR1Jhzm+OY?=
 =?us-ascii?Q?XstLY19Cd5oRjfVTcw6vNQk7nnlx9Qdoh1iOgATWwu/hoYadxVHiBwVOoV1T?=
 =?us-ascii?Q?mI6OkdwVCOWYUBk5ohoP+m67NVA0yE/nOiXxYB/TvrklBq7FOj28MLOeD8pv?=
 =?us-ascii?Q?DkRvXBN/KkMFfMj/a6UhwHvEbz5ZtEhJ+zV0Gubv9aGBAbslFKWPZdzE+7NC?=
 =?us-ascii?Q?wuI+RwOI4Deo1EGYV/PK+ItB2fqizE6FAfRDY0PDPr9No6s1r6T4D1TPSv5L?=
 =?us-ascii?Q?8OzZfK46lAFGGQ+A16CS0s5yVfUg6TLatztDY2K6FxbwS1C3CXDyVR1ibNoJ?=
 =?us-ascii?Q?FdlWY/jKXrRuOAxJf25xDLquLmO/P3hyrtf9AyTYPBWi87uy92jGOfdKKaxX?=
 =?us-ascii?Q?ibl4kDGvARZF5qgSktKdDMggnK5O/DwAB2xaYejRjzJl6IE6IOzfNGCWv7Nx?=
 =?us-ascii?Q?3ig0Bxob0OSAfoxGJF+I8tcwPl9I+OZULp1Z2AJaA9XTdKEud+e3m2uAWgau?=
 =?us-ascii?Q?273FpFlBvmK6usa5L9P7OE1TrA+ykq/5uhJIIMXdSguNBX0lGg0TWd/xLTbd?=
 =?us-ascii?Q?uBNHoMocKA8Sq9a+qBOb/kXEjA3+PAIjlKvljNAqTJnrr5wjsRzaSuF6bf0b?=
 =?us-ascii?Q?40b8mxXjuPkPNlKI0pLeAJ3tQqqgb/CePFi9EGn5rpuxTfF5Q6+sonfc8CXG?=
 =?us-ascii?Q?KfpFEqKgyPCDrzI3L6HE2eHj3mncZ+gYTcvd+b2GQD8g/17C1aF3UswKdYeR?=
 =?us-ascii?Q?mh/xhoR0Oexl3zinUYIYCshE9EowiDkhqA9rYoUpc6NMv1dKFfO320mBDCwN?=
 =?us-ascii?Q?T/5ma9s=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Z0vp+QDuTDefs58bMeUfOvZidLl78heRkHuKvHlNyw9UjS4vGrAHlg2J9Ct8?=
 =?us-ascii?Q?VRizjeWWHAYDNTACMVUGs2vpmkqsH6l/T++rZO7qDGQ0JLhuz4Qkx6TaHquj?=
 =?us-ascii?Q?80u+xGgLUT0ssrRyo+sydHy3FPRNZSea9UI5Nquapki69T54xs0tY6qzfHDw?=
 =?us-ascii?Q?r14BN1dolnrtUpEnpjIhzbcN1SZXGEshJN7OwLQx2oZs+0eDzgJeRN00xLD4?=
 =?us-ascii?Q?W45Mo3q0JxLkqOSrwx7wm/rOJwhwAbmhVMCKtoquWYeUTZUUMOvsHqc3Fj/Q?=
 =?us-ascii?Q?BhIM9hZvdc50ucHSfDGja6uXINlTXZz1PoqmyNOIG9mss2By7NrYdli12JVW?=
 =?us-ascii?Q?fvPj2/2z2cu6OBbemE5ib02aKv6CgEa49b4Nh+YFFOqt3CK7uneCy+Cm3f3p?=
 =?us-ascii?Q?5wJQFwX0tTf7dmSxVt2eeVeDY9L5IsuYt4JqCjPsB3bf9ggKjhLcuM8ZTkrS?=
 =?us-ascii?Q?8ctPF2vaknZia4Tq1I92qDROKZF98Hp9rN45y+I8mrFDYscCh7YtLJeffJ3+?=
 =?us-ascii?Q?bPpQwoQ8WO2KtFHqVgI9XxNejS4zrpx4wK6B0wyRdhJf3d5uRbo+I1khIBo2?=
 =?us-ascii?Q?TNM4kriSmRxPOLrfsQZ3V1u+pwgsD3TcSixs1MBk+etVIQqEOLRO24OXPTcD?=
 =?us-ascii?Q?UloGKtV3wTia7ZniUnV3ZLYwN1G65FOUA48KqQdewmJEBbJV41pOVOWKEPCE?=
 =?us-ascii?Q?0Q5G3NpbAr3CoQWOfHQLywPmJ+uJnvG7x6H/ijMUwd6qrHMYxrz34fRPQ0Ec?=
 =?us-ascii?Q?+RevDneHAwZzGGhRq/tt4x8aWrYvhVegWn1joVcrjQmFCDOZsB7pRqd5girE?=
 =?us-ascii?Q?8x6icRrXG5/x4TS1Q37yI4f5J0UrI65Qjho9Rg1dNPxsZK5e3djtsdweHFue?=
 =?us-ascii?Q?QbiXzv9ot5YkJa3L6ezb9QoKCvXBSkxCBlSbKmWMUBMBh4J/2Y23dFtQmvg4?=
 =?us-ascii?Q?km6wm5MRaW/v8UWGhrLqRe+FROsd7/XsKHkhJpL6w95N9u0uOmK9vkmbO/LA?=
 =?us-ascii?Q?fwXJ8AWHS15Ii/VbO0pM+zxroolkq67Si/ondTyht3FvksMmG4b6GS+GJJ9M?=
 =?us-ascii?Q?OI/ZEFIOPuyVxj4IhodTezrblkC5znx67MAcmOXzGMUer/waDXcqWwg188IX?=
 =?us-ascii?Q?Mxabt283OaIOxBzQve0sHDdJUxu/NeM5FAv+6M4baSvxa2JBu3qE1hvJqsfm?=
 =?us-ascii?Q?dn5DVZzbpEsbcu/xsUZA0J2AE/EhTG2WYcZf96u0oYELYj9EpmHR8WP4YheV?=
 =?us-ascii?Q?e9jfW0X/ZC+otBUf+jLIDGC8SMIbYtnXdm8yAvI33343H6PLHaKtVk5xIlIF?=
 =?us-ascii?Q?X+OezEPKuInU+C8YST+tn7Ma8RiJuNfA1LmZM7Nmf/FAF6jpa63URVMOOgTJ?=
 =?us-ascii?Q?FkFUogx4WGMVJoEkxQ8RXq6vuUosh0759xw/MvI0rdLz0SHKUmxzvV2FGfhn?=
 =?us-ascii?Q?g3NQUvzkV9SchqH9RgGcleeCPK53ESyp1rdYdEkcXew/CVVWYAvqqpUjTtHa?=
 =?us-ascii?Q?i9LDrFZzjPmt881knyQVUr6hSAk6rKhrG/jFpFVK1k0zX5k6xofHzFf+lCV2?=
 =?us-ascii?Q?uTuP9gG2ABgxvWPInVak9zTvnt6zzJvzzSPcziWV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb6430a-336a-4fda-3be5-08dcc6571514
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 05:14:10.1138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E8MmFsbmZsyu7xb/Xgz29ishnuRhThi7GNlu+VhdsT2FTTOBbwKvOb/aC1Q17f17j+SFiR7SFHRfO81TzWZgSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7962
X-Proofpoint-ORIG-GUID: 6ic4ovVvDxFngTxR_VRvCSN3M4Ss-CdY
X-Authority-Analysis: v=2.4 cv=McQ+uI/f c=1 sm=1 tr=0 ts=66cd60a4 cx=c_pps a=19NZlzvm9lyiwlsJLkNFGw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=SCo1hh1FAAAA:8 a=t7CeM3EgAAAA:8 a=kKj0njlCt1-cNRc-JMsA:9
 a=MifNHfofrAEA:10 a=jjiDOD437DYA:10 a=nwb-CePKZZm3gL-ai9HY:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 6ic4ovVvDxFngTxR_VRvCSN3M4Ss-CdY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_04,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 mlxscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408270036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203776

Release Notes:
https://downloads.isc.org/isc/bind9/9.20.1/doc/arm/html/notes.html#notes-for-bind-9-20-1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../bind/{bind_9.20.0.bb => bind_9.20.1.bb}                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.0.bb => bind_9.20.1.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.0.bb b/meta/recipes-connectivity/bind/bind_9.20.1.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.0.bb
rename to meta/recipes-connectivity/bind/bind_9.20.1.bb
index 07dd38f04e..71d2324b84 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.0.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.1.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "cc580998017b51f273964058e8cb3aa5482bc785243dea71e5556ec565a13347"
+SRC_URI[sha256sum] = "fe6ddff74921410d33b62b5723ac23912e8d50138ef66d7a30dc2c421129aeb0"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.25.1


