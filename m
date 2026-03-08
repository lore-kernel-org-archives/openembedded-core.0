Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DECFCB602
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 14:04:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38978.1772978658186092463
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 07:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MMbwBwbk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75278c0199=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628DUo9f482562
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Mar 2026 07:04:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=DUNUgrGiszkJESSGCX3WI02P75trkUUpJXmvTF4GuAg=; b=
	MMbwBwbkNipo3xJhFbIts9eH1ws+QQrpeWY5l3+irIdSS0QuV/RLB/ce2vWtKpvx
	ID9q2lPM2F1hgfmu1RiPt+LS6vx2SjUtLm/dqmGfSA3Ym2Zb3ntt4XlosV/S9vat
	55Jq7TnGQ6UZ+I5ptyGgQzLwOqHtxQkzK/euHzb7OBI3SVYLZ9VX5Csu0XgY5KM7
	9CYDE4NWkBUhuKnCtGnnfQbZkpcFBUC9AI7yEMSB4lu4BHnM+W/PWwcHooY9HGtF
	6lLrIuDVAbwds2qO/Qy3+ofT4Po4eosZk5mXvdWK6sb1sn6r7U1Epq86ZJ1jfke0
	I+fW6kfMshkbusEn7W3Ckg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011045.outbound.protection.outlook.com [40.93.194.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crg62gu91-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 07:04:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBZFyAIRgGG3ypVeRrACnBaydEtPQFajIIQfIMblt7p2SFWg2puz++f+N+0O4RUfQk7gCEysXxl9GwqjZXtqDrGgMtPED3n6AjflcqjiLGmLTX38cXVncy6VvLxMN6N7licHuLOxpCiLSOlK6iSYMaXWovlcppuoTeWXYjWrk3UH9g8RFozqm5CpYRUbT1QQhRZTJmgW7f1eD6UwMKYzPeX1SbzvN8PrHvmtbiNfUz++7EiMXU88C9FE6rDBxiV3rExaCaGDWtlF9UsSnL9N2FcAdDUNb/2NG0DpXEvkLwlRFmpav9R1Fwl3yyVnSnnAcXQDtxuTKQYnMguYc4WzWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUNUgrGiszkJESSGCX3WI02P75trkUUpJXmvTF4GuAg=;
 b=Z5i7huvRMce2GESBvZVrI3dGDe1tOn7GaoOiyAoUlZcLdg3mVkuWnhI/tezaSqBpjGD8M4EV+kJp0BMLfagaPe9LLTkqU3qvWP2nQND+IkbfGSllltPZyvjLCn7oDvmgB/7a1wkEl25bgbtgt5KMNg1ddS43Kbz4HJpLtpwx30TD5z2lcErKijuOTIgm2JG8i9dDLQMriN8GKodbFWFnHUOwlxWwDsSE+/dUaJECBPLBNQAjfFdI+2OIbw8M8oEqgeoTe0ksXv6udurtYzWltB7NdALq4vpo1B4nsOF5D/eFfImA5pGoDSyUHdZ+Jci+aqx/t/A0qpQ6GkHuL7gp4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11)
 by MW5PR11MB5859.namprd11.prod.outlook.com (2603:10b6:303:19e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Sun, 8 Mar
 2026 14:04:15 +0000
Received: from SA0PR11MB4574.namprd11.prod.outlook.com
 ([fe80::215f:e93f:c560:8486]) by SA0PR11MB4574.namprd11.prod.outlook.com
 ([fe80::215f:e93f:c560:8486%6]) with mapi id 15.20.9700.009; Sun, 8 Mar 2026
 14:04:15 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH 5/7] libxcrypt: avoid discarded-qualifiers build failure with glibc 2.43
