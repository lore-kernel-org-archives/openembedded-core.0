Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57038C79F8D
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 13:32:01 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63793.1767619920274205519
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jan 2026 05:32:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=rduovATU;
 spf=pass (domain: siemens.com, ip: 52.101.72.57, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMjPlrD70Nv1afMWOwhJFNg2531trPj6d753w55Fgu7yAXzVjHM2JTDMC4ujtVYFayYmP4BFLvXR48UTM5F8nwOSnkN6juixI3ivxpg3Utr21rWHKF2n3u8x3PscP88w2JYPTwoNa3A2LF3F8QYREdSs5542o8eB9E444PzuK+uqY4wFDCS0MAwKPketu7v20f7GgASGO7o+BluaCHuo2PWaNMI2an3YP5cry4K8LK7qCH4wpw1szVhXoRP9EXKc89+3ccdZDtnv+eS1c7arlhjGkuD6uObrLtkjP8x2/V94ynezDC8K1BYqQrtLBnx/54P2RK+2oNcazuaXIzfObg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgD5KGmgt1kOGEoJyNzXXyT5mSyjhvb3YVvs8vzRhxc=;
 b=mPcfUEndoIr7bbBF8hLyG1NhbPv/bpVIOLdiIVTxo1+s5m5oOaNKq9lfKS8nTJOIWLAjVz3Vk1rbc8nZt9lkoqgagH6OnRhKCc+AKfexPHQ+2fh2ncefawTRV6oBeZn5Xyq3panSYDJN1V+PgLHpO8Sr6yOLSA7gd8JXb4PoIQ1hABcI8mRusDgDy4CO83ukYjGVx1JjkYKFa7xIAS1ntSBDSOBN52fJvNJVNB0yLybaX6xSL+qGnfYCUqzLi0A1qRNNBiyiHS5OKvpvSUoUDerFQhbib1bh3LYerVQtM+Rts8Vgn60kai/X8efiQjvo4aD2tqOxOOh2ysrJXHDsUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgD5KGmgt1kOGEoJyNzXXyT5mSyjhvb3YVvs8vzRhxc=;
 b=rduovATUFz1Nz7SrOUGa5FAVyyhxzqRYvSTvTLhpqzo1jAcJVVZi0cNOLFW6Nelsr1LvgNDPN/cksNYnofOZgPqoR7DYzV5M0VgVYY+3lWj/Tr0EXRDTbrYaXl4Q6eF7Q6DtcUOWSvlMpQRx1yol/s5MNG8/CRl5DOSocokJssbOT+lz+FzEVys148CaCebXpbCpJb5LracH1nR3QpEiaRfsm9Z3TPz2SjIBgWgu4DFSMYkNLzk21F5z8dbk+RYW6wxQsrVTFrKaqP3kPJTbr/lQ9vYnH+x1JvIGNKV2sXFQeIfttdzaDnePHYl6usryh4rxYpypTsZuSYGQhAnRXw==
Received: from AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47f::8)
 by VI0PR10MB9031.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:217::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 13:31:56 +0000
