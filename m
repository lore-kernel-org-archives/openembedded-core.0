Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73DEBC7EE30
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 02:01:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13813.1751421655731980074
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 19:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92788b4251=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5621ZZ6v026880
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Jul 2025 02:00:54 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j7c9brvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 02:00:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LW0dnjIRnTO7iKsroRiyX0I4wfxUYfxWxAvyPBK7T2NjszT523A3ECT7BaHHidUpMOuEYNvaaHFA9No6f27ACzo8erpgw/vctUSaZow+RHGVGYMDdhFtIsJw7TjQln+E+Y7ZNOEB1QyCUnTm9POO7kFG5VllZO5JuVQE9EKxCsWf1l71jnvl8InW5XAIR9jCHQGBTpMlNbXfcmLHVEKcNzKVEKdTLe9Vh9pb7yhjWR6N9JYZHgJ46iK5PIUmYuabWodVW2ALYA13/PSoSc3VbD+5yRpbVbRdVXyIQ69NqFZbgSKe/3qgZEy3acncOXPoEC1jJyNDRRXuZn23CFdqsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNUcsqXyMxXnzkR8xxb6dsCSbHiLwLrBtbT1WJOIof0=;
 b=nLIONOHOfTP/XEzAiLpH6mgeqq4zuNt7YyFGG24UguQVqiTkv6PspmR5/FLifnJN6ydpZOXObemUA2Xdamv/7Du4Z4Fr2pPEtHTJO9Mrj6l97g1WmQLrXq3K0ddinaB/tFJg85sXBqRd0+ibT9QSYhBfJrhjAA7/gzp1ePx3XQFN07zebTrn2KE1sUV+Zs3WrVUWhhRDFeo9RLCRPZcSc2b6LLEpIFh8is229ilt/7cRbZxQWyrw8flFtvIVJBEYVL2wI0TsSmhePcREYRKGuo4iDpRJvqzJ0Efm+0YRET9Pt8dAHFkWNH/oxU6s5e2uqLkVvSZyR2Qh8ulXGC79qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS7PR11MB6104.namprd11.prod.outlook.com (2603:10b6:8:9f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20; Wed, 2 Jul 2025 02:00:49 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 02:00:49 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] pciutils: upgrade from 3.13.0 to 3.14.0
