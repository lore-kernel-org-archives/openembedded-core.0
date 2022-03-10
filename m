Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02799C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 20:08:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1498.1646942904524110302
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 12:08:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Vb3xD6ll;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=0068e34002=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22AExYAG011681
	for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 12:08:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=dKjyLvm6Rf5zgrVIlJN0tCX9Bbl8qfkvRKTI+M/R1Oc=;
 b=Vb3xD6llaVHr0cozviGwEKaOuxQtehgm3+jHutspuJlHYny7RUmsgX7FhZGVidmptPPk
 ZgF6/ENwnIy19xC6k3b6vpIXqePICCCI5bw849gUUUG68UM9MD53E3TJmWFUT8/3rKeT
 /Ap5+kpS6o1NwdLOwcqEvxT2NfHoc72DVJFLSSSClaeonIHx0rgNhxAIhb6bgGPcPJ1r
 Sh3z4Cf/zcKv6cbug8McHXzy3Qv51M+EPytiiVeMlEbHbzTZpiFrImk6R8Z8q5VIoN3h
 5URTAfiWs6IzkmTgCrmS1hH6SgRykEiO9giTQ/H/JSnkX1uM7UW8Waqpkpjj3YegJ89C xQ==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3em416cjkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 12:08:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNU9RrZmNgJMAvaA3Pw4ESGf658IxLhJqjspxD3ccwajkkwRvz72Gg1ZdVbqFLTU+z8z/9aFgDp5wtE1XtFa+1+Iy7zYlX+H7ps/8JomkW5dqnSCP/cOK5QYGzplxT+Nfinwz4vN2vbaxbkcNpQ57ZaYuTaOLjAkUKvyzrFSRvabzkKoccTlDI0x8qTInG291cfd44hcj+gVRSK6X5o1yPpYQoEA9T29jclOeA0K+GmJUFXNc9YjqIqit1gDlCshb3t2Kt1xDgOZVhGAUHMD+4XOdJMQqIIMuQ+9zV7rBZ+aNJX4Ji6sKpn0D6klVI2wyCVJqgvoog8NPWiUCU3isA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKjyLvm6Rf5zgrVIlJN0tCX9Bbl8qfkvRKTI+M/R1Oc=;
 b=k1ble2E3MxfDmbYz4AwQgkda6ElVAJlhyrQyowKcYeJXeQhrNQZLaqRIAsvEfj1ziNdnNkHSRfbNK/K8Jss4pKZfINZuDva6M2orlq5q0InJEscZmtQuA5QCudPFHJLdwPdrhMh0ALCkWng++9lk0tlUbjIvXXMCA40rXrcSEDNGEay03VFjhCTxALnJFUC0Dj8BHKhTWhEhAK2oc0TDxUJKI94xguD2S+O7NQMSFAwZgMKrNaoyDuGTyjaVIXz6Q3K1NtBa0YzmCDS60jXuwahhBrM9XMTZKoZRPsRndYplSgXcvUu2zYZaJq7GXeiRyNhD9PCFAKch9A3tSrKpdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by MN2PR11MB4511.namprd11.prod.outlook.com (2603:10b6:208:189::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 20:08:20 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4%7]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 20:08:20 +0000
