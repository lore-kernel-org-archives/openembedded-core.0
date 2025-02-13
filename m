Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA26AC021AC
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 06:00:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5004.1739426421304354586
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 22:00:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4139e44f67=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D5OBsw022595
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 22:00:21 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwy6jkp8-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 22:00:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbehkZsfw7uRkMvieDcc/9Ha5b03XJvy6ggjlmVfPs4jZGN4ncxjVAdQ0JcQVdD9GEqe3GXhqNfT9Tq+v0UQI4OucP5OlPlO9m5/rXhb1jSesMgpYXZAos33MP5M2CgaGowMaJkn0RdtKDbPxUquUQJIIG9cd06vLMWaTDNqU8a6zB5fgzjkz2vLUBTQ6vz30aO2jzRokwMOIPs2392fG4IZjO2peiCStjwtRjDDzoS2CfElXBlPwugBCm1mbzEjqS/abN4+cTZPmiXfco8jTIMw5EZG/yd4e3QMFzKI9QVzA318KjUSTcoi3IBw9GlJWl+FO+iM5w/cdlzrprfgRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayrrauirYRJlHHxeFG43QjWqeHyHypaWjXPhnyHEIZU=;
 b=kdHfzOYa0eTGHPPQQz2AyHWlj3tLANMcLO3kfkVllnHi48rdAIkCAgU6gdByRBDs0QIyhCNH0Gmosgj+EecCpQWVQOgd2ujNuFIj6INKFxwEYCGS4Y2QebOyr8bWn7ZAGR9oaFKJ6gunlC2WUiu2zcxKMkalgi2gBt0QiBZjVSiOCiDzlI54D4347eM6cxw0jW309YBApUDGl0SJhs/MJKgJWRBp3vdu1MvXPThPGvSD8kOxbYYvbbb1fOfhpsatNW8ROfWqW8ZjPkoTBXyuqzOcwZNSQMbK7yyIGoNwbyWsSPx6wHROSPEtXbYHGJeVpcc3nsnw31l6DAoiEmqSEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by MW3PR11MB4569.namprd11.prod.outlook.com (2603:10b6:303:54::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.14; Thu, 13 Feb
 2025 06:00:12 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 06:00:12 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/5] sysstat: upgrade from 12.7.6 to 12.7.7
