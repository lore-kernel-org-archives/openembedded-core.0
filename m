Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017BBC5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:27:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3065.1787131648351081855
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OrdB06TY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=269148e14b=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6Sp6t2539890
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 02:27:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=bQEwrBUOC
	Wt7c4YS9KIyfykQ/TLlseElerhXd70yXks=; b=OrdB06TYmgmYaYQMhc+pouug/
	QiSthmZ1oFOwKf1K7sekh0+U/PDB87JY6GIippdagJ854+3qhTZw4Yim1zJ+1AX2
	2kmDPdBkTC2xPbL/Iu42/kBalSjdFTL22Z343GPLgmQ4H7xTc34ydS9zmvBPNmMR
	wNEG/DGovbamLGFZIcw2bF4gc7Yu+QM7rUXft95zgAAggM/nRR3LuWSECSBuMxVK
	A4+sAeUWrin9/fE2d+MeBESbbQ+nl2eQExBwRhW6Gvd3O8/8SPr90oKDgkjMrQ7O
	N22/ScE7ZTkxtrG5giGoecoLo/fD9NNL6/m/eFDbPI9+FJHZAASMCXzZXJtwQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020114.outbound.protection.outlook.com [52.101.56.114])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g4ydb0qnw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 02:27:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDTfB2kdRQ56cYl0l2JSNfCZjvZroJZ7i8mOtNqB9fE34Pq84evOVWv8oYmaHAlcggyC5N360DYJzEvKDf8ZLUiTj/jvtN3mHqmlZjGb0+rVT0mQGPnqlGb/kusZsSQhJjZgdAfFWVJaZqb9HEVg8/yJH2JFQUtNKWEJgyqZ+uzYAlunBD5JAMSMfJFNithiDKK1hjNSWl5GIQH9O3y0jxIVMjp1WtCNhS/sXCJCAiOIgTLMH4bruiTvewA1adrfsPJcxWEqW9OWTdYPgNsTdIAsfi9Tn5Pp31t/jwKpKWUZRMezBR2qQ9uIV/fQ0ODYiYG//cdtoyVEAqYFLKJ5EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQEwrBUOCWt7c4YS9KIyfykQ/TLlseElerhXd70yXks=;
 b=CshsGhdPyKzGlw3018z/O2Oqb+wfkF3eAFQvjob0bhVSwNzk0w4zLjooOaYZadb3m+J5azR69+aVM74EJ3kwy3tmBD+sOliMKcA+ngAoQPEzhU2FZUO/KLnzR8aEuyIFH48Y3IRfLoETTm5/u8Gfotne5bpOkfrwEH033//HWj9U6uPdGXKCM9KL8HD4s3RGSpXHHXpULxYn7AEftJvT/OACExP0nOVqCsYs5u3e7xeZrzcTe3davpoqzoT3iimetQ221Hddxd8TZrpo8n5PTbP4v5YvV7P3apmpmQyoZcKg5ZD56W7kPGzbxKEYb758qEcXFH0aRfFPAUBvzoGnTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 DS4PPF382351574.namprd11.prod.outlook.com (2603:10b6:f:fc02::1d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 09:27:23 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 09:27:23 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [scarthgap][PATCH] glibc: fix CVE-2026-5435
Date: Wed, 19 Aug 2026 02:26:34 -0700
Message-ID: <20260819092634.570557-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0163.namprd03.prod.outlook.com
 (2603:10b6:a03:338::18) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|DS4PPF382351574:EE_
