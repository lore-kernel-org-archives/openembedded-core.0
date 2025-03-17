Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4671C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 21:29:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2834.1742246976704747929
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 14:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5171afb32b=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HKZ7HR016583
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:29:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45cxs0tn29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:29:35 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52HLTZSt030696
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:29:35 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45cxs0tn27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 21:29:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqnJbwdlFS+L8NQWzCriEDgeMcb5e619RWLlacQWwxslxllO4Wm8JpnoYSaS3uDg00CK6qLSGP73AJnVHBdpdHW0seZpRk5ILNfQwMXaJ1TIHqC9s4Gc3+s1wFPAGK60e/hWAlKue7NG7oiS9zM7noqbqE62f0+evHr2FZBI1uCA4079Q14Bm/UTQHi7+iH0b880/IRMlJTbj4cEHQWWcN3qBFZd9h90dH9BxQaLgO2RbaSV5GUUbByNW8RFW8fP7w1GvHUgYFvJuo7J0wybPyDVCEZYwJQy9DDFypNU3vMHQMDIgpMHg1NCKdiJMSh6Ri5lF6j1QxWrMXkdpmV4hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FI2hQatw/2Cc9OhfVRv+Y1xHFCUT/8VwQzUZsdauFC4=;
 b=KDoPCW6wCyVwY3cO4AP6y/S1eF/QC+ZHIGG483Md4qD+cNvLm7WDsoBsuhbQmWfeTgZ4yY5lEbJONgaoYFJ0G/2EDtDIYt7SuaVJgIgVc+9qIAVQDm+2L9uiRbeoG3yX4o6azV99d9uNjTHk1Zy2d0MyB6U0TI/Qoo2WS6Y0ol6ZNcidNeFYQaYKUbRkFP+04RDh4iHBLcDT68cHQBxRggoEvfg/vK+KJq7BTea36fUap+tuZMoDyKlMAB1li01vvSa+mXUCTbe2ILGoIl9aCbmoejTUdWbJDLVdTPlbRnydHQIz9sNWLsBk/F297GmIRjN1Z2ucQ7LGC/uJFcIjpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA1PR11MB6894.namprd11.prod.outlook.com (2603:10b6:806:2b1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 21:29:31 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 21:29:31 +0000
Content-Type: multipart/alternative;
 boundary="------------BJ2jGDjiN5w8Pbl6E023IKMQ"
Message-ID: <69571582-71aa-44ea-9601-88da0d8da117@windriver.com>
Date: Mon, 17 Mar 2025 17:29:29 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v6 1/1] babeltrace2: upgrade 2.0.6 -> 2.1.0
To: bin.lan.cn@windriver.com, openembedded-core@lists.openembedded.org
References: <20250314130840.84700-1-bin.lan.cn@windriver.com>
 <20250314130840.84700-2-bin.lan.cn@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250314130840.84700-2-bin.lan.cn@windriver.com>
X-ClientProxiedBy: MN2PR02CA0035.namprd02.prod.outlook.com
 (2603:10b6:208:fc::48) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA1PR11MB6894:EE_
