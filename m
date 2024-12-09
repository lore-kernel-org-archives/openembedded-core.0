Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A801E7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 09:43:21 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (APC01-SG2-obe.outbound.protection.outlook.com [40.107.215.126])
 by mx.groups.io with SMTP id smtpd.web11.97171.1733737393025648226
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 01:43:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=BR7k27u5;
 spf=pass (domain: aspeedtech.com, ip: 40.107.215.126, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GizcPk6XFVvJkHTA0f3Q24LIXJvDKFnJWFbq23JRU1+rp/8s51RXA85pZPoMsxNhB+YVj0FEs85Co8QtHmWkwGoEwp3oG6CWTldbOZxnoy3BuODCd4m8OEV0TCm5ASZLq3soTRQpcVJ41fFeGdeoNq70etHvnbJDuKcXC3ZsxgKrGwbxPy4S664hntO9Pe4bUmOsi2arHadkYgnuJ+/XeQP62e4t21vQc9UJBx+C5w4YYYSXoRGYNsbWpJtZbhsR2zEf5EUBBKLtqJc5eVpG2ymKVRgAA8Mh8eMtFpqFgBQ0yweYTAJkzroUArQRPKrK/PbsaiuGgt1MFipfXRTP+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtVtb/BUznRDlbTfTlDDirfGzOTgxaC0nErJSVFw3lA=;
 b=etJH1BjzUK5EAOIQwA513dJMIB99rInfo4MMGrBOk3OdhraTIkY90FJXiOxMJheMgNWIDlQlrGXEsPtgCoX8QhrTWbxDIe0C5vWS5ZJjmHUXEbSEZ3iqVMOv/RA1hnTBkTspLhauDykMNPtS7L0JjniFUi4MLn6FieF2w2eMHzk9IInsdRq/AzAebtKqSjRUal8c5Ork7RIAywtvpW6Dq6VT6ZNSUVc2DJwYQGM2IG7qzi2gEYna7YMqxhsbvqar7d/Z7CKB4qNK23un4NV+PG09WoAx3i3PmKBO23BDPsSy158gmZFCaiCj3jTCYK1vW1Iusdiilr1rjK70Ehw1+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtVtb/BUznRDlbTfTlDDirfGzOTgxaC0nErJSVFw3lA=;
 b=BR7k27u5Npo7w9WWv+CrL/Sqeass7DNM4HlcYwPvqMf9pr2WLFKCa/WCaPRpjxXCroGhTm35cFahwkK7W9nT2jkPA6Rxc0ImrI45yxiLx+CX8/KnYBnLod1/0750D2dcfmQ4qhwChdK937AOecHGh2Cytb6pnnM3V0n5Xzl/MIqrNYJwFakbkX/bdNn+Zn2k2BmWp+8XSPGlbFbj6xnZuK0r4/CEXRqvYnjgwVvyXqApswi93sWK97W9RN7ocFnmYauAfmFKmEUiXODXFaCnzg55/kaIxBw0+Am0T6SEJFCmyhgieA93kfqUTq50oWxqY/7vQvDaCO1cRkA+ZZymWA==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 SEZPR06MB5069.apcprd06.prod.outlook.com (2603:1096:101:44::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.10; Mon, 9 Dec 2024 09:43:03 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56%7]) with mapi id 15.20.8251.011; Mon, 9 Dec 2024
 09:43:03 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Troy Lee
	<troy_lee@aspeedtech.com>
Subject: RE: [OE-core] [PATCH v1] python3-pyhsslms: Add 2.0.0 recipe
Thread-Topic: [OE-core] [PATCH v1] python3-pyhsslms: Add 2.0.0 recipe
Thread-Index: AQHbShYvvipsUfPbXUireoBJ0iy5+rLdpAoAgAAApHA=
Date: Mon, 9 Dec 2024 09:43:02 +0000
Message-ID: 
 <SI2PR06MB504120C9AFEC4523F1911A21FC3C2@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <20241209084142.939432-1-jamin_lin@aspeedtech.com>
 <CANNYZj_i1OCJMUT6oc9fSo0=eb=P+zS8zj=W-aP=aVhOjoekcA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_i1OCJMUT6oc9fSo0=eb=P+zS8zj=W-aP=aVhOjoekcA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|SEZPR06MB5069:EE_
