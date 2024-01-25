Return-Path: <chi.xu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7F4C46CD2
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 02:55:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7837.1706151303527039106
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 18:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aCauuibz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1754ff1c54=chi.xu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P1tTPi010666
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 18:55:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=SOeEqIbeW8QkG5Uu6Raa2IuEWhESpg244zimuueP2po=; b=
	aCauuibzGG8esrkXx9e1WWv9bIdFYHfqVxfMo3li0LNX0sJK6DTmfGOrnZ1UbR+q
	X+OWOX//2yYOG5FbRZQ9loqfFQtm8GwDzu5jJNce+oz/Spd8t0mlFfKxQEkdTBlr
	/3BB4796XRhG58KFWEStrcuhzUxKFkpiJvWeIUa7NvfWUqNWPcbNU2fyO4I9P5dB
	yVP10qUUKEYiqGwLm/da1ugm5we/B9Mzci7R0t1No5bijZLSQ9lQ9+qScAoCYgI4
	euLF5KHvWHcsT8PUFt/jQnA++PSmddp0mf1yjtzvgwnA8Q5S4WptBTe4WNvMx2wn
	lEFIj00d0eWGyzR1h2WiGg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vucv5r37u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 18:55:02 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40P2s5cc014419
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 18:55:02 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vucv5r37s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 18:55:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8c/h6tBGW3mtx0MmcSmRdBx37CP43M9sBrjE2rtNTXgjBJdDZ/PxX3iJ5ZHuowjS1NrOJzMnEC8AkIsoiikI9mFlMMjEUb2mBQ2lywBAa2jodpkYQ7nXhik2UtI45uX/2DcK9oAFpM8v1nX5I9Ca+UTOSZafhT+gvD/VOPlI+tMTKvH3cNKYrEpsm6/IB/uAqMHrWNlrSoO79z+ZJSg4E9BTB+0lWlkbDNSgryNvjjmzr/N1GugJkUN6fVOJOfJM3ikX0LlJzw69IJfBbwnnuL5Shd+Oq8fIgeDExA9nScyQNzNFixvoN0MyGwUk26Brkgtz6XgNYETAdyY9ywjKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOeEqIbeW8QkG5Uu6Raa2IuEWhESpg244zimuueP2po=;
 b=M1ELM+si5N0nQ1t4YxZAb6ZPMByBTimB/T9IfZe1SkBkMFdshrJFqLvmPRfYQ5xfSK5qZJr46lLmRPJ/X3vvfkwBQtJVJjaplcQp7wBBeebr4DYVOcvaUO7Xl7KyARFwxYo9f8qIGOaxryR1k2nqUCg5EkKmjng0Fe782EXbWBigH+IbtJ0Bke2DJP+mxyDMLMuHc24jEnG+PmrAtaxmOrxe74MYphh5BteWytGEyqyJSW2mfxKYp4oPQPd+rzOrOttGFxnPc1IEEkWPYt3HzCSfuJtucVb7BCNFAInfGNOehKvtPzBxLy4PpF/FDx/2m2l3CYnQf8JjTN55PFt1Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5390.namprd11.prod.outlook.com (2603:10b6:5:395::13)
 by LV3PR11MB8459.namprd11.prod.outlook.com (2603:10b6:408:1b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 02:54:58 +0000
Received: from DM4PR11MB5390.namprd11.prod.outlook.com
 ([fe80::6b2a:9f24:34d0:cd1d]) by DM4PR11MB5390.namprd11.prod.outlook.com
 ([fe80::6b2a:9f24:34d0:cd1d%4]) with mapi id 15.20.7202.031; Thu, 25 Jan 2024
 02:54:58 +0000
From: "Xu, Chi" <Chi.Xu@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] xz: Add ptest support
Thread-Topic: [OE-core] [PATCH] xz: Add ptest support
Thread-Index: AQHaTqmX0LnyhZuSHke5iOJ3xXTTSLDp0Nsw
Date: Thu, 25 Jan 2024 02:54:58 +0000
Message-ID: 
 <DM4PR11MB5390ECC49B2DB7A888D1209D9A7A2@DM4PR11MB5390.namprd11.prod.outlook.com>
