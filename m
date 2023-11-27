Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C817C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 14:41:59 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.72])
 by mx.groups.io with SMTP id smtpd.web10.96360.1701096113936658723
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 06:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=oZVWttW2;
 spf=pass (domain: siemens.com, ip: 40.107.247.72, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2RNUc7VGbA77jSbk6IgbyLFVwus71SXejSBddQ2Ipeim7IC9F8OxfOL0m3tcghRiNnHP5ZDyGSWfxPBNKPqGqcmKbqmVT+E1+In9btThRY4ORDdAKDvmR8NsON6TWLoEg47+e1QPpzT2k6o/F0RhQ9hGDi2fTTvTISmQgGJ/N7NbkK63PR/nIVc/bqW4XAOJDt+TGudfb6MhsdwaPHnxeiCzAbT/8JFtS90Jrk3WWMoAETS4WlK3e6CfROTYFXJVIn0N7S+y+jchOcVNdF9LOPkXrAaoiiK2YMNTh8Mgxrf/76MEtZW2kkIsBWh8vWh0humfLRQWI4Y+lMvaT/iOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mmv/G3NT3xGPeXDEw0NUx2zkqg/LP5SROSpgdNib2k8=;
 b=NnbfpYksBsIBiIh4hujgYxv9hUOQg+W2GFtuqhJVUc36mewPj4UAkWs5YZVprtHQOKh9IXtX8pb3kFJ2niA2iBRTU0psEW9Kz2R7X3tMWy9UxrE4fz/N62XJPrCL+4mUNQmkl8Fq8d5DqizNWvhJe3IAtJts4ZF8cppL7C651CgmLRFzJ4um5RjNsewj0rRIlOAPHI0ZNOYpq75zXN5TAnuJ0OtMmfz5DF90ve28i75yw2iLBbsAGm3RsP4+k5upFJrHx7hkDaaQCBwTkjokQnnn3qrJjI54K7JusyhnbppNh8NreR/oQuyAlSb3wjTldwcnlNKZbebia5x0INCe8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mmv/G3NT3xGPeXDEw0NUx2zkqg/LP5SROSpgdNib2k8=;
 b=oZVWttW2PWGRKuZf2FRPsZ/f09PUH83HLmDdkkqNVZjfZkMQodceXRTBR7oGFIKxSbvjdeleJLRutOP5vBXnhJk20RA0s8IxuijTVTMK+IT+qTWpvcCusaGzVBlW2S+4Gz5ZCbLkDBwcyARtNaJisOBWG4cfy1orkUCwRUN7mw2OxnZoSXHDYBIsBuTi+tmno8rXJRAjcgGhnN7E49shedSJ0aIavkElYPm1VGujn2Xlof2HhyxNN7Yo9RAcz6cln7/JrBdyIm5LSMkKAIiCiBU7dkCTonDxHKgxRCcMFaBPieJUgedwNqK/89fWMDX6f1VdHi9uTUZUdaJQHNQkvg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM0PR10MB3650.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:153::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Mon, 27 Nov
 2023 14:41:50 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::238a:d0f9:cdcb:d066]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::238a:d0f9:cdcb:d066%3]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 14:41:50 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "steve@sakoman.com" <steve@sakoman.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: RE: [yocto-security] OE-core CVE metrics for nanbield on Sun 26 Nov
 2023 05:00:01 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for nanbield on Sun 26 Nov
 2023 05:00:01 AM HST
Thread-Index: AQHaIIoxl6me9Fy5/06Jk3iUygiwLLCOPBqAgAABmiA=
Date: Mon, 27 Nov 2023 14:41:49 +0000
Message-ID: 
 <AS1PR10MB5697787AC705B524252BBAC1FDBDA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20231126170117.8DE1B1069B5@builder.sakoman.com>
 <CAOSpxdawwimuCOSUj-nJ=BAbV3GLSYxk1LfoKQh6xkHRox7LbQ@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdawwimuCOSUj-nJ=BAbV3GLSYxk1LfoKQh6xkHRox7LbQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=904c713b-fb17-4fc7-95d0-3cdf5328adca;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-11-27T14:38:31Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM0PR10MB3650:EE_
