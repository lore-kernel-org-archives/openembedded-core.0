Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C25F1CC6B2A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 23:16:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27718.1792019759784579564
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 16:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VFTDvSYE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=474780c42a=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ELrWDj1065392
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 23:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=jqgE0zRBb1dO9wxSeo3IVCtPHXBSUflPe5tARRYB4bY=; b=
	VFTDvSYESKmar12V92Hy+hQNGTKeD9ryiQ+5NYNZG+8LtzWDHE4QqIcfk4QmVyQI
	9syM7I7PtEwIcajI8wUNK4gqktzAgeJ+CLFRLMLSiJSz7AHivF5OZ6HodD2Xgeb1
	vJ8ynZewsivheFbxLS/lpYzNXy0boiHxXynsDsYmiuM2VYbySKRzeQYo6JFKQXW6
	XauyEQIdo4MvBweimpxcgGirFUlzSy5QOEYksSf8xfSc3GczYen4ZMPV2g3CcFgG
	LdRIifP6jk7QfOT206fEvcxdU6rNFr6vMXGj9zIUqlcdU96bZNr1rb3MYXDef5+t
	+64SVT0v21Q7WhSvsQY8Vg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020098.outbound.protection.outlook.com [40.93.198.98])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hab52rvau-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 23:15:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzYiN41LSIzWq25CK75Q0ns6GSlJQs1prUEcX6yO9TtlWK2CjoEQPZ3k3LY2OW55k6Yvf2R1yW2V03A+Uq44QNgSiq4RhCYxl+T+iSnsq6DbZr+KcFUomX+mR07U7MOZxG+E7MPJaWgmDpnddlVJ+BaUAxx+TH8Bp5x9/mvx/2BOKsFC89qt+ibRzBaOAHhVKUKuxst1LHtYRO4VD4bl471bRDYWpUmHr83Bej+L3bx0lwCRvioKfrY2CgeHUNxpivr+Efc+v6zaRlodXkdg/q/nqXuZ1MDMnyQT76KWz2oDyU+gj77+6e1/ovhHH0zSFzUu5QBIInZCzTl+80/UlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqgE0zRBb1dO9wxSeo3IVCtPHXBSUflPe5tARRYB4bY=;
 b=tlDXNZcLxVhO++2ZAbOjg99LOvoQVQSFPKizc5RgePOwYuekFJhpEfwq85LV4LdJhrhYXMDiVqWgabJ0caG91e5BnsSZH/aup56vc3DUoqFrDBhcT50387N1lTmZKLaegs23PtR6Qbq0kRpxA6n2bWW5XBCkQ/DQw6loW+PXijDdggbe7HU1YvWlv42b+12ep8ZwvhevQbdHL6tC/sIflCddWimGcw9Wjq8Qv0y9YKCSJj9tT6p0pnb3udawHAhUeV2/PYhEhGaQVfB2AJWphF8wE6NEi6p+ljqbcQ2tHGhWS0CGkiMGNJHJsk22OfotO1lkOU4B4m2RcQ5QXNhb2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 CY8PR11MB7685.namprd11.prod.outlook.com (2603:10b6:930:73::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.12; Wed, 14 Oct 2026 23:15:56 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%3]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 23:15:56 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: kris.gavvala@windriver.com