Date: Sun,  8 Mar 2026 07:03:12 -0700
Message-ID: <20260308140337.2503858-5-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260308140337.2503858-1-Hemanth.KumarMD@windriver.com>
References: <20260308140337.2503858-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::14) To SA0PR11MB4574.namprd11.prod.outlook.com
 (2603:10b6:806:71::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR11MB4574:EE_|MW5PR11MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: d68e0c3f-7a3f-420a-05c9-08de7d1b94e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	7/hUxmvzE0q54jyfyuJr60KzbMJmzjM+0oZukE0qcaTnEBDkTVDl6dmEANN0leVs4XgZIR1MLAivle68NuZe4FpA9Nvj7COiryFemCXcbA+7k+MggjeH6hjZxd27YG10F5aFKkRs27X32fmF2slVyErVIvEj1e+X3OzOzAExTsYUIj+P/Uf2bjEV+jNfzs8huZ3Aw4TMDDAytD38/s9O/Tq8PPMWba3xepivQqsDJEkKb11SuF0uzcYzAuKoaCNdBT4GQ5pHD5k3H/TL/d1avYSBjkzGcv6fHAm3CdF8piYbQb8goDutKMVJd3xG/BY5EdhMHVazjt0n1uHY5ToNg1qrp3qw2TUid9LjnPNql4sk61axZL5oX8lzG7EXgZT5nDHUJfuFo690Pg96SDU1Zm7BSYkkIsG2qbFZFILjhVnrxrIlDVIInRLqtUK+VUsB2lcGBUjlZTX9XVzYa3a+wp8m13CcOrcWklorUjBlMLS/zmobTsr7cdzZ+ADeaiqIyDPODnR3tZNQnctwZb6lJg11DX+XxuflHWf7BGTm530a0lefBgtIaXRb6LqmY1awkBagbthtKewg7A5wEmMfs2hF4exkBws326OIv/3fgMojXOFJDpHzzoEJwKgxJ9Lmli4UGntMhvV+M2UNsm5Lsk1gispSSB3g/hbzPgn5MPTH36NTmd2CdvCpoP4yklE4/Ej0dU7VA2/3lcrCbIMQKWKtME1/gq8lWrgL8brEQb59BVeh5d92SqMVe6YIIrnhuTz+R5/Ul0ibngEBUq+PbEYXPe+OCDHChcV8Bir5AX4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4574.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?exT/0xZOIv0z6zJJ9IbUey6e5q5M5ap40fXOIZ/vrlHbQHZjUt0Jn/HrloaG?=
 =?us-ascii?Q?9EB1O1Bg7R4XjNSxHEHHs1V5fjHLIdBXcYfiCsZP7/xj9w3ePIv08OufiB4L?=
 =?us-ascii?Q?5eTjAE6iJTYOzfRICrMVU8KSU3EEJkiGOZfl2z0jFFp1tDarvtyq3VBZauf5?=
 =?us-ascii?Q?Ejc856dSqK19oGY+9GiQ/fkBYB2D4Sc7MSn/DAMHOtXsM3UdRAnTCn0HaDz6?=
 =?us-ascii?Q?XvS4y0qUTu6oBA2bMru5JZvjWMXPzIeZBoq8RyjDiLc+iBl3hkAbsNUYDgdF?=
 =?us-ascii?Q?yWyl3A2bqUrhusS2JitvpwSNqEgEuOiDvWf4Z5MTMqhABX2HkG6lXsn1g2yA?=
 =?us-ascii?Q?il/z/OsCaz8SqZRfzNI61c6zxvCpVuJoAHlnoqmplm7LHx5x9ypIzWH655Ym?=
 =?us-ascii?Q?BJm6sJGHcl9lko9dKnnryqHg2tXS9wIIjAr6DhEwA5Lowpn9FWVrnxGSFFtQ?=
 =?us-ascii?Q?pC/AQB9sAz7IrqTrG9ufKyT+mTLWYbhEkWCamKWB1J/SCI2nxJLmVx23Ks8e?=
 =?us-ascii?Q?0hXoqftDxLknFJr1XV97JDYwMTTqw+F7b+v33TqW1d3j4h7kR3vvIcvM52jI?=
 =?us-ascii?Q?TUaNvIl1PO829S73JeWntjfRr+hW37WqQue30jSKDbs3RwbPplCSfwzI4Yue?=
 =?us-ascii?Q?19Hydx0s0Ya02QNG/h/BZpihl2T+/YxCSaEaRWyt7xwVvbyV7/rGh249TASE?=
 =?us-ascii?Q?JBbjxLWtBFSOvQ8ZH/9KwKbNjkGXndrWQiD6Ncb9xSA2irwqcBlI0kIbGjAp?=
 =?us-ascii?Q?VnpUHsjZjnNKWtj493SvXU7hZtYTufmikhVKOSHZbfC1oiEipQdoiN/tWdnq?=
 =?us-ascii?Q?OXmS0BVwLXrKoiOQ3WCUKU5bzKRLU4W7KnVzQxQrbk4X5eCe8gDH4jcUXfN6?=
 =?us-ascii?Q?hTG2ynn/mksnnq9tw6uV+CmqqZRlDVXOZvLyQ9k+jlioqSI5eyCIaLqQFbg/?=
 =?us-ascii?Q?UITJ9hvfzjjed2NbGbjwCiABpXLcGIKyjqg81rDznjCE93ZrCDfCsj8hQCGW?=
 =?us-ascii?Q?HBrVj6qj48xOGSgc9Buf1Nk22DL0votr+wNqep5+ufwVxghowZ8Nq4pDe/K7?=
 =?us-ascii?Q?JKF+pShGs0Y3XBplOEpxG4tuoRE2sWgTrBU+F5fwUui5sGcpKXJayG5uSqpU?=
 =?us-ascii?Q?rieaYAtPz0BsiljaXk0EHjLK0bd0XbgQ2CI9Vy3X/d5s/qe8edL5Zw0Clhrw?=
 =?us-ascii?Q?YsCoNNSyTzSboscK9ZMetvcizf54ASq3TS9uZWKLM/0GNr9MCRyZaMg7A4dA?=
 =?us-ascii?Q?jFbnEhwTs+hc8az6fI0NiG2rJcLtpisvriAT71GHAWFEby97Itnx3rYWDWc6?=
 =?us-ascii?Q?ueaS9eKIR9Ow4n+4T4wjezEnVupEL/jBcrnb4bCY3Cs9edy2BPCXUvkE3zaO?=
 =?us-ascii?Q?U5Y8Us+b/gZ2eKFLxevlWhARGvXEpBXDZ3tukI2z9b6TjczB7v1L32ugDjOL?=
 =?us-ascii?Q?qrA5Qr0ICu+13sWdCUZKlW5BupclT6oBYYttF1zGlmYLtEgYkjvC1Nk4WqSc?=
 =?us-ascii?Q?EpJzR17h9wTJPmeoeqi0SvaEihE2vUGJTtcjGF0f1zc5jGaYyothfpc6zLoX?=
 =?us-ascii?Q?BSA+EJbP0yWIytJpyeS9th7OhmOpl6pV4ukmVHHTvN4r4A5ccy7tM9DIgIYl?=
 =?us-ascii?Q?94Mp0N80znEibW2tl3BVgTQsqg7gg4fdw+sPboUEF4MBmepqo0fVHUYCFbW5?=
 =?us-ascii?Q?dSL2CwdUczefL8IuwYJ20oU4lUmGEYfHC5eyGQw0RaM6CbOQ08OE7zne29L5?=
 =?us-ascii?Q?esaHjtg5Rnzf9XRCyTXS4xUU12TtUoM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d68e0c3f-7a3f-420a-05c9-08de7d1b94e3
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4574.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 14:04:15.0043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GxAIeEgPO0sx6IgVZSzY95iOrehKcLgk/sKgxQAGf8Srd0pMocw5um7+BxX++1yzI79wIbh7Pr4iAdqGMKHGIMbyW8Fij1G5IKXIDHqAdqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5859
X-Authority-Analysis: v=2.4 cv=f4FFxeyM c=1 sm=1 tr=0 ts=69ad81e1 cx=c_pps
 a=z/rjtr9/JqYX5j7IdmSYkQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=AJhpoo_iYQvPctpxBLYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDEyOSBTYWx0ZWRfXxTJgy6HTmdKV
 PjQ+5JgWCXqTv9OwT1zskXPFFtAl8tFrnIXwFa9I9sZWvZjUnFA1P0LxSvLcadaY2DAU/mowTc6
 ZKQqyYxDq450TNkxtBqY3RQGqydfMwEO/ou7enk1EHQDzRZxlCVa2yn2lUxrcphss3+D5JEO7Cl
 j0kfYfJHxLv4s1BO7U/BoATwrsdZzpj83atjn77PPIJEDiFdS+HZcCUnB7cKf6O4lVWyLqmsxLd
 mCMRWvCwPNW4R3USN+aQ5NnaYhvS0HyqSZCSx6f4OA7SOtRUQiUUBrNEQ1gCCJfLwD3TYBfZXhC
 vudAUMRZfU8qZ+g1JssPUi0UIaS+SvXPO0dps97pI4js5170yQ1uK+2vfuw+AqEEfAr+d3AGPbq
 PFqha25bv+YDjRq9PDeMh1ON3uo9/cv3uRdrB6tKjil3KI0oWHD43LwG+wPgAcPIasOcT+C1ULF
 ViZeW1ZSp2bav+DvHKg==
X-Proofpoint-ORIG-GUID: 1q4kqHAsMNtAdBe1vTtIY5dl-v_hiwt6
X-Proofpoint-GUID: 1q4kqHAsMNtAdBe1vTtIY5dl-v_hiwt6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 14:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232648

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

With the glibc 2.43 upgrade, building libxcrypt triggers a
-Wdiscarded-qualifiers warning in crypt-gost-yescrypt.c and
crypt-sm3-yescrypt.c which becomes a build failure due to -Werror.

Add -Wno-error=discarded-qualifiers to CFLAGS as a workaround until
the issue is fixed in libxcrypt upstream.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 9aed0b9d81..de79fe3c78 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -17,6 +17,7 @@ PROVIDES = "virtual/crypt"
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
 CPPFLAGS:append:class-nativesdk = " -Wno-error"
+CFLAGS += "-Wno-error=discarded-qualifiers"
 
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"
-- 
2.49.0


