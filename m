Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E34CEBFD1C
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 09:00:13 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.267488.1776070807456555025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 02:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=VIwktb7y;
 spf=pass (domain: siemens.com, ip: 52.101.83.64, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sue273gjNfNZLbNyUbMppmSi4293eDQNjetVWqj3BUkJsyB4fLKCcOD+x5LobnSMcBXw/t/nQmVwjCmFQshcw7EaEbaligd2fGeveRfmmSi3R2V3O67pcHo0Z9WHv6a3glNy0V0LaP+NaS4UV1eK7fE6bMRCuEBmQvnlSK4Hd5sRzrTRohMlEXmHhxSWgT90PmADi826yD0RrkUV6Bt5zTSQhvjINZ3yTQdIBDaX0aJh2/O29TA5c3H6g5PxZCLiW+JmhK7ZHdSat0T+d9fOL1ZiVRGvz5I/elndumUmU2z5u+UOTUMx9Rdmotc2QHZ+aiyO4eKjzPloW2Zwh5oKXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHteX0w5Che7AKqloxap9E8oa4e3oH+qEGEF7lhAmxQ=;
 b=jAPov3HqrW4TpEa/Ycwrq3YRkYAmH4hQuMaG74N2uux+euj6OUB2F36vMXepVDxK8AkLigoiLAWbfgsg76A3rBB2+9WG7Hnc4s8GiDOnr8dSTt2oIxG9tCsbytdRpNuKP1ePtoo7+SgBOvGmcdPp6bbrzBMOzmWWlceDU1ysASSgsME/TpmuYydsT34fahQN7IbcvL8tPWSWA1tS4NZJ3mfDnsI+dbw6RTVjIH0V0lqi2r45MH354NlAwbutO5B0rHMaGbqt8I8Zlo7kKM0OC2VsRCXz9l4mlgA0kM0tVa7cUEh7nkgmYPbHCxvDGgWFN66NvRFw/RUBu0ITc9MYPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHteX0w5Che7AKqloxap9E8oa4e3oH+qEGEF7lhAmxQ=;
 b=VIwktb7y7fUq8dX7Q2U0InRomSj1pRsOgEQEqdfanUTRweYc2YM2HWmYi7DI+jL2vAQ9wn1jhO4KuzNzUcaEEUe8YVV/1aldh0AhwN43A0hySLI72873rvAk3ehPNpRIkUm2CY+wfnY5KG+p7KWCt3IMrEktGiDP92ih32BC6FzvZCka8jP0dnWD1XwK68R76+EHrF42cUMqtrI+DMUn1y0odMukuC5JkHFm+ih0rZCMLOgXYpWdnKkHx9kfITq8iFPU4Ehg4Gb99dpG9pOpXjvmV+oHelremOqu5NEbl0e0WMxgG7LOoaIqQEuZtKao6ZoTTRkX+Jhdgrv39BPVvQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI0PR10MB9415.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:2ce::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 09:00:02 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9769.044; Mon, 13 Apr 2026
 09:00:00 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Benjamin Robin <benjamin.robin@bootlin.com>, Ross Burton
	<ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH 2/2] xwayland: set status for CVE-2024-21886
Thread-Topic: [PATCH 2/2] xwayland: set status for CVE-2024-21886
Thread-Index: AQHcyq2co6Yk9IO1d0Coj5Am6U3L27XbxjhQgAAYqICAAAhHgIAAq0GAgAAeclA=
Date: Mon, 13 Apr 2026 09:00:00 +0000
Message-ID: 
 <AS1PR10MB56970D288737A35313E2C260FD242@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260412185201.2556780-1-peter.marko@siemens.com>
 <13986342.uLZWGnKmhe@brobin-bootlin>
 <AS1PR10MB56973C7FC237B95B05B7B1DBFD272@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <3410842.44csPzL39Z@brobin-bootlin>
