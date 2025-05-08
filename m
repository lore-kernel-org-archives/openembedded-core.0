Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8249C3ABC0
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 05:49:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8909.1746683379751027182
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 22:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72234a4078=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5482txBP023945
	for <openembedded-core@lists.openembedded.org>; Thu, 8 May 2025 05:49:38 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46d8c15kck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 05:49:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmNw6ES/1ApEtNMJy4uzyplhrA08+8xaY1HutN4DLd4LXEtvfTcytBH/4CpmQElasIRYc0tji39VilSx54u3FdUx98kNFtuKsgeNFnZrrKATgCQlBCRNl2XxXtll96N6xvFeJqgLaP49fnp3GED4IF4su6PrCmwWuhENrKD5vTjqqUxo1navg83e1XjKmhWXpK5HQ9C1+n2IN4Tze4mC4YuTiqMo05ZFsBAQ3LRhBut8abW/n1WW48t4ubgmhpceW5/Qp99ACt3pFLIQUAtsjpEKkbqyO6nWYMPXMkAPHDX44DlW0KEWAhPMgNLSggahKFaXtVwuoisgzsq0qLtj4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kA6L/Q8diSqvB9xSdoq9x6HlCqShoBh4EzfV4S0OAM4=;
 b=HVXk/q35RP1rDhWiQCyNYIr9BP1m3AAo46s+7ByEJUYtaJp7nyhpAztOQEmo6eFc7YYBisF/nJPlqMUfoMR0BAwDsfGgGUUMdFTyGi/YAzHgoVUsxxiXNX6bX5lh+zm9jygbGkfnyWwMEic3GJAOjjVjduM6PKUHibsZNkFx3ofY4hNVuYV748s3L01W/NW1InAObNnELXtjVo9FRmkX4mINvutV9LJmbnIiaJMgzRRuwhOQw1xEtiZKR0V99sgyP/RPc/J0rWpN2Mf7Yvlk21ZQBtFsGOALi1kMkmcHkUavLCJe/pIdxhbd6Y3KUXK4u+aU+MF521ZX5mi+K+4qYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN2PR11MB4519.namprd11.prod.outlook.com (2603:10b6:208:26c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Thu, 8 May
 2025 05:49:30 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 05:49:30 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] busybox: fix CVE-2023-39810
Date: Wed,  7 May 2025 22:49:19 -0700
Message-ID: <20250508054919.864230-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0154.namprd03.prod.outlook.com
 (2603:10b6:a03:338::9) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MN2PR11MB4519:EE_
