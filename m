Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF52C982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:30:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47019.1789990198679753296
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aBonn4c3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=37244a7a36=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAgUk81584195
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 11:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Ct0Ol6Ovl
	DKAZzwq+TknE8o6gYZmnpXvLsAtuqna1tc=; b=aBonn4c3n1DK9uGljzPkE2jub
	fWarky6kuSvimcEi3FHbomdQt7RcgFWVjec7DSwEgasH8JTX6+OsSRD+jffmvF4I
	WoStlvM9ORzJ8bLskhhor6LcPMFRU5HSkZX0fPIx9t1trzravJtdTljI/Dp9CMhN
	5CCOT6ER0qobvWzarM7tmX7DZjh/8BYsD+e5i05NMW78C7zd2rkHFhOHUxqb7b5h
	Ky9/04zfs4QoQYi/8FA0FWPC+EqGUHA4EJbNYeqlNMExxw2TrhJs6OFvyZFenGnf
	JaDy6BNA6TkpqFaQo9kTCgEoKPQqVVoUXJj+qiXakCrOCmh7ROL1Z/DyXrcHg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022092.outbound.protection.outlook.com [40.107.209.92])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gsfkyagm8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Sep 2026 11:29:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ub73zaWde9FD8dDXUyOCvxCNnekuVa3SxpIMRE8CJCfAClAv9vFM2DGJ3fNCWwTpM//D3tZmzeJUuC1F2SCPZKFZa4T9lRy+gs1l1YY5qWuFOTq22O+6e55cQpKSOvmH4Kgi9mX3cSW5h0CYM6MgJBKJE0L52E4QALDP1psAiDpFcP1oE8ZPo6qcvXIRaFRL7gefQjm/sptThjRakBYhhasMdd/2wdaG+IhzuAhQu33H/Uam0Z2LHzpgHR+9IzmzdwfAGBzb1U+dN4e2JnslnRGA8yKqX8W0IwDC91im4igQQRgX0flCCtMbNZxVMpmUYfpo4jFQCBI6TURVTJ46qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ct0Ol6OvlDKAZzwq+TknE8o6gYZmnpXvLsAtuqna1tc=;
 b=xBI4fspuqtzwRNobNrEHaRqrmYzsoUFpVBhYQmnuNUpLEKOiY21Fq6kbxy2F6AEsuZNEHgWOdYqjF+OPG/rn4IC27p14QjmT5JO1ANtJpLoWwFuqcBXUXaE6MWk5aQoHhdaDzO+8lgQ5pQvj9/K4qy5KNfvj4FTE+v8WeqDhnMqTqfopQ4ON6n+dn7snkTUN+KD34BR29mis18KTqQkE/YMh446kFE2xyGp0024M7TCQ24TYae85dnx3JCiZAppZK60EOJBXS+0drd5GNui5ut4t5QCw7mH2/FkeqL0EPMh2yoTT3/R81QD0lxubX8E8vffrnXxQpiCUVrreOGq73A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS4PR11MB651330.namprd11.prod.outlook.com (2603:10b6:8:50a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 11:29:47 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%3]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 11:29:47 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: tgamblin@baylibre.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH] qemuriscv.inc: default to fw_dynamic.elf as QEMU BIOS
