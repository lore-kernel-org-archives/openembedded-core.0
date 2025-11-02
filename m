Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78AACCFA02
	for <webhook@archiver.kernel.org>; Sun,  2 Nov 2025 16:18:53 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.792.1762100324711549481
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 08:18:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=T8PljsgP;
 spf=pass (domain: siemens.com, ip: 40.107.162.59, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bU1UAkAsoDYjs+qaky1VhlAWQXC/iq+r6b1urxtL4HadQH2EdwiEw9aKhMTvud+hXL5IPitMjMFEzbgYLY9kPyTI0D38zC7TcrjhNI6+qaSRgdRYAgA6sGpnZDjE/dgSwd8I2Mami68Xa4TBVVqGCtxFHG5p7dzfTemzDCsYT9GQPvy9qLbWxqeMsPjn2wmmMAW4lQgnFFvSwqY7w7zMgwuD3WJ74K+o2InkkQynhu76QiDPNwS2buwz91VkcTgjMFz/ksa5/exPJ0jQFats777JbNSfGUnPsflEGOMAULlPJxQuNFOTfBg9C3R6mbtZBeurLhU62psFqZSBN/NGkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WHGwLyTvBLi1kYmkNi1q1EbHKiNlna5uL4nRmOhQ/c=;
 b=S6ypWSCJ7ewGLbg3uIaXy4qn3o40n1vLX2NluLMh6FPcmx3A56J4yl6zvVd18VZGOXR2unYDOnN7D7E+O9e6iTiYumnuyqhSNfX0qNiFG6Vvw6CqZVtN28Wn/nLnpOG1Jkm+TXSG9JAqMhQbkSEST31/e/qJ6TXrXaKZhV8PNYqwR3bM202IfplpSvkbEGAe059KFSNJTqK3mCMfw5c16jlbI+c94gDr/y/clIdEaa8etZ37Eek5VWFok6qf/UFY1wVwYmOY3hBi9akFgvkXYAHxYVfpu1rcHXgFvmgM805E2G3XUs/RA73clzjWFC8f+FsMjGeZlSl947KKGIYcSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WHGwLyTvBLi1kYmkNi1q1EbHKiNlna5uL4nRmOhQ/c=;
 b=T8PljsgPXYV6YyyDU4lt6SR62YnGQ/9hRgdHc03DaWIfyIcNFntMfjOfkwyUA2lEhnz6zckmeMpkcbGD8x8FAQk+fIv/SpHVD91agCBf/3J42DSrve1aqhuC6JJTBfYdsfSfAwWWIZHly07T5Z/5TzrjDfhjxpkESaLse+Wv0J9wHPvd1oJO/FqNPhwsqcztbHmqCLXcwejij/SL/6F/gY1suZT0TvXS41HorP+Rhwwjf7XaXzvAKpQJNzRBACF26QAneFueWVOVqFi1d0zNqo9NPjJ5lwetfNIhPCNrRw1GOYQN8gAEXX3dHtqBU3k+LqGXpxjYzv2Nud16SeLyzA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS5PR10MB8201.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:672::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Sun, 2 Nov
 2025 16:18:41 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 16:18:41 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "zboszor@gmail.com" <zboszor@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] Go 1.25.3 release is botched at Google
Thread-Topic: [OE-core] Go 1.25.3 release is botched at Google
Thread-Index: AQHcS8cpscYP9KA9qUaehYdTme6Cx7TfkHyQ
Date: Sun, 2 Nov 2025 16:18:40 +0000
Message-ID: 
 <AS1PR10MB56979B84CCA46A047E9A9EA0FDC6A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <2b875d1c-50ef-4679-bb41-3e1cf89791b3@gmail.com>
