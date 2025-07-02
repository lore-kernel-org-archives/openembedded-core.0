Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA8DC8303C
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 07:29:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17994.1751441360292831103
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 00:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=927864f6e4=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56255i3M029311
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Jul 2025 00:29:20 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2061.outbound.protection.outlook.com [40.107.100.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jfwm3sdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 00:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcFEPFgUnHLsQqXxGK+2uSJd16zKHre4tSkwXEfByLZouXo2O4WpJnSbS3OD3VU3CPCBHjt6fNNMVFcSsuooi52mPWDUyvcTlicqBuFdlrgvyv33RPiJd2GVDIyAYEPXssHgSBajkf9bFdhEEU/W6akcdulBP/6uV42Xptp5Ne3yKJipaILJ4iGEoGxx41vQJH/HEJhlgBWxbpCuFbuXBTblY1u+5f89iqetqQBRpGMYCCLDgAWWD9fyAb+I0V8bheKaXawrlMj0WoLg2QTpTf53cx1euaiJQZeAFLHMEf5ny7Oy1oxs2SQ5woqEAf/eAYOOjf2IHUMLXGCG0oZhqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45J0UdGfJk08LSHVZvf6quXRjBythWwAVHj3/fAPJ+0=;
 b=kqlTxrVnfor/FPrujV30YQmORl0dNjjlIKh32mLJDOW2wyXvEBh4O92TDZVt4awqsTUYow/qzNmNygMon3rdMbq/NuNhEgTyLj8msvtKhfW6A7ZZcQh4Bs6LYz6oVbPZOOB2fg1ytb+oKbdy/PJ0d7rjWTAQCgJO2OJQmTa8Ja3fFuLhYd7QXeEu0gFUi4W9Bl7atx3B7mK9+RQwC1qedW6iEKdvwWMSEs8TEcp11wmkuZCJoL606hwc73qliQRVmAJK3U02YMSrKyHZ+ZRo/XK/we7MAQX4CtCnWt72hY9O4O3AUOjE8Xle5B29eK8/JgVghvsibNJzet0elOSjYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW4PR11MB6862.namprd11.prod.outlook.com (2603:10b6:303:220::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.32; Wed, 2 Jul 2025 07:29:17 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 07:29:17 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] libgcrypt: drop -unknown suffix from version number
Date: Wed,  2 Jul 2025 15:28:55 +0800
Message-Id: <20250702072857.1267224-5-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702072857.1267224-1-yi.zhao@windriver.com>
References: <20250702072857.1267224-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0133.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW4PR11MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: e570513b-fd18-4818-516e-08ddb93a2745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Gy5x2NSGju5I36kvwa1q82mxv6hBd92MhcbnZkiJ0S7Lp8QlOy1haG+NUXux?=
 =?us-ascii?Q?+dOesGj0I84R1G5F2JGpcomeuQm+xIjVxAfdDYYDqSXFAAiNy0ISgW2Jt8j1?=
 =?us-ascii?Q?djcKlQUfNMpFeN1cBqz3KBGZGMEynV9byNf3IEBz+CRRPUg0+AqLV6LSHhw4?=
 =?us-ascii?Q?hSKKCRhQ6amymSsphBUryE0xSMIqFLn3Qng67fTZCO54lIhHfjX6Mbf/2DWD?=
 =?us-ascii?Q?nTeS3WHAJALav0biH/PFbZR9GlIJ6Jn9iz0ku0N797ktsbExVusf8vFrmJii?=
 =?us-ascii?Q?j6pHnGsBSIC4xfXCwm5GTcolBKvYpJqEX9qw4BuTdeJsyBZgP4n+f19Ew3vy?=
 =?us-ascii?Q?C922/G5KEWfFuHJoDHcA+xC4Y2Io4JhQLuaKDaZy/x2kB1VbXlfXyeC4Xr17?=
 =?us-ascii?Q?FUa0aw/OP59RP4jlWMkgFweQtLMRfJeiPwPRZrn5iy61t2GVHX2Cg5+r+6A1?=
 =?us-ascii?Q?Ubn9FJARWf8zdhMcZ54DXdCS2e+ueKP4iJ3QfaXJRZ9d+Yxc5WLXDs65lO60?=
 =?us-ascii?Q?Cx439CVLZ0i5w4u1oKa/FRwg16nA3MJfa2bLKh2e/CH1ixkEW1fAorcV+/q7?=
 =?us-ascii?Q?vqWhGL4H7o5ydegwphfgdjg40k6fAznv/ulxkqahx0eIB3xn0TTGq3+y+KCR?=
 =?us-ascii?Q?4lmSnjGVJVMSQc3O8wJvzOTyHR98Zv8LPT+0bCwaoJIfh9xl8cjJb2Xnhe7i?=
 =?us-ascii?Q?/v0CkmTIL6wcnBq+53OHdO7JAeknOoF2DhyhBJa+FIQEu+85PAmPtoQU6Ch9?=
 =?us-ascii?Q?Qkr1dXA84X8vTOIHGr2GV2yyYzcQ18/kJ1Hv/Ab06ISJunZZNpFj/Ok10FBw?=
 =?us-ascii?Q?ucXjdRpRMsaf4tnG32h+aB0czgnl/0kIk9ieZ3yBm6PGfGdpsL5HtlK9dh4U?=
 =?us-ascii?Q?bYSIrGYk5nAF5uNbFJzxlBQRi7cYcjc0DSQ8b/Ln1b2axtK6uw7EY/rHruoD?=
 =?us-ascii?Q?3MKvYG4rPpHbUTQETbMddDkfYGcjlgK0mBNEXa2Qqh7dquIu4ZLa0HeMzMoh?=
 =?us-ascii?Q?CxAeTWlL4yXxlBIap68cv2bgP/8HSscw13QwYWkV/HZebSTZHOc7ZEFfX8Vn?=
 =?us-ascii?Q?TJFywMS2ItQmYFsHHF3aMCzzkJYnptPnvtOr4ZJs1iOBLu0WfTR8CDl1tbvn?=
 =?us-ascii?Q?kRJ+b/F+UgksFTgCjgtjdQLx9MHamQexRZ4auOfA+aFYjuM3ZBCJnFxJAXqb?=
 =?us-ascii?Q?YnFrX3Vn49Q8wM2Gg9slT29f2MKey3rR9IAb/2G5+RpdtBF0sQrE1AbylTMp?=
 =?us-ascii?Q?/fTaCysg6kFSJsCF0sI/SXNDfoNovonapUxq57+nTNYAqT6TGY3NzRs6TLxP?=
 =?us-ascii?Q?67s2mGWJCkSengSPPC3JgphrPfUMU81IZMt18BWbqSi8Q60O1UhHSvA6WoIf?=
 =?us-ascii?Q?bchIU3J03IhBUQaXJcIytOJmXnE3NFXzwbTqstBTz00MzYKSsne8jhqycOd5?=
 =?us-ascii?Q?FA8pclxVQLGjHBDIqeMYhyK76NmPjbDYvpCi1GmGngBpVELV5pf2lw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mpI0ufRrHpYMJ/AVvwb4jt2Z6Zop8cCEO2tkurbXOO/tpLH7s2hOSXnh0s/F?=
 =?us-ascii?Q?DnTVuS27NvzHs4uFz7jJ9wzrfvomzRKn717YCv28ftEQXyUOOcwkGZ3zEMz2?=
 =?us-ascii?Q?QNAEH0j4L8ekiZWPfCrYdHC/I4dQ/ya+hysAqdsypHhtMzhnBxR6CNfMkJFq?=
 =?us-ascii?Q?HKV5U5x48n1ICyHx2eDg+V0jmPsCdU1tn2zqcMNKxV26Eei/YL5Joo4cxCh7?=
 =?us-ascii?Q?tX6ChyW/HJh66jLDpqhXLnxJravbzrnuMdQUq5XnflfIMS4qyM6mZZBv1Ydx?=
 =?us-ascii?Q?oPWH2ysON8YM6hFBfRJLFmKHqVwfFAcWAzUapdsqGlxeaE/oYlhD7NWo6ijE?=
 =?us-ascii?Q?ptlZmFvZ6s2dV11NUNa+dzDOov1glZFrgYuON4d0dWaVzwoyTbdKTADuNHz7?=
 =?us-ascii?Q?ewKU2pKLqwGkkrksSfyFkQ1xOWARQe0rCoH5tNvsoKiPKlbI6Ke6T/o+X3kA?=
 =?us-ascii?Q?/8GwmWML0CMZcDNiAUdMnPX9E2AUMnUlz5sa6PBUVZWXrohDPYB4evqBzxHS?=
 =?us-ascii?Q?pzZPUV6vZdIjWfB4MSsNYMPlBvyvx0Kl4MH4rIN8aRNOunwiYuu/DJP6kcZQ?=
 =?us-ascii?Q?la187n/7kER5GkjNyvohzbEDBC87cAlVAZgjETHru4Dwig2OtDtPaT3SNVJv?=
 =?us-ascii?Q?bpwql+y8WRyYRPnPTd+X6EfdA+OTbxLRTOvCxRNMj35OH3afN0yL18Erk6yJ?=
 =?us-ascii?Q?ExxxieOBJGwMYwH0+5lrnh2iAMdTZSUWecMp80wu7zcpAqZO0yaR0vmqLEdI?=
 =?us-ascii?Q?wcmsOgvPSV1pqbK5OCcKZglpvltMuBjm1wmdXqQzdyFJqXT3tn15Au7kMK/Y?=
 =?us-ascii?Q?CqK9mw0MAXBiTCqLwH1qnzDpxICm1oaDLPzEPYK4bysZJ5Fj2jbW6m7dJxOU?=
 =?us-ascii?Q?CSxgwTBsX2RjxLtjAjLYH24EcBygIiQjK73RW88fnvSIMKc1UJGMfJWd1Mi9?=
 =?us-ascii?Q?80mzlWmQs+ZZfqvOrp3m5Ooqqxlzzr1y188QP+/T+Jts5L/WClr0aSxtqiAZ?=
 =?us-ascii?Q?EExmVQd06FbdQOFnvXTXiVEKPW6mmP94aDQsySt0tjSHMTYCYk2t3xOE7NL7?=
 =?us-ascii?Q?TukvTwExM9SdrmeZaE7pZ7+UcXbWGfhQhF6+hoQ697dwg2UreVoWI/C4u6MB?=
 =?us-ascii?Q?wxixpucoKQVZ1OhtPTRaaGKWqhvHCkKpJ6x835NjU4m2/lLFvf8/4L0bfvcR?=
 =?us-ascii?Q?SSOlrbRE1636QeB2PnDm/J2R21k78PR2uynAswk3kwOWAgZvECPMk04Yp+Zb?=
 =?us-ascii?Q?DnxAUhwWjw0fi5QCTBAJsxvI+DOjOZECxwYYtMt7rW6me4lYDAsWFFaGjlwb?=
 =?us-ascii?Q?VeXvOST7US81zlMPZ1MbgfvBF7rV/PRHUsIwZN+ybc0OfRMjtiaA+tGebgw2?=
 =?us-ascii?Q?hJy3qtjs8XCRJ+iXmQDpyk7q8AG6WD5wiGmKNy9Ris8xi7HShqkhp9IEYF1l?=
 =?us-ascii?Q?2FsSdF1QxbWDBo037X4eRdiYF/v9ePMsZIwNuX0cku7qanC12YWHhUQROAC1?=
 =?us-ascii?Q?u/SDncy1VI0TDvj+Aod+L7fx6Wy/8chSzG2o+1zd25LaHTlL28PlI5YLKg7p?=
 =?us-ascii?Q?obfNvi6zZorS6c6sRs9xmpVh4vWRyBzQ5QjXf968?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e570513b-fd18-4818-516e-08ddb93a2745
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 07:29:17.7203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQTf0MAKH2BNhwUHQKZPiRAhF7dcaGbUp11bVMVQKOEiAYx4+1FUbvb9+ziR0Qo4IH2xne57kY7pBHw63UukhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6862
X-Authority-Analysis: v=2.4 cv=LPRmQIW9 c=1 sm=1 tr=0 ts=6864dfcf cx=c_pps a=G/B0QxK1bSvZD8IHvtZvbQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=H8RPsgal1o7cjufG7kIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: c3jtz89D_s6jfRqA9qrU3dDuwIDWq-Ni
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA1OSBTYWx0ZWRfX06emyffIXRmE 0e4P3GzmvSKqLacyXyK1wNnFnwXzUkqEo0y1/NlMW2YdBYzmOAEJqrIWfQp0nSamuIgkbxUI0bE 7pREtaaK4wu5QW42jl0CXX1f5a9LREXNBmKnb/vGa8ZQ9nE0wgdNY1Gq+xGp1zkHzY3U2nIWbQv
 lYQrLyfEJyqzkZ7beSlWQ93sHCzrYLbbufnn0PVAyRsEumKDol1xIZoWWUylFU8joNUnAcbp1lD nDuYDeQlvPMI5w9PDLtg6ASFQFjRXp23f7T45WQCJV1VL4F5xrg5AZzQ9Rx6Z9HgYMicIKH4zaN O3V7pygT/imrJUWZqyRQeRZPVBNVBnOQC8IgpewcocP+hDRAKk++rSFEMpo5eHMnaaM0c2WscNs
 BFbI2se79bAmXq0NW4aHItiAOaWG2aqhP6kc5iOg3xU7SvYr1dPixCpm1QH0m1qZbbaO9LOw
X-Proofpoint-ORIG-GUID: c3jtz89D_s6jfRqA9qrU3dDuwIDWq-Ni
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=822
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507020059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219797

Include drop-unknown-suffix.inc to remove unknown suffix in runtime
version.

Befor the fix:
$ mpicalc --version
mpicalc 2.0
libgcrypt 1.11.0-unknown

After the fix:
$ mpicalc --version
mpicalc 2.0
libgcrypt 1.11.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb
index 5574e8c821..14cbe53647 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb
@@ -32,6 +32,8 @@ BINCONFIG = "${bindir}/libgcrypt-config"
 
 inherit autotools texinfo binconfig-disabled pkgconfig ptest
 
+require recipes-support/gnupg/drop-unknown-suffix.inc
+
 EXTRA_OECONF = "--disable-asm"
 EXTRA_OEMAKE:class-target = "LIBTOOLFLAGS='--tag=CC'"
 
-- 
2.34.1


