Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65273C7EE2C
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 09:37:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8770.1685698664684738751
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 02:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=fM/JlnXO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=551703f53a=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3527KBrC025071
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Jun 2023 02:37:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=QrFvnMp3lXvAaIQhhmb5AR5Mnb74Hy4NoAW28q0xS7A=;
 b=fM/JlnXO8GjmOQjHb4mp1nWlj9AHDxRKnFA0mOJSuy9V+IhkCwE5HtqXG1Q1NkiYvsIb
 /TLzQTw06ebdIMvBnEcsmD9NF/azRqxTD7vZDVRIWdSpiOSa+qEJXIjcZDUZsuKogE7E
 AKOnCftXqrIRpTJZixIRL/AtzIz+blOUh9ymDVbqKTwXg0NNusaufb1QHTaOEvElN8oB
 37Czi37W0QB4Pj/5uJEHlqAO/rWpTAHQtr3/le9xLkLSjc755tXF4P6tJ9bGZNem0L6z
 HoRTQ7GyQZR3GZagidGH7/j7QSzUQtSr8/LRcJkx/gwSW/xWGVdnyOhonv0c8vbKAiB5 Rw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3quhcjdhup-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 02:37:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/43TySZV6uCogHgve7uAaoxca+beg5s9C38upvnTLBGn+btqutIe5earf8Nw2/ZZymcECTMH+HgEgTk/RXXiShUHbsUSrHlZhLjl+7KNlXgZAti7MdLW8J7XahCKL5mQ2OY5eMHUpCxjdKDoewjHlSSKbxKtSnbPxYTAw1cieVk7OnmYU9MeUbu7uClYbJwZmqT2NoOUEDXClJfWQazH3XIM86KVSRoAbbC50mD0/K4NbuMK0Gq2bK9eiEhAq8XetlX2ANd+lo7R5RiTZTCwB+EmIbB7Lzxv3350lTcKbR/edEmkxc18uXhByj1k3WtTY1EI8OPdoUdS2F+lcgi1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrFvnMp3lXvAaIQhhmb5AR5Mnb74Hy4NoAW28q0xS7A=;
 b=eCy49beGKBHUkIj2tIE+HZ2qJdZDjTgUPd0y1n0Bxy70OxcO6HhhuRsY9Jv+lKzeas183MmesswrwM+h/E6Xo1/H4cyJYlPg8OMh73C4qAYQuBB+YU3zC8Sci8CwKLT1yn02dl/8/fwOARqsuJY3kBK+uHSrD28a4uY6vsI8m3mvV8NXtFSdQOSxUiIebUy2N9qBxRiYdGogBskMjV8Xq1fbrEGy0tbTgzDrOMzJnnp6OBaDvzOVLMcLyquJhl4E6gvazWSYYunzzsHiJbaitY2FSMuuMAd51pNNTZSi1yYofNtz2z22DdehwH5FYKsO7orY1rZEqWReOIPNmTKX7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 MN2PR11MB4709.namprd11.prod.outlook.com (2603:10b6:208:267::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 09:37:39 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::dbf:2d56:8263:b889]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::dbf:2d56:8263:b889%4]) with mapi id 15.20.6455.024; Fri, 2 Jun 2023
 09:37:39 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [mickledore][PATCH v2 1/2] go: Upgrade 1.20.1 -> 1.20.4
