Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13225D41D41
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 14:09:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10006.1765462132976828220
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 06:08:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LuoB21/6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4440256309=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBDNhsx838578
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 06:08:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=cddVSAC5x
	8tJo50Gr/qZqc16wKWK+4xWLKjxlrcHsCg=; b=LuoB21/66pwiAagi5I5IoaTuA
	EOH1VSINezXHs3OCJDoKxJFSAez+D2sIwZlDHvkiXBacEBrkhpd9qfZLfBOSkkpL
	Lqj1oM0BBcULHnNuDwfw3RnDec1A9bE0zsHBmIfaciXdDbRP+7ZsVL14ve/M4gcv
	oX0+K4kKMnbOZR1Okoos+3hxON6Hi14B3If9wZ78rnw3mTGWHK/Sa6DDp+TG5Eix
	wPA7vyhb29oIdYc2pbOwe7Z4jR3PmavEmHEKMeLU+VyN504i2e06fDLdHaDKv0tx
	43Cuipd4DpHSNmG8aRYjs3JZY0tKZVx2SYfnfCVi34Ef8wx19n79EmgBCUoHg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012022.outbound.protection.outlook.com [40.107.200.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay022t5ff-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Dec 2025 06:08:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDuNgCqILEv8OvwXVMK1+NATrFekiKnN4iApDEeDkyO0uMla222z9NumooEoOs8Y8Ye+uKhPsakQM7b/rDV1oqDhVLSjugGIXDP/HK8iIzccGLtOyU/6yh/CJOooayx3uGV9a0JqwjpnFONIKvak67X+Si8u7cKnr9U9fjc4kBThKknN5jH979molFBRKScnKISiSskb8/FGIh/jhP0qhoLKW5YG6mOFmLBldhuwRtFQKgH5AiAE9aXZFcUVwgiYmMtP3Msa69NKxrgyAidS9obiSjj9Z1Bfw/I8rURnkDdC+aHvfhKiLVXVxsFunbIGf1fpgAx7kRCQoVU0oeTLjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cddVSAC5x8tJo50Gr/qZqc16wKWK+4xWLKjxlrcHsCg=;
 b=MXb3e1SGl0StBG5gbyqv1jOXnDDd7FcmeQ4n9dWWqwoosRhMPNQH/7bf8wwAC0TPfOpfntoNR/R+DZLuAgusXaeXO0fD0tPtjPhoO39dcOL6iV8IJy24mze7LWgOCo5RW34gBjg1gHHDWRnd4nKXuHR/Rofl4cO/Ja2WQBRmezC9lzanvj7jmQxxuvAGlIx70RRqCg4fpaPZCgjalIVx9uzUKbXWM1pskmue7a5AlfZn4j2s8FB8mvhL9A8zDsjghj+9Xd/lk3JMpVc3Sgdy48sO++aEqczIMHSLHBXKHJV5CZHPqE4gWFBt5hK0KUJUnGQZcn0uC62rfiBZ7KVDOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by SN7PR11MB7994.namprd11.prod.outlook.com (2603:10b6:806:2e6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 14:08:37 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 14:08:37 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, peter.tatrai.ext@siemens.com,
        Yash.Shinde@windriver.com
Subject: [PATCH v2 1/5] rust: add missing zlib and zstd dependencies
Date: Thu, 11 Dec 2025 06:08:13 -0800
Message-ID: <20251211140817.1250831-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0004.prod.exchangelabs.com
 (2603:10b6:207:18::17) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|SN7PR11MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: bc10e6a1-9141-4ab6-3086-08de38bec70c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UpsuQeo8ZoU18//+OqcK4cvzqeRXsSmyr4+Q13V3b0tMRInydYS0g2TS3nDY?=
 =?us-ascii?Q?4XjL7BOtjA13OmESNLwIfSXROejsG7PL8xcQenjwtDAjDH1eWHAWuAMyyYmC?=
 =?us-ascii?Q?276Zt5lT8rSBSP2rBuumuvPOh0bccNgIBJTRkfeAv0GK9VhV0v93m1MgKLXT?=
 =?us-ascii?Q?duoGB+1RtFdy0TjBbJaDhlikiuumVext2+Z6mHPZc83YXckvGwp5HK+lG7iA?=
 =?us-ascii?Q?w7ba8QJC09RD+MrLUObTygH+vlG6iGnDybp9NCR5UADjjOw27O6wsInr+y4E?=
 =?us-ascii?Q?GNUY9SPKNylgXvDqId4XM0zkhEm9T1NVDeWd0NGMMN/dwkoj/GlfSZ+xN/j7?=
 =?us-ascii?Q?46rWyzd5W6c5w+Fvei91r8OyDWPu3LlFri0UyqfXHLnlT/TGHXJHg+wogp3I?=
 =?us-ascii?Q?eFx6tpgVHUovwyvGCkVRu9OBJTVuJP807mGf0cPzgKHvt4EOst4qtK1VRICU?=
 =?us-ascii?Q?EXdImNuF1Ygicrcj/E1VoltRNKRNlm05Q5bwIuQkWfde0D6WJK87LlBj9nRd?=
 =?us-ascii?Q?QtOl5GEN3KJXGxe26tzu/k2XDg2jDw/l01mFyg2MJ8FSIXh3sReqvJcb5Udh?=
 =?us-ascii?Q?RuAT4TLyGWhD6b//Yb6YGMrG++4Hg9PECeMu27GtATxpEeW2heZJcvm5nu+o?=
 =?us-ascii?Q?dRQsc4/rlVkjNucOLHJi+WKX9UzRkm2minyDkHa7flzMX+i6DUjaeVy/ml8R?=
 =?us-ascii?Q?rPZGcWWwgDXOw3Bavyh15iHYfwoKb4pv6hvJpNnRF3dw+T8XiZROwuKdxV61?=
 =?us-ascii?Q?/dNhV0K/GPo+T8ks+dgawg+sQo4QPfZ0D6KiSmGn8INYygWZhgCdr4OYC2Ha?=
 =?us-ascii?Q?EAvYGl1ojfrmMnyTKpJ4q2u0px5Zt6BLTrCutgKny1IaRC6GkbPO27JusBuc?=
 =?us-ascii?Q?GQERP4l+hcZJxVa4adrHvb8hdXPRA6cCCAAZbYnLTHzkRtQjIHdDRtoQtc2U?=
 =?us-ascii?Q?PsnETaCUNBR8EW2fBJZUzfOVTJyhlDoa79SJpo6y5eAeXdcVwyb8H9TDU+RV?=
 =?us-ascii?Q?mpg03HwAzT9+YjK9lTTQhEggNYt7cx7YfIevmB2JKNMvvggE6P6YiRSI+tfe?=
 =?us-ascii?Q?1KV1YaF7iUXLkc8IMD5mD82hQYblldShEJNvkdr9fHAufgEddfntUQhassE8?=
 =?us-ascii?Q?q8m8PTA920Y0IOaZYLNRYqmEwyP97GBW4ZEx9wD0i9rE7HCDsAMjeycasdkR?=
 =?us-ascii?Q?etUi32CVspCQ8vNqS25QSZVBKLbIz9VPUpMjpEsTDzuayEnZuajTXDskImRb?=
 =?us-ascii?Q?L59nhPFwF1Kepl50L7DyFEDXfihTQZ1CBzpXZwHx9Pq81MRSa60bg3kvbI6A?=
 =?us-ascii?Q?h64hu0MoGONYUwvjTbmfqJJxFBVBKzE/hPhKP4k2uXSoxVX0oQTOfDS+OFLj?=
 =?us-ascii?Q?87Phq8NYJm34/pOI6897Pi0HOXl0mFnn6wu+cv7KxZyLIS1XGCX94Mob2LsH?=
 =?us-ascii?Q?QPWPfvx+SngUJ3RlgPgHlp2yrXaVHn9DVXYm8Mr/rkSQlGHJV/tiBHzqjWP7?=
 =?us-ascii?Q?aRNQbJCkFhQv98sqw5hU6Yk8xQ1wWALx0W5L?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gaxE/YT/Pf0z8cwbAVXgzgWztqCKMQylypXw8LJSJJ5NO6R1TbTQFLk21P5S?=
 =?us-ascii?Q?uzssBDneALVvVVgD3ij56I3kNu6dcPqmEa+IDXXRRj6uIeLvz7wK8ofK8yQa?=
 =?us-ascii?Q?QhXE0vDKdJw6wIuqTosbWrf4qPjZ6qXaQlY82Hx1nHYG6p3KCGG3OcOGhytU?=
 =?us-ascii?Q?dwq9/xtXmADH5H1sGgRdhd4iixseeiVZYxWUraSA+xR3Fzuu7Fo1TDfTfNcr?=
 =?us-ascii?Q?m+GoD4U0OGvCOTW+a2ZPwvJlzP3HLn7pE+2xN0CT/np3b4bhU0AzcAw7WSSj?=
 =?us-ascii?Q?Rp+krNURJJNr53SSgEilJVA5MgrpxmZCjJQINjRZuz1VjUt5nQdFHXJdEx1q?=
 =?us-ascii?Q?dRUiatFlM1Cob3l/SwOyRcJ2lwJxFUa/uAQVXrRZlxJaOHrePv95xMg5zrgB?=
 =?us-ascii?Q?cEEoNYpfUktk4hAh0RmDTlYK64gAGYx0FL8uB5lxUHAJq6jaW1nNzhS7Ar39?=
 =?us-ascii?Q?h0Z2FvbssPDQHjRMqGpZ5ipzemgCofcDVqywvo8oP7DoZsyNbMZ/TFETo7Al?=
 =?us-ascii?Q?rLuFsUyzKWpjHI3s5rJ1/bZgGCcTVpXUVXg0BNFoOifoV8XcEKwOsnGEMKM5?=
 =?us-ascii?Q?OHx4EOnRT/uLhBPu4bOEQ4VDB3YrwrK581luYXWDfRXGTcOTe2LOsYB5i0Lk?=
 =?us-ascii?Q?bTe0foo7HFTX/WlffGL35XAXPSIsc7ByuIrdRDfKjwac3DE4oo+RCtjlUoae?=
 =?us-ascii?Q?jVXFI+YMMQwXrBCUBDXcgXDF2FdRSMujpeBbAtmRSWhZHFBNxvVmTXGsdpuR?=
 =?us-ascii?Q?ZoNElu3SNfxGnpOXKPEvP9VfE4vH/eLc3zDPXMl86nQVnfScyEpJdxk8UCYX?=
 =?us-ascii?Q?UNA1+klGYhTLq4p4dutD80X3LfXRqDOahzWzh6r8ajZ6LeHSmMXtu9e1Knqf?=
 =?us-ascii?Q?GAV+ni2MnQMYFYHu/0IS4fW9NiU5yDY6ZDGWtcxNbPlnJ1UUz/XW/mmFtw9q?=
 =?us-ascii?Q?Q8dbWU50LxEXap6hFyNhW/ImSX42ck3dwPTyIX4wJ9ogpxCY/GhbvMxdLOck?=
 =?us-ascii?Q?6kFICGXaEkhC6RHi4vaNQhMbOnD5uhQ/5Pwy+dAE+9J8v1V9jVpxzNperPA1?=
 =?us-ascii?Q?Sro+0ESguNFMbvLfFHt5s5nxcnuJtIBJToWXZYIBCZpe+Zxp1vuYlLrfzFKn?=
 =?us-ascii?Q?b+CGsg54jaCEC3sXf77vBX58DEQ/aqM+II3zjo+HlFXINlHiZZnERlcR5rLm?=
 =?us-ascii?Q?jzq0qh3SXxaKsljNsqivOKoa3IuEixrUOB9Il9ADPcjn+N1wTYVxbHN4xHhX?=
 =?us-ascii?Q?fxTWX/i/c+jfkwoNfvbSv82p1KUfsEQcVNhqdmqJR4cWNZP3nFrAdbknK/qz?=
 =?us-ascii?Q?J0588UCFYu9pgafjCDrAUSlFENEh358suNYvuzt14Wk4EYmdF6Yp14fv/MK6?=
 =?us-ascii?Q?FRXVLxgWpUwn/FM67Ad5Xa532zaIlifx0egLfDRuydbpbN6mzDH1J2dL7UUz?=
 =?us-ascii?Q?CjsyH41frKVYi+hoEIbTFF7XtU3H598TDRX7bjnYhBo1cYc2DiYYMCx4/eEf?=
 =?us-ascii?Q?l5XwcWl72pPtm+5ul7jFscfW8wm1Gf7FvOPhL5GP/AC1+C7Hi24j00+bOmfE?=
 =?us-ascii?Q?NVWnq5/qNQIZl3Ne6aUCewE6tHk4NeOpdEtgi/IjlGHjCcwlZ0/NRfW1Xyco?=
 =?us-ascii?Q?6w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc10e6a1-9141-4ab6-3086-08de38bec70c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 14:08:37.1176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5K2xNze9aKaJJlP0V7EuuHIdt+jKbcy6pIKvNpTTgYfWBLjUVB8qlqyMidmvLqGXn/5McjfPSw+bZCZRt7lDPIDxT7E2vb+RY6YjGGeqSF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7994
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bf1mkePB c=1 sm=1 tr=0 ts=693ad074 cx=c_pps
 a=cqrExuG+o96ZXwTaJI9uFg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=a_U1oVfrAAAA:8 a=t7CeM3EgAAAA:8 a=nfL57PFk8sWjUCby0-EA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -UE8EstpwtLpSBqaW8MXNB4ZpE9g3lTn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDExMSBTYWx0ZWRfX3UYlkG6RoLPa
 AwHjqWaD/P8DA+0gadtGnlxXEV9WoqY2ki8pmaMbvhCRNShozuwJ9KFPpc0nH3uSlLRKLlXk+1A
 FPwpsJmMXUusMoOFGvl9SYh+UYo1NRY8WGkXfCYKC7zmPjewrB/BiS8EKKH7WLkvsj7QwRlEG2S
 CCa9a5FFetmvjwRDdGYoKLJRIv/KRU7H63q04UyRpymMqv6QLKNBeItqDceiYnknMgHNYNjz+aS
 BRlNjQXIBEMbmE4UEqq54xRwmjKzmvKwo68V78oAKy/ThzhRO0G7JLBSDOlwHHjImj1mNk9Oe8o
 zfeZBnq7fisQi30bNyRl6Vo1Rz8/8LbeZfhbajoJH/0oHxod16Dumfj1R/x/YgBrCJKIWvXwqdm
 gVovcLgYKfBHyVGiyKtob4DEHo9LKg==
X-Proofpoint-GUID: xFftQw2_9kNByzohd4nuZhiDtBLzvhLI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512110111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 14:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227535

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

LLVM requires zlib and zstd support for compression routines
used by rustc_codegen_llvm and related components.

Recipe-level RUSTFLAGS are not propagated in qemu image, causing bootstrap
test linkage failures. When these libraries are absent in the selftest
execution environment, bootstrap test binaries fail to link and cause
following failure:

  error: linking with `target-rust-ccld` failed: exit status: 1
  = note: undefined reference to `compress2'
  = note: undefined reference to `uncompress'
  = note: undefined reference to `ZSTD_decompress'
  = note: undefined reference to `ZSTD_isError'
  = note: undefined reference to `ZSTD_compress2'
  = note: undefined reference to `crc32'

Explicitly pass `-lz` and `-lzstd` in the image and ensure the corresponding
runtime libraries are present in the image.
It was initially reported on qemuppc and later seen across all tested
architectures (arm32/64, riscv64, x86_32/64).

https://lists.openembedded.org/g/openembedded-core/message/225636

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 31222e2456..01a98339a6 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -47,7 +47,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
         bitbake("{} -c test_compile".format(recipe))
         builddir = get_bb_var("RUSTSRC", "rust")
         # build core-image-minimal with required packages
-        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
+        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp", "libzstd"]
         features = []
         features.append('IMAGE_FEATURES += "ssh-server-dropbear"')
         features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
@@ -124,7 +124,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
             cmd = cmd + " export RUST_TARGET_PATH=%s/rust-targets;" % rustlibpath
             # Strip debug symbols from test binaries to reduce size (300+ MB -> ~140 MB)
             # PowerPC mac99 QEMU has 768MB RAM limit, so we need to minimize test binary sizes
-            cmd = cmd + " export RUSTFLAGS='-C strip=debuginfo';"
+            cmd = cmd + " export RUSTFLAGS='-C strip=debuginfo -Clink-arg=-lz -Clink-arg=-lzstd';"
             # Trigger testing.
             cmd = cmd + " export TEST_DEVICE_ADDR=\"%s:12345\";" % qemu.ip
             cmd = cmd + " cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s" % (builddir, testargs, targetsys)
-- 
2.49.0


