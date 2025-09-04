Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1720DCA1010
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 02:59:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.30683.1756954743787668298
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 19:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZPQuZ07E;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1342567ea6=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5842e3sd2150186
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Sep 2025 02:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=7Bvx9h94dWh4ZA1tZE3YCcMTdYpznEI8d1AkpnBisnI=; b=
	ZPQuZ07ElUvyEb5d1wyxsgjcHMqGnOGagDKYl5KQvpgPJx/EtdLVKLKubn9RmXy6
	/YLhcC28aX1OJUqNb2MyZI77oNI7jC81Ey550F5JYFQMI/hJ6vwrwgl+e8p0xh/z
	+Nqff+plYI/kXdhfOSzPDRsL9kgQiZ5/SrFjI3m+brMvdHtVbPdidZI5ptUCRjpt
	0vNYionYu5rKIPlQjqd4GanwIWfE3FGRrL5RVM7cH8Q5YMllYUte0SqBiq4ny48D
	Zy23ciNiRN3SIRy9S8vSnVGHqc2Xl8T6GvIhQ4bQ82McWrpgvYBlhzSxEGtKhYC7
	EWhcJX1h1Y0yKWXF78TRFw==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2058.outbound.protection.outlook.com [40.107.96.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48y0ygr23k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 02:59:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EML48upGlFTx3a5hcpAlLG2aRDbzC8BbS8PGDDwpjJJHEEVP1xPaf2gaVqJLq0tyfGHbVSfCX8+dJBavf9eXj8IkEi3mm+zJBzEJ10tSfdo5whHoxd+D6vvqyGwoGT1fRfeRkQuJtmJEyuEJTOWhKAx07kjJj7szzMDdXQRlCLU17HQuGQkH1IDe0BIteAe27y1f0HINiT4JkwQaN1jnajsM/PdLrv9nn9TY7L0q5mhou1wlJQi8Y1iF4lfWThOZCZH3LhHxBQSdDn4OnRm5f8fCucz0MdWRqzCriox4TwiagI99teq4NFtT1uj86GI9VtnNGwGSuGBAl0PG4sieaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Bvx9h94dWh4ZA1tZE3YCcMTdYpznEI8d1AkpnBisnI=;
 b=BZjNUsRApIrvrAlQpMhRUCfo+LngBoijpDpJCj8cFrmM06V8iN64bxm3P713O0NDpHDMLyMxmwEeG18mcn71x9eLYRWSASSNLa3e3IfMmWxXPprfG14XmsZf+0oCNacJ0CRvBkZIo/qYanKbeO6HvZyYbbciMrTFUbRRqpzapOF0wfD/eXJXrWK6nlze7zoE26EiyY22rpd2KpsaQVRUGlFg1nZPW1dQ2fspfg8/uRaZJht+Goi+1/2+KjWL9GvegCdTJ1G8jybzlYd/GKO3hPcj3iFCmCPdzdNuEMYssGHbnAcqU02xpBi3MQ2bhE2F5Xa1B0wzwOcEZBS6hx+2rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SA3PR11MB7488.namprd11.prod.outlook.com (2603:10b6:806:313::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 02:58:59 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 02:58:59 +0000
Message-ID: <108f0edd-3a59-4b2f-86a0-7afc439c884f@windriver.com>
Date: Thu, 4 Sep 2025 10:58:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][PATCH 1/1] environment.d-openssl.sh: fix unbound
 variable with 'set -u'
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250903081113.3182850-1-haixiao.yan.cn@windriver.com>
 <CANNYZj9Qr7uy-bZGGEt23MWXHkX-fU3TYQc3WYoX3KEtTC9NtA@mail.gmail.com>
Content-Language: en-US
From: Haixiao Yan <haixiao.yan.cn@windriver.com>
In-Reply-To: <CANNYZj9Qr7uy-bZGGEt23MWXHkX-fU3TYQc3WYoX3KEtTC9NtA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SA3PR11MB7488:EE_
X-MS-Office365-Filtering-Correlation-Id: 3614ab32-f52c-4b05-89e5-08ddeb5efeae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aDBnVjQ5M0tuRDRSQUY2bW9yb0JtMEU2OWs5T3IrWFVJWGE4M2RoczByb3hI?=
 =?utf-8?B?YWxhajB2UWZqa01MajZMdDRsekd2OWQybXQ2R0lSVll6RnE2TWw1TmZiaHFn?=
 =?utf-8?B?ejdhY3NXb2p4TFdMSE83T0ljRm1HOG9XTzFGZDdLYStZaXliVXFyRFlIa0Rp?=
 =?utf-8?B?WFBjMG5VUXlDYkp3OXFiWGQwYlFnT3RtZHBxWC9PZnN6MjExZDVHeVk4Vk9Q?=
 =?utf-8?B?WDMwKzAzTnRBSU0rMUJheG04TVdsR0lPNVFWVWtTUmpPbWN4RFU1TTFReE9t?=
 =?utf-8?B?cEs5OGU0RmY0OHA0dnpRZlFqTE5Ta1NSdXoxUHNOTDlWT0JuZmtxWWdFL213?=
 =?utf-8?B?KzR2MEx5VHh2aFJTYVUrU0IwLzdRQmNSK1JRZS9sZkltc09QRUZMSENoYS9G?=
 =?utf-8?B?bExjTFlNTnFrNDQrQWpteHBmT2p5T2N2Sk5uWHpUdlJLbkFJSTlINTJrZjdu?=
 =?utf-8?B?ZWcvK3JUdFk5TzVOVENCTUZPeTZZUndMckthOTRXdndNL0ZTbVdwK28yamtN?=
 =?utf-8?B?N2VweCtSVVdnNG1KUitnakF6cGNHNzdWR3pqdkRrUk5WNU1SWVBPSklIRlk2?=
 =?utf-8?B?T3BPTVZMYjY2NXZaTnFNYU8xWXpJajBTeFYyUDhSU3dza2xFYkFiMmlDK1BF?=
 =?utf-8?B?NjJYbG4wSFVrYzk3UGlEdFdNSjJFZTFiRkI4dXg1NGFyUk9DSTZoY0FPRHA2?=
 =?utf-8?B?ZzF2aUNaVjBWWG4xbTRVRXZNR2JkV0hvdWhRRnYxazZFVFMycFJ2cXNYZ1pp?=
 =?utf-8?B?MkEvdHY0cjRQeCtwK0wzOHJ5Z1NIWnd1bHdXQkp0c29VaWFFNkdiRElkUHBV?=
 =?utf-8?B?M09nSmQyM3BBYzZ5MWRuRVNsQmdkZDlDTkt5K0R0L0dlNWRzRUVONkp2d3Y5?=
 =?utf-8?B?NlJJbTBveHFRcm1jcmx4cXRnaTB2WXcrWEhlek9wT05TekEvRTJRbDZ0Ymhy?=
 =?utf-8?B?UlQ2U29oQzdDT2pJT3dwQXZaaXEycEJwTTg2Y0IvNm1zM012WjkxTEk0VnFH?=
 =?utf-8?B?NGNkWG5QM21BUENDc2dnU2NSa3l1c3k2eUp0RXZlQ2tVM0N2QTZPbS9CQVAz?=
 =?utf-8?B?czRRZFZkRE1kRlZBdy84dFlta3pBTnN0ZDRTVUJJS1BSdWQ4ODJGd3dDSlh3?=
 =?utf-8?B?Y3lZMlRyNVBTTEhQOG81bCsvMUF4MGhjakdwdFlGbTcrT0tadENLc0pQYzdu?=
 =?utf-8?B?bU9ZYU96MEVsQ0hBWmdtajNOOW1uL3hmZ2psRGVnUHpsVERjdlh2d0hlcVVj?=
 =?utf-8?B?VlZtRzdoRnZoSDlPSHh6aDB1NXoxdWIrcEVHWWhjWlpudU5Ndy9BaHd5NWpQ?=
 =?utf-8?B?TzhzZDJzSVdNZ2c5QjdISXl0TjFyZ05CODN2UVZhZVVGeFc3WDlQWk8zNFRD?=
 =?utf-8?B?R2Fhd2RTd2pqSnZMRVpyZXZpVEd0YU1EV3VCbzl2cTRveElxc2FvY1o0ZU5z?=
 =?utf-8?B?YmZpQnp1TWs1eDA4OEJ1K2g4cHpNbUJ2RmhhWVZtZGdQTjhZK1RVdGVYSjh3?=
 =?utf-8?B?ajJzcFVzOWxwYzNMOEJIU083eTAvUHpIbjM0QzZVbjBPMXM2b2dwejd2NCtm?=
 =?utf-8?B?UUg5WmNkdEpURlZqL3dZaVpGSzlPRC9qakxMWk9jaTFoeFE2aUFraDlodFBK?=
 =?utf-8?B?QlBmeVlBNWIzbStSclphUUpoSHRTbHFXdHg1SG8vWFBIZTljaFB6T3piNDFt?=
 =?utf-8?B?UXhFU3VVYldlem5SenJPR2RlUVBLb3hzNGZPZmFRcTdNMk1TK2pmSHhLbnAw?=
 =?utf-8?B?RnZLWi9JVlJlMmErWFJQVzl4V2NFQzVrcFNEVURJaEVObWFKei9WT1cwaWQw?=
 =?utf-8?Q?mKBvPiVW1SO9CKEoCanZ8TjVlLsBA5ZdLLCwI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V0Y2aHBaNjFudGlGMmljYkF4T2NpeDVQWTJmTGZFOTRSWXB6aWdqZWJIbnB5?=
 =?utf-8?B?SWVGRGxnL2ZXbTh1dEV3c1FncHVlcXc2bzY4ekVOaXQrL2NOeDgySThIS1pD?=
 =?utf-8?B?N1UrSHVEMllma2w3WmQzbkR2eXZxNi9hVEhIZ2FGNFRkTXpTeENLVDI0Yi9j?=
 =?utf-8?B?MzFieDdtTFBINmtuMThCaEZUbCtJaXUzZ0xodFkyajh2TG93SU8yYWZ2ekVl?=
 =?utf-8?B?c3ZkK2VXZVZ5dndyV085NGd4U2NUQ1RPWVFYRmtjS3JJSHZDWFZ4UDAvV2N2?=
 =?utf-8?B?OFViRk45UWFWN05mdHFSOC9DRm1KNHpVTUZHWlNFUW5ZeG5odm1aZzN1elRV?=
 =?utf-8?B?dU1pNndZNDZuaWw4S05nZUdsdERnM3ZjaU1VU2lsMWZzS00yZUZxckwvUmJJ?=
 =?utf-8?B?dFNOYVptMzZFV2ViQTRZYkFHM0k2YmhOQ1hrRFM3eVdMeGtUNmUreFZ2bUEw?=
 =?utf-8?B?QnlYYlQ4MDYzNFFYY3ppbm9zWWlNQ0NZMndtN3AvVG94TEh0UkJYL2t5RXBQ?=
 =?utf-8?B?OGlCUjQ0MmZRbXgraDZETXkwdGJZWkdXSjEvZm9rQ1dLblFMcDVhaEVVV0M1?=
 =?utf-8?B?a3ZSM3BuYWViN1JZYUVJVWZONDZNOHRrdEFGQ1VoQndsdnpoWWg5ekZ2WWxk?=
 =?utf-8?B?ZCsreVZzdWtlaTJjcVdSMk01U1lSVUwwc2Z5SDhzbWM5WVFkM05Gb1NvSTFa?=
 =?utf-8?B?MFBRc3V2TGRTTmJJMUZSZzFYT0hvUE9USW5uZ2V2OTVsRUhtcjU0OUN1bkd0?=
 =?utf-8?B?S2tIM1A2UVVtSU5tS1NXQ214ZitLbHJveFYwTWRNSUxPOHpKYTJsS3dEdFlC?=
 =?utf-8?B?Nk9oRUVOTHM4OFRidTJpZm1lK2kzY0xJVnY3elRLTDlYQWppOWkxUm1Gem1J?=
 =?utf-8?B?NlcraGwvR0xkRDB3U2NWZ0pXbSt4SzMvSGVndE9FYXI1cFUzbG9kSkVKZzUv?=
 =?utf-8?B?cGljVDB1NStrSThRczI3VTZGbjVCQ0ZoTWtkMzBwaThtUk93dm1xNHhGcVhw?=
 =?utf-8?B?KzhHWUtUb2dwOW4xU0dqUnNVRlE3RDZHSVYwaHIybU55QzBveVVYZkozMXBQ?=
 =?utf-8?B?QTNJbkdQa1p2QlhvMzhaSEV3clMvSjBHNExUa21YRDVyV1ZzaHFrRGNSM2Jk?=
 =?utf-8?B?SDN0cTlaM0E5U3VBZXlkVlcycFVBU2I4Z01xSEUxSWs3R0dqSXFLVUllcnpV?=
 =?utf-8?B?QVVXa3dJWDU1djhRd0hVQXgyTnZyb1NwR01pOEE1R1V6dlU1ZXgraTJta1dS?=
 =?utf-8?B?NmhUYWhkdHdWUmpXcDkvRy92U0Z3QU10alg2dnRDNDRsdm9XODZmNmxzRHV6?=
 =?utf-8?B?cWhoMHIzckRwNHl4TzJBMTRjZHllZlZTMzFOR0RMRlQ0Sk1xZSt5bkpSRUFD?=
 =?utf-8?B?K3k3YWZySjRZNkFiN0dGNDFQL3pXaEhmZFl6a0hDSk4wQ2R5RWp1V2NaVDFG?=
 =?utf-8?B?TGwrUCtQSG5vSFBRaC9BZzNGNy8rKzMrSXFWNXpJUWI3V0RpOEFHTGM3T3Q1?=
 =?utf-8?B?VHppU1cyWWtWRFU4UEJKenpFV1l3bVl0ZWg1MGJudUlIL3dpbWowbFRjNmZa?=
 =?utf-8?B?ZUM4U3dDcGRkdWRMQ1lOc01CTFlFa1Y4VXpHK2lFYUZpUWxaUlB5Rk81S1hC?=
 =?utf-8?B?QjFndVFQc3FvV0N5WHJ2ZmdDWXgrcVB1Ni9xUzNrTWNCWUFUWTQ3VHM0ODgr?=
 =?utf-8?B?amNRdzNNSFM0MFFYNVowdGU5WHJzS00ycjhyWVJ1Z2JjSUdBTDlWOTF4ZThB?=
 =?utf-8?B?cDE5UVF0UHRXL1gvNythWmJ6c29zSDhrRUxHVFVoRlNZMUtVamNNdVdFY0lK?=
 =?utf-8?B?Q3ZSblpBNGNUK2xkRUgzVmVSQU9OaUV6VDd4TURaRnEzaVVVdG5yd3k5UUx3?=
 =?utf-8?B?ODhpU2RtZWdpWUxabktFc1VKUldtSGNJQ0dhY3FydHB2aGNzakdqRXdiWnIy?=
 =?utf-8?B?bWx3dHFRR05kdmk5WENVT0hhNXgzZWlHeEprM0tUWmRxTGJuNS9XMDF0dGhm?=
 =?utf-8?B?RTcrOGZQekVnUG82UFVjUmFyeEp4eHZtK3FKcWVKc09xRzZMZ2pXWWRsVE1W?=
 =?utf-8?B?SXZtNHM5Y3FVNDdZOWU5M2ZqcHVHclRQL09TYjZpaUNIUXJVNEtzeCtpSmRT?=
 =?utf-8?B?NkVwdEFjOU9lNnpPZ3JjaUJ3NzJKbW4wYjg1ZWxOc1lQZjdNQ0NJc1BQamgx?=
 =?utf-8?B?UFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3614ab32-f52c-4b05-89e5-08ddeb5efeae
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 02:58:59.2649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CN0tg9WOm3oeof65IZ8KEdtogmdVGBFQcOf+PtWl5GUyUSENoheBrasnuZJXZqnGXwce8fEMF081JCVjkcj9K/aFJ9Zp9iyYIPLA9Tn/BoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7488
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDAyOSBTYWx0ZWRfXx8owpCohFh3I
 3SmsgntZREFuBuwaxlVCqCRX8CLmtmbs4C2jaev0A3B0r6IMqpITE7u8ESBenhdQOsP2UOVs1A/
 vbB+P4PmDwORFTTvZlhZR7VgIirI7vD5TzW2lD7Up0X4QM+Z6hQ6okQ2ncvV424OR7XdISGUxd8
 jgyLFIpNsF7YKJ1aeCTmfH6WYea4drK0tYkp7k2ZLc9AA8ul6gbS5+oUNwjQKe4klbLsvx/FZRK
 3dcIsQ0pH7F+Bp07d8TMLEobDbgyUDXXFo/G6mkPmtWukK4+bkdp/zbiuTZNUnQ78/uP0vaNwXn
 ufas+t5LpdzaEFWVd9WmkLcBAN16SWDsILO9Sdz4PAykR11CCxnw4G1+eXBzSM=
X-Authority-Analysis: v=2.4 cv=T86MT+KQ c=1 sm=1 tr=0 ts=68b90076 cx=c_pps
 a=o++/TjR3kPnrPbqi8iF1Cw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8
 a=xcjvsQ2UWwkLSfG-aqUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: YWPgemXUeeYaVOx9r8b6hLmSGVmZn_3g
X-Proofpoint-GUID: h679AH7ydvM6iN5imE2LEeVGSf2XgwE4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 02:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222889


On 2025/9/3 20:24, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Wed, 3 Sept 2025 at 10:11, Yan, Haixiao (CN) via
> lists.openembedded.org
> <Haixiao.Yan.CN=windriver.com@lists.openembedded.org> wrote:
>> Note: environment.d-curl.sh, environment.d-python3-requests.sh,
>> and environment.d-git.sh have the same issue and should be fixed
>> similarly.
> Which means we either have to fix everything (and somehow ensure it
> won't regress), or just have a requirement that 'set -u' is not used.
> I don't think it's right to fix such issues halfway.
This patch addresses all the affected files introduced by the commit
https://git.openembedded.org/openembedded-core/commit/meta?id=8a7ec52e9b35654bee48cd948c6c34c63db3e265. 


Could you please clarify what you mean by "fix everything"?

Thanks,

Haixiao

>
> Alex

