Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF37C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 13:54:25 +0000 (UTC)
Received: from ZRZP278CU001.outbound.protection.outlook.com (ZRZP278CU001.outbound.protection.outlook.com [40.107.167.22])
 by mx.groups.io with SMTP id smtpd.web10.8286.1740583409321179483
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 07:23:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=UBFGyRzK;
 spf=pass (domain: skidata.com, ip: 40.107.167.22, mailfrom: benjamin.bara@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJp8ADwIaHDj6oOo2GknIzBLfh1ziyjEWO+ol4qEbm+KQTFKYxM9n7QS/RsYWh1Ni2ycg2h0nCPGVvcBQrUFd6Z2uG1GPPf7zRROZDtSfwXey25UnaWm4HpI/NYC6GuDezzpIaCCOvqpYxRe21IXlZOj7xynO6WhWXVCppVF3Ph7plGfelGiJ0ql24E/JoBh1hp8/tJ4lsKf11Kb0nKyuRO7/p2sYPntxDpowN/63TxUHSHjO2K7gWNOmiyKlLsNrecUQKigyF/jTgoDnYxsumEueYhnmWb0/NEBsR8VprsvmKjALpqzm0D5IWqjw4MDVJbVhs5Bm8T5Y58NUJNBHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4/nEcrgchaKAU1kAAm69BszNDKOAU6ozWMSvclV4CA=;
 b=J9LoVjD5KHRlLD9apSg1trgem33DEa54rBlNeXpsj/IvJUrAb8UTogfDPtPv4SVOHjnKqX2+DbcUWEsivB+NQpo4Tw33sB9ntcfGy9bpka6tfLniR9LKw2qfi+2nFrx3Nj8+ckjendbR3Yj9nsjMtpMgzG6HigS2xopPlTwiwQnhXNVp3vy5rUcV3huTLk1cArYU4UZBm7MP963J1AKW4f3ZOQgmHG8rXtsG6MUqfxd71V9t9c6uWwkXXEyW89OsHa5EXg/yuaeIWZCpKE838+/vvYc2VguEijVxai3LF3BJmd8g0kZlqwZzi5uvO8Xk9n+yu1eMBcMvABDCG5OJMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4/nEcrgchaKAU1kAAm69BszNDKOAU6ozWMSvclV4CA=;
 b=UBFGyRzKdmAxNeOve+vGj8Xucu6zwGWXo61N5L99iZwIEzgaewPo7gAb9HrhyGuYtcAFEWWBn0Y6tzJVTi1Np7Oi9BF45cCel5NCaLFVHivuaR69Cqf+kdZwIDCdj1nDaOImKotHtZ8FgtSECILF/M8PEQ2CtH3qepmGEbPZl67FjF5sZxaCnXWKEJ1V73KaX8ZYg9jat+OEoFBoSJtp/RnLpFv+aRn9uSE2nd5Rk/V7dN47AsETUxmIYIvT/IJ3Q+Rgop1yfgdw75RtswtqUgJP38siDTplXi0N6sv5rMIz7CXY6uR57a4CUZu02SE3fq3E6j+yT5sdR2x6JNNRgQ==
Received: from ZRAP278MB0029.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:13::9) by
 ZR1P278MB1706.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:a7::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.18; Wed, 26 Feb 2025 15:23:26 +0000
Received: from ZRAP278MB0029.CHEP278.PROD.OUTLOOK.COM
 ([fe80::b991:5329:d9e1:b08e]) by ZRAP278MB0029.CHEP278.PROD.OUTLOOK.COM
 ([fe80::b991:5329:d9e1:b08e%6]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 15:23:26 +0000
From: Benjamin Bara - SKIDATA <benjamin.bara@skidata.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"bbara93@gmail.com" <bbara93@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/4] glibc-package: move ldconfig to ML-specific file
Thread-Topic: [OE-core] [PATCH 3/4] glibc-package: move ldconfig to
 ML-specific file
Thread-Index: AQHbYZ0XdGN/LiKtgkiLSfpB9vDOCrMR7fiAgEgTj4A=
Date: Wed, 26 Feb 2025 15:23:25 +0000
Message-ID: <01b0eaa4fdceccc62c1025f890283b5210588fad.camel@skidata.com>
References: <20250108071513.2807528-1-bbara93@gmail.com>
		 <20250108071513.2807528-3-bbara93@gmail.com>
	 <d957f54f2f53d16750159f2f914a6139cf5f5ceb.camel@linuxfoundation.org>
