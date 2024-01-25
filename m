Return-Path: <chi.xu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFC1C46CD2
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 01:05:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5432.1706144693698554814
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 17:04:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=asmiNW7N;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1754ff1c54=chi.xu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P0tXWl023391
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 17:04:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=J7sVTQb3IsHbV3byQ5WzFmUd6GPS6k+8gZxR+POn06k=; b=
	asmiNW7N8CNEskPcQInPHNV28NgMVwYJOuMC6rRRHqixYkDOf2KARXyDbtZ5Ubyw
	abemT7ztCbXyMgHQNXd5LAgeSn3WvoD4E3xWvlO/0HSVArwXHGd/9r8ugKFl6+N2
	aVn9/Y1IaD7JERtAoY64lanVvZiq4wBxQPG3rNP76QKa8SpUtQJuZbPy/hqzFfzj
	yojfMOonCDb/D5BHHh+myljifT65i32qLvzvwjBLGQj5aRE6YiTHOVaH7rsvKX2a
	CFvIVqQqFEUJovYaJTbDmT/y+/28hhM8MagfiTNudMZAytBn2uUSnq8CCZ0dS0aW
	K75xf2hd+nNJnHLizcve7Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vucv4r13d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 17:04:53 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40P14qtM002984
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 17:04:52 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vucv4r13c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 17:04:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifBqTCTetabZuUNRFwoHIB5GGeMrKQOkGZ6ZtY70tx2FCz854d9UaZInbHlyIkKf8/O+lLBwuDOzmcLekD++00syJrXTBwmgMRB2AWNBQKGEhNh8hNvBgtV0GgypVZvHEPQ8w2eHyL03RCtVCDQ1e1eAzuwIEO9h16wLcvbmcA+QGjban95jTpt0eiN/9zWh8Bf70GuPc1+G0ucPAyQFpfpOzgMhXz9W6y4Z0Hw3INFE6GTtnJ/z/tP6EOu4iSW88sIpNtWRxXpDboO3QC0hpb1Ek5/P5hZ7OcfUyYFvWzn/5hZJpN5MVTAsCUEz4p4IF56Va/a5URN4EB0OvUhDyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7sVTQb3IsHbV3byQ5WzFmUd6GPS6k+8gZxR+POn06k=;
 b=XwRmhkZIlQnKMlbU1TWhtOBlATTn9D0fAMg2b6MTx7uxZl6T0U1qtOScu+HMfRVY45XN1EKzFmxailppsMBrjzMY0rKGeGZN3ULShT9NeVyhL0qJrkljalzzIqx4zVpFZ1NaI63FMOj/6X++OMkPc6vTT7lgY03NUbZFzDIT03QWey44bRCSMN5+zAloZ28K4fh2NaXl1SU/WTiprDz0W/3TZMBYJvAQJgWTDNyKCxQKZPhF9qBUXIeCfKFP+5PZkq2052T6b4YBm0zEpATPs28m/ZPx1ml5Eeti4CfjHBGwLTZKST/ndWyn6UOTw0P6ldllWxIS2heEvN25rjNv+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5390.namprd11.prod.outlook.com (2603:10b6:5:395::13)
 by PH7PR11MB8570.namprd11.prod.outlook.com (2603:10b6:510:2ff::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 01:04:48 +0000
Received: from DM4PR11MB5390.namprd11.prod.outlook.com
 ([fe80::6b2a:9f24:34d0:cd1d]) by DM4PR11MB5390.namprd11.prod.outlook.com
 ([fe80::6b2a:9f24:34d0:cd1d%4]) with mapi id 15.20.7202.031; Thu, 25 Jan 2024
 01:04:47 +0000
From: "Xu, Chi" <Chi.Xu@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Alexander Kanavin
	<alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] xz: Add ptest support
Thread-Topic: [OE-core] [PATCH] xz: Add ptest support
Thread-Index: AQHaTqmX0LnyhZuSHke5iOJ3xXTTSLDotzwAgAD/wsA=
Date: Thu, 25 Jan 2024 01:04:47 +0000
Message-ID: 
 <DM4PR11MB53906B4059404291E6D6150A9A7A2@DM4PR11MB5390.namprd11.prod.outlook.com>
