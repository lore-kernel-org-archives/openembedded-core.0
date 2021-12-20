Return-Path: <paul.barker@sancloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD668C433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 17:01:35 +0000 (UTC)
Received: from GBR01-LO2-obe.outbound.protection.outlook.com
 (GBR01-LO2-obe.outbound.protection.outlook.com [40.107.10.118])
 by mx.groups.io with SMTP id smtpd.web08.7716.1640019694295787682
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 09:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sancloud.onmicrosoft.com
 header.s=selector2-sancloud-onmicrosoft-com header.b=VnEh3w2h;
 spf=pass (domain: sancloud.com, ip: 40.107.10.118,
 mailfrom: paul.barker@sancloud.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgQQK97ywSz0TI876c0TynUvVPKv2wtTPkWl7O4Qzlbr2VNBNdr19eaiQ93dV/F1R1QQ5FT7U41BU2UhPlIgrtRtbQGbPmqJ0nS3Dqm09+gf6DiSxgHrZFCfRE0GFvnVTrSCG2cMP6PnAM5yxxFbSH3I+MJag48SPL9+ti+lQYS9urfluhrdFhgv5nRivrWjen65DlKhaxwim4hq28cmXjAeW+ygjoBV+HYm+MK2k1lT309KOOmM3TFSSiNTOx8pxZv7r1FXpy6rSiAqok8KhporxLBYOqbMiYwDCBbZsuQB0to4t+Kcc7aewi215f5jpu627A1xHbYp64CrAkVGXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rG6C1Fw57Hqm3IEoIip3fWJ1qZeLljm7h5zbGLiFnEs=;
 b=R9xgP4b4+glKFkJ7gb/Tj6kC2xp+NZbekH/oG1t1rl36xxLXt2KCCiM1G1jTm6dMxPT2uNq1AJYK3qtC3jiDVfZpDnR6gpqw+wy7kuaFLN0E/zVbybPInvIZH5QP2BEBfWL96kMHJpdqtD9cFzgpTcUZqqcaLq+dWLSUvM9WHVQHiLpnJwSQZSlwLNjdPW6AuyHTkzmuMwLZpuO2Peemn/1KGJ6vhSFv+rAP78vMf9bKJvpYv19LftkSvz5fsElL9PTw1OaYgsuPrxCeItEfob8U3QsU0d1Li7OYKOnhq9V3i+AyS9OFcnHXVgF3rmCdoaOmeyXfqI8PR9lx4U5Y5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rG6C1Fw57Hqm3IEoIip3fWJ1qZeLljm7h5zbGLiFnEs=;
 b=VnEh3w2h3BJmwc3IKzMLhevfOkni38PN7cw+AS4qgyBjfaks5x0LvY4K1ioO/cjLWPjlCGG6dWmCioVf28Xa2Wze9UKKJCVCHkQ/nFTMJzNp8H9mLYYPPw38vECesBzTuig/fIMDa51ySbYpg00joeJhy7RFk03ozFzvEVGOFRI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWLP123MB4227.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:8c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 17:01:31 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::3c43:8733:6e6a:2c2]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::3c43:8733:6e6a:2c2%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 17:01:31 +0000
Message-ID: <100ff0ce-72e1-b3b3-ff1e-2a56e0742624@sancloud.com>
Date: Mon, 20 Dec 2021 17:01:29 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core][PATCH 0/4] Move crate fetcher to OE_IMPORTS
To: Matt Madison <matt@madison.systems>,
 openembedded-core@lists.openembedded.org
