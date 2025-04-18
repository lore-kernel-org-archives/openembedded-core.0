Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3447C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 11:29:16 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.59])
 by mx.groups.io with SMTP id smtpd.web11.9940.1744975753258146655
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Apr 2025 04:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=AfZBqPOB;
 spf=pass (domain: cherry.de, ip: 40.107.20.59, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGqwJO9otXrqwKbSeqUZ3XZcEYZGFQlaMnV2j0zKNNV95COKg66R9hehzGKzXGSGEpqRrDrNrKSdXeuREyN9yHdsOak5B8tygsdwwf6PM6GmDNR3l6sWa7Z0afpw6G4dcvnGB+hrHhbQiY+U7OUeVCGfoBJuRsyhC1STdOn+nt2vVnf5wnBW6l3zP7PHM04pYiVUJ9LhHkyKcCKfxJ6+Nc/AxTksUe+gVrx6O8Pf/GIfXRoZqGJvxXn4oAi4IkRnaZlffdfh2HCccP7/rktoEztaIE+uoTki0cUdxfj3b9HzPEKEOuN/BCdA+A8u22Ix/82tmlzhO1rylvlrlMHoHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QR+N3A1hluHMrYtqX+SdgVyJzS0nNZEb7gHT0zYbRIM=;
 b=VvT8W3gEee5Dw90l/DdQ0rJZ8jFT8EtN6uVd3uz+VJpjyQ6oEqlrQExoqdS/IszmzkEifQ2qIMY9kiVdPF0RHxuDM3rSR+gjJSgr9JQECSYVZJQkDrwzOxo6PpzzVrY1viapQbOCeE0oRb1rNhMmb2QOqDpRMISYhhoMJzyEuRlF9UxgtD1pcNzxC+N2MIqOaFj3d9Ttmt/n1Vy7h4MYCsVu7lOJJKJNBFkU3oCCo0Mg1gi/qxfGU8hc0tkXSHwk0hwVt9ZMsV/16Ha66XJenLLvap0mrlnw8bbkR7YAYc+fEbY1gdyOKvuEtNblWzrpCBAfsg1O3DI8UGAA6YIvzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QR+N3A1hluHMrYtqX+SdgVyJzS0nNZEb7gHT0zYbRIM=;
 b=AfZBqPOBXi3+MhK3/zhO9RDrAW8tGQsLAMdn0DesBoOqAoVenhjNtPSUZx084aPFgxoTfrOdbcKcpBYodtai8VEHrKJ7+rYqmmoxVm3qS9IZDH8OdKbvka+0cgW0dEJdLoCqrQaDbmbhhvn/adjm+TJsaQNMo9mfMreIMvgdfPI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by VI0PR04MB10542.eurprd04.prod.outlook.com (2603:10a6:800:265::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 18 Apr
 2025 11:29:10 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%6]) with mapi id 15.20.8632.030; Fri, 18 Apr 2025
 11:29:10 +0000
Message-ID: <9c12c8c3-201b-4953-827e-af47722feadd@cherry.de>
Date: Fri, 18 Apr 2025 13:29:04 +0200
User-Agent: Mozilla Thunderbird
From: Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [OE-core] [PATCH 2/2] cve-check-kernel: verify kernel CVEs using
 programFile from kernel.org CNA
To: daniel.turull@ericsson.com, openembedded-core@lists.openembedded.org
Cc: rybczynska@gmail.com, steve@sakoman.com, Peter.Marko@siemens.com,
 richard.purdie@linuxfoundation.org, ross.burton@arm.com
References: <20250416142859.909037-1-daniel.turull@ericsson.com>
 <20250416142859.909037-3-daniel.turull@ericsson.com>