In-Reply-To: <2b875d1c-50ef-4679-bb41-3e1cf89791b3@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=d022ed97-0a55-4bc8-97f8-0049d20c10e7;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-02T16:16:19Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS5PR10MB8201:EE_
x-ms-office365-filtering-correlation-id: 2d8b7d03-051f-4a2f-e2f8-08de1a2b7cbb
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UzhpVXRzS2N6TElBSEQzUTdZZlZJMnBJaGg1ZG5tZE9BTVRTbm12MnBaNlh3?=
 =?utf-8?B?RnV4bThJVkZzT2ZoUUNxMlRWRzJydG1JejdaL0h0RlIrUEZsNFZ6dit2cWs3?=
 =?utf-8?B?eVNBZ2t1ZlpZWWUvdWMybVdMdTdyQWRVMGJIWDRwcFIvMVl1cXBPQjhyWUlW?=
 =?utf-8?B?NE0rbXdHMGtTZHhNLzIrb0Z0eFU2TVRpa1hBSWNHWWp3bmhYM0p0Q1lxaXFL?=
 =?utf-8?B?S1dyTVN2QmdkSmhWb2NjY0h6YmVqaHYyNUtZb1lWZkIyU3dRLzBkVm8ySThE?=
 =?utf-8?B?cUVIWDlhR1MwUGpHamkrQlgzdHJxTjkrbHFZWmJZVUl2ZTJnOGF0cnBsOElJ?=
 =?utf-8?B?V0NtSFo5NEJMY2NUczluSkhVTmVnQmlPemlyR25jODFDWXpiZHZCSWltVnRm?=
 =?utf-8?B?S3ZpdlBPeFA2U3VGekxkSWY4STEzOWJFMm5FYWR1YVNZNU93Z0l0OWNYUUlp?=
 =?utf-8?B?REhTYStYL3Bmd1NtTTdaSWMxMldWRUlhbDNxWXZiTnJLNzV1bmJDV3FiWFlJ?=
 =?utf-8?B?YkJuNE00eGhLcWxGOUdXeHdvOWxUUEYxUng2SUFodmFxbFd1Zk5RSmswTGV6?=
 =?utf-8?B?bEdTRDZnNVordWk5RE5NRi9idmpmcGtHbFJqSU1aQkx0cUNrZzRoN0luN3VT?=
 =?utf-8?B?eXNDcVBnYlJNZ2ZBVjJLeVlmSW1PWnFuV004MUZTRWEydGRpSGo2NUpzS3E2?=
 =?utf-8?B?V2lhdzhBTkF2aUtWRk5jMmxyUC9jd1doTU5VM2lwbWdNTzJtZTR0ekJXVEFX?=
 =?utf-8?B?RjVNVVNKNDg5OG1UaGZmU004dG9kOWptKzY3UGU0Z2VabExZd0x3YzloZlE0?=
 =?utf-8?B?dlpDZjhJb1VLZ3JQa01vS1FzbXVTVk4xbXlURWJkTWtWdDhPYWNIOXFjSGZk?=
 =?utf-8?B?RVMvcWVDbEZKM1liSWYrcllHNmdkUWUxOTMwV1JuaWlYOEh1SVRCdysrT0pM?=
 =?utf-8?B?V2s0Ym1rYTFucmFQcTB6VDkyU2JqL0MvWkRCSGIzcjB5NllldWRESFJ4UVgy?=
 =?utf-8?B?K0h3Y1NTaFAzNWNGbDdIVThBcGhLRTRtdmVOSVpzS204OXVNeWFkTEgycFd0?=
 =?utf-8?B?UGtBL0NRNi9YQVM5US85UVZ4SVhKUkxSUHJKWW15RUczUzd4WFFjOHZRVk1l?=
 =?utf-8?B?QjZCOWJ4K2tRZmRPejlNVzM0N2Y5c01UZkluajJXbEsvVDJNdDVJOXhUQk9M?=
 =?utf-8?B?YWN6cElKanhiZnM3UkJLNXNnbFo5d1ZBSHVYZXZVTkk4K0puSUlGbjdRZExU?=
 =?utf-8?B?S3pKQkdpMExIZ2pld2orQXNWaHpWOVhKZEpOTjBwNWV2RDYxMS9ZdzhFelhM?=
 =?utf-8?B?d1d2OUhnMENxOFF2c0JHdTE3OWtwYXBkdnZRL3duTUt1dmdsRFNUVWVRWWQ0?=
 =?utf-8?B?K294eURXVWlQcG9hZDNlR3VsSStOTGtuZENrYnRwYXVPUVI4QjNwd0dxR3J0?=
 =?utf-8?B?WGZJU0J3ME4zZkE2amJvMkMrZGxPYThLZUcvd1pXOGR3SDA5ZmF1WWZYSm45?=
 =?utf-8?B?VnJEb2VSZnNBQmFCbG1YSHM0YUhscS9Ec1gyZDVFdWdHSXZBK0g2UVRHckFD?=
 =?utf-8?B?djR0N21QRDAwUmh4ajlvUWlObjBlK21kaU1Rc25EVnpibnh3NktKQnQ4dDFp?=
 =?utf-8?B?dWs3Q1d6ekFDMUZKelNBbmErVUJXWURpQlNqZGZGMm1hNUcyb2VHZXFzYzlH?=
 =?utf-8?B?Nk1QTDExRnA5dU5zbGFuUGp6emlJT1lOT3ZjM1lNc0FqQk1hNU5TM2RsMFEz?=
 =?utf-8?B?dHl6ME5qdm1uOVhHb0VlQ1VSWTVRSDI1ajZiT0VVYThDKzlRNG9EUkNDalZo?=
 =?utf-8?B?WDlTZ2FieUVsMlZTY3lYc3NJcm8rRVBtQWFIeE8wZWN0dHc2a3RxbGc2aDVW?=
 =?utf-8?B?amgwSncvOEdkNDNUMjlKVHEzRkpsQjNWdEdyOEdwcldSaGRIcWpwRFBweVhv?=
 =?utf-8?B?NzdXaGJ0Nmhiak83MUsvT3U1R1dDZHdhY1liU1phZFRiUmU0aHVMV0tOeWZJ?=
 =?utf-8?B?cnBneEVtU1BBPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U2pYWlhkejZnaVpZMFoveVFSV2kydnJLUFB1VHRKakdtUU9UUUp0VkgveWZP?=
 =?utf-8?B?eEIxZ2lCekhSdUlGY2V6TmdvSjVsNi9raDBMNkVGK0xkdGtwM1BXeWxGQUpG?=
 =?utf-8?B?QTlmSHhJTlhwSk5wbHJiMi85dUVUcWNyZXkxblF4Z3QvS2F4YVN1ZThnZmVQ?=
 =?utf-8?B?NjJsTzZhUThQVk5Wa0pVemZGTGxIQUQ0a2JhRGVwVEZlbjVLbTlVbGVZWkZC?=
 =?utf-8?B?ak1iY1NOYUFoOUQyTkg0NkdEM3R0RXlTZGdmaVJ1VDViRVJYZ1NESGZxRVB0?=
 =?utf-8?B?Y2JoVkxFUkVXS3JMTXpZdXdhRjlWRmw2MUVBZkFXeXgycjJ3YTdIaGwzY0Fv?=
 =?utf-8?B?TDdsQjRYR3loMjUrYXRaSlVwV0IvU3g2TU9YYTRlZHJmOVhZVG9LcW5xWTZx?=
 =?utf-8?B?WitqR2g3MXUrS1U5WVBsSGFHc1BTS3lEMmxDNDBCMDY1OTFqTDhJb2J4VEJF?=
 =?utf-8?B?RTZZYzFqcTBTUlJjeUZMZzRITEJiNFF1VkZjcDE3dGkrU1VENlBsdFlaMms0?=
 =?utf-8?B?R1I1bktYWEQ2b3JnRGQraDVZWEZQNFFMc0xCb01aekdxWGhEazhodWFGMm1Z?=
 =?utf-8?B?UHUrWkNGTWRwbzhRQitOc1p0aTU5MUp3WFZlelFEWFpFRWd0MGkyN2drV1M0?=
 =?utf-8?B?N3VXOGZnTTVlVENYMFFlNm9pOGRIczNKd1lVanN0Q0VQcVQ0K2xUU2tQaHdy?=
 =?utf-8?B?Q2JjT2ZhWXRwUm5MQ1VodWEySk15MkNxSWpKd0JKa3JlNmxVRkZOK2tDbnp1?=
 =?utf-8?B?VDJTMXhCbGwrMjBjRklESnQxckdRLzh5Y2U2TjEwUzJHZnVmeWthU2R0N1Fh?=
 =?utf-8?B?TTJ3Q09NNnZzbkxEVWZqT3VDQkE1TUViOXBpNSt5cFU1aG5wc1lMbHpuRTZN?=
 =?utf-8?B?ejc5Q3oyaGVyL1kvbkIyc1JZVUZycjcvTmhnV2xPd2J0VVFya1BsUXhEQkZ4?=
 =?utf-8?B?UjB6V2ZhblN3Y0hNVDR6ZlY1eXU4elRHR3V6ajdTZ0UvTTBaWW1XSElXWFhI?=
 =?utf-8?B?dE10R3k0S2svcHlZTlV1My9Wb2lJMXRKSndjUjlEWVVmTU9qM0JEcHJEZmVI?=
 =?utf-8?B?eTAvSkFXVU5UbVlpL2QyTmMzSGpCUXI0dWVLbEVMTDVwcmNrdFh3dW80UWc5?=
 =?utf-8?B?akpNTUhrYzA2RmxvRnNCU25scXpzd2pmSGVTclFWZDVCLzF3SG8zYldBSHdI?=
 =?utf-8?B?QVpSRFNHUHlLVVBCMzRZSmNaWmtoRDRNeW93WCtFVHMxMUJyVjMzamtMQ0RY?=
 =?utf-8?B?RkFaR0lRTStyalNzKzg3QUt1S2xTWGZSTjVKQU9XeXViVkx4c0FCbUpkOFAx?=
 =?utf-8?B?YVZTckNId2duY3NvR2R0VGtjNFBTaHB3ZEE4c2xNR2txSWpTVlhVT2IvMWRZ?=
 =?utf-8?B?cW83Q2M0UVdPOUw2djJ6Q3Y4UEdEUnFYbUZ3VzV2U1cyRUtLcFBNR1QyOGI3?=
 =?utf-8?B?QTZabE53R2h4RjZubm1yMmFqaXZvQjQ2SFV6M0RCWVBtbitmYlNramwxQ1Jq?=
 =?utf-8?B?YVpnM2luckF6d01xa2hqQ01MQTdXUmV4MkRObGRHblEzenFFaGxTTUhIaDJT?=
 =?utf-8?B?bzl2cFY0Q3hYUUYvTGlFQmdnMTBLS0cwZ1VRbzdGUTRmN2JDcm9kNi9WeGo4?=
 =?utf-8?B?bnNkQmh5N1lvVEFyRnJkVE53c0tqelhiR0plUUZPZHYzVVdVVExRS2R6M09p?=
 =?utf-8?B?QnlaREROZHhXcnd2YStBdklYNEJ5Q2tscEtNV3J6RjlXbm9iUTRyTDdOak13?=
 =?utf-8?B?SWpURVZRdjk5ZWkzdGpVekJ6YUdOVzQ4ZXZseFFWdUwxUkNqbnpRaU5Lb3VG?=
 =?utf-8?B?S0laVTlsUFZ4WjBPWnZLWnVTcER3N0k5V2U1ZkhZNUdjYW5rNEVDUC9PV0Ex?=
 =?utf-8?B?Q1JuZ3JDbEJNVlkyNDB5L1JaZE5lR2J3SEU0clRhSTJlRGttVjcvU3l3OVhx?=
 =?utf-8?B?ak40M0VLWEQ1SG4vUGlFSk9hUzBhN2FDeUVXbEVaOVZaRk9OTU1xS3Q3TWcx?=
 =?utf-8?B?eDZkOUpBUmFUZDdZQlQwczVnaVJ0T0NBNXVpbzc1NnhTMmU5YTNJS0J0dFk1?=
 =?utf-8?B?OXNHNmZGZzVPM2dxQnpYY3ZibVc5STZ0a3pWTXJYSEM3NTJwOHdQcnp2bVhQ?=
 =?utf-8?Q?TzaMe/ckPvlhhfmj9ik+PpQtL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8b7d03-051f-4a2f-e2f8-08de1a2b7cbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2025 16:18:41.1688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xh2a2ia8+/OLBI4dyMuw+iFmkSwwWCYqGmuW3t4YA+XK3UdW/8R45Dm1XVwq88yhg15UQveZm6dvOkKBcr12Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR10MB8201
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 16:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225582