Cc: Joshua Watt <jpewhacker@gmail.com>
References: <20211217153630.1746217-1-matt@madison.systems>
From: Paul Barker <paul.barker@sancloud.com>
In-Reply-To: <20211217153630.1746217-1-matt@madison.systems>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xB0Tss1Y5k6D4yDkFEn59fCK"
X-ClientProxiedBy: LO4P123CA0248.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::19) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bc7fb1a-0c00-4715-04b9-08d9c3da5ed6
X-MS-TrafficTypeDiagnostic: CWLP123MB4227:EE_
X-Microsoft-Antispam-PRVS: 
	<CWLP123MB42271FED958EA6573D2DCF8F937B9@CWLP123MB4227.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nwYBfGIrhRImrcbw4BfItaUeUOwDK14yofklra81hsXBgf3jJ3LUiZl7/eK6z57YTIbb+WkZr7ba6VWNmJAzA5yRH+WgeE3YXmdEwb6DtkxbP3xJk8fsk2bB50dP5qupPpHSnJ840dFS0HkQ02qLxthKu7YLsKlnVfCynVWXcjFoBqD6bdTgWRGz62Em9gORYu2MuRx8PpM5QaOnWcnjEHCaXCAKIqQcOrGYYH3Qf0tyRZ1U/C5LQfHs1kOISS6Y+y0uO9PrC+nT0ay460Fc9F/TNLgD+aLSnvp9dD8lqDMFTcVAgZenM7uslI8sqxFXgwW7C3/tJSduX9jL1iLOnmd/k6RtsbGE/xTglDikaMlvUH4fj4LwsKViVFpZce9IjtQitckW4hWnf8hxiWPEQ4bM2HllmzUtpn9LhL4dS1Wbt7EwxcygLWNB6fPQSkeL61pYjDP3dfdAl90lOBxLNfA/s4WeNa6Y7a+EAiPSiZnskQoSuABymhaNtqGMSFVwxcABciIHREMGZpKhcOonKLK7CVyNjd382cDj2cJ7WgxcJdu7NzPTvVdVT934Pp3axZ/mQSWuGFpZ03OhOJ2s7I/6E4iKIAJhb0EZZ90UtV+MLoc8vOC8yamkyPBUbWM3fRfzOXn4UyeLTDREAktZBxbUQZ6O3CW1c7+CTPE8Po2PnEc1QCmV0r1vVtDOY1KbKtvS1vuASNgxxyDOMDDjoqTmcFa6aNunyb+X04TRWT9pp/U1xFpshs2cQZU8UAuzYf1KS+TyArQW18LF5xMUXYoHAwSOG1i3or4GVW17h8foAcL2KAUIZ7w+GwlVno2vd/Du2Kzvbu9ry41vdVdgrA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(366004)(39830400003)(376002)(396003)(136003)(86362001)(316002)(5660300002)(83380400001)(53546011)(66946007)(8676002)(33964004)(66556008)(6506007)(66476007)(966005)(8936002)(52116002)(508600001)(6486002)(235185007)(26005)(6512007)(186003)(31696002)(36756003)(2616005)(38100700002)(38350700002)(44832011)(21480400003)(4326008)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YU1zUkt2VUVRblIwbXBuS2xMeU9rd1dPOSs4emdaNjQxdU5BT2hwTkFYMEtv?=
 =?utf-8?B?dElPd1ByUVRRMlRxTlhNTkJjMjA1SXBjSUQ1SHRVeThuYXJFN241Tk9tM1A5?=
 =?utf-8?B?dURLNzFPWEVUMFlZUXBaMGs4TWxoekZPK2tVTGJZeFd6Z3dnOE1BSzBqODRE?=
 =?utf-8?B?bDlMako3VmlWK2h4b1FBc0pCTFY2enkrTmFLOU1jOXpSQjJ5K2JDVERodU5P?=
 =?utf-8?B?L0VVazJmUzV0SUhtc053RWF0V0RRbUl1TTh3Wml4OEFORXdVbXFNbjkvTWFX?=
 =?utf-8?B?M0w5TDdoWkpOQkhFSStETngvSjR5b01lNms5cW54Uk1wOE5QMHVBUVl5ZVBy?=
 =?utf-8?B?aVRpbXJ2VDhtemtwTkZzTFpudXV6WXUyVXZmVGF0bU1hdXNtdTZ6NTdhZEs2?=
 =?utf-8?B?Vnk4Z2lKOXhpN0JuZXJ4YXRpdGM0VCtaV3R2RmtwbXowZmdrOWwvZ1pCL28w?=
 =?utf-8?B?TStvVDlkSDJ5ZloxdE9NeHpwdXRzUWsyRVV3dmlEREZ6dXpacWhWZGFzaVYv?=
 =?utf-8?B?ai9CYWIyQXhBRUUxZTIyQm9uSGN4WHg5SzlBcGZMakhMR3NYd1dwSndrbmVk?=
 =?utf-8?B?ZEYwSlV6SGt5NlVVUUhUaytKRFY1SWkwQkJPaXE2dEEwcnd5VE9SQ2NoeFZh?=
 =?utf-8?B?eThVdnhDMGZtS0pWMTFGQkcxSWdIWnMyUVAxYVVYckNGckpVV2x1TitrZTVu?=
 =?utf-8?B?NnJHVUNzNWtWdUV4ZmpuMlJQUlpvUEpyeEtoUURMRGZLUUZoODA2STRnVS9X?=
 =?utf-8?B?ZXA3TGpiZ1d1djQzd0dwdndUam9nUFZNK3lVaDN3YTRwamJXN3lISFdCRGEx?=
 =?utf-8?B?emIydDlCK01UbnI0a0VNTy9ER2xFL0JQVkxxdE9PLzk0YUJqcTBMRkhTamhZ?=
 =?utf-8?B?VnBxVTJMUnFPcitadDVTejJ4dW5HT2JOWjJuN2dBSjRZUUdpUG5tZ05oc1Ay?=
 =?utf-8?B?YW9iYlZBbFVUN2VqNFJmdElXVlhsYStYQ2dvOWZ3NHFqZ1ZLdzl3dEhleWpw?=
 =?utf-8?B?cXhTUkpzSTJzNHBmemd3SjdEUU1ZZnQzakk4U0VOQURjOE1MTTdxVWhHdGZ5?=
 =?utf-8?B?N3o2cGxFMkJSTkUrTEVHSFEyeEZLdDFDQ21pdnAvQjByV0pGZkExelJVZmtl?=
 =?utf-8?B?NmJYUnpyQVp6M0lFV3l6ODV5QTZocWRSd0VZekM0dFcya0p4QTQyL1ZXTVNs?=
 =?utf-8?B?dmx4cDBHeW42bGhhaXh0bUN3U2x3WjhNdzRnSXR3K01ESWRTR2pVcGVMNStv?=
 =?utf-8?B?VkZST2V2MlpaVEZjVmtSL2ZVVTBVMWF5Yld0NXJPQkc2S1RMbFpJVHhFcEpk?=
 =?utf-8?B?YUdOK2RuZ2huK2pqcnU3R0xzZzhYcWVyQ09VMXNndlJYMXBWQmFhTmw3aGMy?=
 =?utf-8?B?cXdiZjl3TVNBcmdwWnRrVDFBbGJUSDdiRmpBa3NDVDNITkRGWUpzakpBV1Jn?=
 =?utf-8?B?Mk9ocmRlRkNpM0tPN1JuQWxTRDE2RVZpcDdodXU4MmdDczJXK3FROUV6NFlp?=
 =?utf-8?B?UmF0bnljcVRraE5QdU1Md0JENFQ4WGdqREN0MVpIV2liMXFDMVk0MG16cmxP?=
 =?utf-8?B?VFM1ZXh3WTJVMnhHb0x4ZDl3R0VYQ3dyOSs2TW5oUld1WE1INHY5WDZmdkhi?=
 =?utf-8?B?cWFBU3NiTGgyYVdRN3V1L2xuQWh4T3gvTzhqemMvV2RIK1VyanQydUtJc1hI?=
 =?utf-8?B?K3owTkhuWEl1YkRCMHN1R3hBSnl1VDJGcGpvdy9XM3VBN0FuU3YyRWN6eG1n?=
 =?utf-8?B?eXFyeThPNk1qTVEzY2I4MkVFUWxNc25aQkZxaENxMWlQWkluRG1NVjRlbGJ6?=
 =?utf-8?B?OWFUSStBeW9nVkRRNFE4QWdtZHRuRzdmejZpTEdySHEycjhWMGpJcEVBQVY0?=
 =?utf-8?B?T3gyeTBzSGg5KzQzRXQvbXlwOHZaREpjU1A1Z0tEUWIxZDRCZjg0a0Jzczdz?=
 =?utf-8?B?L0NraXRpMmVHSkhnWGp4TytXY3JiOFVUazVhenJvS1RDTGVlNnFPa2FBc2xX?=
 =?utf-8?B?MDM1Q2lZWktmcE53MFp4T05KY25maTk2K1VyWGwrQjhySzRKczF1TG5aSUUr?=
 =?utf-8?B?ckRaQ1dybWxuenFFRlY5dlBGY2tkMlJObHMxb1hIOEYwb3BIRit1UjM5TWFS?=
 =?utf-8?B?blJiYmpxeE5NOGc4cVVKUFRIQlJTaE82S0t2dHJiY3ZCaXNXMENzWE1KeTJH?=
 =?utf-8?B?bTJXTWpic2dMWUhMTnpCM2Fmc2FibHVzRVIyTkhIdy96S1p2cFJPTXFoN1li?=
 =?utf-8?B?Yk91SkR4Z2Z2Z1UveVluZllWWUpBPT0=?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7bc7fb1a-0c00-4715-04b9-08d9c3da5ed6
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 17:01:31.2725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /k63aKlI9KGn5uVbhAbvSjAxf8/ia8dHxmNoPSUve+HfYxhUXoRf/r2V5eE4o1KA11Ir4+M2nJd5lDyqG9O+Y6UZthT5yf9XnaZAFevm+74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB4227
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 17:01:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159892

