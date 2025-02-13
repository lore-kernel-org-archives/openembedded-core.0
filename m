Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA213C021A8
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 06:00:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5198.1739426422049052863
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 22:00:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4139e44f67=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D5OBsx022595
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 22:00:21 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwy6jkp8-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 22:00:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLjGwQnlUEJ8SGPQ3USrtpBhrBP2mUfXBWb9xbTPknPeHVXZfO42uqEjEXYcTyNzyMNPdPVilLg3Z1ynd9BNKdcjm1zmVxG66XQ1udgPvD0ArkvsurZ+Qq8wSGQPIFNmv0SCSpz8rze2yAzcy+OEkN5MZWVq0OMxn8rgFjWQ9xb8PWJbv8+I1xnaI/6XGsi4BWj9bOAnjJjrBX2hb7kKZ++KZFqvAD6/fGxEUosLdCTHkocw3AJxCE2A+dJa0sJzer7FH0ZHdS8pO4sn3S+V5wg+sTrMQxUvRhR7vXuIIYY1Rbqa6oViD/fiaCnkW7d8TpiI6b/ZWfGwCC63IOniXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5TfKQn5B4CKO2Upa3uHY7YV/ZlUjkPm1TdvFY3R02k=;
 b=nB8qu860Epj+g1aM1T9y9InsQk5w0Vj8F9e10S4vQqYhnmgw3rk+MBi9ZSCYaBJpKvI/gLxeKiYXICKpUNWhEkpXIIt+rDlQzQKHznqul8mrmOiiFHNFA1fIIBzW0pZdvsuYX4856kj8ci0XY6oks367+dgs1VhM3oDycXaGFTzP2oV1H0KdWbqnEovWYiMeBBv+trC9bJVr0G4rBDh5et/4L7dDTqP8J0Yr3d89434fTdcL5fbmE9fmzwJeloTxKIQtMgXQQvsyhIeN717mO9zF0MxQ20LPe+UCNy/JhRQeo0GXYuwsjfzsn97im8Fz+mut91JRZSB0tCGsb/ye2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by MW3PR11MB4569.namprd11.prod.outlook.com (2603:10b6:303:54::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.14; Thu, 13 Feb
 2025 06:00:13 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 06:00:13 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/5] coreutils: upgrade from 9.5 to 9.6
