Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 704E9C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 13:18:01 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.66])
 by mx.groups.io with SMTP id smtpd.web11.18508.1738329477513831386
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 05:17:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=BSKlJTsL;
 spf=pass (domain: cherry.de, ip: 40.107.20.66, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4zA77QKD9e0lwN2Dr7OO4nBIjzd1pQTxseYseN4z2PIfAvTy5rBy/9RHv7f04mrmvR5iyVrO+puapI7zx40A878N2/Te8JQNg/p/r/PT6s6oAQzR3TFEGI+wxLUeCo3xPlbPYGiMy9cB0tDcOGzmndsW5o6Ato0XBn8JcnSt41dC0r4S+Wj2/zDk2ifyEXBe0Qrc1+j7Hg/mzCg7TWErTql/tFaeYV6n9cBHgXbnH6l+DtZmta9Duxv/wpeK6LliIJh/3SqkRzsNVt4oUyT5cPkezVHqpNELeBNftAIRCj/qJauiuqLz+SyaKWwX0NpF/aor2/g8rApFD1sjdInaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Nqc7CZiIJmOFTi3fNFuU1vXpFlYRYxJxUmuPGHo/zg=;
 b=ThkQfT7/uJQzssWy9iEAqYB/d9pyXZNOMyEwhRRUKLwj972nb+V4gOJns/CZfv9vulUCBHW4X4xdnvWPp9iZNgL2UVquewluEC+1G5I8nJCthjyFiz/9LmFMTfQEM5RIcZ7aBso1mt1i138uzxPKiHb2FdaSVOHYgc5N6WPIbL/+lRhUCZ3pxG2Kh+QcXvmNc0KFsDXibbSPvBpBKbySdvx8FLRK7uiGmGG1V3a7E1/1Ofolmz312pObQB2WVJMPbsVTAfGVoKJnRCQIv/XQX4Ev9xHvDt+MbtZIousjV0/80JK/aD1xR626x5ZPfS9zecFYOCi+CwKizbyH7zpjDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Nqc7CZiIJmOFTi3fNFuU1vXpFlYRYxJxUmuPGHo/zg=;
 b=BSKlJTsLtXScRCpiALQ1xyYiMwAwNGJ/R78zH+tXmZVlayddRIPglprY2Ts0xPa/HQ4idF6DIz06WDeD9uRj+IGz0u+/tv/0C9qKAnfeSHPmkNGa1OiCtIqXR9UeWZbWQ9deG4GEGTQvc8hUkYe1lspsf7nETB+FfF1thTy5Yzk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8643.eurprd04.prod.outlook.com (2603:10a6:20b:42a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Fri, 31 Jan
 2025 13:17:54 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 13:17:54 +0000
Message-ID: <dfcadcaf-64d0-4a4b-a0c7-cdcd5243175a@cherry.de>
Date: Fri, 31 Jan 2025 14:17:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa: upgrade 24.0.7 -> 24.3.4
To: alex.kanavin@gmail.com, dbaryshkov@gmail.com
Cc: openembedded-core@lists.openembedded.org, Markus Volk <f_l_k@t-online.de>
References: <20250131123519.461671-1-dmitry.baryshkov@linaro.org>
 <CANNYZj_9dkovbXGmvEx4RC1aUKsNOGiqOq7WcM7eP_59QwH9eg@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CANNYZj_9dkovbXGmvEx4RC1aUKsNOGiqOq7WcM7eP_59QwH9eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8643:EE_
X-MS-Office365-Filtering-Correlation-Id: c638de45-5ccc-4bb1-568c-08dd41f9abe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UHB0R0xzUXFJSnVNQjlqOVpFOVZpMXVueTh1NnBDQkZBQ1lxdS9KK2JlenB3?=
 =?utf-8?B?U2ZvMWpSZWNiTlgvdWVQaWxqVHlOTkkzTmdQNFZkSjJ2aFdpVThNTENiWnZ4?=
 =?utf-8?B?aW45TnYzQTFHbXdYZFB5SXZUbUp0VEYwVFRFVCthVWdBVFNGejR1UTFDbCtR?=
 =?utf-8?B?YWo0RTdrRzRoNzI3d2FJNFNndllsODlwQmRpTC9DNlVOL1krb3pzWktYS2xH?=
 =?utf-8?B?TlpDKzNSNnlpaXJ2b1I5VXp3dUpsdHp5YU5LalVTZ2VSRFc4czcxUDZBQWli?=
 =?utf-8?B?RVJUcWhpdzhJckE0QjhLaHRpMmF4Y2lGS0tzSFRFSy8zWkh6VDFucHZZMFQx?=
 =?utf-8?B?clpQWUFSY1JzZmw0ZXh1eVl5VC9rTEp5QzRZbHZBNHhOeUJhS1FEbkx2bWZ6?=
 =?utf-8?B?aDVIYXJoRk1OODJqcG9NVFhzVmRoSjEwb2J4SGhMRnNHcUNIZlhnNDVUcEU0?=
 =?utf-8?B?cXB6QzJLR3BzZHJVNGNzaDN4R2RLUEFnMGF5aEFjd0hlTVpWYkRyYW54UzBu?=
 =?utf-8?B?VkQvTC9rbUJWVGVDNUNQOHlJd0hnWUJpRy95QThBU2l1ZEJ1YkFxaGxzbU9m?=
 =?utf-8?B?c3lrV2pyYllrOXM4QzRvRnlvRTluTXdSTEF2UVZkZ2Y4TTBySHF6K0ZaTXJB?=
 =?utf-8?B?OHBUbE1TZE5mejVpYzNtUFF0SjNJcFZOS0F4bTBuQS9jOU4rd0lrMHZrdmR6?=
 =?utf-8?B?RkV5QlJIenhuQ3dOZ2NoRFF0ZnlQTzNWajlSRkEvZEVMSTRUbDdvazVNNkpi?=
 =?utf-8?B?NFdKNnNuc2xaQzNvMldTd2FvM0FvZ083cG1KMWl3N2FKQ2tIa0xROE45aExl?=
 =?utf-8?B?RGpRRkdUWWFMMUZwM0pta2lhRGt2T1hYSmlvT29ERHJreGZuMkp0WEdBMTEy?=
 =?utf-8?B?M0tONHBUVDNzR1F0MXpnQ3Z3eEc2a1NtdjlLUFpEa3hZYmg5T0NPcVRVUndo?=
 =?utf-8?B?czk0ZVJxY3FwL01jNnFoWHA4bmZuL2s0Q20wOC8vbWhwMHdzOGZ0c1o1aGFv?=
 =?utf-8?B?bExPNkJZU0JLTzd2L2x0dFFUK0taMGk0SElwOVNPdXJySXBWTGFsRUJ0QVVo?=
 =?utf-8?B?d3o2R3N1V2hKM2p2d2U5ZHdrTVlNR1lkWTRRQ3Q4dysvZVpkR1FRUktJNkZL?=
 =?utf-8?B?alI1dUZuc2c4SDBTZ1pXVWhzRk80WU0vK0w2akFzZEZBQ3RvUWpOSDRMLzRu?=
 =?utf-8?B?ZHR0R3puUkg1MVpOSUpTeE1GU3ZXWXpQc0FTeVJsTGRMek5GYS9WM3kzdDhP?=
 =?utf-8?B?Wjl2bFpwRUxHTzB3eXR2ajYxZ0orc0trcGIwNUdnVjhxTlZBNWRtdnhMOGd1?=
 =?utf-8?B?dGJueVg1WFYwaHUwczNnSktabCtaNGRGc05uL2ZuNzd4Vlczbm9xTDN0UmY5?=
 =?utf-8?B?TjlyMTdyZzRoOGZGVFc2V3NPMWswN1lCK3pkRER0MG9Td0FFT3k2dS9iQU5h?=
 =?utf-8?B?VzBYamtvS3pyRzdyUmxpSysrWG80VXZEenkzTnZZbXJZbUxZQnE3SUFWVnhM?=
 =?utf-8?B?ZHg2cWJhYWxWOXRzLzRtc2RIZ3lVNDdsUzlaa3ZnYWcwdVpEVXZ0Z3hmb2kw?=
 =?utf-8?B?ajRhVVVoY2thZStXNkFzc0tKU2dveTBDQ3NCUXZWNlVUYzVoTytXaGI0amUz?=
 =?utf-8?B?WEtxSVRyVWdFTWI5TSs3MmQyRGt3L0l5UjlhRTc4VG1WZWJzVE40ak1YY3dH?=
 =?utf-8?B?V0RYSVhONjFheUVYdzBUajhIQjBpYS9nU21jbHVueFN2WlFsbG56WS9ybFJ1?=
 =?utf-8?B?OU8vZkI0aGRsQ1RwN0V1WDJYQnAxT0RRLzhnNWp3OHJMS013WmZEcC9rY2xy?=
 =?utf-8?B?eGNUWFNnTjhMSkxjV1RsaUNLcXJEdVZrblhpRjVLbmxseGJjZDVkeG9lY25O?=
 =?utf-8?Q?yFSiyZGy3Kz1s?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TkNBT0JsUWx1ejFXcU5QbXQ4WkpNeWhQM3ZYRCszTm5IK29kRjZXMVlYZnlN?=
 =?utf-8?B?ZXd5ZzdibEFXZmVxS3FjTVQrSEtLaXEyQXFPY1JRU2JUYVhwVi9PZFg3TW13?=
 =?utf-8?B?RW9JN2NZM1laZlB0ZUxYbG1xSUo3T2FWSERRb2tyRWhOVlR0Um1SbzRubTNu?=
 =?utf-8?B?K2QrZDNVSG4wNWxYSjBrTnVITE54ZXVnTmZsWElEV0VCZmFJandqYzNDb01h?=
 =?utf-8?B?bGlmQ2F5UVRQSGE3L2lLc2tLNGMwTUxHRWVaaGlFc0E1WmJydmhzL0dLeERk?=
 =?utf-8?B?UDdHYjRMNHdPL3BMS3VnQU1kUzVzN3hyRVpvQzF6WGVQOGJrR0xEbVM2WEEz?=
 =?utf-8?B?K1ZEanExOWQ1dTJHZ3hhMlg1cCtEZVJyalJtVnNMS1ZCakNHWGdhM2cyZXdy?=
 =?utf-8?B?QkQxVUdrTGlSRzJKdUJOVWw1dGhnME9rUStkZWtoR1FRMDA0N0E4YjZOb3ZD?=
 =?utf-8?B?MEU3dElTMGdUMHU0Ukk5bnhzK0VqM2lJcmxpT0RjT0s4QVB2eEJrWFNuK0VE?=
 =?utf-8?B?U1lTTmVkMHV3SkhoVjh1TnhaSlV1MmRLQ2tqNk0wSTFTa0owZnBiNXlHdHU0?=
 =?utf-8?B?TEVMODcyQ29Qemh6MjJEOFBleTZJVGNEZ01ZZ3NqUVVqQm1kellWczZlT2lt?=
 =?utf-8?B?djBiU3hXR2tKNVJKbjNldjRncHQvazVJbDJaTVpBbkI5dzY5Vlg2am9MMWJo?=
 =?utf-8?B?NUtzMXgvMUV3NU9RWng4ZUttT0JBK25Xb3hzNkVZTCtkc3d0a3kyNzVCdXRw?=
 =?utf-8?B?MVFCUEViUnVMSDRTYVlmVFFjZzdIRUtjMkpRQm5mc0hKQTlVeUJ3V1N0ZzVZ?=
 =?utf-8?B?VWNsSHd5UVdZRGVZbUZpeGo1WEVhbDBkbk5OWUw5c2o5WTdnSklScndoTGgr?=
 =?utf-8?B?RXJzYlg1bXBQZ3hML1UxZ0tjKzBwWjUwQzUydWlaYlFUdkFDY2FIaHFyRDRL?=
 =?utf-8?B?MjJuTUJWZkZnK3JRTnFjMnowOFBtWkQxUGJHWkd1Ly9admJ2Y0I0aDkraS9k?=
 =?utf-8?B?ZXp6SWNPMWRqallZakkyTWxqakpjUWk5YncyZVE4RVkrSHNLdjBNdEVZb1Rn?=
 =?utf-8?B?TGNBaTlLUTdWUU95RnhTRElCME9sY25ONUhidUh2MldYTWlKa01OY3JJeDVC?=
 =?utf-8?B?ZDNuNVVWVDFuY3hMeEJUTExvM0ttS0J3TnRoS2UxWDR6bGJCV2gyVTJMK2dB?=
 =?utf-8?B?Z0IxRG9BMkVBYksvcHNHQnIvenB3cFFPNXNlZFlTUkI3MG9Ic2tDRkFxbktn?=
 =?utf-8?B?Z3NTNWRxd25udFBpYXNZUkRPOVMxa0F3dERNdnZHSGRWQ2JJN0J3Zk1lRHBV?=
 =?utf-8?B?RmkvV3RXMTI2T0JPRndNZTBXWW5HWC9sV0dkWlJJV3lwSncxMFNtNjlhdWp1?=
 =?utf-8?B?WnQxL2NmRVozME5RNU8zK3pmSUNNREE2d0hyUVlxZE50SDFtRkNlUW9XeVV1?=
 =?utf-8?B?dlRzRVNsY1psaExmUHF0Q0NncTlyKy9ZT0Y2NXVKdDZmRnRwZlVLRnZ0VWtx?=
 =?utf-8?B?VWJUZkhuUXlhVUNZMFZNNkxMbGxMYjJLdDdnVVQwS3lINWtjZUFVSndyZGhT?=
 =?utf-8?B?NEtHaUt0dWtOeUQ4RkFmSmp4UENXNWZYaWJJRFZRWkhpemcvRjZRSUhyeDhT?=
 =?utf-8?B?aTJ1SXBjL2x0aDBLTGdkdHVFZlZUWWlXaGJHY0d4czFQa2F3RmJIUHhOOWhH?=
 =?utf-8?B?akt6RTdFak8wYTlaZmttZnR4R2h2SEVWRXhQUXE5akkwSS9yZ2hwdGJGUkhB?=
 =?utf-8?B?dVpQd2JSVGNscFVjN1BEQVZSK1oyd2VMRXRXaVpzMVZPdklBUVhmeGVBRGtR?=
 =?utf-8?B?STFMWkd1WDZLamNrMThERVVIZk5vQTNER0J4a2V0RUF1MU80S2RBNk93elY1?=
 =?utf-8?B?QTF2cnNKL29UYXpjNjQ5UXlzZ3c4S2RhUUExOHU0ekVsa2FTTm5wT240dk4y?=
 =?utf-8?B?SENYak9OaHVnV0s4T21EKzNlMU5DcFpHY28wWEV0MytOcU91aHh0MWhDYUlz?=
 =?utf-8?B?eVorTm9MN3ZML0pHMTFzTE5RcjJaK2grU2ZTeGJLUUFjNTZoU2NXYkZtTXAv?=
 =?utf-8?B?TEU5dEZZOFRuaysybWZMd2F5b2MwRkZmdzRiK2xCalNhQVhUV1BFd0ppZE5w?=
 =?utf-8?B?aE9Xbnh3RnRGa2tReTNQdTZHT0pDQXlzNmR4eGloOUVzbDZ1cUYyZm9RVXFG?=
 =?utf-8?B?WlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c638de45-5ccc-4bb1-568c-08dd41f9abe4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 13:17:54.6628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15ss2xpUcGLIVoLvadVrJ6g50/j5IPvxI3IY9shaePT34FcA67y2+UeVkYloPJaqSeTIF8ypcWtkSE6cTzbZl1bTQd+eultu00GSB4mnWts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8643
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 13:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210481

Hi Dmitry,

On 1/31/25 1:59 PM, Alexander Kanavin via lists.openembedded.org wrote:
> On Fri, 31 Jan 2025 at 13:35, Dmitry Baryshkov via
> lists.openembedded.org <dbaryshkov=gmail.com@lists.openembedded.org>
> wrote:
>>
>> Upgrade the Mesa package, dropping applied and refreshing outstanding
>> patches. The dri3 config option is now gone, dependencies are merged
>> into X11 deps. The swrast gallium driver has been split into softpipe
>> and llvmpipe drivers.
> 
> How was this tested? For me it fails immediately with the same error
> as the previous update attempts:
> 
> | Run-time dependency libclc found: NO (tried pkgconfig)
> 
> Basically, mesa updates are blocked until clang lands in core. If you
> want new mesa, please do help out.
> 

For reference:

https://lore.kernel.org/openembedded-core/20240531-panthor-v1-2-1a76fd752c1b@cherry.de/
and
https://lore.kernel.org/openembedded-core/aa532133-c872-4bde-8479-dba12de225c7@bootlin.com/
and
https://lore.kernel.org/openembedded-core/20240908165102.3699657-1-f_l_k@t-online.de/
and
https://lore.kernel.org/openembedded-core/20240908172311.3773048-1-f_l_k@t-online.de/

Adding Markus in Cc.

Cheers,
Quentin

