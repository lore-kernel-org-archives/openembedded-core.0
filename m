Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9F0C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 06:07:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4091.1720073241172241330
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 23:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7915550ee8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4642CvxI028941
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Jul 2024 06:07:20 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 405jqy052y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 06:07:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvh7Wki4dKvQVAahHgMLdibEjbrcT3Oy9CCGEHfTqs+ZjT5IneB5+0H51xBSTCJnJFYfCbEz131Ra2POr4slbgmqIGbWGfe5vJdIzr/qgSDHJTGqz89O8jWd4ZbQBnKA2sKl06wC/XsqYirHmYTDvnQeLZ46VBq4faMl9nKSNwjpHpsII7k6kSVxEDkItUnoXj3tFsOLT6/bVjPAiR3raymFZY4M7ievoGSDvnj9VeNACUGTSlRn9na9leew5SD8yK8/repgSH+EPi5uw5tIjRewq/0wb25b+uNT195AvqUM0CPH4vffyKm4VWp75rrXrAq2iIYPq+qh5l4q/cs0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voSuaGze4nmZuWr4sqEtr6Y2iz5GjhftjkCaNWmMnkY=;
 b=XAG5Kb2qItq5DoKANwG3HJTF0l2CoOInwjloYpDRSuWAdEW/NFWIb5hnqGk1AxclkN1k+YXlHuJtfqPakhBx0FINaKiKt0vf5rbt/IfoZQbOSOcI+epyeyBawJvrBhq6zR/SiSZUB1Ihwfe0Wutg3/lVP2cTAZquKgGz0U7Ilin6f3ZDckwmHeHAfgHbw5P+CyxXhSCsKYOv6X26IkojheiB0lCFVhJUlzuQwqiH4u3vTogu1LznOH+Yd15Y5/q7Qjom5nsmiMyQSNI+5uei/9Xe2fswSKuE80smTnJGvIraMwZk04h/CIDXjNp2SArm1WeI4F7FsQ0rB7ws+tgUiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB7765.namprd11.prod.outlook.com (2603:10b6:8:130::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.25; Thu, 4 Jul 2024 06:07:18 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.7719.029; Thu, 4 Jul 2024
 06:07:18 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V2] less: upgrade 643 -> 661