X-MS-Office365-Filtering-Correlation-Id: d78e9744-2c22-4f41-738c-08dd659acdf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YytaSFY2dHNlWXNGNVM4SW1NOEQzcnYzN1AxTHUvR2ZydWxHeEhzY1BoOHA4?=
 =?utf-8?B?bWpSQjV1dUZxUWpPcFZydkYvY2hva1l0aVY0TzlpZ0wxamFVUkY5a016YTdW?=
 =?utf-8?B?QTUvQmx6R1AxK2lzQ3lHWkJmRzlpd1FmZFV1Q20wdFk2QzJ0TFRpV2dUa05o?=
 =?utf-8?B?MVVEcktsS1ZnRThhWERNNnRGclBvY0V2RGpuNllHZ1FDVjRLR1J1MWNlWU9p?=
 =?utf-8?B?N0gzamxodWJCd0ZycU0vTVVQenBWM3FnUEEwb1laTFBKeGNsS2czUnM4NjZU?=
 =?utf-8?B?OEpiWUxEOFNIU2RHTTd6QnFidHBXS1VZZkpNTWd6eFpCQ1VHTjNML0huY3Va?=
 =?utf-8?B?bVpMZ2ZjNVMrVEMzTzIwbUpBWldDdEJTTnJxSGFhUmJTUy93UHdHTHZ6aEMr?=
 =?utf-8?B?ZEtRUlJFTFllZ05ORkcxaTZldzVZTWRJbFYrRUhaSVRvb3FSZWpoSG1NKyt6?=
 =?utf-8?B?SmNkeW1teUxHWWtvZkVZa0c2cm52UUUzSVJ5MDBkS0swcHZJMlhtTVdiRlRX?=
 =?utf-8?B?UXpQTGgwQ3M1SGdWa2wrME9idml1aVN2TGxvYVd4ZDlNWEtyVzEwaUlGejJo?=
 =?utf-8?B?VFRaTXJIRExEcG9QajNUbmFQUkthK24vaWhoQlVTVG1TK0ZEaWpNOTNPZGNL?=
 =?utf-8?B?bU5RM1ZQNThKUk1VaU1sbThYLzRnM1hWUkZsK29DMzltaTRUa0tybjJJY3cy?=
 =?utf-8?B?MU4xUHpLbGRMcThlYjNCUS9zTzduYzU3b2REQWc2bXptYmRuZS9obWNOY1dT?=
 =?utf-8?B?eVhhQWYwWVFpRC9YLzRpWmUrZnV5b3dxMk5UWlh0VjV0U21UdWQ4aVVWb1JZ?=
 =?utf-8?B?M1ZYR3pzREhBbkVoTnBJVFN0MHhQck9uODYwSW9raXVRU0pnWnVBNS81K2Rr?=
 =?utf-8?B?Q1NIczNVbDc0R3lTQzZ2MngxeWNhZHdWcnhPZllzVkF0TjRXcHhycm5GMTRP?=
 =?utf-8?B?OTJoNU9KeDEzZVZKbWJyVFhHb0s3dlRRdHdZK2tGUXNQUmxXcVNxTy80MkJP?=
 =?utf-8?B?QS9jOERjcW0vQXRlcUM3ZzRyTnVPd1pXZDVlazd1TXhwa2N6YmNFUW9QZnRB?=
 =?utf-8?B?K2UxU1lwK3FsVmNCY1ZFM2FQL1labWtqWGVUZ1dvL1JxWXMxOUdUc0dEREx0?=
 =?utf-8?B?VC9uY0lFb0x4WEhCTlRXaHhpZkQyTVp6MlBqdXk1T0MweFcybTJoOXFUMkhB?=
 =?utf-8?B?WjY5Q1hTRHFpY2s2MWxlT3g4Z1pqYnBGUGhmQitMTmh0MzN0MHBJbFVwOUFm?=
 =?utf-8?B?a1FjTUhka3dMMWMzUXNBVWpETCt6SGxFbnFkeVpWMytXQ0RabFhmc3MyZ251?=
 =?utf-8?B?M2czYlBKUHBGaGgxb0ZUbExZZVVER21abTlTT1FBMzhLR05YVTRiRjlYay9p?=
 =?utf-8?B?Uzd1eDU3YnJEdWQrSzMxL1dXTHZlSVdVcVZMbnQ0VlB1VGFqa0xxNXlsaDI2?=
 =?utf-8?B?SFg5dm1tS01JQVp1NFdySUFCT1hkdnRCakpwMXRoS09KWFg5S3RMRDQ0S3lM?=
 =?utf-8?B?R1dWZXlwYzBGVEVBT2N4Vk5DbGh0ZDc0Mjlnd0Nqc080dW1OTkVPTWxPbkI5?=
 =?utf-8?B?c210NVNHNUYvR3QwZi93WWZ2Y0wzV1F2dmRDS1V5RHlibW8yTDZYWnd4cUN4?=
 =?utf-8?B?VXRlaDlpa0FoUEh5eDRSTWFNWlJIM1J6c0poNVRrK0VmL0o2U3IxYkpnMVlE?=
 =?utf-8?B?azlKblJ5QTJnZmM3dzNQTCszVVJwaHFIUGFyWFl5VGdZOUxUdjltSmhXN2Jn?=
 =?utf-8?Q?vgMT9yI1suEfye0j9fhIGipZM07lm64AHKQwrSN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b3BLcDBSNHFqVVdQOW14eUc1dUVsZU1tZzFMbVhrTzVLSHlsMmRGa1VpVVl2?=
 =?utf-8?B?ZitYZXIyMU9YRGFVSXU5bzh3Y1hvVXVQaW1zNkl4OGhCS2NPMGJ4ZVhULzdQ?=
 =?utf-8?B?ZXNDVlNJNEc3R28vR1pHcGFLdGg1SnhOQ3A1V0NHQnNUQUt6ZUtha0F3N2pD?=
 =?utf-8?B?VCtTelUrQjg2NmZBVjRabFd1ajJacXhnbHowbWlTcVFWT3FqN2FwRk12cVFP?=
 =?utf-8?B?ZDNnNHh2SGZvMXdDMjc1Mmc3b1JzY25SMlhNVlJUdm9YNFpPRkVENC9RY09r?=
 =?utf-8?B?VTFIZlZhWVVLd2JZVkh0c2ZoNmdoTHp2bTRIdkFFbkdXS2hoanh4eDRIUC9L?=
 =?utf-8?B?ZFA2d1pCWFFvZWdKazdzenZ0cVZnTUM0VGlLdU5FZEU4MDVxVkpKUGJFQTMy?=
 =?utf-8?B?UmVIM0ZKNDYvS292SXdISVBrdVpUMU5kTkJlMzdLWUF2MVhLOUJlY3lxdzZu?=
 =?utf-8?B?bGR4SU5CT3VDSnFFNnV5OVhBYzIzcWVyRGtqTDFmUFJwVGNXRUFRTmYveldY?=
 =?utf-8?B?UXlsVERLWHNxWmFWOGhYU1lld1ZUb09BRHBGdmVseVJ3SnRKNkZ4aUtPM3ZO?=
 =?utf-8?B?MkdrMEZlKzkyTkdzbDlEaER5V3RuQ2dwQkNpbUUySDlqVktKVkhmai9oRlRz?=
 =?utf-8?B?enRNWUZpaXB6WEwxZGxmWUUyZERFdmFGMHByU05sanBzY2c1MGYyU3ZKZ0wx?=
 =?utf-8?B?SCsrMU9MMUg5M1ovREY2cWRXZ1ptWU5IV1RzV3Z5SEU3Nk01dnN2d3lkNWNw?=
 =?utf-8?B?MFNpc0c0MC9zbHpyUzFLVG1XM3ZMR285aHFwTWs3QmJBMkg4Rjg1MitQbmRX?=
 =?utf-8?B?QmpYRFhNRUFrMjJWc0JCVENOMDB4V2RURjdCRG5wbk82MEExbHgvWW5QRXdh?=
 =?utf-8?B?eFJqcFMzREdBYVFDTVErNkVKZjB5WFVQNDI0Ny9obUVwQkcxUlFQeDdTUVhI?=
 =?utf-8?B?NVZHcTdwWWVjeTNhRncvVVNoTG0zTmpyMkQyOFhIZG1tZnlhb2ZPK3U3Y1pS?=
 =?utf-8?B?QjBMWTVvd2N3TGxzRjlOM3A2ZzVhN3ROb1loS2h0RllYY0YzY3V0VTRYUkpt?=
 =?utf-8?B?bHBobkwzNStaTWp2ejd5eVRhd0w1YVdCa1R0a3FHWit3SjFQTXdxZmFUR00z?=
 =?utf-8?B?VVU5YU9jTk1FR25CM1FHY01POFhiNEE3elRWcHdLYzdyRkdBVHJZNndTcmti?=
 =?utf-8?B?QVowSllaVHdIZ2taK0p1Q3RZWXFsaHhYazlNSjAwbk1oVGVlblY5VEJhdkM3?=
 =?utf-8?B?WS9QWVpETGJidmFhSEpPSzRuNHJubjA1a2huN0cvN0wwYXlxUzVhaFR4czAy?=
 =?utf-8?B?Vi83NXFIbFpsUG9SanZMVXRaZ1BMaFlXQnYvSjRneEhmbkQrdG5nWHhRUVdw?=
 =?utf-8?B?ckZZSDA5YjdHWU4xeGZDRlUvQ2tJcmt6TWJMS3BraXdrQXJ3MTg3eHkrVjFN?=
 =?utf-8?B?cTNjSHFOazZOb3g5RGlTK1JzRVBZWEVxWGRCdnFoL09OTW9yVGx1TWVnY0Ny?=
 =?utf-8?B?WlVLSy9yakdmV0R3TVc2cDJydnVDaVN0RjZCWVhNbVcrZWo3Y1pHQWxXeG1Q?=
 =?utf-8?B?ay9KQlFMSllBWXRmQlJYSFM3cllzQkJsbFFtYTRhZDZGd1BScVUvbm5JSXQr?=
 =?utf-8?B?cEVQQlRHajNFUjZkNmY5STNXNVdSWkpFUkFpUkhiSWFYVVlJRU9heFRyVWlM?=
 =?utf-8?B?N2ova0FwMDU3Yk52M3dtLzIyZ1hmT05kOGQrR2pqWmIwdWN0K2ZsdXpZZ2Yx?=
 =?utf-8?B?SGNEL3kxNTU0L2JwZGZoeUxTSzZ6QTcxMUxPKzV1Ujc5bXpwL01Jb3JYaEhI?=
 =?utf-8?B?WTYrSFJ4YTJISW5HWGlsc05sSklGUnRPVkpEK016S1l6SkNyNmliaTMyS0Ry?=
 =?utf-8?B?bzMzb2Vwcm9VaWJLSThMYjExYWZHcTNpYzNCaGM5TGkwTlFocmp0d1drYmFl?=
 =?utf-8?B?NVl0S0hmY0JleHpiNWprZnh0T1lWKy9wQVI2aTl1WXhQNEVFSEx5Y2dYVWU3?=
 =?utf-8?B?aHpxdmlpa2VUQS91Y2g4RUlpa0tNOVBDRElxc2dZdWs1NC9iSmxKRWJPeDZk?=
 =?utf-8?B?Y2RnUzZLOWJ2RVo3L05ZdFZRM3BGeDZBSWthQnIvY2VGcEZSRnU5Q3I2MGZn?=
 =?utf-8?B?dkcrNVdnSzhsNEhCbWwwSG5OdW4zNEkwTm9ZbU9QYlFLdXN2TXVnWVc4NmFW?=
 =?utf-8?B?c1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d78e9744-2c22-4f41-738c-08dd659acdf2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 21:29:31.2317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/Fwp/4Oa5wc5CTGv3aZpimBVLvYaYK82cHUJVuSQT09KKOkCdRtgkn5U9GXmik5FF9OahNQUuvteSmegNTIN8ccFcHsPCl8NvKU2e4/ung=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6894