X-MS-Office365-Filtering-Correlation-Id: fb1ed7f6-a879-46bc-caf5-08dd8df419be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YVKGgVglWCxIXug/i+BgpJ6zfu9zI/f8KBm1t+sdG3rjTOxlKF5g6m4Q8fEN?=
 =?us-ascii?Q?2HVk7V3y3T4aeWwe6BdEI+qLY/iJZQbjsmUkND8K8zOwZVjhkX9IeSnm5H3P?=
 =?us-ascii?Q?SMlhFI4+BBxOghsiBb5E3f5jM78s+pQCQRwuDt21qIOASKEMjGpE5Ds0B1Rz?=
 =?us-ascii?Q?AkPBCz0Bj7e4bNO8IwchmJ6Z1HFND3gRG6uUXirSzp6lp5tWOiKdCpEYeXv1?=
 =?us-ascii?Q?laTiStDnnyfzQmMPapBktv+/K4NCbHTLSSaLuKf2vV0SyBcFTq7FmDVssDbH?=
 =?us-ascii?Q?Njs+WuRHCFxO0gqqDC0u4pPZhxl99r6sQbVg3aYpVKiliJJh58MkTfKcQ5K5?=
 =?us-ascii?Q?1GNYrkrK+epj9Z8IceZaOH23coXN/Qj4G4nMxMewD79ebXLu2eu93Bjql0FA?=
 =?us-ascii?Q?1Xai0FQMaYm31Ady8ZrNT3nkqCyhaWg6qIdvagu37dDagioE7s2z15rFr/90?=
 =?us-ascii?Q?spaAkuFWQEqLbnxG0WCqncV1sRpan3OB9YtUfXDz7ngjw6+ih1BCBxbmnTHH?=
 =?us-ascii?Q?qGGI/nx+2sIaMtqiqnbuT5zHPZhlWdOT0NhCXZFkH5lNlmoroGgh787SMV7W?=
 =?us-ascii?Q?X5AqpaQvK44+yCWzO3NpfqkzCInCo39k2nhhaoRtnoEbZH+rqCj3YXtKTc6N?=
 =?us-ascii?Q?cOuiP2II/459GErb3uO7fdLD+FN7bVKLW14WJrcYP13WdNhs+g8Q2uBsFLoi?=
 =?us-ascii?Q?K6mmFgL+Y6P4Ni19baA3bkofHYsDFJ4CF7w/L/Lpsg26lev2mHz8wypA8Opa?=
 =?us-ascii?Q?zZMSNgmcDQeoDmZaWV9W22LjTGDKNioHmAGm+NIzfSGnUDDgah2kgOjkAQyr?=
 =?us-ascii?Q?G6syHOG/bnpWTxE1dlclIImm/wq6Wx8ngKhNDTIwG3kP4/em8dooKz3cOMEX?=
 =?us-ascii?Q?M1dsERF0uwa///ZgLF8Y985l5eOo/X5TaSzJlDyRYFR9tT39Y0GBuVbK4DZe?=
 =?us-ascii?Q?HNMocaGVYUsKt6D/HHVWc7bejZryDro0Vcy2SpOEhv7xTRB+ypC+O1TCFHqn?=
 =?us-ascii?Q?zrs5Z7OHLCHWWUbxgS49H3OuZKj8rmvt0nS0YboIxrdUNddRKVHt2BK1ScLs?=
 =?us-ascii?Q?q6z7W+uB998AOspYb1ST4tzMAyOGx8KiLz9qW16RJKgwqV8U41mSmTZeyJIg?=
 =?us-ascii?Q?p1vKUAv+Fa5/OWAn10IzoIAsQvkef8UefcksmTwY2hWlVNZfui76oKcrs/Vp?=
 =?us-ascii?Q?sk2ssaQoTE/TuoD9MmIhsX8Ff28InxS3n+VIyjwWdi7W8DbE7erqaGewrixg?=
 =?us-ascii?Q?AOqiofeoTR0rqaX5yznEGBQ4lzk4H9/+mJfeS3fvjTvWqmW7asWOrskG8a3W?=
 =?us-ascii?Q?4LOqENCjxqyx5I8gjmg6MfXSzNWJUWknzuade/f+IujjjhZSsocOTzS2DLQP?=
 =?us-ascii?Q?5JLEhArMKJ8awlHbfDaYIBavJXltqvBlkB5VywP0sXcm6EpFwC/KzO/oTGSx?=
 =?us-ascii?Q?FnsztXQ5JH1385RelrX3+D1JMBhdy8uu?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wyjMxFHCkyTVMtZpp9C0E0rV5BXaWxolKghfUTr22N+sRTLMY63brYOtModO?=
 =?us-ascii?Q?K9jF2mTDTvtuC4wiLQXwhMD1xagJdmLyC9VKCLg5eYHpi0dYq+dbdUHxatdK?=
 =?us-ascii?Q?g5tJDgcLd9oFesEm3ywexEGFJ220UPlGLs2zv+VpE46+2Dzwl9PAchm75iZU?=
 =?us-ascii?Q?G4bsGi5YKfk6UlkG+UUjIBVEb4CGB6J6n/JuCKgG3vU5pYFOPEU19g5ozAFS?=
 =?us-ascii?Q?yjvfbRqII5a/lrtUqtvg1mgAqH2Mborac4YfsCI2JOloXzDQrOsnTLlH3wid?=
 =?us-ascii?Q?+NOA/K6jhnfBwCD0aFIwr+AK2ud+wwCFpieGYOIW3QJue1q/R90TM0hOIWN4?=
 =?us-ascii?Q?WL/QlIqZaGRkVFuhQBC+jccJZzRczRM1Rj7wL5fh7rwR7v9sJb1orM4hw9B7?=
 =?us-ascii?Q?hAvZmR31kSzFVKmD8oCIF9Y3c/+FY0VQaXZsPERLPVrh04ZkQzB/VWBOHwCt?=
 =?us-ascii?Q?wVjl68c9mX8cPtWw7Qlu/w3xfkqi5x9+y6yJfgCxab/WtC1w26sbycPysXea?=
 =?us-ascii?Q?lE96uoQld6lBGNRlWEP6cPQxK3LhskoMaJ3CAG0Ls6kQhzJyurt1cNpEULyp?=
 =?us-ascii?Q?HNUgU+N7s7tqdSKvTRKX47hA1FyNZTbqWVlZFkbDw1hvSBrHOE1XA3QVHQmj?=
 =?us-ascii?Q?0eoKrbMKxDSBLN3ChU3EKTEmg2DmRQXaZd0l6opl8WzDK5JlnlNrP+4GRyEh?=
 =?us-ascii?Q?AuMlUllQBM93jCIF9HYQU92UTOdUelDsq4ziI02qkXMWD4hvmdhcpd2ZXVDS?=
 =?us-ascii?Q?JrPdBWWmxEQa2GreBurGx14AtN+8vT3KFqxypC1RkgWD+7qqZ7wRcm6GKcf9?=
 =?us-ascii?Q?AwY0YUSCVChz7/XvqHeOKgbb+ri9/hSOcg4rsqzJ46N82sxDjSjo8Fz0eAdn?=
 =?us-ascii?Q?lq13X7xyeLC0n/5oykvwkP3J7DqvUqLHvY+wVTjjM/r7KnvjrqYfM3fqBmLT?=
 =?us-ascii?Q?n5WnXlWSXhPYxM9YbRq7AgNGcNL/ryCZfXt0hq5yvdSLuhfMBA5Y8HwfW1UR?=
 =?us-ascii?Q?RInWkcbgX1df/mLe2Zdw1Os6ED+1J00fQp18cHvt8d54jg1jHp3NKy6GoWGl?=
 =?us-ascii?Q?SNSHKof7yZiwQObXoUiG+M6HESg6lLOFesiZlcqdigiKA0aqulaFIoDUqZrC?=
 =?us-ascii?Q?jvJ8DdJqqBk00Y20TR4IGXiOG5cEwapknD6BAYO4jDR03PQR9OVH1XdFeyZO?=
 =?us-ascii?Q?2VpfGmP+EEhMbf2R4xepL5/M3DIRQ5AhPyA/uj9J9E/Ce7XNdP1afIecoFyO?=
 =?us-ascii?Q?YX18/jkw2m2hG0aV9I1Kb5y1uzggQYqcF54NU2UFF5s4qzsxQTDsLLxRFAZA?=
 =?us-ascii?Q?SN0lm8plh3xGuwA0Wf1mRwOKOxvXpv+vwdwDGlQT1cBWHP0gFoF5xRpAkwv2?=
 =?us-ascii?Q?luKDsRPc6awtbWS0Mff7S0SckHZaCARMr58pCWanm8dC7tx/lmMY6AtfHZU/?=
 =?us-ascii?Q?Yh6jtQXJ4exA0sGtErMSa0F3vs4/RzZW+JZWzrCcZlCacom1RYkAq3pCd0Tq?=
 =?us-ascii?Q?+x7c8Oo6pKDJM/lT0KI5ZPG8nBKm7OfXzg5fp0G4O7xnwYoKlvL+HBIATe8b?=
 =?us-ascii?Q?20f2tiLq9D1B/eR6PwmHerSbfp6fG0vC3n3OxFAwtarMWLW7eCVAj0WU2YKI?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1ed7f6-a879-46bc-caf5-08dd8df419be
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 05:49:30.0798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/zDjr15kpfpi8iB0bdby7JlDcy9+yfHckTwnUNvbpL5y6/TzZZ9DY4FkSnKsOysLXgRIpdsf9R51iR3La8Vgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4519
X-Authority-Analysis: v=2.4 cv=NIjV+16g c=1 sm=1 tr=0 ts=681c45f2 cx=c_pps a=98TgpmV4a5moxWevO5qy4g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=J0Tn2xNtAAAA:8 a=t7CeM3EgAAAA:8 a=mK_AVkanAAAA:8 a=9qxNCY_qAAAA:8 a=3xHUdnw57P61TPgYS2MA:9 a=9ZcRxastL33iXWX1AWsW:22 a=FdTzh2GWekK77mhwV6Dw:22 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-GUID: v3bOqRFwsV8Wdiq14HoTRMQ-OO84BxV5
X-Proofpoint-ORIG-GUID: v3bOqRFwsV8Wdiq14HoTRMQ-OO84BxV5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA0NyBTYWx0ZWRfX9NyIBAGIwFEV bSNr5FlK16cfE6eZtMfA9YZ1tX+ID5b/m/BFUnhzcbi/D+Bg9J4aH0aLRYmY33kv7eaHTpD3y0g rsP/slJZZrD+y1a6PJjKtNe4Se2rtuIo/YrGLxTRT/dVty7RwZm570+6qEKfCUSj+FSQA3q8pE4
 6CEG/dnoms+tgUq7MQnJHru1EHj4khzHpqZGkX00hFZmMn9L+LkQIO5dvHF/oNeKag8gkmtaACN pVAo3mAPmXYwDdWw70xchlLrd+XDdTXjIJtQt5F/YtK1uGncfX5joZmppRGMbe/CG23ej7yai2x EcoZVu2KxG9w6V3Zr2Ejm8NiqJs9UVlGSEMr5nSJ1EDWmm5jlSH4A9lvTCY10nCFy3dizj2NggW
 FUA27zq7GvP8LWVAouBHLktJqeeh0eK18G59hmnyTFrVXY0EuV8316u+2AVQiTARviZee4g1
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_01,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0
 clxscore=1015 adultscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505080047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 05:49:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216139

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2023-39810.

