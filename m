Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45021C3DA49
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 02:17:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.29085.1721009869005336607
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 19:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7926e8233b=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46F1h4O5032691
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 02:17:48 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40bgj619qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 02:17:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7Es+O0UY+bLMmFUNTcdXxvHVihZKssE/MERx3VG/TsW1BkWA+51T5T7A0HbFVfEE9Deu6lEz+0LK/hesOOwVP5QyuruTc2/t9NhtIYq0IMwTmGQTMHAbA2OP7aYI0vytX250z2Dj2cFYF8wDrDkB7HXuRywc2UUpGIyuqnIwo0C7UGRSGZ3PE+GzsWQkPFqJv1XJ8RyRWzT++nLrxtdAy+ovrwdfGdwcuZBtrfY0NrFzvHfs3QNLTrIMKYGWwfmfweJA/KJLnIVNIRPVtAoeyXIrIqCDyCQ/zOOi/9pJ/uTpyp3DKY+oiFbHcsS2JsVoeonZ9RTMNi8If5+Wc0aWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWia/m6G9pRhbLlAqZORORbjXJXCRZ4hWfY01vi2NUw=;
 b=MGAUHm761U+dnj7C0UcbdlD3hZ0s+18V4L5s8p+5KUc41faGzZZr5xjbVUNtOdLEKuhjP/eWp+4/o63vNFfMro60v9E06+vzXplnPg2ik1TcEwS3EWSxQ5x1W1lzn2lldqUwvp4IeKg2O7Dq0Nj0JFIKQb9U0Yp+JsooEKe6WAi7hPPaAmuLe5jSjDV+6QMYRQlaWpim9EofAFeiw196peTPWkFC4JdRY77zUCz7qiIxa5XFYEP7r3/Fe7r/cD8gQ5LMjOGl//bvF+qaVr4CNQXAD+mVDQJWevlFWGpGnxbWU5drk2+xZdGbWYvZX/nRb2zXGNPfhytYNG0OTjLpsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB7297.namprd11.prod.outlook.com (2603:10b6:610:140::19)
 by PH7PR11MB6652.namprd11.prod.outlook.com (2603:10b6:510:1aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.25; Mon, 15 Jul
 2024 02:17:33 +0000
Received: from CH3PR11MB7297.namprd11.prod.outlook.com
 ([fe80::9196:38bd:6b0:2d0b]) by CH3PR11MB7297.namprd11.prod.outlook.com
 ([fe80::9196:38bd:6b0:2d0b%3]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 02:17:32 +0000
Content-Type: multipart/alternative;
 boundary="------------j0VsFqAYfGOMswYS8YI6ys0f"
Message-ID: <622371eb-1706-4bf2-8c8d-a6d810ef31d0@windriver.com>
Date: Mon, 15 Jul 2024 10:17:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][master][PATCH 1/2] apt-native: don't let
 dpkg overwrite files by default
To: openembedded-core@lists.openembedded.org
References: <20240618033019.1181198-1-changqing.li@windriver.com>
 <17D9FBA631EBE6C1.1999@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <17D9FBA631EBE6C1.1999@lists.openembedded.org>
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To CH3PR11MB7297.namprd11.prod.outlook.com
 (2603:10b6:610:140::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7297:EE_|PH7PR11MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: 5338767d-33e8-4b57-1863-08dca47448d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|4022899009|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bmkxL3RoWUpkRVA2cmNhK0NSOUltV1dldFhMZElPWWlWZ3BDOXFDQUNCQXM3?=
 =?utf-8?B?alA1WmNGaS9ZRGxuQnpzQ1lya2VSQWdjeFA3aWZ0dU11dGJ2V0R5K2xXbWV3?=
 =?utf-8?B?cXBDTE9GS25vaW1qZHltd1dxNFVoOFNXb25tRG9SakRJUll0bFoxTlZPbUhN?=
 =?utf-8?B?TFViSVFWU252ZEFMNUNZRFlIcDNGM2E4Z204RGdUVi9zRFB0ZU1iY0E3KzND?=
 =?utf-8?B?S1FnaVNsY2t4UHcrckl6S1JtMks2Y2VYU3lGOTVqWThHMTY0aS83bjAwZmww?=
 =?utf-8?B?dGpuUjJ5Zkl4YlJUQUpiR2JpRXB3Q3ZJY1BhU25hRmlFZllWUkRNUnc1Z1Vw?=
 =?utf-8?B?R3BGS2E2d3BueGllMTdieW9ycnRPRXBHMG9vOGUzRitMSXBuWGs0UDVmY21y?=
 =?utf-8?B?TmxCc3k0dCt1UTNsSTlyaUJqakJjTjJPTmhFak1pS2duL05aM1YvYUpIcDhJ?=
 =?utf-8?B?cVl1VktJRDVYT3NEREluQThPY0pDRW95NXkwUmR6Q01uZTR4akVvSmVwMDFH?=
 =?utf-8?B?QzIyL3hOM29ZL2lERlMzSmxFcVIzcFNZN2hOQ2hXVDdzeXlZVHdFdGNZVG9S?=
 =?utf-8?B?WE1IRjJmNndJYVl5aG5BWnRKakZnY2YwaFFsak1kZGFReEMyMThNdWdJKzVC?=
 =?utf-8?B?NXhsRDBLRVl3WGwwaUQ5NVNVd2ErMXhEdFhneGtveGV3Q1NoamtXZmU4RzZN?=
 =?utf-8?B?RVE2MDlKRVZjY2w5QWhsZ0s2THkySmhDTUN0c2lQS2x4dzgwb0YvZDdxZWV4?=
 =?utf-8?B?KzZ6bUIxeGxDMGszVjhzdEVlYVJCUDNJK3dreURkVEtCNXBTWUN0NkpYdW05?=
 =?utf-8?B?UlNCME11R1h6bFlRSTFrd1FoUnVaNU9pTHNEUFdJcmF0Q1NsVU5NZmZla0Rl?=
 =?utf-8?B?cnRVcG9JZjBqNFFUUUllTVdJNjhtVWRhRHdPUTNtMWdUeXpkMHNnMC9DSkVx?=
 =?utf-8?B?NGlOZmY5RUdwcUQ5SmNobWlXTkRwVlR0eXYvUEFzQyttem05cDZOY2ZEUXYx?=
 =?utf-8?B?TVR6eVBFL016YXFmWjVEdlMrQ2w2ZlpjRTkxMEdGWFhHbWF1NDB3cHloZ01W?=
 =?utf-8?B?YWFTZFFudXlTcGNsVFhjazREUUppRGJnZzBtVmFYZGtOdXIvem4xY2xRWW01?=
 =?utf-8?B?U2pYU2xLdVF5aER3WUpWZUhlb0V3ajJzVTJCK0NhSzUxMGhSL2RzWVA2eUhE?=
 =?utf-8?B?VjNVek9PWVVCdDhRcERyMXJOcjIyTVp4YTJhRDNsU0lIcTVQbEJTREttcTky?=
 =?utf-8?B?NGJzWnJVelFHbzNCV0lyVnFPakRRQ0lnaG9Wd28xR08vZlNyaGlwdS9wT0Yx?=
 =?utf-8?B?RnZra3BDTFN6WDlMUy9FZVdzN042K2pFNzRNZDdZTEwvbm9uVzI4dkpHTUQ4?=
 =?utf-8?B?ck81TEhDUGMxc1BnNGFvUm81bDF5aTZyUzR0cUJDRk1NQ2RtcWh0MVRDeFVD?=
 =?utf-8?B?Z01heWVlM0drd2VyeEVJMDlOeGlBc1VTUWNrelphWCtmT0lyOE9KWmM1WVEz?=
 =?utf-8?B?bURaQnBYWUllTysvdFV1OFNGZWhWTEw5WG1SMENuRzlFTjVHN2R6S2JWeVR3?=
 =?utf-8?B?clBnd3RJRWFWaUVrbS9WRFRmYlRJVzdMZ3NyN3lINzNQb2RBQWJwRmV4aDY0?=
 =?utf-8?B?anJOZkhINmh6N2svVUk3Z0o5RUI5emd0c1dqRWpzaVN5Qnc0dXZhek5sandm?=
 =?utf-8?B?enJ3TmVUd0JuUXMyTXh4dkdXOUpjbys1M1FsTzVaNCtsODJDTDIvVkZWRURm?=
 =?utf-8?Q?qsOwMayIVC7ezBwC5FDhlUbtOghC0+LLMuyLFkp?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7297.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZWdTVVZ5Q0NTYTVtejloMVU4dUlzL0ozVisvY0xYdFY0WmxvUk1JR1ZBek04?=
 =?utf-8?B?R0ZoR295eEhWS3JVdTkvMXBVV05JeHN0NVN0Y1cxWnFza1NLeU16VVBpVmJH?=
 =?utf-8?B?L01LVlZFdHAxemRpMmxZd1pydStDTVFrcXRkVWJzeWxIVC9tUXhEYm85Uysz?=
 =?utf-8?B?elk2SGY5NlorZnZyaUJlODdZc0Y1ZWlRcWpibGp5M1VqU2gzcXRDQXdzVStZ?=
 =?utf-8?B?NnZMNGZRNnlHVUZSbjIrR21aL3RkZUNsNVpRaDZGdWd3VkVtd0xkZHFUcFZo?=
 =?utf-8?B?R1BlTU04dWc0d2hzS3pmamNzMURhWXowbTNsUWp6L0V3V3Mra3NId0x5Qlgr?=
 =?utf-8?B?VWc4ZzBDcGM5S1JNMVozMlFOWWlCZmRVUHJUU3JnL0JDcUg5d09kdmdQUlZT?=
 =?utf-8?B?SXJlYy9uZzE5RFNCMUFFUFdSZWcwSWMvNUo4NWlxV3p4WnMwbmRQdUtEUHJU?=
 =?utf-8?B?azZuWStNbTR5NnBMQTJsY0RQT0JVMmZTZElhdFRIazVrYUFCditIekpRakFh?=
 =?utf-8?B?Y1FwWEIrZU5nSVZBKzY2VDFmakxJWXFMYWlWMDNSd24xS3FZOGYrMUZrTThx?=
 =?utf-8?B?OVZyRWVxS3VxZjdVNXVWN0hVV2g3d2RxZGtzTEY5Wkx2SVdVY3o5U29EeVls?=
 =?utf-8?B?UGtLdlBpY2YxNFlEZmVoeUcreEttZGIwV0o1cVgxM3JEazFrcVVNMlcvaUMv?=
 =?utf-8?B?bU9SaDhNcDI0SnViWmN4R3p4MzZMZUc1d1dDb0dZZnlmN3ZrcHZtaTF1cWYr?=
 =?utf-8?B?bEZkZUZrK3JvemFhSnVpaVJRMFYxS3UybERBVzZmbjVyakNibTltUTU0ZUZm?=
 =?utf-8?B?RXNLVytZd0NXY3FJV0dzakhlSkQySklOaTdMSGlNMm91M2Y2OStQK2xrTnNV?=
 =?utf-8?B?eFZ5aXlwakpYTDArbDhyekpUQUpxZmJURldQaVJNSFZzYVJvKzh5U2FaTENH?=
 =?utf-8?B?NnhuVFVVK1NEZCtzUURudTV5YTJleTdqbDg2QzVWUFBZQXpSSXN4aFgwNXkz?=
 =?utf-8?B?VzVLU0ZEUVNSdEdHaGVkaUNOR3FCMEJqbFBBR0ZQZm5IWnNkQmtVVFlqdUo4?=
 =?utf-8?B?REdkVTNaSWVJY3pGYXRqc0xpZzZ0aVplakhTTTZEQXlueHFUWURYdVc5Zjcz?=
 =?utf-8?B?S0dWYkptL0c2dHlWOHJHd2RiR3BrL2pEUk00YWpETmN3S1dISFJnbS9SZDBr?=
 =?utf-8?B?aSsvYjllajFBakNxKzRTMWl2Nnk3TWg1c2hwbHFKakdUUFA4NGdPMU1KOW40?=
 =?utf-8?B?am9iU0VVdXVTZWhpeTFkMzQ1T093b3RMbnBtQ2VMcEdtNDN2MEkxeGZheVo3?=
 =?utf-8?B?WklTWVI4dk5zVGZOVXp5anNBZndVSEpCM2x1b01SQndUQzkydFVITC8vNnN4?=
 =?utf-8?B?L2pkNUJDYTNOMm1pZndwZFpNd3VWdjkwZTk4UWJuTDdEWG1GbDEvWW1BVldr?=
 =?utf-8?B?dGRLNm03ZDJzRXNYR3FJQkZqcEVMVTFldFU3cVZoN3RNdXoxOUpJNVM3QnlW?=
 =?utf-8?B?ZFJTQm41dTdUalFOenRsLzJsQzY1YlBxSE1IR0NCZ3VNTnluVTJwZC8wWVlK?=
 =?utf-8?B?Umtha29Zd2l5VmZGS1QyRGc0U09VMG8zcFl3U2ZrWTNjejI3ZHVwaGhhdjNY?=
 =?utf-8?B?aHN5S3ZXSWpPM1pRZ3dWalRseVBZMnUrL2N0Nnp4NStFQkIzQ2xVekltUjBv?=
 =?utf-8?B?OFRRcUoyQ2NadUFNb3cwdjZGK1pQQm1ScFhid0xqZE11K1UwU3R0R1ZDQklC?=
 =?utf-8?B?Yi9OdWR1dXBWOFEzblZpWXVTQitTM21zL0FxS0ljZEZIVG5UZjRjd2ZFeks3?=
 =?utf-8?B?K2FRTS96U1U5QjJ6cEM4NDVjS1ErZ0lBdFVnTTJ1MWoxWWFGMEx1OTVhSXlh?=
 =?utf-8?B?a2hFQ1lXSjMrSGk4UFZGenZRWm9JdFpSZnp4ZFpoWldxbFNRM3NMQ05mZ2R0?=
 =?utf-8?B?YlA0OVQ3TnNYR2NielRNS0Z1QTdtVDlLQlpiNHV5Vml1OERneG94SmxSMDBL?=
 =?utf-8?B?L2NJTEJVdjJVaGU3d25yTlFDZXROSncramptNE5EQjFFbDd3L1p4aWRwblJQ?=
 =?utf-8?B?azhINm1kSFo0Nm9TY2VlaStPaHJvNFV1MlVTSVg5aGs3VnhCRk03Qk45WjhD?=
 =?utf-8?B?eHpSd1E1clRZSE85cW5mM3k2UnJPV2hHSlZ2blphdkhLVlQ0Sk16czcwNUli?=
 =?utf-8?B?cWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5338767d-33e8-4b57-1863-08dca47448d0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7297.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 02:17:32.7575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVzBxSkwc9ycliXPTSNsS7F8Aye9NMOXF0+A/046NJG04DQE67q8786qwXe+AXTOxRyaxkUwq+BwxBRsM4TAVxHurStxOgYQOnNSQeyBkME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6652
X-Proofpoint-GUID: eAcNoc8T_Y2h48ZZWjiWNGETZje67PXP
X-Proofpoint-ORIG-GUID: eAcNoc8T_Y2h48ZZWjiWNGETZje67PXP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-14_19,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 mlxlogscore=860 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407150017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 02:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201897

--------------j0VsFqAYfGOMswYS8YI6ys0f
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46F1h4O5032691


On 6/18/24 11:30, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> With --force-overwrite (implied by --force-all), dpkg will not abort
> when a package overwrites files from different packages. As this can
> also lead to "The following package disappeared from your system as
> all files have been overwritten by other packages: <package>" and
> subsequently broken dependencies, this makes the simple case of
> conflicting files hard to debug.
>
> Instead of finding all possibly required force options, only disable
> overwrite for now.
>
> Signed-off-by: Jan Luebbe<jlu@pengutronix.de>
> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
>
> Take back fromhttps://git.openembedded.org/openembedded-core/commit/?id=
=3D4292387ef6c4e80428bad6a07c844a288b27d9a1

Ping

This patch is dropped in this commit=20
https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster&id=3Df0=
58272de9cba188d96940c8c921cf31727fe4d1

and there is no specific reason to drop it, and the --force-all do have=20
a risk causes following warning and=C2=A0 subsequently broken dependencie=
s.=20
so take this patch back.

"The following package disappeared from your system as
all files have been overwritten by other packages: <package>"

Regards
Changqing

> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   meta/recipes-devtools/apt/apt_2.6.1.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devt=
ools/apt/apt_2.6.1.bb
> index 68bd7c5407..26a6d99f84 100644
> --- a/meta/recipes-devtools/apt/apt_2.6.1.bb
> +++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
> @@ -111,7 +111,7 @@ Acquire
>     AllowInsecureRepositories "true";
>   };
>  =20
> -DPkg::Options {"--root=3D#ROOTFS#";"--admindir=3D#ROOTFS#/var/lib/dpkg=
";"--force-all";"--no-debsig"};
> +DPkg::Options {"--root=3D#ROOTFS#";"--admindir=3D#ROOTFS#/var/lib/dpkg=
";"--force-all";"--no-force-overwrite";"--no-debsig"};
>   DPkg::Path "";
>   EOF
>   }
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200854):https://lists.openembedded.org/g/openembedd=
ed-core/message/200854
> Mute This Topic:https://lists.openembedded.org/mt/106734920/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------j0VsFqAYfGOMswYS8YI6ys0f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/18/24 11:30, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:17D9FBA631EBE6C1.1999@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

With --force-overwrite (implied by --force-all), dpkg will not abort
when a package overwrites files from different packages. As this can
also lead to &quot;The following package disappeared from your system as
all files have been overwritten by other packages: &lt;package&gt;&quot; and
subsequently broken dependencies, this makes the simple case of
conflicting files hard to debug.

Instead of finding all possibly required force options, only disable
overwrite for now.

Signed-off-by: Jan Luebbe <a class="moz-txt-link-rfc2396E" href="mailto:jlu@pengutronix.de">&lt;jlu@pengutronix.de&gt;</a>
Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>

Take back from <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=4292387ef6c4e80428bad6a07c844a288b27d9a1">https://git.openembedded.org/openembedded-core/commit/?id=4292387ef6c4e80428bad6a07c844a288b27d9a1</a></pre>
    </blockquote>
    <p>Ping</p>
    <p>This patch is dropped in this commit
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?h=master&amp;id=f058272de9cba188d96940c8c921cf31727fe4d1">https://git.openembedded.org/openembedded-core/commit/?h=master&amp;id=f058272de9cba188d96940c8c921cf31727fe4d1</a></p>
    <p>and there is no specific reason to drop it, and the --force-all
      do have a risk causes following warning and&nbsp; s<span style="white-space: pre-wrap">ubsequently broken dependencies.  so take this patch back.</span></p>
    <pre class="moz-quote-pre" wrap="">&quot;The following package disappeared from your system as
all files have been overwritten by other packages: &lt;package&gt;&quot; 

Regards
Changqing

</pre>
    <blockquote type="cite" cite="mid:17D9FBA631EBE6C1.1999@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">
Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/recipes-devtools/apt/apt_2.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtools/apt/apt_2.6.1.bb
index 68bd7c5407..26a6d99f84 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
@@ -111,7 +111,7 @@ Acquire
   AllowInsecureRepositories &quot;true&quot;;
 };
 
-DPkg::Options {&quot;--root=#ROOTFS#&quot;;&quot;--admindir=#ROOTFS#/var/lib/dpkg&quot;;&quot;--force-all&quot;;&quot;--no-debsig&quot;};
+DPkg::Options {&quot;--root=#ROOTFS#&quot;;&quot;--admindir=#ROOTFS#/var/lib/dpkg&quot;;&quot;--force-all&quot;;&quot;--no-force-overwrite&quot;;&quot;--no-debsig&quot;};
 DPkg::Path &quot;&quot;;
 EOF
 }
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#200854): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/200854">https://lists.openembedded.org/g/openembedded-core/message/200854</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/106734920/3616873">https://lists.openembedded.org/mt/106734920/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------j0VsFqAYfGOMswYS8YI6ys0f--