Content-Language: en-US
In-Reply-To: <20250416142859.909037-3-daniel.turull@ericsson.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::9) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|VI0PR04MB10542:EE_
X-MS-Office365-Filtering-Correlation-Id: fed17b50-ad72-4f26-2d26-08dd7e6c3cda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z1p5WDBDeFJTdjJTQ3lKTnF3V2VRc3B2dHJPWHkyRC8zbXFETk00MXBNem80?=
 =?utf-8?B?TThZMjB2ZUZTbUcyeCttRzJYZEN2bnlvV2x1THlqaXhIejVNT1hQY0ZKdnhx?=
 =?utf-8?B?OGplTjlZOFRaRXE2TUxvRFlhNVhpeGRFSGNTbFY1c3RPNFRDb2Z4TnZWKzRM?=
 =?utf-8?B?RktiQTd5Q1NJRFJaUGN3dnM4UEdtQmlPdUNhb3cybFNXUjlRTFBhS00xMTRw?=
 =?utf-8?B?UW1DdGZUU3MwN3VwUk9IcUs4WWV4ZldqbzZ5SjdRWDVTc3JFeElFWFMwaDNs?=
 =?utf-8?B?czR1T2NiMlVEb3JqMko5dU10Z3Q2WFRBY2xzdzVaOGoxcEtZRU82YVJob3kw?=
 =?utf-8?B?UVA5SjliVG11V0FwQnN2ZTY1TUMybE5RTmFBai94NzRmNjZQeEM4U0hxRVA4?=
 =?utf-8?B?VEtNVVAvZjMzQkszUTJOOGxxaTZWak5JeDZ3OWlpTHdMajRsTHZRQWdCdkYx?=
 =?utf-8?B?ZEM5SFM0UXZCN09HUkkvaStsZ25kOXhoRHRsNU9IaTFrK1NXempRaXR6Q1JB?=
 =?utf-8?B?TzZhQTJJY3RvenRBdUZaTU5SMEoybjQzaVVHcUJzWE15RlViME54bWk5clFr?=
 =?utf-8?B?TnlreFQ3SmU0YzFaSitqcVpsd0J3NHUyZ3pVTTlzTys2QXBGRFRGYlNnT3Rk?=
 =?utf-8?B?d0haRktNR1ZzQ01Cd2szYlAwMjM3dk9CbmNuYVprK0s2Z09SQ2N2eWhUTjBH?=
 =?utf-8?B?RGlwUzRVczVDZHlQU0RpRU5TOXZBNVRPams5RnpLRktkU3dYRS8xeWN6d2dj?=
 =?utf-8?B?dHNtTWpEejh0QTduTktRMFNnWHdJdEpJci9IY1lSb1AweXlWZTlsWHMzOTA2?=
 =?utf-8?B?Qi9vd3BMa0FCWW81eWlwdnJWY1RlcEcxSDd6cFcwWHZTb1NmaFVWTjYvU0NF?=
 =?utf-8?B?NVA3aDhZU0JJTWxsWVlrMnRWUWlHU05lTGZLV2hKWEp4Y09DcGF3MDJ6TGZE?=
 =?utf-8?B?RFk0QmpKVnR0c1N1MlZGQVRhVmhxUFVKeEJYUkVRTUVMK2J1b2lVd3hUeGxx?=
 =?utf-8?B?STRTY2U0OXpKOWY1czRDelpienVvWEhkMXZBWGRMNW1lelYwalZmL0pjUkxw?=
 =?utf-8?B?OTV6S21qbmMxOWRZME1MU21nblVyUzFnbUs0WnJlMG1kZmt6ZUgwM2tUa29S?=
 =?utf-8?B?a1psMW5KMmJDT2hOUWUyVzJCZlFOdldoMHh5NlNDSU8waVppSUNMcmZSSlNB?=
 =?utf-8?B?OVNHUU16aWxGTU0rQjVsQmZvYjZtc1E3d3B0dWpBVkM3UUN1ZXd4U0lrejFa?=
 =?utf-8?B?cGRsZjRvYkcrcDVmRlJ6cnF6RUxydVVjdXp5a3FlLzhoTFJZeDJtbk1YZ2ZK?=
 =?utf-8?B?cDlOdEZCa0VUK3o5YnlvM0thVnFxMlhuQm45NEZNVHd0czl2M3lGSjNhUXBw?=
 =?utf-8?B?UHd1aXk1WGNuSUZ6OGdmeWljamI3cklYVmpUdS9hUWR1bEwvdkJEZS84djRh?=
 =?utf-8?B?a3FDSmpZT2RUY3V1MnowSzczOXVrWnRDazllZ05VOHBZbWw2OExzRzNYQm5S?=
 =?utf-8?B?STU4anpTRW1zR3FtSGljWEVHUmF2UmV3VmRDWi9QMXA0ckRlQW1mQTFVVkVE?=
 =?utf-8?B?THY0Yzk1TWpIdTI3Ykc0aHBKRk5jeEFJSy9lNFRyTmhyRWhGUXVUU2lBQTR5?=
 =?utf-8?B?QmM1TjRTVFpVTGVYeUxKMmU1YzYrb1djMitEOU9MUEs4NTJ4R3dnQ1VtaWMr?=
 =?utf-8?B?L3dmelQvY3dFT3I2bjgyT1k3aGVZWVZHbmJtK0JxZktJakJlQ3QwNGVtVHZS?=
 =?utf-8?B?TTJFUTRtMU9IcHIvcFVnbW94dUtUZlAvUThCZFdRS0tYSzhQTTdOaHhIdjB3?=
 =?utf-8?B?ZjZWZmxHQm9oS0REU3FiMW9nZUhDWVVEdUZpekEyNjZPMU9pUXNYYlJrN3Vr?=
 =?utf-8?B?dElBYVk3SDBHTk4vYUJSM1dsSml6a2N6Ty9GY1BwNy81UGpxTXpLN2lpcjJL?=
 =?utf-8?Q?x/fKqlhIJRs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QzYyREZhTUl0bzJNWUYxNGtlcWlQKzJUbElhOVBFaGowVTBLS0JxeFBKZzBt?=
 =?utf-8?B?c1NFRUo1Y2U5Nk0xd3lSVGxuaEhaemZiSXY2VWtIOHlCbmRYMXlYVDd1aU02?=
 =?utf-8?B?Zktla0tWd0ZjMHppVjNqc1pjZmpjUXlSdXFBQ25yV3BMUXN0eW0rTlplTWtt?=
 =?utf-8?B?Wm9meTV4RDdpMXB3NE1pVjVRTFZicTFVeU5pWmJ5YjZMNGlWeVFCdk5Gc1Zr?=
 =?utf-8?B?WS9JQ0RiVGRkeUFDamM0cm9ueldwUjVMa29ET0xKNnduVmdYOXJjbVZxWkgy?=
 =?utf-8?B?TDdCMXlRdlgxK0kwVUErRXI5cSs3ejEvVXhVb2xldE5UNldreFQ2d2oxN1k4?=
 =?utf-8?B?UlhUV2oxNDlGYmJhMEdXZFdhYk44ZFlBdmUwU1FXTjZUc3ByQTEvZzBsWG40?=
 =?utf-8?B?OGdlSGtBQ28zSk1tTERkRjY5MmhLb3dEbDBCc2pzbHNnOERLS0VnS3IxazBj?=
 =?utf-8?B?VStMMm9SdnNpVXVjeFk5Wk5ha1dKTW9YRWpZYU9YMWpLUGxWNzliRWpWYmo0?=
 =?utf-8?B?WE13L3E4UlovOUM4MVFDb0d0c0YzNTNuUEVjbjMrck9ZSE1YbkdNaTduRklj?=
 =?utf-8?B?azBqQ2c2MDZVc0FsT2lJZzBpN1JnakFwSnlBTWhFUlc5TUNWaHBrS2xnNnRr?=
 =?utf-8?B?WUlGd2NGd2xYRjFWRVVVWVVTSE5NbXU2c1gyWlZqY2tNZUhIUHh4eTkvbzdQ?=
 =?utf-8?B?VTFkOUxwR1cxSkNOT3ZHbW9TSDRYVHR6dTFrK2JxQ3pEcnFNdWlkTzRlbnlE?=
 =?utf-8?B?RzRwWnczTGtWZytPMG5vWHNVdVNXU1p0SjhKYW81OFNIVkRxWCtqWmhWRHFw?=
 =?utf-8?B?SENnb2lrZ0p1TUh1RC9iSzNQZWpzbmJZYkV4QmJ1NkNxcEtsQlJMa1NFbW1r?=
 =?utf-8?B?dGEwbXhpUmhMNk42VXZTb1VmSWNzQ0FFYlo1OElKNGZIUitPU2QvS1ptL082?=
 =?utf-8?B?bkRlejZCUzBrSEU2OXJLWWhxRFM2TnUrR2pFemlPUHJXOCswVzRFOXcvbXRE?=
 =?utf-8?B?a2s1eStqcGE5ak5WUEZoRDExb1JuU0p3ZlprM1ZrcFNQK0NKK2FialI3TDF4?=
 =?utf-8?B?Ny9xc0ZKa295WDQvU1hXRDg1VHVhZDZIMVlIR0VPS0dNVUpjYTNkM3VEaHRZ?=
 =?utf-8?B?bkFFKzl1QzJlRTlzdVhweE1hS1hGcnltUW5EZjY2ekl5S3BjVzVLZW9jUVVM?=
 =?utf-8?B?UW8zaGFSTmdWYVV2ZlJheWx4Nlg2RU1HVEhraVh1S3NlVXZJVmdHQ1BmQjZB?=
 =?utf-8?B?dzNZNDZ4QWZtYjJ5dk96VEpFYWJ5ODlnblNiem4vVWI3QUwwV3dqeCtrdlFW?=
 =?utf-8?B?S0Y1c2xkT3J5akJzOTRsbFBQRXFSSSs1ZEREMCtmbHFPWjgvVmFUZU1DTmRN?=
 =?utf-8?B?S1B6b2Nwd3V4TXRoLzJPdWY2ejJub0ZuSFBYb3FHM2JWSnFSZVVpOTkyNFE0?=
 =?utf-8?B?b1F1L1ZqM24zWDlBdUkycU83bFZSMU9GeklYZ3ZQWitpL3ZIdXViVm1JS25P?=
 =?utf-8?B?VnRVZHNJNTVYQUFKQURiM0E0UTQwZkJSaVFacjFueGZyS1F1bEc5aFl6TDUx?=
 =?utf-8?B?Z3VhNjFmMGhKdjQwcmJwc0sxSkM5VExIVWpjeHdQQm5PQUpMdGErVUJOTi9R?=
 =?utf-8?B?bktLVWJsblE5SkZQSVZmMG01UTZzaTc3OEJnVHlFWHhOMUJoSGVvUUlLY2V5?=
 =?utf-8?B?RmR0MlVaUDVvb2xOOVluY3BQeGhQc0pLc21VNFJ6TDcrMGlnM0hXbVEvVFJh?=
 =?utf-8?B?R0k1YmFZU2NYSzVCV1dMUVdWTG5OK1FMTUF0dWNwMS9SZEFaOE5KK1ZWdDMy?=
 =?utf-8?B?RWVTSGlCbWhuSVdEUW9aeHlrWVBxNlRwVlZuVm9NZ1NxaTY4VnYrU3czQWth?=
 =?utf-8?B?S0ZodnRNdXlBWDhvRStrNy9DSjFsYmkxcmQzMmg2WFlzOHFBQ1FUT0NjN3Ba?=
 =?utf-8?B?WnNoTWpGSkNtMnpIRUUzSTZQUjVQbEdDdHUzb0ZodFVyTU5yTTUxVnBnT1NB?=
 =?utf-8?B?eUFzbmRJWUVZMUFHWFpZZGtweHpFUVNDRkh3YlpmaU82REl5WVo5M2ZHSjlX?=
 =?utf-8?B?ZnFpWU9HWjlyTVBZM3RPZTRseStpdEtkU2Z5RmlzMWZramQvYzIzRDNKUmNr?=
 =?utf-8?B?d0V3OVVxMEJIUjBVbTd2N2ErWU1VTmtqMzJWL1FhTVh5S1BqbFJKR0tkTnNG?=
 =?utf-8?B?L3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fed17b50-ad72-4f26-2d26-08dd7e6c3cda
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 11:29:10.1182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLzKOxa+f6BWIU7H4rVcoLSI2jBxp3vSlUg29vARwcQoaE/jE+NDwcNKftqqYOLQX/wSVqa0xeUi6rVk3DiZpUYcQiJxagXS4USoN0hw2pw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10542
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 11:29:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215128

