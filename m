Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5B2E7718B
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 14:44:14 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.47])
 by mx.groups.io with SMTP id smtpd.web10.14502.1734965048886192160
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 06:44:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=l5UcDcUC;
 spf=pass (domain: oss.nxp.com, ip: 40.107.103.47, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqDDqAUTiDI6WZpSmERVt3tj+eWFdPaJLkegqaqSoqXx47tGPaL3Q+sASzRDUNH5nxGMZAew9Gkyeqs7mGKGVSaf0XQWaIv8fScOCM9J7b65Ftn3EP6FNzmpZOIh0ZWBuee5HqB1tEDK/LDCq8dBGfIMSBtTEMXnhe/XDw3Y9vvoZdekqEdNqSUFea61iWal7Yt29d/eme2xhz+YFheHyYXfWbMJGAgQeHEq4uAEzj8EVtHOzr0bXmTIOo4KlrhDwLEUPEK4Ulpav9EHotNjtJ90FSBRtCBS9LT8vpwfDdv8cuN8rg3+8VWCpWXZP5Cr7moc/Z3q9ysUbwBbsd3IIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqneeMtGVssPgZ7slvJzdwRL3bSeM4wvCoQOrB5dAuk=;
 b=xoAPyt6O2aG1AzKoakbeVaHgNXEbjOwzaGDfrV9hA/UgOTjyqa0fX60xDu9YfJT/MQ0aOwmjq+F3XmbdaqztHi4GG1JZMouGKCPN6CsiBBQ5+cix0/bMDXIb9huZzcspz8wzFU+ZHEKjlZ/Ie7FKFeoYkiycWK457TWGTxXEXyZnADRtCBKEp563Adpxmkd2LwFVMxxSUoK0P6zGZgcKKZAF/ktfau2ky/CqahJKTTWWIH2DcO6DgK3ShseDTvb1J9AEmnfshVMAXR9SsGab+bIvcbBytAEhKW7zDKsReLjrEvnW582dbc1eF8FLnGeDvh4/abi+q7tEfy6/pPcZ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqneeMtGVssPgZ7slvJzdwRL3bSeM4wvCoQOrB5dAuk=;
 b=l5UcDcUCERCGNr88NTJmSYVBAmn4M7Aywp9kGOEHLH7DYoyfYqs88zwbL7uCRUeXYxk6kVF+ViPejl9GJDk1KfotgXONiwWm8f8MTSGYBQzCKEfsWtV4QfNvS+NMkJED34AmtgpyxaS2nwjHtd28Wmxk4TJgMyVc0mhHn9d3V8GGZYpmW1Dd92ek2u3LqOZxZLMSMGz4qXxHyAttQJdE7xDxRD/+DT9s6ilfZ33V2IeLpnuSIMpAn+osEK7YDXaNMzHfkTXVzTKdMl3F2bWrrJ2rGbz4k0YMQ/8dPDufy/Lhpub8vzGywPkV7rvULbmnGUT8mLH/8sUlzkbHIEvK4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB7060.eurprd04.prod.outlook.com (2603:10a6:208:196::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 14:44:01 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 14:44:01 +0000
Message-ID: <a413da4e-dc93-484b-b90a-d6826a528efc@oss.nxp.com>
Date: Mon, 23 Dec 2024 08:43:54 -0600
User-Agent: Mozilla Thunderbird
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: Re: [OE-core] [PATCH v3 5/5] mesa: Fix missing GLES3 headers in SDK
 sysroot
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20241222162234.2411262-1-tom.hochstein@oss.nxp.com>
 <20241222162234.2411262-5-tom.hochstein@oss.nxp.com>
 <2bd2615ee9d8ba12c0dcc0888057140debfbce4a.camel@linuxfoundation.org>
Content-Language: en-US
In-Reply-To: <2bd2615ee9d8ba12c0dcc0888057140debfbce4a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::16) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB7060:EE_
X-MS-Office365-Filtering-Correlation-Id: 46d47bdb-2794-4a92-6c23-08dd23603d36
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R2l2MUtGU1BZT0dtQmltV1AramU0Z29Xbm5mNEN6Q1drU2ZzUnJUbG1HR1pE?=
 =?utf-8?B?QituL3NvYTNXVEZYOTZzK1Q2SzdueHdmbDlaRlZSRXhHWWwvcTQ4RllST0Jz?=
 =?utf-8?B?akVDNkpMa3B6YjhjK3BKYzkvdVZoeEtqN3AwS0NtZXRSNDQwcVRiOFVqQ2VX?=
 =?utf-8?B?aHViUURZR3owZFYwWlI0UmJmL2c0czVQbnFTUlRub3F6bEZwN1JtazhPdmFU?=
 =?utf-8?B?ZUlGWDJwL3NjTWdkQjRWZFVvWkoxKytjajBoK2UrR2p4T3ViNUg4NllKUVhS?=
 =?utf-8?B?Y1VNNk8rTFpVejJFbTFZcTdBenFKMUd0OWozNWtsRkdaWVNOdjFrTURTVDF4?=
 =?utf-8?B?QUc2Y01PblVnTml6aXZ1bFo3REtLRnl2QWNmalo4YXl4bVB2Zmg4T1ArUkgz?=
 =?utf-8?B?MlVtQ1FaeTRpeDlTeml1R3lZcE5PbFViMG1tRnBpQXZJZU5aZGhDZjh0K2Yx?=
 =?utf-8?B?MkJKaVR3RXN3RUczZDlsZWlEQUQ1RzI2dCtEenpsQVJyTVF5OFFQenlER2Qw?=
 =?utf-8?B?dnM0c2tpMkdYZFNGOEpwUW0zYjBTUHgyKzV5b2hab0I3MkVCZ3NaTW1hNDhB?=
 =?utf-8?B?bW1mWlZ3NElzRUpwdjlCZE5VS3NlYkg3YUU1dmxJcmd0ak10bXNqMTJsMkwv?=
 =?utf-8?B?RmsydG1qZytzT21nSTVEYStrY3V4aEUvY2lYMVpFWHN2RFlwN3RQKzE5U1JC?=
 =?utf-8?B?TGhndHZFajBkS3g3YVNwWkFSblhLLzd1YkhYSjMzT04rc0hld0JyUlhQN1My?=
 =?utf-8?B?bTg1M0x6YVNKNVBxNUpkcGRVRFpoSHIzUHUzbkI5ZUNnOTN1YmlHZlN5cDZE?=
 =?utf-8?B?VVpxaU94K1R4NG5qMEhiLzJ5eXlkK2hpT1MwT1FTMVVTTU1SODdEcGxlK1J6?=
 =?utf-8?B?NnJWeFlMV2ZKSzlYNXZwbnM5RFh1b3ZYMld4OWVyRk9DaTJ5eWkzam5GY2RK?=
 =?utf-8?B?OCtmVm5SN1l5VTRTdnBQZG45R29IeGV5ZnNhUThvYjBXOXdxUTExMVlRZHcv?=
 =?utf-8?B?R2NVYkFBMGxrNWUySUl5b2hMZ0RkV2UwQkV6d21YTnBQUlIwSkx3ZnZSZ3Ra?=
 =?utf-8?B?MGhXTkxIZU4xRFNHenorN1JOVmhGWjJsRndwQXNLaTJKaDhTaVVLZys1V1F2?=
 =?utf-8?B?UlZBeW5kaWU0ZWxOVWlGR1RFWVFaSTVneDN4MnRkVVE1K0RTOVJIcnhMS2Jo?=
 =?utf-8?B?cWFxZTk5bWpwamUwM0dVSVZRQXRWemNaSzZaSE1LYXRBcTliZFROZjlIUkpj?=
 =?utf-8?B?T0xrQmdnV0hlcVNIYll4Y0o4dlgwR01VT0FwNXpLS2luWjlCK3NJOGNQTXdR?=
 =?utf-8?B?aWZ5eEU2RWZ5YWJ0VWY5dDBpcU5ybVlkSEFOV1dFWjRkUlQ5NjlOdFJYaUZr?=
 =?utf-8?B?V2xaZnVmeFc0TjVKeVQ4cjdsemwrUTZSdVZUSXB2ZWU3LzdqajFtZzFmV3lI?=
 =?utf-8?B?Z09JbXl0cjl0MFEzQklLWUt0SU1Ybit0dGlRcVhTZWdCcUFDRC8wV2V1Z2ph?=
 =?utf-8?B?TnYzVVVQVGpxbTlQUW9vMVBSV1czMk9kY2hCQWJmQ0E1VDNESmdjVFZnRFVy?=
 =?utf-8?B?ZCtVRTdGL2dzWmFWRFBOYzZIOUxHeVJtdDhqb082bVV4aWROUmVQc3hjZmJ6?=
 =?utf-8?B?RXJSZ045RTRleWFuR3I5RWZkWG5DMjZBaGpQamFEWitSTDNQdjR1VUVydTVo?=
 =?utf-8?B?d1Y5UGFoSmpaUm80cVBvaTBlc3V0Mld3M3Z2WnJpT3JXbUFhSjNMTEdhWlhS?=
 =?utf-8?B?aHR2SFBtQVc4TE9RY1FxWjYrQWo2ZFBGQ0d4QXhvdndDM0dWSWE2Nk9QbWIz?=
 =?utf-8?B?TjNvb01JNTFiQnluTmY0bUZYTU1SazlRRG96NTh2OXkxdkZ4Vk1ET2xYRDRV?=
 =?utf-8?Q?K84/DUbzBWayv?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eEIybkh1c2tVS2luTmJxSDB6TWlMbmFVWVh2bUVybmpSdXBEOVcwaXVGenQ3?=
 =?utf-8?B?WkxuSFJJUTl4S0VDR3VMeFlsSzZJdzdaeFczNFUzaCtDMlAzSjhXRjNmS1F2?=
 =?utf-8?B?bDQzZHpvVTVDK3pHZTBMakxHcEZZMUJxKzhJc3BCd3JYN3RFZk9TTmlEa1ZN?=
 =?utf-8?B?MHN1WXd6MHFXSE1kbU5NZXJLYzRjZW9qc0JCamhHRlJ5SDRtdi91cUlVNmpp?=
 =?utf-8?B?Y2JUUEpCWUhjMzhDV2hKbE9PeTFxZWcvcTNIYlNEMVNRTHFvS0hTOGRYcW5z?=
 =?utf-8?B?VW4zMXFzb3BaR1dWOHBwcWZiMTVVS1VocE5hc2c2QXhWMW5uSXk0b2tocitj?=
 =?utf-8?B?RXJFVTRSUzJmNVBqT2N4K2lmbVRGVXVHRUpscVJGa1Q1UHQyRVM2bUhiN3Rt?=
 =?utf-8?B?c3JWQXNuZnpQRFpqNUtDa0pFZUxxUWFJR01Oa3o5d2dab0dZTEdRWU44bXRI?=
 =?utf-8?B?ZWNxbVM5UytMbC9jNzV1cENlK0dlaDhMd0xpYTd3dC8xbjRHczQvV2dVZWMr?=
 =?utf-8?B?Z3l5NmhnTXRpdDI5bml5cWt1UzIxMlY5Ni9Kd0lxV29FeU5HM0s1Um9oZUNW?=
 =?utf-8?B?NDdUYkp1ZHE0TEx1U0dhRkY0RHRkcElhSlNFcTdnb0pTbmtmbmdycUlPcDZP?=
 =?utf-8?B?ME10TW8rQTNMVFdMZ2plU2JUanhkdzRKM1lndVNzTlhLRHB2SDJMTmxQSEw3?=
 =?utf-8?B?ak9YNWptMncwRWowNE8xRGdiVkZTb2dNQVp0Zm40VFRUczdzSWRMa0t0ZU04?=
 =?utf-8?B?Ti80MWtZM2JpUjI3RHdOV1pHbVRBaEZpRzJEclp4Q3ZYVjBhU1FxQVRvZXdS?=
 =?utf-8?B?YVNFb2dCeTNhOU9qRzJYTFJScEpnY056SGlFb091OUNWdmFBdmg5UE1CVHA5?=
 =?utf-8?B?bHJPY2ZHcEV5VythV2JtcG5HcFJMTXRXM2NZdGhBQXE3bXF6S3VGaElNVUVx?=
 =?utf-8?B?TUNMd1ljN05CRkRPUTRSREE3VWxxa0RWdHlDL1Zhc1ArODk3TkFCeGtXVWhJ?=
 =?utf-8?B?Z1NRN0dwcnpRaG9rTEZCT1lVSllXTjFlZHRLVlE3LzlLUXFEVnM3ZUJlanph?=
 =?utf-8?B?NEswenZqVlp5T1F1NlF1a2RTRlVtZE9rR3pXd2F5dzZrNFVSVDNRWTRtM1ZM?=
 =?utf-8?B?RDJ0VTVpeWNtejMxc1NsSGxQU3pxQjAxZWVaSEw1ZzJjaXBTVXVuNHNUak0y?=
 =?utf-8?B?cmkzeFUvVjd6dXgrUlozVUNLVGFZSWpqWGtEbmhHWDM3QmZWUVRsd2FaZ0U3?=
 =?utf-8?B?eVl2NFVWb0gwS1ljbFF4T1FoeDU2ZXhhU0lTcUFUc0hmU09SUkpsMjNKUXRD?=
 =?utf-8?B?b1M3Zm5TOVZ3L0hyRlhHbnFOWEFDaG9wdmpZREEvNi9TVnJkT1lLcWJ2cDdH?=
 =?utf-8?B?SWs5Q05OTi9Qb1VIaSs0aWtsbjRkQnZYZ01QUEE0ck1HZkVtb254VGVBSFlq?=
 =?utf-8?B?bmtiZjRjY3NnbEYxT0tIWjFRdXZrM2NiOVZ4QXhDOEJpbmFiZW1ST01QRndP?=
 =?utf-8?B?VHdjZEVtVFZkUGRkbGc4VkMxaXk2WU9zWXlpeGFTeHpLYllqTWhrdHJTNnFQ?=
 =?utf-8?B?dThrbGVRYTJiQW9lT2U2ZFA4YUFmbTcycElWbUl4bGgrZFBBWEM3ck9qSDFz?=
 =?utf-8?B?WUVSM2ZNdFhteHZEcllNTXpBdEY0aDNhRnJTRkFCTWgreUZxV0hDT0toMDJJ?=
 =?utf-8?B?SUNMTFRRWHVPVHRtU3BrQWw4RUtoNzh2VHBzVFMvUkhxd2lyUG9NcjBKcUt0?=
 =?utf-8?B?bHVLTHFkWGNhOVJjVm9lV2kxaDZKSE9ERFpnTXd3T3FzaEpSS05SdnBmc2VU?=
 =?utf-8?B?aGkrb3c3UVNudVlCZncwZnpFVW5kbE9lOWxtdEFWSXppdGNadmFyVGF5RWxM?=
 =?utf-8?B?ZVB1V2l0YTJYTUhiSVh0SXhvUzlWRU1ady8vcjVPY25neXBMbFdDclhmNDhF?=
 =?utf-8?B?OXc2TU9ZQnF5RzRIQW9NellYL2w1RG1icDI5Njh1RW9odkVPWlFVRkNDbXo5?=
 =?utf-8?B?b1M5akl1TEpXQUY5WVZxb0JWYzVpcU5yRjJWWmdOUHhDSnRBOEY3akhBWnV3?=
 =?utf-8?B?ODVydkovSU9yL0xBRk45bEo5Y3hsa1cwTFBCc0RmSi9YRmgybjZlMCt1aWhL?=
 =?utf-8?B?MUkxVDhIeWNkNlF0QVRjTzhZbCthaGYxclF1d2ZUMy9GT0J0T2lQcC9OM0xo?=
 =?utf-8?B?akE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d47bdb-2794-4a92-6c23-08dd23603d36
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 14:44:01.1994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfxViBK2ib74Tg2vjowa+2IAZDG9Y7yglM+yuHbWaDE6uZWeUuOzXYDQPv3YYYJzxHo1dDuoF/vDNqcLou5nkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 14:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209042

On 12/23/2024 5:28 AM, Richard Purdie wrote:
>>
>> +# GLES2 and GLES3 implementations are packaged in a single library in libgles2-mesa.
>> +# Add a dependency so the GLES3 dev package is associated with its implementation.
>> +RDEPENDS:libgles2-mesa-dev += "libgles3-mesa-dev"
>> +
>>   RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc spirv-tools', '', d)}"
> 
> This doesn't quite make sense to me. The line above that RDEPENDS is
> adding a dependency in the opposite direction and will effectively make
> one package uninstallable without the other.
> 
> The question is does the libgles2-mesa-dev package need the libgles3-
> mesa-dev package? If not, this is not the right way to solve the
> problem you're seeing.
> 

Does this work better, signifying that libgles2-mesa contains libgles3-
mesa?

+RDEPENDS:libgles2-mesa += "libgles3-mesa"
+ALLOW_EMPTY:libgles3-mesa = "1"

Tom



