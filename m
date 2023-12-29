Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0A9C46CD3
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 10:48:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.144270.1703846910221778123
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 02:48:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rVACvpkQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1727e084dc=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BTA1DS2017936
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 02:48:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=2JJ/g4CIKqGsudMfJMRqjclD69UFobgRPlZ2RuP7b5U=; b=
	rVACvpkQ+gYf+2fMBHzXPIEkFgiCcvv1xUlTygM2Wsf5XF2NHQHQEzdgfUpw9DoK
	XeLS3FZeWQsYJYekXaLj17BSoL5//s/irvODYoLjCnkNMf4zgv6efRCOmJ+Mh2wp
	jWAgHhz8qDe8P2F6YRIqUX1lsD/FBPofd4pda4adxJM3V0xo37V6IRqblGYq8HdI
	8Sz+YHXsQ/zD4FJrEcxBZmbKJ+qAS+xlSZYBsrYYmqBJwZ7rUgU+pi4D/Fss7o5k
	B0YiZODQ1x/EIpLvw23L3TbqZKRuwV+UVjGSFqiNkEdVwn/R6LCx0t7R3sBKkiK6
	iCF2Eu7q88hUZ5dG+m8fsQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5uq4myqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 02:48:29 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BTAmTgp004458;
	Fri, 29 Dec 2023 02:48:29 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5uq4myqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Dec 2023 02:48:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0XUm9Sm1GpnxRXPaK6+1UsW5/AuCLBqKGxN1frzhtk3vEBcADWkCCEqJODt98bwIvDknKTBGRCGlNTkOGWzXwxp3r2ImNinahHiRIsLu1N6Txr/px9vRGfRiPjMZsskBwuBCR9FLiCFzL5RGihvWdu4GVfsLBdZZtM2Z8uvx8zyxSolZ4LGSBq1ZpDEHHLycwFae6RPZt8fizxcK9Xd/7QHd6HukLHkUx3SA+WV98qqA1sFUD7ocw+dRauiJNVu0BfnKgcVMBkF4UsFSdC11QYyC13/tNvyPdOxebPgJpQFnPBq0c7L3UJcdYzGc29BXGecm/sx2+iQvDCfBohvWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JJ/g4CIKqGsudMfJMRqjclD69UFobgRPlZ2RuP7b5U=;
 b=jrjQ+2XeugZuOeVF3aoVia8MgGLSCBwBO0huLw2lR7CW5M83utv9rkU42GzGaoVxUta1AnSAnEE66Qhh0zL/hOFpah5bK8y0f/jv4wBzzr75JectwyJ67TJ/y3luv/hUawJWrISLEql4OOpI3wnkaIGb5FuoWXxuT9JQ6bCjkIfJjVLvCMfGIu2xKVhFJAl0BoA8u2/wOh9PHFf/U6wNqD/Nk1c77cgsT7ljKa3GfdMxiJSLBjKlWhrU+ieMS9k5bUmaPpYNRk6Wgq1ZBCfpwi8n+IwBVAiwZwjFX7ElIcpmDPucUw/9CZHIq2h6Gr38SgUcbE4bT/gwZRu7MY2kKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY5PR11MB6462.namprd11.prod.outlook.com (2603:10b6:930:32::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.28; Fri, 29 Dec
 2023 10:48:26 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%6]) with mapi id 15.20.7135.019; Fri, 29 Dec 2023
 10:48:26 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 1/3] systemd: upgrade to 255.1
Thread-Topic: [OE-core][PATCH 1/3] systemd: upgrade to 255.1
Thread-Index: 
 AQHaOHwUZkl3/dEfCUuIElbTG14Wi7C9B0cAgAD6uACAATKrAIAAWoyAgABa6gCAAC0PUA==
