Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BAAC83F04
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 15:48:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.525.1751384876424208963
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 08:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=927761a2af=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561BKBNK019754
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jul 2025 15:47:55 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j5m1b8tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:47:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGMmZ2OMI62vXAlsy2NcEmpeq5wjtlZQWTMrtSUyAFAzsh9coQfqV0LetVDUM9RKM9TY6XTQeGKZWFOIhVXrMBIhGP8+2RoB7uk/m0rklL0NBkqpy6Sd5WzITDzMIDWL+3VGJetISKxQbF6P0iYZuxixhnl3IvVtzMg+myy9xejACpwnZdNL8muAF7vPM2lToQwtevyk3ocrmr7wAXegO9u+AVgodwSv3z8tPnbc5bQr2vYGrPm8aB3ZF6Rbm0QUfDGNmiQpG3xQkIMDbGwvQxI3CKCMNEBQ60VxLGMj7oO/6DI9YRhuRNKNWEt3lt0zJPU8RpmjfleEZx3DdqPJ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtGtSCIFRsLKprUoXrUCmf+wPjUcVxNSThUE49TGajM=;
 b=DObsu6vmgI1RA6pboXamX/uhG3qeXJ9EbrZEOSteosVwiHw5ct3PHyjTJeKbO4SCSif8ee5HW5VqOGcVi3x5XpcG1lQKSN2zctKCYt+G+2c8QUrSBp/ueOKBNoJa0RpfsYS04HI2MxO1VNs5w2swlmapQS00YXEzSlJMXWrqqLeC9oGrg/N7yBOGxkLj9GkvF/xKMzoT2RxNjLV7VEzXbXZDlT1tqw5zYcfWrsHOJuiyuqUyufBT5uSNXZjrENR2EMFWkbGNP8/bb9jG384tX1pdNG2oMAFXaujiDgCuyAyYQhKuqC6tx6CglHalb5cV8MOV6fBmYDpfrTScvD5ssA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB8130.namprd11.prod.outlook.com (2603:10b6:8:181::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.24; Tue, 1 Jul 2025 15:47:53 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 15:47:53 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] pinentry: drop -unknown suffix from version number
