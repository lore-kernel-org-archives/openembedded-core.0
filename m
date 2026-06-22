Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC5FFCDB46B
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 23:04:04 +0000 (UTC)
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com [205.220.173.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9330.1782169443802897765
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 16:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keysight.com header.s=ppfeb2020 header.b=OZUytt5b;
 dkim=pass header.i=@keysight.com header.s=selector1 header.b=henGAbE+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.173.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187216.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MLwKMY2933715
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 16:04:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppfeb2020; bh=Onhi2fgLG0rVuEmfHS3fJz
	WVE8wI8nR5d2IvVLx8EcM=; b=OZUytt5bvfzgSNsoHQEm6LMAC9KOh1pABNXbnb
	7cQdcrMY4bviPy+SmMSuvWGn2tRb4ZxGjHATyKPvGCak+nNC6TSHS9wFq0LMYEYo
	79VEDWG9AINpgXckvT3UK1DxTxPZ6Oq4BhC83Z3TaT0xHtMXhRho1ehFwmtcwgRR
	3PBWHyRGPQYoU/6V50u7qDcaJixG0uf6o9m7lY2HvdU2Myafaykh4EyLtL7xiCAR
	C1yUkPlqsgsRDCMQbEEn+Ld6FK12K43v/+6vGMcT4hN2flqSXYsbRUfmfgOHcjwV
	9Xjfjuj8SQkp1FzFkD1TjMo+ILv1Md8uT4Zh0YmvJWyRmWNw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011053.outbound.protection.outlook.com [52.101.52.53])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 4ey9cmgyg8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 16:04:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FcaMnhEg9NC+TsWKFVGsYHeV8b8yoji37j59XK2rIuUJqRuvsFWMSgcBv0u4sjOVjFg38CTBiNcn9vCn6FWxxw68OnphmeisyNnrP+v5pz13i33wJ1WFMbAnyvFVVC6gWETRBpnBamg8+IBc3d+cb9Km0JJimxz0q3aPw27U4twael4LUj7yUG64fL3W5kA6oorwq6HB/q0XQiUIUqPH+hh07irHlFyvvPsicTb7tpeaBkGadj/D3S/m+unopeJfSTr65sXu9jrg/4r7KbkJfaiDXGGjBv49jmAnoNDRZQQr8F926i+LpPnWzGi81fUA7vX78OVmSZU+hRJ71zxK6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Onhi2fgLG0rVuEmfHS3fJzWVE8wI8nR5d2IvVLx8EcM=;
 b=EGSWxF/EOpS/e0tO9tNkkFx20Vx91vf+ya245hCvd2aNSZLlXQLCcyzzLQVZehN7UBWi52p2XJ/6p0jc5yFenk7AlyCv/W2wR8AkJPGy+2O869gTe/xwK7L3T1UVcOW7Bg4WHjQhq82VUXJ8HEx/8IXdTahaSI24A7ESwnrBxd+a0jbnACtDEw7lW4xYTDwWvcIcJVPmoCBVWDpgj6jT+Ouka1cyQhfyhCtOadnhveTJhCcDQZzu3ipMhEyGcrbKp2JFYM+otdxfh6nqSLUe9QhIJFnUvjZRi4x7UD0RdcKF137FC6Clrjvjy5fGrjk2OBYKJ6l2Z4PrObFw4zJbFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Onhi2fgLG0rVuEmfHS3fJzWVE8wI8nR5d2IvVLx8EcM=;
 b=henGAbE+ENFfmqt8IqTzpdIhfiuj8t6JEvOquLrgvhIYL/FlK4K6ajclG89JTa+OdRK5Mm1Exx7JqQs4BaixrNEb3XQ6cTSc8Oa5G6YSYMmVLt+8uoaD+WHFSjJrIncIZsjEqTYam4QjG7YiLk2Z+3cuKsVT+a9OG8u+9SsoZDM=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by SA1PR17MB5717.namprd17.prod.outlook.com (2603:10b6:806:1cc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 23:04:00 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::7052:ef05:ccc9:d9c2%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 23:04:00 +0000
From: John Ripple <john.ripple@keysight.com>
To: openembedded-core@lists.openembedded.org
Cc: John Ripple <john.ripple@keysight.com>
Subject: [meta][PATCH v3 1/2] go-vendor.bbclass: Unpack into BP for destsuffix
Date: Mon, 22 Jun 2026 17:03:29 -0600
Message-ID: <20260622230331.3754496-1-john.ripple@keysight.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5P221CA0142.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:6a::17) To PH7PR17MB6130.namprd17.prod.outlook.com
 (2603:10b6:510:1f5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR17MB6130:EE_|SA1PR17MB5717:EE_
X-MS-Office365-Filtering-Correlation-Id: effda85c-b8ea-479c-12c1-08ded0b28bd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	pkgjN/tWio2pceq74Xhxalhc7oNfsCbygbIZ4SQ2Nv0J5x7EsVxBDE6KKrCuVNWxcVT7VVcR6DGt2aEZtYR0cF7iiLyj1HuFlTWHtxuXnSP02otilD1S3didH6wBrA3M46FhHhaRkjKavur2NjnYiV6KA+MEJ2wrLn0iVyy/XkedgYCvh+p51wMlXBHAaYtIjW6R62GM2OtIDaRStqZcoa35Yrn7GRDCBoSNQwEttGsEcXLvKxjni+oXGCv/VXVqAvHqFpWj9oKGkuam/t2lVfeBqnD9Qqy6BhAfu02R6qo1AKJMI+0D76yAP08zWpmx+hYMZ5BBW1+R5glQL78kuxemDr3urK2FfQgA+RONS56LikdfuX0mfRNj9gu5nLcDEtXHJlaIlmPvufqBUxhdwrmqoUxj4iGg6cmzcBcDaXmydEwcEmQ8YULxp51+42hkyX/3m6fxz4YOlqQcLnd77we+Q8JO3iwrybrYfOreTy0YCiZbeeINQj6ZzDNeU2N/Zb5j/9tXECvGb5BY+wlM7MOsj/CrlqAJJZv8WQumDROIg1sbhJusKX0iJC3XQMMRxnPlF7SN2DfYu4T5gPonojib4K7ckU0TcuQLL72rFUp9O4DAH5GfbmDN/wlpfMVefxYKcM3nU3lcdSMGLikBUTRGJTK2mnELOCBRmK+W0pY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3e0TUsd71Yr47NgwZIQ/7vq3HDTeYWuog1GeSHPKlPAhTnQnODZeV+9ZfJuw?=
 =?us-ascii?Q?pMG/DSFV0yP5puOrsDFoBKI2oZfi4PBh0RCHwSn9mvgKNyjLlN2KgvMsKnn8?=
 =?us-ascii?Q?OB6VmXc1AYKKBKomVK4Ws1yb3fDm0GRL4hxvcyahsXtG8Onyz0fxrpmv7KJP?=
 =?us-ascii?Q?6O9w62lxaqTAVLFwNPOzScPZo5gsmOcga11+SLzBIYUiICPjXEGVk9p+UlO3?=
 =?us-ascii?Q?r8qX4P8neY8/sUy0bqcMop45mWevzianVz0ZTrhLekxtl6//k5YEz2+NjeTZ?=
 =?us-ascii?Q?8XcGWstUrV//p1lpikUFjzBe5SjZXWzP6cmBD8x8GQvYE1dgOSB8SXifuEtK?=
 =?us-ascii?Q?MOhnvO37PMgysmG5Hteeixg8qfsGhUalhBUZEi0ydV1PsS8xmsmnu2Ge8v0m?=
 =?us-ascii?Q?6r5URTh5mjnJqyxQzwTxQxLfrTe098tQyFIzwk4N6RGdXubVTC5eBItiAASu?=
 =?us-ascii?Q?X7UfhrubWk4E7E9EOPQEydN04gWOqvykDfyeEiN91qj0PUl5vjkGRWbqTUVT?=
 =?us-ascii?Q?vElRvo2RoL8QA51QBMDqdVAmywW/H59DsOBcjOhhTyS593EL4hSoL/+8OpKr?=
 =?us-ascii?Q?YrTweVsbbHJFQBZ6dm1L3voNQZUkao7b/dhfYnfl1iiyB/F53kfGTw9mZcty?=
 =?us-ascii?Q?ncv9qPieHLSxJtj2V21pCWzDTCmfqjQumjcYXIDv0vrPsbDze+Nzr5zdnwgM?=
 =?us-ascii?Q?9BL357O54KOkpFYBdOQv+VBkIc19KseIEOciLZFe8mPnXZ7jFTswTy/kT+4G?=
 =?us-ascii?Q?r/mEv2429Gh9OgCU0toQwK4GWvS9MjyvNgSS5BF0dwAO+ctAn+swpYQUy5Ph?=
 =?us-ascii?Q?3+/ZRvQjVHUQg+kTwCI9hWKFAiKJAnQoS7IFI59Tm2rBFkKDFyE479FEZF0A?=
 =?us-ascii?Q?O5hGLorM+zoYgm3pt/aUaq6OJrkI1gqfnCkYgtFIFODGm+QmGR/sYMervzsx?=
 =?us-ascii?Q?1F8CTr4TprgAmXJgJlivhDyzN/tO71bJNOgUoQctGWcni8SzbOH3lqpN5fhf?=
 =?us-ascii?Q?A6bH6Hb7JhwuCn/WLV2hpMXFO6+CK1/OCK0xTSE7/UN2yj6qCT3TIL6/qFDI?=
 =?us-ascii?Q?3tfYO3n4WcTNZW42eA1fMn1FVuNga6Yb4Gtof9OGx9MupW+ncnhlXideAoxR?=
 =?us-ascii?Q?Lu8btajXwzHo/H13QJVLaOhS2EqP745DaYfuTsFL7u37ml4y1Zu+v/m3CQzB?=
 =?us-ascii?Q?4cHMX3STJCrN8cGx9a8D3P+ap8q2Ay4qZrtDb1czkXGj0pTa76FC18gUiFbF?=
 =?us-ascii?Q?M3xRSU7d3IroNn6urn2+OaXi0QwvHurKW8/icU3AKRIiQ3KOkFx4S/AzwDtf?=
 =?us-ascii?Q?oxgotlMwJj5vUzjIBCj4c+x5ukL4+vikHwOfgW5FFXbQ3rznXevrNO51iDNj?=
 =?us-ascii?Q?2Ld4zYR2VzDEO6miFNBilWJq1v3sKs/EPyu/aO/2xdAyJV7cSDUM2fRarqV9?=
 =?us-ascii?Q?InGiyTorvWGYHTmKCgU48BB8EIS7NvwgU37qvKEp36ghNvhGk1s9NE091Oio?=
 =?us-ascii?Q?qjSgLSqejc2bUkN6Cby5ZtS4UKcQgQdY8W8DxUcK9XMY4e9ZmyVcPEpvt5U5?=
 =?us-ascii?Q?VOZJWUGbxsEiZIwooTjW5j2mDjq7M75dIzJz9am4LrVy8d3e4usuIPDj+XUD?=
 =?us-ascii?Q?aQcZOos5BM0VesOkAV2ZXbM9uhBRVdVw8Q+Ut2eTbYfAlmH+47pvDj42rHGo?=
 =?us-ascii?Q?TZU5fa5bg2NL++QmZiOzZlYxmHRg1hDvuc5xxAknOZ1nmyoNv7nPavevQr9E?=
 =?us-ascii?Q?W5G37sm8Fg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	VXs4vRz3JrU5J4AQEfwu16cSR0FiLLHYomyqEFgWWt5Xs0QDaIKqfhxkRw17yW6CRUXlRlu8EygSG40WTUnviX57wZ/p5HlaSlHEOAM0+N0c4u/8B2vtvi5xWHdb23kGgqYOWdQHGoOBtx6grev6a+OVNAyd0y+wNqoo1c+6Q6T5iVpiifldvSTE7qtec65zhj6ftWxPInMJPtCCvAkw/HRvUjtlKeIfjAO8hoiYOT7afTE6VBaW/GUMoIfUK6nYFd9m+g50BDZfM0R1kLLiuK1RQ4wGCho8MoxkVfqBpFm5g1h95jN/i0MucQSUP1wUufnQQ/51lNw5xUMbnyoEuQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	pmZVOBrnthwkwVIcD70L20uJ2WILjJYdNYnN5Pdpg7sNN6umI0aWnPK/ARyUrQP6YBHAJkwmcaVrbXquc3dsjeWSGalZ1zcHASqsKHQMzeQNdsD6IjX8lMzyAH8VKeKV9Ls4FIIPplSfjIdlL9skf7dgoMRlHUmQC6/HPb1HZNVYZiLq3Kpgf/qjQtLc7doDBcJGcJWQqMYD5Ry5e55LKCP3NH6KuS2a4yog4k/Vlwlqp25Kk9f7+0uDuvjP1Qlm/e7nU21Z/b5EQcCR8RW6CpYm+bJ2wtKA3n9nGHWlt1/flDdoDOoEJ52AZocU58h3XI5vfLuEz5+WuVeGQIr0aoyajIn8BM8mOxZyTYxHuXEojLwTPVKHAS3WxCtG/72JPWBdQJIBvJK4wHAzzsdHaegVxkfEb1Dp6JsSxyeD0pZlaqtuRhzWbU7qgTFMJRN1jn9Y7B5lZMJPcfxa1meoAg1D4x8raqOAhulMjtkziZIbw3TYY8Mtg2ddrMUj6tBy1MQsXnjzgYt7MlWXdrVubxbM8Jk+gmcWgxg8aWqTMMdM/YfPGf2ksP8H56Gb1fpWoF0KosxLeigYUlo5WVFvlKOo5BRu9zZlks0qLHnNWHa7eYWqSkLGymqKjaYn4Bo9
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-Network-Message-Id: effda85c-b8ea-479c-12c1-08ded0b28bd6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 23:04:00.3639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1FF5UVkH3JgdsIohIkEF2V4RTp3iMpNVH9IgAtR+rN43p96iWvKs4eRGF8jy53OOX9hJoM+WBguNgdwwixjium1B4X/BVidEdt7ECMUx00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR17MB5717
X-Proofpoint-GUID: CPhmXU2a8N6Q2Il9xFKrr_ioN4hiZTy-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDIyMiBTYWx0ZWRfXw3HHBI8oyNvr
 6ze7rT7fXphqru7W4u1Uvxp4XqpTeHDMzZyUFQj+CL7ZYHl48K2nw0dSKKL+BvN0x2lM8n151sL
 Pc7HB3Cz2FyUskozVVNgpwrW/wDHhrK3h7RfZh+JRuYwM6LYsMWh
X-Proofpoint-ORIG-GUID: CPhmXU2a8N6Q2Il9xFKrr_ioN4hiZTy-
X-Authority-Analysis: v=2.4 cv=RY2gzVtv c=1 sm=1 tr=0 ts=6a39bf62 cx=c_pps
 a=H9d2Io+6O/etw3jU54J+0Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=vu2TTH8h0NUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FLoIbiw2ZNY34kqd41oa:22 a=ylRlBDd5bHdllK8znExr:22
 a=F6MVbVVLAAAA:8 a=RHezoNOrqTe-SeoOf3QA:9 a=6mxfPxaA-CAxv1z-Kq-J:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDIyMiBTYWx0ZWRfX1J/GVpOq+dq4
 cPn7WlvLxUKZ6dLLs2bhsotNEFQmKftZG6T910H68mneiU0K/D00LdB/NxjrOCnQORMY555Ob3M
 ROrC5oaXL+QjaiLVA6WnHZdILHzteh9Zub+WCUN5WrrAhFF7ZV+Zq5deJMJc98Vlgz+Q+SDJO1T
 dSfqhIXpAaudlGTK+i2A+kcJ+8ZDSXgktVDaBnZF53XHU2VeHnhG+pSwudDnf1vAuajE5fWyTd4
 IpxLacxVHM2zldhEKP7RJf+80YEiD5xONON+CymYKwHf90fwwhMBZxMve1PaqwH/NwRaLAY39Rz
 QawdW0zbcbXv1IjzOrIunG3/VDSP9ttfdWUrrVHf9NA0k5ed1GtN6HM9cK8TjXwxWQZJ/eoNQ6n
 QSK2QlXD+GNOQslQ0wzMnbLU0I+/fnhVajh7sejC7o9uDuMORjIMoXEHFwDCgXJ9foPvyhlF5Ea
 46yH2I8jbvd3L1HhdnQ==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11825
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220222
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 23:04:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239322

The go-vendor class has a hardcoded destsuffix variable used to unpack
sources fetched with the go_src_uri function. This was causing a conflict
with insane.bbclass which prohibts setting S = "${UNPACKDIR}/git" which
was needed to find the vendored sources in the hardcoded location.
Changing this unpack location to use the standard base package name (BP)
fixes the previous issue and no longer requires manually setting S in the
recipes that use go-vendor.

Signed-off-by: John Ripple <john.ripple@keysight.com>
---
 meta/classes/go-vendor.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index 6ec6178add..f854d14bdf 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -19,7 +19,7 @@ inherit go-mod
 def go_src_uri(repo, version, path=None, subdir=None, \
                 vcs='git', replaces=None, pathmajor=None):
 
-    destsuffix = "git/src/import/vendor.fetch"
+    destsuffix = "${BP}/src/import/vendor.fetch"
     module_path = repo if not path else path
 
     src_uri = "{}://{};name={}".format(vcs, repo, module_path.replace('/', '.'))
@@ -58,7 +58,8 @@ python do_go_vendor() {
     if not src_uri:
         bb.fatal("SRC_URI is empty")
 
-    default_destsuffix = "git/src/import/vendor.fetch"
+    base_package = d.getVar('BP')
+    default_destsuffix = "{}/src/import/vendor.fetch".format(base_package)
     fetcher = bb.fetch2.Fetch(src_uri, d)
     go_import = d.getVar('GO_IMPORT')
     source_dir = d.getVar('S')

