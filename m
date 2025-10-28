Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3737ECCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 14:02:09 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.0])
 by mx.groups.io with SMTP id smtpd.web10.12577.1761660127510468643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 07:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=QqhKM4Nl;
 spf=pass (domain: siemens.com, ip: 52.101.69.0, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRckr9e/kaMdM9LHSpHc61NdHxpn+uHfU5/6RbE0/I7sylVnEUGIqqEzMHRHn/KaFRcrMEBjlcqaMcZWVFnE6W9STBiEfGhjAfp71eE5WIg7cxxXUycICckURs2uH6wEVnV4Dh6Dern1rrBUVaokgFx39Sgt0j/KKpoz1LQ9/09I8nrkMRNf4wDKcAK2enk7HrBAqjLaDkGoy0x+geAUpnCpC6z94rSJvHzcAAAh2oyhLI//6hnEY1yiRc7vRW1dKpphhvmozMnzFHzSaTY3OLN4XO5fxwEPiusRnK0atqj/pCciJoLqH9nI9RHcyIrhT+PHfFjq45OpXq6/sWUo2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytGA6KmwHIgBqPoNRy6BqC7Rqkopqbv56u6E3kVHljM=;
 b=jGQnVP7sf0K+c0dstzvg8YcjGgOQ/UkQHIosywREtw4GAJKyR87ButeieOwQ6bsiP6ehlCw0cNG2hoV8Bk8mFPNxc4TRivwYlH6/YFYmosNBTrimT5ThgzdQ0tSRpFAKIjS1MuJHyVYi7tWTYyIppfvwfnRWbUdb1nSlXUBqSZdji/aI1ojCyX2NlC2Rl0LNz8SDXpcJNq1J1vUT0025KLg0jorqZHHW/FFlQSoE4Uma4JaJjI+Pg2e9PGKm7wroU3i6s7xT3MsJkDLOIMotOombQ+5FYaQUC+iE28vHGVdN796jG29shoWG0x2jMGP8IkyJ7wRBitBGb6Htt8nD9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytGA6KmwHIgBqPoNRy6BqC7Rqkopqbv56u6E3kVHljM=;
 b=QqhKM4NlV22iHxv4eNLzwrzZVPHyIeCPzJ/ePBbTfzLZppERoTgBvc2JIq+5/TDWpeevdSojEJwtLGHJz/wMWmckIpc0qGGHiZ+FxJX30e65rCEnqRopiPWusuFA1vCRjDdn4i77fyaGI58z7V3VfLuPX2HopmqP4vJzpAEEcQwSYI9zVCYyEl8zjjgp3BnslfnRwZCjcA1JWc1ObtBoLrOqmky2XDuJoSBKEBGCMhP6z5LHgQNr9lgLXjRu+V3DBxH2fgbMVld00ftQpkIecEYvVqMqX3BovtHs/Fax8Lc5B0wH1Sw/c9laLR+H8d5P5J5kE0goRHDQpbB1dzEkJQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS2PR10MB6350.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:551::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Tue, 28 Oct
 2025 14:02:03 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9253.013; Tue, 28 Oct 2025
 14:02:03 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Paul Barker <paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: RE: [OE-core] [PATCH] pseudo: Add hard sstate dependencies for
 pseudo-native
Thread-Topic: [OE-core] [PATCH] pseudo: Add hard sstate dependencies for
 pseudo-native
Thread-Index: AQHcPtCzFhkVAFpriUa02WY9k/jdbLTXpO7w
Date: Tue, 28 Oct 2025 14:02:03 +0000
Message-ID: 
 <AS1PR10MB569703DA3934BF136F05AF3BFDFDA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251016-fix-pseudo-native-v1-1-7c42af094122@pbarker.dev>
In-Reply-To: <20251016-fix-pseudo-native-v1-1-7c42af094122@pbarker.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=f29e22f5-63bd-41b2-bacc-ad9721dca3a9;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-10-28T13:46:37Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS2PR10MB6350:EE_
x-ms-office365-filtering-correlation-id: 1c304e6d-5362-4ebd-9924-08de162a923d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UThiNHpocW41RllWb0toT0FmMmZxNnZURWdtL2hRemZ3aHpkeitPNHZHWkMw?=
 =?utf-8?B?U2JlK1lSb0xoWTFjMHJndEQxUVp6RE1FdUN4T3E5Ukx1QmZ2dC8yRUV3OWJp?=
 =?utf-8?B?ZUtJOVVRNlU4c2FtTVRIeXFOWkVYT0p3S2E2Ukk5N2JZc3Y5RGZ0YVZ6c0xh?=
 =?utf-8?B?WSsxekU3RW9waFlGb21kNThrOVZKd2lYaEI3TDJJRm4wR1FMaGlTRVBGQStt?=
 =?utf-8?B?dVJTNEJFOWcxaXkydTdSVWI4d3FqYTAzM1JFRnBoYm4vM3FyTFFSNlF4NytZ?=
 =?utf-8?B?OFovZW9aaDIrSEx6Yms1dHoxenl1eW9RR05VWUpnNDYyYUFkTSsxRTdSbUpw?=
 =?utf-8?B?dkZXMk42Tkc4S0Mxb1hnWXNhZ1EyZDJtTEd5TU9SUFNVUElETGU2SlFIVDA1?=
 =?utf-8?B?K3loVFluMDRKUlo4R1UvSmd1VEpQYzB0T2ExblZpbzFpenl6Ulc0YWNhOE1P?=
 =?utf-8?B?Wlk1RVR6Qnl1SXhCMmV6NlQ0ZTQyN0tVUmJxT2Jhb2RybjRNRFl2akhBSHht?=
 =?utf-8?B?OWY5eVcxQ1ZYRzdvWFpJWHN2WVhiNVhaaGJDSjZWaE1PZ29ZZlZDZkdSOXhB?=
 =?utf-8?B?S0FodnZzbGowT285UlhLY0hWWVg3bXQwc1FjUUdLK1ByMDRMei9TM2FEMnFw?=
 =?utf-8?B?ZjZSbzlWZmN6NHhvU0ZKL01tL2lJRkRkNDlLRmEzc1ZBNXk1S1IvMk5hWDcz?=
 =?utf-8?B?bHhCSGVKTUJ0VmdHOTFEOVdpbDdycDVlVFZXWHpTbEtCRzRBT25GVlpUeU1v?=
 =?utf-8?B?MWFpZVZ4YkdMSGV1ZzRWT3o1V0VaQTNsS0d4SFpLSFFsVGxNNnJOaHJIQkxT?=
 =?utf-8?B?ZE9paGhUYkdDQ3Rpb0U4bXdjQ0JyREtQUmoxeFVyRkRxOFEvNzhFSE9GRGF4?=
 =?utf-8?B?NXFDUlNNWUlvOXZUUkl6dDlWN0MwekhZbU9NTkxHR0pZQ1ZVTHhCTXJYTzJl?=
 =?utf-8?B?djdUMDVta3dvTGY4dHZDeW1jYWJqaDZvMzF6STErazY0cHJXYXFmR2p1dFhJ?=
 =?utf-8?B?bXIyQThXdklWcC82cU02ck1WMitadFMyUk1WR2c5cnB1eFNzcmltdHVUSjAy?=
 =?utf-8?B?eGlJOGpMYlhlSUtPcWhwcnVyWVcyRU5zaHEwWXQwTHBmemJPOGdFZHQ2L2pU?=
 =?utf-8?B?QWdQTjYvTVFZT1JXMTVVaUZVS0IyMHkyRDBrWnFYQ0xhNmlERkQyMG5qWVh4?=
 =?utf-8?B?dU5WK2lLeCszclZGUmVuR1NjZlpVMVdkVCtQcjd6SGJ2VythT1dWUEVxaHJa?=
 =?utf-8?B?dHBsSU1mc1FGMzJ3RmtsQUFzMDhJaFRINGdpZlZrZzJXd2ZGWTV5NGp0dlJ2?=
 =?utf-8?B?Wi9hNzdPRlI4TTZrdnJId05YZFk3ek11aFhrRG5EUEM0ejd6OVVkZldoRXBw?=
 =?utf-8?B?LzZPSmRaSWdlQlhmUzQ4U2w0WTlCRVp6ZE9jUFdsY0pVSHRERjhuYVRxMU45?=
 =?utf-8?B?U28rWnNtNThCR3FQQnZMbkZHRWU3Z2xTTU5HY3c0dUZ4MVBKS2JHTDZqU0NV?=
 =?utf-8?B?QXI5VnBza3p5MytZNDU5ckVseTlLTkFtYkR6dmtjWGVBT2dMSHZDUXlGZG54?=
 =?utf-8?B?QnN1TkllTXpEQ0lvN05za2pxZG92Szg2a2wyNy9leSs2ZEJhb29sOURKSVVM?=
 =?utf-8?B?OHExS1F1Y1lTLyt1ZUVVQk1XbUtsZFV4Q2NISzZiZ1pldFlKYzBoc1lYcHBO?=
 =?utf-8?B?OW8xWTlNZXdRWEpiSXdCNm12ci9hUFEzdzVaWVlKbnh5aDZlU1dGUzZvbktj?=
 =?utf-8?B?WWNLUXUzQmJoaUREa2xDRTJma0N3ODgzb0hRUFFaNnFuM3pmbytvNE1IUjBV?=
 =?utf-8?B?dkROVXRGdkV3ckJQOWl3SUtuMm5MSDg4VGVEUTBiWTQyZHFuT0ZTaWdNWmxS?=
 =?utf-8?B?RDY5UTlaNnJ3dVptL1M1WkFCbHdrUlhJS01sSEQxUnpZK3JUUUxCQjE4NzBH?=
 =?utf-8?B?YUlaaWE2aFhieTNTZC9QWHhZMW54QnhrNUR2UGkxZ2ZiaGRRVlA3RVBuODR0?=
 =?utf-8?B?NnF0ZHhNUUdWSitJMExxWUlKS3ZpT2tJRzJCeStWKzlPNUdqYWlsR2wwUkhk?=
 =?utf-8?Q?C5xAsg?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ajlCSytGQXpmaGFRSndaRnk5OUtzc0tEWUk0YVJiNHNlZ1B6UEtSOTFaWWps?=
 =?utf-8?B?MjBsaHYyMkMxWEE5NlRlSkdGK2wyZWIrTTVOZXlaU0ZKYzJsRVc2NkI5RXNv?=
 =?utf-8?B?c1E5ZmlpV0IzREpwNkM4djdiemVsbXFXd3ZrRDRGdzhsUjQwbGtZU3B5Si9J?=
 =?utf-8?B?N21ybDNyYk41TCtyMGRvbXZFUEhrSCtldWJHQTcyWGlFK0pmTUpoNWZOdFQw?=
 =?utf-8?B?bDYveHR4ZDNlZlRiQTB0TEtpNUY0elA1aXFkTUtVMjhFWTF4eUwrMHN4bUZn?=
 =?utf-8?B?MXR5VjUvbkppenlkNVhzcnpIeFVMWjBBYWNGa3JnbzVheVdpRTRmT1Fpb1VN?=
 =?utf-8?B?K1hOZFFtYWVlRU9Kb3I5RnRGa0F0RzhnLzQ2ZUwxWWhUT3IzaW5VMksxVTI3?=
 =?utf-8?B?ZkZSOXVXdG95M2Q5VlZsekg4VHQzbXNXb0U4TDhUdHRNSm5kc2REMUZxSHFH?=
 =?utf-8?B?ZDluSG9WaVVITlU2dWFzcVRkZU9SZVJNRzR2azlEK1VSOFQ3U2EyM3I0M0gz?=
 =?utf-8?B?WUViNTRNeEFKWDZvaHJhcHprMTNBQ1YxbkI1RzY2cHBqV2d3Mm03MVZVZzJT?=
 =?utf-8?B?MmsyTGJycEdneUNIZmFERHlSZW54RHpMcDJla2ZpM2JXVElUWFNsa1gyUFVV?=
 =?utf-8?B?a0FCRDk4ZUs5bkluOVRLWUFYS2hFejZoa1BKUzh2d1F0RUVCdkhGQkxhbFdq?=
 =?utf-8?B?aFFUL095dysydlZpV0cvRGppaXloSDg2ZW9kVU50aEhHOWdRZDNuNE96UzNu?=
 =?utf-8?B?ekI5MmZucnhVN0dKOWxqQUdxdkhrZzVoL3Q2dVpTTk5tNXZhOVBpSlZzeFRR?=
 =?utf-8?B?Tm5za01ja25vRmJlK0xXZzJVT3JXWmY1Rm8rL3JTdk04WmRwaUNXNmdtNTZy?=
 =?utf-8?B?RndxM0NSSXpEUS9MdTk4RVg0UWtBYjF1Q1FwSFpUaUJPYm0ybloxVlZ3NFdG?=
 =?utf-8?B?WHdLR2xvWWdSeGkxNUNPNHlWMENjRE5wVUphYkZSVXZSV3ByYWV0NlVINENS?=
 =?utf-8?B?OFdibEFIaXpIVnpxU1l4a3A1NTduWFRLbFBNSHQyTTF5WmU4aXBrbHlKN2pl?=
 =?utf-8?B?ZjNRVFNsaDJkai9tNUF0VTAxbENkTi9GaEpjRk5tckM0WEhHZ3cwTktib3Yy?=
 =?utf-8?B?bGs0a0JGbHYwZWJuaXAvSTZrNTZWR1YvQkdkL2FMQzY0UGNScW0welFtaERr?=
 =?utf-8?B?U1FqNy9xYlV5TDUvOVBUKy92V1RnWmQwejBFOFRmSlQzZmJJbERrTE5lY0cx?=
 =?utf-8?B?MUpvakMrbHVBS0FZY0lPYXlrYzBPVWRmOEdCOEZwS1VubnBJYjByTmZrQTlW?=
 =?utf-8?B?SmNlTHJ4bkRpRlZLaHluU282UjBtNHptQ3RuYUxWanRKalJGT3VWTW5Hei9W?=
 =?utf-8?B?cHZTa0FIeFhnWnp6V0FWaXdxTnJ3b3lIaWtnTGtkVmNicm5jY2YwMW5hS3Rm?=
 =?utf-8?B?TzkvVmMxdnhFb21Cc01WYXM1czJJNTlyK1pES0dhcVVFcTBlOXA0T0QyUGI2?=
 =?utf-8?B?UGd1ZXNFNG1sTVd4bnVsOURQQUwvbGtkV1hTWkFvQ3RjcVV3RUQzNHo1N2kz?=
 =?utf-8?B?UFBqbjhydzA2N0doVXAzTUorZDRNMUQwU053dGVZeWZXWmY0MEp1ejF3NTR3?=
 =?utf-8?B?UWZITDRRY21GVGp3SWZIYklLbjRtcG5iUE10NDlWcHNhN25QVHl2MHIrZE1B?=
 =?utf-8?B?QXdOeVlOVUFNazlVTEFSa3hLdjVPVmVjbjlCbHg2YlNCTHhYWXJPcXo1MTRw?=
 =?utf-8?B?dmlxZUNyb09DenlaRisrcHZVa3F3SFQ4b3FhMVdLZk1TN1lJVVg3MktmTEk4?=
 =?utf-8?B?dGwrTzUxckp4TkIxZFdnaHRmTTFXWS9MdmcrbHBIRjR3MVVreUZKZ1oweW5n?=
 =?utf-8?B?WHlUK1BXRzdnQnBPVFRCTmpzVjVwR0Nvd0k4OEJWcW0weXJoVHJxRlNJVlJU?=
 =?utf-8?B?ZEJtTzFjWmtYUTNEemZnd3FaVjVqZkVLOXRCNHBMblg3ZVU0VFJkZTRVQ1U5?=
 =?utf-8?B?UWNaNFhmaG54RERYOEhsWldhTEFVc2ZFQzFiazFMYlkrMmlJbE1lRlRtQlhU?=
 =?utf-8?B?NHpZVElyT215cjFVUjR5elR1WkZwTmtzUXd0S01udlNsMWhZN05VZ2JubUhM?=
 =?utf-8?Q?Ta06ZM2gwRqN+/asALVGttleO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c304e6d-5362-4ebd-9924-08de162a923d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 14:02:03.0891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H3Fug9MSYzDDAATsda7QyrCr6OeZhaA94uAu/3F8nwcT/3VM6DISdxI2lkvPeNene+hT0hiUt4nzmU1dreao8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6350
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 14:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225410

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBQYXVsIEJhcmtlcg0KPiBTZW50OiBUaHVyc2Rh
eSwgT2N0b2JlciAxNiwgMjAyNSAyMToxMQ0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiBDYzogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+OyBQYXVsIEJhcmtlcg0KPiA8cGF1bEBwYmFya2VyLmRldj4NCj4gU3ViamVjdDog
W09FLWNvcmVdIFtQQVRDSF0gcHNldWRvOiBBZGQgaGFyZCBzc3RhdGUgZGVwZW5kZW5jaWVzIGZv
ciBwc2V1ZG8tDQo+IG5hdGl2ZQ0KPiANCj4gV2hlcmUgYSB0YXNrIChzdWNoIGFzIGRvX3BhY2th
Z2UpIHJ1bnMgdW5kZXIgZmFrZXJvb3QsIHRoZSBjb3JyZXNwb25kaW5nDQo+IHNldHNjZW5lIHRh
c2sgKGRvX3BhY2thZ2Vfc2V0c2NlbmUpIHdpbGwgYWxzbyBydW4gdW5kZXIgZmFrZXJvb3Qgd2hl
bg0KPiByZXN0b3JpbmcgZnJvbSBzc3RhdGUuIEFzc3VtaW5nIHBzZXVkbyBpcyB1c2VkIGFzIHRo
ZSBmYWtlcm9vdA0KPiBpbXBsZW1lbnRhdGlvbiwgd2UgbmVlZCBwc2V1ZG8tbmF0aXZlIGFuZCBh
bGwgaXRzIHJ1bnRpbWUgZGVwZW5kZW5jaWVzDQo+IHRvIGJlIGF2YWlsYWJsZSBpbiB0aGUgc3lz
cm9vdCBiZWZvcmUgcnVubmluZyBhbnkgc2V0c2NlbmUgdGFza3MgdW5kZXINCj4gZmFrZXJvb3Qu
DQo+IA0KPiBXZSBhbHJlYWR5IGFkZCBhIGhhcmQgZGVwZW5kZW5jeSBmcm9tIGFsbCBkb19wYWNr
YWdlX3NldHNjZW5lIHRhc2tzIHRvDQo+IHZpcnR1YWwvZmFrZXJvb3QtbmF0aXZlOmRvX3BvcHVs
YXRlX3N5c3Jvb3QgaW4gYmFzZS5iYmNsYXNzLCBidXQgdGhpcw0KPiBkb2VzIG5vdCBjb3ZlciB0
cmFuc2l0aXZlIGRlcGVuZGVuY2llcy4gU28sIGV4dGVuZCB0aGUgZGVwZW5kZW5jaWVzIG9mDQo+
IHBzZXVkby1uYXRpdmU6ZG9fcG9wdWxhdGVfc3lzcm9vdF9zZXRzY2VuZSB0byBlbnN1cmUgdGhh
dCB0aGUgc3FsaXRlMw0KPiBsaWJyYXJ5IGFuZCBhdHRyIGJpbmFyaWVzIGFyZSBhbHNvIGF2YWls
YWJsZSBpbiB0aGUgc3lzcm9vdCBiZWZvcmUNCj4gcnVubmluZyBmYWtlcm9vdCBzZXRzY2VuZSB0
YXNrcy4NCj4gDQo+IFtZT0NUTyAjMTU5NjNdDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIEJh
cmtlciA8cGF1bEBwYmFya2VyLmRldj4NCj4gLS0tDQo+ICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHNldWRvL3BzZXVkby5pbmMgfCA3ICsrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHNldWRv
L3BzZXVkby5pbmMgYi9tZXRhL3JlY2lwZXMtDQo+IGRldnRvb2xzL3BzZXVkby9wc2V1ZG8uaW5j
DQo+IGluZGV4IDIyYzkzNDk3N2Q5Yi4uODI0OTljZGQ3NGRhIDEwMDY0NA0KPiAtLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHNldWRvL3BzZXVkby5pbmMNCj4gKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3BzZXVkby9wc2V1ZG8uaW5jDQo+IEBAIC0xNTUsMyArMTU1LDEwIEBAIGRvX2lu
c3RhbGw6YXBwZW5kOmNsYXNzLW5hdGl2ZXNkayAoKSB7DQo+ICB9DQo+IA0KPiAgQkJDTEFTU0VY
VEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIg0KPiArDQo+ICsjIFNldHNjZW5lIHRhc2tzIHdoaWNo
IHJ1biB1bmRlciBmYWtlcm9vdCBtdXN0IG5vdCBiZSBleGVjdXRlZCBiZWZvcmUNCj4gKyMgcHNl
dWRvLW5hdGl2ZSBhbmQgKmFsbCogaXRzIHJ1bnRpbWUgZGVwZW5kZW5jaWVzIGFyZSBhdmFpbGFi
bGUgaW4gdGhlDQo+ICsjIHN5c3Jvb3QuDQo+ICtQU0VVRE9fU0VUU0NFTkVfREVQUyA9ICIiDQo+
ICtQU0VVRE9fU0VUU0NFTkVfREVQUzpjbGFzcy1uYXRpdmUgPSAic3FsaXRlMy1uYXRpdmU6ZG9f
cG9wdWxhdGVfc3lzcm9vdA0KPiBhdHRyLW5hdGl2ZTpkb19wb3B1bGF0ZV9zeXNyb290Ig0KDQpJ
IGhhdmUgYSBkb3VidCBoZXJlLg0KDQokIGdyZXAgLXJJICdzZXRzY2VuZVtbXWRlcGVuZHNbXV0n
DQpiaXRiYWtlL2xpYi9iYi90ZXN0cy9ydW5xdWV1ZS10ZXN0cy9yZWNpcGVzL2QxLmJiOmRvX3Bh
Y2thZ2Vfc2V0c2NlbmVbZGVwZW5kc10gPSAiYTE6ZG9fcG9wdWxhdGVfc3lzcm9vdF9zZXRzY2Vu
ZSINCmJpdGJha2UvbGliL2JiL3J1bnF1ZXVlLnB5OiAgICAjIGUuZy4gZG9fc29tZXRhc2tfc2V0
c2NlbmVbZGVwZW5kc10gPSAidGFyZ2V0bmFtZTpkb19zb21lb3RoZXJ0YXNrX3NldHNjZW5lIg0K
bWV0YS9jbGFzc2VzL3VzZXJhZGQuYmJjbGFzczpkb19wYWNrYWdlX3NldHNjZW5lW2RlcGVuZHNd
ICs9ICIke1VTRVJBRERTRVRTQ0VORURFUFN9Ig0KbWV0YS9jbGFzc2VzL3VzZXJhZGQuYmJjbGFz
czpkb19wb3B1bGF0ZV9zeXNyb290X3NldHNjZW5lW2RlcGVuZHNdICs9ICIke1VTRVJBRERTRVRT
Q0VORURFUFN9Ig0KbWV0YS9yZWNpcGVzLWNvcmUvc3lzdmluaXQvc3lzdmluaXRfMy4xNC5iYjpk
b19wYWNrYWdlX3NldHNjZW5lW2RlcGVuZHNdID0gIiR7TUxQUkVGSVh9YmFzZS1wYXNzd2Q6ZG9f
cG9wdWxhdGVfc3lzcm9vdCINCg0KdXNlcmFkZC5iYmNsYXNzIHdpdGggVVNFUkFERFNFVFNDRU5F
REVQUyBhbHNvIHJlc29sdmVzIGludG8gZGVwZW5kaW5nIG9uIHNldHNjZW5lIHRhc2tzLg0KDQpT
byB0ZXN0cyBhbmQgdXNlcmFkZCBkZXBlbmQgb24gc2V0c2NlbmUgd2hpY2ggaXMgYWxzbyBkb2N1
bWVudGVkIGFuZCBoYW5kbGVkIGluIHJlcXVldWUuDQpUbyBtZSBpdCBsb29rcyBsaWtlIHN5c3Zp
bml0ICh3aGVyZSB0aGlzIGZpeCBmb3IgcHNldWRvIHdhcyBwcmVzdW1hYmxlIGNvcGVkIGZyb20p
IHVzZXMgd3JvbmcgdGFzayBkZXBlbmRlbmN5IHdoaWNoIHdvcmtzIG9ubHkgYnkgY2hhbmNlLg0K
QnV0IHRoaXMgaXMgZGVlcCBiaXRiYWtlIHN0dWZmIHdoaWNoIG1heSBoYXZlIHNwZWNpYWwgbnVh
bmNlcy4NCldoYXQgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB1c2luZyB0aGVzZSB0d28gdmFy
aWFudHM/DQoNClBldGVyDQoNCg0KPiArZG9fcG9wdWxhdGVfc3lzcm9vdF9zZXRzY2VuZVtkZXBl
bmRzXSArPSAiJHtQU0VVRE9fU0VUU0NFTkVfREVQU30iDQo+IA0KPiAtLS0NCj4gYmFzZS1jb21t
aXQ6IDU4NTU4Yjk3YzE1NzQ2OWYwNjBiYjJhZDU5YTQwMjU0ZmI2MTgxZTQNCj4gY2hhbmdlLWlk
OiAyMDI1MTAxNi1maXgtcHNldWRvLW5hdGl2ZS0yMjFmZTNmY2VlYTQNCj4gDQo+IEJlc3QgcmVn
YXJkcywNCj4gLS0NCj4gUGF1bCBCYXJrZXINCg0K