Date: Tue,  1 Jul 2025 23:47:26 +0800
Message-Id: <20250701154731.1465906-5-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701154731.1465906-1-yi.zhao@windriver.com>
References: <20250701154731.1465906-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0090.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 70a6ce44-a230-452e-4052-08ddb8b6a40e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ql/P/EG6VTEhSfZkeW/2AE8oMT9EGZMdVrlHwkEDKhua0ywyVdcTDs17F4X1?=
 =?us-ascii?Q?WC6Oo84mL01w3fdbZAMESIbQy1e1n29msvr6ZrOw8Vzi4EJwQdDMaSrgQlpL?=
 =?us-ascii?Q?fnnRHUxchQNbAr90kwXQGMHRD21+PNEXsV8l3BXv7sqA6qu5bOnaSl0K0Yi0?=
 =?us-ascii?Q?uNM7I3ekEMOGaus21q73RKhqGB/ylCw/Nerz5fb6B8cO2S/29GnP+rxFZl79?=
 =?us-ascii?Q?kktUSx4Af7mrXwr4ozdXc1tASVnk3JCUlUg2IdtznxsKxpZXpXf+ozE/CdkV?=
 =?us-ascii?Q?GsoEv3gSNY1zcMcc18o8nxw4a3rEncrvM1o9Mv1AsqfAo5rETxwqkbUPVWC3?=
 =?us-ascii?Q?z5LCecG+yVQIK0Rd8GEIsMLTPYSIpmnaBCezX0linWJo1nzv/e3rufvkrlBX?=
 =?us-ascii?Q?IgfJcL2PMoIlGyubVC+avN93QFBMw6pZkQHxV//hA59aNy/k+No3tjoTStS7?=
 =?us-ascii?Q?SAcOxJLxHH2omVz4WxPssrGUG47N5W859dVTU8rE60sAldWj0u/VpmJL4MP1?=
 =?us-ascii?Q?YTeKq4b1KEwEs4OyZR0v96ycf7Jt5G48/hoG3TQocwK/Y72zHm/WHm4RMqE2?=
 =?us-ascii?Q?lJQfYBXt8ID7hAbRUeiT3uZUabIpEj7yc5Olgw2QG22IYyWhBb0rO7gm9nB8?=
 =?us-ascii?Q?tsoSpDxjYlgGadcgUBPHSYMS0+yjkk181SC3+al57//z2u3uDHQS6ZozA8Ps?=
 =?us-ascii?Q?2JPw9EsBTD/5+3BZ+zPL3drFchjKatxE8xDfYYetjQ1WWqBRH1ETTz++MGAC?=
 =?us-ascii?Q?jXOq8upCYVm8u05N5QEuVpFmrfAKFHaEsviTvyorZaDctM4tY2BFVQze2ZLT?=
 =?us-ascii?Q?f/dzobaN/Qp/p16bPxXfLOd3NvmIGMXRqwKHV9F3vZba28x13moEr/6lWjXC?=
 =?us-ascii?Q?eAktKvKYRXuyapII0rj1orE3dGWCTcOPGVLQfK+2HISYMBw5Jd+8yJzAsWsf?=
 =?us-ascii?Q?+vt6KVJICMKksIVlPlCnAhrj/bRJNItt8uS9aF6Xzquv17dHp8o6d1qb0sLu?=
 =?us-ascii?Q?GmcislKvK9ZKhf8GcrZ9h1l3nni9cjzyq4eU8OOwXX2KPrVghBiOwaUhYyKd?=
 =?us-ascii?Q?gnSa2L1GZzHdZyOZDEB16JybG6ILZPKRBynNciOii9uuSsoPvry2TBDFTJJD?=
 =?us-ascii?Q?gRfqqCBmCdpkO5SNLPRAxDvvqtKMHdPnp9O0Ht4TmZuPrtXQSWzCs6Y88GWf?=
 =?us-ascii?Q?gL7yKrkWR298MEnazxNEVDyF0Rk95q2IyPGdzqI7Pm/g1QTzTjd8/Nl/+QPZ?=
 =?us-ascii?Q?czzER8/miEO52Kj6ZnBhhLMMUlRPthSX3UdiVVxGWoZjYbzdAwUvr0h5EbO9?=
 =?us-ascii?Q?TnFF9s2KJ2tQV9L8Ii9uGKRAgt3sVRe9deVPHhoHNrNEMxeCbhQRJYr7Ivbl?=
 =?us-ascii?Q?lTgR1FCZMrYtvTzNAlPwqja4h3GFnofRReaO62yBF6gnWidbaiHchZYexQne?=
 =?us-ascii?Q?yjM2i7RruJiTTa7xBjLtZv89TIMj3y5XxcIaOOws4ybGBCEfaNAx+g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fwrbcyLc8tTWGOeYNFPgXvWs4/9BAX5d0tOGjnkslvfcQub7NeGKmOcc8x2M?=
 =?us-ascii?Q?LUtApet0EvTYmCL8RrvNWf5kmK+RC4FyE78CWMmZpEQwRhdJcftEJ4hAXGNn?=
 =?us-ascii?Q?Kf0Qqe2c5RGMZ/15mbNPwww80p2R3g46xH61qwvLOH7EVJWirorZc/TyWDyi?=
 =?us-ascii?Q?QbqEdNqnWOsaiQXjulD4Tt/MXk3D+G5CZBN/FSy6qLxMDPoNxRQD411oqOi/?=
 =?us-ascii?Q?x9qwou3Ci/LUWdVznew8NyGP7st63fmwVlQ88Gm8x0KEjBkDVdKPnJhI4DUx?=
 =?us-ascii?Q?/9t4AFFP2pAmpnXbO5WiPHbfEPE+idBaKhoAXbFPlOcGLFFwxSMbW+LbXKtS?=
 =?us-ascii?Q?p+/HUTaRdKJeQiYlCPqPI/jdi4XCa3zicNfecJeEEdPpbt5zt8TU2j5Wnzww?=
 =?us-ascii?Q?79+ozXiJ9aIY/nZQuTf3yN6w5v6z5TaXAmKPCaBrXJHN4V10+GNf8hrHyf7b?=
 =?us-ascii?Q?pQ/uIzRweOESdqQVOS8GpTB2QWsCleYfqmfC48AqGFrg5oztLWqPF41bf3P4?=
 =?us-ascii?Q?ExQPxLmjc8ksv5a48iQrU3JQCr1QsFlUVm03EqEGbW1HHSP7apkI/XJFbXTI?=
 =?us-ascii?Q?w2Q4E+sBkQXK6nOx8Yjd8X/44gcwiwHKqps+rbtAE0szbVPugV7TtHwjC4oc?=
 =?us-ascii?Q?oYIbVvgTSOpsufQyh3bW2ISuz8/vvl/9qtMm6IM+izKryQnqkZrmt3eBbenX?=
 =?us-ascii?Q?Tdkis8hsjSqIbuYQSojnBcTul/8GJLhNaL1EFFE+g/I1u4yfIgUgKXlVWVZI?=
 =?us-ascii?Q?3z/9pkkjwhtWuDXyXHctFQjJSVifHh9t17czJpYK5yDVW3eyHWAJAcXrLfXW?=
 =?us-ascii?Q?a6+x5UBLQgDUUNqJLFsyLebduyKrp7kcqZnBLZO4UO7xHXCzAFQp5d0pejJP?=
 =?us-ascii?Q?s0Y2IKXERwV+FNKu1974kXAUEFnQxdAROlu2g9/THuSlPTFFyZFza3I9X+L0?=
 =?us-ascii?Q?jsioq4/M+p3vLO/4EoK6gkqrdlLLZCsQF368irQczkK7S5eId6e0Rnvp45oZ?=
 =?us-ascii?Q?6fAvmHfNygZF8pph9vmrAXp04scQmW4vGH0mtqHbhEQKdDpf0BpTgG0+ttd1?=
 =?us-ascii?Q?MkuZ+IK4RUgbj2MwQ9DgCmJSKQJWU9K/nBxhse6aaPIuGESEIXguWjcfOKZU?=
 =?us-ascii?Q?rlVTyh9Zv9CWupqqj/p7dn0YU1WPFej+oZHb0msnAgptT3hZYJ5VU5xoza+z?=
 =?us-ascii?Q?oyXd7foBnt06i7bMvTi3Wganb7u6eMlhv7ItZTtXpQ4jEVPjhWpuVEHeyEpP?=
 =?us-ascii?Q?QR9gGkHHcYNxuOa0lhHSNl4nYBgtxHjmtFDM8c1Wfq/qml64TsCBjjHkGLUj?=
 =?us-ascii?Q?u8oUlxDX4gDSZG7C1b/7ru/kgSqGxUm2GbMDJ45vJlT26YYulS3ZIlR+yMY3?=
 =?us-ascii?Q?78166Ff+JZp/bdOb4IMjcXSJX5icrwC5a9QxEjyzrDY2pwipkFgM/tG0QDXx?=
 =?us-ascii?Q?2UmojX7gR/YkOHQtBobtRpK8/vDjl6NXisOrNvy7ArXiPFQVHarhpkLf1eZK?=
 =?us-ascii?Q?hW9bo3sy76qfwg0+zdgKBer3XZLo+QHgvyOkY78493l3IbuCdwqvjhPVqQJC?=
 =?us-ascii?Q?X+kInWpWHreEGRfBD1t9c1FzWcb8yobn20bAW7hx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a6ce44-a230-452e-4052-08ddb8b6a40e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 15:47:53.5988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cG+SDVFzqdNixznzC1gpNH975u2M+50MVV5AP2j0+TI1ph162pLcqg17vIO1k6Pi5vGUAQgvab3ziCXAMLLtow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8130
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwNiBTYWx0ZWRfXxPVwwdBlB4eZ 0c0WSGRsTQqFQ87NO8//WYk9i1LJcG6xe12Rj+Dnw+b0/ti3l4kvK+VLPWINDXYH6T15DrGmKbY 1XDX4GT5QjaLpf17TLQ9xZpAttbrs386LSx0vBfChqpW67PDelI/u5U+lZYhXkWi7A2/joSOqz2
 4UZ2F4V1soB8lR0Df6sGyTrcee/a5q8px0umJyT6XOd/Wm1QojvzDbWjW2An9yAFYGrLF/eOyve GL0qPzSF8QSykE9emm9Zl13f+mDGaDHOlvo53/R210soS3KZo6pyl7ZYi8Lnuy4+9Cm73FKeoyB MiuVUlPiejFuJWC9m3ybJ6p0TvRiQ9xqoGHb16UfOZdJ/rRzsa19alSoNRFSkjTNS9Hx7RMsXq4
 XX5t1xhwKt2pt5s2njFs6nkJ74bCEMqeHRACUKhVM1GcG+0vQLCJgkluIpsMq/RdfeRK1ZQ1
