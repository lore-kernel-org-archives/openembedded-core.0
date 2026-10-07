Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A8ACA5FFC
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 10:43:32 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6548.1791369811130549893
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 03:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=XYl3wcu6;
 spf=pass (domain: siemens.com, ip: 40.107.159.68, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SX4q/450W85pAPHpzDIe0iYKM9TjdH5aufaUqeB8AjJY7yyGSYjAHFFLpT1mXTdH4bySF35nlOFLyVSNEVIy/hRuf8zHyVIh3BwRliuVHJKHltAFJSCnUtMeCwayU2kIv5NRpdn/kdPK4cPg6fWQzk+w/lDK+8nlbmGHXC01fZQxgX1tUTp3A6Un4MJrgaqemOkp2qFMcDKl0m+QA9vh0e1K9h8bU9mMNRwSxkUyvmhEGe2C44aD5yvDNdbnx5riMveSLZfRZlrW23nt+tDDl4oyJTUhEm86GKbcKshLjw6+4tHKDCtICGlVfz8/ddEohAanF/OQwFnwWf3gtO6OTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlfHWaXYio7+fCODwnyebWyTOh2L0kE5fUtFNhWrcwc=;
 b=ySRrHwr4CQvCKAioZ3u04EIzZUZBs7Pr8GCFX1kFkfLM8Cab48Cp077ipUff6Vr3ywYQhLOpb0oyDyaosrVptw+f7w2SfXrO3+yXOtkea54IpR7rL9YFLJW+YJ4P1PaWbX/j7qGtcu6F3aEA3y+pn0+4vx+MaGkwzw+ipDA2b+ykB4IxpLVIa/6TnvGSmm5Q7SMEX7RZwJIxuJCLHNlvqy7laB/QYrshQp8WHpvJ5LS0RivLc6rWEYhZes7r/5CAQWKWuVvxrykwuo/aZy4PVPNdeVP45WuqKj2b/BAsYy+8zfMjraPhDQZD/FQxwdzP8ncX77t8t0XmKINntBwGmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlfHWaXYio7+fCODwnyebWyTOh2L0kE5fUtFNhWrcwc=;
 b=XYl3wcu6+G+3ArLoQj1l/3TlqH1GT5LUZEZ0rqk3QoRJkz+fXZU6xdZo9fqo6GysLYX8qXMJq2Z/OZqZTKb83I9NTnX9AA3A+t6g2M/mDKFIupCVGIDX69AQiodGZ8zAUnxTy5TRt/7NtB5qCBx5QZSpjaqPc5RPtLRLIhE3FvV+eAHLjSCoGYEeu44zD2hV//aGVlVQWjR5FlxzU0c9pGcIG+ocIluh9TeuUNPnJJ7nX5st9lW2jrkAnRsnLajrAhQ6oEZeELQsYZ1y7FOBUQA+OjQBxX7JkZjM7EiB99nln+MB+YVPiOLkO8Bb4xGPy56Vl+Aa4c95ry/tHm0zpw==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by MRWPR10MB9601.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:501:96::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Wed, 7 Oct
 2026 10:43:25 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 10:43:24 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Harish.Sadineni@windriver.com" <Harish.Sadineni@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [wrynose][PATCH] glibc: stable 2.43 branch updates to
 562cd7badd
Thread-Topic: [OE-core] [wrynose][PATCH] glibc: stable 2.43 branch updates to
 562cd7badd
Thread-Index: AQHdVkY51BxY1bO6WEW73krJds3wCbbx4TKAgAADNJA=
Date: Wed, 7 Oct 2026 10:43:24 +0000
Message-ID: 
 <AS8PR10MB5073014B65BD921986587E1BFD942@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20261007102442.1180223-1-Harish.Sadineni@windriver.com>
 <1690975.1791369029109026328@lists.openembedded.org>
In-Reply-To: <1690975.1791369029109026328@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=f12a6455-f6ed-45a1-9f53-37948fd5459e;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-10-07T10:41:56Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|MRWPR10MB9601:EE_
x-ms-office365-filtering-correlation-id: aec57c6e-7f60-4a99-4ad5-08df245fd08c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|56012099006|10067099003|11063799006|18002099003|22082099003|4143699003|8096899003|13003099007|55112099003|38070700021;
x-microsoft-antispam-message-info: 
 xcbQFXGn+E8aj4KUb8TjggqkuVB5Aac9aZ+dHkOVSMwk8sgmXD/HPhNsFY9bCzq0racNokc4tCXHeHrtx9kRAE/ydmWIujRjOLtPUmdwl2jQy8dx5c5zbhaDaxnQNkYLFHJyN0bsAgVTk3TuOXe+EEOqtamxKBVmC3R06v52FiLvf8AJVrpQTWyArM6EyOfRUBNzXR55eFot7I/43NvBvxxLvEBAtv9belzH85Lt49PoEvi1CHG4iMUoLbhcnTDnTOVtSoSJ6bBCNf42mOnsV2wQvV4xPEha5/wH0J47dCHSleIux1bLzYTjG63ZaaKdTdRYs83oxQSOQpp//b6gIxY1K9qw9SJy2yYj3GbULgEmXvjFy9A0pSZuyCEy73r0XiXG7Rf0Y4KlZ4h4sNUjMabybwkUhumLc5VqQ1OM+RwL+G/JhOTRkt2R7b5i3O9YFa1+a/fuSGu9NnvNCj/KRSxBchweCRDlUi9zIm3havrvGzudZLJVnTsSPGQaQDUnTGR/TQnp8Ff9G8QJfai0EhX/aW6T9Y8KJn4qyHOx179VjxfMgpWXhtZJ555xAEIv/r8v9NfZl/bik+CZm2QQiyhXAjOQSV8WfblViDFYbplFvBGzQmDfXfNEYmXgMVe0L8pclRK4NsbExLJ8ncPNbgId5PdPdiiRE/qgckP8pGQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(4143699003)(8096899003)(13003099007)(55112099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NGVDVTNVbWtEeWswT053M0J6TXhZYnBWOTV3alc1TnRVdytrSFI3NFo5eHJM?=
 =?utf-8?B?QWhEckNId0F3TG5xYnZXU2pKN3N4K21xb3dpdHhvWUpnUXFkRjRLc3I2NUhv?=
 =?utf-8?B?RUdnK044ME5QOFIzZTNaaE5pQkh5aERVbk9wUFdVN3BGV0pDQmxzcldMcU9m?=
 =?utf-8?B?Sk1ld1RkSXNZeXNUZXlROGtXeTNRNEdwZ0RGemFLdWFEd3o2S1YwT093dGN6?=
 =?utf-8?B?eDh6dG1OcktzenB1Slhqb01qRERKbDNGK2FNQkhxRHQ0NU9mQ2JYT0dvalNX?=
 =?utf-8?B?d0IzNnlaMTA3OVMwOERVeWh0aWEzaFZEeEZUckdlU240NjBLa0xxcmx3Tmcv?=
 =?utf-8?B?cktEYW1qWWpEZ3ltRHdqU0g5MThjanM5K0ZabEJTTUlObW9lemw2dmU0MFBR?=
 =?utf-8?B?T0owcWI0bEk5K0Z3QnQwV2VYcDlZdFZtVzE0M0dxZm9SMi9vRzJPU3B4YUhF?=
 =?utf-8?B?NVRIMDZFcE92QVgrZ0NMeTRVdGhrNDlWYmdIMTNWMGlTQmlIZ0ltMm1rVjRW?=
 =?utf-8?B?cXdpblZyblhJanZyK04zWVYzN1ZEMlpwWmVmaU5SK21SL3FUYkF2eVhlS2Zy?=
 =?utf-8?B?Si9sM2hDV01heFFoTjhxUElPWHhLcnRwL0toalNvTWxhMjU3TDR2YVhDbjJ2?=
 =?utf-8?B?WUxsTWVmVlkxTng1cGVQa2IxVmRoVGxLcExHY1d5RlJvQW1GUzVvSVFraWdq?=
 =?utf-8?B?UFVLd09wdFFwZklvRXVOYlpGQnVtS0UxZHFhRHd6aHNUeml2WHVOak9BYWZH?=
 =?utf-8?B?WDRaSzdBZ3BEekZmWTdaTmNOV3pVTVpwS0NsQjcvVlluK2FqUTBPWUtDdW1w?=
 =?utf-8?B?RWhyekNaWDlqM2xVTXp6TW5INFRnOTFUd20xVTU4WVlYQzZtcmE3R3BjbUNS?=
 =?utf-8?B?MVhhSFM3UFV1ZXJQTzlrbjNJWENwMDZPcGVvVSsxN2JXVGJwaEI1cVNZakFo?=
 =?utf-8?B?Zy9vUVJ6MHFtck9neEtNN1FmdC9xK0IyQ0pXRmhQRkRIQ01tbHptMDhZR3B3?=
 =?utf-8?B?ODFjaVR6UVFDdmprNXBIVnFlVktqcHAzUlhDUGdTdHJaemNURit3ZUpkSjF4?=
 =?utf-8?B?eG1OK2pRcFBRSTM3dUtUbDIrM3RPWDR6VHdPRlM0SFU2OWxObXhDZGt4VTJn?=
 =?utf-8?B?N2R5YzNsWHJDVXV3dUgyYlZyUjFFT2h0VGhTdkFKejJUUm5BRHdiSXVWNGxa?=
 =?utf-8?B?YUhBM2h1Z2hiZVR5OWdYMzRYeHVJdG1rd29LQkhyMVRDTmpRYi9BMFZwcm94?=
 =?utf-8?B?KzFETkluemJybGRlWTN5N0JSMENaMm5ZYXBjcnF2M0hGdG5BckthU1JvRk9G?=
 =?utf-8?B?SE8yS0JBZXk0TWt5TUtJT0JjdnJMOEdOemN1RWorWHo5cU1mUWl5ZXZUY0ty?=
 =?utf-8?B?SDN2T04yZVBKd3JFa1lDOWF4R0tLc2RRb3NIZ3YwNUxCeUhiZDkxV2J3dFIv?=
 =?utf-8?B?dnk5L2U2eDFSNm5CdFg1UDRBQ0xqaCtHc3oyOEM4dWZ1VmI5UERiM29XY1JE?=
 =?utf-8?B?NmRmUlBaZElUeFR4UTdIQ2hPbGpoTlJKMHpwT0pzekhGaDhhcGNSVkZCSUNI?=
 =?utf-8?B?ZzhJM3Nva1huQU54M1BqTjVDUkpVTGZvNGthK2ZXY3RsNmtpd2w2MjNPaVlE?=
 =?utf-8?B?ZDkyajJFVTl5NWp0Z3JQWmVNYlZHRVRSYlNmaUk1d1hsZGVHTld3bHhxMXI1?=
 =?utf-8?B?RkdzODUwTzU1NXRQUjdOWnNvcC9pYjV2ODN4UDFTNUZWVWQyM1ZRN0xkelhJ?=
 =?utf-8?B?WFQrOGZtRUZ5R0pySmt3b2dkY2pqdHdDdnVFVWtKWmMvTTV2eVczeUJzaUFZ?=
 =?utf-8?B?L3R6MTJiVUxkVXRTYzQ1VDF3QkRoY2xaUFJraWFqUnZtUzZ2UmV3WmZpbEg3?=
 =?utf-8?B?bTVURnpMS2k0Q2wzZDZlMkxRb0tINmZETittSEQ2OXR2UlhMTHNMeXZCU2J4?=
 =?utf-8?B?cVJ0NmVYMVZNQzZWZUJBcndSVkowZnljbmZFVzdmT0tCRXpoQ3E1Y3pUckRo?=
 =?utf-8?B?OC85VVQxSHZOa2tZVXBpWkswdFpqYXFmT3ZkVDlMTWFNazRPTXlGVWJuMlNm?=
 =?utf-8?B?QkloaEU4bEtaQ0FlUnVXK3ZnRU9VQitkY1dvNmEwcGp1UVYxdnp3dmljWHcv?=
 =?utf-8?B?ODFTZFZVSkJLeVFkL01BOW9EUlFyUmJNNGp6RzFmbTZJTllNUlFzbFYxTFZa?=
 =?utf-8?B?TUlqS3IyOFVBOFc1YjF1K0ZNWGtsYzhFTWJrQWFEaHVzVnBIMlovV1ArQW5R?=
 =?utf-8?B?NkxHamxGaklaQzdTeDA3ZVVoMW1QbXZoTE5Sc052azRDYTFVY1BQRVlmeERR?=
 =?utf-8?B?amo2TSt4YVpISDgzbUdEOEFLUlExbnU0anVEQzY2aU84MWE5YzAzQT09?=
Content-Type: multipart/alternative;
	boundary="_000_AS8PR10MB5073014B65BD921986587E1BFD942AS8PR10MB5073EURP_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aec57c6e-7f60-4a99-4ad5-08df245fd08c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 10:43:24.9097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wyRXa1D+wNo11NtHoL7HbJiD7f9GANzBgQz5s5cgjnnZEITWHQtWrgg38iJCnRlijIknB5lJMm0f58TnzBWY9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR10MB9601
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 10:43:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247385

--_000_AS8PR10MB5073014B65BD921986587E1BFD942AS8PR10MB5073EURP_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlc2UgdHdvIHVwZGF0ZXMgd291bGQgcHV0IHdyeW5vc2UgYWhlYWQgb2YgbWFzdGVyIGFuZCBi
bGFja3NhaWwuDQoNClBldGVyDQoNCkZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9u
IEJlaGFsZiBPZiBTYWRpbmVuaSwgSGFyaXNoIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpT
ZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgNywgMjAyNiAxMjozMCBQTQ0KVG86IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW3dy
eW5vc2VdW1BBVENIXSBnbGliYzogc3RhYmxlIDIuNDMgYnJhbmNoIHVwZGF0ZXMgdG8gNTYyY2Q3
YmFkZA0KDQpIaSBhbGwsDQoNCnBsZWFzZSB0YWtlIHRoaXMgdXBkYXRlIG9uIHRvcCBvZiBbd3J5
bm9zZV1bUEFUQ0ggdjJdIGdsaWJjOiBzdGFibGUgMi40MyBicmFuY2ggdXBkYXRlcyB0byA5Y2Rh
NmZjOTZhYi4NCmh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1j
b3JlL21lc3NhZ2UvMjQ2OTA3DQoNClRoYW5rcywNCkhhcmlzaA0K

--_000_AS8PR10MB5073014B65BD921986587E1BFD942AS8PR10MB5073EURP_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpBcHRvczt9DQovKiBTdHlsZSBEZWZpbml0
aW9ucyAqLw0KcC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJn
aW46MGNtOw0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkFwdG9zIixzYW5zLXNl
cmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5
Ow0KCWNvbG9yOmJsdWU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQouTXNvQ2hwRGVm
YXVsdA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25seTt9DQpAcGFnZSBXb3JkU2VjdGlvbjEN
Cgl7c2l6ZTo2MTIuMHB0IDc5Mi4wcHQ7DQoJbWFyZ2luOjcyLjBwdCA3Mi4wcHQgNzIuMHB0IDcy
LjBwdDt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5
bGU+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWRlZmF1bHRzIHY6ZXh0PSJlZGl0
IiBzcGlkbWF4PSIxMDI2IiAvPg0KPC94bWw+PCFbZW5kaWZdLS0+PCEtLVtpZiBndGUgbXNvIDld
Pjx4bWw+DQo8bzpzaGFwZWxheW91dCB2OmV4dD0iZWRpdCI+DQo8bzppZG1hcCB2OmV4dD0iZWRp
dCIgZGF0YT0iMSIgLz4NCjwvbzpzaGFwZWxheW91dD48L3htbD48IVtlbmRpZl0tLT4NCjwvaGVh
ZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSJibHVlIiB2bGluaz0icHVycGxlIiBzdHlsZT0i
d29yZC13cmFwOmJyZWFrLXdvcmQiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAuMHB0O2ZvbnQtZmFtaWx5
OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMtc2VyaWYiPlRoZXNlIHR3byB1cGRhdGVzIHdvdWxkIHB1
dCB3cnlub3NlIGFoZWFkIG9mIG1hc3RlciBhbmQgYmxhY2tzYWlsLjxvOnA+PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAuMHB0
O2ZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMtc2VyaWYiPjxvOnA+Jm5ic3A7PC9v
OnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTAuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMtc2VyaWYiPlBldGVy
PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8
L286cD48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItbGVmdDpzb2xpZCBibHVl
IDEuNXB0O3BhZGRpbmc6MGNtIDBjbSAwY20gNC4wcHQiPg0KPGRpdj4NCjxkaXYgc3R5bGU9ImJv
cmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0UxRTFFMSAxLjBwdDtwYWRkaW5nOjMuMHB0IDBj
bSAwY20gMGNtIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZiI+RnJv
bTo8L3NwYW4+PC9iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZx
dW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZiI+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgJmx0O29wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcmZ3Q7DQo8Yj5PbiBCZWhhbGYgT2YgPC9iPlNhZGluZW5pLCBIYXJpc2ggdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc8YnI+DQo8Yj5TZW50OjwvYj4gV2VkbmVzZGF5LCBPY3RvYmVyIDcsIDIw
MjYgMTI6MzAgUE08YnI+DQo8Yj5Ubzo8L2I+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc8YnI+DQo8Yj5TdWJqZWN0OjwvYj4gUmU6IFtPRS1jb3JlXSBbd3J5bm9zZV1b
UEFUQ0hdIGdsaWJjOiBzdGFibGUgMi40MyBicmFuY2ggdXBkYXRlcyB0byA1NjJjZDdiYWRkPG86
cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SGkgYWxsLCZuYnNw
Ozxicj4NCjxicj4NCnBsZWFzZSB0YWtlIHRoaXMgdXBkYXRlIG9uIHRvcCBvZiBbd3J5bm9zZV1b
UEFUQ0ggdjJdIGdsaWJjOiBzdGFibGUgMi40MyBicmFuY2ggdXBkYXRlcyB0byA5Y2RhNmZjOTZh
Yi48YnI+DQo8YSBocmVmPSJodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1i
ZWRkZWQtY29yZS9tZXNzYWdlLzI0NjkwNyIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjQ2OTA3PC9hPjxv
OnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5UaGFua3MsPGJyPg0KSGFyaXNoPG86cD48L286cD48L3A+
DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_AS8PR10MB5073014B65BD921986587E1BFD942AS8PR10MB5073EURP_--

