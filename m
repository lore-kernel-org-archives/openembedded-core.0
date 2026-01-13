Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679A0CF45DB
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 01:36:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49235.1768268196788041220
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 17:36:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YglRKGOI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54731d59be=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CNfHEv3964737
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 01:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=D1JFQ+VWSQjB8gwaUetB7bHFwbg+8repVD/WVF8UxKQ=; b=
	YglRKGOIM7w89IgI3sm4DsCXt513+27UdYmlum/ko2fzqknPkDGC/kPt8/PtvKEm
	BtrCLmD5xM+c6iuShYwdCRY+yozIZ0ophddAz544Qy2gZyxVoizjAfM8GvyE0YtL
	Qv2xwCVSDUZGlWfikXt/68nfFHoovwI6vFSO3+6jEWZyJdvVJyyw9mYjxb838Xkx
	bXJYjFnlwNVlRfwQbR9IQGbYmG6TGOyazNJxvgITQt2x3qXxcf/N11dQsT99P1Zy
	zenSbGykjWu6MSicxrA4ZlsD8E9cU24/n389AUAuBc9YFqEJwU8zmdQm7/W6Afa/
	SiWfxvyR2gFegirp7hl3qA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012039.outbound.protection.outlook.com [40.93.195.39])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkdr2jfq1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Jan 2026 01:36:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k87x8Q/YR2Ynd3nJnJ3rERNVCa8ZIeplxA0nMGbq2Hz24xQT2QcHVfQkN6aBhQ5wkfIS66BxBSF3LKlevdR3Fh280zTlNa8oYaHS6hJorTS76PU/OLOe1DnXae9T4Pt+Eesl9jXryVixb79SGv/bg06cSpBjy5UcrJesvGns/9lzilhdbJL1TBQoo3XBInVdECTuV42dwR0I8oBR+44gQ1PFYAyTEYHT6asDKS3RsFakX+zHst8r2S0BeFMPtO2s9WtEiZZ1HX5dddabfq54CGvfPS07LKZgosLIF4si5PLB3miH49r+G7TFnvMpCIE+N5PX6ppQQ1J/3R2OgDeQXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1JFQ+VWSQjB8gwaUetB7bHFwbg+8repVD/WVF8UxKQ=;
 b=bQTVFIkhlc5EpxDCcCEKTISb9Djayfu8KAS1Hqb47qivGd4ptIAjeSQv4PTkdA8QJ2vLkclWX/z3My0NDFY+uiipdQxpLrKKhko2OTURqsclPbhPH1XrcE98khEdDHiS0j0yCTJOka3zH03yURiX9o550J1pyGmwsA43JWIEpDuMK4uFcNLTgkO3SvNt+hPWSORkioYZ+hlvlT5hLsC0yOKa3BO4xMA3PAjj5FGjR2i6M+L9jknz6ih/kTtrKDweyNs4M0sCSP92ns4+6FU5V4R+pI1hlCqVP6h0TPQLf32J6V+wmzlOs64s+K2HNEE45lkjoyAuQq3pFP6JjzfLuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DS0PR11MB7829.namprd11.prod.outlook.com (2603:10b6:8:f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 01:36:33 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 01:36:33 +0000
Message-ID: <79d2f834-3bf5-4820-9dd8-0877dfcc6bd2@windriver.com>
Date: Tue, 13 Jan 2026 09:36:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V3] go.bbclass: set buildid to empty string to
 improve reproducibility
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20260108060842.3340603-1-changqing.li@windriver.com>
 <CANNYZj9YA+FNmcn4RiwK1CEvK909uDbgZcHYiHd+yZo00ciejQ@mail.gmail.com>
 <fc5d529f-0ca3-49e7-a050-62593305b128@windriver.com>
 <CANNYZj9Yo19XZTpEdNER9ud5EUSq1fu8PLgRbLgRGHmfK4MX8w@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj9Yo19XZTpEdNER9ud5EUSq1fu8PLgRbLgRGHmfK4MX8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::11) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DS0PR11MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: a4542cc3-bf73-4999-774c-08de52442e9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?KzRqTGtFTXVqYnhUdEFhY0ZrditFZGhXYmlvM0NhS0VzUUFUK1h4OGNSZWdH?=
 =?utf-8?B?NHVIdVEycGJHQkZtQzNGYWNMVkhzcHNKQ1Y3a0tqcGhvMUFZQ3RCTS8wZnJN?=
 =?utf-8?B?NWFsWTZVOXBRbldLRXJMenBoT1ZnQXVIYmVkT0VORHZEbWFmOHMxc3Rudk1O?=
 =?utf-8?B?OWNoK1FWcTNPWFZzVmZXNmZnYzY0R1VraEZEeDFyM0VYdFFrQmdsZE4zaHZK?=
 =?utf-8?B?eEdaOHljZlI4b05SSEJYWVF4SEhxQ2pWM1JVYzdFcUNmVHQvK2dnWnZCb29s?=
 =?utf-8?B?V0JHMTRpMjc3WjJoN2xPTDdzOGFoMTBZbEJZaWtwN3ZydlRQbVU0NUV0YjdJ?=
 =?utf-8?B?VnZQRnB1SlZzVXMrUUkzdDVLbzFVdU1FR0NZQ1RoNXdMMlJPMVFFTlFpaDBv?=
 =?utf-8?B?anNjeUoxQUtuOHBVQ2ZNcGRhV3VTbm40Z0N6djZaOU9jVEw3V04zNkJjdnVW?=
 =?utf-8?B?YkxEM0xmYU5wbDdiN0EzY2lzUHBvNzYzYlI2Z3QwZzhQcFpGdzhwRTN5dUxZ?=
 =?utf-8?B?Y2svbHFnbzVvUlJZV29QeVVMK0dURkFvN3ptSjdzUU5sM2NRQW4ySUVRSys4?=
 =?utf-8?B?Nno4UlcvTWJ2Sk5kRFQ2NGhyY3I3blZuVXl2dGg1dnBVU3RVd0pBenV2ZXdT?=
 =?utf-8?B?d0FkS29DdVhoSEdUTVhLQ1lFN2p4a29DMmJ0VjFpQUpsWmV4dERKYnRTNmNn?=
 =?utf-8?B?ajE5QUZtZW5ORHUwN2U3V2dCY1RhV2ZQWVN0VkF3YVlpV3dHOEorV0hWWUdY?=
 =?utf-8?B?WGJXTWN3YVNXcjJEdzJYSk9RQkszWWhMUHRJSDlzUkNjTTdwc3F0MWVUWURq?=
 =?utf-8?B?WEhkaWZOVDRXVXJ5NW9CemRsS05QUFF1em9VQ1RmcHBHVVZnNWxianllMmdO?=
 =?utf-8?B?dGdSNVgvaVJSZnIvVk5NLzVaUkpVSlJyclhhM2JLVktzdGlPSEhmUi9ZV1lD?=
 =?utf-8?B?Wno5bkxNVVZrV3Z6dmlGNEFSOEhoSTV4Mml6RVF3Z1AyejZyVlNleVhYVHVj?=
 =?utf-8?B?U3dMOENDcmJOUTJnT296cEsyRnUydDhvUFFGaFQwaUhMMisxTkI3UFRxd3R5?=
 =?utf-8?B?SUpsYVViaHhwOHY1TVV1eHVFa3hHdEFvejlkUDV6OVM4YWFVTHY3a1A4YTla?=
 =?utf-8?B?b3JESkN4a201VW0rTnB4aGx6L0F5OHRjZ1hsK2ljTGszU1VybzdJelVkU3ZR?=
 =?utf-8?B?dUlIYUc1dzJlK3JTbzdlVUZYcnJBSjNxTXdLY1VQcHh2VWdoRDFEa3R5THVY?=
 =?utf-8?B?aUwzUy9qSyt0QWxzUGQ3Q3VPbW1yT2dIUVNtQjlWN0syZzhzM0FaTnRMMElN?=
 =?utf-8?B?OHBtZzRJRGMwekYzTHBNOG5DZ1YrSWJKZU1CMWFQNGtWYW0weXVnQUJZdTgv?=
 =?utf-8?B?SGtlSnVBL3hyVWk1dXlrMDNsNUt0RU5PV1hBa0c4bmdBWmwwSmd4SHZaR3Vh?=
 =?utf-8?B?Smd0QmlIWkZqZDFGY042bE9lWVRuWTYrRUxSMU1HT3l4SjJCZHpPRFd3Um9O?=
 =?utf-8?B?bUh4dHc1Y3ZvdWdFMXdkN05vd3kzdXhBbytWSDNlUGtzaW1jN2VySS9JbVlw?=
 =?utf-8?B?eFVUT1NqbmRrMTBWclo2U3k0dDd2OVdEd3FQRDVIZ1p0UmtRa0wyZ2RkNExk?=
 =?utf-8?B?bDBBaHpRTWY5TG8rVjgzb2N5TE1yYWlNYjY0MTQ0T1JYTWJzb25ZeGxsRU5o?=
 =?utf-8?B?alJRMjZ1V3ZCeTN4UExoWUxhSlpWVHIwZ2JyUm9uVVUxN0tSemFKbTFBdXNJ?=
 =?utf-8?B?QWhhaHRSTmtESEhYUVMwTFFsaXRJQnI5U09KS3BzejRmYjZ4MDNNRWZkdDBz?=
 =?utf-8?B?WjBCYnFpYUJCQUt1ZFdubm1QclhER3dUZlRxcmw4QjFpdUczZkVmN2RXNSsw?=
 =?utf-8?B?WDFJc1l3THNzR2JBaG9wb2ZJekJUWjJ1S0dQS2F3R0FobXFGUzdCRTNMYmk1?=
 =?utf-8?Q?wulDeUz3mIvI397226V4bTs7/zqzDxBH?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YTRGNUdpQTNYbXNOMDZ0NTRlTWxGTkkvUEs2b0xlUy9WMGZxWFE4SzhkcVZG?=
 =?utf-8?B?WUltcDlyeFBlVlNBK2l3dWhmMnhqUFNWbTN3QnhWaGhsTmIxSFRZRGw3MEVM?=
 =?utf-8?B?dmY0eUViVlJoNERGV0hxV1VqVWZaZUFmNTEzQ0swcEhCa090NmNjRWM1WXJL?=
 =?utf-8?B?NW5EOU11ZXMvL2VWNXJZRUlOZGw0ZWptRVY4NmlDaTIzSU1GemJicDVIVUNu?=
 =?utf-8?B?ZWcwRnBIOHdSN1BkbCttejRGZm05L1p3cGF6UVJJYk85TE50ZGxIZEpISmxQ?=
 =?utf-8?B?d3BjdDNUa3NtMWpubk40b2lKK0NlWXFIUGpyY2tua1hZUnkrbWRNMGZWUC9F?=
 =?utf-8?B?T05DQjAvVS9KQ3hpUG41UTBiN01qMEdzWHZYTER0VWZNamxRQWVtdVl4aDBN?=
 =?utf-8?B?V0I0QzVSUzdGd0FJKzRNUkN2ZTlJelhia0xGSDVoRWFobWpmTENMcVN4UmZK?=
 =?utf-8?B?NXdUaEl5UEFOcjFHTDBlWFROdnIxVjM4WlJqWm80VFNuajBSVitkVU83M0Fw?=
 =?utf-8?B?ejBIOUVhMGhZMVEreHhYdkh0VnhuRFVHM3RhQ2s0TVYrN2F3dHdsNldFYWhv?=
 =?utf-8?B?dzhnWlpHQjNUNUduNkNtRGY2N1NwaUJIeTYwblMxRWV6TUVYb2g0eTkrZUFX?=
 =?utf-8?B?cHFvcFlRT1kyNVhUSGRIdTdEcVNpUTgyd2RLdWNWS0xML3lGekhVSldqUzQv?=
 =?utf-8?B?MlhCL0VMMzVsRm5jUVFkQmJ1TUJFYUFESWZZa3lXZ3FUK3JiUVZDbjVwYzd5?=
 =?utf-8?B?dWYxalZkV0tCOTdyRERmQnNBaWRGamVLcVhaVWIzUEZvc3JsdWJkaW9xUEZw?=
 =?utf-8?B?aFZpUG91T1VCOE95N3UwT3Y2ZTJhSFNGZjY3djhyVE5EenJNUUZlKytEbFRB?=
 =?utf-8?B?M3NuWGtNZG5rYzI0WnZHNm1TeFhsWU5YMCtMQVVLVGR3amQyTFlJYm1XdnVi?=
 =?utf-8?B?dSswdi9KeVVRQ3pSUmtoMHhZS015OVNFOUZldWRyMitpelNub1lZZHlkWDN1?=
 =?utf-8?B?bnFNSE8vUWRiYzgrNElkS2xLVzZjYU1lN0piZDRuZE15TkpqU3FWUDFCakNz?=
 =?utf-8?B?dHNyN2o1WDRib3lPeUFrMTlFa255blF2NlVPY1B1eHlOdTJSVDh3S0dFcUNL?=
 =?utf-8?B?b2dKZ0hacWdiUnU2UEtvYnkralBGOXZ0TzF5em9oTEkvZkllU0hwNDFFSVZY?=
 =?utf-8?B?NHdtQW82dHZJUnpwVWl0NllNSUh1NFByYVRUS2NvR1dCRVMwOWE4RWYrUVRG?=
 =?utf-8?B?U2ZtS0JpeStqWGdNc1dERGVOYzZmMGIzL3BnclA0eGI1aFRoZW12RHNuVVB4?=
 =?utf-8?B?YmNCTnZnNU8rT2tnalpIMFd3TnVxL3FTTmdCMWhSRmcxWEV4a3JnWTVvMWZS?=
 =?utf-8?B?UEFSa0FucCtqRXA0b2NkdmxnZEVSc3Q5eUFXRk9ZWVFOUkx3VFJPRWJEd0Fx?=
 =?utf-8?B?NmhKOGE3MmM4eU0rQzdlbmZEVTd1cldEQ29EOCtiQlhBM25oeTFaM3p3anR0?=
 =?utf-8?B?UnlrY291czhZOVZDT0tZNXFzeGF2blFZRmx3TTVEb2dPTncwUFVPamQrVkVE?=
 =?utf-8?B?OUJWNnIyL0p0Q21lZTM3ZW8yN29vNzF5UENZbE9SZitYVmVpZ3ZXMXZHT0pu?=
 =?utf-8?B?UUZLWFZQZzJkNXI1ZDdXQW52WHpoTkF0MVY0dEhZeE5RVUY0Vkg3WDJKSlFD?=
 =?utf-8?B?OE1yZ0FjRGNzVUdXWjhUUXpnQnE2ME4xaVR3TVlQZjBZaVM0K2hUZ0Rvem10?=
 =?utf-8?B?NURrSW8yZ0NkTzdLellMTmhwekhYWTVsUlZrM2x2aS9BUUkvRlpaQ3ZaY0Ns?=
 =?utf-8?B?QytHa2MvT29URnVqdlkxam9HL0xJYUZaL2d2ejJkRjQ0cHd2Q0gwZWxnSkZk?=
 =?utf-8?B?UDJKQ3VXNm1mYUE0Q3BsWWt4U3FjU2c4bHo1MDFNWnUvVmsrd2RqTVJpQWRG?=
 =?utf-8?B?RzNGRnlQMjJBSEJYdWZCK05yaXhTalNHMk1kdCtZU1pUbnJxVDJ5eks2VzNO?=
 =?utf-8?B?R1FaVlhXZ0NIUnRydUN6ZXRZUTlLY2Vnb1NERThyYzlYcklhY2VaMWNoNlY2?=
 =?utf-8?B?UnF0dmlraVpYVjdsb3dLdWF1Slp0VEtLUWZPcm9MNVFrazFWMGcvU2dQcmZP?=
 =?utf-8?B?USt1VTdITnlLMnhpWFU3ZWFUYVhZc1dteGJBZHA3Yk9KeFNzZ2ZKZUV5OHNa?=
 =?utf-8?B?YmtJeWkxemZ0UDRwRVE5RGRYdmNHVU02MlBXdXZHVGR5R0pMQlMwNnlYZGNo?=
 =?utf-8?B?Y1BYOW9BUWxVd05YeGN5dWlZR2srd09PeFQzemxrODJrK3VLQ09FZk5MYW9Z?=
 =?utf-8?B?aEV4ckRldWdHSURuSU9Fa1FTWERJamNvWDJBcjV0cEdrU1VJYVNpMC9MYXJ5?=
 =?utf-8?Q?xhWhBxNMtGxiQhoA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4542cc3-bf73-4999-774c-08de52442e9a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 01:36:32.9575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/lbUAu1JnVN9WHnEO4+l6Mhnox8bOKVM5nRhcZfAkUqRs3FUh5kkkVru2YNRJjskUn5nTKQF3OO36hE+Bg7ZXbFIZ9PvudrUB+07XkHSXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7829
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: xZo7kfyxb5TWk_MiDlPjQcYuEPcYMCix
X-Authority-Analysis: v=2.4 cv=fLo0HJae c=1 sm=1 tr=0 ts=6965a1a3 cx=c_pps
 a=zwUidnFXtIpczQ2t7519XA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=eq1oZGQARrLnzlRvkSMA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: fZrTH1rHE5SjojhopiZAlcCtsaCzk5dm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDAxMSBTYWx0ZWRfX9Xf3WJ9ZNG3U
 ay7fPriEOVPU/T+cbvIvJEGKbchSoZKbk4KgW6U9CkpnPlZtdTkMPFioP4I1SZu8fdoOB1L0RAK
 lyzhKX6Wkba4qwoCRYxGVYS5nhXcrGNo+JeHbwlo7dn0ZHTufRzsrCRd1gBmLM2vJ+58jmyXIsF
 bwaOxqrnW3UNpyBfIXhnWBoJ9I37FCsRBJl5vocxM1rwA8n3Jp2C7F5UYRIGgOgf+8ImDkTpO72
 GXMfbCqm2sTBCsAjsEj3XNytCw4vl1upA/98lzsJqGY2e9bkDh/lSN+BiLxmfxdNA6GScBchiXi
 UYdQUTPzI/hUn9RXg7HdgnPK5gwd9nu4NBkGPWp/iiOrHwxg1n3LcO/XPdFEh7Spp/wxSkIQhUd
 9cXBZgNLihphTx0TsE1eWVZIWc8x1PDchya5um4KqtF7SgWPp7bKu9VX3YP6xT6gar3CD63mG5V
 DChswMnKz8zhH99OV3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 01:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229221


On 1/12/26 17:33, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Mon, 12 Jan 2026 at 08:40, Changqing Li <changqing.li@windriver.com> wrote:
>> There's go-helloworld in oe-core, which is reproducible as it is. How
>> can the non-reproducibility that this patch is fixing be observed? Can
>> we improve our tests for it?
>>
>> This moduleindex info only be used when GO111MODULE=on,  and the go-helloworld is compiled with
>>
>> GO111MODULE=off, so it is reproducible as it is. To improve test, we properly need to enable GO111MODULE
> Can you do this please, and add the change to the patchset?

OK, I will change this in V4 patch.

//changqing

>
> Alex