Subject: [OE-core][wrynose][PATCH 2/2] nasm: fix CVE-2026-6068
Date: Wed, 14 Oct 2026 18:15:37 -0500
Message-ID: <20261014231537.1030409-2-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014231537.1030409-1-kris.gavvala@windriver.com>
References: <20261014231537.1030409-1-kris.gavvala@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0085.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::26) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|CY8PR11MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c2e2d8d-00ea-4a59-07de-08df2a4919a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|23010399003|6133799003|10067099003|18002099003|22082099003|260925021911599003|260925022911599003|12006099003|13003099007|260925021311599003|261009223027099003|11063799006|56012099006|261009221227099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	695wKH/sFiqmYfpTcNeUrFhpNTI5+DwQ+GdwPZolfbpHmTaK4ij943FhlsvQL4KlCSr02odD55yq8sQq7iCbjvphguOe8LbqL9cC2aFtzoa7ODOkhci9kn0dYKHjfoA1yCBr//57euIEJxytXxZCmFSuNbMQEIHmGxjJQC+C4YGaIcTHIes1QFGs22UhOrky8s126DSRqSFDNlPJ9EDnUntlHeJ20A3FfHMrHT6D3bDONkgfJrHSI2gIlnrIJd18uXYAaDVEIPsyyKG4dBfo16wX35lkHVkcXifIYKA9fDa7hrwTGqm7ImZMzxG4cgMgflUoEFZCi2GbYIP+JC12vadcGAJZ9sVW2EeAw+TrplPB9XNKVwnhudnrOBS2x8qqASrfhZ7MzoUI24lK3nB3vKViE29eYqwprFW2szrKcB90z1DcRQeTbQP+Gzaq132kPPpn3jsEyTKMz9LrpS4+nDPkc4T95NWkJl4Vz55f44zEYcXdPfiPiJcbxzc6v+3lXAL2L4sRqV20Rpu3J4czbOhQqaO9uIFmHihiSe3QphVGlYOjRdAEVReBcwuWh2wrRw0KtLJIGn4EX1MSHFfatCcyK3coVJb6o6nd50EFZy1e4VB1vrf8GwSkWMtAQbL8zkbVt4ao/nxjAuczWyBp4uRDQtKWZfkXNLawk1vTGK0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(23010399003)(6133799003)(10067099003)(18002099003)(22082099003)(260925021911599003)(260925022911599003)(12006099003)(13003099007)(260925021311599003)(261009223027099003)(11063799006)(56012099006)(261009221227099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NGFsUqIkZQMRam/I3nB53tCB6cSnjHBRFhUfhNgiVyu9f2OcJ9zRRP3O2m0V?=
 =?us-ascii?Q?2gm15hDswuq3m9aiv5ejv5ODiDD59O7spvxV2R5WaW8l3sXW8Oww1wfzj7q7?=
 =?us-ascii?Q?Nj8265T8F80ZFn4KIiSDCqwahxrQnakGEd49gwp5L0ewBRa/Lp1U9/Y7iMxX?=
 =?us-ascii?Q?pKHfzl8Pv74fXkosjXui/nvj7wkE8cQ8Sx7XeshtZ/1VgcUM5knXpu/AfYvw?=
 =?us-ascii?Q?186TaTEKhlxFREb5N4D7rFMhJAPA3I+4Ql1GsA+wmNy/rrNdHzmNdSFwK+Go?=
 =?us-ascii?Q?YaGKNtiRQ8BUngjeGf1fgfSZ4/n+G2AO63MoLes4qbfH6MjI4mKy9tbKD1eK?=
 =?us-ascii?Q?ceSnuW8lgQ/DELktfwHwM6wWbSFu7JPrMHcPtw6Tma3UvGkw/clYb35q/pTu?=
 =?us-ascii?Q?CiHClshwrNBpnQkpK0Kh+BuSvXEnqtqnGK/2QL/dIqxArwk89wJiKn22ke++?=
 =?us-ascii?Q?Y7MQ0s+NENnOMV7otEISaZprZvGPLMaeKFtcFRWgzZUAWHCvTIRxBbrrkKtJ?=
 =?us-ascii?Q?aYSBlfYsHholIYvPBLny9vvcVIfXhYWexbyCeiPfEvhUMO2M3erVNCy5qh7N?=
 =?us-ascii?Q?p2cCkqsbbnC5CkOuN8Wf79ynb2jFEWLbPFdcprf4jZeLq+BQCVNbl0b1Ri4Z?=
 =?us-ascii?Q?raTMbsHQT7VQAzJLKbAZyWoI2pWosiemx8h+LLOw0wxhgsNccQeqqDw+qWnZ?=
 =?us-ascii?Q?kuiM88C1dcUvB20phEuNsCxmV4q26VRyJ5dlzU3XSZL65/pVoizRpt8GpxDV?=
 =?us-ascii?Q?KU7SF2iRVDTQJG8dYgXP/WFHnsXNyA1DV01gQPi0lUNtmsFIi4DtYv3lQbrJ?=
 =?us-ascii?Q?NKaSs0j9GSuLGSb8mSQgh2HQ0UoygY8h8JxtC0UoENi61aLEdsOi9F+rpbZY?=
 =?us-ascii?Q?yHS1gntqJ0vOdQeKFZcFXR7++acPW/nYUB9ps0neaI+F4Q/XT8j4EPoRkChO?=
 =?us-ascii?Q?xLk5SPEtwMXoNMpGF0btgsnZ7Fnc6K1ToDTn99wTXFWlpbYqzTfDZ7hSCvF7?=
 =?us-ascii?Q?Oeu/kgjDb8epEY6vlrlM6xgtM+zOcF8DwRpOGazSxbBLgbf3Tt1vqnXtxkq6?=
 =?us-ascii?Q?8A4GF2phmbWteIhSc1Y6zcNiDvej7aS4PMkPBLrEnXALYHFltp8kRmr4tQY3?=
 =?us-ascii?Q?l9XjktgLIZ+665o3/Edf6RTeMAUB/5SdScVE0xdhattRiFLtgMUj4GJLKaS2?=
 =?us-ascii?Q?p9rf0KkouFXIRK4rijK+OqCkqNAzUtDvOpXJ7wO4bkJaxQAlwpyTP+Ddo+y8?=
 =?us-ascii?Q?qEG0ZPdOBOWyTBAD3A5fSLh8AXjD69t0+YcLJIhd8wZeec4ienxuMYFqNcCa?=
 =?us-ascii?Q?xu+hT+1OFlHHg7mYG6oyWvglc7gGbarvGiw+BzT6MBTXOwhGkiWerlzMHE8d?=
 =?us-ascii?Q?7zrBLjRTdm+BHKdBQjcY4NYzKfYaA1T8we4lzzZru6FL6OxVoImdbnAIJRVa?=
 =?us-ascii?Q?M9xz3HJtsLpTeOYHPzP+18keFkzrMJ232W95yXzoEGyifBW3yfH8c6s5Alhs?=
 =?us-ascii?Q?xeSUQ0o2n0uQDEHIfG+YXlxoHC6iasa+SAHZIE80tvQ5YJibf76WK45BfsxM?=
 =?us-ascii?Q?GwDMYEWMVI62F5h7JnWxGLnwgPtR7+XhSIK0WfzOnCcZjair2tO0M0Loj0bl?=
 =?us-ascii?Q?4DjSZ+wwqPYUHP4M5f5+UpmNccbhhgSrFnbB9D8P8w/uHN2HvSpLZaNV6ehs?=
 =?us-ascii?Q?8eoHbRbpFxigC+7hEyKLG88D/Hyu78UwGc9JoBcVLnzdRsNa4GFuCmdkEJVS?=
 =?us-ascii?Q?8GiQ1F9W/vil29X1B1c55TBvJssJY/Q=3D?=
