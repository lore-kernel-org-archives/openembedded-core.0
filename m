Return-Path: <vince_chang@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5F2E68948
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 02:11:24 +0000 (UTC)
Received: from HK2PR02CU002.outbound.protection.outlook.com (HK2PR02CU002.outbound.protection.outlook.com [52.101.128.139])
 by mx.groups.io with SMTP id smtpd.web11.3639.1730340678330676908
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Oct 2024 19:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=AvtTQK44;
 spf=pass (domain: aspeedtech.com, ip: 52.101.128.139, mailfrom: vince_chang@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6USmlrtEIA2VNVOe1MQwvt8d8k/tJGznI+/IG+kVJbyfE5egV3ckVG8h3du5pNZDz8kXWD5Prh82BlLIR/5MSyor03mezVENaQj6Sy4NmZIPM8uf4EknpO+U/6amY6XRb7+nhmG7YKCpNJgh/tyc0b3bSIl0CGG8YYphiSn7au78i0CEcPtIijsdrxent4B9YUUyy+IQzSBwf9ts5yhf6Lx3s1cOOJzDX4I0UxtWeWVNdwC3BRrxAoWSaCxQw7qH6JVXciLXbyzGasiZ7CArjuPedW7MRl7QMlpf2LarM63/nWMxVyRbp7n9ylyKcmI2ipCTXSWkgbGQjNdIBFfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zCy5o1c4QMr5BQKI5EzYEFOMb+hZF+SJjObnp/PeUw=;
 b=hLf0cdnIxYr5S3KohXiA9avYlbwd4X03AmCX938fVHGU1PSEzySFQG+NejnzuWLDO3d4x/1zRbJqC37jJOm6j00FodMBNXmhIaB6K+sEHxkBGtyG1+Lt5QDhlP85AcdCZrWuK5KM7BdGVu858kkGEtVCf6MgqDRzJWgNPC082eTKEr3qhsjhvC4r/e9KdASySli9692jNdxa5bkSg2i1HmdjF5atEyhNq6UrvRD1wOYfFFcI37MjL2yPOJTZ6gb9yyDl8308112q5dh+53AsybADKI2ZFkjV3g6SOjnTTnIvEi2AYOtw4r+XBpdExnm0ADIoTRR+bYr0oJNrJ3oxrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zCy5o1c4QMr5BQKI5EzYEFOMb+hZF+SJjObnp/PeUw=;
 b=AvtTQK44qNMKT8dvvWtpJSJBiUMR3oWSD33ss2bfP+nIPLrRVPQDUx4SqVlLLGqVNo3r7RRK1hmrfnw7JvpxyrnC2TxlpnnpfMSMx+cXq7J+JDZ/5LHk0skiL5u4qSwHUOAz+gGzWae+3+k1Z7V+SiWjcN/eIVZLlDRLmpfsg0O9a3zd3hpYP9xuZbQMsf3OTeiIY+f/1RGfw/6/HTD3gebAbyM5o9Z7rmYkSIOktQ12AQGuJUKQhX+jf4X9wEbhe2VlD7lvDZNyaujOPt2qtqtYXiFzOzq4tLdGfahGwi/2FPf3wqqJPZbFLNUiuAaZMLIQINbergogi4+/VjIfbg==
Received: from TY0PR06MB5707.apcprd06.prod.outlook.com (2603:1096:400:271::10)
 by TYZPR06MB7172.apcprd06.prod.outlook.com (2603:1096:405:b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.10; Thu, 31 Oct
 2024 02:11:10 +0000
Received: from TY0PR06MB5707.apcprd06.prod.outlook.com
 ([fe80::7918:f902:3ec1:4e7b]) by TY0PR06MB5707.apcprd06.prod.outlook.com
 ([fe80::7918:f902:3ec1:4e7b%4]) with mapi id 15.20.8114.011; Thu, 31 Oct 2024
 02:11:10 +0000
From: Vince Chang <vince_chang@aspeedtech.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Jamin Lin
	<jamin_lin@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>
Subject: 
 =?big5?B?pl7C0DogW09FLWNvcmVdIFtQQVRDSCB2MiAwLzJdIHdpYyBzdXBwb3J0IGRpZmZl?=
 =?big5?Q?rent_sector_size?=
Thread-Topic: [OE-core] [PATCH v2 0/2] wic support different sector size
Thread-Index: AQHbKsvcoIRhmSl0kE+pCMCxVX5HWLKgHE0s
Date: Thu, 31 Oct 2024 02:11:10 +0000
Message-ID: 
 <TY0PR06MB5707BE94581CC7F425214A2EE2552@TY0PR06MB5707.apcprd06.prod.outlook.com>
References: <20241028034618.1504830-1-vince_chang@aspeedtech.com>
 <CANNYZj_KF41W10duL5u0mDDbv1aFUxdcGAmUtO2fEc0EtZ4ymg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_KF41W10duL5u0mDDbv1aFUxdcGAmUtO2fEc0EtZ4ymg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR06MB5707:EE_|TYZPR06MB7172:EE_
x-ms-office365-filtering-correlation-id: 30bab0ee-6b6d-48bd-ea17-08dcf95149d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?big5?B?a0xFeUQ5RlZ6UjFJeHAxdlBYT2FRUlhldU5yanVSTVBUL24yd0g1bnJsR2FYanhE?=
 =?big5?B?TzdIamlpUDN5SWRoOVVCazRkam9jK0VvZ25GS2hiczdLMVdJMHVlTFpoNzhxa0I1?=
 =?big5?B?NzNlVDZFL3lNQzVHQlpOTDhzRGtHVHpNc0oyZ3ZYYm5TYVpEN0xwTTVwREN4aXI3?=
 =?big5?B?OE84dnlqVDZFREJreGdqV1NzdGVNTU4reWQwRktGSkJmcTVob3JFOEZ1akpwNlow?=
 =?big5?B?ekNLSTlUVmROSnpYQnRFL3ZPRlpHOFVvcDBMNi9kbHFEcGtRNXdDZUc4bllGTXNk?=
 =?big5?B?NjJDUk5oVUxpamRPck80dFgwUVlPRzZ1UXRMKzR5MHU1WXhScFFPRG5iV2FLaUNp?=
 =?big5?B?S1ZRaStTZlhVb1ZiaGRaRUhUNmJXY0k5RnRpOCtEb0grZGljS3ducThpSVUvT2hU?=
 =?big5?B?RDdsbVFNTjNoU3kxRjQyNzJXWUNDM3IybWU5R2lHMkRzbjBURE96TzNoT0ZQWU1j?=
 =?big5?B?bEhQT0d1dllSWjkzQWFJTHl0aEprY1R2SmcxdEsvc2h1N0NSakw1SHU0Rkk2alRR?=
 =?big5?B?N2taSnN0NldVM05OUWpaV0R0eWVYYXAwa1U5SDhJY1NtQ2Q4Z0VzeFJGdXhTRGEr?=
 =?big5?B?ME1SeTRlMTdWSVBlVk85eklCZWtIT0YraGNNRlNhUHlEd3pBSmR5OHlndXNndjA4?=
 =?big5?B?YVhxTHIzNDV0SGJjTFdpbjcwNXg5RVBpZlhidHpLdlhtS08zUGFOaXhSN0lNamZm?=
 =?big5?B?d0ZMWUUxVHV2V2dFc05GZTFyTmNsNUJwZUtZRndhcXdRVlhhb2pkOTdxZmMxaXhC?=
 =?big5?B?K0lNKy9Yc1I2ZXZaMWZSbkFTSm1iQVJjWkJXM3JVR3lWbEtxOEx4dW1pejBIdXhJ?=
 =?big5?B?MG9tVFl2dVhSUWg0a3FPY3ZWRStrV0tBYnZJSmc4VmMxa21WR2RzcFhpdmNCZDc5?=
 =?big5?B?S3kwZmErQURGYWxkVmE2Y2tiZEZHM1U0ZjBnNEp4YmRTcktoNEw4SWIrWUFmSUpQ?=
 =?big5?B?dCtlRVh4ZFlTVXJ5T0Z2TjNtWlNYM3lydHdWK1EyanFLdG9kSU95QVE5NXZ2K005?=
 =?big5?B?dDlmVEQzSVB2emhJaHo4T1lTTkVSWHRTTzdsZkRXMWsvcFhVVmF4RTduNFdDNWxU?=
 =?big5?B?RXA0NXNhZ0dFWC92ZW5aajV1dnlHdlZEN2lRczM1NUdlVW03M0xzREQ1VFNtelZj?=
 =?big5?B?aW1kN2p2S3VPSTZMa3hSbDZ2L2FhbkhnekQ2a1RkeVFnSmRENVRMZGpGMklKVmEr?=
 =?big5?B?Z2FMeWRXbGhvRWlCOTBqcktWZ0NkVGtuM3I3aGhTd2JRRlJDU0ROWWxFaVBDQlRz?=
 =?big5?B?Y2tCWTE4N3AzK1hHWmhMa2dhTkdZODh2bVpLK0hHTEptVDJNZnRZR0cwM1ZjZ0E1?=
 =?big5?B?M1IrLzFaUGJqbG0rOWdMaVNzQmFrTGFUR2YrdVhwcUEyT3JWRDdpbVdQdXRlQjFM?=
 =?big5?B?TzBEOEg5a1dCaVQwL2ZEZlVRRDdhQng4RU9aR3JXNk9EZTBTWlVPaXgweHArZkVT?=
 =?big5?B?bmo2VXpvK3IxVnQwWmh6Rlc4SXJEbVl4S0s4RElETUlMUmZWcG1LMWIybUVGV1Ez?=
 =?big5?B?S3R0c2xqdVh4N2JyS3psLzJ5NjZid3kydE5NZWwxUGQvcUc2OGdDUXFza2VkUi9G?=
 =?big5?B?UDFLZHBHdWhNcWI0Z0NjUVdKb0E0a1RTYmc0ZGZJT25XTkN1K3BHaHVLSEVPRW1V?=
 =?big5?Q?FAsryANEKnM/mpJF+aO76y8/bH2ti1yCk+ekmJdFN5Tr8t4H?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR06MB5707.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?big5?B?N21WMGNpZUZuS0xhYndaUFlvZTYwL2lrZ1FUR1dIOWJFQS9aeW1hQmxQSTVGSHdt?=
 =?big5?B?N2xhNm1SbTJDTkZRWDFpZlhTdGRwcTc4Q3o1RDFobjVKMWppZmhMeUlyVEgxNU9o?=
 =?big5?B?eWpnVFVqZnhEUmppSE53ZDVuNUpWdzNGS1BRWVcwL1pNeDcxZWVLVDVYQkNXblF1?=
 =?big5?B?WXhpMHh6c2RveGtURjRaWEdsMHVhRWVJNUJ1VlRlbEh2R3hEd20wZnBjT1VNWm5U?=
 =?big5?B?eEEvL3NSNWlUYVhqUzlGcW5SQ0dnMGJVbEpkQW1LUWZ4UG90ZC84MEJnTXZockl0?=
 =?big5?B?UWQyWXlEVnBUdXo2YjgvNktiUHZvRFdnaGNYSFZybjFNQXlqRU5pQm1FblZZVGUr?=
 =?big5?B?dFVRRUJSKzlla01TZ3UvNTgrRXVTaUlzQnZxRWhZL1VPMGh3b1pHR3lTOEh5QmFm?=
 =?big5?B?WHB4TjRwRUc0QjlvNGF2RFRqT0hHdmtVakNUemtVRHQzZktMQi92YjA0VUduSlFW?=
 =?big5?B?QlNHVkNEWEtRWXA5SHBwWDFRVXJ4ek5YSE1EdzdSOTlhcFByRjhLWHpvYk1mSTFT?=
 =?big5?B?UFVKc3JaOGFVRTNxMmhoQ2pUVTdRWU5BN29jSDFiUHFnMUdmVVB5SEsza1E2YVRD?=
 =?big5?B?RlA2N3BNU2xlTkdOTC9xRmtacjFLOHpjQ2VjUW5lNHkrcWVhOXNJcEpIS2Q2SXNo?=
 =?big5?B?bkhuN3FFWmNWRkY2VkNlNXZnWHRnUG5qVU9uVzYyNTVmaTR0a09HblNYcXQvOUVQ?=
 =?big5?B?Yll0NmFrWitYVDlYZ2NXWU1vdE5JaFcvdjZ6K3ZNZ0dxT040UkhpUUx5ZjUzbXpX?=
 =?big5?B?WExtRDkyZVdGcEtoVWdKLytyNnN1QU1ta2NqeGFDMVpBN1FpeFNPVmg4ZlhRcEd0?=
 =?big5?B?RXdLd1g2SzVpMWhEelNQdW05S3g1SkxsYmZmaFRDbTVvai9mRjUxUXJIdXJvRDkx?=
 =?big5?B?MzA2MGR2d0xYZXhkcFUwOUM3UnZnR0tBSytlU0ZiTmI2c3BUMEgzOGZQS3FZVUU4?=
 =?big5?B?K0pEbzVLTmN0OTNCY1ZRRWtrMVNCd1BEb1VFNUdqbVc3bVh4QklQL1NmdmpmRVcr?=
 =?big5?B?Q3cxQkJCMTZ3NGpTNXZyOTFlQTREczV1Q0NBcGNoelc5eG00NmZhdGlWM2RrSkdm?=
 =?big5?B?aEJZYy9xcW1pandHNHFadUFiTEFZRE1Tc0lhY1dqQ3crcWljWUZUaWZLVksyWkd3?=
 =?big5?B?TVpJYlRNdWRkVXRIR0JCeTQ5TUVIQkVSazRXV2NFMnJ1cXlrYlBwbVNEVWxacmJ2?=
 =?big5?B?djdkZXNFZHhaSEJiWm9zZ1pJdEoxRjhXdkVMVWdLK2FkQlpBVkpwYWFscHlwZ0VK?=
 =?big5?B?VE9RNFliS3RpZ3lxNW1vNHg0b2VjeFd0bHM0MFFnNzVJVElPb3JNK0RlRFFzcEg4?=
 =?big5?B?V1RCY3lhOXVEb25BRHRlQkJ5VndxU3BGK1pJdzBFRExLVk8zdWFuVjR1WjRTQlpa?=
 =?big5?B?c2Qzd29pT2tPQk1uZXI0SFRIR2gxZUJpSXBjandUVTBjcHNrYnhoOVVrWTF4cWNS?=
 =?big5?B?WjlLaGVGQXFpb3Q5bmFKMXdoalFmQnRQSTFWV0htRlVzTmRDTElLSFZYWlYyZW41?=
 =?big5?B?UmVDQ2tCYW5vSVB4TlB6RmVsc0FBOEF2N3hYM1ErVTBqZEwwTFMzQytRSS9OQWZa?=
 =?big5?B?QlNVbkRDZ1NFVWd4VXQwYWZvYWlJNjRBcUdSRXpGU2IrZ1RwYzZ3dVpTb1R6eHhi?=
 =?big5?B?WXFvbDA0b1FWU0RYZWdFak9tMngxYzAway9pSFlJTXhuUW84TlN0TFFIdm1ybnNZ?=
 =?big5?B?aFNDNWFtVUh0VlNwbEdQYm5JQ1NBZ0l1NktIbUpLMW5sZ3RtOEp0S1FteE9iSjJX?=
 =?big5?B?eEtldjNobEFpSHROc3NoNmMxMUZiWjhENTNrcTExazZ2anRxSHJwWG5yM1FiaTJG?=
 =?big5?B?RDFVV2Erb0hIaFIrMkxQamxYUTFmVFY2WmVqMHFtdzIzcjZWcnRFS2lFeUEzUmVZ?=
 =?big5?B?MkorbDgvQkZBUCt3MWhQZGU2VHVQNUlRVEhHdW03R1FYdXVXSjhWQlVnaGZMUlFz?=
 =?big5?B?ZzZKS1QrOFNMbFB6RngxY2pNUUZHM1F2cWwzZWREVCtrYmU0ek9talhSZ2tDMm9S?=
 =?big5?Q?zIyWwNe8QW4SXYZl?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5707.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30bab0ee-6b6d-48bd-ea17-08dcf95149d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2024 02:11:10.5249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2HEC9T64OOLsyiNKKqo+Z+liBYjYaJWRjXOSJN4G7z35+4xGYked7ZuFD7ik2u70iKlTh0gh/rlWj3zI5XO4UQUqtRrhz0C6i5OuoSMOHE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7172
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 02:11:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206566

SGkgQWxleCwKCk9uIFdlZCwgMzAgT2N0IDIwMjQgYXQgMjE6MDEsIEFsZXhhbmRlciBLYW5hdmlu
IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnCj4gVGhlc2UgdHdvIHBhdGNoZXMgaGF2ZSBtZXJn
ZWQsIGFuZCB1bmZvcnR1bmF0ZWx5IHRoZXJlIGFyZSBub3cKPiBmYWlsdXJlcyBvbiB0aGUgYXV0
b2J1aWxkZXI6Cj4gaHR0cHM6Ly92YWxreXJpZS55b2N0b3Byb2plY3Qub3JnLyMvYnVpbGRlcnMv
MzUvYnVpbGRzLzM0Ni9zdGVwcy8xNC9sb2dzL3N0ZGlvCj4gaHR0cHM6Ly92YWxreXJpZS55b2N0
b3Byb2plY3Qub3JnLyMvYnVpbGRlcnMvNTQvYnVpbGRzLzMyNS9zdGVwcy8xNC9sb2dzL3N0ZGlv
CgpJdCdzIHN0cmFuZ2UgdGhhdCB0aGlzIGxpbmUgb2YgY29kZSBmYWlscyB0byBleGVjdXRlLiBJ
dCB3b3JrcyBmaW5lIG9uIG15IGJ1aWxkIG1hY2hpbmUuIElzIHRoZXJlIGEgd2F5IHRvIGZpbmQg
b3V0IHdoaWNoIHZlcnNpb24gb2YgcGFydGVkIGlzIGJlaW5nIHVzZWQgb24gdGhlIGF1dG9idWls
ZGVyPwoKICBGaWxlICIvc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvb2Utc2VsZnRlc3QtZGVi
aWFuL2J1aWxkL21ldGEvbGliL29lcWEvc2VsZnRlc3QvY2FzZXMvd2ljLnB5IiwgbGluZSA4Nzcs
IGluIHRlc3Rfd2ljX3NlY3Rvcl9zaXplCiAgICByZXMgPSBydW5DbWQoImV4cG9ydCBQQVJURURf
U0VDVE9SX1NJWkU9JWQ7IHBhcnRlZCAtbSAlcyB1bml0IGIgcCAyPi9kZXYvbnVsbCIgJSAod2lj
X3NlY3Rvcl9zaXplLCBpbWFnZXNbMF0pKQogIEZpbGUgIi9zcnYvcG9reWJ1aWxkL3lvY3RvLXdv
cmtlci9vZS1zZWxmdGVzdC1kZWJpYW4vYnVpbGQvbWV0YS9saWIvb2VxYS91dGlscy9jb21tYW5k
cy5weSIsIGxpbmUgMjEyLCBpbiBydW5DbWQKICAgIHJhaXNlIEFzc2VydGlvbkVycm9yKCJDb21t
YW5kICclcycgcmV0dXJuZWQgbm9uLXplcm8gZXhpdCBzdGF0dXMgJWQ6XG4lcyIgJSAoY29tbWFu
ZCwgcmVzdWx0LnN0YXR1cywgZXhjX291dHB1dCkpCkFzc2VydGlvbkVycm9yOiBDb21tYW5kICdl
eHBvcnQgUEFSVEVEX1NFQ1RPUl9TSVpFPTQwOTY7IHBhcnRlZCAtbSAvc3J2L3Bva3lidWlsZC95
b2N0by13b3JrZXIvb2Utc2VsZnRlc3QtZGViaWFuL2J1aWxkL2J1aWxkLXN0LTM1Mzc5NTgvd2lj
LXRtcC90bXByNnZydzExaS0yMDI0MTAzMDEzMzEtc2RhLmRpcmVjdCB1bml0IGIgcCAyPi9kZXYv
bnVsbCcgcmV0dXJuZWQgbm9uLXplcm8gZXhpdCBzdGF0dXMgMTI3OgoKVGhhbmtzLApWaW5jZQo=