Received: from AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d515:f4e4:e935:ee4f]) by AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d515:f4e4:e935:ee4f%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 13:31:56 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "louis.rannou@non.se.com" <louis.rannou@non.se.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pascal.eberhard@se.com" <pascal.eberhard@se.com>
Subject: Re: [PATCH 0/4] oeqa: selftest: split and create a library
Thread-Topic: [PATCH 0/4] oeqa: selftest: split and create a library
Thread-Index: AQHcfjD9wiH4M95lQkOaHfqWm3/6yLVDkvAA
Date: Mon, 5 Jan 2026 13:31:56 +0000
Message-ID: <a94aecf89e168c1bcc713536a0d05dded75d0322.camel@siemens.com>
References: <20260105-fitimage-v1-0-e319258c4c4f@non.se.com>
In-Reply-To: <20260105-fitimage-v1-0-e319258c4c4f@non.se.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5724:EE_|VI0PR10MB9031:EE_
x-ms-office365-filtering-correlation-id: a29c1b60-6aec-40ef-b9d7-08de4c5ecbf0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?K0RWQ0FSaDE4T3JKQjRiRFMxeW05c3lSV2tta055MHFZMXArLy94SVVIR0Rk?=
 =?utf-8?B?dmpBNUpwOCtYcXpLODRwQmdLWWNJWWV5Zk1GWGtiYVlsOCs4RHFHNmhiSFc3?=
 =?utf-8?B?bEJsYkRXVXFoa2djRnYzU0R0WW5QRUpLQkxpQUJPd3d5b3hKR0N2WVpOaXVS?=
 =?utf-8?B?aGltK0kwVlJIeENrWHJjK3JJWXlkbE5Kb0hQVDVCZk1nb2lDVHp6L0Z4bFZj?=
 =?utf-8?B?elFUU0VYa2hTL2Y0UUQ3cUpiWUNqZnptUGl2YTBzYTAzdGRNNTFqcFlTK3hU?=
 =?utf-8?B?NUFsTjQ0TmlKSHR5Szc1YzFVajI3THM3MVZvQ3NoU2ZKMDZHNjhFenBsZk1L?=
 =?utf-8?B?MVg0aW85ZVRacFZ2RGo5cXg1cXFyKzhKUjJHSjlVamY5dUhUd1QvUys3Y3VM?=
 =?utf-8?B?WlliUmRrWm5icTlFMWNkZWhCMmlEZGhYVHJZbGF3OFIwMzBTaVBPUzFYWXda?=
 =?utf-8?B?UTRZVE9NcUk0MjFBRTZlaTRLQ1EyYkJvek9ZR0NFbzRrRnZxdUtFSjkvaHBZ?=
 =?utf-8?B?NXdUbUpsaDdUcnFDNkFhTWhjWXFTQmVKWkVNd1JTQkpxcmtkMjdzOCsyV0lG?=
 =?utf-8?B?ckdoM2c5dWxzbDhNdVQyczJMRHVvU094cUhIbGJRa3hEanA4bVdEdUpjZ3B6?=
 =?utf-8?B?V0d2RjhkYzJ2VFNVTnk5RHFPWUdQNXgzS2EySFAxc09uVGpzeVBha0dvQ0lk?=
 =?utf-8?B?aXU0dHdxUTFMV0JRL1hZUXQvNW5WQW1RS3ZNT1F0VFJieDNoRXhEMjB1ZUxr?=
 =?utf-8?B?Z3d0ZkVnQjllTnNFTHJWeGo3N0YybmVTeDlqNGliVENLa3I2bTg4eUFwbHY3?=
 =?utf-8?B?VFFEMDl6SHl4QXR1N2t2Zmh2T05rZDdOdTMxK1hDZUpyWHUrWmZtL1BMT3dk?=
 =?utf-8?B?MHpzZlhlU3dHNnZvOFJweVJzazJyMGlyVjZuZ2Y4RnM0WThEcFh2ZzZrZ1JD?=
 =?utf-8?B?N3FKSUhZYnNIUk02bWhQazhxWTFjd0pBOTRLd3RhNkoyWU43dkJoY2tWaVZy?=
 =?utf-8?B?ZWh6ajhZMHkvcUZpSnd1VWRvd1V0ZlFBZXRHVE1ic2I1UXI1VHQ4TFh2TXJI?=
 =?utf-8?B?dGxjcytOeXNqaVZPbGwxbjRQOU1qL0J2aFBpSTBwSVJZVEQzdjUrU2RHb0Z6?=
 =?utf-8?B?UzV1dE1OUVpiSWdQVm5VOS9rN3R4V2VPNDBva3VLeWRpdCtzb09GR3VDNFBM?=
 =?utf-8?B?aWo5OEkwLzhGMDZNTjhTbHh5RW5Cck13YVp2bVNOWFJONjkxdE1DVWJrdGor?=
 =?utf-8?B?WUhIOW5JZld4d1JhQWF1YTRCZXJycWh2Y2ZFSURtc1NyV2QxUmh1YkgyTlFY?=
 =?utf-8?B?UWI2cFF1NVlOcnNBTUVvZTh6RzZ4Z1VkUFFVWE0wWnlGRjFUeWJRK0hERnIx?=
 =?utf-8?B?VWVLZGViMWczRU4wbnlTY1Y4WmlBaXdUQ0hpV2hsSnFRTkc5M3NLWDl6WDNl?=
 =?utf-8?B?V2w1UnFiYXpYQXNUQ1hiNHVvY3pCeE5WZ1krV0NDd1IyMkJHZ3I3WVBCbjRM?=
 =?utf-8?B?OTYzeVpIUnd6YTlPMjFRV0N6R0x6OTJpMEplSTl2RGZWZnhXT2dHRXJURy9T?=
 =?utf-8?B?N3JqdW42eC9HajdSbkFnRkJVZXF0N1prRTlXclZ3VGY1aWpXdHJDL09GQldu?=
 =?utf-8?B?MEF2N0Q3NmZ2dFBRbHB5K0hUQ2VEMUpiMnN6Ukd0TXo0THdSMEIvR2hZaEJE?=
 =?utf-8?B?Z3VieFBweUZTS2Y0aFk1UFpyUUMvV2lSZWUvQUpqZmpNeEdnNWM1ellSYjZr?=
 =?utf-8?B?Q1ltTFBKZWIrM1pwYy9teE5UZzVKMTEvamhKMFgrQjJBMmxJK2ZHUnBFVmJt?=
 =?utf-8?B?OTVDSUJsbVNMaVIzTFZzcHZ6NWVuaFkwdElBTkQ4bysyLzBoLzNzbHQzTHdF?=
 =?utf-8?B?RmE2RXpYVklJK1RtRFA2RS9DN0FHTXJ5OXRvd0lEMmFtZUJYMWU0NElYTmVT?=
 =?utf-8?B?bmxlRXkvYVZTb1VibWJmZ2FUb0hJRkxSTXkwM1ZMazVSanVTbkRyV3kzeFgv?=
 =?utf-8?B?NTBwRTR1dFVFYlYyaW1uWHd2N1BCMWtQQzg5N0IyUitjRkhUQ3ZzU2gwekY3?=
 =?utf-8?Q?fqzszH?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NVAyUE5iQy9maU40UkVKbGtFcWNibUF2cEVHR0NEckZBYm9yR0lRU3drdmRY?=
 =?utf-8?B?QlBaZTcwQ1R6Ync1UmhzNXVicmMyb2U1a0JXM1RLbXhPMjdRaW9WTjgvczFO?=
 =?utf-8?B?OC9ReEk5cmlPY0tWTVcyenVieC9DOUg4YTFKcmYrUlU5NkFLMFJPdy9rMTBJ?=
 =?utf-8?B?Z1U4b3ROSnJPRlZBdktuR0o2ZUFwbWd4MlBUOExGY2RGQi9OcGVYMTVueUVo?=
 =?utf-8?B?b3BBbVB0anRvaEcxWCszWWE5TXNsV0tkNmhnYkpDWGV0UG9hSVBGeEljYnhn?=
 =?utf-8?B?a2EvOHFwWkV0S2tBQ1REMG9EUVhPN1dWb1ZjSUFXRnRoZFhqQUIveWNsQ2Zw?=
 =?utf-8?B?amZQamFNWW1XdHpuVEMwY1VwSXI4bUV0elprWWxSblBWUDh0RlprcGNxbFRp?=
 =?utf-8?B?TFUvQVhPL1RMQWprdmlUTVhtWHJ3UVBtamZSZExsNHY4akc5b2orQi9YYVNM?=
 =?utf-8?B?VGV0eHNWSFpuYVF4MWJpclV3QUtuQUpJcmhqWXhSMm1FWDJrYnhBTEF5UlVm?=
 =?utf-8?B?bXkzRktHUytmQlZZQmwrQlVXQkZHU2tNMmI0dHJmNFd0bHRzYUVZQzRJajVT?=
 =?utf-8?B?cXduQkFKQ1RnNnloWlc1elp6QkwvNUhBYlJKaUd6QVphRU5zNzhZNnBueEds?=
 =?utf-8?B?bWtUMThCbWVkblJoTHVHOEJOZVROSllPb1JvRkNxbjZqcFllUTRCU0NPdzVj?=
 =?utf-8?B?SE1QUVRuVWdOQzFYU1RrSU11TTVDeVFET0dRcjVidDJPSkJyVnVDeFFyQUFt?=
 =?utf-8?B?Tmh1ckh6Sy9pb2JkYllMd2M0MTAxV3FuWDlHbGFMSUU5RGs4ZHRxblFUY1Ar?=
 =?utf-8?B?aHZuMFhlVVhYV2g0Y25PTjNoamtCdnhTOVNZRkRCUTlwZFhrNVQvSFVKRE43?=
 =?utf-8?B?aXpvNEN0SW4zNisvcEdNdUsxVUNiWXFYVGVscFFsc0U1Mk15aTRVcG5yQkpH?=
 =?utf-8?B?eHRZVjMvNm42dVRrWlVXd1VvZlppdnkxTDE4VEdIWFRGSjRXMDVtL2NjcUhG?=
 =?utf-8?B?em9ISHgrcGVZa25rUnBsM1pUaCtqdXJNMmlkSTFTZUxWL2VWNDFJTG1WWEJh?=
 =?utf-8?B?NUZVeXFZTDVXc0wxTEFJd0QyWkpWcWtJWVRzYUJZUy9Xa1BwcjJlLzZyUDk4?=
 =?utf-8?B?OWJ3c2NESlhxVnhOYllUak1SR0VpZitQcU9IU2dqczdPNkwwRkwzTUg4VHUw?=
 =?utf-8?B?VC9iaCszSWFPU0N4bVYyTzNCRXU2cTRUSnVRVUE2MXk3UFJqMHpIMlArMHdW?=
 =?utf-8?B?QW5yeUxPWTFwSUJLVGpnUnAzbWkxcWxIQW5PakZqYTNPanE5azMzakZTK1BD?=
 =?utf-8?B?WFFrNFR2aHVJR2pqWTZCRkF1cnorSDFsMlBXTGpteWlabU9pOTZNUXZNV1U5?=
 =?utf-8?B?TXdJc05EdXhaNk5UM2k2T0pESnhncU9SWEo0VEVwV2d6b2lWdlNBS0dxVks5?=
 =?utf-8?B?ME9BUEdsNDFySjJiVTJyZFZKcDFTSS9laGVSZ2VLcm9nM0lUZ2dRK3hxVmpo?=
 =?utf-8?B?eEhZNi84eXB2eDFGWGpxeXpwamp0YnpEOEhJRm5HL1FuS29RdFEvQlBRZDBJ?=
 =?utf-8?B?bE1JOU94RXJzaURrdDJVM09NVHZuRUhmMEJDUlkwWlk4NUg2QlMrUW5wT0ZB?=
 =?utf-8?B?cFVibldLRVNZQ2tOd1FqMENlWm9WMUUwbS94bHEzUmhKZFNMR0xabkErWUds?=
 =?utf-8?B?d2lSQjNoTUMwdGhVQTZhUG1OMzBOTUVSMHJlZElNWG52QmVReENHOWZKS011?=
 =?utf-8?B?MmNHYm9ha1FFbFpZb0tQNDVYdExuelpzL085aGFZeVhRem0reWlNS1VTdHZE?=
 =?utf-8?B?TjIvRG53S0hicDNna3YzaEptMFd4RGV2V2t1YUh2bWdFaU53OGVDTXhrUjVr?=
 =?utf-8?B?UXlMU0R1c2lzeUNTNnhqc3VXc1FUVldFMXpVbis5WGRBQXplVlFHMCtHS3V2?=
 =?utf-8?B?TUY1OGk0d3FXSE81Vll1MlFXU3ZCelZDZEVsYjkzUDI3OGVYQVMyTzM5Q0Vi?=
 =?utf-8?B?akhLZmt2bEc1S0l0cWVjL1J3Qi9lU0p5MG0zSFVqV0YxcTZDS3k0RGZJMG1B?=
 =?utf-8?B?bDBVZlV1dCtKV3pBaVd4V05RanJadmZtU21wUXhickk0bVJtZThtTmJOb3R3?=
 =?utf-8?B?b0ZaSkQxY3k3N1pKWTh2T2FGVmZaOXlQMWx3S29GdDVuNDBZSGFvSHM4dnpY?=
 =?utf-8?B?WXYzeXA5U2Y4aEVtZ0xEN0ZMK3VLbXZQZmZvNDh0LzNPQmZsN2tpNmhMYzBR?=
 =?utf-8?B?Y2hpWDdPR1Z3TkpaejBmRnNISmRWTG1vbUpyK1A4YVRDT1llQTZKeUNEL002?=
 =?utf-8?B?b1laNUhLSys3T004M0N1WktDZ1ZxbE80eWxLRmJpem9lSWF0a2I5Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <58233E4CFC23264393CDD975E5DC1E70@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a29c1b60-6aec-40ef-b9d7-08de4c5ecbf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 13:31:56.4768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ulrYg/jsRYGlX/6Y626/CemcffIqJ3tzSepxlJKSdNTB5/9hKykHTMy0IwSGW5Wgeg+/sGbYgedZeNjzPqtlUc8Xsma4gG5ylSzMbb3zKNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 13:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228868