X-Exchange-RoutingPolicyChecked: 
	3YqFY4g8Hpz313BL3CnqmSJDJvXLjVROCUm1YGeMO3NzZgPLQRChN8K8O6sctBZ7cN4pgUKIxozakFtgjcQBLgCBUwpdj60B0OuZNFZ/vr4aExyXZnGHWOhBx70ZsTiPnVkN6nC4sIIFHnuDRc5GqAxGuGSE0GrK0pnrwKEWSx0tJHfByvaLu41nbYDunhghrj4NxJhgIoc+EC4Fq10S5ABC5wf0Mf1BtptDGbRFMc8OKBf+S+ZdLknI8EU3U0J0ePY5lJSNejKR+WTNgUSMoG5GpOZv8VHuHPFvOHRbaRtFYAPdvfggiSZGSrkiXnPjXutSyBdgXHnZLvkTIpI/Cw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2e2d8d-00ea-4a59-07de-08df2a4919a5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 23:15:56.2089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7Q6VKgb2HE2LI3yDnUbw0jWNBWc8SxcJlXvjwvShyKigvmQ4kxI9ryf4zhVJdspMlLWDS81vb/DmzK1CHl7TfF2NYdzKH+daL5GPoLNDN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7685
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5MiBTYWx0ZWRfXyNytUWZNccq2
 OH2ZGc/b1jGT5lcbpimGrgebbjG16Q5dC4g/6gyzuH/GW2vjvUgWgixyPFtqkM6dkhWNM12LBuk
 L+ilpDsdmVEvwsqKYie3+7Ti76Spgv1uXwPh1HBrCTz6ZqPy/JuO34U2vBc8glvb7K/Bq5GV1nB
 WV+yByin84GJ705zoQpG+wVf8idkp8YAMhMOBmlYcGug9IGUFO1QjW6XdiOI2no7dLalyqiOU3z
 6y2k9Ux5s4Ls98OA8pXEfHZtK/czpAWl7wRo2GuCBDzNYY5nbrBRVXinkEB3kSY81pOt7PtO61R
 uNvvnMpiAGyxeQeE/M/Sy68eBuR7tFIdR+bnIkwaDM/2PCzaJJscsS4oFeyxVZi94r0mQAabNtn
 qjmf4pJ0QrG5IoCztMyomvXoAV3rfiROhk0ZM7jW1LXJvpLYD0zzqYwZP+u76bVDgG7N1tq9ZA4
 KbXGBJuG4vJ7joGkUYQ==