x-ms-office365-filtering-correlation-id: 7c47f43f-1761-4d74-bc03-08dbef56fd63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pGxgQk8Lziw5LFms+oosKPIxKH6L1qdJEHCFumhC2bEB+eF5/VJf3ySOGtQuttCL1U/ZNM8YnRfRH+06Md74/ZN52FalRUA/9FASNukJDapRz4xdlRLewRqS4GQmuGmSLtNJhGiKxlqekCrpC8BHJah36ohY6TUFiHPfoAVNIfknYC6Tm07xykf4gQ1yQu7Qf9EUeN/UvR5nrt2/KQnzSEPEGQQ1IrO8wQh9N5Em1VyrugzO18UXPe1ORDuJUU9DOZ/BIkSk2AoQFrvGfzbDwkagdwDRBx/5dlu5AWIQQpVVtiBs1cnA5jspUanfiYFQSDCcUyMPLM6C9OIrwnLlyl8l7D1XXZShlGKGYq0e7vt7T6SuHVo+vgagL4XqEb48DgBQS0yA3bo6ViXXzyS60loMhdAMkWgO3bh6Lfm2WVGZ56wkfGGuamJEt6cxU3Cch50Trv8NdqaqGA0akVl7ndNPJnET/hUrIIrMQdP6f+dVTgEGKPlnu6mm66IhopSYRG0p27vT7CMqqiTwvv2+ulLJCQslUuq05N+Rcdn8HY/dSQzXOtc5pjAraK9rVfhjgpjrdOUqFSvaWcvjmBvuFe8EArtBUVOXv9CdjvYCeBTE27KDU/0TWYfO6CDCkW4BgXSd8xMmXqV339cS16neM+X+51EQzYQGnJxMJmK+LttMhWNePYsKDbqSUd0cWSM9
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(136003)(376002)(396003)(230273577357003)(230173577357003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(55236004)(6506007)(53546011)(478600001)(9686003)(7696005)(71200400001)(83380400001)(15650500001)(2906002)(5660300002)(41300700001)(66946007)(76116006)(110136005)(64756008)(66476007)(316002)(52536014)(8936002)(8676002)(66446008)(66556008)(38100700002)(82960400001)(38070700009)(86362001)(122000001)(33656002)(55016003)(26005)(266184004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?T2tRTy95Sk9wZEhwNGd5YUtybFhZaHFidk9yNGJuNWVBR2VoSXdNQ1p0Mjhj?=
 =?utf-8?B?dzlMY1kyUnpBSHVaN2hxa04xczVkQ3krbi9nTjc3ZmNmVk9JTGN5WTgzWEJi?=
 =?utf-8?B?WGNiQXkvZktBMyt2UkJXaW1FSXJtMDBBclcxdFdCV2FQWGY2czQyd1U3anYy?=
 =?utf-8?B?dUVBTmlVUjAxK2ZYUG0yY0EzbXFEbEpaYmlUU2hCZHdoRWpxeXpqWlQ5dzFy?=
 =?utf-8?B?cHc2TWpLZ1dta2RrcEVZUGZiTTI5ZlMrMXE2dU51Q3hzZkRTcU1iY2pFaWJo?=
 =?utf-8?B?bkJNTUxPdjRqTTFMR0taemRheXAyWm5FVmhZUUVMVkJKcGQ3aHRZV1FCL1lv?=
 =?utf-8?B?S2VWWXpCS3RoeGZRcm9uZE1SMTAvZ05VcjF4WERVeGVtb0JkdHNPVEgrWDlX?=
 =?utf-8?B?SlhGMC9qTENKY3ByaVgxeDZlQjRSWEJ3YXpCQXBicU9UNmNVREZ0a0tYczkx?=
 =?utf-8?B?RzNWOUMrRUZsUzcwQjJTNTcreVJyZ2RCa045Zm5sME5POG04dml1WGpPQ1hH?=
 =?utf-8?B?ZiswdTQ3WkZHd2dOUzNuQ0RsejhsOVhkWTBKRE9LSUdlYzF0SUk2TjdBSHJL?=
 =?utf-8?B?ZTNpMVdJTG5mcVNkOXRtaTZYcjJjTnNGei9XOWp1eGQzNnJNVmpFUjBsY3pz?=
 =?utf-8?B?b2dOSzZlUnd3eHp4R01LaUkwOE1MSk83TDB1TnNjMW5ZM2xyN0JKOTZtWW5w?=
 =?utf-8?B?ZmUwTUpuMTNEbVdyVTI0R1dBOXNEeTRuTFRMWStqc0gwUHFSZGZmRlczT0lM?=
 =?utf-8?B?b0NxdHdwMXUva3V3MjlaM1FCM3JzKyt0OVFHT3V0UnBqQU5ScW9tV2RwYS9m?=
 =?utf-8?B?UzRWaGFNTzdzZDhJOVkwdVYvR0xWdklJckZxWXJYclhnUkV1TTYrLzlxWjZ1?=
 =?utf-8?B?czVTV0hFb1NqWVFRdXhCV3Jmd0I2VTRWeUx4d1Y1S29YZkozWDNPZjRNanRx?=
 =?utf-8?B?V3lmTFQxVXR0UTVjTGNTZGRidEtkc3YyV0ZzaHpSdEFyWktHUmxadG5Gams1?=
 =?utf-8?B?Sm80NWQ2QUN1M0NaVVd4bjZZb3hudmUvSUJCcFFyTjNaSU15dEE3b3dPb1Fj?=
 =?utf-8?B?VkZPY1BzNWxQOWZTNmdGNnFPQ1FkQlAyTlllTFoxYUpjdDdpS3pDRkFnR0hD?=
 =?utf-8?B?RUorejVNNDJTMi8wanJRMW13bVFURkNvOFVuZDJnTHBkakdMWUVqcmFiSGZ6?=
 =?utf-8?B?U0NFRVZyTnVWcFcxVkdKUUVRVHFYbTQ3ajN3MlhaR0duclZiMHA4Mm0vNE5W?=
 =?utf-8?B?eVd5ZUdWM0VjTWZjWHRkREx3YUFsYmtYSSs2bFdXeWFKdHFQZzV2MU01WGVV?=
 =?utf-8?B?dWNXWWlRTDZlU09OMnUyRTBwa1ptODMrYUorU2YzN25hdGJRQVE2RFFzSS9m?=
 =?utf-8?B?M1FZVDY4MzRxaXVYazFpK1A0UHhzSE9wRHd2RzBITGpneTVsTmVPRUlJdmhj?=
 =?utf-8?B?MWorc2RlZCtsNmdlQVE3U3VuZllDLysrMlZ3bGZ4Rjh0VDhtSjJ2cTl0M293?=
 =?utf-8?B?V0pnN3M3czlrY1hlalNFbzlkYkU4R2JNMlB5NWVhUVBlZHpWTnl1SzlSbUVP?=
 =?utf-8?B?aGZnRzEvMU1WM0J0V2l4aU5vR2dyN3MvSDBsKzg2Q1hXN09qdGVPRmJCR0ZM?=
 =?utf-8?B?RE12V0ZzTUhIRDRYYldOYVlybU10RjJKcTZhemcwalRFcitNaVh1eDdWZHdY?=
 =?utf-8?B?dWVvNkVWdldaQXllQXRRNFAvbUhqUzJmNm8yOWVGSExFdnl4Nnl6RDhOeEQy?=
 =?utf-8?B?SDNBSjIrWDF2REJjUmdQTmtTUDFXZExOQjd3c3JDdmNKc3FiWUlxRWJCRllj?=
 =?utf-8?B?dktObkxEdzV3UzZqU0Jwb3pmU2d5bTRBcW01aDNqUHU0aUlGc2U3eG40OGNx?=
 =?utf-8?B?V0NQMHlteXUwajBSMG91QTZzRkRxUmpvQzVFOUhHSTkwdjRqaWw0UWJJY1Rh?=
 =?utf-8?B?MmlPejRCbmtzeHlxdE81L0NUa3BSemw5Y0E5cUN2VmNxLzduZFdtUXRaVyt2?=
 =?utf-8?B?ZWZ6V3FhM04zVTJrWk8yVjFzdEw1eTdkcHlxRGIrWDQrSmUvNnRqNmgyeFlt?=
 =?utf-8?B?dlluM3lJSnFyZWJ4blkzUTQvSWZNcHQ4a1ZCdDNRN2laQmlob0h5bTBwMm1F?=
 =?utf-8?Q?urwEuQJvCTOH1JIAgDb7gUMYA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c47f43f-1761-4d74-bc03-08dbef56fd63
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 14:41:50.0042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sVlWp3ps8ccPB1U/sTbBy/Fo9zK7w4Jx9BGNI7seyZi00WOgmb/jjb2sbCOSkwFD2wOq5CLvQtoa5qLb1vwARQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3650
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 14:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191306

WWVzLCBudmQgc2VydmVycyBhcmUgaW4gcmVhbGx5IGJhZCBzdGF0ZSBjdXJyZW50bHkuDQpJIG5l
ZWQgdXAgdG8gMTIgcmV0cmllcyBvbiBodHRwIGNhbGxzIHRvIGdldCB0cm91Z2guLi4NCg0KSSB3
aWxsIGNvbnRyaWJ1dGUgdG8gbWFrZSB0aGUgcmV0cnkgY291bnQgdmFsdWUgKGN1cnJlbnRseSBo
YXJkY29kZWQgdG8gNSkgY29uZmlndXJhYmxlIHZpYSB2YXJpYWJsZS4NCkknbSBwbGFubmluZyB0
byBydW4gaXQgYXQgbG93IGRlZmF1bHQgYW5kIGluY3JlYXNlIHRlbXBvcmFyaWx5IHdoZW4gcXVh
bGl0eSBkZWNyZWFzZXMuDQoNClBldGVyDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpG
cm9tOiB5b2N0by1zZWN1cml0eUBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDx5b2N0by1zZWN1cml0
eUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgU3RldmUgU2Frb21hbiB2aWEg
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KU2VudDogTW9uZGF5LCBOb3ZlbWJlciAyNywgMjAyMyAx
NTozMw0KVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IHlvY3Rv
LXNlY3VyaXR5QGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNClN1YmplY3Q6IFJlOiBbeW9jdG8tc2Vj
dXJpdHldIE9FLWNvcmUgQ1ZFIG1ldHJpY3MgZm9yIG5hbmJpZWxkIG9uIFN1biAyNiBOb3YgMjAy
MyAwNTowMDowMSBBTSBIU1QNCg0KPiBZb3UgbWF5IGhhdmUgbm90aWNlZCB0aGF0IHRoZXNlIHJl
cG9ydHMgd2VyZW4ndCBzZW50IG9uIHRoZSBub3JtYWwgc2NoZWR1bGUuDQo+DQo+IFRoaXMgaXMg
ZHVlIHRvIHJlcGVhdGVkIGZhaWx1cmVzIGluIHVwZGF0aW5nIHRoZSBkYXRhYmFzZToNCj4NCj4g
V0FSTklORzogY3ZlLXVwZGF0ZS1udmQyLW5hdGl2ZS0xLjAtcjAgZG9fZmV0Y2g6IENWRSBkYXRh
YmFzZSB1cGRhdGUgZmFpbGVkDQo+DQo+IEkgdHJpZWQgbWFueSB0aW1lcyB5ZXN0ZXJkYXksIGJ1
dCB3YXMgbGFyZ2VseSB1bnN1Y2Nlc3NmdWwuIEkgd2FzIGFibGUgdG8gZ2V0IG5hbmJpZWxkIGFu
ZCBtYXN0ZXIgdG8gY29tcGxldGUsIGJ1dCBpbiBib3RoIGNhc2VzIGl0IHRvb2sgbG9uZ2VyIHRo
YW4gdHdvIGhvdXJzIGZvciB0aGUgZGF0YWJhc2UgdG8gdXBkYXRlISBFdmVyeSBvdGhlciBhdHRl
bXB0IGFsc28gaGFkIGV4dHJlbWVseSBzbG93IHVwZGF0ZXMgYW5kIHRoZW4gd291bGQgZmFpbCBh
biBob3VyIG9yIHNvIGludG8gdGhlIHByb2Nlc3MuDQo+DQo+IElzIGFueW9uZSBlbHNlIGV4cGVy
aWVuY2luZyB0aGlzIGlzc3VlPw0KPg0KPiBTdGV2ZQ0KDQo=

