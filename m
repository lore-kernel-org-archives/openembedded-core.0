Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14705CCF9E0
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 08:47:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.27400.1761554842309974481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 01:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hk5UUlya;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2395784bc5=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R6UlL01523629
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 08:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=QPxKdBbTo
	klJBZzFRduhLIFUJlxof8GpchN76CpwniM=; b=hk5UUlyaerDVXcpR9z/EZh5J6
	MN7hqk9x2jUXDhspPj3Ck/Pg9csnO38SwTmaQZJGsaQ6VlXpAtqIQVo74T5L0OUi
	StfpJCkKPhPAMyYgczRHt8DB+U9Z5mmp8uPQ4qvW/QUOi9bffHyySgAH90giNH4L
	zFWvx3oAXOhSFm+4FZyAtmX7Y5riWXDtnIguAu1Tk1wFX/wKxC7FL88NyXzsvlAd
	YFXYfGg71FHIlujbDU2mPo1C1apQWTIY/XSaR8Ah0OJBtLY0mgd1oamInsSrWPRp
	HdPBwRh5VuxlEKiavP+SQ8oVaSlsN5oFoYnRlPOCxj+Xmk1mpeYag8o+FHNsw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012009.outbound.protection.outlook.com [40.107.209.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0nh5sjs9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 08:47:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6ZsZ8YuA2uzOjGoD7KS2i7qkAaKBqiZnOpAoNvcYQ639CFLkpU5EuyaPyfzjWX1Yi2jqO3QIjFTAeAK0c7u4ikfi9whLdyoERc4J0Yt342biqOsjWpXGBYLArLdhtfC6Beu1IHuzcU9pgOhybAJ/lnAo8oCvnfG2ko0HF7xrbTueyH5MFiqulZOw1f8xCxO/1whkQykaz0z/gLLRATr0dXxa6ayZ3chWzF0ZJnqz9Ls7FhCjqRZMvoeP/6DeTKJnB7FHJCg4oS2b5iPZ1qrSCbBs2Gs5d5+jzV/GcXZ5tjdw14y9ps8TdZSb7Yjwl9u2d3Cld7Ld6waKmhI/7RCuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPxKdBbToklJBZzFRduhLIFUJlxof8GpchN76CpwniM=;
 b=o8mjLrGV0JscDurTq826i1T7fJ1gyRM+N/5GLF6cdAsDS3H1lzwQuvnH8iSoWkiv8+BoKMKcw9nIlwIfJXb/ksGOE8bOC8n09xQ6xLezPNTQxz9hxjDfLddY3X/lPfOf+eyzlCk/9uyPf6s/PKLJTGfdT7QGWP+tiHrkCUYpUP8s7YpPRSCT08XhWqTxJqR24WqrMcu2g1s1MDINr7QFGxS7OqJ0hs8HZdsifuqa6o5AqzKxqFCmQJ67UAk3NCAnyzU4doNvMpczpQEEiYFHdf6XvXDqcRJzaZfzkScPc7qCl/STT0nUpjjPbEFvTrXfO22nqG7eNBpnG1Ful2WTxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS0PR11MB7830.namprd11.prod.outlook.com (2603:10b6:8:f2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 08:47:18 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 08:47:18 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [walnascar][PATCH] glibc: stable 2.41 branch updates
Date: Mon, 27 Oct 2025 01:47:04 -0700
Message-ID: <20251027084704.3219220-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0079.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::24) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS0PR11MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b66d53-c0a8-4574-5f35-08de15356fa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lqo7+xqrmJRTw/6q1lod63+okRJcAkEpHLPscRk7xgd0vD2SpYBcBdL+bwi7?=
 =?us-ascii?Q?4LYlD6by14UfXQaMB0EBlE8xCc0KVgxVv94p4ZZXatGNFdufO0L9TcUshQ8V?=
 =?us-ascii?Q?KNQXFmTIeN612nDYX5OKCVYKUawH0HMDQ9DlXTOcgduac3Zru0UACe1aH4dJ?=
 =?us-ascii?Q?MXPgtXjkDolim6FzntWpbtjIrgTZxe93/4FvKod9Br4RMFM+ctan0ZnSHTMW?=
 =?us-ascii?Q?ddXAL8cgc/Oat1C3LRDmYofYC+iRo9CnPWDmE2yxaAjJANzfuKgnImJLoTCj?=
 =?us-ascii?Q?9jNjrpLSnIlMcyxXiJZE1tDhdus1r4i2F3q6swYAPXJpTldCDzu0WUQlTF76?=
 =?us-ascii?Q?N/+SiG3I09D4dvT2mh3BX+XYTDmpT0JmJTmLucHOxeMdUVwMMjiw1CIRjhWV?=
 =?us-ascii?Q?Ow8iK8GI40f/M8Efq7ecobj5HklOQqVkOpcEXQ4EsTamXm6NuQEXKXetBiQO?=
 =?us-ascii?Q?buxkDi9/+z0m39hQbZ6E4wuMWoSpApHJ/iRpkqiscZ6Kfcr6KVGkc97moJL1?=
 =?us-ascii?Q?7fYzAbyuGQnpL1+NEH/ZVg3Ev7bieER72JXf5Su1gUpI4XmlWtrfjrqdtQWm?=
 =?us-ascii?Q?awOnu+n9ruIWhxex7L0u2E9QErSDSSEqGY+bcFBwffU1Od03mP9QMVSDC2vD?=
 =?us-ascii?Q?m5YcKF8RiYIu/Xce2EGuXzg1cki/q26EDi96DKv47r4Lt1jgIJDhaw96QIrW?=
 =?us-ascii?Q?wTmQxffGpqnga8q2yg7CxvxGRqRTbIb7RJsNaQ560hbsB16h6zGuy6j3lsbQ?=
 =?us-ascii?Q?L3bIE4XMWQcQf5DBw7G4C0rQPLWbSknYRXlvP8YEwq1tYiRkGYCLHgAp8N2e?=
 =?us-ascii?Q?c8NCV4f9qiLv5sniMYduh8GroZIldaucI1plik8/8BNnVmSfWJIJrSVjBzLL?=
 =?us-ascii?Q?0hyQiCMeJlEXjEh5/VpWLXm8VrmO0Ot6EQAaTkIXU8crmSyMnTnxB7IjfKx+?=
 =?us-ascii?Q?AYtVr0DHQIlIwvxAR5ncKtGRk7NnM1R+jabbIiL6myAOQtTQwD/oLdRSSaSL?=
 =?us-ascii?Q?kKlWY6PGUyfiwbx47376ZHJ+6FeO4JW+13MztloVcBKhFqjtv/QNbUmyJLLE?=
 =?us-ascii?Q?zFq//jn1yf+M982S4+b/GeycWZSmcZWyUSYavivzCEPzQXgXyeTyrSqusaV3?=
 =?us-ascii?Q?up3KmttWl73z8qRTNvmw5KhMRJYgw1v3mmz/2w3ynUAvRiVk1DWbaX6WYfHQ?=
 =?us-ascii?Q?Eh0xunti7Mm3XAwgnEFwYRaudeLXsCGtgiKLaEHVW1ve58Zf+PakGZdM/4vf?=
 =?us-ascii?Q?fBlGrDAifnrnYgtwNDyntZyKEeIj57ojr2o/26vPYnl0fry6apeLfRhdxV50?=
 =?us-ascii?Q?j/dLRyNMoOWHpxlH8hdCB+Fy9J7Or3kNFg4DpZPOBGA79LMfKSeezQ44S3Si?=
 =?us-ascii?Q?w811bzKrzoVFHW2DlOum0ezVdyD7NKNwBu5N7rwc3feSs2xLYmHjCSZrT4cS?=
 =?us-ascii?Q?ePp98gbTq57z/scJVdsHvhx3tHTBZ2ZzERXwknM48q+F9cT9uXuKV5MB6odh?=
 =?us-ascii?Q?2UbZooW2bQ1z6EuQtMZ8qqjGI7+RtcCOxcmk?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7HJDk/E+D4d32oDeusm0WrohqPtSwWMB4sZkBwz8NE6QlW6J3u2VbfYSRC+w?=
 =?us-ascii?Q?2QIClfu5pMjyYOQlbcAd/D0nRfA70EdfOeGcBnwlX0dpXrQTQPmpYA417s1z?=
 =?us-ascii?Q?YX2rWYrC8PA015+E1jkCtaSjnCPGKoBP3TvY4kkCt3xxas6H4XJ5p2/QR4Px?=
 =?us-ascii?Q?kM9nKLqqhwLRCbonxaEGck4ChY65p8MDF10qmAOo/irOJdCueuArFcbfRDM2?=
 =?us-ascii?Q?YgBdUhqgbJaNn9QOuSzc3gTI/3c4Eyu0DguNR1yMZ0KuRU08Zmv8nygqL26T?=
 =?us-ascii?Q?vsesFgibM3Ty3dRxJ2IlwbaABcxYPW60k2y7foe4PmglCnX5+bCUEZQGDZuB?=
 =?us-ascii?Q?r3iH6ZRQuTs1xiY0iR9Q66sEO7BMhUBIkaEZaDK47tLAnwUVdUOPRAFf/E8f?=
 =?us-ascii?Q?DVKM270xX9ksACHjnUKRoK2QaQdeGbb+JizFDuYGieU7DL/Ms+2Ig7TQiWVH?=
 =?us-ascii?Q?JIgcaT4n1IlIWV9/k93vY7dAd2H9BGH2eQCDaeBVUHvAni20kLIvZhQZxUgu?=
 =?us-ascii?Q?KI/zxM4vXmRR/YJ/SqpFRgErmRBzgYxE7LinBKYg35aPXPZIYR5BK99FSb2H?=
 =?us-ascii?Q?JlOAdeCXro7VWOC0ChammiN3vu95hfqf2Vi9tyyFhn81UFgprNo2uCzIDDor?=
 =?us-ascii?Q?EYyk98WZvRKc2PbvtMUQftdZUwxTwRxNGWwPzCH6gbtBgc1q9NLEBqxA9b2s?=
 =?us-ascii?Q?IFKRtUqe8cosu/OEOJJFylAKqc1J7TDmqjUq1accH+dT57Zjq3WLEcNJbyxx?=
 =?us-ascii?Q?F9pXW+HOfoY1geDBpGZvM5NDdup4AT/DpZ10UQBMLTdPO8aH45yFkz/6axm+?=
 =?us-ascii?Q?EqDg2f3nPI13qrqQk7Zai2CTmbp6iBXTWHsl75zBqSITdCq7X/KZiReauSom?=
 =?us-ascii?Q?ujcM2ACbXykfO7To4Z4dhBKwtNzPjfJySaFJ1NNUHRWoMTq0ooRi6MaDQO2K?=
 =?us-ascii?Q?44SPU0tk9N5lMmm2FvrK7czVMl3Ql4hksCxMCWXgGXe6gK3KNv2npJXokNIf?=
 =?us-ascii?Q?IRJX9s5QtzUkfYE8E1gibA5kEelXaDBIn/uxjSqlFFetvX7sTOddt7VwhOTf?=
 =?us-ascii?Q?5y69lkN9F3MsfyJZZomU3F+xVZBJKA14KgXpl60/SJMGfd8p1sCfxh/HEzdr?=
 =?us-ascii?Q?8DlRPhs7RfG7ynjUEhXN2PvdcHlI+QB/r8Up419c+ok6d4EeAMxpQmqP/z0R?=
 =?us-ascii?Q?jwdBkxEGXVfy5hniclER7e8gc3tCV7mebrs7T/Gg8Y8Wa0zm4kIGEpgSo3xp?=
 =?us-ascii?Q?oId8ei9mfdtYM4WPBWN8dIyfbMsgPTqU7DSNGw/hJY2N1yE6yv4T+yRYr2gM?=
 =?us-ascii?Q?pwh8IKssG2DphWR8UqgyJQLBm0Pco7sye0LPpF64sNz9WzWS9HS90NsZdeWc?=
 =?us-ascii?Q?rJan3831gXVKXdjCs8LwYVzyTZzl+K/NhA/yQByCF2BmDRJcl020xjq/WTJD?=
 =?us-ascii?Q?qes3wpPTTDuwFRYRG/hT7avRWtBhyPIztwhNHs8azTAy/AjB89E9Zj9XgTMJ?=
 =?us-ascii?Q?WMcOcB/p74YrVrc/f6rqFhtP3WFjpaPfqnXebSRigpWT0bn0LfBOkZ+vG6rg?=
 =?us-ascii?Q?0VAebFvhVPmieZnPVkADHaMvcQB+01JmvlhUOIQeKTOPfGsCjxN52GX6OeNK?=
 =?us-ascii?Q?nH3uhAUyP6kkJbBj8E+c1Gw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b66d53-c0a8-4574-5f35-08de15356fa4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 08:47:18.4621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrWMPidtM8GlkL+IXB+E109wpn7PIBzkwxv4jklzxzjkpb+YFb/qUZT6WWVIWbM/nayBIc9rk9nHAB0KyfQSABpsTZmIa7mUUJ6g+2t2AnuFl9nyZgjLGQpWSIB5j2Ct
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7830
X-Proofpoint-GUID: -1fZQZC9qPkmqIqK_PMBleic08lTjhyK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA4MCBTYWx0ZWRfX0yakGBHIgCrb
 bym/bV5t6ybLPlwegVbsNm1sMdmTzAMWqEM9pV6aGYWdlH9AY+jwc+IOnn52xOE5qM4vxf0eyLo
 CIYbV/E5Mh+aC+uu6TB0cF6QzmYXoS9RsSQCxg894X/KzM/NwFjvuuN7/soLI7gCB4ox1BC0tBB
 YjGjMrtk3nokHQlX4+Swo09hgLhSIo/PQr/M1SuxwMoJ5soNKwc7cWm6Z2XcFPzOkxPZWq9GYgW
 NIhS65weBqzM+4dkykKROPXM/dqKLOEwSEyHyY2vgAURqutIBekXy8bYsspArt28QT0pOZTqwge
 ffGU2DqncxGDdFsPGONjVn1kEsihZtZpfQPaLhArVMtmoamU3t30lF1LTUd5Xc/vsmcDoBdhuEe
 qDzSY7lVxJApswq00YadPZP4xDSvdA==
X-Authority-Analysis: v=2.4 cv=FOoWBuos c=1 sm=1 tr=0 ts=68ff3199 cx=c_pps
 a=NtQEcg4T3rGzBSLVY3gzHQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=X3Vhep8SS4Oh-M7r9dgA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: -1fZQZC9qPkmqIqK_PMBleic08lTjhyK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 08:47:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225324

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

git log --oneline e7c419a2957590fb657900fc92a89708f41abd9d..cf926cd7fb9500035be19bca90ba9c855dcfcf92

cf926cd7fb (HEAD, origin/release/2.41/master) nss: Group merge does not react to ERANGE during merge (bug 33361)
9867e44cdc AArch64: Fix SVE powf routine [BZ #33299]
a52c9b75c7 Optimize __libc_tsd_* thread variable access
ed4672abb5 i386: Add GLIBC_ABI_GNU_TLS version [BZ #33221]
7aa907241c i386: Also add GLIBC_ABI_GNU2_TLS version [BZ #33129]
c1bec0b52d i386: Update ___tls_get_addr to preserve vector registers
aa5dbd5332 elf: Preserve _rtld_global layout for the release branch
42f9c70ac2 elf: Test dlopen (NULL, RTLD_LAZY) from an ELF constructor
3f3b4fdd0b elf: Fix handling of symbol versions which hash to zero (bug 29190)
e2d9e9eb26 x86-64: Add GLIBC_ABI_DT_X86_64_PLT [BZ #33212]
dd87fcda43 x86-64: Add GLIBC_ABI_GNU2_TLS version [BZ #33129]
85780b6055 elf: Compile _dl_debug_state separately (bug 33224)
b05ce0de3d elf: Restore support for _r_debug interpositions and copy relocations
9d6577fdff elf: Introduce _dl_debug_change_state
4a3e5f1e4c elf: Introduce separate _r_debug_array variable
940d821afb Use TLS initial-exec model for __libc_tsd_CTYPE_* thread variables [BZ #33234]
5d8614b284 ctype: Fallback initialization of TLS using relocations (bug 19341, bug 32483)
f409ec073f Use proper extern declaration for _nl_C_LC_CTYPE_{class,toupper,tolower}
330cd035df Remove <libc-tsd.h>
c467918138 AArch64: Improve codegen SVE log1p helper
6db0f659c8 AArch64: Optimise SVE FP64 Hyperbolics
503f7a7d33 AArch64: Optimize SVE exp functions
307a8a4434 AArch64: Improve codegen in SVE log1p
2a0b52fdd6 AArch64: Optimize inverse trig functions
0bb6dad5af AArch64: Optimize algorithm in users of SVE expf helper
daa4de5253 AArch64: Avoid memset ifunc in cpu-features.c [BZ #33112]
1502c248d5 nptl: Fix SYSCALL_CANCEL for return values larger than INT_MAX (BZ 33245)
513629b14d elf: Handle ld.so with LOAD segment gaps in _dl_find_object (bug 31943)
f48de98bce elf: Extract rtld_setup_phdr function from dl_main
62928cf7d8 elf: Do not add a copy of _dl_find_object to libc.so
373408c19f stdlib: resolve a double lock init issue after fork [BZ #32994]

Testing Results:
             Before     After    Diff
PASS         5829       5837      +8
XPASS        4          4          0
FAIL         240        242       +2
XFAIL        16         16         0
UNSUPPORTED  161        161        0

Testcases changes

testcase-name                            before           after
elf/check-dt-x86-64-plt(new)               -               PASS
elf/check-gnu2-tls(new)                    -               PASS
elf/tst-dlmopen4-nonpic(new)               -               PASS
elf/tst-dlmopen4-pic(new)                  -               PASS
elf/tst-dlopen-constructor-null(new)       -               PASS
elf/tst-link-map-contiguous-ldso(new)      -               PASS
elf/tst-link-map-contiguous-libc(new)      -               PASS
elf/tst-tls23(new)                         -               PASS
elf/tst-version-hash-zero(new)             -               PASS
ctype/tst-ctype-tls-dlmopen(new)           -               FAIL
ctype/tst-ctype-tls-dlopen-static(new)     -               FAIL
elf/ifuncmain8                            PASS              -

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 881a9cce2c..b3a66f0a40 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,7 +1,7 @@
 SRCBRANCH ?= "release/2.41/master"
 PV = "2.41+git"
-SRCREV_glibc ?= "e7c419a2957590fb657900fc92a89708f41abd9d"
-SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
+SRCREV_glibc ?= "cf926cd7fb9500035be19bca90ba9c855dcfcf92"
+SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
 
-- 
2.49.0


