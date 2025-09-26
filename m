Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1085CAC5B9
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 10:01:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13749.1758880907096763483
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 03:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=N8V9mRaC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1364670208=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q6UMdA1801024
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 10:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=BPUPv+FtZ
	9MH4ofYoVs1HuO+aMKNim2HIJRbs+N1WRI=; b=N8V9mRaCt9FNVHAGFYwapuQSR
	MBNhlSLuXRAI+VocoblPTGyUuKSlg5XS8U3nEtDWeBuSaTba/yFCTvC9D2HAFUtJ
	fbFVm2BNFZ6xWSoNu5W4DEVC0Bh4G75v8T7qSqfr+9aYs4zFefahRmL5iMhuEDr+
	5sYZOt70ZNvzibILNlOWIshPz73zAnYWAYVt6wGuew/8ehAQ+R6G687sQQJOEH7q
	v6MLYnifjGfrde4RmSD7bq/Xb1H0sPWgKHAuXOotKkFNn76i+b7+Qm/OyMl/b2/o
	5kUO8vT8eA1kJvIElI836j8d7/AM2WBAcZzt0t37nZGYkl2ZRzu0WG3jX6KqA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012035.outbound.protection.outlook.com [52.101.53.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsm8n9w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 10:01:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxgB40SAKw4jRcGZoPhjY8wfJm8eYpZ20bZXPw8vXQl6AgD7bsVkIvvycIoHdGRe6MR4JMVeoXaytglVtO2R21HBur4Oh0R0b4j97OKtvpRHa6vnH/B2q4rmvudGvAITvNCkhDwViML8HycDluG3uY/nIAG/+6Neq91XJtFVI3vMHo6vSs6la3K8NoYS1MoiXmtAOV0Hiov4WSj6p4PvWP5oL5eiqdxRFIMT9AWLx4QeouO9O7UmaKrZEu2MwzyZnD2RaSZNwJGrRn+AETu9NnESy7XpJP3b918YRWg2tKAoUEPS+NnuUSEZuP4Z9cVQbYa2zZ+CaLnZQA+HDFkBjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPUPv+FtZ9MH4ofYoVs1HuO+aMKNim2HIJRbs+N1WRI=;
 b=eN3C3wOGxuJ4fpIX+c/TaywIm5N2S34982I+dg3CxFXFIroz/RDseromqkFSHnrCIWN4mE0+0g0LjwJ+T/JMp+L8QmnWFue69iL7mLTmGVdOkrjPVWpgHWeDsoFueQb4ubmWrG+Orkm8NmXGZIvuntARQan1NJeAOKEZgHQegDGf8qoTNUw+UcdUtr36y3lf1Jy1iN5a5cSI72cDa8rUBatXfo3D9aTsrB+gHDToTbHMXiPf7UdtFvmJwk1qASOZ0/BjZ8Y2Tu/i7WIcUXCb7dqIfOH9Fesn8pJ8mo40A0R9/mlgVtBjRSbALhC8PnlHRV+D0EYY1QN/3SefqfEacQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA1PR11MB5948.namprd11.prod.outlook.com (2603:10b6:806:23c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Fri, 26 Sep
 2025 10:01:44 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 10:01:44 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH V2 1/2] rust: Use clang instead of rust-llvm
Date: Fri, 26 Sep 2025 03:01:13 -0700
Message-ID: <20250926100120.3731171-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::18) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA1PR11MB5948:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d6a153a-673d-4c3c-f455-08ddfce3b29a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lTgbthMYqNLwV0KwK/r/pI1y/72GPLmxmjXPhaAxZ6MsUGJrxl2gatjI3oQO?=
 =?us-ascii?Q?QhNUF6hxw9Q0bZn/AklvMoy8qWneo8E+gIFV6Ue1GiLDgnnKfkZBkAJhQGFU?=
 =?us-ascii?Q?5TTTCMX2UwUZpYl9hZi2VkAcODbHP3+Zulbhgq4O1AXMpGyCZJ5AFVTxnxkR?=
 =?us-ascii?Q?H6bWTp/xEexhpND9dAvn7sj3I7e5e0CBC0cmM72C2KYMDQ5UmYrgZZ2dzCCk?=
 =?us-ascii?Q?DJg53wyJZHkKu954wJ8InOBzFijSfPnni2iqO4G+b4HsflvNoKbkfyU6HEBR?=
 =?us-ascii?Q?xf9098c/FLhF95Wiz1ko1vInqxEaNtSuNg1G8n6zUYYWfn5f7VYxVXH29Mzk?=
 =?us-ascii?Q?U/Pz7Byd/cy3FHUF9YC3RS++0iuyidVLUhAAuKTgPe0+iCWjXdZiaG9gTpfV?=
 =?us-ascii?Q?4Ut1ATQw/mehWNF+p8fwdz9p+PObxhnHxJ6ONVZ/U9B6EK8KYEVrXgg2ZZLB?=
 =?us-ascii?Q?VStV1ypNB7NkvZwpp9P4q9jSiJUGIkLoAEi0MVCbhLU8gpK53NE/z+luDKLB?=
 =?us-ascii?Q?ypCdOebVPaCHybcgpOgmpEHmkiNwlj9wdPmCjgJNwyJ/b0Xo/YknMDMEO+17?=
 =?us-ascii?Q?7nRu5yS8txKJEpW6peqYUE5YHHK9K+yWUM/Q35rHYfl/T5cOiN+irRDpzc6F?=
 =?us-ascii?Q?Ob9S/Tn9UaOCa8VlnVprcB4BuPOiIHsia1E+2QqdcOd7F/jvoW3lMSpOG56I?=
 =?us-ascii?Q?o7rYKSzLyyt5NIYL55ICbXaePqpVEdjCD0IHVtOUZITAirUCjahFKgqW+e0F?=
 =?us-ascii?Q?s4z+wpvOijZpRzgeg3KxMSXKf/wuMGQaqvenR4NJS/I/CtZl6kUl0XzyHKLL?=
 =?us-ascii?Q?nGPXu0fC+prw3O3fIKGyymlOKDNAJm5Nlzk3lsyrXaT9sqKC4iXDa3IrXE+P?=
 =?us-ascii?Q?MOgwXWMTN4oh85Pj8E7VmhDUIaj6/oRLicXkGI5U5P758EeUIvlverXvBSAg?=
 =?us-ascii?Q?ffxHxZnfsAX15H3FrDaZ07WC4lp+n9Be8A6n9SZ5pM3w7WpPdSomvPVcwCPx?=
 =?us-ascii?Q?IAophp+fQ5+im5s8OQdpZm4GfzzVGwZrQxDFo5BiSKzJkBJtJHbFulKmUFJU?=
 =?us-ascii?Q?zPiIW92UAz027MKtAVq3tVcVaKPBv/Y9oS+VxrijlnwtYRcoWtKl2X7yMlWP?=
 =?us-ascii?Q?uySJDCn0ATe7GPu9hRiDSkn6nEv0UeERaw49aTTq1oerEjLC3aw8HvvKG40g?=
 =?us-ascii?Q?xzyxdK/YCj0dkdfGhu7+PKmlewzwhIorPtMf3E7BUFy54dtqASNhsddwCFsH?=
 =?us-ascii?Q?iv9/mFFmHNOxqgu7WaaqEpZv3xkWpNi4Cwt1uHOJI1o/22uVWPRxpC5/ZQGd?=
 =?us-ascii?Q?dhcdzWN5rOz8MY0r7GFzwHZzbiqIQmQVmo1QeWP/C6qHzeHrMuUxQqpRQbpk?=
 =?us-ascii?Q?4S3O1pX1XpX0wGeLJuq7yQed9zU4giRRnKXXbihFf9ctxnclMAIU9DV0V99D?=
 =?us-ascii?Q?1dYOm/dbBxMpT1zlUwG3Vowjh5uHPqy2Kv+CMO3J6kjtlGi9thMysQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wLMRvhW4RVch0Ek+6EpvAGp7DpamIzfPG58C0LIk4p+BI4V2otW/CX/VFWKy?=
 =?us-ascii?Q?cau+oCc1+S0cTmg9xpOvKBOfgKT6Bbs5TKjNX8qYsruZ7DkXhpA0v/H22Ux6?=
 =?us-ascii?Q?jLzpT/PgfNaHvfmq8QvgNYRwP1vlCqAeer+BiU+xpKWBdt4zM+VK7EmlG7Zp?=
 =?us-ascii?Q?Bnw6XwrZuO29sgqMA3fSj7bKJOTlKiWv6QR04sAQD5rLx5diUEZwFgTokefI?=
 =?us-ascii?Q?d5Mfn7ToI6rZHik6NauMjyyKsU7A69WBKA7khqR4GbPONMmB1T1hafsP2K5T?=
 =?us-ascii?Q?J34JTh9YIPM4rwceA9Bt2rud6U7CgbuhZtLGMi5s6eKfa+0csMzAtX/91hzh?=
 =?us-ascii?Q?lr7qksIR5hDYfB2vGk7qaqSDnkN7Kc/vVV+vxPCikaZrzxmC3BPV+DmdN1S8?=
 =?us-ascii?Q?kubz7ZYyQHnmYynH9A/pH66bGwBPMpuDPwntr3zRNHXJP+h/iFkkxeRL6j45?=
 =?us-ascii?Q?B5yK+joJrMtI06t5ajfFReza3mWwZZ+20vzVToUduCCuZLqHMqsjqMAI6OMK?=
 =?us-ascii?Q?SjnLLasop6eSAmGtgTzdn/mrspnXkL0E0x/f/vKGNoD/8l4ZSo/2A3mrjBMk?=
 =?us-ascii?Q?57dZqXUtEJ1B4Ga04ti4GxLG6v1RTSAXu2ymW0wBE+fIQ2ZRFDqU5ELD4hqt?=
 =?us-ascii?Q?T2ghHgXAPWumkYuhiUXSxDbGWY0OnIqozKN7Zm6Rjbt5ZkZgoD+5/33tIYhQ?=
 =?us-ascii?Q?ZM3TOccRrOXhw0fWUYB1romcN74F9mxEixoCAb+RENZEMLMWeZlSVrFOQRbn?=
 =?us-ascii?Q?BZptBipx7UhCZFcSTiW6bJDZtNb+EOW4kFmTeYzhXCiQbJrE2gBBOjUgCXXg?=
 =?us-ascii?Q?aCKJHkzoLSG4F8IG7ZeTHlrtwJ/WwZ5kBTDAXO6hEzxYlPPtmKJONCScIUC9?=
 =?us-ascii?Q?jzEjHcLsol/0YaER8pMUTX9uwfo+tXwKG8WWStPAmm7vbMucmHyNoKEQpalT?=
 =?us-ascii?Q?u3m5TyAP2gMbvvHDqd+iDH+nd2/xoE0ymofgZo7OoYJMSFMbYDYbZHw1ZFnG?=
 =?us-ascii?Q?5j7FSHPB/7PXDqQcHX/Ug5RXtHlI+r91HEWcRTLtkNomlWTc0+SnuO1nV2px?=
 =?us-ascii?Q?1n1ZB1KtYoDQbhoT4rLlrRfYks8nbGtQpt50YcisSf7wZU/EjUqbYLsrOXEf?=
 =?us-ascii?Q?LbnF4k5T3boOK0sCNpbXCJt9/fhxYOKKGTc02ePmWSDIDjWYszTqG16tlRYB?=
 =?us-ascii?Q?8dzHCn0kr6Awyf/mJ4iRohMsdcI15V+nS4MzlAjN3BJKAwmwhAEgXJwE4M8u?=
 =?us-ascii?Q?JwWhXcXNbST0I8ncFIFeggINKv7Og57eFljdF1/sb7zL3V4TfghgJP/f7YOz?=
 =?us-ascii?Q?LAUWrhaSgJakAn/k0l/svygzvQYfhggP/F1xIuCYNGPl5IcyVQehXzuDMEqU?=
 =?us-ascii?Q?/q67U9ss2gag2ncGbcCXhyX5t3XWAlikTUZU+aZXHF5BnuSTwfnhYUy2nYXN?=
 =?us-ascii?Q?52hA83lL4hPWCk6FJ/TSxnmrRtRs3iYbquMcGYQUTkZPfX/qV3DZo2l0505o?=
 =?us-ascii?Q?2IcVSf3i0setqvED+RBFK5s9f3D033G8UmjohD120iWZbOBj8RQJOq0UXGQa?=
 =?us-ascii?Q?1wAJXwXHNxWQZ7+9NNeJRBrrNxzdH/qasoHr8jblKlsM6gNUOShHObl6X5u8?=
 =?us-ascii?Q?Q3fceuQuRTta5Yj4pXJX1MA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6a153a-673d-4c3c-f455-08ddfce3b29a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 10:01:44.1796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQ24U+1w7Avlc0W/ddt4GaL4lM4UBYMXGsXVLnX9bhabhpJlF7xfpw8cdz0ZeHsNjdneFMcJ30OZCbq8eR6vMwE2si1bNjxA0k6mHOTBsZgNl37+bsPWzlgtoQLdinlT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5948
