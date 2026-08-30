Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 362D2C61DD9
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 12:59:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8126.1788094777041928895
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 05:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=A9Z0zkj5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3702f0b8a2=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UCP2wN771265
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 12:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=d1OxxCUBe7bxtcXtAH2GFNWcv87gOVCCqnlrCSiwJy0=; b=
	A9Z0zkj5rnIwlnPNKbRh/95JE7k1iEg6vkufxVw6Z96fYxmFOpx6XaCSqekZbWR5
	LtZ7HqeaQVksM2GvdAscPeKuxJk1i3W3P5SODHxUI/y7+xaAUdG4GnbZ/8no4LJF
	93BvParMXoAVc97f2THt5FzjVzxx1s3PFb4q2PUlhe+sEBi+erPKH+oVESh656In
	cRg1m0LV++KPAv7OF1uAOdBYP8YAggXAO9ggoImdS/uD0OJusZO1F5imJ43wkVBq
	TN/3UVXj/3W5vBnmhyHD3ctUXpjeJSY+N0Yq2DSv6EJt8dtLJ2lzCQkYNd4O0+BN
	1MThjzY0+SRpQsHwd2hQhg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023142.outbound.protection.outlook.com [40.93.201.142])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbpd7s6qb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 30 Aug 2026 12:59:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMUVxWkWs+kZtbF3Htgf07/HlyeFjQrconPe/122tHXnMs/tkvR0QpraPyP/cD4fMalCzokjvj1WLe788ZzDiBjdTjljIRaICdSCqM1r11hyrFmxA6jjytOYYL4PPaW+QD08SpdHBGedgi3A2GPGt6Wq7dtZAI+QeEP58IMqUMzxEyQPbCQtt9lf0NyhCoRsagOxMhhMAlfRXaKLoeuLUIR8+DiKN0IbvXQz83PA/gZJMRAPFVeky11U29PMS6dsO40NawMDrAtrNwAa1R+koqJe0lb2ujaeDYPLlzjNqb6gYTQUzTSiAa+tYqVFcCQ4ii91zkwCe0ABEt6wSNim3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1OxxCUBe7bxtcXtAH2GFNWcv87gOVCCqnlrCSiwJy0=;
 b=fbZ4TfN39rAwh0jKbxV8RKFi+7N8Rg19lfpIGqBWAQVmYtwk2SQ6MltbQiwVvDhi7PLEz4lfcPOqRmBsopEZl4zjqcN5nu5QHN+Vw0iVdAg9dyLHPgP9XSEOcW19ZDA3EH3261j8SDuc5OaQfITBN1C3Kv4HIzxFAJNlEPi3aNQUy6A9KesbQ9l3zcmHGbCsmhJoT1NZphvzX1Dw7E//tkl3SRyqeP517Y/6R+XnchbhiIZuhrPTlLuMgf9MxJhweRBNOalok7ZrtVN00BH0a33vuBDiGcciC4Rk8GdfEPNOuQ893WJpG4zQHowe5+EejkDEg5zOEAwySWXWUNfToQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH7PR11MB7122.namprd11.prod.outlook.com (2603:10b6:510:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 30 Aug
 2026 12:59:33 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 12:59:33 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, randy.macleod@windriver.com,
        sundeep.kokkonda@windriver.com, deepesh.vatharaj@windriver.com
