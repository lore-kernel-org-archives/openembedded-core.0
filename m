Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC55E94121
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:02:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64567.1767103311709560841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:01:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OqZKXH3x;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54595b53fe=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUE1pPM4084547;
	Tue, 30 Dec 2025 06:01:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=r2TxtC+oZ
	6xuGJWmbHf2Wjy4bT8j4YndvdVolgnvmSY=; b=OqZKXH3xDxEjJtUYsXjwn5yK8
	/Bc2t3ydsDGIhgtY01rmInHHchL0T3W3C3rrjY9jdYLrwS4NfdJdk0KdbY6QRz1X
	OXh9WaNdpiV8DUoON4VsoSSeVTuWNUlW0WrREc0FP+05zjfyuOAeSdQoF2W0J/kZ
	/gC1qdkMQJrhdnkFUVIFVuw/+72z4HwWMuf/vBrVgWPTyWkDq0YBztGtZoN28IYV
	pyqU2qwAKGTrV1cHSgk/iCH8mrvzFo1E2Y1xsnHKSPJ3v+oOwXK1pgroOUK/eiPo
	6RSG8wOnfshr/dC7OduVcwieidY+1juYcM60aTx2QM9vVBuk8+OXL0MkwrqUA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010008.outbound.protection.outlook.com [52.101.85.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4babm22r14-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 06:01:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/FoYv1I10XymLemur2z0W29D1/UQkQQKr4a0yxreCLe1/X7SzAxmhj56Od1weU8PZNGWBUuUNUfewoFzcSl1aOCfV/M0w8YP9mp94rb6MZTnK49pEujrq2kxqNMGGvzd6TrrrKms4nUKbkutFROGAaNqkd+Iq+oazTut99NWw/4MvMR1f11CildvU1yIXsqETCn8D3hhJgr4TL1Txmpy+JBDpXw4qIXQTUPuOGdBL8Qt0tWzAOnRi+lRL19zcnIfwaQt45bckptP1noD+aBPuvNx0LZXc/dA7f5SQjmukv0cEuGZ/R/BShxltiz7Z5xjmmZ+ZsNkX2kRAGn6C0N1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2TxtC+oZ6xuGJWmbHf2Wjy4bT8j4YndvdVolgnvmSY=;
 b=JKLzhFfmIIOMyCQ0PEMCNrBpTcLgF/Q75mrEHn6OyP9afil35haMbKp/rc7aVohWEhKsnHQY7rAe3gjNqGcbJDsAoAqxN8tYDXlClY+RUNu7ldsyWC495of6WyAO/KvvOKPlQUvw9N8vlGcwol8Q3wf3Wan1r1/PBwm3UeDxSZhZCEDiTicpAr77y1NxdN1ef48ErNDxebeaEs5tcDFxr5PCADxZLV9bjRK7tXNW/PRm4b3vTf5FweX7bnJC9Eas3e0TbLinfP2vAUb2LHfGqBRh7VHOaJfJD0jtd/LXEO8AeIdILUgOrY9YkICcmr9D7b1SzJfupgvbZYaQGHewUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by MN0PR11MB6255.namprd11.prod.outlook.com (2603:10b6:208:3c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 14:01:46 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:01:46 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH 00/15] Enable rust support for linux kernel
Date: Tue, 30 Dec 2025 05:57:19 -0800
Message-ID: <20251230135734.1973083-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:a03:333::31) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|MN0PR11MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 1121159c-5080-48ca-a690-08de47abf814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wMavF9cS3iq4SQDOhaaOg8EmDr1E2xOBzbbrOKl5lbdHuiaAU9oOT3LY7yNO?=
 =?us-ascii?Q?Pzi19TDcPSo9CFny+LOgVzxcnJl9zx4EcY5m3YwGQSau6idHau8+TYKWBwtH?=
 =?us-ascii?Q?PMDHdpD5fDrqN8CV4UAiuFe7P9zVQFpLEBvL89yrNpXN79iGnt0NCIOMKetp?=
 =?us-ascii?Q?q5rkGo7b3XqQ2qMIDpy0x9D4L+hbYhtRFknUih5F62uOMMOXalzz/MFoe1cg?=
 =?us-ascii?Q?OeLks++OBrZFFUl9+WBi21rT8WdWfTP6ZkHmRSQCjtuXyPlMEZEVHA/6iYVG?=
 =?us-ascii?Q?GjKW94bchB/GD2rk4/ojfEVlPFODwvYIKr0ebvNyPPahrcAEg6lnIqaW2cVT?=
 =?us-ascii?Q?knvCPhSHkhh95pSUzIu+JN0lrMb3FmpORLg/f6FRNAqaOD8rBgth9L3EZFco?=
 =?us-ascii?Q?mlnSFuFm/Yw3igsTGaHDIiucZj9Umn+9rgka24TAT4DJ+yeutwXh2pzLDwTU?=
 =?us-ascii?Q?5X34f1U2OYwu6RVKJDWvZU4jbcZdhNCPpg9SJAPI+yXYvFtFTSjl9U/SNrOs?=
 =?us-ascii?Q?iQ+Eb6a2EcT5lD0z4k0b/tMRPFiQ7IOwSXDu0VheyNK3iLWIOwP23YcuQ3LU?=
 =?us-ascii?Q?438YTlh7za3+UCokHPx+J0KEmQM9fHOM49zQ8bQBSQtrzXo2s2KVHGA3LJkT?=
 =?us-ascii?Q?2fNEehDJKuw79DELikqIrNziOjnN802j0pQm+2ErO/aipgrv5UKnwI31cePQ?=
 =?us-ascii?Q?UiQ/wG3aEN3laC7Eq6ByYePCcO1jrV98nv6kVOpRbg7zAJGbTVPFdvbVhzgp?=
 =?us-ascii?Q?BeQJXDDzb/nPrhhzFLjswV9VpzFoebTPS+bRo8pLY8jKg0/H/lVlVrEh9rYv?=
 =?us-ascii?Q?VXIkIK1vry1uXZw2AP9RZzGeyvkhP2jpNaFmZCPKMZH6rR2KOxJp2Fol/rou?=
 =?us-ascii?Q?PrBBYl301bFTTN+I5Em11WpLYSDJ2qQUQQgFZckR9LnU1I8lpq0JD5xR5a0x?=
 =?us-ascii?Q?V618EZTYJp+ZmQkUp0wdFskd/wrh7M5M/3P/SEuRKgUkKtm7SI/BRV7nYLgI?=
 =?us-ascii?Q?8Ba3fkKkzcBeMzWeV1B9IbClVYoaA3s3Yye0zIJz3V0A5/CX7VE5ZE4Z4G48?=
 =?us-ascii?Q?2IjzPmCmClQQ5PfG4Uet0XlKqzRic863d1MIAsWRz0xSrIWv5mZ2SCbqmDIA?=
 =?us-ascii?Q?pBbLrh1aeAIlGmazCrBTTuYy1054E2T5HAltLHqUKvHunZb9R5/9Muen1bCv?=
 =?us-ascii?Q?gS8aZ3Xkpil16nJekyIVO0TWQH+NLzX9D2BCqvJfp/gjnXftHxQBeq/9hopJ?=
 =?us-ascii?Q?KxaNFqHqbxgC4wzcGlMITrpM/09mnOFPjt94F0V26WRM7QEBLYaaQx+p3T9W?=
 =?us-ascii?Q?vAVatTXg+TRdXxTuA+X6hwZVQw3jQ0Og+LOqEHQ+cvzZeT7k29fpQctZJIR4?=
 =?us-ascii?Q?oWFpUISSNgfDEPhBrqRThDxtm8OQd9ffdLyohesy56lKdAY/uwcHnYCXZOBa?=
 =?us-ascii?Q?vaz3hWEJzjbV4F8bDR0c+UEZl8qnTcx3dSlu9oCJUbLnPsHjBrOcCeQlMdI1?=
 =?us-ascii?Q?G6thYvgWENM40UcNKo2WM2M71txeddc1Ju2xqCTCQbdpv1DTuQaetsJ0hw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OjPa+onbH6R4jRYqPKHOwk2UhwKSWuQl/hkjCz9bs16rKMykgz7lF1PcapdF?=
 =?us-ascii?Q?51fqh/WttVEB80p4DA35qwkA+rwFMAci6+MuhYA/VE8b/UQLstBzf5pE8Y6y?=
 =?us-ascii?Q?Hv99TkoLUFVAFfi+F/4OnkG4zQi4GfCj5jx9sTs+fHNEAeFzB/8mxtvQmFmx?=
 =?us-ascii?Q?LkezMocFVr3nwdC7caGPrfonGUSP0VHNMgqN+oYKB7WyQx8jueaOBopY+vvH?=
 =?us-ascii?Q?bsbaCFsQw1CxXDBbE6yvxXodDIFq7cN/zCJmDnSMCH7q6vEMKC1WwGBLnDUB?=
 =?us-ascii?Q?3ZhaRmsvLEebpE6UB4slukX+1dlSFkI8mWr5AutEJsA5CCoh/L3Zafd6RkS3?=
 =?us-ascii?Q?wh/s1pwQ/PmjszS2cxfT1g386MChGfygvqDCGUrx9o5gK9T0vC/tq57tYfRP?=
 =?us-ascii?Q?U+dmpScpx6MCBNycLcrI37Qv4eaChp6XT79+S1s2gqdwhVHV5w4hwoXb5abb?=
 =?us-ascii?Q?btivbNelMLJJblTQ3wEsozOHqBZL4SLiJs9Lz6caZnSmVZ9KHlUWiBJLFPF+?=
 =?us-ascii?Q?X/snOJCSRzLE6dc+ahD/rqH9CvSSlCnN3SEuAlDkIw7rVPuqog4NcauJt+qZ?=
 =?us-ascii?Q?eDoY0uC8pH3MnDYn+H8z0olw+haEnKu44N30/JZdtgbnLD+M5lyeOcD55uoF?=
 =?us-ascii?Q?ffQ/Idsg475Z5BbQh9x86s2ytlNPt28P3Dyx/+TYJ2wm2aRyVQ3Fw8C4P+Lh?=
 =?us-ascii?Q?XRgy0mcU/TwKkDu3l0MYkLcByFOlwuWzlFgPsrM05642uQNnVzFLk05eEWA+?=
 =?us-ascii?Q?HoW2VK29IAmUB215dWCIrZBb4WI36gP6aaenjOKaEnZ2RCRaLxkP3omockme?=
 =?us-ascii?Q?o/n9+wp1T3lJoQDpY9OfaVI6vcf6sUkBDlDWTgS+8W60axrZboeMi23mPrqg?=
 =?us-ascii?Q?Tvi5bCdtnYRET/Zi6yd2FdsyMCd4sNVwQq9swAN89NJEnIRsL0O+q8gfl1aG?=
 =?us-ascii?Q?G9FfucbrUG3sDOqWJvNuhheUqRkf5rfzhKoCQD0AeXle4TtgSMM9JK8Pa+1T?=
 =?us-ascii?Q?4ACKSA4AqRrczeosKl4LIOv/HlZlhiEVTesRwlZX34G4Wm7IU/j97vC7QQ9q?=
 =?us-ascii?Q?hqp07WTbdRqtlsq75nGzvKdbvL03XbZwVyfxarfU7pQstTBeE8VVrCRAb0M1?=
 =?us-ascii?Q?RO8a/K6mStt5mwUBEo79MbK4Vm0l3FmzCuXGTitv6IV7Te5GTsZ5MaU9Hr2l?=
 =?us-ascii?Q?HOtf8OSc6I7GPLHlsXGmvfEq9qw5sm46Dafpd1oqAb9CFSaFepEgHlyzorD/?=
 =?us-ascii?Q?eAoIKDSIiFXpvzwXy6glifWfTFKEHfUIlvc8z6sE1tLQMjf/zjpylYlOpQei?=
 =?us-ascii?Q?sq8l1n4AT/plhpirqcIRQBn/K4RrE/rWbvt7BzNzSLR89tuYqlylZQKgnEZ3?=
 =?us-ascii?Q?VXthrt/jLOhZZQ2XpVgX4CjqEfQ2O2QYIez/4Ta7fxZDIEH6/BeF/6tu0YgO?=
 =?us-ascii?Q?UoZzz5uE3ZrEZL3NHr9EK9pj6ard1QlSw5taTZexCrcLCky3NyeAI0rlRGk/?=
 =?us-ascii?Q?yU+YMPvWYJyXBAq7WObOcTtOCWkgDXuO4b9P/wnCzqaG1/DMy3id+VcmkGZ4?=
 =?us-ascii?Q?MWAnTj0koDBbyb4ufOT2yr05NvbZ3QZb6cxZJTIooUA4a0q/l+0cvg5ZzYz7?=
 =?us-ascii?Q?nnWudxWoqexdD+et2L3Jbqu3iDz93xrJsF469GmOa5KZpzbyR9IfA+8XToPc?=
 =?us-ascii?Q?lZJT22sricq/4SVIye4vpYdjB0gwW7AnjtMOqBB+7fENjvhc/1tBCyjKw4ey?=
 =?us-ascii?Q?0ZAQB422uFXj4UHwiv8j8gVU9FkTfMQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1121159c-5080-48ca-a690-08de47abf814
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:01:46.2599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYMyTfsE3s2uibI6Ei2X0n0qGPJks0YFPUS8KpubYvz2o9sOzOHbFK3gyPvqINZeWieTu0I82yCE/6NSqGlFv4FnC9vpHQCDiDJZIAWp0Lk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6255
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 55rf6DEZLHcQzZg1F6Ob5AKcuQKaOi8k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyNiBTYWx0ZWRfX3KpPVhD72Orx
 l4W+IsqzfAsQHegkh+lnvR9TDavtq63cp+6Is3W2w31JpuO2FQSwLQuuVKtfz1c0EymM+JEEVAp
 X2o98NVS6SiSpZt603MCttRqC1mhzXd7KVv4bii12UEmMtfG8vlTdXHcRJuthKrDaIKQADrlaMF
 i2H9JQ6EwbO3fK6j7tkMsZb5jRHa2Tjl1WAHtsp/WngC8811/k0YwVOWe8q+NSmMvMgJYJMElji
 c9uR8R1nnAHss5h7f6HL+h2wfBPWlxTvglQwQ6QGw2LpgamXBSSakVdEyO4KSAOU0gQT3I+5fAM
 ZlGV1mCV6xN1hWHKJ5HoNtujRNraZE4Px8i1pfhzaXIqVeSfwBoBvZnf2+kBz/6QPgj069RzG/7
 Mdf25kB7tJkbVQZsY8OLXUmLULLN1ZTOgNQPwJrxEDYlU/eJFsItDeHvkCU447tO4mDxqDNUhSB
 NganK60cTKAuRefrEpg==
