Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A43C44536
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 18:50:03 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19439.1769021400336951157
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 10:50:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Oe6ytbBN;
 spf=pass (domain: siemens.com, ip: 40.107.159.11, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmD5k/a17Scja+GXd29S1dgPAEHgStxjT7L6IjNTvgPxI8yBqYOAEMiVRJEigmha00GsddzClm+49coF8WW/j+2mGJ6K7Sf0MG2XkMF2pXH9Ri9X4ruPcodpdah5gR3zp9bHfKddDm7aZvEcRUrVjEBs+1O6hiNT420PN9Uv7J24/v11OV/D4s0eZfCFnQ8SjJpyR3qKV0FWAAIhWPb6ZrFVqZsr5qWZdEIBtZS6EI2hUqsrkj/k15hzY+v8smOZ3Wrr15+jWZG5CZFIAz0TvslnrbfaBCgEAFPRB6EpqAhVqQyp+mA1HWBYbzlYFgZeB2KAJwdPw+2P6B1gspY1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xBe5NicaCLawxhZZ90501iQS4uzpG7KV3/Jur0/7oA=;
 b=GF53WRDljP7vYU29pU+DdQM7ZRi97G6bpDlPLqvlaKGI9Qcxn7NiaBJ5+h9t54aOkjcbHdURqNfeEBqzaDp00bbdH7uGEOdif2vgLfuZ+rY+1GvLaDCZSj51g84Fc3DgpEmNwtxCPBDfohTi5fgmAOSKfCKwzull+22ENB2M3b4o6z8MDbnmXERHXMwFoAC9Ib7nfbsBlG6ys3dex2d4Tr7Z4a6oMB51mF58DBOQbvD+EN4TLww4PqQqt8Mx8vmqp27te9TQFTf1Dan7urtJQ9J9TDVHolTcNi7//PirWL7s94zHZ0iqb0ruqpbu2htlmCIoFZ6o0xF28f5kEdejqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xBe5NicaCLawxhZZ90501iQS4uzpG7KV3/Jur0/7oA=;
 b=Oe6ytbBNTYqt85PIH9s1O9Vsf/ms5hcQ6511FUmq1BGaj+L72UQ1/drS9CE+cR3UkQwOcFgjsaLRsfEDPYCKyIY85DvjsTyaipH9MPmNZ9IN9VRXW6NiWPVIGni60rPhPn1f3DEpAWSwwyQNIgiKnZz8j0adkRc7yKhRyCdhLq2VS7rMrUWQVLsVbyHQGI9sXykV+8zhLl1EcsUuQBXFNJVvsSo/bGyoAP6G+/lcnl4YVwqNyBhldrBq6yYNiQsZDxwzUwumUpOrdeLC1uTGv7vagyRQNqtfD+Ypbm5287ytCSzMLakedvmkrk5ZPuKFxmIoA83B35NP9eBn712+mw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB6689.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 18:49:56 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 18:49:56 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"sjolley.yp.pm@gmail.com" <sjolley.yp.pm@gmail.com>,
	",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] Yocto Project Status 20 January 2026 (WW03)
Thread-Topic: [yocto] Yocto Project Status 20 January 2026 (WW03)
Thread-Index: AQHciiXElVwaRYrxc0SQGbVmXfyjiLVcmdmggAA6MgCAACQfcA==
Date: Wed, 21 Jan 2026 18:49:55 +0000
Message-ID: 
 <AS1PR10MB5697BA43A5DE43A7B58AB073FD96A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <CAK5yBb-P30Rk4rc9maME3=y69MTrF0NeviEY5FAQOTj-1MQ_1Q@mail.gmail.com>
	 <AS1PR10MB56974C5DBF70E373FD7B7901FD96A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <fe5405de8dfa9bc1a2ef3bfe2e425e3be63b254c.camel@linuxfoundation.org>
In-Reply-To: 
 <fe5405de8dfa9bc1a2ef3bfe2e425e3be63b254c.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=bbe54a3f-72a5-4e0f-b9f2-c3feb3248a0a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-01-21T18:46:19Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB6689:EE_
x-ms-office365-filtering-correlation-id: 529bcaaf-3862-4d91-920b-08de591ddecd
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VXZuL242R3crSEdZSnZJa3BDTlgxVW1XSnNvU0N3Q2tOSVBrWmlTZjUxejJy?=
 =?utf-8?B?emdLV2RnL2pmUFpya0ovNTFTZkl3VndPdFozQ0ROTEhybWZxbjhFUEV1Tm1u?=
 =?utf-8?B?VHNBS2xDWlV6U0tnVG9TdWF4R0pMNFlHYnFnZGUwOHkxL25Cd1VsQk1QMWNQ?=
 =?utf-8?B?WUNoZExkWTZLekdzRE00Z0diRkk3NDVBNHY5WFdXc0pKNFlvalNHcFFpRExY?=
 =?utf-8?B?VnJ2TVBjaFVnNmJSV1ZmMTF4OTR1T21RSW5DMWMxa2hPS1dCbTNjUkYrbU9i?=
 =?utf-8?B?UUxPWml4dEtDcUlQYmpYQTAzQklMcnF6T3ZZWm50SFJuMXU1QjlXdVp3dDg4?=
 =?utf-8?B?SkpvOGZGM08zdllsRG1YK0lQTWw1MHVwcXlNbXV5MmR6Z1lSa0VoeGY3eTVk?=
 =?utf-8?B?R2N0SVRDZ0EweDFUZGdjcHM4aHoxN2ltZGNyQklrYU9NK1hxb3M0dlRRWnhM?=
 =?utf-8?B?Um4yaEVDMGZRU3crdDVCaWM0dTl6WFI0L2VOWjNTYVVMamhiVDN3MjZEYmw3?=
 =?utf-8?B?V2ZiUEl6VGpoRFo2dkF6NnV3VEF0clRKVjBTWlByTERGdGhwYWpMcE43K1Nw?=
 =?utf-8?B?R2FCRWVvR3VybzN0anhsK3NDM0YxODJaQThSQzVybXRzRFhRZjcvSmRxaTYy?=
 =?utf-8?B?b1BXOWU3dlZlWmZlZzZhVTJVcjBldVJ6RE1aeExFM3B5YUwwc0pLK2M4RDRG?=
 =?utf-8?B?QzFWTTJxbjA2aEZrcC9TRTgwY25BME1sLzFwN21QaktNbmY1WUdMbXNRcHRH?=
 =?utf-8?B?dTltQS9MR3laRERjM0ZRTmkwQjJWWFFKNVBYaTU0MWN4Q2FZUzBkQ3BSS2lt?=
 =?utf-8?B?blpPcWd6U3RiZFlhRWNFa2prZ1RmeHNyM1ZKQ1FsSDZHeGo4dDJEbElMTVgw?=
 =?utf-8?B?NXRqbXNvWFIvelNuZHRZR09MZksvNDdqZUhKVFpGemZNV1JUK0xHQU1CcWw1?=
 =?utf-8?B?YnNhVnN6blhqdTc1U3JRSFhOREtncTRpaDlUUWJXeDBIRUVrejBLYzBpcGJJ?=
 =?utf-8?B?THN3eGY5R21rbis1RlRlMnBiY2ZmUHVaU0hqeERqK2lETUc2c3hnRXV1eGlS?=
 =?utf-8?B?Y0R3MlY2dFUrZk9Wc1hGTGIxSnN0RE44VlBvNDlFc212RHVHakkzN080TjNW?=
 =?utf-8?B?VlgrUlJjREJFczRCTVQvam1RK0xucHRvQW5xM3pOWlB2Wkp6cnhZOThwMXhv?=
 =?utf-8?B?amZ4R1BrSkhiTTlUKzc1ODhQNEdPNm14YW5TZi9PbGJlMEFQY3lyNHdsaFIz?=
 =?utf-8?B?blhtN2xCU3BobnZ2c1crQTZ3K25qYVlqb0FYcW1NOUZMUDUxa2tBa2pCK1ZK?=
 =?utf-8?B?QUFFamFoM0l6c09PdUJlT3FuN3BNdXF6Q0pmbnRtOER2a1FqUWdjVUpLUHRQ?=
 =?utf-8?B?Q3NUazVjVzlWa0R4MktiZlZWTVhDM3ZxQnM5NHp1U0hPSC9TUXIwc0pSL0J0?=
 =?utf-8?B?RmZsVml5dkJQNUtlUTA3dGVHbzZUTmUvUXdqVU1VdjE2VWx1OE56NXk3YVhZ?=
 =?utf-8?B?THJwUmFTZzlNTENrdTNPUXlwRGRsN0ZjKzdlRW42ZCt4b1BBQWl6eUV1VjQy?=
 =?utf-8?B?OHZCUlBocndvTVVWY0tnSU95QzJiTVNoTDN0UGM0Rk14cDhGdVhWZllPVU8x?=
 =?utf-8?B?emdwQzMrUWtwRW9qWXFkNjJLYTljaGhWcThnT1V1ekl3TFlWdXczKzM3bEc5?=
 =?utf-8?B?d25xQzkxSTBDSXhtS21XVVlFcmJjWi9rbHpqTStPU2hIQmhpQXdmYlVhcDRT?=
 =?utf-8?B?Q3ZPRjdETmh2V2pLRW4xOHFVRHFWVm1WbWo0VStia1FUdGNQTEN2WDJJZENZ?=
 =?utf-8?B?MHZraGtteHNLMzRsOUhNNlJHNkxjSE9KZ3hHc3pKWmRRS3M3RzBJU0l0dGgv?=
 =?utf-8?B?TzRqckNJOGpOVlpMMU9WVWNxR1JST0lmRHlGN1B6Zzc2bjlPckNHaHJQOVdq?=
 =?utf-8?B?aEc5RlVXeThVeTZkRndpVlZCdHpBbmVVL28vazVtME9tbW9jeExvYWJrZ2Nw?=
 =?utf-8?B?TjNxNDlXWFZmeTBPNmpWUEM0ZlRVcWFjbmM4aHBSdTZPb3R0OW14VXl5L1VS?=
 =?utf-8?B?QjR3MVlzb2kyWGdEdzhBRFR1eGFGM2RRTEtZSXlZdmF0U1FqelE3dWQ1cUxD?=
 =?utf-8?Q?Eaxr+NCuCljRQPATGDOodjATc?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MFNrL3Z4dXh0dEE5VlVRTWVBUGdDUm0zbThhaWJWWk5za1lJajZxbmJGQnJD?=
 =?utf-8?B?eFRMUU51WUpTZ1ZxS2JneFNGMC9RU0g2L0ZqSmxNUDE2R3FybHBCVUVZTHo2?=
 =?utf-8?B?eVhYSW54aVhhSHp0a0YvRks5TUNkMDAxWnJBNUhNSWxRdTNDM0RlRmxiRit0?=
 =?utf-8?B?d2lqck1oTFo3VTlybHdBNnRYUk5yZFFidjVVV0FOaUt4TGF2V29XWVRYRW1D?=
 =?utf-8?B?YmhUUFZndnFKT2pHNmlaS2ZMN3JMYkh0NmI5eS93b2xpMFhwNWdBNVQxNXlo?=
 =?utf-8?B?V0NJelkrYlBmejErcXBYTXIya0F0UnZpd1g2cS81Y0o0UFkxNUlHaGdPNld4?=
 =?utf-8?B?bGVuYVJqQ1FZemZjOUJpYVBIVndFd1RUM0J0MjJnQ1MwWDlvNlZOeGY4WjNR?=
 =?utf-8?B?ZkVra1JEVk9idXZoL2RrOGlGbllWbjhHSDlTaGZubXZ2NVF5WEtQWHIrbytk?=
 =?utf-8?B?eVhhN1RnOHNod0QzRnRacU5GajZCSWlwZ1l3NTVBMTZmUTNnc0tyMzExbTVM?=
 =?utf-8?B?c1JhTWJyMmZiY1ZpRlk0c3BNR0xqc1pnTEg4Lzl0WGZpbmNWdEhZRlpiQ1NX?=
 =?utf-8?B?RnFNaDU1ZCs1Wk5Zc2FzVGtHdkRadnptUkdWQjRHY3ozOUo5elUxdDZmMDZz?=
 =?utf-8?B?clJNZTlmV0cwR0s2b0cwMHdwV3ZKWnZyVHpKRVlYckpmbW9JNDQ1eFBxYmY0?=
 =?utf-8?B?M0tPVnB0WXA5eUo3OHVzSGNFSnZhUHdFckdWWXdQWHNweVY3UHpqQ04wVVVn?=
 =?utf-8?B?NkF6eWNYNTMzL25Gcm5PWm8ySXBJYnV2TUZwK3o1SDVlVld1NW5kbHl2WXVV?=
 =?utf-8?B?R0JHTmxUdXYzaVlFZUJwZ0tBeU92NUhlUlRwWTFNNUEyUVMvRUNoVHJDR0ZH?=
 =?utf-8?B?K1RpY3c3OXA1UGdVTThCZHhmQ0ZRRUpSaElUSTcyemJsbmFkZ3BVQ2RTL3dK?=
 =?utf-8?B?MkY5VmpGVU92UjNXdkRGdTRKMHBhOGhjQWlldGM0dTI0STIvYW5GRDBqTjlM?=
 =?utf-8?B?aEswVGtWRWY5OElOK1pmTlBTWVJTN1lKRUpIYmttTHEvZ3RqNUYwQ2xZeVJQ?=
 =?utf-8?B?cFJScE5HMEg4eEt4SmFNOURDZFJNaUxKVGF1VXVvUWVpYzBaeFowUTBML2dh?=
 =?utf-8?B?a0NlaGlSVnhyNHd5RzVHSzZxK1E2S2VrbjBpYXJ4aUdsZ1QwWnNUb1Fibm5Y?=
 =?utf-8?B?SU9FaUtZT0RMSGZnYW5Qem5xTEgyZmY1Z1pKZC9EQ3Y5Ymkrc1VJRWFYZjRT?=
 =?utf-8?B?NjRLOFJUM0FSOHpDN0lSc1ZkcWRXTm0reWJvZ2N6QWV4bWpNVVhFTWNkbWov?=
 =?utf-8?B?a0lHVi9yR2NLd3I2amhid0M3NHQ4Q0pvU1Q5MGFYbVZFbVBMWUV1OWtzTWZ1?=
 =?utf-8?B?L283eFlWWVdWdGdxTUMxdm5JM2tHb085dlphRmNyMDZsa3NUUHQzQnJkZHk4?=
 =?utf-8?B?WVhUZzFNRTV4WkF2SkV6MzRIek9EbHc0R3d1NlBIcGpYZW5BWHVhSzVud1FD?=
 =?utf-8?B?ckdGdmR4eTlBNUVjZm1YY2hkNDMyMDh0cEhkY2lKWTdhRTZHV3d4RlpvNkxo?=
 =?utf-8?B?allKbk5YUWVCNXhMNy9yV3NsY1F4bkJ2SGVpSzNHK3psTjI1aUx4bHk5emwy?=
 =?utf-8?B?eHhGU0RaUTRISGxjWCs2N2oyMDhTM1QySUtQMnJGMnJJQXR3SHg4OWIxdHNo?=
 =?utf-8?B?QXVnWTVQbmJnRGdjMGtndnFRd3c0SHJ6MFV3RTdyTENVeDNvbnNqL1FVeGJz?=
 =?utf-8?B?MHM1d0htdExDNEk3aS9kT0llQ2hxVzVWU1JxZGtEczZWdkoxUnJjUXFiL283?=
 =?utf-8?B?aTBPaiszWmhxZUZ6SFlMOWVjcFdpcUZCVHVoRVBXenpnb3dVRk9TMGNETnQz?=
 =?utf-8?B?QityN2pMaTYxNEZ3RU1RMmNvWXBnV1RpcWlPWXVuRFM4WjBoMG9XVTBTREJT?=
 =?utf-8?B?c28zY1RSOXpIbEhiQ0ZKbnJXVy9CcmVQejExSDFIaG1wY1BzNXdpcDVvdXEx?=
 =?utf-8?B?NThhUlpMQVJSMnNNYWRpdjdpd01JWEdxNHk5MExyY01jV0xNZi96WXZQUlY5?=
 =?utf-8?B?djRTUTgxSmZ0a1R1U0FuNjRFUldpOU9PaytDWUdiQnpaTFdUbUVIZVF4alB5?=
 =?utf-8?B?cjhFczZuZEN6bUFabkxzNU9EN2p2WXJMMy9CaUdWdUUrRFc1NGJkZ29xdzZZ?=
 =?utf-8?B?WXp0NHZzeWxDUzh1TlluVTRqVi9hdXVTcTFxYUNMMUs2bHNwcVR0dGNUN0I0?=
 =?utf-8?B?ZE5lYjQrcmZBOFNUM2VOemtBSHZyOFNtVUxVN3ZlazVKNXg2NVkybndiZXNE?=
 =?utf-8?B?cUxsMllzZUM2aUQzU3M1UDN5aWpveGhrT0NFOXFFMmF5SGova3JEUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 529bcaaf-3862-4d91-920b-08de591ddecd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 18:49:56.0090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S67axGRg5nQ+GPuckYRLQOU7bpsYcgjJu4xK00m4Qzf2j/SkqhML76C0oox5LT04xXzteu6tIRy22GV+JopjQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6689
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 18:50:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229821

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwg
SmFudWFyeSAyMSwgMjAyNiAxNzozNw0KPiBUbzogeW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9y
ZzsgTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpDQo+IDxQZXRlci5NYXJrb0BzaWVtZW5z
LmNvbT47IHNqb2xsZXkueXAucG1AZ21haWwuY29tOyAsb3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbeW9jdG9dIFlvY3RvIFByb2plY3QgU3RhdHVzIDIwIEph
bnVhcnkgMjAyNiAoV1cwMykNCj4gDQo+IE9uIFdlZCwgMjAyNi0wMS0yMSBhdCAxMzoxNSArMDAw
MCwgUGV0ZXIgTWFya28gdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgd3JvdGU6DQo+ID4gPiBU
cmFja2luZyBNZXRyaWNzOg0KPiA+ID4NCj4gPiA+ICoJV0REIDMwNDEgKGxhc3Qgd2VlayAzMDI2
KQ0KPiA+ID4gKGh0dHBzOi8vd2lraS55b2N0b3Byb2plY3Qub3JnL2NoYXJ0cy9jb21iby5odG1s
DQo+ID4gPiA8aHR0cHM6Ly93aWtpLnlvY3RvcHJvamVjdC5vcmcvY2hhcnRzL2NvbWJvLmh0bWw+
ICkNCj4gPiA+DQo+ID4gPiAqCU9FLUNvcmUvUG9reSBQYXRjaCBNZXRyaWNzDQo+ID4gPg0KPiA+
ID4gCSoJVG90YWwgcGF0Y2hlcyBmb3VuZDogMTA5OSAobGFzdCB3ZWVrIDEwODkpDQo+ID4gPg0K
PiA+ID4gCSoJUGF0Y2hlcyBpbiB0aGUgUGVuZGluZyBTdGF0ZTogMTUyICgxNCUpIFtsYXN0IHdl
ZWsgMTUxICgxNCUpXQ0KPiA+ID4NCj4gPiA+IAkqCWh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG8u
aW8vcHViL25vbi1yZWxlYXNlL3BhdGNobWV0cmljcy8NCj4gPiA+IDxodHRwczovL2F1dG9idWls
ZGVyLnlvY3RvLmlvL3B1Yi9ub24tcmVsZWFzZS9wYXRjaG1ldHJpY3MvPg0KPiA+DQo+ID4gV291
bGQgYmUgbmljZSB0byB1cGRhdGUgdGhpcyBsaW5rIHdoaWNoIHBvaW50cyB0byBhYmFuZG9uZWQg
aW5mcmFzdHJ1Y3R1cmUgd2l0aA0KPiBsYXN0IHVwZGF0ZSBmcm9tIDIwMjQtMTAuDQo+ID4gTmV3
IFVSTCBpcyBodHRwczovL3ZhbGt5cmllLnlvY3RvLmlvL3B1Yi9ub24tcmVsZWFzZS9wYXRjaG1l
dHJpY3MvDQo+IA0KPiBXZWxsIHNwb3R0ZWQsIHdlIHNob3VsZCBmaXggdGhhdCwgeWVzLg0KPiAN
Cj4gPiBCdXQgdGhhdCBvbmUgaXMgYWxzbyBhIGJpdCBvdXRkYXRlZCwgc28gc29tZW9uZSBjb3Vs
ZCBiZSBzbyBuaWNlIGFuZCBtZXJnZQ0KPiB0aGVzZSB0d28gc2VyaWVzIHRvIGFkZCB3aGlubGF0
dGVyLi4uDQo+ID4gKiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy95b2N0by1wYXRj
aGVzL21lc3NhZ2UvMjkzNcKgKDIgcGF0Y2hlcykNCj4gPiAqIGh0dHBzOi8vbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZy9nL3lvY3RvLXBhdGNoZXMvbWVzc2FnZS8yOTM3wqAoMyBwYXRjaGVzKQ0KPiAN
Cj4gSSBrZWVwIGxvb2tpbmcgYXQgdGhlc2UsIHJlYWxpc2luZyB5b3UgYWxzbyBkcm9wcGVkIHN0
eWhlYWQgYXMgd2VsbCBhbmQNCj4gdGhhdCB0aGVuIG1lYW5zIG1lIG5vdCBmaW5kaW5nIHRoZSB0
aW1lIHRvIHJlcGx5IGFib3V0IHRoYXQuDQo+IA0KPiBBZGRpbmcgd2hpbmxhdHRlciBpcyBhbiBl
YXN5IGFkZC4gRHJvcHBpbmcgc3R5aGVhZCBpcyBtb3JlIGNvbnRlbnRpb3VzDQo+IGFzIHdlJ3Zl
IGJlZW4gdHJ5aW5nIHRvIGNvbnRpbnVlIHRvIGNvbGxlY3QgbWV0cmljcyBiZXlvbmQgdGhlIHJl
bGVhc2UuDQo+IEkndmUgbm90IHdhbnRlZCB0byBnZXQgaW50byBhIGRpc2N1c3Npb24gYWJvdXQg
d2h5IHdlIG1pZ2h0IGRvIHRoYXQsDQo+IGZvciBob3cgbG9uZyBhbmQgc28gb24uDQoNClRoZSBw
YXRjaGVzIGFyZSBvbmx5IHJlbW92aW5nICJsaXN0IG9mIGN1cnJlbnQgb3BlbiBDVkVzIiBmcm9t
IHRoZSBwYWdlLg0KVGhlIHJlbGVhc2Ugd2lsbCBzdGlsbCBiZSBzaG93biBpbiBncmFwaHMgbGlr
ZSBhbGwgdGhlIG90aGVyIG9sZCByZWxlYXNlcyB3aGljaCBkb24ndCBoYXZlIGN1cnJlbnQgQ1ZF
IGxpc3QuDQpSZWFzb24gaXMgdGhhdCBzdHloZWFkIG1ldHJpY3MgYXJlIG5vIGxvbmdlciBnZW5l
cmF0ZWQgc28gdGhlIGxpc3QgaXMgdmVyeSBvbGQuDQoNCkkgY2FuIGFsc28gcmVzZW5kIHdpdGhv
dXQgdGhhdCBwYXJ0IGlmIHlvdSB3YW50IGl0LCBidXQgSSB0aGluayBpdCdzIGNvcnJlY3QgdG8g
cmVtb3ZlIHRoYXQgcGFydC4NCg0KUGV0ZXINCg0KPiANCj4gTm8sIHdlIGRvbid0IGhhdmUgYSBw
b2xpY3ksIGl0IGlzbid0IGRvY3VtZW50ZWQsIHdlIHNob3VsZCBoYXZlIG9uZSwgd2UNCj4gc2hv
dWxkIGRvY3VtZW50IGl0LCBzb21lb25lIG5lZWRzIHRvIGRvIGl0LCBJIGhhdmVuJ3QgaGFkIHRp
bWUuIEFzDQo+IGFueW9uZSB3aG8ncyBhdHRlbmRlZCB0aGUgd2Vla2x5IHN0YXR1cyBjYWxscyBr
bm93cywgSSdtIGRyb3duaW5nLg0KPiANCj4gU28gaWYgd2Ugd2FudCB0byBtb3ZlIGZvcndhcmQs
IEknbSBmaW5lIGFkZGluZyB3aGlubGF0dGVyIGlmIHlvdSB3YW50DQo+IHRvIHJlc2VuZCB3aXRo
IHRoYXQgYml0IGZpcnN0Lg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KPiA+DQo+IA0K
DQo=