X-Proofpoint-GUID: InphSJHGWnWL9HnO3WNjTpYKPiTmHiTd
X-Authority-Analysis: v=2.4 cv=TJhIilla c=1 sm=1 tr=0 ts=68d6648a cx=c_pps
 a=3/9ZW+mBBPtU5+OO10+n1Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=dT9Y9HKPEq8aplpvp-8A:9 a=Hqou25T6mLgA:10
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: InphSJHGWnWL9HnO3WNjTpYKPiTmHiTd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA5MSBTYWx0ZWRfX1wE6Xb3vnt/S
 97TTLrP4wMSpufA3eI3lxmxTmxNTnTR/xnf757eq6MbInEP/oUy4zhAPyAoV578gpsQ2sMXIIsH
 WSQtYZf2mobh22/UabZoYLV+MSnq62EE90hxlYmkCBkRZXde+Umlc+fRdyLUnI0e4WjAM8DtRCH
 vrr1tby9MFEnCL7qb6Kzeqvljm0y2xqKN1G2m371dq9ZPmInbgeYRvaWC+HKa2agnx7AZfK6fDe
 ZxoG6LWMZ/1nnCgqn77eYEfpsJunlS6xbVdGplKWbmrxvehJMtPJgVlbM7T3yPDsvjb9yw2s7cD
 EskdL+xy9RDfScKFu+DAkZTcZHvxEpcV0T5j0l7MCXuNiaHyhmai0+eZ7aFk7in1gddn3rTClM6
 N96FTLFZswO+cQ54Pb+oKNf4dixQYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509260091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 10:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224070

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Updated the Rust build to depend on Clang instead.