X-Proofpoint-ORIG-GUID: EgO0tfN1AeXBARGxwHRaou7CkdhEVXCj
X-Proofpoint-GUID: Iojv8OeQ1Q3PBBPSEdqKPokkg5qB8egd
X-Authority-Analysis: v=2.4 cv=NY/m13D4 c=1 sm=1 tr=0 ts=67d8943f cx=c_pps a=bqH6H/OQt14Rv/FmpY1ebg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=U40Yx87jAAAA:8 a=a5LkSv8FAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=7d_E57ReAAAA:8 a=tBCTVLrgolpKgcY5pacA:9 a=QEXdDO2ut3YA:10 a=BBahhS0D0WQA:10 a=6NQArw8eiOICmtVZtyEA:9 a=P0RglhsncjOJt56O:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=ImwWUX5h3JJ3gRE9moBe:22 a=yv_D6YSC6K1Ih23S2Yuy:22 a=E2cWBXyb0kjxxB1PlMdk:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=jhqOcbufqs7Y1TYCrUUU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_09,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503170155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213125

--------------BJ2jGDjiN5w8Pbl6E023IKMQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for providing the version by version changelog; that's very 
helpful to reviewers.


On 2025-03-14 9:08 a.m., Bin Lan via lists.openembedded.org wrote:
> From: Bin Lan<bin.lan.cn@windriver.com>
>
> Refresh 0001-Make-manpages-multilib-identical.patch with
...
> Details about the 2.1.0 release:
> https://babeltrace.org/docs/release-notes/babeltrace-2.1.0-release-notes.html
>
> Signed-off-by: Bin Lan<bin.lan.cn@windriver.com>
> ---
>   ...001-Make-manpages-multilib-identical.patch |  12 +-
>   ...not-run-test-applications-from-.libs.patch |  28 ----
>   ...-fix-test-applications-in-cpp-common.patch | 129 ++++++++++++++++++
>   ...sts-set-the-correct-plugin-directory.patch |  30 ++++
>   .../lttng/babeltrace2/run-ptest               |   4 +-
>   ...eltrace2_2.0.6.bb => babeltrace2_2.1.0.bb} |  38 +++++-
>   6 files changed, 200 insertions(+), 41 deletions(-)
>   delete mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
>   create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
>   create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
>   rename meta/recipes-kernel/lttng/{babeltrace2_2.0.6.bb => babeltrace2_2.1.0.bb} (66%)
>
...
> diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
> similarity index 66%
> rename from meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
> rename to meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
> index 6a0052f779..bf9df2a32d 100644
> --- a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
> +++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
> @@ -2,17 +2,18 @@ SUMMARY = "Babeltrace2 - Trace Format Babel Tower"
>   DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
>   HOMEPAGE ="http://babeltrace.org/"
>   BUGTRACKER ="https://bugs.lttng.org/projects/babeltrace"
> -LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause"
> -LIC_FILES_CHKSUM ="file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
> +LICENSE = "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause & BSD-4-Clause & GPL-3.0-or-later & CC-BY-SA-4.0 & PSF-2.0"
> +LIC_FILES_CHKSUM ="file://LICENSE;md5=f6b015e4f388d6e78adb1b1f9a887d06"
>   
> -DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
> +DEPENDS = "glib-2.0 util-linux popt bison-native flex-native virtual/libiconv"
>   
> -SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0;protocol=https \
> +SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=https \
>              file://run-ptest \
> -file://0001-tests-do-not-run-test-applications-from-.libs.patch \
>              file://0001-Make-manpages-multilib-identical.patch \
> +file://0001-tests-fix-test-applications-in-cpp-common.patch \
> +file://0001-tests-set-the-correct-plugin-directory.patch \
>              "
> -SRCREV = "0a6632f77801f3218a288604c646f8a39cb0d2c4"
> +SRCREV = "e61d41ff3c3ac6a123930d4e60cf710ff9ea18e0"
>   UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
>   
>   S = "${WORKDIR}/git"
> @@ -32,6 +33,15 @@ LDFLAGS +="${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', '-fuse-ld 
> # coreutils since we need full mktemp RDEPENDS:${PN}-ptest += "bash gawk python3 make grep coreutils findutils"
> +RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-utf-16 glibc-gconv-utf-32"
> +
> +do_configure:append() {
> +    # when doing cross compile, the path ${B}/src/plugins/ctf/common/src/metadata/tsdl
> +    # is not created by the babeltrace2 build system. It is need when generating
> +    # parser.cpp by executing /bin/bash ../../git/config/ylwrap.
> +    # So make this directory after configuration.
> +    mkdir -p ${B}/src/plugins/ctf/common/src/metadata/tsdl
> +}
This works but would it make sense to send a patch upstream to get them 
to add the mkdir to their build steps?

