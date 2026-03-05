Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 040C0F513ED
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 23:23:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57903.1772753033178892299
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 15:23:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=p1cMLxx1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75246fed85=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KPAcx3836056
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Mar 2026 23:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=PCrBzvxKbhC2UtGZkpQ/
	QDEayOLBQ3+PgZBadqSAVXg=; b=p1cMLxx16MA7vO8AL2e7wSsq8nLvmwUJkOi7
	gPBW+Q7rmM19C1MZqHbuHgCQjRtCoxPjRQHY+Ot0Vne9bmWJAXiEg7ZG7Ni/fKWA
	nPVMRs1SLiifPUnevF6DIV4y4a8EipsNAPReNfWqa/b3wshp5s8pCKViuNEhFBrJ
	Dro4mRVvYzwGBWtQ2hZHU6fqTi6PHhAkEdWwL2lAj0zo6u6O53DfkZfZ/+ZiPWPl
	VCaXXhMVyG3QPSjFn+3lZLRZnr/HfwJ2sseLeUd+Pk5RsAqdQLQEUQl2iNMS4ciD
	97XjwFRN/3eN5JLhZ/SDMxnjdTdf1DO4vCiYVF+D08LchWDFHQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010050.outbound.protection.outlook.com [52.101.61.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4q4ms-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 23:23:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPCf0VhvI9y1XhvavN8kLVtcMc4XFM6zF/SlpevsHxx6O0LpyKLWmltUjG1mpXnlxoHsP873Ct9rfr2NmDIaJFstOeZLk7ju3HdzpWCADMGS1foRsuor1MJk0jrpm5+OYGsQQzo4HIGcd4F1HDGDih/394IR4i8ybpqwqkYqVYiWW3zaumOpolOFWuUI76ai7ttwzwmz8uD7NJwSKj2gwFfSCaKNwXJXyHBfBHaYeZYXjqucvBY11KXFy8PQZgIkc7ElDLcjdK/KEmpFRmQxgNQny5iFJKfy28SVRS8bZyqdmvktwJSVj1vGbTuQyRswLyZe1vVVeJXv6a/E4PSaYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCrBzvxKbhC2UtGZkpQ/QDEayOLBQ3+PgZBadqSAVXg=;
 b=g4zL5VnDw5dQ3YeTu48x9J/IxMkcZpp8GLW+ydgWr+md1qveFsXdHpeUr4IlyjW3us5b/yBsjs8gUMFZWP4JFTtECwe9S4557DdQ4/Bxh/Z+qhfb0TlLaOSHO6IvSk/1Lefmb9eV1ujF6SKtNGTKndr9OZ/fYoy3AlMP+8QxIoaZVEFfoAqVuEihSfJtGxCA623xRnyE/lwFE2c6aTg4PPHdFxgVlM8khJoBNIHNeKx5UBQPe2alm6+At5T6jW4fNJN7LRkTn1wMWo7e5fAoMLVdgWA1RJeGvyq9hYZDEUdUGWV7fFMeaHCFHll4VhkVjj0f8G5lZyFQMeS2km6Wnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY8PR11MB6865.namprd11.prod.outlook.com (2603:10b6:930:5f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.17; Thu, 5 Mar 2026 23:23:43 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 23:23:42 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] iptables: upgrade 1.8.12 -> 1.8.13
Date: Fri,  6 Mar 2026 07:23:25 +0800
Message-Id: <20260305232327.449180-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0173.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ca::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY8PR11MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: da1a6f5b-22dc-47e1-eb78-08de7b0e3d95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	WkYpRbhp1VZzkaYs61rXMXXtHZxYl8h31VrecZdKLpSz26oMfJ1BEZmHjTLHKKbuDxMCGxzEP3FMbo0wFx4PbMr5bvubGm2+jhyKzlXUEls57p6iKD8fWi56SD5mHxZNgV+HoqADF35q7uz9TK65kzC8bM74SXCw9BZsr+yfjBnco49EhEWQGhBoJlTehgL1QkHJeeK22a01sriLFPeJj7SJZCBEI5DIKdFk7RQ5MSflc1nqP3Ot3G8ql/lfTmn7VJ/oh5cZbH9+y+PZc2lUqRbu66c5LRuNR/YE2DCPaTazpoEvMbqt+DEAXN+Q5iGjNv2VCDEnMZeMyJMFQDWKUi/AI8q/M2k1UJAlAFXYW7UTAj7OrGD7uXsK31Zv53a6loqvqCEWF6K4T5I4+2Sx7IkgI7F+Z02AABrOv7e5JiGwCmMrX8IR8xJ3Kda3cE70BLApa5KtM1Uua+DCSzBAOTimH+gaGTj4Kd+Zdvi8U0mJOxKJxQKIrra325J20snLWCKtQn8PFU+HGia9JHZ48QHsKuygNsvhSFYPl2ThSrcRsPzh5kS0rePTrtRMdZyP0W7LF7mBKEUI4KexG4GFD423+EfX5yZShVYGJHM4rWt3ocIBgfRGduHCi16wgKtHoNatlqe2ZdyeKRdu+ueht5aQCshKwEGvs9hxu4HJA8a2RotLJNXBRXzUb4O5f2dAEnty9NYeyxy6W0BVVB0REY1qqqZT30UJaH999w+9pnYz6jFpoXTXGB42Z9Svysxs
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FXznIWBOXTilywWRvuvhdFru5EV84/oUFAoJqRllMjwUANbzP3Dabr023U8i?=
 =?us-ascii?Q?XbV+T+Xs45Fa2cUqG2BqUGrMerBOwg5kX9jReGgsMW6vnl2++HCd8gNQ7ffC?=
 =?us-ascii?Q?vpyf9p6bgcFcVun6L+hoJwA/NlcBR09XTSD5BCCnnVnnq35b02jCd0ZLTTEh?=
 =?us-ascii?Q?epKFCtWAYTRsyfVgWXyMs/VWnueYaqswCVtc7qC2Clil+jmMvCEXy4JNl8aQ?=
 =?us-ascii?Q?zGAX4jW/kQQUNqSTVShKHu8g2N8aPe+QHYUYTUaE14wSnPxUBQfJAQa421mu?=
 =?us-ascii?Q?f+Rh5R25sK1j4nhuNyK/S2NllwtijzjV5U9KdmuUHBEDz0iD5gs3nbXd2Kvy?=
 =?us-ascii?Q?KyLyI3KqgSlr7foC4ZUqgKFdatdjVE/wFirQcKxfbzHTIcITPWEVnSd0k+h8?=
 =?us-ascii?Q?HhEI62UlJ4w4jRZ13Jf+pVmqMGLX7AyTPg3bhLTZD+pBFJZIp/GRCQ9Ugi5M?=
 =?us-ascii?Q?Lf1Zkv3BA9h6jlGJb+Gkr+8xI/R1sytZ/ZwL1ecA/+9z1buWxLWNhRyTFr+3?=
 =?us-ascii?Q?ESUjRnSqypmfNoxgVvI+HjBafRv9MyLrb6f88LylL7hu1FZ/TJJ1edXJlhTU?=
 =?us-ascii?Q?wQJjIPTaN5IGW17VEWdyvvXG5mAdyE6fJEkXc+Gh7cbicpC6Bk2BofnrCaxb?=
 =?us-ascii?Q?NgaqLWvBkUeIJR9qeljbR4xrL4SbnXUAh9R2k5HI4viqasFU7Kcrs8o83jjt?=
 =?us-ascii?Q?6o6d0ESSYUHomajBGYcr1Km4AyKqrTgoVJIjgaq0reGQ3Pk0gncZPeBH2EzL?=
 =?us-ascii?Q?z+1vaO6BDz9dWaaIYgbmjPpDYQYmFfZYw9KCrLuwL7shLfGwHWECGAS5YVAo?=
 =?us-ascii?Q?8NzGvFP17/6VYFT13J+veGv3T5sUsUGlpTb0U53CldREcHz3rTshSPSiPFOQ?=
 =?us-ascii?Q?NlyHn27Z04YT/yNeZjbt7yx/T+78tC0fXnxT/RLwZDs10LrKDtvGt4iFLCTE?=
 =?us-ascii?Q?0u/2ohgt13z77O0az1JM1n35x112z8JV3HUoZBoEArVUqru+rotrDceSo15H?=
 =?us-ascii?Q?JLXAVvDg4rKf0Th3619avOgO4hsphUjgFdvSJX0UPDt8ynfCih7gKihXTPRa?=
 =?us-ascii?Q?RHrvlF52xxH5AJOGV6+DjobgUzB/RXBIQx7LhmtxjVWsA7GVt+e829aD/4sH?=
 =?us-ascii?Q?dxLR55wrtZjNlydYRt23MkhaLKdgK3A8qfo/4fdWLn5d5jxQzZPNtFFGkfB2?=
 =?us-ascii?Q?t0RCAMT9x8OmAhBu4qvP4R3oLTYTYrNXYslO4IbahtBP8fwnj5W+kt7L7fDT?=
 =?us-ascii?Q?iIHKEHBoRxwotCSzZ3QwUVyMbwk4/zvuHy0kzkbsw5oMAAdRidgXEm3PSgUz?=
 =?us-ascii?Q?1tK3LiRR3/nULKOdpWCw51Y5oNOeKbwdbkQcHs02JId8d9vOJJv2zGRwnxXF?=
 =?us-ascii?Q?mjX9ZWAyGKaZBtQXunVHEAse8uDe5v6NWTIxblQQWmrZsD33o4Jr8u6XrVqG?=
 =?us-ascii?Q?ZrHM4Mok24hy3fi5WG+4RYJhoSN7RI1wSd8LmvJ80ubAlMZVTPtwYedR3FlD?=
 =?us-ascii?Q?P0nSEbyRRvsvhcOU2qcEW+UgBZVOR4To4R5skIyCazYYzpNtjU+WckXlIh1B?=
 =?us-ascii?Q?paZgC+TTiCxHwsz5iafFWdjYYxVV/hDwsqqlp7s8LGDXt+R6+L7LV0+or0EG?=
 =?us-ascii?Q?15sXiRTXyt2PbObLPmAMsvKp1LGDQ9m+nPwm2vByKFWMLqldqmx1rxcuNeWH?=
 =?us-ascii?Q?mZVnIGRXElRXLPsNx64SEIaOSmkxurtrk/q+DFaPRt33u872MJu7xcksDCSU?=
 =?us-ascii?Q?Cf504EDbNw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da1a6f5b-22dc-47e1-eb78-08de7b0e3d95
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 23:23:42.8935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mE6dTSReXJWygpLjCuC3FcgF14hGnzoSqlEfi7Xo0CtHuC9gHVa+DpDOvdm9bj1GNV9xaQfFewD73/AP5o4RGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6865
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69aa1088 cx=c_pps
 a=0CigaX/e8+d28YZ4T1vruA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=3HDBlxybAAAA:8
 a=t7CeM3EgAAAA:8 a=AX4tkcizdWnB_greoA0A:9 a=laEoCiVfU_Unz3mSdgXN:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: NdweguZ9ta4pjvfCu8nEOO4bEjb-2iMn
X-Proofpoint-ORIG-GUID: NdweguZ9ta4pjvfCu8nEOO4bEjb-2iMn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDIwMiBTYWx0ZWRfXw1nUGQkncqAN
 oRxcE2JD+ueOrxjJleYOltY2RqGYlKLPBCzn7eOws/KF9X3chryGvpOOk1S50O71OL/rJ1IKCCG
 o8/FrHd0uWBDGRE8WDDeyhpFpcCb/FxCIvdVg7P9ibX7H9nwIAwyRlOBt52yiC1Ckm9JZcz2Vdv
 48k6W/6FWv7R4eCCVOUYgfsSejHlSmzvCklsnjLUBtKwZo5riLU85oTywrzGpbNrT1GA9ppGXq5
 D72mbj8zU7O7ON0uTbm10wjt/zKrDV1et/ZwOub8czoqK1AIh+roc4eLcIMZ0wM/OuPbTcDl73m
 Jpa+ORhphXzuAm/ZyC2TY5ALnPNbS1SeayaoGXfgzbB/NLYxsQpHH0Fbd9I/nMp9DRr3LES9eB/
 eSKpOzLAnSqsJbm77VRIUwTX0W/a5aEK4fhyhtA/ZAPcDsBDOdkUwEtnr3Z1gQLUlYd79B71LPY
 76rN+uLPL4EFCdVd4jQ==
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
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 23:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232528

ChangeLog:
https://www.netfilter.org/projects/iptables/files/changes-iptables-1.8.13.txt

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../iptables/{iptables_1.8.12.bb => iptables_1.8.13.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/iptables/{iptables_1.8.12.bb => iptables_1.8.13.bb} (98%)

diff --git a/meta/recipes-extended/iptables/iptables_1.8.12.bb b/meta/recipes-extended/iptables/iptables_1.8.13.bb
similarity index 98%
rename from meta/recipes-extended/iptables/iptables_1.8.12.bb
rename to meta/recipes-extended/iptables/iptables_1.8.13.bb
index 928930d08c..003b1c1421 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.12.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.13.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.xz \
            file://ip6tables.service \
            file://ip6tables.rules \
            "
-SRC_URI[sha256sum] = "8e7ee962601492de6503d171d4a948092ab18f89f111de72e3037c1f40cfb846"
+SRC_URI[sha256sum] = "1afcd33da9e8f913ace6a2126788162e207e26f5d5e29c6573c0e581ffc58b99"
 
 SYSTEMD_SERVICE:${PN} = "\
     iptables.service \
-- 
2.34.1