X-MS-Office365-Filtering-Correlation-Id: 95337933-3ddf-45dd-75a9-08defdd41360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|10067099003|56012099006|6133799003|3023799007|18002099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	J6dYN//E80XV2i0GIMHhgMevKnB+i7VIxfXiHk26cV3D67/KL/NOejlVaG5AoUkVMeCWU331KVJhNOjje/hwkaFW3gCYHd85dtsG+e40buQm5Z1MKkW6m5+7alMVsTahRflMl0oRLJ+NNKFOB0/DiUT/Zy+g9xhAma8gEeEGMNVLOwBqndjMiYr4gF8Rvk2OwsuK+v/TklPL4rSA68gCkVKyON0p4HaZbYaO2xePL+0ZHZs0MS9+7OrTaH+C/qC06RrZhoSNlEsLO4CunEbur4gW0U8fHL4VyXZRRIoJOrH4CrmieJnyi5X1MGOYT2HES1ZoZz7r0f6KNPtUfWzJnFwWBPSLPSbmCkJW/fhRRfLSaZ9bLs/cr3vCxQtmj+jWG53wSdtIt1ORdbzFG9SNXwPj1Bp3j3mLOAv4t1zEmoIyyQZSw+gm6BQUsw7/tjD0bjvSNFSm0pMl2igeww9Q7jN/HENSiOfJWIvDnyYiVLp2dZu6Sy9dkE92hkZqXqkzS0GDUTmd5pQ+c3vc4CL1+Ncp18gdRAD8rJfAP0GL9Do15axDQ6nu5lgBD26Ey8nDCg/Z9tRBH/xp6ObPunFNrr24kTMX8lxGAZH7erZ7rxDS16Rpoj59SlN+i0sRh7K7B411REw6ekV9oF44yjV8dBN3/KAySQfEa1pi64XOQ8M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003)(11063799006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+l7XPH5Msob1YI3TS+YQEB0U083u4SVc3PVuuvqkEuBZHlxIuJW2oONOFpN1?=
 =?us-ascii?Q?bW4SCi0x/6hxurDMmWl99RmXAXBtkDuA8YaJieP3djYh4Ny+rIehKGtilivN?=
 =?us-ascii?Q?+Ez1W9BNf1yv9D47yqPOkC1i9VhoWk3zC0BY1ajF/0a45OcGzZH5IxtGXebS?=
 =?us-ascii?Q?ootK7rT717X37jhsRnzDPzx0bzzyMdGZh8uAXc/qiRxgP5ax+41znbAUbUEJ?=
 =?us-ascii?Q?bdOLngOL4RWgu690erSnfPi+XjmdepNjLCejLiaWuGtlCJEc5kR2bNrIa/1H?=
 =?us-ascii?Q?KhmmMxwiTKxWWMvE7hwet/+Jl65xX3PuOghHG4PMd7XqPGS4sZBEIt5jJ2Pq?=
 =?us-ascii?Q?8aaa7YqqeqAA1Q4w/3hLRRjQ8jK6ljMa9+Ad6rpSlL/DrpNvsms5mALGABT3?=
 =?us-ascii?Q?UgECvbDJ4fmUye7q/jmoQUqx6AxTXRewM+bQWKz6t9Ma2BnJtUtUVfGPujvt?=
 =?us-ascii?Q?0r1egz3g4boU59/sTBHFxc8qdkVPxHlTEil/tUuL5fntDBjpfWL45KP1z/a8?=
 =?us-ascii?Q?h2R1TBiUig7jm6HGEcwHle7qLoY2oOPS/bGmUQ6oamk3dcr9/Iwa7NyQbKKc?=
 =?us-ascii?Q?0EOa9WjSiDpdzLoBF9iJXKfi0qFzEvR/gEH85jEBakt2dwtvCTv6++2XcREy?=
 =?us-ascii?Q?p2UPQZGXTn1cC6nqPMxe7HTU2k/ZW8NcnT6MgFzDXAVYexsOxyS/KGelQTD4?=
 =?us-ascii?Q?YBQoAKEB540iorX+mvq3EHxBTL6zlGwS1lfyRIYhnrlnREwtyA4MawsSKFhs?=
 =?us-ascii?Q?/LbepYbTLznQGPDu1xSNCAY2TZsD2FWPpLyhmcIG+9AmmCKwVuLquuOGl3Zj?=
 =?us-ascii?Q?CjHtATAMhNSjaAGhpguE0BS96B8OofCvpMv9Q+Md2/itLewmIsf3UEDP/g1J?=
 =?us-ascii?Q?517Qk+NgKQIl5aLyc9fNXB4Iiwr+IvFbwO1aA0kBJPI8g9bV9WjLme6BIAJH?=
 =?us-ascii?Q?bLCsEtQyRgm2BPkh5AqkufBYfLzZVZsXE1273FlbLcKtAB14wrvsZGDhPIUm?=
 =?us-ascii?Q?RQm8MXE9LXdsnwQTZPJb9cusPcHa6WeKoOPB5vp71JXWbqaGfP7Wn7tgIVFi?=
 =?us-ascii?Q?BJFSiQ+FJsKP2gEX2LEyByBhyaFZxurXNOhcZDUHXpXvp/Jmx/6vu+d2OBwh?=
 =?us-ascii?Q?vWL0D3z66FyeWSxW/98TX+8ujsUDRyBNMuvLp1807CFrSk4xUmNl2A/s6M3j?=
 =?us-ascii?Q?wrp6oz0FUXkzfkw2kJS2M4By6Xf+rMvKjdN2bZxEWb8jL+5njL0WNXGlvj5T?=
 =?us-ascii?Q?NtMJpVNYmsTptc5IgUaoLIZqMII5+kLPAUbeHAyi/Nres5fhbTJXPz4nht0i?=
 =?us-ascii?Q?atLOI57OV4BrWf4ISBAeYL5cECMG0FJmH5y15yjmvxGj8gWHyWV8jwrEurzl?=
 =?us-ascii?Q?AFew/tuwscLtIUtnbCpmNYIrX5nVTFK7v8Kbh5WHWhFIaLgoJKdS3nNiS/JF?=
 =?us-ascii?Q?gDGC4bhB/slaBa8rBvNizGCrsXngXxbhhzG2qY+331JhvXTnb6/Y+Vl0zH9f?=
 =?us-ascii?Q?Eey1VtI1uRAD5Da/dmpPJ7Yc2TcQ08OOV8iETrizfaaWxWzfG2SLui4viXfW?=
 =?us-ascii?Q?bQAytEeevb6XzBPBuQ3Bhx5kKVNvZQf8jOLipCIIH3ewHjlbdPn61L03dp7C?=
 =?us-ascii?Q?+jC2DIb37Qv7NqnbQzLOQx7cxLCn5lEbamevsho6kjGdtEY+UXEc3L9Nh4jk?=
 =?us-ascii?Q?TK+lHfm3iO+CiRzuAKoNRn9ComxGP+lY2+a+T893gvd8g4PeqzdcyiGC7cBu?=
 =?us-ascii?Q?BL0fK2PO6zmPYyuGOEuAkFbUc0qNZWk=3D?=
