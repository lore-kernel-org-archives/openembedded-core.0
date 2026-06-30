Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A25C43638
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 07:19:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15919.1782803966129130008
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 00:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=junYhCej;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1641dd4043=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6tDWo450194
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 07:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=n8RzAQX2w
	7/P7jx7EqEvU8lgkK6/LTkxplAmOY7A02Y=; b=junYhCejI5s65OmSdCuQJygj1
	wCkAOaDS51jl8zl8+N+Y3nr+gu72f7yaQQIgQD8Zy8d+LD1OTu2G3zPXu8VwYKId
	CKTmGueP6Pn4UfkLdsbCBsYCrLuLq0JTMbiUvCWqGu3mSNWqAEb2Qb3HPmmh2dpf
	RZLTrCPjM+Uu6znEKLwYJxv/3RTTvU/2Y6ZqClR4mjq9ejApR8pPeJXiSVFg2y9u
	KHQy6rxNmJ6Nqxbzj8AZ2NL9yMginiIM7AYGlPgIi1Izq+By4YJFbgKxttcGGKv5
	+uPtyq9MQOouLqtaMgNp9BQpDIATBP1JwiRUaBqHwXP4IPSfU/I+VYNJ7v6ng==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012015.outbound.protection.outlook.com [52.101.53.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f23r0bh17-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 07:19:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hi4timr6msYnQFwhVhe0RTWeCeUxlHmtTrEb7C9vthwASr2ce4alfQGXzqCcsHA1Wxy838AutT5CWDFhYXphRLN0MqT4TV/0xBwFbZnTu4vQMv5e+OrxfTIEUjwiIENb3zUKdzZH28xsSEX6nnwRuZSEuOefnCP/IDe7iYLZfc6cbvilfivM53Je8fZWHDb9/lW6CHQaH45Uj0PwlnL+QpPYu89tZo/99xAxXtVFJStW1FCIH8bHyVpINl5zGkjDAgD0ONq2zk+Epd+CxYGL9xzhnyGi45HYnoEVdrxR4dMLU2+Rq+y6BXueBMtw5LIDsQqtu28pHX+NTD2DKgUsTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8RzAQX2w7/P7jx7EqEvU8lgkK6/LTkxplAmOY7A02Y=;
 b=FOEuImblij5ZYi/5hXOvVm8N7PGksqVEujj9Iy1m6Xt0r9HfYJff/hWrBSAnQ56Og75LvgmJQWWTqKCAvmLY+qp4X8bc1ZioTSRKMSmD1MErLhPB1eO80s2GcTnDAgzjNzM4XUR9O6KHsKbVNExTJai5iFJsqbaIHBjMDH5XFp4TZ0Ih2+1sONOdrsEkG9NgWFjtW2RNnUxY12kLIq3HdChnl7BNKQu0R0M1aVo/PSfmVXbxtGfxw+bAH3Qu8Gkh0GCSZd35/oXWvoeP2OX4ZPhxkUhKgbEdhzALRa+K8d6X+Vy+Y6jRcCC8yAKFQQaQxj/Vvv2vsRhagi3Gq/1wzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DS0PR11MB7632.namprd11.prod.outlook.com (2603:10b6:8:14f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Tue, 30 Jun
 2026 07:19:22 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 07:19:22 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [wrynose][PATCH] gdb: Upgrade 17.1 -> 17.2
Date: Tue, 30 Jun 2026 00:19:06 -0700
Message-ID: <20260630071906.1274019-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::38) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DS0PR11MB7632:EE_
X-MS-Office365-Filtering-Correlation-Id: be385609-6df1-41d9-dd1b-08ded677e829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|6133799003|18002099003|3023799007|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	yaVJ7CpqGKn1RF6qEFs3Gy4Kh8cGp6e5KeebIdsP+UWSeUXbSJI7IA86GqiLpiKeul+cVm9tpcE5Ri+V8A/5V1pIWH/usVHzpDQ/vguB612uBtlqVaDMs0Ey99O1UbEJx9O3WmNfhoYu5fX6xMl2J0lfuKPSXg3hH5T2dUaHWn7gQbmMA15OGO2ylLgoRn1b536h1lL4WXg3e25Na39Kmm+K5VFtEqQNFEA6y+dR9jW7oUDYBaSeeli/m2s4T482LXxciYx8+tjfxeIJ+pDY59JaPfNzInMigW2NTlP/003/iwejqRkffzaLhnprJ4V9N8mHBSq7/RXOQ7VW4T0c0pb67tmVW4p0heEDLvAUo1SRBzjE5iZ/JpGvxDgEK2CSyAHihnikTT/2iQP5Dfw0bL/18ZXP70obmmL6l/tqCWku4KP8pxsYa4uMG6BoZzHwczSmFBsmxlnvOs3GzPUpRbQMI6uZRkd4naErPxSI2ISPU2TehOF/BUe/p8wGnOJKgtr3h56VMMtK+1txzqH240/ewNZeSNZKM44vtpPeFmwL5hFXG0bjIvBlLUqy1M5lhYQWXbuz7uclm/AOGe3j48CNbv8PmtJyqAZQIKQgdRmbXtUtAZe7ovqUQZjuPpV2Jx6jrreTIJt8aMfDxuwr6UM92Jym/o73kU83SxgCTVw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(6133799003)(18002099003)(3023799007)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FM4bSs+aBQJHF7pzs+ZnbQtX/ik3Lbu7uJvpBWl8L3PFGOJ5kt9yCq/HMOO6?=
 =?us-ascii?Q?Hd5MHoR1ApfsXM9ZrxNWYDf5T3EAHTlz26vEJqYuFvNEgEW6dfksqPW+lnNT?=
 =?us-ascii?Q?sbZlp2f5Z1SWxuc8x/hEyNmZNtq+YUiXCuRdgXy+Pzz2oqpH95A7Ccv/Azl2?=
 =?us-ascii?Q?nc89eV8coWtlyFN6sUPC6rxuF8POdwVy6cimuji9jL270CL1WMe+PZAqNK3P?=
 =?us-ascii?Q?I23MGUH4FnS2YN+KWM9ftjpqdto31mzQMeEoY5JyCoRPvi28nN0CgsqzssVY?=
 =?us-ascii?Q?8KTcRinYtn42IYstnje6thOjLdG5xc+Mp6D2doQamYDT95q63X5j7W8p4y3y?=
 =?us-ascii?Q?Q851caBaJDIPZrXwW5e/AXVXHeiACpPPQph8FIUpqs7eAQ+iyg9+Z0G/lVqa?=
 =?us-ascii?Q?kMXNu7cy+Gsqpvnh7yUCrcvrYl2Qx2flD22+43h35a2zfqo8Ttom7PI8DNmb?=
 =?us-ascii?Q?iNI3OXbl+qcnUNc9DgvjWqjjK8U4/SzeN6vV75gcRmi1mYVV6rou/5w7+CEc?=
 =?us-ascii?Q?+cgOOU4PdMjTxPds+WKPmwe+QKM/CAF25jWOlY0787mBb08kU1dm0Bdnpl2n?=
 =?us-ascii?Q?KNllppBnXu3AJGyii1vaocr66fS29DTp41O1Jwir+3MvaXksoHUCQ9obRf6s?=
 =?us-ascii?Q?UoruclvWvKkDKN+gG1bhIWUv3btl5JNbnjFhOE/Rs3S3keRr+RqA3vpywBFB?=
 =?us-ascii?Q?+qEmPzP1tBYR/ZoSkrD0W3Ip5GkQD18rHYdWt+O/3n03xnKgShCPmbYot7QD?=
 =?us-ascii?Q?BtRVO2K3WSATEPieRu8eq/hMSY4w16o5rZikeFrElT7qyVVys1KOxwqtTvSM?=
 =?us-ascii?Q?vvhnwR4WcDcfkSOBRiSYQDKri+3t1MTo5gbkTIX/7McMtvb7lyNDPijdTtot?=
 =?us-ascii?Q?lJGdjnLZmiRmuVQiolyjEoJXObh2fFPWJHDYdXTIab7WEStWMqnOIexgCyCX?=
 =?us-ascii?Q?YB72tIrkyeZI0wgtTvKLKr2ccMH6boxs9K1G+O1+aCnh5bmmByHDh4xt/9Vy?=
 =?us-ascii?Q?lJAMAE65QtX5onphqY7lcpS4wyqoFgqr+x9pzO+SbNMjuIBP7nhLHTI90L3J?=
 =?us-ascii?Q?qwk//DpvS14DI6pjvQ0aYgWfjCX25LYlwsfmtIgZK1ap8nT7TFQOpO1efj+w?=
 =?us-ascii?Q?nzcwElYoorAxHL1u8V22QKkjHyjR6P3hL/uYCGTMPlf2qpqokuuSnBLuc7PE?=
 =?us-ascii?Q?BrCdL+8MQxJFoxSt8RtVzmpvICXRcq1qRe2rPjgoQ7KxFu3PlbZ2C3K3NvaB?=
 =?us-ascii?Q?ieCNfMIPyNVwAz4w9Ks6F+dCBC+Tv278d4uUimBE3Wq+L13AAkeJMVAm1BF0?=
 =?us-ascii?Q?AJXmkHwE8tA63uxmmzSiQUsRa02Ppx5zxC+5wLgu8McA7T5pUDdva24mypZc?=
 =?us-ascii?Q?3LjF1f7VWSf9CpPAKO5+FvlNetKd9b7s8sqeIVgHm2w8LTvzmjvqZoR6vUed?=
 =?us-ascii?Q?Dtawehs0TogVnZBTXLLOBi59z3QI1fHGwfmaOhClMvgmpHPcLa796O4v41bh?=
 =?us-ascii?Q?JMx+8L3LsBsHOdkM9i3fKSra01INARfTwv7x+fdv0LTpVcj1Vs0OJAM61KL8?=
 =?us-ascii?Q?rqtWIkWL7qnYrNdYyJKmdg7hTm8AP/DuzvyfW4yX1eJuamjh/FWSp5hgqP0H?=
 =?us-ascii?Q?HLU8hk6Wqb9bB43lp7iDg79PWlSR2uEpPM58B1VMCqpq5J8YPqI1kLsr42Lh?=
 =?us-ascii?Q?8uxA/XZBN5KerR0HCSvoGzB5jJJH8/qQSLuIqSALqbIL5+CLurVggKaDjwZr?=
 =?us-ascii?Q?GHx9XVjzjyvbyPSlGEZRqe+Gvf8DbiCbt2NQQxH/l+Qw2N4pt65/?=
X-Exchange-RoutingPolicyChecked: 
	RjWeuD1ARH9FHcmDR+pBejpJBgSN1JgzqjjcMkvmpgVHxbwZKIZDxt+6IXZQGzdFLAsEa+gmwyg6ATTaNXdUJYRpdpphBFFRI9kAUjsBOnjbkBOSBrH5+mIXNaPuii6IbUDpl6+KpO1vx0SODMBy2qfj+KIPrffJTdLnlqBgBNSttOb9B7yfo4SL3zJTJVrCmM1rkhnGY8QDpDKTJGYiDnYlOjPTAmEWg/wYcytVV8uevTPVxIUr18CVLDDalIgtoAzvzF8S+bsbDp+NRKywwRgiA7fUnOcg/qb+cber3s2ZVHYqo5JIuhifkXsHArJgvg4v8IyWjcGIxUNAB2TR7w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be385609-6df1-41d9-dd1b-08ded677e829
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 07:19:21.9239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ni3ZyvhsoDbhCPjt4dFeFaA/KEEzrWYIN2lUWk0IbxTEFHwAoMj03UpCMDX5TWXVHepYnTqEOOsQsD1i5pook6HuwBlsXEbjkFIJW36AdyfaflUKFLDNDDmDgh9ZCau/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7632
X-Authority-Analysis: v=2.4 cv=DNC/JSNb c=1 sm=1 tr=0 ts=6a436dfc cx=c_pps
 a=0joluOkswiQ4lQw5hT3+aQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=BcPKCTjPAAAA:8 a=KKAkSRfTAAAA:8
 a=pGLkceISAAAA:8 a=m7CUszNA7STTOgLsIdMA:9 a=HCINmKHFQ_U6d0ff:21
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=MNXww67FyIVnWKX2fotq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: QvzzTVWLsoqRaMOQzibM-ggwRlFfRSS6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2MSBTYWx0ZWRfX4fd6al1M7O8B
 h7VNr1ZNSz9NHOzAo5pqknHUmSxyfgD1ZWvsIBTkaEmISkYax67iO76AAHzXQA3PVNna0LrDHHT
 itT1iWLoJj98y+ohLUreXctTrVYPbefERMte+TEgsNZfFZDz0NM2/nSmppCWve+MN6I7wvl2L0H
 gM+Nm63oTMx5jr8jTzNpnTAIDeO6eWO8lJPoRQOcxeQYCHG5i04CO3grSkChYeabnDMSmtwj+mj
 kVYvibwJ7hpHGii3+PGzkB70Q2v290YDEzsPMuYmsgg9LEWEalrRVSyxTJ47pnWxT3ehLnx8Uww
 VgwrK5kJReaLkxh7EsJwEZF/1gn+FKCuzKsOvlCmUwBwSWQWqdmj9L4dK+RwMzmQIMmvaVEW9Wc
 Vb14q8BxzUdErLfYpiWdSGFjmAiL6u49weAtXoe9pGYM0u+0m4+unZ3AevC2YMbwACb087SjBZx
 3Cr87rSe2zL8cnz/H4Q==
X-Proofpoint-GUID: QvzzTVWLsoqRaMOQzibM-ggwRlFfRSS6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2MSBTYWx0ZWRfXzQhla8ZdrX3N
 enCI5X6X24MPbIJoc7QaUmop3LNz9wWJwYsyrcqRwaoKdZoyouKBlzDYmauFEjkfNgDYEErQVA5
 2innn7JLtGX8qSnKnk6Hr7mHfZG24XXNlkui0DW8T7eAA71+LXe1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 07:19:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239857

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

GDB 17.2 brings the following fixes and enhancements over GDB 17.1:
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob_plain;f=gdb/NEWS;hb=gdb-17.2-release

 * PR dap/33228 ([gdb/dap] error while listing register children)

 * PR gdb/33737 (gdb --help says 'For more information, type "stream"
   from within GDB', but "stream" is not a defined command)

 * PR build/33747 (Incompatible with MUSL libc: no member named 'c_ospeed'
   in 'termios')

 * PR gdb/33748 (gdb17 regression with displaying ANSI colors)

 * PR gdb/33753 (Out-of-bounds writes in string_{v}printf -- threads
   and static data don't mix)

 * PR cli/33761 (Setting style colors is broken on MS-Windows)

 * PR gdb/33768 (Loading compressed GDB scripts from .debug_gdb_scripts fails)

 * PR symtab/33775 ([gdb/symtab] data race in
   dwarf2_per_cu::{set_addr_size,set_offset_size,set_ref_addr_size})

 * PR symtab/33777 ([gdb/symtab] dw2_get_file_names doesn't cache result
   for dummy CU)

 * PR symtab/33825 ([dwz] Extremely slow symbol lookup with DWZ-compressed
   debug info (thousands of partial units))

 * PR testsuite/33845 (gdb: There are 4 unexpected failures in
   breakpoint-in-ro-region.exp)

 * PR gdb/33872 (`skip -gfile` has inverted logic)

 * PR gdb/33926 (GDB 17.1 AArch64: redefinition of user_gcs struct on musl)

 * PR breakpoints/34112 (rbreak `file:regex` sets breakpoints for matches
   outside of `file` [reproducer attached])

Drop patches merged upstream:
  * 0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
  * 0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...ian_17.1.bb => gdb-cross-canadian_17.2.bb} |   0
 .../{gdb-cross_17.1.bb => gdb-cross_17.2.bb}  |   0
 meta/recipes-devtools/gdb/gdb.inc             |   4 +-
 ...-ser-unix-modernize-Linux-custom-bau.patch | 248 ------------------
 ...ux-Fix-build-failure-on-musl-systems.patch | 196 --------------
 .../gdb/{gdb_17.1.bb => gdb_17.2.bb}          |   0
 6 files changed, 1 insertion(+), 447 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_17.1.bb => gdb-cross-canadian_17.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_17.1.bb => gdb-cross_17.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
 rename meta/recipes-devtools/gdb/{gdb_17.1.bb => gdb_17.2.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_17.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_17.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_17.1.bb b/meta/recipes-devtools/gdb/gdb-cross_17.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_17.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_17.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index d367486d02..cbb5885459 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -13,7 +13,5 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0006-Fix-invalid-sigprocmask-call.patch \
            file://0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            file://0008-Add-fix-for-packages-that-are-not-compatible-with-C2.patch \
-           file://0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch \
-           file://0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch \
            "
-SRC_URI[sha256sum] = "14996f5f74c9f68f5a543fdc45bca7800207f91f92aeea6c2e791822c7c6d876"
+SRC_URI[sha256sum] = "1c036c0d72e4b3d1fb5c94c88632add6f9d76f4d7c4d2ea793c12a9f19a3228c"
diff --git a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch b/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
deleted file mode 100644
index 30d22b21f9..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
+++ /dev/null
@@ -1,248 +0,0 @@
-From 1a77c71303b552140613d49595baebdff1a4716e Mon Sep 17 00:00:00 2001
-From: Sunil Dora <sunilkumar.dora@windriver.com>
-Date: Tue, 17 Mar 2026 01:58:55 -0700
-Subject: [PATCH] PR gdb/33747: gdb/ser-unix: modernize Linux custom baud rate
- support
-
-The Linux custom baud rate implementation previously accessed the
-struct termios members c_ispeed and c_ospeed directly. These fields
-exist in glibc but are not exposed by musl, causing builds to fail on
-musl-based systems.
-
-Update set_custom_baudrate_linux to use a capability-based approach,
-with three distinct code paths:
-
-1) If POSIX cfsetispeed/cfsetospeed accept arbitrary baud rates
-   (HAVE_CFSETSPEED_ARBITRARY), use them to set input and output
-   speeds.
-
-2) Else if Linux termios2 interface is available (TCGETS2/BOTHER),
-   use it to support arbitrary baud rates.
-
-3) Else if legacy struct termios supports c_ispeed/c_ospeed, use
-   the TCGETS/TCSETS fallback (primarily for glibc on older
-   architectures).
-
-4) Otherwise, emit an error indicating that custom baud rates are
-   unsupported on this platform.
-
-This preserves existing behavior on glibc systems while restoring
-build compatibility with musl and other libc implementations.
-
-Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=33747
-
-Upstream-Status: Submitted [https://sourceware.org/pipermail/gdb-patches/2026-March/225952.html]
-
-Suggested-by: Kevin Buettner <kevinb@redhat.com>
-Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- gdb/config.in    |  6 ++++++
- gdb/configure    | 52 +++++++++++++++++++++++++++++++++++++++++++++
- gdb/configure.ac | 22 +++++++++++++++++++
- gdb/ser-unix.c   | 55 ++++++++++++++++++++++++++++++++++--------------
- 4 files changed, 119 insertions(+), 16 deletions(-)
-
-diff --git a/gdb/config.in b/gdb/config.in
-index efc3100cb9e..b2469c8dabd 100644
---- a/gdb/config.in
-+++ b/gdb/config.in
-@@ -110,6 +110,9 @@
-    the CoreFoundation framework. */
- #undef HAVE_CFPREFERENCESCOPYAPPVALUE
- 
-+/* Define if cfsetispeed/cfsetospeed accept arbitrary baud rates */
-+#undef HAVE_CFSETSPEED_ARBITRARY
-+
- /* Define if compiling support to gdb compile. */
- #undef HAVE_COMPILE
- 
-@@ -517,6 +520,9 @@
- /* Define to 1 if `st_blocks' is a member of `struct stat'. */
- #undef HAVE_STRUCT_STAT_ST_BLOCKS
- 
-+/* Define to 1 if `c_ospeed' is a member of `struct termios'. */
-+#undef HAVE_STRUCT_TERMIOS_C_OSPEED
-+
- /* Define to 1 if `td_pcb' is a member of `struct thread'. */
- #undef HAVE_STRUCT_THREAD_TD_PCB
- 
-diff --git a/gdb/configure b/gdb/configure
-index d0bdba6eb36..8a0e2fa2771 100755
---- a/gdb/configure
-+++ b/gdb/configure
-@@ -27336,6 +27336,58 @@ if test "$ac_res" != no; then :
- fi
- 
- 
-+# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rates.
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether cfsetispeed/cfsetospeed accept arbitrary baud rates" >&5
-+$as_echo_n "checking whether cfsetispeed/cfsetospeed accept arbitrary baud rates... " >&6; }
-+if ${gdb_cv_cfsetspeed_arbitrary+:} false; then :
-+  $as_echo_n "(cached) " >&6
-+else
-+
-+  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-+/* end confdefs.h.  */
-+#include <termios.h>
-+int
-+main ()
-+{
-+
-+       #if B9600 != 9600
-+       #error B-constants are not numeric symbols
-+       #endif
-+
-+  ;
-+  return 0;
-+}
-+_ACEOF
-+if ac_fn_c_try_compile "$LINENO"; then :
-+  gdb_cv_cfsetspeed_arbitrary=yes
-+else
-+  gdb_cv_cfsetspeed_arbitrary=no
-+fi
-+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-+
-+fi
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $gdb_cv_cfsetspeed_arbitrary" >&5
-+$as_echo "$gdb_cv_cfsetspeed_arbitrary" >&6; }
-+
-+if test "$gdb_cv_cfsetspeed_arbitrary" = yes; then
-+
-+$as_echo "#define HAVE_CFSETSPEED_ARBITRARY 1" >>confdefs.h
-+
-+fi
-+
-+# Check for members required by the legacy Linux custom baud rate path.
-+ac_fn_c_check_member "$LINENO" "struct termios" "c_ospeed" "ac_cv_member_struct_termios_c_ospeed" "#include <termios.h>
-+"
-+if test "x$ac_cv_member_struct_termios_c_ospeed" = xyes; then :
-+
-+cat >>confdefs.h <<_ACEOF
-+#define HAVE_STRUCT_TERMIOS_C_OSPEED 1
-+_ACEOF
-+
-+
-+fi
-+
-+
- 
- 
- # Check whether --with-jit-reader-dir was given.
-diff --git a/gdb/configure.ac b/gdb/configure.ac
-index 52924106bca..26e8d1ee276 100644
---- a/gdb/configure.ac
-+++ b/gdb/configure.ac
-@@ -733,6 +733,28 @@ AC_CONFIG_FILES([jit-reader.h:jit-reader.in])
- 
- AC_SEARCH_LIBS(dlopen, dl)
- 
-+# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rates.
-+AC_CACHE_CHECK([whether cfsetispeed/cfsetospeed accept arbitrary baud rates],
-+  [gdb_cv_cfsetspeed_arbitrary], [
-+  AC_COMPILE_IFELSE(
-+    [AC_LANG_PROGRAM([[#include <termios.h>]],
-+      [[
-+       #if B9600 != 9600
-+       #error B-constants are not numeric symbols
-+       #endif
-+      ]])],
-+    [gdb_cv_cfsetspeed_arbitrary=yes],
-+    [gdb_cv_cfsetspeed_arbitrary=no])
-+])
-+
-+if test "$gdb_cv_cfsetspeed_arbitrary" = yes; then
-+  AC_DEFINE([HAVE_CFSETSPEED_ARBITRARY], [1],
-+           [Define if cfsetispeed/cfsetospeed accept arbitrary baud rates])
-+fi
-+
-+# Check for members required by the legacy Linux custom baud rate path.
-+AC_CHECK_MEMBERS([struct termios.c_ospeed], [], [], [[#include <termios.h>]])
-+
- GDB_AC_WITH_DIR([JIT_READER_DIR], [jit-reader-dir],
-                 [directory to load the JIT readers from],
-                 [${libdir}/gdb])
-diff --git a/gdb/ser-unix.c b/gdb/ser-unix.c
-index 6f2766518be..fbd73970dbb 100644
---- a/gdb/ser-unix.c
-+++ b/gdb/ser-unix.c
-@@ -508,36 +508,59 @@ set_baudcode_baudrate (struct serial *scb, int baud_code)
- 
- #if HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(BOTHER)
- 
--/* Set a custom baud rate using the termios BOTHER.  */
-+/* Set a custom baud rate.
-+
-+   Prefer the POSIX cfsetispeed/cfsetospeed interface when it accepts
-+   arbitrary baud rates.  Otherwise fall back to Linux-specific termios2
-+   (BOTHER) or legacy termios interfaces.  */
- 
- static void
- set_custom_baudrate_linux (int fd, int rate)
- {
--#ifdef TCGETS2
--  struct termios2 tio;
--  const unsigned long req_get = TCGETS2;
--  const unsigned long req_set = TCSETS2;
--#else
-+#if defined(HAVE_CFSETSPEED_ARBITRARY)
-   struct termios tio;
--  const unsigned long req_get = TCGETS;
--  const unsigned long req_set = TCSETS;
--#endif
-+  if (tcgetattr (fd, &tio) < 0)
-+    perror_with_name (_("Cannot get current baud rate"));
-+
-+  cfsetispeed (&tio, rate);
-+  cfsetospeed (&tio, rate);
-+
-+  if (tcsetattr (fd, TCSANOW, &tio) < 0)
-+    perror_with_name (_("Cannot set custom baud rate"));
-+
-+#elif defined(TCGETS2)
-+  struct termios2 tio2;
-+  if (ioctl (fd, TCGETS2, &tio2) < 0)
-+    perror_with_name (_("Cannot get current baud rate"));
-+
-+  tio2.c_cflag &= ~CBAUD;
-+  tio2.c_cflag |= BOTHER;
-+  tio2.c_ospeed = rate;
-+  tio2.c_cflag &= ~(CBAUD << IBSHIFT);
-+  tio2.c_cflag |= BOTHER << IBSHIFT;
-+  tio2.c_ispeed = rate;
- 
--  if (ioctl (fd, req_get, &tio) < 0)
--    perror_with_name (_("Can not get current baud rate"));
-+  if (ioctl (fd, TCSETS2, &tio2) < 0)
-+    perror_with_name (_("Cannot set custom baud rate"));
-+
-+#elif defined(HAVE_STRUCT_TERMIOS_C_OSPEED)
-+  struct termios tio;
-+  if (ioctl (fd, TCGETS, &tio) < 0)
-+    perror_with_name (_("Cannot get current baud rate"));
- 
--  /* Clear the current output baud rate and fill a new value.  */
-   tio.c_cflag &= ~CBAUD;
-   tio.c_cflag |= BOTHER;
-   tio.c_ospeed = rate;
--
--  /* Clear the current input baud rate and fill a new value.  */
-   tio.c_cflag &= ~(CBAUD << IBSHIFT);
-   tio.c_cflag |= BOTHER << IBSHIFT;
-   tio.c_ispeed = rate;
- 
--  if (ioctl (fd, req_set, &tio) < 0)
--    perror_with_name (_("Can not set custom baud rate"));
-+  if (ioctl (fd, TCSETS, &tio) < 0)
-+    perror_with_name (_("Cannot set custom baud rate"));
-+
-+#else
-+  error (_("Custom baud rate not supported on this platform"));
-+#endif
- }
- 
- #elif HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(IOSSIOSPEED)
--- 
-2.49.0
-
diff --git a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch b/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
deleted file mode 100644
index 2d91a351d2..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
+++ /dev/null
@@ -1,196 +0,0 @@
-From 654223c799910837c80d0964a971fbdf7808864a Mon Sep 17 00:00:00 2001
-From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
-Date: Tue, 17 Mar 2026 02:24:48 -0700
-Subject: [PATCH] GDB: aarch64-linux: Fix build failure on musl systems
-
-(cherry picked from commit 02090062127d59978ccc312dabf63c6ea838cd85)
-
-When building against musl (e.g. on Alpine Linux), the following error
-happens:
-
-    CXX    linux-aarch64-low.o
-  In file included from /home/bauermann/src/binutils-gdb/gdbserver/linux-aarch64-low.cc:42:
-  /home/bauermann/src/binutils-gdb/gdbserver/../gdb/arch/aarch64-gcs-linux.h:35:8: error: redefinition of 'struct user_gcs'
-     35 | struct user_gcs
-        |        ^~~~~~~~
-  In file included from /home/bauermann/src/binutils-gdb/gdbserver/linux-aarch64-low.cc:35:
-  /usr/include/asm/ptrace.h:329:8: note: previous definition of 'struct user_gcs'
-    329 | struct user_gcs {
-        |        ^~~~~~~~
-  make[2]: *** [Makefile:565: linux-aarch64-low.o] Error 1
-
-aarch64-linux-tdep.c fails to build in the same way.  This happens because
-aarch64-gcs-linux.h uses GCS_MAGIC to see whether the system headers
-have GCS-related definitions.  The problem is that GCS_MAGIC is defined in
-<asm/sigcontext.h> while struct gcs_user is defined in <asm/ptrace.h>.
-It's fine on glibc systems because in the set of system headers that
-linux-aarch64-low.cc and aarch64-linux-tdep.c include, <asm/sigcontext.h>
-ends up being included implicitly as well.  This doesn't happen when using
-musl's headers though.
-
-There isn't a macro in <asm/ptrace.h> whose presence is correlated with
-the presence of the struct user_gcs definition, so a configure check is
-needed to detect it and conditionally define the struct.
-
-Also, this change requires aarch64-linux-tdep.c to stop using
-struct user_gcs because target-dependent code can't include <asm/ptrace.h>
-and thus even if HAVE_STRUCT_USER_GCS is set, the file won't have the
-struct definition available. To fix this problem, also backport the
-definition of AARCH64_LINUX_SIZEOF_GCS_REGSET and use it there.
-
-Note that there's another build issue with musl, described in
-PR gdb/33747 affecting compilation of gdb/ser-unix.c.  In order to be
-able to test this patch, I applied the patch in comment 11 there.
-
-Tested with a native build on an Alpine Linux aarch64 system, and also
-verified that all gdb.arch/aarch64-gcs*.exp tests pass on it.
-
-Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=33926
-
-Upstream-Status: Submitted [https://sourceware.org/pipermail/gdb-patches/2026-March/226049.html]
-
-Co-authored-by: Chris Packham <judge.packham@gmail.com>
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- gdb/aarch64-linux-tdep.c     |  5 +++--
- gdb/arch/aarch64-gcs-linux.h |  8 +++++---
- gdbsupport/config.in         |  3 +++
- gdbsupport/configure         | 36 ++++++++++++++++++++++++++++++++++++
- gdbsupport/configure.ac      | 19 +++++++++++++++++++
- 5 files changed, 66 insertions(+), 5 deletions(-)
-
-diff --git a/gdb/aarch64-linux-tdep.c b/gdb/aarch64-linux-tdep.c
-index 76bde85188b..6c402e7ecdd 100644
---- a/gdb/aarch64-linux-tdep.c
-+++ b/gdb/aarch64-linux-tdep.c
-@@ -1684,8 +1684,9 @@ aarch64_linux_iterate_over_regset_sections (struct gdbarch *gdbarch,
- 	  gcs_regmap, regcache_supply_regset, regcache_collect_regset
- 	};
- 
--      cb (".reg-aarch-gcs", sizeof (user_gcs), sizeof (user_gcs),
--	  &aarch64_linux_gcs_regset, "GCS registers", cb_data);
-+      cb (".reg-aarch-gcs", AARCH64_LINUX_SIZEOF_GCS_REGSET,
-+	  AARCH64_LINUX_SIZEOF_GCS_REGSET, &aarch64_linux_gcs_regset,
-+	  "GCS registers", cb_data);
-     }
- }
- 
-diff --git a/gdb/arch/aarch64-gcs-linux.h b/gdb/arch/aarch64-gcs-linux.h
-index 018ca37a522..632823a8120 100644
---- a/gdb/arch/aarch64-gcs-linux.h
-+++ b/gdb/arch/aarch64-gcs-linux.h
-@@ -27,8 +27,7 @@
- #define HWCAP_GCS (1ULL << 32)
- #endif
- 
--/* Make sure we only define these if the kernel header doesn't.  */
--#ifndef GCS_MAGIC
-+#ifndef HAVE_STRUCT_USER_GCS
- 
- /* GCS state (NT_ARM_GCS).  */
- 
-@@ -39,6 +38,9 @@ struct user_gcs
-   uint64_t gcspr_el0;
- };
- 
--#endif /* GCS_MAGIC */
-+#endif /* HAVE_STRUCT_USER_GCS */
-+
-+/* The GCS regset consists of 3 64-bit registers.  */
-+#define AARCH64_LINUX_SIZEOF_GCS_REGSET (3 * 8)
- 
- #endif /* GDB_ARCH_AARCH64_GCS_LINUX_H */
-diff --git a/gdbsupport/config.in b/gdbsupport/config.in
-index 0beacf22c05..2957ee0f030 100644
---- a/gdbsupport/config.in
-+++ b/gdbsupport/config.in
-@@ -271,6 +271,9 @@
- /* Define to 1 if `st_blocks' is a member of `struct stat'. */
- #undef HAVE_STRUCT_STAT_ST_BLOCKS
- 
-+/* Define to 1 if your system has struct user_gcs. */
-+#undef HAVE_STRUCT_USER_GCS
-+
- /* Define to 1 if you have the <sys/param.h> header file. */
- #undef HAVE_SYS_PARAM_H
- 
-diff --git a/gdbsupport/configure b/gdbsupport/configure
-index 133ddfa7f6c..66135791aa5 100755
---- a/gdbsupport/configure
-+++ b/gdbsupport/configure
-@@ -14307,6 +14307,42 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
- 
- 
- 
-+# Check for `struct user_gcs`
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for struct user_gcs" >&5
-+$as_echo_n "checking for struct user_gcs... " >&6; }
-+if ${gdb_cv_struct_user_gcs+:} false; then :
-+  $as_echo_n "(cached) " >&6
-+else
-+  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-+/* end confdefs.h.  */
-+#include <sys/ptrace.h>
-+	 #include <asm/ptrace.h>
-+int
-+main ()
-+{
-+struct user_gcs u;
-+
-+  ;
-+  return 0;
-+}
-+_ACEOF
-+if ac_fn_c_try_compile "$LINENO"; then :
-+  gdb_cv_struct_user_gcs=yes
-+else
-+  gdb_cv_struct_user_gcs=no
-+
-+fi
-+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-+
-+fi
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $gdb_cv_struct_user_gcs" >&5
-+$as_echo "$gdb_cv_struct_user_gcs" >&6; }
-+if test "$gdb_cv_struct_user_gcs" = yes; then
-+
-+$as_echo "#define HAVE_STRUCT_USER_GCS 1" >>confdefs.h
-+
-+fi
-+
- # Set the 'development' global.
- . $srcdir/../bfd/development.sh
- 
-diff --git a/gdbsupport/configure.ac b/gdbsupport/configure.ac
-index b7ccfabd6c6..d3b4c05daeb 100644
---- a/gdbsupport/configure.ac
-+++ b/gdbsupport/configure.ac
-@@ -68,6 +68,25 @@ GDB_AC_PTRACE
- AM_GDB_COMPILER_TYPE
- AM_GDB_WARNINGS
- 
-+# Check for `struct user_gcs`
-+AC_CACHE_CHECK(
-+  [for struct user_gcs],
-+  [gdb_cv_struct_user_gcs],
-+  [AC_COMPILE_IFELSE(
-+     [AC_LANG_PROGRAM(
-+	[#include <sys/ptrace.h>
-+	 #include <asm/ptrace.h>],
-+	[struct user_gcs u;]
-+      )],
-+     [gdb_cv_struct_user_gcs=yes],
-+     [gdb_cv_struct_user_gcs=no]
-+  )]
-+)
-+if test "$gdb_cv_struct_user_gcs" = yes; then
-+  AC_DEFINE(HAVE_STRUCT_USER_GCS, 1,
-+	    [Define to 1 if your system has struct user_gcs.])
-+fi
-+
- # Set the 'development' global.
- . $srcdir/../bfd/development.sh
- 
--- 
-2.49.0
-
diff --git a/meta/recipes-devtools/gdb/gdb_17.1.bb b/meta/recipes-devtools/gdb/gdb_17.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_17.1.bb
rename to meta/recipes-devtools/gdb/gdb_17.2.bb
-- 
2.49.0