Date: Mon, 21 Sep 2026 04:29:20 -0700
Message-ID: <20260921112920.3040934-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::30) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS4PR11MB651330:EE_
X-MS-Office365-Filtering-Correlation-Id: b058be68-f725-47cd-d1a3-08df17d3a452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|11063799006|56012099006|10067099003|38350700014|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ot1o5lnOxEGqwRpc0D93sDBhtjwoMANeYsuyIcWD7lFKOTDM9ODv21r3ixsOEcM3iEZQ8TekGuMVj5Ch+i6/Cw7V+E4fs2oWnkSUrxX9e3TG9TS27W9PhQaPmklC1nQEzs1eI2t5X+YwHkpcOHymN6TSVbxwkE37rOn2fBKFFBsce5po7R5TnuJ5AhUQ2+a2o+CKWIkgSNnIBFjNQ0EbUWyShpqxWkuVIM4/a/Tk46Ku2c0T844OlsO5Gd8OP/5d7HI7rsfpAa9jXB+KRtOtU9hK6l6B9fv+EOs/MEKxOdYNh6NTIo21GhSixBZhGDEmiiy9rlaZ2Dm8d1PuBKD5RfcKusnOmnZ2G3LTbsafcyckJktHEHSptemmGZnksS2nLL+BbN99hLnee5L9rxduszs25XCCIWadsJ039mVmhRPSoHrgV7w1KeC9BXio6i596X06B//4X0k2HtiGSkU8kPdQ7MsnHdGjI6SSO99WLpGINPOQ8Ylyt852MfOcQe1JUHKcX6oOQVMBFKcJn+MI7qKiEJW4kyMxlukQCI5/Hoo0tjJyBzOTEyTz8gBnhxlLk8G2sXQBTDo2vANHihDk2HxkO+9xo1BjgRepEwLYZIaPhKRa5snmESufYDKBRKPSBeGQVwwPUYhVWc1vIPHH+P6oSn/9yz2zutLJTAnCBac=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(38350700014)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dtqPetsz1iGVnrp8O7J17yoZpGzUVnVHr69ImwyIBXgCLBjAjfvGkf8TTlDY?=
 =?us-ascii?Q?QocNSjtsKVW5SRLILzxCJ9OUymqUpexnSqV3OiynSZTmRot+ymD0toQyKkov?=
 =?us-ascii?Q?p6q5CqlDEXNyFD6gWhiJs0U6zGADXq4DKYwZ1vItBbzlGOial8M+dnMKuV20?=
 =?us-ascii?Q?0fNEGlsf7jcx3CeQs8nG2KbSA6CNAEeoC0YA+Rb3MbSEv1UwoF0WxnduMy7k?=
 =?us-ascii?Q?CsNMPddb7LDk53AdMCuZUiB0/zU0IeK5hem7SkttfWQERAbEXaLZZyiRKEgn?=
 =?us-ascii?Q?nBQzzEV+KRR/Z04LsdbLvLI3m3pWawPUbd/DX4elf5CO5pCMRUKO0FyYEacN?=
 =?us-ascii?Q?dJr9CEq+VaheahNejehLqpzw6E4wHg51y/tYmS3Z8t4KFsdw7knWSTkHgmfY?=
 =?us-ascii?Q?kGqBIvB/2Z4O1EMd+mlRsMhFnI1m937fHpa/MF9oRzZZOvcDvVBSfltjTUNl?=
 =?us-ascii?Q?EWtHYnAcybqoTrW3efosk6XhKfj0I9pHc3P6chK+pUVAqkmFHs5f8S6y9hyC?=
 =?us-ascii?Q?f6prw/l0ORSLWa6/djS2lxNr4tIqOYa2xVtl6FdhmfNj6QHlywWrpTm1fnqP?=
 =?us-ascii?Q?HcwSCEQsd9ZXnNuIYmp5EBE1parqE8cKYWd5HCEhC9vPaVwdlsvF3bl/Oi47?=
 =?us-ascii?Q?vPsBtHb12WsrZVA505LoIWo35dcnHcp0winAQRhITTcvWH5z9SwuoIjF/OxA?=
 =?us-ascii?Q?4VyfdGVn5MVO2F2tDgZqMW9jkf4mroxWG/dNiGhJWZz8Qk3A0wkjq2W3MzNU?=
 =?us-ascii?Q?/DyYL0o7psrY8Jiiu6hfCH/DOiI/s1TIxguHYTifQOUJfCRUbkLFfbqugK/o?=
 =?us-ascii?Q?JDV4Hej1x9iYQyM/k/MWtSlzY0vHgChg3hReQ+1yoMJd4f+EKDEqYBHGIpDX?=
 =?us-ascii?Q?m4rGGiACcpm/4EJkYLxBQXBRmUkPJpVya9ghk/ks/W3F7JO3XnkZNrhdZvIE?=
 =?us-ascii?Q?MZraRpdDd9YmX2AkO1TUb2UP29dP4hAKW3WRO08Y2q+AH599+ODeS/pVfen+?=
 =?us-ascii?Q?YOeplJHIe9qV7cxy5i/UE9wxP8BI+VShsW4g8aE6bBQatFZSVwsowjURhWwc?=
 =?us-ascii?Q?y6d8zHC+K9CCBPdYG0D5RUEXQF91rGpobQJTB9dHXikEkSmjxpEC3QH6TI0w?=
 =?us-ascii?Q?Q7FooRdEO2YCneotkKIEAQBLianU3ofqrv3F56QXg28KleL76J+ze1yq8z50?=
 =?us-ascii?Q?zVgellhnRiNeEC0QeqVQZv86zOBgYf0aVwdF7Va38pBBhk2qc7Jhh9o+vayA?=
 =?us-ascii?Q?+KrrxeaNMft6QcX6LjfnCjslpoPwNaUcoDi4oB+u8Ae+tnGcmDtRJzGIV7SW?=
 =?us-ascii?Q?wgjwHRE5AMuQow5KT47OAnjq3uXfVXDz0G9HzDTmRVNZ8P2xjxLl/M8ql9W1?=
 =?us-ascii?Q?QWZ0ly7JkoxxcTNhh3a4kInyiAc80YCB0OIOh4ne+RyDSYE0d7zV0NRMwSHN?=
 =?us-ascii?Q?PJQFhsGAkHm9Sh+EYO2MXvK9UwX9YpdlDqY+HuhHGBeu+pxvIob/Xox7yxA8?=
 =?us-ascii?Q?ly5aNING2BGxOwzdt7TzSS8Bgruxq3CxGXeKw2+L+9mJEs+Ymc9HQoE/zFRw?=
 =?us-ascii?Q?oXDyE6mwJBtFGiR6ZnedQDXLLiQiFKNTqxwElAlVyysOgy6f58PKDDzykqFZ?=
 =?us-ascii?Q?C5mwdMITlMA5Pr/82N6SN8xsWH3ZjkDUG7QMyPL6zDOLn7sK8RKyJhjMAwHw?=
 =?us-ascii?Q?h+c1vwwOkI38rCKDoFy0EapcQk1h4885aGAOZY1uZu2651KFLVsVeW9SNhu1?=
 =?us-ascii?Q?WbCbM4RUNb5gzfG5a0s2mm8mwhdPDPo=3D?=