Date: Wed, 12 Feb 2025 21:59:59 -0800
Message-Id: <20250213060000.1092285-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213060000.1092285-1-Qi.Chen@windriver.com>
References: <20250213060000.1092285-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::22) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|MW3PR11MB4569:EE_
X-MS-Office365-Filtering-Correlation-Id: f17d9588-21ef-411e-b1fa-08dd4bf3ae31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qUD68HdPqhc00qs8XbazFYoVwyU7Yf4E6Ln/iy+ggwXJyvaos4k0l2nxGw52?=
 =?us-ascii?Q?E4cBhPDBZjezMj2ZaRRuVcpogS68Jzs6Ej9P7RrfnSvqgJcYr0i8JW/s0C2m?=
 =?us-ascii?Q?KlNJJr/2Bct3gEzrXViSwKWCPwECBBTXJ8OHEsR+RmPtlzCJR9Q+N8S3j5tW?=
 =?us-ascii?Q?jCxvpP4XqpWPJhssO4883yPuRAyZzXRFowRd4Xk76ER1HvxPC+DlvKq5NSdM?=
 =?us-ascii?Q?C1Uf26Jh3sNFxZlQU8+XKGH+kUQMFBEpw0GFlx2dstRrySHHLHz1GGk1KcWn?=
 =?us-ascii?Q?uiYQmB/P26Qa0LJVUt1O8W3iLiIXcs11Q9/FtK0XwbftQnArGamplB9JCrHO?=
 =?us-ascii?Q?Wf0M0/U53N//6r8N2QF9g5e3Vwl47RRAXJEVxtQpU9j36mKcnCDa3bHw91Cs?=
 =?us-ascii?Q?BCra0Jcv+H+7l62wKhLY3TV7jw1/ZpfpbvM1m6GOhPJyAEc+mBywCypTDPB6?=
 =?us-ascii?Q?D8WkbIUhz9y7OvShJ4PTA+a8y999UMutgvz98UBF4LGfGwTD+gZ80dF0XqSO?=
 =?us-ascii?Q?S0jd66yIANmr7VZ0DOleJeh0zj4nci2VWAvWT1zfnqoYVEDws422vzx5NrGO?=
 =?us-ascii?Q?vrDb8den2DjySLRKHcbuQWQOsdr8ehtGHWS6ZVnUPEoMSSpCCd2hIAlsL99F?=
 =?us-ascii?Q?0GsQlwPV92zQ8cNckMmNXxNEHJkwQPTgpMUmWg1+xRNRlURgJWGuHGKXYaWv?=
 =?us-ascii?Q?TfBmMT3Zg+GnbotrNJd1ZYJC+OkJHnO3YQtKapwflU5Mb4GgmIUURUUas9dx?=
 =?us-ascii?Q?57KgdX+xZ/Pj5p/Gt+ACShAYiY1vkaaDyVvHQO4J1oY8odol9yHheh0+eaJr?=
 =?us-ascii?Q?qAT6EWsAM6fQL/wuTcZI9Etsps7Houi+/4tvg77cgF4gKzrzI5Kb7fKtAzhZ?=
 =?us-ascii?Q?UdcDa7CabWi18DkQA2c5VRE6Elx36LWtYyy5ZZGyl1Cc7sg2j7jCXjAv83mU?=
 =?us-ascii?Q?CDYn9DYtc+Fh0lYoo1d7Gg9Okf3MyJN9UlJKgLLHNYbWjeTDXXIV7ezntOrY?=
 =?us-ascii?Q?l06g8nhHooo539KjNbxOFtwCUquP5/0kH5VcIRx4I98XOxU74ORnerBKGLlL?=
 =?us-ascii?Q?PqpBoTPgnh2+zWSsCjCLc3GupWaXAsHcndMbQfFmG8LdSujuPyK/yrJ6R4RO?=
 =?us-ascii?Q?74uEozRjCR4d9mBpY7fHtCZO94C4HWRotLX7S8iGF/zHt59rX10FxlLmQtOX?=
 =?us-ascii?Q?Cz4DI/fPazjmVEgCi4EHOCDZZN8rph7suSn1gZcJlvks77N8XNDu250qys1P?=
 =?us-ascii?Q?Nf9uuK+9ihIV5P45s+Z+mJjIxcm6fDRZh7sRquB9SANC8qApuc1McxTsN+3u?=
 =?us-ascii?Q?a2KR6v36XXOiuS6mbKwYyPOupS1a/Nir14IZQGvzqntcb09G6k5XYm10W/VP?=
 =?us-ascii?Q?9gQrXAr0KuubyHd5Yxxm/LAPkvwNP7+sOCAnYzWxiCXW8hp1SA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M2zerobDae3IbvRINGCaoAnDS8Rcmghl3ufItqVw9pc/GAwO1t7+SbkqfImD?=
 =?us-ascii?Q?js75gVIEg36F/M/7SjXpDaxxPp0TJs9lOf68u17RsvtOt5ZyWqfxqQGU2QtQ?=
 =?us-ascii?Q?Up0E0ieHDU3kF2HrGGztNIp/SrgHxzabZJhgxWrr5Zn6QLPPCtc3utsD27/I?=
 =?us-ascii?Q?mGLP6APUc3t67l739WrQ+SaMDN5NJ3YRKM9u7nQRpdMN1/bmxBIgvdn348my?=
 =?us-ascii?Q?8jF32bZYdD2v0tgUiF2UK+br9kg5pxrRDQEclTjEXwL1LXvDUUpOkcrgiCZ1?=
 =?us-ascii?Q?DnJwTGgmupkpuNPWkPeH69KHZJDxSLskTsfHA8JGIBdmqZ3GBcpmYP7dXc+3?=
 =?us-ascii?Q?6z0F3ZtGvkYjR5qr+J95rrcEfRLvSLbZNPkLjTgjjLPkTI5zBR+vX8dyehGf?=
 =?us-ascii?Q?O/iUFZUiLqrBJaXJN+vz1dYgHm1V4jEj6Sqz3UAenpLZbASI063WSuW32iig?=
 =?us-ascii?Q?nKhapAPtSE4AANhrdcle2llHBjcy26lzWQAChHIejBABOEcVW1Pp76EuzBTX?=
 =?us-ascii?Q?5ro0tvDbaZ3yHaxxC9hsP5Zi/CY1iXozOkAy1erZ5J8W3A6YxDgUBAEkcEwN?=
 =?us-ascii?Q?pE3uut9pWhDUa4ib4eiQLSZWzJ1XV5HQBE4buSftY1EJFdtaKqJ248OaWdF6?=
 =?us-ascii?Q?wOB1meEsMDeUOPxTVaABV4SMZat54oE3ItA28LVpBEVrA0FaFnFbaYOj28ok?=
 =?us-ascii?Q?PYW1Dc/B6YUWWUr8koTbivfRrz/sc4J/fYQ8uN+QvCPc7UVhn3EbOrjSEF5P?=
 =?us-ascii?Q?Od4gvoK/AP0KHldo7HKyQ41+7ocbvyWOhPD79nNNVAWA4UF7IlmFkTfMePoV?=
 =?us-ascii?Q?+zdjXfTjApUhLngr/5xT03alVos6fk9vMeBhlcsTEb/RcVaFV/iN6/W2mLnF?=
 =?us-ascii?Q?H1ucoAsCOjhKBbgBianJmQO0I3yzacnkXbQaPL5rjBGkMoGg8uR0KSRNBjAk?=
 =?us-ascii?Q?i6UqWXyqFmVU/Vh5E8gJKRTbfwQRYBF5HZtsK2oK6ykdowYdrLIT7Vts9uip?=
 =?us-ascii?Q?GS1G6HW0wnjCKfKpW08aAJ3bwL64kY88Sn5qofjaltD0dZm/imT3Q0+0DNni?=
 =?us-ascii?Q?G5w78OkiFhv1WtrV4an/t2LdNtY/WcutaHG055jQ776NteHzUDvYT9cPPeVW?=
 =?us-ascii?Q?N+ekRF0v46pxsqebMKudILPOgCnWAtQUCjoXacuKoYyhLY3BVDYbZxMNr7Ik?=
 =?us-ascii?Q?26BSrcjpiWyz/Bz630NrUSLTTkOVg53+5pwr8VjX71zlnrU6mmtf80wZWWfy?=
 =?us-ascii?Q?vjE2YqR4HyJ+kzSyxTV54qD6nMRiKH3f8AMn03BrP0pMcsrbRC68ICjUCYE8?=
 =?us-ascii?Q?2ttahf/SRLdjSVbKwPSySwgrtOn9Ns3nySap4eqU+8WKyz9bcmOGd+ARpvXU?=
 =?us-ascii?Q?bDAlIEuvB33/GGdburIdBC74IyCpMQ4fJJ7fzWceuMSswj4YCpCtdyPH0FVd?=
 =?us-ascii?Q?w41UfaOtUHT2C9EzS34rmCus6B6YAKZgD+XLZ6yVNoX0aI7HOZXrb3rKdHI/?=
 =?us-ascii?Q?3WJyUoOQyqyO0EDMgRKaTBnzId4WJmR7ihAl886nUhNh89NRZfAoQIu8P561?=
 =?us-ascii?Q?M5iHw/ogwLxOOQrO/4U0RAhj9jAVVexrqH1suiwkt1sz4S/1IPR5CYwd+duz?=
 =?us-ascii?Q?3A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f17d9588-21ef-411e-b1fa-08dd4bf3ae31
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 06:00:12.9712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzodvsZJ2Hs/Pf7G7BuZBalFM/vM3jMyX5EmKlLS9L84VwRQV5iODYWCwbuC9WjY72yQmtS6vC0BG6/N8ketQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4569
X-Proofpoint-GUID: igHX_xfWknWfCrUM_w5rQoW9iEebMkIE
X-Proofpoint-ORIG-GUID: igHX_xfWknWfCrUM_w5rQoW9iEebMkIE
X-Authority-Analysis: v=2.4 cv=G8nmE8k5 c=1 sm=1 tr=0 ts=67ad8a75 cx=c_pps a=x8A/wAfU1CBlff9R7r/2ew==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=1YymFT3_l8IEBn-E0PEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=861 malwarescore=0
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502130044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 06:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211298

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade coreutils from 9.5 to 9.6.