SSBoYXZlIGRvd25sb2FkZWQgdGhlIHRhcmJhbGxzIGZvciBzb3VyY2VzIGFuZCBwcmVjb21waWxl
ZCBhbWQ2NCBiaW5hcmllcyBhbmQgaXQgaXMgZ29vZCBub3cuDQpIYXNoZXMgZXF1YWwgdG8gd2hh
dCB3ZSBoYXZlIGluIHRoZSByZWNpcGVzLg0KDQpQZXRlcg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhh
bGYgT2YgWm9sdGFuIEJvc3pvcm1lbnlpIHZpYQ0KPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+
IFNlbnQ6IFN1bmRheSwgTm92ZW1iZXIgMiwgMjAyNSA4OjA2DQo+IFRvOiBvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFtPRS1jb3JlXSBHbyAxLjI1
LjMgcmVsZWFzZSBpcyBib3RjaGVkIGF0IEdvb2dsZQ0KPiANCj4gSGksDQo+IA0KPiBhcHBhcmVu
dGx5LCB0aGUgcHJlLWJ1aWx0IEdvIDEuMjUuMyByZWxlYXNlLCBib3RoIHRoZQ0KPiAqIHByZWJ1
aWx0IHRhcmJhbGxzIGF0IGh0dHBzOi8vZ29sb2FuZy5vcmcvZGwsIGFuZA0KPiAqIHNvdXJjZSB0
YXJiYWxsIGF0IGh0dHBzOi8vZGwuZ29vZ2xlLmNvbS9nbw0KPiBhcmUgY29tcHJlc3NlZCB0d2lj
ZSB3aXRoIGd6aXAgYnV0IGlzIG5hbWVkIGFzIHRhci5neiBpbnN0ZWFkIG9mIHRhci5nei5neg0K
PiANCj4gVGhlcmVmb3JlLCB0aGUgY2hlY2tzdW1zIGFyZSBpbmNvcnJlY3QsIGFuZCB0aGUgZG93
bmxvYWRlZA0KPiBmaWxlIGNhbm5vdCBiZSB1bmNvbXByZXNzZWQgd2l0aCBhIHNpbmdsZSB0YXIg
eHpmIGNvbW1hbmQuDQo+IA0KPiBVbmNvbXByZXNzaW5nIHRoZSB0YXJiYWxscyBvbmNlIHdpdGgg
Z3ppcCBtYWtlcyB0aGVtIG1hdGNoDQo+IHRoZSBleHBlY3RlZCBjaGVja3N1bSBhbmQgY2FuIGJl
IGV4dHJhY3RlZCB3aXRoIHRhciB4dmYuDQo+IA0KPiBBZGRpbmcgZG93bmxvYWRmaWxlbmFtZT08
YmFzZW5hbWU+LnRhci5nei5neiBtYWtlcyBpdCBkb3dubG9hZA0KPiBhbmQgZXh0cmFjdCBPTkNF
LCBzbyB0aGUgcmVzdWx0IGlzIHRoZSA8YmFzZW5hbWU+LnRhci5neiB0YXJiYWxsIGZpbGUNCj4g
aW5zdGVhZCBvZiB0aGUgZXh0cmFjdGVkIHNvdXJjZXMgb3IgcHJlYnVpbHQgc3R1ZmYuDQoNCg==

