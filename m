Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B50C9830D
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 09:21:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4101.1790328109209374398
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 02:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fY28ql8p;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=37283564ce=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P7kFcw008611
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 09:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=3qzrvnwIL
	MJ21HgiAknr/shPZbQC54tCijtthYT2zLE=; b=fY28ql8psvT8a/pzwrxygsp9r
	3+Q/RxsLo2LP867Y423G0EEEIoHqJEuwYVh45V5r9Rx9P4wmudooFhDnp5l3/3Nf
	PkqcaP/6fLMKjQtEY1TgGGi/0B34z+jQIwAC0DYII87dzXZ/szzG8YA3tDnxMprs
	cPaQV/T+H30Hiawi/xcesMPpdhRTmvmkJHPy6vJnMeBAWVZWFqsYMsXtoPQiSU8f
	Vf61xKZLd2scKhfAKhz4TWsMy2Eok36GdhawvgORp8fEAVJbLEQs/oQB7FNk41F0
	57uzyea/F8wXsdBljg/SF8/H0m4TGuVgPtl/3clb1krypssQtAS7t4EyGi1YQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022108.outbound.protection.outlook.com [40.107.209.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gwmtx0314-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 09:21:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=js/5sADbFvcaYs5V60vFGSioE3PZ3FAzcaTjLeNThep8itRJEQi3VpYNsJDH9oSNSkafod3qAwqM0efu/h50u7LIviijnb7Ymph5e4l62sbhNmiNoQTAgGQOHXkiRTXdw+hGIgwSh+fppNSjlm1DohyFLxyah0DmjqHzsCvIHKqLcSGTxc2NPha0RvmB6dbkxuFu06L5p7N8o0b6DfpoAsNgbRzW7mAAMzewShe/wfxEn9VDwJLhP1N4LPsaBpzDLRZKBgertT0JVlKqaK1GOjTCszgf7nNm/FhCccLw6DipY6uaTQziZTBUt3qnjsOsv1QFdrkV/kvMq9M8vqhBDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qzrvnwILMJ21HgiAknr/shPZbQC54tCijtthYT2zLE=;
 b=reRv/fGbmWRNwiHvPdczBAmm3Wwhl2wQaDF3d78YP9eQRMJy0oQ9kcx36EgA8upoioHla61sb1TUrVq3ZdfAZsN0fKsOi0wV/dsHyZgLwkog4zNdaTMk3BW5WevlH9AkD07K3zibGRehBqLmElVye4MzvCvAKyTJV48jhpfjDpxnU/hRZhFRH1iQ+URhYu9egFR/tlFfKos4jQcYm4ZEEyMcT1tVZuaaByeLRit4QdDbwRJHlkRYELgu4i4+xpcvxHpLKgwt5nZLSseamff3h0pUoYmH4CqojqEkWhrwuYEBj4w/TkWAw8IYv83HxNDZghp0k3UZF+9/W9j7YBmzbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) by
 DS4PR11MB628998.namprd11.prod.outlook.com (2603:10b6:8:514::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 09:21:44 +0000
Received: from DM4PR11MB7328.namprd11.prod.outlook.com
 ([fe80::26e8:ea57:9a33:9a86]) by DM4PR11MB7328.namprd11.prod.outlook.com
 ([fe80::26e8:ea57:9a33:9a86%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 09:21:44 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] clang/llvm: Upgrade to 23.1.2 release
Date: Fri, 25 Sep 2026 02:21:27 -0700
Message-ID: <20260925092127.2318936-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0145.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::30) To DM4PR11MB7328.namprd11.prod.outlook.com
 (2603:10b6:8:104::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7328:EE_|DS4PR11MB628998:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f1c7f08-c69a-4863-2e36-08df1ae66a76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|3023799007|6133799003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	BEen5OtaViT5raWbTFPjevEfcEx7x/33IUWstEDQEqviNie1lEBmdz2Z5U7Zbui5WSEdEKllUHAUNRMmlzNyI9E199ZIkabeUw59zWKMxBJrbO8ZrRA7aIGmJXCxZj9BPnTLQ8z905kUm/O30l0C4PVRXtfTOh5YOhKR6iMih7GYZpieui7zRBCd7r37xOmW06mdRxG0Cvn6cxQ2ss4oQEMsFiPPr7JKmNNiIBjpRq6bkHOYeOilbF9vXSTZv8Pc1IwjYFj566qoDGpGApIXBWnnjq9FmoaUl4Xmt5xVWtj9gbZfIJZ+HP6DMJyrpn1m6hNsi7RaNjwkoVb5J1PneiL97xqX1xaMjTOc8I1HV6G3f/z+GJv7vdED+FszZmuEofjs6p5XKdhkAgJkOCInNb1j9FWkxxczmm3+iCHfFxIibzU7xZj2XUIm9yfQ9oADMSaEt3YjK+sI/zoWNNl/t5GC2cfxTdvArHEJ+OA1Wfa/qR7QZQyMINU5LZDTuh9PFElfPKzCxx7NBX8qF6S8exe0rVtgvC9ejXe4QpT5rQZe6yVR2kLRAILmB7jcXrmvSbnD0gZPav0CVhBwCt6T1Z0LOafsse97eUXRLbgo60ypSTb2nFfk6gTFGm4bNAB7vp+nelularV6+z0S6iy4p+WlXtooykedkSq+HKD11IzCU+EW6fHNUrVzZNQJ2v03
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7328.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NngPiFdSl9A3/HsZZAm4Q8aXYiIfmTjLJqtclS8R3hhsivrU2RJ75OGaIopg?=
 =?us-ascii?Q?dVfMNejRjSqLGx9BrnjDm6eq5KS6Z4p/wF7WQ38U9/Eq4fAOgxgFlL3pKNr/?=
 =?us-ascii?Q?PcnnCQORdeRWt8bOlJwnyEQwvswzX9Lt+Mnutx9k66L4ZS9wKX/CGfZI4Gue?=
 =?us-ascii?Q?zk8As+EbiYPfj5w7uae0Y/Qa2u659FrrTBBTU06pKQdkjyFIJXdimRbXBtZv?=
 =?us-ascii?Q?2TxQc5Z8zRTXvaSti1Kx/yQKsC1pcRv0s7d9r+Pc9yZM1Lv0p6J/ssuAx2GV?=
 =?us-ascii?Q?k6vsTY/R3FntKJpX3tgIrmxMHcC68XUpkQmBcGkJwHvM5dWsBbC6YSrhI2vK?=
 =?us-ascii?Q?dKOF6w293rhxxMQ1c3LN8uNAXWLeZMOdlrDV07V4FLB4rpWuGwEtTMlfIR/8?=
 =?us-ascii?Q?EEyYDJLAIc6tbiii3QDnMksBeN+ZwWzr+t6DoI3pfvSaYdqCDeaDjMhJtOFp?=
 =?us-ascii?Q?13fGHqyFS88gtqS3dF4pI8HZlKv3uZNzQK+XQtF6sRK2TSAF8iJqp7CMTMST?=
 =?us-ascii?Q?pZ+q2uN79VuQbOfwMrc7huSd2IEdLxee51TgwalH6xY9JtaibMUMEnsbLBzr?=
 =?us-ascii?Q?BB1sqv19CycOxLfb4/UXXPlkJRh893Zt5IoVgAXiKCuksxXcbia5wQRxV6nz?=
 =?us-ascii?Q?Bvbr+/9vn5P8X7DGfHJPRyAdLk3iT0+kRkjeUQEv8zcfl40zecSiHTWUxzmI?=
 =?us-ascii?Q?3tDGAqYMKrzJZZy/lQZnwJ/xsosSVBJp6AlwrfiGaZfKlvYaOENspEgFZKSx?=
 =?us-ascii?Q?8aRz7ZTmkhT0mROUxEdmDCdl9cAHmvTOAjJWt+SAKauyFOE8YCA8JxvPWPKT?=
 =?us-ascii?Q?G291410jrz09DAkLQ/BT4MhYqokxEPCNX0qewAs9COM4UTX0fzrtsKW2YlLs?=
 =?us-ascii?Q?7YDXepk3q6sRBXGJwSHabXcwGEBK0gMw7T6xwHrTKXs+0qdSIk60QNlBCZt1?=
 =?us-ascii?Q?tYa2skU2TrEBj6Kkc60bczA04kFFBTDDrz8vrgAMF2fGrg3v+Me9sokrcKFQ?=
 =?us-ascii?Q?vDQYqvNoXaiEEz88Qatfkd4PJOsiSlBUhcQQ7U3bX+hkAZjFZqseOdM+3f5O?=
 =?us-ascii?Q?ixsmKv31NsLUy6WAV+VRLe4o8h8UfhAcCuReNoscEf9GgsGI/iTML8JHGtTR?=
 =?us-ascii?Q?3bG6MeFLHx+ayc9tGFVAz2/8mhhTpMw3iV+fm6S7Wnd3F25sgb6JWC2T6EXl?=
 =?us-ascii?Q?rqGG5sxEayb5Ump2SJbsQG9BgFzD+P26eZVz3tF4hQJy4rOfHobmyuNCjw18?=
 =?us-ascii?Q?ctZC3g78i6YCfhXlPoKYEVODNH53UFnaFfgA/39TlGPUjtANWLhgqOH3Aeyr?=
 =?us-ascii?Q?OlMFdnk3BbGlKkv+5nfkobckTb4KPuId6h1saDpOfzAGbvWlz0q4A+BjQZPs?=
 =?us-ascii?Q?F2QJs45mfhSCAEffZi5+MGNE1SatLdQAtgYgzNVPkj9bxfMantYjoehsp1wJ?=
 =?us-ascii?Q?AYM2V1aCF13Hi8UM/xjBTiAu+q8hn0zExb0Bnw8IxGrTzdoK03GWBihKzbBb?=
 =?us-ascii?Q?+jOZtnD/AhEhsw8nsBh1pHKdjxkqRUnkY5Gq1U1AyMw59Z7jZSHx9/25qdj0?=
 =?us-ascii?Q?glIUquDQIYzS2F7RKhZyZ0Ny9ENecgcCRzxSI01Fa06AWG7BP/wSpExrdyNe?=
 =?us-ascii?Q?VFUBveZ658v6VuqvpG0qAvPFKON+kTcq0gc+LCm2sOZAx7dVq7ID+6y1dSFu?=
 =?us-ascii?Q?o0vxtdxroaNu2iWowjhHgj0v7DcBQVQUBH5znC6g5udwuD6uv6BybG0zSxaX?=
 =?us-ascii?Q?hX+VNjUI0eBB6NcK9g1qUDHNOjGct98VfeWH6nLXUvoxpR60HMEg?=
X-Exchange-RoutingPolicyChecked: 
	oJXEH/V4/uwjhIWyQ6WZcWBIMFb9OKEdFQ3wWki5x1wpfH/qBnx6zSXruTpdskA/ZewJskUhhJhb0oNHPoFr3X/+QQE0PxDsdlwg9BGhXhp/cX48Lup1G8zHrJxcen5iDtQG7JhZ1GXA6Pd7UplPHEr0NY9/ibEfN2iL+uV3+uQhY/DskVUR+eGMYNwpjS6ZyPikxz9ZCHZe0XAUaaAad37tLaLD/AMPhKO0gA4VqrpJ4p4VPRqN2XdIa4Q2DnBoDs2dAfWnjSstCNwUiYkCNTftr4AQnr3KQkmo9hjEg2vZg5cofwDy7zpoXF3DGS8n+6SX5utYW80CKUfZ3R+3wA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f1c7f08-c69a-4863-2e36-08df1ae66a76
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7328.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 09:21:44.3016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a4f76rD7as+KZOWTDba7aM3s/nhSrfK1mBF5sBvrq2+Cf8V5G9qC70z6Q9fSHwrVf0Osemg5ncEOlhMPQ5muc2l+QsX49L8QuQMXxoGCooboWFF3kVr+Qfc10y1EdCZq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB628998
X-Proofpoint-GUID: vcENuZN0dfJN1HxcGIXJqfa0pVmuSGqL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfX4HaQWsojfySI
 7d4on/uiFhKX/xdZcDRg1YH3kExFnlByP6/wwWWMBKKiNNWtzU6TGmLdkKwl+1OQAp+wVTgJ4NT
 FFHqAYZOLUkvf7cfkpkXcdaJvwMhS5ohsYJ5Ie01850VQ+y0HrZZ
X-Proofpoint-ORIG-GUID: vcENuZN0dfJN1HxcGIXJqfa0pVmuSGqL
X-Authority-Analysis: v=2.4 cv=NI9AaE6g c=1 sm=1 tr=0 ts=6ab63d2b cx=c_pps
 a=a2+L3AnVmArF919Fy/9SOA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=Twlkf-z8AAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=iGHA9ds3AAAA:8
 a=h90kQbrQMsaKDzxxxM8A:9 a=-74SuR6ZdpOK_LpdRCUo:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfX8o0pAwqYi62z
 RCMP486Go8otAgTEZvQwQXHB4T6VU3/I5XhvnzBNP6EHuWn7WCF16deC0DfAqoa6GjQ60QUn0pH
 oZwbNB65Oo9vyf0YU4r0MNK+/946uzhkmrrZ9a8YubfUvuFJpOmObGEsZygWhDWTytduXSPkTuc
 QzWNS5gSvc4miBdyShjsZibwDvwZG/CU7+qkNiLrMpjbY/61ddC9CbkMozLobVEksZp3b5xF3xJ
 jxuUxKz9VLj0HZs3HpgTUbwOwX1DVilo6dTEvhCG9ZR5dBeLbLSJlQVaasAMLYJ80n/LN48Xe6e
 sYO/x+w/LHTzY9J3hjLVXutl0Vtc9UEYy3+4ScHR4KhG00r7gbX1J2UtGfx+jutqRUBs03ZF2tR
 oj+llejuj+0I0NgVgFndB2YUNxGYuChkUkq3XBkQ2Q+mq9v6xV9d+YHDj3D+M1a2sKNWoJ+W14j
 cNkOjrMK+nDUZpQR+3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 09:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246612

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

https://discourse.llvm.org/t/llvm-23-1-2-released/91895

Brings following fixes:
85ac56026243 [Clang][CodeGen] Fix crash in EmitParmDecl for bodyless destructors with -fextend-variable-liveness (#218830)
4b1925210476 Fix `fp128` reaching `llvm_unreachable` on 32-bit PowerPC (#216613)
4a9562cdbd75 workflows/release-binaries: Fix zstd compression (#219587)
577cd04ea1e6 [cmake] FindLibXml2: keep user-provided LIBXML2_DEFINITIONS (#221294)
03b58ead1a5d [llvm][AArch64] Fix FPDiff founding direction in non-sibcall tail calls (#223545)
eab565ac4e1a Reland "[llvm][AArch64] Ensure stack alignment in non-sibcall tail calls with FPDiff" (#220406)
267a9fb46389 [clang][modulemap] Fix crashes loading pcms (#218011)
36e7268be7c2 [lldb] Disable delayed-breakpoints by default for lldb 23
664808c09ccd [libc++] Reword confusing warning message about AppleClang version (#222380)
ba019b7aafce [SPARC] Fix SelectForceADDRrr for global addresses and non-reg operands (#220013)
82fc843747e0 [libc++] Don't assume a valid range in find_if for empty inputs (#213752)
2eabe80bc7ab [libc++] Opt `std::*set` out of map key extraction optimization (#220452)
21a77e7bb6bf [LLVM][CodeGen][SME] Don't use non-streaming zeroing instruction when in streaming mode. (#222353)
3c3c37ea117a [win/asan] GetInstructionSize: Add some more instructions. (#219038)
069ef0e7cb36 Add release note for #184718.
7fe36371c71b [RISCV] Fix infinite DAGCombine loop with SETCC and SIGN_EXTEND_INREG (#221593)
36ede5c3922b [clang-tidy] Normalize windows line filter paths (#217038)
24ba344c56c5 [Driver][OpenBSD] Use -no-pie instead of -nopie (#220464)
e5130a252e5d [Driver][OpenBSD] Pass -pie for static PIE links (#216907)

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c273d2d754..e7df56daf0 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -483,7 +483,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.co
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-23.1.1 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-23.1.2 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 912fb80277..d34858d8a2 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "23"
 MINOR_VER = "1"
-PATCH_VER = "1"
+PATCH_VER = "2"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 5b358f7284..a8dee591b9 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "ebe9be46fe8756d58c5b198ffad0fa2a766257add81a4dc52179bfacc7888ee6"
+SRC_URI[sha256sum] = "c98bbef08a2b4c2613cd50e9aa9ae7b69b1fe6c16b2c40373bc0ab6116fdf78a"
 
 SRC_URI = "\
     ${BASEURI} \
-- 
2.49.0


