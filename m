Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E7ACCFA03
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 03:33:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10315.1762227233664861764
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 19:33:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=angH4+cm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3403f4e7ea=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A43Un1X654034
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Nov 2025 03:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=NMAG24Itcs4wnNW9FHoF
	A7k6pyY+0rLOyPOD/NX95FY=; b=angH4+cmkjKVlXdaun0xeauAtFPChTW38Z1C
	PqA7MBB0583Ao0jgQJGhkP0yADJ4HUgirp0jlrfhyFo2TBXJO79dt6qWLkJtiVLq
	Y+R7hi0vEN7KYy2IIi2TSaljtK9+SYPzoqxlJrqy7YHNEhMj2nsGT4PWQeaoan5x
	xpR9Ijzd9gjbYKtNci/Ogh938irzOBbjoLmfT4Z9UU2ibU838GIMSfE5TSmB+Hcn
	B2x8Ooa4G2FaHsJY2EimZ/13j9ETccMCojif+/JStLK30f/zjP12NcOknwUyHcv2
	44tJwOjzQlDM/wJDpxCMLf3ggz+vjjL+90WZqv7TesF2VYB1Fw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012000.outbound.protection.outlook.com [40.107.209.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a57dx2npq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 03:33:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jv2YHyMcdZE3bzeosnOblUb82EvCBFXxh6ZEXNeogJSsNRCp16RRoMU8IW2ALtcLplAHsgo6uhx/F7Xp6Tsor3LjNqF5w3c4Ushh3JY8Sh0sV2/vVcWRYSL++6z4jlNxTn3KccQF/yZ3D4jx3A3XhUpKwO0G2wCNrOSAeU+JLUP+QH4Ox8PqYS98axBJTs3zIZRKsJSML+k+7bYYcvLV1Jw9Mqp1sStHwKqcW9CN8WTHf5zvR7E1TGy+Y4A4qRaodedt8LuFtpM/kB5yfgTjDOpP9qzuM86q7iP0/GkHg819V1dmV5B4XNWWbg9qulqAKyCuWpZPYmtYysAofjqDKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMAG24Itcs4wnNW9FHoFA7k6pyY+0rLOyPOD/NX95FY=;
 b=lWBItT30LLSTg5GcbyeCCkcrFyWKqmvtsIqFN71lHgSmTAcNGNMLQJY7lrYHeVWgJiKMIa+fAne0MQKVtvb3R/ZuLPWYca+50K/ivFh1FQlc7xX7i+qCfVeD128UBbyqqlODAz8+LQxBjpY3tA/0b/VX0KameNTpctOHVjRtKSs4bq83ULoAztvEthOvxYTqX7VbSWGD/z+BBXZ5pb0n6OhR700OST42b0oLWZ1+I7sWVwoNO0Osj2jQsaoyYYifJYzjSclg77pPEL8ljdea4BSYVb8zJTxR7T1Ge/xf6f6sD24+yJPyA3XHCD9y3qBVelOMRwVJ2GwmhOaqAdpA2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH0PR11MB8088.namprd11.prod.outlook.com (2603:10b6:610:184::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 03:33:49 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 03:33:47 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] oeqa/sdk/cases/autotools.py: fix host_sys value to handle multilib case
Date: Tue,  4 Nov 2025 11:33:29 +0800
Message-Id: <20251104033329.466996-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0205.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::6) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH0PR11MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: facf84b8-f7b7-4a27-a376-08de1b52f6b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PbQf/nFFyr5R++JwryQcg65MOdqjV7OLBDV5QSE3vEtif+hCXDXR+FoWFd5P?=
 =?us-ascii?Q?mSKBaeMV3wimWypMqTTR6BVxV7AuDhFXgq4h5l8vjY2ylXQARdF/DEdj0Z2K?=
 =?us-ascii?Q?lVb4dz0WVdtXKknDD3IdDx9WpVRJG9V+51Fo2gNxBnTX5cOwKZL9qzR2/Ye1?=
 =?us-ascii?Q?7kE+IIVpvdQKhe+Vv3RIKXtlKjwxli62gH/rne/Q8doM4w8FnXikwWEJT+A1?=
 =?us-ascii?Q?1O6uc8fEFrtFDsIesbIj+nyc1YUA5AOnH74vTAO84cQ9t92UdW6jHmj3EpDa?=
 =?us-ascii?Q?RxaqlD2lDdP/bqsiS3vf/bEpTF3Qa3TdRLphWPVjneN/7jlQdAQ32uRb8ARp?=
 =?us-ascii?Q?2YejL9p5No1ZQsgSQB7CZi7wb21T7c3ip4QxQQXgQoy6MXo+Kzsln+oxnoGt?=
 =?us-ascii?Q?oQ9l3FQd5ccREgO5ML1+SXAAf2+JzpuJxRbiUf8kekLtTFop2Q4ehKm84jMZ?=
 =?us-ascii?Q?GPCvRhf8mowYE93yI0IXVy/M9qRtWqeDAPtWuYbRrPeYo/lCztkGA3yik/8z?=
 =?us-ascii?Q?+X0SkZi5yxbAOgsg9OhIbrJyRbaYOSS7sF9iI4mSiuOnWwexq1+vDwsYg8S4?=
 =?us-ascii?Q?rLJgai7YdIQPlLNdQf8bmsN5runMEGk9Bo2B6R2vn3SSNJ7IuDe0U6bcTrBj?=
 =?us-ascii?Q?1Uanq9Ap0olT2PrsTI6GTUFq66o/k0ohCdJVk7qFim2cgRKr/RuUbipxZ3je?=
 =?us-ascii?Q?uXQGwi5HiOmdMmcn1v9dwJR/qCArf4hNXq0w71cy+45uGJ0aZHv7jXFwk2XV?=
 =?us-ascii?Q?5iHF91PMrUTZaf1wikBUvqprn6m0I/NVdz/JUB2PznChDlP6pMBg5rWxve8r?=
 =?us-ascii?Q?M3T3UWpCWG4mSzykxVRF1kdIyB9aRCliDnLnMew9mKNtYtOo/Kjp6qEhAVD4?=
 =?us-ascii?Q?EsYvar4ne5yUiqDIKj4bLtwLm1/YcbfxIOMYCGg59rH6c2NEu9SlyFO/2XCF?=
 =?us-ascii?Q?wosXjp4LQv8dKYZo+qK211194Eqae+vnbaPTwvUyQnNjepNu9h+eKLE6C+ts?=
 =?us-ascii?Q?NOS4MaaLcoQ2OVBVqMAB9MRii/XD1azCJOYhC/FL2Nna1+55zKkkz1h+KV82?=
 =?us-ascii?Q?+haIN528dZj5R3fzAeW9piylKHoCNacCN4Y8dzcK/xn5zWtKLhK3aJuK+xPC?=
 =?us-ascii?Q?F/F3w6Gwlpz0+0E1mttQ1UNZ89vsih7G0ZSGqwOmedp/aEmJMU5nba/xwPxk?=
 =?us-ascii?Q?uxxe2gkP9N7T5zXfqYChH5U6jZaPtr7VBayO/4TQw0aNdjkwFLgrHV7UC+4C?=
 =?us-ascii?Q?uhYoewmGorC9Jn7RQ0+Kf3hEnBA98htcIEim8IP1p2Yg3XXdUqWbfl2MohJq?=
 =?us-ascii?Q?3C12ZySFxdZAkaeV2Qy2ZLZwNelYYnxp4b4kR9EtMyTEdeu5ngmCP9eJr1ZR?=
 =?us-ascii?Q?pfYhis2kXbWmDXWEu4TiNjV/A5dv1F2wKjNJ1Bw6RoAQsRznDQgm7t6KFyHW?=
 =?us-ascii?Q?iyLzXmTYEdNXTI/NAKnWScQJdOjYVMOJGmbNRZ/d3SuePrC80xzcHZ/HwL83?=
 =?us-ascii?Q?wM8PQwhXQ9UPsl7EtKqmMa2Nw0jbIqDQx+13?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eJW+DnB9zPSJMbl1lnwY0gOmlZ6kqLNuvsER+XfNDRglD74NBeTo27iSzZ6p?=
 =?us-ascii?Q?pA1tSwWnHqgc2n6hKSGc9yCGUdG1t1L7Gm8yqBWxwqwNrmcwcpbuGV8TYKm0?=
 =?us-ascii?Q?qh+jWyLvFKnOM7AEwF6E8RIzuP9XYq7P9y10gx4liKkQMwVpGTkdXorLXqH9?=
 =?us-ascii?Q?6yofHhzsjVt4iHn3nVjhwscRZkvNVi5DUEtMRAGWWXrLrk42YnRamLj3ozqu?=
 =?us-ascii?Q?ctvigDmuasnQGYYJvbAkVyK2RLPk8mYRt6pQRinLNVdlUkDw5JtWi3e7GuXY?=
 =?us-ascii?Q?jrL5tNRHNz/oz3Qj+PrZjqiBMKMuJIQp9PfBj1hUdo3x3ZhafkmrKUODYoA5?=
 =?us-ascii?Q?3b4ltktWELvMufbcL7bogZLAbedblUm8xiF5rsYwNLk49cbWo/fP0t/P6e2H?=
 =?us-ascii?Q?UMmDabnbr92dihomX0joHRblS1zh/G3npTLEGryoeY3jlN4TBMZpsV26niEC?=
 =?us-ascii?Q?p7GWdSSX0zMnnfP0IEM3boRpKrD250bG+u854eQuOVK8T8N950snpHvblhCO?=
 =?us-ascii?Q?Y3SKNBBH8DXPgUbQuWQae/sMrDVjgft/NH9sz7X5INdCtlREexVNPcX8P+mf?=
 =?us-ascii?Q?0FVhncmZ14WAf9W9ZTN2O2W7K4rH22a4KkKLWVa0qT21mhj0pwsPX9IOvg7g?=
 =?us-ascii?Q?fM6AjVNgiPdR+Vn+B02JtFjJRyhxsnALWl9VxX3HRYYIreLzDfG5rvB3cccf?=
 =?us-ascii?Q?hOmyf1MbSsrJZyl5OSvdmvhQ8sgAN5zNpQNHrS81C0srirReCIK6/kSRTDqo?=
 =?us-ascii?Q?zZmrzgLyc5Nr5h8DTCNJq02xcm073DdQsmLMnokYZhbsTxF2vb8cvYZXDOuC?=
 =?us-ascii?Q?MoIS7xZ7plDHYFBedbDY2vxqUBRd4IKyMsiopSE4IZ0Q3ZjELXmo9/ZpygYM?=
 =?us-ascii?Q?LJxW4jGXOFHfXoITaq0ZjvqR2GeOhU60V5SGp97lS5ih02E6BJs/TtFKxVPj?=
 =?us-ascii?Q?S8XcbsyOkd0J1RcEPgcveOxoq3uW0QHjMDIaUIPGvmARLN9obhFaA2ta1d+L?=
 =?us-ascii?Q?7dB0s959moZPpw0FJ6VBjZq01nFZPInWeJAhzDMRiwpJxWouKK+v4E2rbjcq?=
 =?us-ascii?Q?tQmh1OPkYYjaLqKz2xKFOut4oSms3cgukbDYASdZSsKclfHPdLuiJ6sYW0pm?=
 =?us-ascii?Q?D6dvcb07gy7vjtCSDy68a8wWzNJc0xCeHGOtkJm40+q4Ls4aHcPim1F2uAUp?=
 =?us-ascii?Q?T4Ty6fgJrm5CnWynGmYdfQ6GRDNMREAoXL5tNTazNLCLryMUIMI16nX66HZF?=
 =?us-ascii?Q?TfKw+LQoQajq964MG5zVk317hKgxub8vjf+LgCmbs/Xli4OSjVWk3Fn/jw8R?=
 =?us-ascii?Q?7KtRv2JorXwg07VyBqTVrTuC2JoLY3nyXwYhsR1sQwnbE2yWH38IDhftR8Jc?=
 =?us-ascii?Q?/haj9whaB1H96QrMkdBEKHMsXA5ZmxXtE4ErL7zt+czTnZ2AUNYpUesMVyXN?=
 =?us-ascii?Q?79RjrNr9yI5+q0zuIBtypbvUQ59DxXk0wd/FPD9TD4Hy1tHyN6jrn5yNQoTC?=
 =?us-ascii?Q?MfYB/bkDGSv+E2OowW98gvtUjaXG75jLfZVNhaldGNsLizVtIIuVdiFICsDl?=
 =?us-ascii?Q?q2z3RxHmM1jVOsGdY7HzYGouX9212Ao8mtx1l2bO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: facf84b8-f7b7-4a27-a376-08de1b52f6b9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 03:33:47.5711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxYhY4y4vLQVKGp5gR7f+L5yftvbu07AYIEY/sNQFARY8W3su6kYM1fybn4bGZ2SIgGIVV8XlVHT3a6KYzBr0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8088
