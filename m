Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E231C30658
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 00:47:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.40585.1719967630849685566
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 17:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7914ac32be=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462NUlG9028885
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jul 2024 17:47:10 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4033em2jyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 17:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKd2CW6Gu+EwwimJ11m8S7ycpxzUdi1igV/g9NAWkONjZUqxoOH2UoeEfQiepriZaA+SNyFAbtFPDv0+WVf/aT3CG8ochPNACZb0M/11jDfZl1nXBApTpuvh2GG8UU8TMWRhFliyinFH7A7z7v0ft1izx0T5/pN8vtLEQqG6+PnFx1Bv26UbN11CEt2v84sbx16HYMKBgwbnLLJpbAuiOjFCY9qJAr/WlTT4Rit/CuKaJz2Er9BIr51Gp34Mq/7UVz8Z/5k/wHRTr8CtsbULLNS7Surlns8zNkfkLbubGTA18HUVsz44W2spLuwMpreiWHEoQuSR34EvuwD/RHIi0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VsRhAl6om71ijyAm6HZ4f/sVR5iGBd406DichsXQADU=;
 b=BVy2ELl2tSQ/HKL8tumrC4WsFmjYoRD7Dee9UXGpSYGhctDmD15JenPpY4LJSPn/uJaawBl1nb9u9K9nBpLuHrvPYBD5MmdlVBjhZ+1tf0ieb0+TXnOmYDNnHeSuw5GjH7mIMbStFfyl0RdBXmaePGgCQTESkKg9sk0KG0zMvThrokKuudHXZXX8VpTqYekOqyOCjN0TriJUEFcm8G9VUrYVvfJqhR0IGCpGnhh+N+5YaCOyRUJNQhUWQfF7reXod0kwHjdsHp91FjEQZ43IVVCvlf3CqwwH++n1qDZDe8qaLnb8Z9rLnvJcBCChXYqcqWYvbhFG1FFOfWjIAhyEGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW3PR11MB4747.namprd11.prod.outlook.com (2603:10b6:303:2f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.29; Wed, 3 Jul 2024 00:47:06 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 00:47:06 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libsdl2: upgrade 2.30.3 -> 2.30.4
Date: Wed,  3 Jul 2024 08:46:55 +0800
Message-Id: <20240703004656.2295327-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0052.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::16) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW3PR11MB4747:EE_
X-MS-Office365-Filtering-Correlation-Id: cf71fc2a-6e88-4239-e405-08dc9af9a9d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xl5cX2tH+ClufjBCZwoxlUh43/y0zLNM6vjjR2kUbj19bC/CE+mJ2nMA2h4y?=
 =?us-ascii?Q?Na9uomQ237/d9iHozEBl9+vnHVR4Poc9gTRd/nW+lFI9o2UhSnDfj9I/HcAj?=
 =?us-ascii?Q?3vulyRJo5p4+fMB2io/DTv+H+a81MyQhu092xekV1/XtMz8Fo8allDnoklL2?=
 =?us-ascii?Q?aMY3b6Z+dsBavd524b5MDUBonteWP4GmuUoEyYxpfmn2CDT7JIsm7OMDzCsb?=
 =?us-ascii?Q?R2x2DuPOaO4L1rfGK6vZHuK+BThPBLqfwmV5Ngu0qrbMwkNxLKnxdlZtPIZB?=
 =?us-ascii?Q?yRSMH+k69U9vAOd1tNSrFfP1/53rcwERS+vvfIPWva7RYNOWcYEEIwAK7KLI?=
 =?us-ascii?Q?gVFM54ne2+YqSacwucx58E0S/I+5GCv9E9N4TMBpfPHWOHAhNWmko7Xjh2KL?=
 =?us-ascii?Q?dFQ4iMwsMY8LKsF8OrCSeMHV+DektlXhIWO0RnTAJ7u0UgoqWY/K2PkIEpOB?=
 =?us-ascii?Q?M25Clxz00DcKOI/lTW4CvFjDqDZRjdIAOH/t4SIjEYI1XZTg509Y/qKWAhub?=
 =?us-ascii?Q?anzATZVFhTL+Tgm6JJrPqxZkQnzHVaU/KpgtYtjHrzCkbdEisryI21AfxyCO?=
 =?us-ascii?Q?jBENAXJwpZCYIwlWTxc3lRJatPmNggUMzAC/dsSLxFw3kVeh/pV/RpHs8Zre?=
 =?us-ascii?Q?0cL7Dk5J2sKSsD1+EgwUM+ai+DuVkLC6UKjTvI/42q2pW0xfoBlPws1wUe+q?=
 =?us-ascii?Q?9LSC+AA6Ob7kbmLKmV6of5LKmOqYZP3asWo4SwvZ5/3ZhB92uqi0VBwB6vvI?=
 =?us-ascii?Q?Pg4VIQgOZzExrgFywDcNvRuqry4qZhYzf1X18JiYAGurKwkx9SvNrittHJrC?=
 =?us-ascii?Q?CgMmkolnpbQb33AtuGtGJlbGzIo8znrAxxqMmL7G/bgw6C6p7KsNb6rft2QA?=
 =?us-ascii?Q?jMUqiW7glQfQfgZH5Xpm33qJsr/7BdUfUaQFW4etV8vY9KXjx2EX+4r/ScBb?=
 =?us-ascii?Q?Nr312SXSjy4xgNw80qNai/iL5tAf63ogBSIyq1tVtNKzb1zft/n+p57HWod9?=
 =?us-ascii?Q?da/gFmMzfUroqE6ShZT7w0nFCuGxG/OH43jX6gI1hl6OMWl0DS9k0oCVZTVF?=
 =?us-ascii?Q?f+R3LWPBDkFQGLT8k3CQ1doxdU1oSH0gxqa8vZVe3bfXiplwkBHTd5W1pzAi?=
 =?us-ascii?Q?bGA5XrqKMaM5okqdrY9gf5atYYmyNSbimD1nwJSKu2b1wLu839IJvhAA4dkz?=
 =?us-ascii?Q?fql/b0sOQWn3p9xavJtjiYg0fnkRaXqmz5EMscfjWyqrljuBxGb6EFIG7f75?=
 =?us-ascii?Q?PHKXDEOifpzdkQOtr+w+5jqyX7wotvE2SLFyGMDU4lwzuwwx+pyJyEhLY5Rd?=
 =?us-ascii?Q?f8GwIQ5kAOOE2dYQ2DWqA62J8nBfepVKnTze56M6uwfoBW5ACGeR2jOUU6t3?=
 =?us-ascii?Q?apiHlHg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?08cxjqVWyhu13v2/4+l4GPsLsUIugv2saP0vSV5gJZa/DoPlDUGQPEIFZF1W?=
 =?us-ascii?Q?8JdIfVkybeZHx5HfyepCyxze4I7OIVGtP8ELj68OaD480Du4BBtKGbNX02ra?=
 =?us-ascii?Q?RbTKTRP8gKu2T2v2/BI/Zok+RCTpbEpxuWiTT5/A0oxpLdXn96HfT3SgZsO/?=
 =?us-ascii?Q?cIJeWAeI8JsrWxEqrj0MfJUW51Wi0gsjrMIvvYHqoUwNWolT1XtmyWVY/iAr?=
 =?us-ascii?Q?l2VD9NwTg7Yc+Es6ZIvPRejUx0tqcx5ulAn1lkMaDFS36Gp8JiZUnazZDEAZ?=
 =?us-ascii?Q?tJngZttMCEwVnm4kmuuJmYENUNICKpHAIclxowvwIYTez1Xa9/1Y6m4kcCxg?=
 =?us-ascii?Q?Ke/kY2lTGPBKwouSDiSkmWKGrmHtx7Y5tGB+lSCk3cB8xtLE2Qw0oSJscPlc?=
 =?us-ascii?Q?KKLuiyXO6RHkbfv7HGooBTlydYEmrIkMjGvo8akE1A1FAUnruaRPsSwrNEte?=
 =?us-ascii?Q?aUgtQKOdDJvhWD+x4JFXegQXhiYia0mO24RegnzvSFtrc37iz34o4YFfJow/?=
 =?us-ascii?Q?eV+vvFAaHvihhJAb1VwsFZOsbGJBttYC9K3FXvfgICWkGvrBR1xHTQQj1wCi?=
 =?us-ascii?Q?Dkg/RU1dmihYrTee/aOQyNHYKp5+nusWeNCozZFT4G5U48exWXxIBn9YL7DI?=
 =?us-ascii?Q?UScvjsLSMsZfy8DPk5pfl1MK4fzIQIdQL1+07TWHcdsIASNKqmY6q12+cl67?=
 =?us-ascii?Q?Niw2TI3gXfXLry+PPRXkxOuAf5ZUCHm2QcKWbPUh3TQE0DF3fCIdyYS56jFJ?=
 =?us-ascii?Q?SgzQ1a/mvsZ/6EwxFvpnIov2osJKjRpzcK36/lCZ8GiHQ6DelTkUDlxItwtC?=
 =?us-ascii?Q?FuNLrp56Kjk9vsp1hPYMQgYTwCDQzrYwyM45c3P5Qj/XLY5Tn/qbMvYkhfd8?=
 =?us-ascii?Q?3jDkdDul2Ax5IT+HXibLZQn4xQfwaDWWrWpQ2gnni82+AwYUmmuE+clEdeGb?=
 =?us-ascii?Q?6OeltSjD9urB53+YF3fX4z+dn/eyWEwaIlD6kpllkQYiaq59aibq9vTy5sZk?=
 =?us-ascii?Q?E535lKg24qUjql7tSN9b/GlhDdC21S0v3GtbiKb7YEGFdnvbuUWJ7GEaEp4Q?=
 =?us-ascii?Q?cHPfS+W4cWbTHhJ4b2H0A0G/uIkTWumRSvjzsqrgzlVb/hiJn5B8Vpq3gbP+?=
 =?us-ascii?Q?yHJxtiH8fD4mwZYzwQ2kt2YqC0wuecEOCT71t+rItgJzqL+v53Y4T96RBeed?=
 =?us-ascii?Q?BeaOO1WZVipy+zVvJ+KETzIT5FIE1Lts6QaO4Zp0Vt/eDsBMJrHwtuT3FZS7?=
 =?us-ascii?Q?2Z/CZTE3T/gr2mKKDmBqVliVBbIbznxAfg6fWOP9izbrXtbY89FL9hbtixWI?=
 =?us-ascii?Q?Bx7m6DDWrlvVwxQjUjcW2lu+z6TOush7bcWR2jdCXKjzJivfVZwPyzBXm2H2?=
 =?us-ascii?Q?y8yaBX5HiXEbjWRVCEz5z0H/EIh9A6tVjvGGrRPUFHjxFrfXLf0cONAzTiyJ?=
 =?us-ascii?Q?CJZGE8WZUpHyW5Q8CTuRQjeJmNALDZKEP2As3RtD1kYY1yKT0PFjI0MP+td7?=
 =?us-ascii?Q?s41dRAYC46p/M2hYa56Zwlg2BBms494UK28Ame2HxoRdLSr1ZwQ3dQwWlYw/?=
 =?us-ascii?Q?n+rS4n3ykJh2TVio25y6zOtMvB4gXOkVqqmxpVTe?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf71fc2a-6e88-4239-e405-08dc9af9a9d4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 00:47:06.8025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbXEb5ExXeh0oDIUnwjsJkbRnllff9AGIB9wlVVx2PWLLnJsVn9JZWcx6u9AAiVEeaLqD/H97lL2T1dNHsL7eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4747