Date: Thu,  4 Jul 2024 14:07:06 +0800
Message-Id: <20240704060706.238054-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB7765:EE_
X-MS-Office365-Filtering-Correlation-Id: b9d782ac-2537-440f-338e-08dc9bef8f75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kPgMoKTGCYVc2oP4O3nJjBaHkRICBnnKdK7bsHADUUaaC7xuYnVRfCVuUVTA?=
 =?us-ascii?Q?84LBoPYRxH6NU1cR7v60uD96+xlKqzUhMEsfmrfRo/HYv333Ty8zH3ZxSjwM?=
 =?us-ascii?Q?RJOoOoSQfdmAvEymJSvR4k3GasTefPCk5SvdFzRx+9JQoz7oNcxsvsH96Y8B?=
 =?us-ascii?Q?XV8kDSuKgpa6F5gW4tZ7LBIRFcoH/F25U4DhjDR8pr2x4K2TRmXY4Sy1jRP8?=
 =?us-ascii?Q?ThNewx7PJfD+OqtxsF32+6EhOYZzt0GXamztm82cMIXjcMW1Up78J1PsxcPM?=
 =?us-ascii?Q?cud9WV9CmnnNePB/rF0xcO55Q3xqkDzO8rbf1bfqWWIp17l+V4eK6fcXXeTS?=
 =?us-ascii?Q?v/Lk/DNZDzljAyNwCgd0Wp9gP5lvWN2v8aLPp4Yw3Y7cZ8awEaxe8LvtX3/G?=
 =?us-ascii?Q?TE1MqowRghwYK+C2r+/jNhCLVAkQxxJPi8WFME9wWHwuFyHENqNTrrFO/tQd?=
 =?us-ascii?Q?wV30BAuq93+pxIDyUNjGGYw2dMN9tTGWMCaLsodXf15VwIUNi45d7eUx/Q5X?=
 =?us-ascii?Q?HvW5gTyLS2l2VbdgPZiKkCeanV5qS1l7bjQeMJxq/mjkgdyw94UPnno3fK6V?=
 =?us-ascii?Q?LFfmt035VIE6YukcbjyC5X4Z+w0RCnO95UzLQTVTaTV6JeYlqvJn1sZDyKL0?=
 =?us-ascii?Q?LGgvbf6xqla6uk7nzWNtsTAEfmVOnqfiLTP8RkLTBYQfBwrGYnVxQAN3jbNr?=
 =?us-ascii?Q?trP0ZmnYnuuDNszmBraacE2LP54dTycZjtUTiEo06gA4rPOTHemByGOhfTOE?=
 =?us-ascii?Q?IJ1et0UDe+ZvemJIK49rjA+nrd2vMmVyRqe4KwSKBGvotYAcLTnz13NLijhI?=
 =?us-ascii?Q?q5+AK67foPTixs1c4fungSlC4tFAakhYf4wm6lbSdp5P6LEs/3AxjLJbeW16?=
 =?us-ascii?Q?zBU+m4zl6tR3M47v/vF+XUWvapja4cq1oLrmeDrGqpyfagv9khi6SjLaBjtU?=
 =?us-ascii?Q?Qqyjh3lpiE2/CiJUfrL/14IZKkifHnm673vBZr17Ja/JdakThYJsHbTb14yb?=
 =?us-ascii?Q?FbYjTZbLwdm5ggsI+U7WW6VYAn1/fv8ynwsklLHMh0oFhcbQItZZWsKo++KX?=
 =?us-ascii?Q?2qZc3/hdj97XNbPN1uEBnlPWRPj6zSlVwV72u8BuPIC1NcJUhrwLupFhV/yD?=
 =?us-ascii?Q?xpbnrOtnOIbjFW2512FSZPLrhFQA0bZk2VQYELqF1mMeD1StOrYwLMO0rpuh?=
 =?us-ascii?Q?mGgAqJxDCZYP5njxmvZu7983cZ/FeJ9C2gPwZB43xUiaGun820ZNVrwJkFrR?=
 =?us-ascii?Q?b65kjwtart1WM5ZOS2jRxZi8NucaxC8P2gHFVGmzO9lkNF0a2vtnrw4TQ6mc?=
 =?us-ascii?Q?JuHzmdvLRhAqfkxdjIif2OjD6VA+1Srzw9b8ofLDQWRhqbNvn8LOksFfBv+c?=
 =?us-ascii?Q?TQXH0Co=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fxzu4TYqOkBVueCOjkPb4gVQkWjY66ic1qv/qsMHDsk1gUm19pFfP/w/6z66?=
 =?us-ascii?Q?3ltL/gA6VpV9pQSNVkmECdK3Pa3OYNfq8Cl/pPNcPynGKK37b/PO+kEnkek+?=
 =?us-ascii?Q?ucTshBxtrr3TnA1nvJaYbNl/a5Bo6nIXTaSjzNf/ZD61xxaq+yMneqxTu1Zm?=
 =?us-ascii?Q?wpmAAyhmcLXFx9dV9xm8bqQhGCVXQhk9h32k8hQ9eKujwx3vFCke5NqxDtZE?=
 =?us-ascii?Q?SNz4WT6CWKOx99JIxWr9shzK6GENANyEkPo7ZP+Nozzxfsq3LLhjcttxaf0/?=
 =?us-ascii?Q?kjXtiOqSiYQ6oUcLRLahZONaNjMM/YZ0tTdAXhQ9x0ML53voirBJVxzQ+HFT?=
 =?us-ascii?Q?obptgnCxXhgYWUBBCUe5uCa93k2fTrcUBVYDlL+NKIseJgrt/kntLSpzlWf5?=
 =?us-ascii?Q?ihInd7lS8v7FEQRv29AJnK0QGKRA49/lyDiSQxz96AsmshRCx9JseJd4Cnq/?=
 =?us-ascii?Q?lYE/ofbnCQWkuxs0O+GZdW8A+VsAk5ACbQLSB0etSuuqPH9JonnBltbi9plM?=
 =?us-ascii?Q?3u0U2kVS0KC0Obi4W9lBTm6e0iYxSWG9Xz7Tafg7XN1LtNukGgW+53Ns207r?=
 =?us-ascii?Q?b2PWIHHeI0sRwiikcPe3O0ehXJHBJlAiJ2iYFvQ0ju0r97dtO2K8iQ1B7Nod?=
 =?us-ascii?Q?AsgdNmHRnDb7X6HQiyQ4tvASazw84VS6uWq1PPNvB4kNMedQ0kqawCp6HIwl?=
 =?us-ascii?Q?PbC8ezgEkVo9OIX9wSGTB65u832Q1Bse/QMmCbvQFaXc2a0Z3F88xIW0aQKy?=
 =?us-ascii?Q?ZA40Os8j9ynB85oYspx5Zqsmm9+ARddCWWGfo0wJujUIzty3UyaQzC1NrVmf?=
 =?us-ascii?Q?8lR885KB+zvnRtj4B0TleJeEnF47fcczM9Q6lm0X27EqTBRYObOPQyqWziv0?=
 =?us-ascii?Q?khUi2YOBBoJwoe7kOXY+lQv3NvFXtLzZTK+O9j9dVDeVpo4QpAEI/lEcVxR4?=
 =?us-ascii?Q?3dfW/fVRXHNhfVBQP8D1C2TKzS5aD6VOxcrtySelFRFY44b7fmML9ZiAaRdO?=
 =?us-ascii?Q?Eh8WhlPPoOq2vGnyhogs/Zsm4++RIu2B+4u2kceUc+Rrnv0BJv9Afb5lrhix?=
 =?us-ascii?Q?eS9+Ajb3isJL+ymJbgGDBRhUxBwpX6XSSM/gIhAt4N6wf4HGhYFbiqgSUzU7?=
 =?us-ascii?Q?QMp6WI7cYeX1B+P+OU1hyjSIiZwkJOVnIMQhq0GlNuqLrthLzXsl8n5CnRZN?=
 =?us-ascii?Q?GmdtPb8VL/JuaE45TYi0TUBHjOYL73ArLaYwlPB07Tg2tZVF6+uJc2Y4fX90?=
 =?us-ascii?Q?2gq54KAPOB4AuPamoC/A9atbIM+hCiVk+fXLv409NgR4Q9EOAutlSiuMA4EY?=
 =?us-ascii?Q?+UA4F64HSAE2geYDg4PSxlhKkkhLwRp/kg9ktGcK77kD8WUd51WFnye1sMwc?=
 =?us-ascii?Q?MHUOeebGlRAJOwCxEEzVecp24Km6nrC5q90QgtOSvozb8pLGhTFN1klY3N9t?=
 =?us-ascii?Q?yDJqDo0VL8x8keHQlzRl9iXhdcyExH5U8l2ggGPhJJ4gzAlctLOCFQ16pdbS?=
 =?us-ascii?Q?0FjwnUEB8TvEuRwLfZfHhgaSG157Dvcuzm31YWAvvuI7UruVF3i1MLtvDVEu?=
 =?us-ascii?Q?HaHxxRa64MU13rJpLiqKBgB3pTJO2VUaRJQCwEFy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d782ac-2537-440f-338e-08dc9bef8f75
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 06:07:18.7308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ec74Ejx+kIN8bOPrV28gBddWcCoJavI4kuPPdQxGBMHOe9VizzQdMD65aouCuDqv+FNnk9LhnPWbL+X2RLwhnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7765
X-Proofpoint-GUID: -dpYsVmcV9mkGMzhxNwiwE1FhVliNaHc
X-Proofpoint-ORIG-GUID: -dpYsVmcV9mkGMzhxNwiwE1FhVliNaHc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_18,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 bulkscore=0 impostorscore=0 mlxscore=0 mlxlogscore=829
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407040042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 06:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201504