From: Joe Slater <joe.slater@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [oe-core][PATCH 1/1] weston: require wayland as a distro feature
Date: Thu, 10 Mar 2022 12:08:07 -0800
Message-Id: <20220310200807.21816-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::32) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03025438-00c0-4ed8-488d-08da02d1b8e1
X-MS-TrafficTypeDiagnostic: MN2PR11MB4511:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB451195D5ADDFED042161A58D880B9@MN2PR11MB4511.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	K0+jy4mvhG161m5/vndolXobb2Or2eV0UMchSTo6VwNeo4bUK99ZfgzSkfiMaDHxFA1fsc8/H9+z94675q/doPGx5WAOHHI+2U4fBtn2kGn5Gfd4s+IvZnWCEAuHtqrgg7gY2mr65ThdLaPIqAxWpzDb4vlGCRUdkRRZvPyjKB5g53ISlIP2PEeec49R6VV2OAiMTm4j/qshTeUd6Zg8qmBuDLnjobHipxPPpoTfN0mACOUU50qS30bqEZ9tg0mjh64yYYdud/0SoskXqv7lgKTCNj0KMa4bZ3Q6GAZrgQXmd6/TbAntkGuYPBoqRRo/3JOdveSZSv0p5dn1dJqPjBN57DKwOKVC0v1a8smLouOIe3CfJIYgpr6V8MEdO9gPtnleOTyql0d1N/rMADxTAcxzGmFwvwgx5lnLq9OUpiCdK8usG9tyhrVfgRjVtGpIa0m0iqg25M+ymZzf/P1Z1ZBZHwqTQxzR/E/jJF06EA5M829QIUtN5H7QM5yOaH1pVH/PDLmYcIG0Z0R2ln5gx/cdPNJNkCQqhd+BL0nYgN3M2ReLH20fiaLMrghZ3HSceIxpRr4Jimp9p79uMndZj1A2HQNtFj7Z3N1rSu6b/G/nhDlo4DC/GHDgAvKmbUP3+mAwGb5jZ4NVo6Cg987h3ZwZC6hdeTMapEH7+oVX1sU+t1gRDuTMnH4x6B2BFL/V2M/BgblG0oo8KHJ3q+r1xg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(186003)(26005)(107886003)(2616005)(1076003)(316002)(508600001)(6486002)(52116002)(6512007)(6666004)(38100700002)(6506007)(83380400001)(38350700002)(36756003)(2906002)(4326008)(66946007)(66556008)(44832011)(8936002)(8676002)(66476007)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1FWXHib5PtQ4ZRpuMg/dpZ/JEp7qYgZMKshpd8e/bB0jyCafO3QHdtwQ8FHT?=
 =?us-ascii?Q?38h+J6eQaEI9bsJ+tmzWAwpideSG7FBwNGIVlNZsgWPscqpBcyIPC9SVvDhT?=
 =?us-ascii?Q?nM+cz37Dan0ZiInjTS3PE3RjkFsyqUYkoVjnCMdIbCQZ8P2CaFxa5VbWOC74?=
 =?us-ascii?Q?RTPRgZC2yl1dq+3DlYMxWBjWkxPNYCYuIuADhd4lQyxDFk/Y4IAMOmMflCGv?=
 =?us-ascii?Q?/WaDeCalylaI4QrqklgR2FePTVOKnZlaqaLE0y0Yr3BDijzEso9tM5SokVus?=
 =?us-ascii?Q?MShkDwKDnlwP/RJtkjjdUKsvh0WkErUUe6+D9GltyuJR26AIYkB1GK6A1W1I?=
 =?us-ascii?Q?78PecvmUiYQBwizWxgOx13i1w8kgwoiUC3mGvZUpTQL+unBvikOKR0iN0fxs?=
 =?us-ascii?Q?GDXsuQIg5XJCGJ9tlTSpGtXAPZWoUdV8WwDfBmbLXG3nx7X2HDlZygWqYzZ2?=
 =?us-ascii?Q?cs7uKJCwQBrQ8aYhGUk2Ca3ASGhlojk+bRyou+ztYGFlWU1eP4tEEpuxcQDF?=
 =?us-ascii?Q?OENJpnn3sHYjkPTyUohzEofAW0LN6qV3dZCVhujUUSjRLxmeCF88cS8uF7aT?=
 =?us-ascii?Q?KFwKZdhucY5Ivcgh/D2y4GxO0VjxfnQAQzqQ4toMxG3ISPm/zDbGYothYu/N?=
 =?us-ascii?Q?SUVsMNFLUQK0ji83vx8FWuHy0OgMCImmZ/DSb+fqESXceDsAb63oQzQQbLi4?=
 =?us-ascii?Q?hzWsX8WTmxE36SBHIn+A69/VTK3BgwYPDUiDAbIctiy42X/3hE8WGNRggv9+?=
 =?us-ascii?Q?Cf/5J8sOIqOzAfUZaJS7JW7N+dtDc8+T7tJNS6xAryQfT9TmNgNEfAYkHTts?=
 =?us-ascii?Q?uBwuN4dUOZvP3nHHR93nQlc1sMQMWJleROoZ9HzwqfE1k8R59UHb8TBpTCz0?=
 =?us-ascii?Q?we6MELcwgTYX/1k8jG4t8ueZZK3dMwqWXNdt44TcilV4116iwZld8zafnacm?=
 =?us-ascii?Q?/jMS5aLUGkRbwRqBl7ZUrEuGY3E6j6tTMzAR4t1j8mFd0oKQEE4hk8izI66r?=
 =?us-ascii?Q?AP40Knl2a5+u3kQQ9whIwLXFrXSANlG/EoS/ht7QpKUBqKyWUDirRl7Pcl5f?=
 =?us-ascii?Q?77bXxslLCFltSPh7ftNYr6ogPJd6pSA38uLe77ftUskEHmwldS2K05aRNfbG?=
 =?us-ascii?Q?O76DjhEvS6a8GnW25k3711uozyfFJku3dKYKu2f0XEM0UAybdl27kP/L8j0Z?=
 =?us-ascii?Q?2DMDELctNddsxJJu8c9IG9OpioxgD8PAKjE9J63T1rkIwf3JCN97dsm7qRu7?=
 =?us-ascii?Q?PTii7RAoYa/6sSZw7bovmblcW8CFwu/Rkc/G2juqcqbQyuC7Gfd/ePYPgvAp?=
 =?us-ascii?Q?4LO5Jdx3whUQT9LZmEQQd0xJPJnRmFWxBcipOodIhRo0aBqSxB/SkitHbFDr?=
 =?us-ascii?Q?H4tDIPgH2Sklsm71zRK1hEY4kjmTrai9SaQDpLlX6fj2Q2t7QM/uuWv0FyEU?=
 =?us-ascii?Q?oSlJAYKIQO1z742CeU4++q9S1C/i3EdukVjpj5SeHnDgk9WIcPhhuINz1xte?=
 =?us-ascii?Q?C0Pik0Ou52F3NGpoz054gY50b5tle1t7r0bhwMJ2FBpeAAVPxfl0s2EdEM3Q?=
 =?us-ascii?Q?JeU/foNZp4jjLXuSGdoB89ey6hnzGmzDf+LoKLUEftY1v/DfdRYDAPgCLFew?=
 =?us-ascii?Q?qTlWkL4JPyYZP7XD5XkCkLI6uM+en/gXKGsPNeaRc8qtuwNWWABcxENXDzmu?=
 =?us-ascii?Q?H4AmSRf+xRMPmDDXh7UVxUaORN0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 03025438-00c0-4ed8-488d-08da02d1b8e1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 20:08:20.1413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Oz5zpEvyS+jkYlwdc/FLgql5Rl+clKvPYzQ3oY83R2DiiEb5fejN7ImQ0/y+71suP1w5OUqpYeHDU9mCS3nmigMDOuLyp2UIt5RQ1A4r1JA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4511
X-Proofpoint-GUID: VkfuZOCJ4DKG8d_0OlTKZXJGhDphrybE
X-Proofpoint-ORIG-GUID: VkfuZOCJ4DKG8d_0OlTKZXJGhDphrybE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_08,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=747 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203100102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 20:08:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163041

Weston will not configure successfully unless wayland
is a distro feature.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-graphics/wayland/weston_10.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_10.0.0.bb b/meta/recipes-graphics/wayland/weston_10.0.0.bb
index fbb7927820..bebe95f69d 100644
--- a/meta/recipes-graphics/wayland/weston_10.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_10.0.0.bb
@@ -22,7 +22,7 @@ UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 inherit meson pkgconfig useradd features_check
 # depends on virtual/egl
 # weston-init requires pam enabled if started via systemd
-REQUIRED_DISTRO_FEATURES = "opengl ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam', '', d)}"
+REQUIRED_DISTRO_FEATURES = "wayland opengl ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam', '', d)}"
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0"
 DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
-- 
2.35.1