Date: Wed, 12 Feb 2025 21:59:56 -0800
Message-Id: <20250213060000.1092285-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::22) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|MW3PR11MB4569:EE_
X-MS-Office365-Filtering-Correlation-Id: ff00d229-6dd6-4874-d787-08dd4bf3ad9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?j++s4VXkKLzPZOHKGzOaCwxTHEcdgoNwDCYv13zZ3MJ4z/s9w3fpPEPGKU+u?=
 =?us-ascii?Q?ME9yU3yF8J+xj/Cylj4RKb0c5Y4Ax6SxtWWq5cq4jWku/celzbcqSWxaLtKx?=
 =?us-ascii?Q?vOpHFxR6AR5BbV/Mn9W3tTP7mmJkNaLD1gvnD2RKmkxhXiDlbczwiJI1Kb5k?=
 =?us-ascii?Q?euFnbhZdCuBou6OA/1TGAL5FwTlY2SRXlkl8C8TGLDnQ73sSAnrA5sfdmxd9?=
 =?us-ascii?Q?ZbLCps8/YbbM8jzkrok+/ZdqgGb+GhYoQkqHePnVMP3ULHP801AHRM6FZi50?=
 =?us-ascii?Q?yBI7bDIsxC0HELKDk9nshoPHu4uc7ISnbsYmR8i0P1iAS4jApbBCY/H2BTE0?=
 =?us-ascii?Q?TrVVkh2NPqcQaMwdb7yCesXgeZxMbjmb+esESE6QyIiBuw+wcEGbIXzeVZOp?=
 =?us-ascii?Q?ixWmzrWGMkjoCEuTWLQ1qF5MaHYCy2WIJkcRQLuDFcRxWX42qoPp1Ry03ddT?=
 =?us-ascii?Q?2LMSD6SYVdOsgmX5CSJCXxK8dh6o6l5aGWTe+sz3OHug8jlBswm/YuKomRos?=
 =?us-ascii?Q?mLZYVqRkwN8HlBPwqfTFjM/Ojdc2ed1TB3Q3Hc+yxtnLqsm/khVAcepquZkw?=
 =?us-ascii?Q?3aWRu95cZh3Q2X/LzcSebSxUrJtrss+8Pdy0J6g8REd1+qDCSLO+fPcaBC9y?=
 =?us-ascii?Q?65VIWsl0RAYmX/3Xe/3FwCneDlji5whRDIK8+Wqmg7nHHh7jDt2Dn8QwBatz?=
 =?us-ascii?Q?qqbiFBSE4R2WjTWY/DGsz+KmEvvfx2ViH265+5K6MF+ZJyNnojBG50v1CoX6?=
 =?us-ascii?Q?ezyiqCT/Hllbn+3fsKst0vL9A/QtVadOZoyznld1ziKiI4+NFdf7huiOeixo?=
 =?us-ascii?Q?XRLtIoHMOAqIFU2Vh3SsUDkV2qEoohUEcKfJMRx3QU/fuLzEQqWfzz0SZ2eu?=
 =?us-ascii?Q?+wxdRLRp8PtiFoz/ewPBg7MrvwBXkJDQRi7OHDemAEvzVvLsBcJQN2rEVRa9?=
 =?us-ascii?Q?7wtw3zIDDIzRj3SxcynlnfsV3kBGPLvnI325IoANUhA7/qzs+vWzSvTC388m?=
 =?us-ascii?Q?a6kDLRTBZl2IgkOzV8kKWtzyoVb/hui2FX2M/5UVH+gFCI4Orf1nAGpNkxyZ?=
 =?us-ascii?Q?FpjbKpuvPh6wV9wOkOKfm6VdpTuqOpnhu6Xy8Hu9HkzBfKnqm7Ni6m3AwSFy?=
 =?us-ascii?Q?ld+7v7hXw5R8BsQczuH82tbAKa6nx6sVIQMYAwW+mt8fZXjJz5Qc/weV0gKD?=
 =?us-ascii?Q?4acy3/TSxAuEAahuKjYW2y/fWNZsVdCdLHcOC8zciSIfjMFAYKu1lt4AhBHV?=
 =?us-ascii?Q?dxzZ3iFB9p2yf0vpVMbI7/TSgLcFwMry0yPlIKZJMKi/ys2y4Ky+zAkwGbBa?=
 =?us-ascii?Q?D7OOcliC6qEa1XtI7zsovp3Zd7X+MWrM/bgoLLhG6TZ1cvGe8kU11WE2noNf?=
 =?us-ascii?Q?PtGNK4Oy0voJ9o0yFDzzeA9FgKRYp/pbWfqiVN/qDjWzP6/hUscVMDH8baU9?=
 =?us-ascii?Q?JX3FApi8JsJNiYmbhhlUiO9S7l7jIUhv?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oqcERNbvZqXueAFGdzW2cAT97g+3xuqYAoCuE7iqe2+Ln4IvRsxQBciLsLi8?=
 =?us-ascii?Q?YAHhlzQTtlEwoRur0HjbFxH8fmswguFGdbw4kOFg5aZEEWvGZ1b8aF8KAmth?=
 =?us-ascii?Q?63Vn3pv3RS80jW5LQx1ABHx99Z45u5vauMUItm8Ge7Rzr80xEtqUFbRwFQhv?=
 =?us-ascii?Q?JkgnyjGYohTlJvm9whWdmF6dX6gb5JxSaBMSA2aiz3KCckJhI6Ws/SIonsXY?=
 =?us-ascii?Q?p0cv04Fbz4+Azcd6q2mIcAQ1nM305Ol86hTTI5WDQ3ibWUcfY9mgFq6mCPsB?=
 =?us-ascii?Q?yCU1KnFH1TJo3p3kvP6iFBPWEsFdY4w5txVBRbkU1WPZgNdtLDeF8teLLXQ0?=
 =?us-ascii?Q?0Zw5+6qEVCjlJ9f4faSYrl1FYGUGfLlqOBPBY2Byvg5bi6xu4e1n3akVGitp?=
 =?us-ascii?Q?plcDNfOjgHUyTddQYRRQIn17wxgSoGcKjpk6Mbm04NWjM37IJW5pg7mvzMxp?=
 =?us-ascii?Q?mdn0B1OUSwtx76+yb/4a4M9wUtiLmTr6YULXkK52pkjcNhutuBh+IMeMj42G?=
 =?us-ascii?Q?q4WFZHYWgulzdcOUNvAgox8u3I1diJC4rS5h4uVWdu2SN6wW1NwVdxAGjqa7?=
 =?us-ascii?Q?voGxXtm4NX1tDRUrP/MTql4HlAO1l8GLy7/q230AKh6zZiSKNp6aXozKoDH1?=
 =?us-ascii?Q?iR04gkkHNJ0JlSlr4hGD7HngWpp4ElaYhq/X4dlgQuqvPEWL+kEWkx9oEf/1?=
 =?us-ascii?Q?85zh5R7IfCiX7vRuA6FLuNoZ+UdRD25JMbAZ7BRtfgJS6IrfHWh3YuOFBuzH?=
 =?us-ascii?Q?Y3KVzSX1yy6uG2LwVDa+mVTYcAq4n245oH1HW8lro2cn8hk1Sorzy3GPjAbz?=
 =?us-ascii?Q?YhZMNuReqg6dGW/Gejb67uVTpE3eEwqHxjab1Z5tCDedTsHJ9DWbZ6IFRclP?=
 =?us-ascii?Q?ENVOEcQv6J0AXd4ha4ygiIZ0k+BFJtpeBGqmArjALxALayUhmSDvo8gu/b3+?=
 =?us-ascii?Q?up6cZpulI1uoQhg+x2VdNUeU7b+5McCyNa1jl/waMA30IzwG+Hn5wm42KG/T?=
 =?us-ascii?Q?eE7uOj7jNFoXQ2VQxaicKx8KZ63zo0noP4z0KCHSh6a+t1PrCVakS+jsezNb?=
 =?us-ascii?Q?m8voKL+pQEjBVNGPjFYQ9CbDA/h4jaFjlGbZbNLGEN5FSxpt3A0alyA9nbTR?=
 =?us-ascii?Q?ycUEIobeG3UGtAmobv6tlQ670k0Yx+oOoEpUFk9bCE7GTohpr0V0mWIbCdfm?=
 =?us-ascii?Q?0VAZW104RfSLXFqnxqPoixB/8/3tbdfRDiPc2eN/7zSUmxIeqizhgNy08eop?=
 =?us-ascii?Q?gviyT979G0CpN3o92fTdDB5CF1+A0ReoSpJC2Zdy5T+97xVkdSRUSeKUj1I+?=
 =?us-ascii?Q?HTQoy0QpUySUrhcmycsakt0FLqvBKnFVCEO8VLRhjPbsYbmVgLPJPfLWUB58?=
 =?us-ascii?Q?41dK7Z/EGKZDXUt2nHpMvt+0DTuxGVIFozdnPD4zJkIEoW2fOIJzkRs56csi?=
 =?us-ascii?Q?5PY0YPyfm8w9Wo6CJiQXtLnZd1WFHlKgb8N3blHQaH+axuPO8WKamsvGWstw?=
 =?us-ascii?Q?xq77nuEWaftUElZ+aO9YtD7U0XBRJ5+RlRAeBdAOM7+thx4wD9BTNCdcFdj9?=
 =?us-ascii?Q?xRQUxHes2bent52LN/BM89FdTp+A0fdLsvNfK4ZXpHJ9/56RFbM7q6t4awbf?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff00d229-6dd6-4874-d787-08dd4bf3ad9e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 06:00:12.0544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0PnSHb0wRxX/upHfYHG+vqPVaG/k5O07znvcfLW7iBME+uiD1s1qN1oaPNbLWoUdhFf3VC7FMbGs2P4sUbKNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4569