Date: Fri,  2 Jun 2023 05:37:09 -0400
Message-Id: <20230602093710.1026508-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BL6PEPF00013E07.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:8) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|MN2PR11MB4709:EE_
X-MS-Office365-Filtering-Correlation-Id: ec2101a0-434a-4924-bc73-08db634d011e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Amr1l25Dp5YTfKLtSMzqd5FvrLW8ndbOcCFencGVMxtR0ZccJQfo0Ddg7VcbGpbERYjrCv2HyoK2gO68X1vkK66JniN4lDEj5jQfvreXk6ustObkTGnNDSh/El/9JT3mwrjtxViSCvmMI5LMSTckHvDznlAXeEV7T2Q1qAI3w3NVkv38T6y0qMBZ++MELWJML+MpBuMtFH+pTusMHyqn5kgrePNGGGn5ILx13vKLAbs50+LF1TNsH1U4jh3yc3Skn5kOZ0vAKSSCUdUIdioUkFe5AL8TLy7H+WT6p1eIjGXD03X9lOo+C+LRhaaPvSefGJbjVRoYsC6H5+LnPvqAY8zXDz3FoFH5ttp1epLeaVuidl7lZMOmFnNbDQSuzjam7c2PyNEE06goJQ7wd4CUShYmxslkcz/KddUTbwZ4wDJSAIs5oKKVbqOzHhT12X6eDF4itM7e4HoW8e78KcyL6XUqkjVmtqKT+2BWTCSKWsBS6popxIIZ+vlHdiT8vWIFpkziqydyNrX6quUZ8JurlOVyQx8w8dNJSrKdGV7zgFuugCguJQQzQ46kvNvIqOblRW+FsYjhH1HFj4T7jMrDsp9Y9yiaFWIuDOIUWhQh+FXgjCbJ7eq//kBFI7gFq+cwLL12ApHf0MRg3r5X+5msrQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39850400004)(376002)(346002)(136003)(396003)(451199021)(44832011)(66476007)(66946007)(66556008)(6916009)(316002)(41300700001)(8676002)(2906002)(30864003)(8936002)(5660300002)(6666004)(966005)(6486002)(52116002)(478600001)(26005)(6506007)(1076003)(186003)(83380400001)(6512007)(36756003)(2616005)(86362001)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Ylp4RlFNRVNSNVlZVUMwd09LLzIzWkNDWkFvLzBBaENQNWRLVjNZZmxrVS85?=
 =?utf-8?B?dll3WU8xRjNLTnBVNGtpTWZVblJuc1k1aEc5d0JjaXBHTEMzMHoxUU1tQzQx?=
 =?utf-8?B?NmdZWi8wV1VnUXpwYUdDcVMwaTRUa2lBU0hyaEZ5cmhZZDJsUG9LM3hNMDYr?=
 =?utf-8?B?N3M1VHVRMWt1RUpHTm1zMExoY0daSnROcDFKZ05lTEFISnYzc1hSSkZScUxh?=
 =?utf-8?B?SC9iMkxsY2ZHMFNURzNTVUNrTng0WThhb2lOZk5sZ09raWpTaGM5RGFGby9N?=
 =?utf-8?B?ME5qMXBwYVdzckNENnNYT0NRQldSbDRxNFVYZ1pDQzBrTGd2Vmw1ZFJDd25D?=
 =?utf-8?B?Z1VWaFk4ek0xNTNUZzRhK3loYlVQOW9GZ0lvaTFyQnVZL0VCam5sSDlIaXNv?=
 =?utf-8?B?bEdSaytCVkp6cFNYU0MyeW5Pbklpb2xENXd2OUFoYjNlbzBwZk5lT2k1UHdp?=
 =?utf-8?B?SU5pZTdGNU5hR0orc29zM3d1bzVqYTJHMWFFVTRRMHU5K2plWStlR2FleHcy?=
 =?utf-8?B?QXQ1TWhUalk4SzFOUGZkV3B1RzJtOWFUVkhzTWhJOTNXOTU2bGlsUDUyS2dm?=
 =?utf-8?B?SGh3dmZMTmI0a2RhMGhpaUlvdTBZOTl2ZUlkTTVHdFREZGtxVmE4QUxINkht?=
 =?utf-8?B?WFgvQ0U3MGloakhETCs0MkxWdS9xWmhISWx3bVBWcHAzbWwwQzhEbmFsQlZN?=
 =?utf-8?B?U3pDYjVCckdFYmdQYldUQ3B3VTdpcWhJcDNJSUpiQTV1eSticWdheUxOS25X?=
 =?utf-8?B?WlFEcDdxZEgxWGM1RWtpWHFUVWNtMDZqUjBhTmZ0TDR4bXREc0hHR1JKb3hJ?=
 =?utf-8?B?d08xK2hXTHFMNVpIMFZoOVRaaHh3WXFwRVhXY0lNOThUdGpEdWYzenFLMGZH?=
 =?utf-8?B?Tk5SWUs1SW4rQ1NDSVhUUU1rWkREdVRaSzZaSW52UGVKMHI2bXcwOEV6emZv?=
 =?utf-8?B?UEtlSWwvUk1UYzkyNXJlZFdpV1dRd3N4TEpubE55SGhvdmdveWNpd3AzK2J1?=
 =?utf-8?B?TFlZME9TMkYyRUVKejJJTkVtTmJPZWYrZGtNTHVuZldGK0tSVVc4cVFDS0Np?=
 =?utf-8?B?SDM3NEh6ME9xRmJGRU9DQnlpSDh5MllWa3J1RG9xYll3MVFVNkpjaEpJSE9o?=
 =?utf-8?B?anhnMHc3WkJYRlRTSTE5YUFyQWhVRnp3ckJNcjJRWkZiOEZxOW5xUDdnUFUx?=
 =?utf-8?B?MjVmME1ic1lMNHQ0ajNQQS9DZ0NGUmhCTGg3anhFODIvVHZWSDZkVHU2d3J4?=
 =?utf-8?B?ZzkxVjVoV1FKcCtQb3FVY0NHUEN4OU9VMWVGQTBtc2tGemxnNktxcUJHNFh0?=
 =?utf-8?B?bmZXQWE0SjlUUFRkYVB5WWZvK0NJc05oNTVFOFNjUFFvN2t6d1ZCakJyOElP?=
 =?utf-8?B?UG5ha0x4bnBoNGJXUVRYTWt1MlNNTHZEK1kwVFVKbTNQUWJIa1B4RnpSVDVC?=
 =?utf-8?B?YndGUHQ5S2phWEFLQ0RwdkxHMXNkYS9uTVNzWWNYQWtJck9VSVlmRlZ0ZGxU?=
 =?utf-8?B?K2txOFZNbVBvTGpFK2J4MjA0TW5hL0c0ODdpUFY5MlJPdGI1TVFEcGtZOWxa?=
 =?utf-8?B?ZDVqc3RwUjE3TFBqU0cxZHBRTno4cVNXeFNOT2FHK0l3ZWRmY1N3VkhQRGMy?=
 =?utf-8?B?YkFYWTdaRTVvRWh3U0ZGb1ZRWjVWK3JwQXV0SVFHWGNLaEUzS3hPaWtOUTJF?=
 =?utf-8?B?RFhuR3VkL082NG53UEFKbVhjVVF4V3BTaG1raTN4eVFRZ1NEaDJoYndaM1R0?=
 =?utf-8?B?dERlb052UWRaU1J0K29Gd05UM1lmYmFEZUdoTGpwZzhjNWtkdnhLejB1VVFp?=
 =?utf-8?B?U0RWcUxldm5HVlI2ZFA1bFRMMVBzQ2NQZk9ubEQ5L2drOWxxeHVjRFVaSFFr?=
 =?utf-8?B?cURwcFkyMFNFemlmTnRKV0RtT0p6b1NkWCtJQ3Zid1VidUgxYWJnSGRYVlFW?=
 =?utf-8?B?WG1MU3pHTlgyUFVWSi9GMzdqN1VCNDRWSTcxTHZBRzc3SGdXUGMzQmdlNkVK?=
 =?utf-8?B?eEM0VmZnUEFPbC8vRzA4UXJFMG9uS3d5d2FLTDZTR0lIVksvNjFpYjhZdWdu?=
 =?utf-8?B?c2FjaVVRK3VJTmdtM3JEa0hqcDFXOHBCdTVCZUREbXoxSFJMbFlxU2xPZTlQ?=
 =?utf-8?B?eXBudHZxbEprRWVsRC9RWUxnelg1SHhhTU5hMDZiYWVFVTFGQ01NR1N0YVI1?=
 =?utf-8?B?QWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec2101a0-434a-4924-bc73-08db634d011e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 09:37:38.7378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yz89QuhSb1Fa1hsL2eE6UEWPRKIImsctYGmRrF1V6ueZPgpB0rbshW8TB3hWImJSk0yn16KXjD8pGaOFYS06Kf8MMJXdKrSwePkWKMEp3lk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4709