X-Proofpoint-GUID: GjRV-9yJYMzW0uONBsovNkfhRa6IBSqq
X-Proofpoint-ORIG-GUID: GjRV-9yJYMzW0uONBsovNkfhRa6IBSqq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_17,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407030004
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 00:47:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201446

ChangeLog:
https://github.com/libsdl-org/SDL/releases/tag/release-2.30.4

This is a stable bugfix release, with the following changes:
 * Android rotation will respect user rotation lock preferences
 * Fixed spurious Left-Ctrl key input when the Right Alt key (AltGr) is
   pressed on Windows
 * Added support for the Saitek Cyborg V.3 Rumble Pad in PS3 mode
 * Added support for the Razer Kitsune in PS5 mode
 * Added Linux bindings for the Qanba Drone 2 Arcade Joystick
 * Leave Nintendo Online controllers in simple report mode so they work
   with DirectInput games
 * Enable using libusb for GameCube controllers when available

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libsdl2/{libsdl2_2.30.3.bb => libsdl2_2.30.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.30.3.bb => libsdl2_2.30.4.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.3.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.30.4.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.30.3.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.30.4.bb
index 68cc2790e5..a6a3f4ef52 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.3.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.30.4.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "820440072f8f5b50188c1dae104f2ad25984de268785be40c41a099a510f0aec"
+SRC_URI[sha256sum] = "59c89d0ed40d4efb23b7318aa29fe7039dbbc098334b14f17f1e7e561da31a26"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.25.1


