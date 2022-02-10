Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56654C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 01:07:07 +0000 (UTC)
Received: from esa20.fujitsucc.c3s2.iphmx.com (esa20.fujitsucc.c3s2.iphmx.com
 [216.71.158.65])
 by mx.groups.io with SMTP id smtpd.web10.4208.1644455225673651970
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 17:07:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=BHTaT/l7;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1644455226; x=1675991226;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tSJI4yTAriFkthCcYzYfbSOKQH8dlWvTT6qIIK7Jm3I=;
  b=BHTaT/l7aO+ySFo8RNm44phucoyzgPbIdOMfMRXWs5LPi3a5bsGTPrk4
   LKV5BUYx7GUrAh2lL3eAg4/VAIyzWvdmT4TvoH/6ul1LLYN5n/D94mi4f
   F3gBuld88G4yBXO0K1MHwy+ihnZfXCROkfp7S1C/CHnzhi7aylgved056
   ogeJr9YyBL/MedxfTuvRVMwIp21NM67pY4zJKeEkdW1olch1MVUPzfJKA
   UnJwaflgsJIb9nJ83+Aa6Hi5AN6YTBgaZGLTnlKkgwna6ll9G8aYRZx7N
   qqv61pQUTXHUSTtpBd8DXIDKQhVi0UQDOItctNk4VSzY2AT2KdkwVS9+7
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="49416144"
X-IronPort-AV: E=Sophos;i="5.88,357,1635174000";
   d="scan'208";a="49416144"
Received: from mail-tycjpn01lp2177.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.177])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 10:07:03 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PihWPQbrza3iiCIaeS4T8Xs45H4IsDmxIF4//nCjVzP6AipdorSdEkQQ2AGow8Pwole5q0wNgAxkjY3KJf0kEG62cNq1vmOGUb7qnSKDjO3sST83tyXgfQNhedDxVeQYZ4I5X6pLHUnWVCj5Q7DlPjUuWSfDCinMVVcclrHdWL5aY1W5tsunIT9T3yItebpYlUeqZlHIEA3u/uzRkzRFaaOKiJzqPXCtdF1vPLq9K5hiX2mBgqsDtoe31dEmKEA/cC4kc5hvfQhlLrzclInXkMvER1UME6Y6hzbZWhYncrAMx7tNFcmflyrT+Hr+e7H5umy2NCi0srqSmDYRvbNiXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSJI4yTAriFkthCcYzYfbSOKQH8dlWvTT6qIIK7Jm3I=;
 b=Rn0CJ5ttCjV/WZGUytJ8bWz0BQTJ9sPVCsf688WXeG+LKLl7RrIiP6fih0LIDsbQlJ/k2vkbaAsbXwzZCiR/bRAqX2cEu1J6OMHwRwWNMC5BdzeAwSACPxEmOcd48uPD8AX7kcwNZVDwh1xGcPoQ21lV4U+zavqvsZRNggY27AMpS4xHk2/LTotxpvCd6qyUcQz85RCvl5UdjLmdgHsDK7aXA4bry6a5ag/8BfiQNjJnZTESxlMvTcVtwZmo9kXePzCgwAISkUS+iaEJRHQWz53WV/6ayci1Za40kYHQijV6BWdQ5AQ6CypXEjVvqiXoqovz1YR2abnhkFA+n/2iZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSJI4yTAriFkthCcYzYfbSOKQH8dlWvTT6qIIK7Jm3I=;
 b=f5Cxws8aciawf19toIq3THKsq8bWQ5hDaxk6nzUT5z+Pl9ei58l/nYT3/FLM89B+RQkS7UWOMWZpLcl5n78FHcOR/VcqKCMhK9+PMLdGy4w5zfhgA+0KAbXKePjXDPHkerw54A4FmAdV84oHIvMI61BGct61+YUS3x8dpE7YL70=
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by TY2PR01MB4921.jpnprd01.prod.outlook.com (2603:1096:404:11b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 01:07:00 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::41fc:8534:c1e2:7cd9]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::41fc:8534:c1e2:7cd9%5]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 01:07:00 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] ed: upgrade 1.17 -> 1.18
Thread-Topic: [OE-core] [PATCH] ed: upgrade 1.17 -> 1.18
Thread-Index: AQHYHMWAyfl/FS7w9UOCLsbskS4rEKyJcr8AgAJ9IUA=
Date: Thu, 10 Feb 2022 01:06:59 +0000
Message-ID: 
 <OSBPR01MB18458CD72151816CE89F4962DC2F9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1644308725-5262-1-git-send-email-wangmy@fujitsu.com>
 <CANNYZj8X+Ryn4Jo5U=j=FcAjfff8o-J+TqZpr3HdGSA40amRVA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8X+Ryn4Jo5U=j=FcAjfff8o-J+TqZpr3HdGSA40amRVA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e7b8cb1-341f-4c3c-5ee4-08d9ec31a416