X-Proofpoint-GUID: o0Fp5wzeLTTEfBzeyLTsoUUIZxL19nHp
X-Proofpoint-ORIG-GUID: o0Fp5wzeLTTEfBzeyLTsoUUIZxL19nHp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_06,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306020072
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3527KBrC025071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 09:37:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182297

From: Khem Raj <raj.khem@gmail.com>

- Remove already upstreamed patches

- Brings a list of changes [1] [2] [3]

[1] https://github.com/golang/go/issues?q=3Dmilestone%3AGo1.20.2+label%3A=
CherryPickApproved
[2] https://github.com/golang/go/issues?q=3Dmilestone%3AGo1.20.3+label%3A=
CherryPickApproved
[3] https://github.com/golang/go/issues?q=3Dmilestone%3AGo1.20.4+label%3A=
CherryPickApproved

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e043bfb42156c59c93c6a4816528a63cfdaccc3e)
Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../go/{go-1.20.1.inc =3D> go-1.20.4.inc}       |   5 +-
 ...e_1.20.1.bb =3D> go-binary-native_1.20.4.bb} |   6 +-
 ..._1.20.1.bb =3D> go-cross-canadian_1.20.4.bb} |   0
 ...{go-cross_1.20.1.bb =3D> go-cross_1.20.4.bb} |   0
 ...osssdk_1.20.1.bb =3D> go-crosssdk_1.20.4.bb} |   0
 ...o-native_1.20.1.bb =3D> go-native_1.20.4.bb} |   0
 ...runtime_1.20.1.bb =3D> go-runtime_1.20.4.bb} |   0
 ...ompile-instantiated-generic-methods-.patch |  90 --------
 .../go/go/CVE-2023-24532.patch                | 208 ------------------
 .../go/go/CVE-2023-24537.patch                |  89 --------
 .../go/{go_1.20.1.bb =3D> go_1.20.4.bb}         |   0
 11 files changed, 4 insertions(+), 394 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.1.inc =3D> go-1.20.4.inc} (77%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.1.bb =3D> go-bina=
ry-native_1.20.4.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.1.bb =3D> go-cro=
ss-canadian_1.20.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.1.bb =3D> go-cross_1.20.4=
.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.1.bb =3D> go-crosssdk_=
1.20.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.1.bb =3D> go-native_1.20=
.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.1.bb =3D> go-runtime_1.=
20.4.bb} (100%)
 delete mode 100644 meta/recipes-devtools/go/go/0010-cmd-compile-re-compi=