X-Exchange-RoutingPolicyChecked: 
	UoF9qol2QhRtjVPhfkvkLcKswWTUFHFCwzBf+gqsE0PI3h5Ezvy4yZFJkri3L2G8UE1sBC/tdOkPUF5VhYnSRa9JcGhohp1qHQEqXYAsesjFJAp1fvneq3vdvmhKM9zZ6yFo4EuSup8fXN4z89oeyeJzhDxmD+M7oju0Enjx4i4tJCPqxB901ZBmUyAyHx5WOgrTUOVyIgrOKPgKZuoZ2i0Z9vliZcaHq18gvqKaT0kXZANZYJJ19NuJtnek/PX4J4YhHRtY18Gqr1h+KdMlPNbpIji5noWgkg1XwMp+C7kJOcQyuso+qqWg/yCeZCcGR0EKICNSG6NvIbNudJNEhw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95337933-3ddf-45dd-75a9-08defdd41360
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 09:27:23.4413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SN7A8WEUlr2FkdRE/w4pDNSwD2waZ0NEF00fSdt1DxbGRzYD4jUFGHocKSrb8TOicl7MK7eNPc8MPz/vz6MXpVp/FLjXRxJVYsweJnQK/Is=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF382351574
X-Authority-Analysis: v=2.4 cv=S83pBosP c=1 sm=1 tr=0 ts=6a8576ff cx=c_pps
 a=+29CLaFxg23VDaVrfDag4g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8
 a=lyc__pwGggtp0m8zD5wA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: v6Y2HqUeCiKoaRzzKXNM4iaaYCTadUqP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA3MSBTYWx0ZWRfXxlstLsoQ3V9i
 9YQ2vFYxIaWtKKnJA/8rQu4xIKKVVq1kJyqXhXwFs1asJiEwhnxWzcu/9GtqmUcwmiS5Vkp6qsl
 Fmtnn+JI+fJBX7bA+GaHzIOIRZ3N2up8D6FB5a+Bw85Lxj4RZUkO