In-Reply-To: 
 <d957f54f2f53d16750159f2f914a6139cf5f5ceb.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZRAP278MB0029:EE_|ZR1P278MB1706:EE_
x-ms-office365-filtering-correlation-id: 47c51c7b-c214-40f4-6f49-08dd567983dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UFFGRlFYQndvN1lreGxCUWRQMFlSQi9TVjRMVGxxUzZDNklDZkU5N0FwbFh4?=
 =?utf-8?B?aWc4b3hLRGdxcWlTd1ljOVRNUGRKcVVQZHY4YlgrcU5LVUJTbkdXRitLdlFU?=
 =?utf-8?B?S3BtSEJRWWtrTmRJNEJZQXd4UjdQenBKWDJpSlpac0lvMW1BN3NRR280TnZN?=
 =?utf-8?B?eGhQSXBNLzNLcGwzQWtXbzFITnp3a2o5YU1GZWtsY3RWekNSYnNlSHZncGNJ?=
 =?utf-8?B?dXNOS0xnTlFjQ1dnRkREZXRsZlAxZXVWcUFwUXhTWFF3bkxjWC9ITE9UUC91?=
 =?utf-8?B?a3VQbUlOMXg1QVJ1YndRZ3hUL2RGTk9IOXk5Y2xNVGhZT1BqRXRBZTBZNDJr?=
 =?utf-8?B?RjBnNkg1djlwb05FelVsbmlDMFhaYXJLRWUzUjZCZGlqMWppMTRuVzJ6eU80?=
 =?utf-8?B?UGVhUTR4NWRRZVo3WUpiRlcxby9QVFZpekhzNHh3bVhMTFpiMUNoVHlFTlRK?=
 =?utf-8?B?VmsvWmw3UDY5aUErdHpSanl4WGtsVE9LTmJ5S1RqV2dXU1k4UzQ1NGg3aEZ5?=
 =?utf-8?B?MnJNTlF6cWdocEZSRlZFdjNBenhQTmpVY09TUU5UdFVuUkU1OHgxK3lSMkt6?=
 =?utf-8?B?OGcrRzdiL25QS2xvbmxBV2tLamQvTGFrRjFqVlB3dExBcS9pb09hTFhPLzhS?=
 =?utf-8?B?VnVzYmhzVnhiMVozUm1SRk5YZVlWemQ0QVhhLzNXRmZYSXQ4UVpwVmpQUzU5?=
 =?utf-8?B?N1c3YmtsakZMYWhzU1RTbXRRZTg4enhtd1MxQnV4SEFwNHlKZlZNaTJBMnhE?=
 =?utf-8?B?UkhsVmMydmc5aEpJWGRERExycXBLL0VhczZaOUhFNGRGYnAvZC9VSTg3L2hz?=
 =?utf-8?B?bFBaM3g1N3liNVdTVFpQUjYzMjBDdGo4TUZaT04zOCs2cWlMS1NvT1BtQm9J?=
 =?utf-8?B?T1ptbFJvU3QyWGlZWUVIZmovcE5WYkt4M2JXdXVmMTVleEhhTDBnMEVpcWYv?=
 =?utf-8?B?MjBzbTRaNHBIWk1IRURHSVZaRFc4WlVhMDJKdlgyWlBuSDhuckFFdjBQbnRN?=
 =?utf-8?B?NTRpTkU3d1NhbjNEQ3MvWnVKSnh5SUpGeDQyWGxzRVhXdXNnRDJrck1qZHNq?=
 =?utf-8?B?SDN5cXdmOXhzdWJoSEhyZUZDTCtxQ2w0Z1E3OWlMYUNsN3hUSzlnVlRaOGMr?=
 =?utf-8?B?Tk9qVmtHU243MXkzNTh6S2xKZldOWHpiNGp6dGZXdTdiZTBtbDJHNG1MT25n?=
 =?utf-8?B?ajBFbUpGR2ppQnppcHg2RmZIU0ttTDQ4clAvYTlvdGV0N3VEVEVLa0VDS3Jn?=
 =?utf-8?B?U2o4aldpdzVWbWo0TFNLamZyaWVLU2hYRUxpOVVpS1lhS3BIRFh4MDU3cTU2?=
 =?utf-8?B?TkIvK2I3SnhpU0RIRTZlL2pPZE4zYUxXWkM4VE5wTkJTdkZYcGhqd0pON3J5?=
 =?utf-8?B?Y0g2eG5aRTkyb3ZOSW80V3I2Y2ZucHpNMlpmNC9pUlVxZk9peENSb2Q1eHFV?=
 =?utf-8?B?QXU4NFhnb0UxTFpyVHNIMVQrazRzb1ZYdlpjRGhodFBqWFVsWHgyYk1Fak9r?=
 =?utf-8?B?NnhYSVN2MFVETEhFZjNGVmhGRGRIQitTN0RSNjFFVjk0Z0VBZlJlcjBvaHFs?=
 =?utf-8?B?OXgvemdKWGtUMWFNZzEybG93TzAvNERxeUlpcS8wUFdSdlZOQkc5VEloUWJz?=
 =?utf-8?B?WXBBei96SXBUMnp5RU9rZXg0dEU4NXFGODVPcjRoaXYwb3Z3T21hSDRuRC9C?=
 =?utf-8?B?U1ZyNWdXKyt6ZlVmT1BoWkwvOW40dFN2ZkZTYW9SRlV2dmMyOWk1MnloVGhP?=
 =?utf-8?B?NHNnZEdSMUJGaE41VDBlNDdaaFF1bGh0bVlobTUyZHZNQURlVGllMUlicjZv?=
 =?utf-8?B?WlFvbFBQVVQyM2x1WVpYYWp3VmVPMHZXV1ZWMlBVMUpMcTYraTlkS2MrQURQ?=
 =?utf-8?B?L2dEa205ZW9aNXc1Z09QdnllQzU2ZUsrOWVnNmsxUFY4eGp1Q3pCeWpaazFH?=
 =?utf-8?Q?AZ08pCznCvGL/OGminfquu6CEJ5/eB/3?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0029.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MUFDaWxBQ2g4RTlEQU9VdUswVWFKQlh0QVlyeDE1c1ZJM1FybHZvaUY2VUVj?=
 =?utf-8?B?dm83WTBlYTNoN2JqWVpoT09HZ0VhdHNFc2szbk9ucUp3ZXZNMnFJMjd6SWZm?=
 =?utf-8?B?ekEwR0pBK2ZDL3pGc0JOQmNwRFBna0R0UkhNUmk4dzRZeGtGbU1iWTVMV3c2?=
 =?utf-8?B?OGVSZEY0dkxRT3A1WUVqT2lLYmZWMFczQkZrM3pPeElUMSsvRUI5bk5SL1hq?=
 =?utf-8?B?NUk5NDZheDF4dHpxUkcvS1lVTDk0TnJMK2pGMEUzZmQ1dWpFQllJRHVUa3pL?=
 =?utf-8?B?Vmt1L0lLSXFIVTgwMkdRQ0FVM2o0YWpmZERJc3ZDWjJRZm02NWp0and4Q0Qz?=
 =?utf-8?B?M0RHTCtPYm9hTXRSUkh5bHd5QkhlQ0NSZXE5YXcwdUVDMjB1YUR0TjM0bmNx?=
 =?utf-8?B?ckpHRTFzUVhucThQSjhBMDBheUdpYUdScWkrdEJ3UUgyNXRrVFAzY0RhTUky?=
 =?utf-8?B?N0RzOVhUUmVwbTRDY1R2eWZFdEhEREk4Z0g2QW02dU5OU1UweFZEcXpaYzN2?=
 =?utf-8?B?UnVRRWVnOE9uS0JOcUFrUHlqenp1RGF2bUthR1BVN0t5dktiMkdOdXBaSG1G?=
 =?utf-8?B?anVyVXdZWm4xbjYwYXg2WTNmOUt6dEhMTUtSdE5qa3ZqL2FFSnBoS2NQTk1B?=
 =?utf-8?B?aXB6SzZ6RURKMVNLdExaSHl5b0FoSlZmRkh4QmRmdkdndlVTZnVEMXhCTTNT?=
 =?utf-8?B?WFFpYmNYRXJVVGlwUnE4RmtQNlYwMUFPLzRMYUliZTVQUXNlVFA5WkZadjVS?=
 =?utf-8?B?OW1xOU5CL0RiRXlvd3JvaGprNnhRTktMZG1RRThHdXlhYzBka2g4VVRiUmsy?=
 =?utf-8?B?VWhKNnY5Ry9ySk9xbmd0YUNUd2NNUkluV2tTVStkdkZETngweVNsY3hzMTM4?=
 =?utf-8?B?WndhMm45UTR2cy9YMU1pSkkzV0VGb0RvSjRtcytPWXdxYnIwZXViUDNJdXNR?=
 =?utf-8?B?Sm96QkZ3bi9WazdzZ2J2N0VRdzRkcG1FWWZ5Q0hkUThIUm9ucEpET0lzQVZQ?=
 =?utf-8?B?VEJaWGdZeXpEcXNrWk1aWDA4TERKbk5HV3ZzdnlHeTJhRjRURW9PTDB3NVhr?=
 =?utf-8?B?K1VPWElLR0x3aTRrVnpLYzd0RmJNbGxtb1N2WkJyM255YmRpWjF2aHdUaTNE?=
 =?utf-8?B?Y1pSRXNhcXhkdXZoaWNuM2ZyRFFXYjMyZGYxN0RrNEoyQmQ1ZWtTMko2cU91?=
 =?utf-8?B?L0RGczhsaC9Ta002Y1c5ZmdpZ2wwZENCWHhPczZsV2FoaDhyTHlLbjhpQ1p5?=
 =?utf-8?B?dTV4ZGhneDlvajZVdjF1QXpBR2NENktPTkR4TXVuR3F6SW92ZW82Qk11emY1?=
 =?utf-8?B?a01pTkJDeS9XQURCL05QQVEzRGk1dUdJZktsM0pQMWQxd2tGT3ByTHNya1Ax?=
 =?utf-8?B?T2M5b3RtUkVPaEJPai8wZ0ZCNVpIeit6VmRKUlhPTWN2VzROaTFwQXQrSURH?=
 =?utf-8?B?WFQwdFBCbllROElZcjBjSFZmbXNZeXVua3pxSkcrWCtaZWlaN1d2VVBMYlhR?=
 =?utf-8?B?WHpDNDkvaVpUSmVjcWx6TUdLdWtPa0EvQWRJd2NpRHVsaFRUTUtKcWNHWGMv?=
 =?utf-8?B?NVM4OFZjd1UxWkdIM040N2hsaDM3cFBSSGJlU0xtTTl2ZVZkUkVFRDRERmdX?=
 =?utf-8?B?MUxHQmdLWU12SGFsTmoyQ0dsL25ETlF4c3lDNWJRUkc1by9pTGVoQnloS1l1?=
 =?utf-8?B?djJ3YjlLR1hreWkrWmJYZEJMYjlZMml5bGNRWkU4NUNYbUkyaVhoYkUzYTJC?=
 =?utf-8?B?eHUwYkgyMHpKOTdreVMrcXZlSjYrelRkNlRZTXVPWFNsdjdCSWFlUlBBQlZD?=
 =?utf-8?B?cWVkYzFDNUljaTZ3bmcxM3FxSVhGcW16LzBUOVJ2L05JRStIbnMzR2hyL09E?=
 =?utf-8?B?RWNudDRUTzZJMEtKRTBIVEx4QVU3MFIzMXNlWjc1T3VlcFVyVGp6RDdESW9N?=
 =?utf-8?B?TithQUViaE93ZjFVZTNxcnp3RHFhKy95U2RWU2VXeXpXQm0zTEplelVmQ05N?=
 =?utf-8?B?RWZhT3N0bDRhUXlOUG0vRXVXM1NYcHUrZVJPU0ViMlZwWlRpVmhTUkVhTUNl?=
 =?utf-8?B?VVIrMmhEa1FZTTRnV0pVMWJIWGpQNVl3RkEzM2swQnBGMlc2MjlyVkFpb21M?=
 =?utf-8?B?UUQ3Q2VmL21aRjE1ZG00WGlQU2RZOXFjbHZLL1RYTmpjMWJjdUE3WmZ2R2lI?=
 =?utf-8?B?SEE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0029.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c51c7b-c214-40f4-6f49-08dd567983dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 15:23:25.9312
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3aJyysjRetGY7vNrwa2DvGrcmp+7a2wl/6YWXOW12g2WWjGHSRfZ6t+2WMb7t6UOUc0Cw3jz8WcYWKdfqyfFB0k7Waap1yt9PRIV99gkCXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1706
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B467DD205339447B81165330A7F10D5@CHEP278.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 13:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212284