le-instantiated-generic-methods-.patch
 delete mode 100644 meta/recipes-devtools/go/go/CVE-2023-24532.patch
 delete mode 100644 meta/recipes-devtools/go/go/CVE-2023-24537.patch
 rename meta/recipes-devtools/go/{go_1.20.1.bb =3D> go_1.20.4.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.20.1.inc b/meta/recipes-devtoo=
ls/go/go-1.20.4.inc
similarity index 77%
rename from meta/recipes-devtools/go/go-1.20.1.inc
rename to meta/recipes-devtools/go/go-1.20.4.inc
index 179f0e29eb..05bc168e0c 100644
--- a/meta/recipes-devtools/go/go-1.20.1.inc
+++ b/meta/recipes-devtools/go/go-1.20.4.inc
@@ -14,8 +14,5 @@ SRC_URI +=3D "\
     file://0007-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.pat=
ch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
-    file://0010-cmd-compile-re-compile-instantiated-generic-methods-.pat=
ch \
-    file://CVE-2023-24532.patch \
-    file://CVE-2023-24537.patch \
 "
-SRC_URI[main.sha256sum] =3D "b5c1a3af52c385a6d1c76aed5361cf26459023980d0=
320de7658bae3915831a2"
+SRC_URI[main.sha256sum] =3D "9f34ace128764b7a3a4b238b805856cc1b2184304df=
9e5690825b0710f4202d6"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.1.bb b/meta/r=
ecipes-devtools/go/go-binary-native_1.20.4.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.20.1.bb
rename to meta/recipes-devtools/go/go-binary-native_1.20.4.bb
index 239334552a..87ce8a558f 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.1.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.4.bb
@@ -9,9 +9,9 @@ PROVIDES =3D "go-native"
=20
 # Checksums available at https://go.dev/dl/
 SRC_URI =3D "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOAR=
CH}.tar.gz;name=3Dgo_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] =3D "000a5b1fca4f75895f78befeb2eecf10b=
fff3c428597f3f1e69133b63b911b02"
-SRC_URI[go_linux_arm64.sha256sum] =3D "5e5e2926733595e6f3c5b5ad1089afac1=
1c1490351855e87849d0e7702b1ec2e"
-SRC_URI[go_linux_ppc64le.sha256sum] =3D "85cfd4b89b48c94030783b6e9e619e3=
5557862358b846064636361421d0b0c52"
+SRC_URI[go_linux_amd64.sha256sum] =3D "698ef3243972a51ddb4028e4a1ac63dc6=
d60821bf18e59a807e051fee0a385bd"
+SRC_URI[go_linux_arm64.sha256sum] =3D "105889992ee4b1d40c7c108555222ca70=
ae43fccb42e20fbf1eebb822f5e72c6"
+SRC_URI[go_linux_ppc64le.sha256sum] =3D "8c6f44b96c2719c90eebabe2dd866f9=
c39538648f7897a212cac448587e9a408"
=20
 UPSTREAM_CHECK_URI =3D "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX =3D "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.1.bb b/meta/=