Then later we can either update to 2.1.x or backport the commit and drop 
this extra step.


Thanks,

../Randy


-- 
# Randy MacLeod
# Wind River Linux

--------------BJ2jGDjiN5w8Pbl6E023IKMQ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Thanks for providing the version by
      version changelog; that's very helpful to reviewers.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2025-03-14 9:08 a.m., Bin Lan via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250314130840.84700-2-bin.lan.cn@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Bin Lan <a class="moz-txt-link-rfc2396E" href="mailto:bin.lan.cn@windriver.com">&lt;bin.lan.cn@windriver.com&gt;</a>

Refresh 0001-Make-manpages-multilib-identical.patch with</pre>
    </blockquote>
    ...<br>
    <blockquote type="cite" cite="mid:20250314130840.84700-2-bin.lan.cn@windriver.com">
      <pre wrap="" class="moz-quote-pre">Details about the 2.1.0 release:
<a class="moz-txt-link-freetext" href="https://babeltrace.org/docs/release-notes/babeltrace-2.1.0-release-notes.html">https://babeltrace.org/docs/release-notes/babeltrace-2.1.0-release-notes.html</a>

Signed-off-by: Bin Lan <a class="moz-txt-link-rfc2396E" href="mailto:bin.lan.cn@windriver.com">&lt;bin.lan.cn@windriver.com&gt;</a>
---
 ...001-Make-manpages-multilib-identical.patch |  12 +-
 ...not-run-test-applications-from-.libs.patch |  28 ----
 ...-fix-test-applications-in-cpp-common.patch | 129 ++++++++++++++++++
 ...sts-set-the-correct-plugin-directory.patch |  30 ++++
 .../lttng/babeltrace2/run-ptest               |   4 +-
 ...eltrace2_2.0.6.bb =&gt; babeltrace2_2.1.0.bb} |  38 +++++-
 6 files changed, 200 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
 rename meta/recipes-kernel/lttng/{babeltrace2_2.0.6.bb =&gt; babeltrace2_2.1.0.bb} (66%)

