Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F900FE5204
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 10:30:54 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.2])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18303.1777026653076647960
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 03:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=T/wHfm7u;
 spf=pass (domain: cherry.de, ip: 40.107.162.2, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJJZVMueXsv/njSpJKdX2272sagsILw8Z4gUR9Kwpy6v0SFtn1DJVvG+wT8IJPnGWEs5vZJATP9dCSeXsfjeGdf4MaY1SM1fGrJ23Ss/6Pnm1WhUD/xd9tR3Mq1SwcCT3HuYU65+kv+V8fhufWgIxIoRB1MQ8x/9MIPeZQY4YB4dZ898Xm/lTFZ1LdzEcVbuHIrHNweF+4+obPOPwpByzDBTQmg4jsuaj4rn0SSzAyBf8Ng0baTGkO2l8gbJcIhIhKckChA8lwcN3NONJLXKK3Sbkhbhu8p4e+A3cPEWEV3cX7pjUE08lXvSKG5Gnf8ziPCL6m1H4MhoJmGWxN1m5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8muNYDxXeAWHdwm9J1wc8JBfY6m2dVG9DX6JHrvtXg=;
 b=jLtZfcxNIQV52VumO9DDw7t6IwNPqsRNN1ODh2Fd2eo1/eUR0yDR1DKHrPsShCT7zQdmTA2YCJQ/fdBxuaVrPZFcwg0EJ3bg5m5SuEBpOFjfI6udjldIhpusKzjaN/R7rkc0Wb+1gF9QG7Ql08UboHZuxlXrSYdKIFfq4fEtyaoh6zvroPti0qX1TIuNTJQiuwlh21CMbSaPMxLTBaJTKdOtrMDtVcAFtmzYsQ2WUspjnUJ2OgnkJvfNPPPbOeuIqY4aQaqUuueAJWSw6aCQZUZuV940xf1KOi92SmCpTHkFA6GkDQFyESIyMm1/OMU5Xib9svK9PjOvtfqhfg3RKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8muNYDxXeAWHdwm9J1wc8JBfY6m2dVG9DX6JHrvtXg=;
 b=T/wHfm7uWouJ1SQREIt2D3jm0I+31pLeHifYOaKIwFSCfqM0XNb0/0Kg06hyIv9z3iKok5M9OflqQHCRFY2lLchidcg1F4u9PVbDzpcVo7cMaJV37+nZ4ZL87LvnZnemGv1liLNVuPsR7NBnmL1N4xsgXILz5+Vl+sHOydsm5rM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by VE1PR04MB7389.eurprd04.prod.outlook.com (2603:10a6:800:1b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Fri, 24 Apr
 2026 10:30:47 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9846.017; Fri, 24 Apr 2026
 10:30:47 +0000
Message-ID: <e2f9fb8d-3026-4af7-a8af-94f2e6a8a583@cherry.de>
Date: Fri, 24 Apr 2026 12:30:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] wic: set CVE_PRODUCT
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20260413202233.2335301-1-ross.burton@arm.com>
Content-Language: en-US
Cc: Trevor Woerner <twoerner@gmail.com>
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260413202233.2335301-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0037.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::26) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|VE1PR04MB7389:EE_
X-MS-Office365-Filtering-Correlation-Id: 30382cca-9003-4f7e-794d-08dea1ec8c62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	8F9N0u3avxs594ntMW/KdoTffpMaVEf+ovSyyYwxGCPBpESLvN5tXfMMpDzYZYgMMiWdzIwUDv0bWwRRgMjd9UlUkS5sxo7iae5HezKlITle2EjkvDPz8K4SpQOu/jb0LGZiEzstzMcLUo3h1oMGsY61TaRkpw7LfqUvKOSycpqVhx101wgzD//YkYrKAo/YUNU4wqNxmj+UzLwIglsGX6kA2v51Vlqy9H9RclGiAUYfVTL6CUPoT5juhEHoNoqPJ+lSpvud05sVSDycxNJMbN3AcqrnP5GVob3uOTui4rQw5JfrG7+I3+BHQXK94zZ1OeJsFxyqScODqX9Q80AaEu/LI/Mym0r7GLRP7Xrzg0aod63epi7m50gsi1c94x7LP1Q1PnOBDI3VvwPHWgW1IHjRp5iS5ChoD+hpoxiB7xwgn/PwGNMz5MjExeKyLUzCkxNIdowcy4NRdz1aAXq3wORIJxh1S5DeyzW8UfyLph2FdHaPCPAKmAKQN0wv5l/YrMCzjmCvYQcU/Wmq7/tyTNsSJfZUz+/AXNVRlS3uWCx47RkwLw/BXUisVoopKO9hTtcGdExPAHEcwt6QbHjg7K/dPWfLp7HFEpEjFaz7o+rirLH77/sWu/RlBleIm5zzQsEZqdiDk2qp0zCx8i6sJc49LUrwamEBpbpRiRqn3v2h2PgH/tnXIFhIbikhHro+WNGDuVbC0dRX/qBGiZqKEVu83Y8E5qVf5qsw38cbr7Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SkkzbEd4SWYyc1QvVG1qRDg0YkhBVnVQdHdMdUZKWHpDRUl6RUVoMlVTTml5?=
 =?utf-8?B?czNpNndqQzBNY1ExU1g1T0tLTjlBQzVvVVZnZVJQN2lrRDhZSVhsOEs1T211?=
 =?utf-8?B?NkI4MkExL2p2TTRiaWdMVkFTN04weFJISE9YOGdhNW9Kak4xU3B3bTI3YVpB?=
 =?utf-8?B?R1I5SldrYjZiaSs2SUdJaGprMUg4MnZNVSszTFpCaHk5bktITDliQnhKTWxv?=
 =?utf-8?B?aFZwVm84b0lPcWJXVURjRFdOZ2tCSUx4dE8ra1lNNmFOb09mcnI1TE5oeHlr?=
 =?utf-8?B?eEp4Uk1mNm9FZ3FicWx3R0VnVzZzQzdVSUp2RVpBV2F0djlobENLa09pTEQ1?=
 =?utf-8?B?bkQxZnNFR29CMUlvUEhLTDZhYkpGUnQ0QVBPS2FHbG45M0J3ZWl4eFpqV0xR?=
 =?utf-8?B?bjE0MC9vWVMzZkY3cUhTdUMrNEYzN3FJUmtCdHZzUXY1WkFQTVpTT0pVbFor?=
 =?utf-8?B?aXhRYWo1bFBpSlZURE9vRzZpdy9TaFJ0dGdKTDF3QUV2djBPMHNrWHBVMk9y?=
 =?utf-8?B?cWhRYXE3cUlZV3RKb1cxMU5Wb2FlcXhRZ1lQMDJzRWZ1ZFh5dWVNbFNKNVIx?=
 =?utf-8?B?VkR3QytCVkJLRW9VbkZPaEVqbW5KRlJCbnBXeEhOZFhyK0RwZkd3dVQ1L1FO?=
 =?utf-8?B?OGtXRk9FRk0wbnNVdmZURGExNDdFekVHM0hlRnhOUTl0QzVqZVpHczFtQ0J3?=
 =?utf-8?B?N3ZmcVE1SmozblRaaGNpbUZZWHFXSG9oSGx6bW9OS2hONlJMcHZEZVEwUWwx?=
 =?utf-8?B?Vi9IZFZ6VUJpbmxQcGNoekV2aGRJVThUSzBlQ3JSY1NiOUo3YjdZNm9nUW9G?=
 =?utf-8?B?bmhDd3NEb2pUaUxwcDlUWW1LK0EzUnQwU2FObHVPQ1dEQlZDUzdVcDQ2bnlz?=
 =?utf-8?B?TzJrYjZrdTdoU3hrRGplcEhsMmlTRkpaakMwQTZGSmlVOGk0TE5hMGM0OTlL?=
 =?utf-8?B?VGlPK0pzOGlZU29XeFRSbzFRNy9tYXhVSHdpNWJyenJDSkQrTlYrTjJsOWQz?=
 =?utf-8?B?QXlTd0dxbmc4L0NIblJ1UFhQVytXQ2ZaNW83WWZjUVJibFhhSnNjcHRtWFln?=
 =?utf-8?B?bnlESzJKdEJYQnJITGlGdERkUk0rTmlLVmMyZC8wVndITFFuVTczOTljeWtN?=
 =?utf-8?B?Q2t5QUMwZnBZQmVhN3QwVWRRd2RUOCtSaFdZMkFvVzk0UG1xVTk5RHZCMjFz?=
 =?utf-8?B?eWNyZHJxVWRCR2tobklHQjF6VWdtRE15N2Q3aDIrdS9JdUYwcmMrVzdiTlZx?=
 =?utf-8?B?MFhWRG9zTTh0Q0gxaXJsV0NrS1Y5WHpoNWtzNXJaNVhwYnBjOUJUTjgzakZ3?=
 =?utf-8?B?ZkFZQXhtUVBGa1ByZTNjM0w2NFBxUFFacnI0NVpoa2M5ZTBCK2F0YzFWQk9w?=
 =?utf-8?B?WVVxa00rcXBGZU9kUnd0QUY0T3pmdTFxcFR6Qi9rcXVHWUpHL1VMd2Voc0hP?=
 =?utf-8?B?Q0RHVG1ZekVpdlNrSDcvREpkS05ic2x6QlY2Rytsb0psZkhRZGx5YkhzS1FM?=
 =?utf-8?B?dWlkZHUxWWJ0bzFucXdnR0gyU3BIMXhpeVo3Qnk1aGJjQURhUUFnV1d0Y2hu?=
 =?utf-8?B?aXkza2FkdU9iejJocHNFTEUrNXBMejBXWlRkdjJBMFJLL21KSWJBbm5UQnFT?=
 =?utf-8?B?a245TGVtTlRidXFsQkZZR1hNVGg0RGhVT2g0UUtyT0J0V2pCRStYQmtRT2xj?=
 =?utf-8?B?TXZrbWxjSEU5OXN1NHpTQjAxRHAzZXJBYWxFcUtva2kxajR6V3l3WEtpcWRW?=
 =?utf-8?B?ZTBoZ2RsZFh6ZjFLVVdDcDZFemJyZEdRemVnV1E4KysweUdvZm1Ea3l5Zngz?=
 =?utf-8?B?eVdyUmc1RnkwSzliNU5xWGNFSE03L01PR3h4bTZ4citGVFVvVk12NTNZVjJh?=
 =?utf-8?B?K1loL000TTc1UG5HMU9HM0RmY3pnTW9xd2ZzQzFKRHpsQy9uUDVEcjE2eitn?=
 =?utf-8?B?dTdwdFQxVVdtVzFTRDhFZ3VnVGs5enlNa0VGekhUc3dwTDZSRmNMK1d3OWl2?=
 =?utf-8?B?ZElEVzIraDBmb3c0NDZ0S0tNSG9sL1ZiQmRBUkZkNXU0aEFFNEhCbnVoQUxN?=
 =?utf-8?B?RTVsSkN4TzNGVmRVaUVVV0tSalNlVS9lTmRkY05MQWhrbWt3TThNaEJDYUdU?=
 =?utf-8?B?dmk1N2FzOFF3Y3Z0RittMDA5R0R0eHliNFc1dkhhWHk3SHZ4VitFNlphUmg3?=
 =?utf-8?B?Y2ZjRjI4SXVsT0dDZm9kNXEwbjBCMzZ4NFRRSk5DV0E5OWVyNENobEM0SUph?=
 =?utf-8?B?cVNhUnFLSjIrZDdUdjVnQzV6aU5YN09wWXFZdUYrKy94NmdZR3gxSnpCY3hQ?=
 =?utf-8?B?VS8rbFNTQVlndDNudUJuc2txMFgyUEpRbGdjaHBqV0tOR3kzK094ZGVZZTRL?=
 =?utf-8?Q?RFKG+H+dWC7AagCIFG4u1f9WS48ngvqiBS5hY?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 30382cca-9003-4f7e-794d-08dea1ec8c62
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 10:30:47.4394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rULT2O7q/RobnPJLBO5qtoDdNVbijNtwJQUOpgYjNG6XFEJAJ/7cPouK1X0C/KPonHp+z73q3qMA7kyAiHExmfjXhexQPASrPR4EYw3lgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7389
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 10:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235856

Hi Ross,

On 4/13/26 10:22 PM, Ross Burton via lists.openembedded.org wrote:
> There are CVEs such as CVE-2008-6713 which have a CPE of *:wic, which
> get reported for our wic now that it has been split out to a standalone
> tool.
> 
> Set CVE_PRODUCT to yoctoproject:wic to avoid this. There are no CVEs for
> wic yet, but this is the likely CPE that would be used.
> 

Considering the many different CPEs I've found for well-known pieces of 
software, I have a very low trust in "likely".

It'd be a good step forward to document in SECURITY.md in the wic repo 
which CPE to use, to avoid having too many CPEs if security researchers 
can read and follow instructions. However, it seems SECURITY.md isn't 
available on all branches on wic and it for sure isn't on the master 
branch, so no idea how we're supposed to do this. Adding Trevor in Cc.

Cheers,
Quentin