recipes-devtools/go/go-cross-canadian_1.20.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.20.1.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.20.4.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.20.1.bb b/meta/recipes-d=
evtools/go/go-cross_1.20.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.20.1.bb
rename to meta/recipes-devtools/go/go-cross_1.20.4.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.1.bb b/meta/recipe=
s-devtools/go/go-crosssdk_1.20.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.20.1.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.20.4.bb
diff --git a/meta/recipes-devtools/go/go-native_1.20.1.bb b/meta/recipes-=
devtools/go/go-native_1.20.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.20.1.bb
rename to meta/recipes-devtools/go/go-native_1.20.4.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.1.bb b/meta/recipes=
-devtools/go/go-runtime_1.20.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.20.1.bb
rename to meta/recipes-devtools/go/go-runtime_1.20.4.bb
diff --git a/meta/recipes-devtools/go/go/0010-cmd-compile-re-compile-inst=
antiated-generic-methods-.patch b/meta/recipes-devtools/go/go/0010-cmd-co=
mpile-re-compile-instantiated-generic-methods-.patch
deleted file mode 100644
index f9ac202421..0000000000
--- a/meta/recipes-devtools/go/go/0010-cmd-compile-re-compile-instantiate=
d-generic-methods-.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 7a3bb16b43efba73674629eae4369f9004e37f22 Mon Sep 17 00:00:00 2001
-From: Cuong Manh Le <cuong.manhle.vn@gmail.com>
-Date: Sat, 18 Mar 2023 00:53:07 +0700
-Subject: [PATCH] cmd/compile: re-compile instantiated generic methods in
- linkshared mode
-
-For G[T] that was seen and compiled in imported package, it is not added
-to typecheck.Target.Decls, prevent wasting compile time re-creating
-DUPOKS symbols. However, the linker do not support a type symbol
-referencing a method symbol across DSO boundary. That causes unreachable
-sym error when building under -linkshared mode.
-
-To fix it, always re-compile generic methods in linkshared mode.
-
-Fixes #58966
-
-Change-Id: I894b417cfe8234ae1fe809cc975889345df22cef
-Reviewed-on: https://go-review.googlesource.com/c/go/+/477375
-Run-TryBot: Cuong Manh Le <cuong.manhle.vn@gmail.com>
-Reviewed-by: Cherry Mui <cherryyz@google.com>
-Reviewed-by: Matthew Dempsky <mdempsky@google.com>
-TryBot-Result: Gopher Robot <gobot@golang.org>
-
-Upstream-Status: Backport [https://github.com/golang/go/commit/bcd82125f=
85c7c552493e863fa1bb14e6c444557]
-
-Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
----
- misc/cgo/testshared/shared_test.go              |  7 ++++++-
- misc/cgo/testshared/testdata/issue58966/main.go | 15 +++++++++++++++
- src/cmd/compile/internal/noder/unified.go       |  6 +++++-
- 3 files changed, 26 insertions(+), 2 deletions(-)
- create mode 100644 misc/cgo/testshared/testdata/issue58966/main.go
-
-diff --git a/misc/cgo/testshared/shared_test.go b/misc/cgo/testshared/sh=
ared_test.go
-index b14fb1cb3a..03da8f9435 100644
---- a/misc/cgo/testshared/shared_test.go
-+++ b/misc/cgo/testshared/shared_test.go
-@@ -1112,8 +1112,13 @@ func TestStd(t *testing.T) {
- 		t.Skip("skip in short mode")
- 	}
- 	t.Parallel()
-+	tmpDir :=3D t.TempDir()
- 	// Use a temporary pkgdir to not interfere with other tests, and not w=
rite to GOROOT.
- 	// Cannot use goCmd as it runs with cloned GOROOT which is incomplete.
- 	runWithEnv(t, "building std", []string{"GOROOT=3D" + oldGOROOT},
--		filepath.Join(oldGOROOT, "bin", "go"), "install", "-buildmode=3Dshare=
d", "-pkgdir=3D"+t.TempDir(), "std")
-+		filepath.Join(oldGOROOT, "bin", "go"), "install", "-buildmode=3Dshare=
d", "-pkgdir=3D"+tmpDir, "std")
-+
-+	// Issue #58966.
-+	runWithEnv(t, "testing issue #58966", []string{"GOROOT=3D" + oldGOROOT=
},
-+		filepath.Join(oldGOROOT, "bin", "go"), "run", "-linkshared", "-pkgdir=
=3D"+tmpDir, "./issue58966/main.go")
- }
-diff --git a/misc/cgo/testshared/testdata/issue58966/main.go b/misc/cgo/=
testshared/testdata/issue58966/main.go
-new file mode 100644
-index 0000000000..2d923c3607
---- /dev/null
-+++ b/misc/cgo/testshared/testdata/issue58966/main.go
-@@ -0,0 +1,15 @@
-+// Copyright 2023 The Go Authors. All rights reserved.
-+// Use of this source code is governed by a BSD-style
-+// license that can be found in the LICENSE file.
-+
-+package main
-+
-+import "crypto/elliptic"
-+
-+var curve elliptic.Curve
-+
-+func main() {
-+	switch curve {
-+	case elliptic.P224():
-+	}
-+}
-diff --git a/src/cmd/compile/internal/noder/unified.go b/src/cmd/compile=
/internal/noder/unified.go
-index ed97a09302..25136e6aad 100644
---- a/src/cmd/compile/internal/noder/unified.go
-+++ b/src/cmd/compile/internal/noder/unified.go
-@@ -158,7 +158,11 @@ func readBodies(target *ir.Package, duringInlining =
bool) {
- 			// Instantiated generic function: add to Decls for typechecking
- 			// and compilation.
- 			if fn.OClosure =3D=3D nil && len(pri.dict.targs) !=3D 0 {
--				if duringInlining {
-+				// cmd/link does not support a type symbol referencing a method sym=
bol
-+				// across DSO boundary, so force re-compiling methods on a generic =
type
-+				// even it was seen from imported package in linkshared mode, see #=
58966.
-+				canSkipNonGenericMethod :=3D !(base.Ctxt.Flag_linkshared && ir.IsMe=
thod(fn))
-+				if duringInlining && canSkipNonGenericMethod {
- 					inlDecls =3D append(inlDecls, fn)
- 				} else {
- 					target.Decls =3D append(target.Decls, fn)
diff --git a/meta/recipes-devtools/go/go/CVE-2023-24532.patch b/meta/reci=
pes-devtools/go/go/CVE-2023-24532.patch
deleted file mode 100644
index 22f080dbd4..0000000000
--- a/meta/recipes-devtools/go/go/CVE-2023-24532.patch
+++ /dev/null
@@ -1,208 +0,0 @@
-From 602eeaab387f24a4b28c5eccbb50fa934f3bc3c4 Mon Sep 17 00:00:00 2001
-From: Filippo Valsorda <filippo@golang.org>
-Date: Mon, 13 Feb 2023 15:16:27 +0100
-Subject: [PATCH] [release-branch.go1.20] crypto/internal/nistec: reduce =
P-256
- scalar
-
-Unlike the rest of nistec, the P-256 assembly doesn't use complete
-addition formulas, meaning that p256PointAdd[Affine]Asm won't return the
-correct value if the two inputs are equal.
-
-This was (undocumentedly) ignored in the scalar multiplication loops
-because as long as the input point is not the identity and the scalar is
-lower than the order of the group, the addition inputs can't be the same.
-
-As part of the math/big rewrite, we went however from always reducing
-the scalar to only checking its length, under the incorrect assumption
-that the scalar multiplication loop didn't require reduction.
-
-Added a reduction, and while at it added it in P256OrdInverse, too, to
-enforce a universal reduction invariant on p256OrdElement values.
-
-Note that if the input point is the infinity, the code currently still
-relies on undefined behavior, but that's easily tested to behave
-acceptably, and will be addressed in a future CL.
-
-Updates #58647
-Fixes #58720
-Fixes CVE-2023-24532
-
-(Filed with the "safe APIs like complete addition formulas are good" dep=
t.)
-
-Change-Id: I7b2c75238440e6852be2710fad66ff1fdc4e2b24
-Reviewed-on: https://go-review.googlesource.com/c/go/+/471255
-TryBot-Result: Gopher Robot <gobot@golang.org>
-Reviewed-by: Roland Shoemaker <roland@golang.org>
-Run-TryBot: Filippo Valsorda <filippo@golang.org>
-Auto-Submit: Filippo Valsorda <filippo@golang.org>
-Reviewed-by: Damien Neil <dneil@google.com>
-(cherry picked from commit 203e59ad41bd288e1d92b6f617c2f55e70d3c8e3)
-Reviewed-on: https://go-review.googlesource.com/c/go/+/471695
-Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
-Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
-Reviewed-by: Filippo Valsorda <filippo@golang.org>
-Run-TryBot: Roland Shoemaker <roland@golang.org>
-
-CVE: CVE-2023-24532
-Upstream-Status: Backport [602eeaab387f24a4b28c5eccbb50fa934f3bc3c4]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
----
- src/crypto/internal/nistec/nistec_test.go | 81 +++++++++++++++++++++++
- src/crypto/internal/nistec/p256_asm.go    | 17 +++++
- src/crypto/internal/nistec/p256_ordinv.go |  1 +
- 3 files changed, 99 insertions(+)
-
-diff --git a/src/crypto/internal/nistec/nistec_test.go b/src/crypto/inte=
rnal/nistec/nistec_test.go
-index 309f68be16a9f..9103608c18a0f 100644
---- a/src/crypto/internal/nistec/nistec_test.go
-+++ b/src/crypto/internal/nistec/nistec_test.go
-@@ -8,6 +8,7 @@ import (
- 	"bytes"
- 	"crypto/elliptic"
- 	"crypto/internal/nistec"
-+	"fmt"
- 	"internal/testenv"
- 	"math/big"
- 	"math/rand"
-@@ -165,6 +166,86 @@ func testEquivalents[P nistPoint[P]](t *testing.T, =
newPoint func() P, c elliptic
- 	}
- }
-=20
-+func TestScalarMult(t *testing.T) {
-+	t.Run("P224", func(t *testing.T) {
-+		testScalarMult(t, nistec.NewP224Point, elliptic.P224())
-+	})
-+	t.Run("P256", func(t *testing.T) {
-+		testScalarMult(t, nistec.NewP256Point, elliptic.P256())
-+	})
-+	t.Run("P384", func(t *testing.T) {
-+		testScalarMult(t, nistec.NewP384Point, elliptic.P384())
-+	})
-+	t.Run("P521", func(t *testing.T) {
-+		testScalarMult(t, nistec.NewP521Point, elliptic.P521())
-+	})
-+}
-+
-+func testScalarMult[P nistPoint[P]](t *testing.T, newPoint func() P, c =
elliptic.Curve) {
-+	G :=3D newPoint().SetGenerator()
-+	checkScalar :=3D func(t *testing.T, scalar []byte) {
-+		p1, err :=3D newPoint().ScalarBaseMult(scalar)
-+		fatalIfErr(t, err)
-+		p2, err :=3D newPoint().ScalarMult(G, scalar)
-+		fatalIfErr(t, err)
-+		if !bytes.Equal(p1.Bytes(), p2.Bytes()) {
-+			t.Error("[k]G !=3D ScalarBaseMult(k)")
-+		}
-+
-+		d :=3D new(big.Int).SetBytes(scalar)
-+		d.Sub(c.Params().N, d)
-+		d.Mod(d, c.Params().N)
-+		g1, err :=3D newPoint().ScalarBaseMult(d.FillBytes(make([]byte, len(s=
calar))))
-+		fatalIfErr(t, err)
-+		g1.Add(g1, p1)
-+		if !bytes.Equal(g1.Bytes(), newPoint().Bytes()) {
-+			t.Error("[N - k]G + [k]G !=3D =E2=88=9E")
-+		}
-+	}
-+
-+	byteLen :=3D len(c.Params().N.Bytes())
-+	bitLen :=3D c.Params().N.BitLen()
-+	t.Run("0", func(t *testing.T) { checkScalar(t, make([]byte, byteLen)) =
})
-+	t.Run("1", func(t *testing.T) {
-+		checkScalar(t, big.NewInt(1).FillBytes(make([]byte, byteLen)))
-+	})
-+	t.Run("N-1", func(t *testing.T) {
-+		checkScalar(t, new(big.Int).Sub(c.Params().N, big.NewInt(1)).Bytes())
-+	})
-+	t.Run("N", func(t *testing.T) { checkScalar(t, c.Params().N.Bytes()) }=
)
-+	t.Run("N+1", func(t *testing.T) {
-+		checkScalar(t, new(big.Int).Add(c.Params().N, big.NewInt(1)).Bytes())
-+	})
-+	t.Run("all1s", func(t *testing.T) {
-+		s :=3D new(big.Int).Lsh(big.NewInt(1), uint(bitLen))
-+		s.Sub(s, big.NewInt(1))
-+		checkScalar(t, s.Bytes())
-+	})
-+	if testing.Short() {
-+		return
-+	}
-+	for i :=3D 0; i < bitLen; i++ {
-+		t.Run(fmt.Sprintf("1<<%d", i), func(t *testing.T) {
-+			s :=3D new(big.Int).Lsh(big.NewInt(1), uint(i))
-+			checkScalar(t, s.FillBytes(make([]byte, byteLen)))
-+		})
-+	}
-+	// Test N+1...N+32 since they risk overlapping with precomputed table =
values
-+	// in the final additions.
-+	for i :=3D int64(2); i <=3D 32; i++ {
-+		t.Run(fmt.Sprintf("N+%d", i), func(t *testing.T) {
-+			checkScalar(t, new(big.Int).Add(c.Params().N, big.NewInt(i)).Bytes()=
)
-+		})
-+	}
-+}
-+
-+func fatalIfErr(t *testing.T, err error) {
-+	t.Helper()
-+	if err !=3D nil {
-+		t.Fatal(err)
-+	}
-+}
-+
- func BenchmarkScalarMult(b *testing.B) {
- 	b.Run("P224", func(b *testing.B) {
- 		benchmarkScalarMult(b, nistec.NewP224Point().SetGenerator(), 28)
-diff --git a/src/crypto/internal/nistec/p256_asm.go b/src/crypto/interna=
l/nistec/p256_asm.go
-index 6ea161eb49953..99a22b833f028 100644
---- a/src/crypto/internal/nistec/p256_asm.go
-+++ b/src/crypto/internal/nistec/p256_asm.go
-@@ -364,6 +364,21 @@ func p256PointDoubleAsm(res, in *P256Point)
- // Montgomery domain (with R 2=C2=B2=E2=81=B5=E2=81=B6) as four uint64 =
limbs in little-endian order.
- type p256OrdElement [4]uint64
-=20
-+// p256OrdReduce ensures s is in the range [0, ord(G)-1].
-+func p256OrdReduce(s *p256OrdElement) {
-+	// Since 2 * ord(G) > 2=C2=B2=E2=81=B5=E2=81=B6, we can just condition=
ally subtract ord(G),
-+	// keeping the result if it doesn't underflow.
-+	t0, b :=3D bits.Sub64(s[0], 0xf3b9cac2fc632551, 0)
-+	t1, b :=3D bits.Sub64(s[1], 0xbce6faada7179e84, b)
-+	t2, b :=3D bits.Sub64(s[2], 0xffffffffffffffff, b)
-+	t3, b :=3D bits.Sub64(s[3], 0xffffffff00000000, b)
-+	tMask :=3D b - 1 // zero if subtraction underflowed
-+	s[0] ^=3D (t0 ^ s[0]) & tMask
-+	s[1] ^=3D (t1 ^ s[1]) & tMask
-+	s[2] ^=3D (t2 ^ s[2]) & tMask
-+	s[3] ^=3D (t3 ^ s[3]) & tMask
-+}
-+
- // Add sets q =3D p1 + p2, and returns q. The points may overlap.
- func (q *P256Point) Add(r1, r2 *P256Point) *P256Point {
- 	var sum, double P256Point
-@@ -393,6 +408,7 @@ func (r *P256Point) ScalarBaseMult(scalar []byte) (*=
P256Point, error) {
- 	}
- 	scalarReversed :=3D new(p256OrdElement)
- 	p256OrdBigToLittle(scalarReversed, (*[32]byte)(scalar))
-+	p256OrdReduce(scalarReversed)
-=20
- 	r.p256BaseMult(scalarReversed)
- 	return r, nil
-@@ -407,6 +423,7 @@ func (r *P256Point) ScalarMult(q *P256Point, scalar =
[]byte) (*P256Point, error)
- 	}
- 	scalarReversed :=3D new(p256OrdElement)
- 	p256OrdBigToLittle(scalarReversed, (*[32]byte)(scalar))
-+	p256OrdReduce(scalarReversed)
-=20
- 	r.Set(q).p256ScalarMult(scalarReversed)
- 	return r, nil
-diff --git a/src/crypto/internal/nistec/p256_ordinv.go b/src/crypto/inte=
rnal/nistec/p256_ordinv.go
-index 86a7a230bdce8..1274fb7fd3f5c 100644
---- a/src/crypto/internal/nistec/p256_ordinv.go
-+++ b/src/crypto/internal/nistec/p256_ordinv.go
-@@ -25,6 +25,7 @@ func P256OrdInverse(k []byte) ([]byte, error) {
-=20
- 	x :=3D new(p256OrdElement)
- 	p256OrdBigToLittle(x, (*[32]byte)(k))
-+	p256OrdReduce(x)
-=20
- 	// Inversion is implemented as exponentiation by n - 2, per Fermat's l=
ittle theorem.
- 	//
diff --git a/meta/recipes-devtools/go/go/CVE-2023-24537.patch b/meta/reci=
pes-devtools/go/go/CVE-2023-24537.patch
deleted file mode 100644
index 6b5dc2c8d9..0000000000
--- a/meta/recipes-devtools/go/go/CVE-2023-24537.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From 110e4fb1c2e3a21631704bbfaf672230b9ba2492 Mon Sep 17 00:00:00 2001
-From: Damien Neil <dneil@google.com>
-Date: Wed, 22 Mar 2023 09:33:22 -0700
-Subject: [PATCH] go/scanner: reject large line and column numbers in //l=
ine
- directives
-
-Setting a large line or column number using a //line directive can cause
-integer overflow even in small source files.
-
-Limit line and column numbers in //line directives to 2^30-1, which
-is small enough to avoid int32 overflow on all reasonbly-sized files.
-
-For #59180
-Fixes CVE-2023-24537
-
-Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private=
/+/1802456
-Reviewed-by: Julie Qiu <julieqiu@google.com>
-Reviewed-by: Roland Shoemaker <bracewell@google.com>
-Run-TryBot: Damien Neil <dneil@google.com>
-Change-Id: I149bf34deca532af7994203fa1e6aca3c890ea14
-Reviewed-on: https://go-review.googlesource.com/c/go/+/482078
-Reviewed-by: Matthew Dempsky <mdempsky@google.com>
-TryBot-Bypass: Michael Knyszek <mknyszek@google.com>
-Run-TryBot: Michael Knyszek <mknyszek@google.com>
-Auto-Submit: Michael Knyszek <mknyszek@google.com>
-
-CVE: CVE-2023-24537
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/go/parser/parser_test.go | 16 ++++++++++++++++
- src/go/scanner/scanner.go    |  7 +++++--
- 2 files changed, 21 insertions(+), 2 deletions(-)
-
-diff --git a/src/go/parser/parser_test.go b/src/go/parser/parser_test.go
-index 153562df75068..22b11a0cc4535 100644
---- a/src/go/parser/parser_test.go
-+++ b/src/go/parser/parser_test.go
-@@ -764,3 +764,19 @@ func TestRangePos(t *testing.T) {
- 		})
- 	}
- }
-+
-+// TestIssue59180 tests that line number overflow doesn't cause an infi=
nite loop.
-+func TestIssue59180(t *testing.T) {
-+	testcases :=3D []string{
-+		"package p\n//line :9223372036854775806\n\n//",
-+		"package p\n//line :1:9223372036854775806\n\n//",
-+		"package p\n//line file:9223372036854775806\n\n//",
-+	}
-+
-+	for _, src :=3D range testcases {
-+		_, err :=3D ParseFile(token.NewFileSet(), "", src, ParseComments)
-+		if err =3D=3D nil {
-+			t.Errorf("ParseFile(%s) succeeded unexpectedly", src)
-+		}
-+	}
-+}
-diff --git a/src/go/scanner/scanner.go b/src/go/scanner/scanner.go
-index 16958d22ce299..0cd9f5901d0bb 100644
---- a/src/go/scanner/scanner.go
-+++ b/src/go/scanner/scanner.go
-@@ -253,13 +253,16 @@ func (s *Scanner) updateLineInfo(next, offs int, t=
ext []byte) {
- 		return
- 	}
-=20
-+	// Put a cap on the maximum size of line and column numbers.
-+	// 30 bits allows for some additional space before wrapping an int32.
-+	const maxLineCol =3D 1<<30 - 1
- 	var line, col int
- 	i2, n2, ok2 :=3D trailingDigits(text[:i-1])
- 	if ok2 {
- 		//line filename:line:col
- 		i, i2 =3D i2, i
- 		line, col =3D n2, n
--		if col =3D=3D 0 {
-+		if col =3D=3D 0 || col > maxLineCol {
- 			s.error(offs+i2, "invalid column number: "+string(text[i2:]))
- 			return
- 		}
-@@ -269,7 +272,7 @@ func (s *Scanner) updateLineInfo(next, offs int, tex=
t []byte) {
- 		line =3D n
- 	}
-=20
--	if line =3D=3D 0 {
-+	if line =3D=3D 0 || line > maxLineCol {
- 		s.error(offs+i, "invalid line number: "+string(text[i:]))
- 		return
- 	}
diff --git a/meta/recipes-devtools/go/go_1.20.1.bb b/meta/recipes-devtool=
s/go/go_1.20.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.20.1.bb
rename to meta/recipes-devtools/go/go_1.20.4.bb
--=20
2.40.0


