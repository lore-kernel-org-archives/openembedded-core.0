Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A7ECD4F21
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 03:26:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67665.1778556397249867221
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 20:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NcAD/A0N;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=95926deccb=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C1dMK03093304
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 03:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Cw0ov0R8+IW4L1EXQhtzxf/Gns0yBKoTZaWQ8edfHBo=; b=
	NcAD/A0NbB2XZza0i3dKTlKX0fNLfY/9kq883M1PwhJwaZ27jAJ6pmRGTty5WBeO
	0gDNQcZIExCMO3usPDK0sw+dh3LWa64T9AMO5Uq7Nt5n4Ivxx+Q6WLbWEaD49L7+
	5lgDofRX53no8RAhoC1bzaJzl07zjuvZi2/CjIBD033PCSZBxZ691XIXJsIVN3tC
	INgxhV8rgAWQqcpIcaKG8kNU7carMIBShWXpUFM71sDQsEkD3n5GEl/OqBva1d35
	F31whKJ08xRtd8guDBPU+FnGGY7yIzG0JW8iNJHUrvkS6ATXodgWaqBr3sx+Zxdr
	cUBxGUysNcFj/GXPG8t7AQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011020.outbound.protection.outlook.com [40.93.194.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e3nvhrc68-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 03:26:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m56QFvUQYGaV+3ZCmyFgQK7hdkqIdlm7qHDcz4rP+wi69waGUE9/e51nTfr4v+POAmvbclbywQ2Qs4rbTYg8YpkPQ0GR9wKG7WWIuYhRfH3x7TFUy3BJyiOqc6zcQ7Q3MXbMQrzlU+TMJ8GqTOLYtbiot1Op3v+MkdzcdkpbG+1rRHaBAVXzyx1KdjctJ4iIel8yeVMKoMXcshenhCIBeMYxXzwm8AETcy7Wc80ipt80cMj62q0BpFTYp2Yq35PeGPY5TMfhPGvbmceXB4fLLHYiv64ZUVFp6ijumpdWzD5MyV/ama6HRJ/2oy7cQmyoGJGER7qdIwVbCgKMaq6qIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cw0ov0R8+IW4L1EXQhtzxf/Gns0yBKoTZaWQ8edfHBo=;
 b=CgBr2PZ3ofv8f9pxAw76ONTO0r/8kIlq4F3sMd3E0lIm4Z92cF+s92NbC2BsHyYa81KSaMODqBr6lPgA8UW3Jzicxo5TWyahgVpTiCZU0Al1952/BIf99b29tYX/xyJWVLXanU0g1id/GaAM8/b24+htkAhOE1HaxXuMFCP/2P63YDUwu7JWY+6meaG1lRqV537jxxwGXhjxBwHDyGFuVJM3JWYN4tNNcGi+XKdG2+GaRH4SSDd36PipeG1NG0bPbk6r+PCy82WVaXCCw/DDhYmlcZUOCm7ye69a2QQQYTbUlPDpLRtwLPG/DxkMrQduE2XFjyNyd3vgzTS8K1dP/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5017.namprd11.prod.outlook.com (2603:10b6:806:11e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 12 May
 2026 03:26:34 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 03:26:34 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V4 2/7] upstream-stable-release-point.bbclass: add bbclass for stable point upgrade
Date: Tue, 12 May 2026 11:26:09 +0800
Message-Id: <20260512032614.2814369-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512032614.2814369-1-Qi.Chen@windriver.com>
References: <20260512032614.2814369-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0105.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c4::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5017:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ccf9e6e-a20b-4aef-8f5d-08deafd6446a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|56012099003|18002099003|22082099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	zSM/BONWPxggmTE/fiqkiFz8U6INLH1lgQ0t3SXOLcrg0hm7ZeKv9d/1IwDeQOwtW5c0uaPTjcggL7DyR9tyU8I3byUzyP6yMrp++35n3JJ3E3eJDoNonQo4BRQAEOs6XQIwY3KdmlhEvHgKFtpQQJfMpBzjsDAt+ViJC2U18YcoQhre90lquzm10Tl6CWNMHmraStAAoGqryW9N02ugDmW5DH0hno0a8j2KSR4yOIasV2w3f2z8Kijg2XNWsm/J5JOc1Av1rmdVcA1fHeYU/ozivJFZtiECdXwNMlpV/C51z9e6mDIdCKZuHe1WnuOryD22zf15hskPdT41bIuqKMa7MywR48rDg7JS8jUfd1AoxIM8bgnx0bIGTU5/i2XKL8Z685Gg6XHxqW3iwO85VwIGh37e8GlENnnQGIlnRaQjobcHnzCjzB1l2nim46bOd2TabbSdUxypWNXKkQxnxjH2Q3YXtA8iSYYvpeCTiDT12paIE/hYmR0KPpFQc5VI2+yya+X90BUuOSQdc8+pM2OP0tbVi3DpqqKoOqBL4O3c3Qt1oWQ05SZ+kBF7730Oh0uEUDaeao+AaHoDteQimvQedCmggJw9/xXyZhpl762wYrs7Gw0L0diQ0aqhwoq1J0CCzlwaOsQEP1EmqTcJdCWxl8Z81dJ+Q+AKUPBcY4Y5OSdWq63O1y2vfM0Qw7JFK8qMPqlUIGDdn5hVA04Lg/7yqbHt1kOQAr/htmcgbUoB2OXATqTNHnek3nym8kK+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(56012099003)(18002099003)(22082099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?90xKNapIcz92Xv7EZCEN1n62z8/GXNyqqGdVyxX+ctAVZ2Ts4u4bphXwBLNe?=
 =?us-ascii?Q?XH/FTiWdy7iXJzDf6SM5FP8ZANIH3RlcIjnu1zf/TcrotBORmffrQmrURIF+?=
 =?us-ascii?Q?oZ5PbFcZ7yfQmCjE18SMd0vbICKGN7yzwO7xqDfCov8Ptr6JNiX+KfxGoqt0?=
 =?us-ascii?Q?QNudDIJEj9oJiLvlbEyPbs3kMJCBb7outVHoo6CYuTITEdvO0ST/mrr1MP2z?=
 =?us-ascii?Q?Uxw2l5+YinMjjo9o/Qm/KTfozVPmO1WtMj3A0tX3O4M15Ih1fyiMAq9eUkmV?=
 =?us-ascii?Q?B5WdN38SSC2FMj+uGxa7P4SfkXPULEECAEBc3L8crVte2ibknP0Y3S+MEa+h?=
 =?us-ascii?Q?qiRGwViSlUhZNFx1vRsKz353gZy9fK5AJn1NpAAK5QmxGRjpqacBhpgU/foW?=
 =?us-ascii?Q?kNuVoIxurj64B0M+Xo2io4OrM/iKDhIWKPR/KrrOgtV/3gZtPzhvvkA3sXAe?=
 =?us-ascii?Q?Ncu7lmEwZDw8vm5ujhoUIA6ckAnzmeQ6Xs3iNQh31ODcYNdMLEjzFjYghbEd?=
 =?us-ascii?Q?fQxasPfktXiiYwRX/DpoKz19cMg5DwgADRcreAdLGVMI5Nr4RWPl4IXGh4k3?=
 =?us-ascii?Q?ca3xrCLUaGby7BX4zjdLP7XSdWUB/jCiFBWGT5H4teK/K8j11wLqjFLmeYBt?=
 =?us-ascii?Q?KcPPjavLaZdooDHjZdACgzhRF8fohbnTZC6KvlEdGvAk3qWIJi8Ex7b9Jm6K?=
 =?us-ascii?Q?n12z5HtuMqUIu2zcfdaDodk93HhfutcJU2XiK9BB4YUUX+oQslECvn2qTmjA?=
 =?us-ascii?Q?NXsTeYUuHeurrKteqwEh3zdgne5Z+t4tnYZZk2j2OCGDGmc+WspdYWdvslUX?=
 =?us-ascii?Q?wP9UPBUqVUZABSkqm4fuSIahEAsu0avUk+BY5rFTpEtDCxF663n6j8OfQ809?=
 =?us-ascii?Q?MqdqxGedaQ+xhIgWKVtkyY7UkFWb/PU4jiSKpWW6TRJihdVpptYzKAxv5mUY?=
 =?us-ascii?Q?Absw5ecLlcR2qkReq/XWVEcHOXC+f8Pxh4OLYHurtOc7xpNcvjnlYTrTK3Q6?=
 =?us-ascii?Q?VAIUvmCx76z73zel6wqBCBePF37K0L4f7V9E7zXKg/12gc9BKatB5ebfMpj3?=
 =?us-ascii?Q?g10qgw7Xy/3/rOks46NI0e/W/945TNCloyyIDwgzww0oSz220twV4sHXxwAP?=
 =?us-ascii?Q?nXOs5CBAGgtJJxXrmuF5E2kxfm/2/aGXhje3tC+R0STfOHXpSTfag7D4zxwr?=
 =?us-ascii?Q?/9gZ2AsFsfXEnceZHiWKTFKvUNM6u8GT6Xu5rkxUKcMfVfDLvrBPSuzm6Uo/?=
 =?us-ascii?Q?wGdvQekHgvyshddB8eHguK1p76lHCN/jhd4SddhIa1y6zR/qcaKrPfge2Wkm?=
 =?us-ascii?Q?O72Y1Sjoxbancs1smqGt7KSFx+UixCZOPa2OvEodGkE43/mN9csGzuIKoqm1?=
 =?us-ascii?Q?xqq7oADNHXiT0HgNG1zO2c6+T2U8veON5Voxpiv5ATCNu7EDk2DeWPGgnQPi?=
 =?us-ascii?Q?sQPq8T7whCfapZIGcWwlUJltkaeU0HOJTYGtFBzw3cE6Kok1pwGJWfcTGAPv?=
 =?us-ascii?Q?MKZrspltnHNPvftGkjl/YTY0TnQeh8e9Myl7vhwIKTBWrIN48EE+aDaFw184?=
 =?us-ascii?Q?jGfk7YJqa72OM2K821iZSK6VyO9YONLb1MeCcwOslVL95SxK65dxI2QZqPsm?=
 =?us-ascii?Q?5mQSyX6TLOmZaa5wLdeCMLIfBjUEgcmOQK05Ea22GLosKV3SgOtneV2gZQ+R?=
 =?us-ascii?Q?sGx0iKg74Wk+Wz/dlPTTDnPsyCiXdvCQvRkJZpjTIfG7u+zzbl9rbt1fSfoo?=
 =?us-ascii?Q?cDa3619z0A=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	XljatEmw1t2h2yjkFLlqJ+tk69ETJZ0YVeyisoyGm1t2vF1ePPI4bXLRwYtjYU0tvR8TP7x4YbCxDWNrty08QOQPLZnzVrpuke81iDbVoj0QePbKs6U61AIiWYfSDXuHQayImOCwuTzkRWf6EusIOJk1k5hjNC2Clk1B08/xoU86NKSWNUTWlMcIC56tE+ugLMpLmwpX9Xx1veM4d5fCcofS9cWn6XC10yRn0MDHF58i3Hy3aJurqhAammBvgkGB+s0JoEVLH9mpvFPo/F7wr8e2zX3XyoY7VIL2kPHGwZk9rE5uEu1N9tGEb31J0Bfs1rZ7InAhlhUVhNztW3BOHQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ccf9e6e-a20b-4aef-8f5d-08deafd6446a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 03:26:34.2319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vlUL5tUQykiAZsg6TFuhJTC7g2CrvF3TnVUGRqjWBQrr5r6rLhpdd+lma4cjiMjcDFyWaXOTzZ8gKkxv8QzWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5017
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 76HbFJsgKaYJxZSTvfNIMisIdh8CRjGW
X-Proofpoint-ORIG-GUID: 6qvTzabdVCWzTrCyk1CLtqXlHiwdl83-
X-Authority-Analysis: v=2.4 cv=b4mCJNGx c=1 sm=1 tr=0 ts=6a029dec cx=c_pps
 a=ut66qxPycOxoCiL0Gbz/2w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=iqG7azt2_bYMrk6mVzAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAyOCBTYWx0ZWRfX+EPFbH/6+d+l
 Py6DSMrBJjZAxU1ARt3uD3+qgZI0sK23CxGnqw4OrZfpXVq3FqgqQi4DDkM8jXbPVtbXSf5PDD+
 zZIVBrEaGfYkIvre7+89TwY04lYCpSlDeMJm4e8fhZb9g0XVGclKpMVeLtwjdEaJ+ufE+V5fK7p
 +LtwMyHDv9dyNLXsVtYRZAafLnstSme2rDJBQGFMje41RwOEjwoBCECdV3nU4O0EABWur5RQtiK
 kNd9PcdDvSIGJWcS47C50PCbkd0M0EB6n1vq2WUa/40tc/Rfu2cNUwFVy6Er38R4rrgmOzbBK8P
 eQG6WFRGaKoIpVMdE2XQhLs2/lJyfNHsRcNshur5HWysHvMADot4x4lASxLUQMSF88s6JGvvqwY
 u6law1UpLnGnkCMHueArEcI2WpCTAOoii9lbRKteW/PYT8kzE+2BCJOrSnhuVxGquGfJ1dsFIi3
 D4HukG9G0UwDtnIbhMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 03:26:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236845

From: Chen Qi <Qi.Chen@windriver.com>

If a recipe can do stable version upgrade and the stable parts of the version
is seperated by '.', then it can inherit this bbclass.

By default, the stable parts number is 2, which means the following upgrades
are stable version upgrades:
x.y.z -> x.y.z+1
x.y.z+1 -> x.y.z+1.zz
x.y.z+1.zz -> x.y.z+2

Recipes that have different stable version parts can also inherit this bbclass
and set STABLE_VERSION_PARTS. For example, systemd sets this variable to "1".

For recipes whose stable version part is not separated by '.', they should not
inherit this bbclass and intead set UPSTREAM_STABLE_RELEASE_REGEX themselves.
For example, openssh's stable part is separted by 'p' and should not inherit
this bbclass.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../upstream-stable-release-point.bbclass     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/classes-recipe/upstream-stable-release-point.bbclass

diff --git a/meta/classes-recipe/upstream-stable-release-point.bbclass b/meta/classes-recipe/upstream-stable-release-point.bbclass
new file mode 100644
index 0000000000..4d3be6ec05
--- /dev/null
+++ b/meta/classes-recipe/upstream-stable-release-point.bbclass
@@ -0,0 +1,21 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+#
+# This bbclass is expected to be inherited by recipes explicitly.
+# If a recipe's version is separated by point and we know for sure
+# which parts of the version represent the stable part, then the
+# recipe could inherit this bbclass.
+#
+
+STABLE_VERSION_PARTS ?= "2"
+def get_majmin_version_regex(d):
+    pv = d.getVar('PV')
+    stable_parts = pv.split('.')[:int(d.getVar('STABLE_VERSION_PARTS'))]
+    return '\.'.join(stable_parts)
+
+STABLE_VERSION_REGEX = "${@get_majmin_version_regex(d)}"
+UPSTREAM_STABLE_RELEASE_REGEX = "${STABLE_VERSION_REGEX}\..+"
-- 
2.34.1


