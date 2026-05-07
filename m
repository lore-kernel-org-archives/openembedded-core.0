Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E005CD3442
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 17:32:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1566.1778175166206950141
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 10:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GCPpAanS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9587ffd4f1=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475QP8g977043
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2026 17:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=uAIBjI+Mxy97IdUA9oxj02q1q/KA8i7rOiJrIOWVYfI=; b=
	GCPpAanSZIbpxwsOOoP5bThGLlgL1/qPY7bxneJIXu1EMhjoDyL69QFB8Df4QJE9
	BPXEUZXhDRPDyfOVKtoZWCWM3/k8WfEpyJ5fGArKUj0dyc0uJBQGDO5q02jfis9Y
	CGxiLHoV373lDTVfCAmL8gJyoVtIwQrhWvHbMJtxcH4xZiP8h+pckl21pnxcv+5k
	NntRkmo7VNihe09uCbO9WUIuXTH2A3s0nfJfiwWGOa/HVLK/qGtr6hsB6lpcUq3l
	z4Z663acpesiC/fZKBp2AyUgxrK5ZotA1nAdZxpYeVAexvTueERrhYlXdbBRQ6st
	6bU7kHNAwla+hk0cxs3wOg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011060.outbound.protection.outlook.com [40.107.208.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dw8t5xw12-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 17:32:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqX+0zgi4nrwUpTS+hDF69+72k1WdL9jr2moWnxRO0lkfCs1F01OXA0mWKWynEjhXv+tf0AQryzMMTUY3kD9fnAC1FvEfC4PeV91ne5k4cLVaR9OjFJyMSwaXbCCF7kOilzwxdW+/S54I7ohA8RdYNl6k9zIqLkPMLGqOcRZAmveUqcEDYO1Ew6kSLPjJs2nn5MKBmvHZBr8DS8IgIFaBlgsHW8cVlJG3DLGNxJdtS5Jrfi6BXBYWHZP9imEGCzOBD8/Gr07NZwsFCDY12vYkNTocd18nyxXmdORFtaER//GOdgOC+6YVJSImtBYBDv7Jx2Dtw172GtndOGeHVbcrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAIBjI+Mxy97IdUA9oxj02q1q/KA8i7rOiJrIOWVYfI=;
 b=gluw9/+g5P3n7gMJRlsXJP8QrzmqR32LRDYlfOFP5o481kGkJTMuUIVqbHl71maoOZE5i69DSbH13BBZHOHaFvrXiX6ioUCZJ1I8SNmEgQ7KcsxGtQJ+HSftU5lR/RKx1T4b90/DIARd/GTqWDSFYZIb9Xz5YjKBfw2Ds/2KnS4m/WysiRwtcMXsW4mzyL6OCgvVLdERQlFUbJzYVPg2EX9EihgI2DiSuA8o9SJidBpH2D2gQrXQs2JzHH47Q+Myv3eSadkFNlDcl6eooUPkauh/Ml8WNv1SmcjyPDRIg7h/VdFddSjUEbLjSwOroqQ2ZXS2SnIbxTB4RCU8BxddtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 DM4PR11MB6288.namprd11.prod.outlook.com (2603:10b6:8:a5::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.15; Thu, 7 May 2026 17:32:40 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9891.019; Thu, 7 May 2026
 17:32:39 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com,
        khem.raj@gmail.com
Subject: [PATCH 6/7] gcc-runtime: package new libatomic_asneeded files
Date: Thu,  7 May 2026 10:32:10 -0700
Message-ID: <20260507173211.672855-7-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260507173211.672855-1-Hemanth.KumarMD@windriver.com>
References: <20260507173211.672855-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0462.namprd03.prod.outlook.com
 (2603:10b6:408:139::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|DM4PR11MB6288:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e2291a0-9f3d-4614-19f9-08deac5ea321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	DyyiU67u7FyVbb7n4BK/GaLF3ujXS05SZpP83Can898ZpkKgMvaX6PsHTvidCSU65FN+4Vy5FaKEZnd5iNi3a+XR3h5gUtiPfDzorx2d2UdBPZj5XLl30NV/Ovkd3ZiCrO7Wtsv4AefGm1fblRChkK3ifkCTIveMPOKxI70nPUAp8A8k0Z7Oc/a/ZpZtYNW7pVzMg0/9BQR8r+gG4cjul9AoZ7sBDhNt8PiCcHXamWjxcvSj+YTLae/KwTAq4Stmqgrk72sG034qXpBi1IALXxX+v9IrzKnHiB3pGj2HF9kvnBcLbkF38kjAw1MxqmKRrou5R7H5Pnz+yBhmBSRGdcpnSk7q1GEaX9fe3Ags+Qx9fJABy8xulWAJ2prcFiunfMFJLOc5hJKzGV5RAkHxfpaNL4JbKhFdEuzBRk5R1MDtnHEh1knrnmt4PcRMQxPDz7gvLa7NgyMl5CrMDNb/6Q42Y6V7sN6BQbJ0dtOlMShrD/ECsfL9trKZVoEkHpLqPZtv1fLjq8pzDvo8lvuvug6kebcoCZZ4FPutF08qBs1uQU+qXgC0ZDDp73kHrJ3VXV93+NWFB82qBrBjRQ8kz+4Mm1TttW5dhZs0w0CnydQPIVqul0BVY+YHUbdFYIbQPGgxFBJB6t71W4EqtXv5txtqTK3eJC9Y3N0WoSYksc2ffw/vbDw9tMHhfxTC9cymk//JWV0miTD7A5BlR2aE9maWRw9SogN++SuRCrTC3Jr1m/uMCyUO9M5rO1JPVXXF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xDaNpz4WgVOayFVxY6gN+g2Cu3lmr/xB6qwMqMesuTNor8QDLssrUDBMpHMG?=
 =?us-ascii?Q?T8YFtiyW51X2kyfzQrvoOvYH5t8SiwjekvdOGOfBu5T0V8nl52ldTB/HTkf6?=
 =?us-ascii?Q?oVSiYNFYLxlFDW1UgU8CKpFsXHi6xiLvUkJvbabdHsDCn53deCcqU4U+E47r?=
 =?us-ascii?Q?kTQSROVBZHjT7Av/DcJERmkepXX9ErXClLieVl6JGBrO21OC+DOnHpHKZfmu?=
 =?us-ascii?Q?QaNj/Jpa+R/oz1VL1QFG0n5WRvWA1+Mm5sptFSqwQHN9s8tVhiXr+HUjA1Mw?=
 =?us-ascii?Q?ftaBO8YGhLjBMxtCNULvMCQLGP9TK1LrA7h7L/TA4eyzfUb4H8vK1xneHFmp?=
 =?us-ascii?Q?3A1WOw0qXvhJ8tXeZSUkNqbbtgyi9sKGNSIf91SzW/rWyDV5DBOm8jIHHmOc?=
 =?us-ascii?Q?oswaus8LmR9/QjHH4NhvQVmCnbXKJSqyo/UkHRiGJoozUnbkqf08ET1fiSI3?=
 =?us-ascii?Q?/8mKnWOWpA2P7RlqPfbDOKOzWnZ511TVavaHvlmFjLZTkACYP70GiRSiOs3a?=
 =?us-ascii?Q?UrBsJ4wjGwjIvPN0Xz6dPtBbQGdgnkL9hHKRL7j9qUuRLevCpeKZ/ZgaBYEa?=
 =?us-ascii?Q?RwMzE18oogjJ8urQjtR9hGTz8Eo54eaOzLMLGgGNF138NJ1Fay/e8HL2ROmN?=
 =?us-ascii?Q?SB57KpbgsLvvtz5y8/caA4g4rwpvBjj9HvDZQEc1mBFw3SMuz7gJ/rQwP+Li?=
 =?us-ascii?Q?Zu2akgSrGUKsyODhBDI8FqT7+YylwiO4lE53OliBqfcLRbHhAT4I2lZoJzJH?=
 =?us-ascii?Q?2yxvNgvG8p6VoFCqrbpsxN9TUcBhX/JV47Of5xcF4LmnbxDMifJboUtCkI4+?=
 =?us-ascii?Q?wJgVwM6pmu1jgHDTZ6fXnp5QsutR7/JvGIvI5ExKR1o5ny172SN/cyEXJNdS?=
 =?us-ascii?Q?Lcwzy8oA1ju6wv1SbZjDaUHaJGdLIAfSh4ZtUDj4f4yS+NFksTOCOCQA7sgO?=
 =?us-ascii?Q?r0H3VOo6StiKw6UUsyjxHdbagB/4XaZuIwPWPzfBxG/nj1pPml5+2746APCs?=
 =?us-ascii?Q?4qoHnJgvY7O/218E6KvDHYza9O5nFNTZ7bH9b/btp1Xz5ALV/mYLPezgU+TP?=
 =?us-ascii?Q?/UDPpnzLXKXV5ScC3jDs0KyCwodpcHgGCkDW62WhMjEQdRNakrwGAVxsf3pp?=
 =?us-ascii?Q?NhVrL+QkO4Y9/PBpeIE3HtB/odXLT/0VfuUUw3Dh2K0DO4S3OAv5XvKuJvRd?=
 =?us-ascii?Q?ovrpcdktgw2W+kNiB/TRaBuwFIGkJeQiVoEsu8FqnHYplUhqJ0G8r+L2A40z?=
 =?us-ascii?Q?lzIHTM6XX4MoGTHK5liWrrhbOP9AlhnoUXuPq3TIXon7Rn2xmSa9/pcWED1a?=
 =?us-ascii?Q?J+MGl6jwdO/jNFYsUQDYe25L9sDa9/NRjkmX13OvwCL/YYvkQvN2oAsfovSw?=
 =?us-ascii?Q?ydfHtkVyaqjhyuF9MKxRIlv55+Ck6mDA8UloRNt4SiZmNsQd1L6fMmt1ZkUy?=
 =?us-ascii?Q?sQAYDBH2EBh9/w+Z4dy/WJock/QsoQTIjFkYx5yzfwnrvu0X39w8uebdGMrQ?=
 =?us-ascii?Q?gBbhRm99aKD3hCT2UWXgpbZ34qmmUWDARmzQezV7Zdx7z9qDbWFPw0ZYY5bJ?=
 =?us-ascii?Q?fQoDSm9Yuc03/7Woh23DSjzVEFx3B17SYmGsXCkTQ55NFBiim3f0yi7NtDcm?=
 =?us-ascii?Q?A3GPWsjb+uk4aK6lKQyVpPOqAREtQKFnyMRAIQJb3SLJ2yF9jYNQzAdOEMvk?=
 =?us-ascii?Q?xR/h9PPq2u4fLGubfjNSHAqouCEbSfTzdi4T0IUdk+IfdCTS60I20lSoNkM/?=
 =?us-ascii?Q?kXfUIpj7OJ278pLB7ro408RDDyvanVI=3D?=
X-Exchange-RoutingPolicyChecked: 
	JwWbLpmG/bhhA56My2a6CxskfC6vXZTzQ/0Pgb2gvYjcd/E/0P/YFtsZ3IFDfeQpFfY2r8SsUwOp0q0iOkWcG/JKcd88v5j1XqlqnDJk0uHi3NcoPaNqtGcVroFgWb1R2t1nRj0YcVZKTmVl/BBMMuPLShSGh6i0LpOcNddb7EHTtCIBPYmQaipjS3v6lmZM5iyewxeeapMfKIdGZ6MWg4magaSwA0h8/pEbKOlKxL8tTVQ0tEE4k19XEUpiODueY2HlEtyIIQ3iXQV9MfGKarqYHLZd+o0AlSD+MK1qcLKPLQPbd9sK/1tOuUrNY1wEot1ZFDFbjfTenDThnuP11w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2291a0-9f3d-4614-19f9-08deac5ea321
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 17:32:39.8731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztyML8D6eC6OoFPFO61OQpOf8OJTSq1vLYapmzeAkn6YgyUa7vV9XFs9xGaKUNd5xCDo/56EG/NovbKdRd40f07j5a1N18yTDr/G4alrgDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6288
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE3NyBTYWx0ZWRfXy7S5uxzhknNg
 rHRb1VmtTuvDslu/hGhgkDeyf2QaK6+xNrvWXsT7iBe7Hxjzt5KPbpw9AkKZFrRcRovXP69kFqQ
 ZtKT9QCUobFEqQ6AMmuqKmrfX1r8xAkZxff0XcB6QhcZBtSG+65rQ2ehG5MCdzyFcoOVc1S+NJN
 Y7vnpBl6nC23Cek+bFTGQvnJVE8bz1CsTwOV0wcLf0mA/KukMQ5M+wiSruShDP0gphlevSTWRZ3
 dLnvaAyBG0nmTeFdON1AzgJZT5usxkuqf0AugqyMFkmh8arsYPJGQgg0Afumzn7c6mBqdh7p3vI
 NGbHzM6BBFGCZW6bo0alXaRst8IiHdSOy2ndRo1LTHrgwlM0BclCzcviP0lOPxgUZ/75tIi+l/J
 oswjR1jVdAVq4sCcGyBmyJ9XG3YP7rAZU5gbXYvfJdgHA8Skng6i3ZEQv+q6X3RoDKaw+pR940I
 UjB8pxpx5aqeu1O2bQg==
X-Proofpoint-ORIG-GUID: qVSYDI2EPTh2Z-4MuIx9qKBwRt0J51Do
X-Proofpoint-GUID: Tvnwm6f5g7Ok1qRRfgIpV0VU84CbGEya
X-Authority-Analysis: v=2.4 cv=BcLoFLt2 c=1 sm=1 tr=0 ts=69fcccbc cx=c_pps
 a=5tz+rB/kfTqQMEo17N6B4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=f-1Ak3PPjXL7i1jfQukA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 17:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236613

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

GCC 16 generates libatomic_asneeded.so and libatomic_asneeded.a
during the build as part of the fix for unnecessary DT_NEEDED
entries on libatomic in GCC runtime libraries (PR libstdc++/123396).
Add them to avoid unpackaged files QA errors.

Link: https://github.com/gcc-mirror/gcc/commit/8a99fdb70493df1294b53406913e5ea1fc971c13
Link: https://github.com/gcc-mirror/gcc/commit/34039b22adea4d7809dae53f809177d6dd1155d9

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index d975153bc2..30b2832c82 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -268,9 +268,10 @@ SUMMARY:libatomic = "GNU C++11 atomics support library"
 FILES:libatomic-dev = "\
     ${libdir}/libatomic.so \
     ${libdir}/libatomic.la \
+    ${libdir}/libatomic_asneeded.so \
 "
 SUMMARY:libatomic-dev = "GNU C++11 atomics support library - development files"
-FILES:libatomic-staticdev = "${libdir}/libatomic.a"
+FILES:libatomic-staticdev = "${libdir}/libatomic.a ${libdir}/libatomic_asneeded.a"
 SUMMARY:libatomic-staticdev = "GNU C++11 atomics support library - static development files"
 
 FILES:libitm = "${libdir}/libitm.so.*"
-- 
2.49.0


