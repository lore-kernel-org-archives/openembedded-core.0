Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1492C004C0
	for <webhook@archiver.kernel.org>; Sat, 21 Oct 2023 16:10:17 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.44])
 by mx.groups.io with SMTP id smtpd.web11.82253.1697904611417948162
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Oct 2023 09:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=CDvN8Gtm;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.247.44, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGVo5sZ1eComEMSfBywsPHOv/wYuefOpunLIYxU6VhF2yY3bAW+X2N3K8e4nYvyRdxlMINIuQ6fikhXkxPbkBBYc8qSlyZyLXIF+L/8NbuVWjI2bSO939tAzz7epLN0Ajk1aTDkGFLg/eHw8h0dpS6lOz5qj/vaF5ORMHoYvQxFoVKWe9SjkivJlcydnG8enJ8z8C5lHjx2w48KLw+Qx/MbjjZNDitEJesz2SvdD9gZ4z9RM6VOa3clnKrN10Cewvu/sXzN1pybu9VbjjYjuyP6jDnzf+l5Fus0wMbqm+43LPX0rhHWJBUHsuI3jdlyFjv7eNU7b2HhJbZHyYL7W3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npPeiC8yTl6H+Cc9i7HssmRaNI5MdM9jO/nb5ubAliY=;
 b=lFzLG05cdsQew5Ua6i96rtK/+nuNieOMzX3bBFHQJbMrzpzpkj3woOaUERbrQTZ2+K8u6V1J/JKAInbhuiq2SD/tftGjHKCoGl8vCjln8BGaEnabinggbN5zQ/k5SQ8T54QldicUa9gu5jvCBw2GGm8qNgnMtQ2rPxDMD7RRzYKeL8sIY+muHGjrUQENtl9ss+xtuInvfmJoR4UW0whDhvg02uUnAXnebd8g7jQyyEZmFZVTXN/iDca0/x5T2PyoZA1pgCAc0xeF7cEjsWIaJruVFx44afPvr052Glv0NgFs58wmd1V4s1zJucYboAs5hQWAFz0+PIU8JGk2FMiEfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npPeiC8yTl6H+Cc9i7HssmRaNI5MdM9jO/nb5ubAliY=;
 b=CDvN8Gtm6lPQ/eO5t1Oso/ebEgpa/HEtziESPSoDwXKTRAfaxOSGnflidvg0+bi19ftmd3n4vUsjBYAEWEIvs3pAEbOqauWmLn4/MFaBkJYdmsXmTLEMBf2+nzgM0PrszcVk2bggEvR9WvrrGa9xcmKEZfDDAUYY2InT+k6tHZGhPPhE254dJxm7uBFHeKLcIezPB0vjOyDJWuw9Qs8fjuC9x8sIcqyqAGB1KoL9C86tvJJEN2FzLgZonEYKpoyuwecE+Ei6SxCeAJuODIlWqlqodFgn01+UZbLem4hPnXAfnYMiKbn+rgzaj+9TG4vlqj3DxZocI/r5Mtidzz21HA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS8PR06MB7781.eurprd06.prod.outlook.com (2603:10a6:20b:33e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Sat, 21 Oct
 2023 16:10:07 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::746a:49b5:ef81:9ff9]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::746a:49b5:ef81:9ff9%4]) with mapi id 15.20.6907.025; Sat, 21 Oct 2023
 16:10:07 +0000
