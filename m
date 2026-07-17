Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121DCC44514
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 08:47:20 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.34])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9517.1784278027127196972
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 01:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=QZemDLUe;
 spf=pass (domain: siemens.com, ip: 52.101.66.34, mailfrom: peter.tatrai.ext@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x8o0dzACc9GcOSdd5U7OC0SvQ0idlw1yqAYwoAK+pw0fR5bbXqgjsJxmq+iYzOsGSNlFtlcUsE5ZQyD7oV1f84wAbVo3uDEABZ0OgloWHYeWE2WOGQSTsfmadmlTx/Nj9iF6JAKxizM5MeZPToIFU0h4VxlFVBQVS0LJhvYk50arZFqoUAxsXaUkRALRf9wLhrNQsZGYwKNTIjkZmNyMu87IbudDPGqcDTQSedFO744feSM/LPhTEVTX5/Xr5momMkXKDQOZGmT7ixrXuSkIwKZdUZz2FU9KEMfTDEklMtQW0Dixrp8REZa/oWNVKljn5ulqiNU8oPY3S4lK7Zb/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPpmsv2zo6Vct51vH19A2QtsBavg14KJrYNMPXOaFbg=;
 b=P6OVP0dRGQPauFBYUNmEegQTGpjVFaAstXVP5q7wVw/SviQeF1Vl4XsUGOHS3tCytVwun7VsIs3iSrW4pNhEjp9wuTHrw3Ef0exg2yEfxLz3LzSRdyQgoR6qIowkAwRa4wDQB+R4uMRrDG7BseYRFOycKjH6j7j8nwZHsJn9hS1zn3gEyabPnQjUR93iSpq5LI5vrcZgY0Kg2h9145l6nzH03fOc12QA0SoS1g2CdNOFK8KlUzUpogG9J5BDsy6onx/DkZPzbHTSGQUxOwqYpaCObNlcD7+pM3HYBxzXycVcTwzlV3tb2I6PvqxQ045BdIkSLNh18GvG4Vr3lVOlPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPpmsv2zo6Vct51vH19A2QtsBavg14KJrYNMPXOaFbg=;
 b=QZemDLUeMMGxkyiqP+ZIZDGDIAvr29nSzF4Z8AJyiPiuOBmQKNkshgb8TtenQCTQmIJYVyD3eRwMjxzb1xo7K3/lO9bW2zc96VBUk8LQZjmi7ovpXcJPk7gHzwiPDDbAzQownn46La+XVB5cSqmSTfxmm312WstlyZVMy2VKSp4ny13WE6mKv0InkTZRbi1hwO0Vtt8LjP3UonvlkkOjpQ/wUllMRx8pDhVNgQeLbkNuZzJ5uNA9eE8TAOIKTuLMnTJ8IPZGqcWizCmDTw3/JJg4V8k4yLjs2i+/ULOiQKxswt3U50Al2cOpV63o+DYZYLDnONqzTY4TbFWVRZZBDA==
Received: from AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:605::21)
 by DU0PR10MB7027.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 08:47:02 +0000
Received: from AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9f70:952:2a71:7f3f]) by AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9f70:952:2a71:7f3f%6]) with mapi id 15.21.0202.018; Fri, 17 Jul 2026
 08:47:02 +0000
From: "Tatrai, Peter" <peter.tatrai.ext@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Ross Burton <Ross.Burton@arm.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Subject: RE: [OE-core] [PATCH] testimage: handle missing boot log file
 gracefully
Thread-Topic: [OE-core] [PATCH] testimage: handle missing boot log file
 gracefully
Thread-Index: AQHc5tHJaWui7bfh3UqqDc3Lmx3thLYYtQYAgBPtKfCAQ8bSwA==
Date: Fri, 17 Jul 2026 08:47:02 +0000
Message-ID: 
 <AS2PR10MB7347A146BCA872EE35676E0BDBC62@AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM>