*Summary of discussion with the rust upstream about using latest LLVM instead of Rust maintained LLVM fork.
https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-llvm-fork-what-rust-uses/23489

*Upstream LLVM is generally compatible:
- Rust does support building with upstream (vanilla) LLVM, especially the latest
major release and the one or two preceding ones.
https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updating-llvm

*Impact on Yocto Rust upgrades:
- Rust upgrades shall always check for updates on rust forked llvm and backport
the relevant patches to clang's llvm.

*Regarding the rust forked llvm local patches:
- There are no local patches on rust forked llvm other than the backported fixes
from llvm master.

*We now add these flags "-Clink-arg=-lz -Clink-arg=-lzstd" because of this following
diff otherwise we will get errors during link time.

Setup in rust-llvm
-DLLVM_ENABLE_ZLIB=OFF \
-DLLVM_ENABLE_ZSTD=OFF \
-DLLVM_ENABLE_FFI=OFF \

Setup in clang
-DLLVM_ENABLE_FFI=ON \
-DLLVM_ENABLE_ZSTD=ON \

*When multilibs enabled:

llvm-config expects static libraries to be located in the lib directory rather than
lib64. However, since LLVM is built as a non-multilib component, the lib directory
doesn't contain any library files. To accommodate this without breaking multilib
behavior, we copy the required library files appropriately.