X-Exchange-RoutingPolicyChecked: 
	Z6GRI5H0PIH8AQs/TKWd7vlbSoiydZ+b8TL5h9zaD6Zy/tuRjdWCwJYw+xZwIxAKeC/M/T/PxnRjdxg4x/ywJUpdIbfE5qqha0HGaB35jbEZFg8R9lvAv7OeUB+RmsnqWiiAH4K1MJCBDni7yATSI1VIy3Bb4gkTG+IQvjCpn0NAI5h8IJFpx6w58iFr0XM4xwDdbixFwVFDOiiDKHkIesnd4yyAxUtZ6tz3uM7y4tXRNVzSem/PqB6aoXQ1zWS5CjqTjVQm8WXsi9EKyDm/ploBq12y1R9vq0xQg8BLTLK4HDjh2LAqPvZ+3NnLDTMtAEqDIQmmln+1zLIUfOgv5g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b058be68-f725-47cd-d1a3-08df17d3a452
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 11:29:47.4910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: asK59Ab6WAZnYh9TXJj8kfS0agHKwX5dlUGhaAQbnY8glRE6wqUJDti7oifqk7CckpVUImyN2hDtWXkzvaqUODO5gMd8lyfvM6CWOBRdBf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB651330
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=XI2l2ghE c=1 sm=1 tr=0 ts=6ab11535 cx=c_pps
 a=WAPH0R9l4PQqWEniwuyStg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=IpJZQVW2AAAA:8 a=weNUJIpGn5pap1sctJIA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE2NiBTYWx0ZWRfX8IBHBvgeAsMs
 VzjQxHO5JMzreDvmqiZ22vsGDdcQAyyIMk2JafnoHVJJs19dXoUwCV/bkhdVYY8QWjkOVkF44kk
 mk4/1GRwleJVBfM6bU2cGA8r4cQpWo7i/2v3miCOefVwecyTdJ3hTnfuzmSUg1iyLViPY5c8xsM
 o7x/+K88iHcM5IAAFfUMtTPQ/lDzvsbWHOpdrRZjXplk5Eqcdh0bH2v2O4U8/OFyV73+J4R9qyj
 nm3XqfJjxWMWvazFj6/O+eP99GD4e/Sy6KotC1UfqCxzb2yU7/CYhZ1HWU+wGe9Enet4KwwGak1
 0NVKNCvAzxcfwwmFxTNKBTOG8BGEAoYomxeCW7V8bnAFQRm/6haOY+FVAne9Yd0GIi/iZqdM0qQ
 i+LZ3i5WbmlTgvNTLDPeVCf9pb8XZyTnleahoJZBp85OTDlAKWryODOJ2SzvuhrW/gL0N1wtpre
 upn7UYHUZtw42zuGnAQ==