X-Proofpoint-GUID: UiqrIImzOSK8pzoImVwsK37c-4bCXOpy
X-Authority-Analysis: v=2.4 cv=bN0b4f+Z c=1 sm=1 tr=0 ts=6953db4e cx=c_pps
 a=WNBGq+kRZA72juK154DUDw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=ktMQgidfe3c9mytpCMkA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228660

From: Harish Sadineni <Harish.Sadineni@windriver.com>

v2:
- combined [PATCH 05/16][0] & [PATCH 06/16][1] from v1.
- updated commit message and added in code comments for patch "[PATCH 09/15] kernel-devsrc: copying 
  rust-kernel source to $kerneldir/build"

[0] https://lists.openembedded.org/g/openembedded-core/message/228559
[1] https://lists.openembedded.org/g/openembedded-core/message/228560

v1:
The previous series was RFC v4, "Enable Rust support for Linux kernel"
(https://lists.openembedded.org/g/openembedded-core/message/226623).

In addition, Yoann Congal posted RFC v2, "Kernel Rust out-of-tree module support"
(https://lists.openembedded.org/g/openembedded-core/message/227281), which builds on top of RFC v4.

The current patch series is a unified version that combines both efforts.
Compared to the earlier series, the main changes are:

-Kernel configuration fragments have been moved to yocto-kernel-cache.
-The kernel fragments have been removed from SRC_URI and from the files directory previously stored under
 recipes-kernel/linux/files.
-Updated the "[PATCH 11/16] selftest/cases/runtime_test: Add test for Linux Rust sample" by appending 
 KERNEL_EXTRA_FEATURES:append = ' features/kernel-sample/kernel-rust-sample.scc' instead of adding this
 directly in the linux-yocto recipe.


This patch series introduces Rust support into the linux-yocto kernel recipe
and related build infrastructure in the Yocto Project. The goal is to enable
building the Linux kernel with Rust components and provide support for building 
kernel module which is written in rust and also provide support to build
rust kernel modules in sdk. 

And this series adds test for Linux Rust sample and also added support for out-of-tree kernel 
module written in Rust as well as associated test.

Summary of patches:

- Patch 01: Extend 'bindgen-cli' to support 'nativesdk', allowing it to be available in the SDK environment.
- Patch 02: Add required dependencies ('clang-native', 'rust-native', 'bindgen-cli-native') to the kernel to support Rust binding generation.
- Patch 03: Install the Rust standard library source ('library/') into `work-shared` and which will be later copied to
           linux-yocto recipe-sysroot-native.
- Patch 04: Added 'rust-kernel' to DISTRO_FEATURES_FILTER_NATIVE and DISTRO_FEATURES_FILTER_NATIVESDK, the 'rust-kernel' feature automatically
           propagates from target DISTRO_FEATURES to native/nativesdk builds
- Patch 05: Stage the Rust sources into `recipe-sysroot-native` for kernel build compatibility, making them visible during native builds
            and Updated `kernel-yocto.bbclass` to invoke `make rustavailable` during 'do_kernel_configme', ensuring Rust readiness.
- Patch 06: Add kernel configuration support for Rust (via 'kernel-rust.scc'), enabling the Rust build options in kernel config.
- Patch 07: Fixed buildpaths errors when rust is enabled for kernel by appending --remap-path-prefix to RUST_DEBUG_REMAP
- Patch 08: Disabling ccache when rust-kernel is enabled for linux-yocto.
- Patch 09: Copy Rust kernel sources into kernel-devsrc build directory which will be required while running 'make prepare' in sdk.
- Patch 10: Added oe-selftest case for the Linux Rust sample.
- patch 11: Copying include/config/auto.conf in STAGING_KERNEL_BUILDDIR
- patch 12: Export artifacts needed for out-of-tree Rust compilation
- patch 13: Prepare out-of-tree rust module compilation
- patch 14: Added rust-out-of-tree-module recipe in meta-skeleton layer
- patch 15: Added rust-out-of-tree selftest

Patches have been build-tested successfully on:
- qemuarm64
- qemux86-64

Benchmark test-result for x86-64:
+-------------------------------+------------+-----------+-----------+-----------+
| DISTRO_FEATURES               |   real     |   user    |    sys    |  FS usage |
+-------------------------------+------------+-----------+-----------+-----------+
| rust-kernel (enabled)         | 46m1.720s  | 0m28.864s | 0m3.696s  |   58 GB   |
| rust-kernel (disabled)        | 30m1.053s  | 0m20.091s | 0m2.748s  |   33 GB   |
+-------------------------------+------------+-----------+-----------+-----------+

The increased in time & fs is due to kernel rust dependencies in
linux-yocto.

Harish Sadineni (8):
  bindgen-cli: extend BBCLASSEXTEND to include nativesdk
  linux-yocto: conditionally add clang/rust/bindgen-cli-native to
    DEPENDS
  rust: install Rust library sources for 'make rustavailable' support
  bitbake.conf: Include "rust-kernel" in native/nativesdk feature
    filters
  kernel-yocto: enable Rust kernel support via rustavailable and staged
    rustlib sources
  linux-yocto: enable Rust support in kernel configuration
  kernel-yocto: Fix for buildpaths errors when rust is enabled for
    kernel
  kernel-devsrc: copying rust-kernel source to $kerneldir/build

Yoann Congal (7):
  kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled
  selftest/cases/runtime_test: Add test for Linux Rust sample
  kernel.bbclass: Copy include/config/auto.conf in
    STAGING_KERNEL_BUILDDIR
  kernel.bbclass: Export artifacts needed for out-of-tree Rust
    compilation
  module.bbclass: Prepare out-of-tree rust module compilation
  meta-skeleton: Add rust-out-of-tree-module recipe
  runtime_test: Add rust-out-of-tree selftest

 .../rust-out-of-tree-module_git.bb            | 18 ++++++++++
 meta/classes-recipe/kernel-yocto.bbclass      | 28 +++++++++++++++
 meta/classes-recipe/kernel.bbclass            | 19 ++++++++++
 meta/classes-recipe/module.bbclass            |  8 +++++
 meta/conf/bitbake.conf                        |  4 +--
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 35 +++++++++++++++++++
 .../bindgen-cli/bindgen-cli_0.72.1.bb         |  2 +-
 meta/recipes-devtools/rust/rust_1.91.1.bb     | 17 +++++++++
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  9 +++++
 meta/recipes-kernel/linux/linux-yocto.inc     |  2 ++
 meta/recipes-kernel/linux/linux-yocto_6.16.bb |  1 +
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |  1 +
 12 files changed, 141 insertions(+), 3 deletions(-)
 create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb

-- 
2.49.0