Subject: [PATCH 07/11] pango: Don't turn clang 23's -Wunused-but-set-global into an error
Date: Sun, 30 Aug 2026 18:28:47 +0530
Message-ID: <20260830125853.1139807-8-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
References: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::22) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH7PR11MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: 636f2786-fa46-4f34-d7da-08df06968978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|10067099003|56012099006|11063799006|38350700014|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	XQGpJzIr89wCEMWnAmEFca7d+R+3a1qJd4dLQaPAX6/gX+y7I1VFBnE8Hdyl1z/V5WP+j+cFQ0ysnBsUIM71KpFhe5xzrj4s6hKKmvqsGLJKkAXRHvhTyBG8BQyuCEFQLld0apaqjTISkOR3UkifcMhyZgDihQ/9KgQV1e3UgP7nOIj295GFKKQ5XU27M8gZ748+h+ygcSXJI62ZN3dQzDkXaiJdQh9bEDadO2P93ltq8Qv2LOPjJImPNfXDn3E0nq8Bn/rZeZQFmvs0wjFSRQNa6cmw9Bp+U/yR13RRkZ+J8uFu0tHx980SHYJBtgMZA7VykFt/EJm3z05wyhcept2jet3MISbC7J3O7XVoJgquWgEvEXbWUgvZ29LI9JmoXNdyMu0Oxt7HMvimxB+idi/+tYlDi0ob0bupPs6aJ6GCQOArMGLf4R7MjA3bc1dMxrfhFFeQ3erIynEwhAcFz+BBK1aFjN4OcfViiyj21Io4FP0+EqXqd17FtpuwzCpy5WlmdhRfxkZ7ggrPgqwfNucCMeb7VZFzIZLNrBlJ5RkiBZVE1OH2JY2e7x0VMxPx9Ayn2Tr3nJgN5Qz8Mz1DBObtjiW5iFnNVuwkVHsJZCmdJqNg2lIVh+4vIgRgbk8kFuy3uEfhSavzrXOJpgKTYR/qugdYLbM9kOcfSpxvgIjxMoOzYaY90urIK1tHqaP+6XfhJVh7USX/8Mzgy429MPNJL7bX9e2SYN5rDwcRzpM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(38350700014)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m1FsOKNg2AtOBJXZv+Ka27lbp6Vt0rS5lMGtAhNxidD2gCsVEJ20l/2YWp3D?=
 =?us-ascii?Q?1Fcnvq/yjWg54RDPq5f264rFDMC4UCDrVV5Zh4SGQycjxbhJXZl+WtXjxTfq?=
 =?us-ascii?Q?PHT7av+mOLl9Rvpa/Xw4rfZqoF+zK2XS+ezXy30WMDxuy586+ZK7AuNCSwFo?=
 =?us-ascii?Q?W1J6CEQGPuMPs0LE5Qs88+JPYM8N7LlqCG8WyRZLEH5n/YdOMJ2FquFtwCa0?=
 =?us-ascii?Q?mzAomzIR8jR1umLHHKPuUPC8xLBwuA6D8a3AFET/beti20UaNsdCES1j/kPv?=
 =?us-ascii?Q?nLWY3WBTWXcq3NxbWxG+s49sMKSJ73pyGAfBcCeXgBXE0EnV3F6AL6bIxkyD?=
 =?us-ascii?Q?uHNRslRDa4Mxc/a1idBLk8SyO204AauZVMs0QRfh8H5OqBMobAmVcmetFadk?=
 =?us-ascii?Q?tgURawEoaiQYBEA0K+FCf1HYiTU3Hqwi2tzwGo1XABX7jT5Yc2MkJA2S3p6L?=
 =?us-ascii?Q?kQGRD6bWdYTF5rwDYt1ADRt+eLySlAuyNYhPGgdvUTJ1seYWMgMVTcawRLt6?=
 =?us-ascii?Q?hPsbKnTasRAQ2yEguvPvstRnh3Mp/q70X8tEhOYaTSVs4d2sLOxOQ8QATGTJ?=
 =?us-ascii?Q?pf18CuRSU67s9Qc43rzijTlPKzpsPTqCEPGc0xFBWC3xi8cXGxA89VxqiYIe?=
 =?us-ascii?Q?1qBh6z4753MsZvpJQ9rky/cH4cm4lEFlKnBF/W2EhC0w+XeN4lIpioTgfWYP?=
 =?us-ascii?Q?DMrplE8J2Agq3FdKnqinKJYsYRyWrva8QnnYBud/ZWUfj6QDlXkNn5G4Eq55?=
 =?us-ascii?Q?X8KnEjnXiOacKEsmu6ys6tBD0qxcgCtuEbuaMH5W7n0N52vMBi1pzgHahLJe?=
 =?us-ascii?Q?bvkTlusi5P1a/6Sd043lTXukbL9PKKe17NTs7cYgdKxw5yqe2IB1ZUAGqdOy?=
 =?us-ascii?Q?2AbhZQxXEg/EL2M/ORGc5DDVaC7o+3sJrQ3sO95Rr4sO1Lwc/lAqPtzYr1vr?=
 =?us-ascii?Q?C68mg+pXbVTx0D18/FE2RfZoikMbTN0ZAJkSkysODYnl97krjb2AKA/U2xpq?=
 =?us-ascii?Q?NrL9D7CTugI3KUiDtOIRTjXjytvH7pBEYKhaR716t8unoHBsRx4jestjoV4f?=
 =?us-ascii?Q?2nUuJBBe77RpoMLRPDIcRHGAVO0JvjbnQnbfp4YZ67/WYv6FtFmomwAM+EQn?=
 =?us-ascii?Q?XHkcQeDVY7yIVb3dGX0Rq4RLnGsDhVVm6fzGG5rxywuTxWcQF9TbzCYTjI/t?=
 =?us-ascii?Q?6v+DBnUVQ+HC9jQ/CPzH87aeKr8NmnOYrRx0j411oMDa3kNjmAtGkvqJgFpK?=
 =?us-ascii?Q?Fg2ZvzPB++PMHXxwIgiW/Kf+l/LvuVFooqPlITiKvRTmzbfXbWmOfTa2DVVu?=
 =?us-ascii?Q?MXJU/th5TuZn5MtEeoZFV0L9rQyIdTE2Pb2G72ZLxsnT4B7pndDBC0aTS9SP?=
 =?us-ascii?Q?NWTigUQfhKr6VzcmW2qOoxj8L0WZA1woIGAd4Iwuu5AU5wjRHgrss8FGBlnX?=
 =?us-ascii?Q?e5YFkyy2IXNEhf3w6FagJ5/kqlVftOlsiyhA/69QhF1VLCFw436BvRVS/Fkp?=
 =?us-ascii?Q?FW8to/wNV6E9aOD9PURSbQO+64E9yHs73Y+/Y6GdmvWiDcjl5yShmxrN8IQp?=
 =?us-ascii?Q?MgIn8V67qJ7c3g2/idvFvSVkhy1cXfH0nq+YAq2d9iGOzGDE17ndyAccA5sM?=
 =?us-ascii?Q?zqIA1NyPGCpGYk1Zpvqvnpa7hXvWB3No6K6DSosTRpw/xNiSfRX51Iewg8CW?=
 =?us-ascii?Q?/x/vL0Oh6z/CQWCz5EapqoYl2M9YUIS3zYLZOdMjrSNx0jOC38xs58tlDO+5?=
 =?us-ascii?Q?U6jX5gsWSuEFZDGOZV/tV6hNL2dWNVg=3D?=
