Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFB8C61DBC
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 01:33:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12589.1787621615802137744
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 18:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pQ+PnNRk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ONKncq220298
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 01:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=XddR0/jmFczF+a/KF7fzzJ59dUhFigBtOkt7u8ptAlw=; b=
	pQ+PnNRkEdeg5tZmwTlMxs/0w9Yru188YOgh/PvyyGhIQfdHpwSv/XpiBA51uLyJ
	3Y+VLDc1Pb6zZJ1btMicw2Kor5/6Kibpyp/uIJLxZtddWC17tXFxESQjmqi1CpcQ
	dR9y2Y1QwIjUX/YxIMDcIu9CLU0LXlbNG2vhsfjOxThw0oym4hwOeAjQE9bQ9Gk2
	Qvw7lOvHGUCkT4rQl7MgPsuvQSAFGPgdGApYqyDCaRsYJOAq+7REYIIjjYC1YAoI
	YHTjMWjl0NJWOklQJyLnD+dOKl39DhOylXR8whNJ4RpuWfjesGvrbb7eQPhZ4Q3o
	UVxwzI6ZvkSAdpGC1s0vHg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022112.outbound.protection.outlook.com [52.101.43.112])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7100ktnr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 01:33:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6riB+ONcWOWm+3gwGoxxmpMeWGyQmXmZmvJobatfXG9Lcw7lp3RVwj9eVnDd9gv6hQbhHNYBT7cTLHOYEu3YdYbWp3mJPlpNF9V/aTbt8c+mSUjM92q3Q4k64QtIMDlAtxAaTi6YmMx8VEVF1+ZBO5YxEN3JHQELCFr4FKm2k4VVYswDL/6JJuGaG+dUg6ENII8Aj/7UXoL8+te3SFiRPU1LPURi+b4yJ2M8O3cXsVnpcqJe76Go5nFWr24I1hMedoHEvlRsjQ3Gpc3DROSrHEEj2CtmVq7lVSGq9Z0zuXsPI8LOQI+vOysnQJ5DADeqwY+i+rK0Epl4zJurgBzdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XddR0/jmFczF+a/KF7fzzJ59dUhFigBtOkt7u8ptAlw=;
 b=BSmIgtStkoj9xaa7TTp09dm0Fr3pPN+OLGZ43p8RFHYxT/ZFFUgrJb4fP0QGjHkvPcGFUMrYIOLIw8if43A7IqvJ1IMJXYHDgZPk9fUpVf5PuXVLmVnJmcIzXp6Jn/e5tvSjnx6HgnObban6klowh0i+t2r+TDdV/khSkvLwn+XQEupcp/8BKyPSGleP80veKv4ilMcgJGoP5WuD0A2IM5OWAPp5KQKfF96Dy2X9wnMtAICR/FdVYoCBR3YEpLuKpufEGHQWBCYB0jQxdEyTvKxb3yj5PGKsBeB5L64Eya0WPsytZicjwN3YC2LJhhgtUNFAbOXOPVsRlA8QttHR4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by MN6PR11MB8196.namprd11.prod.outlook.com (2603:10b6:208:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 01:33:30 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 01:33:30 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v17 06/14] rpm: 4.20.1 -> 6.0.2
