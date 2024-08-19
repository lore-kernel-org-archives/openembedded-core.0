Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 729E3C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 09:53:26 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.133])
 by mx.groups.io with SMTP id smtpd.web10.206902.1724061205265331283
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 02:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=PvrkOvy5;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.133, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxdvSX+TVGCsQIU4NlpPQ83AgXTiTpRN6BkKGeE9XkbWa3bXAaLhm2DeeE6pnd1ohmbfOcGbcRRD6zdj/ql2uzMdO0kJuBva+wvve9sGwoe11nFTNdZvt1cWh0EtHYENLNLqCN/qozgi/L8ahVhTAE8OMzCSOFwO7GmTb4vQnka8hAD3eHGnc6UbZjihDCEGX57jX3bT5l9zZM3rzJm6UgrZHXOCqh+sx7V1ZvJTqSRplNWA54p7GethRrzR+7QzCqdCdPjCSK33zh3EzDzZVARy7F7M5wCvqR/9stNItp55CBRSufLgP0Uxe8kwfSvsvVuyZSfTg299ntHI8rXTlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lyeUPEwr4GC/DP25g6w5F3mIviBS+IpSjtXLGJW9gY=;
 b=kz5a9pCSfrc+lffq1ooM8DH2gUK8p+ZWZiRjlC5wremzTcQ2qhPATDi1CbCvY7eKZapUAi0JlwqeRN/oi2QAuPEuL7haLv4yIY+sRXpa/wn3QE9gQYo1ekovRRC5xuG017HYZZN7vfv8SXcP+Yxnp22zQ6uZhxTcrcaWunFyd5EL1lGzBvtGtVTIvywKr02wivF+14XM9avk48jLFf8q5bynb9tO+GxUIVI6hEzGSu2qnUSUIwSKEMD62m1kdO0NgVCrj6aEo2PkDkCWgC696aHQS3558G84aOY36ew3BjcMwRhBYnduEqrxUwaD02utp9Z4lGUZFMk4+bqqJvUG7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lyeUPEwr4GC/DP25g6w5F3mIviBS+IpSjtXLGJW9gY=;
 b=PvrkOvy5Z2qXmaW49scfdpdtndhHM+ddRME4XuS3fM5xzltWGFp/ysaEed2RKr0DfNKxpNgnj+zStML08Z6ekKu7RhwI15wo/NfmRdZnf7k4tFW7MYslywLDlj2wEDB2tO4XUkrib3bLwRbONzEeJDjZ5TVO+ph0c4bSpxNBnGb51tqt6oesdHPaKdY2nmjgEmMUhhbaOtwSU0Njc2ywTb4J3r8fo9UA+hfSo/WjKK6onDI4QaDRKVa13yprsLlbuWEukPi5GgKhjNpZiOOvLBEHeF627Py9Z+9Fc68BZWI4kK/Wv8s0+vQp5YNrTLc6Mz/DBQl19cm1Te2YV29xAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS8PR06MB8200.eurprd06.prod.outlook.com (2603:10a6:20b:3d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 09:53:22 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 09:53:22 +0000
Message-ID: <11725781-db46-4120-acef-3e2c49a83df7@vaisala.com>
Date: Mon, 19 Aug 2024 12:53:20 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3] util-linux: Add PACKAGECONFIG option to
 mitigate rootfs remount error
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240819092739.2063887-1-niko.mauno@vaisala.com>
 <CANNYZj_nac30NVKGVkKJVh4p1nOE1dAbeW=4qj9TkGU9aasEKg@mail.gmail.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <CANNYZj_nac30NVKGVkKJVh4p1nOE1dAbeW=4qj9TkGU9aasEKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF0000385C.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:c) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AS8PR06MB8200:EE_
