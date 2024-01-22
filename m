Return-Path: <william.lyu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33DE2C46CD2
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 23:51:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9082.1705967480911353984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 15:51:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LA+tghFK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1751b0870e=william.lyu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40MMbB77004976
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 15:51:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=xKVHh8QNz6jLp6L4Pil1apzpf7j0TTdTpdxrHYKwFJQ=; b=
	LA+tghFK6OZBYh/7GwG9wOb1vjFTNCv6dK+jzbCRGvaXyhtKJ93ZLLBEQJ7dVsdE
	V0oKqEzKQUBT+5qj8QPylamdMZbzJiA4Pm/pRrVAdWw9F+gS8xBRZx2H260bY2Je
	gLJNaQzNenQSy1LIudXCEyGww3i3p946Eh+OSNZBZQwe+/9Co5kTNtoSvChsFzFD
	aqhenZNyIkIL5ykV00TSxEsf3SgYCIl/iwZoAL86s9QYdCAJoXGXPK7t2qOs3hbu
	KVA+2pKxEyDOpg9haEZIGx3Lg9Tbss8dql+t47v6/D0GgsCe8H7kr22OkyjlR/MA
	cX0zPpl6WeaHUE09WXQprQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vrab4tdnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 15:51:20 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40MNnPZV024950
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 15:51:19 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vrab4tdnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 15:51:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmIPu7w+DBgAq+yKFIpdYdfioqG+EX+zRz882ConpPOgFed6odYyK+ViTcbTlsFyJrHYuIsvK0buPYqo+TkZeqLv37Sg48FeJOjAmGocnS9stBdn9bLX4QpnWskUe1a5uu2+MNxXCnWhT+etrSLJm+L+df0iAdC6TfZL7Nt7micGnsigGLKauieY1S1DbMvCguQv/5Iwe8Kz7t2kPso9YXijKZwLb6yBIpPgJ+oUuGD1/O1z7w/PIAMuf+UpiMUTORydMNS0FKL9R9Ymiw/79CMOoZGaNeKlFaC5IXhp7DzYlPELBIJNav1By+HbPoqT48ppLDiYqaJhhqeVgODCQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKVHh8QNz6jLp6L4Pil1apzpf7j0TTdTpdxrHYKwFJQ=;
 b=KHhkiO97bdhclVz3NPmNGPzdLfq7aSwM/joHg2/qRzOQxSgtXuSr/2aP4WOsSZghjq40vzZXf5UohtRTKBvixEFR7xzI9uArkg5QggNg1t/yBOCLwv9nxqFd83LiYaEIcLW1Ed/FU+iA/MdhgbwoAwwZDvydH6TmlaH+wtV8dD4qiz8uehgfsRoyknWv/yQU+yf9jh3Fbm4xEytdAKTOHQcrTzLwJjo+Twwld1YWzCYemTC6rwnx9pPAhKe//VLshoOqjvrCsCuTA6knf4a7gVpgYK3i7k/G1X0PDcEFaYdxfi0dxEmfdNp1AUtYOroz2CW76V+nUoWgBb2Rc1zvVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY5PR11MB6342.namprd11.prod.outlook.com (2603:10b6:930:3d::20)
 by LV2PR11MB5974.namprd11.prod.outlook.com (2603:10b6:408:14c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Mon, 22 Jan
 2024 23:51:17 +0000
Received: from CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::ffe3:8cda:9fea:f8b3]) by CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::ffe3:8cda:9fea:f8b3%2]) with mapi id 15.20.7202.034; Mon, 22 Jan 2024
 23:51:17 +0000
From: "Lyu, William" <William.Lyu@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] perl: Fix perl-module-* being ignored via
 COMPLEMENTARY_GLOB
Thread-Topic: [OE-core] [PATCH] perl: Fix perl-module-* being ignored via
 COMPLEMENTARY_GLOB
Thread-Index: AQHaTUqt/LQ1CkEgVE6uNwG9iMljAbDmMOOAgABPu2A=
Date: Mon, 22 Jan 2024 23:51:17 +0000
Message-ID: 
 <CY5PR11MB63428573A422F55A650E0A3DEE752@CY5PR11MB6342.namprd11.prod.outlook.com>