X-Proofpoint-ORIG-GUID: qeYMt1UtDZSgAjTBwYS5Jb8jPVGUAoVM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE2NiBTYWx0ZWRfXwkWFKCKMrFFf
 uEt9wohMZNbFaPONNgUHB5HMcc+7FwP9qqD8X3YZW/F5xp9CHGXV8FUWdvi+1T4t5EzBv0mAKuL
 dL77rfi3Vzb091eKWgFk+B/IlrswaHvNVxXT7ny6F1FrUmnlpdTy
X-Proofpoint-GUID: osKW2QvbO0S0UKcuvCxC9A88TQrWdqkk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210166
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 11:30:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246326

From: Harish Sadineni <Harish.Sadineni@windriver.com>

QEMU RISC-V can hang at boot when using fw_jump.elf as the BIOS if
the kernel Image is large enough to overlap the memory region where
the FDT (device tree blob) is loaded. This was observed with
KERNEL_DEBUG-enabled 6.18 kernel builds, which inflate the Image
size (e.g. ~27M -> ~33M on qemuriscv64), but the underlying issue is
not specific to KERNEL_DEBUG or to any one kernel version, it is a
property of fw_jump.elf's fixed compile-time boot address layout
which does not adapt to a larger next-stage image.

This was confirmed by dumping guest memory from the QEMU monitor at
the kernel load address and finding the FDT magic number
(0xd00dfeed, see scripts/dtc/libfdt/fdt.h) sitting where kernel code
should be, i.e. the DTB and Image had started to overlap [1].

fw_dynamic.elf instead receives next-stage boot information at
runtime from the prior boot stage rather than assuming a fixed
address, avoiding this overlap.

[1] https://lists.openembedded.org/g/openembedded-core/message/246090

[YOCTO #16409]

Suggested-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index 860e0f93f1..5b9ec6b026 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -29,7 +29,10 @@ QB_SMP ?= "-smp 4"
 QB_KERNEL_CMDLINE_APPEND = "earlycon=sbi"
 QB_CPU:riscv64 ?= "-cpu rva23s64,pmp=true"
 QB_MACHINE = "-machine virt"
-QB_DEFAULT_BIOS = "fw_jump.elf"
+# fw_jump.elf's memory layout can be overrun by a sufficiently large kernel Image,
+# causing it to overlap the FDT load address and hang QEMU at boot (see [YOCTO #16409]),
+# so use fw_dynamic.elf in that case instead, which avoids the overlap.
+QB_DEFAULT_BIOS = "fw_dynamic.elf"
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
 QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
-- 
2.49.0


