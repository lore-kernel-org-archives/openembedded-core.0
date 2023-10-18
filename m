Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6423ECDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 17:31:08 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.59])
 by mx.groups.io with SMTP id smtpd.web10.287967.1697650265274799935
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 10:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=dhkjoWTr;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.244.59, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ey96WWtyADjQ8JXWBoE0Hvwxt8feM9zCzmqb1GBcGj1izFeTFW2rR0JdDTPQDZx8JVp+G61sbIl7yW3/1nzg4k174En79mlTTye5WygKWNpw0rG0mG5eWio+dbFU2ThvvbTBMgO/cngAi18sft0m5zQGlf2GdHO9xQTMV4zut0vp//H4svVMCY32MRsKFYSQyWj+txpxZAq94sQgXDUIGbqfgOOulvBrql8NHkG07Jlsiv5ucCwTIeBztU4RH5sZ5y7adagskYZ4sz0e9yW15LkB7DYGHg0NsSuzeGDYZm8tgQzDteCgB4pZP2u9QW5ItaumJyQa4GdWrfPwf4aNHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hsqmL8wn41MFNq6S9U4rJMMWvAVBVmIlx01zs1k8zY=;
 b=faF4UVhiV7wNQv7BzNA96uU7I41btiCFSs09XSHjdNd0xTbxRtfHdAJXQteUZFWX7A8rgfXDBrVGTDLp4jLRkYI9DphO7KIICselj/V2Rva214t6R7EWnoz87C4ulJGDbumS73RCASFQbuua9R2AuLB15we1y1+gStarCoDIoCi3sqKbv8Lh0WjiB125KEL0tWvnl8AiIww9gFitLVPJYMlKd2qjQDFSNY6uu+DWP3TsRCNO1XHZEqNkGuKWznqJWZAZ1v/OGz5NMZs3SO6Q9LEpPuI7b1il/dJslSHxfTRF2P54J7g6RlTk1YgmgA+423HvdVR+GWU2JihrRv+SlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hsqmL8wn41MFNq6S9U4rJMMWvAVBVmIlx01zs1k8zY=;
 b=dhkjoWTrWTuu6TlA+fUmFdYs66T8MSuT/TOdrSCeaTkbF5Q/2m2goVF/2wMMWup//UbOIJQFx/IMqL1yy6ABrzMnpRj+VFSedHjexm/mhZbEJ/ZRipseVW9QdgQfFXMwY/n6vCpWGRjsOacMdFFbPCvdnN5cCqTFgxqUZTJN3xzhRMA4EJoptU6svxu5sfLj5qvertVA49O5rYUUT/4g2p239SsPQRIO1IMUUIv0hLVUXkse0nOriEGLOkynlWL0yM7AUssTICwZxbUUTDlJ8XXmpm0/0JBgYyuaE9gUo1mlQ7cbBMRRJ62AO2JBkUbiGOTUjl/flhLgEMrh1ay+Hg==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 IA1PR12MB8078.namprd12.prod.outlook.com (2603:10b6:208:3f1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Wed, 18 Oct
 2023 17:31:02 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::5c25:f895:7bc2:de11]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::5c25:f895:7bc2:de11%3]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 17:31:02 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "jon.richardson@generac.com" <jon.richardson@generac.com>,
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCH 1/3] kernel-yocto, devtool-source.bbclass: fix
 'devtool modify' for kernels
Thread-Topic: [OE-core] [PATCH 1/3] kernel-yocto, devtool-source.bbclass: fix
 'devtool modify' for kernels
Thread-Index: AQHZ/UpTh/r6Atc+X0O88ReAbo4V17BP1gEA
Date: Wed, 18 Oct 2023 17:31:02 +0000
Message-ID: 
 <DM8PR12MB5430ECC002146797097B60B58BD5A@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <178D75FBE8F44DE3.14388@lists.openembedded.org>