References: <20240122154919.42591-1-William.Lyu@windriver.com>
 <8157e567182f3b802404f1a3d95f82fd21f8c0ce.camel@linuxfoundation.org>
In-Reply-To: 
 <8157e567182f3b802404f1a3d95f82fd21f8c0ce.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6342:EE_|LV2PR11MB5974:EE_
x-ms-office365-filtering-correlation-id: 9de5e5c3-9bec-40e6-8962-08dc1ba506d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YWFCzap3t+qiVODrg5QMTUkYKFuKbdX3oooHMvigN9WLGx9yEZaZin53t2iBMdRm/XDJoZaV7A34WzAobx8eF+Cp2z083FKHnXDcS1B/QNpBSFjeSufXsqxqUGErH1KrRZ+tA/ykaKXWLWFPxpw5UqXk/5WPF2uv7bqmY95KKcsnti9pKhU159e+NiH4E7eochIinKac/8nhjZY6Bm1YFMr3CwjQKFrCI8H+M7LytCw3Y7g9E52Yl+2aMIyvX1lSE8Hks2f5YWDpjcCY9E5tbWtuFmXUVAds/ADYxGxM/tH4MkIIlCTJ5pnv70biqLZVhQ10ZqP0mhc4CsYPjxBU9X4b7WftY4rrVip2/CeIZKYgLjGDLiol5uoIkwEhqpXJxC9Ze/A8xaSN0kUpbu/qIj8XFd+HXFtWdskneC2LBqgoGTs9Gh97qz15irHb2y9Konenf076x8CDwZjZmTgT3YYZopkOB9yiYrDeZUcdJAgQf1uWmbcxRDZqJcIxdCeq2gCe6a/B9Hvn9pt+NyP/vkHE3DYpFgD9x0KMBLdMxYQayEO7yDfxwg1+HMjK64QiTX25LztVoBK7a9qtFv+Wk/9c39LlA+iDS0T8PFlUgFGyuBdK3f3ZLvt6wPUW8KJjWdvp9XBUE8we+SeiqiWF2XQR/vOKVChA25CYzEI5EmA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6342.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(39850400004)(346002)(230922051799003)(230273577357003)(230173577357003)(186009)(1800799012)(64100799003)(451199024)(33656002)(8936002)(38070700009)(83380400001)(8676002)(52536014)(64756008)(478600001)(86362001)(316002)(110136005)(66476007)(66446008)(66556008)(71200400001)(66946007)(76116006)(26005)(5660300002)(6506007)(7696005)(2906002)(9686003)(41300700001)(122000001)(55016003)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OW9XNUZIK0JHZ3VJRDZTYUdwcGthSFAvRFNxYnExbkY5L2gyT25vUk5xRDhy?=
 =?utf-8?B?clFKSnh5OGNERWFhdGtwT0xmc01wRnhBajBGMmJwdkxqenBHaHRUSXg2SXlh?=
 =?utf-8?B?TUs1NmF6aUd6Qmk0eUc2dzJyNHVyODg0aGJmMGJIc2VNS0hScENVUFpCSzJv?=
 =?utf-8?B?dml4SWNoci96UUhRRWZsNHFpcTJtWlVIM1pYU3hzY3ZHMFViVGlRSFM1UGFR?=
 =?utf-8?B?bmtmQlRSajl6RTdjQm9QcHlXY09YNHMvTHdpWnVKZnp5b3dCb25GSXpiS1I3?=
 =?utf-8?B?V1FaQW55N0dBMTFiYnU2QjY0akV6UGx0WWxFRmo4Vi9GZzFIK3hLL0F4NXJz?=
 =?utf-8?B?QlpYQjgyTmUxVFV6ajh5clpnL3FwN2d2N1NjQUJqU2oreXZBbUlWVkJtTXg0?=
 =?utf-8?B?bXRHcnd6QUFUcVNvYStUbjVIWGJRdUFCQ0JBQW1HdEh5c0dBcnoxNzBBc2d2?=
 =?utf-8?B?NVhVcStHZVZCekxUeldodXFQZXBnUVNnT0VXckdvZjFuQkMrOWNTLzZZNkdQ?=
 =?utf-8?B?NkYyR3JFZnNQWG5WZmZtRVBhN01PSjFYbXNoZVVsdmlXazhRWFM1MXMvaVFT?=
 =?utf-8?B?TUF0NlR2M3EvQUx0ckZNZ1g1NzJOWkhtVFp0bUlqQXRNSkZmemlCUjA0ZUF4?=
 =?utf-8?B?L0xXaEV5R005c1locmw4YnNWSzBWcmVPVVFtUk5ubW00SnloSHdWZG01eDFH?=
 =?utf-8?B?ZWJGY0dLR0lNdTd6T3cvZ21jQTJXRmllMllZdDh2Mk5mV1ZSZ2dqRzBHWEJm?=
 =?utf-8?B?MlFnU0hlaXR2VW5IUDNsT0RiTVZ6TmNKKy9yRHF5d3hIUWNyOFlCK3ZZTGtT?=
 =?utf-8?B?VjJGVitQZ2lrK2tDRXlxQ3ZNZlppeHF1WUJENitPQjVlWXZGYWljcTBBNzN3?=
 =?utf-8?B?M3NhMFp0Y1UyTS9JSzRHQkkvSnYrelZNaFN6elNlMnF5VTdSNjlGKzNlbko2?=
 =?utf-8?B?SWZ1bUxSSGpYUWNqRTlOLzAwTTRZdEtLcXFNclNHRDRMbG1HajVRcmZJYmxL?=
 =?utf-8?B?OWZVQ3lwaGtjUkN3ZXA0MitJWXVxc2lPQzY3a3RRbkNtenZNRm10V3YwVnM5?=
 =?utf-8?B?OHpZdkNlN1p6NVVPWlBidm1aS2QrTCtlc0YwU2dNc2QwZll1bEUwVXMwTzRu?=
 =?utf-8?B?dENDZmlRQ2dqS2U0dGovRTZmd3cvWjI1SGowVU9mbzJqWDhXRFhaU2d3N0Fi?=
 =?utf-8?B?MXhGRlQ1Sis5U2ZJVVNBUW9sVnc1QWo5OStoZnlmNGVXQTVYays0T1pCUkFy?=
 =?utf-8?B?RnFRV3hFNUxHQkFJWERsZVNrOXptUGo3QUNZSDdlaTlTT2ErdElMd2syeldu?=
 =?utf-8?B?QUpTN0cxQTl2ajk4b1VwSjdIYW5Fa2tHR25RYUFQdGNSaDJSU2t5ZW9hbWhZ?=
 =?utf-8?B?b2s3RXRaVFVQeDA4RmZuczhsdXQweFZDeldiSHA3OWNaZDFqWStwUi9HbjBl?=
 =?utf-8?B?R2RDMldhRTRtd2E2SVRzU2Zack1LZGlIbDJ0MFNxL01nTFNFTSs2YWd0OTVP?=
 =?utf-8?B?VHc2Z0Jrc2RwNlJST1VldTh6SDVrZXVJaU5YaDQzZFZwbGRkVXpwQ0tuV25M?=
 =?utf-8?B?a0phcUZVRUlWZGJNM3VwNStBWVhkdjZFcFdOa1U1QjJMUWdST1psakpyVDhG?=
 =?utf-8?B?NUhzdmk1aXZjZHVtenVFKzU3L3Q0NXdhcENHTVZCQ1kzZ2FrUVNSVE5lQVh2?=
 =?utf-8?B?RjZWYXhvaWZDOXAzeWtsM0IyUlJyaDNRTk5zQWd2azVKTDEwY0JETXduamhm?=
 =?utf-8?B?NEM3WGY4SXBWUUR1TEo4Ni9IUC9pdlZaZGswdWtjS1dtT3N0bU8zNVFMZmtP?=
 =?utf-8?B?T3R5UDg5NmhXVWdjNHlZTnNNYUFnZjgrcWFTYlpKaUNYNEVPUENnVVdIVllU?=
 =?utf-8?B?RDV3Q0plVlJQR2NVa2w3LzV2cnpqc1ZHWDI3SEo5UXVIaGwwZWpqYXNVbWNX?=
 =?utf-8?B?cXdPRFlFNUlqSWFqalRQRm5qeFdWL3RZQ2JVUkxXby9TUWlxL1BUUWF4Wm95?=
 =?utf-8?B?UmNCR2s4eU1WZXFLUTZGTmY1ODRVbCtiYjdycnRBMS84NDIzUlFyV2RhM1Nu?=
 =?utf-8?B?OVk4WDloN1VWc0pNNW1NcnZJeXU1bVVUVU1QSWZoUHFLS1RFcXZUcnVidnlP?=
 =?utf-8?Q?s5UTVA/JiRUAfxegLq1lSpfmM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6342.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de5e5c3-9bec-40e6-8962-08dc1ba506d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2024 23:51:17.7090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mQKkMqoVgSkMj1z9Ne7l4Lrm+2d68p6X2r+PulbbDmfAfc/xovT7Z0dtz0I27OiI7cIGCXa+/cMqhHymVPX8OhL8ISiYk5nHIEGdlacB2iw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5974