Previously, when we depended on rust-llvm, this worked because we specified:
-DCMAKE_INSTALL_PREFIX:PATH=${libdir}/llvm-rust

With this setup, llvm-config was installed inside ${libdir}/llvm-rust, which included
its own bin and lib directories. Thus, llvm-config located in bin would correctly find
the libraries in the adjacent lib directory.

Even when multilib was enabled or not, llvm-config would still look for libraries under
lib in this structure, so everything functioned as expected.

*Changes needs to be done when llvm splits from clang:
In rust recipe:
Update the dependency from:
DEPENDS += "ninja-native clang" to DEPENDS += "ninja-native llvm"

In llvm recipe:
Apply the same changes that were made in the Clang recipe, as those
configurations have now been moved to the LLVM recipe after the split.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/clang/clang_git.bb     |  4 ++--
 meta/recipes-devtools/clang/common-clang.inc |  6 +++---
 meta/recipes-devtools/rust/rust-source.inc   |  1 -
 meta/recipes-devtools/rust/rust_1.90.0.bb    | 18 ++++++++++++++----
 4 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 53bca1c24f..3e117b308b 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -83,7 +83,6 @@ OECMAKE_SOURCEPATH = "${S}/llvm"
 # https://github.com/llvm/llvm-project/blob/main/llvm/CMakeLists.txt
 LLVM_TARGETS_GPU ?= "${@bb.utils.contains_any('DISTRO_FEATURES', 'opencl opengl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
 LLVM_TARGETS_TO_BUILD ?= "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;${LLVM_TARGETS_GPU}"
-LLVM_TARGETS_TO_BUILD:class-target ?= "${@get_clang_host_arch(bb, d)};BPF;${LLVM_TARGETS_GPU}"
 
 LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?= ""
 
@@ -107,6 +106,7 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_ENABLE_PIC=ON \
                   -DCLANG_DEFAULT_PIE_ON_LINUX=ON \
                   -DLLVM_BINDINGS_LIST='' \
