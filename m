Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.66])
 by mx.groups.io with SMTP id smtpd.web12.15256.1630320431601860189
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 03:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@synaptics.onmicrosoft.com header.s=selector2-synaptics-onmicrosoft-com header.b=ZnfC2lym;
 spf=pass (domain: synaptics.com, ip: 40.107.223.66, mailfrom: randy.li@synaptics.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6FE3tJvuTvj4Ugx+xDl1N/vce1pHh60RsgHi/Ea6oRHvGXJOAwMlPyYu+bhf1SJfcGx+kMmyWOXMpfs82A2mRlfgc4iEnb4NTl2dxNBGQ7yJAWiGwz2VqQY2ihaODhPiGPdCB7HyMvkXtXqAv01XgFw+Cixe7h6XJ+JDEFcnUG0/mId6VhqDx5u1vbTpNomIbLM1G87EZ7aShpUgjL7QCu6XNIkuBVZeRONbzEwyNHDl7ZPU5Jinqvo63hlCw07Iovl+zlsTcLio+Zt1WHuEKNxONUgXF3bOSHoQdB0ksF8XgJSwYFt19jTbcqutB5Ff9Zej5icxqxmQcTzjHcR0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfdQ1h278SlcPiyQX+lV8pp0fCHdJoflrXZRNvtgkIA=;
 b=LKmpTHl273rxGeX87DJcxj8x76vIe08yUJ+KSJxx3PAx3r9V5AArQzOR+nH5dWWE5nUqkNhq3+nmWChxXtItsGylowNhVRaQjbejHJFX5BjysWuUQq1qJ+DUUyxOycnKPEa/St0UDGsyqgSUWNgb7uDp8Hmoz4sOevYVZjN4sjnvtz/Ufbf9Z2htsdFBcCDAeiZr4exRp64/RP8hGdTFckxepz/Me95o1DndOstHZ83LrOjSvzTVHUvoF9bYTpf0Ek7N+SLYLwZTJc8oZ/ZD/8C0z8YHCR58FHoQv3zRc/V1HUbBMLikI+T5dbuQdj52MpdAI8FEc80f+pF/nxYj0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfdQ1h278SlcPiyQX+lV8pp0fCHdJoflrXZRNvtgkIA=;
 b=ZnfC2lymniZtj6uM7D+3MEnhpEFlpuToT/eT1G5M92ZLX0KExwDE/HglOqpdNz5P43mbKuJuASFAk4Q/S4Louk4SnFD+J1O9/yviRmjEHxuaid5l4LnLo6UN7beM8JGt8u0dAfrrrfKFNubZJ6upHdYHOSu9g3ZBYzH+Fq86R1Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DM6PR03MB4347.namprd03.prod.outlook.com (2603:10b6:5:110::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 10:47:10 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::1aa:48b3:79d5:7e11]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::1aa:48b3:79d5:7e11%7]) with mapi id 15.20.4457.023; Mon, 30 Aug 2021
 10:47:10 +0000
