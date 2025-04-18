Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48707C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 13:58:19 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.68])
 by mx.groups.io with SMTP id smtpd.web10.12202.1744984697072283711
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Apr 2025 06:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=mMhegwYk;
 spf=pass (domain: cherry.de, ip: 40.107.162.68, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3ZsnjUDeqWhW+dOPZjfHhKgr62OzQiaabCtx1BDVFZJG6tSAZA4GKhXBgoif0OA0iWaOjKusjMgPc95f1SCyzkwdnZ7ZPDEI4jvU+lWCt/xTM+Wb2O8DFpMnMtg5gjJefVzfOVccB0+IxJPgg3IUrwN/WLl13MY+skfJsL/fQgheirSc3rXqBYZbZ3YsL2VpQtcwZGuSx7SpbKZuwhzvOCwe/Q6LfGkUaMrZS2IS5RZVUEIoQFJrYZPnwuEFGSghVB4uPoLh8xvOAlefdzSNghTkNLQ8t9RTWVV4rcHfF408QoLS1zdTDXFGtmzwo8T1tPmwpnuPjCA/yjbqwrGFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTa8kkBzpwcHS5vlayp0WVD4Wp5/iCg+r59ihAM+qU0=;
 b=YkIwb8ixO+7hIX7Jh/RYQ/X3SQPefggC7e6EgD83CesyKSer/Zgp62UGI0v8/iD6nvwXAfPsjSA6YbdDq6PmgGUFI+kTs7v+L6kOlf7g0B4GZmJwGcBhnMnqpla6nYkrT0xKq2fhNJmz7XjSBbRHGs6ExJqm4YBGwnm03fkHWmkEnSJIIHGjfXbxjK2MIeu5P3H+ytnm6TBUUQlc4HMQriJpLLQyg0PumBPmvWv+MJL6juDnOj7fKatUAWPwrszhZdgvajzPuWJGX6HgObkdpIfraLsH0IzVpuIKbFluJYZE2g/wly+bQB9gtEimyIOokoPJPdK1+DBctzQ3QWzykA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTa8kkBzpwcHS5vlayp0WVD4Wp5/iCg+r59ihAM+qU0=;
 b=mMhegwYkYsCpMGfMIz86ElMwg1XMBMkLIJ4OHVeNU72BPOUy82kty+rEJ/ufpaoc1SYTE+IiziWx855f1b6cbeH3E9jDvg4fuUDxTAkoTEcaGvmyJIv8kLt1zb0BGpiNjMz78vRf3HE+HyJwinBqA9AKrMBPkAFAT2/edARQRq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PA1PR04MB11009.eurprd04.prod.outlook.com (2603:10a6:102:482::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Fri, 18 Apr
 2025 13:58:13 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%6]) with mapi id 15.20.8632.030; Fri, 18 Apr 2025
 13:58:13 +0000