Date: Mon, 24 Aug 2026 18:33:04 -0700
Message-ID: <20260825013312.2695028-7-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
References: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:254::28) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|MN6PR11MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 74e3fd27-0583-415a-fd15-08df0248de88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|22082099003|18002099003|11063799006|56012099006|5023799004|13003099007|3023799007|38350700014|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	V8HLWhNpcrTkRHN+SmVipKF1v/7M+ORdAnxfivnhgDfK9JZVZRM5PIZYQYaCia0yIkcri5Ga88LtY1hm3U+JedWIy7AiMbQND9naqt6IlOd0qpPvWTr9YzKztmiww7Okl7qczNhQEqLBiQDq/1a9gNns5mMQKTALMy1gXcq1y8ElUcL+r4XAgVOUdG6zE+d71vzpuI/txpIBe3dfFvlJYV9s/DpSuhXdKu8sJx5qyythWlK+61mrbiYK+n5TkwKZvuSozrgDc6zgQjyp8/d+L/JJsZ+H7ihInkDiZ7by2JftUgt23y963EZhaInzsGxWnyI7/ga6n7hTAGbaKfhUe8ucGBDNxvNFJqfdxWvPhqlVc2y6Tsk6rev1aVA5gvUFRqCxMMLLIYsL1lQ/Fgxu3OgEFXuQXx/d28zf2qQxM0eLx2DpeKt4a2zfPTpcSGK5uJBNBO2gNG/QZLUKHhXg0pAyZnN/eyBFvt/d8xJWcPIzXAejVRtCRIaGmaMSJ78DWxmoJrth2ydMFKEV1ihVKe0xcb82ab/Tv5Cmc6XgjDptaryj1TztULPW6W7onieEl3WohBFePEMh6TXtFK1UuDyKeAptuR7kI5Ah2LkS1PIhxog6CdC5WiKm5u9QJefk5M26MbZefhpUHZ2OlRCNWTUe4LO1JmjRw0jAjT/KSfo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(5023799004)(13003099007)(3023799007)(38350700014)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KxWHxy8FzpbR7AkpwRf4EQXkXhuZMzJfl96/RPwi5zvkd8LaB9nG2Ee5QFV6?=
 =?us-ascii?Q?CDb6lN58onIWvsmMfa1IzLo6nup0mSxkQRDLUQkIPXckA2guYWB0U5GHXTwb?=
 =?us-ascii?Q?1H50qMPpX9MgyPM5UgAclAcUI1XRAkAbC8sjPKA6+qSgmNtLveKSfAufVLtc?=
 =?us-ascii?Q?TO4VnKuHeF1zmTeS2WTGbG6ZirhuFWeUtUWt7KtLPemoNaFx7yAKxje0HASZ?=
 =?us-ascii?Q?43U69W2pM0AJuDM5A6tc35E3Qtfb3afdiVgMiqc/EflkE6LbK8fdQoWMXRah?=
 =?us-ascii?Q?mYqkH3I/zxXyHYMZe9rXtSxSPagiF8pJNoGw9264v1TtW3hduk4LsFTXQ0QK?=
 =?us-ascii?Q?yxM4AOdySyFDy8pQUbB0SddJQSs4gSpV8i8/C9vtBkZ2p6XpNwSQmSto4k/X?=
 =?us-ascii?Q?5Z8sZwmpotprIB9dj8C6+QOPNhes6VeH2djA0EdDLTgRLfix/n/hCvELFDEu?=
 =?us-ascii?Q?3xqPV74wiLKBFzmhYuAjJW1LcF5coWSy/Sf7aPWJmd/GYuqPoD+xtBCwUguV?=
 =?us-ascii?Q?XzoU1IT7y5ZXp+QjlMdDIoshG/ZVqMOOBWOZEeblstuggJ/I/VfY/9fxVXKq?=
 =?us-ascii?Q?XApkURRC5OQWxjkFJ3KMQK4/ZqTGfaSOghhCgbDLKApTvkRO5y6MWo4n4GOG?=
 =?us-ascii?Q?sg1zBlBTInwjcy2Ikug2Sza3NIoHkX8Nbnyl1TImj2sndllwaj++puJcDXVZ?=
 =?us-ascii?Q?XCYDHgIxGEwLBuAhos9UzaJO6q7RDP/C/sosYVtt8AiT6P1HF/9sByrEunIL?=
 =?us-ascii?Q?flI1IYHVmzKWT1Ejdb9WQ+Ue7rHk2VH/q1LNBU1g5DqiTUW3Gs5U8lp1QPbL?=
 =?us-ascii?Q?Bn8nH+CWWQc6ip+HPxrbcvpktIaS3j58gymC7hWNyVdqfZ6a2v3mZ3Q2c124?=
 =?us-ascii?Q?nSTb8HwM2bPL0L9avP3xmRjD3R/TjSklSRHu8bw+FsllWpXEU5Fi//5daX9E?=
 =?us-ascii?Q?icrnWbLPG3o3LefEZni4ipmS94qIHIy3njKM7IKcX0TYF8G+GKvXkda2o2sY?=
 =?us-ascii?Q?IKE4Cao5TQrN5tifo4M4dTqBEyymHYCdigUt+hmJorcN4iWTZc3NKJ+8Lh/U?=
 =?us-ascii?Q?RMgjjGaz9sHoZurxoWvj0vFDC4Uj7L/bohzYG0ptYW7a36UoOWRtnPdEuRxp?=
 =?us-ascii?Q?mhkxNRU9tCkkiBR4YOyH50Lk5nhLenhgYeOaro9WIsgeWDuRApUzuxi6cJEK?=
 =?us-ascii?Q?Su+kICoKdgmvkhw4KTdjlgVoL68Foa63Q96jGnNqtRJI3pYqbOnceQipamUR?=
 =?us-ascii?Q?htou1RtqMo0Win/gdyXCeVWj7M51eXI/dJKFFeDm1w9PIHjRgmaE52FgVOK1?=
 =?us-ascii?Q?eBOSDo7or2Lf5UJEvmdjmdyZAYp1AXy2Id5lrVH8KUAH+jY5oXtD7EkoC4Sn?=
 =?us-ascii?Q?5JMgRNOa7AzLMknPa7CLAgtBLtil8U1j+Xba+tq3bOmz56nqFj0y2fzyXElP?=
 =?us-ascii?Q?yQ4xNP1bH3N814yxvcFdenm2f5kN0j3vYOuJjb7wuCSHFl6fKp9o50J9Zdin?=
 =?us-ascii?Q?VHul/UKWx71gix3dPnpu2lx0Jx5lYnFKOYxK8o159rFZsYBhHCYIZPoMGyBU?=
 =?us-ascii?Q?mTkZctek4X+ETZ6Nww7UBrNzc+ggIpu2i0NV8GeeD9nHbh+bMrZW+zmG0P1M?=
 =?us-ascii?Q?NBNdeA0P02jKfQ4z5v3MyxYIo8Ga2KA25GC6rjZzGFQ0fs58pOZdEj5NDM6k?=
 =?us-ascii?Q?+BCvQIvTDb5AFwtI99XES4x9c2HSGJCTmfW5qK8aNFBXsgDYaTq8n6kuWhbl?=
 =?us-ascii?Q?4gSVKkQ6xiCcBp52CLhdoQUPR5VG8r0=3D?=