x-ms-office365-filtering-correlation-id: 539bbca7-9061-4aef-e28c-08dd1835e031
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?enlpY1hqWE9kNEh6V0d1RS9ST3U4Z2k0czNzMHczQjNsMmhtbzFTMHE4a2Fy?=
 =?utf-8?B?YlMvbzZKa1hOUU84QWFRaVBXY1VQdkxnN1podnpsWjhUMVhmYnBqaitLVng2?=
 =?utf-8?B?bTBBR3hTblRrN2YxS0kyc3NvYUtaTHJMRS9zdkt1OGFMT1hCaUcvTlEwL0xD?=
 =?utf-8?B?V1dyY0xxcjNHOFE5cURZcmZEa0E0bnR0Q1N6WVk3K08wVnplVVJYUU8zRHZi?=
 =?utf-8?B?V2JoSlhwYktDVDl3Ymh6Yy92MXgwT05lajhXdWtXV3ovUHpXNlN5NmV0bmtK?=
 =?utf-8?B?c2Q3YTl0K3c1dXg4QnIyYnNNeFRZTTB6WHowMU5NdEpKemcwaFZ5eGtEL1hC?=
 =?utf-8?B?TllNMjgwS1A2dVRrK1FuM1NTNVYrWGYrL1RvMm1IVmlCRDd6WUZ5LzFDZ1hB?=
 =?utf-8?B?Q0tkSHNvTElPOG93eStOQ01oNm9FN1ZFdy9mS0VEZWFQR1RPSW9hTEdHNEo3?=
 =?utf-8?B?T3doT0dDY2tRS1RTZUw5Ym0vT2g3R2pCemo0VnBrNm11Rkd5QmFYNzFtOHNH?=
 =?utf-8?B?c3NyemtwUE16WlZmMHZCWW9aRU5DeUxLdU1lN0orNTJFdG45Z3FJa2pmeVc5?=
 =?utf-8?B?RGphZE5DdHRJc0lneGJFLzcvL2xKeWs4NU5ZeGN0VUZxUU5KYzFnRWFqa0RI?=
 =?utf-8?B?M2RwL3F1ZEdBWCtxUTZQSE9xTmowYUx6czlNWmNKWGtVeldyWDhtTE11MEdB?=
 =?utf-8?B?MnhLREVNazJzMk01RHVTaUdxZExvdG9zWHhFUnE2S1lJbDdlaTljejRUeE16?=
 =?utf-8?B?RnpOZ1VCUzVzc2VwckpYWUNnMnVvZFJ6RU1WY0FtUXVHMHpnMXhISTJpS01q?=
 =?utf-8?B?UU5uVUZHYlB4TXlBRFdjQlF0SXZ6VkZrMXRBWTRzWGFsanNLbmdVWHZMNm9h?=
 =?utf-8?B?OG9VS1huYUFUT25ZM25VdnJ3WmY2L3JMMWtHZzBIN2txRDR4U2Y2UE5FVkJW?=
 =?utf-8?B?TXVvK1hwb3lMTFo3cHBkV3c1ZnVQWHhmTzF3eXJTS0EwMjcrdHJTK2ZyazFN?=
 =?utf-8?B?KythcUdzam1Vb3N3YU02OUg0YkNOeGt6NWtMSzNyckFvais4cGVPaE94STdZ?=
 =?utf-8?B?NmIwK2N4M1Y0aFpUQk9rbS9VMVRSOVhJcW9ua3BPOCswdXIwL1NXUmhsU0hn?=
 =?utf-8?B?RUJkZ3Z4enkxdHdMbWVjYnU5MU0zRlV1Nnp0SFIwZDlLb3BwcXBmSkhQY1Fm?=
 =?utf-8?B?U2tFYkhtdDZXelFoaFNIRmhHYm00MXo5YmtxSnh5UEhjVzdyOHdmWGt2Qkg1?=
 =?utf-8?B?bEw4YTdCYVhlOHdGa010RC9kTzg2MWNLdHZaa09TeDFvNkNyZG1mMjIvUmlo?=
 =?utf-8?B?WWZVSTJQZk15dExqZ1V1azMzL1h1QmFTdkl0YnV4V05vcEZoczM4VlArL1lY?=
 =?utf-8?B?Q25nZXpXdTU1RWoyL2ZIQ0pWY0FhcWg2K29vdmxFbDlBOWhEbVJtRmp0OG41?=
 =?utf-8?B?MDVqMURTallwUHNkci9JT3k2YlBJWUV3UU9oRVhjNHlzVXhJenowdmJpbktM?=
 =?utf-8?B?Rjg3YTFtUXdhUUppUEtibmg2Ump1UW9jMXR1V0xnVlNZV2dJUVY4UmtBRGNG?=
 =?utf-8?B?aTRQV3hFdEJUSURVREcvZHpBREkyemdpbzJHTlR2SVNiUVhmcWNnUEE0U3I0?=
 =?utf-8?B?TFdhUEZDdkFUdTNaS1VJS0srTU1PbGdaRE9VZDYzRGNnOC95aVhyRG1lcnBI?=
 =?utf-8?B?cG93akhONzJPNmVYU1pIamVtWnE3cklKY0R0WlFybkRTSEZYUWl1b29YMlg3?=
 =?utf-8?B?S3QzRlE4ZHIxMUJ5a0FkTENWRkd2cTVyWEU0K015aktRUEdCa3ZOTThPZXl2?=
 =?utf-8?Q?xLl9gAkh1vqcPjvRKP3Ci7cEIhC92b8UA2E2E=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5041.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eVNOT0ZEbXBpMURCN3BubW5OMEk0cnJaY0JLOHRkaDQ2MXRIR3FxaS9qWkxl?=
 =?utf-8?B?ZGY0TzF4Q1MwWEhEaTJZc2dER3R2aWx3dWVLVVFPVHVVZHpkMU9lZnZ0anY3?=
 =?utf-8?B?dE1DOXNWcGJ3bGkvWGx3UUZhbDY2NXFOSXlaNzQ0V3Y1V2FGNGNsUTdrNlFB?=
 =?utf-8?B?MEQ0VURDS1BBbXZVYzlDNlJzZDVkblkzdVZxL2ttYldtd0RSNUtybUcvQVBk?=
 =?utf-8?B?U0F2L3FkU0Z4MklNTkw4TUhlaklQaXh6RDBJQmVzdGVyZ0EvU1BPMnFmVWhV?=
 =?utf-8?B?cDM2ZXdXdjFGSHBLd1ErSGZ6YkNFam14YnUzS2xDM0RzNXptOTVIUTJpRzZ3?=
 =?utf-8?B?ZDVaQnZOandmMmIwaDF6aTcwKytZL1V2RTJDMFQ5U3UySk9RUElNYXdVQUpK?=
 =?utf-8?B?QWZWVFhLOFdleXFLU3k4YWM0NEVTamh0YTEzdU9tU3pFUjFiSDNDQkRpdm01?=
 =?utf-8?B?Nzc3ZjlYWHZkTzlieHZvM0pFQjdrc0ZuOEFPWTJacHFzMWtrMHVhbDBaWFl2?=
 =?utf-8?B?K1hTaFhJWHl0bFh2NFJnbStwcjRtMS9zRVFJVWhySHRUd25KMHNVTTByaHlJ?=
 =?utf-8?B?bmJ5YmN5RytxNjJKNXNGQ01sTS9lU1hYWnBJTWxXOEpIbS9EZzFzTmJpNVlC?=
 =?utf-8?B?MjV3YkEvM2N4dDdZWHRnOEVVTXVUalo3NjNpOFR2bWJXRlM1c1ZING02RE9I?=
 =?utf-8?B?cGhNdnBZR2FybnNsN1V3S2lWQkRxUkMxcll5WlZWRE1WZVJtZFZ4US9IeXNp?=
 =?utf-8?B?ZHM2K2RuR0wwWlQyeFhlNFZyazRDVnNxYmFmVGJmQjgzaXVXZVdOM3RVNnN2?=
 =?utf-8?B?cFQ4eXZDTjFrTHJYaDRsU1REcjl4MkJRMUJTOXl0cjlIeTVJM2g3bXlaZEU4?=
 =?utf-8?B?NjRQRjdXd1o3eUk5Nng3NjJaRGx3RUNVZEFZZ1pZbGU4OGZjMkV0RWE3enRL?=
 =?utf-8?B?cVpOZHhKNVBVUUdtYnkra1FZWHB2OEs2bFk0eVIxMlg0dDBUK09SSStZWEtQ?=
 =?utf-8?B?czc0dkpHY3liVVVVWWJYUXQxT2x2RjNZVzdJN3RLMU9QZ2tkMEpxc3pkamRJ?=
 =?utf-8?B?WGc5WmtoMHFRM09MNEFtR1R4ZVFPdEVEZkxHQ3VqN0NvSHRQVFIvUkhGcVFx?=
 =?utf-8?B?Rmg3UUg5akVRVFdZZjd0ZlgvRkJDY3FMVnFDMlRTNTlyUGczUGNZczFSTm1T?=
 =?utf-8?B?Y2pHQnorbmt5KzN1N0p4VnJoSy8ra0lwaUdCdWpmK3FHeS9rS25pU1V2NG56?=
 =?utf-8?B?ZGpBZzc3allUWnVOeVYvQjZRdTdRc1JuT2Jtd1U2TVhlS0QwL2RyVDVFdEFh?=
 =?utf-8?B?dkdwaERQOVVjRWJ6N3prazdaa0tqQnQ0Y3BjdmMxbjAzVldibUxZMmxVdE9E?=
 =?utf-8?B?MHR6NmN5VTczdm5TdkQ0eUJubVl0R0hTL3BlTVArQWdlN1piOGR5V09SMjBi?=
 =?utf-8?B?NUlld2tOYVNwaXkwUld1WGl3ZFRHSWc0REQzbEZzU1R0Qk9aNnRSL3c1YWFM?=
 =?utf-8?B?Mjd1Y1FzeEh5aTNhSUxQQUZhWDgyZkNsTnV6VmwyZFRqR2ExT2NJb04xOGV6?=
 =?utf-8?B?Q1hNTmttOFVibUJwakFzMWRuc0Mzc3JpcnhGOXJnd2hXYjQxellmRUoyeEU4?=
 =?utf-8?B?bFVQY3kxNUtIYm9yN2JUdUJLdmtwVzc5ZXpHSzRzd0t4TTdNU09mVyszc2VW?=
 =?utf-8?B?RXpLcXBoNFJaa012VXcwYXRTdnIvS2lVSE1GWDd4NGlnVDJ4azQ0dGQyNXBU?=
 =?utf-8?B?M3R3c2ZmdEhoOStuVC81YmtieUVVL3hqdWVvNWdwQ0haUkl3WlZNMGsvQlZ3?=
 =?utf-8?B?aG4zc0JZMjdIQml6UEUwTU5vV1lmWU5WSGQ2aENucm9oV3RKM1k1dXA2cFBx?=
 =?utf-8?B?YTVoUURJVkNqZTFjQXcvb2R1L1lSTy9oYWFKTUE5Q3cxVGw4eVZhTThjZzkz?=
 =?utf-8?B?b1lzVjhlQ0tVREhBQm90ZjU4Y2szVUdhejdNMVIwT21Wa3g3bVVYbk5GTHlt?=
 =?utf-8?B?SE93V2FmSnZqTm5BalNHeXA5VXd1ZUdMaUk0cTMxRDZyMU5QTVAyOW8yTk1w?=
 =?utf-8?B?cVI5dWhlaWtJd2RGUnc5MDRKMURDOWs5c2VyOHNMZCtwaVYvdnk3amlJcVhQ?=
 =?utf-8?Q?cbaJ84XHIeLhSvJJo6kpLjrx0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 539bbca7-9061-4aef-e28c-08dd1835e031
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 09:43:02.9911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aEWIkY+0ea1kAYm6NMYkWI3LUHHuCW6eC671ILeAN9A7h3p6LeCwY23dnSWo3874YmtKvwq4zbAryqLjYi32P6sNatsOYZpfpSjFSLY5CJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 09:43:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208477

