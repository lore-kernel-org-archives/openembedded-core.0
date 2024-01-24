Return-Path: <william.lyu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8DD3C46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 16:26:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.27302.1706113614820131841
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 08:26:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NOKdw0Mi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1753a196b2=william.lyu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40ODfFrM000954
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 16:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=au/sYejiBa1TfTTuQf5hihZxKLWttvrsGfdVn6QcZcY=; b=
	NOKdw0MiAlqWDqdFVnsd5BxX8nsWV7lDKIf6Fx6mHRxvkk1PyF1KkGkPEMH2FOsB
	CtD9q45tD1iYK+TU11jz5V7HzCrGtNJ4MGJkhOo57EJF978BIholeDBcUAEpCCKK
	Aa/oqHIv2UkpCNCbpoxu+k+XMlGoSydzjOpGvNfIRoisNPwUfIRpfAnKtTPMZWrz
	/F/Hmhqvu4BUvMwhhOAorxhp5RtVOeFM+1LpspjJ+lZPQoahkgCGreYQWedeND5M
	hhuJwfMvMqjjM/vVZG8Dvo0BZEn+JFCpbonc/doTGBVnVjpIHNgnF+7mnL58hRyB
	HonU7xqw5qKpQxzUISheUA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vtmg28xmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 16:26:53 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40OGQr0Z008311;
	Wed, 24 Jan 2024 16:26:53 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vtmg28xmk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 16:26:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZD5ryv4qd5V69HRVQK1A7cts+LXavnsaxWF3ZcG571k/2sgXo+8nlnaV1C5VYzpzzzTM/LuBHQTzlBc4GlTz6kDpIknX/zMDIR+bKrV6cuzh7KpZQ3Wq2CvieLY5m3MV+UjInwJF4TsqBKhTqtkOTXkP3SW8TvWS6yLbkRP69MSRwYYiM+fLz0OSeidNHOHWf8WMw+MwKIJemUDT5bWsFBZj3I7Lv5AkGQpnZTnumYGyevw4gQ2IfX2l20g6T8Z4m9guPvpmSJ+XHrWUgQSYLn9nMiTRgkoH0MDODSyhNS2Xc+5GGk5iXikkqm8gzZjmWYQQEzOfZR5xYfHLa269dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=au/sYejiBa1TfTTuQf5hihZxKLWttvrsGfdVn6QcZcY=;
 b=niwyNxfp9ZXm0tNeKz07qcKjpp7z8RJKON2e54VLSNp7hRbAy07ljt5Z2c3ezoJm2EHvQe55eeTxl4RXWf6IA4Sn4H42JTPBUkIo8BqZzpYWgsy0asQg1CS5tgoHrWEZU3RZnfmZJvE6pRbM6+MmlLUD7WcAMRbH5YaqBLD50hjqxyi7NchBt3yUyMIpiMChgDJ9ZeBUkjZWdvq1cXRlchEsN2EKV5KLiDvEDsLK4wkabXEN/Y4k1lb/E81mK3L0CIGZlQ45clY3HUc4Y8jj7DQgnQNPsZicKA9mcvfuF4gTwrpd1mpybRNren0p5YsdB6jjNzvoN3V7v9qSC0iI6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4447.namprd11.prod.outlook.com (2603:10b6:208:194::25)
 by DS0PR11MB8164.namprd11.prod.outlook.com (2603:10b6:8:167::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.24; Wed, 24 Jan
 2024 16:26:50 +0000
Received: from MN2PR11MB4447.namprd11.prod.outlook.com
 ([fe80::8206:ec84:da0f:f2d8]) by MN2PR11MB4447.namprd11.prod.outlook.com
 ([fe80::8206:ec84:da0f:f2d8%6]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 16:26:50 +0000
From: "Lyu, William" <William.Lyu@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] perl: Fix perl-module-* being ignored via
 COMPLEMENTARY_GLOB
Thread-Topic: [OE-core] [PATCH] perl: Fix perl-module-* being ignored via
 COMPLEMENTARY_GLOB
Thread-Index: AQHaTnSRujTTIAkdgkihBlq/ofSkvbDotvEAgABwX/A=
Date: Wed, 24 Jan 2024 16:26:50 +0000
Message-ID: 
 <MN2PR11MB44470EAF151921F243A8E08EEE7B2@MN2PR11MB4447.namprd11.prod.outlook.com>
References: <20240124032220.1906541-1-William.Lyu@windriver.com>
 <CANNYZj9=zyL9xL2DofAKTeNd7JPo1tv-SoRvZPf-+AFgNG-Qyg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9=zyL9xL2DofAKTeNd7JPo1tv-SoRvZPf-+AFgNG-Qyg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4447:EE_|DS0PR11MB8164:EE_
x-ms-office365-filtering-correlation-id: e37a6d31-750f-460b-0b38-08dc1cf9447b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 w/JEq3L/oJM763Z0nRGwtiYRLypjRTe7q1JUNUubf8iTp5FAdQ00P2XyfGubP27e4dK6QLi7elFAuEH+YIReiPX5bDAs3lpzwl2sweY2uV8ELx4dLR9Ff7phg1+zFTDbMM0MUbfx/JAy9/BXGgPjB7qRbqTeh6r+PEopxn81iL96fsG6EEEaST9LGud4zoQiLjyvI5xrM/H+PTKTGIC6Vxv3S0xuA/NrGyGI4qOJEvKFnsPEzmHxPlMkbQPhghriYwQhU0NfSl3xMArIrDAbCA3ZfyLriLeGZp5zmYDn78HOiOTsnXmnW198PAprvnqV4KpIAGdwp18tZpDiKQkJIqZeZfB1fiNzPdC/W1MSilq2suscbLBjvBybok4ms2N8qYJi1U1gvlMCPdKk3f6R/jQnSffsfeQ7x3tDTdu9g0ufJXiMmcLJlFaw3y28019GgwXtmACP9W5z77UDgiNj+hpjJBLZGM49Ll+5W9SZ9KFdze3GqBnvAV2P4f8cPWOu2LmomEFvT43dlVrqGpqK0ALY4jnDBV3bsqqROHF3telkilAqJCRsC1v7fT2dPhh0p/C5mev4eLjE9X/YXi6WjLfEZIU5NoDFLrsWe85p/NU6sw0iIIP1qK5D7QCeZAn1
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4447.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(39850400004)(376002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(41300700001)(55016003)(26005)(38100700002)(38070700009)(478600001)(7696005)(6506007)(9686003)(71200400001)(122000001)(5660300002)(2906002)(66556008)(66476007)(66446008)(66946007)(76116006)(33656002)(316002)(64756008)(86362001)(6916009)(8936002)(8676002)(4326008)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Ri9SS0ZKS0hxaHI3M2h4eFpDNWdGTUFydGxhblA4Z3ZPdGRRWFFlWndUTTRu?=
 =?utf-8?B?SkcwOTJKR2JpeitjdjZ4Tzg1TUQ5MG5nQnlFM2lWVVVnSmEvV0hIZUZLeXdr?=
 =?utf-8?B?VTRrSXdyWGVmOFhEQ2tGQ0xRKzVWVTIzZEJRZk9IZC85T3VCUWFIVEJUK3NL?=
 =?utf-8?B?YWVHY1ZuZVlWN3pVc3QrQ2lkTmlBS3JXTTZYNXlRQ2VQNitldVBjei8rTUN1?=
 =?utf-8?B?MnBvY3oyWTVGRUxwZTFnNDU0aFVGdzc0cEsrcE1lOExhd3R6Wkc1QWs3d2hU?=
 =?utf-8?B?ajFHZzVmSlhDd2ZGb2dlckpXdWlQV3RnQW9rTi8vSnJEWWNzWjhNTzFxTkNI?=
 =?utf-8?B?Y0srMHdZTFFIZWwwRWQrMlFkUVVNVGFTQmo3WXhTZ1p5RU9wdjZFWEpWQ0wx?=
 =?utf-8?B?czlIemtQQVliMGJLdERUVlRLcythcnp0Uk5mNUJmZUlPK3gxMm9EYU1jNFRF?=
 =?utf-8?B?dlVienNnMkRaZEJKZzlNNG16WVBBZ1JzMkpweDRCRkhFbnFNcU1vN3VvTDZU?=
 =?utf-8?B?OVlnQytBcmlOcmgvOTIvcGIrelBlWC9MbnVKcHBPNVV0K1diSzJiMUVJQzkz?=
 =?utf-8?B?bW1IWHppS3FJK0wrWVdhbzFPcDUvUzVQVEV0b3djYXg3WXVkcHU1czNkN2sx?=
 =?utf-8?B?OUJYSUVySk1ENXMrQWZFNzEyeVN4MXlkZHdJa3BLbUx2dHNQU3VpWFpxYkE2?=
 =?utf-8?B?SXVOL1p5T2R2dXJPeSt5NjNRMGFZZGdUT00wbC9ROElsVCtld0ozT1BUOE9m?=
 =?utf-8?B?eVVBTnFkVnhVcTlnMlVqdHFuanloZ2pwVDdtRnpnS0VReHVkaEJSWUx6dkhn?=
 =?utf-8?B?YnptQmJGYTEycXhueG9CRkZxaWgvbVRQYnVxeXV5aStWMWhRUnlxa0VqNis1?=
 =?utf-8?B?VXZ4UFA2TUU2WTduQm9ESSs5UUVhNGM2NDZoRGVTUXUyOU4yQkhhYlJLMVpl?=
 =?utf-8?B?MEJ2TEptU2FoRkxMM3k3RWJkM1h2ZS80WmxUa3lBejQzQmxaMFZkdVFWRFVs?=
 =?utf-8?B?K1cySjAxZ3NZM0xKelRKbmY1SFhjU3JRUDluV0xSS2NDUDE4QjFlc24rV3gr?=
 =?utf-8?B?RjZ3VjNONjhncFJzeGt2ZWtzTEVJQmRnTTNQK0pEdEtBdnd2d3R2NVo5M3dw?=
 =?utf-8?B?WE1XeUJZV1B3dkFhZUx6UnhzSTYyOVlOcjFDQkdjeGZKQkg0L1FUcVptMUhN?=
 =?utf-8?B?d1BidTgwYmdVSTB4Zlh5eGRNZXh1WG9MY2VhampWN3ZXRHFiZ0Uva1hKeGhi?=
 =?utf-8?B?cjNUZ3JmQkdaWGhzQ1lIMWNIbEdKUDdyK1pXbXVNSXJqSUx5NjZLZzRBanZF?=
 =?utf-8?B?MVdFeVQ0dlJhdTRaVjEyRlBiTTRFeU9jRHVhMGsyeEpjQU1nNk9VTlRpOCtT?=
 =?utf-8?B?WTZqdnoyTFZXN2p6SDdDYS9BRWZZSXlqWnN3QXFkTEVLNUVTamFFckNBVkZO?=
 =?utf-8?B?SjFvQWt2eVcvTGUwOVdGY3NLL1FHRU1XNkFDSUYvNjV6RjliSjhXZEloZnlF?=
 =?utf-8?B?c3AxZTBHeHo0TWN3NHM0Rk5WNEQzVElRblBtejNoc1ZLc0xUdVNFckREMzFX?=
 =?utf-8?B?ZFBVM2JSNUFjcjVFM1ZmbEE0czVwb0dkb2hadXJ6NW0yK29YRGhlNGxwSko3?=
 =?utf-8?B?Z3BxdDlUemE1bFlyUnM5dnIvSDZQU1F1VlJ2RWp1YkE0QWZ1ekRSV3Q4cjB6?=
 =?utf-8?B?V1A1aUF3UlNMWXJON0IvZGhYRWpIRFh4UW5NOWI2aVBuN2d5UTA2ZWlrbWJr?=
 =?utf-8?B?dFRMUXQ0SExoRmFicXkxaXorbWsyNEx4TFJISWdNWmd3TStReWJoMFc2ZUJE?=
 =?utf-8?B?Rkpua0d5YU8yQVBUbDZyalR6d2JmZ2VUdHN6bUtmTWlJdElWeUdDYU5yVzRM?=
 =?utf-8?B?cGsxTTZ0ODk5Mm05WVBUc3BFeVlVWnlwd0kyYlJOSHNHZGNvaGZZamV3THpu?=
 =?utf-8?B?c1FSeEtZUG9qbVExN1h0WHlqUlBFc1Y0bTBOMFFlUGVObCt1Q3p1bU1TN1J5?=
 =?utf-8?B?TklPay9idTJpQ3FRQXNlVTdzMXhIU2VGYmx1MHNEZVZlekw5dVpIbDRFMmZP?=
 =?utf-8?B?YU1VVk9jM0tpMjRRcXZ6SUNBWlJnb2p5cDNoN3lrd0hCb1M1c0NhemUrV1JQ?=
 =?utf-8?Q?A7VQ3AG2mmUEAtUel+eloD1Nw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4447.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e37a6d31-750f-460b-0b38-08dc1cf9447b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 16:26:50.0901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g1QMaesHP9aOU49TujSRFJqGRaNDiyDodc7SKrBwGgheIx7J6xoLOEqML4izFDQaerNtxCwXbKD7PUdhNUhp2Qt62HIeShSLeGKacSxyIzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8164
X-Proofpoint-GUID: 5ry98an6F3_aqJjuDZ8skg5xtadG7vc5
X-Proofpoint-ORIG-GUID: 2NDkw3x7tt4B_MnY_L7EIOXjccvPU9em
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-24_06,2024-01-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=785 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401240120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 16:26:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194295

PiBPbiBXZWQsIDI0IEphbiAyMDI0IGF0IDA0OjIyLCBMeXUsIFdpbGxpYW0gdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gPHdpbGxpYW0ubHl1PXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gd3JvdGU6DQo+PiArICAgICMgbW9kdWxlcyBhcmUgbWFudWFsbHkgc3BsaXQg
KGVnLiBwZXJsLW1vZHVsZS11bmljb3JlKS4gQWxzbywgdGhlIHNwbGl0DQo+PiArICAgICMgcGFj
a2FnZXMgc2hvdWxkIG5vdCBpbmNsdWRlIHBhY2thZ2VzIGRlZmluZWQgaW4gUlBST1ZJREVTOiR7
UE59LiBJbg0KPj4gKyAgICAjIGFkZGl0aW9uLCAicGVybC1tb2R1bGUtY29uZmlnLWdpdCIgaXMg
bm90IGEgdmFsaWQgcGFja2FnZSBhcw0KPj4gKyAgICAjIENvbmZpZ19naXQucGwgaXMgbGlzdGVk
IHVuZGVyIEZJTEVTOiR7UE59Lg0KPj4gKyAgICBlbXB0eV9tb2R1bGVfcGtncyA9IGQuZ2V0VmFy
KGQuZXhwYW5kKCJSUFJPVklERVM6JHtQTn0iKSkuc3BsaXQoKSArIFsncGVybC1tb2R1bGUtY29u
ZmlnLWdpdCddDQo+IA0KPiBOZWFybHkgdGhlcmUgLSBJIHRoaW5rIGl0J3MgYmV0dGVyIHRvIGFk
ZCBwZXJsLW1vZHVsZS1jb25maWctZ2l0IHRvDQo+IFJQUk9WSURFUzpwZXJsLCBhbmQgYXZvaWQg
c3BlY2lhbCBjYXNpbmcgaGVyZS4NCg0KSXQgbWFrZXMgcGVyZmVjdCBzZW5zZSB0byBtZSBub3cu
IHBlcmwtbW9kdWxlLWNvbmZpZy1naXQgaXMganVzdCBsaWtlIA0KcGVybC1tb2R1bGUtc3RyaWN0
LiBBcyB0aGUgZmlsZSAtICIke2xpYmRpcn0vcGVybDUvJHtQVn0vc3RyaWN0LnBtIiAtIA0KY29y
cmVzcG9uZGluZyB0byBwZXJsLW1vZHVsZS1zdHJpY3QgaXMgYWxyZWFkeSBsaXN0ZWQgdW5kZXIg
RklMRVM6JHtQTn0sICR7UE59IA0KaXMgZWZmZWN0aXZlbHkgcnVudGltZS1wcm92aWRpbmcgKFJQ
Uk9WSURFUykgcGVybC1tb2R1bGUtc3RyaWN0LiBTaW1pbGFybHksIHdlIA0Kc2VlIHRoYXQgdGhl
IGZpbGUgLSAiJHtsaWJkaXJ9L3Blcmw1LyR7UFZ9LyovQ29uZmlnX2dpdC5wbCIgLSBjb3JyZXNw
b25kaW5nIHRvIA0KcGVybC1tb2R1bGUtY29uZmlnLWdpdCBpcyBhbHNvIGxpc3RlZCB1bmRlciBG
SUxFUzoke1BOfSwgJHtQTn0gaXMgZWZmZWN0aXZlbHkgDQpydW50aW1lLXByb3ZpZGluZyAoUlBS
T1ZJREVTKSBwZXJsLW1vZHVsZS1jb25maWctaXQuDQoNCkkgd2lsbCBzdWJtaXQgYSBuZXcgcGF0
Y2guIA0KDQpUaGFua3MhDQpXaWxsaWFtDQoNCj4gDQo+IEFsZXgNCg==