Message-ID: <64a996e6-af3a-9566-c4c3-16733e503231@vaisala.com>
Date: Sat, 21 Oct 2023 19:10:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [OE-core] [PATCH 4/4] package_rpm.bbclass: Support compression
 override
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20231020124450.9736-1-niko.mauno@vaisala.com>
 <20231020124450.9736-4-niko.mauno@vaisala.com>
 <d53085e46d3b3af2071bc3c1b4cfdb0f6517b1a5.camel@linuxfoundation.org>
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <d53085e46d3b3af2071bc3c1b4cfdb0f6517b1a5.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0063.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::16) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AS8PR06MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: f744e20f-db17-441d-80aa-08dbd25031a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qcPPppGsCfzi/IwIZ3ltlANrAgqTufgK301k2fo1vcCVATD35TfYMBG1TxVKzzn1VQS9E8E46PNMCmeYNogu31QfYulNKOe6zUpJ318KmBEbV9Jph+8PEdZWRCy39AbmrEmpPcbFRelBPATQTo7kYLi6qB2GlaGHSeqpM94EodZ4qQ3opSCoCu4uCSeSpuXoMpPP0Qj4tkEytvpw3gTGEBwwrWn6OcuP7v0kQd3mjlWbEhlbK1yb87Wrw/U2Udzg+1o0PWmvkyLNwbREy2R+Yu+8WwhiNpOKu1tNHQHKuQ/5cBH9HfiBh+AhoK73E7uz3Q83Af8t5YZTx+MWZLrcjBJljXq/bX37YTlYUGuVQ+9sn0oVLGGgpK6oJhQ5bCcfKAvE5YpyzO9Rsj7lM/BKTtkUxhNg0n/Mba4qcXLIp6B9BdcwgVXVbGWtDRahWeZP6RyKW2j0DcFYMSoEWKAiAGuT3BzRNaQdbrXnF8xwugz/KisV/HkLJaIT2LMVGPJ72/M4FgGZpxl1wYjABmaTt+diFgnW8ijwJNZnYRSevHewtp1YieY2Kb8ySHY0RPrtxDAb/Ss3EEP3Sh6QIPBEWMORy/ATNZqyVVmdOGQ0PxIktx4DNQ8Fd4LBVCHUPUtlCaToCfcZQxto9AjifEz5aw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(376002)(39850400004)(346002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(4744005)(2906002)(38100700002)(41300700001)(5660300002)(44832011)(8676002)(31686004)(8936002)(31696002)(86362001)(66476007)(316002)(66946007)(66556008)(83380400001)(6486002)(36756003)(26005)(478600001)(6512007)(6506007)(53546011)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bkNzRTRDam1VWjVQSUtqK3drM2JlNGo2WGNjWUZnVC9vc1o4TDU1ZStTbU1n?=
 =?utf-8?B?NXVFODZlN0tkY3pxNDdFbXhYY0FqOXFJZVNhcHhNTldwbmhNc2FDZm50Mmpv?=
 =?utf-8?B?S0pHRFJBemtHcFlZaFVNNnJwRC9IRmVJTUx0UW9FMEx1MlVyT0E2My9JeGw3?=
 =?utf-8?B?R2hvVmhsL1JaTkVDbHAraUpYTm40TEhFaFFydnoxWDRQOFlZSFJpODZzOFR4?=
 =?utf-8?B?dUlvQ3NIL1NsbHRjaVNhb2FOM2JtTEpKbk9ySmtWTERQdkpvbVJpd2pKM2hY?=
 =?utf-8?B?d1JhSi9JMVp4bUJleHcwS0s2Lzd6eDJIZnFjVWdzL3VPMUtvVUpmUnl2YmhY?=
 =?utf-8?B?MStsSllsd2xKeDM5RnpGeHphNVVQUjJhK3h4K1YrMld4MXU5Q2ROa2FGUFdp?=
 =?utf-8?B?U3B4SDlIWmVlMDNxSlQ4Y3BFRDdSSU5pNENJbnlOWm1oWWxxb3h4eGxCUGlt?=
 =?utf-8?B?UkhMUXhFNlY5K1ZwVkVYTVhObXdaWWh3aDlkRTNOanlTbHRYYTZHN2VyY2dz?=
 =?utf-8?B?UUhLYWRYb0l5TVN3S1k3Y1AyTXE0Z3ZwYnpFaEU2ZVRSdEhQSU4xeHc2OCs5?=
 =?utf-8?B?amhOUkVSNkRKMHRCRE1UZk4xcVUzUWE0aVlOSURYbXJmRk45VHpKSnNDeE00?=
 =?utf-8?B?UUlTeUMrMjJmTWN3NEQyWjI3QlNMcVExSlJIVnlxZ2lhdkxWMm1kdC9hdkN1?=
 =?utf-8?B?NFRkdlJlMEIyajdxQmI3bE1lU05CRHYrc0c1R1FsdmxEZDhHM3hOZnV2NGtM?=
 =?utf-8?B?Vzc5RmFUa1RTSVp6d3JCMTJLbGV0aXdiNUNMc1RrTTB0ZW42bXRIdGZYZHkx?=
 =?utf-8?B?VDEwUEhTMG5idVE2cFJJaEEzTjdDMjh1a2hZY2hQMHo3ZWtoaHBxNFZidDJt?=
 =?utf-8?B?ZG13SkVkUGlIMGdiZDhDUkRRWlVRYWkyNG1WTU9ya1pzbXlzTys2RWtiY3ZG?=
 =?utf-8?B?Y2VoWisyWkROK0hEUURLbXB4QkkyUHZTUGU3SHovQ1UweVgvVW5yTlVOVHhx?=
 =?utf-8?B?YUxYVEgxQlNqeFU1SkNxYTlCK1Q5enJ1OHhyOGpZTlYxYzRnUFNzWUdIUjlu?=
 =?utf-8?B?Y1VKOWJOS2ZwcW1HanZKWGlZTURxS0NkS0xYTFZwbzZLMmtRa0dkdEp0SjB2?=
 =?utf-8?B?RnZPVmM1cmlhMEIzL1JVVmRFUk9MdjNFUjZLTEhFNWpkdEJDOEx1QnhUOXAr?=
 =?utf-8?B?YWdIY24va3haK04welMxWGRablZjUHVHZzhFMHhOYkFBczRST3grbURNVElj?=
 =?utf-8?B?NzAxRXI1QlZETXdvdzdiR25XMzM0R0NhQ2JZWkdkSm9NK0s0SzNUN3k3OVBa?=
 =?utf-8?B?aktpamFpTit4emxyNXlXbVc2bVJHV1haQm05L1BUQnNzQUUxL01XOVQvajFF?=
 =?utf-8?B?UDhJNFI5NVI1eTFNN0k4QVZmUThTdlFoQWdabTFTVDErZkpyUE04cW02dlJW?=
 =?utf-8?B?b2ppTjFWWWRtcTBVQ3hLWUZVWVNyWjVab1Q3clVmT1J3ck1LQUExWDB3bFBq?=
 =?utf-8?B?bEE4c0RnZm9PdFlIeFFjYXV2c0RTUEhnYUg2V3ExelpiYXpIaUVORjE0NlR0?=
 =?utf-8?B?bC9pL1A4cmEwcUUvellJMU1NL01BUExJN0hua1l2RG56cnQ4TzRlYjJ5eGNz?=
 =?utf-8?B?MlZZWHZTdS9EeHBjbTBqWUpqTElFVzZ6VmxpME5mSlU2OUlNZHZYSm44LzJi?=
 =?utf-8?B?N2ZqUWptVWpNRVUyWDVYOUFSRVNJTEdIbFRoUU1TeWxvUFVhUGZMenhPaVFK?=
 =?utf-8?B?bnhLY2t1OUtSc3ZnY2ZJYWNvekhNVDJWaEZPQlpHL2E0TnZjdytvZm42aUlV?=
 =?utf-8?B?Q0NoV3kyMUpSMmJOaU9lQzdhVU0xcHJ0c1EwdDdVeUViVFAwMEhhODdreDg2?=
 =?utf-8?B?V1VsWXFBTWdkVFpveWNtNkh3b2NRbitPQiszQllvS3JTa0o5Qm50Ly9Ga2lI?=
 =?utf-8?B?SE1ZLzJhUjI4UWF5bUhvcXNpZlp1VmdBVmxsUUtxTDB5anpJVmlhMTFnY21K?=
 =?utf-8?B?Sm5XbTBMaWxUaGErNTZkZDlVd2QzZ0MxZVJTOFR5VS9KemYzc05rdXhIeEFX?=
 =?utf-8?B?R1dPd1N0ZlFXcDZiZXU2OUV2ckFHdDBGQnFseHBwam1qNnVaallIaSt5N3R0?=
 =?utf-8?Q?GQxTEjqyCv+AZXWcaT3SgYrH3?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f744e20f-db17-441d-80aa-08dbd25031a4
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2023 16:10:07.6369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Hot48yneIxtuUuCMio3N2hyiz9NsMmY6xRtw/50YrJqHuDu1C5wCHIo2XcsILKj7453WOiO4zxAAoWzD13GpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7781
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 16:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189598

On 10/20/23 16:00, Richard Purdie wrote:
> As far as I could tell when we looked at this, the rpm world was moving
> over to zstd so adding in conditional xz support for a limited use case
> probably just creates a maintenance headache going forward as it isn't
> something we test or plan to test?

I now submitted a v2 for your consideration, but assuming it still 
introduces a maintenance challenge for YP, we will look into other means 
to work around the issue.

-Niko