References: <20240124090402.3126423-1-chi.xu@windriver.com>
	 <CANNYZj-XFMk+Zburj-Q2xLk04BWg=qv8Kk0+=XAOwDdKpjpkQQ@mail.gmail.com>
 <1a57c97a7219e918a43696080ebabcfecfed26de.camel@linuxfoundation.org>
In-Reply-To: 
 <1a57c97a7219e918a43696080ebabcfecfed26de.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5390:EE_|PH7PR11MB8570:EE_
x-ms-office365-filtering-correlation-id: 3cee8785-ed63-4afe-1c5e-08dc1d419ff8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2B3lTlGigORAn2pguEwxdckADrWgPJbw/CeiSAri4mrKQ015QL5xazaZOrZIpXFJ2a03ajZ2pHqb1l+zr/bUUIJgCfu9KUQHi3TGAiuN8VvOnV5v2XPhvMf9kXXzmEB+GB3z28YlfsRworTYxPp65vZSjtQR73IqtIk1kxIqMqnYHfNl2Yz9MXD8qHKGMLtuclSgLlaVsWKwO/TOio59fhDgXGWiR+3Z0WC5hdZ1BXkcq49DvlI67yvenfElqhoGOj6xYHwFt5hK0YSgjWTvkEsKoMar1IWsW4UgD6KeoAUg65ETgXbyypKD9OskVdlymbWw6Sknn8q/UNSDcMXQLooJuNUYM4gcriAlBHabqBnDig2VeEbDWXFWsGWeNuFlnftHVqoPsIwDlMfemzqBbauwINQaxf2/3gMIAP1gGzV0L01LbvaV5jxtZZ4ZvRbDoOP1O4dksic73tsKHHLEJCc+tzLmJsiMoouQD/du10+jTH0Ffn+g0AtUDs8XDz9vil0sYnhGI9BSVl+js/87t118QIhjQMvqyBimYFOCy5d4n0ooxOV42tZWDaItsurYPQXe2xZ55QZVWK34aqKsH0pQKt9k7A+gPPmbbL7yP3bfrI24ikdpZKug3hRwQBaP4bCbDIsuw6IIEQYzsUveNw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5390.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(396003)(376002)(39850400004)(230922051799003)(230173577357003)(230273577357003)(64100799003)(186009)(451199024)(1800799012)(55016003)(41300700001)(83380400001)(478600001)(86362001)(33656002)(38070700009)(122000001)(38100700002)(26005)(9686003)(66556008)(52536014)(66476007)(7696005)(2906002)(66946007)(76116006)(110136005)(6506007)(64756008)(316002)(71200400001)(66446008)(4326008)(8936002)(53546011)(8676002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WVdrZWJmcnAySnM4dGFEK0dsVmVYMGh6eTQwMi9tM1doczNPK1FoNlk3aDFn?=
 =?utf-8?B?a3lQKzZkNTRSbE93S0xCd3dOc1BsdjNyQ1dNb01wNm04aHU1U09SOVB6c0pw?=
 =?utf-8?B?QVQ0YkEzZTJTMStLUlJpK01KWS9CRDhJQi9EZTdlbDRHTUw1U1FJZkt1RkhU?=
 =?utf-8?B?WldsODNocStKazRDcGM5b0drOVYxL05wcGZrQU02OFU3RSthOTAyK3NRMnFU?=
 =?utf-8?B?M3FLcDFNUDZuWTI5MzJwclpucDZwWXdWbVordXhJRi9tWmFOeUJ2TWE5MTh3?=
 =?utf-8?B?VFJhTVROTHo3VklZOHVlai9XMi9oTUZmVUJ3aTZ1OUJEVHN1S3lvdkZyMWsv?=
 =?utf-8?B?U3FLM002UjlHUUsxQ2JjMkQ1Wkszd1kvU25pcFBNOWZEMWZubDF5eEcya1NV?=
 =?utf-8?B?dlZNaUkvaVlLbEJXK1dBNk5STnhjbE1nN1VTTHcxSE9WZHlSaDczRWlrZnpL?=
 =?utf-8?B?bGNBVys2M20vYkFPaXB0Uk5XZEVMYjdsNmF1cklWR00zNDJEeEdEeEFTRmhI?=
 =?utf-8?B?eDhOYVduaHU5S3UvRUNGOC8wYnliclJNOUh1UTF0RUpEcGI2K2NKOG5LQlZB?=
 =?utf-8?B?dno3UnRQaGJMYWIxaVZBb1preko2ZmtHQktWTXQrdEw3M281S0hIOVdnWEJr?=
 =?utf-8?B?TE4zZzJYYjJtVlRWTkE2RGFNbys3R2lEcm96dlNRanhHeStDUWFSYXJKWThr?=
 =?utf-8?B?RHhtYTFQRFB5Y3NZVWlsY2ZzbWJva3o3dGtSUDJxT1NTTHNFUDFIdmlyVHc4?=
 =?utf-8?B?NEZ0SncweEhpSlorc2phQVlLV3dweitSbFlaTjRvditqdkc4dnVvY3pUMHdo?=
 =?utf-8?B?K2FyL1E4T1UzbWFWZms2UW9jSURGeGZkb2hZSXQvTHR5MTVsa0IycFQra0FN?=
 =?utf-8?B?cENpWjROQUMrSUxyanZhRytVcHI2Z28xcGY5WlJHNDhTaGJkd3pmQXlSVjVq?=
 =?utf-8?B?QjEvblE1MUlpVHFOOU5HQXlQcitnVUhLSnBEVExQVWJiU0kycFVyRTJwV0pZ?=
 =?utf-8?B?eXF3eEZ2eFRDcmY5c2dqTC8xbDlZSTZ6YmFuaHFwSmZzdFp3ejNVNGV5TTJ6?=
 =?utf-8?B?cGNLcEVMQUFxc1h3OHUyZyswZFJldTE4ZHJSdjBsOHBucXBuRCtxaVRoaHRx?=
 =?utf-8?B?ZERJNWRHUHpxdVNoU3ZaaTVjMjRPT2tQRkwvaUpTaXZtaWN1aU0rMThnNlIw?=
 =?utf-8?B?b3pycDJKQlBGbUloVjhoUHduMnN4NkFEaXQvbWx4cUhBUm9oRmdMelE5TWxG?=
 =?utf-8?B?eEJ4QmNiQ21ZaHZUcjQxOHhxNXB1OEZPZXYvWVFoS3BscitNbUFWdE93WG9a?=
 =?utf-8?B?K0duVlI4T3VObUZSa2M3WFdGQkF4VGJYZWVrSTh5Rzg3WUxDWjl0dFpSM0s1?=
 =?utf-8?B?QlZySTRmaE1PZHVFQ01tZlUxL0tNYUIraUZ5aWlUVHdJNVRyZTFycUZQNGVC?=
 =?utf-8?B?SWtDTml1akFRL2NNL2FaZSt5cCtxbU92L0ZuNzUwOGR4ZWI3VmlFdW0xUy9n?=
 =?utf-8?B?alBPNjlndi9adkZqVkFTeUtCaGxUeGZUb09pUmxTaU1KRlgzakxtQkgvM0li?=
 =?utf-8?B?OWk5SEFHSG5DdGxvZ3NJcU9BM1ArdjRmaCtLVDY3N3NRMnVGclJXTXMrTFJy?=
 =?utf-8?B?VVJXU3o2N1NaMStJZ0ppbFYycEhteXlRUng3Ym0vUFdYUTRGZURyQmtLeU92?=
 =?utf-8?B?Zlp1eHE0RkZLbFhwQ05wajd4MWxFOWF2UFRORTI2VEtHNi95a2hvdjc3Q1o1?=
 =?utf-8?B?OHpQd1ZWY1ZTZFVjV20zRHJjOFpWaDZqa1B0THUrT3MzMTlMdVhYN01RVWZV?=
 =?utf-8?B?UGlNak1ZTjJWUWVvaWdVcWVCMUJxSDgybnNZb0Y4dDE2TGdRbFpxUGh6Rkl1?=
 =?utf-8?B?bHJSNWpNTkNqZDYxYUpLWEd6ZkRoVnFjTEt5QnhoNkNlWEE5cEJid1A2aXk3?=
 =?utf-8?B?OHlVQVp1UUpmdkRySkRuamZ3Z1ZsL2xUY2RyRTdNbmlPa1lmRjBQNnJ3ckFB?=
 =?utf-8?B?UlpqNDByMWRiektmY1FrUlNlT3NVRU8weGhSQ0NlRDVKL2JFYUJFQmpMenVk?=
 =?utf-8?B?bCtQcnB3R0ZCRG5Ca1NHQlV2L2toZEwxVXJBS1cyMHhNRmhPTVBZMzlHVldH?=
 =?utf-8?Q?Rgna9btB7v6dJFzjl9CWQiXoh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5390.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cee8785-ed63-4afe-1c5e-08dc1d419ff8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 01:04:47.3636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LdBWkF+xiljHlXiWtIgGsxBz0KAx02JOo6QFep4Hm4swL0xDVZumU2EGtjfVhgvXsJTZ/k8R+FhCmWmGhgHa9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8570
X-Proofpoint-GUID: 54C2vLgt_7fapJHvV7Aj1HM4xjZyrpKw
X-Proofpoint-ORIG-GUID: oAbsdtNznyRxWvSudScD4fffbyCCjy7h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-24_12,2024-01-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 mlxlogscore=921 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 01:05:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194302

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwg
SmFudWFyeSAyNCwgMjAyNCA1OjQ3IFBNDQo+IFRvOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5r
YW5hdmluQGdtYWlsLmNvbT47IFh1LCBDaGkNCj4gPENoaS5YdUB3aW5kcml2ZXIuY29tPg0KPiBD
Yzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW09FLWNvcmVdIFtQQVRDSF0geHo6IEFkZCBwdGVzdCBzdXBwb3J0DQo+IA0KPiBDQVVUSU9O
OiBUaGlzIGVtYWlsIGNvbWVzIGZyb20gYSBub24gV2luZCBSaXZlciBlbWFpbCBhY2NvdW50IQ0K
PiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29n
bml6ZSB0aGUgc2VuZGVyIGFuZA0KPiBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiBP
biBXZWQsIDIwMjQtMDEtMjQgYXQgMTA6NDEgKzAxMDAsIEFsZXhhbmRlciBLYW5hdmluIHdyb3Rl
Og0KPiA+IE9uIFdlZCwgMjQgSmFuIDIwMjQgYXQgMTA6MDQsIENoaSBYdSA8Y2hpLnh1QGVuZy53
aW5kcml2ZXIuY29tPiB3cm90ZToNCj4gPiA+ICtTdWJqZWN0OiBbUEFUQ0hdIFVwZGF0ZSB0ZXN0
IHNjcmlwdHM6IHJlcGxhY2UgLi4vc3JjLyogd2l0aA0KPiA+ID4gKy91c3IvYmluDQo+ID4gPiAr
DQo+ID4gPiArSW4gb3JkZXIgdG8gcnVuIHNjcmlwdHMgb24gdGFyZ2V0LCByZXBsYWNlIC4uL3Ny
Yy8qIHdpdGggL3Vzci9iaW4NCj4gPiA+ICsNCj4gPiA+ICtVcHN0cmVhbS1TdGF0dXM6IEluYXBw
cm9wcmlhdGUgW2VtYmVkZGVkIHNwZWNpZmljXSAtaWYgdGVzdCAteA0KPiA+ID4gKy4uL3NyYy94
ei94eiA7IHRoZW4NCj4gPiA+ICsraWYgdGVzdCAteCAvdXNyL2Jpbi94eiA7IHRoZW4NCj4gPg0K
PiA+IEl0J3MgYmV0dGVyIHRvIGJ1bmRsZSB0aGUgeHoqIGV4ZWN1dGFibGVzIGludG8gdGhlIHB0
ZXN0IHBhY2thZ2Ugd2hlcmUNCj4gPiB0aGUgc2NyaXB0IGV4cGVjdHMgdGhlbSwgYW5kIGF2b2lk
IG1ha2luZyBhIG5vbi11cHN0cmVhbWFibGUgcGF0Y2gNCj4gPiBhbHRvZ2V0aGVyLg0KPiANCj4g
SSdkIHB1dCBsaW5rcyBpbiBwbGFjZSB0aGVyZSB0byByZWRpcmVjdCB0byBiaW5hcmVzLCB0aGF0
IHdheSB3ZSB0ZXN0IHRoZSBhY3R1YWwNCj4gYmluYXJpZXMgYW5kIGRvbid0IGhhdmUgY29waWVz
Lg0KPiANCg0KVGhhbmtzIFJpY2hhcmQsIHRoaXMgaXMgYSBnb29kIGFsdGVybmF0aXZlIGlmIHdl
IHdhbnQgdG8gYXZvaWQgbm9uLXVwc3RyZWFtYWJsZSBwYXRjaC4NCg0KVGhhbmtzLA0KQ2hpDQoN
Cg0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQo=