X-Authority-Analysis: v=2.4 cv=IOsCChvG c=1 sm=1 tr=0 ts=6864032b cx=c_pps a=Uo4aFAHIxFRcms0b5QyC6A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=7IdrdIHfWHnaPtMrSTwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: DJScs0DCoMVkLwsrqLQtEGGfiHNFrlUx
X-Proofpoint-ORIG-GUID: DJScs0DCoMVkLwsrqLQtEGGfiHNFrlUx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=737 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507010106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219592

Inherit drop-unknown-suffix to remove unknown suffix in runtime version.

Befor the fix:
$ pinentry --version
pinentry-curses (pinentry) 1.3.1-unknown

After the fix:
$ pinentry --version
pinentry-curses (pinentry) 1.3.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/pinentry/pinentry_1.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/pinentry/pinentry_1.3.1.bb b/meta/recipes-support/pinentry/pinentry_1.3.1.bb
index 14b368177c..c879c2067a 100644
--- a/meta/recipes-support/pinentry/pinentry_1.3.1.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.3.1.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
 
 SRC_URI[sha256sum] = "bc72ee27c7239007ab1896c3c2fae53b076e2c9bd2483dc2769a16902bce8c04"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig drop-unknown-suffix
 
 PACKAGECONFIG ??= "ncurses"
 
-- 
2.34.1


