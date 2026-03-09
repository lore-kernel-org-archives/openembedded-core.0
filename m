Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C785FFCA16D
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:44:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20812.1773078280272950730
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 10:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QVskXshC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7528dde4fb=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6296LbHH4160785
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 17:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=18edR7r/5wKkrzTfkk0Ri9TYWUK3/6TQnQfRuPm098Q=; b=
	QVskXshC8WxGNNB+1MKl80XUVnpR6+Ow5neVAWpvqub2m77RmvCfSEXO9/IXpHKp
	tnE5DTrOSXZscZySqohUCsiSeVNIN/4m0t2xgTsEUX6VCkfseOO0QYLDGERml5sq
	VoCRSp5K3CXouRwrjZQQrsncdqvj6q3xmna0gPU5/rwI3rwSKLuYJEDTJUxIMpIG
	8eniDltBBCND9TstA7z8M+8rLYwyyWai4nlDw+A8XK9TP8vAQG+LIEOoy5nqZn9G
	QW1OJGpybxPhyWqpTId6LvyP4GRImZ9mKqZxFXKdRAXlh2MnikWsK7AKt92bU5hX
	XQ2okgtRDua13S6ZyW+DCQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012041.outbound.protection.outlook.com [52.101.53.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crb08278m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 17:44:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xvo9BnJmJq3BRjMlYbp0dIe6Jak+imDvQqtq4+JTSUu4dkAEv2LLanIlSSCsUB5eO/NSkE7IEAWHBm967ksODFpvX5cePtQwn7nDGxTB1OumhXrmhcoZCbS2RVCbHiD/p/xZSbiA3+91dHkw2AXRgz5IgZUYHdZU0C7g3PbwM4V3+6kGw2b30oHL+stQzqMXRHeIXBwFoBehT/iJLJ0ZpamuuHzIJ3bXzB7PEMUfevWgREqF6YMOdP8xiizFNTdUiXOql+goC6qXEV2S3z4klm56AfwJFNiK72JvWu0+XB94hp/q1DEYkV/FNg4A/TKbApwlPO75a3apUFLNS1HF0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18edR7r/5wKkrzTfkk0Ri9TYWUK3/6TQnQfRuPm098Q=;
 b=XbEmQLz1vonHEJOZQstW5TDmyBN9JjcZuRwIfjmN+0qZI/2Y02AlKixPEZvUCXXJ+sYLpUoNoHgOBvSxEexQlrLqhc4SshDV+XUFhUW5mSFpULvx78U36vvktvdtxBLbdc3ewiTkW0lB4ojjp1VTTApZWqo1vT4tCBryoVkOGI/61L3ichl+htRqEtY32iR9/vgSZSoebqzfleK1fJKl97Ru7lJKA9YdUhVv2qOmuGoTSn0AaJNXE1ygbF7i1V5FPl7oD85Z9rny8kpC2dvt5tFxePYO1FBHe/9dfZUYuICLIckJ5J4UOg0pGQiwfAtVRkICd7AFB8zcNp44Uin+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB7190.namprd11.prod.outlook.com (2603:10b6:8:132::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Mon, 9 Mar
 2026 17:44:22 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 17:44:22 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        ross.burton@arm.com, bruce.ashfield@gmail.com
Subject: [PATCH v8 07/14] kernel: Disable ccache when kernel rust support is enabled
Date: Mon,  9 Mar 2026 10:43:39 -0700
Message-ID: <20260309174346.3384212-8-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
References: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: fd909b6b-2d6f-4459-ea4e-08de7e037f5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	wST1E+54KMFgjjT/gKyWH2C5gpu0sRUEpVWLdx+6V3ImDObczv3968vB6F4K14MTd2STjEA6FmnoDCfZLgZzILscKTkIcHzOk7Vcjv4b/QYOgGNzNiNH76q9CCXwmklEc2I1hhTl2VkUBEezR3zAhmTb80Hi4wY4vblM8ussA7e2fd0elmyVjjjK6u+O8NzRD7j0R3rCasvKpaf5hDOEpBtF3xGknLxGxB+i4zDHy6NG4GT3Ljr+SeZ2DiN5wE3LdHRImgT/ufcZO+nA9d0xmljXFBTwU98yblFK9dRexZ+BQToGTdsBtL+Yl7WqMB1zOYo/dCD6bWKOYnp3CxiUJ9fmIhlZcM5nP+ZhBC5IexZ8ytWbja+MP5CjadyQVTXOdJjcJLRt5p4++esy4VlH+YCHa2bIPa8Gk2+oyCge8z5ZZeJ/AQHi1Pxy8/uUjM0O7bUeFtbwaSIFl2IDHU7dVuksjHFDWz3UOcHhFlY0Aiv3TDGun7YJNThJE7uUKOxaiiIuS08Lwt/yaQbswXTLnef2j91ZQHl4Kk0YQcKmcYwaxMxFHaWuQ8w5VrOj93KIN6/FynnOPRL2jv6yF6VeEGC7yI2qJEDEYoatFOGYagKNGFWfyBAgYRcTABl6XyLCqYpavx0/3gPmq6Qc2gPVA320hEXxcrcdCTiTgE48FV7Yclj8pFwvwVveufORHbfHi4QZLjHPFr1u2jE46dR8gI/756fPDefyN0LKA8MYMPJB0bIAieW7P/9coavM0d/M
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6nmKMDd7cf+gVyBouOc+YJXx//AAvly9qjCEvNDT+O7FXaaYl1Y9FjSFEPWz?=
 =?us-ascii?Q?3AkVdA8t4KRhP/UitIFjAd1EyUaVv8J19NnRvjHFQa3Gfa9N5EBsqbeKkewN?=
 =?us-ascii?Q?s4baf7Q5uZgeoNlN48MNb5sptNN9IbZhKm9Qo50tSY8aexEKWUi/fF2rNygN?=
 =?us-ascii?Q?vnh0A/cH5nicoaXge+a1Qf17uxmWAPewp8jJSIIikHg3agzgolWn59JTmNaJ?=
 =?us-ascii?Q?OdOoNkOleYCM5QBkOTt7ZaI+Cchb8iLAN0iLNZIBHCnGWK2WYiJhKdZK99yh?=
 =?us-ascii?Q?8ocsoZAHwYrQX5ZXYKfBG98uvtWuX20nNDLbUbzp5JVn9+U9FQBKxxfNK0mL?=
 =?us-ascii?Q?G9nEtRMmsI8JR4/iye1JbGxym8pqnnv7RHdzVa1T7T95dvnI8A95RaAOD3od?=
 =?us-ascii?Q?Jv3WWljPbhxJiPbb+LbpUeXR+OC9z7wEdpg+/Zf3K0J25mTUky6TjNA9usVx?=
 =?us-ascii?Q?QWkOabu18EcBC9QVrra9o7qWO0iSDPxzoOgpCo0lhnZH5i7O5krIEk5+1TL+?=
 =?us-ascii?Q?1z77EZ+fWFP7oLt9JuYHQdnq7a227d+zW2nvkBN7o8A1Yy7VGkd8Kv0bULgD?=
 =?us-ascii?Q?yUqCxRxVPiEuHVygDHJvr94NFoXRFAGBPESabJkenKwrffj0BQrqUrr8NbBr?=
 =?us-ascii?Q?EZN4VoOP3rdihtSozLpa36CaDDGge8kjKle72iov65Hw3bk2RJOQ6HPzi0Aa?=
 =?us-ascii?Q?CtPC/D/HHu41nqXU2EC2KZjLReRgY6/joSoGi/G+8949Y/8pCyM5jJR/awpA?=
 =?us-ascii?Q?bFm2AkEVsxu9azWAeZ6nEJoutgbW0akrJ5Z7nYZ0unkUAYbNKbjZQSadQNgm?=
 =?us-ascii?Q?qBLkoPatmtiUGcILMKh7Pd45ec4jaw+oygz4NNwpPoj3KhlPtfixKVicqVF9?=
 =?us-ascii?Q?+ZwVaBzWTC00TTH44nsYmeHoGlMUiLRqPntw2JB+xPnZ8e1YWC5OyuY38sTw?=
 =?us-ascii?Q?DL5+aUxR6tVnJ8/9imoXQsavY09s0NwwRxkT8ey4al/TEnpXNsskNOiRBuno?=
 =?us-ascii?Q?xBtJ7v1NuKbQexD5QAeIYVWMKuJEg218JUvTlasRfqi2R9SxZ4KgSdk9cC39?=
 =?us-ascii?Q?FusAHrm1Zn0IcdLTXrwYgsrbJvfDRGJcjeLRnNR7bVDCUdH/3TCcA9e7gUa4?=
 =?us-ascii?Q?Vdu2lCa8wNHytWZJVoZjx858Yw/7+/HyMVUSPisOKDHtPFSuyyzmqxNAmOK8?=
 =?us-ascii?Q?03nunOTV74bUxSlTkq6Pgh08C4CxKmur6M9x1A+whiA6ZINXF7JBzGm6OpSl?=
 =?us-ascii?Q?+/SkvoGvnqxG1PxU1G7g9vC4dlfIhg4qbOJcy95sL+nKb7V/N4u9n+TKP/WU?=
 =?us-ascii?Q?GCofw0fmq5IHEr8b6zeqRtdqtTqWifkumNrx/mAZ4u1wnvO94lBb+blbiJ+0?=
 =?us-ascii?Q?0wqV6gdpFoIbOvQTbak7UbvfIlIUWdqqZo63W1uplSEc+OWiSYbTXol5oPsy?=
 =?us-ascii?Q?NPdHzrrXJwqe2+suQYkobNkbT01xPa8eOXzoM3KNsow/nAx9JwZEXtQnpPmz?=
 =?us-ascii?Q?IwtDb20uk6s12DcUaL5fLqJseCmBCHQ7SSz6gxtdbPIqwEWqHYT37ywLFWZd?=
 =?us-ascii?Q?ZONxvAmKagj0663AmJn9sB1wFGVqULR0w+4F9yeT2rddqgyMTqohGAvwvgxa?=
 =?us-ascii?Q?qcUidq03o59pIAQf1i/ahRxi3t0ZmxAURSMIKdXv+ZiZBy3VEM/luqjW+mGD?=
 =?us-ascii?Q?AVjBhBTiKVCWU7Hr6xoH1YZ9g/JA+WFh6vc20Img++6HKgG0c/mfDvY52nZu?=
 =?us-ascii?Q?vMt4dRbur3RP2169MYtYMTqYCdxypkM=3D?=
X-Exchange-RoutingPolicyChecked: 
	ooessh9SYbbW5nUWtTSm9AsC7MELuGm0OmCVJAKeCJMXB7NB5rpL30hkf2nBF1kqbGPfvAVlrnL6nd2ev55k7W+AjSsEGOjr3V8rN12oCMBjnP+IG32FavFFKmStCX7mazH7eu2MuWol26l4VXc+0vMivBJ6MohhYKPAnV1rOVcYgu8Axu7ylWZ7Lpj0bWYVaAfZfAtC72Us9UPLipmXk0uQZGEp29AEbZ9SNp0pMZOmXxZ2m4IMIbT8QXgHVQOF9AnY5ulHFw6LzxlYQCVuft7pTlLROB662DC/c/47wP7CQPM12SFbwVS6YpVy46AywacWl7KyYvRmKSgkJENttg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd909b6b-2d6f-4459-ea4e-08de7e037f5d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:44:22.0895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nFUOPvY3O5FPAxTeGYjf2aDQjzsH/2YD2zG8WEM+Rk0YBOkmSC0zawv9J5SEFNGCHvgPRIudcwrJtlVFFgwQ3AeKdhColpOFkw63zIcQGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7190
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 24vCT0lILZAoUgW_vNSoFJje9nfop9uI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE2MCBTYWx0ZWRfX6xKm6CFmHtr9
 y4gKT9uNgZGiKKeFe4PoG+yNTaxYEkqiyfU5c1YEdjBZPIu7PJ3AEcMOQy4f/C+tUED+zEIt2rY
 bHH2flRqIuxws9w2zLQLnjYWnmI0SoX/cRE/tTzYDX8X+2R3zgQ8EgCh/4MMPXGksNOLU2ZiTC7
 +0GEYmHSkkIDzLvhwVZ5vs+FfB3hTL3hAbvrbx3T2Ddh7HK5Mew4CkH4kVE5QRU/0SMHthVpsIr
 n6kNmF5MVLUi3U4P/XmcbpzVMQDYmDY0T3c2EsBkE3F2Qi/pwVXhFeQhYFKPuAIsaixgvXNYZ5R
 4TpMvIZdw6a8f3tpNZXzHgMjC6SwOQGmL2qro2UeJF/zt2KgmAQlZtMdWi0Nd5HKaVVz5W6+KtI
 Z6juFL4XKZtEW4Z7f8zPyzDxtpBCj2Sa6URkWtHEX+Ns0/DK70swGyr/6zyIh0RAEXF9q3QjA9H
 ojSN2AEHQlxcuFudVgA==
X-Proofpoint-ORIG-GUID: h_EhzDpao98OXHdCCXR3Ih1nU5Y-b8d8
X-Authority-Analysis: v=2.4 cv=UahciaSN c=1 sm=1 tr=0 ts=69af0707 cx=c_pps
 a=yZuzC5SkKTYVmguxKPWuow==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=Q4-j1AaZAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=iUso3aUBSlOXKDWHM7YA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 17:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232744

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Currently, a ccache enabled build fails with:
  |   HOSTRUSTC scripts/generate_rust_target
  |   HOSTCC  scripts/kallsyms
  |   HOSTCC  scripts/sorttable
  |   HOSTCC  scripts/asn1_compiler
  |   TOUCH   include/generated/gcc-plugins.h
  |   DESCEND objtool
  | error: multiple input filenames provided (first two filenames are gcc and
.../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target.rs)

Linux rust build infrastructure does not currently support ccache (Opened bug[0]).

Quick summary: There are 2 issues: $HOSTCC is not escaped and rustc
expect a path (and not a command)

Disable ccache if KERNEL_RUST_SUPPORT is 'True' for kernel and kernel module builds, including
auxiliary tooling such as make-mod-scripts.

More details in: https://lists.openembedded.org/g/openembedded-core/message/229336

[0]: https://github.com/Rust-for-Linux/linux/issues/1224

Co-developed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: Alban MOIZAN <alban.moizan@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass              | 7 +++++++
 .../make-mod-scripts/make-mod-scripts_1.0.bb               | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
index fd9ee91c79..608ccc4609 100644
--- a/meta/classes-recipe/kernel-yocto-rust.bbclass
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -16,3 +16,10 @@ do_kernel_configme[depends] += "${RUST_KERNEL_TASK_DEPENDS}"
 do_kernel_configme:append () {
         oe_runmake -C ${S} O=${B} rustavailable
 }
+
+# Linux rust build infrastructure does not currently support ccache
+# see https://github.com/Rust-for-Linux/linux/issues/1224
+# Quick summary: There are 2 issues: $HOSTCC is not escaped and rustc expect a path (and not a command)
+# More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
+# Disable ccache for kernel build if kernel rust support is enabled to workaround this.
+CCACHE_DISABLE ?= "1"
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 874e16e642..7caace5619 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -36,3 +36,10 @@ do_configure() {
 		-C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
 	done
 }
+
+# Linux rust build infrastructure does not currently support ccache
+# see https://github.com/Rust-for-Linux/linux/issues/1224
+# Quick summary: There are 2 issues: $HOSTCC is not escaped and rustc expect a path (and not a command)
+# More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
+# Disable ccache for kernel build if kernel rust support is enabled to workaround this
+CCACHE_DISABLE ?= "${@'1' if bb.utils.to_boolean(d.getVar('KERNEL_RUST_SUPPORT')) else '0'}"
-- 
2.49.0