X-Proofpoint-GUID: BT4X3ZF7fz24DEbg3dLASWP3FjFMJO2S
X-Proofpoint-ORIG-GUID: BT4X3ZF7fz24DEbg3dLASWP3FjFMJO2S
X-Authority-Analysis: v=2.4 cv=G8nmE8k5 c=1 sm=1 tr=0 ts=67ad8a74 cx=c_pps a=x8A/wAfU1CBlff9R7r/2ew==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=y8mAY0_gS8ztk75shHEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=717 malwarescore=0
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502130044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 06:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211297

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade sysstat from 12.7.6 to 12.7.7.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../sysstat/{sysstat_12.7.6.bb => sysstat_12.7.7.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.7.6.bb => sysstat_12.7.7.bb} (98%)

diff --git a/meta/recipes-extended/sysstat/sysstat_12.7.6.bb b/meta/recipes-extended/sysstat/sysstat_12.7.7.bb
similarity index 98%
rename from meta/recipes-extended/sysstat/sysstat_12.7.6.bb
rename to meta/recipes-extended/sysstat/sysstat_12.7.7.bb
index ea94ebf0aa..8ea47d7797 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.7.6.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.7.7.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/sysstat/sysstat.git;protocol=https;branch=master \
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRCREV = "3e3ec9b2c69940503723e3c2ffc1965a8a3484e3"
+SRCREV = "dac10e13c70d1102aa3beea10135a3ed60520c36"
 S = "${WORKDIR}/git"
 
 DEPENDS += "base-passwd"
-- 
2.25.1


