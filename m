Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F12CAC5B8
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 20:12:33 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.71])
 by mx.groups.io with SMTP id smtpd.web11.17919.1759695150165313784
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 13:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=qRxW7rBX;
 spf=pass (domain: siemens.com, ip: 52.101.65.71, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ej4XbxS5yfijH3Ki9n8+uo89ANWXbc10hhpT1DRg89IUQxmOVBK/8DrlebqzUuJBj5JRHYkPTZkVk94u8Ter/RI5qddwDMl6H0y2Rx7qZw0b63CCVVoog0NAGZ49hbdGMXQiW8XRk3L7DNgj1LngXbC46YsrjbL7xHFGhiRAFNSWNAY++TW0FqugjqitivDc1xOvGBmPVFRK1IWBWFEMnDrKKihwzhucU1N2aHmSFt7Zrznbb3MUWTGHvMEAxktqWOlOgik3RW99igwHUgySfudtJOdqs+GpmytZ5bCbGkQ4ZG196pFCCUBoUj8sjd4M83mKATbhWiSud7kYEPvy3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DKC4DiZYgwaik/vNidDhNibNsXNO/9P3kZpBaN9Be0=;
 b=cw8p+sEnEWrxUK71o9FXvfnj93xrBtENU/WVF4kKdaK0cSo18d5nWpm98FJxvpK6S8+/sZTGuNpHfrdva+nj4O7svgQY8tx/Lw9e19SkB8G2s/OCxignxK+l59a75KwawAobUww3mlhZzPHLPKfkivjFtqootG/DmiExg1oaCekqALRIzQq0g2qdW6UScqc4DhyYcXtxX6TbjEzUZB17DW2WxoJAn5u3FSMW3wdhenORhth4u1oQUfX1dsHijuwedhu8WwMo7HpJgKys93VTt6F94gTene2d4N8OzitIunkCbO0csV3fOZmH0m4eykHqYrll2RlZL19zCPUwQ7J37w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DKC4DiZYgwaik/vNidDhNibNsXNO/9P3kZpBaN9Be0=;
 b=qRxW7rBXVTWhWIKG4IzfIUayr/q0tiZpavHGC9TBzGo2VL96Z7HxRi5TNlp9YmsmcmJAKfrFKG0eEShR8MrtB/Lv0w0Lgjgt2oPtj+A15QWROIS67/xbULK0Cif1Lanczk8kAcZabuEOW6K2QxCF67xiON4xoM+ZpTKk9WG320hl80JowP8xMqu3kizC2IiT+6UA4zT5RwXXx4YAsPaN2cWhogqauMx2aWH+o+6pwWLcZtLUO1mAlKQoYSDnYzUJ58GZ67Ucymn1c4SEZUjVHHCkih49upTpn9/nP9DNS+q28209DauGxU0dbJci1vIatlAhV8DkHKdFRvFKPoArdQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS4PR10MB5317.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Sun, 5 Oct
 2025 20:12:23 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9182.015; Sun, 5 Oct 2025
 20:12:23 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	Anna-Lena Marx <anna-lena.marx@inovex.de>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "denis@denix.org" <denis@denix.org>
Subject: RE: [OE-core] [PATCH v3] sqlite3: upgrade 3.48.0 -> 3.50.4
Thread-Topic: [OE-core] [PATCH v3] sqlite3: upgrade 3.48.0 -> 3.50.4
Thread-Index: AQHcM+IW5V7mczVqoku9hCI63tXdzLSz7YgAgAASIxA=
Date: Sun, 5 Oct 2025 20:12:22 +0000
Message-ID: 
 <AS1PR10MB5697EBCA8CA9CC068CEB8EBEFDE2A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251001152850.1342075-1-anna-lena.marx@inovex.de>
 <20251002211744.3418535-1-anna-lena.marx@inovex.de>
 <DDAME0P70H0A.3G3G7DPYEVKK3@bootlin.com>
In-Reply-To: <DDAME0P70H0A.3G3G7DPYEVKK3@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=f456c631-46f9-4241-a0f1-e6fa0e218577;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-10-05T20:07:46Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS4PR10MB5317:EE_
x-ms-office365-filtering-correlation-id: e7893bc0-b352-499d-f2f3-08de044b7ed6
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?by9Xcllva09XSnBoaHNjQ0NUZWhoc0ZHNWlhUmJ0SmNRMWZoRE8zWURXZkhU?=
 =?utf-8?B?YmgvNlZKVVEvRWI2UElwTEx3VDN5S2tDRlJDQVVXMkpxYit2eGtMZWl2RWJ6?=
 =?utf-8?B?NG01eEJJdUJpYTVSSnNqZEdKL2hMQi9ndHVMUEp0ZFRwemVkaVV3M1Zlc1Nm?=
 =?utf-8?B?QzRKVm1sajMrdHRCdUhxY2NrYWc2VTlaVm5CTHRVTklJWnFvZnpnVlAzbW9r?=
 =?utf-8?B?Z1Z3Skd1cEV0YklNU05ibFoyVmJ5d0h1Mm1NbXBjeDgzeHBkTENQdWoxRFBN?=
 =?utf-8?B?RDdESkVRSGJjTTFHZ2pNbnY4TTlRRjY4N3h6Q1Fic2R3MUNrWVE1dEd1cCsz?=
 =?utf-8?B?YXZncG41Rk9xdVFrRUlhVHdyZmpKWmxac3Q2SW8zTnBtb2EraDM1S1lUWUFR?=
 =?utf-8?B?UmxoUS9oUWMxNWRDL0tDVXA2V3gvRWZRZWVVdkZmakI5VENNN0R5TysrQTNP?=
 =?utf-8?B?bnY0S3RhcE4zRXFZRk0ydzNhNnVLeE4wVXRYcG9DRlpWWG1STGI0b3ZpTGpR?=
 =?utf-8?B?cGltNnVJUEF5WGU5KzNZODhidE4xcG1IUStzWm9HK3RENlgrS2ltaTNDZUd4?=
 =?utf-8?B?aFZmeGp6UFlBUHIvSTNBRWUwMW9NOXg1czNsTXpsSHFpZlBVRytTT1kwYWRB?=
 =?utf-8?B?Vm0yRUlCOXFuejhnYnRWTWFqcTRDZUU4c3UyWlpzbHBSUG90TWpMNXA4M3N6?=
 =?utf-8?B?VU1MMlFvaHNzdnJpek5TZGFGQ1IxUURxdUdqaGh4Nkt2MERYMm9SSTdwS0Jo?=
 =?utf-8?B?V2ovUzREZ3IyZzl5cEtlZmNrK082Yk9jMEcvVk5MMGlGMmphbUg0Y3M3YVRD?=
 =?utf-8?B?SGhwcmZldkk1b2RZNE5uVnFJaUtobzNMZ2V3cnZsL3NrWFVNd1hJSGpTaFBh?=
 =?utf-8?B?N2xzSjhQbUJmQ1U4dlJPSnFvUWZyVnl3TDFsVkVyN0JlcmtzSnF6SmgzaFph?=
 =?utf-8?B?clgvV3lXRXoxVmRaZHdnSldvVmswTVdYWDFKNHorZFA4b2JYTXhPNzV1elkx?=
 =?utf-8?B?MndyNk1rT2VqU2NHVlhOWEF6Ulg1TDVrZnk5TlR2TnpnS2ZQVy84cTR6M2Nr?=
 =?utf-8?B?aU5DK05ZN2Z4V1lPV2oyaExKRXpIdnRXb0N6MXNiSGZvMVRvUjR0NklvcHZD?=
 =?utf-8?B?OXVrWTBaYTQyRXJZVHAwNS9zZnlSVGZsRDRLTUh2bEJzMTlHd0ZDTXdSc3Qw?=
 =?utf-8?B?a3hLSW5Pdnc1UjlLakhKOUpCYTg1MWhoVlBkblJZT0prNWRZVkxPcGMxN0Jv?=
 =?utf-8?B?Ui9xaDlldjQ2b2VCNHZnNjByN2cwaDY3RDRGMkh4QnVGRmpZSEVreFdwblps?=
 =?utf-8?B?d3dabHZaYndrMStYMGwreU1RUy9TcVV0Mko5U1VRNlk5Y0kyOVF5TUtnc1dH?=
 =?utf-8?B?dFB2dG44cmJnNTRUL0ZMRkNyR3ZvSzgvclNuZzVwQy9oaHk2dCtHUFM3MTd1?=
 =?utf-8?B?TURQOWlBVjkzM2ZIQUxLVW5LTkU0U09la21DYVF6VG5yc244enlIcXNmekdh?=
 =?utf-8?B?V251VkxsbVRVZitva3JVdG9vWkxOWlVWVUNBdkFia0dUeW1mOU5kbEErSDg1?=
 =?utf-8?B?VTB6ejVwVnlHWVZKR3pTL1I5VEp1OE44bUlUY3BEdHlzc0JxUjNyV1phZ0xK?=
 =?utf-8?B?V3orYm03NnphWDZjeWprNWYvWkREY2R3MDNRQ2V6MVBVdk9xN2cwWGJPQVg4?=
 =?utf-8?B?LzlHL1RrUUdkWUMvVy9nd0N6cWNRT09yaUdHSlJiNFYybDhLMFdGaU9meUJR?=
 =?utf-8?B?cU5tUVVWeWRuSTNmMlZmbjJJTnBzczRITCtLSVlQSUNYZEhLKzJRZ3J1T0Nk?=
 =?utf-8?B?TmxmZXpoMXFmSjJ6cmdVNUtSdGlWcmRWY1FFZHZNQndzTEJ2T2pHQUJvMjRX?=
 =?utf-8?B?QWNIdnM4c2ljcU95Mi9IYVdYU1dJQ3NIZ2xpTjVIYmFJN0lLWFM3YnBFOE9Z?=
 =?utf-8?B?U2FRK2VxNUZWRTFDb2pIWTZCWEpiYWZmZmtnTlJGUEpmVnd1RS95WGJEamZa?=
 =?utf-8?B?VWZzbVlVT1BBPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VDVTZ1R6eEFEVkNuOTIzUW16OEV3OWRuYjRkbWlZNHVDVlA0OHd2UzFQdUVE?=
 =?utf-8?B?eGhzSURaWXprN1h0S09FekpnZHFDU3lIVWlweXJKZHpuVUtyQWFQLy9NOUt5?=
 =?utf-8?B?N3Y4anVlOFhIS3ZsSTdGMVVWM3pUbU9QakU4aC85Zkx3QVZXRktLSnlXc3Q0?=
 =?utf-8?B?ZWcyRHMySUZxY3lqVDhsdGdnUnlCeW9PbDQrZUdkL0dDRmFEaVlSS3A0Ulpu?=
 =?utf-8?B?a1RkeXoyZ0tVT1Z5ZWdTNXBDNm5RWlVtSUN4SVhSVEljM2pJOHYzNFRiTFFx?=
 =?utf-8?B?V3UvZmVNeDd2VFEwWWV4eThuTUZ4VnNSYWNvRFZ0cy9BWE5DdGJ1eFdPU21S?=
 =?utf-8?B?bk5kNDlVUE9jSFRRNTJRMXIvZ3A0Z0hjQ1c5TVU2SDhMWVhxYXdKNXdqbjVx?=
 =?utf-8?B?STAzUkZTZEZ6SHEza3Zsc005RjJ4NzZ5bjdHNGJ3V0F4Tzh1Rzh1djNrdW80?=
 =?utf-8?B?alZTb3lKa0UvMDhGay8zQmxSUkFmOHZpUzNUNzZHb2xselZhOVROQ3VnWVY5?=
 =?utf-8?B?Y2YwdExPUjdmbDdoNWl6NjhSczd2b2g2YlZPTEpyL0J2OGZYa0VKMW1Vdjlj?=
 =?utf-8?B?cTVjc2dNdWI5eHFDZTlMaEV0WjJaaVUxeHBZanRDa2ZtdWNUdjFLVzZ5THAw?=
 =?utf-8?B?TGpPd3RTZHJCNG5tVFczdU9QQ1JxSFhQS1gwVVMwU0FrR3dFQk1uK3F4ZnVv?=
 =?utf-8?B?VFVOazVKYzg4WTAzVTltOUhBZ3J4M0J0SmdhclRVNFg2NzJvZ2JWVFpWelVv?=
 =?utf-8?B?TlUvdmpEeCt6SFBzK0RxYUlld1FDNkQwRmc1OE1pK3R3ZmlIZW9EQlR6dHdC?=
 =?utf-8?B?WEUwTDI3SE05Z0xRbnRiLzRjV1pLMkZZWDNoSHRkNEJscnd2NU5aUjl1NHB0?=
 =?utf-8?B?SitUemtnajRCNWduN2tmaXJhSjJCQzMrVTh2RnpkOVpOVjFBZGlHQnZnTXpK?=
 =?utf-8?B?eWpHOXBPMjdrKzNIb2F4WUVkZkptQ0UvRzhwN0xBbU9kSFprZ25uVDJRQnE2?=
 =?utf-8?B?UHlUck9naVVES25IaHpydFY0aDM5OXJxYzJ0aHFyc0FMa2h2UjQxZ3prMG9W?=
 =?utf-8?B?VnNydG5Qb3IrNUw4NXRhWEJpUVVjVGdValIrVjl1RHFrRGhIb0syb00wOU9y?=
 =?utf-8?B?d0JkMlJXNGFPdWI2WkMzSHRFWXV6aHcwcUg3NXpSSHdoRFNmbDc0cGoyYS9z?=
 =?utf-8?B?TVJDV2RnN3QwLzZzTzRCMldSTmRScW4yMjhuVzVLS0hLMzBmNUQ3OW0wMFVx?=
 =?utf-8?B?SnhrSEJkcXVkN0RaNSt6RUIxN3JBdXpBcEYrVmhrSVVXTkZwaE5IS2pLTUx3?=
 =?utf-8?B?YWZWZC9GSGs1dU80Ky9LV3R6a3FEc01BVUZ4bXEvK2xRZzY3M2NQbm1KaTlv?=
 =?utf-8?B?dDNoVEorN0ROZzdmUEVLcWE1dWFWSmFuS1l6SXJBSk0zNkNXRk16WHlwMGNW?=
 =?utf-8?B?bWYySnpLejR5QkdQRU80K3hNaXBjLzlSVXRhc2U3SHZ3ZkdHMUNmOUhtQ3du?=
 =?utf-8?B?WkRENVpjUnNlR1ovS3VieklBQ2tUWVo1cnN4YVRnMGtWTllUMzEzOGNOWlRB?=
 =?utf-8?B?VWlEY2dDYzI2TXpuWHdrTTY3TW44OVNXZk5udGEzZ0VINlB1MGpTckVOSEF6?=
 =?utf-8?B?MzhoditXLzQrWGNnTk5jZ0svMVFMNE5QUkhMaTJCSStVYzZTMkR1ZzlsTDRh?=
 =?utf-8?B?ejFzekdxekRvYXk1Y2NNRGFlNUFJT1h1UDZLRjVhVE8wRHRwVk1Gbm5tbUNY?=
 =?utf-8?B?d3IyUHlxRnpUY21ocEpRcHRkY1h6T0NTTlpGVTRlalVOV2tGSkhJY014bzJL?=
 =?utf-8?B?VnA4UFdqTHc4Z0hEOUJpc0VDRWhCeTFTSjkxWDBXOURqa3F1RWZnSE9MRVh5?=
 =?utf-8?B?YmxMc0w0bEs1QXhDaXI4Y2Fwa1NteWZpS2FVWjFDbngweStRRUk3R3pzVVRh?=
 =?utf-8?B?OGFmNzVOM29hZUNaZ1J3Q0RubGdJclI5Rm55d0dRQkR3SFRoNmFxTFhPRDg5?=
 =?utf-8?B?OC85OHIwMStnL0pUcWE4K28ya0VaYmI4bDJwQkVwQ3hQamJkc01UMzZ6djg3?=
 =?utf-8?B?UnQrMVZuQ1RWUkRQakRLcG5mdS9RczFmekRKcFp3YU5sRnJHM0lsN3JsdGhH?=
 =?utf-8?Q?MgZKsv3dxN9unZiPN/5bzzAfQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e7893bc0-b352-499d-f2f3-08de044b7ed6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2025 20:12:22.9891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JyYx1u06MdhzQmdyIDr8IZbLYS/NA5fAjfGFR27p6JBxrXtvN9hvy6Q271iQ6QOILCTuVf4L+e4OntOisKLusA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5317
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 20:12:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224446

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBNYXRoaWV1IER1Ym9pcy1CcmlhbmQgdmlhDQo+
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU2VudDogU3VuZGF5LCBPY3RvYmVyIDUsIDIwMjUg
MjE6MDMNCj4gVG86IEFubmEtTGVuYSBNYXJ4IDxhbm5hLWxlbmEubWFyeEBpbm92ZXguZGU+OyBh
bGV4LmthbmF2aW5AZ21haWwuY29tOw0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IENjOiBkZW5pc0BkZW5peC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3Jl
XSBbUEFUQ0ggdjNdIHNxbGl0ZTM6IHVwZ3JhZGUgMy40OC4wIC0+IDMuNTAuNA0KPiANCj4gT24g
VGh1IE9jdCAyLCAyMDI1IGF0IDExOjE3IFBNIENFU1QsIEFubmEtTGVuYSBNYXJ4IHdyb3RlOg0K
PiA+IFdpdGggdGhlIHVwZ3JhZGUgdG8gMy41MC40LCBzb21lIGNvbmZpZ3VyZSBvcHRpb25zIGNo
YW5nZWQNCj4gPiBhcyB0aGUgcHJvamVjdCBzd2l0Y2hlZCBmcm9tIGBhdXRvdG9vbHNgIHRvIGBh
dXRvc2V0dXBgLg0KPiA+IFRoZSBQQUNLQUdFQ09ORklHICJkeW5fZXh0IiBpcyBub3QgbG9uZ2Vy
IGF2YWlsYWJsZS4NCj4gPiBCZXNpZGVzLCB0aGUgZGVmYXVsdCBDT05GSUdVUkVPUFRTICJ0YXJn
ZXQiLCAiZXhlY19wcmVmaXgiDQo+ID4gYW5kICJvbGRpbmNsdWRlZGlyIiBiZWNhbWUgaW52YWxp
ZC4NCj4gPg0KPiA+IENoYW5nZWxvZzogaHR0cHM6Ly9zcWxpdGUub3JnL3JlbGVhc2Vsb2cvM181
MF80Lmh0bWwNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFubmEtTGVuYSBNYXJ4IDxhbm5hLWxl
bmEubWFyeEBpbm92ZXguZGU+DQo+ID4gLS0tDQo+IA0KPiBIaSBBbm5hLUxlbmEsDQo+IA0KPiBU
aGFua3MgZm9yIHRoZSBuZXcgdmVyc2lvbi4NCj4gDQo+IEkgY2FuJ3QgZXhwbGFpbiB3aHksIGJ1
dCBpdCBsb29rcyBsaWtlIHRoaXMgaXMgYnJlYWtpbmcgdGhlDQo+IGltYWdlZmVhdHVyZXMuSW1h
Z2VGZWF0dXJlcy50ZXN0X21hbmRiIHRlc3Q6DQo+IA0KPiBFUlJPUjogY29yZS1pbWFnZS1taW5p
bWFsLTEuMC1yMCBkb19yb290ZnM6IFBvc3RpbnN0YWxsIHNjcmlwdGxldHMgb2YgWydrZXJuZWwt
DQo+IDYuMTYuOS15b2N0by1zdGFuZGFyZCddIGhhdmUgZmFpbGVkLiBJZiB0aGUgaW50ZW50aW9u
IGlzIHRvIGRlZmVyIHRoZW0gdG8gZmlyc3QgYm9vdCwNCj4gdGhlbiBwbGVhc2UgcGxhY2UgdGhl
bSBpbnRvIHBrZ19wb3N0aW5zdF9vbnRhcmdldDoke1BOfSAoKS4NCj4gRGVmZXJyaW5nIHRvIGZp
cnN0IGJvb3QgdmlhICdleGl0IDEnIGlzIG5vIGxvbmdlciBzdXBwb3J0ZWQuDQo+IC4uLg0KPiAy
MDI1LTEwLTA1IDE0OjE0OjU5LDU4NCAtIG9lLXNlbGZ0ZXN0IC0gSU5GTyAtDQo+IGltYWdlZmVh
dHVyZXMuSW1hZ2VGZWF0dXJlcy50ZXN0X21hbmRiIChzdWJ1bml0LlJlbW90ZWRUZXN0Q2FzZSkN
Cj4gMjAyNS0xMC0wNSAxNDoxNDo1OSw1ODYgLSBvZS1zZWxmdGVzdCAtIElORk8gLSAgLi4uIEZB
SUwNCj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8j
L2J1aWxkZXJzLzM1L2J1aWxkcy8yNDc4DQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9q
ZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzQ4L2J1aWxkcy8yMzkxDQo+IA0KPiBJIHdhcyBu
b3QgYWJsZSB0byByZXByb2R1Y2UgdGhpcyBsb2NhbGx5LCBJIHdpbGwgdHJ5IHRvIGV4dHJhY3Qg
bG9ncw0KPiBmcm9tIHRoZSBhdXRvYnVpbGRlciBpbiB0aGUgY29taW5nIGRheXMgdG8gcHJvdmlk
ZSBhIGJpdCBtb3JlIGNvbnRleHQuDQoNCk15IHR3byBjZW50cyAtIGl0IGNhbiBiZSB0aGUgc2Ft
ZSBpc3N1ZSBhcyBpbiBteSBmaXJzdCBwYXRjaCAtIHdyb25nIHNvbmFtZSBhbmQgcmVzdG9yaW5n
IGZyb20gc3N0YXRlLWNhY2hlLg0KDQpCdXQgaW4gZ2VuZXJhbCwgSSBkb24ndCBsaWtlIHRoaXMg
cGF0Y2ggYXMgaXQncyBub3QgYWRkcmVzc2luZyB0aGUgc3dpdGNoIGZyb20gYXV0b3Rvb2xzIHRv
IGF1dG9zZXR1cCBwcm9wZXJseS4NClR3byB0b3BpY3MgaW4gcGFydGljdWxhciAtIGl0IGtlZXBz
IGF1dG90b29scyBjbGFzcyBhbmQgaXQga2VlcHMgbm93IGJyb2tlbiBjb2RlIHdoaWNoIGlzIHRy
eWluZyB0byBkaXNhYmxlIHpsaWIuDQpJIGhvcGUgSSdsbCBmaW5kIHNvbWUgdGltZSBkdXJpbmcg
dGhlIG5leHQgd2VlayBhbmQgc2VuZCBhIG5ldyByZXNwaW4gb2YgbXkgc3FsaXRlIHVwZ3JhZGUg
cGF0Y2guDQoNClBldGVyDQoNClBldGVyDQoNCj4gDQo+IFRoYW5rcywNCj4gTWF0aGlldQ0KPiAN
Cj4gLS0NCj4gTWF0aGlldSBEdWJvaXMtQnJpYW5kLCBCb290bGluDQo+IEVtYmVkZGVkIExpbnV4
IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGluLmNvbQ0KDQo=