References: <20240124090402.3126423-1-chi.xu@windriver.com>
 <CANNYZj-XFMk+Zburj-Q2xLk04BWg=qv8Kk0+=XAOwDdKpjpkQQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-XFMk+Zburj-Q2xLk04BWg=qv8Kk0+=XAOwDdKpjpkQQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5390:EE_|LV3PR11MB8459:EE_
x-ms-office365-filtering-correlation-id: 4fd95071-9611-4ca9-b9d4-08dc1d510470
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Wf8Tv2+JT5InvKiSxZR3G3jfiwddkv7emufsDf/HUXz38ZoXzwOxbmIkHSGLV08yN8RnSYPDe+ZcTe7bgxbGAISWOjpaEqXcNZCl5YqgSley/gTNJVjZTVSzA4toNZQgwjXJ9kJAkqhC9QJYvpJMD+9aqOqGg7IaJH2iRyS7mxGgOR58uO57XK+jRMnecG144An0JAWEtMl2+F0JAJmPO4gymj9ftZv8Zcuho+PypuMrmsamY6itMHwHN+8vtLVvDESBvExWKk42eAn1tq1uUQAglAKEYThe6EXFuEo/1kb/C65hej4J1MPYw24NELLAIcDRcsumC6PA1TkSOAG4A4T/uf+IAo5z0dKcT4uUTJH90kYAnvb8AfNJ8So3PYnw2mXS6EC2HEAmPp1u1nGZvxhNLo8vGpFrtihG6fCSfxHTkYnj0pjG7KsE9ocDA7wnBpHIrtfsjeh5Ct5oHWPwvcZqF6Dio1I9v8XkEdVB3hNBqJubqbntsK6irQmmKEhCaM48pMZecPPqvM4XG6g4wExrPKyFzqv/EQCvTByqweECCkvmeExrik5LP+uxSLpWVr3Oi2SY31KQqUXO/G/fiv7NC2geqV2gA3WYZqJbpsaYBc8xPfY6KCFwsnWyP3H3lhq2Y3uCgmTNC7atyOXo5zb0Q86rRRA2y1bmlwxfeg8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5390.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(366004)(396003)(39850400004)(230273577357003)(230173577357003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(55016003)(33656002)(7696005)(6506007)(53546011)(2906002)(71200400001)(38100700002)(122000001)(26005)(83380400001)(41300700001)(5660300002)(316002)(6916009)(9686003)(52536014)(478600001)(4326008)(8676002)(8936002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(86362001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N0tNV3RYd3pweWMrTVA1UlNwN1NHMkkzZEJQU0NsbHN4TVhNbFZVQkg1Ukx1?=
 =?utf-8?B?QnhDVmhjdU1FQm5WK0YrbzVlVkc2b0p4NjMySnUzTDgwLy9yV0dKb3pVS21C?=
 =?utf-8?B?TmZQUDZ0RXBQSE9lVDdUL3hsOGVEYVA1UUpDSnVSaU1CaXUwM2hHTTB3RnB6?=
 =?utf-8?B?S0EzTjlvdndSUHN2d0pnN2swUmhwQUU4dDdmNlhjMjlta2FFSkdJY1p2SGVF?=
 =?utf-8?B?V0JOaGFHdFpSTXdQd2FZSUxzZ0xRbmlqV1NrbWlEcTRoQnlXcy95YlVGWll6?=
 =?utf-8?B?bVU3Z09CdG5ScDZTNGNmdWhUUUdyQmVZMFVNU2FVVTA2Zm43TWVoaFk1UTdD?=
 =?utf-8?B?bjB6RmpZZW05N2dEbloraTkraVJzL2crcTh5TEJwOTZtemZtWGQzU0JGRzZv?=
 =?utf-8?B?Ui96dXNGWXVFSnBRNmNpQVk5bmR3cDBTRisxNEY4a3pDcktFUWo4WFJPbElx?=
 =?utf-8?B?TFQvcUNrNWpuRm9ZS3lPckQ1ZlpRdTAxRno1RktIWm80UUpxaUVhb09OL3B3?=
 =?utf-8?B?YUxWa0JnVisva1hlOG5Fcm5iaWFJTUdKdmRXWWxPRnNqL0tVdG5BanlaRDBV?=
 =?utf-8?B?UnpQMndjZ3B3WC8xNGlSNy9Rd1FXYktONlNzMVV0eGFxWDEyUjFNZUtnalRr?=
 =?utf-8?B?UmUwVUw4K0Nyc0VadDdkbGtOTXN4QkpRNmEwazUrT2R3VWFZZGVmWDE4TGpN?=
 =?utf-8?B?S090T0RLRjJZT0VJNUhYOHc1UEdQcFJYNlhnWUkzYlo1eDlRTkVEWWNUMDMw?=
 =?utf-8?B?VW1OaEEyeDJ0OWxEcnBxRDhob0NRR041SVVOcWNYNG9iN3M5Ylp6S0dmVEE5?=
 =?utf-8?B?aWxTdm1GN2hBMkx1R0pDMnN0SnNvWlBONGNJVHlUOXFoU1I5UnAzc0RyU3Y2?=
 =?utf-8?B?ajgrNzJNRVBIZm9UbzlGelhvdlI1bEZ3VHRpQnRLV2grY3ZiTXZkdHR6RHRR?=
 =?utf-8?B?aU1EQjJ3bHZPeTk3NVdlNnJTejNkcFdaZ2Zod3BzSWZ1TGtVamlLdS9MZ1Fu?=
 =?utf-8?B?OTA0YTZKRXFHK0VSNlZacDRLekRKQWNVa1dzQjZzbXM0WThneXROY1NoOEtw?=
 =?utf-8?B?MDROVmRheEluOGZPSXFuRXFmcWZoaVdaOC84MjlrQ2VWOEhxYlhFblEvVDZ6?=
 =?utf-8?B?WXBYNUROcXg1ck1sRDNnK3AzVUlVMmd4Ti9abHIxc3pycllkYTc2YzFNL2x2?=
 =?utf-8?B?RXFLRTJZUEZVS29RejBrZnR6YjhhVGtBUkZEcHp1NGVQWE1iOE15M3JCVnVT?=
 =?utf-8?B?QlFHbm96MkxHenRaV0lzZWRvb2ttYmxzSlRrSEtTQ2h2YlBlUmYvbTcyQm5y?=
 =?utf-8?B?d2d0dldJSkVhWmw0TWdvdDJxTGZjZjRtOC9JcVVoSVMxQmR5OU9SeVhRMkJm?=
 =?utf-8?B?K3k4S2FDTDRUSnVTcWxJdFBoTjVkd0ZmWk5uVmhuVVhOQXdJbUkrenhyanhX?=
 =?utf-8?B?K3o1bXRKRE9KRDBROWZ0cjhDSXBkSE9UVWZqc0hRcm4xai9OZlBDR2JaYTda?=
 =?utf-8?B?UjdETHFRQVZBbUtPaVYyL2hZaXRQd1c2Y2FxRXFZMThHYU10NVozZ2JWbjNJ?=
 =?utf-8?B?dFNobjVGb1JSSmxGVzRoUk5Semt6dWdRaXFNbmFBUnViY1dLTGg2c0xpN3l4?=
 =?utf-8?B?ZXpNR1FCbkZSOE5Zb1pPZ1R1TEJKUFphbjczRkFIc0F1bkQvRVpKOG1IbFd2?=
 =?utf-8?B?clR0UHEySUpocWo4UjNudUtXWjlPSnUwNmVKQ09Ga3VuZXYvdkxaV2FQWlNN?=
 =?utf-8?B?S0ZsQnY1R1l2TSs4YWRmeGlVbzQ0dU0yZEkxamxjU0JOam14Q3diRVBRL1c1?=
 =?utf-8?B?RlJPSXlyWFozVHZiNW9mV3AvWG4rcFQzdkdrQU55Z09DSEU4K1N2enZDYlJI?=
 =?utf-8?B?TWFOY0d0bStlU2w0ajBMRkhSRlZCMGxKZkNFQWliSWc1NFFYQy9uR0IvMU1Y?=
 =?utf-8?B?RjFIejR1OTJZY3RpT24waER6SHlYcW1ubkpKTmxKNEpzWnU5TkxUYXUvamJr?=
 =?utf-8?B?SGQ4bk5LTFRnV05yOTY1dVpPNGR5RTRJRFBwZ0JadVRLM3V4U1lENjZ0cnpZ?=
 =?utf-8?B?dmtEVUdJUll2dHRzQVJ1djhYejM0UXkySTlwV3d6RldncnVwWHV2d3hpK2xO?=
 =?utf-8?Q?Spsu5bDQZKND7MXilgF5NMTdx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5390.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd95071-9611-4ca9-b9d4-08dc1d510470
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 02:54:58.3517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xkBe/Nz357I545Jm0kFNwxJuADHH5ZDGw8Grv/ayAesvX+XACyARR+zJURQjIAGmQin2nzN9gDe5REVb00MVIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8459
X-Proofpoint-ORIG-GUID: NLT5SF2C3LRILuci68nz-C3nm7TGh4da
X-Proofpoint-GUID: mt7-kujOM90ue3GZbGA3QtqljBD1MqUC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-24_12,2024-01-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 02:55:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194305

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAy
NCwgMjAyNCA1OjQyIFBNDQo+IFRvOiBYdSwgQ2hpIDxDaGkuWHVAd2luZHJpdmVyLmNvbT4NCj4g
Q2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDog
UmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHh6OiBBZGQgcHRlc3Qgc3VwcG9ydA0KPiANCj4gQ0FVVElP
TjogVGhpcyBlbWFpbCBjb21lcyBmcm9tIGEgbm9uIFdpbmQgUml2ZXIgZW1haWwgYWNjb3VudCEN
Cj4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNv
Z25pemUgdGhlIHNlbmRlciBhbmQNCj4ga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiANCj4g
T24gV2VkLCAyNCBKYW4gMjAyNCBhdCAxMDowNCwgQ2hpIFh1IDxjaGkueHVAZW5nLndpbmRyaXZl
ci5jb20+IHdyb3RlOg0KPiA+ICtTdWJqZWN0OiBbUEFUQ0hdIFVwZGF0ZSB0ZXN0IHNjcmlwdHM6
IHJlcGxhY2UgLi4vc3JjLyogd2l0aCAvdXNyL2Jpbg0KPiA+ICsNCj4gPiArSW4gb3JkZXIgdG8g
cnVuIHNjcmlwdHMgb24gdGFyZ2V0LCByZXBsYWNlIC4uL3NyYy8qIHdpdGggL3Vzci9iaW4NCj4g
PiArDQo+ID4gK1Vwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbZW1iZWRkZWQgc3BlY2lm
aWNdIC1pZiB0ZXN0IC14DQo+ID4gKy4uL3NyYy94ei94eiA7IHRoZW4NCj4gPiArK2lmIHRlc3Qg
LXggL3Vzci9iaW4veHogOyB0aGVuDQo+IA0KPiBJdCdzIGJldHRlciB0byBidW5kbGUgdGhlIHh6
KiBleGVjdXRhYmxlcyBpbnRvIHRoZSBwdGVzdCBwYWNrYWdlIHdoZXJlIHRoZQ0KPiBzY3JpcHQg
ZXhwZWN0cyB0aGVtLCBhbmQgYXZvaWQgbWFraW5nIGEgbm9uLXVwc3RyZWFtYWJsZSBwYXRjaCBh
bHRvZ2V0aGVyLg0KPiANCj4gPiArcHRlc3RkaXI9JChkaXJuYW1lICIkKHJlYWRsaW5rIC1mICIk
MCIpIikgY2QgIiRwdGVzdGRpciIvdGVzdHMgfHwNCj4gPiArZXhpdA0KPiA+ICsNCj4gPiArIyBl
eGVjdXRhYmxlcyB0ZXN0IGNhc2VzDQo+ID4gK3Rlc3RzX2V4ZWM9JChmaWxlICQobHMgdGVzdF8q
KSB8IGdyZXAgIkVMRiIgfCBhd2sgLUY6ICd7cHJpbnQgJDF9JykNCj4gPiArZm9yIGkgaW4gJHt0
ZXN0c19leGVjfTsgZG8NCj4gPiArICAgIC4vJGkNCj4gPiArZG9uZQ0KPiA+ICsNCj4gPiArIyBQ
T1NJWCBzaGVsbCBzY3JpcHQgdGVzdCBjYXNlcw0KPiA+ICtleHBvcnQgc3JjZGlyPSR7cHRlc3Rk
aXJ9L3Rlc3RzDQo+ID4gK3Rlc3Rfc2hlbGw9InRlc3RfZmlsZXMuc2ggdGVzdF9zY3JpcHRzLnNo
IHRlc3RfY29tcHJlc3Muc2giDQo+ID4gK2ZvciBqIGluICR7dGVzdF9zaGVsbH07IGRvDQo+ID4g
KyAgICBpZiBbICRqID09ICJ0ZXN0X2NvbXByZXNzLnNoIiBdOyB0aGVuDQo+ID4gKyAgICAgICAg
Li8kaiBjcmVhdGVfY29tcHJlc3NfZmlsZXMNCj4gPiArICAgIGVsc2UNCj4gPiArICAgICAgICAu
LyRqDQo+ID4gKyAgICBmaQ0KPiA+ICsgICAgaWYgWyAkPyAtZXEgMCBdOyB0aGVuDQo+ID4gKyAg
ICAgICAgZWNobyAiUEFTUzogJGoiDQo+ID4gKyAgICBlbHNlDQo+ID4gKyAgICAgICAgZWNobyAi
RkFJTDogJGoiDQo+ID4gKyAgICBmaQ0KPiANCj4gSSBzdGlsbCBkb24ndCB1bmRlcnN0YW5kIHRo
aXMgcGFydC4gSWYgdGhlc2Ugc2NyaXB0cyBhcmUgZXhlY3V0ZWQgYXMgYSBwYXJ0IG9mDQo+IHN0
YW5kYXJkIGluLXRyZWUgdW5pdCB0ZXN0aW5nLCB3aGF0IHByaW50cyBQQVNTL0ZBSUwgaW4gdGhh
dCBjb250ZXh0PyBTaG91bGRuJ3QNCj4gd2UgcmV1c2UgdGhhdCwgdG8gcmVwbGljYXRlIHRoZSBp
bi10cmVlIHRlc3Rpbmcgc2VxdWVuY2UgYXMgbXVjaCBhcyBwb3NzaWJsZT8NCj4gDQoNCkFjY29y
ZGluZyB0byB0aGUgZGVzY3JpcHRpb24gb24gc2VjdGlvbiA0LjIgaW4gJ0lOU1RBTEwnIGZpbGUg
b2YgeHosIA0KIlRoZSBzaGVsbCBzY3JpcHQgdGVzdHMgY2FuIGJlIGNvcGllZCBmcm9tIHRoZSBz
b3VyY2UgZGlyZWN0b3J5IHRvIHRoZSB0YXJnZXQgbWFjaGluZSB0byBleGVjdXRlLiINClNvIEkg
Y29weSB0aGVtIHRvIHRhcmdldCBhbmQgZXhlY3V0ZSB0aGVtIGluIHB0ZXN0Lg0KVGhleSBkb24n
dCBoYXZlIG91dCBwdXQgbGlrZSAiUEFTUy9GQUlMIiwganVzdCByZXR1cm4gemVybyBvciBub24t
emVybywgc28gaW4gcnVuLXB0ZXN0LCBJIHByaW50IA0KIlBBU1MiIG9yICJGQUlMIiBhY2NvcmRp
bmcgdG8gdGhlIHJldHVybiB2YWx1ZS4NCiAgDQo9PT09PT09PT09PT09PQ0KNC4yLiBDcm9zcyBj
b21waWxpbmcNCg0KICAgIFRoZSB0ZXN0cyBjYW4gYmUgYnVpbHQgd2l0aG91dCBydW5uaW5nIHRo
ZW06DQoNCiAgICAgICAgbWFrZSBjaGVjayBURVNUUz0NCg0KICAgIFRoZSBURVNUUyB2YXJpYWJs
ZSBpcyB0aGUgbGlzdCBvZiB0ZXN0cyB5b3Ugd2lzaCB0byBydW4uIExlYXZpbmcgaXQNCiAgICBl
bXB0eSB3aWxsIGNvbXBpbGUgdGhlIHRlc3RzIHdpdGhvdXQgcnVubmluZyBhbnkuDQoNCiAgICBJ
ZiB0aGUgdGVzdHMgYXJlIGNvcGllZCB0byBhIHRhcmdldCBtYWNoaW5lIHRvIGV4ZWN1dGUsIHRo
ZSB0ZXN0IGRhdGENCiAgICBmaWxlcyBpbiB0aGUgZGlyZWN0b3J5IHRlc3RzL2ZpbGVzIG11c3Qg
YWxzbyBiZSBjb3BpZWQuIFRoZSB0ZXN0cw0KICAgIHNlYXJjaCBmb3IgdGhlIGRhdGEgZmlsZXMg
dXNpbmcgdGhlIGVudmlyb25tZW50IHZhcmlhYmxlICRzcmNkaXIsDQogICAgZXhwZWN0aW5nIHRv
IGZpbmQgdGhlIGRhdGEgZmlsZXMgdW5kZXIgJHNyY2Rpci9maWxlcy8uIElmICRzcmNkaXINCiAg
ICBpc24ndCBzZXQgdGhlbiBpdCBkZWZhdWx0cyB0byB0aGUgY3VycmVudCBkaXJlY3RvcnkuDQoN
CiAgICBUaGUgc2hlbGwgc2NyaXB0IHRlc3RzIGNhbiBiZSBjb3BpZWQgZnJvbSB0aGUgc291cmNl
IGRpcmVjdG9yeSB0byB0aGUNCiAgICB0YXJnZXQgbWFjaGluZSB0byBleGVjdXRlLiBJbiBhZGRp
dGlvbiB0byB0aGUgdGVzdCBmaWxlcywgdGhlc2UgdGVzdHMNCiAgICB3aWxsIGV4cGVjdCB0aGUg
Zm9sbG93aW5nIHJlbGF0aXZlIGZpbGUgcGF0aHMgdG8gZXhlY3V0ZSBwcm9wZXJseToNCj09PT09
PT09PT09PT09DQoNCk91dCBwdXQgb2Ygc2hlbGwgc2NyaXB0IGNhc2VzOg0Kcm9vdEBxZW11eDg2
LTY0Oi91c3IvbGliL3h6L3B0ZXN0L3Rlc3RzIyBleHBvcnQgc3JjZGlyPS91c3IvbGliL3h6L3B0
ZXN0L3Rlc3RzDQpyb290QHFlbXV4ODYtNjQ6L3Vzci9saWIveHovcHRlc3QvdGVzdHMjIC4vdGVz
dF9maWxlcy5zaA0Kcm9vdEBxZW11eDg2LTY0Oi91c3IvbGliL3h6L3B0ZXN0L3Rlc3RzIyBlY2hv
ICQ/DQowDQpyb290QHFlbXV4ODYtNjQ6L3Vzci9saWIveHovcHRlc3QvdGVzdHMjIC4vdGVzdF9z
Y3JpcHRzLnNoDQpyb290QHFlbXV4ODYtNjQ6L3Vzci9saWIveHovcHRlc3QvdGVzdHMjIGVjaG8g
JD8NCjANCnJvb3RAcWVtdXg4Ni02NDovdXNyL2xpYi94ei9wdGVzdC90ZXN0cyMgLi90ZXN0X2Nv
bXByZXNzLnNoIGNyZWF0ZV9jb21wcmVzc19maWxlcw0Kcm9vdEBxZW11eDg2LTY0Oi91c3IvbGli
L3h6L3B0ZXN0L3Rlc3RzIyBlY2hvICQ/DQowDQoNClRoYW5rcywNCkNoaQ0KDQo+IEFsZXgNCg==

