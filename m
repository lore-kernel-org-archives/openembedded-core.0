Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A18FD58B21
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 04:10:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43450.1773634222066885098
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 21:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=a7gppdv0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75355d60f7=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G3puWu2141663
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 04:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=BsnsBuGgOG6dmVK8I4aFcZX3x8zPmdPl61HG9Ug+elo=; b=
	a7gppdv0+N+c8jA+fijav7vYwnlDrF13AnlAYa35+ECtzSDGdjctGaGOAbdTM5Od
	M3GBnmeM6g8k+JaDVCZVg8Sg4Rpul5dH89b8abyjlVLei7A/e9YVz9aNFdJKkZPF
	5pd2LaBEuX1SEItUIgwe9OvFKvoddm096NzQ+nJK8OGbOjitryG3WVivtVkzktlr
	9nGWEtx0U7BPKgWUG4V2JHEj4k7b8p0ia/P35S7M6/bP7ORd46PUeGmmp5WmXZMm
	+nmAwJi0Zw3taK9dIFn1fKol8r+lGMLRNeBy1X6WMLIIP0sfzkEaSgk9BOXuYTuC
	SUWp7pv3eeEg7/U/BsDd4Q==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010031.outbound.protection.outlook.com [52.101.193.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cvvvyhmc6-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 04:10:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHmI2ZhAvJ77kTMB5F20PoevygFenHdfOFbvAyDKTSyORzxY3ysWL2ZwpwDw6guUj7AriH9OFTTFo0FjboAmaupPUPsPNks8yya6oTpTN3fQj0Gmy6CRZ0pd8tlnC0OUCzdF3W3Ih1WgoNtUnL3/P/gd4Ux2bxlcG+d0pazygqNyHmPVa8oPe3w4N0Bjn3lQrcm6vbIn1pOxAb43mjRLGe3kvey1hz9GFYHdmPcYkUin6wPTM+aDNetsWLr9t8lemh9fGp4g6KeEci2eXh1v/7wvjXms9bWmmU7D0SP1PDHFKLNYZCs7/sUbuR4/lyU9xrCSZ2tWOV1HuDcxGrfeRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsnsBuGgOG6dmVK8I4aFcZX3x8zPmdPl61HG9Ug+elo=;
 b=b22fVDw3ydJ6HJKEaoIw3bM1/veys1hUWO9Y+zDujtt0WW/1Jj33lzC8fK3bv34ylm1ISyg2rs8MQBkJiSigLD1TtkPFbHZnFB0EgqoKWd0iHDq6fs15SaBq9MX4KBc+azoICYn9M2qGDqp8/J4mhxBSFVUuBJfr5BUenTxoT/aGfN2378ykj3kGmnU5h5/D+drN1PendJi4y3OHKXsCDijfJaUOhSnQCVDBWClrKl55kTaNNLB833rZCDTqFb8IqNIixv2GxuNyyN8Tlsfea3HVAopunxfxukgBKwLlkGRNV2AR2RYWaPDEC71f7ZZuvJvC3rmQ6tQQeB8F/ACUMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 CY8PR11MB7337.namprd11.prod.outlook.com (2603:10b6:930:9d::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.16; Mon, 16 Mar 2026 04:10:18 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.20.9723.014; Mon, 16 Mar 2026
 04:10:18 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
Subject: [PATCH V5 1/1] gdb: Upgrade 16.3 -> 17.1
Date: Sun, 15 Mar 2026 21:09:58 -0700
Message-ID: <20260316040958.122568-2-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260316040958.122568-1-sunilkumar.dora@windriver.com>
References: <20260316040958.122568-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0080.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::21) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|CY8PR11MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: ec7b1877-9ff7-4504-f70f-08de8311ef2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	P+HXf5DmAgxO5whXnZ14eiKFjSAsndhlbjJ5RpzG3zwPDDO1s0B+ddBNHArRm1xOQmRVALLXHNbWxoETj6AJX1D1mRVCfPbg+RLSSZhrsQhxTCeMUwGFtIXJrkKHO/pQhkupuhEmp7A9eQCnvuwq7qSVxSKKIBcrJwbvE6f02okuZ/6AtaZ8ZSWgSMLDgFqp2JwWDCnPMuHGmEMRD8hW+vtzLGkznq2yZXS33Gaeudy4YISx4a8wmJtS0/b7w0iqfDijMsdSvhiXgj8FlhsNZVoGZ+6i4aFMTrgbGI3gFVpjHwV3vUQvAWuidcQ5nGIcmDg1PHX+ZWpgHZUQkzsIjQfakOKWggYu0nITp8BKsjNziRf14Jsd9bk1L5/2BrHvL1zWnYMONY5B+qQKVpKvsMrCEc2ukOAX1EvkOkA8VCf7enA9YLlOIEDMkF1ppjIHDI+LY6cG752vO8cYCTzCCbYH6unbTJeV8xct/ozM/QAM/ADT1XXwo1WZ9hR0gWytATT8QIsORVF3frpquSRiwypfuiXMlV2FxDl0XbSYKo/6swThCBCbGxtdbgQQDaHQ7kF8UQll0A6RIjN8h21bMf6j+RExqPdoaLCkJ9oc+4H2YMW7BqJ8TnSyAtJu+Z/BU2d6RbpGUzXjEBe54BWOMY5qj1BD+MVEWyDUizqzmLvTkTr2h2ruRfBtBaFAbK8b7k1johp/niXQBm/WweiXomTVCJTZS20MeIQFSCjSTNgGoFtSjfJQ4851wN/+I7/w
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lpwMml2ir1Eg6Ppy6dfmGT92Cx44HtdYIC4sWs7dsE3S7+BSm4EqAA6JIBnc?=
 =?us-ascii?Q?u0nVGnF9dOyhBqjXZ2fBEkc0BTQQAPIgU2iXkL1HBUW9S2nDEF0HIzU4AHLh?=
 =?us-ascii?Q?Z644KKNXMtWnyu9sQAmi9oWVKoZhu4Pa2l9nrIhdxE3cVxpCk9yx+4xEXzbs?=
 =?us-ascii?Q?eLxepCJ1zmY6QxRGxAAdEWPik9HituddJuRGpNhP8i25CDGz3a0dAL9cNYXG?=
 =?us-ascii?Q?IS1/Zw6ufBW1lkVaw1HjD0y+4DQTGPz0fQOi/5DTfZcanDtCXdXcxRwwycw9?=
 =?us-ascii?Q?gBFkfocpJBOKJZvXNO9MaiEaJoTpCNXRmiYFW/lm9ETUGj1Qb4y94qkNMj5B?=
 =?us-ascii?Q?dZ0UQIDOmdC5uurOSBfWyju1L2S32b9pKk/5FrBYh4NcZXFyb8eFOFZldr4w?=
 =?us-ascii?Q?8T90Fo13WOfnb5eeBvXguLfNDNMJ57Pr+L8Ky/12qmtZ7Hhky/y+HoAYyWU0?=
 =?us-ascii?Q?xRTE8aDyOJYp7TNo/CQE4+Sp5doITLoaw+uthQxKfcvApe6dxjVFI0HSZgId?=
 =?us-ascii?Q?FUNqsAX2FP9NrWrcN9MAHXEgUFPsMcF57/jrfp/S1cuQ0EnlHE/Fe8kIxMpz?=
 =?us-ascii?Q?h9CGToiplpobmRv8grF9zCzxoMzTdNvGsc5OeJq0l6QAzb87ObiER37wY5yI?=
 =?us-ascii?Q?HzFke5w4wIJEhxaZpv986FrZsAN11alCRxeaeAuZIjVSuAH396Ikq+wy/uCN?=
 =?us-ascii?Q?OFookE9+TY8o1GGmiZFrT7L2ler2uDLrT/o46qr/Ad4dqqYW//XzcTv80SKr?=
 =?us-ascii?Q?7qRgbyO6AsE/gf8u4Y1ryCjOzAvIHcOPg0rprrsGm0y98p96NzEVviAkfy29?=
 =?us-ascii?Q?zo/cY9FTb3urRQ6Ku37kpu1k8TMnlZ6CWtjbztTPA/4RNOI8W4UIE0o12uU0?=
 =?us-ascii?Q?9W6DkdUWLCtOJmRL+A3lce3XZmc+7f4fI/3XPB9orFzS+8TsCptuy9VSWtxw?=
 =?us-ascii?Q?qpzsgzf2HvPnsFipp9ZVVww1u3MQV9y9/ikN3n/wvSklnRplxGv6xLs4eQYM?=
 =?us-ascii?Q?5sJjJE8pMXxYCuHSX213RJgRuyI331LyeL0kSXfqIhkbNr1OsBe56/KV5411?=
 =?us-ascii?Q?/KGSlKYV8ZO7B5pxYyjmFyv4zruK3D1+qrPklAX6iXGu6WtXe0ZXj/VPFbLn?=
 =?us-ascii?Q?HL6fplefzVB/a3clXSnaoYX63LxlvgDgi6pwdp6EqvhI2YboW1FLXOuSi8rn?=
 =?us-ascii?Q?VxEyZgt9DjUCre2PWrPjYco9n2Y0Q5G8V4E/MXe5bc1XfAxxgIZ0ALdFNHk3?=
 =?us-ascii?Q?hTeuf8joQcn5MBcxVsjW1QBEGuqKkKDTNOx5gT1I4GKHVWxYYySFjSdJegBR?=
 =?us-ascii?Q?+4Z+9F0pAiJXOlyu7JMdkGO1AXHbVeamWmVRlfcGVR/oKw/QO3YChnzrK0pA?=
 =?us-ascii?Q?GhEYMj8Vyuxmywzy8U5xre/N36KhTARNTHj8wpc1FqjlPKApjs7WZ+53lR5W?=
 =?us-ascii?Q?UKhQxSkuUUFAK1xKWnDP94D9UW20/OGKv4dpv0iuQ18b0aeaMQBfMAck2Ijp?=
 =?us-ascii?Q?8FH7pAEcWcO+nYLSuEhSf5HUHgCcsVOI5YG77LskpO4XNOKwC+WVFg0z7gxj?=
 =?us-ascii?Q?S+KRDdDXjLoBqe7UI4Pp57vJN9obmb7ThEUTF73DssvJSHDGER3BWlghp2oV?=
 =?us-ascii?Q?gHBWlrJWvUDRSCJx4QfgK7SqfygBpfv53aVt1bY5dNOGT0IStU/vGLWHAn+F?=
 =?us-ascii?Q?ksGoU212R5PiSmEXZE79dl7mrlXBmparuwKnBSede3Eax/2+7nGzxOS28JpY?=
 =?us-ascii?Q?2idEWePz9uRHczcSBxX58BrZWbZkIao=3D?=
X-Exchange-RoutingPolicyChecked: 
	P/duAjjNyRbxaNLgj7UaxMmsJkNRSjxIC1eyujVrvxzyb2VymvtnmejjTZ897ladvBh9lDSDaoq7EMSTzNO2bjpwz8HcZVlZy/3nBe5jgL+wYfA9nBE1ceUQF7KeXG/BgLlaWoSA9eFKUZ3S/ArqwPD/a6qgraRbMPe+FpgtmGE8cHapkYAHFI6FoP3HSI8vL+uG/O+qIk08kg6/yshMnPLlsKxil5gZB4nHFa1mivinhH6Q4DajohTdFzSZDGjgCpZpARo+qlyoVePwXZLC4Khq4vDzslFvrjXYsheLU+SAEK3GdaIJVxN3pS8ayn9BENwbgw6AHnCi/jW6J1ETTQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7b1877-9ff7-4504-f70f-08de8311ef2d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 04:10:18.5409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HClnyECZuB5H6WYc4iBUMYmTB5yJfMN1VLpOOz4VG+tCPlHpf44Rrlug9oeqZY32h9Drdu2E08vaSOnZr1siyQDBA/PxiodixDcHVOaQQZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7337
X-Authority-Analysis: v=2.4 cv=E4XAZKdl c=1 sm=1 tr=0 ts=69b782ac cx=c_pps
 a=JYb6bdnaVjS17BdPGRuFtw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=CCpqsmhAAAAA:8
 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=BcPKCTjPAAAA:8
 a=pGLkceISAAAA:8 a=9aBu966AqQh2DYpbtdUA:9 a=CSlqiu1TnAGDme2R:21
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=MNXww67FyIVnWKX2fotq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAyOSBTYWx0ZWRfX9jI/tUkeKhQ9
 Pr2RX2bLjuK5uchYsWq2avsUVDfHRU5FKqHctcTh1NcFZPo35QM1rg1HXpUowDdn++imNSXjxIJ
 FjZjHgXMZsLVy9q6trh3D434XzNqHI6UCSb10ep28/DJGLl6lcfP590gg4NlElLNcunrm9/Se30
 9r89FzJbNWrolK59CT/BOFcgXX0WgcG0GQ1pintTl2Z4kjjR4tRPXGGXVitNR8T7rYYJMG3Mubx
 bytleYEmXuWIPDgHyF1havBWNdZKi4mTJ9FwiZUwOscBVx7I+9qnSSKHnDxfhsbY6G6xuOMSxbX
 yMY/Fe+9gyNiPXB7kjyt7b5MMHl2QWlVtEwbFQNHXWDBdTRvMzMKwnbajMDy5jfLMxAEr06GCkP
 z3Ttzk14Jk2KzOWttURk3Pv4XUIc4TikSYJQAugUE3ciZ5PxUgSOfDbi0bMf3IU0EhY2U5mHKxG
 2LTBJh7gcYp27RNjUKA==
X-Proofpoint-GUID: ovMRAVMV5BeCTJym0_VEV4K65DevPiuh
X-Proofpoint-ORIG-GUID: ovMRAVMV5BeCTJym0_VEV4K65DevPiuh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 04:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233208

From: Sunil Dora <sunilkumar.dora@windriver.com>

GDB 17.1 includes the following changes and enhancements:
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob_plain;f=gdb/NEWS;hb=gdb-17.1-release

 * x86-64 CET shadow stack support
 * Debugging Linux programs that use AArch64 Guarded Control Stacks
 * GDB record feature now supports rv64gc architectures
 * 'info threads' command support for two new options '-stopped' and '-running'
    to limit the list of displayed threads.
 * On Linux and FreeBSD, the addresses shown by the 'info sharedlibrary' command
   are now for the full memory range allocated to the shared library.
 * Linux checkpoints now work with multiple inferiors
 * Improved linker namespace support
 * Warnings and error messages now start with an emoji (warning sign,
   or cross mark) if supported by the host charset. Configurable.
 * Built-in support for TLS on Linux as backup when libthread_db is not
   available. Supported on the x86_64, aarch64, ppc64, s390x, and riscv
   architectures, when compiled with GLIBC or MUSL.
 * New command "set riscv numeric-register-names" to display risc-v
   registers using their numeric names instead of their ABI names.
 * The Alpha target now supports target descriptions.
 * Python API enhancements
 * Support for Python versions older than 3.4 has been removed.

Dropped 0009-Readline-8.3-alpha-release.patch
Added 0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
Added 0010-PR-gdb-33926-gdbsupport-fix-AArch64-struct-user_gcs-.patch

Co-authored-by: Sundeep Kokkonda <Sundeep.Kokkonda@windriver.com>
Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 ...ian_16.3.bb => gdb-cross-canadian_17.1.bb} |   0
 .../{gdb-cross_16.3.bb => gdb-cross_17.1.bb}  |   0
 meta/recipes-devtools/gdb/gdb.inc             |   5 +-
 ...-ser-unix-modernize-Linux-custom-bau.patch | 248 ++++++++++++++++++
 .../gdb/0009-Readline-8.3-alpha-release.patch | 164 ------------
 ...support-fix-AArch64-struct-user_gcs-.patch | 181 +++++++++++++
 .../gdb/{gdb_16.3.bb => gdb_17.1.bb}          |   0
 7 files changed, 432 insertions(+), 166 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_16.3.bb => gdb-cross-canadian_17.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_16.3.bb => gdb-cross_17.1.bb} (100%)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/0010-PR-gdb-33926-gdbsupport-fix-AArch64-struct-user_gcs-.patch
 rename meta/recipes-devtools/gdb/{gdb_16.3.bb => gdb_17.1.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_16.3.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_16.3.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_16.3.bb b/meta/recipes-devtools/gdb/gdb-cross_17.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_16.3.bb
rename to meta/recipes-devtools/gdb/gdb-cross_17.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index a36f78fe67..1cf4dff8de 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -13,6 +13,7 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0006-Fix-invalid-sigprocmask-call.patch \
            file://0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            file://0008-Add-fix-for-packages-that-are-not-compatible-with-C2.patch \
-           file://0009-Readline-8.3-alpha-release.patch \
+	   file://0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch \
+	   file://0010-PR-gdb-33926-gdbsupport-fix-AArch64-struct-user_gcs-.patch \
            "
-SRC_URI[sha256sum] = "bcfcd095528a987917acf9fff3f1672181694926cc18d609c99d0042c00224c5"
+SRC_URI[sha256sum] = "14996f5f74c9f68f5a543fdc45bca7800207f91f92aeea6c2e791822c7c6d876"
diff --git a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch b/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
new file mode 100644
index 0000000000..3432d71c09
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
@@ -0,0 +1,248 @@
+From 2b5e33e653f31ac58bfcba9636ba23a335bd92ab Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Sun, 15 Mar 2026 17:04:40 -0700
+Subject: [PATCH] PR gdb/33747: gdb/ser-unix: modernize Linux custom baud
+ rate support
+
+The Linux custom baud rate implementation previously accessed the
+struct termios members c_ispeed and c_ospeed directly. These fields
+exist in glibc but are not exposed by musl, causing builds to fail on
+musl-based systems.
+
+Update set_custom_baudrate_linux to use a capability-based approach,
+with three distinct code paths:
+
+1) If POSIX cfsetispeed/cfsetospeed accept arbitrary baud rates
+   (HAVE_CFSETSPEED_ARBITRARY), use them to set input and output
+   speeds.
+
+2) Else if Linux termios2 interface is available (TCGETS2/BOTHER),
+   use it to support arbitrary baud rates.
+
+3) Else if legacy struct termios supports c_ispeed/c_ospeed, use
+   the TCGETS/TCSETS fallback (primarily for glibc on older
+   architectures).
+
+4) Otherwise, emit an error indicating that custom baud rates are
+   unsupported on this platform.
+
+This preserves existing behavior on glibc systems while restoring
+build compatibility with musl and other libc implementations.
+
+Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=33747
+
+Upstream-Status: Submitted [https://sourceware.org/pipermail/gdb-patches/2026-March/225952.html]
+
+Suggested-by: Kevin Buettner <kevinb@redhat.com>
+Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ gdb/config.in    |  6 ++++++
+ gdb/configure    | 52 +++++++++++++++++++++++++++++++++++++++++++++
+ gdb/configure.ac | 22 +++++++++++++++++++
+ gdb/ser-unix.c   | 55 ++++++++++++++++++++++++++++++++++--------------
+ 4 files changed, 119 insertions(+), 16 deletions(-)
+
+diff --git a/gdb/config.in b/gdb/config.in
+index efc3100cb9e..b2469c8dabd 100644
+--- a/gdb/config.in
++++ b/gdb/config.in
+@@ -110,6 +110,9 @@
+    the CoreFoundation framework. */
+ #undef HAVE_CFPREFERENCESCOPYAPPVALUE
+ 
++/* Define if cfsetispeed/cfsetospeed accept arbitrary baud rates */
++#undef HAVE_CFSETSPEED_ARBITRARY
++
+ /* Define if compiling support to gdb compile. */
+ #undef HAVE_COMPILE
+ 
+@@ -517,6 +520,9 @@
+ /* Define to 1 if `st_blocks' is a member of `struct stat'. */
+ #undef HAVE_STRUCT_STAT_ST_BLOCKS
+ 
++/* Define to 1 if `c_ospeed' is a member of `struct termios'. */
++#undef HAVE_STRUCT_TERMIOS_C_OSPEED
++
+ /* Define to 1 if `td_pcb' is a member of `struct thread'. */
+ #undef HAVE_STRUCT_THREAD_TD_PCB
+ 
+diff --git a/gdb/configure b/gdb/configure
+index d0bdba6eb36..8a0e2fa2771 100755
+--- a/gdb/configure
++++ b/gdb/configure
+@@ -27336,6 +27336,58 @@ if test "$ac_res" != no; then :
+ fi
+ 
+ 
++# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rates.
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether cfsetispeed/cfsetospeed accept arbitrary baud rates" >&5
++$as_echo_n "checking whether cfsetispeed/cfsetospeed accept arbitrary baud rates... " >&6; }
++if ${gdb_cv_cfsetspeed_arbitrary+:} false; then :
++  $as_echo_n "(cached) " >&6
++else
++
++  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++#include <termios.h>
++int
++main ()
++{
++
++       #if B9600 != 9600
++       #error B-constants are not numeric symbols
++       #endif
++
++  ;
++  return 0;
++}
++_ACEOF
++if ac_fn_c_try_compile "$LINENO"; then :
++  gdb_cv_cfsetspeed_arbitrary=yes
++else
++  gdb_cv_cfsetspeed_arbitrary=no
++fi
++rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
++
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $gdb_cv_cfsetspeed_arbitrary" >&5
++$as_echo "$gdb_cv_cfsetspeed_arbitrary" >&6; }
++
++if test "$gdb_cv_cfsetspeed_arbitrary" = yes; then
++
++$as_echo "#define HAVE_CFSETSPEED_ARBITRARY 1" >>confdefs.h
++
++fi
++
++# Check for members required by the legacy Linux custom baud rate path.
++ac_fn_c_check_member "$LINENO" "struct termios" "c_ospeed" "ac_cv_member_struct_termios_c_ospeed" "#include <termios.h>
++"
++if test "x$ac_cv_member_struct_termios_c_ospeed" = xyes; then :
++
++cat >>confdefs.h <<_ACEOF
++#define HAVE_STRUCT_TERMIOS_C_OSPEED 1
++_ACEOF
++
++
++fi
++
++
+ 
+ 
+ # Check whether --with-jit-reader-dir was given.
+diff --git a/gdb/configure.ac b/gdb/configure.ac
+index 52924106bca..26e8d1ee276 100644
+--- a/gdb/configure.ac
++++ b/gdb/configure.ac
+@@ -733,6 +733,28 @@ AC_CONFIG_FILES([jit-reader.h:jit-reader.in])
+ 
+ AC_SEARCH_LIBS(dlopen, dl)
+ 
++# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rates.
++AC_CACHE_CHECK([whether cfsetispeed/cfsetospeed accept arbitrary baud rates],
++  [gdb_cv_cfsetspeed_arbitrary], [
++  AC_COMPILE_IFELSE(
++    [AC_LANG_PROGRAM([[#include <termios.h>]],
++      [[
++       #if B9600 != 9600
++       #error B-constants are not numeric symbols
++       #endif
++      ]])],
++    [gdb_cv_cfsetspeed_arbitrary=yes],
++    [gdb_cv_cfsetspeed_arbitrary=no])
++])
++
++if test "$gdb_cv_cfsetspeed_arbitrary" = yes; then
++  AC_DEFINE([HAVE_CFSETSPEED_ARBITRARY], [1],
++           [Define if cfsetispeed/cfsetospeed accept arbitrary baud rates])
++fi
++
++# Check for members required by the legacy Linux custom baud rate path.
++AC_CHECK_MEMBERS([struct termios.c_ospeed], [], [], [[#include <termios.h>]])
++
+ GDB_AC_WITH_DIR([JIT_READER_DIR], [jit-reader-dir],
+                 [directory to load the JIT readers from],
+                 [${libdir}/gdb])
+diff --git a/gdb/ser-unix.c b/gdb/ser-unix.c
+index 6f2766518be..fbd73970dbb 100644
+--- a/gdb/ser-unix.c
++++ b/gdb/ser-unix.c
+@@ -508,36 +508,59 @@ set_baudcode_baudrate (struct serial *scb, int baud_code)
+ 
+ #if HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(BOTHER)
+ 
+-/* Set a custom baud rate using the termios BOTHER.  */
++/* Set a custom baud rate.
++
++   Prefer the POSIX cfsetispeed/cfsetospeed interface when it accepts
++   arbitrary baud rates.  Otherwise fall back to Linux-specific termios2
++   (BOTHER) or legacy termios interfaces.  */
+ 
+ static void
+ set_custom_baudrate_linux (int fd, int rate)
+ {
+-#ifdef TCGETS2
+-  struct termios2 tio;
+-  const unsigned long req_get = TCGETS2;
+-  const unsigned long req_set = TCSETS2;
+-#else
++#if defined(HAVE_CFSETSPEED_ARBITRARY)
+   struct termios tio;
+-  const unsigned long req_get = TCGETS;
+-  const unsigned long req_set = TCSETS;
+-#endif
++  if (tcgetattr (fd, &tio) < 0)
++    perror_with_name (_("Cannot get current baud rate"));
++
++  cfsetispeed (&tio, rate);
++  cfsetospeed (&tio, rate);
++
++  if (tcsetattr (fd, TCSANOW, &tio) < 0)
++    perror_with_name (_("Cannot set custom baud rate"));
++
++#elif defined(TCGETS2)
++  struct termios2 tio2;
++  if (ioctl (fd, TCGETS2, &tio2) < 0)
++    perror_with_name (_("Cannot get current baud rate"));
++
++  tio2.c_cflag &= ~CBAUD;
++  tio2.c_cflag |= BOTHER;
++  tio2.c_ospeed = rate;
++  tio2.c_cflag &= ~(CBAUD << IBSHIFT);
++  tio2.c_cflag |= BOTHER << IBSHIFT;
++  tio2.c_ispeed = rate;
+ 
+-  if (ioctl (fd, req_get, &tio) < 0)
+-    perror_with_name (_("Can not get current baud rate"));
++  if (ioctl (fd, TCSETS2, &tio2) < 0)
++    perror_with_name (_("Cannot set custom baud rate"));
++
++#elif defined(HAVE_STRUCT_TERMIOS_C_OSPEED)
++  struct termios tio;
++  if (ioctl (fd, TCGETS, &tio) < 0)
++    perror_with_name (_("Cannot get current baud rate"));
+ 
+-  /* Clear the current output baud rate and fill a new value.  */
+   tio.c_cflag &= ~CBAUD;
+   tio.c_cflag |= BOTHER;
+   tio.c_ospeed = rate;
+-
+-  /* Clear the current input baud rate and fill a new value.  */
+   tio.c_cflag &= ~(CBAUD << IBSHIFT);
+   tio.c_cflag |= BOTHER << IBSHIFT;
+   tio.c_ispeed = rate;
+ 
+-  if (ioctl (fd, req_set, &tio) < 0)
+-    perror_with_name (_("Can not set custom baud rate"));
++  if (ioctl (fd, TCSETS, &tio) < 0)
++    perror_with_name (_("Cannot set custom baud rate"));
++
++#else
++  error (_("Custom baud rate not supported on this platform"));
++#endif
+ }
+ 
+ #elif HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(IOSSIOSPEED)
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch b/meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch
deleted file mode 100644
index 206b4baaf0..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-From 8807681557d9f30aac819186369ee62f4f8d1d96 Mon Sep 17 00:00:00 2001
-From: Chet Ramey <chet.ramey@case.edu>
-Date: Mon, 22 Apr 2024 10:41:37 -0400
-Subject: [PATCH] Readline-8.3-alpha release
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/readline.git/commit/tcap.h?h=readline-8.3-testing&id=69e5c5e4c9778bf86c3d1c6b058ddece70854de8]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ...ap-Add-function-parameter-prototypes.patch | 37 ++++++++++
- ...d=cef614441f99b7b6e444ba601d8465a6e88f5a98 | 67 +++++++++++++++++++
- readline/readline/tcap.h                      | 14 ++--
- 3 files changed, 111 insertions(+), 7 deletions(-)
- create mode 100644 readline/readline/0001-tcap-Add-function-parameter-prototypes.patch
- create mode 100644 readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98
-
-diff --git a/readline/readline/0001-tcap-Add-function-parameter-prototypes.patch b/readline/readline/0001-tcap-Add-function-parameter-prototypes.patch
-new file mode 100644
-index 00000000000..f28e31fd0e0
---- /dev/null
-+++ b/readline/readline/0001-tcap-Add-function-parameter-prototypes.patch
-@@ -0,0 +1,37 @@
-+From 0c16af6ebf0bf81138c973e5e6a7c4ebf71f2489 Mon Sep 17 00:00:00 2001
-+From: Khem Raj <raj.khem@gmail.com>
-+Date: Wed, 30 Apr 2025 10:41:12 -0700
-+Subject: [PATCH] tcap: Add function parameter prototypes
-+
-+GCC-15 with C23 dilect defaults expects full function signature
-+
-+Signed-off-by: Khem Raj <raj.khem@gmail.com>
-+---
-+ readline/readline/tcap.h | 14 ++++++--------
-+ 1 file changed, 6 insertions(+), 8 deletions(-)
-+
-+diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
-+index 859e6ee..2b22ff7 100644
-+--- a/readline/readline/tcap.h
-++++ b/readline/readline/tcap.h
-+@@ -46,14 +46,12 @@ extern char *UP, *BC;
-+ 
-+ extern short ospeed;
-+ 
-+-extern int tgetent ();
-+-extern int tgetflag ();
-+-extern int tgetnum ();
-+-extern char *tgetstr ();
-+-
-+-extern int tputs ();
-+-
-+-extern char *tgoto ();
-++extern int tgetent(char*, const char*);
-++extern int tgetflag(const char*);
-++extern int tgetnum(const char*);
-++extern char *tgetstr(const char*, char**);
-++extern char *tgoto(const char*, int, int);
-++extern int tputs(const char*, int, int (*)(int));
-+ 
-+ #endif /* HAVE_TERMCAP_H */
-+ 
-diff --git a/readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98 b/readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98
-new file mode 100644
-index 00000000000..02e665b143b
---- /dev/null
-+++ b/readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98
-@@ -0,0 +1,67 @@
-+From cef614441f99b7b6e444ba601d8465a6e88f5a98 Mon Sep 17 00:00:00 2001
-+From: Chet Ramey <chet.ramey@case.edu>
-+Date: Sun, 14 Jan 2024 15:19:37 -0500
-+Subject: Readline-8.2 patch 8: add missing function prototypes
-+
-+---
-+ bind.c     | 4 +---
-+ patchlevel | 2 +-
-+ rltty.c    | 3 +--
-+ text.c     | 3 +--
-+ 4 files changed, 4 insertions(+), 8 deletions(-)
-+
-+diff --git a/bind.c b/bind.c
-+index 971116a..2596006 100644
-+--- a/bind.c
-++++ b/bind.c
-+@@ -1167,9 +1167,7 @@ _rl_init_file_error (va_alist)
-+ /* **************************************************************** */
-+ 
-+ static int
-+-parse_comparison_op (s, indp)
-+-     const char *s;
-+-     int *indp;
-++parse_comparison_op (const char *s, int *indp)
-+ {
-+   int i, peekc, op;
-+ 
-+diff --git a/patchlevel b/patchlevel
-+index e340b58..6c10f12 100644
-+--- a/patchlevel
-++++ b/patchlevel
-+@@ -1,3 +1,3 @@
-+ # Do not edit -- exists only for use by patch
-+ 
-+-7
-++8
-+diff --git a/rltty.c b/rltty.c
-+index 882a3d4..a4863ac 100644
-+--- a/rltty.c
-++++ b/rltty.c
-+@@ -80,8 +80,7 @@ static int ksrflow;
-+ /* Dummy call to force a backgrounded readline to stop before it tries
-+    to get the tty settings. */
-+ static void
-+-set_winsize (tty)
-+-     int tty;
-++set_winsize (int tty)
-+ {
-+ #if defined (TIOCGWINSZ)
-+   struct winsize w;
-+diff --git a/text.c b/text.c
-+index 91c3f33..30fdaa1 100644
-+--- a/text.c
-++++ b/text.c
-+@@ -1764,8 +1764,7 @@ _rl_char_search (int count, int fdir, int bdir)
-+ 
-+ #if defined (READLINE_CALLBACKS)
-+ static int
-+-_rl_char_search_callback (data)
-+-     _rl_callback_generic_arg *data;
-++_rl_char_search_callback (_rl_callback_generic_arg *data)
-+ {
-+   _rl_callback_func = 0;
-+   _rl_want_redisplay = 1;
-+-- 
-+cgit v1.1
-+
-diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
-index 859e6eed5aa..467ea60e903 100644
---- a/readline/readline/tcap.h
-+++ b/readline/readline/tcap.h
-@@ -1,6 +1,6 @@
- /* tcap.h -- termcap library functions and variables. */
- 
--/* Copyright (C) 1996-2015 Free Software Foundation, Inc.
-+/* Copyright (C) 1996-2015,2023 Free Software Foundation, Inc.
- 
-    This file is part of the GNU Readline Library (Readline), a library
-    for reading lines of text with interactive input and history editing.      
-@@ -46,14 +46,14 @@ extern char *UP, *BC;
- 
- extern short ospeed;
- 
--extern int tgetent ();
--extern int tgetflag ();
--extern int tgetnum ();
--extern char *tgetstr ();
-+extern int tgetent (char *, const char *);
-+extern int tgetflag (const char *);
-+extern int tgetnum (const char *);
-+extern char *tgetstr (const char *, char **);
- 
--extern int tputs ();
-+extern int tputs (const char *, int, int (*)(int));
- 
--extern char *tgoto ();
-+extern char *tgoto (const char *, int, int);
- 
- #endif /* HAVE_TERMCAP_H */
- 
diff --git a/meta/recipes-devtools/gdb/gdb/0010-PR-gdb-33926-gdbsupport-fix-AArch64-struct-user_gcs-.patch b/meta/recipes-devtools/gdb/gdb/0010-PR-gdb-33926-gdbsupport-fix-AArch64-struct-user_gcs-.patch
new file mode 100644
index 0000000000..bae4103b7b
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0010-PR-gdb-33926-gdbsupport-fix-AArch64-struct-user_gcs-.patch
@@ -0,0 +1,181 @@
+From ca4802107fdb302d2650b526da474852920c161a Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Sun, 15 Mar 2026 17:13:18 -0700
+Subject: [PATCH] PR gdb/33926: gdbsupport: fix AArch64 struct user_gcs
+ redefinition on musl
+
+Building GDB 17.1 for AArch64 against Linux kernel headers >= 6.13
+with musl libc fails with:
+
+  gdbserver/linux-aarch64-low.cc:42: error: redefinition of 'struct user_gcs'
+  gdb/aarch64-linux-nat.c:54: error: redefinition of 'struct user_gcs'
+
+The fallback definition of struct user_gcs in gdb/arch/aarch64-gcs-linux.h
+was guarded by #ifndef GCS_MAGIC.  GCS_MAGIC is defined in
+<asm/sigcontext.h>.  On glibc systems, <asm/sigcontext.h> is pulled in
+implicitly, so the guard works.  On musl, it is never included implicitly,
+so GCS_MAGIC is not defined, the guard does not fire, and struct user_gcs
+is defined twice.
+
+Fix this by replacing the GCS_MAGIC guard with HAVE_STRUCT_USER_GCS,
+set by an AC_CACHE_CHECK probe in gdbsupport/configure.ac that includes
+<asm/ptrace.h> directly.  The probe is fully libc-agnostic.
+
+gdbsupport/config.h is shared by both the gdb and gdbserver builds, so
+this single probe fixes the redefinition error in both translation units.
+
+Backport of upstream fix by Thiago Jung Bauermann:
+  [PATCH v4 6/6] GDB: aarch64-linux: Fix build failure on musl systems
+  https://sourceware.org/pipermail/gdb-patches/2026-February/225010.html
+
+adapted to the GDB 17.1 layout where struct user_gcs still resides in
+gdb/arch/aarch64-gcs-linux.h.
+
+Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=33926
+
+Upstream-Status: Pending
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ gdb/aarch64-linux-tdep.c     |  5 +++--
+ gdb/arch/aarch64-gcs-linux.h |  8 +++++---
+ gdbsupport/config.in         |  3 +++
+ gdbsupport/configure         | 36 ++++++++++++++++++++++++++++++++++++
+ gdbsupport/configure.ac      | 19 +++++++++++++++++++
+ 5 files changed, 66 insertions(+), 5 deletions(-)
+
+diff --git a/gdb/aarch64-linux-tdep.c b/gdb/aarch64-linux-tdep.c
+index 76bde85188b..6c402e7ecdd 100644
+--- a/gdb/aarch64-linux-tdep.c
++++ b/gdb/aarch64-linux-tdep.c
+@@ -1684,8 +1684,9 @@ aarch64_linux_iterate_over_regset_sections (struct gdbarch *gdbarch,
+ 	  gcs_regmap, regcache_supply_regset, regcache_collect_regset
+ 	};
+ 
+-      cb (".reg-aarch-gcs", sizeof (user_gcs), sizeof (user_gcs),
+-	  &aarch64_linux_gcs_regset, "GCS registers", cb_data);
++      cb (".reg-aarch-gcs", AARCH64_LINUX_SIZEOF_GCS_REGSET,
++	  AARCH64_LINUX_SIZEOF_GCS_REGSET, &aarch64_linux_gcs_regset,
++	  "GCS registers", cb_data);
+     }
+ }
+ 
+diff --git a/gdb/arch/aarch64-gcs-linux.h b/gdb/arch/aarch64-gcs-linux.h
+index 018ca37a522..d6349e2cb98 100644
+--- a/gdb/arch/aarch64-gcs-linux.h
++++ b/gdb/arch/aarch64-gcs-linux.h
+@@ -27,8 +27,10 @@
+ #define HWCAP_GCS (1ULL << 32)
+ #endif
+ 
+-/* Make sure we only define these if the kernel header doesn't.  */
+-#ifndef GCS_MAGIC
++/* The GCS regset consists of 3 64-bit registers.  */
++#define AARCH64_LINUX_SIZEOF_GCS_REGSET (3 * 8)
++
++#ifndef HAVE_STRUCT_USER_GCS
+ 
+ /* GCS state (NT_ARM_GCS).  */
+ 
+@@ -39,6 +41,6 @@ struct user_gcs
+   uint64_t gcspr_el0;
+ };
+ 
+-#endif /* GCS_MAGIC */
++#endif /* HAVE_STRUCT_USER_GCS  */
+ 
+ #endif /* GDB_ARCH_AARCH64_GCS_LINUX_H */
+diff --git a/gdbsupport/config.in b/gdbsupport/config.in
+index 0beacf22c05..2957ee0f030 100644
+--- a/gdbsupport/config.in
++++ b/gdbsupport/config.in
+@@ -271,6 +271,9 @@
+ /* Define to 1 if `st_blocks' is a member of `struct stat'. */
+ #undef HAVE_STRUCT_STAT_ST_BLOCKS
+ 
++/* Define to 1 if your system has struct user_gcs. */
++#undef HAVE_STRUCT_USER_GCS
++
+ /* Define to 1 if you have the <sys/param.h> header file. */
+ #undef HAVE_SYS_PARAM_H
+ 
+diff --git a/gdbsupport/configure b/gdbsupport/configure
+index 133ddfa7f6c..66135791aa5 100755
+--- a/gdbsupport/configure
++++ b/gdbsupport/configure
+@@ -14307,6 +14307,42 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
+ 
+ 
+ 
++# Check for `struct user_gcs`
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for struct user_gcs" >&5
++$as_echo_n "checking for struct user_gcs... " >&6; }
++if ${gdb_cv_struct_user_gcs+:} false; then :
++  $as_echo_n "(cached) " >&6
++else
++  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++#include <sys/ptrace.h>
++	 #include <asm/ptrace.h>
++int
++main ()
++{
++struct user_gcs u;
++
++  ;
++  return 0;
++}
++_ACEOF
++if ac_fn_c_try_compile "$LINENO"; then :
++  gdb_cv_struct_user_gcs=yes
++else
++  gdb_cv_struct_user_gcs=no
++
++fi
++rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
++
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $gdb_cv_struct_user_gcs" >&5
++$as_echo "$gdb_cv_struct_user_gcs" >&6; }
++if test "$gdb_cv_struct_user_gcs" = yes; then
++
++$as_echo "#define HAVE_STRUCT_USER_GCS 1" >>confdefs.h
++
++fi
++
+ # Set the 'development' global.
+ . $srcdir/../bfd/development.sh
+ 
+diff --git a/gdbsupport/configure.ac b/gdbsupport/configure.ac
+index b7ccfabd6c6..d3b4c05daeb 100644
+--- a/gdbsupport/configure.ac
++++ b/gdbsupport/configure.ac
+@@ -68,6 +68,25 @@ GDB_AC_PTRACE
+ AM_GDB_COMPILER_TYPE
+ AM_GDB_WARNINGS
+ 
++# Check for `struct user_gcs`
++AC_CACHE_CHECK(
++  [for struct user_gcs],
++  [gdb_cv_struct_user_gcs],
++  [AC_COMPILE_IFELSE(
++     [AC_LANG_PROGRAM(
++	[#include <sys/ptrace.h>
++	 #include <asm/ptrace.h>],
++	[struct user_gcs u;]
++      )],
++     [gdb_cv_struct_user_gcs=yes],
++     [gdb_cv_struct_user_gcs=no]
++  )]
++)
++if test "$gdb_cv_struct_user_gcs" = yes; then
++  AC_DEFINE(HAVE_STRUCT_USER_GCS, 1,
++	    [Define to 1 if your system has struct user_gcs.])
++fi
++
+ # Set the 'development' global.
+ . $srcdir/../bfd/development.sh
+ 
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/gdb/gdb_16.3.bb b/meta/recipes-devtools/gdb/gdb_17.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_16.3.bb
rename to meta/recipes-devtools/gdb/gdb_17.1.bb
-- 
2.49.0