X-Exchange-RoutingPolicyChecked: 
	TMNnPS0gl/g7LAeA6e5Kseu9vATK5F25IgjI8Z08L3Dx0461cpbwbGEQMHer25vWAcg+xywVxQu/rTn0ErZer+/0coIsRw97Uk4udrT54XeKAf70n0YXFt0q/OfTG2K7DLBkfA3AdqDdHNBkHd6TlXEHX4oPmVsT3Y2Z1iK7yFc7fsPo/8jbrihdn23io8fqC/nKJH1FQiEM2aQ5oHibAg8cILGJlQXHdbVWlNeHA28juR+Dtd0h8Hf+o5q3aNv+X5wmPsIAWk985+IQohITJ42yACQuNicD0p2fPTu4F0b9IVowk5S6YDlVO42rGDaP/SeL6bMejImc/nxvgD9ZRg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e3fd27-0583-415a-fd15-08df0248de88
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 01:33:30.5725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NuCwOIsPS2/1vm2JKaC5g25liSNCcMsL6A/6gMcmPxMQMk9bkeKSpHRaUQxk/W4S1guYOBIAkA/dDALEuFtVPcn1Xm/nN9EFcdw9g5sD8zQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8196
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Gb7D8P5qLbWDrWZDholxq9N4iwdCVsPD
X-Authority-Analysis: v=2.4 cv=UaJhjqSN c=1 sm=1 tr=0 ts=6a8cf0ee cx=c_pps
 a=p4c3Up3QyKVVMVBhHExQxQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=GMGn13PZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=Ia9td_k3mc_TV5fArrgA:9 a=2yX8oE26ukr_L8MB:21 a=O8hF6Hzn-FEA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=jIF0orF5dxDFSsn8Ms5I:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 7c58Gr7gDh7JpmNoolE0mXkeevzEYL08
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfX5vM2F/UNjA94
 EIu4Am5Lal6SLts/5LMIcmPQZSW0tkJI0ZpitghS1tPxE0mcU4pHxlyM5DmBx20BVJJ9yqxoRuq
 CjmkpxrPbX9ORIa6WV+Vq6ybwC/YqYXRAmaRcSNdLJuwZpgMRgYX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfX2G9ZaO1u/R76
 y3e2EoGtNWqkload0DRfHkv/P2yr3+DyNBXQj5j2v9zn+JXoIecYQAaFs3lka9gIrl3SW9Q6QKQ
 MrZzfitJuXou25pSCuZk9CGXx5hHOPhlNxyVT6W+awnczfyAXEPnvCLVnodzpy6euOUicRC0iWt
 ig8CUOJdja0NkxPeQghkMTChacOCfjfmcaN+pmVlXEwcJeWexbckbH9zSB/3F0PVsCSIJqQUzFE
 axghh/aZE1SX6zmy0MsAkNA4aa8HR5DL+TSXw+BiTa3wgxfkzSLljjH1YqJaxA/z664MKaKrwgh
 dsKNqCntZSr2oVdcRWMpkBXMgSzqktC70d33rxuWsxGOLo8r1Csh8F7O+ysekbQYBoQoHkqYgQh
 fb3O1HUgepzpVOgxxyQtYVCh0EK462v93K6c7FbXjKgtILqpWa41/5yyu2yPe7xy5HFTa3UiJGs
 s/rejsFKh3vugioZ5Sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 01:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244178

* Add a tag to SRC_URI so that there will be errors when only change the
filename during upgrade it, as suggested by Alexander.

* Rebase the following patch:
  - 0001-Add-a-color-setting-for-mips64_n32-binaries.patch
  - 0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
  - 0001-Do-not-read-config-files-from-HOME.patch
  - 0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
  - 0001-When-cross-installing-execute-package-scriptlets-wit.patch
  - 0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
  - 0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
  - 0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
  - 0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch
  - 0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch

* Updated
  0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
  Remove the changes for macros.in since it doesn't work for rpmbuild, rpmbuild
  is like cross build, will define the values in package_rpm.bbclass.

* Remove
  0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch, there
  are no such warnings in rpm 6.0.2.

* Remove backported patch
  0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch

* Add the following patches:
  - 0001-tools-elfdeps.cc-Remove-format-module.patch
    There is no format until gcc 13.1, so remove the format module to make it
    work on hosts such as Ubuntu 22.04.

  - 0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
    Fixed:
    GPG check FAILED

* Fix filter /usr/bin/pkg-config file dependency
  pkg-config is a build-time tool, not a runtime dependency. Filter the
  /usr/bin/pkg-config file dependency that RPM pkgconfig.attr
  auto-detects for packages with .pc files, preventing unnecessary
  hard dependencies in -dev packages.

