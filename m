Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D672AF513E9
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 23:23:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57900.1772753028176311837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 15:23:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TW4qRgYW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75246fed85=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625NEbaY4122889
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Mar 2026 23:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=akZiKkG0fbLApE3oK16Ooj0IRSSVJ0AmIehlUUeMtro=; b=TW4qRgYWeLGl
	XmGEuu1egFsXGlqEQFa8poppDOboxQlyUcT7VCLvlnHYN/expOeuOaNIhT7SHAU5
	HKnCz0XnAnA1Om2eje97yKSblP1WsoQ1+UVXMZWFtrJDIC78DbQFldcPeQft8gbA
	CK4LoQ8oWqw2DDqBpg6BJyVSDQF4nazPEQEwkWFcmfZlRaM8cFsLGexWRPTkuwO4
	DIYO8MyPaOG7O+AXj+NSCpBPmuqwJhlm1O519kfozrUXaG5HZaLjcxUdKYkrw+8Q
	j8Kh63X3x3UX2YIoTWPK8Sq7Y+ThHL/gXx1QW4iN1ZU1/uQ598DR9jXQcVqNqFcf
	mE71sKghFg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012010.outbound.protection.outlook.com [52.101.53.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4q4mp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 23:23:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vjb6RRYpMyHVUE2BL1d0GTCGUt69DIE9LG20AqFM1r0BNGGAmzH5NMnX08CqVeFrj8G1RyPv4a++l86Wt4hnm7p6xSfjNg6g3el2IYBtba9hebuRAg87rnEnw0MJcKPN4Rhs6BEauBmJ/+c28M+gDPenDDYGWDw5tPCYgaiJbGcjhPsJSClHqm9o9gQkbxtPk9lGLu5Xx/odmCplSAy8omXYD/zLnBxaNgbog9Q5gIvrIU2HJPacbepIiKCq6nzxvnykPMJiYXmBA/woPG7xYC76+14CSBwQQ2OYdtLSuWcPUuvMAZeKWVsghUnLih5O8RXtcRy11PmqgOhogYBvUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akZiKkG0fbLApE3oK16Ooj0IRSSVJ0AmIehlUUeMtro=;
 b=PtDesxLbOVM8lRlwckt98E1v0v300Rjrtbsr4dj19PT4cpmlCjgGkGsrMWPpwUSfAXd/fgWESz8S7m0Se5LaITr7wdWxtg1UUGnst7jPF2thWJx1ATnsfj8mGxxy2OMoAa+xkR7ltJogzlFWbiDJ8zvDcLbpBQ9E9gFXL2oJqDzXZIt6yWYOnypvgijLr7axEaYFfVEF6JhAyYfRDcyOM6s9kcVFoOo5oMJ9ww/9dVC4SauhsOvzQ+3/+vfFGXadx1dNLcnB/oIpQRb4vJpsQD5/9cv4dij5sONVACTXujAOXygzBpAfFb+Y/TB4rlsNEtU0u63ZVGN+lZyaWDjp/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY8PR11MB6865.namprd11.prod.outlook.com (2603:10b6:930:5f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.17; Thu, 5 Mar 2026 23:23:44 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 23:23:44 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] file: upgrade 5.46 -> 5.47
Date: Fri,  6 Mar 2026 07:23:26 +0800
Message-Id: <20260305232327.449180-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260305232327.449180-1-yi.zhao@windriver.com>
References: <20260305232327.449180-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0173.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ca::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY8PR11MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: 270ec560-e75d-4cb1-030c-08de7b0e3e5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	vjP/a3FDshKHMXXPyZ7HwuL29PDTMkwZSmVB4GPMZ/fzLCjqR3LA6YElKBHUGOLqyh7KyAVfPa7w7HZY8fY+F9HeGWfyH/6q5AMyuOsnjFPI+58cGsZLMhkMa+oKSPw0LNxK5nN7J2W5yHEWv5CXYVrkhex8q2iWFJHRQnjIzHfWdbJhxdiumwkEIbPT6bQ+Uu/g5cILykOpZyZi+iFi2wXVVKAayDJJelAykCuaztWofpwmlRWEQCxxrli4yCuuJ8Fhwz4vG+nzC55RJQ3wGxxB/Rri8rcHWRlFGaKzRS27hEVnOTm6MZvYYCnNuq+ZUKIEkvbMb9CRuht7tCAgA8vCYsPCr89nJRZY2O1VfJr8C19M6qObEst5BPWioDDWrtyk/s+KZmY/0OPTyK8RX9jQcCJFNpFjDgwIf8eCCbjwjm2yUmzqtY3ztM675lm8LYlqB3cIdeXgMMSY0xqM7U5ZJKUVZgN+iQFZae1PcvZcU+sQsoYge/FwzliH8eaQbm/UyM62ZoebpzyGsNtxxU+obU5If4ZFDeYJQ5r04NBGYHpqSRpiDPCxe+iljDI7pBgiIci8b3i/WNZCbUIgT62hsCOyWuXPnXk3X9oVLqRbbh0xVI8GAan4h5lYSmNNNJK8cwQP+V3kno0yOC/7egIsneNloR81ova1A62lhvWeeDa4Fk7pPzcQ6kd63OIBVz6qjqY0rNG8rix9dG2woG0TIYSF+ocrr2B6V1xlFJO/EGO9hx0DToodTTYvKSo7R3l5jyp0yJZ+Th2qjDZyHjKfsf7BkyU/hUMs9RuRn3VKrFLe8lbFkUhwc9Gi0sO4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fEfDC4410Weh1DvWsKjAS7BuG/PcyYU548a9DnVt+EBafjoLwfDlaa9ggnUH?=
 =?us-ascii?Q?L24AzHwDxajNFGfOCpgYQnMSKtH3NMiEEDsrIsi1PvxW7qIiXdWC/5ZEb7X+?=
 =?us-ascii?Q?Ru7YGWT131MJ4b1y7pZIQcWQn5WIdlOyNilJzvCGjSwD4pylZ/hLCz4lpVat?=
 =?us-ascii?Q?mMdOWskRSa1qLiK+y9wtbNnGTYumE1g96zyw69gRLuK5bM6jPoR9dN0gyjNT?=
 =?us-ascii?Q?EtWpk5JxAMqpu0bZvg02FByqNv1J+FxydnvUbTHRKYLjsBQOCCHgD9QdcSIP?=
 =?us-ascii?Q?K9yWEO5CsgMqgXmqro4nMVkD5svWbtkDQOmlxtxU3/lIpExoOKbXesND7/pl?=
 =?us-ascii?Q?u39FBiCTY9wQsVn1/7gO3Ahv9QQT9xmwiRTVQVbrLhSEYNeAmF9i/6jFjw0o?=
 =?us-ascii?Q?haumTPpS6uraeUzt6KuWkphNBh+nWmjh4I9xu2+AsxBBgWF/e4yNBZ/3VwMG?=
 =?us-ascii?Q?0htYkg50tj5pfhjjnBE+nwgKRNd3unfKmKXdJnn1+8J0yRbAFTCyheF9VEx+?=
 =?us-ascii?Q?UIUYIL1QAtUpcoS7Krj4TAlWdPS1b0mH4FUafvxF8D/BO/uG8nclqYl0hVDh?=
 =?us-ascii?Q?OcCZOyBm4XNipp6OTtWppcFr8jaMIhF0zH8d34YVSuY94G87uL4OzdF6tKJF?=
 =?us-ascii?Q?o7gnMJuaZ8CGs3Kii4s/jBWMFdCr72MXyN3QZWKpcoikDi+2kF3iQj5LxX7Z?=
 =?us-ascii?Q?qz3Bt7RGt0fYZtAu7LDKtcCPHqzuvEB2KB0IhKbb+fcZ2SqpI9qwT/HEbG9k?=
 =?us-ascii?Q?f8sq5AO+SYLBlTrFwQXVwIP8AGSTRyNrQWJVFsBkLAho4+ZuV84sKYiWcCpL?=
 =?us-ascii?Q?OS1TKgSQKkmuUi4rc2/JjcRAEkPT2DGga2zSymNOBM3jw9JseXmYHJr40APF?=
 =?us-ascii?Q?0Szx2RXSgfyw7QDMhP+161fgsai3RNu5kooLiUHXNJmygncJbIPPB5TAV5TV?=
 =?us-ascii?Q?ZqrBMR03EH0WM46M9H3VXrXFo3BdZgDlW++RO+9S+TYjqJl9BfZt7yefNj6v?=
 =?us-ascii?Q?uPXAQuWDj7gOFT5zsYLx/xm+u3iQaIYvcyhvE2Azh3yCJ6JKols9i7p6ZWcJ?=
 =?us-ascii?Q?XHKrY3F5o1j6SJeoU2tQxviKyZwMcYDpUVQt2JDbMk+0/OQDtR1KtUsST0lb?=
 =?us-ascii?Q?XWQw8myJ5Oz3OsrlKL+3MtfMKk+HsU1zd/7RZ0GVPGLt+VlFLDmP08ytNy1r?=
 =?us-ascii?Q?T7bxN98NeaHj735JbKdfPZFeeekimOzXSgPhCstitKIpdm7pnD6mC7Jt7cgZ?=
 =?us-ascii?Q?NahEpOvG0GJRHDQRZKcFODdos/0ltKZAZBxSSWuMF2nojCb8l5S1SH6h0Zo5?=
 =?us-ascii?Q?8J5ZrW5i0KUVe45X7McEQ1+mje5qzQiurMuaxPB1SwOl1Uoj7FRPPnwMdJTO?=
 =?us-ascii?Q?YeC0I5CZrjsqs7OUW5dnhazX/ztof275EaASSTA6lc7MfBSWMjPbMc0IZs5V?=
 =?us-ascii?Q?/4nxylKxF8XdmUfs6LjaoIZtI3wCzWACJrkZjGUU+deblQGDGejvefQy7Nkp?=
 =?us-ascii?Q?oMf3MhJOr7rZw5e6w8GA4/aQaHbsWKV3mzwoi4Qea6OaQ3CDA07HuF08vax0?=
 =?us-ascii?Q?xjyUOta2cjdCH81OEGAUbNIUEPMObimcnq8MfTEA3f/739vQwow1PJrPk9kY?=
 =?us-ascii?Q?tRZRrLcrt+weeyM5TbVzM2t1lnGu1bvv2xGX6+BHHVInIqi/9R2RCH6G5Udk?=
 =?us-ascii?Q?NBqmKN8hXnTToSJ1m+0rll4tfrVkOJfEhcBCSdpASm0NhuaGir17wLRzxU55?=
 =?us-ascii?Q?Yi28GyoWTQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 270ec560-e75d-4cb1-030c-08de7b0e3e5f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 23:23:44.0833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4gKDAg1tE9cki85G7TAIH6wrHJ5rj/aZrT6Iwc/YmRy023tSkAeNsuR/6espRGHhdd5baH9Jo0zOuKQk770vPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6865
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69aa1082 cx=c_pps
 a=bwjaHK0hsJlcehRpTf+kTg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=9cRgboTrAAAA:20
 a=NEAV23lmAAAA:8 a=d7swkCrYAAAA:8 a=t7CeM3EgAAAA:8 a=wNvv6W1NAAAA:8
 a=O-SB1Vk5AzcWlyaqHLIA:9 a=O8hF6Hzn-FEA:10 a=ay-ETHJMYsyD_Rg6V_D-:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=SrIYVAyqU0_zX6dlD0rn:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: lXsgUYFZ_gwcHhweZNnnjcAce8jD2uke
X-Proofpoint-ORIG-GUID: lXsgUYFZ_gwcHhweZNnnjcAce8jD2uke
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDIwMiBTYWx0ZWRfX1FfPBodkwmJV
 N1GVh8yiyY5phqdkpv9zXBsMVNrG+sFsRAtIqM7lpJbw26Nrkw4qEOJb2Wv6XO6nnCC868JrqLC
 8euiUlars/zgu/omXxazSDWIgMvxiRJPDkcExRHj4yPh03ENqSz6b68eIcw+MmJ/vdDsD1UouoM
 dpqa+V27UIy9q32EBAaxCTXFxOqeOHpLtBQf0kF+Oqq286BS3YzfsOXdsTl4fzfT0LcqsY/U5bc
 e/yCNqTT0PnNuv16Iva9Bu5tn8Q3a1Prurwfa532tdJTASCMhQzXjLUS3LZqDqRMxFfAs8ENbdY
 n0DkPDh3Njt5W8HEg91OgNOUkH+rVxqtw3YsiU+ela62iJjITmdK0edud9lZY40AgcjjSnN1Woc
 8RlDB8zKCxBdi57OCHyxxFLGamoE13Srni/5KvmXeM/1aOYICJXQB3jJS0GV6rBWu/a7CMsjz3f
 h00sWMf/Y1Q2yeDEyig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050202
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 23:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232526

ChangeLog:
https://github.com/file/file/blob/FILE5_47/ChangeLog

Remove backport patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../file/{file_5.46.bb => file_5.47.bb}       |  4 +-
 ...0001-PR-579-net147-Fix-stack-overrun.patch | 33 -------
 ...-reset-previous-negative-offset-in-m.patch | 93 -------------------
 3 files changed, 1 insertion(+), 129 deletions(-)
 rename meta/recipes-devtools/file/{file_5.46.bb => file_5.47.bb} (91%)
 delete mode 100644 meta/recipes-devtools/file/files/0001-PR-579-net147-Fix-stack-overrun.patch
 delete mode 100644 meta/recipes-devtools/file/files/0001-Use-4-in-default-reset-previous-negative-offset-in-m.patch

diff --git a/meta/recipes-devtools/file/file_5.46.bb b/meta/recipes-devtools/file/file_5.47.bb
similarity index 91%
rename from meta/recipes-devtools/file/file_5.46.bb
rename to meta/recipes-devtools/file/file_5.47.bb
index c035e0b11d..528ed49a12 100644
--- a/meta/recipes-devtools/file/file_5.46.bb
+++ b/meta/recipes-devtools/file/file_5.47.bb
@@ -12,11 +12,9 @@ DEPENDS = "file-replacement-native"
 DEPENDS:class-native = "bzip2-replacement-native"
 
 SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https \
-           file://0001-Use-4-in-default-reset-previous-negative-offset-in-m.patch \
-           file://0001-PR-579-net147-Fix-stack-overrun.patch \
            "
 
-SRCREV = "c5aa4f7f8d5063fb3c37ad57bf54bb67ec641a09"
+SRCREV = "7d20612996567ecedec7f5c58f7bf15c2cf42c19"
 
 inherit autotools update-alternatives
 
diff --git a/meta/recipes-devtools/file/files/0001-PR-579-net147-Fix-stack-overrun.patch b/meta/recipes-devtools/file/files/0001-PR-579-net147-Fix-stack-overrun.patch
deleted file mode 100644
index 57725b1c5f..0000000000
--- a/meta/recipes-devtools/file/files/0001-PR-579-net147-Fix-stack-overrun.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From fc6b51aa67a11806c95363e1bec925d15b3a98a5 Mon Sep 17 00:00:00 2001
-From: Christos Zoulas <christos@zoulas.com>
-Date: Thu, 5 Dec 2024 18:35:40 +0000
-Subject: [PATCH] PR/579: net147: Fix stack overrun.
-
-Upstream-Status: Backport [https://github.com/file/file/commit/b3384a1fbfa1fee99986e5750ab8e700de4f24ad]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/readelf.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/readelf.c b/src/readelf.c
-index fe4cf541..d209d86d 100644
---- a/src/readelf.c
-+++ b/src/readelf.c
-@@ -27,7 +27,7 @@
- #include "file.h"
- 
- #ifndef lint
--FILE_RCSID("@(#)$File: readelf.c,v 1.196 2024/11/11 15:49:11 christos Exp $")
-+FILE_RCSID("@(#)$File: readelf.c,v 1.197 2024/12/05 18:35:40 christos Exp $")
- #endif
- 
- #ifdef BUILTIN_ELF
-@@ -1726,7 +1726,7 @@ dophn_exec(struct magic_set *ms, int clazz, int swap, int fd, off_t off,
- 	Elf64_Phdr ph64;
- 	const char *linking_style;
- 	unsigned char nbuf[NBUFSIZE];
--	char interp[128];
-+	char interp[NBUFSIZE];
- 	ssize_t bufsize;
- 	size_t offset, align, need = 0;
- 	int pie = 0, dynamic = 0;
diff --git a/meta/recipes-devtools/file/files/0001-Use-4-in-default-reset-previous-negative-offset-in-m.patch b/meta/recipes-devtools/file/files/0001-Use-4-in-default-reset-previous-negative-offset-in-m.patch
deleted file mode 100644
index 7601e6dead..0000000000
--- a/meta/recipes-devtools/file/files/0001-Use-4-in-default-reset-previous-negative-offset-in-m.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From b310a0c2d3e4a1c12d579ad5c0266f1092a91340 Mon Sep 17 00:00:00 2001
-From: Christos Zoulas <christos@zoulas.com>
-Date: Wed, 27 Nov 2024 15:37:46 +0000
-Subject: [PATCH] Use +4 in default reset previous negative offset in magic in
- zip entry
-
-Upstream-Status: Backport [https://github.com/file/file/commit/b310a0c2d3e4a1c12d579ad5c0266f1092a91340]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- magic/Magdir/archive | 50 +++++++++++++++++++++++---------------------
- 1 file changed, 26 insertions(+), 24 deletions(-)
-
-diff --git a/magic/Magdir/archive b/magic/Magdir/archive
-index c8f440dc..b920f993 100644
---- a/magic/Magdir/archive
-+++ b/magic/Magdir/archive
-@@ -1,5 +1,5 @@
- #------------------------------------------------------------------------------
--# $File: archive,v 1.206 2024/11/26 19:39:14 christos Exp $
-+# $File: archive,v 1.207 2024/11/27 15:37:46 christos Exp $
- # archive:  file(1) magic for archive formats (see also "msdos" for self-
- #           extracting compressed archives)
- #
-@@ -1875,15 +1875,6 @@
- >>>>>-22	string	PK\005\006
- >>>>>>(-6.l-16)	string	APK\x20Sig\x20Block\x2042	\b, with APK Signing Block
- 
--# Keyman Compiled Package File (keyman.com)
--# https://help.keyman.com/developer/current-version/reference/file-types/kmp
--# Find start of central directory
-->>>(-6.l)	string		PK\001\002
--# Scan central directory for string 'kmp.json', will suffice for a
--# package containing about 150 files
-->>>>(-6.l)	search/9000	kmp.json	Keyman Compiled Package File
--!:mime	application/vnd.keyman.kmp+zip
--!:ext kmp
- 
- # Specialised zip formats which start with a member named 'mimetype'
- # (stored uncompressed, with no 'extra field') containing the file's MIME type.
-@@ -2123,25 +2114,36 @@
- #>30	search/100/b application/epub+zip	EPUB document
- #!:mime application/epub+zip
- 
--# Generic zip archives (Greg Roelofs, c/o zip-bugs@wkuvx1.wku.edu)
--#   Next line excludes specialized formats:
-+# APK Signing Block
- >(26.s+30)	leshort	!0xcafe
- >>30	search/100/b !application/epub+zip
-->>>26    string          !\x8\0\0\0mimetype	Zip archive data
--!:mime	application/zip
-->>>>4	beshort		x			\b, at least
-->>>>4	use		zipversion
-->>>>4	beshort		x			to extract
-->>>>8	beshort		x			\b, compression method=
-->>>>8	use		zipcompression
-->>>>0x161	string		WINZIP		\b, WinZIP self-extracting
--# APK Signing Block
-->0	default	x
-->>-22	string	PK\005\006
-->>>(-6.l-16)	string	APK\x20Sig\x20Block\x2042	Android package (APK), with APK Signing Block
-+>>>26    string          !\x8\0\0\0mimetype
-+>>>>-22	string	PK\005\006
-+>>>>>(-6.l-16)	string	APK\x20Sig\x20Block\x2042	Android package (APK), with APK Signing Block
- !:mime	application/vnd.android.package-archive
- !:ext	apk
- 
-+# Keyman Compiled Package File (keyman.com)
-+# https://help.keyman.com/developer/current-version/reference/file-types/kmp
-+# Find start of central directory
-+>>>>>(-6.l)	string		PK\001\002
-+# Scan central directory for string 'kmp.json', will suffice for a
-+# package containing about 150 files
-+>>>>>>(-6.l)	search/9000	kmp.json	Keyman Compiled Package File
-+!:mime	application/vnd.keyman.kmp+zip
-+!:ext kmp
-+
-+# Generic zip archives (Greg Roelofs, c/o zip-bugs@wkuvx1.wku.edu)
-+#   Next line excludes specialized formats:
-+>>>>+4	default		x
-+>>>>>4	beshort		x			Zip archive data, at least
-+!:mime	application/zip
-+>>>>>4	use		zipversion
-+>>>>>4	beshort		x			to extract
-+>>>>>8	beshort		x			\b, compression method=
-+>>>>>8	use		zipcompression
-+>>>>>0x161	string		WINZIP		\b, WinZIP self-extracting
-+
- # Zip archives (Greg Roelofs, c/o zip-bugs@wkuvx1.wku.edu)
- 0	string		PK\005\006	Zip archive data (empty)
- !:mime application/zip
--- 
-2.39.5
-
-- 
2.34.1