Message-ID: <646544e6-1a52-4a17-ab9e-4b31ebcb6dfe@cherry.de>
Date: Fri, 18 Apr 2025 15:58:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v2] send-error-report: improve debugging
To: thomas.perrot@bootlin.com, openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
References: <20250418133504.932848-1-thomas.perrot@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250418133504.932848-1-thomas.perrot@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::6) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PA1PR04MB11009:EE_
X-MS-Office365-Filtering-Correlation-Id: cb8b5115-3850-4822-b191-08dd7e810f8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VWl6R2hseFBCTFErWTdDRkxmRHgvMlZ3SGw4TUJldk1CRXhIL0xvbytnc0sy?=
 =?utf-8?B?dXpFRWZxejZiMmFRblFtVnVNaXZvU0g3L3d0Z1JBRFF6eEVIWjZZR2lQdHpP?=
 =?utf-8?B?dWtNVXY0UmN6RklZcUw1YkhrRUtLdmlGNG1vSVFPcWR1UEtNVVJ5Q2pKL3d6?=
 =?utf-8?B?cllDOFdaRTJzTXVhektEMGpyT0RjL3dJeFJuRUI4MWZhTWRCTUJONGJzcHNn?=
 =?utf-8?B?Qk5Ldmt6aEhmeGpzUHBRaEJkb2cydlArTm5MR2F6elhIREVVK1dHbndOZlV1?=
 =?utf-8?B?QVAxdC9NWjZBYkhqd1ZDNmNJcGdLakE2cmVQQ1gza1R4QXh3YjJnV09icmlY?=
 =?utf-8?B?T2pTM3pFSWhJcHUwWDFEUW5SQy95RlhsNXpkNkpUTU9zeVBibXBoOEx2d1Vr?=
 =?utf-8?B?LzJTRjFUZ0dtZk5zOFpFeHcvRFZZdGYrTC9qa0tlQWRRcWdPcjVFbDRsTUgy?=
 =?utf-8?B?QXRDbTdaUWVDd052ZDBUaTNzQ1ZmbExXZ1VGTDJHZmQrUWg0MitEYnZKclNY?=
 =?utf-8?B?aDcyVVIzSGp2eWdXV282Zkp1SVV1YXZoM3RSTURmM0RvOEJBRDN5eGxiMUx0?=
 =?utf-8?B?dnJMbGx4OHVzNUNxSXZaNExHZFFKTVJqMXlWWU9YU2RvVko3SzErclpSUXZ3?=
 =?utf-8?B?eDAyR0NQdnBGb1hyOEFDQVlrZFU4TnlrSFhPMkJ3RlFaaGpMOWY4K0RPUmNJ?=
 =?utf-8?B?UWw2SmxuaFZVbzFzNWRaRkNMMmJvNExPMzcvYUVxYk42d0xlc3FWQVRVN0ln?=
 =?utf-8?B?ZUNJUkVSdHB0cmNSVkJFNktmRHF4eURLM2xSTStNZHN3UmN3UnNvTHl2NzRQ?=
 =?utf-8?B?ZFd2RWRsTWx0U2lxaER4Sk1oRFc0UEFEWE4wcHREUmpMbzl2NENXMHFQdUFL?=
 =?utf-8?B?TnovdmxLM2RSTnN2MW1vR1lCZXVPM211cFBnU29YMnF1dzRabklKSVhHNzZX?=
 =?utf-8?B?UE13R2ZNd2ZCdXBUbWgwOUV0MmJ0NS82MzBVazVOT21zY3NzSTU3L3ZqNkRO?=
 =?utf-8?B?c3YwLzJZQzZJN1hyMDQxRElYQjVtRTlwN1NxUmEwNkFsZ1UvYVEzaDNNemRS?=
 =?utf-8?B?aG5sVnk4NjhEY2pScVBIS3JGaTBjY1YvejBrTCtZRGlvVmVaWVNSK291eVJh?=
 =?utf-8?B?V0dUdVZ1S0huOGg2T1lGL3pnMVVYTnFsZlRQNUJDcDFVZktqTUp3Nm5lWllM?=
 =?utf-8?B?TVFxWER5UGNTdUVNbVN0Slpjd2Rxc0FFZGRUa3RSeGJvUCtONUZ4Q2REQVpB?=
 =?utf-8?B?WjRLOGNuY2lvTVNGTVpCNlJoems0OHk3b1Vjek83N3k1Lzl5em0vcjdISlk3?=
 =?utf-8?B?eTl0aHpUc2laTHpVeFBOZjRGNC94T2lYdG13UGJRRWlTS1FTSlE0ZXJaRUVp?=
 =?utf-8?B?MTR4V2Q1VkJ6SExvenhlekhqcnFPUVA2ZVBNaUlZMUJHVFFFL1ZxUVdRUEc4?=
 =?utf-8?B?WEVsVFpHV3VmOE5CeEE3K2VyUlZzKzlMWktXL2phWFIzcUJDMS9ZVHpqZHZs?=
 =?utf-8?B?RzU1bGlBU05JSCs0U2RhL2ozdENuSFZXVTlTaW1XM2JMTldDMVh5cXJIUUZm?=
 =?utf-8?B?YW5XeEdicFJDNDB4MU5qSGxuaWhEWDVGQk1mQXdaM3ltS1dtTTBkazAvL1A2?=
 =?utf-8?B?WEsxK1N4a1g2RmtoSWk3UjFSdTFrT3RNM2FuWnEwTEFITktKSXgvWHBKSnhI?=
 =?utf-8?B?MmVZbXJMMGIwYzJaN2d6SUY5NW1GelJ6TFdPUVJRRFVXN0J4cmxRa0x2aDdG?=
 =?utf-8?B?WE5GbFpHWGZjdmR5Q3B1WWVFbit3OS9YcHFwUmtaQ2pHaHVCR0c0R2VxanlC?=
 =?utf-8?B?eEwreU02OGpHTlJIbFFjRElrVHUzaUNYL3lXNVAzS3VrdTVSWS9lYko5NmV5?=
 =?utf-8?B?cHlVTjBPR0ducWg0N2dkL3lsa2VsdkJVbnQ5NGZCN042Nlp5cFFvVTZaNXA3?=
 =?utf-8?Q?O+1VfDzoCII=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bS85TXVHWERuK3pIbnVuNSttR3J4NVdEVVVyYnFFOEVTSG1MWHJHd2lzUEk1?=
 =?utf-8?B?Vk8vaW1zOGhOVnJKdXIzWUVpLzdnd05xMGFpZlQzcWRZRjNOM2htYkM0ZVBI?=
 =?utf-8?B?NzFLWmZwTzhLNW52UitPenUwc3BZWUlQcmNSemNraWVXS1NYY3U0UVZPQTZq?=
 =?utf-8?B?V0h4MFhZUWM4ZkhNUFZXemQ1TW51OE1yNGxEZUowQUFQR1poQzFrV0ZsY3ZP?=
 =?utf-8?B?S1JsWWpOekdFYkZMVytRZVc1VEJVWjZ4TVZacHFjYXVKa3k0MW9oRUF1di9a?=
 =?utf-8?B?c2ZnNmk1Tk9TblBuYTZSc2RqMUx4MHMwaGgxTTFJWExkejc0ejZucENCZ0ti?=
 =?utf-8?B?ZDZoZGZxN3FhTjlqZHR4eFUwblFiVE9LaWNkcUpNcU9YQmJpZjhEc0ZyRit5?=
 =?utf-8?B?cGdETnYzZy8wVXVibDRVOGFlczdqaWRyZW9Kc0NzTnVKREFmaEVpcmZ2UGdP?=
 =?utf-8?B?ZDAxejFhNU1SVVBiMFovdnMvcFpwSFpMZUVpUk9iQlQxdHpPZnUrUm0rY0Zq?=
 =?utf-8?B?WTNwNFB3TjBGSWZQSytpUEliZHVFZW1zd011aWVPUmFYNWtrRzVmbTh3aGp5?=
 =?utf-8?B?V3ZyVWpMSm1NcStGa0lHUmNLdUl0MzBoUTQ5MmQ1dXpaV2hSMktaaUVvYzRD?=
 =?utf-8?B?Ukh3QTBNeGhLbW9HV1h4NXFGTHhlZ21uYlNyS1FNL09HclFxYUo2SFdRNEVy?=
 =?utf-8?B?N2VPZnovT2p3UCswOFdWWWxhQnBNamJHcUE3STU0S3dCa1F1cHpqODVZSWJt?=
 =?utf-8?B?UXJsbUxvcmdta1lmMzcyZkd1QnBUMWxCZjUrYkNUUlBYdElqK2JXcWFSTElD?=
 =?utf-8?B?ZGNlVnAzU2NLUWF1TC9MclVJdDI2OXFmd2tYQzArU0dtbEhUNjVOZzc2QU9B?=
 =?utf-8?B?dEdMVGhTMVpETTNUT3l1OFJFcVVzUUVaMGRCOHBMWGRrR2Y1Z1lBYjF2WWRK?=
 =?utf-8?B?MUdTMU5NaEdyYUNzQXZsYWJFdDZRVFE3SDRNcVR0UDJoc3ZXN3lmVURDM1Z1?=
 =?utf-8?B?Z0xsaWYrdUpETE5DRG9LM0s0UVlQNXFvK20yMzdiREx2Y1NZbFg0YjJsRWFZ?=
 =?utf-8?B?UG5QMVZ3YzBucnllTjJOUkpnWHNkQ3ZkS0JaYTdlZU54Qnhwc29PbFdhQjlu?=
 =?utf-8?B?NVpOenZVOS9yNTJ3bklzVU5LYk9MUHlrZ28zYTdPUllYenFncytQenNsYUsr?=
 =?utf-8?B?V2cwbmJSN0laUGJHTTFwTUdrZlo2SmRNaUM1eVVtQWk3MFZnbjFISkNNejY1?=
 =?utf-8?B?enR3eERLeXBwKzhaSHdzRXpNQ09xMFd3NlJ5VGx3WklYR05ML1lPamVVYmVY?=
 =?utf-8?B?Lzc5THlZVVlJSWJLeGNkUzZGei9KcW5NWWlzWHo5bDQ0dEttWGxnalE1bmNm?=
 =?utf-8?B?N0VBb3M1czNWclFWaExMWTJSTmdHTmFDeHY1Nk9nVk9ydHBLTE5FTzVqVnRX?=
 =?utf-8?B?T0ZsWkxVQThtSHRkZENTQjNZTHlIM0czVkFiYTlOWit3VmZxN0kzS0s5OURu?=
 =?utf-8?B?dzNMNys3NWhMVkNpZHNuUVhEc2d3Yzlsb2tRQUJ0a25KUk9Yd01kd3B5dE5y?=
 =?utf-8?B?RUpqWjgybHZ3QjBBek1nK0ZZL2JMZ0prcmQ0cVE4UUsrNENNZjJGSXF2Y0Zu?=
 =?utf-8?B?OTZjWEk1UVRNZXpxTi9EdXptR0VHVHdic0RLMGtYc01OUUdZZ2wxTENEQ1Jy?=
 =?utf-8?B?T09EZ2NmZ1dqb3g3bXZKcE1kUGswUE1mc05DMDhNYzVHRW1PWmZQRUxOMVli?=
 =?utf-8?B?aEwvYkQ0eGxYL096ZGE3NUw3RGIrajFDRURsYnhwZCs2R2wrM1NxUzZCeGRM?=
 =?utf-8?B?LytsRmpwandsaXpvc1NUNzRFZTNHNGVLWWIxTFBqMDQyajVCeTJYRkRtZ3Bx?=
 =?utf-8?B?djRobzBZZm1TYzNlVU5MOVVIcklQUzN0NWRVdk15eEd2QjRpRVNzMGtRS2xC?=
 =?utf-8?B?c0Y2eTllSnc0RHNvd0o3TGRJZktDUk0wVFhLTWQ1U2ROZDFDTllOTUkxanlm?=
 =?utf-8?B?cjlwTG9qbDdkZFE2SGxjQW5FUEpORXdrazhPcytmRjluQjZoY0lGejBOZjNz?=
 =?utf-8?B?eEZIVXUraGJlOGNRTnpVRGlTMG96TUgxT1NYM2Zwc0JzZzloazQ4NlM0U0I1?=
 =?utf-8?B?RHRWOGEzMkRSU082SWVzMzdrMU9QTm1haVAyOWhSWXFUR29EYWlQSDg1Y05J?=
 =?utf-8?B?SHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8b5115-3850-4822-b191-08dd7e810f8f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 13:58:13.4623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aVvVMG3ViQJ63IgXe+trHKxolLCy/2IxNYgsBHJuF4aA1UN7ZiMmHtZb0SfN0sGl1CBXXLhRtJPd33WH95jDy7nNU7JLWUbLax1C1b0cp2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 13:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215133

Hi Thomas,

On 4/18/25 3:35 PM, Thomas Perrot via lists.openembedded.org wrote:
> From: Thomas Perrot <thomas.perrot@bootlin.com>
> 
> - add a debug mode
> - print the request and the response when an error occurs.
> 
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