* Add scdoc-native to DEPENDS to fix do_configure error for both native and
  target:
  Could not find SCDOC using the following names: scdoc

  Note, both target and native need scdoc-native, it is used for generating the
  manual, the man pages in *man/* are scdoc sources

* Add /etc/rpm to nativesdk-rpm to fix:
  ERROR: nativesdk-rpm-1_6.0.1-r0 do_package: QA Issue: nativesdk-rpm:
  Files/directories were installed but not shipped in any package:
  /etc
  /etc/rpm

* Add /etc/rpm to nativesdk-rpm to fix:

* Fix build with systemd, the rpm's sysuser creation doesn't work with
  cross build, and we don't need rpm to create the users since we have
  useradd.bbclass. The fix is:
  cmd = cmd + " --define '__sysusers_path %{nil}'"

  The error is:
  /var/tmp/rpm-tmp.U4iaJX: line 114: tr: command not found

* Make rpmbuild can find the pkgconfig (.pc) files in
  /usr/share/pkgconfig:
  cmd = cmd + " --define '_datadir ${datadir}'"

  The error is:
  - nothing provides pkgconfig(shared-mime-info) needed by libgdk-pixbuf-2.0-dev-2.44.5-r0.x86_6

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass       |  4 ++
 ...olor-setting-for-mips64_n32-binaries.patch | 22 ++++----
 ...akeLists.txt-Fix-checking-for-CFLAGS.patch | 46 -----------------
 ...et-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch | 50 -------------------
 ...satisfiable-dependency-when-building.patch | 18 ++++---
 ...lib-rpm-as-the-installation-path-for.patch | 24 +++------
 ...1-Do-not-read-config-files-from-HOME.patch | 18 ++++---
 ...-PATH-environment-variable-before-ru.patch | 16 +++---
 ...lling-execute-package-scriptlets-wit.patch | 12 +++--
 ...not-insert-payloadflags-into-.rpm-me.patch | 18 ++++---
 ....c-fix-file-conflicts-for-MIPS64-N32.patch | 18 ++++---
 ...kgverify_level-to-digest-as-RCPM-4.2.patch | 35 +++++++++++++
 ...ools-elfdeps.cc-Remove-format-module.patch | 38 ++++++++++++++
 ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch | 26 ++++++----
 ...avoid-using-GLOB_BRACE-if-undefined-.patch | 14 ++++--
 ...ge-logging-level-around-scriptlets-t.patch | 14 +++---
 .../rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb}       | 14 +++---
 17 files changed, 199 insertions(+), 188 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
 rename meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb} (96%)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 9af4cbdd94..51ad195baa 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -587,6 +587,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
     cmd = cmd + " --define '_lib ${BASELIB}'"
     cmd = cmd + " --define '_libdir ${libdir}'"
+    cmd = cmd + " --define '_datadir ${datadir}'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
@@ -601,6 +602,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"
+    cmd = cmd + " --define '__sysusers_path %{nil}'"
     cmd = cmd + " --define '_use_weak_usergroup_deps 1'"
     cmd = cmd + " --define '_passwd_path " + "/completely/bogus/path" + "'"
     cmd = cmd + " --define '_group_path " + "/completely/bogus/path" + "'"
@@ -622,6 +624,8 @@ python do_package_rpm () {
 python () {
     if d.getVar('PACKAGES') != '':
         deps = ' rpm-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot'
+        # The pkgconfig-native is required by rpm's pkgconfigdeps.sh
+        deps += ' pkgconfig-native:do_populate_sysroot'
         d.appendVarFlag('do_package_write_rpm', 'depends', deps)
         d.setVarFlag('do_package_write_rpm', 'fakeroot', '1')
 
diff --git a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
index 769d7b3409..a808009058 100644
--- a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
@@ -5,16 +5,20 @@ Subject: [PATCH] Add a color setting for mips64_n32 binaries
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Rebased to 6.0.2
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
 ---
- build/rpmfc.c | 4 ++++
+ build/rpmfc.cc | 4 ++++
  rpmrc.in      | 2 ++
  2 files changed, 6 insertions(+)
 
-diff --git a/build/rpmfc.c b/build/rpmfc.c
-index 86dd36d14..df421a23f 100644
---- a/build/rpmfc.c
-+++ b/build/rpmfc.c
-@@ -716,6 +716,7 @@ static int rpmfcHelper(rpmfc fc, int *fnx, int nfn, const char *proto,
+diff --git a/build/rpmfc.cc b/build/rpmfc.cc
+index 833e56fa8..d50a3407f 100644
+--- a/build/rpmfc.cc
++++ b/build/rpmfc.cc
+@@ -690,6 +690,7 @@ static int rpmfcHelper(rpmfc fc, int *fnx, int nfn, const char *proto,
  static const struct rpmfcTokens_s rpmfcTokens[] = {
    { "directory",		RPMFC_INCLUDE },
  
@@ -22,7 +26,7 @@ index 86dd36d14..df421a23f 100644
    { "ELF 32-bit",		RPMFC_ELF32|RPMFC_INCLUDE },
    { "ELF 64-bit",		RPMFC_ELF64|RPMFC_INCLUDE },
  
-@@ -1258,6 +1259,9 @@ static uint32_t getElfColor(const char *fn)
+@@ -1191,6 +1192,9 @@ static uint32_t getElfColor(const char *fn)
  		color = 0;
  		break;
  	    }
@@ -33,10 +37,10 @@ index 86dd36d14..df421a23f 100644
  	if (elf)
  	    elf_end(elf);
 diff --git a/rpmrc.in b/rpmrc.in
-index 8646a966b..7349fdfd3 100644
+index 8fd0d7ee1..4cc52ceb3 100644
 --- a/rpmrc.in
 +++ b/rpmrc.in
-@@ -142,6 +142,8 @@ archcolor: mipsr6el 1
+@@ -152,6 +152,8 @@ archcolor: mipsr6el 1
  archcolor: mips64r6 2
  archcolor: mips64r6el 2
  
diff --git a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
deleted file mode 100644
index 412e1c146d..0000000000
--- a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From e14502834fe6a9c6c9a439401ac3d2c8fd979267 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Sun, 8 Jun 2025 00:36:38 -0700
-Subject: [PATCH] CMakeLists.txt: Improve checking for CFLAGS
-
-The previous log wasn't clear:
--- Performing Test found
--- Performing Test found - Success
--- Performing Test found
--- Performing Test found - Success
--- Performing Test found
--- Performing Test found - Failed
-
-Use a new var compiler-supports${flag} will make it more clear:
--- Performing Test compiler-supports-fno-strict-overflow
--- Performing Test compiler-supports-fno-strict-overflow - Success
--- Performing Test compiler-supports-fno-delete-null-pointer-checks
--- Performing Test compiler-supports-fno-delete-null-pointer-checks - Success
--- Performing Test compiler-supports-fhardened
--- Performing Test compiler-supports-fhardened - Failed
-
-Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/e14502834fe6a9c6c9a439401ac3d2c8fd979267]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- CMakeLists.txt | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 08e3e5274..f275c396b 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -416,11 +416,10 @@ endif()
- 
- # try to ensure some compiler sanity and hardening options where supported
- foreach (flag -fno-strict-overflow -fno-delete-null-pointer-checks -fhardened)
--	check_c_compiler_flag(${flag} found)
--	if (found)
-+	check_c_compiler_flag(${flag} compiler-supports${flag})
-+	if (compiler-supports${flag})
- 		add_compile_options(${flag})
- 	endif()
--	unset(found)
- endforeach()
- 
- # generated sources
diff --git a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
deleted file mode 100644
index 7db643871f..0000000000
--- a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From cb5355da9b47166253dbe5ab3215e433b55068d1 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Fri, 26 Jul 2024 17:18:30 +0800
-Subject: [PATCH] CMakeLists.txt: set libdir to ${CMAKE_INSTALL_FULL_LIBDIR} in
- macros
-
-There is a patch in oe-core[1] to avoid hardcoded paths in macros. It
-tries to use libdir to expand %_libdir in macros.in. However, in
-upstream commit[2], libdir for macros in CMakeLists.txt is set to
-${prefix}/=LIB=, which causes %_libdir to expand to ${prefix}/=LIB=
-instead of the correct path in the final macros.
-
-On target:
-$ rpm --showrc | grep _libdir
-[snip]
--13: _libdir    ${prefix}/=LIB=
-[snip]
-
-This also causes %__pkgconfig_path in fileattrs/pkgconfig.attr to become
-an invalid regular expression when building rpm packages. This results a
-warning in log.do_package_write_rpm in all packages:
-
-Warning: Ignoring invalid regular expression ^((${prefix}/=LIB=|usr/share)/pkgconfig/.*.pc|usr/bin/pkg-config)$
-
-Set libdir to ${CMAKE_INSTALL_FULL_LIBDIR} instead of ${prefix}/=LIB= to
-make sure it is expanded to the correct path in macros.
-
-[1] https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
-[2] https://github.com/rpm-software-management/rpm/commit/d2abb7a48760418aacd7f17c8b64e39c25ca50c9
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 08dabffd3..1b7661139 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -96,7 +96,7 @@ function(makemacros)
- 	set(sysconfdir "${CMAKE_INSTALL_FULL_SYSCONFDIR}")
- 	set(sharedstatedir "${CMAKE_INSTALL_FULL_SHAREDSTATEDIR}")
- 	set(localstatedir "${CMAKE_INSTALL_FULL_LOCALSTATEDIR}")
--	set(libdir "\${prefix}/=LIB=")
-+	set(libdir "${CMAKE_INSTALL_FULL_LIBDIR}")
- 	set(includedir "\${prefix}/${CMAKE_INSTALL_INCLUDEDIR}")
- 	set(oldincludedir "${CMAKE_INSTALL_FULL_OLDINCLUDEDIR}")
- 	set(infodir "\${prefix}/${CMAKE_INSTALL_INFODIR}")
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
index 96a5e14999..63a10df0d5 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
@@ -9,16 +9,20 @@ hand produces rpms that way by design.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Rebased to 6.0.2
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
 ---
- build/pack.c | 4 ----
+ build/pack.cc | 4 ----
  1 file changed, 4 deletions(-)
 
-diff --git a/build/pack.c b/build/pack.c
-index eb9c7b3f1..fb1f1bed8 100644
---- a/build/pack.c
-+++ b/build/pack.c
-@@ -712,10 +712,6 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
- 	headerPutBin(pkg->header, RPMTAG_SOURCEPKGID, spec->sourcePkgId,16);
+diff --git a/build/pack.cc b/build/pack.cc
+index 49c9d0a58..b1cda6d75 100644
+--- a/build/pack.cc
++++ b/build/pack.cc
+@@ -805,10 +805,6 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
+	headerPutBin(pkg->header, RPMTAG_SOURCESIGMD5, spec->sourcePkgId,16);
      }
  
 -    if (cheating) {
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
index 6a44f4f22d..309320cf43 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
@@ -6,10 +6,16 @@ Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
 
 Upstream-Status: Denied [https://github.com/rpm-software-management/rpm/pull/263]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Updated for rpm 6.0.2:
+Remove the changes for macros.in since it doesn't work for rpmbuild, rpmbuild
+is like cross build, will define the values in package_rpm.bbclass.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
 ---
  CMakeLists.txt | 2 +-
- macros.in      | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ 1 files changed, 1 insertions(+), 1 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
 index de0b578a6..9a3aba071 100644
@@ -23,17 +29,3 @@ index de0b578a6..9a3aba071 100644
 +set(RPM_CONFIGDIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/rpm" CACHE PATH "rpm home")
  set(RPM_MACROSDIR "${RPM_CONFIGDIR}/macros.d")
  set(RPM_VENDOR "vendor" CACHE STRING "rpm vendor string")
- 
-diff --git a/macros.in b/macros.in
-index 4d3e8afdc..66e31320f 100644
---- a/macros.in
-+++ b/macros.in
-@@ -964,7 +964,7 @@ Supplements:   (%{name} = %{version}-%{release} and langpacks-%{1})\
- %_sharedstatedir	%{_var}/lib
- %_localstatedir		%{_prefix}/var
- %_lib			lib
--%_libdir		%{_exec_prefix}/%{_lib}
-+%_libdir		@libdir@
- %_includedir		%{_prefix}/include
- %_infodir		%{_datadir}/info
- %_mandir		%{_datadir}/man
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch
index bfc9a74b6c..ae47499e22 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch
@@ -5,15 +5,19 @@ Subject: [PATCH] Do not read config files from $HOME
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Rebased to 6.0.2
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
 ---
- lib/rpmrc.c | 6 ++----
+ lib/rpmrc.cc | 6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)
 
-diff --git a/lib/rpmrc.c b/lib/rpmrc.c
-index 5d778b8b7..dc8d42aeb 100644
---- a/lib/rpmrc.c
-+++ b/lib/rpmrc.c
-@@ -485,8 +485,7 @@ static void setDefaults(void)
+diff --git a/lib/rpmrc.cc b/lib/rpmrc.cc
+index 2b3baeddc..cea6f4bc5 100644
+--- a/lib/rpmrc.cc
++++ b/lib/rpmrc.cc
+@@ -390,8 +390,7 @@ static void setDefaults(void)
      if (!defrcfiles) {
  	defrcfiles = rstrscat(NULL, confdir, "/rpmrc", ":",
  				confdir, "/" RPM_VENDOR "/rpmrc", ":",
@@ -23,7 +27,7 @@ index 5d778b8b7..dc8d42aeb 100644
      }
  
      /* macrofiles may be pre-set from --macros */