Date: Wed,  2 Jul 2025 10:00:32 +0800
Message-Id: <20250702020032.2692513-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0152.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::11) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS7PR11MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ebf5b5-4855-47b8-2042-08ddb90c4389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4E42wp2iglcUAcyZicyvOUBSuTuAyh9BLccmnDueVHrjBcg1qPas/0RxcBrx?=
 =?us-ascii?Q?tN42Mb6Axs9F9BqhyBw/vJgv6/fDJv5AqGLZClxn8PUGKcYUszk9uQAA/RDq?=
 =?us-ascii?Q?Zgi0URttuj8zyOST5yHF4V3ZM9+aKd3J8KBeROl2x5L2V7Tyz/uot7fZqe30?=
 =?us-ascii?Q?F4jO1WfdJtiiYTmHhaNjHkRYT8Qd9KXMYP5dnjNOhjtXkE1ayL6HY486N7c2?=
 =?us-ascii?Q?eFP7lvCRxa+Og6c4pyZJ6epqkEv2e2QEfR4JYPjkNyE2vAV8KsIBHlzZLC5P?=
 =?us-ascii?Q?hqXzTl8CkIx/9kHMTnPzY/5wAEmjyYz536mwzvD9detKOf8wC3QlePeW7VEM?=
 =?us-ascii?Q?h2673z9EQ2bE+faC23Qz8FkvarE60rL+6yCoCkldCuJdAoe2TXo7c2ntbfHx?=
 =?us-ascii?Q?wLqtvfjMD8C5qSHv8HRiwdQAfA2dr6PzO/wX7AVWiPypwRlPoIJa1+hnM03F?=
 =?us-ascii?Q?oGDLzDKmxbGjAZnro/hFxjLwVKcS1ibNSKGIaW9LhNxN6aCA7nRI6zP+5k3w?=
 =?us-ascii?Q?9SjF3BYuPP9qrQ+n3JvfPXiWO4Vv7EhV4A5QlV0omPh/4Iwe7PYIJLYdmu0I?=
 =?us-ascii?Q?eXbJbpDdxRDNPCOPfxS+u9Y0DacF/8NF1gy3Z1pCYmxRpYdT+GFPCScFXv6d?=
 =?us-ascii?Q?T9qZYfZHMkTYErPx77ooc3BAFaSfZfGf918wNGv4flp1HqozfW9zhSoKPOU0?=
 =?us-ascii?Q?Hm1v5tzQWDiLjLUx6fccYhffQmWvxGdPBE0mu6SMxS1pONF6RdkR1T4skZMZ?=
 =?us-ascii?Q?oNO6dyfIS8or0qOCGOuYZzP16QGnBldHQLcdSw/+Z7oYc0ttlzq7uOVkWfia?=
 =?us-ascii?Q?cXQjugmK7V73UPFQjVN/OfXUhIJX6d0rFCCf4IZH1OzFb0XOhM+gXCFILyGa?=
 =?us-ascii?Q?iBgt+Ynl4cl2xxWvj6g+yjknf0DpHgHiOm6ZkdcudmDzl9AMGTDm1MaoZKhI?=
 =?us-ascii?Q?0JspJmUm2L/ompEO4ZNQmSi2Ql1WzfBjdmx/VxT21mU4dd9F3Fjmwv92cBnH?=
 =?us-ascii?Q?jCuPtG+CfMdRj2lEMMOFpB86zjC+0KBuXtKeqliXoNr/rJaHYJbiHjRv+5lr?=
 =?us-ascii?Q?Gw4AsP8e6Cqo0OJ5jICxDnlycxDgoQVJTCkYDRf+aGyyIlt49wwuqhv67Zii?=
 =?us-ascii?Q?ZHfVT822hjUnOuJaT6aDn2lvJlwr4d6vCzWbzqMGYrP5cMd708a5Pr4xdK3Z?=
 =?us-ascii?Q?libOwxJydt/WyYfJ3SGCmj4VUNac5ndpxW/05+aP0O5/SpsGKNziOToMBrQ9?=
 =?us-ascii?Q?ks9HfF4ia93wuLiPKq28SRFYp1hOpGB4Wbym85ei3QuaMMgjveN53nWScwy0?=
 =?us-ascii?Q?tgvMw7NmimDuvVx2uNhGk7Z57QrMDzaWjG2ndO+g+i1DtSFuNjj0yaIohn0P?=
 =?us-ascii?Q?XJNjUEEQ2S52cYVX4Z1bYU1kaFCRzzRho3qB10KRK15rg9CsNyP3Q8ste2Lg?=
 =?us-ascii?Q?4CLZm511VYNQGi8vED8dJgv9CLOB4kRmPcIwRVgVchGfjr5RQdwy7A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LpZ/6ratpjuzVd9m4YutPmT5EECLunSJPfHYBpMtg1QacEbZrVEgqvdDiNwK?=
 =?us-ascii?Q?CAs+W2xo3JGvzF8CHuh/bYPDyqWwLOeo2l5/YKokd381ulw20oNutT0naF5k?=
 =?us-ascii?Q?rBySpA2rI0vyVIJUj7ckU9eiC1m5FZrowS/q81T5PITjhpK2D5g43VQt3/Lv?=
 =?us-ascii?Q?zwXuGdDeA+j6LN+Sy2DBGqucPWUnjBVE2FYIgap0WfnSxZNid/SUQuOWizof?=
 =?us-ascii?Q?Wm/vipSS99etDfVuCPly/F6kblnIA9S+5LzuAhXeYxSMHNdtVNsA54DIaHUN?=
 =?us-ascii?Q?KA+/8wkzpFg9idgznAq6EtLA0sQ7qMJaI9wwPpb9EdyTd0hvLW5JRpkULSsY?=
 =?us-ascii?Q?S8XWC/y4OD5oQqmOJJzl656zWjFvZ2lPcHQvDCKR+flMD33JVNPFq1QhIe/C?=
 =?us-ascii?Q?kBXcv/dU8vHwxXnOjUGWc/qDlt8Syr2rCMS+jIyLZhBl35/Xtn2LGUyjVv1R?=
 =?us-ascii?Q?huSlcwdAZTC52KuS+MOmfRdN9VpTGtOaMakKWUmfFyr6L51xyzAS6YGXxRVs?=
 =?us-ascii?Q?hqbyeg3CaF5fFleCgNHS5e8EpjMLZl+GVjBmvgx9XydNSP1/SwCKjci/nlR0?=
 =?us-ascii?Q?O/Bh84SM76V5XgCSOR3OOje7FDC9fW7kGKzdBAF8XBoboQB/gOsU0Dku3oKN?=
 =?us-ascii?Q?dnnPj82HS4GERn4mBZl30Ug1obhsif1pSdXM9JFnHgBXWcGma8JhaUpzPvF7?=
 =?us-ascii?Q?jmMwwn3Ld/t1F/+K53JKr9KyQkxlAnov2FA+T+Z+MMmJycHgolaCozI6ECoJ?=
 =?us-ascii?Q?mz2CpKIQSxfRAPh5lyvxuleWF2lzmbOq+r4hbQGr8NEqql2+mLKSNda8Unrf?=
 =?us-ascii?Q?5PkvT0f3mYd3PMurPenIpU2uJkoOJ0J5U6Mq5ZXEg3sKvBmI292zpRY7G/Np?=
 =?us-ascii?Q?pK7QPaggr1igOvCFu9A5oirheWw5PTpSBDWGesLL2f7Ir96WiWRBOKn1V86A?=
 =?us-ascii?Q?qE3x1POUJAW/r3Fts7uWj49Hq9Zcg2SO3Y6+7WYvwlddUsgIyy488Z/BOHrr?=
 =?us-ascii?Q?WySHDI8SQHVjBDqVbp6ft1mbzfSdCUr2XKY6uPKEwjM2bpnvU/mLFHhvm9iw?=
 =?us-ascii?Q?mry/zM0yx0n2VIT0GC8b1QS0mpW2cW25Z2ygfPSqB0YRJaFTCc7FjkdrYady?=
 =?us-ascii?Q?ER+3Sry0gh+bEvTaJpXUGzo66HA+bCdAqmJTEQunnVKKoNVuVZlBJfqawCoa?=
 =?us-ascii?Q?HiFEHmju/NmH/rE4Y0AkW9XphPmck207raVmq4I2mDNG6HadDoFrk5LEstSZ?=
 =?us-ascii?Q?Z286cxusSyzPWOZs6UXMY4+urC/PcPWEMtpaNy0W3hZ5wIb66yzzJ3LmadDh?=
 =?us-ascii?Q?2GqrkfvITg6+vH388ZT5fW2/AS3/ClUiJc76dXEFRx3bWGardcU4S23/E3np?=
 =?us-ascii?Q?shgBxyuM3j9yDW+YOGCt3rLFocOK+nXss7/Jro1q+w8tKscCSLbCHlx5XUsn?=
 =?us-ascii?Q?JtoWkm8qbYHY8qFgoCniwgesDPuqsl/2nllozQTVkFqohnsO/TYGJDL+mpC6?=
 =?us-ascii?Q?UbfQdsI8XhWWd9byzFyX8QEvTYi3UIqNvjw3V1icKeZDWQy7HVVQ/ZeGoO+3?=
 =?us-ascii?Q?P0q+uaPgSVSer66+jim56ZAXFD4nHvMAwlsDuZpV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ebf5b5-4855-47b8-2042-08ddb90c4389
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 02:00:49.5583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AiC/6Qb6GRA1ZX/ssd1al8x0tXTHlvmE2xE6KINpavDqYMMyNENKhSSGWvvac7nAW85koF6fTChmWuCVebGe8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6104
X-Proofpoint-ORIG-GUID: Nr8dYB_hRGWZJYsvz7l__tFr-_d3WWXa
X-Proofpoint-GUID: Nr8dYB_hRGWZJYsvz7l__tFr-_d3WWXa
X-Authority-Analysis: v=2.4 cv=M5xNKzws c=1 sm=1 tr=0 ts=686492d6 cx=c_pps a=Fhjxo9ZRswNOFApSmHy3bA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=U7Q1EUjIjnvBkeP6tQUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDAxNiBTYWx0ZWRfX/0kF0xj57apX gSgHQzE4jqQNxyxz0AsriaWwksvxoOgTf/kxtN4XuB9jk56KcJPf+yI4SjpDVg5cTVr0CrTzOn6 QSUDdbnOdDHfewldA/pZouPnOdP2p7nEBBrK/vm/DA6WTNP26w1ftO/lhX3trxVKjjR8DNZAaUJ
 kGDzdErjU9h9HuXcZIXhqKYcCLzRQeTPq9GSYXBXfBy572ZUt72m8nNW6F/TLRBI2pq7Q5l9FBF s9Gu8tTvv/knQEG7iSZMDTqYkz2bIXSPmWc1f3RX+3OQfGf+PmYyFt3VUDY4nLOUSM5aXtKhYbD prjDX7gRlECUPxeKAvpgx1SY9iM8xdnNGTrVomxyluC9CG/moSPM3XtJpTPCaQTa04jHwhUzK/n
 AYDc6iZlMzlVuO/PiDWpDckF91XX8RY0fmn6NMR19kFbvypGd8Uv4/yGyzOmaqm6ZCEceOeJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=713 suspectscore=0 mlxscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507020016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 02:01:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219751

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade pciutils from 3.13.0 to 3.14.0.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../pciutils/{pciutils_3.13.0.bb => pciutils_3.14.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.13.0.bb => pciutils_3.14.0.bb} (95%)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.13.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.14.0.bb
similarity index 95%
rename from meta/recipes-bsp/pciutils/pciutils_3.13.0.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.14.0.bb
index 6478722838..a267ea34b7 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.13.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.14.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "make-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz"
-SRC_URI[sha256sum] = "77f11f78298502634d1af50308f15a5788629f6cf45cba376f5009aea4cb4926"
+SRC_URI[sha256sum] = "e7713409882813991d2269d125e40dad1f54a019a52b78b3962941c1d4a6f86f"
 
 inherit multilib_header pkgconfig update-alternatives
 
-- 
2.34.1