--------------xB0Tss1Y5k6D4yDkFEn59fCK
Content-Type: multipart/mixed; boundary="------------CvZ9JmdR6d9t77qf3tgqQHwh";
 protected-headers="v1"
From: Paul Barker <paul.barker@sancloud.com>
To: Matt Madison <matt@madison.systems>,
 openembedded-core@lists.openembedded.org
Cc: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <100ff0ce-72e1-b3b3-ff1e-2a56e0742624@sancloud.com>
Subject: Re: [OE-core][PATCH 0/4] Move crate fetcher to OE_IMPORTS
References: <20211217153630.1746217-1-matt@madison.systems>
In-Reply-To: <20211217153630.1746217-1-matt@madison.systems>

--------------CvZ9JmdR6d9t77qf3tgqQHwh
Content-Type: multipart/mixed; boundary="------------19pslwtWurwqI0ul4ACa0RAZ"

--------------19pslwtWurwqI0ul4ACa0RAZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcvMTIvMjAyMSAxNTozNiwgTWF0dCBNYWRpc29uIHdyb3RlOg0KPiBUaGlzIHBhdGNo
IHNlcmllcyBzd2l0Y2hlcyB0byB1c2luZyB0aGUgT0VfSU1QT1JUUyBtZWNoYW5pc20NCj4g
Zm9yIGluc3RhbGxpbmcgdGhlIGNyYXRlIGZldGNoZXIuIFRoaXMgc2ltcGxpZmllcyB0aGUg
YWRkaXRpb24NCj4gYW5kIGNsZWFycyB1cCBpc3N1ZXMgd2l0aCBpbnRlcmFjdGlvbnMgYmV0
d2VlbiBTUkNQViBhbmQNCj4gdGhlIHNoYXJlZC1zdGF0ZSBmZXRjaGluZyBsb2dpYy4NCj4g
DQo+IE1hdHQgTWFkaXNvbiAoNCk6DQo+ICAgIGxpYi9jcmF0ZS5weTogaW5zdGFsbCBjcmF0
ZSBmZXRjaGVyIG9uIGltcG9ydA0KPiAgICBiYXNlLmJiY2xhc3M6IGFkZCBjcmF0ZSB0byBP
RV9JTVBPUlRTDQo+ICAgIGNhcmdvX2NvbW1vbi5iYmNsYXNzOiByZW1vdmUgaW5oZXJpdCBv
ZiBjcmF0ZS1mZXRjaA0KPiAgICBjbGFzc2VzOiByZW1vdmUgY3JhdGUtZmV0Y2guYmJjbGFz
cw0KPiANCj4gICBtZXRhL2NsYXNzZXMvYmFzZS5iYmNsYXNzICAgICAgICAgfCAgMiArLQ0K
PiAgIG1ldGEvY2xhc3Nlcy9jYXJnb19jb21tb24uYmJjbGFzcyB8ICAyIC0tDQo+ICAgbWV0
YS9jbGFzc2VzL2NyYXRlLWZldGNoLmJiY2xhc3MgIHwgMjggLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPiAgIG1ldGEvbGliL2NyYXRlLnB5ICAgICAgICAgICAgICAgICB8ICAy
ICsrDQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMxIGRlbGV0aW9u
cygtKQ0KPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL2NsYXNzZXMvY3JhdGUtZmV0Y2gu
YmJjbGFzcw0KPiANCg0KV291bGQgYSBiZXR0ZXIgc29sdXRpb24gaGVyZSBiZSB0byBtb3Zl
IHRoZSBjcmF0ZSBmZXRjaGVyIGludG8NCmxpYi9iYi9mZXRjaDIvIGluIGJpdGJha2U/DQoN
Ci0tIA0KUGF1bCBCYXJrZXINClByaW5jaXBhbCBTb2Z0d2FyZSBFbmdpbmVlcg0KU2FuQ2xv
dWQgTHRkDQoNCmU6IHBhdWwuYmFya2VyQHNhbmNsb3VkLmNvbQ0KdzogaHR0cHM6Ly9zYW5j
bG91ZC5jby51ay8NCg==
--------------19pslwtWurwqI0ul4ACa0RAZ
Content-Type: application/pgp-keys; name="OpenPGP_0xA67255DFCCE62ECD.asc"
Content-Disposition: attachment; filename="OpenPGP_0xA67255DFCCE62ECD.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
4yvD5AdHy8s8HYtBP5oowjSllz6aOtP0BiQ=3D
=3Duult
-----END PGP PUBLIC KEY BLOCK-----
--------------19pslwtWurwqI0ul4ACa0RAZ--


--------------CvZ9JmdR6d9t77qf3tgqQHwh--

--------------xB0Tss1Y5k6D4yDkFEn59fCK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS7m7rT1+CktY3YG1PYN3IfEvob6gUCYcC26gUDAAAAAAAKCRDYN3IfEvob6s2z
AQCf052Vg23sLs96mMmttbX/ObebNM7ZZlTqOddCBR8hkAEAy/PrZTDdJL04OJXbZLchC/Y2oK4Q
QO2Ltflq2H0xjQE=
=cDa1
-----END PGP SIGNATURE-----

--------------xB0Tss1Y5k6D4yDkFEn59fCK--

