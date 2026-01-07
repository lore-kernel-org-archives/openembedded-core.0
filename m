Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324C6CF6BEC
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 12:19:55 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4446.1767788391384809305
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 04:19:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=J9B4QasZ;
 spf=pass (domain: siemens.com, ip: 52.101.66.48, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JyFKkVt22OAGIQa58mc5iXyN+eE3rCo2U3+Y7vlZfhaHo2ZGUkENFWY4jS1NeCIVfh65msqCjXM9KKR5ECNvLQEdU1g2fSFQS6ORio+O0q0I5TY/JP9PGi+nViZXiyZsnTGJ2ndQtK0VpNb5c0bvIe9/HBCCNjT1fxUMnR2uayMMxRBbi274WdI/e3zAI/vWnyK9fA4V61XYq5PYg97pxkr7+vSACv6WSdBqRnXgZ5QVxxE25OgGE0Ls/TMxUHuGvdPHxHvOamcS6LrGlo1dm5Np7utbQj5jYtkmNrTNmdA/0Zea+jo7o9YXnT7edXWHCs922JYDeCK6W/LM7J62Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o422AmVqjyJMpzTTcZ1tjGn+3tJZPJqhqSYLOCwsVOU=;
 b=gB749oIl6fcobfb0XntlYXQtlwIL0I5SBpuQvZ75kbXj2LDU83/SW6G0b29z8wtIKDQYqFeDYE8hkK1ykhUGxgWa/D/n+rjYdGeI5Dxp6aZ9iJVRIRvWx12+arzbYpyzpFQvPCLywLVQTgLpEh+QLMCstf/rGw1RyrlTntRPo/vO1PFkSN5hWN0U//MaCyIR+g8HP8Wsu6wGCGizjEDOxb66DRSikQ7Bc7nPcp+yoHMtwDzqZm3b6Q7yE+x40Dk2mgJVKLblxNAMjneCIwzJVg55UeORlHOH2qv1Bqf+37JsPFgutxrxIUn/9mbEf7MiZ2Jwn7Xy2Kf6zSyH5asB/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o422AmVqjyJMpzTTcZ1tjGn+3tJZPJqhqSYLOCwsVOU=;
 b=J9B4QasZ+syELkRnL/8p4z/YgRaZyn+U2863BpO5SlsEzvsjlMmW+Dzrgt3fx0TkTiZuE9/W0gy7y9DqXCrSNtXmze10VVSSthZAh8d4vIGGGShk8FUGAlDY2d7oSa1NplDlo+SwETetdjoRY3ytKv6IDT1qC6XhgewRZdATEo2wqU7mKYmSZXwfc6EAArh35EkEXhqjLjHSGlX0FcL7X/kMkD8RPEz2SbF5l+pEIzR0gfP1XBdCSEStY+TEANjDP+eVJilxhdGyJs79lsjzwtsgxvuPnaPMzfYVPKaD0MaNRR+1odEHvBy+C0smwAyxkDSRBvRAs2feqMx8eFaBXA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB4PR10MB6093.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:38f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 12:19:47 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 12:19:47 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Paul Barker <paul@pbarker.dev>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][whinlatter 04/11] python3-urllib3: patch 
Thread-Topic: [OE-core][whinlatter 04/11] python3-urllib3: patch 
Thread-Index: AQHcf8/piWvBKro1FUKCwm0S8apMtQ==
Date: Wed, 7 Jan 2026 12:19:46 +0000
Message-ID: 
 <AS1PR10MB5697BF5D70C1BCB02E7F1129FD84A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <cover.1767772757.git.yoann.congal@smile.fr>
	 <34083b26ca1e5a52c627e41a1adbeaacf79dfa6d.1767772757.git.yoann.congal@smile.fr>
 <c19daed92270797942ebbb4b51c6f6b03fec16b3.camel@pbarker.dev>
