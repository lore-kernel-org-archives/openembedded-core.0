Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10E2CCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 11:10:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8708.1761649855679888050
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 04:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=E7gmKH4l;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=33963afc6a=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SA1lc9057642
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 11:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=dHY8F19lznz4iCW1Ro1ZZffBPsflU8IIVQFy8V2VJK8=; b=
	E7gmKH4l6HL+puuZ3lmpgREOFIWEUMD5aZHqj4lDDL3hL12pnOJgPNCQwE/j1CK7
	53k9WLP8VCtqUm7Xa/c/ylw8PqjNOJgnYL4fjzT59tduCq7zi22w7HpYX4AsCgAq
	c9bsYtDR8T1fZc8AfVAZyiXl+zecTvQIRRs9/ttCs1+E5j7JSzIEevUhlKxQemQK
	NjcszIwOtVNb6lxNWKMZyIMSvFklFSPIdTslTysiaEDERLqkrrb+b9w0ry49J7pq
	Oxxh06YxOeulpQC/J5Vj97efQaBsWV4YNORP2eGSOQWkqN/xramw2ps3Lyhsuy/E
	oSrIv5tkBtxRJox7Bj47qg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010029.outbound.protection.outlook.com [52.101.85.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0nh5u30t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 11:10:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ruYtkNHUOv4VcF7qvuhe5qHpaOyYpzzdb4Ig1d+xOU2+8g1otEMDTpsAMHklKc0lMHjgx8ti/kHXDoe5Z59cijfgu4eVcJsiUVq9un4TCqe7efbKey6YjhS8o+oBBSI5wlwhOLep7GxYXUkFL/jS3aCUBmDLv2w8yhLYO7n7ShhpR4xxV3MrMiDRIX34Gdt5HivQ6pRWNkqyW6JFzTdF0ZYjUk3mNWQxF/UdrWD5Tuqm9stLbsyLsiZXR0nnKH/zJywgt/fwn9hoATG3Zo30HdpIRTFwtNpjjct956wf90D69VC5Xxrk8vOV9L73WrsYrE/kMgE5GmfG5HNQ4sXJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHY8F19lznz4iCW1Ro1ZZffBPsflU8IIVQFy8V2VJK8=;
 b=qsLniYo6Y6rvBuUZWyQPMFp3mVZY9/xZKm8iITbycmxCTv3iJLZkZ02nCTC6sPm3CM/t7EFqXzcxEnLZE33hxShDOlLMogRdgq0ot63fU4Mi1YmRixszj2LCRj48krQaZ8j5Odm3NzyBYQN0kKYBKLrfhGfoqDIsuou1/OkDAvKAyRnS0BBX9XXey60AbzWij5moM7QYvD2H7k4utj1zjIq3g8dXoG0wVr2JIpBO+xudcZ2ElH5p34EG1j2vQWDhg4p4r/q1ojq9EMxwiZu5ma3OQL+G1lbkNMlzSVXC3MtP4SXTERl77Y0zZcr25aoix5kZoyeH9SyifNJIPl50fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by CY8PR11MB7827.namprd11.prod.outlook.com (2603:10b6:930:77::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 11:10:52 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9228.016; Tue, 28 Oct 2025
 11:10:51 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [kirkstone][PATCH 2/2] binutils: fix CVE-2025-8225
Date: Tue, 28 Oct 2025 04:10:10 -0700
Message-ID: <20251028111010.3862497-2-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251028111010.3862497-1-Yash.Shinde@windriver.com>
References: <20251028111010.3862497-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0281.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::16) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|CY8PR11MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: c4f1bf06-4d45-4f77-24d3-08de1612a7ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HX43OAzcTsc5dAdTMy6TCmC2cXH458Cd2PhmY0Ryf3D0B5EMTLd+ZEikOoO8?=
 =?us-ascii?Q?Bd6rXRALQttgw0/uYLCksGgNW0sJqxhBzFtr4fJTSsoKTjaGMXAbw8+dYQ1t?=
 =?us-ascii?Q?yaOtzT2L6a5+Z6CIGOW9/roSkQywz4pEJdGg/iX5Cx3zdsLErVUt5IL7ho9d?=
 =?us-ascii?Q?CLTWWcAv1bFRrc7VvoxZGjMasBRWpzOFL1d6WuAKCyA7RfAM5+LriSFTnAmz?=
 =?us-ascii?Q?CRli2Ewi5ryN5t/54sIyqxqGMY1qQQDaHLwYBXxMRXT+Z7LS0LFT/RQrzdNH?=
 =?us-ascii?Q?qBqQiEXFiH2wTPPDB8BPsshVZT7m0OXID6ufyCxi0V0zbpDC1mOOk8Qh4QnB?=
 =?us-ascii?Q?PQ8newntiOVtDyu259sT2ByV2s7xQuJnH+X/kMeNBbVodbRcsV4iYM0YZbGl?=
 =?us-ascii?Q?XRb3tsJwLBsOMZcuI/BDeEnAuAK9VaJ+NxXF1+AOP2rczmONcX5/6bv+lpep?=
 =?us-ascii?Q?DQPsfWbUaNm6L190Xu6XcCUmgVSL6Sw/pSwVmGe3Ovq/LCxmTgQbTBmznIaG?=
 =?us-ascii?Q?6BlsXvZKcxl4b2xUqluzPldJWK0x1TReWaX55KY5xOnuhGigtrFVacLSbQfJ?=
 =?us-ascii?Q?DIzHIB77X+cZpeKHkSOk7wltBExM6K1Eb11S1e8hrFDDXiwo51swt+UzLlyv?=
 =?us-ascii?Q?Nnb5u8Zf7Bdc9TU9hnq44kp4XPZjOxGduF8vyl0J5eFwgy1V+m7YiDakvAQh?=
 =?us-ascii?Q?qShAM2D8zenn1/MkNmrqfytKTF0c7XP7a9gIc63kb6I63NHYC9JJIa+Yum1s?=
 =?us-ascii?Q?sDUYWmth45k4PMGijQoCmf1Bu+ufUbM6wvlTyA+jjbBznFAfX048f695uDiR?=
 =?us-ascii?Q?7SUEY+c5BNXUciENkSjHq4+B5Ba0c6ZFt8XO2v0HOOl26e2sX2J8p5O/95+M?=
 =?us-ascii?Q?b/cOKPSdgoPQgJuGKkIQsC9qWaoys3R7NOuixEltOej63+QAhUqcMaml2PVq?=
 =?us-ascii?Q?ahVopb3zj6N3w70Hx99uMhCa003gJpxm8KxP2+P/696dwk5KQ01b0uPQE5UY?=
 =?us-ascii?Q?9vh/Vc9PKqkkd+iqYFhduDPAUS9wn86DyUZgq3xQ9hnlemkCFBibX7zP9rsL?=
 =?us-ascii?Q?gajkWoiGnJKwQDMnU79RsGO1WLRuVNyAf1zTJ4sGUNXoovaxC0P4nhaF3bXW?=
 =?us-ascii?Q?qvJnSGCSmT9/UqLJfnBwgGmyCkmcTDeyxTyVKK2bHfPFhADg1sV+NXmmRLz+?=
 =?us-ascii?Q?Ndl9FR964bQitkONqMyrqF3d3SXDeE/1h2jsMhsuKw4sZwpREkS2iU9GiKxc?=
 =?us-ascii?Q?VFNsGLrZrP/aAqCapHzY9uPR65a1uZkOV7kJKk804zd/GNgnVcgXsZErPEVG?=
 =?us-ascii?Q?nvzaGmLCJ7Br/L+EpeDOiYTp8IHjSGVnd2Ke4S/Wizwa5xKYzd3FHZbYf2Np?=
 =?us-ascii?Q?dGS+Xdw/I6xvsJURhV6Q0hEgwi/jKbBrv4mxMDYvXAM7MvnQ8oVwrEfiDAlU?=
 =?us-ascii?Q?5Qm8+zz2Cxc5c8kzENCu3GnsdQsapGNAZHfvK99IsDaCjEnq868MmA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rG5ESkogi9zdQSSaYFDMk8yvWAT9qvBsCoIOvl3zhAkM2Ypp0IV0m2R2SEt/?=
 =?us-ascii?Q?DG5YGm0CQipxVWKbPZjRMp1rQvt5817qFLR5w7JOczLOhpFHC85DFNR+ta/L?=
 =?us-ascii?Q?K46z8mHMjQXnuzLSMV+0vj73h5hufMlKNgCOYxnYSG+xCuMV/DtoNA3fR9Sq?=
 =?us-ascii?Q?JFJJ0KJ6IT3EiFLBKASA83FrgQweuGW2atya5wPkDS8Gs5vJOHEpFzqzXlel?=
 =?us-ascii?Q?3i5DBiLxJ4NpatV/BVKkQuLa7eUmMj7pi94xPDmNg0NmgluetdIAGY73gsxY?=
 =?us-ascii?Q?8aNBUUvihTiaZX08Wp1vKExWDpkoN2E78+/25nMrBpZCIl2luNAZCgVWgQL7?=
 =?us-ascii?Q?El8kK1bW/WuuLrrdVvKz5NefYkN+Q2toJAxczPZdbukQ4JeVuY7N9VzXD6dp?=
 =?us-ascii?Q?qVXSvgfLL6/WiqcQZ7+BZR9vEZLfmX2P+vGasvcKklL1Mm2Nm5cpr0y9GyCN?=
 =?us-ascii?Q?uJHT1xVY4+7vTe9Pai/gG5VAP0TA0t9OAHwcCzVcJXXUl/SePM+nnBrLr/+e?=
 =?us-ascii?Q?1j2RRX6E+zpkFBW2vQVtz+9gLa7TCn9AbFzVybwEA+oYVeKdem0pARctMIOO?=
 =?us-ascii?Q?YG3gpVL9Cz9i08T5DtZlEtNn4XQbRhc+N5/ABLLYdh+cv50uvAZbd6g2AZ2t?=
 =?us-ascii?Q?adRX/mefcWdWBxboN0BqAD0JOZeHGPHmFjqEY/OOD2SJAE42TGboF2c4DQ3W?=
 =?us-ascii?Q?tYUcBNjIiPDK1XasGqzGnUoaPsV68s5cyb/AWRGdoDKGV6nUSuTAHwhFxiFZ?=
 =?us-ascii?Q?/zEGbyR16TXYhnDDvQuFUedWcgCD+G2SeiIxun4d/34h5dBi9qJ+hfVS5KYp?=
 =?us-ascii?Q?Obd3DDOIeJxTvc/VAI1g/vOXbv9tlmHkT9BqM/O/B1yWd/HNPAVNJC1STJia?=
 =?us-ascii?Q?jMr/YBsFaIUZxfnUAq3bLkOM+n9dlYq/909kZjf/YGx6fqr75AxMO2ghTIVS?=
 =?us-ascii?Q?n6nf+7eCQx77QQjpnlnOcmFRPiA2Y115I0r9KE/AJVYFHFnfSBeXSLrcqviK?=
 =?us-ascii?Q?I/pnKGIoZofy+nVzybk1DE6fr9BW/PD3qNbt+2ZAqpPLYz8RTyBaPIIaHe2+?=
 =?us-ascii?Q?Vm0YUYHhKm/lU/eI/Vw6xZ71f2CUJWGy3U1L8dswpshqPjg5q3dCnPAwuUe8?=
 =?us-ascii?Q?t7cG/4xkFjfQLwS1A6SOdPFQFX1G9Lr9LCWbqABEpBhByrU13R/Kg8NHb6pi?=
 =?us-ascii?Q?IhuGUc4/RXn3fbEa4EKml0zOgeMK0zV/69ru+XRD/bb4HKvvAk7lQfyKdbzF?=
 =?us-ascii?Q?o/s/Z4PlSMdwvoVyi3sz1GdZSiJzRMiOvZ6C/SJeepN20oU/EwWczdjSNpjo?=
 =?us-ascii?Q?XMc15GxKMZqxO/Vrr1+fAXkhIIctUckgLdxwNFckh9NDSU3JghuND3duk7Fs?=
 =?us-ascii?Q?GbkaC3qNRhbYBF4wbIHM40T73PwLqg7Dfm1JKkYj98EAdIYY0VUjZMoJ+R7b?=
 =?us-ascii?Q?B5o7IKmRAHA/6cMnLP43qYKKo7veVKpVG0T07JYLWtkzTYCv1QKq3as0jXpT?=
 =?us-ascii?Q?DY1g36jzf/N78VDTTbG9uIe5pQuP964Jognv1yCMN95MxwaBHzvzOySQR7hs?=
 =?us-ascii?Q?uMM6zXFChcSNNiK/4sxIzp4eOyeef9dapJA+NLzP/MKiEKSYgVKwXnl52tRk?=
 =?us-ascii?Q?QA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f1bf06-4d45-4f77-24d3-08de1612a7ad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 11:10:51.2759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxhrzsmesW0b4Bd5B0lmp4622odm+zYZX4DvUxlcxageG7ksgJ7RTZjrcGYV+av04vXJpfEdRsSvsnqyw86iAMxct637WtW+Ug6QKe1RMsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7827
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: sh3knB_G8heoW-7gTl1tl6PN6jeJ5WfQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA5NCBTYWx0ZWRfX5rkL3z2mZnhL
 9jrNtUhWR5Dl8wiF6DiPqvA83JGOskPjg0Oet8lvFCvQL+PuJW5R+U9lEr/awu2c1aqhRU0XY1h
 XYAjdlof/M1K/LsWKpIXgPIlwD9HicPZ1hCMEO2y2keIMI1JIhtrK7vivMYUlVfoPkBSbnz5SSh
 ityXwFQjvdYjEPQSB4HBWWkaJvbl2U/MC92XbyMjeVERF6LLYHJDNPSTnbtNrtIm8Sw766pBA7r
 qcsZVE+DG+Xv16aFHZ/1yUEwaSpVS9PsObxhwlt6OgUU/tke5nkTpKLAnfMM3Sv21Dg7VXsZ+X0
 2T3KXdsHZ43PPXy6Zo5HfbNwhgXwyRVvbQtoNC/o3E6+u8rclHc1/ChhoFgM1rJrx08Usl7MI7+
 DWOTGQzhGgATU5hvRMwcpW8+1NkBcA==
X-Authority-Analysis: v=2.4 cv=FOoWBuos c=1 sm=1 tr=0 ts=6900a4be cx=c_pps
 a=wUQTFLLo3/oASVCpA6ZfNQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=i8IGbyu1qK8S-DYGAGwA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: SKmpl_OzjNSTc4q8Wl6wEUiSF3i-TDSx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 11:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225395

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE: CVE-2025-8225

It is possible with fuzzed files to have num_debug_info_entries zero
after allocating space for debug_information, leading to multiple
allocations.

* dwarf.c (process_debug_info): Don't test num_debug_info_entries
to determine whether debug_information has been allocated,
test alloc_num_debug_info_entries.

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=e51fdff7d2e538c0e5accdd65649ac68e6e0ddd4]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0047-CVE-2025-8225.patch         | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0047-CVE-2025-8225.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 2444a304be..ade69881a1 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -83,5 +83,6 @@ SRC_URI = "\
      file://0044-CVE-2025-11082.patch \
      file://0045-CVE-2025-11083.patch \
      file://0046-CVE-2025-11081.patch \
+     file://0047-CVE-2025-8225.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0047-CVE-2025-8225.patch b/meta/recipes-devtools/binutils/binutils/0047-CVE-2025-8225.patch
new file mode 100644
index 0000000000..410ba64143
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0047-CVE-2025-8225.patch
@@ -0,0 +1,47 @@
+From e51fdff7d2e538c0e5accdd65649ac68e6e0ddd4 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 19 Feb 2025 22:45:29 +1030
+Subject: [PATCH] binutils/dwarf.c debug_information leak
+
+It is possible with fuzzed files to have num_debug_info_entries zero
+after allocating space for debug_information, leading to multiple
+allocations.
+
+	* dwarf.c (process_debug_info): Don't test num_debug_info_entries
+	to determine whether debug_information has been allocated,
+	test alloc_num_debug_info_entries.
+---
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=e51fdff7d2e538c0e5accdd65649ac68e6e0ddd4]
+CVE: CVE-2025-8225
+
+ binutils/dwarf.c | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+Signed-off-by: Alan Modra <amodra@gmail.com>
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 8e004cea839..bfbf83ec9f4 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -3807,13 +3807,11 @@ process_debug_info (struct dwarf_section * section,
+     }
+ 
+   if ((do_loc || do_debug_loc || do_debug_ranges || do_debug_info)
+-      && num_debug_info_entries == 0
+-      && ! do_types)
++      && alloc_num_debug_info_entries == 0
++      && !do_types)
+     {
+-
+       /* Then allocate an array to hold the information.  */
+-      debug_information = (debug_info *) cmalloc (num_units,
+-						  sizeof (* debug_information));
++      debug_information = cmalloc (num_units, sizeof (*debug_information));
+       if (debug_information == NULL)
+ 	{
+ 	  error (_("Not enough memory for a debug info array of %u entries\n"),
+-- 
+2.43.7
+
-- 
2.49.0


