Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9583CA9EBD
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 10:47:14 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24828.1791715626198412827
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 03:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ugxu1pgv;
 spf=pass (domain: siemens.com, ip: 40.107.159.18, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9esetKmNpMy3DSb6ohU1T/a/5R3nox95TfAqFJ5sj7YHZo17Svp/qMg6BB6LPbEptqTSUQndHuPFSy1oRYRdcVLl3AdJzacuQILC8+wLfigCWac3+wsGGy6t/RMDXVS8iTyZfgBV7EQPfJonbqO273plDRjjOCu390lb5AaM3hcXYFCG7D8lEIBaSK/MTO3DSmSEu5ojo27KMOJKi7gIIaIvUDxLxldtP3sMBqGeABclUGbOJxb0BQAqJLRuGszBm9xRyn0Ggaq9mnhf01uIsSZv8knjUmEVX4mKOqCu1F3JJqz+scm9LZfiaoYWTAx9A/5GiNaC9H6IhI3UNC3fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCCHBTUJvp3i3bBqHNopUabtIvNyjGgGIpm/GMluUrs=;
 b=QwSaNz4CS7Bbcvk6Dw1BVg3/uNKRj2sAud8Q4XIoTi6dHBpzaIbaLj6impyGZ1QLr67kBScipMrIGfcJqjpC7guv0JYGxrFkgCw4ASJuvwFO4hm0MUv4a4UvWCYSRxwrBBSbJMbNyhwLy8ryN1H0dwMvlZewcm3VCHutuaq+z/J4D4rDHat9hPd3nNjg6STKHr+onl/WPeQlrUOqwV0DDNdwsEW+HvT3Sum2eEi4LX6Y9UVEjiFPKhSay89eTf+PjpGh7wkfhT8LtYfsxAml+rLCI0j10eOA+Lws6B+UijHaPUhh6PHXq9VtL5C0vWPjAoiPf6Cn8Jog8GWGXJMxJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCCHBTUJvp3i3bBqHNopUabtIvNyjGgGIpm/GMluUrs=;
 b=ugxu1pgv8W/MauA+x4/t0aNMGer/NnRjmv//XOVHlDacGBHzFTxraiNuOW6hRHUks5/SY77HHF2savKClUOOTCWpEH5OHAgy/FL6D3farGKwlrcbqAQc+J/j4IpvJM5fTWUfA8uSoxv8ccwMFMa28qEHkPFB4jvgNMYqQrVJazaWqJH5oQhnPmdeM7yy9FBTSgqxbkBPQbdXo9tM387M9YudiQFi4xRtFbpYceksXvfJIvqf8ISvMnkiLlZv0pUqNffheLgoqhQtEeDO8igBMJtRbvh2GGw39cl5Ux1SPGfzQD2S8raArgIKAcIGr0g6rutDM90NwO94u0MEPhBepA==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by DB4PR10MB6286.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:382::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 10:47:02 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 10:47:02 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [wrynose][PATCH 6/6] expat: patch CVE-2026-77214
Thread-Topic: [OE-core] [wrynose][PATCH 6/6] expat: patch CVE-2026-77214
Thread-Index: AQHdVcorTxtBVdRU6k647Wm2HR7+K7b16fcAgAJGIFA=
Date: Sun, 11 Oct 2026 10:47:02 +0000
Message-ID: 
 <AS8PR10MB5073C61368B43A8CC26420F7FD902@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20261006193638.2018393-1-peter.marko@siemens.com>
 <20261006193638.2018393-6-peter.marko@siemens.com>
 <DM0PV6GBLQRC.2A5C3G8COEK0R@smile.fr>
In-Reply-To: <DM0PV6GBLQRC.2A5C3G8COEK0R@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=3ebdd55a-164f-4878-aafa-a9245c920b55;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-10-11T10:46:56Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|DB4PR10MB6286:EE_
x-ms-office365-filtering-correlation-id: c9b728ca-b23c-4a46-0089-08df2784fbbb
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|55112099003|18002099003|22082099003|260925021311599003|260925021911599003|260925022911599003|38070700021|11063799006|4143699003|261009223027099003|56012099006;
x-microsoft-antispam-message-info: 
 GtWUKcdoPc6UzYnVJHxjNaAC4Mhy2RP+6B3/h+NM2DEjswes8xhQNtGyVunuTHxds+NznqhXdizI+DURJO1qYAHZdPN1J0cUUJMNnH+rDNh9IbZtXqIZ6dxfJemN2gsdlxGoUU5p5wy8GLxi8yVfnvbeM4Mtnwjr8bETABvfvQYWOpUpjTqN385Jx8OT8sjiyucmq3AJzPZyVBPdeanAifJK28VobPVIy9OwnjyGZqTZbhMgawlPZHBfKZDiqJS1OX4ZzFnI9G7oU5I8bEqGeGixu047bLVbj0IYXjtN6TrPjFooQx3SvEH4kXkziytO4pUyBy5Cj/rdnPaAgucJ9YRmHu/EgGqEodE3TGbIGi3CeOLS0VW1z6uySxHXmv5MsYXBnKcMFlzBKet3S5+Ty/QmRywsfvUC6rYtEdxQp1ElBpJ0MK+TnqOKc1zUg5HF20WU7z61e8wERPmlr3SegvX87+udsYPLyIfD6elb0lZCuVqMZ+ChsWk71b5oRUMpljPLVK2RZNEkXFEjtL2GjacWgbcK3y/gB2777C7GpSKKnKst/06oGFLUEt1iplGltOhmjHoAfpvJR+YHw8XkeEdYsqIhpQZuPHE/FuF3py1QbymzOuqVHS7EiGi7JG7NPoSHnDNZc9eHwxrqaBNQ9titbcVbfWD56R45i2epWyo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(55112099003)(18002099003)(22082099003)(260925021311599003)(260925021911599003)(260925022911599003)(38070700021)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aVFNOE13S0VtT2xRSjNwU0V1c011YUo1RWZtdWcwZWl2cHI2aUp6aUFMNHE0?=
 =?utf-8?B?VG5OdXZBWVl2cDgxNFdtZFh4Q2I2TVp3QjVmRTVWY0JzcytXQkQ3WnduYis5?=
 =?utf-8?B?eHVZVGVtQ3pnTXNEZkZadzVmdnczay9KTFZVY2RnSld0ZThqWkpNQWlOWlBh?=
 =?utf-8?B?TUxHaXpOMHJQMHlDdy9GckJ2b1RqOUx6MHdYZGNYMHNWUHhyT3ZBa0xnMFE0?=
 =?utf-8?B?dHJCRkNzT0ZDbUlKZTNWZ0l4OWZLOTh4VllrS3V0b090SExwVDlrd2NsL0pV?=
 =?utf-8?B?ZnN1SWRjamlqV3BIK0JFdyt2VmkvY0t1UVp0SEM0SndUV2xYdjNpbGNtQkF4?=
 =?utf-8?B?YjdZb1lrOUJ2RngybG11b1I1anBZZ3VQOWZFR1RxeS95cVhoenhLL21GYWF5?=
 =?utf-8?B?K05VOXBEWnV3MWVNSXJVaW5kUlFlYXlaTk5WQ3FyUDRkRmNvVXBKOStZcDY2?=
 =?utf-8?B?YnV0UmRQWTRWWTZHY3V1dHR3NERpODF1OGFuTDU5eEkwWVpPKytXVDFza2pO?=
 =?utf-8?B?ZTVhTFNDeHUzdTZIalBacWdQQzVRMmNjZjdnK0ZVWW9oNTNhdjF4MXorYWhP?=
 =?utf-8?B?dXcrOStackIzVTJueWRMU2VueUNhdnRGVGVDek9FWWhEWHQyejUvZk9xUUhL?=
 =?utf-8?B?Vzh3bmFZTWpXNDdmWnBnVDZyUVFWL2JtVzlMeVJvZjVZNW9PRUcxby9EdFJV?=
 =?utf-8?B?OURkVytyUlBzcE1hTE13OEpMRWYwLzNWL3BDdUhnRVc0QSsxNE5FMVJKbzZV?=
 =?utf-8?B?UzJKRk9sSmppVTRGYUt0YngrdUE5RXljUFZaNFUzS1RwTXIwS3U0M1U2OVBE?=
 =?utf-8?B?QkNqMUc5bUlMQVl0MkNyT2NkcHpraWNKSDdza3hOWDI4SXZpVysxV25VemhN?=
 =?utf-8?B?VnlZZXRRY25FU1BGa2lsclgxVzBMd1pGeU9aR1ZCdkxrZEdLVU5zb0U2NTNw?=
 =?utf-8?B?bDJYL2w5bE4yNXNiR2I0bjJBUlMwcGlQb3VzK0NEMnhQaWo4SGNGNTZ3b2pL?=
 =?utf-8?B?bFVFU1p0dHZiZ0duNy9nN3VUS0ZteXVlN2pDYVBHMXNqVGZ3djVYaWl2M2xH?=
 =?utf-8?B?ekZJYy95WFlqc3lrbmVhamJPb0FXZjhQY1dBQmJITHB6V05tRTNIOXQwdnZ3?=
 =?utf-8?B?TmpOSkxjaDZQckpCdnBDajdxNzZQTjNjaTJGNURVaW9qdDBtUHk3Ykw2amZw?=
 =?utf-8?B?WGdkdXFQNjV1c2gyY21xdTQ5cFdueEprWUlaclhUdEJRWHlidnNPVm1VUWpn?=
 =?utf-8?B?ekZCanBadC9RcUt0bVJURGdkMEZVeHFKdTI1d2h1QVZOa0tmcjhaNFprL0tI?=
 =?utf-8?B?bUNlL2NxM3pUbHdFS08rZGNuVWgwWE1KdTREVE1SZmRKZ29WKzBVMXl6SVUy?=
 =?utf-8?B?MHZiMkpJTWFTb1VWdkxDVG5maVY5eG5WVlRhSGRYUm5DMkJlcytsaXN0NzFs?=
 =?utf-8?B?U1h5NnYxSmlLQ1h2TG9VZ0ZDV2Q3U2drTDlsRW1tajlJdWR0a05UaG4zZ0RW?=
 =?utf-8?B?OWdJb21BVDA2WnZzU2wxbnZhSVNEYzl0Y2VHcW15ZFNZZGdBMEI1bWtsU0k1?=
 =?utf-8?B?NWRETURUeTI4SVU2aGRNOGdKUDZnb2doUzlKSVBkR2JGVVRQN3QzNEdWUlVj?=
 =?utf-8?B?eEkwWkRaMnZES3M5cTBaK2FDRGMvdTBBOUNTa0JDcFRjZStNTDdOWGFISjRW?=
 =?utf-8?B?ZkdnbGlaeGQrcHMvSHR0RzBhRnkxWDVUUTFpYXZKZHFJR3RZeksyY3JuZ2dP?=
 =?utf-8?B?RkZzWU1TSXdaY0xkL0NibkxLdlJLam41OEZEdEZLKzZkVFI5Y05zY1VFU1hr?=
 =?utf-8?B?UHFtc1o4c0EvSkFTMGRvelRSaU8vY2g4dVB4SktMQkR6UVFRcmtWdFdqRlRa?=
 =?utf-8?B?RHNWVldEbEN4QXBWTDF6ZHVQSHFCd1NjTDZnRDEvOGdaWTMxSkltcmo0SUdr?=
 =?utf-8?B?UjRuaVUrQVV6eFJKcmdsYmFvLzZ6OGFvbE5XamxUdUFUcEt1anhSbVArTEt2?=
 =?utf-8?B?SDJmZmx1SEdRMTdWSXQ2Y25tU2hCK3phUnZ0KzU4SXdvZ3lTcDFzR3RwdkNI?=
 =?utf-8?B?UDdOa0dhQU5QL3FhdGVDWFdJVy9QbWN4RjlQK3pzNmVtUkd3UFA0NUw0VDlh?=
 =?utf-8?B?NFVrNzVmV3RxNFAvOWFWMkZ3Rmt6SlR3QnZEeW9xNnYyTDkzQTNUMXZWcUVZ?=
 =?utf-8?B?bGZQbTdScmdycklWMHRmSG5aQ1VHRHhJN1QvODg3MkM0b0pSZVJndGg3V0Za?=
 =?utf-8?B?UVNaK0QrVzNvb1JTcStCeXVQeWR2VUJaeHVrYTdVUkRrbzdTeVZqWTlPZ1lS?=
 =?utf-8?B?UjUvRkw3cVNIanZtakEvUWREdGxzN1ZnaDJYMDl4T2dRYXN1R3EvQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b728ca-b23c-4a46-0089-08df2784fbbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2026 10:47:02.2265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ee4xBOQLG3oDqCPz8TFnF657TdBcPeewn5cG60tW2MSO3t0yty9WTEjQJn4v1sPjCMuJqyBYIgxwr4SOSlEhCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6286
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 10:47:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247575

U2VuZCB1bmRlciBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQt
Y29yZS9tZXNzYWdlLzI0NzU3Mw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IFlvYW5uIENvbmdhbCA8eW9hbm4uY29uZ2FsQHNtaWxlLmZyPg0KPiBTZW50OiBTYXR1cmRh
eSwgT2N0b2JlciAxMCwgMjAyNiAyOjAzIEFNDQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUg
U0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFt3cnlub3Nl
XVtQQVRDSCA2LzZdIGV4cGF0OiBwYXRjaCBDVkUtMjAyNi03NzIxNA0KPiANCj4gT24gVHVlIE9j
dCA2LCAyMDI2IGF0IDk6MzYgUE0gQ0VTVCwgUGV0ZXIgTWFya28gdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gd3JvdGU6DQo+ID4gRnJvbTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNp
ZW1lbnMuY29tPg0KPiA+DQo+ID4gUGljayBwYXRjaCBwZXIgWzFdLg0KPiA+DQo+ID4gWzFdIGh0
dHBzOi8vc2VjdXJpdHktdHJhY2tlci5kZWJpYW4ub3JnL3RyYWNrZXIvQ1ZFLTIwMjYtNzcyMTQN
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5z
LmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2V4cGF0L2V4cGF0L0NWRS0yMDI2LTc3MjE0LnBhdGNo
ICAgICAgICAgIHwgMTA2ICsrKysrKysrKysrKysrKysrKw0KPiA+ICBtZXRhL3JlY2lwZXMtY29y
ZS9leHBhdC9leHBhdF8yLjguMy5iYiAgICAgICAgfCAgIDEgKw0KPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDEwNyBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lw
ZXMtY29yZS9leHBhdC9leHBhdC9DVkUtMjAyNi03NzIxNC5wYXRjaA0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2V4cGF0L2V4cGF0L0NWRS0yMDI2LTc3MjE0LnBhdGNo
IGIvbWV0YS9yZWNpcGVzLQ0KPiBjb3JlL2V4cGF0L2V4cGF0L0NWRS0yMDI2LTc3MjE0LnBhdGNo
DQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwLi42ZDc0NjQ4
NzA1DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2V4cGF0
L2V4cGF0L0NWRS0yMDI2LTc3MjE0LnBhdGNoDQo+ID4gQEAgLTAsMCArMSwxMDYgQEANCj4gPiAr
RnJvbSA0ZDliMWM0OTllY2I2NjMyMzI2MGE3Mjc0ZWRjZjg2YzVlYWIwNTE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KPiA+ICtGcm9tOiBGaWxpcHBvIFRlZGVzY2hpIDxmaWxpcHBvdGVkZXNj
aGk5OEBnbWFpbC5jb20+DQo+ID4gK0RhdGU6IEZyaSwgMjUgU2VwIDIwMjYgMTk6NTE6MTAgKzAy
MDANCj4gPiArU3ViamVjdDogW1BBVENIXSBsaWJ8dGVzdHM6IFZhbGlkYXRlIGxlbiBhZ2FpbnN0
IGJ1ZmZlciBjYXBhY2l0eSBpbg0KPiA+ICsgWE1MX1BhcnNlQnVmZmVyDQo+ID4gKw0KPiA+ICtJ
biBYTUxfUGFyc2VCdWZmZXIoKSwgaWYgbGVuIGV4Y2VlZHMgdGhlIHVub2NjdXBpZWQgY2FwYWNp
dHkgb2YgdGhlDQo+ID4gK2ludGVybmFsIGJ1ZmZlciAoRVhQQVRfU0FGRV9QVFJfRElGRihtX2J1
ZmZlckxpbSwgbV9idWZmZXJFbmQpKSwNCj4gPiArcGFyc2VyLT5tX2J1ZmZlckVuZCB3YXMgcHJl
dmlvdXNseSBhZHZhbmNlZCBwYXN0IHBhcnNlci0+bV9idWZmZXJMaW0uDQo+ID4gK1RoaXMgdmlv
bGF0ZWQgdGhlIHBhcnNlcidzIGludGVybmFsIHBvaW50ZXIgaW52YXJpYW50IChtX2J1ZmZlckVu
ZCA8PQ0KPiA+ICttX2J1ZmZlckxpbSkgYW5kIGNhdXNlZCBjYWxsUHJvY2Vzc29yKCkgdG8gcmVh
ZCB1bmFsbG9jYXRlZCBvcg0KPiA+ICt1bmluaXRpYWxpemVkIGhlYXAgbWVtb3J5IGJleW9uZCB0
aGUgYnVmZmVyIGJvdW5kcy4NCj4gPiArDQo+ID4gK1ZhbGlkYXRlIHRoYXQgbGVuIDw9IEVYUEFU
X1NBRkVfUFRSX0RJRkYobV9idWZmZXJMaW0sIG1fYnVmZmVyRW5kKSBmb3INCj4gPiArYm90aCBY
TUxfSU5JVElBTElaRUQgYW5kIFhNTF9QQVJTSU5HIHN0YXRlcy4gSWYgbGVuIGV4Y2VlZHMgdGhl
DQo+ID4gK2F2YWlsYWJsZSBidWZmZXIgY2FwYWNpdHksIHJldHVybiBYTUxfU1RBVFVTX0VSUk9S
IHdpdGgNCj4gPiArWE1MX0VSUk9SX0lOVkFMSURfQVJHVU1FTlQuDQo+ID4gKw0KPiA+ICtBbHNv
IGFkZCB0ZXN0X3BhcnNlX2J1ZmZlcl9leGNlZWRzX2J1ZmZlciBpbiB0ZXN0cy9iYXNpY190ZXN0
cy5jLg0KPiA+ICsNCj4gPiArQ28tYXV0aG9yZWQtYnk6IFNlYmFzdGlhbiBQaXBwaW5nIDxzZWJh
c3RpYW5AcGlwcGluZy5vcmc+DQo+ID4gK1NpZ25lZC1vZmYtYnk6IEZpbGlwcG8gVGVkZXNjaGkg
PGZpbGlwcG90ZWRlc2NoaTk4QGdtYWlsLmNvbT4NCj4gPiArDQo+ID4gK0NWRTogQ1ZFLTIwMjYt
NzcyMTQNCj4gPiArVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydA0KPiBbaHR0cHM6Ly9naXRodWIu
Y29tL2xpYmV4cGF0L2xpYmV4cGF0L2NvbW1pdC80ZDliMWM0OTllY2I2NjMyMzI2MGE3Mjc0ZWRj
Zjg2YzVlDQo+IGFiMDUxN10NCj4gPiArU2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFya28gPHBldGVy
Lm1hcmtvQHNpZW1lbnMuY29tPg0KPiA+ICstLS0NCj4gPiArIGxpYi94bWxwYXJzZS5jICAgICAg
fCAgNSArKysrKw0KPiA+ICsgdGVzdHMvYmFzaWNfdGVzdHMuYyB8IDQxICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gKyAyIGZpbGVzIGNoYW5nZWQsIDQ2IGlu
c2VydGlvbnMoKykNCj4gDQo+IEkgYWxzbyBiZWxpZXZlIHRoaXMgb25lIGlzIG5lZWRlZCBvbiBi
bGFja3NhaWwuDQo+IA0KPiBSZWdhcmRzLA0KPiAtLQ0KPiBZb2FubiBDb25nYWwNCj4gU21pbGUg
RUNTDQoNCg==