X-Proofpoint-GUID: 4TGed1Onf1omiDYAK-KbHV3ura9UKdx1
X-Proofpoint-ORIG-GUID: 4TGed1Onf1omiDYAK-KbHV3ura9UKdx1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5MiBTYWx0ZWRfXxDgMjHJwNPTx
 W2oq3SUPlHL86Czik3E/rWqlCuGA31lHT73E6RNAjlt9Ig5crBgDJ/qHXFd7+6M0owIYgSIjW3i
 tOL3Ju2jokM8a/wI4vWcnIO7MLm1DGJJPMQ+zWTckxGjbUJsiCdJ
X-Authority-Analysis: v=2.4 cv=Q6NHcI2a c=1 sm=1 tr=0 ts=6ad00d2e cx=c_pps
 a=5WG37Iiv9zZuKkK3l3Cj4Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=IGX8wMYuAAAA:8 a=t7CeM3EgAAAA:8 a=oGMlB6cnAAAA:8 a=2Ik8_l_yPAddq-O4d_gA:9
 a=MyEMWE6lpU7D9y2mAhno:22 a=FdTzh2GWekK77mhwV6Dw:22 a=NdAtdrkLVvyUPsUoGJp4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 23:16:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247796

- CVE-2026-6068-1.patch applies the upstream fix in [2],
  addressing the issue in [1].

- CVE-2026-6068-2.patch applies [3],
  adding helper functions used in [2].

- CVE-2026-6068-3.patch applies [4],
  which prevents the compilation warning:
  assignment discards 'const' qualifier

[1] https://github.com/netwide-assembler/nasm/issues/222
[2] https://github.com/netwide-assembler/nasm/commit/7bc82e7daf4cceb6a8af7ad2876485c9b4b01a56
[3] https://github.com/netwide-assembler/nasm/commit/44245e4684be1fac6c2fb7ac67dce8a55a574956
[4] https://github.com/netwide-assembler/nasm/commit/7b4e77dae29156a283d31fe707939ce21bf3eb3e

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
---
 .../nasm/nasm/CVE-2026-6068-1.patch           | 98 +++++++++++++++++++
 .../nasm/nasm/CVE-2026-6068-2.patch           | 80 +++++++++++++++
 .../nasm/nasm/CVE-2026-6068-3.patch           | 51 ++++++++++
 meta/recipes-devtools/nasm/nasm_3.01.bb       |  3 +
 4 files changed, 232 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6068-1.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6068-2.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6068-3.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-1.patch b/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-1.patch