In-Reply-To: <178D75FBE8F44DE3.14388@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=8d1204cf-7eea-42a5-9a7c-259dddb18bf9;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2023-10-18T17:26:56Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|IA1PR12MB8078:EE_
x-ms-office365-filtering-correlation-id: 96292926-219c-4148-a92b-08dbd0000048
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Zr860qf99alVDbmQTWK5o4Qv6FaPW8FyfE3iaUyxYn+AlwiJ2jNX0VH+ma1Gw44OOKnXXDNJ+dPUe4ZplTmZidsI/+PFkuCkJRPJGZNlw8R/us+BC0uteRJk4ZWF0GchOTeV7yAHnIkAMcQrHhW3fdeLS7BYYueUq36aWgql2ljmqWjA/bAyCsU5QS7Q3nbcQseSo87d3fjiQLA24cD9fGxzG2DyHwmdqew4r7FvpPF43mQgAmcsfmLtmft6UKX5W7gzg2vavk/Xb/7YumT7z+YZ5sPIISV5zsB/e693fDg77GVO3GK9llLU8OHByx08vWLtsokleeDthYZjUkjwiKRyRcwWB8zrcOYEkseiPkVdCvApTh5pjVzmTetCv5NXdBS87SfreK7qdFobjcLzEp2xUn867rvzuf82auLN31tmrWM7mVkWGQQXXqUeovMku8vxW4AVkKnuM9vdgEFcz/eCw8P/KwkKqcHzXAyXCtSyUALlQgMX0EBKsEJvhmGeL12hOO93QU/0cTSHccC6Ihds1xpT+8btBXJoe2GRkzfc8y7ctAoZ3q+wdK76/KcLUgA60iyRRRSwQn3cpdB6Fh6y6elQQtyW3rQrq8Ns8UYtqC6EWZ6eMnmBF2bnnCr+
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(346002)(39860400002)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(33656002)(55016003)(122000001)(6916009)(64756008)(66446008)(66946007)(76116006)(316002)(66556008)(54906003)(86362001)(38070700005)(38100700002)(66476007)(83380400001)(26005)(6506007)(71200400001)(9686003)(7696005)(478600001)(41300700001)(2906002)(4326008)(8676002)(52536014)(8936002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Rm5URmVuWk85SXNBcEhHclhTQ0RzWXJWOXlFalA0T2N2dzNVM0pIYmh3RW5L?=
 =?utf-8?B?WUgvWUFUSEloM1Q0NUlkOS91NURTTm5qMjF6Qi8raXgyQng5eTdzd1g1cW1G?=
 =?utf-8?B?THhpdyt3U3Fld0NoQURkN05UMXdkSkcxWThqLzhhUm5UelNEWWVMRE03Z01C?=
 =?utf-8?B?bENZVENZaHNjeVl3MDVacFdTWXozNUNrZ1RyanIwY0FIcngzeTNkQmtyWmdt?=
 =?utf-8?B?UWgwMWNxSm1KSm5vSFlvUzdKL2FXaFZZNGc5SW9jYnVRSVFLT0FzSXIxWTUw?=
 =?utf-8?B?RGRpRi9yVlBNUjRBVExnVFJ0d2Zvc0ErNnU2SVB6RCtmR1VhY3J0WFNiUDl3?=
 =?utf-8?B?UVNpbFg0a2MwZ2NsVm5pSjA1SXVIald4R3BoU1A4eExnRFFIWWFMaVYzZTVN?=
 =?utf-8?B?TWJnUUlrVVhCZjVvQ3BJMjBZS3R0VC9qQk4yd0dUS0thVThSc2xyT1VETnZ5?=
 =?utf-8?B?cDhHVTBvT0VJek56ZjVSRUxkME55NmI5Qk0yYllETVFoS1o1QVdyYlBpQ2Nj?=
 =?utf-8?B?LzZPN0hqWVZ4SitQVHdwbmt0Vk41VTUvRTRXaldxWGVSWnFqeDJENEVaZW12?=
 =?utf-8?B?cm9jZ2VuWmVqaGtyc1RTVUo4ak9rcnFpd1VRMHdEcHFXN1c5aEVoR0VsTUhR?=
 =?utf-8?B?czluOVg3QVhoV0J1SDF6NHBtM1dyY3FienBuNldsVWgvMEdNWHJyQlVrWmxL?=
 =?utf-8?B?L1lPaW9Qd3RwL2VodVdpbUc1Wmt4emdseEcrUWdFMERZRjJMdU9CUFRoSHI2?=
 =?utf-8?B?L2RFa3ZBN3dGeldicFJkOXFFLzNwUEFWd1dCazcvN2o5WXVtRElDSzdqTGpv?=
 =?utf-8?B?UVg1TjZjcGc2ZzdwM0UwdlFSTjMrTzdaMElzRG9ZakxJN3kwT1pjQ2habVFv?=
 =?utf-8?B?dS9uQnlES2Z5bEFpK1hIYXJ2TE0rZDhEZS8xdFZDbk1hUlRzbVQ1Q0ZhN3py?=
 =?utf-8?B?cjQzUmZYbEludlNqOE51T2ZzazBMMUVFNjFOcUhWeSswOFBZNUpKTkhOMXdD?=
 =?utf-8?B?T0oyTUNFUkx1QWMvZ1JRekNIOFhqd3cvSkZxQk50Z0dtK3FtS09MdVNEL1pr?=
 =?utf-8?B?QUd3TkFURGxQeS9pQXNnbkd3TFN0MW01MFErYmZ1UWVZbkI0ajBEd3NaNUs3?=
 =?utf-8?B?dU1lbFFWbHd6OTdQM2RnSUthaUtBeVYrc3gzczFtdkpFV0hvVkVSUW9vS3VT?=
 =?utf-8?B?bDZQNXpyRmZDZExvUzRHazYvUldDQm16WW53Z053QktpZHliOVBzK254cEtL?=
 =?utf-8?B?emg2VDJTMzRENlVpQ3ZTanUwMzlHeHp5M1FhOG5nWTNQcjRDV1NEdkgvN2wy?=
 =?utf-8?B?QWd5MjFPaEV4SndlVkNvTUNEYnNWaC9TSHZiSGE3amJuSGZOZEVYdzVLVUpx?=
 =?utf-8?B?c1NGcStKcTBWTjl4c0NxR2h0cnFFTkNMNk01bVo3cGF1d3I2bnBoLzg0SmV6?=
 =?utf-8?B?ZE1vOHFHZUMwaVhoazJPRE9rSTRxWndrdG1CWTJtbDlnUU9ZN2NYUnNGTVA4?=
 =?utf-8?B?VG5GdzQrSU4raDZFdnZQdzJ2WDVOQTBjUTgwQ3IyZnBBU1F1MWhHSHJtQVEx?=
 =?utf-8?B?NnJSaUFXNFZrODhSYVpJaUtyZjdTMFNIK2JNTHAwWEdoZlJSMzJYS1lUajZk?=
 =?utf-8?B?b2hHRG9DUnAxSWlMU1JSUEFMMU5KWDBuMnNqR0ZDcVcwRXlOMjk4MDBJS3dk?=
 =?utf-8?B?YUdBUHByS281SW5ja2tEM3A1b1FDVy9SWTI0cDd5ckdIZFJBai9vK2hVOXFC?=
 =?utf-8?B?QlR6dVdxaXFyOWx5T1J3ZmpRUitBTEJhT1dvYTVlTlEzMjAwMjBRVXgrejVX?=
 =?utf-8?B?dGxwVE9FYXIrZ1JIOWlXUlZVUnIvK1RGOFlpSEgrbHRWZmozSW0yd1FTelBD?=
 =?utf-8?B?T0Z3NVYvNklwd09SY3kvZ1NPdEc1aFVLZWxDTGxwaDlLMUx1T1ZJMnlCTnZp?=
 =?utf-8?B?TmxSMEQ1OXlWN2pTQUYzZnZNbUZsQzI0Ri9MQmV3bEU5V0wvaVkzcVMvWE5J?=
 =?utf-8?B?U1ZJQy9MclBiNlg2RWJ5NUV0aElSWVZBWGNqMlBNUUhpSU56ZXIzT1JXUDA5?=
 =?utf-8?B?cWNweTByZURVTkkwVzd5N3hCc1BPZnpXWXNkN1JObFMraFpBMzl6dmh4bWtY?=
 =?utf-8?Q?kxqiRiMLbdoylRbiOZ707ERGR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96292926-219c-4148-a92b-08dbd0000048
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 17:31:02.5796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g6ogb4cm9RbmB02R5GUOBILfagp8fJgupzugjTPg2UnnBgFQaAIRVG04ZH1y2OkpfUjm1ynlb1WAl43jINDKATNeOSnCU7Z/Xh10Tv9YJOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 17:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189414

PiBGcm9tOiBDaHJpcyBMYXBsYW50ZSA8Y2hyaXMubGFwbGFudGVAYWdpbGVudC5jb20+DQo+IA0K
PiBGaXhlcyBhIGNvdXBsZSBvZiBkaWZmZXJlbnQgaXNzdWVzIHRoYXQgYWxsIGNvbnNwaXJlZCB0
byBicmVhayAnZGV2dG9vbCBtb2RpZnknIGZvcg0KPiBtYW55IHVzZSBjYXNlcyB3aXRoIGtlcm5l
bC15b2N0byByZWNpcGVzLg0KPiANCj4gVG8gZXhwbGFpbiwgd2UgbmVlZCB0byBjb25zaWRlciB0
aGUgYmFzaWMgZmxvdyBvZiBob3cgJ2RldnRvb2wgbW9kaWZ5Jw0KPiB3b3JrcyBmb3IgYSByZWNp
cGUgdXNpbmcga2VybmVsLXlvY3RvLmJiY2xhc3M6DQo+IA0KPiAgICAgIOKUjOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUkA0KPiAgICAgIOKU
gmRvX2tlcm5lbF9jaGVja291dOKUgg0KPiAgICAgIOKUnOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUmA0KPiAgICAgIOKUgiBTZXRzIHVwICR7
U30NCj4gICAgICDilIIgZGV2dG9vbF9wb3N0X3VucGFjazogc2V0cyB1cCAnZGV2dG9vbCcgYnJh
bmNoDQo+ICAgICAg4pa8DQo+ICAgICAg4pSM4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSQDQo+ICAgICAg4pSCZG9fdmFsaWRhdGVf
YnJhbmNoZXPilIINCj4gICAgICDilJzilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilJgNCj4gICAgICDilIIgQ2hlY2tzIG91dCB0aGUg
bWFjaGluZSBicmFuY2ggKGRlcml2ZWQgZnJvbSAke0tCUkFOQ0h9KSBhbmQgcGVyZm9ybXMNCj4g
dmFsaWRhdGlvbg0KPiAgICAgIOKWvA0KPiAgICAgIOKUjOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUkA0KPiAgICAgIOKUgmRvX2tlcm5lbF9t
ZXRhZGF0YeKUgg0KPiAgICAgIOKUnOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUmA0KPiAgICAgIOKUgiBHZW5lcmF0ZXMgdGhlIGNvbmZpZyBh
bmQgcGF0Y2ggc2VyaWVzLg0KPiAgICAgIOKUgg0KPiAgICAgIOKWvA0KPiAgICAgIOKUjOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUkA0KPiAgICAgIOKUgmRvX3BhdGNo4pSCDQo+ICAgICAg4pSU
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSYDQo+ICAgICAgICBBcHBsaWVzIHBhdGNoZXMgZnJv
bSBwYXRjaCBzZXJpZXMuDQoNClVnaCwgYWN0dWFsbHkgdGhpcyBuZWVkcyBtb3JlIHdvcmsuIElm
IGEgcmVjaXBlIHNldHMgS0JVSUxEX0RFRkNPTkZJRyBiYXNlZCBvbiBNQUNISU5FIG92ZXJyaWRl
cywgdGhlbiB0aGUgbm8tb3ZlcnJpZGUgY2FzZSB3aWxsIGV4cGxvZGUgd2hlbiB3ZSBjYWxsICdr
ZXJuZWxfcHJlX3BhdGNoKGxvY2FsZGF0YSknLiBTaW5jZSBpbiB0aGF0IGNhc2UsIEtCVUlMRF9E
RUZDT05GSUcgd2lsbCBiZSB1bnNldC4NCg0KSWYgYW55b25lIGhhcyBpZGVhcyBJJ20gYWxsIGVh
cnMuDQoNClRoYW5rcywNCkNocmlzDQo=