In-Reply-To: <3410842.44csPzL39Z@brobin-bootlin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=a9e1a780-0af6-49c7-98dc-fdbdf4203fee;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-04-13T08:54:14Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI0PR10MB9415:EE_
x-ms-office365-filtering-correlation-id: 06d89546-671b-47d0-77b8-08de993b0b2a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003|55112099003|38070700021;
x-microsoft-antispam-message-info: 
 ckdRglnFoQNlr3lWUPNJJoams9CCwAPqJ/vkREXwNKA7Sya3/Uw3QDIcc2HbBlJabWFqqFTWW7XjvCHqs+FCMe9Wl1wVqZAbqwYkWUHrBF2RNkhyO7syiAg6WIQ+akzVopITGsJoRH9jmJGUOVQ8wva177zJs2aT2qZ6/a4/XTzSIOiV1qekgIidjV0johqdAJNUkpiCNvsA2TSNP7nVQS9kdU2CvtfpIXrn5d9gJbOgmaRBC5YWFzsHvaf/XTsiqOEy/BwmiMmhXwt6IrdC3gJD4TCHxlrYGpRFpPLrThPyh+vMChrtMz4cnU/eSJ9RowndXCm3Dt90Ds7oyAAnIB790vF02Wl8cnDP+/MEwOUcT0iESTun12rnIXtZk56ruNjhq0Ub8DrZ0lX+WXKlkTZqz+GkiLSnIXO/0x78hhI8gl4p3EMA7qcePaUjSqd5rIno/XZcZeiDHnMn/VWKOy7RXygcnKiVGknncM/3zhrZl9Gp6iD2mlIyardw/QYNUb18KckZ7c9J+53mTUzclUkt47z/hY6z1Q/dU0G++2hqENHUi9RqgUQvr5jEH3nTSJWbEJV94KR4FYaHBSB+m//qc2dD4elevbSOFkGo5Sf/fWQOM99R3ZZ4ZTUK0sswBT+kS0IS2Uxf19cladjqKM0YEyD2P5bds0Cjm7QCN+x/JCbRTu5SU7tOEj7rqmFiSAOF9/aXLft/BxX73gaL6QvZqCvXf+2Ws/crNN/Kl40=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003)(55112099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K3FHcU5KRVoxNWlUTE02Y0srRXBNOEtxN0Y1V1lpNkdlMFdIK0h4S3pRYjRP?=
 =?utf-8?B?S3JaYTdMTURsalozb0tzSnJGQ2kyNFBzcmxiaE5hR3ZWeEY1NFN5YXlyMmNO?=
 =?utf-8?B?VkpkV1R3ZkQxWk85ZjlHT2IydERZUTZFQ0dpeGhZZ25kd2NldFFqanpuNzZi?=
 =?utf-8?B?aCsyU1FlVHgyZHUrZ3NQcitXcHRMSXBWRCtBNUpuS3h6WHY1ckc5YzFGOWtu?=
 =?utf-8?B?UEhlZjNqTVl3dWsrdXRNS3pyZGpSVFF5cURSYURFeVVwcnArM002MExxZ2JE?=
 =?utf-8?B?TFR5anQ2SDFhY3hacmlaSjlqL2Nqb1NaWFV4ZVY1dEdtOFpsZm5EN0FMUUND?=
 =?utf-8?B?TDZLVzQ4WWExNGJIL3N5d0FkU0VpQjU2VDJCZlljUVE5MUNHNjhvUmwwL1Qy?=
 =?utf-8?B?dUwwOEpPWG1xK1FGZEJWUWJQbVltT1Zub3VEUEtZSTJJQ0p6WlFwVmFzZzdr?=
 =?utf-8?B?ZDdYMm8veThlaWxJM09VTzB1aG5ycjVJR1pwYS84UnNGc2xvTFhZQ2ticFI5?=
 =?utf-8?B?Sk5qcm5BS09ybUZIdEE3VVdJUHVSUmdsMGZvL3YvQ1AyTzBKNmRJejBBKzRx?=
 =?utf-8?B?TC9ZUTNob3JLN1NXdG5MakJJQ2pEUUg5cVRsWTZ2RDU0UHdqN0FmYmRQSUFy?=
 =?utf-8?B?bmkvR2xiRnBCbE1uaVdtTzMvSG9mUjhXYkRZdTZtVWw0ZE1ZUW1kV0FrVDJB?=
 =?utf-8?B?TUlmY1g1S3VEeEtIQ3NEVzQ1Q2wxS3FNWU9NdjZtM1k0cTZMUThuT3E0bVBZ?=
 =?utf-8?B?aGFwTElBa09MbHNoMDU0eEk4Y2w0WGRTNXpZeUtGMW85R3RBMkF5WkpIUjF5?=
 =?utf-8?B?bFRuZXJrWmd4TlNqQjNkbllwSEQwUCthUkx6QkUybzZLSThQVDUzMUcxN1NU?=
 =?utf-8?B?eStCcHpzelYxRnFlRmNEZTV1em56eFRxelB3dHVMVENqVnVRbk9FdDVHMENH?=
 =?utf-8?B?NnE1NTZMdGRrZU9XMnZOL3o1WkR2WFZKSFlTUFA2QllxbGVmSHBNUHZwUTlp?=
 =?utf-8?B?KytJc2k2SFNYeENwQmdkSnBBWUoxajFqUy9VZmxJMS9TbkJpUXkwa1IwcUly?=
 =?utf-8?B?ZHJOaTM2emVEUkNwZFVYeHduRWpKVGYxRlR1QWNPeUwzK2haSFpTcEVLdXBK?=
 =?utf-8?B?L280NUpMVi9nUXJQWHpZSVozQk5mbjkwZ3pFaGZGOUZZdFVHYTE1dFdtUGRG?=
 =?utf-8?B?ajJocEQwQXlOb241Q0tDMFE4VlpQVWRVRG8xdlFqMUF1ZTcvd01uYS9Ic0lv?=
 =?utf-8?B?cUljaWVMUU8wdXNpVXFBY3BHUXluZllPY1J4WXh3VUtUTzNtWXZnQ1lYNU5p?=
 =?utf-8?B?dmxyZFI4ZzFtbEJ0OWphOVVYdzJTTFBaRTJmYlpqdHVUeXdMZ2RVM1N0UWt3?=
 =?utf-8?B?WFNQVXd3aDdYd0JtazR0TnkzRW5pelBIMW1KRlF3UDhzdjdWa3oyamtxTDFs?=
 =?utf-8?B?MTZXYzFQWGlPREQzOWdYQlBvMTdzZmVQTDFGUGdmN1RkWVlEM3FHNU5SZGdx?=
 =?utf-8?B?VEdZeVRHTVhZeWZqS1V3a2QzZDhVRCtqZnhxV2FWQnlxOElwdXRiTEdrcDlW?=
 =?utf-8?B?OWxydHg3Q1ZpR0ZYc3BNZ1pCRGdGcldwRHBiSzZWTE5uS1BqcG9hZWFGaUhP?=
 =?utf-8?B?cXIxUWpOOWdIakdIa0ttY0VUMVBxS1dta3pielpVRVdtTzlNcklPRjVqYVcv?=
 =?utf-8?B?dElDdEtCWDl2ZXltWlhOL1g4anJYWjdWTlltb1RQbGVRTmZyQ05GcHZSR0s3?=
 =?utf-8?B?djF1YjBOVW8vT2JsTWt6cm96ZHJ4bUZ0WGVLcGdWL1N1WmMyaklPczd1SUJY?=
 =?utf-8?B?UnVQT1RRUTN5QUJiWm9iVEpoSFhTeVZsUHp2QUtTRkYvT0RmUnFMazBLM1lC?=
 =?utf-8?B?WTZ5d3lYSU5pcGJKeHlFbjQ1Ty83RUlqbzB6NDB4bWZqQm5zSHZOdC9ObXR4?=
 =?utf-8?B?dnF3WTVXbWJaL0V3Q3RFQU5HMkdIWTg5T0VJbXNqbENaRzB0bzNkeWJZdnBS?=
 =?utf-8?B?TTl2djlIMmFrL0M5WDc0dXAvRlIwd1hqOWZhMjVMV3pWOWtXZlIyYzlaTUlR?=
 =?utf-8?B?WHg1TEw4OHNDZ1pPWWo4RFUvQ2JFbTdVNVl3UzF5bUhGZzc1WUYzcEFja3dN?=
 =?utf-8?B?S3dYbzJOMlNyN0UrUXBFMFQwTWYvSW5QSlE4Q3BjcnFGYVdJSlk5MU0wZStJ?=
 =?utf-8?B?MkxvZ2Q1RjNsaG5wa2I2UlIrQndESFl3MURtYWJETXFsRitsTmZ3OWc5Sm5u?=
 =?utf-8?B?YnJITHFPNkFBM2tlWTdlZGtOaVFna1FJK0dNNVlKWHJLYW56Wm9RV3ZmbTNv?=
 =?utf-8?B?U0R1ZmV1bXdFdTIvWGZBQ0czMFFFR2E3aVFmV2hjSzgvYjh6UUVaQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d89546-671b-47d0-77b8-08de993b0b2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 09:00:00.2197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tb7e69CgNcOIp+mqLzAQp9yfe5p3cpDYrxP1Uqm5wv/lYHCnE+Bd5fx9RQwodBlPNmMOji6YicYiV4+5lapY+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9415
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 09:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235092

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmVuamFtaW4gUm9iaW4g
PGJlbmphbWluLnJvYmluQGJvb3RsaW4uY29tPg0KPiBTZW50OiBNb25kYXksIEFwcmlsIDEzLCAy
MDI2IDk6MDUgQU0NCj4gVG86IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPjsgTWFy
a28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpDQo+IDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT4N
Cj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVj
dDogUmU6IFtQQVRDSCAyLzJdIHh3YXlsYW5kOiBzZXQgc3RhdHVzIGZvciBDVkUtMjAyNC0yMTg4
Ng0KPiANCj4gT24gU3VuZGF5LCBBcHJpbCAxMiwgMjAyNiBhdCAxMTowMeKAr1BNLCBNYXJrbywg
UGV0ZXIgd3JvdGU6DQo+ID4gPiBGcm9tOiBCZW5qYW1pbiBSb2JpbiA8YmVuamFtaW4ucm9iaW5A
Ym9vdGxpbi5jb20+DQo+ID4gPiBUaGlzIHNob3VsZCBub3QgYmUgcG9zc2libGUuIFdpdGggZGVm
YXVsdCBjb25maWd1cmF0aW9uIGEgbWFudWFsDQo+ID4gPiBhbm5vdGF0aW9uIGNhbm5vdCBiZSBv
dmVyd3JpdHRlbi4gc2JvbS1jdmUtY2hlY2sgZGlyZWN0bHkgdXNlIHRoZQ0KPiA+ID4gYW5ub3Rh
dGlvbiB3aXRob3V0IGFueSBleHRyYSBwcm9jZXNzaW5nLg0KPiA+DQo+ID4gSSB3b25kZXIgd2hh
dCBJJ20gZG9pbmcgd3Jvbmcgd2hlbiB1c2luZyB0aGlzIG5ldyBjb2RlIGZvciB0aGUgZmlyc3Qg
dGltZS4uLg0KPiA+IFdoZW4gSSBnb3QgdG8gdGhlICJuZXciIENWRSBmb3Igb3ZtZiwgY3ZlLW1l
dHJpY3Mgc2hvd3Mgb25seSBDVkUtMjAyNC0xMjk4Lg0KPiA+IEluIG15IGxvY2FsIGJ1aWxkLCBJ
IGdldCBhbGwgdGhlIENWRXMgKHdoaWNoIGFyZSBzZSB0byBmaXhlZC12ZXJzaW9uIGluIHRoZSBy
ZWNpcGUpLg0KPiA+DQo+ID4gUkVDSVBFPW92bWY7IGJpdGJha2UgJFJFQ0lQRSAtYyBzYm9tX2N2
ZV9jaGVja19yZWNpcGU7IGpxIC1yICcucGFja2FnZVtdIHwNCj4gc2VsZWN0KC5uYW1lID09ICIn
JFJFQ0lQRSciKSB8IC5pc3N1ZVtdPyB8IHNlbGVjdCguc3RhdHVzID09ICJVbnBhdGNoZWQiKSB8
IC5pZCcNCj4gdG1wL2RlcGxveS9pbWFnZXMvcWVtdXg4Ni02NC8kUkVDSVBFLXJlY2lwZS1zYm9t
LnNib20tY3ZlLWNoZWNrLnlvY3RvLmpzb24NCj4gPiBDVkUtMjAxNC00ODU5DQo+ID4gQ1ZFLTIw
MTQtNDg2MA0KPiA+IENWRS0yMDE0LTgyNzENCj4gPiBDVkUtMjAxOS0xNDU1Mw0KPiA+IENWRS0y
MDE5LTE0NTU5DQo+ID4gQ1ZFLTIwMTktMTQ1NjINCj4gPiBDVkUtMjAxOS0xNDU2Mw0KPiA+IENW
RS0yMDE5LTE0NTc1DQo+ID4gQ1ZFLTIwMTktMTQ1ODYNCj4gPiBDVkUtMjAxOS0xNDU4Nw0KPiA+
IENWRS0yMDI0LTEyOTgNCj4gPg0KPiA+IE15IGxvY2FsLmNvbmYgaXM6DQo+ID4gRElTVFJPID0g
InBva3kiDQo+ID4gSU5IRVJJVCArPSAic2JvbS1jdmUtY2hlY2stcmVjaXBlIg0KPiA+IFNSQ1JF
Vjpwbi1zYm9tLWN2ZS1jaGVjay11cGRhdGUtY3ZlbGlzdC1uYXRpdmUgPQ0KPiAiODJlMThlYjMw
NTEwMzk2NDJlZDhlYzBiOGViMTVlYTI3ZGJiZjUyYyINCj4gPiBpbmNsdWRlIGNvbmYvZGlzdHJv
L2luY2x1ZGUvY3ZlLWV4dHJhLWV4Y2x1c2lvbnMuaW5jDQo+IA0KPiBJIHN0aWxsIGNhbm5vdCBy
ZXByb2R1Y2UgeW91ciBpc3N1ZS4NCj4gQ291bGQgeW91IHNoYXJlIHRoZXNlIDIgZmlsZXMgKGJ5
IGVtYWlsIGFuZCBjb21wcmVzc2VkLCBhbmQgbWF5YmUgb25seSB0byBtZSk6DQo+ICAtIG92bWYt
cmVjaXBlLXNib20uc3BkeC5qc29uDQo+ICAtIG92bWYtcmVjaXBlLXNib20uc2JvbS1jdmUtY2hl
Y2sueW9jdG8uanNvbg0KPiANCj4gSWYgeW91IGFsc28gaGF2ZSBhIEtBUyBjb25maWd1cmF0aW9u
IGZpbGUgb2YgeW91ciBjdXJyZW50IHNldHVwLCB0aGlzIHdpbGwNCj4gYmUgZ3JlYXQuDQoNCk9L
LCBub3cgSSBmb3VuZCB0aGUgbWlzc2luZyBwaWVjZSAoaW4gc2JvbS1jdmUtY2hlY2sgZnJhZ21l
bnQpDQpTUERYX0lOQ0xVREVfVkVYID0gImFsbCIgaXMgbmVlZGVkIHRvIHBhc3MgdGhlIGZpeGVk
LXZlcnNpb24gZmxhZ3MuDQoNClNvcnJ5IGZvciB0aGUgbm9pc2UsIGFkb3B0aW5nIG5ldyB0aGlu
Z3MgdGFrZXMgc29tZXRpbWVzIGxvdCBvZiBhdHRlbXB0cy4NCg0KPiANCj4gLS0NCj4gQmVuamFt
aW4gUm9iaW4sIEJvb3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
Zw0KPiBodHRwczovL2Jvb3RsaW4uY29tDQo+IA0KPiANCg0K