Date: Fri, 29 Dec 2023 10:48:26 +0000
Message-ID: 
 <CO6PR11MB56027A285FE39C263B032019ED9DA@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20231227042036.2376255-1-Qi.Chen@windriver.com>
 <2023122711592084d34620@mail.local>
 <CO6PR11MB560279EC2354AEBC89D8E15FED9EA@CO6PR11MB5602.namprd11.prod.outlook.com>
 <202312282114180d86a09f@mail.local>
 <339c8673-650a-37ee-dad5-e7cd3ebfedf5@windriver.com>
 <CANNYZj9jjnjCXEYfsXC8uG3_UWM+2cijPV8+iioMG-uREcnsbQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9jjnjCXEYfsXC8uG3_UWM+2cijPV8+iioMG-uREcnsbQ@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|CY5PR11MB6462:EE_
x-ms-office365-filtering-correlation-id: 20ac10ae-e3e5-4e8a-4e38-08dc085bafc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 B5HSV+HCHi4kOhzofkFUzN9IWDSz9nfaPOqrE8ql4+LmsUWbalF57DfVxH/UpR59+vlPxa79foUiQsptS8AhZ7IiwU2i4ry4QU3tkTb+DVoGGwO+5sPRYA9DWei/FSzXBFo7JSTkX5JbAa7jELkRD70sCtrjuOJgP/XTfdXMbRVm5dErsUlyys+Zs3XxEw3kZHqQQrozEfLgTFdkWZpFv1vF3huYspG/D7tYEVslwQQEPXeLdYcSPXBOaGPxTwMZ0CFPd0CctQ4HLZKIKOtBI3wA3E5QFTriUmQ5cVA8h9R9bqRQ46ylLuTE8gvpYR3kNcmGqq0Y5sJSfohmEB8b79d6YZHyBMt68InMVvsS5DmQ1t2p5ZdfCkK8eZPrUIyJndVKpxJwqGzeowx6QQmdb09dY0k9TnCJooLto/6HcDMDVTYTfUZy99/fOJfXVwJmDVXDutIUYaxNGhZgJl9ZhJ6ksWLpTvJ5a84u6QeeFiXUtWziohyXUlsUUIW7ZJcXT1xj1+iaC1I+lOpx1aJggJ0Fdzsl1kQV2Q4q523N7w2kt8FJpP5m6Vs33oEigRWvfpus5aqGqdXA4P8KgKiDmg7Jt3g+BJhXHkOa1baaMb0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(39850400004)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(52536014)(2906002)(122000001)(4326008)(8676002)(8936002)(38100700002)(83380400001)(5660300002)(26005)(4744005)(38070700009)(966005)(71200400001)(33656002)(478600001)(55016003)(53546011)(9686003)(6506007)(54906003)(66946007)(86362001)(316002)(6916009)(41300700001)(76116006)(7696005)(66446008)(66476007)(64756008)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aWFjUDJOOVFEdVZJOCtmYVNVMC9MaXIyYVlpUWhuVG5aa210VFcwUkhDTHhY?=
 =?utf-8?B?d2hOR1ZEZTY4SXhiSnFOcHRVZmtjdGUzR2xjZjRZVFdxUVArWnROaEF4TFhp?=
 =?utf-8?B?RlIvMEcvblp3c0JkbkY2WDhDb0hRMlEyNHg4MEQrSTNvREI5SjV2cFd1dW1q?=
 =?utf-8?B?T20wS0hzR1ZFbVZqZE9LRnFoUm5nNWRXVW9DbnNJTW5YNWVSdmZEa3hjMm05?=
 =?utf-8?B?TUNYRkFhSTAyV3lhQVltRmN1SVlWUFBzRjlVVkZzRTdTLytuVWlRZ1FxdXcy?=
 =?utf-8?B?MlpiMGZYTTZFOE1uQ3RGQzR0VzlVR2IvUFYzMG1CQ09XTmwyS2ZlVG10R0Fn?=
 =?utf-8?B?alVKaTA3Z29qTzkwK0FaTlRZUlNFbW9lK2l3djdKczFBbHpoWHFpUzhYeUZJ?=
 =?utf-8?B?NlgxdzdqNUNDOHB0L3FycmFqQ3pWZTczZ0NKdzMvL3hmQnFuQTh0SlYvSk1t?=
 =?utf-8?B?bk5GTk05allUTy9IditORnJzeDEwNGdFdmpHY1l2bmdDMXNEV04veG0ra2VI?=
 =?utf-8?B?cWhHcnZlYnROV1FuSWxuRDB5RDdhWE8vZ1ZPQWs3WHJLR285d3JCQzlybkxP?=
 =?utf-8?B?bytsVitCQStZS1A2OTk0OEl6aVpRdURGQXI5YUw0eSthTkN3TkUwakVvL1pX?=
 =?utf-8?B?U0RNSS9WWVVHQjNveTJINDJpTDAxaGRvWitrV0lta3J3eXFQUzNRam1SM2Vz?=
 =?utf-8?B?ZEVuNDI1VDBiRlNuaGRHTTVXeWd4eUNxRkxJaVh2RFFGcVArTTVlNE9pNWFF?=
 =?utf-8?B?QVJMNlFXL3EvUk1FVkF6UWhVbmFiL3NaaFdmby9YeHIzdmo4bTNQNXoyT2tB?=
 =?utf-8?B?VWlPRFpMNjZVakZzNXBuK092cFVPeEg1NkFzWUpINk5MeEpXSkNTMGxpdmRp?=
 =?utf-8?B?WitGOUJleVlCYzV3a3c3c20rb05jdWw5SHRaRU9NVDJVa0RLVFhreWZ3MjZo?=
 =?utf-8?B?THY1RHNqaCsrdVo0SCtqRjVOQ0gvSVVsMFpMUEliRG13ODFZSXVlUjBWQzds?=
 =?utf-8?B?OGRpRzFuTk9nSHBxQk44eUxiMk5HYUQ4Um9PV1hkTTVKRzhEbmthVTFYcEpU?=
 =?utf-8?B?QzZieWtCZjNIUlhWb0FrTlhwQk45S1FBWXVoRGpUOFNYYjZvV0pZWktJL1Rz?=
 =?utf-8?B?M0VvOFdKbzdjaERnbWllajJxR3BTZ0U5RENvRHdybXNoSUxLc3FtZ0IxbjRm?=
 =?utf-8?B?MTFKWm1Cb1RaYldzdjliUlZXdEpHeHVENmtJNEhDa1EyNzc2bExndjJOODJD?=
 =?utf-8?B?ZzR2Y1NkSlg0QU90SW5BWTdWRVhlVFpPeFdxSUdmazdlMFVVWExiUVdGR0dI?=
 =?utf-8?B?N1o2dkpySEozOHRrTUN5RkYyaWxPR3ZGZ28wRHBaQ1VPNXh2OEoxaHcxNysr?=
 =?utf-8?B?MjJ3MWRZQzBDUXpjK0kvWmNibFRtSEdyTHNBOXRPTUo0Wk80UEo4SlNJMmN6?=
 =?utf-8?B?U0VXaEk2ZUkwZjRmUXR6U0M5TnFIVUVJNXpCVGsvOFBITnBRR0p4ZmJjSHAw?=
 =?utf-8?B?U2VpUndIQ0VDdWREZkVkeTBVNVBVcDJocVZhRnZqeGV2YW51dWw2ZkplZTdu?=
 =?utf-8?B?RXdUVkxsbmZma0lhN0xWcVJZN09nMTN5NFB6dFByaEFBcVR1eWN1RUVBYnVK?=
 =?utf-8?B?alNLUmVzbGJ2WHduSEJjKysvcEhjTmRFV0h6QnBNWlNGcXh3NjkrMGpHeGd6?=
 =?utf-8?B?Z0ZXVTcxR25tYkptNHVJMlUzdlNIWkQ5YU5IemZtYW11bVA5R2VIOU5ScTlT?=
 =?utf-8?B?KzA3K1hVY05PTkNpblROSzg5Q2sxMno4Z0R4NmhFc3FxU0NwWU5OKzIwaWFk?=
 =?utf-8?B?N2JRaUt5czJ1UkxML2VndnVwM3dXelpZQ1c2clFtS0xzNzN0VG1SR0FtMngv?=
 =?utf-8?B?ejlUc016Ym0yWXI0S3NsY0ltM0djQ01lOUpCNng5V3FqWmNsL3ZZVytvbndv?=
 =?utf-8?B?dnpFQkk1WXgyamtGSXVia1k5MkZwUXNmemFrNTlKbWExU2RTN3J4UjIvRTV4?=
 =?utf-8?B?ZU5BcmovRVZxN0x3aHpleUVEWkw1U0ZLc1JaUkgwT1Ixb1ZsdloybVkvV29S?=
 =?utf-8?B?eHJaTEk2UldaVDVCM3ZDN2VhSk13cTZyelhKWHdyOVpMTEZwK0svT1lMQkVn?=
 =?utf-8?Q?OkTnoXS/ng1MYnssIVmdyXJaG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ac10ae-e3e5-4e8a-4e38-08dc085bafc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2023 10:48:26.3764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3dvsqWIM7zwetD9+nPIHodmnsZLdmenawg4cd1mpj7MExV1dNClkv8hMYveh6ZOlwyccayC4FOnV8zDu5752nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6462