From: "Hsia-Jun Li" <randy.li@synaptics.com>
To: openembedded-core@lists.openembedded.org
CC: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
Subject: [PATCH 0/2] [WIP]: fix build failure caused by zstd
Date: Mon, 30 Aug 2021 18:46:42 +0800
Message-ID: <20210830104644.422663-1-randy.li@synaptics.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: HKAPR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:203:d0::25) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
Return-Path: randy.li@synaptics.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from randy-t14s.synaptics.com (124.74.246.114) by HKAPR04CA0015.apcprd04.prod.outlook.com (2603:1096:203:d0::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 10:47:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 662d451a-fb0f-4765-2664-08d96ba3848c
X-MS-TrafficTypeDiagnostic: DM6PR03MB4347:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR03MB434786C3B2AD787B6F796B6D86CB9@DM6PR03MB4347.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dr5uLjrq1NKnou96mQcFJQV1hjARoOXeXMxVUymZyPMpH+QzOHOs2i5A/gP1Nll6kxV5+etaQaW3aPr/DPlW9Qil8vYUI/MGdtIL9umefAbannqhtEHHZdjK4X/dlVU3Qp7cs9ES1cDgrBMh7rgliWHdgRwGm84lrovaKbKDfO4suwirxtYxAyyk8QpjvGdL1oOAihCFfnh1WqZazD8N2vszzGZnYTIBGAJr95rtSzF57cP6vF7c3tZG11uND0jBOACzjS+7w41EcLbziy4Lz0I77goJ09E0+3TfiItVgr9CFkovdCEtieH0IYiw2+qWvtjNaCGrywSchQvaNAt5YmLkwwg9UUm5jr4Jh6HRpt5H7rDMN9UBwwybFTnO10AfOuIjBMHdrjIw4z7a8La+7ULxE/2YYYnGF2jvZBILcYdw6c003f04XIxl1gBFjQDsFKMQT/sUUwbfi3ppnmzCaED0f/6AwfIeqpVkVzghbt2hmPEWgluhXxl656z5e4gfgTz03oOmv615u4yhHJr2Erhk8Z95vbFUaWplkfjvmQ2mQykgKO7k1EF3Z05ykUUlEbQD/TEAtYEMt6C7ijlkJMgIsi881aMQzoWdwxfMiOd743P/9W0o7w08cPGqSWotcgcRwI0K4o/HPQA7XGFLaimiMOid97pHnSU48qY7s6jMkYkungBywgB1pOF6c3WVYWR9N+p556eRH0Fmef+Swg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38350700002)(186003)(26005)(2616005)(2906002)(38100700002)(6666004)(956004)(6486002)(4744005)(7696005)(1076003)(4326008)(36756003)(52116002)(316002)(107886003)(66476007)(8936002)(8676002)(508600001)(86362001)(66946007)(66556008)(6916009)(83380400001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LPo93qqq9l2fL2oNNI8lkpYLhxxEgRQ40hIrXD6lJb9Scfufqy4UWsFTVHqg?=
 =?us-ascii?Q?KCtFejLJ9IG2pfcOCgZ4bem8qwo6hnjFbYnUFFhZlvI4zu5BZsIHuiRboOKW?=
 =?us-ascii?Q?M05j8QbD0E+tEnpU7suCrrf4YLSKkNutAEUX44PoBrC4iXUMzibdsyA5Hj5Q?=
 =?us-ascii?Q?nKiHSCASQ/JPyjVcJGE5t+vsYfynPFSWDWRpHEdnh/xwIU4+bVjLbt1VnVca?=
 =?us-ascii?Q?dhxuk9ROVKA6mcnsFrBWJ4VaamvgoB87/dN7WW4VjJU5c9mM8s33zdJ3VU4m?=
 =?us-ascii?Q?ULHizcBM8sRkTY7YKrFA9pAmmCVAjmbCp/fsFLk8IzqNNj8v7HCXZFNDPi2A?=
 =?us-ascii?Q?P9qwG5+GXsZc5TzDKojTsjSGx22v+2PYfI8l9wC5FTTYJizSOEZs2qA5foF8?=
 =?us-ascii?Q?mylzrj3x7e0D0hwV/uDPpBq4yAeWmF/pgCZxA70p9wPHfdvs+JUsnM8HVBpV?=
 =?us-ascii?Q?NNRimd8oG91jzkr6QzMnoijgIUuGZQraYX1XMdMxDAmipGt/mG+XTLRI6krm?=
 =?us-ascii?Q?8VeB9wKjBs4vMkVBoG1fESuTYgvpa7mDMmdvZtr+kLS2UABIu9aiJlsQB6t9?=
 =?us-ascii?Q?4LLvtdiyNMwYBi0VBSkWNZ6wy8HoV+NeHgyAsLCVBFGC7bJzbKwlBQPoxyuu?=
 =?us-ascii?Q?ZM5LrSjEDnXpoPPNZlp+EpkCJaQDiVgL8OddgyCfLvwzPIUY2LNKXlLgL+km?=
 =?us-ascii?Q?+bCGvskmK4ZkSlbWsau808zDY5HNB+qbIdKOtFu7QcBw6jjJd3S4AobbiiVa?=
 =?us-ascii?Q?8dcje4dtfLGFBut+hRkqh2LzMa3cw/G8S862PgkMKmqieQFn78Uy85PF1/ga?=
 =?us-ascii?Q?2AtHZHUe4iBwV2nIkv4Ig1A/wBHgG3PGAVBhaV0XniyuTG0ljrpaOTjLOdAz?=
 =?us-ascii?Q?dj1KMmQYMioqhOPZH47pMKhgTSir5k0XMj0QYh1pH8ajqHT8kJ0X8ip/BSYH?=
 =?us-ascii?Q?nhK1DlWx0R/wKk7gBSRTaL568/CbiaWHi6kpcmtyy+/0P09JvEwmfwq6PMN1?=
 =?us-ascii?Q?uLrJXhJ06WWoCUDNUQkJPATDoSALhK1G0O/8d//meMs74un6GE3PA68Ppcw9?=
 =?us-ascii?Q?I4e6kTTgg+pod59q9pEywKGMe1pOKZnqz4xOXzaOP+CN2+NsNByqJ2f58fI0?=
 =?us-ascii?Q?h8IIfyC5X8ZO9hQ+tFbbpa8JoeBhfQg2A6tMo5nI6sXU0UAbeqEj0dmy2DXq?=
 =?us-ascii?Q?iNuqi/VhvMwyAmB88FPhn0i4Z2A1TP+C+pxpAFU8gJDtCyMlah76CUEoW38d?=
 =?us-ascii?Q?Nsgc5ddytAKnkgTf+iuRCl6TfRL5Nq9Rzo9HSm7UrjYKCDOgcCKfCIi+d3lo?=
 =?us-ascii?Q?81bgJPVKVJMFsDQXD/PxsXiC?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 662d451a-fb0f-4765-2664-08d96ba3848c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 10:47:10.0928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTNyLkefupLxuth5y6bpAYzC/mp67ENzfDVn5EUfF6LzfkEsYDL+89O6nSCrWS7rHmCkWIoytWtWgjPVx4TO+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4347
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

The configure script of some packages may not be able to
handle this correctly.

I have not verified all the packages, I was developing
something for meta-clang actually.

Hsia-Jun(Randy) Li (2):
  curl: fix the dependency to zstd
  gcc: disable zstd by default

 meta/recipes-devtools/gcc/gcc-11.2.inc   | 2 ++
 meta/recipes-support/curl/curl_7.78.0.bb | 1 +
 2 files changed, 3 insertions(+)

--=20
2.7.4