new file mode 100644
index 0000000000..44f691610a
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-1.patch
@@ -0,0 +1,98 @@
+From e3a3fb40d21edb638f8191465574aaaaaacb336d Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin (Intel)" <hpa@zytor.com>
+Date: Fri, 26 Jun 2026 17:27:47 -0700
+Subject: [PATCH 2/3] asm/nasm.c: fix use-after-free for -M* options in -@
+ files
+
+-M* options in response files would hold on to a pointer to the new
+value, but in response files that is not a persistent buffer. Make
+sure to make a copy instead.
+
+This uses the new nasm_str[dup]to() helpers.
+
+(Note that calling nasm_free() on a NULL pointer is guaranteed safe.)
+
+CVE: CVE-2026-6068
+Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/7bc82e7daf4cceb6a8af7ad2876485c9b4b01a56]
+
+Reported-by: <BreakingBad6@github.com>
+Fixes: https://github.com/netwide-assembler/nasm/issues/222
+Fixes: CVE-2026-6068
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
+---
+ asm/nasm.c | 20 ++++++++++++--------
+ 1 file changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/asm/nasm.c b/asm/nasm.c
+index 49fa00eb7..98bde83cb 100644
+--- a/asm/nasm.c
++++ b/asm/nasm.c
+@@ -121,8 +121,8 @@ static unsigned int operating_mode;
+ /* Dependency flags */
+ static bool depend_emit_phony = false;
+ static bool depend_missing_ok = false;
+-static const char *depend_target = NULL;
+-static const char *depend_file = NULL;
++static char *depend_target = NULL;
++static char *depend_file = NULL;
+ struct strlist *depend_list;
+ 
+ static bool want_usage;
+@@ -709,6 +709,8 @@ int main(int argc, char **argv)
+     stdscan_cleanup();
+     src_free();
+     strlist_free(&include_path);
++    nasm_free(depend_file);
++    nasm_free(depend_target);
+ 
+     return terminate_after_phase;
+ }
+@@ -750,7 +752,8 @@ static void copy_filename(const char **dst, const char *src, const char *what)
+ }
+ 
+ /*
+- * Convert a string to a POSIX make-safe form
++ * Convert a string to a POSIX make-safe form; returns a newly allocated
++ * string.
+  */
+ static char *quote_for_pmake(const char *str)
+ {
+@@ -830,7 +833,8 @@ static char *quote_for_pmake(const char *str)
+ }
+ 
+ /*
+- * Convert a string to a Watcom make-safe form
++ * Convert a string to a Watcom make-safe form; returns a newly allocated
++ * string.
+  */
+ static char *quote_for_wmake(const char *str)
+ {
+@@ -1188,20 +1192,20 @@ static bool process_arg(char *p, char *q, int pass)
+                 case 'D':
+                     operating_mode |= OP_DEPEND;
+                     if (q && (q[0] != '-' || q[1] == '\0')) {
+-                        depend_file = q;
++                        nasm_strdupto(&depend_file, q);
+                         advance = true;
+                     }
+                     break;
+                 case 'F':
+-                    depend_file = q;
++                    nasm_strdupto(&depend_file, q);
+                     advance = true;
+                     break;
+                 case 'T':
+-                    depend_target = q;
++                    nasm_strdupto(&depend_target, q);
+                     advance = true;
+                     break;
+                 case 'Q':
+-                    depend_target = quote_for_make(q);
++                    nasm_strto(&depend_target, quote_for_make(q));
+                     advance = true;
+                     break;
+                 case 'W':
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-2.patch b/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-2.patch
new file mode 100644
index 0000000000..4b2334776a
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-2.patch
@@ -0,0 +1,80 @@
+From 4dfcfe9b333230788be7328e8fe943bda1610011 Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin (Intel)" <hpa@zytor.com>
+Date: Fri, 26 Jun 2026 17:25:23 -0700
+Subject: [PATCH 1/3] Add nasm_strdupto() and nasm_strto(), to replace a string
+ variable
+
+It is common enough that one wants to set a string pointer to a newly
+allocated string, freeing the old one if it is not NULL.
+
+Add specific helper functions for this.
+
+CVE: CVE-2026-6068
+Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/44245e4684be1fac6c2fb7ac67dce8a55a574956]
+
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
+---
+ include/nasmlib.h | 23 +++++++++++++++++++++++
+ nasmlib/alloc.c   | 11 +++++++++++
+ 2 files changed, 34 insertions(+)
+
+diff --git a/include/nasmlib.h b/include/nasmlib.h
+index ed4222b11..fae86d3cd 100644
+--- a/include/nasmlib.h
++++ b/include/nasmlib.h
+@@ -102,6 +102,29 @@ char * safe_alloc nasm_strndup(const char *, size_t);
+ char * safe_alloc nasm_strcat(const char *one, const char *two);
+ char * safe_alloc end_with_null nasm_strcatn(const char *one, ...);
+ 
++/*
++ * Replace a string in a string pointer variable with a nasm_strdup()
++ * copy of the argument on the right, freeing the contents of the
++ * previous contents of the variable if non-NULL.
++ *
++ * If *str is NULL, simply return the old value of *ptrp.
++ */
++char *nasm_strdupto(char **ptrp, const char *str);
++
++/*
++ * Similar, but the new pointer must already have been heap allocated
++ * by the creating function.
++ */
++static inline char *nasm_strto(char **ptrp, char *str)
++{
++    char *ptr = *ptrp;
++    if (!str)
++        return ptr;
++    if (ptr)
++        nasm_free(ptr);
++    return *ptrp = str;
++}
++
+ /*
+  * nasm_[v]asprintf() are variants of the semi-standard [v]asprintf()
+  * functions, except that we return the pointer instead of a count.
+diff --git a/nasmlib/alloc.c b/nasmlib/alloc.c
+index b77d48217..fa3e9e996 100644
+--- a/nasmlib/alloc.c
++++ b/nasmlib/alloc.c
+@@ -101,6 +101,17 @@ char *nasm_strndup(const char *s, size_t len)
+     return memcpy(p, s, len);
+ }
+ 
++char *nasm_strdupto(char **ptrp, const char *str)
++{
++    char *ptr = *ptrp;
++    if (str) {
++        if (ptr)
++            nasm_free(ptr);
++        *ptrp = ptr = nasm_strdup(str);
++    }
++    return ptr;
++}
++
+ char *nasm_strcat(const char *one, const char *two)
+ {
+     char *rslt;
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-3.patch b/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-3.patch
new file mode 100644
index 0000000000..b25a6de583
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-3.patch
@@ -0,0 +1,51 @@
+From db6cbdf6244ddb729b7c6331f62f42334bc00550 Mon Sep 17 00:00:00 2001
+From: Kris Gavvala <kris.gavvala@windriver.com>
+Date: Wed, 23 Sep 2026 00:57:12 -0500
+Subject: [PATCH] Drop const return type of filename_set_extension()
+
+filename_set_extension() always returns a newly allocated string
+buffer, drop the "const" from the return type.
+
+CVE: CVE-2026-6068
+Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/7b4e77dae2]
+
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
+---
+ include/nasmlib.h  | 5 +++--
+ nasmlib/filename.c | 2 +-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/include/nasmlib.h b/include/nasmlib.h
+index 494d7842e..2771c5951 100644
+--- a/include/nasmlib.h
++++ b/include/nasmlib.h
+@@ -366,9 +366,10 @@ struct debug_prefix_list {
+ extern struct debug_prefix_list *debug_prefixes;
+ 
+ /*
+- * Add/replace or remove an extension to the end of a filename
++ * Add/replace or remove an extension to the end of a filename;
++ * returns a newly allocated buffer with the modified filename.
+  */
+-const char *filename_set_extension(const char *inname, const char *extension);
++char *filename_set_extension(const char *inname, const char *extension);
+ char *filename_debug_remap(char *dest, char const *inname, size_t len);
+ 
+ /*
+diff --git a/nasmlib/filename.c b/nasmlib/filename.c
+index 0e27f69e2..85c42a21c 100644
+--- a/nasmlib/filename.c
++++ b/nasmlib/filename.c
+@@ -16,7 +16,7 @@ struct debug_prefix_list *debug_prefixes = NULL;
+  * field at the very end of the filename.  Returns a newly allocated
+  * string buffer.
+  */
+-const char *filename_set_extension(const char *inname, const char *extension)
++char *filename_set_extension(const char *inname, const char *extension)
+ {
+     const char *q = inname;
+     char *p;
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/nasm/nasm_3.01.bb b/meta/recipes-devtools/nasm/nasm_3.01.bb
index e8079732d4..186ae57ce4 100644
--- a/meta/recipes-devtools/nasm/nasm_3.01.bb
+++ b/meta/recipes-devtools/nasm/nasm_3.01.bb
@@ -10,6 +10,9 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0002-Add-debug-prefix-map-option.patch \
            file://0001-compiler.h-Backport-C23-support.patch \
            file://CVE-2026-6067.patch \
+           file://CVE-2026-6068-1.patch \
+           file://CVE-2026-6068-2.patch \
+           file://CVE-2026-6068-3.patch \
            "
 
 SRC_URI[sha256sum] = "7a7b1ff3b0eef3247862f2fbe4ca605ccef770545d7af7979eba84a9d045c0b1"
-- 
2.43.0


