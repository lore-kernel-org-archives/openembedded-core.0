Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307F0C35FF1
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 06:37:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1887.1742366232200782024
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 23:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51732a5c16=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J5bGqn013417
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 23:37:11 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45eprr9y60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 23:37:11 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52J6bAiS002485
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 23:37:10 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2047.outbound.protection.outlook.com [104.47.58.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45eprr9y5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 23:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XrOqLk4J2YluiselKDq2ehpgiCNi6ta5jEwoVF7uS2lQ4nhA6AQNN49RkEUAVjW3kEtLt4h7hUTw/FHvNM555YQDBY/SSLG/FGkldDfP3D2X+XzXfW7vechDl6sWqXpaGJSltmOGhRaLHderJttXJUKIpiUkf98p8IWHWVqFeSocM+2O7SAzrd/iAPE+cxJomJeYDwuTM88et04E4bzTytCVxSsWJAz5hQDHgQ2KKPUmvJCDx5OCR4wk1Ei4zEkVwQr50OBCao9KYIdgisf02mjjA2NlXwIYpjRyLF2feNB+3uqy0aRoj5WuId+UKmZc4u3JhwgWwkgmk8JAhBxakg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qke2SQw+ezKUQn3v5td4wfowdZ983FJY+I38aHpvl5g=;
 b=LR+tHHOcF63JWVpzwXS2txUidYMlCqKA57lzsomNqgUreqwilAFLxWtnyOHXFWM1qAxZAvQSiYVQ+XH0aO3DAd1PsDzE6s6XsuHH9tar2VZ23dHdgUPZDe3BLABq3To+Pq3WDUwXltVAsRCDJsVsPmF/ze3tMRbgghHkIH1TA0TCcAyy494T7YCuuO8wAy+7e/QfXhVNzvGkEEQI8MPCGBlF2Qzl1HIbPrCjSqOa1HcEL3J4fgS0g8F8X3ErpXS2q1z55DS/jdjp4eNFxtjOejZs3z0BnNyFp8ngg7WBIsR5jorN8O8VIwGDCBgw6xIRmneCLce+PNrpx2ZtTq02sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by BL3PR11MB6313.namprd11.prod.outlook.com (2603:10b6:208:3b0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 06:37:08 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8511.026; Wed, 19 Mar 2025
 06:37:08 +0000
Content-Type: multipart/alternative;
 boundary="------------ZzS7VK1ifwQqmWXnxdO09Ynb"
Message-ID: <6bb26157-a8f6-437f-8b02-3352be8ba006@windriver.com>
Date: Wed, 19 Mar 2025 14:37:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] systemd: check SERIAL_CONSOLES for
 serial-getty-generator PACKAGECONFIG
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250313052729.1809525-1-Qi.Chen@windriver.com>
 <1F0B1D07-29C5-47BE-BA11-A49EA1022B82@arm.com>
 <182DC6E67082CC9D.9747@lists.openembedded.org>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <182DC6E67082CC9D.9747@lists.openembedded.org>
X-ClientProxiedBy: TYCP286CA0310.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::7) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|BL3PR11MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: db16bcd5-813b-4aa3-c5f3-08dd66b07871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|8096899003|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?clFJUTNCMkc4bG15L2Q3bWFWS2RSdk16VWJudDJoYXpBTWFsU3pURVFCaWIv?=
 =?utf-8?B?UlhpNW1qRFV4K0hxQzV1T29uMTJQeElqTEJBaTZROEJQUjZ0dVowcUN0Mk90?=
 =?utf-8?B?bHNWYlpMRWZSZVpFNVV5UUFGeFdJZ0lBYmE4VS80MDJFU2gxRnFpVzFldUli?=
 =?utf-8?B?blZMYkNzR3dhUlVUd0hoODk3OFdwVXNOMS95d21PZ2J2cndORmpFNU5ONm5C?=
 =?utf-8?B?NWxkWHYvekxqTjhpSk9pMmEvUTBFcGtkOUI2b1JXblNVTU14TlZoS3p6dFRZ?=
 =?utf-8?B?RDJrZ3ZDbGYwY05oM1kwZUc3amZvSXBpdWN2T0c1VW04SlBvaVRjckJObEVJ?=
 =?utf-8?B?T2trTjR6dFpjcGtHWU9sMFhWRTZmMzJVSDFPblI2bkVBdjg5bnMvczN3NGhz?=
 =?utf-8?B?cENJL3BEeEdtQmxUOVQ1a3g3VHhNSVVPSzZhQ2pacnRHR1ZtWm5GbXU3THdU?=
 =?utf-8?B?QUpiVTIzbHF4eFRuMjZuYnRQWmlmeFp2b3BUbkgxRDVxeGNYTFhpZFNBTlpw?=
 =?utf-8?B?S1Y4ZEJ4TTk5WEcvdWxVSDFvZi9uZlVkNlBxaFd2Q040aG15Y0pxVHlOZmpj?=
 =?utf-8?B?YU1COVF5K0hXSWc1aUFvaXhIaS83NHdJZ3g2cDBHV21IcytRM2s1TUFkSDhC?=
 =?utf-8?B?bUhLV2FZa29LeE9JRjJsSlZPWGUzV002RlZ6enl3WnROZG1tcFN1ckdOcXhu?=
 =?utf-8?B?N2c0bEtNUmVMYWJwNnVJT2NtOG5POENoVU5Lak92MHg2c0tEQ0E3cnV0UVV5?=
 =?utf-8?B?cHFvd00xTGJpdElRdk9CSGlhK0tUM2FXcXZXVlJET1RGeUZEcE5RbDI0UWxQ?=
 =?utf-8?B?WHBLcG1pb2pmSHd6cmtyVEZzYWxWRjNkRDBLT082SEpCcVlEQUt0RjNNb0lJ?=
 =?utf-8?B?VlZIY1h1a3JWb1ltYXR4SGZqNzQvcnA0dm1IdnduYU1yZlZyTmNQbGQ5d01S?=
 =?utf-8?B?eVZscTVKS3R5UWRXQi85V01RTUdRay95UFNPQlVpMlBRaStGb1BQUW1kWkY2?=
 =?utf-8?B?WWJ2SEF2a1JQQnhQRGlaelZlcjRMNmQvVnNYa3dyTmRWTVBLNWhBZlkwYURp?=
 =?utf-8?B?N1pEcnIybnFDMjVvNzJMTTQyVkNrRTE1cFZ4MHlLYTQySEpUT1p6b1JoTFY3?=
 =?utf-8?B?US9OdHZ1cjJhZjExSlJLdE9ZVTR5aTBhd3UwY0FzVmRwRmc2UGlQOFROY280?=
 =?utf-8?B?Z1VvMWp4VWQvd3h4NUFKWVlOUFplWFJHRzJNL3BIOE9HR3BPT2ZVeWlROUxO?=
 =?utf-8?B?bXVrSElBRlVCdTljVnZ6cHkzS3ltSEdValJva3F1bkNEVjBTWm5vam53ZE9C?=
 =?utf-8?B?WENQc2tHWkpSQWlGTDNQSFdMVDN5RSttVVBWSUtOeFQ3ZUhUR1BBUC9IQlFv?=
 =?utf-8?B?bDVZUCtUNVRBb3c0YjlqZCtVWWJVbnBvKytoUDdkVjNWbVM2QWFlcTZudnd0?=
 =?utf-8?B?OURvVHQrWEcyUVRESkg3b0xwRldyNFZ6TCtiWHA2N25xNndKb244aklnRDZu?=
 =?utf-8?B?RVJKc1BDaU5yTXF2WHQ4ZGJ6blY2YitTNW41YnkrdmgrUlg1Z05nRzcxRmtZ?=
 =?utf-8?B?WVB2bFMwNXl1ekMrZHpHeXErS3JsOXkxUTNqTStPc3lSajhCNjhiK3pia2FN?=
 =?utf-8?B?eC9KemxoMFdRcytRVjFMRis3NHpFcUxONkRiSVAvMkxJNXdQdC9MOStCVEo3?=
 =?utf-8?B?NnV1NTZjb2pHcFNPNkdCUzQ4WW5XV3V6b0pSN3lrbTNzOS9FMjJuQUFEUkpF?=
 =?utf-8?B?UjRWWXpKc2xiN1lxMDh4bytnaHB4RElZcmZSU1RERE9jZGVjcnlUalZOQXRj?=
 =?utf-8?B?WXRkNGdWMU12TG8zaHJtQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(8096899003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?REtJbEpDNE1GZXBVQlptNjhXNlc1NlFwUi9uRTI2S013NUlLVzdmWU0xbmtI?=
 =?utf-8?B?cHhLdTB4dnpDeWIxVWZNREtxZEtzRUNvSnRvTUgwbG1QZThkZG5Xb21jU29I?=
 =?utf-8?B?TGJiYXBSeExjRjhYQTZ0ZEliLzVBbFgwQTg2NTI4M2FKdWJhUzlEY0FkMG03?=
 =?utf-8?B?cTRtWXlnN0diQjFleHh4elBFQlFmRGppYk56MmtTckdOcHhIbTJvL1lmSUdV?=
 =?utf-8?B?Zk40QjhodmtQZEVEWnpHQ1MrVUxjNWtGU01tWmpaVkJTaWNFcENzdFZNUjVa?=
 =?utf-8?B?aE1nd1FTT0EyN05RbTBBQitGVUFGNGtWdGNDdHU1aElqbzlnaW44MnJCWmJX?=
 =?utf-8?B?aDZIRUJ6Mi96clNYZlgyM3RQNjlENWJYOHdBVmhxb1RUUlE0alliOWQ4TUsz?=
 =?utf-8?B?bWpKL2FYZzFxM3g1QkpLWkJ0ZzlUT2gwWGd5aHlQTFZua0w5SmMrTm9nV2xO?=
 =?utf-8?B?eFkybDROOEJydnBpQmtxZnp4OUIyMUNzOGZGSGFMeVVTbGtmY09qbmpiSlBy?=
 =?utf-8?B?MmZpallXSS9ndytQSS83SU1TN2NDZEhrRUdSZDRTR1gzSlN6U0tHSGdzUkVv?=
 =?utf-8?B?bnM4Y2duZkZxWWh5RG9Gb2Z0QmRxWllaL1g0c3VLRWowNTBMVHhROS9FMWRW?=
 =?utf-8?B?a0hvVDFCT3lseENoSFVRUFhmOXlkNGNETDNiNHlGaDdWZHVJVXdYN1RDK2lE?=
 =?utf-8?B?NXBla1Yxc3diT3JKWlE5SkszRndZdUc2QjJQcTdLcjVCTTA5UGF1LzNsK3Nw?=
 =?utf-8?B?WUp3QWhiZzJmbGUxWnBQZGI2aHprbTM1eDAxRW9ZWkwvZzV0b0dUR3N4K1Qx?=
 =?utf-8?B?Zkp5eTZ3aWt6eHZCQktTUmhuZkhkU042bjlzdU1ta091Nmc5TDNvQW1Rakxj?=
 =?utf-8?B?ZWpscjA5amk0bEhZdnQ2ckJaOVdjbDE1YkwrUDRGa0lYRGcvTnBlMDdCNmVa?=
 =?utf-8?B?aDJKUXpXZnBndy9ZeHc4VmZqWDhBTkRJWW1rVzlUMEYrUVk1dHNLTmQrSzYr?=
 =?utf-8?B?QWh1OWt2N3hXY2xkYzViMTBsYnhUZWdQUkl1T1RycGluaXYvTDJFcXk5TCtU?=
 =?utf-8?B?UXY4Um9FRVRRMWJtREgrMjk5bFFxR1luVS9kb2VzZGxHSTJUdHF0RkJZc2pS?=
 =?utf-8?B?ZitLREthQllWdFFEQmgzOGc4OTdLZTZBa2tVU0FZbENPVm9yZ0EvTkx3SzZQ?=
 =?utf-8?B?WTBmeFJwaE1XWnltZDRJK0ZQemhsQWtQaUIyT3pQQTZMTkV4dldsWFFVU3VY?=
 =?utf-8?B?VjFrVWVsUEVVYThYUWR1eG5YaU5QZjBJNCthL0JURUdOZlBuVzNRdzhxMWhw?=
 =?utf-8?B?RTFSUGYzSS9GOEJWTGVsWFBnY1BKTXNtOVhNWmdhb3pIQzFESW5GL0kvaTlD?=
 =?utf-8?B?UmNyOGVXTVFaUW9lVEplMWhOVVgzWnM2TmJNRDJqcEtIS3pXb1hFei82eWpU?=
 =?utf-8?B?QjA1YWRkclVjK2VSM1pmcUQyRmlwTmJkK3RkUWRtTU9rKzVQVUx3Mm5VQlZx?=
 =?utf-8?B?U2cvTzd3Y2w5dWZCZVpqYXdDVkZPRHozd2VnR2RyM3hRREtDdzBNOXhDakVw?=
 =?utf-8?B?QWpMTktSMjZxWkZnMDJXZGJCYzJ5MUVDSnE1NHhhcXRiOHg1WU9Sd0VIN3Az?=
 =?utf-8?B?ZEdCR3Q4NG4xZkJMNVcyLzJ6V3NNM2wrcUx3WjduLzJiMStmM0V3TlJqd3hW?=
 =?utf-8?B?a01NTElhTXpFcm9oMFJvckp2UXlMSlB0MTJnTXdpc0ZMclAvUEIwQkN3TW9W?=
 =?utf-8?B?eWJXend6K2k1eE5NSHp6Zk81RDdDWnBSMXZDb2F3TkFNTG9aZkVJSGd3dFBl?=
 =?utf-8?B?SDNpbnFnTmRhTWdHdmlkaWltMG0yOHh2Vzk3clNHbEhpcTJ6RkQybHhYV3NW?=
 =?utf-8?B?WGJyVC9xenNpWjJaMHZoR3B6aHJnaytDZ2x1aTJEU3VUUDc4NXBBWUM3ekVN?=
 =?utf-8?B?ZE9wbSttNFdZUmw5TUFzRUNTMlNoSzYyWEphRkR3eXEyTGxFbzlPRTZYZGRs?=
 =?utf-8?B?Z2daWU02OGtTZ3VsOXJBWktiZlVHYWlzRWkwNHl0YnNvTGNwaDVWN0lmNTNi?=
 =?utf-8?B?TnppRVZEZmp5SzE5Wm9wa1ZlMkhud1F3RXhyNEpHNWxPNVpvenY1WFkxUzNQ?=
 =?utf-8?Q?1xPfrDSAMeluzivdeX9r/r1lZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db16bcd5-813b-4aa3-c5f3-08dd66b07871
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 06:37:08.1278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7qVDHiFRV1UYkdGJebNS8vaKMnSKViM8OCmFt9/5TwfSEBtXqsYw/ESTlq1XEBRydrjFPJ9ILxLGhvEuyw+dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6313
X-Authority-Analysis: v=2.4 cv=LZw86ifi c=1 sm=1 tr=0 ts=67da6617 cx=c_pps a=zzjaJ2HwkiRAih7KxKuamQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=e5mUnYsNAAAA:8 a=Q4-j1AaZAAAA:8 a=7CQSdrXTAAAA:8 a=t7CeM3EgAAAA:8 a=BysMsrfwQGZIpICi9xwA:9 a=QEXdDO2ut3YA:10 a=-F0DAKMyZqAA:10 a=YaWxdbyzcwAA:10 a=1KWe_MHL-LRyDJDFoE4A:9 a=PD3Fv_tagJvW5nLf:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: YdO1wabN65yUQV442I296ZsMzHvNHTX2
X-Proofpoint-ORIG-GUID: M8HfAj3EA2JlTtItERl26FEq_CXdCY-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_02,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503190044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 06:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213263

--------------ZzS7VK1ifwQqmWXnxdO09Ynb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/18/25 11:08, Chen Qi via lists.openembedded.org wrote:
> Hi Ross,
>
> Let me provide some background of the problem I was trying to solve here.
> Some BSP layers don't set SERIAL_CONSOLES, and they have worked for a long time with previous systemd. Now systemd-getty-generator is deleted by default, and they don't get any serial console.
>
> How about using the following solution:
> Do not delete anything when serial-getty-generator is in PACKAGECONFIG.
>
> I suspect deleting systemd-getty-generator will have potential negative impact ongetty@.service. I'm not sure though.

OK. I just checked. According to 
https://www.freedesktop.org/software/systemd/man/latest/systemd-getty-generator.html, 
this affects |serial-getty@.service|, |console-getty.service and 
||container-getty@.service.
|

Anyway, I'll send out V2 using the above solution.

Please help review when convenient.

Regards,
Qi

>
> Regards,
> Qi
>
> -----Original Message-----
> From: Ross Burton<Ross.Burton@arm.com>  
> Sent: Tuesday, March 18, 2025 1:47 AM
> To: Chen, Qi<Qi.Chen@windriver.com>
> Cc:openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH] systemd: check SERIAL_CONSOLES for serial-getty-generator PACKAGECONFIG
>
> On 13 Mar 2025, at 05:27, Chen Qi via lists.openembedded.org<Qi.Chen=windriver.com@lists.openembedded.org>  wrote:
>> So a better default behavior is that if SERIAL_CONSOLES is empty, then
>> we put serial-getty-generator in PACKAGECONFIG which let systemd to
>> generate corresponding service instances.
> Whilst this seems like a good idea, it would also make the systemd recipe machine-specific.  Considering systemd provides libsystemd and libudev, this is not a good idea.
>
> Ross
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213133):https://lists.openembedded.org/g/openembedded-core/message/213133
> Mute This Topic:https://lists.openembedded.org/mt/111674751/3618072
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