SGkgQWxleA0KDQpJIGZvbGxvd2VkIHRoaXMgcmVjaXBlLCBweXRob24zLWNyeXB0b2dyYXBoeS5i
YiBhbmQgc2VuZCB0aGlzIHBhdGNoIHRvIHBsYWNlIHB5aHNzbG1zIGludG8gT3BlbmVFbWJlZGRl
ZC1Db3JlL21ldGEgbGF5ZXINCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuZW1iZWRkZWQvb3BlbmVt
YmVkZGVkLWNvcmUvYmxvYi9tYXN0ZXIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWNyeXB0b2dyYXBoeS5iYg0KSSBhbSBva2F5IHRvIHJlc2VuZCB0aGlzIHBhdGNoIGFuZCBh
ZGQgdGhpcyByZWNpcGUgaW50byBtZXRhLW9wZW5lbWJlZGRlZC9tZXRhLXB5dGhvbiBtZXRhIGxh
eWVyLg0KDQpUaGlzIHB5dGhvbiBtb2R1bGUgaXMgdXNlZCBmb3IgTE1TUyBhbGdvcml0aG0gc3Vw
cG9ydCBhbmQgaXQgaXMgbm90IGEgSEFSRFdBUkUvQk9BUkQgc3BlY2lmaWMuIFRoaXMgcHl0aG9u
IG1vZHVsZSB1c2UNClNvZnR3YXJlIHRvIHNpZ24gd2l0aCBMTVNTIGFsZ29yaXRobS4NCkkgdGVz
dGVkIGl0IGluIE5BVElWRSBidWlsZCBlbnZpcm9ubWVudCB3aXRoIGRldnNoZWxsIGFuZCBteSB0
ZXN0ZWQgc3RlcHMgYXMgZm9sbG93aW5nLg0KDQoxLiBERVBFTkRTICs9ICJweXRob24zLXB5aHNz
bG1zLW5hdGl2ZSIgaW4gdS1ib290XzIwMjQuMTAuYmINCjIuIGJpdGJha2UgLWMgZGV2c2hlbGwg
dmlydHVhbC9ib290bG9hZGVyDQozLiBBZGQgbXl0ZXN0LnB5IGFuZCB0aGUgY29udGVudHMgb2Yg
dGhpcyBmaWxlIGFzIGZvbGxvd2luZy4NCmBgYA0KaW1wb3J0IHB5aHNzbG1zDQoNCnByaXZfa2V5
ID0gcHloc3NsbXMuSHNzTG1zUHJpdmF0ZUtleS5nZW5rZXkoJ215a2V5JywgbGV2ZWxzPTIpDQpw
cml2X2tleS5zaWduRmlsZSgnbXlmaWxlLnR4dCcpDQpgYGANCjQuIHRvdWNoIG15ZmlsZS50eHQN
CjUuIHB5dGhvbjMgbXl0ZXN0LnB5DQoNClRoZW4sIGl0IGNyZWF0ZWQgc2lnbmluZyBmaWxlLCBt
eWZpbGUudHh0LnNpZy4NCmhleGR1bXAgbXlmaWxlLnR4dC5zaWcNCjAwMDA2YTAgOWVmOSBkNTM3
IDExYzAgOTc2NiA0MTE2IGNjNWMgY2RjYyAwNjY5DQowMDAwNmIwIGY3ZjYgZTIwZiA0YzExIGU0
ZDggZmJkYyBiY2E1IDMwMzcgYjRjOA0KMDAwMDZjMCBjOGQyIGQ1ZjUgMTgxOSBhZGEzIGE3YjAg
Y2UyMiA1MzM4IDdhNTQNCjAwMDA2ZDAgYmRmNiA3ZTcxIDgxMjUgNzU2ZiBkYWJhIDRhNDMgMTNm
MyBiNjljDQowMDAwNmUwIGU3MDIgMDQwZiA4ZTg4IGVhNzkgOWVkMSBlZjQ4IGMxMzUgMjM0Yw0K
DQpJIHJlZmVyIHRvIHRoaXMgUkVBRE1FLm1kIHRvIGNyZWF0ZSB0aGlzIHRlc3QgZmlsZSB0byB0
ZXN0IHRoaXMgcHl0aG9uIG1vZHVsZS4NCmh0dHBzOi8vZ2l0aHViLmNvbS9ydXNzaG91c2xleS9w
eWhzc2xtcw0KaHR0cHM6Ly9naXRodWIuY29tL3J1c3Nob3VzbGV5L3B5aHNzbG1zL2Jsb2IvbWFz
dGVyL1JFQURNRS5tZA0KDQpUaGFua3MtSmFtaW4NCg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVd
IFtQQVRDSCB2MV0gcHl0aG9uMy1weWhzc2xtczogQWRkIDIuMC4wIHJlY2lwZQ0KPiANCj4gSGVs
bG8sDQo+IA0KPiBJJ2QgbGlrZSB0byBiZXR0ZXIgdW5kZXJzdGFuZCB0aGUgdXNlIGNhc2UgZm9y
IHRoaXMgcmVjaXBlLiBXaGF0IG1ha2VzIGl0DQo+IGltcG9ydGFudCBlbm91Z2ggdG8gYmUgaW5j
bHVkZWQgaW4gb2UtY29yZSwgYW5kIG5vdCwgZm9yIGV4YW1wbGUsIGluDQo+IG1ldGEtcHl0aG9u
IHVuZGVyIG1ldGEtb2U/IElmIGl0IGlzIGluZGVlZCBicm9hZGx5IHVzZWZ1bCwgc2hvdWxkIGl0
IGhhdmUgdGVzdHMNCj4gdGhhdCBlbnN1cmUgaXQgd29ya3M/DQo+IA0KPiBBbGV4DQo+IA0KPiBP
biBNb24sIDkgRGVjIDIwMjQgYXQgMDk6NDEsIEphbWluIExpbiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiA8amFtaW5fbGluPWFzcGVlZHRlY2guY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiA+DQo+ID4gVGhpcyByZWNpcGUgd2FzIHBsYWNlZCBpbiBtZXRhLWFybSBt
ZXRhIGxheWVyLA0KPiA+IGh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvbWV0YS1hcm0vdHJl
ZS9tZXRhLWFybS9yZWNpcGVzLWRldnRvb2xzL3ANCj4gPiB5dGhvbi9weXRob24zLXB5aHNzbG1z
XzIuMC4wLmJiDQo+ID4NCj4gPiBIb3dldmVyLCB1c2VycyBtYXkgd2FudCB0byBidWlsZCB0aGlz
IHB5dGhvbiBtb2R1bGUgYnV0IGRvIG5vdCB3YW50IHRvDQo+ID4gYWRkICJtZXRhLWFybSIgbGF5
ZXIuIFRvIG1ha2UgdGhpcyByZWNpcGUgbW9yZSBmbGV4aWJsZSwgbW92ZSB0aGlzDQo+ID4gcmVj
aXBlIGZyb20gbWV0YS1hcm0gdG8gT3BlbkVtYmVkZGVkLUNvcmUvbWV0YSBsYXllci4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IEphbWluIExpbiA8amFtaW5fbGluQGFzcGVlZHRlY2guY29tPg0K
PiA+IC0tLQ0KPiA+ICAuLi4vcHl0aG9uL3B5dGhvbjMtcHloc3NsbXNfMi4wLjAuYmIgICAgICAg
ICAgICAgICB8IDE0DQo+ICsrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBp
bnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1weWhzc2xtc18yLjAuMC5iYg0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWhzc2xtc18yLjAu
MC5iYg0KPiA+IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5aHNzbG1z
XzIuMC4wLmJiDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAw
Li5iMThkMWM4ZTg2DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1weWhzc2xtc18yLjAuMC5iYg0KPiA+IEBAIC0wLDAgKzEs
MTQgQEANCj4gPiArU1VNTUFSWSA9ICJQdXJlLVB5dGhvbiBpbXBsZW1lbnRhdGlvbiBvZiBIU1Mv
TE1TIERpZ2l0YWwgU2lnbmF0dXJlcw0KPiAoUkZDIDg1NTQpIg0KPiA+ICtIT01FUEFHRSA9Imh0
dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9weWhzc2xtcyINCj4gPiArTElDRU5TRSA9ICJNSVQiDQo+
ID4gK0xJQ19GSUxFU19DSEtTVU0gPQ0KPiAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT1iYmM1OWVm
OGJmMjM4YzI5MDJjYTgxNmI4N2I1ODU3MSINCj4gPiArDQo+ID4gK2luaGVyaXQgcHl0aG9uX3Nl
dHVwdG9vbHNfYnVpbGRfbWV0YQ0KPiA+ICsNCj4gPiArIyBNYWludGFpbmVyIHJlZnVzZWQgdG8g
dXBsb2FkIHNvdXJjZSB0byBweXBpLm9yZywgYnV0IHNhaWQgaGUgd291bGQNCj4gPiAraW4gYSBm
dXR1cmUgcmVsZWFzZS4gIEluIHRoZSBtZWFudGltZSwgZG8gZ2l0aHViIFNSQ19VUkkgPQ0KPiAi
Z2l0Oi8vL2dpdGh1Yi5jb20vcnVzc2hvdXNsZXkvcHloc3NsbXMuZ2l0O2JyYW5jaD1tYXN0ZXI7
cHJvdG9jb2w9aHR0cHMiDQo+ID4gK1NSQ1JFViA9ICJjNzk4NzI4ZGVlZDZkM2Y2ODFjOWU2YmZk
N2ZlOGE2NzA1ZjU2MzhiIg0KPiA+ICsNCj4gPiArUyA9ICIke1dPUktESVJ9L2dpdCINCj4gPiAr
DQo+ID4gK0JCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayINCj4gPiAtLQ0KPiA+IDIu
MjUuMQ0KPiA+DQo+ID4NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+IExpbmtzOiBZ
b3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiA+IFZpZXcvUmVw
bHkgT25saW5lICgjMjA4NDc1KToNCj4gPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
Zy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIwODQ3NQ0KPiA+IE11dGUgVGhpcyBUb3BpYzog
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExMDAwMjc5Ny8xNjg2NDg5DQo+ID4g
R3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3Bl
bmVtYmVkZGVkLWNvcmUvdW5zdWINCj4gPiBbYWxleC5rYW5hdmluQGdtYWlsLmNvbV0NCj4gPiAt
PS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+DQo=