X-Proofpoint-ORIG-GUID: fzgPvycf5rvFJ0O_2WxTtQmRnnUaFSed
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDAyNyBTYWx0ZWRfXxA+Zi2eWfQpb
 WsB2qzTEmZ6szyNvAdMvYVsamPO7PUFnNceh2Gn2aDLvk/b5eFcPp4xMRQK0TFr8tKoJzbezFzp
 ZP49E5T8pWdzs3dkkUIaA1In43ud/F1Ony8P493GbahcDbMx8nvMN0ZDI0rATRlaNpexqwkWPqu
 +IU+AT4WnZvvoYOc3oSgkv0blSz5dAsTHK3T5+KqtWL9Vf3BVmjO6xPvNup3fH8FHx8GpqLzws5
 MAUpgEc77L9QtdGc7UOoRam4ke22YlLkQtNSCaDvnPErtFK9pzpym6HxzkotmCZ8CPacjzHbIEy
 +HCpQz0KP9YLBkT9XJiS9ldOt3OmxnhLr7KC4K61VkJxWTO+reVKcYUiKC9pB3a3Hk4Moj6VwNz
 4bT9AE8Tz4DDrF1dOZ3ZEBm+pymlNQ==
X-Proofpoint-GUID: fzgPvycf5rvFJ0O_2WxTtQmRnnUaFSed
X-Authority-Analysis: v=2.4 cv=BeTVE7t2 c=1 sm=1 tr=0 ts=69097420 cx=c_pps
 a=6APEVz27trGWNYyenu7PEA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=20T5EwSBLcwP3yZ6S7MA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 03:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225705