License-Update: Update copyright year (2024 -> 2025).

Fix do_install_ptest for new version to avoid buildpath QA issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../coreutils/{coreutils_9.5.bb => coreutils_9.6.bb}         | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-core/coreutils/{coreutils_9.5.bb => coreutils_9.6.bb} (97%)

diff --git a/meta/recipes-core/coreutils/coreutils_9.5.bb b/meta/recipes-core/coreutils/coreutils_9.6.bb
similarity index 97%
rename from meta/recipes-core/coreutils/coreutils_9.5.bb
rename to meta/recipes-core/coreutils/coreutils_9.6.bb
index 5372318312..0527787934 100644
--- a/meta/recipes-core/coreutils/coreutils_9.5.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.gnu.org/software/coreutils/"
 BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://src/ls.c;beginline=1;endline=15;md5=9ac94aaed7fd46fd8df7147a9e3410cb \
+                    file://src/ls.c;beginline=1;endline=15;md5=824c1997414aea9f344747bd81cf5a31 \
                     "
 DEPENDS = "gmp libcap"
 DEPENDS:class-native = ""
@@ -19,7 +19,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://intermittent-testfailure.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "cd328edeac92f6a665de9f323c93b712af1858bc2e0d88f3f7100469470a1b8a"
+SRC_URI[sha256sum] = "7a0124327b398fd9eb1a6abde583389821422c744ffa10734b24f557610d3283"
 
 # http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842
 #
@@ -205,6 +205,7 @@ do_install_ptest () {
     sed -i '/^abs_top_srcdir/s/= .*$/= \$\{PWD\}/g' ${D}${PTEST_PATH}/Makefile
     sed -i '/^built_programs/s/ginstall/install/g' ${D}${PTEST_PATH}/Makefile
     sed -i '/^CC =/s/ --sysroot=.*recipe-sysroot/ /g' ${D}${PTEST_PATH}/Makefile
+    sed -i '/^BUILD_LDFLAGS =/d' ${D}${PTEST_PATH}/Makefile
     chmod -R 777 ${D}${PTEST_PATH}
 
     # Disable subcase stty-pairs.sh, it will cause test framework hang
-- 
2.25.1