X-Exchange-RoutingPolicyChecked: 
	XSWCH/gPjuuOEYwF5uS33zlR9MHACS2QcNFebWj83p3fIGYz5zmV3qvGEPgDwWfa0x+At4ZUirnI4dl1tX/oKml/13tfS2o5ppW8QmooYLIaaEg7Vy3NszsNKJ3jtljU4BWSUgd2Nxvibh4DeeAphooCQ6echj221mUjNg5xRw13J+5gZP8yY7wI1GNuBIjhkXIFeG/WEyroJ776sLWiAq/HMXvJdVZpFEPlWBYjneAJeJMizoKBxNJXjyeRooDi+VCzUSq0mpVvtwFnl+b+l9cVvNHk2+YjGd/N6PWE3O1Uar2F3StPR1pDBOb7+Jg97kQFFUCAWW6CRe9+hdJA+w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 636f2786-fa46-4f34-d7da-08df06968978
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 12:59:33.4044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6P2AAvTU3JOoaCYEGbmTm+J7LPdx3/nU8jO+K6SHXo8XwPbLdilMlS7axqrfscbgsN9hW1w2StYk7D1E5nGZ2Tds+jkIHOxC2FFBU/4jJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Ie63n2qa c=1 sm=1 tr=0 ts=6a942937 cx=c_pps
 a=h/+960zEkKFrtNevg2BoYg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=GHR8O2WEAAAA:20
 a=aiIX5UjjAAAA:8 a=t7CeM3EgAAAA:8 a=H3XmT5Wx53KFUfQxxX0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfX6LLUgOHyj3ZQ
 rZ8HXz8ZVjYG655r+eZGB4fHvg8QOGGnpvuKb2mxMD91Ixbq07ZbcCWki//i1OfuJa8MVj3gspl
 5BdsxwHHjoCgODDGIyn0QwwOtK1PQOq/ub+3WEyvsvG/uclvGX2S3awOBdITGYiNz3ZCMZsf9Wc
 iO7kFZveO3E9QFXJAQNj9sFT4F4QTh6h4Ppx7LL9O5UFgHrPMqySMVvwJFmdS+Qqx9hFOSgp/XF
 sOitZdMBhixJOekhG5DmmcrCj5hWBM6qy0l8l3ZYGTWtFq+lenPN+KhCUBLe+KAm8NfkKikLz5T
 ofMQA9McXQcxtw2Lb2IPDL+xoS1LXLE011X4K9g0/B+nuRf8jFdtGXz9T0TSKnj/GQ4AOfB7fEY
 nyzrZ1BONpOA9gWniVewX0LJsptWFER7PPIpuGhR9slOR/8qKH2ZSINVcqUQ0AylXSI0fzdYyxB
 lzu4k7pCTc1LsCi1hjw==