+		  -DLLVM_INSTALL_UTILS=ON \
                   -DLLVM_ENABLE_FFI=ON \
                   -DLLVM_ENABLE_ZSTD=ON \
                   -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
@@ -137,7 +137,7 @@ EXTRA_OECMAKE:append:class-target = "\
                   -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
                   -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
                   -DCMAKE_STRIP=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-strip \
-                  -DLLVM_TARGET_ARCH=${HOST_ARCH} \
+                  -DLLVM_TARGET_ARCH=${@get_clang_target_arch(bb, d)} \
                   -DLLVM_DEFAULT_TARGET_TRIPLE=${TARGET_SYS}${HF} \
                   -DLLVM_HOST_TRIPLE=${TARGET_SYS}${HF} \
                   -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index bf3a63914a..c22e3c1b19 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -30,10 +30,10 @@ def get_clang_arch(bb, d, arch_var):
     elif re.match('aarch64$', a):                      return 'AArch64'
     elif re.match('aarch64_be$', a):                   return 'AArch64'
     elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mips'
-    elif re.match('riscv32$', a):                      return 'RISCV'
-    elif re.match('riscv64$', a):                      return 'RISCV'
+    elif re.match('riscv32$', a):                      return 'riscv32'
+    elif re.match('riscv64$', a):                      return 'riscv64'
     elif re.match('p(pc|owerpc)(|64)', a):             return 'PowerPC'
-    elif re.match('loongarch64$', a):                  return 'LoongArch'
+    elif re.match('loongarch64$', a):                  return 'loongarch64'
     else:
         bb.fatal("Unhandled architecture %s" % arch_val)
         return ""
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index cf8274b443..ac814c67b6 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,7 +7,6 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch;patchdir=${RUSTSRC} \
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
             file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
-            file://0001-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch;patchdir=${RUSTSRC} \
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "6bfeaddd90ffda2f063492b092bfed925c4b8c701579baf4b1316e021470daac"
diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb b/meta/recipes-devtools/rust/rust_1.90.0.bb
index 5d804c7398..c2cb8f8829 100644
--- a/meta/recipes-devtools/rust/rust_1.90.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=11a3899825f4376896e438c8c753f8dc"
 inherit rust
 inherit cargo_common
 
-DEPENDS += "rust-llvm"
+DEPENDS += "ninja-native clang"
 # native rust uses cargo/rustc from binary snapshots to bootstrap
 # but everything else should use our native builds
 DEPENDS:append:class-target = " cargo-native rust-native"
@@ -28,8 +28,8 @@ PV .= "${@bb.utils.contains('RUST_CHANNEL', 'stable', '', '-${RUST_CHANNEL}', d)
 
 export FORCE_CRATE_HASH = "${BB_TASKHASH}"
 
-RUST_ALTERNATE_EXE_PATH ?= "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
-RUST_ALTERNATE_EXE_PATH_NATIVE = "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
+RUST_ALTERNATE_EXE_PATH ?= "${STAGING_BINDIR}/llvm-config"
+RUST_ALTERNATE_EXE_PATH_NATIVE = "${STAGING_BINDIR_NATIVE}/llvm-config"
 
 # We don't want to use bitbakes vendoring because the rust sources do their
 # own vendoring.
@@ -188,6 +188,16 @@ python do_configure() {
     bb.build.exec_func("setup_cargo_environment", d)
 }
 
+#llvm-config expecting static libraries in 'lib' instead of 'lib64'.
+#Since LLVM is built as a non-multilib component, the 'lib' directory 
+#doesn't have any library files when multilibs enabled. So, copying 
+#library files without impacting multilib behavior.
+do_compile:append:class-target() {
+if [ -d ${STAGING_DIR_TARGET}/usr/lib64 ]; then
+    cp ${STAGING_DIR_TARGET}/usr/lib64/libLLVM*.a ${STAGING_DIR_TARGET}/usr/lib/.
+fi
+}
+
 rust_runx () {
     echo "COMPILE ${PN}" "$@"
 
@@ -199,7 +209,7 @@ rust_runx () {
     unset CXXFLAGS
     unset CPPFLAGS
 
-    export RUSTFLAGS="${RUST_DEBUG_REMAP}"
+    export RUSTFLAGS="${RUST_DEBUG_REMAP} -Clink-arg=-lz -Clink-arg=-lzstd"
 
     # Copy the natively built llvm-config into the target so we can run it. Horrible,
     # but works!
-- 
2.49.0