ChangeLog:
https://www.greenwoodsoftware.com/less/news.661.html

License-Update: Update copyright year to 2024

Add perl-module-file-basename to ptest runtime dependency.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/less/{less_643.bb => less_661.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/less/{less_643.bb => less_661.bb} (88%)

diff --git a/meta/recipes-extended/less/less_643.bb b/meta/recipes-extended/less/less_661.bb
similarity index 88%
rename from meta/recipes-extended/less/less_643.bb
rename to meta/recipes-extended/less/less_661.bb
index 67834bdd58..061a494f0f 100644
--- a/meta/recipes-extended/less/less_643.bb
+++ b/meta/recipes-extended/less/less_661.bb
@@ -21,7 +21,7 @@ SECTION = "console/utils"
 
 LICENSE = "GPL-3.0-or-later | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://LICENSE;md5=1b2446f5c8632bf63a97d7a49750e1c6 \
+                    file://LICENSE;md5=ea7ea443692720f3015859945c0fb65d \
                     "
 DEPENDS = "ncurses"
 
@@ -29,7 +29,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "2911b5432c836fa084c8a2e68f6cd6312372c026a58faaa98862731c8b6052e8"
+SRC_URI[sha256sum] = "2b5f0167216e3ef0ffcb0c31c374e287eb035e4e223d5dae315c2783b6e738ed"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
@@ -55,7 +55,7 @@ do_install_ptest () {
         cp -r ${S}/lesstest/lt ${D}${PTEST_PATH}
 }
 
-RDEPENDS:${PN}-ptest:append = " perl-module-getopt-std perl-module-cwd locale-base-en-us"
+RDEPENDS:${PN}-ptest:append = " perl-module-getopt-std perl-module-cwd perl-module-file-basename locale-base-en-us"
 
 ALTERNATIVE:${PN} = "less"
 ALTERNATIVE_PRIORITY = "100"
-- 
2.25.1