SGkgTG91aXMKClRoYW5rIHlvdSBmb3IgdGhpcyBwYXRjaGVzLgoKUGF0Y2ggMSBhbmQgcGF0Y2gg
NCBhcmUgZmluZS4KClJlZ2FyZGluZyBwYXRjaGVzIDIgYW5kIDM6IEkgZXhwZWN0ZWQgdGhlIHNl
cmllcyB0byBpbmNsdWRlIGFuCmFkZGl0aW9uYWwgY2hhbmdlIHRoYXQgYWRkcyBzYW5pdHkgY2hl
Y2tzIG9yIG90aGVyd2lzZSBkZWxpdmVycyBhIGNsZWFyCmZ1bmN0aW9uYWwgYmVuZWZpdC4gSeKA
mW0gbm90IHNlZWluZyB0aGF0IHlldOKAlHNvIGZhciBpdCBsb29rcyBsaWtlCnJlZmFjdG9yaW5n
IG9ubHkuCgpGb3IgZXhhbXBsZSwgcmVwbGFjaW5nOgoKICAgIHNlbGYuYXNzZXJ0SW4oIlNpZ25h
dHVyZSBjaGVjayBPSyIsIHJlc3VsdC5vdXRwdXQpCgp3aXRoIHNvbWV0aGluZyBsaWtlOgoKICAg
IGRlZiBhX2Z1bmN0aW9uKC4uLik6CiAgICAgICAgaWYgIlNpZ25hdHVyZSBjaGVjayBPSyIgbm90
IGluIHJlc3VsdC5vdXRwdXQ6CiAgICAgICAgICAgIHNlbGYubG9nZ2VyLmVycm9yKCJTaWduYXR1
cmUgdmVyaWZpY2F0aW9uIGZhaWxlZCAoJXMpIiwKcmVzdWx0Lm91dHB1dCkKICAgICAgICAgICAg
cmV0dXJuIEZhbHNlCiAgICAgICAgcmV0dXJuIFRydWUKCiAgICBzZWxmLmFzc2VydFRydWUoYV9m
dW5jdGlvbiguLi4pKQoKc2VlbXMgbGlrZSBhIG5ldCByZWdyZXNzaW9uIGZvciB0ZXN0czogYXNz
ZXJ0SW4gaXMgYSBzaW5nbGUgbGluZSwKcHJvZHVjZXMgY2xlYXIsIGZhbWlsaWFyIGFzc2VydGlv
biBmYWlsdXJlcywgYW5kIGluY2x1ZGVzIHVzZWZ1bCB0eXBlLQphd2FyZSBvdXRwdXQuIFRoZSBu
ZXcgYXBwcm9hY2ggYWRkcyBtb3JlIGNvZGUsIGEgY3VzdG9tIGxvZyBtZXNzYWdlCnRoYXQgbWF5
IGJlIGhhcmRlciB0byBzY2FuLCBhbmQgYW4gZXh0cmEgYXNzZXJ0VHJ1ZSguLi4pIGZhaWx1cmUg
dGhhdAppcyBsZXNzIHNwZWNpZmljIHRoYW4gdGhlIG9yaWdpbmFsIGFzc2VydGlvbi4KCldvdWxk
IGEgc21hbGwgYWJzdHJhY3Rpb24gaGVscCBoZXJlIHdoaWxlIGtlZXBpbmcgc3RhbmRhcmQgdW5p
dHRlc3QKc2VtYW50aWNzPwoKICAgIGNsYXNzIEZpdEltYWdlVXRpbHM6CiAgICAgICAgZGVmIF9f
aW5pdF9fKHNlbGYsIGFzc2VydGlvbl9wcm92aWRlcik6CiAgICAgICAgICAgIHNlbGYuX2Fzc2Vy
dGlvbl9wcm92aWRlciA9IGFzc2VydGlvbl9wcm92aWRlcgoKICAgICAgICBkZWYgZm9vKHNlbGYs
IC4uLik6CiAgICAgICAgICAgIC4uLgogICAgICAgICAgICBzZWxmLl9hc3NlcnRpb25fcHJvdmlk
ZXIuYXNzZXJ0SW4oLi4uKQoKRXhpc3RpbmcgdGVzdHMgY291bGQgdXNlIEZpdEltYWdlVXRpbHMo
c2VsZiksIHdoaWxlIG5vbi10ZXN0IHVzZXJzCmNvdWxkIHBhc3MgYW4gb2JqZWN0IHByb3ZpZGlu
ZyBlcXVpdmFsZW50IGFzc2VydGlvbiBiZWhhdmlvciBvciBkb21haW4tCnNwZWNpZmljIGNoZWNr
cy4KClNvIEnigJltIGFza2luZyBmb3IgdHdvIHRoaW5nczoKLSBDYW4gd2Uga2VlcCB1c2luZyBz
dGFuZGFyZCB0ZXN0IGFzc2VydGlvbnMgKGUuZy4sIGBhc3NlcnRJbmAsCmBhc3NlcnRFcXVhbGAs
IGV0Yy4pPwotIENhbiB5b3Ugc2hhcmUgdGhlIHBhdGNoIGluIHRoaXMgc2VyaWVzIHRoYXQgYWRk
cyB0aGUgcHJvbWlzZWQgc2FuaXR5CmNoZWNrcyAob3IgY2xhcmlmeSB3aGVyZSB0aGUgY29uY3Jl
dGUgYmVuZWZpdCBpcyk/IElmIHRoZSByZWZhY3RvcmluZwppc27igJl0IGZyZWUgZm9yIHRoZSBj
b3JlL3JlYWRhYmlsaXR5LCB3ZSBuZWVkIHRvIHdlaWdoIGl0cyBjb3N0IGFnYWluc3QKdGhlIGlu
dGVuZGVkIGdhaW5zLgoKClJlZ2FyZHMsCkFkcmlhbgoKCgpPbiBNb24sIDIwMjYtMDEtMDUgYXQg
MTE6NDkgKzAxMDAsIExvdWlzIFJhbm5vdSB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4gW1lvdSBkb24n
dCBvZnRlbiBnZXQgZW1haWwgZnJvbQo+IGRldm51bGwrbG91aXMucmFubm91Lm5vbi5zZS5jb21A
a2VybmVsLm9yZy4gTGVhcm4gd2h5IHRoaXMgaXMKPiBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2Eu
bXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uwqBdCj4gCj4gVGFrZSBzb21lIGdlbmVy
aWMgY29kZSBmcm9tIHRoZSBmaXRpbWFnZSBzZWxmdGVzdCB0byBjcmVhdGUgYSBsaWJyYXJ5Cj4g
b2VxYS51dGlscy5maXRpbWFnZSB0aGFuIGNhbiBiZSByZXVzZWQgaW4gb3RoZXIgdGVzdHMgKHN1
Y2ggYXMKPiBzYW5pdHkpLgo+IAo+IFRoZSBmaXJzdCBjb21taXQgaXMgYSBmaXggZm9yIG1pc3Np
bmcgc3BhY2VzIGFuZCB0aGUgbGFzdCBpcyBhZGRzCj4gc3VwcG9ydAo+IGZvciByc2E0MDk2IHNp
Z25hdHVyZXMuCj4gCj4gVGhlIHR3byBtYWlucyBjb21taXQgKDJuZCBhbmQgM3JkKSBhcmUgb3Jn
YW5pemVkIHRvIG1ha2UgdGhlIGRpZmYKPiBlYXNpZXIuIFRoZSAybmQgbG9va3MgYXQgZXZlcnkg
Z2VuZXJpYyBmdW5jdGlvbnMgYW5kcyByZW1vdmUgdW5pdHRlc3QKPiByZWxhdGl2ZSBjb2RlLiBX
aGlsZSB0aGUgM3JkIG1ha2VzIHRoZSBtb3ZlIGZyb20gc2VsZnRlc3QgdG8gdXRpbHMsCj4ga2Vl
cGluZwo+IHRoZSBzYW1lIGFyY2hpdGVjdHVyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMb3VpcyBS
YW5ub3UgPGxvdWlzLnJhbm5vdUBub24uc2UuY29tPgo+IC0tLQo+IExvdWlzIFJhbm5vdSAoNCk6
Cj4gwqDCoMKgwqDCoCBvZXFhL3NlbGZ0ZXN0czogZml0aW1hZ2U6IGZpeCBtaXNzaW5nIHNwYWNl
cwo+IMKgwqDCoMKgwqAgb2VxYS9zZWxmdGVzdHM6IGZpdGltYWdlOiBwcmVwYXJlIGZvciBzcGxp
dAo+IMKgwqDCoMKgwqAgb2VxYTogZml0aW1hZ2U6IHNwbGl0IHRoZSBzZWxmdGVzdCBhbmQgY3Jl
YXRlIGEgZ2VuZXJpYyBsaWJyYXJ5Cj4gwqDCoMKgwqDCoCBvZXFhL3V0aWxzOiBmaXRpbWFnZTog
cnNhNDA5NiBzaWduYXR1cmVzCj4gCj4gwqBtZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0L2Nhc2VzL2Zp
dGltYWdlLnB5IHwgODY0ICsrKy0tLS0tLS0tLS0tLS0tLS0tLQo+IC0tLS0tLS0tLQo+IMKgbWV0
YS9saWIvb2VxYS91dGlscy9maXRpbWFnZS5wecKgwqDCoMKgwqDCoMKgwqDCoCB8IDg4Mwo+ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiDCoDIgZmlsZXMgY2hhbmdlZCwgOTYxIGlu
c2VydGlvbnMoKyksIDc4NiBkZWxldGlvbnMoLSkKPiAtLS0KPiBiYXNlLWNvbW1pdDogZjU1NDA3
MTg1YzYzYzg5NWZhM2M0ZmRmNzRlNmU2M2VhOTUxN2EyMAo+IGNoYW5nZS1pZDogMjAyNjAxMDUt
Zml0aW1hZ2UtNjA5YmM2NjlhYmNhCj4gCj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gTG91aXMgUmFu
bm91IDxsb3Vpcy5yYW5ub3VAbm9uLnNlLmNvbT4KPiAK