X-MS-Office365-Filtering-Correlation-Id: 0400faab-3c48-4be6-e0f3-08dcc034c2d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L3psa1dia1MvRFJKQTlJOEpmTzE2dzdDVWU4V2NnSzdKNGV4VEFNQ2FKQXJj?=
 =?utf-8?B?cEx3dW5YdWR6RDBVczZjYzVuODlrSXp4N0xkNEVEOWZjeTFrRGxubzJVaWRI?=
 =?utf-8?B?ZnVmNFQwcU1HS2dMdXFzQjRvMVgrQWdJMkloK0ZPbGhBTXkzTjVtVDlTYith?=
 =?utf-8?B?SkM5Z3FWeUttM2Q4T0RXcVU4RDFnL2R1KzZrZHN3SWtreWNGQzRHMzVYbVdk?=
 =?utf-8?B?OG93RHdlQmV2eGsyUldQY0Rja2F4b00vLytSdzBtSit6c2VLTDlqK0xGeFUx?=
 =?utf-8?B?N09Gd2kwM3REc0NFdkIzYmpPY2U5d2JYMnFnMkcySDFkeXhMWmZTRGZmeDZk?=
 =?utf-8?B?K1gvRUtxUWEreHlKWnlVY0E1R0dTRzNtWERrRGs2YndrYW9pQkFzUjQ3RlVJ?=
 =?utf-8?B?SWdVLzRSSEcvZE5JaFFnWmZXTC9ZMk5aZmltZVRjNkdHVkVMY1VsSHE1VTdH?=
 =?utf-8?B?TExiVGpuZy92ZFpwM0VhczRLdzhJOWRQMU5zMjlvUGxkcThrNXdHMFlEa2Rk?=
 =?utf-8?B?dzk5eVJiSDJwS2hOd3BwZjZYby9JOEthd2hwZjNQRnFoNlMxdEpKKzRLTE0y?=
 =?utf-8?B?VjNZaG9JVmY3NzkvR0dnRDNsY1ZBZEVNSTlyZmpIMnE1WWloc3YrRWI3bXhF?=
 =?utf-8?B?VEh1ek45eUZTQUpFekt5UXIxSkU2bHJjUzVrY1FvQWl3QllQTWczWlA0Z09t?=
 =?utf-8?B?TjVSRlAzT3piVEI2VjdwcVM2d3k2UWtSVTRNSGJ2WkVYODE3UVVGRmZ0Vlgr?=
 =?utf-8?B?Q1M0RHFZR0JmWnV3UURWc1lpNEcwNFNSN25qcGtsZmk0Sm9pNEdzSlhNZUhW?=
 =?utf-8?B?RkJzWnpLSlJ4SkxTemtFWFYxVjg0elBGSVNnZG5rUkRVWVpkSkdPQjB5S1BC?=
 =?utf-8?B?SGx3OWlFTEovN2pQNzJwSy93MzFVcFlUNC9wUTM4eUNhTHFheVB1ak0zNitC?=
 =?utf-8?B?T0ZidHRpQmFkajhwNkQyQ0VIVGZ5M1lkalAvZ0VKR2ZUd1BnbkJ5L28ySldp?=
 =?utf-8?B?eDZ1ZzdyaC95NXlPWS9UNmdMZTJMdW9VMXBXK2tWR3ZJcnBQY1JBVXJJUXc0?=
 =?utf-8?B?NzJ1SW83QUIvOHMwU3hYR0lFbFYyUEpJREZGeXNEeThiSEUxOVcyc2NMa2ha?=
 =?utf-8?B?c3kwOHN0RFRGWW5FeTA2NEIrUjRibFFnNGIydHg2NXBjZ3ZVZ2ZFZEIrMjZ4?=
 =?utf-8?B?L09Ga3h6Q1dHV1pWQndoWnd0dWxlaitHRkRqVGhmOTMwQklsY0NJK0tOVWxq?=
 =?utf-8?B?M3ppSUQ5Y2RoMTRnQjFZT1NRaHhGRk9hMW02ajQ0RXZrbzVyWTNpK3ZqdkRM?=
 =?utf-8?B?TjV0dzFYWDhVSW5DMmpERDhzNjhScEdQR1liYzUyWjJLQ1ZoWTdiN3V5OS9v?=
 =?utf-8?B?ZFhJT0dtMG1PV0RUZ1lITnF3TmZibXlFazAxMm1pQ21CWXlEMmlESHNEVUUr?=
 =?utf-8?B?aGNhckttdXNUUHJlZlp0Q2kvRjhzOGRUK2VWWWoycG5NcEwxZlNMRUVlaXFS?=
 =?utf-8?B?VUhSQXZjZk83UWs2V2hES0g1MlBsNjBjYkxUbHBnVnZnRHhCU1ZhYU8wRzdn?=
 =?utf-8?B?aVNHK21vUGRDeCs5NU9Kb2VqZTRzYVlGbWVjbHVqUUlqWEdoaTArbnBoVDlt?=
 =?utf-8?B?bG1hajlFbUE5NWg4Ly9mK1c5OVQ2L0c2bE15UXUyVTZkUUhWcm5XSVRIQ1RM?=
 =?utf-8?B?TmJWUjFhL0d1RkVRaUtFZXdxQXoxbEtXdVBNTnNEL3p0V0kya1ZQU1dzYm9o?=
 =?utf-8?Q?2S1U/KqsD35jRcJtEw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OGMxdi9jZVE5ZW90bEFrbjY1UGNpNU1ncXZ3S1RLUTFvSEFpVHpaTHBLbEVj?=
 =?utf-8?B?VkdycmcvdFNOdTgvQyttZ01tbmw0R3doS1hIdTlsVXEzRXBwV2tmKzNtdjZ4?=
 =?utf-8?B?aHVSbEVVNU1VVWNEaXF1dElvZHNyTTBZNXNkR3lvNjdXaW5YSzVsSUVEZ1U3?=
 =?utf-8?B?aVZ2cUoxSUdONlVGL2phVTVONG52UWgwbit2QTB6M2JnMFBUTWkrVUNKbkVL?=
 =?utf-8?B?MmpDRnZveVUvMkxQY21Fb3dveS8zUXZrYUV0QVpjTU5JSFhiUGZub0FLNFJ2?=
 =?utf-8?B?TnkzeFVSWG1wZVowaCsvOGVWSlY1S1JsQ3VCL0kvNW9SUmR4ZFYydmlqd01m?=
 =?utf-8?B?QllqdWVmQmNNT0RaL0xuNXFPaC9vdC8va082S09sYlZ0ZXc1VmZ0bWFtUjBX?=
 =?utf-8?B?UjhiUklnZDB5UUJqSUw1UnZveStTYVFyVDkvVG9iQUZwM3Y0VTRZUFJuY3pS?=
 =?utf-8?B?TGlvZEpMV2dWVHRBU3hNTm1tWEwxV2RUZkd6eUp6UUhnQm9YTkVVZzVkUTlZ?=
 =?utf-8?B?TDZXcVJQVGZNMUc2ZmphdEptckp5QjJnWUszbzJyUUJlNkZPWHVFN0ZtcW5G?=
 =?utf-8?B?aTc2QnRDWURaM2JYdXZWSXRWSEFDV2dFY0huU0FCSy84alk4VFdBUzRuaVdm?=
 =?utf-8?B?VnVPRHlva0FjSTdpOWd1cUowcnVKbWo0dHIzTVllV05uRW1yazhENFVJM2J4?=
 =?utf-8?B?dk1yb2hCUUVMYnZxem1qeHIzdGx3YmVFQkp0V3pMQWdHRU5lN0dTSUNBMHVQ?=
 =?utf-8?B?SjhXOHRnUzZvMzB0c0l5end4ekFNekowdldtK2NES2o3T1MvUFFQeDUvYnNj?=
 =?utf-8?B?ZVkzVXpBdzNqa2RtMWdpSWdDd1cwb0JZMW1NME9uaW9FeXdhMUpuR2NIMTBU?=
 =?utf-8?B?RHgyZzJPcUxnWG9kWWlYTTRMTVdlSEZyUjhZZkNWTU5FUVl3ckhxMXNpVGJF?=
 =?utf-8?B?dS9Sa2pGL0dySm1jM3BDcjNUR0NxYTUxeXRGQWdpazYvQ0lHSnM0cmwycUNj?=
 =?utf-8?B?OWNROERFTXdKbUJzWVkzMkpJUmxlRzZKN0x1ZDA4cWI5YTZyRXJKd2JhYW9t?=
 =?utf-8?B?ay85dUQxb3VrSCtQQm5ocG5JWElneTkvN2NzTU9rbGNseksxcDRLWDJVYm9N?=
 =?utf-8?B?Q0FlbHZoR0NSNjlHNkRvUHNJcmcvaWxYbTgwTXY2UHNyT1JHTk56RGxVY2wv?=
 =?utf-8?B?MmVMMVdnWFdSM3JLYitTS1hwTUpCTmVTNHNxSm5VWElEcUcwcnVnZm5hYVZq?=
 =?utf-8?B?RCs3emdscGZpTGRvV2JUNnY0NTBVbmJaQ3dCM2d5VklZb2RxMWFVSE5nZkdv?=
 =?utf-8?B?a2RKa1M5M0tQMkJrY2xsWU5JOWprQWMwdHNlNGRUUzNwelFlTmhEQmxnT0kz?=
 =?utf-8?B?elU3aUs0QVczQytraGVkUjRDallKVEY5YzNlNE50RmI0dUVrbFRHS0RjOC9I?=
 =?utf-8?B?M3YrMUEwY0Y0RVh1dUNGRldEU2VVZHlScGNtUzlZWHllTVRuZHFMd3g4U2JC?=
 =?utf-8?B?a1BrclJWbFZLUjdjZGhMUWgwS0JUUk9Zb1Y3SWhvSXRsMCswTWU4c01obWd2?=
 =?utf-8?B?Q20wajRnYmdCZUZoUjNwazFzNko3bFJaRmZQdU1SNHZtYisySjdiVEQzWGd0?=
 =?utf-8?B?VmlVeGk2UHFMWkJ5U0dQdTNLQ2NIanJneWZ6R01NZVRqV0hnSms0b0d1WnJS?=
 =?utf-8?B?Mzc3MkpZdG9yL1h6OU5lam92RXhGZFY4N3JPNHdJTjlMYytIdXBRRGxLaUVE?=
 =?utf-8?B?N1FlMGhueE9FR2hPMGE4VUJYSy9ra3RjVnJqVGsrVWpkVG5IZUl1bkV2Vktx?=
 =?utf-8?B?aVkzY3ZsNVJmNXRNU25vN09BTlVHY2RaK1VvYlM0U3lyaHBxckVqTVExTnFL?=
 =?utf-8?B?d2VEUzdKSXlhUWxETlpTbmttYVh0T3MrUVBERVh2MC90RGRaWmlsRXduMXpE?=
 =?utf-8?B?eis1TkRZMjhVK0hDZndmVnhxUzVzdlgwcFh2MkpybHJhM041TkFOdktOU3pW?=
 =?utf-8?B?b3kvZ0ZVL2FHdkVGYkFuQy9IVGE2TFpxQWpMUTBZVjVVUy9sN2h3NSszNHZy?=
 =?utf-8?B?N2pYS081djRzK29aTzdLRmV4YmpwNmIxVGRhNGljYnVNZVVVa1lLSW42K0h1?=
 =?utf-8?B?N3hXMWgwb2JVM3hlNUlmS2pnLzdGdlZTbXkyOSthK0lzb0UzRFhxY2NuVFgx?=
 =?utf-8?B?bkE9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0400faab-3c48-4be6-e0f3-08dcc034c2d4
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 09:53:22.0277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FvtWydOIu9HIyIJbqBkHwS1f+b3ksHcNiiomNIDznAUlNU43qD05SZVSpZx6EEsTv6Ot0+OUck5IOFdtWhJYBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8200
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 09:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203497

