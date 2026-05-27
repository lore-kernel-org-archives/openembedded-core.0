Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFEACD6E45
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 12:44:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19596.1779885871647452171
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 05:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=X6TOo3v8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96079a5f83=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8nvs42856730
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 12:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=uAIBjI+Mxy97IdUA9oxj02q1q/KA8i7rOiJrIOWVYfI=; b=
	X6TOo3v8tlH5cEPLcghz3qyociJjxrZajyP7CJRW3nn+n+2sAhytEnWPabfvqb7M
	LRqO7UkV3XMWBxm7WpktChdspVY44WS1IyHFkzDOLdcwJ+SEK779XCxUiyfVAWZy
	bC1ldTaaJ1fPWzECeIH2HDDIBy3ESsC3TFUHShod1GObdFibIczMq8ds6/eMpPjk
	Y8pUYDgNpGSEIV8d0RMw3ITaqqA7yJy7s+1zve7B0oAIuzVgLhNVzkCNN7xQxPV9
	ztBPlriP8bq7R/eL/uDhXuwFuEEhRNBcJL+YSDPe/ju85lCFnJi90IH4KTOz9lBj
	YxiEAMTdPLjuETjIWs+kCg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011032.outbound.protection.outlook.com [52.101.62.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb1f061pk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 12:44:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhxf2BXEYAmWRIiz8vmX2QfE4t9zk5PhZy5INtdvf+9BVuDJahFO10RWCequoT/OtmRSuw1SQH9Z/VpSK3FTlALSMv/Iz8PlmpmDpoH6TmpEyDF3eU6h754JdodjZ35/X6r+JupM2ZqBS10z+J0tcv8sdawWNPlCwdoVjHHKrcCs0fkYHcg6u2WgoXMr+b33fR+MiekUOmzRP2G889YToULCtyFEKGEc4pQzfdwh0cCQvEHLpBJu6B8GHXsvh6pRApFntnYdUpABs8h7jF/aFqnjYongGsgJReX17Xf7A4O7PIy4BGcJBzTieAxsPpCbKRrpEU9rfAu9vowwpXOYQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAIBjI+Mxy97IdUA9oxj02q1q/KA8i7rOiJrIOWVYfI=;
 b=rYu/a/oHDjvSNtc+KariayNiyOUOjUv9dZOzoNZeYGfyDjI8QDkpFJOJbVDSKBy3R+JWh1seqDK/b5d04jvYtp9KohX3S1mrsr2eWcW26g487wWUDMvvL9tjXSJNOkiojK96sMi3gUY4RgO7NowImEOxD/5qLAMT5CN0sMcSeSlSAJbmq/XeNP1OZId0UY2v6ncs6cFRCRWUs9YHTu3YkVJQf/iAsj6gXbYVIayfNqU4FNvdWSIluRwvqgb7gY6tL9lIBRVuRBlc7b3NdH9WVqixwAIZim0k0tU3rpNX/gqJtBQ2zUwO19aCOmqSeJN78i8rewwByoB/HrGHhSQXiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 PH8PR11MB9973.namprd11.prod.outlook.com (2603:10b6:510:3d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 12:44:28 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 12:44:28 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v4 3/7] gcc-runtime: package new libatomic_asneeded files
Date: Wed, 27 May 2026 05:44:10 -0700
Message-ID: <20260527124414.1728434-4-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260527124414.1728434-1-Hemanth.KumarMD@windriver.com>
References: <20260527124414.1728434-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|PH8PR11MB9973:EE_
X-MS-Office365-Filtering-Correlation-Id: a721aee5-07fe-412a-273e-08debbedb064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|6133799003|38350700014|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	GUxw0x3BiPPjfqqwVgNH2GdWAAKdQVYyR1P5k7cWCO+Xam3ng8AMsr3BhEcspXeGb3SGd2vCmM7LHrUsyLsiLdo0fKumceJN6YnPQqexFZqXzdmKt8MnMPBmzRNIV15CdfZ1XKoW+HJBEmLLkplCcmQ1Aeh1BWJFe0mFD69s3KTgCDJuSSr+Jyg186+blOspHTN4E814EvIlRXkjq/hLZymjS4NsPK1FYUX+7R+SWznzA5yx/KqXV1T3qgredIKcMnUBGTPk5HzcMW4MsBHFs8462lmfsS2ACz5iXqeh4jkX2sL9E4V+111kKJnZJeGBBcXeBN7Yzg7Kdtg1B4je/z7xW648BsCGMWS80ChhiSEQ/Uq7N1HF8e8vwsBIJi43cr4V3olkQmxlR7jvbJBIV+Ut3x8Br2ICzk69wsjv4/iFaXBeO9CxwALqZtNanRzctHUBxmCEt+W7Uf39A4KeFwV/KiNORli43FH++yZrLoaXQMGz4+UTQpExIza9amfHU3PXOG4ye4+h2Qc6hXDV8X901WhG+HBovu1TvnAdmQj53L5xKLqov+SeKRVnBnxlEt2K2vyfAdu7uOx7J63Hv/VN0cSjF7CUDmJohO6mX9wG6gtiGZP/067HwxfYSuB02bwrPu5N0A9KYw2EoJr3NFsljf1UmAVtpHg5lC5zxFbggk2zKQ8sVB4EocrJXUeeTWgxXDdg05dd+7njjKKNxG0FyEHC2+1ga4BBJqvNrh9xqyiW03ZaLah4HqYCb18c
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(6133799003)(38350700014)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kOzT1nkZyjyzPZdn/4QSTISkmJKxuCBHMkp/qKjuVLz8EyQgYMTTxKzZjPlI?=
 =?us-ascii?Q?wCmhjeTsqugyDw5xy/+mSwUCclwgTh1wh/TwsPVwG6ygcC4cDBLxETaKlEw0?=
 =?us-ascii?Q?BUDCBhyRPtN6c5O0IfT2mCSZkBhb2Q13a0+lgGs4gBpscgUty8qrQAuIztal?=
 =?us-ascii?Q?T3XZab+5PaXokTuNsQE+zT9oX6VtmTw9rqeBfXTuuMxs5SBqFW/vxpT9xCKy?=
 =?us-ascii?Q?m3us0aPx+Sgv0AS2mGJp2p3JN+vYPNeA2BPbfOr4zoxkhIk9LdpYW+vqQgdV?=
 =?us-ascii?Q?00gi+hbUHiPL4U+YBsCIiIg2Sf7GuKJPvy7rDwmg/xAR7jEa+STSN0ivS5Nv?=
 =?us-ascii?Q?EnDdLefHmkMFiEOF51la9Utk/s15giibH+ZNQa+uWtTKGKeCS5ScmdvhzA5h?=
 =?us-ascii?Q?MCzHqq/wUgCX7oTZqwMvjun6/3P5HEZJPPc2cxOyi0Uhm23JP6iOaWmSRfzc?=
 =?us-ascii?Q?S6lvTy012taunVU9jEcJDSu+D/iN3vELxVcVDiDBT8aPQ8mILI3VL47T2OpK?=
 =?us-ascii?Q?t/htH8aGPvaMz0C4TC1/mHDEJgWjVW5HExaVlzS8eSIQ+RAxgNgU/zWhdCvC?=
 =?us-ascii?Q?OIfWixBivcZD+IyZKRBQxvNzBf+THsxsil6F4Xt15zYeuy0DHgT94LGG5iTY?=
 =?us-ascii?Q?txgeNonJIP9UQm3IuZ0OcRAYwsb/AGm8SVWUHsKVCiEFf+/eJSB7W0Cy0WnQ?=
 =?us-ascii?Q?6woRSzwTWcnT2+DDVG/6svjZ7nkjrzmKzazDRAGc9zlqMx8Y9Jn3zkj/kJdv?=
 =?us-ascii?Q?tSjHDg0fGCo14C4GL6W5bQTh92iZcKyMA/HTMG5qDVurJLR3+PlPJ9Dvy1o7?=
 =?us-ascii?Q?FcbV0YiNpXVyhBEyQX69XrqGDuYx11RxonI4VLFT2Px6H/zAu1PKaOVdO4AH?=
 =?us-ascii?Q?0y/KyBxckQYoYcadYQ+Npf9zhhH5HVN4g+NZDRrDo75bt0dp6GUZGZwsuUNt?=
 =?us-ascii?Q?OzO01wN1TCNiQio+EwJAQOs4ZzDYE7CT/eBUpKaXXD+qV3+2NGtj50GWlf3W?=
 =?us-ascii?Q?zyJde89axK9zb/IIE7v+ttMjm3TLulN8wLwEOX7GT1SSwGd3yqmfr/91gMQ+?=
 =?us-ascii?Q?8I4kqRDYFm/kmPkOQ39oY/uZJCIbGnAkekIvlgYC6w5j3Fgd4dX54LB8aGga?=
 =?us-ascii?Q?D/yyzPNMt2Rp0P/LwY73wkGjke1yqTZMVDMDr6lGtQVwOkGE4Ykg/Nx1wSbb?=
 =?us-ascii?Q?fFKkNkrca+Sh9llBz8Qjj9T32+z91C552KMKFgs08fTcYKpjuPvQeW1M5O37?=
 =?us-ascii?Q?mvjncy0cRqaf7LBTGII676u+vS4SM8wHkuc2xGKY5mLm0VI6m8GEPMJrdo5A?=
 =?us-ascii?Q?wPBf7FOpaNuJuqTKbu9TofcrTLuDJ790ZeQc4DeCi8TciLVipXf/+c2RQwN1?=
 =?us-ascii?Q?gwe7xRK+eWJMXjVwCNTAt/25UZ2+/42JgTI9CyxD7mqwHiBODFzWwJhhSgoq?=
 =?us-ascii?Q?NKRX5TEp5F+iKnFy/DOn4ZLwUSs7B7XxSATV6RZj4JPxLfHIYQgVd1BPoUfc?=
 =?us-ascii?Q?s/5JAQ1ClVP9WdJ4CYTmUiX+eldBAues4zO5plOGNWd9IKZRq85kAyiv37xJ?=
 =?us-ascii?Q?MURX26JTXEeQUPc1oZyKLjpvWk+XoIUIIrZqSKanusZVgf3MeAC0hPIlHJeq?=
 =?us-ascii?Q?vTZ4XWoFkycpyWqu+xvIVZoJAuwYVyTd/x+o+UETqsaaGzhBClUeeb9JlA/p?=
 =?us-ascii?Q?Lm/Vy0St+Ft+oJOYNsCCQbNdut6PbAGylxhpnr1SU/ZubMRh+9knXt49ncJe?=
 =?us-ascii?Q?xX7v8rQ0bLpcKGbs/SzmT9T5nRhsWdU=3D?=
X-Exchange-RoutingPolicyChecked: 
	U0+NFnc9BkcuxiLJkmajF/c+Gl5rZ34uo/dYEPlPVrqTXnDtdfsZcpQFSi97/ppEO179IC1a4Y8iuYz+r4M0+i1hcl0yzJ8IyUSsLeWItNxPxg+W9Ywlsk497K/H67c4W+NoxMV+kV07+DVDdmXtWwY9Vp7vF8WqnGxQnvfZku1uiPqzBQADX8zFt25qLHdzLja9mKuNoAoLyCrzJeD/mtxsGbPKORtj0t5Y2Pvp6repekCvZa144vL8POFAbmpFifXtOjuRWdnXcJib6J3IK0e4ujzFNK3rZSbD59G9yzGSLHdqhu7jb7Z5WzT9zycMsXDXl4AVpSPEaYTEf/oO8Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a721aee5-07fe-412a-273e-08debbedb064
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 12:44:28.6247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4cF2e7ZZHwwUJeaOqVsOxUXNoUztDBn10baarWj3/8sjgC1sdPHeC1mB1WiTLEcxF1Op36d26XTjJCEoUC8Rbvi2hbyfT2cEkkukIefSDvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9973
X-Proofpoint-ORIG-GUID: 6bOyRxpFqwe7zl_byta9RlKEEanPZTE1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEyNCBTYWx0ZWRfXzwYsW/y48JfY
 EoCjzUrVw2sEfcOBJJ2dZ+HjPFqbZuBJc5isiu6WrEwrY2W8vxcHBizw3rmduSllgXo5czp+cZN
 oHIkMZJzj0qLMwngYohjwICKp5DtZl83ghW0EVMfiLmkKqZM3XZDfTjaHJI3005smVYsVZewLG+
 3i/NZPH7jeQ3kEMhUsHXXCXsvqU+oBW1hCPlVHiUUgbyh1ggLp0Mi2nnLDmI0QUwn1oWlV+Iwdb
 5pixw+8d2jocncPD0MqlIvSS0ZkHnlabu8VZ7259RLvj3k+AScHgjYMEUnSpeLGuX/+ApvwCMNr
 og3ZO/DLDXBkMDtPkCA1sEszUdfMKFXtPpVQ2forHdbm5i01SmSm3CI3l0GnrE8dlr5a1oTzvx1
 SbJSjKtOrCv/AYFFK7NI8DIxDgApeDB6b0BQLORtCxq+VbbVMz4Mzzyv+vCGfvNEjj7H5Kt2xPU
 eK9gGDbo8rOC7uyMJ5g==
X-Proofpoint-GUID: 6bOyRxpFqwe7zl_byta9RlKEEanPZTE1
X-Authority-Analysis: v=2.4 cv=PZXPQChd c=1 sm=1 tr=0 ts=6a16e72e cx=c_pps
 a=j/UUtXukZThXjipu8qKQYQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=f-1Ak3PPjXL7i1jfQukA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 12:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237651

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