X-Proofpoint-ORIG-GUID: 8Fb4KhhK6wp6U867_EerWMk3io33XMn9
X-Proofpoint-GUID: Z8n6TofKd1nSQiSWFKcaeT2y1ePOwwEV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfX/4JVUlpmNOht
 brMFTfq4hxZYoh8eGoeoLZWFRyQ3zTqSuydN5tncaARd0Mh+1/zsa5KHdwQ/L3bAshOQRWC3XGB
 +BJ003uIa59XQvhB6IkWZYZvk2pNkgKgq33ZjTaCbs0bSETrREDq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 12:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244649

From: Sunil Dora <sunilkumar.dora@windriver.com>

clang 23 added -Wunused-but-set-global to the -Wunused-but-set-variable
group, which pango promotes to an error:

  pango/pango-fontset.c:36:1: error: variable 'pango_fontset_parent_class'
  set but not used [-Werror,-Wunused-but-set-global]

It fires on the parent_class variables emitted by GLib's G_DEFINE_TYPE
macros. Keep the warning visible but not fatal. gcc builds are
unaffected as meson only passes flags the compiler supports.

Reported upstream with patches attached: the meson change as pango
issue #900 and the underlying GLib macro fix as glib issue #4038.

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 ...ror-on-clang-s-unused-but-set-global.patch | 28 +++++++++++++++++++
 meta/recipes-graphics/pango/pango_1.58.0.bb   |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-graphics/pango/pango/0001-meson-don-t-error-on-clang-s-unused-but-set-global.patch

diff --git a/meta/recipes-graphics/pango/pango/0001-meson-don-t-error-on-clang-s-unused-but-set-global.patch b/meta/recipes-graphics/pango/pango/0001-meson-don-t-error-on-clang-s-unused-but-set-global.patch
new file mode 100644
index 0000000000..2c3788abdf
--- /dev/null
+++ b/meta/recipes-graphics/pango/pango/0001-meson-don-t-error-on-clang-s-unused-but-set-global.patch
@@ -0,0 +1,28 @@
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Wed, 20 Aug 2026 10:45:00 +0530
+Subject: [PATCH] meson: don't error on clang's -Wunused-but-set-global
+
+clang 23 added -Wunused-but-set-global to the -Wunused-but-set-variable
+group, so the -Werror=unused-but-set-variable in test_cflags now turns
+it into an error. It fires on the <type>_parent_class variables that
+GLib's G_DEFINE_TYPE family of macros emit, which pango cannot fix, and
+on a few deliberately write-only globals in the test suite.
+
+Keep the warning visible but not fatal. gcc does not know this warning
+group, so cc.get_supported_arguments() drops the flag there.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/pango/-/issues/900]
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+--- a/meson.build
++++ b/meson.build
+@@ -148,6 +148,9 @@
+     '-Werror=empty-body',
+     '-Werror=write-strings',
+     '-Werror=unused-but-set-variable',
++    # clang 23 made this part of the group above; it fires on GLib's
++    # G_DEFINE_TYPE boilerplate, which pango cannot fix.
++    '-Wno-error=unused-but-set-global',
+     '-Wundef', # FIXME: https://bugzilla.gnome.org/show_bug.cgi?id=792481
+   ]
+ 
diff --git a/meta/recipes-graphics/pango/pango_1.58.0.bb b/meta/recipes-graphics/pango/pango_1.58.0.bb
index 6e1aebad1d..0c9e26f39c 100644
--- a/meta/recipes-graphics/pango/pango_1.58.0.bb
+++ b/meta/recipes-graphics/pango/pango_1.58.0.bb
@@ -18,6 +18,7 @@ UPSTREAM_CHECK_REGEX = "pango-(?P<pver>\d+\.(?!9\d+)\d+\.\d+)"
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
+SRC_URI += "file://0001-meson-don-t-error-on-clang-s-unused-but-set-global.patch"
 SRC_URI[archive.sha256sum] = "bc5bad6213ad4886a47d1e80292fd850b64159b50db67917a43d9ea80ee2298a"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
-- 
2.43.0