x-ms-traffictypediagnostic: TY2PR01MB4921:EE_
x-microsoft-antispam-prvs: 
 <TY2PR01MB492132BA697C095A6E50EF96DC2F9@TY2PR01MB4921.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 m1EX4538u2VQT/GzCVs5kJfXb2tVROpYVw42qy6DTDS0wx4n1/jWeDWMi1vKvny6wi1oRj+WuSMNwQXOJWz9AU7Ee11X982zp3HYEalTX79EKyGMFQ69j1bcXkXsK0ufNE4vGrhqOno4BZmCyQD/2ZdrlQyuMBOKDcwviKElXJP4nR7f0+6+OXI7XVXtkoSaw6L2n5O3mSUOD8D1cUS1opf98Y4fu06JcquAH296tpNGg7xjdlh3TaziO57EK5iFBUR4BaBnA5avI52On2pcozAzrLpqwTw7IAQ8vGj+cbkudpRcnBvakH/bzMU2TSjaPuCVsXRr6Lv2JFD8RdGnBvYPF9uVb6bau+swh8eW9UgAJVU2bw8voyFOWvV60nllthNrFT6sNnNbiwxVQJtF/PAB5aB9WUbLqiUXGK4nEh6Xt6QYdc/i4BD2hBU57+zebHf4H74dk2YGkvNE8A0hLk5fZPZp7s4UggE0gwDzKU8gbUvMc0NYaJrzxluo6OyxUBubEQ++zf6zD0v/TdpyuYGuUGQjbTYz9+cmTV4cQqO2ElYRlqq6iEQrZeN2kdthSWDpLZR6po7JP4JdOcAu9Yf1zPi5Z2/K+FIjMVF+yB2y4BhnRXY9NHjBDYAfk1PwS+RAIaziCPG1Jn6GF2CYyMIubLiC63hzE52i8M8Af48euMowzZLe9Df3MGY+bKX5syjE2hkofMhQV7ZrvSkSHQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(85182001)(66556008)(53546011)(5660300002)(186003)(86362001)(8936002)(7696005)(83380400001)(33656002)(52536014)(6506007)(66476007)(26005)(38100700002)(76116006)(8676002)(9686003)(66946007)(4326008)(66446008)(316002)(64756008)(2906002)(508600001)(6916009)(122000001)(38070700005)(82960400001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RFZLWHFxczJhYVo3dDdybGtNOG9OTWk3a0pJWlYzNHRIRUJYRnBkaERxb1lH?=
 =?utf-8?B?Rk0yRVBFaWQvRGFrSGNoWUUzbkNHS2VIa1RoVGU1dFRMN2ZWa2RsTUV2dWxK?=
 =?utf-8?B?WVpRbDFwc3U5b0UvMkU0ekVlTGJINndyL3hmWFBSRE1reVBUVU5ybTNhUWRs?=
 =?utf-8?B?bmNYbFpJRzJWdXVyVUtsbGsxdFF2MnUwSVluMkdoR1F2ZTlucktmN20wYnRT?=
 =?utf-8?B?ZmxRZU1CQ1B2S1RHRlBBaTEvYkgwN3FjSDZjT2l3bHVuQStNcVRnMWhBZGJz?=
 =?utf-8?B?K2pPdldNb0diYnVydnozdUV3TEVtdFE0UU1VWGdZNFVtWHdzVlZHR2hlYnVW?=
 =?utf-8?B?bWxkczNRVVFjYzU1QjlaakhRZVpOSy96cFord3h3Q1FqMHh5bEdWVFRjazJW?=
 =?utf-8?B?REVVM2txQXNudEkwNWdpK3pKU1R0R3Y5eVMrL25IVW1DelRaRG96TWN3UEp1?=
 =?utf-8?B?THlMTDRLRXVWeStwVW4rZXAyUXcyWkhsSXNRdjN4a2tJcW1NdUVxb2cyQjBr?=
 =?utf-8?B?K0JBaHZ2czFocjNKRlVKN0pmMDhtMVFOM0ZBa2FIaVhzT2Q2U05QRnNVcmh3?=
 =?utf-8?B?Y2QvMmlsMDd4L3FJbkd1MlZGejE2UXFtVGJremQ0bk4wdmlHSWtKdEZ4UVJQ?=
 =?utf-8?B?UTJQRGVWdWgrRisrd0NLNURmOU5KWGtwcnMyZ2RMRW1sbDdlMWZyM0o5RlVE?=
 =?utf-8?B?VytVM01Ja2FHWE40ODFHekhPdGMxcVQwVEVGblR1TFJGNG1JWUdsWWl5QzhV?=
 =?utf-8?B?eTQ5dFdHdTM5b3FEb1RpamphTnpTTUlhaURFMjd1dGpLTll4dmEwQVowOFVv?=
 =?utf-8?B?VytmcVRsaTZDbWt0NzlnSThPZEU1Q2I5b0lKQ2NmWkJydVJ6engzZEJOemlT?=
 =?utf-8?B?SDJ0RzJLL25pcGZmQTIrdnc5d0puKytFUHhTUmxHeElueFBSUlhaZlFZQ2hL?=
 =?utf-8?B?K2laT3p1b2VJTmtNYTNhTjk4L0UyM3dVeGxXcEpXOUxyUHNob2JaeVM5amdy?=
 =?utf-8?B?NnhyRE5IVU5KLzNOajh4SUE1RmlZd2FSeGp4V1M2ZThyMGF6SHorS01rdzky?=
 =?utf-8?B?RlRsbkNMdm84KzA3V01sZG1MeElOV0oyYXBYOUpsamVlKzRTS2N5Si9vQWVO?=
 =?utf-8?B?UTFmNGNsdmN0eUliMC94Q0tzT1dpT1B6K3ZaQmFLaHRGL2tuSFAzM3dNeFhQ?=
 =?utf-8?B?QW0zNmdrMXJxTTdqelpXRnZpSDVKaG1rSmpRaTBRR1RwQW9udWVlVTFmYUFL?=
 =?utf-8?B?N3VZM2U5UDRualZRbUJrakdyUXFrQ01aN3BRMEJURjcrOGYxY2lZSFpEb3pl?=
 =?utf-8?B?aGJDS2dmckNzVlF6STAzV0JmVUlnTGRqZjhBTVRVc0VOZGtyclQrVXIwdThq?=
 =?utf-8?B?bzZ3a25CM0hGby9qb1piWkc3M3NTOGlaZi9KYXNyZkc5V0g3aXVBT21pdkZQ?=
 =?utf-8?B?d1hpMWVnVGxUU3pzTFlSMWlVNXhTTGFBTnRuWEtkWVNOWGNncktnRk5ScTk2?=
 =?utf-8?B?RFVNd1Q5SnJnblB5OXp0U3RHbzI0Z1dRelBsT2FrT0hhT3dhSzNCQnB6aDF5?=
 =?utf-8?B?ektINVJwTmh3WGVsVDFuL2tOMFRaQ0s0M0xGU3FoTDRySG1teHMyVk5IVzJh?=
 =?utf-8?B?SkcwU0NtNFlvWE5BMkRVTkZ2cEphWU1BVTBSUVhPQ1JUbENJV2hzVHQ1alYy?=
 =?utf-8?B?UlpxVE40VHVoV1JmUVlRelZCRzBIL1AxS0pqdHE5amNDQThuY29NNzRNcnk3?=
 =?utf-8?B?NTg0a1RvRkgyMys4UDc1aExqVzJ0dXpEUHBvRE9qUkdURUxLVWpXSklHU3Zr?=
 =?utf-8?B?N29yOE5VZGNsNXNSckFoTU0wa2lkSHBiQm5oaDBqV1ZjalZKN21sNWNUM2tN?=
 =?utf-8?B?ODUxdGtkT2FVaEtXRUdtOGRvODdvWXdyZzY1ZHdmMGcwQ0VGblFlQXpMZ2tI?=
 =?utf-8?B?bk8wN1c4K1FuTkNEbG9uYnMrclQwczREM1F5Ym1PUTg2ODc5VnlVWHdsUllH?=
 =?utf-8?B?Q2dEUW5GQXROVDlvUEw3QmdQbm1MVjhsTUtzUXhmRW5CUm5OYnJSUlQ0aURv?=
 =?utf-8?B?cUNCYnVuVURraXcxc0M3NzFJazdLU1pUZlFiQUVGTEhrQTY1YUgvVnA1anRm?=
 =?utf-8?B?blR6WEFxZDZDbUFMbE9VcWFXZDFaZ1FMOXplSE5Ga2JJVUVLRURzN09uR3ZD?=
 =?utf-8?Q?jXye0aWtgKRgl+dKvau88TE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3e7b8cb1-341f-4c3c-5ee4-08d9ec31a416
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 01:06:59.9493
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 YGpjvd+BuM73pECR2RZXK94FqNiEXfE25aYfco1swyLwG4VtNH8V+gcJXUnBQGXnsNmnY0p9SSakB/3eJD4dEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4921
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 01:07:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161596

QXMgeW91IGNhbiBzZWUgdGhlIENoYW5nZUxvZyBzaG93biBiZWxvdywgaW4gdmVyc2lvbiAxLjUg
dGhlIG1haW50YWluZXIgbWlzdGFrZW5seSBjaGFuZ2VkIHRoZSBjb3B5cmlnaHQgaG9sZGVyIGZy
b20gQW5kcmV3IE1vb3JlIHRvIHRoZSBGU0YuIEluIHZlcnNpb25zIDEuNiBhbmQgMS4xMSBoZSB0
cmllZCB0byBmaXggdGhlIG1pc3Rha2UsIGJ1dCBoZSBmb3Jnb3QgdG8gcmVzdG9yZSB0aGUgb3Jp
Z2luYWwgQ09QWUlORywgd2hpY2ggaGUgaGF2ZSBkb25lIG5vdyBpbiAxLjE4Lg0KDQpUaGVyZWZv
cmUsIGluIGFkZGl0aW9uIHRvIGNoYW5naW5nIHRoZSBMSUNFTlNFIGZpZWxkIGZyb20gR1BMdjMg
KyB0byBHUEx2MiAsIHNob3VsZCBJIGFkZCByZWxldmFudCBpbmZvcm1hdGlvbiBpbiB0aGUgY29t
bWl0Pw0KDQoyMDEwLTA4LTMwICBBbnRvbmlvIERpYXogRGlheiAgPGFudF9kaWF6QHRlbGVsaW5l
LmVzPg0KICAgICAgICAqIFZlcnNpb24gMS41IHJlbGVhc2VkLg0KICAgICAgICAqIENoYW5nZSBj
b3B5cmlnaHQgaG9sZGVyIGZyb20gQW5kcmV3LCBBbnRvbmlvIHRvIHRoZSBGU0YuDQogICAgICAg
ICAgKFRoaXMgY2hhbmdlIHdhcyBsYXRlciBkaXNjb3ZlcmVkIHRvIGJlIHdyb25nLiBTZWUgMS42
IGFuZCAxLjExKS4NCg0KMjAxMi0wMS0wMSAgQW50b25pbyBEaWF6IERpYXogIDxhbnRfZGlhekB0
ZWxlbGluZS5lcz4NCg0KICAgICAgICAqIFZlcnNpb24gMS42IHJlbGVhc2VkLg0KICAgICAgICAq
IFJlc3RvcmUgY29weXJpZ2h0IG5vdGljZXMgb2YgQW5kcmV3IEwuIE1vb3JlLiBJdCBzZWVtcyBB
bmRyZXcNCiAgICAgICAgICBncmFudGVkIHNvbWUgcGVybWlzc2lvbnMgYnV0IG5ldmVyIGFzc2ln
bmVkIGNvcHlyaWdodCB0byB0aGUgRlNGLg0KDQoyMDE1LTAzLTMwICBBbnRvbmlvIERpYXogRGlh
eiAgPGFudG9uaW9AZ251Lm9yZz4NCg0KICAgICAgICAqIFZlcnNpb24gMS4xMSByZWxlYXNlZC4N
CiAgICAgICAgKiBSZXN0b3JlIG9yaWdpbmFsIGNvcHlyaWdodCBhbmQgbGljZW5zZSBub3RpY2Vz
IGluIHRoZSBjb2RlLiBJDQogICAgICAgICAgYXNzaWduZWQgdG8gdGhlIEZTRiB0aGUgY29weXJp
Z2h0IG9uIGNoYW5nZXMgbWFkZSB0byB0aGUgcGFydCBvZiBlZA0KICAgICAgICAgIGFscmVhZHkg
Y29weXJpZ2h0ZWQgYnkgdGhlIEZTRiwgd2hpY2ggc2VlbXMgdG8gYmUganVzdCB0aGUgbWFudWFs
Lg0KDQoyMDIyLTAyLTA0ICBBbnRvbmlvIERpYXogRGlheiAgPGFudG9uaW9AZ251Lm9yZz4NCiAg
ICAgICAgKiBWZXJzaW9uIDEuMTggcmVsZWFzZWQuDQogICAgICAgICogQ09QWUlORzogUmVzdG9y
ZWQuIChJIGZvcmdvdCB0byBkbyBpdCBpbiAxLjExKS4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4NCj4gU2VudDogVHVlc2RheSwgRmVicnVhcnkgOCwgMjAyMiA2OjI1IFBNDQo+IFRvOiBXYW5n
LCBNaW5neXUv546LIOm4o+eRnCA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiBDYzogT0UtY29yZSA8
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gU3ViamVjdDogUmU6
IFtPRS1jb3JlXSBbUEFUQ0hdIGVkOiB1cGdyYWRlIDEuMTcgLT4gMS4xOA0KPiANCj4gT24gVHVl
LCA4IEZlYiAyMDIyIGF0IDA5OjI2LCB3YW5nbXkgPHdhbmdteUBmdWppdHN1LmNvbT4gd3JvdGU6
DQo+IA0KPiA+IExpY2Vuc2UtVXBkYXRlOg0KPiA+IHllYXIgdXBkYXRlZCB0byAyMDIyLg0KPiA+
IGxpY2Vuc2UgY2hhbmdlZCBmcm9tIEdOVTMgdG8gR05VMi4NCj4gPiAgTElDRU5TRSA9ICJHUEx2
MysiDQo+ID4gLUxJQ19GSUxFU19DSEtTVU0gPQ0KPiAiZmlsZTovL0NPUFlJTkc7bWQ1PTBjNzA1
MWFlZjkyMTlkYzcyMzdmMjA2YzVjNDE3OWE3IFwNCj4gPiAtDQo+IGZpbGU6Ly9lZC5oO2VuZGxp
bmU9MjA7bWQ1PWI3MmFhNWVhYWZlZjMxOGM2YmZjMzdmODU4NDY5MTEzIFwNCj4gPiAtDQo+IGZp
bGU6Ly9tYWluLmM7ZW5kbGluZT0xNzttZDU9MmM5M2UyNGY0ZGIzNTI4YTAwYTI0YzdkZjU2MThl
NDEgXA0KPiA+ICtMSUNfRklMRVNfQ0hLU1VNID0NCj4gImZpbGU6Ly9DT1BZSU5HO21kNT03NmQ2
ZTMwMGZmZDhmYjlkMThiZDliMTM2YTliYmExMyBcDQo+ID4gKw0KPiBmaWxlOi8vZWQuaDtlbmRs
aW5lPTIwO21kNT02ZTZhODE4YjA1OTNmOTM3ZmM2M2JhMDhkNWUzMTRiZiBcDQo+ID4gKw0KPiA+
ICtmaWxlOi8vbWFpbi5jO2VuZGxpbmU9MTc7bWQ1PTg0MTlhMDhiYjEyOTM2ZjMyMzg0YTBkMWMw
ZjllNzRjIFwNCj4gDQo+IA0KPiBJZiB0aGUgbGljZW5zZSBjaGFuZ2VkLCB5b3UgbmVlZCB0byB1
cGRhdGUgdGhlIExJQ0VOU0UgZmllbGQuIEFsc28gYSBiaXQNCj4gbW9yZSByZXNlYXJjaCB3b3Vs
ZCBiZSBhcHByZWNpYXRlZDogY2FuIHlvdSBmaW5kIGFuZCBsaW5rIHRoZSBjb21taXQNCj4gd2hl
cmUgdGhlIGNoYW5nZSBvY2N1cnJlZD8NCj4gDQo+IEFsZXgNCg==