References: <20260518142235.2077-1-peter.tatrai.ext@siemens.com>
 <4C2A3BCA-C42A-4B86-8FDB-BC7C817476BC@arm.com>
 <AS2PR10MB734704548BD954B6383D4510DB132@AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS2PR10MB734704548BD954B6383D4510DB132@AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US, sk-SK
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=4b203794-2cff-4152-9cc7-37e029e8ad9f;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-06-03T09:03:58Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR10MB7347:EE_|DU0PR10MB7027:EE_
x-ms-office365-filtering-correlation-id: 2d31c5ef-e732-4918-a9a3-08dee3dff8e0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|3023799007|4143699003|6133799003|56012099006|11063799006|18002099003|55112099003|22082099003|10067099003|38070700021;
x-microsoft-antispam-message-info: 
 5k9XHY7oNuBPSmQ+oHO2pPnyfkPjW+h+w7WOxLFknZ0yrvrHyUqXN9s58w6numcQkwVXd7qpkkP3whv4ae4RI566mJ1XeqpeFpxQPUcn814/AEsfw8jkY1z08LP07f4who3R7vv7DzZLr0ZmZjel49aw5TJknJtXeVWWc1fi0Fqnykric6l2Gj8BwQ9wilZnZ6UuY0x0Pp7CGz44h8B5sLlhFnyGo0v1kA09/HYZtH/H0rdJD9mADNwBzTUEIxH/KH/s/r2F5U2NaH0ArFEaqaUlcVUl4vzSfFzGMePzgBPlIVE4hvOfNhe/8bqydGXksF1UFBZ29UIlYgFAtUFLbginfTrdPj0tj823dmXHOslbvtn1XzajOtgKKmWoITGF91Hvij5AivOnVgbVeWVmhiOgxZeZ/8Uh8If6Cmld5kZISOicx57tC+lQYq8huromrUYaHyQlT5BiM5/iBtKoeRoat9BcIO/A4g2K/OU8g6c4fnENDc7TLu9RFa+mvC+JhswVEKeZgz86/1HVzvOVdkxmuWhSJPip6Ikq2yApCmoYPoC4yN3lrf5i04M5yGib4CZaXUHvDZdjmYG3Hsm0F2rEqoAKcX0HAMYju1V6HsXPVD4f1t1clJX8i7mTSGVo0fSG6ILY6Ok2FXQ3rC69ogLLOdRxLQ9tJaKMKTsjf63TIsRdzUpgsHpHUb4XQ/iwLR1StN3g1BI/yvgjOKMCpdModFzC96ySmweLpCricL8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(3023799007)(4143699003)(6133799003)(56012099006)(11063799006)(18002099003)(55112099003)(22082099003)(10067099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TUQ5cnlKbVk5WCtaMUpiT0NEWkVSeElvOS82OHljUjVYVFViZVpGTXIyTWdp?=
 =?utf-8?B?VkMreVZwakYzZXZWMXFwb2NOYnpmWmZnYUljM28xOVJET0d3azU1NHJHbVIv?=
 =?utf-8?B?dkVhTUUzQ1p0L2hlNTZjYldBU3V0bHZHZDRzaWlwbUFMN1Z4cUthc3l4ZXhE?=
 =?utf-8?B?RlVhdjNnV2RaYlRXQ0xtendLLzNKWlczanZXbDRHd0thcFYrMWFEUlZiLzJ3?=
 =?utf-8?B?NWZYdmxxREZVd1VFRWRxZVVjOTFSRHdKakJsNHFJUkI1VHNYbDByY1ozZUcx?=
 =?utf-8?B?TzNSZmxUbVlzVUlGdE4wbmlGeUwvcDBZSWw2ODcwUDhyREpaeTdqTmdzcW5q?=
 =?utf-8?B?bk0wM1pJU2oyWXFnSmIvTi9iNFFvdHo0T3BJa2tIdmo1dDF4cGhXMzVLWmhz?=
 =?utf-8?B?YkUyRHUxeUNKcEJSTUtrVkpsY0VXSW9Hc1ZHdUlKZXg0SlNwQktFN1JCbDdx?=
 =?utf-8?B?VVRIWHRZZXJISnBsTEtxYWpNbFRKYjBvZ0RTMTgzbVFuUXYwY1hCbVNKVUsx?=
 =?utf-8?B?Q1V2anFuUU5nVzViLzY1VS9XalBFTno5TGdBMU5oUW1ONStwWm9NaXRobXlz?=
 =?utf-8?B?dHRCY2xTeFZsWmdVM3VDTWZyWXpnakZraXZpUUI5VS81SVlraSt6WXVuZG1w?=
 =?utf-8?B?NTJSSWd2UE1COUo4OVpvYW9mWHA0S3N5SHFZM2g1eGs2YU5VSFVHMUYzZXVL?=
 =?utf-8?B?YjNEWmhIK0VuSDZmQUpNV1hKeEZVd1NlZWJQVENza2VGc0lraEt6MjlJSEg3?=
 =?utf-8?B?aVExSG5RQ1NkaUV0eFc0Smh0MmxoemhhSG4wVjVrRFZMbE5qbHRNay9sWHBK?=
 =?utf-8?B?QWpuWE5lZlFqMEFpSER0ZjdzanRiMGpJUnRUZndUNnkzVlo3Zy9KZUVXUi90?=
 =?utf-8?B?VEt1YjIyZVQ5OFBhZnZaU3BoVldNcExFdm56RVRadFh6R3h6dE0yd2RCTldz?=
 =?utf-8?B?b0pqYWJpaitGVDRKMUI3K0Jsamx1WEQyemZSbUE1alpzVXYyKzYwL3BZNW9T?=
 =?utf-8?B?Z0pVTGQxVGNzVU42dGt3Y0ptL3BkYm53eTI1R0N1bzBDUDF2MVp5T1hseDBn?=
 =?utf-8?B?MVF5ZllnS0R1dStBRnNoRFFUUS9EeXdmYnpBcmVMQ2NnZVd2MDFEcEhtalpi?=
 =?utf-8?B?U2VFdVdzZVpUUjRLTmlIWmtpdTdVOVROQUNIZmhUZkN1QmZUdVlNdkM4Y0lX?=
 =?utf-8?B?eFJJUzRNcXIzaGJVbTZkZ0hSSzlrN09zZmdGTFNqck5xdythM1ZJenQxZTNU?=
 =?utf-8?B?WVVvVUJCaXRoK0FZQWNhREFkbjMwZzR2MFBMNWZOUzRjRUNwL1dtdm9GMldU?=
 =?utf-8?B?Yno2dHl2eHI0ZTlwRUlWZE1yWTFjOFIvZGdkQW1UQi8xdENTOWsvTlBod2s1?=
 =?utf-8?B?b0gyRHd1K01JQTZES3NIQmR6K1VFRXAzZnhGTEpIc1RJZFFZR3VzaW5JSHF4?=
 =?utf-8?B?WEpmSThOUFhpNDJXTWRwVW1Sc3VRWUtuRll6MEczUVpleXkvL1psZ1RUV2ZL?=
 =?utf-8?B?Um5EUFlRdnhvRlQ2cFB6cCtyN3ZTVTNlWDl2YThacFY2WFVzUzFaQ0JwUkZB?=
 =?utf-8?B?ckF5cEZ4d3FmMVpJUi9UZEdCTGdBOVdEVnVMMzJTeVNjellhaWdhOStHN1ZS?=
 =?utf-8?B?aDRxTU9kVlBIdkVKS09BNnErelRpSGVwcEFjcVFGUjIyVFJhdThiOEQ2VVEw?=
 =?utf-8?B?OWZOczBGOU0rZUl2NnFZOExNMjh1TGZkRHdWVDNDdVExWXphT0R6KzMxZTVS?=
 =?utf-8?B?TkVXbDA5QnBzVEhMa3hWTlJPbWcyUS9LUTZtSFhWYjF4L2MzbUNWczBQSWRD?=
 =?utf-8?B?VG1MZEV5NnNaaGd6aXd3V1JpNmM1RG9LQUQzQk1OekRxMklKb2FMUlhWSjZr?=
 =?utf-8?B?NmpwcndQMnQ0TGFNSHJSRGwwdjFTS0k3TE5RSi9kaXh6c2hyQi9LT2NOTFZJ?=
 =?utf-8?B?NEdBbGxNMHZJLzRpT0pRRUlLbXBZd09KYTY5NEpMWW1oeVZwNm0zZ041aU10?=
 =?utf-8?B?cXRsckNGNjNzTGFNSjNUa3k5WkQweW9sM2o3S29Md3V2WGNqV0ZGcllGcHpU?=
 =?utf-8?B?djlqWndMOWNnYk0wV25tSmxvREZLRU0xY0tWN3g4bFdVYm9lb082NHNjKzJX?=
 =?utf-8?B?bzhwU2RGZ25Tb3plRXlxazZHeVpVMWpKL3cvWklxUXgxMndYUVExMXVxVllw?=
 =?utf-8?B?TzZ3RitxdDVtSUlPTklUZnd3K1J6ajhwbG5tbk1OTm1zZ0FEWkszUW54NTVL?=
 =?utf-8?B?VXVVUlhOTzYyNjBmQ3hmSXpsaWk4WS9sVlFCbkZpTkYxN2NuRkFVTVRxeWhD?=
 =?utf-8?B?QllZN1dUSktTMlBUVkV4b3RPWThsUXdnWEVmNXRMRDNMaURkUzI5dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d31c5ef-e732-4918-a9a3-08dee3dff8e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 08:47:02.5826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Me7ke7RO44nAdmj+qrIP+yd2M3vz0W1a/18yW2CdWx/DWOQz/tXbwEdJ05bq4b1CiPSsBXrMdkVVzrf4bCY6w6lxhxz73if/KcluaiWNGJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 08:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241155

T24gTWF5IDIwLCAyMDI2IDExOjE0IEFNLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90ZToNCj4gV2hp
Y2ggYXJlIHRoZSBjb25kaXRpb25zIHRoYXQgdHJpZ2dlciB0aGlzPyBQcmVzdW1hYmx5IHlvdSdy
ZSBzZWVpbmcgdGhpcyBsb2NhbGx5LCBJIGRvDQo+IHdvbmRlciBpZiB0aGVyZSdzIGEgZGVlcGVy
IGlzc3VlIGhlcmUsIGFuZCB0cnlpbmcgYSBkaWZmZXJlbnQgbG9nIGZpbGUgd291bGQganVzdCBv
YnNjdXJlDQo+IGl0Lg0KDQpib290bG9nIGNyZWF0aW9uIGRlcGVuZHMgb27CoFNFUklBTF9DT05T
T0xFU8KgY291bnQgYmVjYXVzZcKgc2VyaWFsX3BvcnRzDQpjb250cm9scyB3aGV0aGVywqBRZW11
UnVubmVywqBlbmFibGVzIHRoZSBleHRyYSBzZXJpYWwgc29ja2V0IHBhdGggdGhhdCBmZWVkcw0K
dGhlIHVuc3VmZml4ZWQgbG9nIHN0cmVhbS4NCg0KdGVzdGltYWdlLmJiY2xhc3PCoCBzZXRzOg0K
DQpzZXJpYWxfcG9ydHMgPSBsZW4oU0VSSUFMX0NPTlNPTEVTLnNwbGl0KCkpDQoNCldoZW4gc2Vy
aWFsX3BvcnRzID49IDIsIMKgUWVtdVJ1bm5lcsKgIGNyZWF0ZXMgdGhyZWFkc29ja8KgYW5kIHN0
YXJ0c8KgTG9nZ2luZ1RocmVhZA0Kb24gdGhhdCBleHRyYSBzb2NrZXQuIERhdGEgZnJvbSB0aGF0
IHBhdGggaXMgd3JpdHRlbiB2aWHCoHNlbGYubG9nKGRhdGEpwqAgKG5vIGV4dGVuc2lvbikgLT4g
Ym9vdGxvZy4NCg0KV2hlbsKgc2VyaWFsX3BvcnRzIDwgMsKgLCB0aGF0IGV4dHJhIHNvY2tldCBw
YXRoIGlzIG5vdCBlbmFibGVkLCBzbyB0aGUgbm8tZXh0ZW5zaW9uIHN0cmVhbQ0KaXMgYWJzZW50
LiBMb2dnaW5nIHN0aWxsIG9jY3VycyB0aHJvdWdoIG90aGVyIHBhdGhzICjCoHNlbGYubG9nKC4u
LiwgIi4yIinCoCwgwqBzZWxmLmxvZyguLi4sICIuc3Rkb3V0IinCoCksDQpzbyBib290bG9nLjIg
L8KgYm9vdGxvZy5zdGRvdXTCoCBjYW4gZXhpc3Qgd2hpbGUgYm9vdGxvZ8KgZG9lcyBub3QuDQoN
CnRlc3RpbWFnZV9tYWluKCnCoGN1cnJlbnRseSBhc3N1bWVzwqBib290bG9nwqBhbHdheXMgZXhp
c3RzIGFuZCB1bmNvbmRpdGlvbmFsbHkgb3BlbnMgaXQgb24gZmFpbHVyZSwNCndoaWNoIGNhdXNl
cyBGaWxlTm90Rm91bmRFcnJvcsKgYW5kIG1hc2tzIHRoZSByZWFsIHRlc3QgZmFpbHVyZSBpbsKg
PDIgc2VyaWFsLWNvbnNvbGUgc2V0dXBzLg0KDQpPbiBNYXkgMjEsIDIwMjYgNjo0NiBQTSBSb3Nz
IEJ1cnRvbiA8Um9zcy5CdXJ0b25ALi4uPiB3cm90ZToNCj4gSSB0aGluayBhIGJldHRlciBzb2x1
dGlvbiBoZXJlIHdvdWxkIGJlIHRvIGp1c3QgbGlzdCBfYWxsXyBmaWxlcyB0aGF0IG1hdGNoIGJv
b3QubG9nIGFuZA0KPiBib290LmxvZy4qLCBzbyB0aGF0IHRoZSBjb3JyZWN0IGxvZyBpcyBhbHdh
eXMgc2hvd24uDQoNCknigJlsbCBzZW5kIGEgdjIgdGhhdCBpbXBsZW1lbnRzIHRoaXMgYXBwcm9h
Y2g6IGVudW1lcmF0ZSBhdmFpbGFibGXCoGJvb3Rsb2fCoHZhcmlhbnRzIChib290bG9nDQphbmQg
Ym9vdGxvZy4qKSBhbmQgcHJpbnQgdGFpbCBvdXRwdXQgZnJvbSBhbGwgbWF0Y2hpbmcgZmlsZXMs
IGluc3RlYWQgb2YgYXNzdW1pbmcgYSBzaW5nbGUgZml4ZWQNCmZpbGVuYW1lLg0K