From: Chen Qi <Qi.Chen@windriver.com>

For now, testsdk always fails for multilib. This could be reproduced
by the following steps:

  1. Add to local.conf:
     OE_FRAGMENTS += "machine/qemux86-64 distro/poky"
     OE_FRAGMENTS += "core/yocto-autobuilder/multilib-x86-lib32"
     IMAGE_CLASSES += "testsdk"
  2. bitbake core-image-minimal -c populate_sdk && \
     bitbake core-image-minimal -c testsdk

This is because in case of multilib, HOST_SYS value is not correct.

So switch to use CONFIGURE_FLAGS environment variable to extract
the host_sys value.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/sdk/cases/autotools.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/cases/autotools.py b/meta/lib/oeqa/sdk/cases/autotools.py
index ecafafa7d6..b9dd125294 100644
--- a/meta/lib/oeqa/sdk/cases/autotools.py
+++ b/meta/lib/oeqa/sdk/cases/autotools.py
@@ -43,7 +43,8 @@ class AutotoolsTest(OESDKTestCase):
 
             # Check that configure detected the target correctly
             with open(os.path.join(opts["build"], "config.log")) as f:
-                host_sys = self.td["HOST_SYS"]
+                configure_flags= self._run("echo $CONFIGURE_FLAGS")
+                host_sys = configure_flags.split("--host=")[1].split()[0]
                 self.assertIn(f"host_alias='{host_sys}'\n", f.readlines())
 
             self._run("cd {build} && make CFLAGS='-std=gnu17 -Dbool=int -Dtrue=1 -Dfalse=0 -Wno-error=implicit-function-declaration' {parallel_make}".format(**opts))
-- 
2.34.1