X-Proofpoint-ORIG-GUID: v6Y2HqUeCiKoaRzzKXNM4iaaYCTadUqP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA3MSBTYWx0ZWRfX1YpI/7DyaNCU
 Q7ZaNUV01o9TgZ/lyAVvXZU1eZSWXG9jjOx9r5mycayo9Lo/pERHBUpDky6hPEGJhTPOy+zPwQy
 cW9Ifp27pb5XS0lVDV1r1Tf5FsI8sqsOKijNK0XcLtVTnlRpLiG5CsIFqtqn5URbmK30iyR0qhM
 wPA/hVwIdkHuLk+WF8m01AGVNc8se7TQ0h6yZclXfSanS8HpPcSb4TPEpodW/HwBqibMHLaL5iL
 rcUMVQvPaG4jVqAnx7E9c5qBtLkt6X5RDUZlhDZPnbeD+hf7X21XL8NWMoMynLbp8sNogFIr1dx
 1tDrPhxoqZzFMIIHiZsWGQC8Y7yIwui/txRqkSaNZUOJ7L0UQubqNye/MoWWFQOlphFSAubbuPS
 mEsDgkTvaqh1limaAfBpaBxIkno7obRzCkycpK6Qa87jCYFc4mvbpPTCWxk1iOXjNaB/txQTxYO
 IendpTRFgNKdVKoFSRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 09:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243721

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

resolv: More types as unknown in ns_sprintrrf (CVE-2026-5435)

Specifically, CERT, TKEY, TSIG, OPT.  This removes the buggy
implementations of TSIG, fixing bug 34033, and partially
fixing bug 34069.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-5435
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=34033
[3] https://sourceware.org/git/?p=glibc.git;a=commit;h=ca44a6609c29a683b03575fa035c6d17aa591e72

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 .../glibc/glibc/0024-CVE-2026-5435.patch      | 137 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2026-5435.patch

