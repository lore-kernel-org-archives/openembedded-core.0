Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7956D358D6
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 16:39:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19188.1769704785020573255
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 08:39:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Nd47kwXW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=64894db884=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T6JCAL1549685
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 08:39:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=JJrNqodWE9dyJ+OIo4LC/HoBNcwN316le+KBjoZwfrE=; b=
	Nd47kwXWqpMesbhgV0vU3861RytvwVKGqPAlWD4HHrB10WX9d4nQwRg82fbUcAlA
	6yOBbS2lgbBMeXSC7ZP/2w8i3dMUCIGUfPkMZ+XzJv+l0ZIOm6UwGovfBIz4ehVj
	r1j8d4N3gmsa5f2Ldml2WUcVadYITAwlzLJK6/9wM/NYqBki6EJOYMv/1fYTRMIT
	kwmkcfEwjxGQQUQHyjpgwgoEM4JlOjbVt0RlnDYLGN7mOICUYqFdn8gWxq3wvDE1
	CpPGP0mDA3WojXEhEJCzFOLlky1dVlPVNGORfIKOzsR9gufghQZvyIcedXnwTRDk
	t0B/lItcSaO1UG/9ubD2IA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013031.outbound.protection.outlook.com [40.93.201.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4byx2t8sn6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 08:39:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGVDShkeifvOyjymOcbA25UuDalaWiiqEvHYt5TWVOE1cmPQmRmmy3rXltyslGUklmEP6yxhsvZlhqFj1T9pSge46u00HQhF6vaY5AkpE9Arfv9jN/LLEtQ2n6GIC4ThHG3F4mUI35qDaRvbesCU5VCzP/JwdRCSzqaJw7LFL0nINo8LQZ/j8yANm3Xoxw5m0ltROYj9bg2DISK5h1Jy4potmRnA0rL4HZ+k9lnr+8zMYEUyeP1ajehNhoUOnBOnogXRH7rsx07i5qPHA845N94DfBQLY6TEnI8Xcp9YaV3XpBMF2/aQb8sM1YaCpa0rW24t0cCuCZP4vwntjI36SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJrNqodWE9dyJ+OIo4LC/HoBNcwN316le+KBjoZwfrE=;
 b=aEQ8dKVuCXDKqNb+MOZ4Qv1RpyhLoAUbfDfP8CAMBHwtc8uMOaY6++BL3crH3DGsCdzOAmQFg8WepMB5F7fBsyMRLCeageku3ObuUHrsEeRoRnKa3qCWgfdmccPoktiQZVl9WophXfRLBXl3BTHvhZa+yXPxuezoolSDODt6FX7ciqiBwz3VddZomZkrhYu48sEJClBMkELBC5JQl9DNIVxAbMzWKYXtvtLQZEfJF2PsY5yJb5MUF72KNypP3VxqKoqivIrSFXrnMxtE88wuCDGJZPmcLaK1dyhta2kw/JgA8xoF1oACktN+XW68anFDw93SKka9y+2YNmrKZoylAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA0PR11MB7910.namprd11.prod.outlook.com (2603:10b6:208:40d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 16:39:42 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 16:39:42 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        alistair.francis@wdc.com, bruce.ashfield@gmail.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr,
        richard.purdie@linuxfoundation.org
Subject: [PATCH v5 11/15] kernel.bbclass: Export artifacts needed for out-of-tree Rust compilation
Date: Thu, 29 Jan 2026 08:39:06 -0800
Message-ID: <20260129163910.2612040-12-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:334::15) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA0PR11MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: 83365d0a-6243-40c4-b2de-08de5f5500c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lT23w4sumJwZClOV5Py/BEVVk3plHw+aRzFTkXl3mf1O1dWMExGamBgB2EqJ?=
 =?us-ascii?Q?jREc6dudEFK9PZLVmFarwqkQC9FMGn0TCiyHUbKSsvAZsELKlblaC6OoRySx?=
 =?us-ascii?Q?98mHJSwnw4dy0P0PsDRB6aivpqyRPnHPjHRYLn1nlknxFdgwXm9CRfH4ZwgB?=
 =?us-ascii?Q?p609hFQ40W3JlycMQ74d8dkYfNIsPsPvajG5bK5ULN1/4wJl1hmQXmFqHE7S?=
 =?us-ascii?Q?IK+kKSJ4LDn2opp74mmuv3nBT1uiTD5s3Vg9MFxOFd/vXanW/KQqHyv3EzPl?=
 =?us-ascii?Q?EFxcAZnL5IP1gPc37mSsMrP0Qcagl/3UEgLborc/8//m7VOpD0wkvjvya1Yy?=
 =?us-ascii?Q?II11IT1Mjkpu4ke8XIGUaVzQO7B+HGFmFbx0b1prQx7KTfm2VaBWVAPpFrj0?=
 =?us-ascii?Q?K14hVRogPJdlWpQ/fDJ7CBrcnJB8PcGx/5WehWrxmU0eZGebKK7IOU15rd7S?=
 =?us-ascii?Q?VktMDHCalBpezvAGo7PTcbwvU9/dxYGgMHfL+h2TCjYLjl6M/eLbfvqb9S5Z?=
 =?us-ascii?Q?Mq03pEOy3pGjhjt6bkUdHwXou4PHEh1ENnLzzETRbGd1rM3UFcxb3ZLpT1rM?=
 =?us-ascii?Q?kHswc7MzMdx0MJ49gnFtgulqgHr4xsXT7s1P7P20aRVUFdbjVkMuK9UsbU19?=
 =?us-ascii?Q?AFFdE/INNre3B1XlPd9pVS/xqK28Y6fT2brozlp3UR0jPLx0g0OG9ubcyMte?=
 =?us-ascii?Q?0qaSOVZbh9rIlNwS9nBf8aFniHLtsJPs3yYTk5ATrA3xbhtnPJOPmINayVmz?=
 =?us-ascii?Q?tdfLfUiz8kOpXCt9IUppC7+XOsOWI76Pfgf8Qn6N930SOcNLY8ojkDBt8ovk?=
 =?us-ascii?Q?/jH23TUd8sMNgouoyIZgVxI68RpCrsEPp6TcedbYrQgxvVUaTskeHck1U75X?=
 =?us-ascii?Q?yPzqHBx88SRs6D12bu+l85ckGPWP+nUoJhJx5uXi8H19MKGId5jbI5Wd9n6G?=
 =?us-ascii?Q?7Rrg3LTUm2NDEUrpw5HOTp+oZrw7KwZ7p37lhfflM+rRITbqcU3guCDL4EEe?=
 =?us-ascii?Q?UPt1rUFyQqd1yEw/m39i+ymSreYH5S0U9q7OmCHm3L//F+j4YmG9f64NEXRk?=
 =?us-ascii?Q?Kx9XmcflMGgDZlRpYuDJKwxif1iweqqQvzCSjALppLWXHBve3b129KKOt7Eq?=
 =?us-ascii?Q?QA+8HWBJsTOJE2Fg5dVqq+qFatxAJPDOWcYnElClMvl/Fn31dSRwo7JcpFMm?=
 =?us-ascii?Q?OAgxhdJe9z3FUqy0QI/cs6e5yYBi/+36KveMdmypCh7jRubdyJmnaRhNVIf/?=
 =?us-ascii?Q?CRq0vFrKJ7eDEce6LLeiIz+yYJFmpQfTKV0twS/UyoR/NPZ8LaOTv+IRDXyW?=
 =?us-ascii?Q?TSghBFPiCIGaCYWLHmVQu/+X4gc2EfTaeJWzlnfcLKPp0o4BC0KLH5D2FH+P?=
 =?us-ascii?Q?nXCE2uG7LT6BRutl6mdVpAbysYOdg0SefCu2qmpwQLd/NX56mytduDnjZa+g?=
 =?us-ascii?Q?Im8+XXVIa7XeIZgCMmtd4tCiooloSz2LUjJGALHvxouIptw0xeP1IUUlux64?=
 =?us-ascii?Q?7vJIZDxfRF27w7xw0JkeYvwKLo4DLIHuGVgS7wRZ86U/6TBpKQB2sY9W8CAG?=
 =?us-ascii?Q?XYcisH4VZoztIR+oqoiTXe9fgCHpKY7+zZ22uvg1uRAyBup/8u7X0TvUncca?=
 =?us-ascii?Q?DauojYcR8aRTOSL2ZmfCPoc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mNLc6+07Bd5ztI6PHJqcqki177PQbGDm1wM5DKjiL3KJ3cwkJRzo5Q9SjwRC?=
 =?us-ascii?Q?Nlm1ul5JwkZP5aN9fb52WQ679A4Pg+JMIayx2B2OAkCAxWaaQwOvmtu0QStJ?=
 =?us-ascii?Q?exCGZvSTdvC0sf4m7F3ffq2QqxJsWyogQG9qPNNDhk0Nj231/14gWt76Ulh4?=
 =?us-ascii?Q?dv/w37XJAO3kD+EF3GpifznfZbXELegbyHnwVfGn7rZZcm7g1Mb9bZ3smCBT?=
 =?us-ascii?Q?f3UlIQLnR3dMxsSYT45fYN96yNVYCWtEjo0fNLb5B8O0zxlr4GQ6ZLWvhoe5?=
 =?us-ascii?Q?jV3k4OFs6k/ARD0+jJo0+8imBbd5ZL+Dl5RXBV8EeQwd4e8gXvL74EKTob9m?=
 =?us-ascii?Q?9wFTETMIpCrbZyqjVvtCMGvc3Yj1s1OWujNLt0fQTgOujYeOAzfIBDMA+NhJ?=
 =?us-ascii?Q?CXg20GO12qYuXLqzGh1dpxapFbzukVT/R5m4AmzHDovpCfvDeW+2QNcRMFaD?=
 =?us-ascii?Q?HfsyiqbnnTFk+/6QF5kf4gCteL08QXmpOWKWeDS9PhAFzHRpuvHTVdp47Xhf?=
 =?us-ascii?Q?AwnzQDF4YigWi8T2pkHArVq3mNBurDbdZZNdGOMPVx2Ji5epSpfneJfPREpd?=
 =?us-ascii?Q?yqNi8KifOwjIkcc33QqHdCm6wtFIVMg+kKTL/CAkpJ6q8NdjgvJlPXBsJWYw?=
 =?us-ascii?Q?d3Elqw7nCeQuta6rcvKOkfVT61hiRzLPlC/t3rz/9nEhCJOsXYXG5gsYeo6g?=
 =?us-ascii?Q?S+w9RuxF4IUEF2rQ/N5Bns+9PGxwOe+BTHp+2AxKOznjMtzfjgP7tKi4CgtA?=
 =?us-ascii?Q?ocK9ehbU2iwqiUx/u/bWWhLf51U2acklEAFS93RZaLgSnk0jxYzvZmGr+chA?=
 =?us-ascii?Q?Z+W4uGbPHfAiwDNceDAMnCPUAGUtfsflBKdiXegUm4U7uAfvqHLAP3+uah04?=
 =?us-ascii?Q?uwFFOZ2euBBRHVWYV7pz/W5fsVhlIywyoKHDHAtR3p8udylAkXUFT0n2ZgWe?=
 =?us-ascii?Q?NtRDLQpHX7/X/I1pb/Bt/5PDN8qRlVgNFM5NkWYb0bNIQHhEVnseU1WZPlfA?=
 =?us-ascii?Q?s5Vk1/oYfkyRatg5/lvKyEqSMgIeVABGpL3901qo0NcA6TO5u17M4Pi/DeD8?=
 =?us-ascii?Q?jNEORvEzGvRuEtOxLOXRArI9ftilNu7vj/8iXaQQm4ggJNM9SsPJGhn8ugZV?=
 =?us-ascii?Q?rOiOCEmkZSMvPlBCBVx+TY3aOM5R8UTbmA2UxAlKhAmetbcK0hcCEX36PfGo?=
 =?us-ascii?Q?erXrMJwAyDnuMK/45u9/4a9+Lw09b5R+l4115xn7c98KL7xTIsQRGOqcNjmg?=
 =?us-ascii?Q?z86oF0eIeAI/rJa3VTGp9+WCswwWXpsqX8F5MzuJqGa3A+DNNqMbl4pmDYCB?=
 =?us-ascii?Q?sonQhfsqZFy93EK5BRn5D5Tn8f3sIyQ25sw0RWLw5toKryOdM3vILSvff1oI?=
 =?us-ascii?Q?HKzCDltKgavhSrMJ7kf/kxhYuo5QFa1Iy0KVkNisjEEEw0DG+ja7WWBvQRg3?=
 =?us-ascii?Q?Q1mfBVdtybPs4+eZkrDjfPdwYU30+PKIdXGvoXGC5AscGptkUP0nBHahGq7S?=
 =?us-ascii?Q?AzQ/bE/Qxh8Kbp/fL+m/eMGjFeVPzJJ0BxdrdmEFzRHVVQtN23JtY+maI5Qa?=
 =?us-ascii?Q?bP1EcQPp9mTAIIBCzGe0PcYMTYhcR1MRp1clmIlNvnqBPF9R77vxZgDUTVSi?=
 =?us-ascii?Q?oBM52XzrYYblqci96nahNDL7k1lRVgE2La9lnEs9ka4sVxyBuJIJPgFJdIT3?=
 =?us-ascii?Q?08t1zVe3b3bBsUZJYmOvIkNLpU+J8PKHPZR+sECoMcETPw6L7jkgfv2vG0Sm?=
 =?us-ascii?Q?hzXFLuDh3UwlZSM6Dm5WAU0LaQ77q1E=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83365d0a-6243-40c4-b2de-08de5f5500c5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:39:42.4190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/IyKdX5Vi7Lkl539XIlULo/jAGJ/xRv/SWjpN0iA5vGFclUq44FK2MWLKg/2ppyQ/M+0fw9X9qouXd69KuHTtej6qpTSG3Lukj/O3nPxK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7910
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 2zoe69v24SAzD2Eift0eK7388U-rVqDw
X-Proofpoint-GUID: -aGwAzUs3QcTznLbKEQh2RLabmPCrnIY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDExNSBTYWx0ZWRfXxxiTYqkgLUxA
 Zg+LdDp6LV0n7ixRrqdS3p0we7pXGp62vUiRytJdYrY8u7sPVm1KfDybLdaazWLK9q1FcH4EpSO
 WL8yvFcTE30mMxVafnx8eHXzNmCmGWfMIo3cg0dFhIZGtlkZjImEhXKUdmgV2Ev7EwvVOSf5zd2
 efvvD6EU9zWQCtJ/NibmDdaVY9g1/0kA1Guvv6foANDgVh2klwlPzgZOQVm8TKCnRW7KcZnJEKo
 Hn+S+XfWa2SqBn5GJ+HDW0TPMoSvLxV+HS947CkZx0cfXHYYkmzyzsMnNF4Pd6EecG2TKH4sVEI
 BuZe3jTbZR+YoWXL1YLay6dX3I4Dsic4uBItMzxc5ZPNi2HgDXh+ymp9Ni9FHFP7zabsIRSnZlW
 E6x7gePzIGonQAw+JJdaOCEvGqwsdCGlS4kaPsso0hBngAPh2r0NpnLmZYIv/+DTeV7G9TzaIIt
 HXH2osnG2g9u3LLc1oA==
X-Authority-Analysis: v=2.4 cv=NcDrFmD4 c=1 sm=1 tr=0 ts=697b8d50 cx=c_pps
 a=7NCjPUurWbS4kF9YcBnZ4Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=AXdspKuNlVAGVjIo0CMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230151

From: Yoann Congal <yoann.congal@smile.fr>

Publish artifacts from kernel compilation to allow out-of-tree Rust
compilation:
* scripts/target.json: target definition: architecture, ABI, compiler
  options, ...
* rust/: the crates compiled by the kernel available to
  out-of-tree-modules

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 30a10b0801..dfb8604a68 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -632,6 +632,24 @@ do_shared_workdir () {
 		cp -r scripts/gcc-plugins ${kerneldir}/scripts
 	fi
 
+	if ${@bb.utils.contains("DISTRO_FEATURES", "rust-kernel", "true", "false", d)}; then
+		# Copy target.json file needed for out-of-tree rust modules
+		if [ -e scripts/target.json ]; then
+			bbnote "Copying scripts/target.json"
+			mkdir -p ${kerneldir}/scripts
+			cp scripts/target.json ${kerneldir}/scripts
+		else
+			bbwarn "scripts/target.json not found in compiled kernel. Out-of-tree rust modules will fail to build."
+		fi
+
+		# Copy rust/ needed by out-of-tree module (firstly for the core rust crate)
+		if [ -e rust/ ]; then
+			bbnote "Copying rust/"
+			cp -r rust ${kerneldir}/
+		else
+			bbwarn "rust/ not found in compiled kernel. Out-of-tree rust modules will fail to build."
+		fi
+	fi
 }
 
 # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
-- 
2.49.0