--------------ZzS7VK1ifwQqmWXnxdO09Ynb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 3/18/25 11:08, Chen Qi via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:182DC6E67082CC9D.9747@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">Hi Ross,

Let me provide some background of the problem I was trying to solve here.
Some BSP layers don't set SERIAL_CONSOLES, and they have worked for a long time with previous systemd. Now systemd-getty-generator is deleted by default, and they don't get any serial console.

How about using the following solution:
Do not delete anything when serial-getty-generator is in PACKAGECONFIG.

I suspect deleting systemd-getty-generator will have potential negative impact on <a class="moz-txt-link-abbreviated" href="mailto:getty@.service">getty@.service</a>. I'm not sure though.</pre>
    </blockquote>
    <p>OK. I just checked. According to
<a class="moz-txt-link-freetext" href="https://www.freedesktop.org/software/systemd/man/latest/systemd-getty-generator.html">https://www.freedesktop.org/software/systemd/man/latest/systemd-getty-generator.html</a>,
      this affects <code class="filename"><a class="moz-txt-link-abbreviated" href="mailto:serial-getty@.service">serial-getty@.service</a></code>,
      <code class="filename">console-getty.service and </code><code class="filename"><a class="moz-txt-link-abbreviated" href="mailto:container-getty@.service">container-getty@.service</a>.<br>
      </code></p>
    <p>Anyway, I'll send out V2 using the above solution.</p>
    <p>Please help review when convenient.</p>
    <p>Regards,<br>
      Qi<br>
    </p>
    <blockquote type="cite" cite="mid:182DC6E67082CC9D.9747@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">

Regards,
Qi

-----Original Message-----
From: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:Ross.Burton@arm.com">&lt;Ross.Burton@arm.com&gt;</a> 
Sent: Tuesday, March 18, 2025 1:47 AM
To: Chen, Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
Subject: Re: [OE-core][PATCH] systemd: check SERIAL_CONSOLES for serial-getty-generator PACKAGECONFIG

On 13 Mar 2025, at 05:27, Chen Qi via lists.openembedded.org <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen=windriver.com@lists.openembedded.org">&lt;Qi.Chen=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">So a better default behavior is that if SERIAL_CONSOLES is empty, then 
we put serial-getty-generator in PACKAGECONFIG which let systemd to 
generate corresponding service instances.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Whilst this seems like a good idea, it would also make the systemd recipe machine-specific.  Considering systemd provides libsystemd and libudev, this is not a good idea.

Ross
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#213133): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/213133">https://lists.openembedded.org/g/openembedded-core/message/213133</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/111674751/3618072">https://lists.openembedded.org/mt/111674751/3618072</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------ZzS7VK1ifwQqmWXnxdO09Ynb--

