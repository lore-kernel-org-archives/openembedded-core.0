Return-Path: <ernst.sjostrand@lists.verisure.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE8FC433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 13:02:58 +0000 (UTC)
Received: from mx08-00271601.pphosted.com (mx08-00271601.pphosted.com
 [185.132.182.208])
 by mx.groups.io with SMTP id smtpd.web12.5421.1640091776923396062
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 05:02:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@verisure.com header.s=pp16032020 header.b=T27dEeps;
 spf=none, err=permanent DNS error (domain: lists.verisure.com,
 ip: 185.132.182.208, mailfrom: ernst.sjostrand@lists.verisure.com)
Received: from pps.filterd (m0107398.ppops.net [127.0.0.1])
	by mx08-00271601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BLCXu0V029102;
	Tue, 21 Dec 2021 14:02:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verisure.com;
 h=from : to : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=pp16032020;
 bh=X2d3rYt+5TwCc+SSDTfeApEt16PIA0lUhuka/DX/UgA=;
 b=T27dEepsKKVn+YsQNhH7RXEGZxRQmrqFKDdTlAD+Qul/qJ9N1QCPLx+uesPVhQRgm/ux
 JYVOWm6W1xyMN2HmYae4HXCO/D8sU8jmOvajZEqBGjpUBfYyOO6Gx/HLVj6JXPPYUmgo
 Ny9R3LXhHPtysdlyTGTJpM8XCsJkb9DJOQK2XFh23GDQjd94AKmm0IPmHCT80flcZvT1
 1N8TFiuj3PlZBBZMIi+vcfmV86NTMksqlIdHAtU4W9SxKAsofBLpjHc1q7L/JwTnE7ps
 bUPT06noIaHMoQWva4BrgZ3rWAlExT3l1rO7Xm+qLPtEoHi6NqcBv2Da+MtjpaX0bA/8 +Q==
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55])
	by mx08-00271601.pphosted.com (PPS) with ESMTPS id 3d39wvkf2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Dec 2021 14:02:53 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/SW9DBPkkwqXuvd6wPqs1UrDg9yHwmp78GJOxNK3oBy5HyGOtwPpnd1avggnHrEtSjqsbWjSOT4pgeiktH55TG5Do66wbPfecORv5zdl0LC1iuHIqBs/R0sU1/nYmR3FkKf9bkHa/hUxn1lqkmE1vKFlctviaFFT9VhBtSjKzCoI60YBRwgHvDkp2mtETCltchNkKNdh6VNj+H1sUQnvsafo9QGXgDwqwERlHu5eT/mDCDbsIxs1oJ4BTdDK8Srcsb6o5bK+m7pH6DGbsUNoZmsKhoHMrQPulYHSYz1sdpsyAh0DjhQdM5UV+rUi/d3jA3rviXCwdilIbdvprtw2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2d3rYt+5TwCc+SSDTfeApEt16PIA0lUhuka/DX/UgA=;
 b=Mp1al1P+b/EVeeZ65+edbwqY6cPqQfANl7Frbjr4f7qdasFCyZ4D4z5KKRgcO7nbLAaZqblkBnbn/f59sNBp3Ch2dvh7QvnrTS/UtdyniXV48/Zs8cnsSr3H09/qbCdhwWERMb0fzwj2ViakkanqaErxhqyzdhfi7f6HHmW1qrSwCIP0pSEsBdKMHWyGGkfSrbWTNjHG/o2b8d+Bo8OAuFZ9Gk7BDJsfJwpqx4NB4wimJ1yRNgU7UnxC71i1D6fggyRqSVTYcvNj3w4rK0NapkBCK0qBXdPhxOEev7JH6h4RFUR37bQIY/RksWuMCNmfOnDuNWwUZjR8zV+ry6r+AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lists.verisure.com; dmarc=pass action=none
 header.from=lists.verisure.com; dkim=pass header.d=lists.verisure.com;
 arc=none
Received: from AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:43b::18)
 by AM9PR10MB5023.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:3dd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 13:02:52 +0000
Received: from AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::66:11c9:5d2a:e49c]) by AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::66:11c9:5d2a:e49c%4]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 13:02:52 +0000
From: =?utf-8?B?RXJuc3QgU2rDtnN0cmFuZA==?=
	<ernst.sjostrand@lists.verisure.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "steve@sakoman.com"
	<steve@sakoman.com>
