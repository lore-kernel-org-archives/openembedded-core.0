Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECB7C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 16:44:50 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.98])
 by mx.groups.io with SMTP id smtpd.web10.18134.1714754687476036314
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 09:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=UnrrOLGS;
 spf=pass (domain: cherry.de, ip: 40.107.104.98, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3vqL6ti1/y3/3VBWXs1Li5vOkW1zj5wbirnQUZkLgxMW0ikUmM1rgFvIbTBbHm5FKvgm0HR3CdIVpiLN7d1IK2jS9E3AIVmKFHweb1mMDQfC6Vlnm6z6+ZCm3E+jhGxD34xpz9WneH37Mf1HUUUxzXfN/h/YRSbuKriCRx2wvndQhV+VIV+DXtiH1yrfVFAj99nFkjHbg/Qz+T+tiMmc/9Mfk8Q4BBQYGSsm9xZoTdPQmajtwC8IQVAOv7o+qIYVRCghKN7An4fibmUH+nbgarjpaWwYuUQ4v9uWEAWUDBqmSAzbV49OHZyuWlqtNqMgl9cXFMlU78rIsuVkazQRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmysS0xzq4+3aBLBHHOH93sjMT7XlR41lFRaHvhaXME=;
 b=h+GFpXCEJgfXgjKIGd27thyDO+Zod7bWaDDzD9LJ7E3YaN/5e0dwNbQWGfpSgIVaba3MuxusxOo0ikyivL+TFB1QwXsd420a6aS64LsN4tgQFEFh+u9542yoq2Ardz0iQKnCHI3ffnMMNK6Up6/SidlX/1Y1kT9pe9joX5NlC7SD8TcYS9jXpTDVlzXGQdBBe1DmcbKjTI0z4DNa3ur7RpckadSpMjHzztnVLJZtyqk1CNw8WFFl04oO/9XviiNMjb8zc99XR1u7PYS7v2RXFBaAOmuihWQpFSvRgcKn147GAyVLqT9//ctkf1ycT61sncT0ane/ZqH7EaZnnufwUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NmysS0xzq4+3aBLBHHOH93sjMT7XlR41lFRaHvhaXME=;
 b=UnrrOLGSIDdUhcaJYpVGYc6UNzs7Y3/nwwhSsnaMtzVnoyq4JL4QTz+hzTUspRtC0XHxBTm6A+oHP6TVc3DUjXD6jQOnX5VXIwuVU0n7RndDyw7iIrpHe5TNHjyOHQPHTlF6aeNJR7DLboVJcZ5GtHVVnGIiBkRvCRn85BHQKmg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com (2603:10a6:10:1b::13)
 by AM9PR04MB8794.eurprd04.prod.outlook.com (2603:10a6:20b:409::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Fri, 3 May
 2024 16:44:44 +0000
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::ac08:df46:97bd:4ae6]) by DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::ac08:df46:97bd:4ae6%6]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 16:44:44 +0000
Message-ID: <e7b395f6-b9f6-4566-9237-42d5b7f9c9ce@cherry.de>
Date: Fri, 3 May 2024 18:44:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] uboot-sign: fix loop in
 do_uboot_assemble_fitimage