X-Proofpoint-ORIG-GUID: ufZWCBRtKcg42O9hVgppGDVR-qAJSitw
X-Proofpoint-GUID: A6MCQak5kESsa2v7McMn54ubZOkZf-ZK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_12,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401220171
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 23:51:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194196

PiBPbiBNb24sIDIwMjQtMDEtMjIgYXQgMDc6NDkgLTA4MDAsIEx5dSwgV2lsbGlhbSB2aWENCj4g
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4+IEZyb206IFdpbGxpYW0gTHl1IDxXaWxs
aWFtLkx5dUB3aW5kcml2ZXIuY29tPg0KPj4NCj4+IFdoZW4gcGVybC1tb2R1bGVzIGlzIGFkZGVk
IHZpYSBDT01QTEVNRU5UQVJZX0dMT0IsIGFsbCBwZXJsLW1vZHVsZS0qDQo+PiBwYWNrYWdlcyBy
ZWNvbW1lbmRlZCBieSBwZXJsLW1vZHVsZXMgYXJlIGlnbm9yZWQgZHVlIHRvIHRoZSBkZWZpbmVk
DQo+PiBiZWhhdmlvciBvZiBDT01QTEVNRU5UQVJZX0dMT0IuDQo+Pg0KPj4gVGhpcyBwYXRjaCBj
aGFuZ2VzIHRoZSByZWxhdGlvbnNoaXAgYmV0d2VlbiBwZXJsLW1vZHVsZXMgYW5kIGFsbCBvZiBp
dHMNCj4+IHBlcmwtbW9kdWxlLSogZnJvbSBSUkVDT01NRU5EUyB0byBSREVQRU5EUy4gVGhpcyBt
YWtlcyBzZW5zZSBhcw0KPj4gcGVybC1tb2R1bGVzIHNob3VsZCByZXByZXNlbnQgdGhlIGNvbGxl
Y3Rpb24gb2YgYWxsIG9wdGlvbmFsDQo+PiBwZXJsLW1vZHVsZS0qIHBhY2thZ2VzLiBBZnRlciB0
aGlzIHBhdGNoLCBwZXJsLW1vZHVsZXMgaXRzZWxmIGlzIGJlaW5nDQo+PiBSUkVDT01NRU5ERUQg
aW5zdGVhZCBvZiB0aGUgaW5kaXZpZHVhbCBwZXJsLW1vZHVsZS0qIHBhY2thZ2VzDQo+PiBwZXJs
LW1vZHVsZXMgcmVwcmVzZW50cy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBXaWxsaWFtIEx5dSA8
V2lsbGlhbS5MeXVAd2luZHJpdmVyLmNvbT4NCj4+IC0tLQ0KPj4gIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9wZXJsL3BlcmxfNS4zOC4yLmJiIHwgMTYgKysrKysrKysrKystLS0tLQ0KPj4gIDEgZmls
ZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsXzUuMzguMi5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9wZXJsL3BlcmxfNS4zOC4yLmJiDQo+PiBpbmRleCBhOWQ2ODRjZmM1
Li41MDM3ODE2Zjg5IDEwMDY0NA0KPj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Blcmwv
cGVybF81LjM4LjIuYmINCj4+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL3Blcmxf
NS4zOC4yLmJiDQo+PiBAQCAtMzA2LDggKzMwNiw4IEBAIEFMVEVSTkFUSVZFX1BSSU9SSVRZID0g
IjQwIg0KPj4gIEFMVEVSTkFUSVZFOiR7UE59LWRvYyA9ICJUaHJlYWQuMyINCj4+ICBBTFRFUk5B
VElWRV9MSU5LX05BTUVbVGhyZWFkLjNdID0gIiR7bWFuZGlyfS9tYW4zL1RocmVhZC4zIg0KPj4N
Cj4+IC0jIENyZWF0ZSBhIHBlcmwtbW9kdWxlcyBwYWNrYWdlIHJlY29tbWVuZGluZyBhbGwgdGhl
IG90aGVyIHBlcmwNCj4+IC0jIHBhY2thZ2VzIChhY3R1YWxseSB0aGUgbm9uIG1vZHVsZXMgcGFj
a2FnZXMgYW5kIG5vdCBjcmVhdGVkIHRvbykNCj4+ICsjIENyZWF0ZSBhIHBlcmwtbW9kdWxlcyBw
YWNrYWdlIHRoYXQgcmVwcmVzZW50cyB0aGUgY29sbGVjdGlvbiBvZiBhbGwgdGhlDQo+PiArIyBv
dGhlciBwZXJsIHBhY2thZ2VzIChhY3R1YWxseSB0aGUgbm9uIG1vZHVsZXMgcGFja2FnZXMgYW5k
IG5vdCBjcmVhdGVkIHRvbykuDQo+PiAgQUxMT1dfRU1QVFk6JHtQTn0tbW9kdWxlcyA9ICIxIg0K
Pj4gIFBBQ0tBR0VTICs9ICIke1BOfS1tb2R1bGVzICINCj4+DQo+PiBAQCAtMzIyLDExICszMjIs
MTYgQEAgcHl0aG9uIHNwbGl0X3BlcmxfcGFja2FnZXMgKCkgew0KPj4gICAgICBkb19zcGxpdF9w
YWNrYWdlcyhkLCBsaWJkaXIsIHInLipsaW51eC8oW15cL10uKilcLihwbXxwbHxlMngpJywgJyR7
UE59LW1vZHVsZS0lcycsICdwZXJsIG1vZHVsZSAlcycsIHJlY3Vyc2l2ZT1UcnVlLCBhbGxvd19k
aXJzPUZhbHNlLCBtYXRjaF9wYXRoPVRydWUsIHByZXBlbmQ9RmFsc2UpDQo+PiAgICAgIGRvX3Nw
bGl0X3BhY2thZ2VzKGQsIGxpYmRpciwgcicoXig/IShDUEFOXC98Q1BBTlBMVVNcL3xNb2R1bGVc
L3x1bmljb3JlXC98LipsaW51eFwvKVteXC9dKS4qKVwuKHBtfHBsfGUyeCknLCAnJHtQTn0tbW9k
dWxlLSVzJywgJ3BlcmwgbW9kdWxlICVzJywgcmVjdXJzaXZlPVRydWUsIGFsbG93X2RpcnM9RmFs
c2UsIG1hdGNoX3BhdGg9VHJ1ZSwgcHJlcGVuZD1GYWxzZSkNCj4+DQo+PiAtICAgICMgcGVybC1t
b2R1bGVzIHNob3VsZCByZWNvbW1lbmQgZXZlcnkgcGVybCBtb2R1bGUsIGFuZCBvbmx5IHRoZQ0K
Pj4gKyAgICAjIHBlcmwtbW9kdWxlcyBzaG91bGQgcnVudGltZS1kZXBlbmQgb24gZXZlcnkgcGVy
bCBtb2R1bGUsIGFuZCBvbmx5IHRoZQ0KPj4gICAgICAjIG1vZHVsZXMuIERvbid0IGF0dGVtcHQg
dG8gdXNlIHRoZSByZXN1bHQgb2YgZG9fc3BsaXRfcGFja2FnZXMoKSBhcyBzb21lDQo+PiAgICAg
ICMgbW9kdWxlcyBhcmUgbWFudWFsbHkgc3BsaXQgKGVnLiBwZXJsLW1vZHVsZS11bmljb3JlKS4N
Cj4+ICAgICAgcGFja2FnZXMgPSBmaWx0ZXIobGFtYmRhIHA6ICdwZXJsLW1vZHVsZS0nIGluIHAs
IGQuZ2V0VmFyKCdQQUNLQUdFUycpLnNwbGl0KCkpDQo+PiAtICAgIGQuc2V0VmFyKGQuZXhwYW5k
KCJSUkVDT01NRU5EUzoke1BOfS1tb2R1bGVzIiksICcgJy5qb2luKHBhY2thZ2VzKSkNCj4+ICsg
ICAgZC5zZXRWYXIoZC5leHBhbmQoIlJERVBFTkRTOiR7UE59LW1vZHVsZXMiKSwgJyAnLmpvaW4o
cGFja2FnZXMpKQ0KPj4gKw0KPj4gKyAgICAjIEFzIHBlcmwtbW9kdWxlcyBkZXBlbmRzIG9uIGFs
bCBvdGhlciwgcG90ZW50aWFsbHkgbm9uLWV4aXN0ZW50LCBwZXJsDQo+PiArICAgICMgcGFja2Fn
ZXMsIHdlIGFsbG93IHRoZXNlIHBhY2thZ2VzIHRvIGJlIGVtcHR5IHRvIHByZXZlbnQgYnVpbGQg
ZXJyb3JzLg0KPj4gKyAgICBmb3IgcGtnIGluIGQuZ2V0VmFyKGQuZXhwYW5kKCJSREVQRU5EUzok
e1BOfS1tb2R1bGVzIikpLnNwbGl0KCk6DQo+PiArICAgICAgICBkLnNldFZhcihkLmV4cGFuZCgi
QUxMT1dfRU1QVFk6IiArIHBrZyksICIxIikNCj4+DQo+PiAgICAgICMgUmVhZCB0aGUgcHJlLWdl
bmVyYXRlZCBkZXBlbmRlbmN5IGZpbGUsIGFuZCB1c2UgaXQgdG8gc2V0IG1vZHVsZSBkZXBlbmRl
Y2llcw0KPj4gICAgICBmb3IgbGluZSBpbiBvcGVuKGQuZXhwYW5kKCIke1dPUktESVJ9IikgKyAn
L3BlcmwtcmRlcGVuZHMudHh0JykucmVhZGxpbmVzKCk6DQo+IA0KPiBEbyB5b3UgaGF2ZSBzb21l
IGV4YW1wbGVzIG9mIHRoZXNlIHBhY2thZ2VzIHdoaWNoIGRvbid0IGV4aXN0Pw0KPiANCj4gSSdk
IGxpa2UgdG8gdW5kZXJzdGFuZCB3aHkgdGhleSBkb24ndCBleGlzdCBhbmQgcGVyaGFwcyBub3Qg
aGF2ZSB0aGVtDQo+IGxpc3RlZCBpbiBQQUNLQUdFUyBpbiB0aGUgZmlyc3QgcGxhY2UuIENyZWF0
aW5nIGEgbG9hZCBvZiBlbXB0eS91c2VsZXNzDQo+IHBhY2thZ2VzIHdpdGggQUxMT1dfRU1QVFkg
c2VlbXMgYSBiaXQgcG9pbnRsZXNzL3NhZC4NCg0KVGhlIGZvbGxvd2luZyBpcyBhIGxpc3Qgb2Yg
ZW1wdHkgcGFja2FnZXMgcGVybC1tb2R1bGVzIFJERVBFTkRTIG9uLg0KDQp0bXAvd29yay9jb3Jl
Mi02NC1wb2t5LWxpbnV4L3BlcmwvNS4zOC4yL3BhY2thZ2VzLXNwbGl0JCBmaW5kIC1tYXhkZXB0
aCAxIC1lbXB0eSAtbmFtZSAncGVybC1tb2R1bGUtKicNCi4vcGVybC1tb2R1bGUtY29uZmlnDQou
L3BlcmwtbW9kdWxlLXdhcm5pbmdzLXJlZ2lzdGVyDQouL3BlcmwtbW9kdWxlLXZhcnMNCi4vcGVy
bC1tb2R1bGUtc3RyaWN0DQouL3BlcmwtbW9kdWxlLWNvbmZpZy1naXQNCi4vcGVybC1tb2R1bGUt
d2FybmluZ3MNCg0KQmVzdCwgDQpXaWxsaWFtDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hh
cmQNCg==