</pre>
    </blockquote>
    ...<br>
    <blockquote type="cite" cite="mid:20250314130840.84700-2-bin.lan.cn@windriver.com">
      <pre wrap="" class="moz-quote-pre">
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
similarity index 66%
rename from meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
rename to meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
index 6a0052f779..bf9df2a32d 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
@@ -2,17 +2,18 @@ SUMMARY = &quot;Babeltrace2 - Trace Format Babel Tower&quot;
 DESCRIPTION = &quot;Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log.&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://babeltrace.org/">&quot;http://babeltrace.org/&quot;</a>
 BUGTRACKER = <a class="moz-txt-link-rfc2396E" href="https://bugs.lttng.org/projects/babeltrace">&quot;https://bugs.lttng.org/projects/babeltrace&quot;</a>
-LICENSE = &quot;MIT &amp; GPL-2.0-only &amp; LGPL-2.1-only &amp; BSD-2-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e">&quot;file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e&quot;</a>
+LICENSE = &quot;MIT &amp; GPL-2.0-only &amp; LGPL-2.1-only &amp; BSD-2-Clause &amp; BSD-4-Clause &amp; GPL-3.0-or-later &amp; CC-BY-SA-4.0 &amp; PSF-2.0&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=f6b015e4f388d6e78adb1b1f9a887d06">&quot;file://LICENSE;md5=f6b015e4f388d6e78adb1b1f9a887d06&quot;</a>
 