To: ralph.siemsen@linaro.org, openembedded-core@lists.openembedded.org
Cc: sean.anderson@seco.com, jamin_lin@aspeedtech.com, steve@sakoman.com
References: <20240503151827.1387077-1-ralph.siemsen@linaro.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240503151827.1387077-1-ralph.siemsen@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::10) To DB7PR04MB4842.eurprd04.prod.outlook.com
 (2603:10a6:10:1b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4842:EE_|AM9PR04MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: 895ffd84-de69-4120-3082-08dc6b9055cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OStQVG9wZnduWFpmWVZCaHBnUysxZFQ3R0o3L1hGaVpaNk5Fbk5xajFESnRX?=
 =?utf-8?B?bWNhNlovSHM1RDBNM1JubWhhVTJDQmJuOTlSTnd5MlpSb3dXM0JCVnVkRG5q?=
 =?utf-8?B?ZThqeFdBeXVsODIwQUJWUmxwaHZvTENSZEI4MHVhK3ZDRXNLQUc1bkVKSGxB?=
 =?utf-8?B?OEFyVndVSGhJRXpkWm1BNTdXNFh3RWhMM0RadEY5TW51dlhXYU9oQ3l5cEgx?=
 =?utf-8?B?eHIyZmV3WDZ4OTZoc2NTQ0srV29WaG1JUGw5WTM5dmFsandOaVFBbFJiZGFk?=
 =?utf-8?B?ZE1yWm5aKzFFYlRhcEUrSnd2c3pIcGdFMjRJa3R6NW9yQTVkM0FhbVZtV1Zv?=
 =?utf-8?B?d0FUUzdNblEyTEV1ZlBWNks1enBsallvTjhRcTZNdTg5MSszY3lxV2ZrV2Zr?=
 =?utf-8?B?cGVqaU1za1FvV2hlV3NkRXhXeWRaSXplbjRtODNJRzF6Z2NFU2s2UGdMQ1pW?=
 =?utf-8?B?NU0zcmdoRUgyUk91MWxvTzZuNjkvZXZtV1JlaVo5dUQxRm1pbTY4T25oSzRP?=
 =?utf-8?B?dFhhWTVWS0ZCM3VkNVU2dENrZTF5ZVo4dzZicWhYdVBoN2RDVC85ZHZwSGha?=
 =?utf-8?B?cTVERVdlN0RFM0IzeUt0UlJTUnFQTUc3ZHBuS3UvRWRJUWR5a2YxankyeXB5?=
 =?utf-8?B?MkJVOFM5MVRod2wvZVRlOW5aMDdYdlpvaDFnQU9yRnloOURCY3dpZ3FHOUF6?=
 =?utf-8?B?MTc0TVQyMlRoWmNEQ0QyUk5FWE15Y3V1bU9ONnAzSHNCTnpuejlidWI3SldH?=
 =?utf-8?B?Q0J0Zzl3cVRlOG55cWovbWdFTk1zeUJJdUxRb3BTRVV3NlQ5MlNPVEpMQVFI?=
 =?utf-8?B?VU96SWRSVlloRTIySzdoU01zUEh3L0p1ZDNwR1dHRnc1bHNIYVRPQnM2Sk1X?=
 =?utf-8?B?ckMvanIrS1dVTVozZTVVR2lvZVM4eEk3Y2lzaWdkWXd0TUFZditabFphVFda?=
 =?utf-8?B?eEJsUHhKT1B1WVJoYnhEZzRVSStFb2hDeFd3M0RDdXZEL2haOEVoSkdhYncy?=
 =?utf-8?B?Y2tsM3dEOFJldDRSbGR4VVg3OUE0MjduTWtrMVhLa0NPb254aFpQeTI0eUJK?=
 =?utf-8?B?V3c2UDh0NEJxQkJQVVkrU21maEp2K2FYUHBMU1lZOG1vZWJuaTA0TmNBbk5Z?=
 =?utf-8?B?eDduQWdTZEIrYUZLYjZ2VTBUb0dZUml2MlJoMzFkQjNIZncvdm5mTGo2S0pF?=
 =?utf-8?B?endJSnczZXd1YjFTNlh6bzlsRnhvd0p0eUNyS3JpZnEyMWJhOUxUSklBd0ov?=
 =?utf-8?B?c2dPSkIvaXZCb2VraDBld0JiVTNXYjluZjlqT1hFL25SZnBzNHhjU1I1bU01?=
 =?utf-8?B?dTNCMGZOWmpOdW1oY3JTeVh2MU13VXFpUjY3cVBOOFVrTzAvdGlaSVZhaE9x?=
 =?utf-8?B?bFI2RW5pSVVMU0t4K0ovaUhubUx2WUxPaXZUcmt2S3p0a0xLNkR1ZW9BUit6?=
 =?utf-8?B?eXlCUnFJUDNhTUs0TE1HamFDRndlUG96ckpyMnhKeGI0RGUrMitFbzZMYnh4?=
 =?utf-8?B?MncyQXQ1RUVYT3pqUzZmSHBhQm92SjVGeVZONVZ4b0x2UW1kZ1VjQW5hekxr?=
 =?utf-8?B?ekVaNnB4Y1JtbGF6cGdiYnZDMmJwRC9jRWlkaGdabloyZFI0SkFydUhLb2pi?=
 =?utf-8?B?NjhLUE5LVG9xcHRLb09RSmU1clUvLzNFZ1hjWk0zRmE5ajN1U2Q3ZGViNmZM?=
 =?utf-8?B?ZmlyT0FFa2pqWkc1bEJWVElPLzZwQ0pQUlJuQkxqWjRyTTdWQlhHRVBnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4842.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ajVxUVFFZU9yMlgreUFtaWRidVV6UHNWUEsrQTYxeDNaYkt5NmJqQ1djZFE1?=
 =?utf-8?B?amtLUWI0RXowZkdsUnBRK2xud29OTGNYRzRtNi83OCttQ0d6VDB4ZUovd0NH?=
 =?utf-8?B?Qi9vOVJDK2tuckR2aGxrQU04MnpDUXpYbXVtOGxIbGxxQjdJNmpEbGNzYkQx?=
 =?utf-8?B?ZGhCd1poejEwZW1sVm14ZllVSy9WOVNDOWpicFNKNUR0VDdoOS9wdmRQM2hj?=
 =?utf-8?B?M2NvN0QzSHUwMkZITGFkeExrdXJ0aVZrdjd6bVAxTWNTQVBWUGVTbU11Zmt1?=
 =?utf-8?B?SW1JNzRTdERkeUFxNXJuYVZYd0s5MC9PN0VmOGRYT1NXME1nTHBWNXdkR1Q4?=
 =?utf-8?B?ejdVTzJlL2l4MDEzQ3VwNEFOOVI4QWtLcTNVMFhsM01BV1dzcktiWmY5TFVW?=
 =?utf-8?B?R2o1a3NkTXJoUjRwb2d0dnJxYW1NQmZGak5TL01iSStxN0xEVG5OMUg1RlMw?=
 =?utf-8?B?ZllFZkpHU3k2cGVhRThqdmxRM242N01sUG1CVW5GeEpBLzlHaHVoMTVaOHJV?=
 =?utf-8?B?QnpWdmVmdVY5OFBpaHBZSExMVzZTcVpsSU5MbGFrR2FwcWphYmJMZ3VOVHlv?=
 =?utf-8?B?TUF3MlprY0gzNVNyVmhHMUlZK3k5ZTdENU03amZSdHJxaHZzS2VKU1ZSS25w?=
 =?utf-8?B?SkZuRG1xeitrYXhoK050Z0JXWGtnUHFtRGFKOWZxejFoUklTOVd6WW9oNENT?=
 =?utf-8?B?QkZNVTRzOHBtYmNiNXc1dXVyWldTQ3BvZ215azNjZmJEdHFDM2xHMW1hVFVy?=
 =?utf-8?B?QWZkMy9aT3hRVG9TWjJMQVNMSW5qbzluYXh0UDh3c0diSVl0VUVkMTROd1Y1?=
 =?utf-8?B?Wjhob0Z6R0t2OUpwWGg1dGY0OEdodzBCOGY3cHk4dnN1SzF3T05rWSs2U04x?=
 =?utf-8?B?K0hvd0hnTEo4ZnMzY1FMSUsvS3RYVFZEUWpIQ1llMVNtQWkvKzZJR0JwYldJ?=
 =?utf-8?B?UlRHRGxDeWNpNXArbzBOSUJkekdZS1RUb2NmYjZpRHVzUzBwQWcvakNvYlUx?=
 =?utf-8?B?YVc5bTVlT0xIWEl1eUFuWmtxd2V2azlMdytSYmt0anV6MmtUTlNNSmVoNXVY?=
 =?utf-8?B?ajdwMEIvT1dNaWgxeXBrM2xXa29SY3lhVk9mTi9BUWZISDJWaUZyWEZVZVRQ?=
 =?utf-8?B?eUs5UGlLRGRoMGJROU9vWHh4S3VTWE1UcDV5cnZvU0RQUXU3OWVXYlRGR0tl?=
 =?utf-8?B?bkk3aGczam1uVnZLamZnZitzRUV4T0czdEh0WDFEaUJuUlNyejhnNTI3STRF?=
 =?utf-8?B?SDdic0syY0xsZHdhbzhUcTQ1YzJPeW1kQ09GRGcyeHk5NzBDMXZBOUJsdWdj?=
 =?utf-8?B?SXV3c2RGWUJNbWJlMG1lSElyNkJhLzZMVzdldC9VTEd4REpwUkwwZkhXRy9w?=
 =?utf-8?B?UCtjK1lydllZMzR5S2tsRjdkZ2k3UmgrMkIrODd6WGNPYWVhajh1RVU3MU9F?=
 =?utf-8?B?MjhPVzA4MHY2TWNsSlRPUkJGWE5taEZQYzJXeFRTVzl6ZTFocWtmbG5EM1Na?=
 =?utf-8?B?UHozMU80MWMrSFQwZ3pIeGdZaFNySHZKVEd6dkpuNEdhZjZtSFhGZmo4TVgw?=
 =?utf-8?B?UExLblRDNnRoZlQ3R3lidkl0bHNmYWEwM0FRUTlWeDVBMzBSazJRbWdqUG8z?=
 =?utf-8?B?bnhJZ0tsbGY4MndiRmxma2NhUm9HTC84MzUrSHVvbHZ4QSt5TXQrT3JIZ2Zm?=
 =?utf-8?B?SlRmcXVHY0F5aktCdmlOUjhLQUNuQkk1ek01QXpVK3JuRXNDTDJ4MUZ5Q2pK?=
 =?utf-8?B?Y3M1U3V3dlJ4cmhkWGtrbzVWU2R0alllb0lGd25RQnZxY0t1a01tcjhVQXFi?=
 =?utf-8?B?L3pha2phWjNuOGtNTm80VnNNUnJ3all2ZkhxZXErWFpuZktGWnA1RDVmNldC?=
 =?utf-8?B?ZmJ0VjZTL3pJamVLRDc5VjUzYVBwbCt0cFJCUmp0K05ZOVhkWU9yUFJJamNH?=
 =?utf-8?B?SGZCNmRONGtGK0xCd01JNUFtY1pEU3dJRkZsZk8zRDdENDJtT3MxSFl3M2d1?=
 =?utf-8?B?Mk1xSUZSblZBQXNMdWRTV2RlYm1Gd1FUMzlybmtNaE1FRUtOVk1XdUlrTEpi?=
 =?utf-8?B?TGUzbHJrRk8zMXpHK0hMdVJONUJzcmpVY3RSRllEc2drUEpVSXk3a2N0WFgr?=
 =?utf-8?B?YzhBbTIxUDJCcW9iQlFRRkNpTzAvNFFpajBKWkR5U3NnNFM0TEhLMU4vRnNq?=
 =?utf-8?B?aFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 895ffd84-de69-4120-3082-08dc6b9055cb
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4842.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 16:44:44.0284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nx7pwOSTAb542feIGxGAe+pvUmEXHvOJYqP+l0iBkuOnbYzBEW5Z7UyqA2pLpnP20Z6c3JaYEVe2LSa0fujatlC74AfajJVngB75tNxN2Vo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8794
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 16:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199006

Hi Ralph,

On 5/3/24 5:18 PM, Ralph Siemsen via lists.openembedded.org wrote:
> [You don't often get email from ralph.siemsen=linaro.org@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> When using multiple u-boot configurations in UBOOT_CONFIG, the helper
> function uboot_assemble_fitimage_helper() was not called with all
> combinations of type & binary, due to a copy-n-paste indexing error.
> 
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

This likely fulfills the conditions for backporting to older branches, 
so adding Steve in Cc.

Thanks!
Quentin