diff --git a/meta/recipes-core/glibc/glibc/0024-CVE-2026-5435.patch b/meta/recipes-core/glibc/glibc/0024-CVE-2026-5435.patch
new file mode 100644
index 0000000000..722ec2129c
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0024-CVE-2026-5435.patch
@@ -0,0 +1,137 @@
+From 5d41b8e5aaec3580e4a05d93c5ff2fc69bb3d5a7 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 19 Jun 2026 18:22:20 +0200
+Subject: [PATCH] resolv: More types as unknown in ns_sprintrrf (CVE-2026-5435)
+
+Specifically, CERT, TKEY, TSIG, OPT.  This removes the buggy
+implementations of TSIG, fixing bug 34033, and partially
+fixing bug 34069.
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+
+CVE: CVE-2026-5435
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=ca44a6609c29a683b03575fa035c6d17aa591e72]
+
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+---
+ resolv/ns_print.c | 96 -----------------------------------------------
+ 1 file changed, 96 deletions(-)
+
+diff --git a/resolv/ns_print.c b/resolv/ns_print.c
+index cef2212fd2..882a86e58e 100644
+--- a/resolv/ns_print.c
++++ b/resolv/ns_print.c
+@@ -434,96 +434,6 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
+ 		break;
+ 	    }
+ 
+-	case ns_t_cert: {
+-		u_int c_type, key_tag, alg;
+-		int n;
+-		unsigned int siz;
+-		char base64_cert[8192], tmp[40];
+-		const char *leader;
+-
+-		c_type  = ns_get16(rdata); rdata += NS_INT16SZ;
+-		key_tag = ns_get16(rdata); rdata += NS_INT16SZ;
+-		alg = (u_int) *rdata++;
+-
+-		len = SPRINTF((tmp, "%d %d %d ", c_type, key_tag, alg));
+-		T(addstr(tmp, len, &buf, &buflen));
+-		siz = (edata-rdata)*4/3 + 4; /* "+4" accounts for trailing \0 */
+-		if (siz > sizeof(base64_cert) * 3/4) {
+-			const char *str = "record too long to print";
+-			T(addstr(str, strlen(str), &buf, &buflen));
+-		}
+-		else {
+-			len = b64_ntop(rdata, edata-rdata, base64_cert, siz);
+-
+-			if (len < 0)
+-				goto formerr;
+-			else if (len > 15) {
+-				T(addstr(" (", 2, &buf, &buflen));
+-				leader = "\n\t\t";
+-				spaced = 0;
+-			}
+-			else
+-				leader = " ";
+-
+-			for (n = 0; n < len; n += 48) {
+-				T(addstr(leader, strlen(leader),
+-					 &buf, &buflen));
+-				T(addstr(base64_cert + n, MIN(len - n, 48),
+-					 &buf, &buflen));
+-			}
+-			if (len > 15)
+-				T(addstr(" )", 2, &buf, &buflen));
+-		}
+-		break;
+-	    }
+-
+-	case ns_t_tkey: {
+-		/* KJD - need to complete this */
+-		u_long t;
+-		int mode, err, keysize;
+-
+-		/* Algorithm name. */
+-		T(addname(msg, msglen, &rdata, origin, &buf, &buflen));
+-		T(addstr(" ", 1, &buf, &buflen));
+-
+-		/* Inception. */
+-		t = ns_get32(rdata);  rdata += NS_INT32SZ;
+-		len = SPRINTF((tmp, "%lu ", t));
+-		T(addstr(tmp, len, &buf, &buflen));
+-
+-		/* Expiration. */
+-		t = ns_get32(rdata);  rdata += NS_INT32SZ;
+-		len = SPRINTF((tmp, "%lu ", t));
+-		T(addstr(tmp, len, &buf, &buflen));
+-
+-		/* Mode , Error, Key Size. */
+-		/* Priority, Weight, Port. */
+-		mode = ns_get16(rdata);  rdata += NS_INT16SZ;
+-		err  = ns_get16(rdata);  rdata += NS_INT16SZ;
+-		keysize  = ns_get16(rdata);  rdata += NS_INT16SZ;
+-		len = SPRINTF((tmp, "%u %u %u ", mode, err, keysize));
+-		T(addstr(tmp, len, &buf, &buflen));
+-
+-		/* XXX need to dump key, print otherdata length & other data */
+-		break;
+-	    }
+-
+-	case ns_t_tsig: {
+-		/* BEW - need to complete this */
+-		int n;
+-
+-		T(len = addname(msg, msglen, &rdata, origin, &buf, &buflen));
+-		T(addstr(" ", 1, &buf, &buflen));
+-		rdata += 8; /*%< time */
+-		n = ns_get16(rdata); rdata += INT16SZ;
+-		rdata += n; /*%< sig */
+-		n = ns_get16(rdata); rdata += INT16SZ; /*%< original id */
+-		sprintf(buf, "%d", ns_get16(rdata));
+-		rdata += INT16SZ;
+-		addlen(strlen(buf), &buf, &buflen);
+-		break;
+-	    }
+-
+ 	case ns_t_a6: {
+ 		struct in6_addr a;
+ 		int pbyte, pbit;
+@@ -557,12 +467,6 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
+ 		break;
+ 	    }
+ 
+-	case ns_t_opt: {
+-		len = SPRINTF((tmp, "%u bytes", class));
+-		T(addstr(tmp, len, &buf, &buflen));
+-		break;
+-	    }
+-
+ 	default:
+ 		snprintf (errbuf, sizeof (errbuf), "unknown RR type %d", type);
+ 		comment = errbuf;
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index f6be1b5fc9..88ad5e44e8 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -56,6 +56,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-qemu-stale-process.patch \
            file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patch \
+           file://0024-CVE-2026-5435.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.49.0


