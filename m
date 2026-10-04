Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DDDCA5FE6
	for <webhook@archiver.kernel.org>; Sun,  4 Oct 2026 07:52:34 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19850.1791100352022527833
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 00:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=JW92uhRs;
 spf=pass (domain: siemens.com, ip: 52.101.66.35, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IP0an9hnpcBdQ+4+HwY3vXyXRtBs2HdFYhTjH/V81z1V3GNDlcWOedeHvL5ol1W1W4XE3k4Ctdorj4PWWLP4O6rJjZf2R6ZjFuiFE7+kjve7K2WcyR/d/T5WRlNvcJa06uJ4Mzm/PuGZ/KaJXP6cKcy5znApWBjFQcqP3eaIbXLWspk0UxkjwiEAdHfwwPwo65gKOo60PadFgqhgGpLmGmyQDB9lR+Vom9YspAtKiKpln6aYkGtyldMBbJQdC4isyzTtASOOUxiw5XJmoIInZrSj+fNIDmlUsQV1R4G/meX+FclM1cWRJVKGUbj6RZqkOzw9o0YhpO8xnbn+1miE5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IiZquEkJzKT7CF9kRrYl/jjGubUVfyqOmQJgfJdk1w=;
 b=GAQUJA0NdZ+/rNmmnzsMa8F0q+aicDzXT/vfXXCs6EZgbBuwIPeDYZ9id2k7sVPkwwPZ5xSFQN97EjXmMuzNDMc0MIZifP7CjGtJ4/L9vYGfdLo2CTe9u1V0u6FA5OauZtCBXcVZxFzJOI2iegA8pD9z9iRXhFP6/idq0C8ZP0akOZIviVJiO1yTAyyHTNMYwKZn8+v/pK3gfy2ziSr+wjOzIG1fzUbcUXYsXRvddQnwpoHu/4pyJAoa3uUfIM5a9zs6uhVVKpNnOvAXm0+n3jCQma7Vc/tzrfHXO9FNGwFtGEuYkTp3HqVz6tu9xNM3pMOyFuC1A4KZiw8vJMP1cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IiZquEkJzKT7CF9kRrYl/jjGubUVfyqOmQJgfJdk1w=;
 b=JW92uhRsPQt5DiF74msj91KcNnpNlxayoxB7u8ldgboivCpr0xoBLE1UKMTlijfycvbM2JfNGd6/qeRZIDIyeKViAN1WQL/3i520LAZlwAEPmgfKz3WgdyROk9lUqBbSVhhgUoJzxn3DDUy7Yy5AAsAKSSqHrUW7uirabtOE8xL065kYU4FLh2F2GRlwhShAP/6FLwr3S18wxESd4aR1Y6y2RAi7+06CPYzncPzaU4ZijB4kInfzOPno0rOrQRcsGk6FeVV2ttM/BXbLgp/8HZDZE0yRIoEkWYWuD9Pz7JWiAyUKq1Et12nvDAI6zxjoW3zQcZXfEG5aWgqc87rSRw==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by DU0PR10MB6654.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:402::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.21; Sun, 4 Oct
 2026 07:52:26 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 07:52:26 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [scarthgap][PATCH] systemd: patch CVE-2026-4105
Thread-Topic: [OE-core] [scarthgap][PATCH] systemd: patch CVE-2026-4105
Thread-Index: AQHdU3BWlqC/CgRf0USo4SALLyaEpLbs/dcAgAAFicA=
Date: Sun, 4 Oct 2026 07:52:26 +0000
Message-ID: 
 <AS8PR10MB50736590C11386E097CE5C96FD972@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20261003194926.1818550-1-peter.marko@siemens.com>
 <DLVVMW89P2VR.3URHAQSDYGZM1@smile.fr>
In-Reply-To: <DLVVMW89P2VR.3URHAQSDYGZM1@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=a582c683-e689-4ed4-bb1d-31d08adf33ac;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-10-04T07:51:12Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|DU0PR10MB6654:EE_
x-ms-office365-filtering-correlation-id: 35e1b611-1cd7-4960-4d11-08df21ec6f02
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|4143699003|11063799006|10067099003|56012099006|55112099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 
 dhbLKq9i4OFnTYT5K3wAh/hksymHjnh5KkzHGw99SoevNax0qHjaeAaP7HtoULuTVE82LViTVZenfZ3JIS2xwMAz0wkM9PuIQB4IRgQgTuykSH4uny1el7F4ns+HPUlEha50FbKMxZcsMScw7x+rKSv31CVgBoNP4Dq/61aa+mghdN+EWfzqUAc9WpZjR/T3P4lENAk0KUXZffToh8xADluto9PxXVShymaEwMfGR7uWGsh6a7GDaqOYCNFtjTzj1o6IDo85qrsJ/58F9vMbWVycz0YyHRmQcwoYwdh5xQ1tSsw5yROWx04ebczbO8mTgHNjMYe+o568u7qRFIQtDz67qyFzlbstKBL2Dqgp05448RnQr4HOELiay5sPg/gD6SrN2QkEfIFLza4rvFbtkvAqKR57oIDNEMyEVRzxTWdPIGMQtNo06KNAUY8RZ7kFkb0yhDHaWT/dAAU5b/RKz8DpzfD8n0NZKMX1MVfhOBy2OYaQ6cWWaMaZvff+Ga2Q+CuAR4Kan28wc19Vicpy0kQB8GvjsPD3/o/SxLsqkM0+C9Nm+BhlK1AmqJg8E+t4zCRhILkv6em79hOt1mmB3SskVpjaqJ0lhCMGqIE6aJ4yfhgvGgJcvOQiH03pzypfUDjeuv5PYc/5xNjEzHsYj3JqIz260Ool9agOiRnehcdA9Ut0qLImfE83TcyZgfm/qtCGKZK8cFinrqUIM5ztGw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(11063799006)(10067099003)(56012099006)(55112099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Zmh0azRyWDFtcWNrTENGaEVBbElSaDI1MkxLN0Rra0FCWnhiMFozQk14YTlp?=
 =?utf-8?B?U0lCWG1BRDkvRkhQSXY0VkJFTm1Lamp1dm4rejlON0NxMGZKUEttQ0dSTUkr?=
 =?utf-8?B?azM0aFpqa0d1aSt0cmhmL0xmNzJ3UC9NRzRSQXg2TkRWeWN4YktpZ3AraVBI?=
 =?utf-8?B?ck1zeEZCY0graFVpK053Nm1qZ3Q5ZG1yQ25EUUJSQ1BHblBWMlhOdlpFMGRs?=
 =?utf-8?B?di9LNFhBb1lIMEg1TmZ4cUE4bVhyT0RoZ2hWbVpuVk1UWmo0S2Y3amh3N0gx?=
 =?utf-8?B?eXM4K0VOMXcxL00ralpHcitIVjdIWkFvSlpETVltZTVBQUdnKyttK2FHL2VH?=
 =?utf-8?B?THpMcWRLSTBMSkZpQVdOTWFmZXFYQVAvYzNadjhmU1JDb1kvTlRJWE95S2VS?=
 =?utf-8?B?NDRlK2EzRWNNaExLNFI4U2ZaQkcraEUxQTVxemtucktJMUxpSHBsNE9rTkw3?=
 =?utf-8?B?NThpSWJqSnlGVVFXdDV0ZXFaWUJCbkxiTS8ycDRIYmxucTFKZ3BZUCtnRHBH?=
 =?utf-8?B?L0NPblhhNmxDeDV1VVZGdm5Vd25XcE83OUFrcldwOTdwWFBFVEVJMlVqVFJ0?=
 =?utf-8?B?ZnJHRUh5ZHF3cGRMWC80Y3JOa1NDMVV2YXAxdlF4eDFOejdMTS93NDBtZUpo?=
 =?utf-8?B?eGdTcGJLbUU1aUsvUGtXRU9tUXhSMzFoUkNKZml3REUzK1B6NVpQbE5ORkov?=
 =?utf-8?B?bHBWWGdhV3dmWGh0S1l5UmMxSVBNd282ek83ZW9CYWhoZnVpNlVSdCt6U2Ux?=
 =?utf-8?B?UTF4TVY2SjNUQ3BPZlhUSkc5NVREKzc5a2JFQ09aYzlQSkVzYmZLNGN0VjR1?=
 =?utf-8?B?YS9oUkNXcCt1dUtTZ0p5WU5NeSt6aUxIUmhuNjRGVXJ4QlEwc0hGVzdUZU90?=
 =?utf-8?B?QXZDSW1RT1NzMnNVRWlLSjJCQjlPTW9MckozK2tTQXozTGthMTZkZ003ejc2?=
 =?utf-8?B?UUxSQWllZytWK1FwdnZmVlB3UUxHOVZKZzRIWVY1V0Q3UXhnNlp4RG9HWW0w?=
 =?utf-8?B?R2VtVmF1aU0xMkZlVHdwb2RLV2hQTkxubnkyVkMwNFNBWWVPOHZZdytYY0R2?=
 =?utf-8?B?cHc1b0xPYjVRdlZQczNWOGRvbnoyZTNwMUJldDZOc0VtaTFDYTdUaWN4dStO?=
 =?utf-8?B?SHl6ZGowTGc1c0JUc3ZGVzlPRTFrTGRUQWxZdDBkYlhjNUdCSytabWRNb1Fp?=
 =?utf-8?B?Vm1oZndLTWNrYWlTMVNrWDNwVWRMa3dvNmpVRGUweGp0d29HUzRwZ2VtL0VF?=
 =?utf-8?B?YVZ4V3ZYRDZCQzNycjZhMEc2bUJqdmpMMFRUaHRNd3pKNVlzbnlERXd1YXda?=
 =?utf-8?B?aUNGTnIwcnA1Ymk4b2FwMXhoMUVaVi9KdGZBZmpKZE5MQVNROUxqcGlMamZC?=
 =?utf-8?B?M1NxZGY5eG9McjVFclRsTk44aWRreDRhSWFyWVYxNmhDbHhPN2JOam5PbnJL?=
 =?utf-8?B?cldLQlQ3WmczeDhWUFU4QWtPYUcyTlNpdndMTFhxREVsMFdwUGdlY0h0bE9O?=
 =?utf-8?B?UndXMHBiSWdSeDNmbXRLY2xNMnlpSXA2bnZJZytVNUxsSldXUEJuQjRPZ3VI?=
 =?utf-8?B?Rk15RE42MzgyOCtYMXlNZE9nSG9CWW1zMDZYSitPOGVSMUtNM0wyQzFyZzg1?=
 =?utf-8?B?OUROOVFQMGRlNWdRRklZUnRDUjJRVXpkbWZZMlFubGpxZGJhMzZyckphbVZL?=
 =?utf-8?B?aWNwY1BsblpRTWx5K04yUkRTenBrNkhUZlhUZC91VElTS0xBcEZNNjFtZFJR?=
 =?utf-8?B?Z0pJYUtkeGVES0lhZGxKZWtaS1VOakZNYTFGNFo0ejFuWHJVVGpuc3h1RWMw?=
 =?utf-8?B?cngxa0h5Y25QVUJ0QVhGQS9Qb2lSZjEvOUFsWGNPQkI4NlI3V2JaYTk2cXJ0?=
 =?utf-8?B?bGpUOG9BRVlJMFBXQkZSbnM4Tlg0Vkk4WGIzU0h6WkN0VkFkY0daWVdESzRT?=
 =?utf-8?B?eVZsMXdlQzdhZTNUZ2xVay9mK0pEV3lQN0dneTM1OWtOeTE0N21GekxQMHQv?=
 =?utf-8?B?VGZKaWN3U3ZrbnFwbjFESjFnbUlnRndHdk05MGtmREhKV0ppMC9Qa0xVaTYz?=
 =?utf-8?B?UGpyTmVWYXdpWklQVzVPYzJVbXZ6dGw5NG5kN3BDUjk4eFdhcG9lK01ZTWR3?=
 =?utf-8?B?TEJLeVluU0FLWkJqQzZod2JoTU52ZXhtRGJ1OE8xVE1obENvU1VmdUsrd0hF?=
 =?utf-8?B?QklsUDgxaEpVRGExdzZ0QXRTcGhjYitGSk80QWNETE4zMDc5WWNLaml0eE9u?=
 =?utf-8?B?NmN1WkxCN3p1NFd4ZlZLYTVNNTE2aW1lSTlONFRWNXJGbyt0OWxzOUk4djJV?=
 =?utf-8?B?cVNIc1pTZHlrRittSXNRdzdQSGxvVGtCb2hBcTNza0diZnVNcTc2QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e1b611-1cd7-4960-4d11-08df21ec6f02
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2026 07:52:26.8154
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M65JrqkCvq08E88hJdjLouPL0WBk17KVsVWPCCvvBLUoLn4dZCU1CpkTFksE7VXdzr9ucHRddKTfncDGpQjy7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6654
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 07:52:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247195

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWW9hbm4gQ29uZ2FsIDx5
b2Fubi5jb25nYWxAc21pbGUuZnI+DQo+IFNlbnQ6IFN1bmRheSwgT2N0b2JlciA0LCAyMDI2IDk6
MzEgQU0NCj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29A
c2llbWVucy5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW3NjYXJ0aGdhcF1bUEFUQ0hdIHN5c3RlbWQ6IHBh
dGNoIENWRS0yMDI2LTQxMDUNCj4gDQo+IE9uIFNhdCBPY3QgMywgMjAyNiBhdCA5OjQ5IFBNIENF
U1QsIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IHdyb3RlOg0KPiA+
IEZyb206IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPg0KPiA+IFBp
Y2sgcGF0Y2ggcGVyIFsxXS4NCj4gPg0KPiA+IG1hY2hpbmUtdmFybGluay5jIGlzIG5vdCB5ZXQg
cHJlc2VudCBpbiB2MjU1LCBzbyBkcm9wIHRoYXQgaHVuay4NCj4gPiBTYW1lIHJlc29sdXRpb24g
aXMgYWxzbyBkb25lIGJ5IERlYmlhbiBpbiBbMl0gZm9yIHYyNTIuDQo+ID4NCj4gPiBbMV0gaHR0
cHM6Ly9zZWN1cml0eS10cmFja2VyLmRlYmlhbi5vcmcvdHJhY2tlci9DVkUtMjAyNi00MTA1DQo+
ID4gWzJdIGh0dHBzOi8vc291cmNlcy5kZWJpYW4ub3JnL3NyYy9zeXN0ZW1kLzI1Mi4zOS0NCj4g
MX5kZWIxMnUyL2RlYmlhbi9wYXRjaGVzL0NWRS0yMDI2LTQxMDUucGF0Y2gNCj4gPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPiAt
LS0NCj4gPiAgbWV0YS9yZWNpcGVzLWNvcmUvaW1hZ2VzL2NvcmUtaW1hZ2UtcHRlc3QuYmIgIHwg
IDIgKy0NCj4gPiAgLi4uL3N5c3RlbWQvc3lzdGVtZC9DVkUtMjAyNi00MTA1LnBhdGNoICAgICAg
IHwgMzIgKysrKysrKysrKysrKysrKysrKw0KPiA+ICBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1k
L3N5c3RlbWRfMjU1LjIyLmJiICAgfCAgMSArDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMzQgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9y
ZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kL0NWRS0yMDI2LTQxMDUucGF0Y2gNCj4gDQo+IEhl
bGxvIFBldGVyLA0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvaW1hZ2Vz
L2NvcmUtaW1hZ2UtcHRlc3QuYmIgYi9tZXRhL3JlY2lwZXMtDQo+IGNvcmUvaW1hZ2VzL2NvcmUt
aW1hZ2UtcHRlc3QuYmINCj4gPiBpbmRleCA3MjA4MWY5MzhkZS4uMDI0YzY5ZTlmZGEgMTAwNjQ0
DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvaW1hZ2VzL2NvcmUtaW1hZ2UtcHRlc3QuYmIN
Cj4gPiArKysgYi9tZXRhL3JlY2lwZXMtY29yZS9pbWFnZXMvY29yZS1pbWFnZS1wdGVzdC5iYg0K
PiA+IEBAIC0zNiw3ICszNiw3IEBAIFFCX01FTTp2aXJ0Y2xhc3MtbWNleHRlbmQtcHl0aG9uMy1j
cnlwdG9ncmFwaHkgPSAiLW0NCj4gNTEwMCINCj4gPiAgVEVTVF9TVUlURVMgPSAicGluZyBzc2gg
cGFyc2Vsb2dzIHB0ZXN0Ig0KPiA+DQo+ID4gICMgU2FkbHkgYXQgdGhlIG1vbWVudCB0aGUgZnVs
bCBzZXQgb2YgcHRlc3RzIGlzIG5vdCByb2J1c3QgZW5vdWdoIGFuZCBzcG9yYWRpY2FsbHkNCj4g
ZmFpbHMgaW4gcmFuZG9tIHBsYWNlcw0KPiA+IC1QVEVTVF9FWFBFQ1RfRkFJTFVSRSA9ICIxIg0K
PiA+ICsjUFRFU1RfRVhQRUNUX0ZBSUxVUkUgPSAiMSINCj4gICAgXg0KPiBJIGRvbid0IHRoaW5r
IHlvdSBtZWFudCB0byBhZGQgdGhpcyBodW5rIHRvIHRoaXMgcGF0Y2guDQoNClllcywgSSdsbCBz
ZW5kIGEgdjIgc2hvcnRseS4NCkZvciBzY2FydGhnYXAgaXQncyBpbXBvcnRhbnQgdG8gcnVuIHRo
ZSB0ZXN0aW1hZ2Ugd2l0aCB0aGlzIGRpc2FibGVkIGFzIGl0J3MgZWFzeSB0byBtaXNzIGZhaWx1
cmVzIG90aGVyd2lzZS4NCg0KUGV0ZXINCg0KPiANCj4gUmVnYXJkcywNCj4gLS0NCj4gWW9hbm4g
Q29uZ2FsDQo+IFNtaWxlIEVDUw0KDQo=

