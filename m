Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59930CE8D47
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 15:31:55 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.790.1763134307365704347
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Nov 2025 07:31:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=MaLBf18o;
 spf=pass (domain: axis.com, ip: 52.101.70.56, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1+rwttfCCQVF3Upz2AOe8gJZasvH2ALyEMedoHtMJnr8eHVSEmsZkbhiERpJRNWxdCVLs9V3qgQjDAbi3WFN2fdfPDruuI9WuWQLNFa6smo61+dMoF8jk0snS6TGxqtEhB5d0Ri0XTW1Y/Cb1MoPYQZOMugJbYtRe5EnEhX4l/3nI1gtbRNledA4+but5zuQcmGZFaE16T8+NdnpqklteekyYCsyZh2BgX1BDn6lEMB3i5NxxGtCVO0Ykx38CQMqkT2VikdL90v0abA21wraMXAwn58b1TuXfh1s8Wm0POeWIpLOONIV9C0hT57qkB8P7ss15/oYlG+W2QMO98AvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8i/cfJd7ZVFikAfq41Y9mxltxRA5EiQdWfBU2ZjeGU=;
 b=QuTgp8zRp54VKn8X7KaiREMJ0V9RDcUVxoc1FJNVadAJjJAxs9rubztqnzTHWzV8rFwVGWeMiVYd+omouX5eN4H/KXxqF4oPHLR6M8d3/TRmn64u8kkdrBKTPN+u5lpwkv41UvsfoyhTiWf1e7YVoSUGjHtD/xY69TtMXwaImGytAdr06rGOeuuc+eR7v8g7eFDt6qtPl8uhYTXnIbHaUc0r4kPQQsA4B0rHyWEdnqqCjnW04jftXE42xXttCu+N/0GuhLoaZ9y/PFWjpPK25eFZPw6y8wqOFPYZySCR2dmRg+Dqt2ayaPP0O/c1xPRTixL77SHorxZ+A4tvPaCQgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8i/cfJd7ZVFikAfq41Y9mxltxRA5EiQdWfBU2ZjeGU=;
 b=MaLBf18opWQj1+i0XUFImljYd27PvUw2Ynj5UJSVXD5RKP1aUICKXaEcuHUZhq/Z0rq/fnaF8XzCeXfs/143EowjJS9NnKhXqWOWjMENHmT9NtdtzGQ7xd/1c/8FkI/E5BB7hqods8C5CDVIAJ6y5n621STl1OfIZGoR2rEsC7E=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PA1PR02MB11569.eurprd02.prod.outlook.com (2603:10a6:102:554::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 15:31:43 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 15:31:43 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: RE: [OE-core] [PATCH] terminal: Show a warning when launched terminal
 quickly exits
Thread-Topic: [OE-core] [PATCH] terminal: Show a warning when launched
 terminal quickly exits
Thread-Index: AQHcVWrQuUw0WMDgCkq2iZt3UO2Gq7TyS7Iw
Date: Fri, 14 Nov 2025 15:31:43 +0000
Message-ID: 
 <DB5PR02MB10213A5531507F123469BD174EFCAA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: 
 <20251114-mathieu-too_quick_devshell-v1-1-02b6c6ed9ed6@bootlin.com>
In-Reply-To: 
 <20251114-mathieu-too_quick_devshell-v1-1-02b6c6ed9ed6@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA1PR02MB11569:EE_
x-ms-office365-filtering-correlation-id: 037a5ff6-6de4-495f-3282-08de2392ea0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?endLSFBmTTVSWDBsRURjUE9KSEVoMDZtL0NKMjFjVG9XMWRveVgrVHBIK2Nm?=
 =?utf-8?B?d0M3V2lvTWZZalpUUzJoelZmMXRhZ2V4NTg4VVo4RGNzdkoxcGR2RTdFOXRy?=
 =?utf-8?B?cWlyeFRCbFJETE5OM2pzTjFBZUFxWktFczB0NE1MZlBaVDJlYkJiNnFjTVFK?=
 =?utf-8?B?d2ZHK1B6YTBCQ3BGWUNRWlVuQVdQYks1bEx6cURlL2xIK05iVTltUjRwUklX?=
 =?utf-8?B?ZVZ1UG1WSGliSnk1cU5vRDFXaFBHV0lKbHJzZmtJRjQ4cEdTSlRzSVZ3eXUv?=
 =?utf-8?B?a2dQS3Z1REpZdHlTMzBnUUh4NG92dGJrMzZZWjlrTjROd25LdGlrclY3eWNs?=
 =?utf-8?B?TUhjTW5wN0hVY2xJU2k3WVRXanl3ZURkNTdwN2dDaXhWQmxuZXdOUS91T1g5?=
 =?utf-8?B?N2VpazVHeURqOHhyTmlOYXNSdHJ1UjRla2FESW1ESmtzeFhSelRPN1Fvb0E4?=
 =?utf-8?B?U01jUG1VVkFha3ZDOTVvN0gvQms2cHVyemE3NW9ZSWR0cE4xQm1zbzJjVHJx?=
 =?utf-8?B?VG1XR3g4eCtEVVBKcFNBeUt2Ui9VdFFJRUFvZHdKT2lmRXRodGxzYW9DbkVk?=
 =?utf-8?B?SGlQazlnZ0tSL2lublRUa1JlcDBKQ3VCQ3RwUDJQTk1wNWE0aTAyQUtzczdC?=
 =?utf-8?B?bXJaYm9xN0NUcGZlMjBzRWd4ZUMzN09Zdm9ESFR5ZWFFU3hYMDZ4UnFVTVpF?=
 =?utf-8?B?RVFiMHdPeXVyVEZ3THVwMmpxRDhjR25LYklBUzlUNzZiWGMySk1RZ3pBREN6?=
 =?utf-8?B?bzFwdjA5cHBLMU4vTmsrYUsvY29NTzB6YjNwK3hoTGxpVXljY1V6MzgwQjZT?=
 =?utf-8?B?UXpzNHI2REhlRG1xZWpidmhGTUdCaEFzS3lZMWt3emxCWFVyNXB6L2QwbTN0?=
 =?utf-8?B?NW9EaE9KNVoyaDFsUnFHSFJVQzZuSE92cTlSTERkNGhoZGd6Nk9TWlhuTG1G?=
 =?utf-8?B?clBNV3JNRkRkOTl4UzRWMWladzdITkh5Z2VZcStiUnVXT3JMMkx6b0NMSXQ0?=
 =?utf-8?B?SGpJSTJ5K0xtYVJ5cGk4TFVGOUtRQktMVjdBTzRyWEptOTVQMVZVZGtpSEky?=
 =?utf-8?B?bjhaZVBuS3RiSGpsM3JUQmRxV3FGSHNSZ1dGaktCTEVnS2xhKy9aeWZ0Q2R6?=
 =?utf-8?B?ZVorMlQvZHdsTUdHT1BTOGczYnkxL0UwMlNXQXVkQ3dBR0E3ZUJEZU13SnFt?=
 =?utf-8?B?Y1lsSUxEQTBqNVMrL29peDFiTU5sSklxdWh2dmZFMFl1NXdwblQ5djEvZUpu?=
 =?utf-8?B?NnJBWmtyWXF0Zys0Zk92cjh2MWtwa1Z1VFcvVnBOdFpzMzZuaXBabTVlRE1w?=
 =?utf-8?B?VTlEdDZ1NTFYWDlRa3k4MHhJZ0VvQUxSVzl5S0tXRk5PZ29ob05KZVdFeUV6?=
 =?utf-8?B?QW9idDFLYkI5blZVeE1pSTUxWGVTaTd5UVhNYVVBMmluR2VyWG5CdWVnTmRa?=
 =?utf-8?B?ZUo5VmdxcGM0M0JqcEFMeVhMbk9MZHRreUpid3RkMlUwdVBSVlp2OFRFcDNh?=
 =?utf-8?B?cGJmbllTRFBjZ2lLRmRKV2JpWFJhb2J6elZvUitwWm9xUkZhcTVleld2bWpq?=
 =?utf-8?B?RHhRUVRZSjFMMlViOXVRUWlJK3NPSkJ1b1pZMng5SGV0c2FFcU9NdFUvenBt?=
 =?utf-8?B?azI2bXMzR05Ga1lGY2xXcXZKdzQ4WEVpamhJVEV1NkdwZFcyRG1RQjZnTXN2?=
 =?utf-8?B?eXFFSmhiMmk5MGxUWXpRTG5qQ2g4cklnMkNpcXh3NGhJRlQzWjRsdGhCakhw?=
 =?utf-8?B?U3BHYlZ2OExXOXZhL3RwRHJySXo2YUFYT2QxWUs5cHhsL1NYZUYyVVpyazhj?=
 =?utf-8?B?ek1DMEpPc09oazUyN00rTUQ0aWs4akxXVTVnK0k5d01vcmNYWEZGQ2J4UEFV?=
 =?utf-8?B?R0szUmY5OW92YVNsb0NxNGRFZHRxYkNIbnRwZXFGelZGMGFzUFQzMk5IU3A5?=
 =?utf-8?B?Z01qM1BZaVdHM0l0TW9WMytxRXowNWpNRm9hMFhvSkJDWXJQanRBZ2FqOGxz?=
 =?utf-8?B?MzVyRGN2bGxIc2RXRGk4Q2I1Q0xSUmVHZitDa1FjQnVKWCs4ZVZMMDV1Unh6?=
 =?utf-8?Q?D3HNJz?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NE1rWnFuVDhOSGNkMytsUSt0bmhmSTNvUG16eStnSHh4TnlMVFpqUUR6NzBX?=
 =?utf-8?B?NFNuUkFYYThORjE4OEN3c0tranQwSjkwMTdKcXhkelM5ZXhwQzFWVnRIRFBh?=
 =?utf-8?B?OTVPSWFZTUdSN2R0bHRYVWhrZWpTRXpkaWM3WUcwN3kxWGh2UEVUT0g3QjN4?=
 =?utf-8?B?L1VxenZTWkRLR1dlYXFQN2xFUm0zRENqL3hwYWFCdWVDT3IxanRMZSt3bDBY?=
 =?utf-8?B?RDZsemxZV255ZC9tQzJVMis1M2dlQnpSSXIyS0lnejg5RTMvZnFPOXc2UkRj?=
 =?utf-8?B?TCtkeVg4TXNOM3Z0cS9wYzR5b3ZqWnR6akFyc2ZrWi8vSXBYZkY3WHdDaDJz?=
 =?utf-8?B?cUtyRE82cGNrRW9Ta2FXMTJTbFQ4WTBQRHlzK1Rzdm5DZktIc0ZheE91WFdk?=
 =?utf-8?B?cjl6WklRc2VpMkYyNlJxQTJTYzNzVU1la3hPU3BtQ0U3ejdNMk5GRGtFYVlq?=
 =?utf-8?B?VDB2RGVKejVCWGpHMTd0NXFXZ29Bb21LcklJOTJ0S0g0Wk5qcS9BRHZPRUdX?=
 =?utf-8?B?SkE0VlRUNExFV3kzMUhFQ05lQnNPV0xkSUJsN2lpUVd4QkUzZWZqaTZqY2tx?=
 =?utf-8?B?UEFmelN0bHZEb0U0Z2R5Ymhsd0V6TnJuOW5MMFJVUE56Y0JFaHVRZjVYeXpn?=
 =?utf-8?B?L09PazcxZm9jdExLZ0NSMCtOOU9xcXFvdit1dU1zbFh3UlFRQzh4eTRPeStl?=
 =?utf-8?B?NUVpR3JpaHFvSCs3eklGZ1ZJT2pBUnpYVGZpd1BZRjA1WHdDYUV4WG9kNFRW?=
 =?utf-8?B?OHpMMDZTYURWczB1SGwyYWQ4MHZCRE91MW9LY2lDRnZKWVg4T3ZxN0RHTG00?=
 =?utf-8?B?dGN1YUFoVmszZzhLN2tiU3BNY2pQeFhNSFN2M3hPdGI2WUNRaHkyRU5OenJx?=
 =?utf-8?B?QldyNFlJWUxnaGlkQXFEa2NsRzJETmYxbVJLeHEwUkU2UzFiTmc3UG9nRWlJ?=
 =?utf-8?B?bGFzMVd5UnVjZzRZdWFwYlF4NlA2eFRTU2lGS2prY0lCWXUzRk8wd0FSVE9y?=
 =?utf-8?B?R2xoM2tWOGpSeitCVXQ0WnNiMThlbE5wa1lqNmkyOTZFS0lnVGpJaTZJT0x4?=
 =?utf-8?B?QTlMaDg1dHN3dnBQRisyd1JFT2FXcUhjQmg1NHZoQ2V6aUhQaUp6bExSY3cv?=
 =?utf-8?B?T2wzcXB5dUFvbkxkZGNaSkhVTUM3SDFZWG9yZ01Zd2FsdTl6WkV6ZXZrWTEz?=
 =?utf-8?B?ZTdXclhWMFZmSFY2bFlwT05YU2tFNHVyN2N3M3dkOWxmc0FqcjV2VUNnTkNV?=
 =?utf-8?B?cThxZjJLWW12Z1dVTU5JazcwbXhva2Jid0lkaWhtbGVZczRzOG9QL2xtakxL?=
 =?utf-8?B?aEVWSXJrbXdodmVmUlRMVjdWdWtqNUR0RTJsQWQ5dFFYWk5VamcyR1FjdEh0?=
 =?utf-8?B?Tzc5UTF3cHhFSmt5cktid2g1cTh6by9PSGorNGFDOGpnY292aVpiN2ZDcUhx?=
 =?utf-8?B?V1A4Rnp6alpVcmlva1FpVDZLQXduQ2xvYk9iWjFaZjB3czNBUE1WREVQaVh6?=
 =?utf-8?B?cFNoME9GMFBvbXl4ZTJzN2JUZXNIUFNCY3l3d0cvckZ6bVZva1FOOSt6UjZT?=
 =?utf-8?B?cWlldUZRbVJoV0hNUittajFiMks2OXA3Y1JwZWlzZGlXVVZpSjRvc3gyOGps?=
 =?utf-8?B?ZUFnVDI4V1ZCbmh3eHpIQ2VjQVlwUVV5QlFibGtaQjlzTFZOU09VNWk1ditV?=
 =?utf-8?B?VW9ndlZuSklkQUpjblA1eUltSk8yWmtDQjlkOC8yNWVTK1FsaElvYkNyT1FH?=
 =?utf-8?B?M2RMN05WcG4xWk4yVUpwdGwxSDl4cDFqZmdYemVlS0xEbG9qc2h6VGxOcDVJ?=
 =?utf-8?B?K0RocVk1ZG9PR1lUQVl2UkQ1Z0tBMkVINjRuNnQ3cUYvZm0vWk9FNUI0TUFx?=
 =?utf-8?B?MktjN0RLUFlVaTRMV1VoaEVuUUpsdHVRVFdFM1lveU9meGlxc21YdDNqbTRB?=
 =?utf-8?B?S2hxT1VaVmg0WVArS0JTWWRkOHhXTjZxVW1Zd0luV3VpYmNtWFYxZGtoUU9j?=
 =?utf-8?B?Z0JiY3hoYUQxZ2F2TFRXcDc2enlaTlRPV21ma1lKZG9VRkxkT0FKWC9BTjhD?=
 =?utf-8?B?cWJrZnpOV3BUQ0hoTWs3VEhYZGNpV2dQR2crUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 037a5ff6-6de4-495f-3282-08de2392ea0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 15:31:43.1707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7J5wgyakEEULIs0K5tKV0FXi/Hb69ajjGigrbeBp7n82O5xKSmOh1xFnXzxdz8A4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR02MB11569
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 15:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226298

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgTWF0aGlldSBEdWJvaXMtQnJpYW5kIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFNlbnQ6IGRlbiAxNCBub3ZlbWJlciAyMDI1IDE0OjMwDQo+IFRvOiBv
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiBUaG9tYXMgUGV0
YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPjsgTWF0aGlldSBEdWJvaXMtQnJp
YW5kIDxtYXRoaWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+DQo+IFN1YmplY3Q6IFtPRS1j
b3JlXSBbUEFUQ0hdIHRlcm1pbmFsOiBTaG93IGEgd2FybmluZyB3aGVuIGxhdW5jaGVkIHRlcm1p
bmFsIHF1aWNrbHkgZXhpdHMNCj4gDQo+IFRlcm1pbmFscyBxdWl0dGluZyBpbiBsZXNzIHRoYW4g
b25lIHNlY29uZCBhcmUgbGlrZWx5IHRoZSByZXN1bHQgb2YgYQ0KPiBmYWlsdXJlIHRvIGV4ZWN1
dGUgdGhlIGxhdW5jaGVkIGNvbW1hbmQ6IHNob3cgYSB3YXJuaW5nIGluY2x1ZGluZyB0aGUNCj4g
Y29tbWFuZCB0aGF0IHdhcyBsYXVuY2hlZCwgc28gdGhlIHVzZXIgY2FuIHRyeSB0byBkZWJ1ZyB0
aGlzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWF0aGlldSBEdWJvaXMtQnJpYW5kIDxtYXRoaWV1
LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+DQo+IC0tLQ0KPiBJIHJlY2VudGx5IGhhZCBpc3N1
ZXMgbGF1bmNoaW5nIGRldnNoZWxsIGJlY2F1c2Ugb2Ygc29tZSBlbnZpcm9ubWVudA0KPiB2YXJp
YWJsZXMgY29udGFpbmluZyB1bnN1cHBvcnRlZCBjaGFycy4gV2hpbGUgbXkgc3BlY2lmaWMgaXNz
dWUgcHJvYmFibHkNCj4gaGFzIHRvIGJlIGZpeGVkIG9uIHRoZSBiaXRiYWtlIHNpZGUgWzFdLCBp
dCB3YXMgYSBiaXQgdHJpY2t5IHRvDQo+IHVuZGVyc3RhbmQgYmVjYXVzZSBubyBlcnJvciB3YXMg
c2hvd24gYW5kIHRoZSBmYWlsIHdhcyBzbyBxdWljayB0aGF0IEkNCj4gd2FzIG5ldmVyIGFibGUg
dG8gc2VlIGFueSB0ZXJtaW5hbCB3aW5kb3cgcG9wcGluZy4NCj4gDQo+IEFkZGluZyBhIHdhcm5p
bmcgaW4gc3VjaCBhIGNhc2Ugc2hvdWxkIGhlbHAgdGhlIHVzZXIgdG8gdW5kZXJzdGFuZCB3aGF0
DQo+IGlzIGdvaW5nIHdyb25nLg0KPiANCj4gWzFdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzIwMjUxMTE0LW1hdGhpZXUtYmFja19xdW90ZV9kZXZzaGVsbC12MS0wLTQ1ZTgzZGYyZjM2MkBi
b290bGluLmNvbQ0KPiAtLS0NCj4gIG1ldGEvbGliL29lL3Rlcm1pbmFsLnB5IHwgNyArKysrKyst
DQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvbWV0YS9saWIvb2UvdGVybWluYWwucHkgYi9tZXRhL2xpYi9vZS90ZXJt
aW5hbC5weQ0KPiBpbmRleCA0NDEyYmMxNGMxZDEuLjA2ODI2OTAxOGRiYiAxMDA2NDQNCj4gLS0t
IGEvbWV0YS9saWIvb2UvdGVybWluYWwucHkNCj4gKysrIGIvbWV0YS9saWIvb2UvdGVybWluYWwu
cHkNCj4gQEAgLTI0MCw2ICsyNDAsNyBAQCBkZWYgc3Bhd24obmFtZSwgc2hfY21kLCB0aXRsZT1O
b25lLCBlbnY9Tm9uZSwgZD1Ob25lKToNCj4gICAgICBpbXBvcnQgdGVtcGZpbGUNCj4gICAgICBp
bXBvcnQgdGltZQ0KPiAgICAgIHBpZGZpbGUgPSB0ZW1wZmlsZS5OYW1lZFRlbXBvcmFyeUZpbGUo
ZGVsZXRlID0gRmFsc2UpLm5hbWUNCj4gKyAgICBzdGFydF90aW1lID0gTm9uZQ0KPiAgICAgIHRy
eToNCj4gICAgICAgICAgc2hfY21kID0gYmIudXRpbHMud2hpY2gob3MuZ2V0ZW52KCdQQVRIJyks
ICJvZS1nbm9tZS10ZXJtaW5hbC1waG9uZWhvbWUiKSArICIgIiArIHBpZGZpbGUgKyAiICIgKyBz
aF9jbWQNCj4gICAgICAgICAgcGlwZSA9IHRlcm1pbmFsKHNoX2NtZCwgdGl0bGUsIGVudiwgZCkN
Cj4gQEAgLTI0OSw2ICsyNTAsNyBAQCBkZWYgc3Bhd24obmFtZSwgc2hfY21kLCB0aXRsZT1Ob25l
LCBlbnY9Tm9uZSwgZD1Ob25lKToNCj4gICAgICAgICAgaWYgcGlwZS5yZXR1cm5jb2RlICE9IDA6
DQo+ICAgICAgICAgICAgICByYWlzZSBFeGVjdXRpb25FcnJvcihzaF9jbWQsIHBpcGUucmV0dXJu
Y29kZSwgb3V0cHV0KQ0KPiANCj4gKyAgICAgICAgc3RhcnRfdGltZSA9IHRpbWUudGltZSgpDQo+
ICAgICAgICAgIHdoaWxlIG9zLnN0YXQocGlkZmlsZSkuc3Rfc2l6ZSA8PSAwOg0KPiAgICAgICAg
ICAgICAgdGltZS5zbGVlcCgwLjAxKQ0KPiAgICAgICAgICAgICAgY29udGludWUNCj4gQEAgLTI2
Miw3ICsyNjQsMTAgQEAgZGVmIHNwYXduKG5hbWUsIHNoX2NtZCwgdGl0bGU9Tm9uZSwgZW52PU5v
bmUsIGQ9Tm9uZSk6DQo+ICAgICAgICAgICAgICBvcy5raWxsKHBpZCwgMCkNCj4gICAgICAgICAg
ICAgIHRpbWUuc2xlZXAoMC4xKQ0KPiAgICAgICAgICBleGNlcHQgT1NFcnJvcjoNCj4gLSAgICAg
ICAgICAgcmV0dXJuDQo+ICsgICAgICAgICAgICBpZiBzdGFydF90aW1lIGFuZCAodGltZS50aW1l
KCkgLSBzdGFydF90aW1lIDwgMSk6DQo+ICsgICAgICAgICAgICAgICAgYmIud2FybigiVGVybWlu
YWwgXCIlc1wiIHN0YXJ0ZWQgYnV0IHN0b3BwZWQgb25seSBhZnRlciAlLjJmcyB3aGlsZSBydW5u
aW5nIFwiJXNcIiINCg0KIm9ubHkgYWZ0ZXIiIC0+ICJhZnRlciBvbmx5Ig0KDQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAlIChuYW1lLCB0aW1lLnRpbWUoKSAtIHN0YXJ0X3RpbWUsIHNoX2Nt
ZCkpDQo+ICsgICAgICAgICAgICByZXR1cm4NCj4gDQo+ICBkZWYgY2hlY2tfdG11eF92ZXJzaW9u
KGRlc2lyZWQpOg0KPiAgICAgIHZlcm51bSA9IGNoZWNrX3Rlcm1pbmFsX3ZlcnNpb24oInRtdXgi
KQ0KPiANCj4gLS0tDQo+IGJhc2UtY29tbWl0OiBlNTU2ZGYyOGY0N2U3NTRiNTNlMWY0NmM5N2Rk
ZTJiMTlmZDhmYWQxDQo+IGNoYW5nZS1pZDogMjAyNTExMTQtbWF0aGlldS10b29fcXVpY2tfZGV2
c2hlbGwtYzkwODVkMzUzOGYwDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IC0tDQo+IE1hdGhpZXUg
RHVib2lzLUJyaWFuZCA8bWF0aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tPg0KDQovL1Bl
dGVyDQoNCg==