-@@ -498,8 +497,7 @@ static void setDefaults(void)
+@@ -403,8 +402,7 @@ static void setDefaults(void)
  				confdir, "/" RPM_VENDOR "/macros", ":",
  				SYSCONFDIR "/rpm/macros.*", ":",
  				SYSCONFDIR "/rpm/macros", ":",
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
index d3263896ef..05c8b79f29 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
@@ -8,15 +8,19 @@ We add lots of native stuff into it and scriptlets rely on that.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Rebased to 6.0.2
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini<sumanth.gavini@windriver.com>
 ---
- lib/rpmscript.c | 2 +-
+ lib/rpmscript.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index 060fd8124..4dc6466a8 100644
---- a/lib/rpmscript.c
-+++ b/lib/rpmscript.c
-@@ -251,7 +251,7 @@ static void doScriptExec(ARGV_const_t argv, ARGV_const_t prefixes,
+diff --git a/lib/rpmscript.cc b/lib/rpmscript.cc
+index b75a62085..2d7a4c889 100644
+--- a/lib/rpmscript.cc
++++ b/lib/rpmscript.cc
+@@ -260,7 +260,7 @@ static void doScriptExec(ARGV_const_t argv, ARGV_const_t prefixes,
  	if (ipath && ipath[5] != '%')
  	    path = ipath;
  
diff --git a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
index b71156fe12..90f5322573 100644
--- a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
+++ b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
@@ -26,15 +26,17 @@ Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 Rebased to 4.20.1
+Rebased to 6.0.2
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
 ---
- lib/rpmscript.c | 9 +++++++--
+ lib/rpmscript.cc | 9 +++++++--
  1 file changed, 7 insertions(+), 2 deletions(-)
 
-diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index eb14870b3..1785e8f30 100644
---- a/lib/rpmscript.c
-+++ b/lib/rpmscript.c
+diff --git a/lib/rpmscript.cc b/lib/rpmscript.cc
+index b75a62085..7d667b7f5 100644
+--- a/lib/rpmscript.cc
++++ b/lib/rpmscript.cc
 @@ -456,8 +456,7 @@ exit:
  	Fclose(out);	/* XXX dup'd STDOUT_FILENO */
  
diff --git a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch b/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
index 0c29e5543a..fe4e029830 100644
--- a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
+++ b/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
@@ -1,7 +1,7 @@
 From e688eb54fd54d65181e94b854b3568d99cbf3a24 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 31 Aug 2021 10:37:05 +0200
-Subject: [PATCH] build/pack.c: do not insert payloadflags into .rpm metadata
+Subject: [PATCH] build/pack.cc: do not insert payloadflags into .rpm metadata
 
 The flags look like '19T56' where 19 is the compression level
 (deterministic), and 56 is the amount of threads (varies from one
@@ -9,15 +9,19 @@ host to the next and breaks reproducibility for .rpm).
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+Rebased to 6.0.2
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
 ---
- build/pack.c | 2 +-
+ build/pack.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/build/pack.c b/build/pack.c
-index fb1f1bed8..45885a6ac 100644
---- a/build/pack.c
-+++ b/build/pack.c
-@@ -330,7 +330,7 @@ static char *getIOFlags(Package pkg)
+diff --git a/build/pack.cc b/build/pack.cc
+index b1cda6d75..1425d27ba 100644
+--- a/build/pack.cc
++++ b/build/pack.cc
+@@ -338,7 +338,7 @@ static char *getIOFlags(Package pkg)
  	    headerPutString(pkg->header, RPMTAG_PAYLOADCOMPRESSOR, compr);
  	buf = xstrdup(rpmio_flags);
  	buf[s - rpmio_flags] = '\0';
diff --git a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch b/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
index 7d443ccc6c..5dc059493c 100644
--- a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
+++ b/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
@@ -1,7 +1,7 @@
 From ad530868e37f09e9236c085d25a834304750704b Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 7 May 2020 17:40:58 +0800
-Subject: [PATCH] lib/transaction.c: fix file conflicts for MIPS64 N32
+Subject: [PATCH] lib/transaction.cc: fix file conflicts for MIPS64 N32
 
 This patch is from:
 https://github.com/rpm-software-management/rpm/issues/193
@@ -27,15 +27,19 @@ Fixed by performing a 'last-in-wins' resolution when "neither is preferred".
 Upstream-Status: Submitted <https://github.com/rpm-software-management/rpm/issues/193>
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Rebased to 6.0.2
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
 ---
- lib/transaction.c | 13 ++++++++++++-
+ lib/transaction.cc | 13 ++++++++++++-
  1 file changed, 12 insertions(+), 1 deletion(-)
 
-diff --git a/lib/transaction.c b/lib/transaction.c
-index 5e4414d2a..b1c55bd44 100644
---- a/lib/transaction.c
-+++ b/lib/transaction.c
-@@ -400,7 +400,18 @@ static int handleColorConflict(rpmts ts,
+diff --git a/lib/transaction.cc b/lib/transaction.cc
+index de7cdabb2..697268733 100644
+--- a/lib/transaction.cc
++++ b/lib/transaction.cc
+@@ -375,7 +375,18 @@ static int handleColorConflict(rpmts ts,
  		    rpmfsSetAction(ofs, ofx, FA_CREATE);
  		rpmfsSetAction(fs, fx, FA_SKIPCOLOR);
  		rConflicts = 0;
diff --git a/meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch b/meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
new file mode 100644
index 0000000000..500a667a1b
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
@@ -0,0 +1,35 @@
+From 1cb53934b83b794c319813106c9f12d75cce66d2 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sun, 18 Jan 2026 19:24:42 -0800
+Subject: [PATCH] macros.in: Set _pkgverify_level to digest as RPM 4.20.1
+
+Fixed:
+$ bitbake core-image-minimal
+Package bash-5.3-r0.16.x86_64_v3.rpm is not signed
+GPG check FAILED
+
+Set _pkgverify_level to digest as RPM 4.20.1 can fix the problem.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ macros.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/macros.in b/macros.in
+index 38066f00c..7fe00ad09 100644
+--- a/macros.in
++++ b/macros.in
+@@ -680,7 +680,7 @@ Supplements:   (%{name} = %{version}-%{release} and langpacks-%{1})\
+ # signature	require valid signature(s)
+ # digest	require valid digest(s)
+ # none		traditional rpm behavior, nothing required
+-%_pkgverify_level all
++%_pkgverify_level digest
+ 
+ # Disabler flags for package verification (similar to vsflags)
+ # Set to 0x0 for full compatibility with v4 packages.
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch b/meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
new file mode 100644
index 0000000000..25f5496bde
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
@@ -0,0 +1,38 @@
+From 3536ef6bb74144cf9dce10200cd62c2ad9f7cae4 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 15 Jan 2026 19:36:17 -0800
+Subject: [PATCH] tools/elfdeps.cc: Remove format module
+
+There is no format until gcc 13.1, so remove the format module to make it work
+on hosts such as Ubuntu 22.04.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ tools/elfdeps.cc | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/tools/elfdeps.cc b/tools/elfdeps.cc
+index 17884b24e..33ff8d740 100644
+--- a/tools/elfdeps.cc
++++ b/tools/elfdeps.cc
+@@ -1,6 +1,5 @@
+ #include "system.h"
+ 
+-#include <format>
+ #include <string>
+ #include <vector>
+ 
+@@ -105,7 +104,7 @@ static void addSoDep(std::vector<std::string> & deps,
+     if (ver.empty() && marker.empty()) {
+ 	addDep(deps, soname);
+     } else {
+-	auto dep = std::format("{}({}){}", soname, ver, marker);
++	std::string dep = soname + "(" + ver + ")" + marker;
+ 	addDep(deps, dep);
+     }
+ }
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch b/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
index 082fb343c2..1004253ff8 100644
--- a/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
+++ b/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
@@ -9,15 +9,19 @@ from target rootfs instead of its own native sysroot.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Rebased to 6.0.2
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
 ---
- lib/rpmrc.c | 18 +++++++++++++-----
+ lib/rpmrc.cc | 18 +++++++++++++-----
  1 file changed, 13 insertions(+), 5 deletions(-)
 
-diff --git a/lib/rpmrc.c b/lib/rpmrc.c
-index dc8d42aeb..3f2996850 100644
---- a/lib/rpmrc.c
-+++ b/lib/rpmrc.c
-@@ -481,11 +481,14 @@ static void setDefaults(void)
+diff --git a/lib/rpmrc.cc b/lib/rpmrc.cc
+index cea6f4bc5..e6cf21e1b 100644
+--- a/lib/rpmrc.cc
++++ b/lib/rpmrc.cc
+@@ -386,11 +386,14 @@ static void setDefaults(void)
  	    userrc = xstrdup(oldrc);
  	}
      }
@@ -33,7 +37,7 @@ index dc8d42aeb..3f2996850 100644
      }
  
      /* macrofiles may be pre-set from --macros */
-@@ -495,9 +498,9 @@ static void setDefaults(void)
+@@ -400,9 +403,9 @@ static void setDefaults(void)
  				confdir, "/platform/%{_target}/macros", ":",
  				confdir, "/fileattrs/*.attr", ":",
  				confdir, "/" RPM_VENDOR "/macros", ":",
@@ -46,7 +50,7 @@ index dc8d42aeb..3f2996850 100644
      }
  
      free(usermacros);