X-Proofpoint-GUID: -Ozk2iV_EU6gc6_qsZGDvabjkEDae-Ju
X-Proofpoint-ORIG-GUID: zssIbS8Aci_EvI82vhqZufh62qqCiiDy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 mlxlogscore=889 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312290085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 10:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193002

T0ssIEknbGwgZG8gaXQgYWZ0ZXIgTmV3IFllYXIncyBEYXkuDQoNClJlZ2FyZHMsDQpRaQ0KDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eC5rYW5hdmluQGdtYWlsLmNvbT4gDQpTZW50OiBGcmlkYXksIERlY2VtYmVyIDI5LCAyMDIzIDQ6
MDQgUE0NClRvOiBDaGVuLCBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KQ2M6IEFsZXhhbmRy
ZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT47IG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0gg
MS8zXSBzeXN0ZW1kOiB1cGdyYWRlIHRvIDI1NS4xDQoNCk9uIEZyaSwgMjkgRGVjIDIwMjMgYXQg
MDM6MzgsIENoZW4gUWkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPFFpLkNoZW49d2luZHJp
dmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPiBURVNUX1NVSVRFUzph
cHBlbmQgPSAnIHN5c3RlbWQnDQo+ID4gRElTVFJPX0ZFQVRVUkVTOmFwcGVuZCA9ICcgcGFtIHN5
c3RlbWQgdXNybWVyZ2UnDQo+ID4gVklSVFVBTC1SVU5USU1FX2luaXRfbWFuYWdlciA9ICdzeXN0
ZW1kJw0KPiA+IERJU1RST19GRUFUVVJFU19CQUNLRklMTF9DT05TSURFUkVEID0gJ3N5c3Zpbml0
Jw0KPg0KPiBPSywgSSBzZWUuDQo+DQo+IEknZCBzdWdnZXN0IHJlcGxhY2luZyB0aGUgYWJvdmUg
NCBsaW5lcyB3aXRoIGEgc2luZ2xlIGxpbmU6DQo+DQo+IElOSVRfTUFOQUdFUiA9ICJzeXN0ZW1k
Ig0KPg0KPiBUaGUgSU5JVF9NQU5BR0VSIG1lY2hhbmlzbSB3YXMgYWRkZWQgdG8gbWFrZSBzd2l0
Y2hpbmcgaW5pdCBtYW5hZ2VycyBlYXNpZXIuDQoNCkkgYWdyZWUuIFRoZSA0IGxpbmVzIGFyZSBk
ZWZpbmVkIGluIHR3byBwbGFjZXMgaGVyZToNCmh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcv
eW9jdG8tYXV0b2J1aWxkZXItaGVscGVyL3RyZWUvY29uZmlnLmpzb24NCg0KQ2FuIHlvdSBzZW5k
IGEgcGF0Y2ggdG8gcmVwbGFjZSB0aGVtIHdpdGggSU5JVF9NQU5BR0VSPw0KDQpBbGV4DQo=