Subject: [dunfell][PATCH v2] dropbear: Fix CVE-2020-36254
Thread-Topic: [dunfell][PATCH v2] dropbear: Fix CVE-2020-36254
Thread-Index: AQHX9msQgqOd1PvRhkKPZhedkdQ3Tw==
Date: Tue, 21 Dec 2021 13:02:52 +0000
Message-ID: 
 <0ab160933ee8b84b5d5b0e648a2a20f8ed3367d3.camel@lists.verisure.com>
References: <16C2B9B88AD918F7.22520@lists.openembedded.org>
In-Reply-To: <16C2B9B88AD918F7.22520@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 432099cb-bf14-4514-3a4c-08d9c48232ac
x-ms-traffictypediagnostic: AM9PR10MB5023:EE_
x-microsoft-antispam-prvs: 
 <AM9PR10MB5023C035B987177ED774BE99CB7C9@AM9PR10MB5023.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:176;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 K3P9Roxxn0Dci4q45pjBFhO1jOEW5bq04EH3bld0Yp3Z6l+ZrMawEd5XJbTUZ4jYZScGTHQCrjsul1BjmOBrdYHYjBzEd0PAb40+Q8nHql1BUPG6NW8QFIYCXj7qA1dh2Y2vZXow7qGHK4gqSak6ASwzcqE7C03EjUz2RMLjgX376Hxs5XPdohx+vqNZw8oZPToplc7L908UV8YtwYnDaH/h0lpHRs2nJ1HrbqC6Pf7oDfbJ39Rl2Fql2rtpVTuqALUFGA7pYmmWWPUcdoIE3ZBJbSjMszDpf6gqcbZNXTUBXYT6CzwZoNjLizUw09F7nY5oGPImxoX/rTuyeM3BySlHUb58gfrimseex0Fdpe8c7IMcDol+tuhv2cP5Axn82hfBJ9hCA5sLVly37v0wDIc9UbQOK1UBEq4v7awmwJHzbDBRBfacFbpABNMWcrABtWsbWjA1hf+nMhqsFuxWPDMuteGpW4asvOU/Q7UjmFZZC+CJDV2w37PAIDw62ZmXy3F/26ENiYb5uJnWOk6xg5cu/oDj6YcllHBxbitFZhxC9Fz+XnkGZBJTXySgvWwePT9ZZLD/abPOG2aUTcVyejyapTwE+c+ukPCzylzWdRBbYqc+VfzEU5gQOkQ9nrT8eqILhOro0KZVQh31RbVcbK8iNstF/9vtULQQ0SbksoTu/QrO/1tRBBRCBd1kyP3Olp9vHxyJ6JodXZc/atz5jZSbcDo6eYShdmEVV9Jyx6oIyNuyu9DCOErlL37eWM8QShCWUSRC+T8xaACJ/iDtxVvz6TDIRv8SS7427fBiRUs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(64756008)(2906002)(85182001)(76116006)(6512007)(966005)(66946007)(66476007)(66446008)(83380400001)(508600001)(66574015)(122000001)(91956017)(5660300002)(6506007)(38100700002)(6486002)(2616005)(186003)(85202003)(71200400001)(8936002)(86362001)(26005)(110136005)(316002)(8676002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RGIyQ1JXV2Npb3hWQUZ6RzFEcVVjaFlKUHpobHQxbytGZEpMYmJDck01YW5N?=
 =?utf-8?B?bFpBRWdQUDVNSC9ydS9qTUdRZFFtd2pyOFBjTWVhL2xjWkZoV3U1WmRBZ3dQ?=
 =?utf-8?B?NXFKRUFtNTd6N2dEaGlSM2RISEpEZTE4Q0JpUzZHUjRkeE9zbW9remVuSS9o?=
 =?utf-8?B?QlF1cEJCYUUwNlNncmJRdFcvRnV4bHNPNStBWGluZzdVeDVvY214UFR2Q0dZ?=
 =?utf-8?B?MjdpNE9SUU84MVM0RVdoY2lPMm9yem1WVTBYcy80NFdxc1dNM1JRaExXZmFZ?=
 =?utf-8?B?eTl1M0ZjelJYYzJVVmJDdG1tQkRRZzlIUWtEd1R0dHlXemgwWlMyVTZac0Q1?=
 =?utf-8?B?d3FlMU8xS2VWcllmMVRibHg3MVBhaTFPOHRXNmRvMkR6aUgxa25aUC9GOXgr?=
 =?utf-8?B?Z0NVRGhyUzA4ZUlFeTBueWFjUjcwS2MrWXZNV0lYWkpuVE84UW1aWDdpcTlw?=
 =?utf-8?B?TldRcldnUUIzY3ZHTzdleGlienA5ZUo5RVFKYWJ5UXdOeDBURjU1aDVJakFx?=
 =?utf-8?B?bEhpZkZhNXplN1Q3czdjYVdRaW1jWk9rRzJQekgrcDNlUjgzSW1NOFZHeFND?=
 =?utf-8?B?OWo1bU1tbmM2KzJ6NGYxZkplcG9EMXFkbndReVZIQlN1K2xta3kxOE1IUG5y?=
 =?utf-8?B?QlN4ZlJzUmh2a2RtcXBWTEtPVkx2eEVaU3V3TXMxcnhXbEtNbmtIYVBIOTNT?=
 =?utf-8?B?S2N4aU9qcGwreldYQzIzcWw5RUxZMmd4eThyalUzUVZiTXJnRWR1Z01SZ1Vl?=
 =?utf-8?B?T3lkWG5xejErbFN0ZjJmcE9rVkFWZmNQMFRKMlJZUTlmQlAyWXFhSy9iOHow?=
 =?utf-8?B?UlY4NGdQaWNOTWl1YnAvOC9HNEh0NlRzSW83ZFhsL0ErMXg0Rnk5bldtL2h5?=
 =?utf-8?B?OEpEK2Z5aXpwUGo1M3hlSG5wVDgrUkRubEJZNktrOHBTTVc0TVJNM0RjTXIv?=
 =?utf-8?B?QlFMNlB3WEF3bDNHaUQzWWgxL01oMExLMkdPY2tQL05MOENNRldTMGNIcjhx?=
 =?utf-8?B?MzVoYTMrNEFRYmZIUldyc0Y2MnpQTlRIZ2tEUXpnUTlZREZlbThvV1RWSEkv?=
 =?utf-8?B?eWdmRmZVSUFhaklvRXhXVGZyRHdKaFJtL0UvdUZ4S1ZZOWEvSHE3ank4cDBR?=
 =?utf-8?B?WDVxSFRSb1ducUhFQ3Z3SThFOE5qdXpRUExnS05QUnFyZGR6Mjl5alpJamFP?=
 =?utf-8?B?WGhnbElsV1E2QTZDY3FuZnVPVDRJbmJ4NDByUE1lV25tSzAyb01wVENMZDA2?=
 =?utf-8?B?WmJQWjAxS0E1Zk5ZeWhObTQxb25LN2JwWE5nWnQ2OTMrQm8vRGY5ZmV6NlVi?=
 =?utf-8?B?cXZyOW1MdElEYVdNS0ZUS1JaVnZtdXUrVDUyaVl5ZWR2ZGpNRDdSSkdKNEpW?=
 =?utf-8?B?RWtnQnc5UUJ1UHVSTUNXQXBVMzFWakp4ZjM4aWFzdFJHMjRHcmlFbkpmcUYy?=
 =?utf-8?B?cTFyVDVBMkxlZDhJVm1lam8zY3J5OUp0YWhpT1YwZ0ZkU2ZMNUhyZDBEOGNF?=
 =?utf-8?B?TXRWNHM5WGFaQk91SUZtVU1UZlVmeVdWa04yamsyNUZsMVM4c2xPeUZ5cWVZ?=
 =?utf-8?B?L0NPS3RibEZKRFg1aXJTQmRuTVVsVHFlSFlDcFYwOVNiTmVoYnh2b3lRTmUr?=
 =?utf-8?B?aUhQOWg3UnZaY2h0NXNtcDRrQ2htMlhmSWpvYTNQbEpSWHU5aXdOK0dJZUE2?=
 =?utf-8?B?ejRuQkZWKzFLMWdRQTJ3SmUzdVV0UXFMV0RLZ0IvamphbFR0cFlxZjFRelBB?=
 =?utf-8?B?VGJOVWFGMDlTbExUVmoxMFdaT1NVWHl0WnJFMFRlSkwzWmRPemt0VlNYYThq?=
 =?utf-8?B?RlRESk9laDA0djNmejEyM0JReGRsWHlITXdEb2ZYMzB6Rm9mVWwvaGt2MFhT?=
 =?utf-8?B?QTdaM1JFb3ZRWldPcTU2Y3NiMUtzVFFlSURnUHh4cHFxcWRWRmVlNW45Qk55?=
 =?utf-8?B?SDFoU2tzdzBhT1Q1UloxU2h6Yzc4ZUVxR0UvbVlHR1RobXFqOGs1M3p4L0xh?=
 =?utf-8?B?V3VYT2xaN3JjYkJZSFByeVVZK2pqbGdEREFDRUNTNXBjWXhrVEdYN1Q1NHZP?=
 =?utf-8?B?bVgyVHppRFhsRERqSHB4WEVNVzhrbEo4ckl5QXRUdURzSG9MelVMSFdycnY0?=
 =?utf-8?B?Zk9UVHFhQ2lSVzRsSE4vMWUwSUZEWjZlL3k1akZUd2orYjRLeVlacko0dUQ0?=
 =?utf-8?B?NHgwN05rdTRTS2J4NUk1VmtRNi90dmdDM1JHYzBzU3ZzeWt1ZnA5MFZTL0Nh?=
 =?utf-8?Q?bbcos4ZtQoxUsaKw1JJ0op+2ytTLKctqAXPy4HvCvU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <661C02617624064EB390FDFB84B7CC43@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: lists.verisure.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 432099cb-bf14-4514-3a4c-08d9c48232ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2021 13:02:52.3747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3055fa7f-a944-4927-801e-a62b63119e43
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 q9KttZWiYVB9CEKry5YohGknFh8wWRPBg9HF9rIafsP7p+dE8H0KsFRJm2fBAmDbxi1HSTDGro2IvTlcT6jS8O/kumzH2dx+8e/Ud2yr5wA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB5023
X-Proofpoint-GUID: KDabgjjEUF0z6agREGQi9WvuvR6Cik5i
X-Proofpoint-ORIG-GUID: KDabgjjEUF0z6agREGQi9WvuvR6Cik5i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-21_04,2021-12-21_01,2021-12-02_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 13:02:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159916

RHJvcGJlYXIgc2hhcmVzIGEgbG90IG9mIGNvZGUgd2l0aCBvdGhlciBTU0ggaW1wbGVtZW50YXRp
b25zLCBzbyB0aGlzIGlzDQphIHBvcnQgb2YgQ1ZFLTIwMTgtMjA2ODUgdG8gZHJvcGJlYXIuDQoN
ClJlZmVyZW5jZToNCmh0dHBzOi8vZ2l0aHViLmNvbS9ta2ovZHJvcGJlYXIvY29tbWl0LzhmOGEz
ZGZmNzA1ZmFkNzc0YTEwODY0YTJlM2RiY2ZhOTc3OWNlZmYNCg0KU2lnbmVkLW9mZi1ieTogRXJu
c3QgU2rDtnN0cmFuZCA8ZXJuc3Quc2pvc3RyYW5kQHZlcmlzdXJlLmNvbT4NCi0tLQ0KUmVuYW1l
IHRoZSBwYXRjaCBmaWxlIHRvIG1ha2Ugc3VyZSBjdmUtY2hlY2sgcGlja3MgaXQgdXAuDQoNCiBt
ZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci5pbmMgICAgICAgfCAgNCArKystDQog
Li4uL2Ryb3BiZWFyL2Ryb3BiZWFyL0NWRS0yMDIwLTM2MjU0LnBhdGNoICAgIHwgMjMgKysrKysr
KysrKysrKysrKysrKw0KIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9k
cm9wYmVhci9DVkUtMjAyMC0zNjI1NC5wYXRjaA0KDQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIuaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIv
ZHJvcGJlYXIuaW5jDQppbmRleCBkNDFlOGIzNmRjLi5iOTQ5YTlhMzM3IDEwMDY0NA0KLS0tIGEv
bWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIuaW5jDQorKysgYi9tZXRhL3JlY2lw
ZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci5pbmMNCkBAIC0yMiw3ICsyMiw5IEBAIFNSQ19VUkkg
PSAiaHR0cDovL21hdHQudWNjLmFzbi5hdS9kcm9wYmVhci9yZWxlYXNlcy9kcm9wYmVhci0ke1BW
fS50YXIuYnoyIFwNCiAgICAgICAgICAgIGZpbGU6Ly9kcm9wYmVhci5zb2NrZXQgXA0KICAgICAg
ICAgICAgZmlsZTovL2Ryb3BiZWFyLmRlZmF1bHQgXA0KICAgICAgICAgICAgJHtAYmIudXRpbHMu
Y29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICdwYW0nLCAnJHtQQU1fU1JDX1VSSX0nLCAnJywg
ZCl9IFwNCi0gICAgICAgICAgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNLQUdFQ09ORklHJywg
J2Rpc2FibGUtd2Vhay1jaXBoZXJzJywgJ2ZpbGU6Ly9kcm9wYmVhci1kaXNhYmxlLXdlYWstY2lw
aGVycy5wYXRjaCcsICcnLCBkKX0gIg0KKyAgICAgICAgICAgJHtAYmIudXRpbHMuY29udGFpbnMo
J1BBQ0tBR0VDT05GSUcnLCAnZGlzYWJsZS13ZWFrLWNpcGhlcnMnLCAnZmlsZTovL2Ryb3BiZWFy
LWRpc2FibGUtd2Vhay1jaXBoZXJzLnBhdGNoJywgJycsIGQpfSBcDQorICAgICAgICAgICBmaWxl
Oi8vQ1ZFLTIwMjAtMzYyNTQucGF0Y2ggXA0KKyAgICAgICAgICAgIg0KIA0KIFBBTV9TUkNfVVJJ
ID0gImZpbGU6Ly8wMDA1LWRyb3BiZWFyLWVuYWJsZS1wYW0ucGF0Y2ggXA0KICAgICAgICAgICAg
ICAgIGZpbGU6Ly8wMDA2LWRyb3BiZWFyLWNvbmZpZ3VyYXRpb24tZmlsZS5wYXRjaCBcDQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIvQ1ZFLTIwMjAtMzYy
NTQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci9DVkUtMjAyMC0z
NjI1NC5wYXRjaA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAuLjcyYWMz
ZTY2MzANCi0tLSAvZGV2L251bGwNCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ry
b3BiZWFyL0NWRS0yMDIwLTM2MjU0LnBhdGNoDQpAQCAtMCwwICsxLDIzIEBADQorRnJvbSBjOTZj
NDhkNjJhZWZjMzcyZjIxMDUyOTNkZGY4Y2ZmMmQxMTZkYzNhIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQ0KK0Zyb206IEhhZWx3ZW5uIE1vbm5pZXIgPGNvbnRhY3QrZ2l0aHViLmNvbUBoYWNrdGl2
aXMubWU+DQorRGF0ZTogTW9uLCAyNSBNYXkgMjAyMCAxNDo1NDoyOSArMDIwMA0KK1N1YmplY3Q6
IFtQQVRDSF0gc2NwLmM6IFBvcnQgT3BlblNTSCBDVkUtMjAxOC0yMDY4NSBmaXggKCM4MCkNCisN
CistLS0NCisgc2NwLmMgfCAzICsrLQ0KKyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQorDQorZGlmZiAtLWdpdCBhL3NjcC5jIGIvc2NwLmMNCitpbmRleCA3
NDJhZTAwLi43YjhlN2QyIDEwMDY0NA0KKy0tLSBhL3NjcC5jDQorKysrIGIvc2NwLmMNCitAQCAt
OTM1LDcgKzkzNSw4IEBAIHNpbmsoaW50IGFyZ2MsIGNoYXIgKiphcmd2KQ0KKyAJCQlzaXplID0g
c2l6ZSAqIDEwICsgKCpjcCsrIC0gJzAnKTsNCisgCQlpZiAoKmNwKysgIT0gJyAnKQ0KKyAJCQlT
Q1JFV1VQKCJzaXplIG5vdCBkZWxpbWl0ZWQiKTsNCistCQlpZiAoKHN0cmNocihjcCwgJy8nKSAh
PSBOVUxMKSB8fCAoc3RyY21wKGNwLCAiLi4iKSA9PSAwKSkgew0KKysJCWlmICgqY3AgPT0gJ1ww
JyB8fCBzdHJjaHIoY3AsICcvJykgIT0gTlVMTCB8fA0KKysJCSAgICBzdHJjbXAoY3AsICIuIikg
PT0gMCB8fCBzdHJjbXAoY3AsICIuLiIpID09IDApIHsNCisgCQkJcnVuX2VycigiZXJyb3I6IHVu
ZXhwZWN0ZWQgZmlsZW5hbWU6ICVzIiwgY3ApOw0KKyAJCQlleGl0KDEpOw0KKyAJCX0NCi0tIA0K
Mi4zNC4wDQoNCg==