Hi Daniel,

On 4/16/25 4:28 PM, Daniel Turull via lists.openembedded.org wrote:
> [You don't often get email from daniel.turull=ericsson.com@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Daniel Turull <daniel.turull@ericsson.com>
> 
> This class is used to check the CVEs against a specific kernel configuration.
> Depends on data from the kernel.org CNA
> https://git.kernel.org/pub/scm/linux/security/vulns.git
> The CVE data provided by kernel.org includes the files that are
> affected by a given CVE and are provided as json files
> 
> It requires the kernel to be compiled to be able to extract which files are used.
> It is created as optional check on top cve-check.
> 
> To enable add in your local.conf
> INHERIT += cve-check
> INHERIT += cve-check-kernel
> 
> To test it
> bitbake virtual/kernel -c cve_check_kernel
> 
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>   meta/classes/cve-check-kernel.bbclass | 132 ++++++++++++++++++++++++++
>   1 file changed, 132 insertions(+)
>   create mode 100644 meta/classes/cve-check-kernel.bbclass
> 
> diff --git a/meta/classes/cve-check-kernel.bbclass b/meta/classes/cve-check-kernel.bbclass
> new file mode 100644
> index 0000000000..c01f0efd1d
> --- /dev/null
> +++ b/meta/classes/cve-check-kernel.bbclass
> @@ -0,0 +1,132 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +# This class is used to check the CVEs against a specific kernel configuration.
> +# Depends on data from the kernel.org CNA
> +# https://git.kernel.org/pub/scm/linux/security/vulns.git
> +# The CVE data provided by kernel.org includes the files that are
> +# affected by a given CVE and are provided as json files
> +#
> +# It requires the kernel to be compiled to be able to extract which files are
> +# used. It is created as optional check on top cve-check.
> +#
> +# To enable add in your local.conf
> +# INHERIT += cve-check
> +# INHERIT += cve-check-kernel
> +#
> +# Then execute
> +# bitbake virtual/kernel -c cve_check_kernel
> +#
> +
> +KERNEL_FILES_DIR ?= "${LOG_DIR}/cve/kernel_files"
> +KERNEL_SRC_FILES ?= "${KERNEL_FILES_DIR}/compile_commands.json"
> +KERNEL_CNA_REPO ?= "${DL_DIR}/CVE_CHECK/vulns"
> +
> +python () {
> +    if not bb.data.inherits_class("cve-check", d):
> +        raise bb.parse.SkipRecipe("Skip cve-check-kernel when cve-check class is not loaded.")
> +
> +    if d.getVar('PN', True) == d.getVar("PREFERRED_PROVIDER_virtual/kernel", True):

I don't think this will work reliably?

I think you could have another virtual provider in 
PREFERRED_PROVIDER_virtual/kernel and then this wouldn't match.

I have no clue how to handle that properly.

I'm not sure how to make sure we're always using the latest linux-vulns 
database (and so not rely on the cache(s)) but at the same time allow 
building without network access. I guess we could provide some hash or 
tarball for linux-vulns by default, for building without network access?

Cheers,
Quentin

