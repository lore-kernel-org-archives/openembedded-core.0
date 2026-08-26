Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27F6C61DBE
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 21:46:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23519.1787780766761487718
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 14:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QcY+l86I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2698f24599=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QKe20v666570
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 14:46:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/ud+6qTwHGthzRQFY/Zq22ZvMOftx95yhtndj1FM5ws=; b=
	QcY+l86IZPyoQHVl2MofdwjJnF6ikZYpd+ibj3pXjop8Yn38dNqSoAd5EPIszRe0
	Fe1yRFXpeXfN7Hj4Y01nPc+1/ezZCoI18osnDbg7bljTL9D0Iwys8Mp0d/vypScI
	HRCb6p9ycYiTImj35RblcgmPqlJPIl31uIpICfxiMUvwTZ27XkE1bPic4GBL7VnS
	TORGycoDilTkS5X1vdofxyPoawOjSmi/J2S5fTvEIDMhe/jSFVFABJwL16Xbw/0n
	yj9WeT6R3mbFPSnRunexf9y56iyJA7ptPUTDpojqaM4px7fuphDMgQaDx2zbUtq7
	A0zRJrXsTYDWmb2ZH/gELg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022093.outbound.protection.outlook.com [52.101.48.93])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7b9gqa37-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 14:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXUjLTst6PyeXnxwHdHcyEPx8oG3uP6dJaqQvO2WC18dzZwV7QkXJ4644gsu1eLENFKDKf5UGU8QG+WwON2ub40GV6+1qwMBvChvvcv6iL7yTx4ulO1XKAGYASw4VNK1aUXelbEgMwVL/EVaLm8TbvGGJtYWCvRl1enY6zdes+/VeVLftub+X6b3X3RoSxB4pkxjyucuWYnY7DhDcB8U1/VinnSuUQCiblCITDf8lEHuYJrMzdLGSessqBFC2SRwLdWF+93DEP7jr0mGe46vtXF2BxXnNhm5Nnct8UNDHr6sBITLxyQK9RTzWG8DJ7XoVQVI0gL6O2bsLjSwQEybfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ud+6qTwHGthzRQFY/Zq22ZvMOftx95yhtndj1FM5ws=;
 b=Lv69hLx7w0RgXkxgKHnFtcKkU5BRjVzyBb+0bCqJSJ+yV7qpQ2xTQxue46bxwBUe6OkThnFeQqmVGJnM6A0aZ0atB93sNvvp2tCCIPnXu4eYvgdXrVg7kGtq1oGeXhaV1x71qa/5Wt50OBln4FP5X1aIL8EEOt952T+YCyNodaT0w1As0FPt9Yr9Y0ZwwUa5f6h04UV0QDz59n8Pn110IGp1XUvbs8ZM6Xqzr0+8LZpS0m6b0oE05NGSsowNSAlZ6HzOzIJQqUUCo/McdhBi44ebCPRzKFE+TgTH0QzjJ16ZlmhxQoFcdZFa2MyEpx3/fgOSvVc39Gdpvb60S3R6Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25) by SAWPR11MB9898.namprd11.prod.outlook.com
 (2603:10b6:806:54c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 26 Aug
 2026 21:46:04 +0000
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b]) by DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b%7]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 21:46:04 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v18 05/16] target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
Date: Wed, 26 Aug 2026 14:45:37 -0700
Message-ID: <20260826214548.3002838-6-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
References: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF5EA507B64:EE_|SAWPR11MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: aa2fff2a-c170-4ba0-6ca4-08df03bb6d75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|23010399003|56012099006|11063799006|10067099003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Z4sLaVYUfsgEYkM31RP/bOpwVgER+6XOlaubhujMs8V1V797OHax2k7Js1NoYp7ViOIG3R5+NDyRzWjJ0nGOOhTLjs7B84GOaNgxTgs06CKan5IGnhJ0GXMiFccPdbPQymfHFj2QHkulAkmjXk4co8lSQJt2rDsSXcwEmdPR9qRxBtQXsbENfvzO3JN/JFJcNwPd8L7kVx1zxqQhMiqpXV8SwDlV6gmA8kQA7bsyXKigClcQVtQvx2jU3CR1yKusdYvB9tLRl5yCe6ByveeboETwG18kH6dL9wVrcIISPIHwiB0SC1jNAomUAyWO7mThadcYlpmQS64tv7pExt3vV05KqzNb8r7y40MytRSfdYZBKX1PdjNtXffmEqFqOeq3VOysX3PB7D2d/n7qb4n8qZo9HjBwH5tKJKK1U/4qqHKJXCIrYRViGwco2W84+oVC2aBAO0z6wtPJ7KR5nn7fgCBOAciQYKhjGXnNb7CKamhNKdmXUCb/eEv42o/oQiVsy2x3XWJ+VKONMdpYUV5vTsJyjpHo6NW3r7+/Nf4uTJzggSM3KvgAjIiApHKP2roLRcgaYsR5WWPV3cs7E8xV1t0x4KjWJsBgn7/IakWEDhVMsZuw9dhFN7KcdpPJTfAbWpSMqJX09CvonXOe0A8HuzKmUqWLGzI3ZgK1c/ZaIEEGynTP8MhyIq36qe0At1gR6np5iQFjYwM2okOsdnTX86UjB2IR1RgyTJppooAqr2Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF5EA507B64.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(23010399003)(56012099006)(11063799006)(10067099003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JFTPIWJ0YXqZX6LjyjHw5puWUxnvk63X6Zk6JQG35K5aiSl86znXB9t0zctb?=
 =?us-ascii?Q?/T+39pB93CmGe2wbDc5CRTmyaQum0ZheWKH5AkeLLCJNDhv40JLi7mIFMOGh?=
 =?us-ascii?Q?FimBA+RS/bZ0mmZGVyazpShl6LwwViYsdiKEqQ97Co2nzYPxp6p10GO+TUjZ?=
 =?us-ascii?Q?6yf6L8SPc8VOifuYKBviGXUbLJ1wKtLn1kF/lJHDGSAq6skPFVBRDCXlJAZe?=
 =?us-ascii?Q?84qbTN/tV6GzDbg192j36FBjWZlUkfeBV9LDNRwmc2HOIVlmodgJzxmjeYv8?=
 =?us-ascii?Q?6CbTnJ43IZ5Jmuer2RsV8I6k/fINSsBxF1kAK85yD+p0BllPuoI2d8MgojgS?=
 =?us-ascii?Q?/E8ayXvNtsPbCbQw/HaHq7b3H3nN001WChtS8YFHCmogrXy1h2t5xVqG2w/G?=
 =?us-ascii?Q?N1T1cJ011xF1yHGcf6pikp5MceBnmsRM8DEtCPkPO7I4tCt+Iv7T8uuGrocj?=
 =?us-ascii?Q?9r1PCNyvALV2wZ7P9AvxTWD3so/XKIDpMWrtYx3uAfTMFUCfeGOqUJzKGfgW?=
 =?us-ascii?Q?p3aKzGQhuDmRG4Fm5XdVqm3cKcEu1wX+lBkS/hEKDsqwwio5zWA0MrbjGUux?=
 =?us-ascii?Q?XsAqY/wv27JbfY45nWLi5JtK/aeHi+RHD/cyBKRHKSYL5WcrVIQJIJzTvg1t?=
 =?us-ascii?Q?pJ6qKKX+qs30AzBDBsJ2/fPfJC9NtLI5hrexwp3+vPAUI3QXkfTINYJ+pQ4a?=
 =?us-ascii?Q?SqSKO6x2LJ6znLJSQdWT4IBA9+PJR6e00BrtjGz3oRgsZVPFitusLiUu1Ns1?=
 =?us-ascii?Q?rtHItJopGfVghvwPFV/nuT76diXY8l0Vlb3dxJ9hOu4nf0d6pixtIKo0v3h9?=
 =?us-ascii?Q?H+whcKRGOyXRIi5kMYjNB/cokZvnEXyVAyKpJH6Mx9phkIP+/hVZv3N2t8VC?=
 =?us-ascii?Q?iy/1CLCF5dhulwU4zSIeasmrzrBObG0SM4SbP7jhyKlbFU8LzHi/2OpE9mPp?=
 =?us-ascii?Q?bmkOEPj9MpP2lHcvS+4XxVeuzcLzyflgOax0E8X/cg1oZcvF/l+gqmkiz+I1?=
 =?us-ascii?Q?HD1yB8LsI5/KGfNXdORFPZl/oCBcpU4aVVu1/N3fZ8DRKDecEVBwK1+gNsrK?=
 =?us-ascii?Q?SH/SUAZ84NQqk46tmWgBCEqwOJyDCYZAS3iUY+BfITKfQ42+Hzu48EIjUPX/?=
 =?us-ascii?Q?tcTiX0JYtwYgyS2FkJIug7YtbqsCIC6kGa+TTWOfx6GSqBtLEcO2JjdAm6as?=
 =?us-ascii?Q?2cWG08ana4XrP7tdwuvMnjIqbYuAoiw67+9Bnm04XfeNyPG5tIsaI2bVVP8O?=
 =?us-ascii?Q?WCg0LxvmbpxR87yD+SGT2MFpjQFtYHfLQRt5x/GEpOI5CeDxUrvIU7e/IhMg?=
 =?us-ascii?Q?d0asixgu4MxkhYV2q4GkXA4RS3BVi5mwZC25hotZj42pkJ5cDb34J/qUAvsH?=
 =?us-ascii?Q?Qiv/rilmw5Tg0LLhh9Hp+Ik2ZskHauKMdgDZi/QGy7cnqT8h/oZPdoBCj8b5?=
 =?us-ascii?Q?Wmwx/62SKSAtTFSzBjGqKh+9EAgZ8OcjbzAYJUsjjjMH5pagOKzHtxx2qNY1?=
 =?us-ascii?Q?gJ+GHvjGnj4r2AlrOpPcWIaf6yVtc9NrAgjBHEKK+ilCnL6qSPhqqZI614ts?=
 =?us-ascii?Q?zMyp2I3LHRA/IPEQAUvt9dijvu0Jq1ZN8485vRj8NoLQMoYurv6hlHluk+a1?=
 =?us-ascii?Q?2CLcQ4jX2omYfYStOvXcXmtoZwKymAA0r+5sPgpipxN7SC9rb2TB4MGEW4L7?=
 =?us-ascii?Q?X5/J2/qMj3JuoUvnP3IXDBgTDJHQ/amxoPUI9A+gRGenuKdoNLHFTma2B0UQ?=
 =?us-ascii?Q?GiOLk9hQwNiQbjGvSCCBgWnc0XEVCzE=3D?=
X-Exchange-RoutingPolicyChecked: 
	BXHQYddvLx4jmf43ZGzpZjqMSFaSecTy2VHJoEf3qmMWqqMwuIkrTznKU1DJhr5mxMdoCfFGM3rXy6LagUv/W1FtVsY8LegIBpY5SmeYAcmjTN9qL43sQPBq6wm5mA4/I2JTUiXdYif/rES0hdC1jWEEJwYtOS88NR2xAsiSpUBIigME3KPNdAGiWB5nfReioqVreNXKuu4J4zy+ClO3+9X/bdOGNO+WWmYUO8RBBbDd1KumxlpilzvYmRtKAn3ILsSFp/vXp7hE6Fv6NaBeb3uvzAIa5fLcYikICj4mkiM8J3O0+29de2nRM2cV0k3g7QTYbJt8RMrYVHsG8SnW8Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2fff2a-c170-4ba0-6ca4-08df03bb6d75
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF5EA507B64.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:46:04.1056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxbHi+bso0U29uwU+RAOMo45AY+afBfoCNX5QbE0rPcYh9HfZLWG++bA2eL9IHVyFfhY12+ZTVvAEY48tuYY0IQdjOiEiOjNUUEdLTsuAs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9898
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: K020SGM9SsVXUlcYe_qPEhV7YZVTnue2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfXydV420UZcXtl
 GfbOH8PkB+4NGAN40flBQywtWVRJlzU+J3U06eh7qHC/iic3ciFyeYKoDUmknZfs+moP54v4BfA
 S+J5pg6pnlJHYn81jRrK6a7DxWPIyUSaKiVmiWE/E5YxK+6U+mJ83lesQVoJeQP32LZfdIAYHiK
 eDLbqOP9A8q/z6JV/OY9jGcE52LMGrU1v0g0GJFmviveekwg6Hh+QH1147teltqyGrKIEzgyqDm
 Z1ULHUjko7IvJIJFL+Hz2V/LRhi60sEdIlbPXct6hb2ReGEvAKfcAMTnmL4bpfA9OWuup8vg73W
 FNU4qpBu8MJJVcGQBSXBf9PrO7AGcUYmAOdobGZKZyz6LkKqyvoOQuUynBlyJ3mUWvGg+zj3Jkj
 PKEGipmuUwtg47Y+D7Wkb0AyQa/tNRuW6Cf+EDlaqGLr/vDYDrA3BJZt5CB308dT0Cyxjun1Oro
 8V9G2AVD72/lqUpgiKQ==
X-Authority-Analysis: v=2.4 cv=LtaiDHdc c=1 sm=1 tr=0 ts=6a8f5e9e cx=c_pps
 a=9VIIl2UxNuoJMDRiX/J/iA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=lZurfIDJcIjVqGklx3sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: pETjXmlNky5DniQX3CRg1UpWONhzxuxE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX9DekUr8B6VtT
 YwUpJBMCiHBxDZdNwEKRtttdf3kZwCzayzc0RH13d+SjCgRCio/8ZG0pN6vcM+l+CFXgR1Up9A5
 0mjHyrMpoemMxOZppvRD0dahJ0r50HWVsVfFp1MCp31wpLLQ2g2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 21:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244422

The rpm package requires /usr/bin/pkg-config when it has .pc files.
Fixed:
1) target-sdk-provides-dummy.bb:
  - package acl-dev-2.3.2-r0.core2_64 from oe-repo requires
    /usr/bin/pkg-config, but none of the providers can be installed

2) nativesdk-sdk-provides-dummy.bb:
  - package nativesdk-wayland-dev-1.24.0-r0.x86_64_nativesdk from
    oe-repo requires /usr/bin/pkg-config, but none of the providers can be installed

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb | 1 +
 meta/recipes-core/meta/target-sdk-provides-dummy.bb    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 37dad54409..6075770bf0 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -11,6 +11,7 @@ DUMMYPROVIDES = "\
     /bin/sh \
     /bin/bash \
     /usr/bin/env \
+    /usr/bin/pkg-config \
     libGL.so()(64bit) \
     libGL.so \
 "
diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index 65b87fd97d..ca155d0705 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -54,6 +54,7 @@ DUMMYPROVIDES = "\
     /bin/bash \
     /usr/bin/env \
     /usr/bin/perl \
+    /usr/bin/pkg-config \
     libperl.so.5 \
     libperl.so.5()(64bit) \
 "