Note that the patch adds a config option which is disabled by
default. So users wanting this feature needs to enable that option.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...allow-path-traversals-CVE-2023-39810.patch | 141 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |   1 +
 2 files changed, 142 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-archival-disallow-path-traversals-CVE-2023-39810.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-archival-disallow-path-traversals-CVE-2023-39810.patch b/meta/recipes-core/busybox/busybox/0001-archival-disallow-path-traversals-CVE-2023-39810.patch
new file mode 100644
index 0000000000..e76a4b128e
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-archival-disallow-path-traversals-CVE-2023-39810.patch
@@ -0,0 +1,141 @@
+From 42ce7953f48e5542297ff4381086b45ae28a02cf Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Wed, 2 Oct 2024 10:12:05 +0200
+Subject: [PATCH] archival: disallow path traversals (CVE-2023-39810)
+
+Create new configure option for archival/libarchive based extractions to
+disallow path traversals.
+As this is a paranoid option and might introduce backward
+incompatibility, default it to no.
+
+Fixes: CVE-2023-39810
+
+Based on the patch by Peter Kaestle <peter.kaestle@nokia.com>
+
+function                                             old     new   delta
+data_extract_all                                     921     945     +24
+strip_unsafe_prefix                                  101     102      +1
+------------------------------------------------------------------------------
+(add/remove: 0/0 grow/shrink: 2/0 up/down: 25/0)               Total: 25 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2023-39810
+
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=9a8796436b9b0641e13480811902ea2ac57881d3]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ archival/Config.src                        | 11 +++++++++++
+ archival/libarchive/data_extract_all.c     |  8 ++++++++
+ archival/libarchive/unsafe_prefix.c        |  6 +++++-
+ scripts/kconfig/lxdialog/check-lxdialog.sh |  2 +-
+ testsuite/cpio.tests                       | 23 ++++++++++++++++++++++
+ 5 files changed, 48 insertions(+), 2 deletions(-)
+
+diff --git a/archival/Config.src b/archival/Config.src
+index 6f4f30c43..cbcd7217c 100644
+--- a/archival/Config.src
++++ b/archival/Config.src
+@@ -35,4 +35,15 @@ config FEATURE_LZMA_FAST
+ 	This option reduces decompression time by about 25% at the cost of
+ 	a 1K bigger binary.
+ 
++config FEATURE_PATH_TRAVERSAL_PROTECTION
++	bool "Prevent extraction of filenames with /../ path component"
++	default n
++	help
++	busybox tar and unzip remove "PREFIX/../" (if it exists)
++	from extracted names.
++	This option enables this behavior for all other unpacking applets,
++	such as cpio, ar, rpm.
++	GNU cpio 2.15 has NO such sanity check.
++# try other archivers and document their behavior?
++
+ endmenu
+diff --git a/archival/libarchive/data_extract_all.c b/archival/libarchive/data_extract_all.c
+index 049c2c156..8a69711c1 100644
+--- a/archival/libarchive/data_extract_all.c
++++ b/archival/libarchive/data_extract_all.c
+@@ -65,6 +65,14 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
+ 		} while (--n != 0);
+ 	}
+ #endif
++#if ENABLE_FEATURE_PATH_TRAVERSAL_PROTECTION
++	/* Strip leading "/" and up to last "/../" path component */
++	dst_name = (char *)strip_unsafe_prefix(dst_name);
++#endif
++// ^^^ This may be a problem if some applets do need to extract absolute names.
++// (Probably will need to invent ARCHIVE_ALLOW_UNSAFE_NAME flag).
++// You might think that rpm needs it, but in my tests rpm's internal cpio
++// archive has names like "./usr/bin/FOO", not "/usr/bin/FOO".
+ 
+ 	if (archive_handle->ah_flags & ARCHIVE_CREATE_LEADING_DIRS) {
+ 		char *slash = strrchr(dst_name, '/');
+diff --git a/archival/libarchive/unsafe_prefix.c b/archival/libarchive/unsafe_prefix.c
+index 33e487bf9..667081195 100644
+--- a/archival/libarchive/unsafe_prefix.c
++++ b/archival/libarchive/unsafe_prefix.c
+@@ -14,7 +14,11 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *str)
+ 			cp++;
+ 			continue;
+ 		}
+-		if (is_prefixed_with(cp, "/../"+1)) {
++		/* We are called lots of times.
++		 * is_prefixed_with(cp, "../") is slower than open-coding it,
++		 * with minimal code growth (~few bytes).
++		 */
++		if (cp[0] == '.' && cp[1] == '.' && cp[2] == '/') {
+ 			cp += 3;
+ 			continue;
+ 		}
+diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
+index 7003e026a..b91a54be6 100755
+--- a/scripts/kconfig/lxdialog/check-lxdialog.sh
++++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
+@@ -55,7 +55,7 @@ trap "rm -f $tmp" 0 1 2 3 15
+ check() {
+         $cc -x c - -o $tmp 2>/dev/null <<'EOF'
+ #include CURSES_LOC
+-main() {}
++int main() { return 0; }
+ EOF
+ 	if [ $? != 0 ]; then
+ 	    echo " *** Unable to find the ncurses libraries or the"       1>&2
+diff --git a/testsuite/cpio.tests b/testsuite/cpio.tests
+index 85e746589..a4462c53e 100755
+--- a/testsuite/cpio.tests
++++ b/testsuite/cpio.tests
+@@ -154,6 +154,29 @@ testing "cpio -R with extract" \
+ " "" ""
+ SKIP=
+ 
++# Create an archive containing a file with "../dont_write" filename.
++# See that it will not be allowed to unpack.
++# NB: GNU cpio 2.15 DOES NOT do such checks.
++optional FEATURE_PATH_TRAVERSAL_PROTECTION
++rm -rf cpio.testdir
++mkdir -p cpio.testdir/prepare/inner
++echo "file outside of destination was written" > cpio.testdir/prepare/dont_write
++echo "data" > cpio.testdir/prepare/inner/to_extract
++mkdir -p cpio.testdir/extract
++testing "cpio extract file outside of destination" "\
++(cd cpio.testdir/prepare/inner && echo -e '../dont_write\nto_extract' | cpio -o -H newc) | (cd cpio.testdir/extract && cpio -vi 2>&1)
++echo \$?
++ls cpio.testdir/dont_write 2>&1" \
++"\
++cpio: removing leading '../' from member names
++../dont_write
++to_extract
++1 blocks
++0
++ls: cpio.testdir/dont_write: No such file or directory
++" "" ""
++SKIP=
++
+ # Clean up
+ rm -rf cpio.testdir cpio.testdir2 2>/dev/null
+ 
+-- 
+2.48.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
index c3131eb453..85f22ada53 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -53,6 +53,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-syslogd-fix-wrong-OPT_locallog-flag-detection.patch \
            file://0002-start-stop-daemon-fix-tests.patch \
            file://0003-start-stop-false.patch \
+           file://0001-archival-disallow-path-traversals-CVE-2023-39810.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
 SRC_URI:append:x86-64 = " file://sha_accel.cfg"
-- 
2.48.1


