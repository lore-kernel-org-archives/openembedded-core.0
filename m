Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596D6E9A047
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 02:18:58 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3850.1771381128921791442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 18:18:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=l965Atdx;
 spf=pass (domain: axis.com, ip: 40.107.162.32, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6nPk99UkBgcopfsXVbRdA31pqAemXjZj6cSWXdBicCUFUF2ezM9P3sLmbk5g3nu7uHCQs+031wqB4Gub3RKR1833SaE1kvcDkyxHZ4ZwxIZMcJSqlefjyRD4lJdSpWxqvtJ9XIkzXA2X+b6uNf470/CL1XCgK9vpDrIi9H2SLcQK+i8SaVSFx03wqVqyKKluospetPVuaWZvvQzE50baEH4xs2yTZtqQqDgmCRHaPgZ1m5izusRkSptmZ1reJPJ4vU5Ae+c7JrhKBhTtvq6Qgo3ksrpo7eGnzxsHEppA6/YRqN3glS+Vqrl0yhqGbQZqdb529Gl1T3DUYnIB8BJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHDqw6n0Z9X7dke3L1Y3zcw6IOL91thDJG5RBRP44TQ=;
 b=fg0U0WLwoaoC8mK3nlwBBWeHe8Cd36H3YKRsgfiTaexZotmK8vp8DAoJdPXRDT42vcOZSMVwM4vikGA9jii3khQ0MowWRRFPecT+SKXks9amOah7vANtAitFQf/dUB8GyHFJp3v6s81ibvMMHyO9kc4kYGU9pSPVlCmMQrWQGCGTzqGFhn8eseZyP+e0h0SaneNQSaLUnu/s6BaiYh3/JX4Msgr8QGFTBrYTD3woGiHRkdIvIVn3sHTO4OFl0egge/rSkyFYwGlAw0uvUvb5RlKUNqb31uWX4sgi6AadctH82KTF3w82ZCePXmC7hv0Jq7vwWzB0+TG3pyy0o2btcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHDqw6n0Z9X7dke3L1Y3zcw6IOL91thDJG5RBRP44TQ=;
 b=l965Atdx5cjOt5z4AcJsrFwpj5PqiGHEPiasS1f3DlbPfMSXi/uYusz3WLFU2Cqm1WDakOao2fh33sUAf4yt3yxHBFXHARENnwvAkFrhwTwbTGOs4xr2Uz1HSgVkGVCgal6pCAoQ2tpdaDp1u4uwD2Ps1nHTFFLnJVZvQsLrZgE=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by MRWPR02MB12185.eurprd02.prod.outlook.com (2603:10a6:501:80::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Wed, 18 Feb
 2026 02:18:43 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 02:18:43 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Ross Burton
	<ross.burton@arm.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCHv2 5/5] lib/oe/patch: Use git notes to store the
 filenames for the patches
Thread-Topic: [OE-core] [PATCHv2 5/5] lib/oe/patch: Use git notes to store the
 filenames for the patches
Thread-Index: AQHcoA84q9VSypEwWU+mRpu29dbg4bWHkyCw
Date: Wed, 18 Feb 2026 02:18:43 +0000
Message-ID: 
 <DB5PR02MB10213A9566417898F6975549BEF6AA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240219012832.3090768-1-pkj@axis.com>
 <20240219012832.3090768-5-pkj@axis.com>
 <CANNYZj-k6i0nZkSibyU+UX741NAe4j4ue04vjrs5Nnn1t3zEkQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-k6i0nZkSibyU+UX741NAe4j4ue04vjrs5Nnn1t3zEkQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|MRWPR02MB12185:EE_
x-ms-office365-filtering-correlation-id: 1fe9a720-7692-4e73-61dc-08de6e940a1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SnNaTzZUQ0J2RHpQcnNCclA2MzErUVpaMy9OdUd5KzhJRU51azJmNnBkNGRr?=
 =?utf-8?B?amJMN1lBOS9OcHF1Y0NPdGVDZE9zSlN0eHVyQkM1Sis2VDVBZnV3UWYwdFZl?=
 =?utf-8?B?c2NhVXNzN2lUc0ZKdjVzbVV0aDJpRWpEeS9OUXl0eS9JaFV1TFlUb2J1MEdI?=
 =?utf-8?B?ME4xUXJ0Z3dTTkFHclJ3NktjYUlIUEJUamgrN1RRZ25BbEtzdjlGU2E1VEJO?=
 =?utf-8?B?djN5YlBOaUZ4bWUrb0VnVklYcmMrcDVYWGF1b2d4NHhVN2k1MHkvR2dzY24v?=
 =?utf-8?B?ZE1yMlhYNlV5WkJvekRQenZOb1U4THZldENmRzFNbWdoWjdhU0V5eHlrZzhM?=
 =?utf-8?B?eTF5ZG9Bd3VraFU4R1VmeXNBa3ZjWkwrdWdTU1F2cm9wdW1ORXNIQy9oN3U3?=
 =?utf-8?B?OER6TlRydWtDRnNtZFlzRytVc1RkSUFJQmpCVHFzVVdaQTlFOHRwK1BnajJX?=
 =?utf-8?B?YnNCZE9lbCtuS3hOeGRnbnR5aGhrNGlLNDdUVTZiVXM0MXQxdjZid1ZHQ2VW?=
 =?utf-8?B?d3BpRlNOZkpGcDVOTnArNHZLckpEZzJJbmVLcG1VUjFON3BMR2xVOHBWVTNN?=
 =?utf-8?B?bFM5TnpHSmlJOTlmNDEwcTYzUXY4ekdUUXBYOVZVdFdIV0x0bnl0MDcxais3?=
 =?utf-8?B?MWZnOEtMTlNYanhMWUEvNlFpS1p4TDJvUUZJcmRseWpnWk1xeEdwN3pkQmZ4?=
 =?utf-8?B?S3FlMHpDYTFodjg5NDJRUWVoLzB5bmUyTTZ5RTUxNEVNUytGQTZjR2k0dGlv?=
 =?utf-8?B?aUo2ZEV3STVXVExZbXRER3ROaVJnajZadVZUUlBRU3IyQUw4c24vZ3ExU0NN?=
 =?utf-8?B?QTVhcCs2K1ZlQW1NZ0wzTWdBenlrWXBENFl1Yys3RWpWUDBaKzhTeUUyNGpN?=
 =?utf-8?B?Nk12RU1Pb1IvNU9XYnFkOW1LVjI5NW12TTluWGMyRFBGaVRRY1pXU1Y1UmQ3?=
 =?utf-8?B?WS9mVThobEpTcTN0SjhlOHFPK0hnN3MyZGJIZWpKOTBqUUlGdGpNYU83TGU3?=
 =?utf-8?B?b1BrMm5sZzc1Qm9nWTErUkt3c09USkFyamdyM2pXeEh5K09CUUg5ZnBtNS9q?=
 =?utf-8?B?bXRCN2xsK0JuYlhyRkI2d2ErQ010Sm4wUVRNbWFvcHprVm9aZWtvdGs0b0xI?=
 =?utf-8?B?UDRhaXVEcTYrYnE5dzBWUk5nOWdMN0RBdkpKWUx4cHNEWmdkWXhtZ29YRGRC?=
 =?utf-8?B?VUl5UXhZNjRYUzVqZ0VxaXIvY0pBNnB1T1hmV3JmRmFwRnorY2pvUXRMYklR?=
 =?utf-8?B?TFBLMnlqazlPQXB1TkJOZjJCek5wTE80aW0rNXhVSmp5Q1EyUngzUU9CdDNT?=
 =?utf-8?B?MGJyZ2Z4WXJURlhBUTlrTXQxNk4wWVJrbTBZb1M0N2grTVFjbW04Znp0MTd1?=
 =?utf-8?B?U0lkQWN2bk9ydjU4RTAxa25ITFh4K2FkcEV4dHkvUlFYZDJUVjhXd0diUkNP?=
 =?utf-8?B?Z09ERlA1OFkzeEhwVUZ4dndKbFJwd3VYY3F5Z2tWTURYK1JHOGtRSVlSUTdB?=
 =?utf-8?B?R0d4MzMyL0pUZUhWZ0E2YXMwRkZlNWY3dGJldXUzR2xTSHFnenRQMDZuRkVG?=
 =?utf-8?B?c1RaSkRnNXhQYnNsWkFZQ1VBeGtkQXRBa2ZuTlFUT2t3Q1ZBdlBXWVlGZnBk?=
 =?utf-8?B?U1hKazRlNXprUldTOStJTDBqUTA3TDQvUEkwS2tvNURwYXZDZFFJUnpNajI0?=
 =?utf-8?B?ZmI4QW4xMDcrUkdhWTFKdENaa0FqamU1U2I4Zkt4VjFDV09vS3J0aE9Yd3Zx?=
 =?utf-8?B?NmFFeDU1YWJFQW9Kdzl1NFZSc01qSG52UldnMWhvU2xyUk9sQVlUWnVBQjBy?=
 =?utf-8?B?ZlpneklwYWowL3Y1cTdPQWVaNzkyN3U5N2dMSVQ5QmtyaU9ZMlArRFhWdzZU?=
 =?utf-8?B?bmxXTDNUbGl4RDREQVJGL3pWUGlwaXlGRlVHMkZ5eE52Ryt6WlgrWGVyeTdQ?=
 =?utf-8?B?b1M2L2JKNk8xNzJzOE84bXAvRGdOeHJDRUQ0a0dXMVVQTURTU0tnY1J4Qk9t?=
 =?utf-8?B?VXdTZTdpSUlrZ1NYM0E3L0ovZExtZkdGK3UwcTYyUE0yaExhdGpQV242d3ZN?=
 =?utf-8?B?MXRydFlpbWFmQUhQYUsvNDJTUlltMWMrVC9scmNVUEFITnpDdzQrVXg2bXlv?=
 =?utf-8?Q?625LXFfQ+61OWYJqNNPvFOsSJ?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ck5zcHhlazdCMDhYQml6VjBNMnpuQnN5SGwrdldiWVBsMVNCaFdPd2Z4TmU4?=
 =?utf-8?B?K25rVW5CNHlFRERlK3k1c0pCRUdiT1BYR0NZTkFiemhDWTFZREJtRnh4MC9W?=
 =?utf-8?B?YXNWMVZCSEtPVUdUWVBqdmFDbW1yNDBSWTJvM1BsYUV2M3dCUjh5c3ZnUHFk?=
 =?utf-8?B?bUxtaFJpSWtkU1A3M3pZRnZuc3luYU1lU0Y2QnZNV1ZCWDZjc0dneVhxMXZ2?=
 =?utf-8?B?dkJiQldZWDVkZzc3b2k1eVh4MGhmQWhPRzhmNm1idk1GVC9TZVk0dkN6dCtS?=
 =?utf-8?B?NFFSOEpWNTZWN2ZJbkJMSnphdlNhQkNmcXVYSG0ySVdKUVlHWTlTd2c3V2k3?=
 =?utf-8?B?QU9XVzQrZWNFeEhJWktFOTgxc25ZYTJTTnZVdFU3aXVYWjVxaEhBcUJkRDBO?=
 =?utf-8?B?WFNXbEtkSklGb1lkMVlSajdwOEZzUVJNbW1DVE9lejNqOXpGS0U3OFdKT0Vp?=
 =?utf-8?B?TXI5OTdXT3hkTk9NMVZaZVlRZmhoRzlZQm5jVEdHTFQzbDFxNVEyb3FyWmxl?=
 =?utf-8?B?V3B6YzB0NjdOeHdiektOS01zcVcrTElrT0pMcWUrVlkyWlJxUUM2WWhXOTJO?=
 =?utf-8?B?VzBEWVIranFLa0UrN0pUT2VvaGZCa2dlbWdmVVpJMGZYSTVRc25FWk15Y3pW?=
 =?utf-8?B?T1YwNUFyREMvcWhDVUl4ckROejRSWW5vNkxSNlBZWnJwRFdOMVo4TE9zT1dV?=
 =?utf-8?B?MWlhY3RLdFVmblpacEhVVFpUdVFoZk1zTFRYeFJrd1ozR0FrbVlNY3dlMWJz?=
 =?utf-8?B?ZjZZdjZaNjZVbEtKRlc2WUZOQ1NkS0dGS3F2R1B6NDIzTjZmSUJZanU4N0pq?=
 =?utf-8?B?T0ZNRk5MQUZ3Qlk5TUtlMldQMi83MVZqSmhQcUcwUjIvSXlXN1E3UFhYK3hO?=
 =?utf-8?B?MlBNSTRkRlNjdGZhSGlUTW5Td0NlUlNjcmdMZnBNOXkvb1o5b2twcG9qQVhx?=
 =?utf-8?B?elVJTFhvSXk2QjI1MlZOOUg3MzBlcllzcy85QmNwQzVrcFdDYm40dnhiUjRE?=
 =?utf-8?B?NGNoSjRFTEltTjJCRU50c2ZyTlkxRmdwa2tqOWhGU0ZhNTNUY2p2a1NpT2kv?=
 =?utf-8?B?MXd6azJBVzNMclM3OXdqWUYyNlg5QzRxU2d0NDFONlovOG84dUh1RXBrc2NQ?=
 =?utf-8?B?VUZmRENDU29RU2NEclZzTStGK0UycCtZSm5zRk5jUzJ3a0dadzhZcy9EYkxP?=
 =?utf-8?B?ejhXakkwTk44Z3pkV2ZtZVBTQ28vN2xXZDJmejVUZzBaYU9QMDVkdi9KTFZV?=
 =?utf-8?B?YTdORlg2enJvQklvYWhMUUwrR1p6Wm5XcUYrRnB2b0hKdVlBTlJJU3FIMEQ1?=
 =?utf-8?B?THp4aG5GUzY4MnpuMlFDT2c5S0pJblRwdVFjSWZEMEZ2aTZzL3RuM1MrTExW?=
 =?utf-8?B?STV6OHY0TlR1a2xvU2x0SmR6andRM3d0WlZzYlZZMlBCOUpBeVpQVGtwb09H?=
 =?utf-8?B?ZXJRTzBpOUVQVk5UTmZBT0l2QmUwTzRzUGxRU3JrVDJOZG5XUUFCUlFRQWpx?=
 =?utf-8?B?Y3cxK1luVExTVGFDaHROUUdvaEk1OHk4THdmTlNQaVE4M2NBT3FWdVJnaEk2?=
 =?utf-8?B?aE9MUVV2NmZ5c1hVN0VHeTJQcUppeEZUZzNPcWtHUzJ6VmpWdS9VK3I5UzJx?=
 =?utf-8?B?ekdaaXQ3dzNoOXZsdmdHSzdHb0Y2NHdZTnhMYm5uSmhQWGliNm84eUVRNC9M?=
 =?utf-8?B?UFRvc3NPMjNiTlBvc1hJUVVzaHdDWllBY0dHeWxPb2dJMlVES2ZVL3lldnNv?=
 =?utf-8?B?SGY5NGlIMUZhN2poYTdubk5STTdNVTFQZmdJd08rQnQreFVWZFZSTjNBNURR?=
 =?utf-8?B?aStvUEVvM0p5NFB2c2tTTE02dThFS3g5UENpNWZaZjY0L0U5MHNMQWppajAy?=
 =?utf-8?B?YmVYbjJtZEptLzVTOSswVGkxV2JrSEJya0tDOWsrWUZNdnVCUDBLL0V1bHEv?=
 =?utf-8?B?VUZMa1pxRUpzd1piQUROaG9OK0Fjam9ITEdGUm81Sktjdlo5V3gyRUtxdENS?=
 =?utf-8?B?U2RyWlc5RUdLTnc3bUQ0YjFoa0c1NDUyZlhBd2JHTkl0aHlwL2tQK3Y1TEZB?=
 =?utf-8?B?cm1VdDk2cWJ1NUhkV0FjV0RDNFlINmk5VkhrY2dDczllSSsyTnVxdVBmZzFW?=
 =?utf-8?B?VVMwZmRkTmdNTkpFZG9wYlpZeC8xWXZLSW5iZFVtRDRGSDhmRk1tbHpHeWRH?=
 =?utf-8?B?Z0lFcWhLd3licFUrNGpZWWZQSCs5ZDQ3NmFKVUcxcko3UjBORXcwV3ZTMWdR?=
 =?utf-8?Q?woJ72u+PE6/c1Pnn6rboVIPkDjkclchALI5QVp4xrM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe9a720-7692-4e73-61dc-08de6e940a1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 02:18:43.6875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uOAlmrLnUkAlTi4lFggiXMQcf8zUsjZwx5CSS8Tlx9LTpw8QQ4mJ9d/Qt2kKONM6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR02MB12185
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 02:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231281

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogZGVuIDE3IGZlYnJ1YXJpIDIwMjYgMTQ6
MTQNCj4gVG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29t
Pg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgUm9zcyBC
dXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+OyBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJk
aWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0h2
MiA1LzVdIGxpYi9vZS9wYXRjaDogVXNlIGdpdCBub3RlcyB0byBzdG9yZSB0aGUgZmlsZW5hbWVz
IGZvciB0aGUgcGF0Y2hlcw0KPiANCj4gT24gTW9uLCAxOSBGZWIgMjAyNCBhdCAwMjoyOCwgUGV0
ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+IHdyb3RlOg0KPiA+
ICsgICAgICAgICAgICB0YXJnZXRfYnJhbmNoID0gcmV2c1tvcy5wYXRoLnJlbHBhdGgocGF0aCwg
c3JjdHJlZSldDQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAjIFRoZXJlIGlzIGEgYnVnIChvciBm
ZWF0dXJlPykgaW4gZ2l0IHJlYmFzZSB3aGVyZSBpZiBhIGNvbW1pdCB3aXRoDQo+ID4gKyAgICAg
ICAgICAgICMgYSBub3RlIGlzIGZ1bGx5IHJlYmFzZWQgYXdheSBieSBiZWluZyBwYXJ0IG9mIGFu
IG9sZCBjb21taXQsIHRoZQ0KPiA+ICsgICAgICAgICAgICAjIG5vdGUgaXMgc3RpbGwgYXR0YWNo
ZWQgdG8gdGhlIG9sZCBjb21taXQuIEF2b2lkIHRoaXMgYnkgbWFraW5nDQo+ID4gKyAgICAgICAg
ICAgICMgc3VyZSBhbGwgb2xkIGRldnRvb2wgcmVsYXRlZCBjb21taXRzIGhhdmUgYSBub3RlIGF0
dGFjaGVkIHRvIHRoZW0NCj4gPiArICAgICAgICAgICAgIyAodGhpcyBhc3N1bWVzIGdpdCBjb25m
aWcgbm90ZXMucmV3cml0ZU1vZGUgaXMgc2V0IHRvIGlnbm9yZSkuDQo+ID4gKyAgICAgICAgICAg
IChzdGRvdXQsIF8pID0gX19ydW4oJ2dpdCByZXYtbGlzdCBkZXZ0b29sLWJhc2UuLiVzJyAlIHRh
cmdldF9icmFuY2gpDQo+ID4gKyAgICAgICAgICAgIGZvciByZXYgaW4gc3Rkb3V0LnNwbGl0bGlu
ZXMoKToNCj4gPiArICAgICAgICAgICAgICAgIGlmIG5vdCBvZS5wYXRjaC5HaXRBcHBseVRyZWUu
Z2V0Tm90ZXMocGF0aCwgcmV2KToNCj4gPiArICAgICAgICAgICAgICAgICAgICBvZS5wYXRjaC5H
aXRBcHBseVRyZWUuYWRkTm90ZShwYXRoLCByZXYsICJkdW1teSIpDQo+ID4gKw0KPiANCj4gSSd2
ZSBiZWVuIHdvbmRlcmluZyB3aHkgZGV2dG9vbCB2ZXJzaW9uIHVwZ3JhZGVzIGluIHJlY2lwZXMg
dGhhdCBmZXRjaA0KPiBmcm9tIGdpdCBhcmUgdGFraW5nIHNpZ25pZmljYW50bHkgbG9uZ2VyIHRo
YW4gdGhleSB1c2VkIHRvLCBhbmQgdGhpcw0KPiBsb29wIGlzIGJhc2ljYWxseSB0aGUgcmVhc29u
LiBJdCBhdHRhY2hlcyBhIG5vdGUgdG8gZXZlcnkgY29tbWl0DQo+IGJldHdlZW4gdGhlIG9sZCBh
bmQgdGhlIG5ldyB2ZXJzaW9uIHRhZyBpbiB0aGUgdXBzdHJlYW0gdHJlZSwgYW5kIGlmDQo+IHRo
ZXJlJ3MgbWFueSBzdWNoIGNvbW1pdHMsIGl0IGNhbiB0YWtlIG1pbnV0ZXMsIG9yIGhvdXJzLiBU
aGluZ3MgY2FtZQ0KPiB0byBhIGhlYWQgaW4gdGhlIG1vc3QgcmVjZW50IEFVSCBydW4sIHdoaWNo
IGhhZCB0cmllZCB0byB1cGRhdGUNCj4gYmludXRpbHMsIGFuZCB3YXMgc3RvcHBlZCBvbiB0aW1l
b3V0IGFmdGVyIHNvbWUgNSBob3VycyBvciBzbzoNCj4gDQo+IElORk86IGJpbnV0aWxzLXRlc3Rz
dWl0ZSxiaW51dGlscy1jcm9zcy14ODZfNjQsYmludXRpbHMtY3Jvc3NzZGsteDg2XzY0LXBva3lz
ZGstbGludXgsYmludXRpbHMtY3Jvc3MtY2FuYWRpYW4teDg2LTY0LGJpbnV0aWxzOg0KPiBSdW5u
aW5nICdkZXZ0b29sIHVwZ3JhZGUnIC4uLg0KPiBjb21tYW5kIHRpbWVkIG91dDogMTYyMDAgc2Vj
b25kcyB3aXRob3V0IG91dHB1dCBydW5uaW5nDQo+IFtiJy9zcnYvcG9reWJ1aWxkL3lvY3RvLXdv
cmtlci9hdWgveW9jdG8tYXV0b2J1aWxkZXItaGVscGVyL3NjcmlwdHMvcnVuLWNvbmZpZycsDQo+
IGInYXVoJywgYicvc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvYXVoL2J1aWxkL2J1aWxkJywg
YidtYXN0ZXInLA0KPiBiJ3NzaDovL2dpdEBwdXNoLnlvY3RvcHJvamVjdC5vcmcvcG9reScsIGIn
LS1zc3RhdGVwcmVmaXgnLCBiJycsDQo+IGInLS1idWlsZGFwcHNyY3JldicsIGInJywgYictLXB1
Ymxpc2gtZGlyJywgYicnLCBiJy0tYnVpbGQtdHlwZScsDQo+IGIncXVpY2snLCBiJy0td29ya2Vy
bmFtZScsIGInYWxtYTgtdmstMicsIGInLS1idWlsZC11cmwnLA0KPiBiJ2h0dHBzOi8vYXV0b2J1
aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzM4L2J1aWxkcy81NCcs
DQo+IGInLS1yZXN1bHRzLWRpcicsDQo+IGInL3Nydi9hdXRvYnVpbGRlci92YWxreXJpZS55b2N0
by5pby9wdWIvbm9uLXJlbGVhc2UvMjAyNjAyMTUtMzAvdGVzdHJlc3VsdHMnLA0KPiBiJy0tcXVp
ZXRsb2dnaW5nJywgYictLXN0ZXBuYW1lJywgYidjbWRzJywgYictLXBoYXNlJywgYicyJ10sDQo+
IGF0dGVtcHRpbmcgdG8ga2lsbA0KPiBwcm9jZXNzIGtpbGxlZCBieSBzaWduYWwgOQ0KPiANCj4g
SSdtIG5vdCBleGFjdGx5IHN1cmUgd2hhdCBpc3N1ZSBpcyBiZWluZyBhdm9pZGVkIGhlcmUsIGJ1
dCB3ZSBjYW4ndCBkbw0KPiBpdCBsaWtlIHRoYXQuIEknbSBnb2luZyB0byB0cnkgYW5kIGRyb3Ag
dGhpcyBjb2RlIGFuZCBzZWUgd2hhdCBicmVha3MNCj4gaW4gJ29lLXNlbGZ0ZXN0IC1yIGRldnRv
b2wnLCBidXQgaWYgeW91IGNhbiBoZWxwIG91dCBhbmQgY29tZSB1cCB3aXRoDQo+IHRoZSByaWdo
dCBmaXgsIHRoYXQgd291bGQgYmUgdmVyeSB3ZWxjb21lLg0KPiANCj4gUmVwcm9kdWNlciBpbiBv
ZS1jb3JlIG1hc3RlcjoNCj4gZGV2dG9vbCB1cGdyYWRlIHN5c3RlbWQtc3lzdGVtY3RsLW5hdGl2
ZSAtViAyNTkuMSAtUyA2YTM2ZjFjNzQyMGRjYjhlNTE3Njc5NjY3NjA0N2YwNTg0NjZmZTdhDQo+
IA0KPiBBbGV4DQoNClRoaXMgd2FzIHR3byB5ZWFycyBhZ28sIHNvIHVuZm9ydHVuYXRlbHkgSSBk
byBub3QgcmVtZW1iZXIgdGhlIGV4YWN0IA0KY2lyY3Vtc3RhbmNlcy4gSSBoYXZlIHRyaWVkIHRv
IHJlY3JlYXRlIHRoZSBwcm9ibGVtIGJhc2VkIG9uIHRoZSBjb21tZW50IA0KaW4gdGhlIGNvZGUg
YWJvdmUsIGJ1dCBJIGhhdmUgbm90IGJlZW4gYWJsZSB0byBkbyBpdC4gVGhpcyBtYXkgYmUgZHVl
IHRvIA0KdGhlIHZlcnNpb24gb2YgR2l0IHRoYXQgSSBhbSB1c2luZyBub3csIGNvbXBhcmVkIHRv
IHdoYXQgSSBoYWQgdHdvIHllYXJzIA0KYWdvLiBIb3dldmVyLCBJIGFsc28gdHJpZWQgaXQgb24g
bXkgb2xkIGNvbXB1dGVyIHRoYXQgSSB1c2VkIHdoZW4gSSBtYWRlIA0KdGhlIGNoYW5nZSBhYm92
ZSwgYW5kIHdoaWNoIEkgYmVsaWV2ZSBzdGlsbCBoYXMgdGhlIHNhbWUgdmVyc2lvbiBvZiBHaXQg
DQphcyBpdCBkaWQgYmFjayB0aGVuLiBVbmZvcnR1bmF0ZWx5LCBJIHN0aWxsIHdhcyBub3QgYWJs
ZSB0byByZXByb2R1Y2UgDQp0aGUgcHJvYmxlbS4gOiggU28gZWl0aGVyIEkgc3VjayBhdCB3cml0
aW5nIGNvbW1lbnRzIGRlc2NyaWJpbmcgcHJvYmxlbXMsIA0Kb3IgSSBzdWNrIGF0IHVuZGVyc3Rh
bmRpbmcgdGhlbSBsYXRlci4uLg0KDQpJIGFsc28gdHJpZWQgdG8gZmlndXJlIG91dCB3aGF0IChi
YWQpIGNvbnNlcXVlbmNlcyB0aGVyZSB3b3VsZCBiZSBpZiBhIA0Kbm90ZSBpcyBhdHRhY2hlZCB0
byBhbiBvbGQgY29tbWl0IGR1cmluZyB0aGUgcmViYXNlLCBidXQgSSByZWFsbHkgY2FuJ3QgDQpj
b21lIHVwIHdpdGggYW55dGhpbmcuIEF0IHdvcnN0IGl0IHdvdWxkIGJlIGEgbGl0dGxlIGFubm95
aW5nIHdoZW4gZG9pbmcgDQpnaXQgbG9nLiBIb3dldmVyLCBJIGNhbid0IHNlZSB0aGF0IGl0IHdv
dWxkIGFmZmVjdCB0aGUgZnVuY3Rpb25hbGl0eSBvZiANCmRldnRvb2wgaW4gYW55IHdheS4NCg0K
U28gYmFzZWQgb24gdGhlIGFib3ZlLCBpdCBpcyBwcm9iYWJseSBvayB0byByZW1vdmUgdGhlIGNv
ZGUgdGhhdCBzZXRzIA0KYW5kIHJlbW92ZXMgdGhlIGR1bW15IG5vdGVzLg0KDQovL1BldGVyDQoN
Cg==