-@@ -1142,7 +1145,11 @@ static void read_auxv(void)
+@@ -1048,7 +1051,11 @@ static void read_auxv(void)
   */
  static void defaultMachine(rpmrcCtx ctx, const char ** arch, const char ** os)
  {
@@ -55,11 +59,11 @@ index dc8d42aeb..3f2996850 100644
 +    if (etcconfdir == NULL)
 +        etcconfdir = "";
 +
-+    const char * const platform_path = rstrscat(NULL, etcconfdir, SYSCONFDIR "/rpm/platform", NULL);
++    char * const platform_path = rstrscat(NULL, etcconfdir, SYSCONFDIR "/rpm/platform", NULL);
      static struct utsname un;
      char * chptr;
-     canonEntry canon;
-@@ -1462,6 +1469,7 @@ static void defaultMachine(rpmrcCtx ctx, const char ** arch, const char ** os)
+     int rc;
+@@ -1378,6 +1385,7 @@ static void defaultMachine(rpmrcCtx ctx, const char ** arch, const char ** os)
  
      if (arch) *arch = un.machine;
      if (os) *os = un.sysname;
diff --git a/meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch b/meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch
index 00fe19108e..59855466da 100644
--- a/meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch
+++ b/meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch
@@ -1,7 +1,7 @@
 From d8972ff7fa0a30e199144ba135223bf561874e01 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 16 Jan 2024 09:59:26 +0100
-Subject: [PATCH] rpmio/rpmglob.c: avoid using GLOB_BRACE if undefined by C
+Subject: [PATCH] rpmio/rpmglob.cc: avoid using GLOB_BRACE if undefined by C
  library
 
 This addresses musl failures; if there is code out there relying on
@@ -11,14 +11,18 @@ This is unlikely to be trivially fixable upstream.
 
 Upstream-Status: Inappropriate [reported at https://github.com/rpm-software-management/rpm/issues/2844]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+Rebased to 6.0.2
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
 ---
- rpmio/rpmglob.c | 6 ++++++
+ rpmio/rpmglob.cc | 6 ++++++
  1 file changed, 6 insertions(+)
 
-diff --git a/rpmio/rpmglob.c b/rpmio/rpmglob.c
+diff --git a/rpmio/rpmglob.cc b/rpmio/rpmglob.cc
 index eb439cad8..1eef0b851 100644
---- a/rpmio/rpmglob.c
-+++ b/rpmio/rpmglob.c
+--- a/rpmio/rpmglob.cc
++++ b/rpmio/rpmglob.cc
 @@ -33,6 +33,12 @@
  
  #include "debug.h"
diff --git a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
index bac2d6331c..84f909c68b 100644
--- a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
+++ b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
@@ -1,7 +1,7 @@
 From 452b696ea3e1975ea30cf7a92678aa4b316e6300 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Jan 2019 18:14:18 +0100
-Subject: [PATCH] rpmscript.c: change logging level around scriptlets to INFO
+Subject: [PATCH] rpmscript.cc: change logging level around scriptlets to INFO
  from DEBUG
 
 That way we can debug scriptlet failures without writing lots of
@@ -11,15 +11,17 @@ Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 Rebased to 4.20.1
+Rebased to 6.0.2
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
 ---
- lib/rpmscript.c | 8 ++++----
+ lib/rpmscript.cc | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
-diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index e9f288ae0..f0c628708 100644
---- a/lib/rpmscript.c
-+++ b/lib/rpmscript.c
+diff --git a/lib/rpmscript.cc b/lib/rpmscript.cc
+index fe5fc9138..861fd8ca8 100644
+--- a/lib/rpmscript.cc
++++ b/lib/rpmscript.cc
 @@ -299,7 +299,7 @@ static char * writeScript(const char *cmd, const char *script)
      if (Ferror(fd))
  	goto exit;
diff --git a/meta/recipes-devtools/rpm/rpm_4.20.1.bb b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
similarity index 96%
rename from meta/recipes-devtools/rpm/rpm_4.20.1.bb
rename to meta/recipes-devtools/rpm/rpm_6.0.2.bb
index 17e75c3e14..e8977aa31a 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
@@ -24,7 +24,7 @@ HOMEPAGE = "http://www.rpm.org"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=066ecde17828e5c8911ec9eae8be78f4"
 
-SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.20.x;protocol=https \
+SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-6.0.x;protocol=https \
            file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
            file://0001-Do-not-read-config-files-from-HOME.patch \
            file://0001-When-cross-installing-execute-package-scriptlets-wit.patch \
@@ -37,14 +37,14 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.20.x;protoc
            file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
            file://0001-CMakeLists.txt-look-for-lua-with-pkg-config-rather-t.patch \
            file://0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch \
-           file://0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch \
-           file://0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch \
+           file://0001-tools-elfdeps.cc-Remove-format-module.patch \
+           file://0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch \
            "
 
 PE = "1"
-SRCREV = "c8dc5ea575a2e9c1488036d12f4b75f6a5a49120"
+SRCREV = "a7f89afb57a98f6419d0eff35ca792198293b682"
 
-DEPENDS = "lua libgcrypt file popt xz bzip2 elfutils python3 sqlite3 zstd"
+DEPENDS = "lua libgcrypt file popt xz bzip2 elfutils python3 sqlite3 zstd scdoc-native"
 DEPENDS:append:class-native = " file-replacement-native bzip2-replacement-native"
 
 EXTRA_OECMAKE:append = " -D__CURL:FILEPATH=curl"
@@ -154,7 +154,8 @@ do_install:append () {
 
 FILES:${PN} += "${libdir}/rpm-plugins/*.so \
                "
-FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/rpm.sh"
+FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/rpm.sh \
+    /etc/rpm"
 
 FILES:${PN}-dev += "${libdir}/rpm-plugins/*.la \
                     "
@@ -181,6 +182,7 @@ FILES:${PN}-build = "\
     ${libdir}/rpm/mkinstalldirs \
     ${libdir}/rpm/macros.p* \
     ${libdir}/rpm/fileattrs/* \
+    ${libdir}/rpm/rpm-setup-autosign \
 "
 
 FILES:${PN}-sign = "\