SGkgUmljaGFyZCENCg0KVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrIGFuZCBzb3JyeSBmb3IgdGhl
IGxhdGUgcmVzcG9uc2UuDQoNCk9uIFNhdCwgMjAyNS0wMS0xMSBhdCAxODo0MiArMDAwMCwgUmlj
aGFyZCBQdXJkaWUgd3JvdGU6DQo+IE9uIFdlZCwgMjAyNS0wMS0wOCBhdCAwODoxNSArMDEwMCwg
QmVuamFtaW4gQmFyYSB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBG
cm9tOiBCZW5qYW1pbiBCYXJhIDxiZW5qYW1pbi5iYXJhQHNraWRhdGEuY29tPg0KPiA+IA0KPiA+
IE90aGVyd2lzZSwgaW5zdGFsbGluZyBsZGNvbmZpZyB2aWEgbXVsdGlsaWIgcmVzdWx0cyBpbiBv
dmVyd3JpdGluZy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBCYXJhIDxiZW5q
YW1pbi5iYXJhQHNraWRhdGEuY29tPg0KPiA+IC0tLQ0KPiA+IMKgbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYmMvZ2xpYmMtcGFja2FnZS5pbmMgfCAzICsrLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtY29yZS9nbGliYy9nbGliYy1wYWNrYWdlLmluYw0KPiA+IGIvbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYmMvZ2xpYmMtcGFja2FnZS5pbmMNCj4gPiBpbmRleCBhZDM0Yjg3OTI5Li4xZTdm
Mzc1M2MyIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjLXBh
Y2thZ2UuaW5jDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmMtcGFja2Fn
ZS5pbmMNCj4gPiBAQCAtMjgsNyArMjgsNyBAQCBJTlNBTkVfU0tJUDoke01MUFJFRklYfWxkc286
YXBwZW5kID0gIiBkZXYtc28NCj4gPiBsaWJkaXIiDQo+ID4gwqBGSUxFUzoke1BOfSA9ICIke2xp
YmNfYmFzZWxpYnN9ICR7bGliZXhlY2Rpcn0vKg0KPiA+ICR7c3lzY29uZmRpcn0vbGQuc28uY29u
ZiINCj4gPiDCoENPTkZGSUxFUzoke1BOfSA9ICIke3N5c2NvbmZkaXJ9L2xkLnNvLmNvbmYiDQo+
ID4gwqBSUkVDT01NRU5EUzoke1BOfSA9ICIke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZF
QVRVUkVTJywNCj4gPiAnbGRjb25maWcnLCAnJHtNTFBSRUZJWH1sZGNvbmZpZycsICcnLCBkKX0i
DQo+ID4gLUZJTEVTOmxkY29uZmlnID0gIiR7YmFzZV9zYmluZGlyfS9sZGNvbmZpZyINCj4gPiAr
RklMRVM6bGRjb25maWcgPSAiJHtiYXNlX3NiaW5kaXJ9LyR7TUxQUkVGSVh9bGRjb25maWciDQo+
ID4gwqBGSUxFUzpsZGQgPSAiJHtiaW5kaXJ9L2xkZCINCj4gPiDCoEZJTEVTOmxkc28gPSAiJHti
aW5kaXJ9LyR7TUxQUkVGSVh9bGQuc28iDQo+ID4gwqBGSUxFUzpsaWJtZW11c2FnZSA9ICIke2Jh
c2VfbGliZGlyfS9saWJtZW11c2FnZS5zbyINCj4gPiBAQCAtMTIzLDYgKzEyMyw3IEBAIGRvX2lu
c3RhbGwoKSB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoCBsbiAtcnMgJHtEfSR7YmFzZV9saWJkaXJ9
L2xpYnJ0LnNvLjENCj4gPiAke0R9JHtsaWJkaXJ9L2xpYnJ0LnNvDQo+ID4gwqDCoMKgwqDCoMKg
wqDCoCBpZiBbIC1uICIke01MUFJFRklYfSIgXTsgdGhlbg0KPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIG12ICR7RH0ke2JpbmRpcn0vbGQuc28NCj4gPiAke0R9JHtiaW5kaXJ9
LyR7TUxQUkVGSVh9bGQuc28NCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG12
ICR7RH0ke2Jhc2Vfc2JpbmRpcn0vbGRjb25maWcNCj4gPiAke0R9JHtiYXNlX3NiaW5kaXJ9LyR7
TUxQUkVGSVh9bGRjb25maWcNCj4gPiDCoMKgwqDCoMKgwqDCoMKgIGZpDQo+ID4gwqB9DQo+IA0K
PiBJJ20gYSBiaXQgcHV6emxlZCBieSB3aGF0IHdvdWxkIHVzZSB0aGlzIGluIHJlYWwgd29ybGQg
dXNlLiBEbyB5b3UNCj4gaGF2ZSBzeXN0ZW1zIHdoZXJlIHlvdSBoYXZlIHR3byBkaWZmZXJlbnQg
bGQgY2FjaGVzP8KgDQoNCkkgaGF2ZW4ndC4gTXkgcHJvYmxlbSBpcyB0aGF0IGxpYjMyLWxkY29u
ZmlnIGlzIHB1bGxlZCBpbiBhcyBhIHJ1bnRpbWUNCmRlcGVuZGVuY3kgKEkgdGhpbmsgYnkgZHBr
ZzsgaXQgaXNuJ3QgdmlzaWJsZSBpbiB0aGUgdGFzay1kZXBlbmRzLmRvdA0KYnV0IGR1cmluZyBt
eSB0ZXN0cyBJIGp1c3QgYWRkZWQgbGliMzItZ2xpYmMgc28gdGhlIHBvc3NpYmlsaXRpZXMgd2hl
cmUNCml0IGNvdWxkIGNvbWUgZnJvbSBhcmUgcXVpdGUgbGltaXRlZCkuIFRoaXMgbGVhZHMgdG8g
YSBjbGFzaCBkdXJpbmcNCmRwa2cgaW5zdGFsbGF0aW9uLCBiZWNhdXNlIHRoZXJlIGFyZSB0d28g
L3Vzci9iaW4vbGRjb25maWdzIHRvIGluc3RhbGwuDQoNClVuZm9ydHVuYXRlbHksIEkgYW0gbm90
IHN1cmUgaG93IHRvIGRlYWwgd2l0aCB0aGlzIHNpdHVhdGlvbg0KImNvcnJlY3RseSIuIEluIGZh
Y3QsIEkgdGhpbmsgd2hhdCBJIHdhbnQgdG8gaGF2ZSBpcyBhIHNpbmdsZSBOT04tTUwNCmxkY29u
ZmlnIGJpbmFyeSB3aGljaCBhbHNvIGNvbnNpZGVycyB0aGUgTUwgcGF0aHMuIGxkY29uZmlnLW5h
dGl2ZSBpcw0KZG9pbmcgc29tZXRoaW5nIHNpbWlsYXIgd2l0aCBoYXJkY29kZWQgcGF0aHNbMV0s
IGFuZCBJIHRoaW5rIHNvbWV0aGluZw0KbGlrZSB0aGF0IG1pZ2h0IGFsc28gYmUgbmVlZGVkIGZv
ciBhIGNvcnJlY3RseSB3b3JraW5nDQoke01MUFJFRklYfWxkY29uZmlnLiBCdXQgcHJvYmFibHkg
SSBhbSB3cm9uZyAtIEkgYW0gcXVpdGUgaW5leHBlcmllbmNlZA0Kd2hlbiBpdCBjb21lcyB0byBt
dWx0aWxpYiBlbnZpcm9ubWVudHMgb3IgbGQuc28gYW5kIGl0cyBjYWNoaW5nLi4uDQoNCj4gQ2Fu
IG91ciBwb3N0aW5zdCBjb2RlIGNhbGwgdGhlIHJpZ2h0IHByZWZpeGVkIGxkY29uZmlnIGJpbmFy
aWVzPw0KDQpJdCBqdXN0IGNhbGxzIHRoZSBOT04tTUwgbGRjb25maWcgb25lLCB3aGljaCBkb2Vz
bid0IGNvbnNpZGVyIHRoZSBNTA0KbGlicmFyaWVzLiBIb3dldmVyLCB3aGVuIGNhbGxpbmcgdGhl
IG90aGVyLCB0aGUgbm9uLU1MIGxpYnJhcmllcyBhcmUNCnJlbW92ZWQgLSBzbyBub3QgcmVhbGx5
IGFuIGlkZWFsIHNpdHVhdGlvbi4NCg0KVGhhbmtzICYga2luZCByZWdhcmRzDQpCZW5qYW1pbg0K
DQpbMV0NCmh0dHBzOi8vZ2l0Lm9wZW5lbWJlZGRlZC5vcmcvb3BlbmVtYmVkZGVkLWNvcmUvdHJl
ZS9tZXRhL3JlY2lwZXMtY29yZS9nbGliYy9sZGNvbmZpZy1uYXRpdmUtMi4xMi4xL2xkY29uZmln
LWRlZmF1bHQtdG8tYWxsLW11bHRpbGliLWRpcnMucGF0Y2g/aD15b2N0by01LjAuNw0KDQo=

