Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBB9CA5FDD
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 18:31:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13346.1768933885814503230
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 10:31:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VF1MJcSm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K81xL94162049
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 10:31:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Wdy+lg+X962xiv9p3N91fq06al23iC+H9lHkqpeMOFA=; b=
	VF1MJcSmxn/Bup01ESMiXHxNxBP19suaJYOoVJOaVjNzFVNqQB3S9au726kMHHNa
	ZxanAw9dqfJzTOfymsxA2vKyPU2p3+kNHF8dQfF8sNR7/Xxp9i5gN6fFyOZ+XMEg
	KKG09In2rrT9biIj+Vvnz5gtR2FNpENkeQ36k1W4DH7RVwfrfXc4CNIZgjqdGNX2
	BPnEfGGoUaKqBrAOef/DbqoTomGB9b3XZHWCzWJuI30lLENwPMpv85izXsuscuCm
	sHaMCTaB/hNhjfvrMqn/O9K+OPh1eSUJWZhq7zEAUf8PD9DLoJXKmhxv5uAdLL3b
	4SQi8zBVcpYimvJVcwj8Aw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012070.outbound.protection.outlook.com [52.101.53.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4br6k1k8ky-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 10:31:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7B40L9wlXMuSMvwRXoF/O1SE+pp6K1wcmxHJDQzkTIe/cHOgvpwMmQ5JgTpLAsGjP73/jx6IPNxnLN4DxJINuU6n2riB6LDlYZUC7+7wdOWDyNoIKvXs8/nxe7MWOSLO8iPmcC5V/foDh9bKyh3uodbzwZ+FFCX6zVI9eOy+SGnnQTU0xX1IYOM82VgeoP8G373Q6urK9UKnKT8RvTCnsju/9pc2IljHvLjTouaF04PGz81c2d5iPooxdhDpD6BNxb55+SaqBvU0coYKondeYgWnuLv8cRpHHKlLel1TqKzjBz8AuaabUk8s4D9GoLdMFK0qWxb5ylsniolh46yGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wdy+lg+X962xiv9p3N91fq06al23iC+H9lHkqpeMOFA=;
 b=DK1CJ35fhC6lunR9o9aDTbmrVRvuooFgbxrCOWcthQyL+v8tbF2rYA8lnNr7IEDbnD7bqqd3GG/Fyoqw19pJzuB2JewsyLV+5M2gec29tSz/5REb2q6aDJwRClRFqy9TvoJ+8HxsbxU0lbO0OcdryrJX0JllLJX9GO1JqUi3qLqJPzTxjrD49oXCFYy1sqnJ9mrCmo5rx5qL4qiZlbhnuuCSyJ9TpNKx2AskIGQ7vI+eKeuM561Eiwba7JzLgaUoNuae4obCvys0oRDEAASp+nLatV36vTFBw1U0NxQx5qpMmPBtc91gjI0enItYKOJUG7Apmflgp5BY3s7TRVG1dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ2PR11MB7425.namprd11.prod.outlook.com (2603:10b6:a03:4c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 18:31:22 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 18:31:22 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v4 03/16] rust: install Rust library sources for target & sdk
Date: Tue, 20 Jan 2026 10:29:34 -0800
Message-ID: <20260120182947.857242-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
References: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0146.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ2PR11MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b55008f-026c-48ab-9b9d-08de58521c84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?z0FSlOBOiBpESTC76XuMNvhYW8ORRUEhgUk+xTZ7k94Tu1ohb22f3wV1nDEV?=
 =?us-ascii?Q?9Uy80kzNwpyvzoUZwIGNxVuLyH58nVg6SK3g2cPdEItxV9t+GNJPe12LLPpo?=
 =?us-ascii?Q?iN+fn9rDqHELLt0fKRJ5u5/Bg6OeSHkn4cMxW/UX1J9vfvHWeVBoc3C7ioAU?=
 =?us-ascii?Q?mZSrYdafVvF4QILOmRqSl5K5aR/am24JeV3uXGkSYmTwfNsOsTk14sPm989v?=
 =?us-ascii?Q?bnCIfHRFT69C29qoSwPnXkuX6QhdFr3f0yjU0TvCw+uginR8XoFKGWthVQhd?=
 =?us-ascii?Q?Mwh3f3QQjs7TXj844HJgMqfeejtxGh73AEbztByH//gRLW6ndy+CD0vTSeSR?=
 =?us-ascii?Q?jc0w6pjRW2h4g5TCJI9FLYYbgPsb8XD+gIAI/chgV9gMKm3cmtniimYxEFyd?=
 =?us-ascii?Q?BFq+Sj1vO6jxMnBoFlK7SoX8rE952HHUWDCM26eY9NJA6t5uDztUMGztPM97?=
 =?us-ascii?Q?SeQc1tSOF6PXTRM6yovql8/YHNRVvw4F3HxQNavjdz9pIEY5yFEMBvM0z0Sh?=
 =?us-ascii?Q?Fm7Gm0jMNmdu3bnE3f15ISj+0sKZhYxC6ckPxiG1rkw1T5AwyvAhLoWW6TwM?=
 =?us-ascii?Q?P9j2uI4fRZo2kamS0MzG8yZFXSFb4jJ1Qr5Cg7g9mEV3+qL4NFg5UUiHjVGf?=
 =?us-ascii?Q?cQ09N4vbbt7+j88jR2DKjb6muP7q2Px2n86KoNqkQay5ipkckJRSDA40Fn0r?=
 =?us-ascii?Q?C6zr0og4A31v0qvNoFwYZ+Pnq8zBWsqIoPcDb5e2hJboiWu+rHOJxE7A8eP6?=
 =?us-ascii?Q?YxTDXNH6o26A71RmZto4tfhGruruel9jd9gDzJ2DyEharIIHAWYHNXjwJWsi?=
 =?us-ascii?Q?U1bxpD3V/hsqEWEBGYKevJ51LNNkuj4wk7XWasDrjSak6IjLnhSxFKx2BZTh?=
 =?us-ascii?Q?OujrE55/tsKJELD1H1wsRmvluPuAoDnoxdwlsSwkvUeMqCQV6dOyU6ms6F7Z?=
 =?us-ascii?Q?CLDLpARS3pgEqzglqjQmsyGbGkYiKapJ5yjCBNLWVL7xYHXaxCYggpDEDT7I?=
 =?us-ascii?Q?DcGo7ceL8ExEXOfNyGZThgJFyGEF4mw/Ig3vJoIM00jFVQCTQWv262Agqgpm?=
 =?us-ascii?Q?TXiFRqhBT5VQdi/AN2bit5fEPAUs3YAHAHpQjKGVIPDjcldjlgiGeXpEfR8O?=
 =?us-ascii?Q?VyeqMM7aaM7I4lR9Pbbw7Tz5OW7KFD40aOVfNaddq7SYsfNIqRfihuk8On5t?=
 =?us-ascii?Q?ZJvJJc6gu+SAtptlW/PC7VVVKm7SsjjEYWUm13w1V5YzwKg+4B2xIqwgheH5?=
 =?us-ascii?Q?6oi7obPHUUlzxV5IL9+vXHTc1HVP7lsqHWnqoFgx/+yR6ht1bkbZeCsLZhE6?=
 =?us-ascii?Q?mV/pOR9BPT34Iu+HEOsqRdgngUSrcbor7TMlLDALCdQD9ROwk7niXRzPIE4M?=
 =?us-ascii?Q?rcgQGFVHEERsAZ3Z7VWaScuPuuOn+B6/UwWbAUTRMX6dEvtIDsD+1sEYhswb?=
 =?us-ascii?Q?07yfqqJahKeY1O7E/tQGgrJX3k3X6HxT6GHigrv2p5ZiXWvetnurhv4FBTB2?=
 =?us-ascii?Q?9CAQyJnWuQZenc6b3zHeaDeVEYctBaf2VSJF52eQxkFfD9uRPqMiGBScV8G+?=
 =?us-ascii?Q?eMnVjXUQh5J179+QbolQYY/8XQZDfNhZrr20+TJjqmuII+uv+lCghObr/PL9?=
 =?us-ascii?Q?qwtUJqrGAk+uKNp8p89gHt8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?URvSFC1/fnRAPYAHfbq9KA7tf23ZKcHRfPjwnCl5E8iESJHSiYyZVMGXabB3?=
 =?us-ascii?Q?M1Y2ttbEuj0LT9Gkw/4HiJIu/eMkAceAAdDxU07G6pxo9c1X03fwObsx7sCQ?=
 =?us-ascii?Q?d7H7PjHw5408kbNjKMyCUk7u8Ma922y+FsbtDIU5MRwmvMXc3MFsb/U1mtXz?=
 =?us-ascii?Q?eAWJ3dCwcP7HCHJrKrJnxlJgRGVgZlpqIK2UW4q6gW8OWAol6dmcTZ3nYjr8?=
 =?us-ascii?Q?sgQwfPCnikPsxLVge3ePdFsd3FvChrXMXQOoUNSRSinl1iWtbs4iDC3KYz9h?=
 =?us-ascii?Q?13kovLzctKDWP7JDgNkRusuaa5RxwFvdysOow16CMEXBwnH3End4uKM9JqNe?=
 =?us-ascii?Q?q63zOc8T9BDfsiX9lvVqARy5RU5SXIHQVzl3X4TazylL+ku51A528EJxStvd?=
 =?us-ascii?Q?o0lgidcp8C+v9JEvNPbL2EU4zoRsgMRl2/TBo8ib2II/aFM1eq99/NBVak/8?=
 =?us-ascii?Q?lwBJj7tvoHblm0tY0e/3L6PAYvW5lRQWG/9GB16lC7QWtkVskn98pJg5folN?=
 =?us-ascii?Q?DBW8jEF0EHTPaeSAmylW+nT1FLxjiEIisuk/OZMPs5i3BqDpUS/bdipC5jas?=
 =?us-ascii?Q?wGNrpzD4nv1mOfosahXcWRRTiqcWAQHUIDl7P9T2jJicKlCOr8bomVJcscKd?=
 =?us-ascii?Q?CFN67sNSPAMYxU9x6Ej49Gnjwl/IWzxR1MzYo3qE1d7DWMkpggZ31ZTxAM97?=
 =?us-ascii?Q?4Cv1Mtv6+145bSeUN2pcCYvlDyV5rrtWcfKjpL2LcXXnYzsWdNMQJP/NE6Sf?=
 =?us-ascii?Q?ddODaUnTvtDVmqkfu4M4pj+kRE7oDz/BcdkmUkiQ9RySKFCRfFNc+xcZMsCe?=
 =?us-ascii?Q?Ka0xHDUKJBf33KzvkAsuJq0mv6fo4Hl03nxMK+I1Z4acMfIVyOeJa7vU16XK?=
 =?us-ascii?Q?3D4RBqtFC8EGxCog6bucLqb35KlGWwu1Y5kWKQFhEz+2vJQe0ahNgSZi8VQ7?=
 =?us-ascii?Q?AOKz+VRWusCBLom3NC42F6uKKycJKodE6Po+GQQmFLM8li+aNSN0/Wevv3sd?=
 =?us-ascii?Q?CXimZohYWh4NsVOtlnGZfj7BzDdPgFjjhOH+PD2ukjuJUY0/gIeXOhBCE1W/?=
 =?us-ascii?Q?QjngQeEmg5T68LnJ5HJ+87Z0Ku+Ew8/TZT+dYuFSQgoD4G6YxgVo9rLUiGry?=
 =?us-ascii?Q?MuO9HvYUHm8mwQQKcZnV37d1ZP8MlIuLPKUytbyZJnsvt/YsetTsVYi/axOA?=
 =?us-ascii?Q?xr26q8DRyiD9RrF9iIvqOPlM/3q/2VFN1dKeK0iXYxk/j7l2/l25b2li4U8J?=
 =?us-ascii?Q?2CrYyZvrV9sTWQIUhkukOvQCP7RIoT961smSJ0h8tnc5tZFofNR3WBeR9lbq?=
 =?us-ascii?Q?7vPz7aZ9tVUaJ+SY1yU5zuSYrPNWBtB2vH/4qO8cHu8ZUs4r7fR7IZ6kuJwX?=
 =?us-ascii?Q?CKvCH1gFxdDCIscL38vpGTQ9Xz/Rz5cb2Mt2UyLo8jIQYZLjrz1cqs8HIcA/?=
 =?us-ascii?Q?oBaymWH96heh7YytvxYHs3LC8SE/ta3Bdliwzk3Gi892Oyv95QfqyPQaqkDy?=
 =?us-ascii?Q?j/nEzRnThIhDMtxduWcU1dtU3aRj0ZAItq/y97yly1I29mHk50vrhcVtkyTX?=
 =?us-ascii?Q?+TBMjouwGKPsjxzLaT5qI3NzzhZAiUBiVL1gE06J16qIzePIgu2LK4t0HEA/?=
 =?us-ascii?Q?hA7JoxyWgZaQLeOBH32mec1ylxfo+fMv9XTXX2g9Bhke6cTIA0FNXsTL5s27?=
 =?us-ascii?Q?e3+mAAuUvcsz/oWv1jIblLuSy6KJiIGWeo+Bjo1G1Z9JkpHDWtHCfFpfazjP?=
 =?us-ascii?Q?00ySU0/yCKhWWm1CkYvFQKjVc3TiTEE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b55008f-026c-48ab-9b9d-08de58521c84
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 18:31:22.3623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n0fqsLc36zGnw0mmIpDNAenZomA6U3A4OPaH6Ix8JBU35bERIY4B8iM8Cs3ynMClb/jQKTu6alDYyAVNmviDJATF4IWRsqyuwD8ddatAC4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7425
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: ZV-E6n-Bnecidjufa8VDpDWh7pXfUal1
X-Proofpoint-ORIG-GUID: hcnP8zGtykj_ipMiF0JvOgoDkV5WVvN6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE1NCBTYWx0ZWRfX7I2S2QCKwny9
 MbVGk5evU1WRkkG16yxhlDpZ0o7UCca2srv3/ILMSDkJVZz/aEGgzXVRK2rUU2mXpmusLPaOl3u
 44/ot5hTyd7kQXOk6hl0YQ7JV1DJQ1ZW6xd7b2dxZgg4qQyEV5g6LTklgFT3BVgMD6fQxcSQDqJ
 dR0OrQEEgIS6lzNi8aw67epuWRKc4gfwpN2kbnfXnvE7U73TDs3QAqSYrss3mJU+BP48ykEflX5
 wXuCUd6UurKITd8oQJxyevul6YjAfUIxETwg0LKHwsdJt0nCaMW8XUj7UaxLHUwutIxDVfbtnFH
 zM1raEV9fsASz9ZgKGer2uvTzYpD7MG/fL0DvBbEoMlFuKH0xTPqBIvC0b5c2xXOo3ei6M+1Nrl
 kqJQHSoK+dVUJcxVdOjeicLqTvkIVtDh/vND9b+X74/xEvut1EvNcG/lzCd25PtxwHZIi1Aqb3L
 v1C8aeLfUCfpoGIyFUQ==
X-Authority-Analysis: v=2.4 cv=ApHjHe9P c=1 sm=1 tr=0 ts=696fc9fd cx=c_pps
 a=beY4+7vfl+OHeoikwBMclQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=QeMy5WPdU9dpobuweN8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229770

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The `make rustavailable` process (1) expects the Rust standard library source files (e.g., `lib.rs`)
to be present in the `library/` directory under `rustlib/src/rust/`.

This patch ensures the required sources are available by:
- Installing the `library/` directory (of size ~50MB) into `${D}${libdir}/rustlib/src/rust` for `target` class,
  making them available in them available on target.
- Installing the `library/` directory (of size ~50MB) into `${SDKPATHNATIVE}/usr/lib/rustlib/src/rust` for the
  `nativesdk` class, making them available in them available in sdk.
- packaging `${libdir}/rustlib/src/rust` sepearately with `${PN}-src-lib`.

1) See the kernel tree for Documentation/rust/quick-start.rst in the section: Requirements: Building

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/rust/quick-start.rst#n145

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.92.0.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust_1.92.0.bb b/meta/recipes-devtools/rust/rust_1.92.0.bb
index af739df88a..eaab6a1c16 100644
--- a/meta/recipes-devtools/rust/rust_1.92.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.92.0.bb
@@ -265,10 +265,11 @@ do_test_compile () {
 
 ALLOW_EMPTY:${PN} = "1"
 
-PACKAGES =+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt"
+PACKAGES =+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt ${PN}-src-lib"
 FILES:${PN}-rustdoc = "${bindir}/rustdoc"
 FILES:${PN}-tools-clippy = "${bindir}/cargo-clippy ${bindir}/clippy-driver"
 FILES:${PN}-tools-rustfmt = "${bindir}/rustfmt"
+FILES:${PN}-src-lib = "${libdir}/rustlib/src/rust"
 
 RDEPENDS:${PN}-rustdoc = "${PN}"
 RDEPENDS:${PN}-tools-clippy = "${PN}"
@@ -316,6 +317,11 @@ rust_do_install:class-nativesdk() {
 	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
 	export CC_$RUST_HOST_CC="${CCACHE}${HOST_PREFIX}gcc"
 	EOF
+
+    install -d ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust
+    cp -r ${S}/library ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust
+    find ${D}${libdir}/rustlib/src/rust/ -name "*.sh" -type f -delete
+
 }
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
@@ -336,6 +342,11 @@ rust_do_install:class-target() {
 
     install -d ${D}${libdir}/rustlib/${RUST_HOST_SYS}
     install -m 0644 ${WORKDIR}/rust-targets/${RUST_HOST_SYS}.json ${D}${libdir}/rustlib/${RUST_HOST_SYS}/target.json
+    install -d ${D}${libdir}/rustlib/src/rust
+    cp -r ${S}/library/ ${D}${libdir}/rustlib/src/rust/
+    find ${D}${libdir}/rustlib/src/rust/ -name "*.sh" -type f -delete
+    install -m 0644 ${WORKDIR}/rust-targets/${RUST_HOST_SYS}.json ${D}${libdir}/rustlib/${RUST_HOST_SYS}/${RUST_HOST_SYS}.json
+
 
     chown root:root ${D}/ -R
     rm ${D}${libdir}/rustlib/uninstall.sh
-- 
2.49.0