Sorry, the comments added in this v3 still adhere to v2 content. I will 
still submit v4 soon which amends to added comment lines.
-Niko

On 19.8.2024 12.29, Alexander Kanavin wrote:
> Thanks, this version lgtm.
> 
> Alex
> 
> On Mon, 19 Aug 2024 at 11:27, Niko Mauno via lists.openembedded.org
> <niko.mauno=vaisala.com@lists.openembedded.org> wrote:
>>
>> The 2.39 version of util-linux took new file descriptors based mount
>> kernel API into use. In relation to this change, the upstream release
>> notes in
>> https://github.com/util-linux/util-linux/blob/v2.39/Documentation/releases/v2.39-ReleaseNotes#L14-L21
>> mention that
>>
>>    This change is very aggressive to libmount code, but hopefully, it does not introduce regressions in traditional mount(8) behavior.
>>
>> After observing following failure when booting a board using a bit
>> older 6.1 series kernel together with initramfs rootfs based boot flow
>>
>>    [FAILED] Failed to start Remount Root and Kernel File Systems.
>>    See 'systemctl status systemd-remount-fs.service' for details.
>>
>> closer inspection revealed:
>>
>>    demoboard ~ # systemctl status -l systemd-remount-fs.service
>>    x systemd-remount-fs.service - Remount Root and Kernel File Systems
>>         Loaded: loaded (/usr/lib/systemd/system/systemd-remount-fs.service; enabled-runtime; preset: disabled)
>>         Active: failed (Result: exit-code) since Wed 2024-08-14 14:53:48 UTC; 1min 22s ago
>>           Docs: man:systemd-remount-fs.service(8)
>>                 https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
>>        Process: 76 ExecStart=/usr/lib/systemd/systemd-remount-fs (code=exited, status=1/FAILURE)
>>       Main PID: 76 (code=exited, status=1/FAILURE)
>>
>>    Aug 14 14:53:48 demoboard systemd-remount-fs[76]: /usr/bin/mount for / exited with exit status 32.
>>    Aug 14 14:53:48 demoboard systemd-remount-fs[81]: mount: /: mount point not mounted or bad option.
>>    Aug 14 14:53:48 demoboard systemd-remount-fs[81]:        dmesg(1) may have more information after failed mount system call.
>>    Aug 14 14:53:48 demoboard systemd[1]: systemd-remount-fs.service: Main process exited, code=exited, status=1/FAILURE
>>    Aug 14 14:53:48 demoboard systemd[1]: systemd-remount-fs.service: Failed with result 'exit-code'.
>>    Aug 14 14:53:48 demoboard systemd[1]: Failed to start Remount Root and Kernel File Systems.
>>
>> also consequentially, 'systemctl status' reported:
>>
>>    State: degraded
>>
>> When issuing 'strace -ff mount -o remount /' the failure occurred at
>>
>>    mount_setattr(3, "", AT_EMPTY_PATH, {attr_set=MOUNT_ATTR_RDONLY|MOUNT_ATTR_NOATIME|MOUNT_ATTR_NODIRATIME, attr_clr=MOUNT_ATTR_NOSUID|MOUNT_ATTR_NODEV|MOUNT_ATTR_NOEXEC|MOUNT_ATTR_NOATIME|MOUNT_ATTR_STRICTATIME|MOUNT_ATTR_NOSYMFOLLOW|0x40, propagation=0 /* MS_??? */, userns_fd=0}, 32) = -1 EINVAL (Invalid argument)
>>
>> After further investigation, The issue was pinpointed to lack of Linux
>> kernel commit
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=95de4ad173ca0e61034f3145d66917970961c210
>> ("fs: relax mount_setattr() permission checks") in the kernel version
>> that was being used. Above mitigation was discussed in email related to
>> then-rejected CVE-2024-26821:
>> https://lore.kernel.org/linux-cve-announce/2024051606-imaging-entrench-b327@gregkh/T/
>>
>> After testing with qemuarm64 machine different linux-yocto versions,
>> it was observed that the issue impacts following versions of currently
>> supported LTS kernels:
>>   - 6.6.17 (fixed since 6.6.18 i.e. mount_setattr() returns 0)
>>   - 6.1.78 (fixed since 6.1.79 i.e. mount_setattr() returns 0)
>>   - 5.15.164 which is currently the newest of 5.15.y series (i.e. no
>>     known working version)
>>
>> Taking the above findings into consideration, add a new PACKAGECONFIG
>> option which allows to conveniently opt-out from prematurely using a
>> feature which can cause issues with a bit older kernels.
>>
>> Versions 5.10.223, 5.4.279 and 4.10.317 were also tested but the issue
>> was not reproduced with those versions - using strace showed that the
>> mount_setattr call associated with the new mount API problem was not
>> issued with these LTS kernel versions, which seemed to be confirmed
>> also by following libmount debug message in these cases:
>>
>>    415: libmount:     HOOK: [0x7fa115e818]: failed to init new API
>>
>> Note: In addition to the aforementioned, this change was
>> tested also briefly using the current latest kernel versions 6.1.104,
>> 6.6.45 and 6.10.3 that using the old mount API with newest kernels
>> did not introduce any observable regression to the boot flow.
>>
>> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>> ---
>>   meta/recipes-core/util-linux/util-linux_2.40.1.bb | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/meta/recipes-core/util-linux/util-linux_2.40.1.bb b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
>> index a1aab94055..e87657cc70 100644
>> --- a/meta/recipes-core/util-linux/util-linux_2.40.1.bb
>> +++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
>> @@ -107,6 +107,13 @@ PACKAGECONFIG[cryptsetup] = "--with-cryptsetup,--without-cryptsetup,cryptsetup"
>>   PACKAGECONFIG[chfn-chsh] = "--enable-chfn-chsh,--disable-chfn-chsh,"
>>   PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
>>   PACKAGECONFIG[lastlog2] = "--enable-liblastlog2,--disable-liblastlog2,sqlite3"
>> +# Using the new file descriptors based mount kernel API can cause rootfs remount failure with some older kernels.
>> +# Of currently supported LTS kernels, it seems safe to enable this option with:
>> +# - version 6.6.18 and newer in the 6.6.y series.
>> +# - version 6.1.79 and newer in the 6.1.y series.
>> +# - with the 5.15.y series, versions till at least 5.15.164 can not use it.
>> +# - with 5.10.y, 5.4.y and 4.19.y series kernels libmount seemed to use the old API regardless of this option.
>> +PACKAGECONFIG[no-new-mount-api] = "--disable-libmount-mountfd-support,--enable-libmount-mountfd-support"
>>
>>   EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
>>
>> --
>> 2.39.2
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#203494): https://lists.openembedded.org/g/openembedded-core/message/203494
>> Mute This Topic: https://lists.openembedded.org/mt/107977417/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