In-Reply-To: <c19daed92270797942ebbb4b51c6f6b03fec16b3.camel@pbarker.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=afc9dc25-0b78-4551-b09f-14b4b8fb2147;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-01-07T12:18:26Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB4PR10MB6093:EE_
x-ms-office365-filtering-correlation-id: c869eeb4-30ed-4291-d2b6-08de4de70c2c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SExudGpGNk4yNS9ScVBxYWFVMnRzSVNoT2tXVm1YTkRrakE3cW84TTFJdFJB?=
 =?utf-8?B?bDl1T0J0amt3akl1SlpUcHdDK3RKZ25Md1NIZGQ0UnZ3R1EvM3JBRVhmNUVS?=
 =?utf-8?B?dlNmWTRLL0l5THhSZGxyMVltYUQwSThJZXJlU254Z3VyVDR0eHgxQXJaNms2?=
 =?utf-8?B?b1ZhT3ZBNm5GNjQ5dnQ1RzZkRlp3alRkYUl3V1BaRVJtTXJDOGVsTzdISWxC?=
 =?utf-8?B?YTNjZzZmQlRwKzQycWlJZm8rRGo3SlFpdkdoNlE3K0lDZ1hkOW43bm50TThk?=
 =?utf-8?B?dk9XdTZoU2FFL0lKbzM5REdNUFFGN1pmT1FJRG1zZ2lMcldBN0lNbUJZRk5x?=
 =?utf-8?B?WG1vdnRRTWZ6MlpiRTZQdVJFZWZIWTNXdkhEV1BFcjg0NENXVUVuTVJRYWhP?=
 =?utf-8?B?WHZZNWFtQnZ1bTVXZE52bXlmbzExSlJFQzk3VmFoS0ttZEJsUFlSYUU4UDcr?=
 =?utf-8?B?RlN0L3RrbEtsVG9TZU9yZ25PV2hva09iTXA5bTVqUWhUSmxNVnlrcHpvT2k0?=
 =?utf-8?B?Q0duc05zT1RSQWsxU3BUazRhbExqZ3NYdFZIWEVRWDc5SEozMm5QOFVvdnM5?=
 =?utf-8?B?enVldWN1eHNyOTgvN1l1c1VsL29Ta0pncjllaEdYZWh5QklRZHdOWTEzREMy?=
 =?utf-8?B?L3A5ZEZrNm8xaWJ6NnVISUF5UXhhTG5aTU5LZUtlMmViQzl1U1BWRVUwOTFZ?=
 =?utf-8?B?aktHZ1pwaWpPK09sSmRxL0RXZUpsRE5pV0dTU2ZGYXh1Vlhud0ZrY21CYUJ5?=
 =?utf-8?B?c1d3N2RFWnlzaWRYcDRQM3lOTndnTDJ5Z0c4R0t1V3RZdkFmc3hKQVNoSXlG?=
 =?utf-8?B?SlZiUGNKWjNnZk1hVEVoMjNxc0hpRmhvWnU2QktDc1ZIbGt1Y3NMODl2WVNO?=
 =?utf-8?B?alR3SzVGdG9UcTEzaDlqQ2hsaGNjSWUyNU91dm9xTnNGR3F5RmJqUTJYZTU0?=
 =?utf-8?B?YTRwTUIwUWtVTFRJZHN1LzR5MEVlaHpndm9RM1VOOEkxZjBHVmxoc0MybklR?=
 =?utf-8?B?dWw3alBNSnJyZ09IZ01vMWlEeEkweG91ZzNKcC9KV3VaVEJQQU1jdDhxSTNV?=
 =?utf-8?B?Z0h6d2o3dk5ZdE9FQTdNWnJOY1JhcVJqZXVtbysvOWxkaUNyL2l2WkFWRkFJ?=
 =?utf-8?B?a3dCc0tMT0thODlTSmtPTDRXRXZYSnk3OUcyN3NpS04wNHhRUXBMcjNTcTRR?=
 =?utf-8?B?MEM2cWpGVFRjSW4zSTc3NFZWa1VBOG5qK1dRNVRFK3I5amlLZlQvdDk1Qkl2?=
 =?utf-8?B?dDBrNUdDcGVrMGRGMXV2YmdtZkxFQlh6cXVXMHhVbHdQK1RyRytMSUdzSTdz?=
 =?utf-8?B?S2tOUGM1OE1yd3FOVk8xdUYySVNoN2pXN2tpeG1yWitjZUsrVEx1Y1FVZmQw?=
 =?utf-8?B?SjhFUG4yN1ppWXBDWDh1Qm5RbUpka3U2L0ZlaVVsMi9veVU3WTlCYVNHV0Nm?=
 =?utf-8?B?My80MkN5L2ZNclF5T0ViRHAyc0tXSVNzanFJWFVGZUNsVWpObjVTc1l5cjA0?=
 =?utf-8?B?ZmZ2NGFIOXpvbjJUY2Y3alJLb1ZMSjZmZVdHakdLbyt3MDJMaWtDamhnT3Rh?=
 =?utf-8?B?QlJkeDJwMXNqVk96b1FwK2pLYW5QMjFDd2VWVThxSGZDaG5YZHpuMFUyb2V4?=
 =?utf-8?B?LzVDN2pNWUNValFIY29NVm4rSUxEZ1pnTWFWakRtMTg3VGpQd3JoaWdNZUtl?=
 =?utf-8?B?cVh2anEyajJCdnR0MFFGMmhodmo0ZWFqTDFNQUhpMTZKdHlrNlRYOUgzV3Z1?=
 =?utf-8?B?MHk2UjliRy9zODFwaXZyZXRqZGdVdDRhbi93ZytjcjJOeGpaQ1p0L05rTk05?=
 =?utf-8?B?R3U2RkU1WEd2aEtIMkVSQkY5elc1WXMwTHYwRlNDNDVnQVhsbWJ4amE1bk5s?=
 =?utf-8?B?ZTNDTUd4Rks5ejdXZi9TeDhqVStsU3NRV2xnMnRrakdCL3lJZFA5eThaRm1W?=
 =?utf-8?B?N1VHRWZsYkNpUnZHNEFXU2pNYWkxTDZGZERRUEptaXJ3ZVVLWkZWNm9LVDZa?=
 =?utf-8?B?RUpEVCtZa01BVkFkSHpnSWdrc0RGUEhhRzAvVWlKWFFGSko1NHNQeGprQ2Rt?=
 =?utf-8?Q?rsUoZo?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?M21rSmptTFlUK0xXZFRvaVJxaXNqTzBINGh0N08xMmoxMWo3a3pOM2RSSkto?=
 =?utf-8?B?YWpoTVVmUHhHOVhWMmw1M2cwa09JdFgrd2ZML2JjQjkvUW1NRE9VSTkvQTl4?=
 =?utf-8?B?czlZMExDSS9ZZUJ6c0VwcFR4WnArQUhYaHB3Q0NZdm4zQURsblY4d3ZKZWZU?=
 =?utf-8?B?UnNNdWJNNFpYTmxtRUpndlc4ZE9JWVUwRWxvQ0VJT2pyUjAzMnV0eE8vVHpu?=
 =?utf-8?B?RHpLY0tGSTZKWjFweUJzcTRaSWE0aU0yZ0JlWENPVkkveUhhTXdXVDRlS1l6?=
 =?utf-8?B?YWZJZjQ2Ri9EalJycGp6QnE0ZGRxcnZZa25lQjRDWGdLYURVQzQ1Q2lrT0l2?=
 =?utf-8?B?T3k0enI4ZHN0WCt2eTZhRTJCWk45aGRzWWZXalJMZzlIdWR6cTgrQ3IwdVB0?=
 =?utf-8?B?MVRKbmhMa3BlejNCcW5Pbkdpc2lFU0RjUUdLMm5Pc2dpRDFUL1hhdVFvSlhU?=
 =?utf-8?B?amdVRld4c1EyN2VTc1JuTWlMTnhxRkpZRlhGbTJseWF0ayt4V1E3aTdvcmlW?=
 =?utf-8?B?ZkFhajgxSDVXZThBTSsyRldYVzRsNlNya2hUVmRSRWVrRmc0cktaWlgyN0JQ?=
 =?utf-8?B?NGtmQm5YTXZRMWV6elZYZjByOGVjR0FwN2o1b0wyVGhZL1VqZDhNY016WWpG?=
 =?utf-8?B?V2R3OENXaDZyM2NzcDhQVGZIa3Z4SW1oZ1pPWmdldVQwMVM2UDhUVko3V3l6?=
 =?utf-8?B?ZlhCUys4cXM5K2ZTalYyYnZ3ZktlSXRucXdzbUMwNDNZMHluTnNGUTZ3aGsz?=
 =?utf-8?B?Um5xNElITk9iTkZGSWxzeVVsNzRvenpwTWUzWG00MmxFaTBnSkxSOHljNG9y?=
 =?utf-8?B?MzM1aWdoMll5MENJTDUzRGcydVNjMjRIeW81bE5Ka2IyWmFoNE9LU3RnbEJM?=
 =?utf-8?B?S1pkeHRvMnNFb3I2VWdDS3FkZ09DU0xzOXJqWjFVNHhTaW00ZkZoV096RFhy?=
 =?utf-8?B?dUFBVlJVRVhxTHo5OFhDM292K0h0bmF4dmJDV3g2STdjRWVROHRoOEhvVmNa?=
 =?utf-8?B?dWs0Ty9pZUdBYjd5K1ZDRU04ZUhLL245U0ZpaU5qN2Y0M2lDUWd1VGVkSmp3?=
 =?utf-8?B?eVZhcDZEWCtHNmxUTFJhUmpjUERLNm1UQ2w0V2pHRU9sSTR6Z2JpNG0wb3Z2?=
 =?utf-8?B?OTV2U0d3Z2h4S1R2eVdUbk51VjZkZk1BYlRReDNwdGNBMk1abklsQlRLTVla?=
 =?utf-8?B?Uk1udXB5MUZjMHhtVGhENmxnN3hVYlNZSWRsMjIrQWdqZ3dFSE1Ic1ROTkxV?=
 =?utf-8?B?MWZ5ZzM1dDRaL2t5WSt5TlZNeEovWitnNnNvckZHMCtjZEFDWXkxR0dsVWZ4?=
 =?utf-8?B?REdnaEhhUk92UUUraXY0Z0hnbFlGTkVFWWJQby9CWHZ1YUdORGQyUitsczlj?=
 =?utf-8?B?NFZqQnd0Szhub09RV1JnMWRmYVVXNGFMWmRSWmdpY1c1S0ovWlkvczZ1eUZD?=
 =?utf-8?B?NG9NaE53N25GemVLWk1aMkNndER3eWI5ZmlPdXZsdlc1VXJPOGMvbTNFYWZB?=
 =?utf-8?B?MS9JSU9hRzRpNE12eE85SG10Ri9sWEMwTnFaRVJEYlNnQ25BNEcwb29QNWo2?=
 =?utf-8?B?NXVXUkgxWCt3UlZYUTMyWmNvLzAvUW4xWm1GZldGZnZVU01QcVUvNDJHVTFj?=
 =?utf-8?B?TUMyUGwrQ250eVU0RGRZU3gzbWl0ditzcGpQM013alVmdEVmNW9uWEY3UHo4?=
 =?utf-8?B?dkl4MkpvUjArWXNvbS9zRmJRRzRQVjNtZDVJTVhaaHl4cG1vdENsQVUwckUv?=
 =?utf-8?B?TWJUeVRxdHFCZGVqVUFaSmk4NVhEYkVMZ1AyOHp5Y21ncDdiVmRCSVlPWjdV?=
 =?utf-8?B?OWNTRGhSZ1o3MmpFNVl0YzBoWFpLSUJ2SWxPUm82TXdNSDhEZmdiNUI0Tzl2?=
 =?utf-8?B?cGlDUTBrNVkvdDl6dzY5NytmU1dxQVluMUh2VFhlS1cxSnZGRDRkN28wb1Jt?=
 =?utf-8?B?djQ5MldXOVNRL1ZqRGRpQXJrVEVFSVRlMjROZnBSc0tiRGcvSjJxRnAyK292?=
 =?utf-8?B?bDUxbkh6U3NOdmVkSGI2aWtIdXFmaUxMTTZmSktRN3BEbjgrR2JNekFSeWlX?=
 =?utf-8?B?V2JFeGZEanhTMm1ETXBLMmJvOTJtN0lkUjNJK0l6SC9NVnllaklRNjViRGZQ?=
 =?utf-8?B?bFNwVHZZdEpzUWp4d0NYNjZXd2tqUGdESFZiWUMzNldTc2g3L3hPOC8vT2dY?=
 =?utf-8?B?aUhYbzFUeloyVW5VSldjRTcvelROWEROY05SQU5YbGNzTXRiQVErUi93NUFs?=
 =?utf-8?B?dFZlRnN6MTNNSWJSc1FxbWs0OUNvT2QzME5uUWJyQjVuYTV6TWZ4SUxjMDcz?=
 =?utf-8?B?aXloZ0Q1TXR1bUNLWEtVZEZwdWJzSENiTi81Zm11YXQ1c2ZVRUFSQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c869eeb4-30ed-4291-d2b6-08de4de70c2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 12:19:46.9779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wq4HEjChY+kn4ebewSiAopbxdlymJwRZohseCClz5vN2OJZk6AILl06DAfQEehzhCEN7JpKvyplunGaZpOeA2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 12:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228996

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGF1bCBCYXJrZXIgPHBh
dWxAcGJhcmtlci5kZXY+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSA3LCAyMDI2IDEyOjQ5
DQo+IFRvOiB5b2Fubi5jb25nYWxAc21pbGUuZnI7IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc7DQo+IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIu
TWFya29Ac2llbWVucy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV1bd2hpbmxhdHRlciAw
NC8xMV0gcHl0aG9uMy11cmxsaWIzOiBwYXRjaA0KPiANCj4gT24gV2VkLCAyMDI2LTAxLTA3IGF0
IDA5OjA4ICswMTAwLCBZb2FubiBDb25nYWwgdmlhDQo+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcg
d3JvdGU6DQo+ID4gRnJvbTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPg0K
PiA+DQo+ID4gUGljayBwYXRjaCBwZXIgWzFdLg0KPiA+DQo+ID4gWzFdIGh0dHBzOi8vbnZkLm5p
c3QuZ292L3Z1bG4vZGV0YWlsL0NWRS0yMDI1LTY2NDcxDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4gLS0tDQo+ID4gIC4u
Li9weXRob24zLXVybGxpYjMvQ1ZFLTIwMjUtNjY0NzEucGF0Y2ggICAgICB8IDkzMCArKysrKysr
KysrKysrKysrKysNCj4gPiAgLi4uL3B5dGhvbi9weXRob24zLXVybGxpYjNfMi41LjAuYmIgICAg
ICAgICAgIHwgICAxICsNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA5MzEgaW5zZXJ0aW9ucygrKQ0K
PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXVybGxpYjMvQ1ZFLTIwMjUtDQo+IDY2NDcxLnBhdGNoDQo+IA0KPiBUaGlzIHNlZW1zIGxp
a2UgYSB2ZXJ5IGxhcmdlIHBhdGNoIGZvciBhIENWRSBpc3N1ZS4gVGhlIGNoYW5nZWxvZyBlbnRy
eQ0KPiBpbiB0aGUgcGF0Y2ggYWxzbyBzYXlzIHRoYXQgdGhlIEFQSSBvZiB1cmxsaWIzLnJlc3Bv
bnNlLkNvbnRlbnREZWNvZGVyDQo+IGlzIGNoYW5nZWQuDQo+IA0KPiBXZSBzaG91bGQgbG9vayBm
b3IgYSBuYXJyb3dlciBmaXgsIGFuZCBvbmx5IHRha2UgdGhpcyBpZiB0aGVyZSBpcyBubw0KPiBv
dGhlciBvcHRpb24uDQoNCkkgb3JpZ2luYWxseSBkaWRuJ3Qgd2FudCB0byBwYXRjaCB0aGlzIENW
RSBkdWUgdG8gdGhpcyByZWFzb24gKGFuZCBkaWRuJ3QgcGF0Y2ggaXQgaW4ga2lya3N0b25lKS4N
CkJ1dCBzaW5jZSB0aGlzIGhhcyBsYW5kZWQgaW4gc2NhcnRoZ2FwLCBJIGRlY2lkZWQgZm9yIHRo
ZSBzYW1lIGluIHdoaW5sYXR0ZXIgZm9yIGNvbnNpc3RlbmN5Lg0KU2hvdWxkIHdlIHJldmVydCBp
dCBmcm9tIHNjYXJ0Z2hhcD8NCg0KUGV0ZXINCg0KPiANCj4gVGhhbmtzLA0KPiANCj4gLS0NCj4g
UGF1bCBCYXJrZXINCg0K