-DEPENDS = &quot;glib-2.0 util-linux popt bison-native flex-native&quot;
+DEPENDS = &quot;glib-2.0 util-linux popt bison-native flex-native virtual/libiconv&quot;
 
-SRC_URI = &quot;git://git.efficios.com/babeltrace.git;branch=stable-2.0;protocol=https \
+SRC_URI = &quot;git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=https \
            <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
-           <a class="moz-txt-link-freetext" href="file://0001-tests-do-not-run-test-applications-from-.libs.patch">file://0001-tests-do-not-run-test-applications-from-.libs.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-Make-manpages-multilib-identical.patch">file://0001-Make-manpages-multilib-identical.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0001-tests-fix-test-applications-in-cpp-common.patch">file://0001-tests-fix-test-applications-in-cpp-common.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0001-tests-set-the-correct-plugin-directory.patch">file://0001-tests-set-the-correct-plugin-directory.patch</a> \
            &quot;
-SRCREV = &quot;0a6632f77801f3218a288604c646f8a39cb0d2c4&quot;
+SRCREV = &quot;e61d41ff3c3ac6a123930d4e60cf710ff9ea18e0&quot;
 UPSTREAM_CHECK_GITTAGREGEX = &quot;v(?P&lt;pver&gt;2(\.\d+)+)$&quot;
 
 S = &quot;${WORKDIR}/git&quot;
@@ -32,6 +33,15 @@ LDFLAGS += <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('DISTRO_FEATURES','ld-is-lldptest','-fuse-ld#coreutilssinceweneedfullmktempRDEPENDS:${PN}-ptest+=">&quot;${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', '-fuse-ld
 
 # coreutils since we need full mktemp
 RDEPENDS:${PN}-ptest += &quot;</a>bash gawk python3 make grep coreutils findutils&quot;
+RDEPENDS:${PN}-ptest:append:libc-glibc = &quot; glibc-gconv-utf-16 glibc-gconv-utf-32&quot;
+
+do_configure:append() {
+    # when doing cross compile, the path ${B}/src/plugins/ctf/common/src/metadata/tsdl
+    # is not created by the babeltrace2 build system. It is need when generating
+    # parser.cpp by executing /bin/bash ../../git/config/ylwrap.
+    # So make this directory after configuration.
+    mkdir -p ${B}/src/plugins/ctf/common/src/metadata/tsdl
+}</pre>
    </blockquote>
    This works but would it make sense to send a patch upstream to get
    them to add the mkdir to their build steps?&nbsp;
    <p>Then later we can either update to 2.1.x or backport the commit
      and drop this extra step.</p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------BJ2jGDjiN5w8Pbl6E023IKMQ--

